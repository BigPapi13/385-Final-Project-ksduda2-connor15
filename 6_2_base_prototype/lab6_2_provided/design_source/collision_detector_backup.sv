

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

logic signed [6 : 0] opnet_83;
assign opnet_83 = ~(halfWidthA) + 1'b1;

logic signed [6 : 0] opnet_84;
assign opnet_84 = ~(halfHeightA) + 1'b1;

logic signed [22 : 0] opnet_85;
assign opnet_85 = opnet_83 * uA_x;
logic signed [22 : 0] opnet_86;
assign opnet_86 = opnet_84 * vA_x;
logic signed [22 : 0] opnet_87;
assign opnet_87 = opnet_85 + opnet_86;
logic signed [22 : 0] opnet_88;
assign opnet_88 = opnet_83 * uA_y;
logic signed [22 : 0] opnet_89;
assign opnet_89 = opnet_84 * vA_y;
logic signed [22 : 0] opnet_90;
assign opnet_90 = opnet_88 + opnet_89;
logic signed [22 : 0] opnet_91;
assign opnet_91 = opnet_87 + (posA_x >>> 11);
logic signed [22 : 0] opnet_92;
assign opnet_92 = opnet_90 + (posA_y >>> 11);
logic signed [22 : 0] opnet_93;
assign opnet_93 = opnet_83 * uA_x;
logic signed [22 : 0] opnet_94;
assign opnet_94 = halfHeightA * vA_x;
logic signed [22 : 0] opnet_95;
assign opnet_95 = opnet_93 + opnet_94;
logic signed [22 : 0] opnet_96;
assign opnet_96 = opnet_83 * uA_y;
logic signed [22 : 0] opnet_97;
assign opnet_97 = halfHeightA * vA_y;
logic signed [22 : 0] opnet_98;
assign opnet_98 = opnet_96 + opnet_97;
logic signed [22 : 0] opnet_99;
assign opnet_99 = opnet_95 + (posA_x >>> 11);
logic signed [22 : 0] opnet_100;
assign opnet_100 = opnet_98 + (posA_y >>> 11);
logic signed [6 : 0] opnet_101;
assign opnet_101 = ~(halfHeightA) + 1'b1;

logic signed [22 : 0] opnet_102;
assign opnet_102 = halfWidthA * uA_x;
logic signed [22 : 0] opnet_103;
assign opnet_103 = opnet_101 * vA_x;
logic signed [22 : 0] opnet_104;
assign opnet_104 = opnet_102 + opnet_103;
logic signed [22 : 0] opnet_105;
assign opnet_105 = halfWidthA * uA_y;
logic signed [22 : 0] opnet_106;
assign opnet_106 = opnet_101 * vA_y;
logic signed [22 : 0] opnet_107;
assign opnet_107 = opnet_105 + opnet_106;
logic signed [22 : 0] opnet_108;
assign opnet_108 = opnet_104 + (posA_x >>> 11);
logic signed [22 : 0] opnet_109;
assign opnet_109 = opnet_107 + (posA_y >>> 11);
logic signed [22 : 0] opnet_110;
assign opnet_110 = halfWidthA * uA_x;
logic signed [22 : 0] opnet_111;
assign opnet_111 = halfHeightA * vA_x;
logic signed [22 : 0] opnet_112;
assign opnet_112 = opnet_110 + opnet_111;
logic signed [22 : 0] opnet_113;
assign opnet_113 = halfWidthA * uA_y;
logic signed [22 : 0] opnet_114;
assign opnet_114 = halfHeightA * vA_y;
logic signed [22 : 0] opnet_115;
assign opnet_115 = opnet_113 + opnet_114;
logic signed [22 : 0] opnet_116;
assign opnet_116 = opnet_112 + (posA_x >>> 11);
logic signed [22 : 0] opnet_117;
assign opnet_117 = opnet_115 + (posA_y >>> 11);
logic signed [6 : 0] opnet_118;
assign opnet_118 = ~(halfWidthB) + 1'b1;

