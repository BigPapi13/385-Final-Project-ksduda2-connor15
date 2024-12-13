

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
    output logic is_collision,
    output logic signed [15 : 0] normal_x, output logic signed [15 : 0] normal_y,
output logic signed [21 : 0] location_x, output logic signed [21 : 0] location_y,
output logic signed [31 : 0] penetration
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
logic signed [21 : 0] opnet_217;
assign opnet_217 = obb1_Point0_x - (obb2_pos_x >>> 10);
logic signed [21 : 0] opnet_218;
assign opnet_218 = obb1_Point0_y - (obb2_pos_y >>> 10);
logic signed [31 : 0] Point1_0_u;
logic signed [31 : 0] Point1_0_v;
logic signed [37 : 0] opnet_219;
assign opnet_219 = opnet_217 * obb2_u_x;
logic signed [37 : 0] opnet_220;
assign opnet_220 = opnet_218 * obb2_u_y;
logic signed [37 : 0] opnet_221;
assign opnet_221 = opnet_219 + opnet_220;
assign Point1_0_u = opnet_221 >>> 4;
logic signed [37 : 0] opnet_222;
assign opnet_222 = opnet_217 * obb2_v_x;
logic signed [37 : 0] opnet_223;
assign opnet_223 = opnet_218 * obb2_v_y;
logic signed [37 : 0] opnet_224;
assign opnet_224 = opnet_222 + opnet_223;
assign Point1_0_v = opnet_224 >>> 4;
logic signed [21 : 0] opnet_225;
assign opnet_225 = obb1_Point1_x - (obb2_pos_x >>> 10);
logic signed [21 : 0] opnet_226;
assign opnet_226 = obb1_Point1_y - (obb2_pos_y >>> 10);
logic signed [31 : 0] Point1_1_u;
logic signed [31 : 0] Point1_1_v;
logic signed [37 : 0] opnet_227;
assign opnet_227 = opnet_225 * obb2_u_x;
logic signed [37 : 0] opnet_228;
assign opnet_228 = opnet_226 * obb2_u_y;
logic signed [37 : 0] opnet_229;
assign opnet_229 = opnet_227 + opnet_228;
assign Point1_1_u = opnet_229 >>> 4;
logic signed [37 : 0] opnet_230;
assign opnet_230 = opnet_225 * obb2_v_x;
logic signed [37 : 0] opnet_231;
assign opnet_231 = opnet_226 * obb2_v_y;
logic signed [37 : 0] opnet_232;
assign opnet_232 = opnet_230 + opnet_231;
assign Point1_1_v = opnet_232 >>> 4;
logic signed [21 : 0] opnet_233;
assign opnet_233 = obb1_Point2_x - (obb2_pos_x >>> 10);
logic signed [21 : 0] opnet_234;
assign opnet_234 = obb1_Point2_y - (obb2_pos_y >>> 10);
logic signed [31 : 0] Point1_2_u;
logic signed [31 : 0] Point1_2_v;
logic signed [37 : 0] opnet_235;
assign opnet_235 = opnet_233 * obb2_u_x;
logic signed [37 : 0] opnet_236;
assign opnet_236 = opnet_234 * obb2_u_y;
logic signed [37 : 0] opnet_237;
assign opnet_237 = opnet_235 + opnet_236;
assign Point1_2_u = opnet_237 >>> 4;
logic signed [37 : 0] opnet_238;
assign opnet_238 = opnet_233 * obb2_v_x;
logic signed [37 : 0] opnet_239;
assign opnet_239 = opnet_234 * obb2_v_y;
logic signed [37 : 0] opnet_240;
assign opnet_240 = opnet_238 + opnet_239;
assign Point1_2_v = opnet_240 >>> 4;
logic signed [21 : 0] opnet_241;
assign opnet_241 = obb1_Point3_x - (obb2_pos_x >>> 10);
logic signed [21 : 0] opnet_242;
assign opnet_242 = obb1_Point3_y - (obb2_pos_y >>> 10);
logic signed [31 : 0] Point1_3_u;
logic signed [31 : 0] Point1_3_v;
logic signed [37 : 0] opnet_243;
assign opnet_243 = opnet_241 * obb2_u_x;
logic signed [37 : 0] opnet_244;
assign opnet_244 = opnet_242 * obb2_u_y;
logic signed [37 : 0] opnet_245;
assign opnet_245 = opnet_243 + opnet_244;
assign Point1_3_u = opnet_245 >>> 4;
logic signed [37 : 0] opnet_246;
assign opnet_246 = opnet_241 * obb2_v_x;
logic signed [37 : 0] opnet_247;
assign opnet_247 = opnet_242 * obb2_v_y;
logic signed [37 : 0] opnet_248;
assign opnet_248 = opnet_246 + opnet_247;
assign Point1_3_v = opnet_248 >>> 4;


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
logic signed [21 : 0] opnet_249;
assign opnet_249 = obb2_Point0_x - (obb1_pos_x >>> 10);
logic signed [21 : 0] opnet_250;
assign opnet_250 = obb2_Point0_y - (obb1_pos_y >>> 10);
logic signed [31 : 0] Point2_0_u;
logic signed [31 : 0] Point2_0_v;
logic signed [37 : 0] opnet_251;
assign opnet_251 = opnet_249 * obb1_u_x;
logic signed [37 : 0] opnet_252;
assign opnet_252 = opnet_250 * obb1_u_y;
logic signed [37 : 0] opnet_253;
assign opnet_253 = opnet_251 + opnet_252;
assign Point2_0_u = opnet_253 >>> 4;
logic signed [37 : 0] opnet_254;
assign opnet_254 = opnet_249 * obb1_v_x;
logic signed [37 : 0] opnet_255;
assign opnet_255 = opnet_250 * obb1_v_y;
logic signed [37 : 0] opnet_256;
assign opnet_256 = opnet_254 + opnet_255;
assign Point2_0_v = opnet_256 >>> 4;
logic signed [21 : 0] opnet_257;
assign opnet_257 = obb2_Point1_x - (obb1_pos_x >>> 10);
logic signed [21 : 0] opnet_258;
assign opnet_258 = obb2_Point1_y - (obb1_pos_y >>> 10);
logic signed [31 : 0] Point2_1_u;
logic signed [31 : 0] Point2_1_v;
logic signed [37 : 0] opnet_259;
assign opnet_259 = opnet_257 * obb1_u_x;
logic signed [37 : 0] opnet_260;
assign opnet_260 = opnet_258 * obb1_u_y;
logic signed [37 : 0] opnet_261;
assign opnet_261 = opnet_259 + opnet_260;
assign Point2_1_u = opnet_261 >>> 4;
logic signed [37 : 0] opnet_262;
assign opnet_262 = opnet_257 * obb1_v_x;
logic signed [37 : 0] opnet_263;
assign opnet_263 = opnet_258 * obb1_v_y;
logic signed [37 : 0] opnet_264;
assign opnet_264 = opnet_262 + opnet_263;
assign Point2_1_v = opnet_264 >>> 4;
logic signed [21 : 0] opnet_265;
assign opnet_265 = obb2_Point2_x - (obb1_pos_x >>> 10);
logic signed [21 : 0] opnet_266;
assign opnet_266 = obb2_Point2_y - (obb1_pos_y >>> 10);
logic signed [31 : 0] Point2_2_u;
logic signed [31 : 0] Point2_2_v;
logic signed [37 : 0] opnet_267;
assign opnet_267 = opnet_265 * obb1_u_x;
logic signed [37 : 0] opnet_268;
assign opnet_268 = opnet_266 * obb1_u_y;
logic signed [37 : 0] opnet_269;
assign opnet_269 = opnet_267 + opnet_268;
assign Point2_2_u = opnet_269 >>> 4;
logic signed [37 : 0] opnet_270;
assign opnet_270 = opnet_265 * obb1_v_x;
logic signed [37 : 0] opnet_271;
assign opnet_271 = opnet_266 * obb1_v_y;
logic signed [37 : 0] opnet_272;
assign opnet_272 = opnet_270 + opnet_271;
assign Point2_2_v = opnet_272 >>> 4;
logic signed [21 : 0] opnet_273;
assign opnet_273 = obb2_Point3_x - (obb1_pos_x >>> 10);
logic signed [21 : 0] opnet_274;
assign opnet_274 = obb2_Point3_y - (obb1_pos_y >>> 10);
logic signed [31 : 0] Point2_3_u;
logic signed [31 : 0] Point2_3_v;
logic signed [37 : 0] opnet_275;
assign opnet_275 = opnet_273 * obb1_u_x;
logic signed [37 : 0] opnet_276;
assign opnet_276 = opnet_274 * obb1_u_y;
logic signed [37 : 0] opnet_277;
assign opnet_277 = opnet_275 + opnet_276;
assign Point2_3_u = opnet_277 >>> 4;
logic signed [37 : 0] opnet_278;
assign opnet_278 = opnet_273 * obb1_v_x;
logic signed [37 : 0] opnet_279;
assign opnet_279 = opnet_274 * obb1_v_y;
logic signed [37 : 0] opnet_280;
assign opnet_280 = opnet_278 + opnet_279;
assign Point2_3_v = opnet_280 >>> 4;


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

