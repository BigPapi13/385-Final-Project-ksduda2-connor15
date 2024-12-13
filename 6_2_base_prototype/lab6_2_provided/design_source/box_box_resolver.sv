// box_box_resolver.sv
//  - Resolves contacts between two OBBs
//  - Takes in the data of the OBBs and the contact data
//  - Outputs the new state of the OBBs




module box_box_resolver (
    input logic signed [15 : 0] normal_x, input logic signed [15 : 0] normal_y,
input logic signed [21 : 0] location_x, input logic signed [21 : 0] location_y,
input logic signed [31 : 0] penetration,

    input logic signed [31 : 0] obb1_pos_x, input logic signed [31 : 0] obb1_pos_y,
    input logic signed [31 : 0] obb1_vel_x, input logic signed [31 : 0] obb1_vel_y,
    input logic signed [10 : 0] obb1_omega,
    input logic signed [31 : 0] obb2_pos_x, input logic signed [31 : 0] obb2_pos_y,
    input logic signed [31 : 0] obb2_vel_x, input logic signed [31 : 0] obb2_vel_y,
    input logic signed [10 : 0] obb2_omega,

    output logic signed [31 : 0] impulse_x, output logic signed [31 : 0] impulse_y,
output logic signed [31 : 0] nudge_x, output logic signed [31 : 0] nudge_y,
output logic signed [10 : 0] rotational_impulse
);

/* Steps:
    1. Get relative velocity
    2. Use to calculate separating velocity
*/
logic signed [31 : 0] vs;

always_comb begin

// Get relative velocity
opnet_1 = obb1_vel_x - obb2_vel_x;
opnet_2 = obb1_vel_y - obb2_vel_y;

// Get separating velocity
opnet_3 = opnet_1 * normal_x;
opnet_4 = opnet_2 * normal_y;
opnet_5 = opnet_3 + opnet_4;
vs = opnet_5 >>> 14;

// Calculate impulse magnitude
opnet_6 = vs * 32'sb11111101000000000000000000000000;
opnet_7 = normal_x * opnet_6;
opnet_8 = normal_y * opnet_6;
impulse_x = opnet_7 >>> 40;
impulse_y = opnet_8 >>> 40;


//// Getting nudge vector
opnet_9 = normal_x * penetration;
opnet_10 = normal_y * penetration;
nudge_x = opnet_9 >>> 1;
nudge_y = opnet_10 >>> 1;

end
logic signed [31 : 0] opnet_1;
logic signed [31 : 0] opnet_2;
logic signed [47 : 0] opnet_3;
logic signed [47 : 0] opnet_4;
logic signed [47 : 0] opnet_5;
logic signed [63 : 0] opnet_6;
logic signed [79 : 0] opnet_7;
logic signed [79 : 0] opnet_8;
logic signed [47 : 0] opnet_9;
logic signed [47 : 0] opnet_10;

endmodule