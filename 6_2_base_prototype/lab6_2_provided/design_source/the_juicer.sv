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
output logic signed [20 : 0] Point0_x, output logic signed [20 : 0] Point0_y,
output logic signed [20 : 0] Point1_x, output logic signed [20 : 0] Point1_y,
output logic signed [20 : 0] Point2_x, output logic signed [20 : 0] Point2_y,
output logic signed [20 : 0] Point3_x, output logic signed [20 : 0] Point3_y,
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
logic signed [15 : 0] opnet_222;
assign opnet_222 = ~(sin_1) + 1'b1;

assign v_x = opnet_222;
assign v_y = cos_1;


///// Second order of biz: Get the vertices of the OBB
assign halfWidth = width >> 1;
assign halfHeight = height >> 1;

logic signed [6 : 0] opnet_223;
assign opnet_223 = ~(halfWidth) + 1'b1;

logic signed [6 : 0] opnet_224;
assign opnet_224 = ~(halfHeight) + 1'b1;

logic signed [22 : 0] opnet_225;
assign opnet_225 = opnet_223 * u_x;
logic signed [22 : 0] opnet_226;
assign opnet_226 = opnet_224 * v_x;
logic signed [22 : 0] opnet_227;
assign opnet_227 = opnet_225 + opnet_226;
logic signed [22 : 0] opnet_228;
assign opnet_228 = opnet_223 * u_y;
logic signed [22 : 0] opnet_229;
assign opnet_229 = opnet_224 * v_y;
logic signed [22 : 0] opnet_230;
assign opnet_230 = opnet_228 + opnet_229;
logic signed [22 : 0] opnet_231;
assign opnet_231 = opnet_227 + (pos_x >>> 10);
logic signed [22 : 0] opnet_232;
assign opnet_232 = opnet_230 + (pos_y >>> 10);
assign Point0_x = opnet_231;
assign Point0_y = opnet_232;
logic signed [22 : 0] opnet_233;
assign opnet_233 = opnet_223 * u_x;
logic signed [22 : 0] opnet_234;
assign opnet_234 = halfHeight * v_x;
logic signed [22 : 0] opnet_235;
assign opnet_235 = opnet_233 + opnet_234;
logic signed [22 : 0] opnet_236;
assign opnet_236 = opnet_223 * u_y;
logic signed [22 : 0] opnet_237;
assign opnet_237 = halfHeight * v_y;
logic signed [22 : 0] opnet_238;
assign opnet_238 = opnet_236 + opnet_237;
logic signed [22 : 0] opnet_239;
assign opnet_239 = opnet_235 + (pos_x >>> 10);
logic signed [22 : 0] opnet_240;
assign opnet_240 = opnet_238 + (pos_y >>> 10);
assign Point1_x = opnet_239;
assign Point1_y = opnet_240;
logic signed [6 : 0] opnet_241;
assign opnet_241 = ~(halfHeight) + 1'b1;

logic signed [22 : 0] opnet_242;
assign opnet_242 = halfWidth * u_x;
logic signed [22 : 0] opnet_243;
assign opnet_243 = opnet_241 * v_x;
logic signed [22 : 0] opnet_244;
assign opnet_244 = opnet_242 + opnet_243;
logic signed [22 : 0] opnet_245;
assign opnet_245 = halfWidth * u_y;
logic signed [22 : 0] opnet_246;
assign opnet_246 = opnet_241 * v_y;
logic signed [22 : 0] opnet_247;
assign opnet_247 = opnet_245 + opnet_246;
logic signed [22 : 0] opnet_248;
assign opnet_248 = opnet_244 + (pos_x >>> 10);
logic signed [22 : 0] opnet_249;
assign opnet_249 = opnet_247 + (pos_y >>> 10);
assign Point2_x = opnet_248;
assign Point2_y = opnet_249;
logic signed [22 : 0] opnet_250;
assign opnet_250 = halfWidth * u_x;
logic signed [22 : 0] opnet_251;
assign opnet_251 = halfHeight * v_x;
logic signed [22 : 0] opnet_252;
assign opnet_252 = opnet_250 + opnet_251;
logic signed [22 : 0] opnet_253;
assign opnet_253 = halfWidth * u_y;
logic signed [22 : 0] opnet_254;
assign opnet_254 = halfHeight * v_y;
logic signed [22 : 0] opnet_255;
assign opnet_255 = opnet_253 + opnet_254;
logic signed [22 : 0] opnet_256;
assign opnet_256 = opnet_252 + (pos_x >>> 10);
logic signed [22 : 0] opnet_257;
assign opnet_257 = opnet_255 + (pos_y >>> 10);
assign Point3_x = opnet_256;
assign Point3_y = opnet_257;

endmodule