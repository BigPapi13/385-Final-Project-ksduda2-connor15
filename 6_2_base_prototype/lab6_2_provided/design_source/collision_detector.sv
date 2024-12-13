

module collision_detector(
    input logic [7 : 0] obb1_width,
input logic [7 : 0] obb1_height,
input logic [15 : 0] obb1_inertia,
input logic [15 : 0] obb1_inv_mass,
input logic [23 : 0] obb1_inv_inertia,
input logic signed [23 : 0] obb1_pos_x, input logic signed [23 : 0] obb1_pos_y,
input logic signed [23 : 0] obb1_vel_x, input logic signed [23 : 0] obb1_vel_y,
input logic signed [10 : 0] obb1_angle,
input logic signed [10 : 0] obb1_omega,
input logic signed [15 : 0] obb1_u_x, input logic signed [15 : 0] obb1_u_y,
input logic signed [15 : 0] obb1_v_x, input logic signed [15 : 0] obb1_v_y,
input logic signed [21 : 0] obb1_Point0_x, input logic signed [21 : 0] obb1_Point0_y,
input logic signed [21 : 0] obb1_Point1_x, input logic signed [21 : 0] obb1_Point1_y,
input logic signed [21 : 0] obb1_Point2_x, input logic signed [21 : 0] obb1_Point2_y,
input logic signed [21 : 0] obb1_Point3_x, input logic signed [21 : 0] obb1_Point3_y,
input logic signed [6 : 0] obb1_halfWidth,
input logic signed [6 : 0] obb1_halfHeight,
    input logic [7 : 0] obb2_width,
input logic [7 : 0] obb2_height,
input logic [15 : 0] obb2_inertia,
input logic [15 : 0] obb2_inv_mass,
input logic [23 : 0] obb2_inv_inertia,
input logic signed [23 : 0] obb2_pos_x, input logic signed [23 : 0] obb2_pos_y,
input logic signed [23 : 0] obb2_vel_x, input logic signed [23 : 0] obb2_vel_y,
input logic signed [10 : 0] obb2_angle,
input logic signed [10 : 0] obb2_omega,
input logic signed [15 : 0] obb2_u_x, input logic signed [15 : 0] obb2_u_y,
input logic signed [15 : 0] obb2_v_x, input logic signed [15 : 0] obb2_v_y,
input logic signed [21 : 0] obb2_Point0_x, input logic signed [21 : 0] obb2_Point0_y,
input logic signed [21 : 0] obb2_Point1_x, input logic signed [21 : 0] obb2_Point1_y,
input logic signed [21 : 0] obb2_Point2_x, input logic signed [21 : 0] obb2_Point2_y,
input logic signed [21 : 0] obb2_Point3_x, input logic signed [21 : 0] obb2_Point3_y,
input logic signed [6 : 0] obb2_halfWidth,
input logic signed [6 : 0] obb2_halfHeight,
    output logic is_collision,
    output logic signed [15 : 0] normal_x, output logic signed [15 : 0] normal_y,
output logic signed [21 : 0] location_x, output logic signed [21 : 0] location_y,
output logic signed [23 : 0] penetration
);

// Steps:
//  1. Generate bases of A and B (maybe move this to external module later to minimize cos/sin use)
//  2. Project points of B onto axes of A
//      - Need to get points of rects A and B from pos, dimensions, and angle
///     - Get points RELATIVE to rectangle A
//      - Will refer to this coordinate system as UV coords
//  3. Get minimum and maximum u and v of B
//  4. Use simple comparisons to check for separating axis
//  5. Repeat steps for A onto B
//  6. Use big OR gate to combine all the checks

// Get points of A and B
//  - Need to rotate first, then subtract

//// TEST 1: A onto B

