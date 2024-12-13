// box_box_resolver.sv
//  - Resolves contacts between two OBBs
//  - Takes in the data of the OBBs and the contact data
//  - Outputs the new state of the OBBs




module box_box_resolver (
    input logic signed [15 : 0] normal_x, input logic signed [15 : 0] normal_y,
input logic signed [21 : 0] location_x, input logic signed [21 : 0] location_y,
input logic signed [23 : 0] penetration,

    input logic [7 : 0] obb1_width,
input logic [7 : 0] obb1_height,
input logic [15 : 0] obb1_inertia,
input logic [15 : 0] obb1_inv_mass,
input logic [23 : 0] obb1_inv_inertia,
input logic signed [23 : 0] obb1_pos_x, input logic signed [23 : 0] obb1_pos_y,
input logic signed [23 : 0] obb1_vel_x, input logic signed [23 : 0] obb1_vel_y,
input logic signed [10 : 0] obb1_angle,
input logic signed [10 : 0] obb1_omega,
    input logic [7 : 0] obb2_width,
input logic [7 : 0] obb2_height,
input logic [15 : 0] obb2_inertia,
input logic [15 : 0] obb2_inv_mass,
input logic [23 : 0] obb2_inv_inertia,
input logic signed [23 : 0] obb2_pos_x, input logic signed [23 : 0] obb2_pos_y,
input logic signed [23 : 0] obb2_vel_x, input logic signed [23 : 0] obb2_vel_y,
input logic signed [10 : 0] obb2_angle,
input logic signed [10 : 0] obb2_omega,

    output logic signed [23 : 0] impulse1_impulse_x, output logic signed [23 : 0] impulse1_impulse_y,
output logic signed [23 : 0] impulse1_nudge_x, output logic signed [23 : 0] impulse1_nudge_y,
output logic signed [10 : 0] impulse1_rotational_impulse,
    output logic signed [23 : 0] impulse2_impulse_x, output logic signed [23 : 0] impulse2_impulse_y,
output logic signed [23 : 0] impulse2_nudge_x, output logic signed [23 : 0] impulse2_nudge_y,
output logic signed [10 : 0] impulse2_rotational_impulse,
    output logic ignore_impulse
);

// Get vectors from centers of OBBS to contact point
logic signed [21 : 0] opnet_1;
assign opnet_1 = location_x - (obb1_pos_x >>> 2);
logic signed [21 : 0] opnet_2;
assign opnet_2 = location_y - (obb1_pos_y >>> 2);
logic signed [21 : 0] opnet_3;
assign opnet_3 = location_x - (obb2_pos_x >>> 2);
logic signed [21 : 0] opnet_4;
assign opnet_4 = location_y - (obb2_pos_y >>> 2);

/* Steps:
    1. Get relative velocity
    2. Use to calculate separating velocity
*/
logic signed [23 : 0] vs;
logic signed [9 : 0] totalIMass;

// Invert total inverse mass because we gotta divide by it
logic signed [15 : 0] inverter_0;
inverter inverter_inst_1(.x(totalIMass), .x_inverse(inverter_0));

logic signed [23 : 0] double_nudge_x;
logic signed [23 : 0] double_nudge_y;

logic signed [21 : 0] r1Cross;
logic signed [21 : 0] r2Cross;

logic signed [23 : 0] v_rel_x;
logic signed [23 : 0] v_rel_y;

always_comb begin

// Get vector omega x r1 and omega x r2
opnet_5 = ~(opnet_2) + 1'b1;

opnet_6 = opnet_5 * obb1_omega;
opnet_7 = opnet_1 * obb1_omega;
opnet_8 = ~(opnet_4) + 1'b1;

opnet_9 = opnet_8 * obb2_omega;
opnet_10 = opnet_3 * obb2_omega;

// Get relative velocity
opnet_11 = obb1_vel_x - obb2_vel_x;
opnet_12 = obb1_vel_y - obb2_vel_y;
opnet_13 = opnet_6[31:8] - opnet_9[31:8];
opnet_14 = opnet_7[31:8] - opnet_10[31:8];
opnet_15 = (opnet_11 >>> 6) + opnet_13;
opnet_16 = (opnet_12 >>> 6) + opnet_14;
v_rel_x = opnet_15 << 6;
v_rel_y = opnet_16 << 6;

// Get separating velocity
opnet_17 = v_rel_x * normal_x;
opnet_18 = v_rel_y * normal_y;
opnet_19 = opnet_17[38:15] + opnet_18[38:15];
vs = opnet_19 << 1;

