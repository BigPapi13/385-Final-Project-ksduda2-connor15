// THE JUICER
//  - Takes an input OBB and spits out all the good yummy processed data
//  - The reason this isn't coupled with the OBB register is that some of
//    the operations are very expensive, and we want to use them sparingly


module juicer(
    input logic [7 : 0] width,
input logic [7 : 0] height,
input logic [7 : 0] mass,
input logic [15 : 0] inertia,
input logic [15 : 0] inv_mass,
input logic [23 : 0] inv_inertia,
input logic signed [31 : 0] pos_x, input logic signed [31 : 0] pos_y,
input logic signed [31 : 0] vel_x, input logic signed [31 : 0] vel_y,
input logic signed [10 : 0] angle,
input logic signed [10 : 0] omega,
    output logic signed [15 : 0] u_x, output logic signed [15 : 0] u_y,
output logic signed [15 : 0] v_x, output logic signed [15 : 0] v_y,
output logic signed [21 : 0] Point0_x, output logic signed [21 : 0] Point0_y,
output logic signed [21 : 0] Point1_x, output logic signed [21 : 0] Point1_y,
output logic signed [21 : 0] Point2_x, output logic signed [21 : 0] Point2_y,
output logic signed [21 : 0] Point3_x, output logic signed [21 : 0] Point3_y,
output logic signed [6 : 0] halfWidth,
output logic signed [6 : 0] halfHeight
);

////// First thing to process: Getting U and V vectors

// Grab only necessary bits of angle
logic signed [9 : 0] angleP;
assign angleP = angle;

// Get sine and cos
logic signed [15 : 0] cos_1;
cos cos_inst_1(.theta(angleP), .out(cos_1));
logic signed [15 : 0] sin_1;
sin sin_inst_1(.theta(angleP), .out(sin_1));

// Assign to vectors
assign u_x = cos_1;
assign u_y = sin_1;
logic signed [15 : 0] opnet_363;
assign opnet_363 = ~(sin_1) + 1'b1;

assign v_x = opnet_363;
assign v_y = cos_1;


///// Second order of biz: Get the vertices of the OBB
assign halfWidth = width >> 1;
assign halfHeight = height >> 1;

logic signed [6 : 0] opnet_364;
assign opnet_364 = ~(halfWidth) + 1'b1;

logic signed [6 : 0] opnet_365;
assign opnet_365 = ~(halfHeight) + 1'b1;

logic signed [22 : 0] opnet_366;
assign opnet_366 = opnet_364 * u_x;
logic signed [22 : 0] opnet_367;
assign opnet_367 = opnet_365 * v_x;
logic signed [22 : 0] opnet_368;
assign opnet_368 = opnet_366 + opnet_367;
logic signed [22 : 0] opnet_369;
assign opnet_369 = opnet_364 * u_y;
logic signed [22 : 0] opnet_370;
assign opnet_370 = opnet_365 * v_y;
logic signed [22 : 0] opnet_371;
assign opnet_371 = opnet_369 + opnet_370;
logic signed [22 : 0] opnet_372;
assign opnet_372 = opnet_368 + (pos_x >>> 10);
logic signed [22 : 0] opnet_373;
assign opnet_373 = opnet_371 + (pos_y >>> 10);
assign Point0_x = opnet_372;
assign Point0_y = opnet_373;
logic signed [22 : 0] opnet_374;
assign opnet_374 = opnet_364 * u_x;
logic signed [22 : 0] opnet_375;
assign opnet_375 = halfHeight * v_x;
logic signed [22 : 0] opnet_376;
assign opnet_376 = opnet_374 + opnet_375;
logic signed [22 : 0] opnet_377;
assign opnet_377 = opnet_364 * u_y;
logic signed [22 : 0] opnet_378;
assign opnet_378 = halfHeight * v_y;
logic signed [22 : 0] opnet_379;
assign opnet_379 = opnet_377 + opnet_378;
logic signed [22 : 0] opnet_380;
assign opnet_380 = opnet_376 + (pos_x >>> 10);
logic signed [22 : 0] opnet_381;
assign opnet_381 = opnet_379 + (pos_y >>> 10);
assign Point1_x = opnet_380;
assign Point1_y = opnet_381;
logic signed [6 : 0] opnet_382;
assign opnet_382 = ~(halfHeight) + 1'b1;

logic signed [22 : 0] opnet_383;
assign opnet_383 = halfWidth * u_x;
logic signed [22 : 0] opnet_384;
assign opnet_384 = opnet_382 * v_x;
logic signed [22 : 0] opnet_385;
assign opnet_385 = opnet_383 + opnet_384;
logic signed [22 : 0] opnet_386;
assign opnet_386 = halfWidth * u_y;
logic signed [22 : 0] opnet_387;
assign opnet_387 = opnet_382 * v_y;
logic signed [22 : 0] opnet_388;
assign opnet_388 = opnet_386 + opnet_387;
logic signed [22 : 0] opnet_389;
assign opnet_389 = opnet_385 + (pos_x >>> 10);
logic signed [22 : 0] opnet_390;
assign opnet_390 = opnet_388 + (pos_y >>> 10);
assign Point2_x = opnet_389;
assign Point2_y = opnet_390;
logic signed [22 : 0] opnet_391;
assign opnet_391 = halfWidth * u_x;
logic signed [22 : 0] opnet_392;
assign opnet_392 = halfHeight * v_x;
logic signed [22 : 0] opnet_393;
assign opnet_393 = opnet_391 + opnet_392;
logic signed [22 : 0] opnet_394;
assign opnet_394 = halfWidth * u_y;
logic signed [22 : 0] opnet_395;
assign opnet_395 = halfHeight * v_y;
logic signed [22 : 0] opnet_396;
assign opnet_396 = opnet_394 + opnet_395;
logic signed [22 : 0] opnet_397;
assign opnet_397 = opnet_393 + (pos_x >>> 10);
logic signed [22 : 0] opnet_398;
assign opnet_398 = opnet_396 + (pos_y >>> 10);
assign Point3_x = opnet_397;
assign Point3_y = opnet_398;

endmodule