// Project points of A onto axes of B
logic signed [21 : 0] opnet_46;
assign opnet_46 = obb1_Point0_x - (obb2_pos_x >>> 2);
logic signed [21 : 0] opnet_47;
assign opnet_47 = obb1_Point0_y - (obb2_pos_y >>> 2);
logic signed [23 : 0] Point1_0_u;
logic signed [23 : 0] Point1_0_v;
logic signed [36 : 0] opnet_48;
assign opnet_48 = opnet_46 * obb2_u_x;
logic signed [36 : 0] opnet_49;
assign opnet_49 = opnet_47 * obb2_u_y;
logic signed [22 : 0] opnet_50;
assign opnet_50 = opnet_48[36:13] + opnet_49[36:13];
assign Point1_0_u = opnet_50 << 1;
logic signed [36 : 0] opnet_51;
assign opnet_51 = opnet_46 * obb2_v_x;
logic signed [36 : 0] opnet_52;
assign opnet_52 = opnet_47 * obb2_v_y;
logic signed [22 : 0] opnet_53;
assign opnet_53 = opnet_51[36:13] + opnet_52[36:13];
assign Point1_0_v = opnet_53 << 1;
logic signed [21 : 0] opnet_54;
assign opnet_54 = obb1_Point1_x - (obb2_pos_x >>> 2);
logic signed [21 : 0] opnet_55;
assign opnet_55 = obb1_Point1_y - (obb2_pos_y >>> 2);
logic signed [23 : 0] Point1_1_u;
logic signed [23 : 0] Point1_1_v;
logic signed [36 : 0] opnet_56;
assign opnet_56 = opnet_54 * obb2_u_x;
logic signed [36 : 0] opnet_57;
assign opnet_57 = opnet_55 * obb2_u_y;
logic signed [22 : 0] opnet_58;
assign opnet_58 = opnet_56[36:13] + opnet_57[36:13];
assign Point1_1_u = opnet_58 << 1;
logic signed [36 : 0] opnet_59;
assign opnet_59 = opnet_54 * obb2_v_x;
logic signed [36 : 0] opnet_60;
assign opnet_60 = opnet_55 * obb2_v_y;
logic signed [22 : 0] opnet_61;
assign opnet_61 = opnet_59[36:13] + opnet_60[36:13];
assign Point1_1_v = opnet_61 << 1;
logic signed [21 : 0] opnet_62;
assign opnet_62 = obb1_Point2_x - (obb2_pos_x >>> 2);
logic signed [21 : 0] opnet_63;
assign opnet_63 = obb1_Point2_y - (obb2_pos_y >>> 2);
logic signed [23 : 0] Point1_2_u;
logic signed [23 : 0] Point1_2_v;
logic signed [36 : 0] opnet_64;
assign opnet_64 = opnet_62 * obb2_u_x;
logic signed [36 : 0] opnet_65;
assign opnet_65 = opnet_63 * obb2_u_y;
logic signed [22 : 0] opnet_66;
assign opnet_66 = opnet_64[36:13] + opnet_65[36:13];
assign Point1_2_u = opnet_66 << 1;
logic signed [36 : 0] opnet_67;
assign opnet_67 = opnet_62 * obb2_v_x;
logic signed [36 : 0] opnet_68;
assign opnet_68 = opnet_63 * obb2_v_y;
logic signed [22 : 0] opnet_69;
assign opnet_69 = opnet_67[36:13] + opnet_68[36:13];
assign Point1_2_v = opnet_69 << 1;
logic signed [21 : 0] opnet_70;
assign opnet_70 = obb1_Point3_x - (obb2_pos_x >>> 2);
logic signed [21 : 0] opnet_71;
assign opnet_71 = obb1_Point3_y - (obb2_pos_y >>> 2);
logic signed [23 : 0] Point1_3_u;
logic signed [23 : 0] Point1_3_v;
logic signed [36 : 0] opnet_72;
assign opnet_72 = opnet_70 * obb2_u_x;
logic signed [36 : 0] opnet_73;
assign opnet_73 = opnet_71 * obb2_u_y;
logic signed [22 : 0] opnet_74;
assign opnet_74 = opnet_72[36:13] + opnet_73[36:13];
assign Point1_3_u = opnet_74 << 1;
logic signed [36 : 0] opnet_75;
assign opnet_75 = opnet_70 * obb2_v_x;
logic signed [36 : 0] opnet_76;
assign opnet_76 = opnet_71 * obb2_v_y;
logic signed [22 : 0] opnet_77;
assign opnet_77 = opnet_75[36:13] + opnet_76[36:13];
assign Point1_3_v = opnet_77 << 1;


