

// Calculates the next state for a given OBB
module obb_updater(
    input logic impulse_en,     // Whether impulses should be applied
    input logic update_en,      // Whether position/rotation should be updated
    input logic signed [23 : 0] impulse_x, input logic signed [23 : 0] impulse_y,
input logic signed [23 : 0] nudge_x, input logic signed [23 : 0] nudge_y,
input logic signed [10 : 0] rotational_impulse,
    input logic [7 : 0] prev_width,
input logic [7 : 0] prev_height,
input logic [15 : 0] prev_inertia,
input logic [15 : 0] prev_inv_mass,
input logic [23 : 0] prev_inv_inertia,
input logic signed [23 : 0] prev_pos_x, input logic signed [23 : 0] prev_pos_y,
input logic signed [23 : 0] prev_vel_x, input logic signed [23 : 0] prev_vel_y,
input logic signed [10 : 0] prev_angle,
input logic signed [10 : 0] prev_omega,
    output logic [7 : 0] next_width,
output logic [7 : 0] next_height,
output logic [15 : 0] next_inertia,
output logic [15 : 0] next_inv_mass,
output logic [23 : 0] next_inv_inertia,
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
opnet_342 = prev_vel_x + impulse_x;
opnet_343 = prev_vel_y + impulse_y;
n_vel_x = opnet_342;
n_vel_y = opnet_343;
opnet_344 = prev_omega + rotational_impulse;
next_omega = opnet_344;
opnet_345 = prev_pos_x + nudge_x;
opnet_346 = prev_pos_y + nudge_y;
n_pos_x = opnet_345;
n_pos_y = opnet_346;

end
end
logic signed [23 : 0] opnet_342;
logic signed [23 : 0] opnet_343;
logic signed [10 : 0] opnet_344;
logic signed [23 : 0] opnet_345;
logic signed [23 : 0] opnet_346;

// DELETE THIS LATER
//   - Over simplified wall bouncing
always_comb begin
next_vel_x = n_vel_x;
if(prev_pos_x < 0 || prev_pos_x > 24'sb010000000000000000000000) begin
opnet_347 = ~(n_vel_x) + 1'b1;

next_vel_x = opnet_347;
end

next_vel_y = n_vel_y;
if(prev_pos_y < 0 || prev_pos_y > 24'sb010000000000000000000000) begin
opnet_348 = ~(n_vel_y) + 1'b1;

next_vel_y = opnet_348;
end
end
logic signed [23 : 0] opnet_347;
logic signed [23 : 0] opnet_348;

// Update pos/rotation if enabled

logic signed [10 : 0] next_angle_uncorrected;

always_comb begin
next_pos_x = n_pos_x;
next_pos_y = n_pos_y;
next_angle_uncorrected = prev_angle;
if (update_en) begin
opnet_349 = n_pos_x + (next_vel_x >>> 3);
opnet_350 = n_pos_y + (next_vel_y >>> 3);
next_pos_x = opnet_349;
next_pos_y = opnet_350;
opnet_351 = prev_angle + next_omega;
next_angle_uncorrected = opnet_351;
end
end
logic signed [23 : 0] opnet_349;
logic signed [23 : 0] opnet_350;
logic signed [10 : 0] opnet_351;

// Ensure next state angle is within bounds of [0, 2pi] 
always_comb begin
next_angle = next_angle_uncorrected;
    if (next_angle_uncorrected > 11'sb01100100100) begin
opnet_352 = next_angle_uncorrected - 11'sb01100100100;
next_angle = opnet_352;
    end else if (next_angle_uncorrected < 11'sb0) begin
opnet_353 = next_angle_uncorrected + 11'sb01100100100;
next_angle = opnet_353;
    end
end
logic signed [10 : 0] opnet_352;
logic signed [10 : 0] opnet_353;

// Keep other things the same
assign next_width = prev_width;
assign next_height = prev_height;
assign next_inv_mass = prev_inv_mass;
assign next_inertia = prev_inertia;
assign next_inv_inertia = prev_inv_inertia;

endmodule