// box_box_resolver.sv
//  - Resolves contacts between two OBBs
//  - Takes in the data of the OBBs and the contact data
//  - Outputs the new state of the OBBs




module box_box_resolver (
    input logic signed [15 : 0] normal_x, input logic signed [15 : 0] normal_y,
input logic signed [21 : 0] location_x, input logic signed [21 : 0] location_y,
input logic signed [31 : 0] penetration,

    input logic [7 : 0] obb1_width,
input logic [7 : 0] obb1_height,
input logic [7 : 0] obb1_mass,
input logic [15 : 0] obb1_inertia,
input logic [15 : 0] obb1_inv_mass,
input logic [23 : 0] obb1_inv_inertia,
input logic signed [31 : 0] obb1_pos_x, input logic signed [31 : 0] obb1_pos_y,
input logic signed [31 : 0] obb1_vel_x, input logic signed [31 : 0] obb1_vel_y,
input logic signed [10 : 0] obb1_angle,
input logic signed [10 : 0] obb1_omega,
    input logic [7 : 0] obb2_width,
input logic [7 : 0] obb2_height,
input logic [7 : 0] obb2_mass,
input logic [15 : 0] obb2_inertia,
input logic [15 : 0] obb2_inv_mass,
input logic [23 : 0] obb2_inv_inertia,
input logic signed [31 : 0] obb2_pos_x, input logic signed [31 : 0] obb2_pos_y,
input logic signed [31 : 0] obb2_vel_x, input logic signed [31 : 0] obb2_vel_y,
input logic signed [10 : 0] obb2_angle,
input logic signed [10 : 0] obb2_omega,

    output logic signed [31 : 0] impulse_x, output logic signed [31 : 0] impulse_y,
output logic signed [31 : 0] nudge_x, output logic signed [31 : 0] nudge_y,
    output logic signed [10 : 0] rotational_impulse1,
    output logic signed [10 : 0] rotational_impulse2
);

// Get vectors from centers of OBBS to contact point
logic signed [21 : 0] opnet_1;
assign opnet_1 = location_x - (obb1_pos_x >>> 10);
logic signed [21 : 0] opnet_2;
assign opnet_2 = location_y - (obb1_pos_y >>> 10);
logic signed [21 : 0] opnet_3;
assign opnet_3 = location_x - (obb2_pos_x >>> 10);
logic signed [21 : 0] opnet_4;
assign opnet_4 = location_y - (obb2_pos_y >>> 10);

/* Steps:
    1. Get relative velocity
    2. Use to calculate separating velocity
*/
logic signed [31 : 0] vs;
logic signed [9 : 0] totalIMass;

// Invert total inverse mass because we gotta divide by it
logic signed [15 : 0] inverter_0;
inverter inverter_inst_1(.x(totalIMass), .x_inverse(inverter_0));

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
opnet_13 = opnet_6 - opnet_9;
opnet_14 = opnet_7 - opnet_10;
opnet_15 = (opnet_11 >>> 5) + opnet_13;
opnet_16 = (opnet_12 >>> 5) + opnet_14;

// Get separating velocity
opnet_17 = opnet_15 * normal_x;
opnet_18 = opnet_16 * normal_y;
opnet_19 = opnet_17 + opnet_18;
vs = opnet_19 >>> 9;

// Get total inverse mass/inertia
opnet_20 = opnet_1 * normal_y;
opnet_21 = opnet_2 * normal_x;
opnet_22 = opnet_20 - opnet_21;
opnet_23 = opnet_3 * normal_y;
opnet_24 = opnet_4 * normal_x;
opnet_25 = opnet_23 - opnet_24;

opnet_26 = obb1_inv_mass + obb2_inv_mass;
opnet_27 = opnet_22 * opnet_22;
opnet_28 = opnet_27 * obb1_inv_inertia;
opnet_29 = opnet_26 + (opnet_28 >>> 65);
opnet_30 = opnet_25 * opnet_25;
opnet_31 = opnet_30 * obb2_inv_inertia;
opnet_32 = opnet_29 + (opnet_31 >>> 65);
totalIMass = opnet_32 >>> 6;


// Calculate impulse vector
opnet_33 = vs * 32'sb11111010000000000000000000000000;
opnet_34 = opnet_33 * inverter_0;
opnet_35 = normal_x * opnet_34;
opnet_36 = normal_y * opnet_34;
impulse_x = opnet_35 >>> 47;
impulse_y = opnet_36 >>> 47;

//$ Impulse.impulse.assign(Contact.normal * (vs * (-(1 + RESTITUTION) / 2)))       # /2 is to divide by the inverse masses, which are assumed to be 1

// Calculate rotational impulse for both boxes
opnet_37 = opnet_34 * opnet_22;
opnet_38 = opnet_37 * obb1_inv_inertia;
rotational_impulse1 = opnet_38 >>> 103;
opnet_39 = opnet_34 * opnet_25;
opnet_40 = opnet_39 * obb2_inv_inertia;
opnet_41 = ~(opnet_40) + 1'b1;

rotational_impulse2 = opnet_41 >>> 103;
//$ rotational_impulse1.assign(0)
//$ rotational_impulse2.assign(0)


//// Getting nudge vector
opnet_42 = normal_x * penetration;
opnet_43 = normal_y * penetration;
nudge_x = opnet_42 >>> 1;
nudge_y = opnet_43 >>> 1;

end
logic signed [21 : 0] opnet_5;
logic signed [32 : 0] opnet_6;
logic signed [32 : 0] opnet_7;
logic signed [21 : 0] opnet_8;
logic signed [32 : 0] opnet_9;
logic signed [32 : 0] opnet_10;
logic signed [31 : 0] opnet_11;
logic signed [31 : 0] opnet_12;
logic signed [32 : 0] opnet_13;
logic signed [32 : 0] opnet_14;
logic signed [32 : 0] opnet_15;
logic signed [32 : 0] opnet_16;
logic signed [48 : 0] opnet_17;
logic signed [48 : 0] opnet_18;
logic signed [48 : 0] opnet_19;
logic signed [37 : 0] opnet_20;
logic signed [37 : 0] opnet_21;
logic signed [37 : 0] opnet_22;
logic signed [37 : 0] opnet_23;
logic signed [37 : 0] opnet_24;
logic signed [37 : 0] opnet_25;
logic signed [15 : 0] opnet_26;
logic signed [75 : 0] opnet_27;
logic signed [99 : 0] opnet_28;
logic signed [34 : 0] opnet_29;
logic signed [75 : 0] opnet_30;
logic signed [99 : 0] opnet_31;
logic signed [34 : 0] opnet_32;
logic signed [63 : 0] opnet_33;
logic signed [79 : 0] opnet_34;
logic signed [95 : 0] opnet_35;
logic signed [95 : 0] opnet_36;
logic signed [117 : 0] opnet_37;
logic signed [141 : 0] opnet_38;
logic signed [117 : 0] opnet_39;
logic signed [141 : 0] opnet_40;
logic signed [141 : 0] opnet_41;
logic signed [47 : 0] opnet_42;
logic signed [47 : 0] opnet_43;

endmodule