// Penetration value intermediaries
logic signed [31:0] min_pen_uA;
logic signed [31:0] min_pen_vA;
logic signed [31:0] min_pen_uB;
logic signed [31:0] min_pen_vB;

logic signed [31:0] min_pen_u;
logic signed [31:0] min_pen_v;

logic signed [31:0] min_pen;

// Normal value intermediaries
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

// Notes on confusing naming here:
//  - min_pen_<> is the minimum penetration value found
//  - pen_min or pen_max corresponds to the penetration value from the min or max u/v values
always_comb begin

// First pass
min_pen_uA = pen_min_uA;
opnet_281 = ~(obb2_u_x) + 1'b1;

opnet_282 = ~(obb2_u_y) + 1'b1;

normal_uA_x = opnet_281;
normal_uA_y = opnet_282;
if (pen_max_uA < pen_min_uA) begin
    min_pen_uA = pen_max_uA;
normal_uA_x = obb2_u_x;
normal_uA_y = obb2_u_y;
end

min_pen_vA = pen_min_vA;
opnet_283 = ~(obb2_v_x) + 1'b1;

opnet_284 = ~(obb2_v_y) + 1'b1;

normal_vA_x = opnet_283;
normal_vA_y = opnet_284;
if (pen_max_vA < pen_min_vA) begin
    min_pen_vA = pen_max_vA;
