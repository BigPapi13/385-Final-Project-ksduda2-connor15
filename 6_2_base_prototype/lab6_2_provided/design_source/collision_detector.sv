

module collision_detector(
    input logic signed [7 : 0] obb1_width,
input logic signed [7 : 0] obb1_height,
input logic signed [31 : 0] obb1_pos_x, input logic signed [31 : 0] obb1_pos_y,
input logic signed [31 : 0] obb1_vel_x, input logic signed [31 : 0] obb1_vel_y,
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
    input logic signed [7 : 0] obb2_width,
input logic signed [7 : 0] obb2_height,
input logic signed [31 : 0] obb2_pos_x, input logic signed [31 : 0] obb2_pos_y,
input logic signed [31 : 0] obb2_vel_x, input logic signed [31 : 0] obb2_vel_y,
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
    output logic is_collision
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
logic signed [21 : 0] opnet_1;
assign opnet_1 = obb1_Point0_x - (obb2_pos_x >>> 10);
logic signed [21 : 0] opnet_2;
assign opnet_2 = obb1_Point0_y - (obb2_pos_y >>> 10);
logic signed [31 : 0] Point1_0_u;
logic signed [31 : 0] Point1_0_v;
logic signed [37 : 0] opnet_3;
assign opnet_3 = opnet_1 * obb2_u_x;
logic signed [37 : 0] opnet_4;
assign opnet_4 = opnet_2 * obb2_u_y;
logic signed [37 : 0] opnet_5;
assign opnet_5 = opnet_3 + opnet_4;
assign Point1_0_u = opnet_5 >>> 4;
logic signed [37 : 0] opnet_6;
assign opnet_6 = opnet_1 * obb2_v_x;
logic signed [37 : 0] opnet_7;
assign opnet_7 = opnet_2 * obb2_v_y;
logic signed [37 : 0] opnet_8;
assign opnet_8 = opnet_6 + opnet_7;
assign Point1_0_v = opnet_8 >>> 4;
logic signed [21 : 0] opnet_9;
assign opnet_9 = obb1_Point1_x - (obb2_pos_x >>> 10);
logic signed [21 : 0] opnet_10;
assign opnet_10 = obb1_Point1_y - (obb2_pos_y >>> 10);
logic signed [31 : 0] Point1_1_u;
logic signed [31 : 0] Point1_1_v;
logic signed [37 : 0] opnet_11;
assign opnet_11 = opnet_9 * obb2_u_x;
logic signed [37 : 0] opnet_12;
assign opnet_12 = opnet_10 * obb2_u_y;
logic signed [37 : 0] opnet_13;
assign opnet_13 = opnet_11 + opnet_12;
assign Point1_1_u = opnet_13 >>> 4;
logic signed [37 : 0] opnet_14;
assign opnet_14 = opnet_9 * obb2_v_x;
logic signed [37 : 0] opnet_15;
assign opnet_15 = opnet_10 * obb2_v_y;
logic signed [37 : 0] opnet_16;
assign opnet_16 = opnet_14 + opnet_15;
assign Point1_1_v = opnet_16 >>> 4;
logic signed [21 : 0] opnet_17;
assign opnet_17 = obb1_Point2_x - (obb2_pos_x >>> 10);
logic signed [21 : 0] opnet_18;
assign opnet_18 = obb1_Point2_y - (obb2_pos_y >>> 10);
logic signed [31 : 0] Point1_2_u;
logic signed [31 : 0] Point1_2_v;
logic signed [37 : 0] opnet_19;
assign opnet_19 = opnet_17 * obb2_u_x;
logic signed [37 : 0] opnet_20;
assign opnet_20 = opnet_18 * obb2_u_y;
logic signed [37 : 0] opnet_21;
assign opnet_21 = opnet_19 + opnet_20;
assign Point1_2_u = opnet_21 >>> 4;
logic signed [37 : 0] opnet_22;
assign opnet_22 = opnet_17 * obb2_v_x;
logic signed [37 : 0] opnet_23;
assign opnet_23 = opnet_18 * obb2_v_y;
logic signed [37 : 0] opnet_24;
assign opnet_24 = opnet_22 + opnet_23;
assign Point1_2_v = opnet_24 >>> 4;
logic signed [21 : 0] opnet_25;
assign opnet_25 = obb1_Point3_x - (obb2_pos_x >>> 10);
logic signed [21 : 0] opnet_26;
assign opnet_26 = obb1_Point3_y - (obb2_pos_y >>> 10);
logic signed [31 : 0] Point1_3_u;
logic signed [31 : 0] Point1_3_v;
logic signed [37 : 0] opnet_27;
assign opnet_27 = opnet_25 * obb2_u_x;
logic signed [37 : 0] opnet_28;
assign opnet_28 = opnet_26 * obb2_u_y;
logic signed [37 : 0] opnet_29;
assign opnet_29 = opnet_27 + opnet_28;
assign Point1_3_u = opnet_29 >>> 4;
logic signed [37 : 0] opnet_30;
assign opnet_30 = opnet_25 * obb2_v_x;
logic signed [37 : 0] opnet_31;
assign opnet_31 = opnet_26 * obb2_v_y;
logic signed [37 : 0] opnet_32;
assign opnet_32 = opnet_30 + opnet_31;
assign Point1_3_v = opnet_32 >>> 4;


// Find max u and v values for rect A
logic signed [31 : 0] max_uA;
logic signed [31 : 0] max_uA_01;    // Max of points 0 and 1
logic signed [31 : 0] max_uA_23;    // Max of points 2 and 3

logic signed [31 : 0] max_vA;
logic signed [31 : 0] max_vA_01;    // Max of points 0 and 1
logic signed [31 : 0] max_vA_23;    // Max of points 2 and 3

always_comb begin

// Max u
max_uA_01 = Point1_0_u;
if (Point1_1_u > Point1_0_u) begin
    max_uA_01 = Point1_1_u;
end

max_uA_23 = Point1_2_u;
if (Point1_3_u > Point1_2_u) begin
    max_uA_23 = Point1_3_u;
end

max_uA = max_uA_01;
if (max_uA_23 > max_uA_01) begin
    max_uA = max_uA_23;
end

// Max v
max_vA_01 = Point1_0_v;
if (Point1_1_v > Point1_0_v) begin
    max_vA_01 = Point1_1_v;
end

max_vA_23 = Point1_2_v;
if (Point1_3_v > Point1_2_v) begin
    max_vA_23 = Point1_3_v;
end

max_vA = max_vA_01;
if (max_vA_23 > max_vA_01) begin
    max_vA = max_vA_23;
end

end

// Find min u and v values for rect A
logic signed [31 : 0] min_uA;
logic signed [31 : 0] min_uA_01;    // Min of points 0 and 1
logic signed [31 : 0] min_uA_23;    // Min of points 2 and 3

logic signed [31 : 0] min_vA;
logic signed [31 : 0] min_vA_01;    // Min of points 0 and 1
logic signed [31 : 0] min_vA_23;    // Min of points 2 and 3

always_comb begin

// Min u
min_uA_01 = Point1_0_u;
if (Point1_1_u < Point1_0_u) begin
    min_uA_01 = Point1_1_u;
end

min_uA_23 = Point1_2_u;
if (Point1_3_u < Point1_2_u) begin
    min_uA_23 = Point1_3_u;
end

min_uA = min_uA_01;
if (min_uA_23 < min_uA_01) begin
    min_uA = min_uA_23;
end

// Min v
min_vA_01 = Point1_0_v;
if (Point1_1_v < Point1_0_v) begin
    min_vA_01 = Point1_1_v;
end

min_vA_23 = Point1_2_v;
if (Point1_3_v < Point1_2_v) begin
    min_vA_23 = Point1_3_v;
end

min_vA = min_vA_01;
if (min_vA_23 < min_vA_01) begin
    min_vA = min_vA_23;
end

end


// Check for separating axis
logic separate_min_uA;
logic separate_max_uA;
logic separate_min_vA;
logic separate_max_vA;

// Need to cast width and height of B into same Fixed structure as u and v
logic signed [31 : 0] widthB_fixed;
assign widthB_fixed = obb2_halfWidth << 24;
logic signed [31 : 0] heightB_fixed;
assign heightB_fixed = obb2_halfHeight << 24;

// Find penetration values for each axis

logic signed [31:0] pen_min_uA;
logic signed [31:0] pen_max_uA;
logic signed [31:0] pen_min_vA;
logic signed [31:0] pen_max_vA;

always_comb begin
    pen_min_uA = widthB_fixed - min_uA;
    pen_max_uA = max_uA + widthB_fixed;
    pen_min_vA = heightB_fixed - min_vA;
    pen_max_vA = max_vA + heightB_fixed;
end

// If the penetration is negative, then there's separation
assign separate_min_uA = pen_min_uA[31];
assign separate_max_uA = pen_max_uA[31];
assign separate_min_vA = pen_min_vA[31];
assign separate_max_vA = pen_max_vA[31];

//// TEST 2: B onto A

// Project points of B onto axes of A
logic signed [21 : 0] opnet_33;
assign opnet_33 = obb2_Point0_x - (obb1_pos_x >>> 10);
logic signed [21 : 0] opnet_34;
assign opnet_34 = obb2_Point0_y - (obb1_pos_y >>> 10);
logic signed [31 : 0] Point2_0_u;
logic signed [31 : 0] Point2_0_v;
logic signed [37 : 0] opnet_35;
assign opnet_35 = opnet_33 * obb1_u_x;
logic signed [37 : 0] opnet_36;
assign opnet_36 = opnet_34 * obb1_u_y;
logic signed [37 : 0] opnet_37;
assign opnet_37 = opnet_35 + opnet_36;
assign Point2_0_u = opnet_37 >>> 4;
logic signed [37 : 0] opnet_38;
assign opnet_38 = opnet_33 * obb1_v_x;
logic signed [37 : 0] opnet_39;
assign opnet_39 = opnet_34 * obb1_v_y;
logic signed [37 : 0] opnet_40;
assign opnet_40 = opnet_38 + opnet_39;
assign Point2_0_v = opnet_40 >>> 4;
logic signed [21 : 0] opnet_41;
assign opnet_41 = obb2_Point1_x - (obb1_pos_x >>> 10);
logic signed [21 : 0] opnet_42;
assign opnet_42 = obb2_Point1_y - (obb1_pos_y >>> 10);
logic signed [31 : 0] Point2_1_u;
logic signed [31 : 0] Point2_1_v;
logic signed [37 : 0] opnet_43;
assign opnet_43 = opnet_41 * obb1_u_x;
logic signed [37 : 0] opnet_44;
assign opnet_44 = opnet_42 * obb1_u_y;
logic signed [37 : 0] opnet_45;
assign opnet_45 = opnet_43 + opnet_44;
assign Point2_1_u = opnet_45 >>> 4;
logic signed [37 : 0] opnet_46;
assign opnet_46 = opnet_41 * obb1_v_x;
logic signed [37 : 0] opnet_47;
assign opnet_47 = opnet_42 * obb1_v_y;
logic signed [37 : 0] opnet_48;
assign opnet_48 = opnet_46 + opnet_47;
assign Point2_1_v = opnet_48 >>> 4;
logic signed [21 : 0] opnet_49;
assign opnet_49 = obb2_Point2_x - (obb1_pos_x >>> 10);
logic signed [21 : 0] opnet_50;
assign opnet_50 = obb2_Point2_y - (obb1_pos_y >>> 10);
logic signed [31 : 0] Point2_2_u;
logic signed [31 : 0] Point2_2_v;
logic signed [37 : 0] opnet_51;
assign opnet_51 = opnet_49 * obb1_u_x;
logic signed [37 : 0] opnet_52;
assign opnet_52 = opnet_50 * obb1_u_y;
logic signed [37 : 0] opnet_53;
assign opnet_53 = opnet_51 + opnet_52;
assign Point2_2_u = opnet_53 >>> 4;
logic signed [37 : 0] opnet_54;
assign opnet_54 = opnet_49 * obb1_v_x;
logic signed [37 : 0] opnet_55;
assign opnet_55 = opnet_50 * obb1_v_y;
logic signed [37 : 0] opnet_56;
assign opnet_56 = opnet_54 + opnet_55;
assign Point2_2_v = opnet_56 >>> 4;
logic signed [21 : 0] opnet_57;
assign opnet_57 = obb2_Point3_x - (obb1_pos_x >>> 10);
logic signed [21 : 0] opnet_58;
assign opnet_58 = obb2_Point3_y - (obb1_pos_y >>> 10);
logic signed [31 : 0] Point2_3_u;
logic signed [31 : 0] Point2_3_v;
logic signed [37 : 0] opnet_59;
assign opnet_59 = opnet_57 * obb1_u_x;
logic signed [37 : 0] opnet_60;
assign opnet_60 = opnet_58 * obb1_u_y;
logic signed [37 : 0] opnet_61;
assign opnet_61 = opnet_59 + opnet_60;
assign Point2_3_u = opnet_61 >>> 4;
logic signed [37 : 0] opnet_62;
assign opnet_62 = opnet_57 * obb1_v_x;
logic signed [37 : 0] opnet_63;
assign opnet_63 = opnet_58 * obb1_v_y;
logic signed [37 : 0] opnet_64;
assign opnet_64 = opnet_62 + opnet_63;
assign Point2_3_v = opnet_64 >>> 4;


// Find max u and v values for rect B
logic signed [31 : 0] max_uB;
logic signed [31 : 0] max_uB_01;    // Max of points 0 and 1
logic signed [31 : 0] max_uB_23;    // Max of points 2 and 3

logic signed [31 : 0] max_vB;
logic signed [31 : 0] max_vB_01;    // Max of points 0 and 1
logic signed [31 : 0] max_vB_23;    // Max of points 2 and 3

always_comb begin

// Max u
max_uB_01 = Point2_0_u;
if (Point2_1_u > Point2_0_u) begin
    max_uB_01 = Point2_1_u;
end

max_uB_23 = Point2_2_u;
if (Point2_3_u > Point2_2_u) begin
    max_uB_23 = Point2_3_u;
end

max_uB = max_uB_01;
if (max_uB_23 > max_uB_01) begin
    max_uB = max_uB_23;
end

// Max v
max_vB_01 = Point2_0_v;
if (Point2_1_v > Point2_0_v) begin
    max_vB_01 = Point2_1_v;
end

max_vB_23 = Point2_2_v;
if (Point2_3_v > Point2_2_v) begin
    max_vB_23 = Point2_3_v;
end

max_vB = max_vB_01;
if (max_vB_23 > max_vB_01) begin
    max_vB = max_vB_23;
end

end

// Find min u and v values for rect B
logic signed [31 : 0] min_uB;
logic signed [31 : 0] min_uB_01;    // Min of points 0 and 1
logic signed [31 : 0] min_uB_23;    // Min of points 2 and 3

logic signed [31 : 0] min_vB;
logic signed [31 : 0] min_vB_01;    // Min of points 0 and 1
logic signed [31 : 0] min_vB_23;    // Min of points 2 and 3

always_comb begin

// Min u
min_uB_01 = Point2_0_u;
if (Point2_1_u < Point2_0_u) begin
    min_uB_01 = Point2_1_u;
end

min_uB_23 = Point2_2_u;
if (Point2_3_u < Point2_2_u) begin
    min_uB_23 = Point2_3_u;
end

min_uB = min_uB_01;
if (min_uB_23 < min_uB_01) begin
    min_uB = min_uB_23;
end

// Min v
min_vB_01 = Point2_0_v;
if (Point2_1_v < Point2_0_v) begin
    min_vB_01 = Point2_1_v;
end

min_vB_23 = Point2_2_v;
if (Point2_3_v < Point2_2_v) begin
    min_vB_23 = Point2_3_v;
end

min_vB = min_vB_01;
if (min_vB_23 < min_vB_01) begin
    min_vB = min_vB_23;
end

end


// Check for separating axis
logic separate_min_uB;
logic separate_max_uB;
logic separate_min_vB;
logic separate_max_vB;

// Need to cast width and height of A into same Fixed structure as u and v
logic signed [31 : 0] widthA_fixed;
assign widthA_fixed = obb1_halfWidth << 24;
logic signed [31 : 0] heightA_fixed;
assign heightA_fixed = obb1_halfHeight << 24;

// Find penetration values for each axis

logic signed [31:0] pen_min_uB;
logic signed [31:0] pen_max_uB;
logic signed [31:0] pen_min_vB;
logic signed [31:0] pen_max_vB;

always_comb begin
    pen_min_uB = widthA_fixed - min_uB;
    pen_max_uB = max_uB + widthA_fixed;
    pen_min_vB = heightA_fixed - min_vB;
    pen_max_vB = max_vB + heightA_fixed;
end

// If the penetration is negative, then there's separation
assign separate_min_uB = pen_min_uB[31];
assign separate_max_uB = pen_max_uB[31];
assign separate_min_vB = pen_min_vB[31];
assign separate_max_vB = pen_max_vB[31];

////// TYING IT ALL TOGETHER

// Find minimum penetration

logic signed [31:0] min_pen_uA;
logic signed [31:0] min_pen_vA;
logic signed [31:0] min_pen_uB;
logic signed [31:0] min_pen_vB;

logic signed [31:0] min_pen_u;
logic signed [31:0] min_pen_v;

logic signed [31:0] min_pen;


// Notes on confusing naming here:
//  - min_pen_<> is the minimum penetration value found
//  - pen_min or pen_max corresponds to the penetration value from the min or max u/v values
always_comb begin

// First pass
min_pen_uA = pen_min_uA;
if (pen_max_uA < pen_min_uA) begin
    min_pen_uA = pen_max_uA;
end

min_pen_vA = pen_min_vA;
if (pen_max_vA < pen_min_vA) begin
    min_pen_vA = pen_max_vA;
end

min_pen_uB = pen_min_uB;
if (pen_max_uB < pen_min_uB) begin
    min_pen_uB = pen_max_uB;
end

min_pen_vB = pen_min_vB;
if (pen_max_vB < pen_min_vB) begin
    min_pen_vB = pen_max_vB;
end

// Second pass
min_pen_u = min_pen_uA;
if (min_pen_uB < min_pen_uA) begin
    min_pen_u = min_pen_uB;
end

min_pen_v = min_pen_vA;
if (min_pen_vB < min_pen_vA) begin
    min_pen_v = min_pen_vB;
end

// Final pass
min_pen = min_pen_u;
if (min_pen_v < min_pen_u) begin
    min_pen = min_pen_v;
end

end

/*
always_comb begin
is_collision = ~(separate_min_uA | separate_max_uA | separate_min_vA | separate_max_vA | separate_min_uB | separate_max_uB | separate_min_vB | separate_max_vB);
end
*/

// If any penetrations is negative, there is no collision
assign is_collision = ~min_pen[31];
endmodule