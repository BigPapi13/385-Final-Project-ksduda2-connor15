//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf     03-01-2006                           --
//                                  03-12-2007                           --
//    Translated by Joe Meng        07-07-2013                           --
//    Modified by Zuofu Cheng       08-19-2023                           --
//    Modified by Satvik Yellanki   12-17-2023                           --
//    Fall 2024 Distribution                                             --
//                                                                       --
//    For use with ECE 385 USB + HDMI Lab                                --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------

$ from svmath import *
module  square 
( 
    input  logic        Reset, 
    input  logic        frame_clk,
    input  logic [7:0]  keycode,

    output logic [9:0]  X, 
    output logic [9:0]  Y, 
    output logic [9:0]  S 
);

    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

    logic [9:0] Ball_X_Motion;
    logic [9:0] Ball_X_Motion_next;
    logic [9:0] Ball_Y_Motion;
    logic [9:0] Ball_Y_Motion_next;

    logic [9:0] Ball_X_next;
    logic [9:0] Ball_Y_next;

    $ begin_comb()
        Ball_Y_Motion_next = Ball_Y_Motion + 10'b1; // set default motion to be same as prev clock cycle 
        Ball_X_Motion_next = Ball_X_Motion;

        //modify to control ball motion with the keycode
        // W
        if (keycode == 8'h1A)
        begin
            Ball_Y_Motion_next = -10'd1;
            Ball_X_Motion_next = 10'd0;
        end
        
        // A
        if (keycode == 8'h4)
        begin
            Ball_Y_Motion_next = 10'd0;
            Ball_X_Motion_next = -10'd1;
        end
        
        // S
        if (keycode == 8'h16)
        begin
            Ball_Y_Motion_next = 10'd1;
            Ball_X_Motion_next = 10'd0;
        end
        
        //D
        if (keycode == 8'h7)
        begin
            Ball_Y_Motion_next = 10'd0;
            Ball_X_Motion_next = 10'd1;
        end

        if ( (Y + S) >= Ball_Y_Max )  // Ball is at the bottom edge, BOUNCE!
        begin
            Ball_Y_Motion_next = (~ (Ball_Y_Motion) + 1'b1);  // set to -1 via 2's complement.
        end
        else if ( (Y - S) <= Ball_Y_Min )  // Ball is at the top edge, BOUNCE!
        begin
            //Ball_Y_Motion_next = Ball_Y_Step;
            Ball_Y_Motion_next = (~ (Ball_Y_Motion) + 1'b1);
        end  
       //fill in the rest of the motion equations here to bounce left and right
       // yes ma'am
        if ( (X + S) >= Ball_X_Max )  // Ball is at the right edge, BOUNCE!
        begin
            Ball_X_Motion_next = (~ (Ball_X_Step) + 1'b1);  // set to -1 via 2's complement.
        end
        else if ( (X - S) <= Ball_X_Min )  // Ball is at the left edge, BOUNCE!
        begin
            Ball_X_Motion_next = Ball_X_Step;
        end  

    $ end_comb()

    assign S = 16;  // default ball size
    assign Ball_X_next = (X + Ball_X_Motion_next);
    assign Ball_Y_next = (Y + Ball_Y_Motion_next);
   
    always_ff @(posedge frame_clk) //make sure the frame clock is instantiated correctly
    begin: Move_Ball
        if (Reset)
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
			Ball_X_Motion <= 10'd1; //Ball_X_Step;
            
			Y <= Ball_Y_Center;
			X <= Ball_X_Center;
        end
        else 
        begin 

			Ball_Y_Motion <= Ball_Y_Motion_next; 
			Ball_X_Motion <= Ball_X_Motion_next; 

            Y <= Ball_Y_next;  // Update ball position
            X <= Ball_X_next;
			
		end  
    end


    
      
endmodule
