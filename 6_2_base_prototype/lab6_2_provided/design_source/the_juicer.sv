// THE JUICER
//  - Takes an input OBB and spits out all the good yummy processed data
//  - The reason this isn't coupled with the OBB register is that some of
//    the operations are very expensive, and we want to use them sparingly


module juicer(
    input logic signed [7 : 0] width,
input logic signed [7 : 0] height,
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
logic signed [15 : 0] opnet_327;
assign opnet_327 = ~(sin_1) + 1'b1;

assign v_x = opnet_327;
assign v_y = cos_1;


///// Second order of biz: Get the vertices of the OBB
assign halfWidth = width >> 1;
assign halfHeight = height >> 1;

logic signed [6 : 0] opnet_328;
assign opnet_328 = ~(halfWidth) + 1'b1;

logic signed [6 : 0] opnet_329;
assign opnet_329 = ~(halfHeight) + 1'b1;

logic signed [22 : 0] opnet_330;
assign opnet_330 = opnet_328 * u_x;
logic signed [22 : 0] opnet_331;
assign opnet_331 = opnet_329 * v_x;
logic signed [22 : 0] opnet_332;
assign opnet_332 = opnet_330 + opnet_331;
logic signed [22 : 0] opnet_333;
assign opnet_333 = opnet_328 * u_y;
logic signed [22 : 0] opnet_334;
assign opnet_334 = opnet_329 * v_y;
logic signed [22 : 0] opnet_335;
assign opnet_335 = opnet_333 + opnet_334;
logic signed [22 : 0] opnet_336;
assign opnet_336 = opnet_332 + (pos_x >>> 10);
logic signed [22 : 0] opnet_337;
assign opnet_337 = opnet_335 + (pos_y >>> 10);
assign Point0_x = opnet_336;
assign Point0_y = opnet_337;
logic signed [22 : 0] opnet_338;
assign opnet_338 = opnet_328 * u_x;
logic signed [22 : 0] opnet_339;
assign opnet_339 = halfHeight * v_x;
logic signed [22 : 0] opnet_340;
assign opnet_340 = opnet_338 + opnet_339;
logic signed [22 : 0] opnet_341;
assign opnet_341 = opnet_328 * u_y;
logic signed [22 : 0] opnet_342;
assign opnet_342 = halfHeight * v_y;
logic signed [22 : 0] opnet_343;
assign opnet_343 = opnet_341 + opnet_342;
logic signed [22 : 0] opnet_344;
assign opnet_344 = opnet_340 + (pos_x >>> 10);
logic signed [22 : 0] opnet_345;
assign opnet_345 = opnet_343 + (pos_y >>> 10);
assign Point1_x = opnet_344;
assign Point1_y = opnet_345;
logic signed [6 : 0] opnet_346;
assign opnet_346 = ~(halfHeight) + 1'b1;

logic signed [22 : 0] opnet_347;
assign opnet_347 = halfWidth * u_x;
logic signed [22 : 0] opnet_348;
assign opnet_348 = opnet_346 * v_x;
logic signed [22 : 0] opnet_349;
assign opnet_349 = opnet_347 + opnet_348;
logic signed [22 : 0] opnet_350;
assign opnet_350 = halfWidth * u_y;
logic signed [22 : 0] opnet_351;
assign opnet_351 = opnet_346 * v_y;
logic signed [22 : 0] opnet_352;
assign opnet_352 = opnet_350 + opnet_351;
logic signed [22 : 0] opnet_353;
assign opnet_353 = opnet_349 + (pos_x >>> 10);
logic signed [22 : 0] opnet_354;
assign opnet_354 = opnet_352 + (pos_y >>> 10);
assign Point2_x = opnet_353;
assign Point2_y = opnet_354;
logic signed [22 : 0] opnet_355;
assign opnet_355 = halfWidth * u_x;
logic signed [22 : 0] opnet_356;
assign opnet_356 = halfHeight * v_x;
logic signed [22 : 0] opnet_357;
assign opnet_357 = opnet_355 + opnet_356;
logic signed [22 : 0] opnet_358;
assign opnet_358 = halfWidth * u_y;
logic signed [22 : 0] opnet_359;
assign opnet_359 = halfHeight * v_y;
logic signed [22 : 0] opnet_360;
assign opnet_360 = opnet_358 + opnet_359;
logic signed [22 : 0] opnet_361;
assign opnet_361 = opnet_357 + (pos_x >>> 10);
logic signed [22 : 0] opnet_362;
assign opnet_362 = opnet_360 + (pos_y >>> 10);
assign Point3_x = opnet_361;
assign Point3_y = opnet_362;

endmodule