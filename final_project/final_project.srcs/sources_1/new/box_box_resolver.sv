// box_box_resolver.sv
//  - Resolves contacts between two OBBs
//  - Takes in the data of the OBBs and the contact data
//  - Outputs the new state of the OBBs




module box_box_resolver (
    input logic signed [15 : 0] normal_x, input logic signed [15 : 0] normal_y,
input logic signed [21 : 0] location_x, input logic signed [21 : 0] location_y,
input logic signed [23 : 0] penetration,

    input logic signed [7 : 0] obb1_width,
input logic signed [7 : 0] obb1_height,
input logic signed [15 : 0] obb1_inertia,
input logic signed [16 : 0] obb1_inv_mass,
input logic signed [24 : 0] obb1_inv_inertia,
input logic signed [23 : 0] obb1_pos_x, input logic signed [23 : 0] obb1_pos_y,
input logic signed [23 : 0] obb1_vel_x, input logic signed [23 : 0] obb1_vel_y,
input logic signed [10 : 0] obb1_angle,
input logic signed [10 : 0] obb1_omega,
    input logic signed [7 : 0] obb2_width,
input logic signed [7 : 0] obb2_height,
input logic signed [15 : 0] obb2_inertia,
input logic signed [16 : 0] obb2_inv_mass,
input logic signed [24 : 0] obb2_inv_inertia,
input logic signed [23 : 0] obb2_pos_x, input logic signed [23 : 0] obb2_pos_y,
input logic signed [23 : 0] obb2_vel_x, input logic signed [23 : 0] obb2_vel_y,
input logic signed [10 : 0] obb2_angle,
input logic signed [10 : 0] obb2_omega,

    output logic signed [23 : 0] impulse1_impulse_x, output logic signed [23 : 0] impulse1_impulse_y,
output logic signed [21 : 0] impulse1_nudge_x, output logic signed [21 : 0] impulse1_nudge_y,
output logic signed [10 : 0] impulse1_rotational_impulse,
    output logic signed [23 : 0] impulse2_impulse_x, output logic signed [23 : 0] impulse2_impulse_y,
output logic signed [21 : 0] impulse2_nudge_x, output logic signed [21 : 0] impulse2_nudge_y,
output logic signed [10 : 0] impulse2_rotational_impulse,
    output logic ignore_impulse
);

