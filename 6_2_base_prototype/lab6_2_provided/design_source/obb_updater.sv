

// Calculates the next state for a given OBB
module obb_updater(
    input logic impulse_en,     // Whether impulses should be applied
    input logic update_en,      // Whether position/rotation should be updated
    input logic signed [31 : 0] impulse_x, input logic signed [31 : 0] impulse_y,
input logic signed [31 : 0] nudge_x, input logic signed [31 : 0] nudge_y,
input logic signed [10 : 0] rotational_impulse,
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

logic signed [31 : 0] n_vel_x;
logic signed [31 : 0] n_vel_y;

// Apply impulse if enabled
always_comb begin
n_vel_x = prev_vel_x;
n_vel_y = prev_vel_y;
next_omega = prev_omega;
if (impulse_en) begin
opnet_312 = prev_vel_x + impulse_x;
opnet_313 = prev_vel_y + impulse_y;
n_vel_x = opnet_312;
n_vel_y = opnet_313;
    ///////// TO-DO: MAKE IT SO OMEGA IS UPDATED WITH IMPULSE AS WELL
    ////////  ALSO TO-DO: Apply shift here
end
end
logic signed [31 : 0] opnet_312;
logic signed [31 : 0] opnet_313;

// DELETE THIS LATER
//   - Over simplified wall bouncing
always_comb begin
next_vel_x = n_vel_x;
if(prev_pos_x < 0 || prev_pos_x > 32'sb01000000000000000000000000000000) begin
opnet_314 = ~(n_vel_x) + 1'b1;

next_vel_x = opnet_314;
end

next_vel_y = n_vel_y;
if(prev_pos_y < 0 || prev_pos_y > 32'sb01000000000000000000000000000000) begin
opnet_315 = ~(n_vel_y) + 1'b1;

next_vel_y = opnet_315;
end
end
logic signed [31 : 0] opnet_314;
logic signed [31 : 0] opnet_315;

// Update pos/rotation if enabled

logic signed [10 : 0] next_angle_uncorrected;

always_comb begin
next_pos_x = prev_pos_x;
next_pos_y = prev_pos_y;
next_angle_uncorrected = prev_angle;
if (update_en) begin
opnet_316 = prev_pos_x + (next_vel_x >>> 2);
opnet_317 = prev_pos_y + (next_vel_y >>> 2);
next_pos_x = opnet_316;
next_pos_y = opnet_317;
    ////////// TO-DO: UPDATE ROTATION WITH UPDATED VALUE FROM IMPULSE
end
end
logic signed [31 : 0] opnet_316;
logic signed [31 : 0] opnet_317;

// Ensure next state angle is within bounds of [0, 2pi] 
always_comb begin
next_angle = next_angle_uncorrected;
    if (next_angle_uncorrected > 11'sb01100100100) begin
opnet_318 = next_angle_uncorrected - 11'sb01100100100;
next_angle = opnet_318;
    end else if (next_angle_uncorrected < 11'sb0) begin
opnet_319 = next_angle_uncorrected + 11'sb01100100100;
next_angle = opnet_319;
    end
end
logic signed [10 : 0] opnet_318;
logic signed [10 : 0] opnet_319;

// Keep other things the same
assign next_width = prev_width;
assign next_height = prev_height;

endmodule