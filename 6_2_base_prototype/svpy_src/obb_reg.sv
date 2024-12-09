$ from svmath import *
$ from structs import OBB

$ ld = OBB("ld")


module obb_reg
#(
    parameter X_INIT = 32,
    parameter Y_INIT = 32,
    parameter X_VEL_INIT = 0,
    parameter Y_VEL_INIT = 0,
    parameter WIDTH_INIT = 10,
    parameter HEIGHT_INIT = 10,
    parameter ANGLE_INIT = 0,
    parameter OMEGA_INIT = 0
)
(
    $$ld.declare("input")$$,
    $$OBB.declare("output")$$,

    input logic reset,
    input logic load,
    input logic clk
);

parameter X_INIT_SCALED = X_INIT * 2**$$(OBB.pos.precision)$$;
parameter Y_INIT_SCALED = Y_INIT * 2**$$(OBB.pos.precision)$$;
parameter X_VEL_INIT_SCALED = X_VEL_INIT * 2**$$(OBB.vel.precision)$$;
parameter Y_VEL_INIT_SCALED = Y_VEL_INIT * 2**$$(OBB.vel.precision)$$;
parameter ANGLE_INIT_SCALED = ANGLE_INIT * 2**$$((OBB.angle.precision))$$;
parameter OMEGA_INIT_SCALED = OMEGA_INIT * 2**$$((OBB.omega.precision))$$;

$ data_d = OBB("next")
$ data_d.declare()

$$$
with always_comb():
    svwritel("if (load) begin")
    data_d.assign(ld)
    svwritel("end else begin")
    data_d.assign(OBB)
    svwritel("end")
$$$

$ begin_ff("clk")
    //Synchronous reset
    if (reset) begin
        pos_x <= X_INIT_SCALED;
        pos_y <= Y_INIT_SCALED;
        vel_x <= X_VEL_INIT_SCALED;
        vel_y <= Y_VEL_INIT_SCALED;
        width <= WIDTH_INIT;
        height <= HEIGHT_INIT;
        angle <= ANGLE_INIT_SCALED;
        omega <= OMEGA_INIT_SCALED;
    // Parallel load
    end else begin
    $ OBB.assign(data_d)
    end
$ end_ff()

endmodule