logic signed [24 : 0] signed_obb1_inv_I;
logic signed [24 : 0] signed_obb2_inv_I;
assign signed_obb1_inv_I = {1'b0, obb1_inv_inertia};
assign signed_obb2_inv_I = {1'b0, obb2_inv_inertia};

logic signed [21 : 0] opnet_1;
assign opnet_1 = location_x + (impulse1_nudge_x >>> 2);
logic signed [21 : 0] opnet_2;
assign opnet_2 = location_y + (impulse1_nudge_y >>> 2);
assign npos_x = opnet_1;
assign npos_y = opnet_2;
logic signed [21 : 0] npos_x;
logic signed [21 : 0] npos_y;

// Get vectors from centers of OBBS to contact point
logic signed [21 : 0] r1_x;
logic signed [21 : 0] r1_y;
logic signed [21 : 0] r2_x;
logic signed [21 : 0] r2_y;
logic signed [21 : 0] opnet_3;
assign opnet_3 = npos_x - (obb1_pos_x >>> 2);
logic signed [21 : 0] opnet_4;
assign opnet_4 = npos_y - (obb1_pos_y >>> 2);
assign r1_x = opnet_3;
assign r1_y = opnet_4;
logic signed [21 : 0] opnet_5;
assign opnet_5 = npos_x - (obb2_pos_x >>> 2);
logic signed [21 : 0] opnet_6;
assign opnet_6 = npos_y - (obb2_pos_y >>> 2);
assign r2_x = opnet_5;
assign r2_y = opnet_6;

/* Steps:
    1. Get relative velocity
    2. Use to calculate separating velocity
*/
logic signed [23 : 0] vs;
logic signed [9 : 0] totalIMass;

logic signed [23 : 0] vw1_x;
logic signed [23 : 0] vw1_y;
logic signed [23 : 0] vw2_x;
logic signed [23 : 0] vw2_y;

// Invert total inverse mass because we gotta divide by it
logic signed [15 : 0] inverter_0;
inverter inverter_inst_1(.x(totalIMass), .x_inverse(inverter_0));

logic signed [23 : 0] double_nudge_x;
logic signed [23 : 0] double_nudge_y;

logic signed [21 : 0] r1Cross;
logic signed [21 : 0] r2Cross;
logic signed [31 : 0] r1CrossInertia;
logic signed [31 : 0] r2CrossInertia;

logic signed [23 : 0] v_rel_x;
logic signed [23 : 0] v_rel_y;
logic signed [23 : 0] impulse_magnitude;

always_comb begin

// Get vector omega x r1 and omega x r2
opnet_7 = r1_y * obb1_omega;
opnet_8 = ~(opnet_7) + 1'b1;
opnet_9 = r1_x * obb1_omega;
vw1_x = opnet_8 >>> 2;
vw1_y = opnet_9 >>> 2;
opnet_10 = r2_y * obb2_omega;
opnet_11 = ~(opnet_10) + 1'b1;
opnet_12 = r2_x * obb2_omega;
vw2_x = opnet_11 >>> 2;
vw2_y = opnet_12 >>> 2;


// Get relative velocity
opnet_13 = obb1_vel_x - obb2_vel_x;
opnet_14 = obb1_vel_y - obb2_vel_y;
opnet_15 = vw1_x - vw2_x;
opnet_16 = vw1_y - vw2_y;
opnet_17 = opnet_13 + opnet_15;
opnet_18 = opnet_14 + opnet_16;
v_rel_x = opnet_17;
v_rel_y = opnet_18;

// Get separating velocity
opnet_19 = v_rel_x * normal_x;
opnet_20 = v_rel_y * normal_y;
opnet_21 = opnet_19 + opnet_20;
vs = opnet_21 >>> 14;

// Get total inverse mass/inertia
opnet_22 = r1_x * normal_y;
opnet_23 = r1_y * normal_x;
opnet_24 = opnet_22 - opnet_23;
r1Cross = opnet_24 >>> 14;
opnet_25 = r2_x * normal_y;
opnet_26 = r2_y * normal_x;
opnet_27 = opnet_25 - opnet_26;
r2Cross = opnet_27 >>> 14;
opnet_28 = r1Cross * signed_obb1_inv_I;
r1CrossInertia = opnet_28 >>> 13;
opnet_29 = r2Cross * signed_obb2_inv_I;
r2CrossInertia = opnet_29 >>> 13;

opnet_30 = obb1_inv_mass + obb2_inv_mass;
opnet_31 = r1Cross * r1CrossInertia;
opnet_32 = opnet_30 + (opnet_31 >>> 24);
opnet_33 = r2Cross * r2CrossInertia;
opnet_34 = opnet_32 + (opnet_33 >>> 24);
totalIMass = opnet_34 >>> 6;

// Calculate impulse vector
opnet_35 = vs * 24'sb111101000000000000000000;
opnet_36 = opnet_35 * inverter_0;
impulse_magnitude = opnet_36 >>> 26;
opnet_37 = normal_x * impulse_magnitude;
opnet_38 = normal_y * impulse_magnitude;
impulse1_impulse_x = opnet_37 >>> 14;
impulse1_impulse_y = opnet_38 >>> 14;
opnet_39 = ~(impulse1_impulse_x) + 1'b1;
opnet_40 = ~(impulse1_impulse_y) + 1'b1;
impulse2_impulse_x = opnet_39;
impulse2_impulse_y = opnet_40;

// Calculate rotational impulse for both boxes
opnet_41 = impulse_magnitude * r1CrossInertia;
impulse1_rotational_impulse = opnet_41 >>> 36;
opnet_42 = impulse_magnitude * r2CrossInertia;
opnet_43 = ~(opnet_42) + 1'b1;
impulse2_rotational_impulse = opnet_43 >>> 36;

//// Getting nudge vector
opnet_44 = normal_x * penetration;
opnet_45 = normal_y * penetration;
double_nudge_x = opnet_44 >>> 14;
double_nudge_y = opnet_45 >>> 14;
impulse1_nudge_x = double_nudge_x >>> 1;
impulse1_nudge_y = double_nudge_y >>> 1;
opnet_46 = ~(impulse1_nudge_x) + 1'b1;
opnet_47 = ~(impulse1_nudge_y) + 1'b1;
impulse2_nudge_x = opnet_46;
impulse2_nudge_y = opnet_47;

end
logic signed [30 : 0] opnet_7;
logic signed [30 : 0] opnet_8;
logic signed [30 : 0] opnet_9;
logic signed [30 : 0] opnet_10;
logic signed [30 : 0] opnet_11;
logic signed [30 : 0] opnet_12;
logic signed [23 : 0] opnet_13;
logic signed [23 : 0] opnet_14;
logic signed [23 : 0] opnet_15;
logic signed [23 : 0] opnet_16;
logic signed [23 : 0] opnet_17;
logic signed [23 : 0] opnet_18;
logic signed [37 : 0] opnet_19;
logic signed [37 : 0] opnet_20;
logic signed [37 : 0] opnet_21;
logic signed [35 : 0] opnet_22;
logic signed [35 : 0] opnet_23;
logic signed [35 : 0] opnet_24;
logic signed [35 : 0] opnet_25;
logic signed [35 : 0] opnet_26;
logic signed [35 : 0] opnet_27;
logic signed [44 : 0] opnet_28;
logic signed [44 : 0] opnet_29;
logic signed [16 : 0] opnet_30;
logic signed [51 : 0] opnet_31;
logic signed [27 : 0] opnet_32;
logic signed [51 : 0] opnet_33;
logic signed [27 : 0] opnet_34;
logic signed [46 : 0] opnet_35;
logic signed [60 : 0] opnet_36;
logic signed [37 : 0] opnet_37;
logic signed [37 : 0] opnet_38;
logic signed [23 : 0] opnet_39;
logic signed [23 : 0] opnet_40;
logic signed [53 : 0] opnet_41;
logic signed [53 : 0] opnet_42;
logic signed [53 : 0] opnet_43;
logic signed [37 : 0] opnet_44;
logic signed [37 : 0] opnet_45;
logic signed [21 : 0] opnet_46;
logic signed [21 : 0] opnet_47;

// If separating velocity is positive, don't apply the impulse
assign ignore_impulse = ~vs[23];

endmodule