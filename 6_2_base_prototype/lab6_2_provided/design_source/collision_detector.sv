

module collision_detector(
    input logic signed [7 : 0] widthA,
    input logic signed [7 : 0] heightA,
    input logic signed [31 : 0] posA [1 : 0],
    input logic signed [31 : 0] velA [1 : 0],
    input logic signed [15 : 0] uA [1 : 0],
    input logic signed [15 : 0] vA [1 : 0],
    
    input logic signed [7 : 0] widthB,
    input logic signed [7 : 0] heightB,
    input logic signed [31 : 0] posB [1 : 0],
    input logic signed [31 : 0] velB [1 : 0],
    input logic signed [15 : 0] uB [1 : 0],
    input logic signed [15 : 0] vB [1 : 0],
    

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

// Get half width and height (this is just useful to have)
logic signed [6 : 0] halfWidthA;
logic signed [6 : 0] halfWidthB;
logic signed [6 : 0] halfHeightA;
logic signed [6 : 0] halfHeightB;

assign halfWidthA = widthA >> 1;
assign halfWidthB = widthB >> 1;
assign halfHeightA = heightA >> 1;
assign halfHeightB = heightB >> 1;


// Get points of A and B
//  - Need to rotate first, then subtract

logic signed [6 : 0] opnet_1;
assign opnet_1 = halfWidthA * 7'b1111111;
logic signed [6 : 0] opnet_2;
assign opnet_2 = halfHeightA * 7'b1111111;
logic signed [22 : 0] opnet_3;
assign opnet_3 = opnet_1 * uA[0];
logic signed [22 : 0] opnet_4;
assign opnet_4 = opnet_2 * vA[0];
logic signed [22 : 0] opnet_5;
assign opnet_5 = opnet_3 + opnet_4;
logic signed [22 : 0] opnet_6;
assign opnet_6 = opnet_1 * uA[1];
logic signed [22 : 0] opnet_7;
assign opnet_7 = opnet_2 * vA[1];
logic signed [22 : 0] opnet_8;
assign opnet_8 = opnet_6 + opnet_7;
logic signed [22 : 0] opnet_9;
assign opnet_9 = opnet_5 + posA[0][31 : 11];
logic signed [22 : 0] opnet_10;
assign opnet_10 = opnet_8 + posA[1][31 : 11];
logic signed [22 : 0] opnet_11;
assign opnet_11 = opnet_1 * uA[0];
logic signed [22 : 0] opnet_12;
assign opnet_12 = halfHeightA * vA[0];
logic signed [22 : 0] opnet_13;
assign opnet_13 = opnet_11 + opnet_12;
logic signed [22 : 0] opnet_14;
assign opnet_14 = opnet_1 * uA[1];
logic signed [22 : 0] opnet_15;
assign opnet_15 = halfHeightA * vA[1];
logic signed [22 : 0] opnet_16;
assign opnet_16 = opnet_14 + opnet_15;
logic signed [22 : 0] opnet_17;
assign opnet_17 = opnet_13 + posA[0][31 : 11];
logic signed [22 : 0] opnet_18;
assign opnet_18 = opnet_16 + posA[1][31 : 11];
logic signed [6 : 0] opnet_19;
assign opnet_19 = halfHeightA * 7'b1111111;
logic signed [22 : 0] opnet_20;
assign opnet_20 = halfWidthA * uA[0];
logic signed [22 : 0] opnet_21;
assign opnet_21 = opnet_19 * vA[0];
logic signed [22 : 0] opnet_22;
assign opnet_22 = opnet_20 + opnet_21;
logic signed [22 : 0] opnet_23;
assign opnet_23 = halfWidthA * uA[1];
logic signed [22 : 0] opnet_24;
assign opnet_24 = opnet_19 * vA[1];
logic signed [22 : 0] opnet_25;
assign opnet_25 = opnet_23 + opnet_24;
logic signed [22 : 0] opnet_26;
assign opnet_26 = opnet_22 + posA[0][31 : 11];
logic signed [22 : 0] opnet_27;
assign opnet_27 = opnet_25 + posA[1][31 : 11];
logic signed [22 : 0] opnet_28;
assign opnet_28 = halfWidthA * uA[0];
logic signed [22 : 0] opnet_29;
assign opnet_29 = halfHeightA * vA[0];
logic signed [22 : 0] opnet_30;
assign opnet_30 = opnet_28 + opnet_29;
logic signed [22 : 0] opnet_31;
assign opnet_31 = halfWidthA * uA[1];
logic signed [22 : 0] opnet_32;
assign opnet_32 = halfHeightA * vA[1];
logic signed [22 : 0] opnet_33;
assign opnet_33 = opnet_31 + opnet_32;
logic signed [22 : 0] opnet_34;
assign opnet_34 = opnet_30 + posA[0][31 : 11];
logic signed [22 : 0] opnet_35;
assign opnet_35 = opnet_33 + posA[1][31 : 11];
logic signed [6 : 0] opnet_36;
assign opnet_36 = halfWidthB * 7'b1111111;
logic signed [6 : 0] opnet_37;
assign opnet_37 = halfHeightB * 7'b1111111;
logic signed [22 : 0] opnet_38;
assign opnet_38 = opnet_36 * uB[0];
logic signed [22 : 0] opnet_39;
assign opnet_39 = opnet_37 * vB[0];
logic signed [22 : 0] opnet_40;
assign opnet_40 = opnet_38 + opnet_39;
logic signed [22 : 0] opnet_41;
assign opnet_41 = opnet_36 * uB[1];
logic signed [22 : 0] opnet_42;
assign opnet_42 = opnet_37 * vB[1];
logic signed [22 : 0] opnet_43;
assign opnet_43 = opnet_41 + opnet_42;
logic signed [22 : 0] opnet_44;
assign opnet_44 = opnet_40 + posB[0][31 : 11];
logic signed [22 : 0] opnet_45;
assign opnet_45 = opnet_43 + posB[1][31 : 11];
logic signed [22 : 0] opnet_46;
assign opnet_46 = opnet_36 * uB[0];
logic signed [22 : 0] opnet_47;
assign opnet_47 = halfHeightB * vB[0];
logic signed [22 : 0] opnet_48;
assign opnet_48 = opnet_46 + opnet_47;
logic signed [22 : 0] opnet_49;
assign opnet_49 = opnet_36 * uB[1];
logic signed [22 : 0] opnet_50;
assign opnet_50 = halfHeightB * vB[1];
logic signed [22 : 0] opnet_51;
assign opnet_51 = opnet_49 + opnet_50;
logic signed [22 : 0] opnet_52;
assign opnet_52 = opnet_48 + posB[0][31 : 11];
logic signed [22 : 0] opnet_53;
assign opnet_53 = opnet_51 + posB[1][31 : 11];
logic signed [6 : 0] opnet_54;
assign opnet_54 = halfHeightB * 7'b1111111;
logic signed [22 : 0] opnet_55;
assign opnet_55 = halfWidthB * uB[0];
logic signed [22 : 0] opnet_56;
assign opnet_56 = opnet_54 * vB[0];
logic signed [22 : 0] opnet_57;
assign opnet_57 = opnet_55 + opnet_56;
logic signed [22 : 0] opnet_58;
assign opnet_58 = halfWidthB * uB[1];
logic signed [22 : 0] opnet_59;
assign opnet_59 = opnet_54 * vB[1];
logic signed [22 : 0] opnet_60;
assign opnet_60 = opnet_58 + opnet_59;
logic signed [22 : 0] opnet_61;
assign opnet_61 = opnet_57 + posB[0][31 : 11];
logic signed [22 : 0] opnet_62;
assign opnet_62 = opnet_60 + posB[1][31 : 11];
logic signed [22 : 0] opnet_63;
assign opnet_63 = halfWidthB * uB[0];
logic signed [22 : 0] opnet_64;
assign opnet_64 = halfHeightB * vB[0];
logic signed [22 : 0] opnet_65;
assign opnet_65 = opnet_63 + opnet_64;
logic signed [22 : 0] opnet_66;
assign opnet_66 = halfWidthB * uB[1];
logic signed [22 : 0] opnet_67;
assign opnet_67 = halfHeightB * vB[1];
logic signed [22 : 0] opnet_68;
assign opnet_68 = opnet_66 + opnet_67;
logic signed [22 : 0] opnet_69;
assign opnet_69 = opnet_65 + posB[0][31 : 11];
logic signed [22 : 0] opnet_70;
assign opnet_70 = opnet_68 + posB[1][31 : 11];

//// TEST 1: A onto B

// Project points of A onto axes of B
logic signed [22 : 0] opnet_71;
assign opnet_71 = opnet_9 - posB[0][31 : 11];
logic signed [22 : 0] opnet_72;
assign opnet_72 = opnet_10 - posB[1][31 : 11];
logic signed [31 : 0] fixed_0;
logic signed [31 : 0] fixed_1;
logic signed [38 : 0] opnet_73;
assign opnet_73 = opnet_71 * uB[0];
logic signed [38 : 0] opnet_74;
assign opnet_74 = opnet_72 * uB[1];
logic signed [38 : 0] opnet_75;
assign opnet_75 = opnet_73 + opnet_74;
assign fixed_0 = opnet_75 >> 3;
logic signed [38 : 0] opnet_76;
assign opnet_76 = opnet_71 * vB[0];
logic signed [38 : 0] opnet_77;
assign opnet_77 = opnet_72 * vB[1];
logic signed [38 : 0] opnet_78;
assign opnet_78 = opnet_76 + opnet_77;
assign fixed_1 = opnet_78 >> 3;
logic signed [22 : 0] opnet_79;
assign opnet_79 = opnet_17 - posB[0][31 : 11];
logic signed [22 : 0] opnet_80;
assign opnet_80 = opnet_18 - posB[1][31 : 11];
logic signed [31 : 0] fixed_2;
logic signed [31 : 0] fixed_3;
logic signed [38 : 0] opnet_81;
assign opnet_81 = opnet_79 * uB[0];
logic signed [38 : 0] opnet_82;
assign opnet_82 = opnet_80 * uB[1];
logic signed [38 : 0] opnet_83;
assign opnet_83 = opnet_81 + opnet_82;
assign fixed_2 = opnet_83 >> 3;
logic signed [38 : 0] opnet_84;
assign opnet_84 = opnet_79 * vB[0];
logic signed [38 : 0] opnet_85;
assign opnet_85 = opnet_80 * vB[1];
logic signed [38 : 0] opnet_86;
assign opnet_86 = opnet_84 + opnet_85;
assign fixed_3 = opnet_86 >> 3;
logic signed [22 : 0] opnet_87;
assign opnet_87 = opnet_26 - posB[0][31 : 11];
logic signed [22 : 0] opnet_88;
assign opnet_88 = opnet_27 - posB[1][31 : 11];
logic signed [31 : 0] fixed_4;
logic signed [31 : 0] fixed_5;
logic signed [38 : 0] opnet_89;
assign opnet_89 = opnet_87 * uB[0];
logic signed [38 : 0] opnet_90;
assign opnet_90 = opnet_88 * uB[1];
logic signed [38 : 0] opnet_91;
assign opnet_91 = opnet_89 + opnet_90;
assign fixed_4 = opnet_91 >> 3;
logic signed [38 : 0] opnet_92;
assign opnet_92 = opnet_87 * vB[0];
logic signed [38 : 0] opnet_93;
assign opnet_93 = opnet_88 * vB[1];
logic signed [38 : 0] opnet_94;
assign opnet_94 = opnet_92 + opnet_93;
assign fixed_5 = opnet_94 >> 3;
logic signed [22 : 0] opnet_95;
assign opnet_95 = opnet_34 - posB[0][31 : 11];
logic signed [22 : 0] opnet_96;
assign opnet_96 = opnet_35 - posB[1][31 : 11];
logic signed [31 : 0] fixed_6;
logic signed [31 : 0] fixed_7;
logic signed [38 : 0] opnet_97;
assign opnet_97 = opnet_95 * uB[0];
logic signed [38 : 0] opnet_98;
assign opnet_98 = opnet_96 * uB[1];
logic signed [38 : 0] opnet_99;
assign opnet_99 = opnet_97 + opnet_98;
assign fixed_6 = opnet_99 >> 3;
logic signed [38 : 0] opnet_100;
assign opnet_100 = opnet_95 * vB[0];
logic signed [38 : 0] opnet_101;
assign opnet_101 = opnet_96 * vB[1];
logic signed [38 : 0] opnet_102;
assign opnet_102 = opnet_100 + opnet_101;
assign fixed_7 = opnet_102 >> 3;


// Find max u and v values for rect A
logic signed [31 : 0] max_uA;
logic signed [31 : 0] max_uA_01;    // Max of points 0 and 1
logic signed [31 : 0] max_uA_23;    // Max of points 2 and 3

logic signed [31 : 0] max_vA;
logic signed [31 : 0] max_vA_01;    // Max of points 0 and 1
logic signed [31 : 0] max_vA_23;    // Max of points 2 and 3

always_comb begin

// Max u
max_uA_01 = fixed_0;
if (fixed_2 > fixed_0) begin
    max_uA_01 = fixed_2;
end

max_uA_23 = fixed_4;
if (fixed_6 > fixed_4) begin
    max_uA_01 = fixed_6;
end

max_uA = max_uA_01;
if (max_uA_23 > max_uA_01) begin
    max_uA = max_uA_23;
end

// Max v
max_vA_01 = fixed_1;
if (fixed_3 > fixed_1) begin
    max_vA_01 = fixed_3;
end

max_vA_23 = fixed_5;
if (fixed_7 > fixed_5) begin
    max_vA_01 = fixed_7;
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
min_uA_01 = fixed_0;
if (fixed_2 < fixed_0) begin
    min_uA_01 = fixed_2;
end

min_uA_23 = fixed_4;
if (fixed_6 < fixed_4) begin
    min_uA_01 = fixed_6;
end

min_uA = min_uA_01;
if (min_uA_23 < min_uA_01) begin
    min_uA = min_uA_23;
end

// Min v
min_vA_01 = fixed_1;
if (fixed_3 < fixed_1) begin
    min_vA_01 = fixed_3;
end

min_vA_23 = fixed_5;
if (fixed_7 < fixed_5) begin
    min_vA_01 = fixed_7;
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
assign widthB_fixed = halfWidthB << 25;
logic signed [31 : 0] heightB_fixed;
assign heightB_fixed = halfHeightB << 25;

always_comb begin
separate_min_uA = 1'b0;
if (min_uA >= widthB_fixed) begin
    separate_min_uA = 1'b1;
end

separate_max_uA = 1'b0;
if (max_uA <= -widthB_fixed) begin
    separate_max_uA = 1'b1;
end

separate_min_vA = 1'b0;
if (min_vA >= heightB_fixed) begin
    separate_min_vA = 1'b1;
end

separate_max_vA = 1'b0;
if (max_vA <= -heightB_fixed) begin
    separate_max_vA = 1'b1;
end

end



//// TEST 2: B onto A

// Project points of B onto axes of A
logic signed [22 : 0] opnet_103;
assign opnet_103 = opnet_44 - posA[0][31 : 11];
logic signed [22 : 0] opnet_104;
assign opnet_104 = opnet_45 - posA[1][31 : 11];
logic signed [31 : 0] fixed_8;
logic signed [31 : 0] fixed_9;
logic signed [38 : 0] opnet_105;
assign opnet_105 = opnet_103 * uA[0];
logic signed [38 : 0] opnet_106;
assign opnet_106 = opnet_104 * uA[1];
logic signed [38 : 0] opnet_107;
assign opnet_107 = opnet_105 + opnet_106;
assign fixed_8 = opnet_107 >> 3;
logic signed [38 : 0] opnet_108;
assign opnet_108 = opnet_103 * vA[0];
logic signed [38 : 0] opnet_109;
assign opnet_109 = opnet_104 * vA[1];
logic signed [38 : 0] opnet_110;
assign opnet_110 = opnet_108 + opnet_109;
assign fixed_9 = opnet_110 >> 3;
logic signed [22 : 0] opnet_111;
assign opnet_111 = opnet_52 - posA[0][31 : 11];
logic signed [22 : 0] opnet_112;
assign opnet_112 = opnet_53 - posA[1][31 : 11];
logic signed [31 : 0] fixed_10;
logic signed [31 : 0] fixed_11;
logic signed [38 : 0] opnet_113;
assign opnet_113 = opnet_111 * uA[0];
logic signed [38 : 0] opnet_114;
assign opnet_114 = opnet_112 * uA[1];
logic signed [38 : 0] opnet_115;
assign opnet_115 = opnet_113 + opnet_114;
assign fixed_10 = opnet_115 >> 3;
logic signed [38 : 0] opnet_116;
assign opnet_116 = opnet_111 * vA[0];
logic signed [38 : 0] opnet_117;
assign opnet_117 = opnet_112 * vA[1];
logic signed [38 : 0] opnet_118;
assign opnet_118 = opnet_116 + opnet_117;
assign fixed_11 = opnet_118 >> 3;
logic signed [22 : 0] opnet_119;
assign opnet_119 = opnet_61 - posA[0][31 : 11];
logic signed [22 : 0] opnet_120;
assign opnet_120 = opnet_62 - posA[1][31 : 11];
logic signed [31 : 0] fixed_12;
logic signed [31 : 0] fixed_13;
logic signed [38 : 0] opnet_121;
assign opnet_121 = opnet_119 * uA[0];
logic signed [38 : 0] opnet_122;
assign opnet_122 = opnet_120 * uA[1];
logic signed [38 : 0] opnet_123;
assign opnet_123 = opnet_121 + opnet_122;
assign fixed_12 = opnet_123 >> 3;
logic signed [38 : 0] opnet_124;
assign opnet_124 = opnet_119 * vA[0];
logic signed [38 : 0] opnet_125;
assign opnet_125 = opnet_120 * vA[1];
logic signed [38 : 0] opnet_126;
assign opnet_126 = opnet_124 + opnet_125;
assign fixed_13 = opnet_126 >> 3;
logic signed [22 : 0] opnet_127;
assign opnet_127 = opnet_69 - posA[0][31 : 11];
logic signed [22 : 0] opnet_128;
assign opnet_128 = opnet_70 - posA[1][31 : 11];
logic signed [31 : 0] fixed_14;
logic signed [31 : 0] fixed_15;
logic signed [38 : 0] opnet_129;
assign opnet_129 = opnet_127 * uA[0];
logic signed [38 : 0] opnet_130;
assign opnet_130 = opnet_128 * uA[1];
logic signed [38 : 0] opnet_131;
assign opnet_131 = opnet_129 + opnet_130;
assign fixed_14 = opnet_131 >> 3;
logic signed [38 : 0] opnet_132;
assign opnet_132 = opnet_127 * vA[0];
logic signed [38 : 0] opnet_133;
assign opnet_133 = opnet_128 * vA[1];
logic signed [38 : 0] opnet_134;
assign opnet_134 = opnet_132 + opnet_133;
assign fixed_15 = opnet_134 >> 3;


// Find max u and v values for rect B
logic signed [31 : 0] max_uB;
logic signed [31 : 0] max_uB_01;    // Max of points 0 and 1
logic signed [31 : 0] max_uB_23;    // Max of points 2 and 3

logic signed [31 : 0] max_vB;
logic signed [31 : 0] max_vB_01;    // Max of points 0 and 1
logic signed [31 : 0] max_vB_23;    // Max of points 2 and 3

always_comb begin

// Max u
max_uB_01 = fixed_8;
if (fixed_10 > fixed_8) begin
    max_uB_01 = fixed_10;
end

max_uB_23 = fixed_12;
if (fixed_14 > fixed_12) begin
    max_uB_01 = fixed_14;
end

max_uB = max_uB_01;
if (max_uB_23 > max_uB_01) begin
    max_uB = max_uB_23;
end

// Max v
max_vB_01 = fixed_9;
if (fixed_11 > fixed_9) begin
    max_vB_01 = fixed_11;
end

max_vB_23 = fixed_13;
if (fixed_15 > fixed_13) begin
    max_vB_01 = fixed_15;
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
min_uB_01 = fixed_8;
if (fixed_10 < fixed_8) begin
    min_uB_01 = fixed_10;
end

min_uB_23 = fixed_12;
if (fixed_14 < fixed_12) begin
    min_uB_01 = fixed_14;
end

min_uB = min_uB_01;
if (min_uB_23 < min_uB_01) begin
    min_uB = min_uB_23;
end

// Min v
min_vB_01 = fixed_9;
if (fixed_11 < fixed_9) begin
    min_vB_01 = fixed_11;
end

min_vB_23 = fixed_13;
if (fixed_15 < fixed_13) begin
    min_vB_01 = fixed_15;
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
assign widthA_fixed = halfWidthA << 25;
logic signed [31 : 0] heightA_fixed;
assign heightA_fixed = halfHeightA << 25;

always_comb begin
separate_min_uB = 1'b0;
if (min_uB >= widthA_fixed) begin
    separate_min_uB = 1'b1;
end

separate_max_uB = 1'b0;
if (max_uB <= -widthA_fixed) begin
    separate_max_uB = 1'b1;
end

separate_min_vB = 1'b0;
if (min_vB >= heightA_fixed) begin
    separate_min_vB = 1'b1;
end

separate_max_vB = 1'b0;
if (max_vB <= -heightA_fixed) begin
    separate_max_vB = 1'b1;
end

end

////// TYING IT ALL TOGETHER

always_comb begin
is_collision = ~(separate_min_uA | separate_max_uA | separate_min_vA | separate_max_vA | separate_min_uB | separate_max_uB | separate_min_vB | separate_max_vB);
end

endmodule