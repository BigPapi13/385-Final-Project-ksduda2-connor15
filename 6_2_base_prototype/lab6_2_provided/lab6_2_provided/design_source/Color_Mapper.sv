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


module  color_mapper ( input  logic [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
                       output logic [3:0]  Red, Green, Blue );
    
    logic ball_on;
	 
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*BallS, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))
       )

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 120 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
    int DistX, DistY, Size;
    assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size;

    logic [15:0] rotation[2][2];           // basis vectors for rotation
    assign rotation[0][0] = 16'b0000000000100000;  // u basis vector
    assign rotation[1][0] = 16'b0000000000100000;

    assign rotation[0][1] = 16'b1111111111100000;  // v basis vector
    assign rotation[1][1] = 16'b0000000000100000;

    // get current pixel in basis vector of square
    //logic [9:0] dx;
    //logic [9:0] dy;
    logic [15:0] r [2];
    logic [15:0] r_uv [2];
    logic [9:0] DistU;
    logic [9:0] DistV;

    always_comb
    begin:get_basis
        // Step 1: Convert x and y coordinates of pixel into 16-bit format
        //dx = DrawX - BallX;
        //dy = DrawY - BallY;
        r[0] = {DistX, 6'b0};
        r[1] = {DistY, 6'b0};

        // Step 2 apply rotation
        // (done in instantiated coordinate rotator)

        // Step 3: Truncate bits
        DistU = r_uv[0][15:6];
        DistV = r_uv[1][15:6];
    end

    vec_mat_multiplier coordinate_rotator(
        .mat(rotation),
        .vec(r),
        .out(r_uv)
    );

    always_comb
    begin:Ball_on_proc
        if ( (DistU*DistU) <= (Size * Size) && (DistV*DistV) <= (Size * Size))
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
     end 
       
    always_comb
    begin:RGB_Display
        if ((ball_on == 1'b1)) begin 
            Red = 4'ha;
            Green = 4'hf;
            Blue = 4'h3;
        end       
        else begin 
            Red = 4'hf - DrawX[9:6]; 
            Green = 4'hf - DrawX[9:6];
            Blue = 4'hf - DrawX[9:6];
        end      
    end 
    
endmodule