logic signed [6 : 0] opnet_119;
assign opnet_119 = ~(halfHeightB) + 1'b1;

logic signed [22 : 0] opnet_120;
assign opnet_120 = opnet_118 * uB_x;
logic signed [22 : 0] opnet_121;
assign opnet_121 = opnet_119 * vB_x;
logic signed [22 : 0] opnet_122;
assign opnet_122 = opnet_120 + opnet_121;
logic signed [22 : 0] opnet_123;
assign opnet_123 = opnet_118 * uB_y;
logic signed [22 : 0] opnet_124;
assign opnet_124 = opnet_119 * vB_y;
logic signed [22 : 0] opnet_125;
assign opnet_125 = opnet_123 + opnet_124;
logic signed [22 : 0] opnet_126;
assign opnet_126 = opnet_122 + (posB_x >>> 11);
logic signed [22 : 0] opnet_127;
assign opnet_127 = opnet_125 + (posB_y >>> 11);
logic signed [22 : 0] opnet_128;
assign opnet_128 = opnet_118 * uB_x;
logic signed [22 : 0] opnet_129;
assign opnet_129 = halfHeightB * vB_x;
logic signed [22 : 0] opnet_130;
assign opnet_130 = opnet_128 + opnet_129;
logic signed [22 : 0] opnet_131;
assign opnet_131 = opnet_118 * uB_y;
logic signed [22 : 0] opnet_132;
assign opnet_132 = halfHeightB * vB_y;
logic signed [22 : 0] opnet_133;
assign opnet_133 = opnet_131 + opnet_132;
logic signed [22 : 0] opnet_134;
assign opnet_134 = opnet_130 + (posB_x >>> 11);
logic signed [22 : 0] opnet_135;
assign opnet_135 = opnet_133 + (posB_y >>> 11);
logic signed [6 : 0] opnet_136;
assign opnet_136 = ~(halfHeightB) + 1'b1;

logic signed [22 : 0] opnet_137;
assign opnet_137 = halfWidthB * uB_x;
logic signed [22 : 0] opnet_138;
assign opnet_138 = opnet_136 * vB_x;
logic signed [22 : 0] opnet_139;
assign opnet_139 = opnet_137 + opnet_138;
logic signed [22 : 0] opnet_140;
assign opnet_140 = halfWidthB * uB_y;
logic signed [22 : 0] opnet_141;
assign opnet_141 = opnet_136 * vB_y;
logic signed [22 : 0] opnet_142;
assign opnet_142 = opnet_140 + opnet_141;
logic signed [22 : 0] opnet_143;
assign opnet_143 = opnet_139 + (posB_x >>> 11);
logic signed [22 : 0] opnet_144;
assign opnet_144 = opnet_142 + (posB_y >>> 11);
logic signed [22 : 0] opnet_145;
assign opnet_145 = halfWidthB * uB_x;
logic signed [22 : 0] opnet_146;
assign opnet_146 = halfHeightB * vB_x;
logic signed [22 : 0] opnet_147;
assign opnet_147 = opnet_145 + opnet_146;
logic signed [22 : 0] opnet_148;
assign opnet_148 = halfWidthB * uB_y;
logic signed [22 : 0] opnet_149;
assign opnet_149 = halfHeightB * vB_y;
logic signed [22 : 0] opnet_150;
assign opnet_150 = opnet_148 + opnet_149;
logic signed [22 : 0] opnet_151;
assign opnet_151 = opnet_147 + (posB_x >>> 11);
logic signed [22 : 0] opnet_152;
assign opnet_152 = opnet_150 + (posB_y >>> 11);

//// TEST 1: A onto B