// Find max u and v values for rect A
logic signed [23:0] max_uA;
logic signed [23:0] max_uA_01;    // Max of points 0 and 1
logic signed [23:0] max_uA_23;    // Max of points 2 and 3

logic signed [23:0] max_vA;
logic signed [23:0] max_vA_01;    // Max of points 0 and 1
logic signed [23:0] max_vA_23;    // Max of points 2 and 3

// Also record xy coordinate point corresponding to min values
logic signed [21 : 0] point_max_uA_x;
logic signed [21 : 0] point_max_uA_y;
logic signed [21 : 0] point_max_uA_01_x;
logic signed [21 : 0] point_max_uA_01_y;
logic signed [21 : 0] point_max_uA_23_x;
logic signed [21 : 0] point_max_uA_23_y;
logic signed [21 : 0] point_max_vA_x;
logic signed [21 : 0] point_max_vA_y;
logic signed [21 : 0] point_max_vA_01_x;
logic signed [21 : 0] point_max_vA_01_y;
logic signed [21 : 0] point_max_vA_23_x;
logic signed [21 : 0] point_max_vA_23_y;

always_comb begin

// max u
max_uA_01 = Point1_0_u;
point_max_uA_01_x = obb1_Point0_x;
point_max_uA_01_y = obb1_Point0_y;
if (Point1_1_u > Point1_0_u) begin
    max_uA_01 = Point1_1_u;
point_max_uA_01_x = obb1_Point1_x;
point_max_uA_01_y = obb1_Point1_y;
end

max_uA_23 = Point1_2_u;
point_max_uA_23_x = obb1_Point2_x;
point_max_uA_23_y = obb1_Point2_y;
if (Point1_3_u > Point1_2_u) begin
    max_uA_23 = Point1_3_u;
point_max_uA_23_x = obb1_Point3_x;
point_max_uA_23_y = obb1_Point3_y;
end

max_uA = max_uA_01;
point_max_uA_x = point_max_uA_01_x;
point_max_uA_y = point_max_uA_01_y;
if (max_uA_23 > max_uA_01) begin
    max_uA = max_uA_23;
point_max_uA_x = point_max_uA_23_x;
point_max_uA_y = point_max_uA_23_y;
end

// max v
max_vA_01 = Point1_0_v;
point_max_vA_01_x = obb1_Point0_x;
point_max_vA_01_y = obb1_Point0_y;
if (Point1_1_v > Point1_0_v) begin
    max_vA_01 = Point1_1_v;
point_max_vA_01_x = obb1_Point1_x;
point_max_vA_01_y = obb1_Point1_y;
end

max_vA_23 = Point1_2_v;
point_max_vA_23_x = obb1_Point2_x;
point_max_vA_23_y = obb1_Point2_y;
if (Point1_3_v > Point1_2_v) begin
    max_vA_23 = Point1_3_v;
point_max_vA_23_x = obb1_Point3_x;
point_max_vA_23_y = obb1_Point3_y;
end

max_vA = max_vA_01;
point_max_vA_x = point_max_vA_01_x;
point_max_vA_y = point_max_vA_01_y;
if (max_vA_23 > max_vA_01) begin
    max_vA = max_vA_23;
point_max_vA_x = point_max_vA_23_x;
point_max_vA_y = point_max_vA_23_y;
end

end

// Find min u and v values for rect A
logic signed [23:0] min_uA;
logic signed [23:0] min_uA_01;    // Min of points 0 and 1
logic signed [23:0] min_uA_23;    // Min of points 2 and 3

logic signed [23:0] min_vA;
logic signed [23:0] min_vA_01;    // Min of points 0 and 1
logic signed [23:0] min_vA_23;    // Min of points 2 and 3

// Also record xy coordinate point corresponding to min values
logic signed [21 : 0] point_min_uA_x;
logic signed [21 : 0] point_min_uA_y;
logic signed [21 : 0] point_min_uA_01_x;
logic signed [21 : 0] point_min_uA_01_y;
logic signed [21 : 0] point_min_uA_23_x;
logic signed [21 : 0] point_min_uA_23_y;
logic signed [21 : 0] point_min_vA_x;
logic signed [21 : 0] point_min_vA_y;
logic signed [21 : 0] point_min_vA_01_x;
logic signed [21 : 0] point_min_vA_01_y;
logic signed [21 : 0] point_min_vA_23_x;
logic signed [21 : 0] point_min_vA_23_y;

