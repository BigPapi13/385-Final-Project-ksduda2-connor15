

module collision_detector(
    input logic signed [7 : 0] widthA,
    input logic signed [7 : 0] heightA,
    input logic signed [31 : 0] posA_x, input logic signed [31 : 0] posA_y,
    input logic signed [31 : 0] velA_x, input logic signed [31 : 0] velA_y,
    input logic signed [15 : 0] uA_x, input logic signed [15 : 0] uA_y,
    input logic signed [15 : 0] vA_x, input logic signed [15 : 0] vA_y,
    
    input logic signed [7 : 0] widthB,
    input logic signed [7 : 0] heightB,
    input logic signed [31 : 0] posB_x, input logic signed [31 : 0] posB_y,
    input logic signed [31 : 0] velB_x, input logic signed [31 : 0] velB_y,
    input logic signed [15 : 0] uB_x, input logic signed [15 : 0] uB_y,
    input logic signed [15 : 0] vB_x, input logic signed [15 : 0] vB_y,
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

logic signed [6 : 0] opnet_65;
assign opnet_65 = ~(halfWidthA) + 1'b1;

logic signed [6 : 0] opnet_66;
assign opnet_66 = ~(halfHeightA) + 1'b1;

logic signed [22 : 0] opnet_67;
assign opnet_67 = opnet_65 * uA_x;
logic signed [22 : 0] opnet_68;
assign opnet_68 = opnet_66 * vA_x;
logic signed [22 : 0] opnet_69;
assign opnet_69 = opnet_67 + opnet_68;
logic signed [22 : 0] opnet_70;
assign opnet_70 = opnet_65 * uA_y;
logic signed [22 : 0] opnet_71;
assign opnet_71 = opnet_66 * vA_y;
logic signed [22 : 0] opnet_72;
assign opnet_72 = opnet_70 + opnet_71;
logic signed [22 : 0] opnet_73;
assign opnet_73 = opnet_69 + (posA_x >>> 11);
logic signed [22 : 0] opnet_74;
assign opnet_74 = opnet_72 + (posA_y >>> 11);
logic signed [22 : 0] opnet_75;
assign opnet_75 = opnet_65 * uA_x;
logic signed [22 : 0] opnet_76;
assign opnet_76 = halfHeightA * vA_x;
logic signed [22 : 0] opnet_77;
assign opnet_77 = opnet_75 + opnet_76;
logic signed [22 : 0] opnet_78;
assign opnet_78 = opnet_65 * uA_y;
logic signed [22 : 0] opnet_79;
assign opnet_79 = halfHeightA * vA_y;
logic signed [22 : 0] opnet_80;
assign opnet_80 = opnet_78 + opnet_79;
logic signed [22 : 0] opnet_81;
assign opnet_81 = opnet_77 + (posA_x >>> 11);
logic signed [22 : 0] opnet_82;
assign opnet_82 = opnet_80 + (posA_y >>> 11);
logic signed [6 : 0] opnet_83;
assign opnet_83 = ~(halfHeightA) + 1'b1;

logic signed [22 : 0] opnet_84;
assign opnet_84 = halfWidthA * uA_x;
logic signed [22 : 0] opnet_85;
assign opnet_85 = opnet_83 * vA_x;
logic signed [22 : 0] opnet_86;
assign opnet_86 = opnet_84 + opnet_85;
logic signed [22 : 0] opnet_87;
assign opnet_87 = halfWidthA * uA_y;
logic signed [22 : 0] opnet_88;
assign opnet_88 = opnet_83 * vA_y;
logic signed [22 : 0] opnet_89;
assign opnet_89 = opnet_87 + opnet_88;
logic signed [22 : 0] opnet_90;
assign opnet_90 = opnet_86 + (posA_x >>> 11);
logic signed [22 : 0] opnet_91;
assign opnet_91 = opnet_89 + (posA_y >>> 11);
logic signed [22 : 0] opnet_92;
assign opnet_92 = halfWidthA * uA_x;
logic signed [22 : 0] opnet_93;
assign opnet_93 = halfHeightA * vA_x;
logic signed [22 : 0] opnet_94;
assign opnet_94 = opnet_92 + opnet_93;
logic signed [22 : 0] opnet_95;
assign opnet_95 = halfWidthA * uA_y;
logic signed [22 : 0] opnet_96;
assign opnet_96 = halfHeightA * vA_y;
logic signed [22 : 0] opnet_97;
assign opnet_97 = opnet_95 + opnet_96;
logic signed [22 : 0] opnet_98;
assign opnet_98 = opnet_94 + (posA_x >>> 11);
logic signed [22 : 0] opnet_99;
assign opnet_99 = opnet_97 + (posA_y >>> 11);
logic signed [6 : 0] opnet_100;
assign opnet_100 = ~(halfWidthB) + 1'b1;

logic signed [6 : 0] opnet_101;
assign opnet_101 = ~(halfHeightB) + 1'b1;

logic signed [22 : 0] opnet_102;
assign opnet_102 = opnet_100 * uB_x;
logic signed [22 : 0] opnet_103;
assign opnet_103 = opnet_101 * vB_x;
logic signed [22 : 0] opnet_104;
assign opnet_104 = opnet_102 + opnet_103;
logic signed [22 : 0] opnet_105;
assign opnet_105 = opnet_100 * uB_y;
logic signed [22 : 0] opnet_106;
assign opnet_106 = opnet_101 * vB_y;
logic signed [22 : 0] opnet_107;
assign opnet_107 = opnet_105 + opnet_106;
logic signed [22 : 0] opnet_108;
assign opnet_108 = opnet_104 + (posB_x >>> 11);
logic signed [22 : 0] opnet_109;
assign opnet_109 = opnet_107 + (posB_y >>> 11);
logic signed [22 : 0] opnet_110;
assign opnet_110 = opnet_100 * uB_x;
logic signed [22 : 0] opnet_111;
assign opnet_111 = halfHeightB * vB_x;
logic signed [22 : 0] opnet_112;
assign opnet_112 = opnet_110 + opnet_111;
logic signed [22 : 0] opnet_113;
assign opnet_113 = opnet_100 * uB_y;
logic signed [22 : 0] opnet_114;
assign opnet_114 = halfHeightB * vB_y;
logic signed [22 : 0] opnet_115;
assign opnet_115 = opnet_113 + opnet_114;
logic signed [22 : 0] opnet_116;
assign opnet_116 = opnet_112 + (posB_x >>> 11);
logic signed [22 : 0] opnet_117;
assign opnet_117 = opnet_115 + (posB_y >>> 11);
logic signed [6 : 0] opnet_118;
assign opnet_118 = ~(halfHeightB) + 1'b1;

logic signed [22 : 0] opnet_119;
assign opnet_119 = halfWidthB * uB_x;
logic signed [22 : 0] opnet_120;
assign opnet_120 = opnet_118 * vB_x;
logic signed [22 : 0] opnet_121;
assign opnet_121 = opnet_119 + opnet_120;
logic signed [22 : 0] opnet_122;
assign opnet_122 = halfWidthB * uB_y;
logic signed [22 : 0] opnet_123;
assign opnet_123 = opnet_118 * vB_y;
logic signed [22 : 0] opnet_124;
assign opnet_124 = opnet_122 + opnet_123;
logic signed [22 : 0] opnet_125;
assign opnet_125 = opnet_121 + (posB_x >>> 11);
logic signed [22 : 0] opnet_126;
assign opnet_126 = opnet_124 + (posB_y >>> 11);
logic signed [22 : 0] opnet_127;
assign opnet_127 = halfWidthB * uB_x;
logic signed [22 : 0] opnet_128;
assign opnet_128 = halfHeightB * vB_x;
logic signed [22 : 0] opnet_129;
assign opnet_129 = opnet_127 + opnet_128;
logic signed [22 : 0] opnet_130;
assign opnet_130 = halfWidthB * uB_y;
logic signed [22 : 0] opnet_131;
assign opnet_131 = halfHeightB * vB_y;
logic signed [22 : 0] opnet_132;
assign opnet_132 = opnet_130 + opnet_131;
logic signed [22 : 0] opnet_133;
assign opnet_133 = opnet_129 + (posB_x >>> 11);
logic signed [22 : 0] opnet_134;
assign opnet_134 = opnet_132 + (posB_y >>> 11);

//// TEST 1: A onto B

// Project points of A onto axes of B
logic signed [22 : 0] opnet_135;
assign opnet_135 = opnet_73 - (posB_x >>> 11);
logic signed [22 : 0] opnet_136;
assign opnet_136 = opnet_74 - (posB_y >>> 11);
logic signed [31 : 0] fixed_16;
logic signed [31 : 0] fixed_17;
logic signed [38 : 0] opnet_137;
assign opnet_137 = opnet_135 * uB_x;
logic signed [38 : 0] opnet_138;
assign opnet_138 = opnet_136 * uB_y;
logic signed [38 : 0] opnet_139;
assign opnet_139 = opnet_137 + opnet_138;
assign fixed_16 = opnet_139 >>> 3;
logic signed [38 : 0] opnet_140;
assign opnet_140 = opnet_135 * vB_x;
logic signed [38 : 0] opnet_141;
assign opnet_141 = opnet_136 * vB_y;
logic signed [38 : 0] opnet_142;
assign opnet_142 = opnet_140 + opnet_141;
assign fixed_17 = opnet_142 >>> 3;
logic signed [22 : 0] opnet_143;
assign opnet_143 = opnet_81 - (posB_x >>> 11);
logic signed [22 : 0] opnet_144;
assign opnet_144 = opnet_82 - (posB_y >>> 11);
logic signed [31 : 0] fixed_18;
logic signed [31 : 0] fixed_19;
logic signed [38 : 0] opnet_145;
assign opnet_145 = opnet_143 * uB_x;
logic signed [38 : 0] opnet_146;
assign opnet_146 = opnet_144 * uB_y;
logic signed [38 : 0] opnet_147;
assign opnet_147 = opnet_145 + opnet_146;
assign fixed_18 = opnet_147 >>> 3;
logic signed [38 : 0] opnet_148;
assign opnet_148 = opnet_143 * vB_x;
logic signed [38 : 0] opnet_149;
assign opnet_149 = opnet_144 * vB_y;
logic signed [38 : 0] opnet_150;
assign opnet_150 = opnet_148 + opnet_149;
assign fixed_19 = opnet_150 >>> 3;
logic signed [22 : 0] opnet_151;
assign opnet_151 = opnet_90 - (posB_x >>> 11);
logic signed [22 : 0] opnet_152;
assign opnet_152 = opnet_91 - (posB_y >>> 11);
logic signed [31 : 0] fixed_20;
logic signed [31 : 0] fixed_21;
logic signed [38 : 0] opnet_153;
assign opnet_153 = opnet_151 * uB_x;
logic signed [38 : 0] opnet_154;
assign opnet_154 = opnet_152 * uB_y;
logic signed [38 : 0] opnet_155;
assign opnet_155 = opnet_153 + opnet_154;
assign fixed_20 = opnet_155 >>> 3;
logic signed [38 : 0] opnet_156;
assign opnet_156 = opnet_151 * vB_x;
logic signed [38 : 0] opnet_157;
assign opnet_157 = opnet_152 * vB_y;
logic signed [38 : 0] opnet_158;
assign opnet_158 = opnet_156 + opnet_157;
assign fixed_21 = opnet_158 >>> 3;
logic signed [22 : 0] opnet_159;
assign opnet_159 = opnet_98 - (posB_x >>> 11);
logic signed [22 : 0] opnet_160;
assign opnet_160 = opnet_99 - (posB_y >>> 11);
logic signed [31 : 0] fixed_22;
logic signed [31 : 0] fixed_23;
logic signed [38 : 0] opnet_161;
assign opnet_161 = opnet_159 * uB_x;
logic signed [38 : 0] opnet_162;
assign opnet_162 = opnet_160 * uB_y;
logic signed [38 : 0] opnet_163;
assign opnet_163 = opnet_161 + opnet_162;
assign fixed_22 = opnet_163 >>> 3;
logic signed [38 : 0] opnet_164;
assign opnet_164 = opnet_159 * vB_x;
logic signed [38 : 0] opnet_165;
assign opnet_165 = opnet_160 * vB_y;
logic signed [38 : 0] opnet_166;
assign opnet_166 = opnet_164 + opnet_165;
assign fixed_23 = opnet_166 >>> 3;


// Find max u and v values for rect A
logic signed [31 : 0] max_uA;
logic signed [31 : 0] max_uA_01;    // Max of points 0 and 1
logic signed [31 : 0] max_uA_23;    // Max of points 2 and 3

logic signed [31 : 0] max_vA;
logic signed [31 : 0] max_vA_01;    // Max of points 0 and 1
logic signed [31 : 0] max_vA_23;    // Max of points 2 and 3

always_comb begin

// Max u
max_uA_01 = fixed_16;
if (fixed_18 > fixed_16) begin
    max_uA_01 = fixed_18;
end

max_uA_23 = fixed_20;
if (fixed_22 > fixed_20) begin
    max_uA_01 = fixed_22;
end

max_uA = max_uA_01;
if (max_uA_23 > max_uA_01) begin
    max_uA = max_uA_23;
end

// Max v
max_vA_01 = fixed_17;
if (fixed_19 > fixed_17) begin
    max_vA_01 = fixed_19;
end

max_vA_23 = fixed_21;
if (fixed_23 > fixed_21) begin
    max_vA_01 = fixed_23;
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
min_uA_01 = fixed_16;
if (fixed_18 < fixed_16) begin
    min_uA_01 = fixed_18;
end

min_uA_23 = fixed_20;
if (fixed_22 < fixed_20) begin
    min_uA_01 = fixed_22;
end

min_uA = min_uA_01;
if (min_uA_23 < min_uA_01) begin
    min_uA = min_uA_23;
end

// Min v
min_vA_01 = fixed_17;
if (fixed_19 < fixed_17) begin
    min_vA_01 = fixed_19;
end

min_vA_23 = fixed_21;
if (fixed_23 < fixed_21) begin
    min_vA_01 = fixed_23;
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
logic signed [22 : 0] opnet_167;
assign opnet_167 = opnet_108 - (posA_x >>> 11);
logic signed [22 : 0] opnet_168;
assign opnet_168 = opnet_109 - (posA_y >>> 11);
logic signed [31 : 0] fixed_24;
logic signed [31 : 0] fixed_25;
logic signed [38 : 0] opnet_169;
assign opnet_169 = opnet_167 * uA_x;
logic signed [38 : 0] opnet_170;
assign opnet_170 = opnet_168 * uA_y;
logic signed [38 : 0] opnet_171;
assign opnet_171 = opnet_169 + opnet_170;
assign fixed_24 = opnet_171 >>> 3;
logic signed [38 : 0] opnet_172;
assign opnet_172 = opnet_167 * vA_x;
logic signed [38 : 0] opnet_173;
assign opnet_173 = opnet_168 * vA_y;
logic signed [38 : 0] opnet_174;
assign opnet_174 = opnet_172 + opnet_173;
assign fixed_25 = opnet_174 >>> 3;
logic signed [22 : 0] opnet_175;
assign opnet_175 = opnet_116 - (posA_x >>> 11);
logic signed [22 : 0] opnet_176;
assign opnet_176 = opnet_117 - (posA_y >>> 11);
logic signed [31 : 0] fixed_26;
logic signed [31 : 0] fixed_27;
logic signed [38 : 0] opnet_177;
assign opnet_177 = opnet_175 * uA_x;
logic signed [38 : 0] opnet_178;
assign opnet_178 = opnet_176 * uA_y;
logic signed [38 : 0] opnet_179;
assign opnet_179 = opnet_177 + opnet_178;
assign fixed_26 = opnet_179 >>> 3;
logic signed [38 : 0] opnet_180;
assign opnet_180 = opnet_175 * vA_x;
logic signed [38 : 0] opnet_181;
assign opnet_181 = opnet_176 * vA_y;
logic signed [38 : 0] opnet_182;
assign opnet_182 = opnet_180 + opnet_181;
assign fixed_27 = opnet_182 >>> 3;
logic signed [22 : 0] opnet_183;
assign opnet_183 = opnet_125 - (posA_x >>> 11);
logic signed [22 : 0] opnet_184;
assign opnet_184 = opnet_126 - (posA_y >>> 11);
logic signed [31 : 0] fixed_28;
logic signed [31 : 0] fixed_29;
logic signed [38 : 0] opnet_185;
assign opnet_185 = opnet_183 * uA_x;
logic signed [38 : 0] opnet_186;
assign opnet_186 = opnet_184 * uA_y;
logic signed [38 : 0] opnet_187;
assign opnet_187 = opnet_185 + opnet_186;
assign fixed_28 = opnet_187 >>> 3;
logic signed [38 : 0] opnet_188;
assign opnet_188 = opnet_183 * vA_x;
logic signed [38 : 0] opnet_189;
assign opnet_189 = opnet_184 * vA_y;
logic signed [38 : 0] opnet_190;
assign opnet_190 = opnet_188 + opnet_189;
assign fixed_29 = opnet_190 >>> 3;
logic signed [22 : 0] opnet_191;
assign opnet_191 = opnet_133 - (posA_x >>> 11);
logic signed [22 : 0] opnet_192;
assign opnet_192 = opnet_134 - (posA_y >>> 11);
logic signed [31 : 0] fixed_30;
logic signed [31 : 0] fixed_31;
logic signed [38 : 0] opnet_193;
assign opnet_193 = opnet_191 * uA_x;
logic signed [38 : 0] opnet_194;
assign opnet_194 = opnet_192 * uA_y;
logic signed [38 : 0] opnet_195;
assign opnet_195 = opnet_193 + opnet_194;
assign fixed_30 = opnet_195 >>> 3;
logic signed [38 : 0] opnet_196;
assign opnet_196 = opnet_191 * vA_x;
logic signed [38 : 0] opnet_197;
assign opnet_197 = opnet_192 * vA_y;
logic signed [38 : 0] opnet_198;
assign opnet_198 = opnet_196 + opnet_197;
assign fixed_31 = opnet_198 >>> 3;


// Find max u and v values for rect B
logic signed [31 : 0] max_uB;
logic signed [31 : 0] max_uB_01;    // Max of points 0 and 1
logic signed [31 : 0] max_uB_23;    // Max of points 2 and 3

logic signed [31 : 0] max_vB;
logic signed [31 : 0] max_vB_01;    // Max of points 0 and 1
logic signed [31 : 0] max_vB_23;    // Max of points 2 and 3

always_comb begin

// Max u
max_uB_01 = fixed_24;
if (fixed_26 > fixed_24) begin
    max_uB_01 = fixed_26;
end

max_uB_23 = fixed_28;
if (fixed_30 > fixed_28) begin
    max_uB_01 = fixed_30;
end

max_uB = max_uB_01;
if (max_uB_23 > max_uB_01) begin
    max_uB = max_uB_23;
end

// Max v
max_vB_01 = fixed_25;
if (fixed_27 > fixed_25) begin
    max_vB_01 = fixed_27;
end

max_vB_23 = fixed_29;
if (fixed_31 > fixed_29) begin
    max_vB_01 = fixed_31;
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
min_uB_01 = fixed_24;
if (fixed_26 < fixed_24) begin
    min_uB_01 = fixed_26;
end

min_uB_23 = fixed_28;
if (fixed_30 < fixed_28) begin
    min_uB_01 = fixed_30;
end

min_uB = min_uB_01;
if (min_uB_23 < min_uB_01) begin
    min_uB = min_uB_23;
end

// Min v
min_vB_01 = fixed_25;
if (fixed_27 < fixed_25) begin
    min_vB_01 = fixed_27;
end

min_vB_23 = fixed_29;
if (fixed_31 < fixed_29) begin
    min_vB_01 = fixed_31;
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