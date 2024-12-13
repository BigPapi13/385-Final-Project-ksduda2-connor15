`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 11:57:14 PM
// Design Name: 
// Module Name: frame_manager_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module frame_manager_tb_sim();

    //frame manager inputs:
    logic clk;
    logic start_signal;
    logic [11:0] write_data;
    
    //frame manager outputs:
    logic display_frame_done;
    logic [5:0] write_x;
    logic [5:0] write_y;
    logic [1:0] hub75_red;
    logic [1:0] hub75_green;
    logic [1:0] hub75_blue;
    logic [4:0] hub75_addr;
    logic hub75_latch;
    logic hub75_clk;
    logic hub75_oe;
    
            
    always begin : CLOCK_GEN 
            clk= 1'b1;
            #1;

            clk= 1'b0;
            #1;
    end

    frame_manager fm(
        .clk(clk),
        .start_signal(start_signal),
        .write_data(write_data),
        .display_frame_done(display_frame_done),
        .write_x(write_x),
        .write_y(write_y),
        .hub75_red(hub75_red),
        .hub75_green(hub75_green),
        .hub75_blue(hub75_blue),
        .hub75_addr(hub75_addr),
        .hub75_latch(hub75_latch),
        .hub75_clk(hub75_clk),
        .hub75_oe(hub75_oe)
    );
    
    
    
    //////////////////// FSM Control logic ////////////////////////////////////
    logic reset;

    enum logic [5:0] {
        RESET,
        RUN
    } state, next_state;
    always_ff @ (posedge clk) begin
        if(reset) begin
            state <= RESET;
        end
        else begin
            state <= next_state;
        end
    end
    // STATE TRANSITIONS
    always_comb begin
        //automatically start in reset mode
        reset = 1'b1;
        case(state)
            RESET: begin
                // automatically run when reset is active
                next_state = RUN;
            end
            RUN : begin
                // run forever
                next_state = RUN;
                reset = 1'b0;
            end
        endcase
        
    end
    // STATE OUTPUTS
    always_comb begin        
        case(state)
            RESET: begin
                start_signal = 1'b0;
            end
            RUN : begin
                // start_signal will turn the frame_manager on
                start_signal = 1'b1;
            end
        endcase
        
    end
    //////////////////////////////////////////////////////////
    
        
    logic [10:0] test_counter1;
    logic [5:0] test_counter2;
    
    // Display output logic!
    always_ff @ (posedge clk) begin
        if(reset) begin
            test_counter1 <= 0;
            test_counter2 <= 0;
        end
        
        // If the display is done outputting a frame, it is going to iterate over write_x and write_y as it begins writing new data to the buffer!
        if(display_frame_done) begin
            test_counter1 <= test_counter1 + 1;
            if(test_counter1 == 6'd50) begin
                test_counter1 <= 1'b0;
                
                test_counter2 <= test_counter2 + 1;
                // test_counter2 will automatically loop back to the top of the display (due to overflow) when it hits 64
            end
            
            // test_counter2 will be a slowly incrementing value, we can use this value to shift the position of drawn pixels!
            
            if(write_x == test_counter2) begin
                // draw a vertical line on the column corresponding to counter2
                write_data = {12'b111100000000};
            end
            else begin
                // draw a green background for the rest of the pixels
                write_data = {12'b000011110000};
            end
        end
        
        
    end
    
    

endmodule
