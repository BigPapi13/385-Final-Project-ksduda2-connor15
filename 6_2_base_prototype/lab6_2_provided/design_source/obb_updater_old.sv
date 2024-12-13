

// Calculates the next state for a given OBB
module obb_updater(
    input logic signed [7 : 0] prev_width,
input logic signed [7 : 0] prev_height,
input logic signed [31 : 0] prev_pos_x, input logic signed [31 : 0] prev_pos_y,
input logic signed [31 : 0] prev_vel_x, input logic signed [31 : 0] prev_vel_y,
input logic signed [10 : 0] prev_angle,
input logic signed [10 : 0] prev_omega,
    output logic signed [7 : 0] next_width,
output logic signed [7 : 0] next_height,
output logic signed [31 : 0] next_pos_x, output logic signed [31 : 0] next_pos_y,
output logic signed [31 : 0] next_vel_x, output logic signed [31 : 0] next_vel_y,
output logic signed [10 : 0] next_angle,
output logic signed [10 : 0] next_omega
);

logic signed [31 : 0] opnet_320;
assign opnet_320 = prev_pos_x + (next_vel_x >>> 2);
logic signed [31 : 0] opnet_321;
assign opnet_321 = prev_pos_y + (next_vel_y >>> 2);
assign next_pos_x = opnet_320;
assign next_pos_y = opnet_321;
assign next_omega = prev_omega;
assign next_width = prev_width;
assign next_height = prev_height;

always_comb begin
next_vel_x = prev_vel_x;
if(prev_pos_x < 0 || prev_pos_x > 32'sb01000000000000000000000000000000) begin
opnet_322 = ~(prev_vel_x) + 1'b1;

next_vel_x = opnet_322;
end

next_vel_y = prev_vel_y;
if(prev_pos_y < 0 || prev_pos_y > 32'sb01000000000000000000000000000000) begin
opnet_323 = ~(prev_vel_y) + 1'b1;

next_vel_y = opnet_323;
end
end
logic signed [31 : 0] opnet_322;
logic signed [31 : 0] opnet_323;

// Ensure next state angle is within bounds of [0, 2pi] 
logic signed [10 : 0] opnet_324;
assign opnet_324 = prev_angle + prev_omega;

always_comb begin
next_angle = opnet_324;
    if (opnet_324 > 11'sb01100100100) begin
opnet_325 = opnet_324 - 11'sb01100100100;
next_angle = opnet_325;
    end else if (opnet_324 < 11'sb0) begin
opnet_326 = opnet_324 + 11'sb01100100100;
next_angle = opnet_326;
    end
end
logic signed [10 : 0] opnet_325;
logic signed [10 : 0] opnet_326;

endmodule