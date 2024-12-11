


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
    input logic signed [7 : 0] ld_width,
input logic signed [7 : 0] ld_height,
input logic signed [31 : 0] ld_pos_x, input logic signed [31 : 0] ld_pos_y,
input logic signed [31 : 0] ld_vel_x, input logic signed [31 : 0] ld_vel_y,
input logic signed [10 : 0] ld_angle,
input logic signed [10 : 0] ld_omega,
    output logic signed [7 : 0] width,
output logic signed [7 : 0] height,
output logic signed [31 : 0] pos_x, output logic signed [31 : 0] pos_y,
output logic signed [31 : 0] vel_x, output logic signed [31 : 0] vel_y,
output logic signed [10 : 0] angle,
output logic signed [10 : 0] omega,

    input logic reset,
    input logic load,
    input logic clk
);

parameter X_INIT_SCALED = X_INIT * 2**24;
parameter Y_INIT_SCALED = Y_INIT * 2**24;
parameter X_VEL_INIT_SCALED = X_VEL_INIT * 2**26;
parameter Y_VEL_INIT_SCALED = Y_VEL_INIT * 2**26;
parameter ANGLE_INIT_SCALED = ANGLE_INIT * 2**7;
parameter OMEGA_INIT_SCALED = OMEGA_INIT * 2**7;

logic signed [7 : 0] next_width;
logic signed [7 : 0] next_height;
logic signed [31 : 0] next_pos_x;
logic signed [31 : 0] next_pos_y;
logic signed [31 : 0] next_vel_x;
logic signed [31 : 0] next_vel_y;
logic signed [10 : 0] next_angle;
logic signed [10 : 0] next_omega;

always_comb begin
if (load) begin
next_width = ld_width;
next_height = ld_height;
next_pos_x = ld_pos_x;
next_pos_y = ld_pos_y;
next_vel_x = ld_vel_x;
next_vel_y = ld_vel_y;
next_angle = ld_angle;
next_omega = ld_omega;
end else begin
next_width = width;
next_height = height;
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
    // Parallel load
    end else begin
width <= next_width;
height <= next_height;
pos_x <= next_pos_x;
pos_y <= next_pos_y;
vel_x <= next_vel_x;
vel_y <= next_vel_y;
angle <= next_angle;
omega <= next_omega;
    end
end

endmodule