always_comb begin

// Min u
min_uA_01 = Point1_0_u;
point_min_uA_01_x = obb1_Point0_x;
point_min_uA_01_y = obb1_Point0_y;
if (Point1_1_u < Point1_0_u) begin
    min_uA_01 = Point1_1_u;
point_min_uA_01_x = obb1_Point1_x;
point_min_uA_01_y = obb1_Point1_y;
end

min_uA_23 = Point1_2_u;
point_min_uA_23_x = obb1_Point2_x;
point_min_uA_23_y = obb1_Point2_y;
if (Point1_3_u < Point1_2_u) begin
    min_uA_23 = Point1_3_u;
point_min_uA_23_x = obb1_Point3_x;
point_min_uA_23_y = obb1_Point3_y;
end

min_uA = min_uA_01;
point_min_uA_x = point_min_uA_01_x;
point_min_uA_y = point_min_uA_01_y;
if (min_uA_23 < min_uA_01) begin
    min_uA = min_uA_23;
point_min_uA_x = point_min_uA_23_x;
point_min_uA_y = point_min_uA_23_y;
end

// Min v
min_vA_01 = Point1_0_v;
point_min_vA_01_x = obb1_Point0_x;
point_min_vA_01_y = obb1_Point0_y;
if (Point1_1_v < Point1_0_v) begin
    min_vA_01 = Point1_1_v;
point_min_vA_01_x = obb1_Point1_x;
point_min_vA_01_y = obb1_Point1_y;
end

min_vA_23 = Point1_2_v;
point_min_vA_23_x = obb1_Point2_x;
point_min_vA_23_y = obb1_Point2_y;
if (Point1_3_v < Point1_2_v) begin
    min_vA_23 = Point1_3_v;
point_min_vA_23_x = obb1_Point3_x;
point_min_vA_23_y = obb1_Point3_y;
end

min_vA = min_vA_01;
point_min_vA_x = point_min_vA_01_x;
point_min_vA_y = point_min_vA_01_y;
if (min_vA_23 < min_vA_01) begin
    min_vA = min_vA_23;
point_min_vA_x = point_min_vA_23_x;
point_min_vA_y = point_min_vA_23_y;
end

end

// Need to cast width and height of B into same Fixed structure as u and v
logic signed [23 : 0] widthB_fixed;
assign widthB_fixed = obb2_halfWidth << 16;
logic signed [23 : 0] heightB_fixed;
assign heightB_fixed = obb2_halfHeight << 16;

// Find penetration values for each axis

logic signed [23:0] pen_min_uA;
logic signed [23:0] pen_max_uA;
logic signed [23:0] pen_min_vA;
logic signed [23:0] pen_max_vA;

always_comb begin
    pen_min_uA = widthB_fixed - min_uA;
    pen_max_uA = max_uA + widthB_fixed;
    pen_min_vA = heightB_fixed - min_vA;
    pen_max_vA = max_vA + heightB_fixed;
end

//// TEST 2: B onto A