// Get total inverse mass/inertia
opnet_20 = opnet_1 * normal_y;
opnet_21 = opnet_2 * normal_x;
opnet_22 = opnet_20[36:13] - opnet_21[36:13];
r1Cross = opnet_22 >>> 1;
opnet_23 = opnet_3 * normal_y;
opnet_24 = opnet_4 * normal_x;
opnet_25 = opnet_23[36:13] - opnet_24[36:13];
r2Cross = opnet_25 >>> 1;
opnet_26 = r1Cross * obb1_inv_inertia;
opnet_27 = r2Cross * obb2_inv_inertia;

opnet_28 = obb1_inv_mass + obb2_inv_mass;
opnet_29 = r1Cross * opnet_26[44:21];
opnet_30 = (opnet_28 >>> 5) + opnet_29[44:21];
opnet_31 = r2Cross * opnet_27[44:21];
opnet_32 = opnet_30 + opnet_31[44:21];
totalIMass = opnet_32 >>> 1;

// Calculate impulse vector
opnet_33 = vs * 24'sb111101000000000000000000;
opnet_34 = opnet_33[46:23] * inverter_0;
opnet_35 = normal_x * opnet_34[38:15];
opnet_36 = normal_y * opnet_34[38:15];
impulse1_impulse_x = opnet_35[37:14] << 12;
impulse1_impulse_y = opnet_36[37:14] << 12;
opnet_37 = ~(impulse1_impulse_x) + 1'b1;

opnet_38 = ~(impulse1_impulse_y) + 1'b1;

impulse2_impulse_x = opnet_37;
impulse2_impulse_y = opnet_38;

// Calculate rotational impulse for both boxes
opnet_39 = opnet_34[38:15] * opnet_26[44:21];
impulse1_rotational_impulse = opnet_39[45:22] << 6;
opnet_40 = opnet_34[38:15] * opnet_27[44:21];
opnet_41 = ~(opnet_40[45:22]) + 1'b1;

impulse2_rotational_impulse = opnet_41 << 6;

//// Getting nudge vector
opnet_42 = normal_x * penetration;
opnet_43 = normal_y * penetration;
double_nudge_x = opnet_42[38:15] << 1;
double_nudge_y = opnet_43[38:15] << 1;
impulse1_nudge_x = double_nudge_x >>> 1;
impulse1_nudge_y = double_nudge_y >>> 1;
opnet_44 = ~(impulse1_nudge_x) + 1'b1;

opnet_45 = ~(impulse1_nudge_y) + 1'b1;

impulse2_nudge_x = opnet_44;
impulse2_nudge_y = opnet_45;

end
logic signed [21 : 0] opnet_5;
logic signed [31 : 0] opnet_6;
logic signed [31 : 0] opnet_7;
logic signed [21 : 0] opnet_8;
logic signed [31 : 0] opnet_9;
logic signed [31 : 0] opnet_10;
logic signed [23 : 0] opnet_11;
logic signed [23 : 0] opnet_12;
logic signed [22 : 0] opnet_13;
logic signed [22 : 0] opnet_14;
logic signed [22 : 0] opnet_15;
logic signed [22 : 0] opnet_16;
logic signed [38 : 0] opnet_17;
logic signed [38 : 0] opnet_18;
logic signed [22 : 0] opnet_19;
logic signed [36 : 0] opnet_20;
logic signed [36 : 0] opnet_21;
logic signed [22 : 0] opnet_22;
logic signed [36 : 0] opnet_23;
logic signed [36 : 0] opnet_24;
logic signed [22 : 0] opnet_25;
logic signed [44 : 0] opnet_26;
logic signed [44 : 0] opnet_27;
logic signed [15 : 0] opnet_28;
logic signed [44 : 0] opnet_29;
logic signed [22 : 0] opnet_30;
logic signed [44 : 0] opnet_31;
logic signed [22 : 0] opnet_32;
logic signed [46 : 0] opnet_33;
logic signed [38 : 0] opnet_34;
logic signed [37 : 0] opnet_35;
logic signed [37 : 0] opnet_36;
logic signed [23 : 0] opnet_37;
logic signed [23 : 0] opnet_38;
logic signed [45 : 0] opnet_39;
logic signed [45 : 0] opnet_40;
logic signed [22 : 0] opnet_41;
logic signed [38 : 0] opnet_42;
logic signed [38 : 0] opnet_43;
logic signed [23 : 0] opnet_44;
logic signed [23 : 0] opnet_45;

// If separating velocity is positive, don't apply the impulse
assign ignore_impulse = ~vs[23];

endmodule