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
    input logic [7 : 0] obb1_width,
input logic [7 : 0] obb1_height,
input logic [15 : 0] obb1_inertia,
input logic [15 : 0] obb1_inv_mass,
input logic [23 : 0] obb1_inv_inertia,
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
    input logic [7 : 0] obb2_width,
input logic [7 : 0] obb2_height,
input logic [15 : 0] obb2_inertia,
input logic [15 : 0] obb2_inv_mass,
input logic [23 : 0] obb2_inv_inertia,
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
    input  logic [9:0] DrawX, DrawY,
    output logic [3:0]  Red, Green, Blue
);
    
    logic obb1_on;
    logic obb2_on;
	 
    // Rescaled versions of DrawX and DrawY
logic signed [23 : 0] DrawXs;
logic signed [23 : 0] DrawYs;
assign DrawXs = DrawX << 14;
assign DrawYs = DrawY << 14;

    // Determine if point is in first square
logic signed [23 : 0] DrawXRel1;
logic signed [23 : 0] DrawYRel1;
logic signed [23 : 0] opnet_324;
assign opnet_324 = DrawXs - obb1_pos_x;
assign DrawXRel1 = opnet_324;
logic signed [23 : 0] opnet_325;
assign opnet_325 = DrawYs - obb1_pos_y;
assign DrawYRel1 = opnet_325;

logic signed [23 : 0] u_projection1;
logic signed [23 : 0] v_projection1;

always_comb begin
        // Need to determine if DrawXs and DrawXy are in the square
        // Steps:
        //  - Get Pixel position relative to square position
        //  - Project onto u and v axes
        //  - Compare to half width and half height
opnet_326 = DrawXRel1 * obb1_u_x;
opnet_327 = DrawYRel1 * obb1_u_y;
opnet_328 = opnet_326[38:15] + opnet_327[38:15];
u_projection1 = opnet_328 << 1;
opnet_329 = DrawXRel1 * obb1_v_x;
opnet_330 = DrawYRel1 * obb1_v_y;
opnet_331 = opnet_329[38:15] + opnet_330[38:15];
v_projection1 = opnet_331 << 1;

        obb1_on = 0;
        if (u_projection1 > -(obb1_halfWidth << 16) && u_projection1 < (obb1_halfWidth << 16) && v_projection1 > -(obb1_halfHeight << 16) && v_projection1 < (obb1_halfHeight << 16) 
        ) begin
            obb1_on = 1;
        end

end
logic signed [38 : 0] opnet_326;
logic signed [38 : 0] opnet_327;
logic signed [22 : 0] opnet_328;
logic signed [38 : 0] opnet_329;
logic signed [38 : 0] opnet_330;
logic signed [22 : 0] opnet_331;

    // Determine if point is in second square
logic signed [23 : 0] DrawXRel2;
logic signed [23 : 0] DrawYRel2;
logic signed [23 : 0] opnet_332;
assign opnet_332 = DrawXs - obb2_pos_x;
assign DrawXRel2 = opnet_332;
logic signed [23 : 0] opnet_333;
assign opnet_333 = DrawYs - obb2_pos_y;
assign DrawYRel2 = opnet_333;

logic signed [23 : 0] u_projection2;
logic signed [23 : 0] v_projection2;

always_comb begin
        // Need to determine if DrawXs and DrawXy are in the square
        // Steps:
        //  - Get Pixel position relative to square position
        //  - Project onto u and v axes
        //  - Compare to half width and half height
opnet_334 = DrawXRel2 * obb2_u_x;
opnet_335 = DrawYRel2 * obb2_u_y;
opnet_336 = opnet_334[38:15] + opnet_335[38:15];
u_projection2 = opnet_336 << 1;
opnet_337 = DrawXRel2 * obb2_v_x;
opnet_338 = DrawYRel2 * obb2_v_y;
opnet_339 = opnet_337[38:15] + opnet_338[38:15];
v_projection2 = opnet_339 << 1;

        obb2_on = 0;
        if (u_projection2 > -(obb2_halfWidth << 16) && u_projection2 < (obb2_halfWidth << 16) && v_projection2 > -(obb2_halfHeight << 16) && v_projection2 < (obb2_halfHeight << 16) 
        ) begin
            obb2_on = 1;
        end