// Project points of B onto axes of A
logic signed [21 : 0] opnet_78;
assign opnet_78 = obb2_Point0_x - (obb1_pos_x >>> 2);
logic signed [21 : 0] opnet_79;
assign opnet_79 = obb2_Point0_y - (obb1_pos_y >>> 2);
logic signed [23 : 0] Point2_0_u;
logic signed [23 : 0] Point2_0_v;
logic signed [36 : 0] opnet_80;
assign opnet_80 = opnet_78 * obb1_u_x;
logic signed [36 : 0] opnet_81;
assign opnet_81 = opnet_79 * obb1_u_y;
logic signed [22 : 0] opnet_82;
assign opnet_82 = opnet_80[36:13] + opnet_81[36:13];
assign Point2_0_u = opnet_82 << 1;
logic signed [36 : 0] opnet_83;
assign opnet_83 = opnet_78 * obb1_v_x;
logic signed [36 : 0] opnet_84;
assign opnet_84 = opnet_79 * obb1_v_y;
logic signed [22 : 0] opnet_85;
assign opnet_85 = opnet_83[36:13] + opnet_84[36:13];
assign Point2_0_v = opnet_85 << 1;
logic signed [21 : 0] opnet_86;
assign opnet_86 = obb2_Point1_x - (obb1_pos_x >>> 2);
logic signed [21 : 0] opnet_87;
assign opnet_87 = obb2_Point1_y - (obb1_pos_y >>> 2);
logic signed [23 : 0] Point2_1_u;
logic signed [23 : 0] Point2_1_v;
logic signed [36 : 0] opnet_88;
assign opnet_88 = opnet_86 * obb1_u_x;
logic signed [36 : 0] opnet_89;
assign opnet_89 = opnet_87 * obb1_u_y;
logic signed [22 : 0] opnet_90;
assign opnet_90 = opnet_88[36:13] + opnet_89[36:13];
assign Point2_1_u = opnet_90 << 1;
logic signed [36 : 0] opnet_91;
assign opnet_91 = opnet_86 * obb1_v_x;
logic signed [36 : 0] opnet_92;
assign opnet_92 = opnet_87 * obb1_v_y;
logic signed [22 : 0] opnet_93;
assign opnet_93 = opnet_91[36:13] + opnet_92[36:13];
assign Point2_1_v = opnet_93 << 1;
logic signed [21 : 0] opnet_94;
assign opnet_94 = obb2_Point2_x - (obb1_pos_x >>> 2);
logic signed [21 : 0] opnet_95;
assign opnet_95 = obb2_Point2_y - (obb1_pos_y >>> 2);
logic signed [23 : 0] Point2_2_u;
logic signed [23 : 0] Point2_2_v;
logic signed [36 : 0] opnet_96;
assign opnet_96 = opnet_94 * obb1_u_x;
logic signed [36 : 0] opnet_97;
assign opnet_97 = opnet_95 * obb1_u_y;
logic signed [22 : 0] opnet_98;
assign opnet_98 = opnet_96[36:13] + opnet_97[36:13];
assign Point2_2_u = opnet_98 << 1;
logic signed [36 : 0] opnet_99;
assign opnet_99 = opnet_94 * obb1_v_x;
logic signed [36 : 0] opnet_100;
assign opnet_100 = opnet_95 * obb1_v_y;
logic signed [22 : 0] opnet_101;
assign opnet_101 = opnet_99[36:13] + opnet_100[36:13];
assign Point2_2_v = opnet_101 << 1;
logic signed [21 : 0] opnet_102;
assign opnet_102 = obb2_Point3_x - (obb1_pos_x >>> 2);
logic signed [21 : 0] opnet_103;
assign opnet_103 = obb2_Point3_y - (obb1_pos_y >>> 2);
logic signed [23 : 0] Point2_3_u;
logic signed [23 : 0] Point2_3_v;
logic signed [36 : 0] opnet_104;
assign opnet_104 = opnet_102 * obb1_u_x;
logic signed [36 : 0] opnet_105;
assign opnet_105 = opnet_103 * obb1_u_y;
logic signed [22 : 0] opnet_106;
assign opnet_106 = opnet_104[36:13] + opnet_105[36:13];
assign Point2_3_u = opnet_106 << 1;
logic signed [36 : 0] opnet_107;
assign opnet_107 = opnet_102 * obb1_v_x;
logic signed [36 : 0] opnet_108;
assign opnet_108 = opnet_103 * obb1_v_y;
logic signed [22 : 0] opnet_109;
assign opnet_109 = opnet_107[36:13] + opnet_108[36:13];
assign Point2_3_v = opnet_109 << 1;


// Find max u and v values for rect B
logic signed [23:0] max_uB;
logic signed [23:0] max_uB_01;    // Max of points 0 and 1
logic signed [23:0] max_uB_23;    // Max of points 2 and 3

logic signed [23:0] max_vB;
logic signed [23:0] max_vB_01;    // Max of points 0 and 1
logic signed [23:0] max_vB_23;    // Max of points 2 and 3