// Project points of A onto axes of B
logic signed [22 : 0] opnet_153;
assign opnet_153 = opnet_91 - (posB_x >>> 11);
logic signed [22 : 0] opnet_154;
assign opnet_154 = opnet_92 - (posB_y >>> 11);
logic signed [31 : 0] fixed_0;
logic signed [31 : 0] fixed_1;
logic signed [38 : 0] opnet_155;
assign opnet_155 = opnet_153 * uB_x;
logic signed [38 : 0] opnet_156;
assign opnet_156 = opnet_154 * uB_y;
logic signed [38 : 0] opnet_157;
assign opnet_157 = opnet_155 + opnet_156;
assign fixed_0 = opnet_157 >>> 3;
logic signed [38 : 0] opnet_158;
assign opnet_158 = opnet_153 * vB_x;
logic signed [38 : 0] opnet_159;
assign opnet_159 = opnet_154 * vB_y;
logic signed [38 : 0] opnet_160;
assign opnet_160 = opnet_158 + opnet_159;
assign fixed_1 = opnet_160 >>> 3;
logic signed [22 : 0] opnet_161;
assign opnet_161 = opnet_99 - (posB_x >>> 11);
logic signed [22 : 0] opnet_162;
assign opnet_162 = opnet_100 - (posB_y >>> 11);
logic signed [31 : 0] fixed_2;
logic signed [31 : 0] fixed_3;
logic signed [38 : 0] opnet_163;
assign opnet_163 = opnet_161 * uB_x;
logic signed [38 : 0] opnet_164;
assign opnet_164 = opnet_162 * uB_y;
logic signed [38 : 0] opnet_165;
assign opnet_165 = opnet_163 + opnet_164;
assign fixed_2 = opnet_165 >>> 3;
logic signed [38 : 0] opnet_166;
assign opnet_166 = opnet_161 * vB_x;
logic signed [38 : 0] opnet_167;
assign opnet_167 = opnet_162 * vB_y;
logic signed [38 : 0] opnet_168;
assign opnet_168 = opnet_166 + opnet_167;
assign fixed_3 = opnet_168 >>> 3;
logic signed [22 : 0] opnet_169;
assign opnet_169 = opnet_108 - (posB_x >>> 11);
logic signed [22 : 0] opnet_170;
assign opnet_170 = opnet_109 - (posB_y >>> 11);
logic signed [31 : 0] fixed_4;
logic signed [31 : 0] fixed_5;
logic signed [38 : 0] opnet_171;
assign opnet_171 = opnet_169 * uB_x;
logic signed [38 : 0] opnet_172;
assign opnet_172 = opnet_170 * uB_y;
logic signed [38 : 0] opnet_173;
assign opnet_173 = opnet_171 + opnet_172;
assign fixed_4 = opnet_173 >>> 3;
logic signed [38 : 0] opnet_174;
assign opnet_174 = opnet_169 * vB_x;
logic signed [38 : 0] opnet_175;
assign opnet_175 = opnet_170 * vB_y;
logic signed [38 : 0] opnet_176;
assign opnet_176 = opnet_174 + opnet_175;
assign fixed_5 = opnet_176 >>> 3;
logic signed [22 : 0] opnet_177;
assign opnet_177 = opnet_116 - (posB_x >>> 11);
logic signed [22 : 0] opnet_178;
assign opnet_178 = opnet_117 - (posB_y >>> 11);
logic signed [31 : 0] fixed_6;
logic signed [31 : 0] fixed_7;
logic signed [38 : 0] opnet_179;
assign opnet_179 = opnet_177 * uB_x;
logic signed [38 : 0] opnet_180;
assign opnet_180 = opnet_178 * uB_y;
logic signed [38 : 0] opnet_181;
assign opnet_181 = opnet_179 + opnet_180;
assign fixed_6 = opnet_181 >>> 3;
logic signed [38 : 0] opnet_182;
assign opnet_182 = opnet_177 * vB_x;
logic signed [38 : 0] opnet_183;
assign opnet_183 = opnet_178 * vB_y;
logic signed [38 : 0] opnet_184;
assign opnet_184 = opnet_182 + opnet_183;
assign fixed_7 = opnet_184 >>> 3;


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
logic signed [22 : 0] opnet_185;
assign opnet_185 = opnet_126 - (posA_x >>> 11);
logic signed [22 : 0] opnet_186;
assign opnet_186 = opnet_127 - (posA_y >>> 11);
logic signed [31 : 0] fixed_8;
logic signed [31 : 0] fixed_9;
logic signed [38 : 0] opnet_187;
assign opnet_187 = opnet_185 * uA_x;
logic signed [38 : 0] opnet_188;
assign opnet_188 = opnet_186 * uA_y;
logic signed [38 : 0] opnet_189;
assign opnet_189 = opnet_187 + opnet_188;
assign fixed_8 = opnet_189 >>> 3;
logic signed [38 : 0] opnet_190;
assign opnet_190 = opnet_185 * vA_x;
logic signed [38 : 0] opnet_191;
assign opnet_191 = opnet_186 * vA_y;
logic signed [38 : 0] opnet_192;
assign opnet_192 = opnet_190 + opnet_191;
assign fixed_9 = opnet_192 >>> 3;
logic signed [22 : 0] opnet_193;
assign opnet_193 = opnet_134 - (posA_x >>> 11);
logic signed [22 : 0] opnet_194;
assign opnet_194 = opnet_135 - (posA_y >>> 11);
logic signed [31 : 0] fixed_10;
logic signed [31 : 0] fixed_11;
logic signed [38 : 0] opnet_195;
assign opnet_195 = opnet_193 * uA_x;
logic signed [38 : 0] opnet_196;
assign opnet_196 = opnet_194 * uA_y;
logic signed [38 : 0] opnet_197;
assign opnet_197 = opnet_195 + opnet_196;
assign fixed_10 = opnet_197 >>> 3;
logic signed [38 : 0] opnet_198;
assign opnet_198 = opnet_193 * vA_x;
logic signed [38 : 0] opnet_199;
assign opnet_199 = opnet_194 * vA_y;
logic signed [38 : 0] opnet_200;
assign opnet_200 = opnet_198 + opnet_199;
assign fixed_11 = opnet_200 >>> 3;
logic signed [22 : 0] opnet_201;
assign opnet_201 = opnet_143 - (posA_x >>> 11);
logic signed [22 : 0] opnet_202;
assign opnet_202 = opnet_144 - (posA_y >>> 11);
logic signed [31 : 0] fixed_12;
logic signed [31 : 0] fixed_13;
logic signed [38 : 0] opnet_203;
assign opnet_203 = opnet_201 * uA_x;
logic signed [38 : 0] opnet_204;
assign opnet_204 = opnet_202 * uA_y;
logic signed [38 : 0] opnet_205;
assign opnet_205 = opnet_203 + opnet_204;
assign fixed_12 = opnet_205 >>> 3;
logic signed [38 : 0] opnet_206;
assign opnet_206 = opnet_201 * vA_x;
logic signed [38 : 0] opnet_207;
assign opnet_207 = opnet_202 * vA_y;
logic signed [38 : 0] opnet_208;
assign opnet_208 = opnet_206 + opnet_207;
assign fixed_13 = opnet_208 >>> 3;
logic signed [22 : 0] opnet_209;
assign opnet_209 = opnet_151 - (posA_x >>> 11);
logic signed [22 : 0] opnet_210;
assign opnet_210 = opnet_152 - (posA_y >>> 11);
logic signed [31 : 0] fixed_14;
logic signed [31 : 0] fixed_15;
logic signed [38 : 0] opnet_211;
assign opnet_211 = opnet_209 * uA_x;
logic signed [38 : 0] opnet_212;
assign opnet_212 = opnet_210 * uA_y;
logic signed [38 : 0] opnet_213;
assign opnet_213 = opnet_211 + opnet_212;
assign fixed_14 = opnet_213 >>> 3;
logic signed [38 : 0] opnet_214;
assign opnet_214 = opnet_209 * vA_x;
logic signed [38 : 0] opnet_215;
assign opnet_215 = opnet_210 * vA_y;
logic signed [38 : 0] opnet_216;
assign opnet_216 = opnet_214 + opnet_215;
assign fixed_15 = opnet_216 >>> 3;


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