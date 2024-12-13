

module collision_detector(
    input logic signed [7 : 0] obb1_width,
input logic signed [7 : 0] obb1_height,
input logic signed [15 : 0] obb1_inertia,
input logic signed [16 : 0] obb1_inv_mass,
input logic signed [24 : 0] obb1_inv_inertia,
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
    input logic signed [7 : 0] obb2_width,
input logic signed [7 : 0] obb2_height,
input logic signed [15 : 0] obb2_inertia,
input logic signed [16 : 0] obb2_inv_mass,
input logic signed [24 : 0] obb2_inv_inertia,
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
logic signed [21 : 0] opnet_254;
assign opnet_254 = obb1_Point0_x - (obb2_pos_x >>> 2);
logic signed [21 : 0] opnet_255;
assign opnet_255 = obb1_Point0_y - (obb2_pos_y >>> 2);
logic signed [23 : 0] Point1_0_u;
logic signed [23 : 0] Point1_0_v;
logic signed [35 : 0] opnet_256;
assign opnet_256 = opnet_254 * obb2_u_x;
logic signed [35 : 0] opnet_257;
assign opnet_257 = opnet_255 * obb2_u_y;
logic signed [35 : 0] opnet_258;
assign opnet_258 = opnet_256 + opnet_257;
assign Point1_0_u = opnet_258 >>> 12;
logic signed [35 : 0] opnet_259;
assign opnet_259 = opnet_254 * obb2_v_x;
logic signed [35 : 0] opnet_260;
assign opnet_260 = opnet_255 * obb2_v_y;
logic signed [35 : 0] opnet_261;
assign opnet_261 = opnet_259 + opnet_260;
assign Point1_0_v = opnet_261 >>> 12;
logic signed [21 : 0] opnet_262;
assign opnet_262 = obb1_Point1_x - (obb2_pos_x >>> 2);
logic signed [21 : 0] opnet_263;
assign opnet_263 = obb1_Point1_y - (obb2_pos_y >>> 2);
logic signed [23 : 0] Point1_1_u;
logic signed [23 : 0] Point1_1_v;
logic signed [35 : 0] opnet_264;
assign opnet_264 = opnet_262 * obb2_u_x;
logic signed [35 : 0] opnet_265;
assign opnet_265 = opnet_263 * obb2_u_y;
logic signed [35 : 0] opnet_266;
assign opnet_266 = opnet_264 + opnet_265;
assign Point1_1_u = opnet_266 >>> 12;
logic signed [35 : 0] opnet_267;
assign opnet_267 = opnet_262 * obb2_v_x;
logic signed [35 : 0] opnet_268;
assign opnet_268 = opnet_263 * obb2_v_y;
logic signed [35 : 0] opnet_269;
assign opnet_269 = opnet_267 + opnet_268;
assign Point1_1_v = opnet_269 >>> 12;
logic signed [21 : 0] opnet_270;
assign opnet_270 = obb1_Point2_x - (obb2_pos_x >>> 2);
logic signed [21 : 0] opnet_271;
assign opnet_271 = obb1_Point2_y - (obb2_pos_y >>> 2);
logic signed [23 : 0] Point1_2_u;
logic signed [23 : 0] Point1_2_v;
logic signed [35 : 0] opnet_272;
assign opnet_272 = opnet_270 * obb2_u_x;
logic signed [35 : 0] opnet_273;
assign opnet_273 = opnet_271 * obb2_u_y;
logic signed [35 : 0] opnet_274;
assign opnet_274 = opnet_272 + opnet_273;
assign Point1_2_u = opnet_274 >>> 12;
logic signed [35 : 0] opnet_275;
assign opnet_275 = opnet_270 * obb2_v_x;
logic signed [35 : 0] opnet_276;
assign opnet_276 = opnet_271 * obb2_v_y;
logic signed [35 : 0] opnet_277;
assign opnet_277 = opnet_275 + opnet_276;
assign Point1_2_v = opnet_277 >>> 12;
logic signed [21 : 0] opnet_278;
assign opnet_278 = obb1_Point3_x - (obb2_pos_x >>> 2);
logic signed [21 : 0] opnet_279;
assign opnet_279 = obb1_Point3_y - (obb2_pos_y >>> 2);
logic signed [23 : 0] Point1_3_u;
logic signed [23 : 0] Point1_3_v;
logic signed [35 : 0] opnet_280;
assign opnet_280 = opnet_278 * obb2_u_x;
logic signed [35 : 0] opnet_281;
assign opnet_281 = opnet_279 * obb2_u_y;
logic signed [35 : 0] opnet_282;
assign opnet_282 = opnet_280 + opnet_281;
assign Point1_3_u = opnet_282 >>> 12;
logic signed [35 : 0] opnet_283;
assign opnet_283 = opnet_278 * obb2_v_x;
logic signed [35 : 0] opnet_284;
assign opnet_284 = opnet_279 * obb2_v_y;
logic signed [35 : 0] opnet_285;
assign opnet_285 = opnet_283 + opnet_284;
assign Point1_3_v = opnet_285 >>> 12;


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
logic signed [23 : 0] widthB_fixed;
assign widthB_fixed = obb2_halfWidth << 16;
logic signed [23 : 0] heightB_fixed;
assign heightB_fixed = obb2_halfHeight << 16;

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
logic signed [21 : 0] opnet_286;
assign opnet_286 = obb2_Point0_x - (obb1_pos_x >>> 2);
logic signed [21 : 0] opnet_287;
assign opnet_287 = obb2_Point0_y - (obb1_pos_y >>> 2);
logic signed [23 : 0] Point2_0_u;
logic signed [23 : 0] Point2_0_v;
logic signed [35 : 0] opnet_288;
assign opnet_288 = opnet_286 * obb1_u_x;
logic signed [35 : 0] opnet_289;
assign opnet_289 = opnet_287 * obb1_u_y;
logic signed [35 : 0] opnet_290;
assign opnet_290 = opnet_288 + opnet_289;
assign Point2_0_u = opnet_290 >>> 12;
logic signed [35 : 0] opnet_291;
assign opnet_291 = opnet_286 * obb1_v_x;
logic signed [35 : 0] opnet_292;
assign opnet_292 = opnet_287 * obb1_v_y;
logic signed [35 : 0] opnet_293;
assign opnet_293 = opnet_291 + opnet_292;
assign Point2_0_v = opnet_293 >>> 12;
logic signed [21 : 0] opnet_294;
assign opnet_294 = obb2_Point1_x - (obb1_pos_x >>> 2);
logic signed [21 : 0] opnet_295;
assign opnet_295 = obb2_Point1_y - (obb1_pos_y >>> 2);
logic signed [23 : 0] Point2_1_u;
logic signed [23 : 0] Point2_1_v;
logic signed [35 : 0] opnet_296;
assign opnet_296 = opnet_294 * obb1_u_x;
logic signed [35 : 0] opnet_297;
assign opnet_297 = opnet_295 * obb1_u_y;
logic signed [35 : 0] opnet_298;
assign opnet_298 = opnet_296 + opnet_297;
assign Point2_1_u = opnet_298 >>> 12;
logic signed [35 : 0] opnet_299;
assign opnet_299 = opnet_294 * obb1_v_x;
logic signed [35 : 0] opnet_300;
assign opnet_300 = opnet_295 * obb1_v_y;
logic signed [35 : 0] opnet_301;
assign opnet_301 = opnet_299 + opnet_300;
assign Point2_1_v = opnet_301 >>> 12;
logic signed [21 : 0] opnet_302;
assign opnet_302 = obb2_Point2_x - (obb1_pos_x >>> 2);
logic signed [21 : 0] opnet_303;
assign opnet_303 = obb2_Point2_y - (obb1_pos_y >>> 2);
logic signed [23 : 0] Point2_2_u;
logic signed [23 : 0] Point2_2_v;
logic signed [35 : 0] opnet_304;
assign opnet_304 = opnet_302 * obb1_u_x;
logic signed [35 : 0] opnet_305;
assign opnet_305 = opnet_303 * obb1_u_y;
logic signed [35 : 0] opnet_306;
assign opnet_306 = opnet_304 + opnet_305;
assign Point2_2_u = opnet_306 >>> 12;
logic signed [35 : 0] opnet_307;
assign opnet_307 = opnet_302 * obb1_v_x;
logic signed [35 : 0] opnet_308;
assign opnet_308 = opnet_303 * obb1_v_y;
logic signed [35 : 0] opnet_309;
assign opnet_309 = opnet_307 + opnet_308;
assign Point2_2_v = opnet_309 >>> 12;
logic signed [21 : 0] opnet_310;
assign opnet_310 = obb2_Point3_x - (obb1_pos_x >>> 2);
logic signed [21 : 0] opnet_311;
assign opnet_311 = obb2_Point3_y - (obb1_pos_y >>> 2);
logic signed [23 : 0] Point2_3_u;
logic signed [23 : 0] Point2_3_v;
logic signed [35 : 0] opnet_312;
assign opnet_312 = opnet_310 * obb1_u_x;
logic signed [35 : 0] opnet_313;
assign opnet_313 = opnet_311 * obb1_u_y;
logic signed [35 : 0] opnet_314;
assign opnet_314 = opnet_312 + opnet_313;
assign Point2_3_u = opnet_314 >>> 12;
logic signed [35 : 0] opnet_315;
assign opnet_315 = opnet_310 * obb1_v_x;
logic signed [35 : 0] opnet_316;
assign opnet_316 = opnet_311 * obb1_v_y;
logic signed [35 : 0] opnet_317;
assign opnet_317 = opnet_315 + opnet_316;
assign Point2_3_v = opnet_317 >>> 12;


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
logic signed [23 : 0] widthA_fixed;
assign widthA_fixed = obb1_halfWidth << 16;
logic signed [23 : 0] heightA_fixed;
assign heightA_fixed = obb1_halfHeight << 16;

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
opnet_318 = ~(obb2_u_x) + 1'b1;
opnet_319 = ~(obb2_u_y) + 1'b1;
normal_uA_x = opnet_318;
normal_uA_y = opnet_319;
if (pen_max_uA < pen_min_uA) begin
    min_pen_uA = pen_max_uA;
normal_uA_x = obb2_u_x;
normal_uA_y = obb2_u_y;
end

min_pen_vA = pen_min_vA;
opnet_320 = ~(obb2_v_x) + 1'b1;
opnet_321 = ~(obb2_v_y) + 1'b1;
normal_vA_x = opnet_320;
normal_vA_y = opnet_321;
if (pen_max_vA < pen_min_vA) begin
    min_pen_vA = pen_max_vA;
normal_vA_x = obb2_v_x;
normal_vA_y = obb2_v_y;
end

min_pen_uB = pen_min_uB;
opnet_322 = ~(obb1_u_x) + 1'b1;
opnet_323 = ~(obb1_u_y) + 1'b1;
normal_uB_x = opnet_322;
normal_uB_y = opnet_323;
if (pen_max_uB < pen_min_uB) begin
    min_pen_uB = pen_max_uB;
normal_uB_x = obb1_u_x;
normal_uB_y = obb1_u_y;
end

min_pen_vB = pen_min_vB;
opnet_324 = ~(obb1_v_x) + 1'b1;
opnet_325 = ~(obb1_v_y) + 1'b1;
normal_vB_x = opnet_324;
normal_vB_y = opnet_325;
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
logic signed [15 : 0] opnet_318;
logic signed [15 : 0] opnet_319;
logic signed [15 : 0] opnet_320;
logic signed [15 : 0] opnet_321;
logic signed [15 : 0] opnet_322;
logic signed [15 : 0] opnet_323;
logic signed [15 : 0] opnet_324;
logic signed [15 : 0] opnet_325;

/*
always_comb begin
is_collision = ~(separate_min_uA | separate_max_uA | separate_min_vA | separate_max_vA | separate_min_uB | separate_max_uB | separate_min_vB | separate_max_vB);
end
*/

// If any penetrations is negative, there is no collision
assign is_collision = ~min_pen[31];
endmodule