normal_vA_x = obb2_v_x;
normal_vA_y = obb2_v_y;
end

min_pen_uB = pen_min_uB;
opnet_285 = ~(obb1_u_x) + 1'b1;

opnet_286 = ~(obb1_u_y) + 1'b1;

normal_uB_x = opnet_285;
normal_uB_y = opnet_286;
if (pen_max_uB < pen_min_uB) begin
    min_pen_uB = pen_max_uB;
normal_uB_x = obb1_u_x;
normal_uB_y = obb1_u_y;
end

min_pen_vB = pen_min_vB;
opnet_287 = ~(obb1_v_x) + 1'b1;

opnet_288 = ~(obb1_v_y) + 1'b1;

normal_vB_x = opnet_287;
normal_vB_y = opnet_288;
if (pen_max_vB < pen_min_vB) begin
    min_pen_vB = pen_max_vB;
normal_v_x = obb1_v_x;
normal_v_y = obb1_v_y;
end

// Second pass
min_pen_u = min_pen_uA;
normal_u_x = normal_uA_x;
normal_u_y = normal_uA_y;
if (min_pen_uB < min_pen_uA) begin
    min_pen_u = min_pen_uB;
normal_u_x = normal_uB_x;
normal_u_y = normal_uB_y;
end

min_pen_v = min_pen_vA;
normal_v_x = normal_vA_x;
normal_v_y = normal_vA_y;
if (min_pen_vB < min_pen_vA) begin
    min_pen_v = min_pen_vB;
normal_v_x = normal_vB_x;
normal_v_y = normal_vB_y;
end

// Final pass
min_pen = min_pen_u;
normal_x = normal_u_x;
normal_y = normal_u_y;
if (min_pen_v < min_pen_u) begin
    min_pen = min_pen_v;
normal_x = normal_v_x;
normal_y = normal_v_y;
end

end
logic signed [15 : 0] opnet_281;
logic signed [15 : 0] opnet_282;
logic signed [15 : 0] opnet_283;
logic signed [15 : 0] opnet_284;
logic signed [15 : 0] opnet_285;
logic signed [15 : 0] opnet_286;
logic signed [15 : 0] opnet_287;
logic signed [15 : 0] opnet_288;

/*
always_comb begin
is_collision = ~(separate_min_uA | separate_max_uA | separate_min_vA | separate_max_vA | separate_min_uB | separate_max_uB | separate_min_vB | separate_max_vB);
end
*/

// If any penetrations is negative, there is no collision
assign is_collision = ~min_pen[31];
endmodule