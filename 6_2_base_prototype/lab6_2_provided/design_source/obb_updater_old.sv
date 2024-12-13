

// Calculates the next state for a given OBB
module obb_updater(
    input logic signed [7 : 0] prev_width,
input logic signed [7 : 0] prev_height,
input logic signed [15 : 0] prev_inertia,
input logic signed [16 : 0] prev_inv_mass,
input logic signed [24 : 0] prev_inv_inertia,
input logic signed [23 : 0] prev_pos_x, input logic signed [23 : 0] prev_pos_y,
input logic signed [23 : 0] prev_vel_x, input logic signed [23 : 0] prev_vel_y,
input logic signed [10 : 0] prev_angle,
input logic signed [10 : 0] prev_omega,
    output logic signed [7 : 0] next_width,
output logic signed [7 : 0] next_height,
output logic signed [15 : 0] next_inertia,
output logic signed [16 : 0] next_inv_mass,
output logic signed [24 : 0] next_inv_inertia,
output logic signed [23 : 0] next_pos_x, output logic signed [23 : 0] next_pos_y,
output logic signed [23 : 0] next_vel_x, output logic signed [23 : 0] next_vel_y,
output logic signed [10 : 0] next_angle,
output logic signed [10 : 0] next_omega
);

logic signed [23 : 0] opnet_358;
assign opnet_358 = prev_pos_x + (next_vel_x >>> 3);
logic signed [23 : 0] opnet_359;
assign opnet_359 = prev_pos_y + (next_vel_y >>> 3);
assign next_pos_x = opnet_358;
assign next_pos_y = opnet_359;
assign next_omega = prev_omega;
assign next_width = prev_width;
assign next_height = prev_height;

always_comb begin
next_vel_x = prev_vel_x;
if(prev_pos_x < 0 || prev_pos_x > 24'sb010000000000000000000000) begin
opnet_360 = ~(prev_vel_x) + 1'b1;
next_vel_x = opnet_360;
end

next_vel_y = prev_vel_y;
if(prev_pos_y < 0 || prev_pos_y > 24'sb010000000000000000000000) begin
opnet_361 = ~(prev_vel_y) + 1'b1;
next_vel_y = opnet_361;
end
end
logic signed [23 : 0] opnet_360;
logic signed [23 : 0] opnet_361;

// Ensure next state angle is within bounds of [0, 2pi] 
logic signed [10 : 0] opnet_362;
assign opnet_362 = prev_angle + prev_omega;

always_comb begin
next_angle = opnet_362;
    if (opnet_362 > 11'sb01100100100) begin
opnet_363 = opnet_362 - 11'sb01100100100;
next_angle = opnet_363;
    end else if (opnet_362 < 11'sb0) begin
opnet_364 = opnet_362 + 11'sb01100100100;
next_angle = opnet_364;
    end
end
logic signed [10 : 0] opnet_363;
logic signed [10 : 0] opnet_364;

endmodule