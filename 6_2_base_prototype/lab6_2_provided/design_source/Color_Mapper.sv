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
input logic signed [31 : 0] obb1_pos_x, input logic signed [31 : 0] obb1_pos_y,
input logic signed [31 : 0] obb1_vel_x, input logic signed [31 : 0] obb1_vel_y,
input logic signed [10 : 0] obb1_angle,
input logic signed [10 : 0] obb1_omega,
input logic signed [15 : 0] obb1_u_x, input logic signed [15 : 0] obb1_u_y,
input logic signed [15 : 0] obb1_v_x, input logic signed [15 : 0] obb1_v_y,
input logic signed [20 : 0] obb1_Point0_x, input logic signed [20 : 0] obb1_Point0_y,
input logic signed [20 : 0] obb1_Point1_x, input logic signed [20 : 0] obb1_Point1_y,
input logic signed [20 : 0] obb1_Point2_x, input logic signed [20 : 0] obb1_Point2_y,
input logic signed [20 : 0] obb1_Point3_x, input logic signed [20 : 0] obb1_Point3_y,
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
input logic signed [20 : 0] obb2_Point0_x, input logic signed [20 : 0] obb2_Point0_y,
input logic signed [20 : 0] obb2_Point1_x, input logic signed [20 : 0] obb2_Point1_y,
input logic signed [20 : 0] obb2_Point2_x, input logic signed [20 : 0] obb2_Point2_y,
input logic signed [20 : 0] obb2_Point3_x, input logic signed [20 : 0] obb2_Point3_y,
input logic signed [6 : 0] obb2_halfWidth,
input logic signed [6 : 0] obb2_halfHeight, 
    input  logic [9:0] DrawX, DrawY,
    output logic [3:0]  Red, Green, Blue
);
    
    logic obb1_on;
    logic obb2_on;
	 
    // Rescaled versions of DrawX and DrawY
logic signed [31 : 0] DrawXs;
logic signed [31 : 0] DrawYs;
assign DrawXs = DrawX << 22;
assign DrawYs = DrawY << 22;

    // Determine if point is in first square
logic signed [31 : 0] DrawXRel1;
logic signed [31 : 0] DrawYRel1;
logic signed [31 : 0] opnet_199;
assign opnet_199 = DrawXs - obb1_pos_x;
assign DrawXRel1 = opnet_199;
logic signed [31 : 0] opnet_200;
assign opnet_200 = DrawYs - obb1_pos_y;
assign DrawYRel1 = opnet_200;

logic signed [31 : 0] u_projection1;
logic signed [31 : 0] v_projection1;

always_comb begin
        // Need to determine if DrawXs and DrawXy are in the square
        // Steps:
        //  - Get Pixel position relative to square position
        //  - Project onto u and v axes
        //  - Compare to half width and half height
opnet_201 = DrawXRel1 * obb1_u_x;
opnet_202 = DrawYRel1 * obb1_u_y;
opnet_203 = opnet_201 + opnet_202;
u_projection1 = opnet_203 >>> 14;
opnet_204 = DrawXRel1 * obb1_v_x;
opnet_205 = DrawYRel1 * obb1_v_y;
opnet_206 = opnet_204 + opnet_205;
v_projection1 = opnet_206 >>> 14;

        obb1_on = 0;
        if (u_projection1 > -(obb1_halfWidth << 24) && u_projection1 < (obb1_halfWidth << 24) && v_projection1 > -(obb1_halfHeight << 24) && v_projection1 < (obb1_halfHeight << 24) 
        ) begin
            obb1_on = 1;
        end

end
logic signed [47 : 0] opnet_201;
logic signed [47 : 0] opnet_202;
logic signed [47 : 0] opnet_203;
logic signed [47 : 0] opnet_204;
logic signed [47 : 0] opnet_205;
logic signed [47 : 0] opnet_206;

    // Determine if point is in second square
logic signed [31 : 0] DrawXRel2;
logic signed [31 : 0] DrawYRel2;
logic signed [31 : 0] opnet_207;
assign opnet_207 = DrawXs - obb2_pos_x;
assign DrawXRel2 = opnet_207;
logic signed [31 : 0] opnet_208;
assign opnet_208 = DrawYs - obb2_pos_y;
assign DrawYRel2 = opnet_208;

logic signed [31 : 0] u_projection2;
logic signed [31 : 0] v_projection2;

always_comb begin
        // Need to determine if DrawXs and DrawXy are in the square
        // Steps:
        //  - Get Pixel position relative to square position
        //  - Project onto u and v axes
        //  - Compare to half width and half height
opnet_209 = DrawXRel2 * obb2_u_x;
opnet_210 = DrawYRel2 * obb2_u_y;
opnet_211 = opnet_209 + opnet_210;
u_projection2 = opnet_211 >>> 14;
opnet_212 = DrawXRel2 * obb2_v_x;
opnet_213 = DrawYRel2 * obb2_v_y;
opnet_214 = opnet_212 + opnet_213;
v_projection2 = opnet_214 >>> 14;

        obb2_on = 0;
        if (u_projection2 > -(obb2_halfWidth << 24) && u_projection2 < (obb2_halfWidth << 24) && v_projection2 > -(obb2_halfHeight << 24) && v_projection2 < (obb2_halfHeight << 24) 
        ) begin
            obb2_on = 1;
        end

end
logic signed [47 : 0] opnet_209;
logic signed [47 : 0] opnet_210;
logic signed [47 : 0] opnet_211;
logic signed [47 : 0] opnet_212;
logic signed [47 : 0] opnet_213;
logic signed [47 : 0] opnet_214;

    logic is_collision;

    collision_detector cm_cd_inst(
        .obb1_width(obb1_width),
.obb1_height(obb1_height),
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

    always_comb
    begin:RGB_Display
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
    end 
    
endmodule
