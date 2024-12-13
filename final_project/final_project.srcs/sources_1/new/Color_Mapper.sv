//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Zuofu Cheng   08-19-2023                               --
//                                                                       --
//    Fall 2023 Distribution                                             --
//                                                                       --
//    For use with ECE 385 USB + HDMI                                    --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------





module  color_mapper (
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
    input logic signed [21 : 0] drawPoint_x, input logic signed [21 : 0] drawPoint_y,
    input logic separating,
    input  logic [5:0] DrawX, DrawY,
    output logic [3:0]  Red, Green, Blue
);
    
    logic obb1_on;
    logic obb2_on;
	 
    // Rescaled versions of DrawX and DrawY
logic signed [23 : 0] DrawXs;
logic signed [23 : 0] DrawYs;
assign DrawXs = DrawX << 16;
assign DrawYs = DrawY << 16;

    // Determine if point is in first square
logic signed [23 : 0] DrawXRel1;
logic signed [23 : 0] DrawYRel1;
logic signed [23 : 0] opnet_326;
assign opnet_326 = DrawXs - obb1_pos_x;
assign DrawXRel1 = opnet_326;
logic signed [23 : 0] opnet_327;
assign opnet_327 = DrawYs - obb1_pos_y;
assign DrawYRel1 = opnet_327;

logic signed [23 : 0] u_projection1;
logic signed [23 : 0] v_projection1;

always_comb begin
        // Need to determine if DrawXs and DrawXy are in the square
        // Steps:
        //  - Get Pixel position relative to square position
        //  - Project onto u and v axes
        //  - Compare to half width and half height
opnet_328 = DrawXRel1 * obb1_u_x;
opnet_329 = DrawYRel1 * obb1_u_y;
opnet_330 = opnet_328 + opnet_329;
u_projection1 = opnet_330 >>> 14;
opnet_331 = DrawXRel1 * obb1_v_x;
opnet_332 = DrawYRel1 * obb1_v_y;
opnet_333 = opnet_331 + opnet_332;
v_projection1 = opnet_333 >>> 14;

        obb1_on = 0;
        if (u_projection1 > -(obb1_halfWidth << 16) && u_projection1 < (obb1_halfWidth << 16) && v_projection1 > -(obb1_halfHeight << 16) && v_projection1 < (obb1_halfHeight << 16) 
        ) begin
            obb1_on = 1;
        end

end
logic signed [37 : 0] opnet_328;
logic signed [37 : 0] opnet_329;
logic signed [37 : 0] opnet_330;
logic signed [37 : 0] opnet_331;
logic signed [37 : 0] opnet_332;
logic signed [37 : 0] opnet_333;

    // Determine if point is in second square
logic signed [23 : 0] DrawXRel2;
logic signed [23 : 0] DrawYRel2;
logic signed [23 : 0] opnet_334;
assign opnet_334 = DrawXs - obb2_pos_x;
assign DrawXRel2 = opnet_334;
logic signed [23 : 0] opnet_335;
assign opnet_335 = DrawYs - obb2_pos_y;
assign DrawYRel2 = opnet_335;

logic signed [23 : 0] u_projection2;
logic signed [23 : 0] v_projection2;

always_comb begin
        // Need to determine if DrawXs and DrawXy are in the square
        // Steps:
        //  - Get Pixel position relative to square position
        //  - Project onto u and v axes
        //  - Compare to half width and half height
opnet_336 = DrawXRel2 * obb2_u_x;
opnet_337 = DrawYRel2 * obb2_u_y;
opnet_338 = opnet_336 + opnet_337;
u_projection2 = opnet_338 >>> 14;
opnet_339 = DrawXRel2 * obb2_v_x;
opnet_340 = DrawYRel2 * obb2_v_y;
opnet_341 = opnet_339 + opnet_340;
v_projection2 = opnet_341 >>> 14;

        obb2_on = 0;
        if (u_projection2 > -(obb2_halfWidth << 16) && u_projection2 < (obb2_halfWidth << 16) && v_projection2 > -(obb2_halfHeight << 16) && v_projection2 < (obb2_halfHeight << 16) 
        ) begin
            obb2_on = 1;
        end

end
logic signed [37 : 0] opnet_336;
logic signed [37 : 0] opnet_337;
logic signed [37 : 0] opnet_338;
logic signed [37 : 0] opnet_339;
logic signed [37 : 0] opnet_340;
logic signed [37 : 0] opnet_341;

always_comb begin
        if ((obb1_on == 1'b1) || (obb2_on == 1'b1)) begin
            Red = 4'hf;
            Green = 4'h0;
            Blue = 4'h0;

        end       
        else begin 
            Red = 4'h0; 
            Green = 4'hf;
            Blue = 4'h0;
        end

        // Draw end points

opnet_342 = drawPoint_x - (DrawXs >>> 2);
opnet_343 = drawPoint_y - (DrawYs >>> 2);
        if (opnet_342 >= 22'sb1111111100000000000000 && opnet_342 <= 22'sb0000000100000000000000 && opnet_343 >= 22'sb1111111100000000000000 && opnet_343 <= 22'sb0000000100000000000000) begin
            Red = 4'hf;
            Green = 4'hc;
            Blue = 4'h0;
            if(separating) begin
                Red = 4'h00;
                Green = 4'hff;
                Blue = 4'h00;
            end
        end
end
logic signed [21 : 0] opnet_342;
logic signed [21 : 0] opnet_343;
    
endmodule