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

$ from svmath import *
$ from structs import JOBB

$ DrawX = Fixed(8, 2, "DrawX")
$ DrawY = Fixed(8, 2, "DrawY")

$ obb1 = JOBB("obb1")
$ obb2 = JOBB("obb2")

module  color_mapper (
    $$obb1.declare("input")$$,
    $$obb2.declare("input")$$, 
    input  logic [9:0] DrawX, DrawY,
    output logic [3:0]  Red, Green, Blue
);
    
    logic obb1_on;
    logic obb2_on;
	 
    // Rescaled versions of DrawX and DrawY
    $ DrawXs = Fixed(obb1.pos.x.integer_bits, obb1.pos.x.precision, "DrawXs")
    $ DrawYs = Fixed(obb1.pos.y.integer_bits, obb1.pos.y.precision, "DrawYs")
    $ DrawXs.declare()
    $ DrawYs.declare()
    $ DrawXs.assign(DrawX)
    $ DrawYs.assign(DrawY)

    // Determine if point is in first square
    $ DrawXRel1 = Fixed(obb1.pos.x.integer_bits, obb1.pos.x.precision, "DrawXRel1")
    $ DrawYRel1 = Fixed(obb1.pos.y.integer_bits, obb1.pos.y.precision, "DrawYRel1")
    $ DrawRel1 = svmath.ExpressionVec2(DrawXRel1, DrawYRel1)
    $ DrawXRel1.declare()
    $ DrawYRel1.declare()
    $ DrawXRel1.assign(DrawXs - obb1.pos.x)
    $ DrawYRel1.assign(DrawYs - obb1.pos.y)

    $ u_projection1 = Fixed(8, 24, "u_projection1")
    $ v_projection1 = Fixed(8, 24, "v_projection1")
    $ u_projection1.declare()
    $ v_projection1.declare()
    $ halfWidth1 = resize(obb1.halfWidth, u_projection1)
    $ halfHeight1 = resize(obb1.halfHeight, v_projection1)

    $ begin_comb()
        // Need to determine if DrawXs and DrawXy are in the square
        // Steps:
        //  - Get Pixel position relative to square position
        //  - Project onto u and v axes
        //  - Compare to half width and half height
        $ u_projection1.assign(DrawRel1.Dot(obb1.u))
        $ v_projection1.assign(DrawRel1.Dot(obb1.v))

        obb1_on = 0;
        if (u_projection1 > -$$halfWidth1$$ && u_projection1 < $$halfWidth1$$ && v_projection1 > -$$halfHeight1$$ && v_projection1 < $$halfHeight1$$ 
        ) begin
            obb1_on = 1;
        end

    $ end_comb()

    // Determine if point is in second square
    $ DrawXRel2 = Fixed(obb2.pos.x.integer_bits, obb2.pos.x.precision, "DrawXRel2")
    $ DrawYRel2 = Fixed(obb2.pos.y.integer_bits, obb2.pos.y.precision, "DrawYRel2")
    $ DrawRel2 = svmath.ExpressionVec2(DrawXRel2, DrawYRel2)
    $ DrawXRel2.declare()
    $ DrawYRel2.declare()
    $ DrawXRel2.assign(DrawXs - obb2.pos.x)
    $ DrawYRel2.assign(DrawYs - obb2.pos.y)

    $ u_projection2 = Fixed(8, 24, "u_projection2")
    $ v_projection2 = Fixed(8, 24, "v_projection2")
    $ u_projection2.declare()
    $ v_projection2.declare()
    $ halfWidth2 = resize(obb2.halfWidth, u_projection2)
    $ halfHeight2 = resize(obb2.halfHeight, v_projection2)

    $ begin_comb()
        // Need to determine if DrawXs and DrawXy are in the square
        // Steps:
        //  - Get Pixel position relative to square position
        //  - Project onto u and v axes
        //  - Compare to half width and half height
        $ u_projection2.assign(DrawRel2.Dot(obb2.u))
        $ v_projection2.assign(DrawRel2.Dot(obb2.v))

        obb2_on = 0;
        if (u_projection2 > -$$halfWidth2$$ && u_projection2 < $$halfWidth2$$ && v_projection2 > -$$halfHeight2$$ && v_projection2 < $$halfHeight2$$ 
        ) begin
            obb2_on = 1;
        end

    $ end_comb()

    logic is_collision;

    collision_detector cm_cd_inst(
        $$obb1.module_assign(obb1)$$,
        $$obb2.module_assign(obb2)$$,
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