// Also record xy coordinate point corresponding to min values
logic signed [21 : 0] point_max_uB_x;
logic signed [21 : 0] point_max_uB_y;
logic signed [21 : 0] point_max_uB_01_x;
logic signed [21 : 0] point_max_uB_01_y;
logic signed [21 : 0] point_max_uB_23_x;
logic signed [21 : 0] point_max_uB_23_y;
logic signed [21 : 0] point_max_vB_x;
logic signed [21 : 0] point_max_vB_y;
logic signed [21 : 0] point_max_vB_01_x;
logic signed [21 : 0] point_max_vB_01_y;
logic signed [21 : 0] point_max_vB_23_x;
logic signed [21 : 0] point_max_vB_23_y;

always_comb begin

// max u
max_uB_01 = Point2_0_u;
point_max_uB_01_x = obb2_Point0_x;
point_max_uB_01_y = obb2_Point0_y;
if (Point2_1_u > Point2_0_u) begin
    max_uB_01 = Point2_1_u;
point_max_uB_01_x = obb2_Point1_x;
point_max_uB_01_y = obb2_Point1_y;
end

max_uB_23 = Point2_2_u;
point_max_uB_23_x = obb2_Point2_x;
point_max_uB_23_y = obb2_Point2_y;
if (Point2_3_u > Point2_2_u) begin
    max_uB_23 = Point2_3_u;
point_max_uB_23_x = obb2_Point3_x;
point_max_uB_23_y = obb2_Point3_y;
end

max_uB = max_uB_01;
point_max_uB_x = point_max_uB_01_x;
point_max_uB_y = point_max_uB_01_y;
if (max_uB_23 > max_uB_01) begin
    max_uB = max_uB_23;
point_max_uB_x = point_max_uB_23_x;
point_max_uB_y = point_max_uB_23_y;
end

// max v
max_vB_01 = Point2_0_v;
point_max_vB_01_x = obb2_Point0_x;
point_max_vB_01_y = obb2_Point0_y;
if (Point2_1_v > Point2_0_v) begin
    max_vB_01 = Point2_1_v;
point_max_vB_01_x = obb2_Point1_x;
point_max_vB_01_y = obb2_Point1_y;
end

max_vB_23 = Point2_2_v;
point_max_vB_23_x = obb2_Point2_x;
point_max_vB_23_y = obb2_Point2_y;
if (Point2_3_v > Point2_2_v) begin
    max_vB_23 = Point2_3_v;
point_max_vB_23_x = obb2_Point3_x;
point_max_vB_23_y = obb2_Point3_y;
end

max_vB = max_vB_01;
point_max_vB_x = point_max_vB_01_x;
point_max_vB_y = point_max_vB_01_y;
if (max_vB_23 > max_vB_01) begin
    max_vB = max_vB_23;
point_max_vB_x = point_max_vB_23_x;
point_max_vB_y = point_max_vB_23_y;
end

end

// Find min u and v values for rect B
logic signed [23:0] min_uB;
logic signed [23:0] min_uB_01;    // Min of points 0 and 1
logic signed [23:0] min_uB_23;    // Min of points 2 and 3

logic signed [23:0] min_vB;
logic signed [23:0] min_vB_01;    // Min of points 0 and 1
logic signed [23:0] min_vB_23;    // Min of points 2 and 3

// Also record xy coordinate point corresponding to min values
logic signed [21 : 0] point_min_uB_x;
logic signed [21 : 0] point_min_uB_y;
logic signed [21 : 0] point_min_uB_01_x;
logic signed [21 : 0] point_min_uB_01_y;
logic signed [21 : 0] point_min_uB_23_x;
logic signed [21 : 0] point_min_uB_23_y;
logic signed [21 : 0] point_min_vB_x;
logic signed [21 : 0] point_min_vB_y;
logic signed [21 : 0] point_min_vB_01_x;
logic signed [21 : 0] point_min_vB_01_y;
logic signed [21 : 0] point_min_vB_23_x;
logic signed [21 : 0] point_min_vB_23_y;

always_comb begin

// Min u
min_uB_01 = Point2_0_u;
point_min_uB_01_x = obb2_Point0_x;
point_min_uB_01_y = obb2_Point0_y;
if (Point2_1_u < Point2_0_u) begin
    min_uB_01 = Point2_1_u;
point_min_uB_01_x = obb2_Point1_x;
point_min_uB_01_y = obb2_Point1_y;
end

