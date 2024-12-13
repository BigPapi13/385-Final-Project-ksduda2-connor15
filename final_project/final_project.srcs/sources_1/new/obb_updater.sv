

// Calculates the next state for a given OBB
module obb_updater(
    input logic [15:0] x,
    input logic impulse_en,     // Whether impulses should be applied
    input logic update_en,      // Whether position/rotation should be updated
    input logic signed [23 : 0] impulse_x, input logic signed [23 : 0] impulse_y,
input logic signed [21 : 0] nudge_x, input logic signed [21 : 0] nudge_y,
input logic signed [10 : 0] rotational_impulse,
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

logic signed [23 : 0] n_vel_x;
logic signed [23 : 0] n_vel_y;
logic signed [23 : 0] n_pos_x;
logic signed [23 : 0] n_pos_y;

// Apply impulse if enabled
always_comb begin
n_vel_x = prev_vel_x;
n_vel_y = prev_vel_y;
n_pos_x = prev_pos_x;
n_pos_y = prev_pos_y;
next_omega = prev_omega;
if (impulse_en) begin
opnet_344 = impulse_x * prev_inv_mass;
opnet_345 = impulse_y * prev_inv_mass;
opnet_346 = prev_vel_x + (opnet_344 >>> 14);
opnet_347 = prev_vel_y + (opnet_345 >>> 14);
n_vel_x = opnet_346;
n_vel_y = opnet_347;
opnet_348 = prev_omega + rotational_impulse;
next_omega = opnet_348;
opnet_349 = prev_pos_x + nudge_x;
opnet_350 = prev_pos_y + nudge_y;
n_pos_x = opnet_349;
n_pos_y = opnet_350;

end
end
logic signed [38 : 0] opnet_344;
logic signed [38 : 0] opnet_345;
logic signed [24 : 0] opnet_346;
logic signed [24 : 0] opnet_347;
logic signed [10 : 0] opnet_348;
logic signed [23 : 0] opnet_349;
logic signed [23 : 0] opnet_350;

// DELETE THIS LATER
//   - Over simplified wall bouncing
always_comb begin
next_vel_x = n_vel_x + x;
if(prev_pos_x < 0 || prev_pos_x > 24'sb010000000000000000000000) begin
opnet_351 = ~(n_vel_x) + 1'b1;
next_vel_x = opnet_351;
end

next_vel_y = n_vel_y;
if(prev_pos_y < 0 || prev_pos_y > 24'sb010000000000000000000000) begin
opnet_352 = ~(n_vel_y) + 1'b1;
next_vel_y = opnet_352;
end
end
logic signed [23 : 0] opnet_351;
logic signed [23 : 0] opnet_352;

// Update pos/rotation if enabled

logic signed [10 : 0] next_angle_uncorrected;

always_comb begin
next_pos_x = n_pos_x;
next_pos_y = n_pos_y;
next_angle_uncorrected = prev_angle;
if (update_en) begin
opnet_353 = n_pos_x + (next_vel_x >>> 3);
opnet_354 = n_pos_y + (next_vel_y >>> 3);
next_pos_x = opnet_353;
next_pos_y = opnet_354;
opnet_355 = prev_angle + next_omega;
next_angle_uncorrected = opnet_355;
end
end
logic signed [23 : 0] opnet_353;
logic signed [23 : 0] opnet_354;
logic signed [10 : 0] opnet_355;

// Ensure next state angle is within bounds of [0, 2pi] 
always_comb begin
next_angle = next_angle_uncorrected;
    if (next_angle_uncorrected > 11'sb01100100100) begin
opnet_356 = next_angle_uncorrected - 11'sb01100100100;
next_angle = (opnet_356 * 24'sb000001100110011001100110) >>> 19;
    end else if (next_angle_uncorrected < 11'sb0) begin
opnet_357 = next_angle_uncorrected + 11'sb01100100100;
next_angle = (opnet_357 * 24'sb000001100110011001100110) >>> 19;
    end
end
logic signed [10 : 0] opnet_356;
logic signed [10 : 0] opnet_357;

// Keep other things the same
assign next_width = prev_width;
assign next_height = prev_height;
assign next_inv_mass = prev_inv_mass;
assign next_inertia = prev_inertia;
assign next_inv_inertia = prev_inv_inertia;

endmodule