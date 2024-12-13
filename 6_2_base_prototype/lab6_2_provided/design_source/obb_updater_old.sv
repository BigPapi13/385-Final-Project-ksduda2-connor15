

// Calculates the next state for a given OBB
module obb_updater(
    input logic [7 : 0] prev_width,
input logic [7 : 0] prev_height,
input logic [7 : 0] prev_mass,
input logic [15 : 0] prev_inertia,
input logic [15 : 0] prev_inv_mass,
input logic [23 : 0] prev_inv_inertia,
input logic signed [31 : 0] prev_pos_x, input logic signed [31 : 0] prev_pos_y,
input logic signed [31 : 0] prev_vel_x, input logic signed [31 : 0] prev_vel_y,
input logic signed [10 : 0] prev_angle,
input logic signed [10 : 0] prev_omega,
    output logic [7 : 0] next_width,
output logic [7 : 0] next_height,
output logic [7 : 0] next_mass,
output logic [15 : 0] next_inertia,
output logic [15 : 0] next_inv_mass,
output logic [23 : 0] next_inv_inertia,
output logic signed [31 : 0] next_pos_x, output logic signed [31 : 0] next_pos_y,
output logic signed [31 : 0] next_vel_x, output logic signed [31 : 0] next_vel_y,
output logic signed [10 : 0] next_angle,
output logic signed [10 : 0] next_omega
);

logic signed [31 : 0] opnet_356;
assign opnet_356 = prev_pos_x + (next_vel_x >>> 2);
logic signed [31 : 0] opnet_357;
assign opnet_357 = prev_pos_y + (next_vel_y >>> 2);
assign next_pos_x = opnet_356;
assign next_pos_y = opnet_357;
assign next_omega = prev_omega;
assign next_width = prev_width;
assign next_height = prev_height;

always_comb begin
next_vel_x = prev_vel_x;
if(prev_pos_x < 0 || prev_pos_x > 32'sb01000000000000000000000000000000) begin
opnet_358 = ~(prev_vel_x) + 1'b1;

next_vel_x = opnet_358;
end

next_vel_y = prev_vel_y;
if(prev_pos_y < 0 || prev_pos_y > 32'sb01000000000000000000000000000000) begin
opnet_359 = ~(prev_vel_y) + 1'b1;

next_vel_y = opnet_359;
end
end
logic signed [31 : 0] opnet_358;
logic signed [31 : 0] opnet_359;

// Ensure next state angle is within bounds of [0, 2pi] 
logic signed [10 : 0] opnet_360;
assign opnet_360 = prev_angle + prev_omega;

always_comb begin
next_angle = opnet_360;
    if (opnet_360 > 11'sb01100100100) begin
opnet_361 = opnet_360 - 11'sb01100100100;
next_angle = opnet_361;
    end else if (opnet_360 < 11'sb0) begin
opnet_362 = opnet_360 + 11'sb01100100100;
next_angle = opnet_362;
    end
end
logic signed [10 : 0] opnet_361;
logic signed [10 : 0] opnet_362;

endmodule