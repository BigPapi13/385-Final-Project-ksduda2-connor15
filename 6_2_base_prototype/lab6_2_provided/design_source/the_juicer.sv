// THE JUICER
//  - Takes an input OBB and spits out all the good yummy processed data
//  - The reason this isn't coupled with the OBB register is that some of
//    the operations are very expensive, and we want to use them sparingly


module juicer(
    input logic [7 : 0] width,
input logic [7 : 0] height,
input logic [15 : 0] inertia,
input logic [15 : 0] inv_mass,
input logic [23 : 0] inv_inertia,
input logic signed [23 : 0] pos_x, input logic signed [23 : 0] pos_y,
input logic signed [23 : 0] vel_x, input logic signed [23 : 0] vel_y,
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
logic signed [15 : 0] opnet_361;
assign opnet_361 = ~(sin_1) + 1'b1;

assign v_x = opnet_361;
assign v_y = cos_1;


///// Second order of biz: Get the vertices of the OBB
assign halfWidth = width >> 1;
assign halfHeight = height >> 1;

logic signed [6 : 0] opnet_362;
assign opnet_362 = ~(halfWidth) + 1'b1;

logic signed [21 : 0] opnet_363;
assign opnet_363 = opnet_362 * u_x;
logic signed [6 : 0] opnet_364;
assign opnet_364 = ~(halfHeight) + 1'b1;

logic signed [21 : 0] opnet_365;
assign opnet_365 = opnet_364 * v_x;
logic signed [20 : 0] opnet_366;
assign opnet_366 = opnet_363 + opnet_365;
logic signed [6 : 0] opnet_367;
assign opnet_367 = ~(halfWidth) + 1'b1;

logic signed [21 : 0] opnet_368;
assign opnet_368 = opnet_367 * u_y;
logic signed [6 : 0] opnet_369;
assign opnet_369 = ~(halfHeight) + 1'b1;

logic signed [21 : 0] opnet_370;
assign opnet_370 = opnet_369 * v_y;
logic signed [20 : 0] opnet_371;
assign opnet_371 = opnet_368 + opnet_370;
logic signed [6 : 0] opnet_372;
assign opnet_372 = ~(halfWidth) + 1'b1;

logic signed [21 : 0] opnet_373;
assign opnet_373 = opnet_372 * u_x;
logic signed [21 : 0] opnet_374;
assign opnet_374 = halfHeight * v_x;
logic signed [20 : 0] opnet_375;
assign opnet_375 = opnet_373 + opnet_374;
logic signed [6 : 0] opnet_376;
assign opnet_376 = ~(halfWidth) + 1'b1;

logic signed [21 : 0] opnet_377;
assign opnet_377 = opnet_376 * u_y;
logic signed [21 : 0] opnet_378;
assign opnet_378 = halfHeight * v_y;
logic signed [20 : 0] opnet_379;
assign opnet_379 = opnet_377 + opnet_378;
logic signed [21 : 0] opnet_380;
assign opnet_380 = (pos_x >>> 2) + opnet_366;
logic signed [21 : 0] opnet_381;
assign opnet_381 = (pos_y >>> 2) + opnet_371;
assign Point0_x = opnet_380;
assign Point0_y = opnet_381;
logic signed [21 : 0] opnet_382;
assign opnet_382 = (pos_x >>> 2) + opnet_375;
logic signed [21 : 0] opnet_383;
assign opnet_383 = (pos_y >>> 2) + opnet_379;
assign Point1_x = opnet_382;
assign Point1_y = opnet_383;
logic signed [21 : 0] opnet_384;
assign opnet_384 = (pos_x >>> 2) - opnet_366;
logic signed [21 : 0] opnet_385;
assign opnet_385 = (pos_y >>> 2) - opnet_371;
assign Point2_x = opnet_384;
assign Point2_y = opnet_385;
logic signed [21 : 0] opnet_386;
assign opnet_386 = (pos_x >>> 2) - opnet_375;
logic signed [21 : 0] opnet_387;
assign opnet_387 = (pos_y >>> 2) - opnet_379;
assign Point3_x = opnet_386;
assign Point3_y = opnet_387;

endmodule