min_uB_23 = Point2_2_u;
point_min_uB_23_x = obb2_Point2_x;
point_min_uB_23_y = obb2_Point2_y;
if (Point2_3_u < Point2_2_u) begin
    min_uB_23 = Point2_3_u;
point_min_uB_23_x = obb2_Point3_x;
point_min_uB_23_y = obb2_Point3_y;
end

min_uB = min_uB_01;
point_min_uB_x = point_min_uB_01_x;
point_min_uB_y = point_min_uB_01_y;
if (min_uB_23 < min_uB_01) begin
    min_uB = min_uB_23;
point_min_uB_x = point_min_uB_23_x;
point_min_uB_y = point_min_uB_23_y;
end

// Min v
min_vB_01 = Point2_0_v;
point_min_vB_01_x = obb2_Point0_x;
point_min_vB_01_y = obb2_Point0_y;
if (Point2_1_v < Point2_0_v) begin
    min_vB_01 = Point2_1_v;
point_min_vB_01_x = obb2_Point1_x;
point_min_vB_01_y = obb2_Point1_y;
end

min_vB_23 = Point2_2_v;
point_min_vB_23_x = obb2_Point2_x;
point_min_vB_23_y = obb2_Point2_y;
if (Point2_3_v < Point2_2_v) begin
    min_vB_23 = Point2_3_v;
point_min_vB_23_x = obb2_Point3_x;
point_min_vB_23_y = obb2_Point3_y;
end

min_vB = min_vB_01;
point_min_vB_x = point_min_vB_01_x;
point_min_vB_y = point_min_vB_01_y;
if (min_vB_23 < min_vB_01) begin
    min_vB = min_vB_23;
point_min_vB_x = point_min_vB_23_x;
point_min_vB_y = point_min_vB_23_y;
end

end

// Need to cast width and height of A into same Fixed structure as u and v
logic signed [23 : 0] widthA_fixed;
assign widthA_fixed = obb1_halfWidth << 16;
logic signed [23 : 0] heightA_fixed;
assign heightA_fixed = obb1_halfHeight << 16;

// Find penetration values for each axis

logic signed [23:0] pen_min_uB;
logic signed [23:0] pen_max_uB;
logic signed [23:0] pen_min_vB;
logic signed [23:0] pen_max_vB;

always_comb begin
    pen_min_uB = widthA_fixed - min_uB;
    pen_max_uB = max_uB + widthA_fixed;
    pen_min_vB = heightA_fixed - min_vB;
    pen_max_vB = max_vB + heightA_fixed;
end

////// TYING IT ALL TOGETHER

// Find minimum penetration

// Penetration value intermediaries
logic signed [23:0] min_pen_uA;
logic signed [23:0] min_pen_vA;
logic signed [23:0] min_pen_uB;
logic signed [23:0] min_pen_vB;

logic signed [23:0] min_pen_u;
logic signed [23:0] min_pen_v;

logic signed [23:0] min_pen;

// Normal value intermediaries and contact point intermediaries
logic signed [15 : 0] normal_uA_x;
logic signed [15 : 0] normal_uA_y;
logic signed [15 : 0] normal_vA_x;
logic signed [15 : 0] normal_vA_y;
logic signed [15 : 0] normal_uB_x;
logic signed [15 : 0] normal_uB_y;
logic signed [15 : 0] normal_vB_x;
logic signed [15 : 0] normal_vB_y;
logic signed [15 : 0] normal_u_x;
logic signed [15 : 0] normal_u_y;
logic signed [15 : 0] normal_v_x;
logic signed [15 : 0] normal_v_y;
logic signed [21 : 0] location_uA_x;
logic signed [21 : 0] location_uA_y;
logic signed [21 : 0] location_vA_x;
logic signed [21 : 0] location_vA_y;
logic signed [21 : 0] location_uB_x;
logic signed [21 : 0] location_uB_y;
logic signed [21 : 0] location_vB_x;
logic signed [21 : 0] location_vB_y;
logic signed [21 : 0] location_u_x;
logic signed [21 : 0] location_u_y;
logic signed [21 : 0] location_v_x;
logic signed [21 : 0] location_v_y;

// Notes on confusing naming here:
//  - min_pen_<> is the minimum penetration value found
//  - pen_min or pen_max corresponds to the penetration value from the min or max u/v values
always_comb begin

