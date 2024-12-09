

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

logic signed [31 : 0] opnet_215;
assign opnet_215 = prev_pos_x + (next_vel_x >>> 2);
logic signed [31 : 0] opnet_216;
assign opnet_216 = prev_pos_y + (next_vel_y >>> 2);
assign next_pos_x = opnet_215;
assign next_pos_y = opnet_216;
assign next_omega = prev_omega;
assign next_width = prev_width;
assign next_height = prev_height;

always_comb begin
next_vel_x = prev_vel_x;
if(prev_pos_x < 0 || prev_pos_x > 32'b01000000000000000000000000000000) begin
opnet_217 = ~(prev_vel_x) + 1'b1;

next_vel_x = opnet_217;
end

next_vel_y = prev_vel_y;
if(prev_pos_y < 0 || prev_pos_y > 32'b01000000000000000000000000000000) begin
opnet_218 = ~(prev_vel_y) + 1'b1;

next_vel_y = opnet_218;
end
end
logic signed [31 : 0] opnet_217;
logic signed [31 : 0] opnet_218;

// Ensure next state angle is within bounds of [0, 2pi] 
logic signed [10 : 0] opnet_219;
assign opnet_219 = prev_angle + prev_omega;

always_comb begin
next_angle = opnet_219;
    if (opnet_219 > 11'b01100100100) begin
opnet_220 = opnet_219 - 11'b01100100100;
next_angle = opnet_220;
    end
    if (opnet_219 < 11'b0) begin
opnet_221 = opnet_219 + 11'b01100100100;
next_angle = opnet_221;
    end
end
logic signed [10 : 0] opnet_220;
logic signed [10 : 0] opnet_221;

endmodule