end
logic signed [38 : 0] opnet_334;
logic signed [38 : 0] opnet_335;
logic signed [22 : 0] opnet_336;
logic signed [38 : 0] opnet_337;
logic signed [38 : 0] opnet_338;
logic signed [22 : 0] opnet_339;

    logic is_collision;

    collision_detector cm_cd_inst(
        .obb1_width(obb1_width),
.obb1_height(obb1_height),
.obb1_inertia(obb1_inertia),
.obb1_inv_mass(obb1_inv_mass),
.obb1_inv_inertia(obb1_inv_inertia),
.obb1_pos_x(obb1_pos_x),
.obb1_pos_y(obb1_pos_y),
.obb1_vel_x(obb1_vel_x),
.obb1_vel_y(obb1_vel_y),
.obb1_angle(obb1_angle),
.obb1_omega(obb1_omega),
.obb1_u_x(obb1_u_x),
.obb1_u_y(obb1_u_y),
.obb1_v_x(obb1_v_x),
.obb1_v_y(obb1_v_y),
.obb1_Point0_x(obb1_Point0_x),
.obb1_Point0_y(obb1_Point0_y),
.obb1_Point1_x(obb1_Point1_x),
.obb1_Point1_y(obb1_Point1_y),
.obb1_Point2_x(obb1_Point2_x),
.obb1_Point2_y(obb1_Point2_y),
.obb1_Point3_x(obb1_Point3_x),
.obb1_Point3_y(obb1_Point3_y),
.obb1_halfWidth(obb1_halfWidth),
.obb1_halfHeight(obb1_halfHeight),
        .obb2_width(obb2_width),
.obb2_height(obb2_height),
.obb2_inertia(obb2_inertia),
.obb2_inv_mass(obb2_inv_mass),
.obb2_inv_inertia(obb2_inv_inertia),
.obb2_pos_x(obb2_pos_x),
.obb2_pos_y(obb2_pos_y),
.obb2_vel_x(obb2_vel_x),
.obb2_vel_y(obb2_vel_y),
.obb2_angle(obb2_angle),
.obb2_omega(obb2_omega),
.obb2_u_x(obb2_u_x),
.obb2_u_y(obb2_u_y),
.obb2_v_x(obb2_v_x),
.obb2_v_y(obb2_v_y),
.obb2_Point0_x(obb2_Point0_x),
.obb2_Point0_y(obb2_Point0_y),
.obb2_Point1_x(obb2_Point1_x),
.obb2_Point1_y(obb2_Point1_y),
.obb2_Point2_x(obb2_Point2_x),
.obb2_Point2_y(obb2_Point2_y),
.obb2_Point3_x(obb2_Point3_x),
.obb2_Point3_y(obb2_Point3_y),
.obb2_halfWidth(obb2_halfWidth),
.obb2_halfHeight(obb2_halfHeight),
        .is_collision(is_collision)
    );

always_comb begin
        if ((obb1_on == 1'b1) || (obb2_on == 1'b1)) begin
            Red = 4'hf;
            Green = 4'hf;
            Blue = 4'hf;

            if (is_collision) begin
                Green = 4'h0;
                Blue = 4'h0;
            end
        end       
        else begin 
            Red = 4'h4; 
            Green = 4'h3;
            Blue = 4'h7;
        end

        // Draw end points

opnet_340 = drawPoint_x - (DrawXs >>> 2);
opnet_341 = drawPoint_y - (DrawYs >>> 2);
        if (opnet_340 >= 22'sb1111111100000000000000 && opnet_340 <= 22'sb0000000100000000000000 && opnet_341 >= 22'sb1111111100000000000000 && opnet_341 <= 22'sb0000000100000000000000) begin
            Red = 4'hf;
            Green = 4'hc;
            Blue = 4'h0;
        end
end
logic signed [21 : 0] opnet_340;
logic signed [21 : 0] opnet_341;
    
endmodule
