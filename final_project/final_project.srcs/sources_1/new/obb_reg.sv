


module obb_reg
#(
    parameter X_INIT = 32,
    parameter Y_INIT = 32,
    parameter X_VEL_INIT = 0,
    parameter Y_VEL_INIT = 0,
    parameter WIDTH_INIT = 10,
    parameter HEIGHT_INIT = 10,
    parameter MASS_INIT = 1,
    parameter ANGLE_INIT = 0,
    parameter OMEGA_INIT = 0
)
(
    input logic signed [7 : 0] ld_width,
input logic signed [7 : 0] ld_height,
input logic signed [15 : 0] ld_inertia,
input logic signed [16 : 0] ld_inv_mass,
input logic signed [24 : 0] ld_inv_inertia,
input logic signed [23 : 0] ld_pos_x, input logic signed [23 : 0] ld_pos_y,
input logic signed [23 : 0] ld_vel_x, input logic signed [23 : 0] ld_vel_y,
input logic signed [10 : 0] ld_angle,
input logic signed [10 : 0] ld_omega,
    output logic signed [7 : 0] width,
output logic signed [7 : 0] height,
output logic signed [15 : 0] inertia,
output logic signed [16 : 0] inv_mass,
output logic signed [24 : 0] inv_inertia,
output logic signed [23 : 0] pos_x, output logic signed [23 : 0] pos_y,
output logic signed [23 : 0] vel_x, output logic signed [23 : 0] vel_y,
output logic signed [10 : 0] angle,
output logic signed [10 : 0] omega,

    input logic reset,
    input logic load,
    input logic clk
);

localparam INV_MASS_INIT = 1.0 / MASS_INIT;
localparam INERTIA_INIT = MASS_INIT * (WIDTH_INIT**2 + HEIGHT_INIT**2) / 12;
localparam INV_INERTIA_INIT = 1.0 / INERTIA_INIT;

localparam X_INIT_SCALED = X_INIT * 2**16;
localparam Y_INIT_SCALED = Y_INIT * 2**16;
localparam X_VEL_INIT_SCALED = X_VEL_INIT * 2**19;
localparam Y_VEL_INIT_SCALED = Y_VEL_INIT * 2**19;
localparam ANGLE_INIT_SCALED = ANGLE_INIT * 2**7;
localparam OMEGA_INIT_SCALED = OMEGA_INIT * 2**7;
localparam INV_MASS_INIT_SCALED = INV_MASS_INIT * 2**14;
localparam INV_INERTIA_INIT_SCALED = INV_INERTIA_INIT * 2**23;

logic signed [7 : 0] next_width;
logic signed [7 : 0] next_height;
logic signed [15 : 0] next_inertia;
logic signed [16 : 0] next_inv_mass;
logic signed [24 : 0] next_inv_inertia;
logic signed [23 : 0] next_pos_x;
logic signed [23 : 0] next_pos_y;
logic signed [23 : 0] next_vel_x;
logic signed [23 : 0] next_vel_y;
logic signed [10 : 0] next_angle;
logic signed [10 : 0] next_omega;

always_comb begin
if (load) begin
next_width = ld_width;
next_height = ld_height;
next_inertia = ld_inertia;
next_inv_mass = ld_inv_mass;
next_inv_inertia = ld_inv_inertia;
next_pos_x = ld_pos_x;
next_pos_y = ld_pos_y;
next_vel_x = ld_vel_x;
next_vel_y = ld_vel_y;
next_angle = ld_angle;
next_omega = ld_omega;
end else begin
next_width = width;
next_height = height;
next_inertia = inertia;
next_inv_mass = inv_mass;
next_inv_inertia = inv_inertia;
next_pos_x = pos_x;
next_pos_y = pos_y;
next_vel_x = vel_x;
next_vel_y = vel_y;
next_angle = angle;
next_omega = omega;
end
end

always_ff @(posedge {clk}) begin
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
        inv_mass <= INV_MASS_INIT_SCALED;
        inertia <= INERTIA_INIT;
        inv_inertia <= INV_INERTIA_INIT_SCALED;
    // Parallel load
    end else begin
width <= next_width;
height <= next_height;
inertia <= next_inertia;
inv_mass <= next_inv_mass;
inv_inertia <= next_inv_inertia;
pos_x <= next_pos_x;
pos_y <= next_pos_y;
vel_x <= next_vel_x;
vel_y <= next_vel_y;
angle <= next_angle;
omega <= next_omega;
    end
end

endmodule