`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 04:24:03 PM
// Design Name: 
// Module Name: controller_moving_test
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



`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 11:51:36 AM
// Design Name: 
// Module Name: controller_moving_test_sim
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



/*
In order to have a frame updater, I have split this process up into two steps. There is the write cycle and there is the read cycle.
the to steps are described by the FSM WRITE and DISPLAY
This could be made more efficient by using dual port ram but i chose to simplify this to avoid data corruption complications.
This design does use a double buffer so this would not be very difficult to implement, but i did not have time to fully take advantage of this.

*/

module controller_moving_test#(BITS_PER_PIXEL=16) 
    (
        input logic clk,
        input logic start_signal,
        output logic [1:0] hub75_red,
        output logic [1:0] hub75_green,
        output logic [1:0] hub75_blue,
        output logic [4:0] hub75_addr,
        output logic hub75_latch,
        output logic hub75_clk,
        output logic hub75_oe,
        output logic test_led
    );
    
        localparam period = 1;

    
    logic n_reset;

    logic buffer_toggle;
    
    
    logic user_led;
    
    localparam BITS_PER_RGB = BITS_PER_PIXEL / 4;
        
    logic [BITS_PER_PIXEL-1:0] write_data;
    logic write_pixel_clk;
    logic [11:0] write_addr; // top bit is the double-buffer flipper and is provided by spi_ss
    logic write_en;
    logic reset_mem_manager;
    
    logic mem_write_done;
    logic display_frame_done;
    
    logic [5:0] write_x;
    logic [5:0] write_y;
    
    logic reset_div;
    logic divider_ready;
    logic clk_divided;
    clock_divider #( .DIV_N(5) )	slow_test_clock ( .clk_in(clk), .clk_out(clk_divided), .do_reset(reset_div), .is_ready(divider_ready) );

    
    memory_manager mem_start(
        .clk(clk),
        .reset(reset_mem_manager),          // runs when the controller is reset
        .write_addr(write_addr),
        .write_en(write_en),
        .buffer_toggle(buffer_toggle),
        .write_pixel_clk(write_pixel_clk),
        .write_x(write_x),
        .write_y(write_y),
        .write_done(mem_write_done)
    );
    
            
    controller #(BITS_PER_PIXEL) dut (
        n_reset,
        clk,
        hub75_red,
        hub75_green,
        hub75_blue,
        hub75_addr,
        hub75_clk,
        hub75_latch,
        hub75_oe,
        user_led,
        write_pixel_clk, 
        write_addr,
        write_data,
        buffer_toggle,
        write_en,
        display_frame_done
    );
        
    logic halt;
    enum logic [5:0] {
        IDLE,
        WRITE,
        DISPLAY
    } startup_state, startup_state_nxt;
    
    
    logic [5:0] test_counter1;
    logic [5:0] test_counter2;
        
        
    always_ff @ (posedge clk)
	begin
	    if(halt) begin
	       startup_state <= IDLE;
	       test_counter1 <= 0;
	       test_counter2 <= 0;
	    end
	    else begin
            startup_state <= startup_state_nxt;
        end
        
        if(display_frame_done) begin
           test_counter1 <= test_counter1 + 1;
            if(test_counter1 == 6'd63) begin
                test_counter2 <= test_counter2 + 1;
                test_counter1 <= 0;
            end
        end
	end
	


	
	always_comb
	begin
	   halt = 1'b1;        // halting by default
	   
	   // reset everything
	   n_reset = 1'b0;
	   reset_mem_manager = 1'b1;
	   reset_div = 1'b0;
	   
	   case(startup_state)
	       IDLE: begin
	           reset_div = 1'b1;
	           // at this point everything should be in a reset state).
	           if(start_signal) begin
	               startup_state_nxt = WRITE;
	               halt = 1'b0;
	           end
	           else begin
	               startup_state_nxt = IDLE;
	           end
	       end
	       WRITE: begin
	           // start the memory manager to begin writing
	           halt = 1'b0;
	           reset_mem_manager = 1'b0;   // memory will begin
	           n_reset = 1'b0;     // controller will remain reset while memory is writing
	           
	           
	           if(test_counter2 == write_y) begin
	               //write_data = 16'b1111000000000000;
	               write_data = {write_x,write_y};
	           end
               else begin
	               write_data = 16'b0000000000000000;
	           end
	           
	           
	           if(mem_write_done)      // keep write state until memory is done writing for this frame
	               startup_state_nxt = DISPLAY;
	           else
	               startup_state_nxt = WRITE;      
	               
	       end
           DISPLAY : begin
                halt = 1'b0;
                reset_mem_manager = 1'b1;  // memory will be reset
                n_reset = 1'b1;             // display cycle will begin
                
                
                // now begin the cycle of going between WRITE and DISPLAY
                
                if(display_frame_done)  begin      // keep display state until display is done rendering whole frame
                    startup_state_nxt = WRITE;
                end
                
                else
                    startup_state_nxt = DISPLAY;    
           end
       endcase
	   
	end
	

    
endmodule