// First pass
min_pen_uA = pen_min_uA;
opnet_110 = ~(obb2_u_x) + 1'b1;

opnet_111 = ~(obb2_u_y) + 1'b1;

normal_uA_x = opnet_110;
normal_uA_y = opnet_111;
location_uA_x = point_min_uA_x;
location_uA_y = point_min_uA_y;
if (pen_max_uA < pen_min_uA) begin
    min_pen_uA = pen_max_uA;
normal_uA_x = obb2_u_x;
normal_uA_y = obb2_u_y;
location_uA_x = point_max_uA_x;
location_uA_y = point_max_uA_y;
end

min_pen_vA = pen_min_vA;
opnet_112 = ~(obb2_v_x) + 1'b1;

opnet_113 = ~(obb2_v_y) + 1'b1;

normal_vA_x = opnet_112;
normal_vA_y = opnet_113;
location_vA_x = point_min_vA_x;
location_vA_y = point_min_vA_y;
if (pen_max_vA < pen_min_vA) begin
    min_pen_vA = pen_max_vA;
normal_vA_x = obb2_v_x;
normal_vA_y = obb2_v_y;
location_vA_x = point_max_vA_x;
location_vA_y = point_max_vA_y;
end

min_pen_uB = pen_min_uB;
opnet_114 = ~(obb1_u_x) + 1'b1;

opnet_115 = ~(obb1_u_y) + 1'b1;

normal_uB_x = opnet_114;
normal_uB_y = opnet_115;
location_uB_x = point_min_uB_x;
location_uB_y = point_min_uB_y;
if (pen_max_uB < pen_min_uB) begin
    min_pen_uB = pen_max_uB;
normal_uB_x = obb1_u_x;
normal_uB_y = obb1_u_y;
location_uB_x = point_max_uB_x;
location_uB_y = point_max_uB_y;
end

min_pen_vB = pen_min_vB;
opnet_116 = ~(obb1_v_x) + 1'b1;

opnet_117 = ~(obb1_v_y) + 1'b1;

normal_vB_x = opnet_116;
normal_vB_y = opnet_117;
location_vB_x = point_min_vB_x;
location_vB_y = point_min_vB_y;
if (pen_max_vB < pen_min_vB) begin
    min_pen_vB = pen_max_vB;
normal_v_x = obb1_v_x;
normal_v_y = obb1_v_y;
location_vB_x = point_max_vB_x;
location_vB_y = point_max_vB_y;
end

// Second pass
min_pen_u = min_pen_uA;
normal_u_x = normal_uA_x;
normal_u_y = normal_uA_y;
location_u_x = location_uA_x;
location_u_y = location_uA_y;
if (min_pen_uB < min_pen_uA) begin
    min_pen_u = min_pen_uB;
normal_u_x = normal_uB_x;
normal_u_y = normal_uB_y;
location_u_x = location_uB_x;
location_u_y = location_uB_y;
end

min_pen_v = min_pen_vA;
normal_v_x = normal_vA_x;
normal_v_y = normal_vA_y;
location_v_x = location_vA_x;
location_v_y = location_vA_y;
if (min_pen_vB < min_pen_vA) begin
    min_pen_v = min_pen_vB;
normal_v_x = normal_vB_x;
normal_v_y = normal_vB_y;
location_v_x = location_vB_x;
location_v_y = location_vB_y;
end

// Final pass
min_pen = min_pen_u;
normal_x = normal_u_x;
normal_y = normal_u_y;
location_x = location_u_x;
location_y = location_u_y;
if (min_pen_v < min_pen_u) begin
    min_pen = min_pen_v;
normal_x = normal_v_x;
normal_y = normal_v_y;
location_x = location_v_x;
location_y = location_v_y;
end

penetration = min_pen;

end
logic signed [15 : 0] opnet_110;
logic signed [15 : 0] opnet_111;
logic signed [15 : 0] opnet_112;
logic signed [15 : 0] opnet_113;
logic signed [15 : 0] opnet_114;
logic signed [15 : 0] opnet_115;
logic signed [15 : 0] opnet_116;
logic signed [15 : 0] opnet_117;

// If any penetration is negative, there is no collision
assign is_collision = ~min_pen[23];
endmodule