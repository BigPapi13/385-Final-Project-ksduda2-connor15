`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 11:49:09 PM
// Design Name: 
// Module Name: frame_manager
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


module frame_manager
    (
        input logic clk,
        input logic start_signal,
        input logic [11:0] write_data,
        
        output logic display_frame_done,
        output logic [5:0] write_x,
        output logic [5:0] write_y,
        output logic [1:0] hub75_red,
        output logic [1:0] hub75_green,
        output logic [1:0] hub75_blue,
        output logic [4:0] hub75_addr,
        output logic hub75_latch,
        output logic hub75_clk,
        output logic hub75_oe
    );
    

    
    logic n_reset;

    logic buffer_toggle;
    
    
    logic user_led;
    logic test_led;

       
    logic write_pixel_clk;
    logic [11:0] write_addr; // top bit is the double-buffer flipper and is provided by spi_ss
    logic write_en;
    logic reset_mem_manager;
    
    logic mem_write_done;
    
    
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
    
         
    logic [15:0] write_data_16b;
    assign write_data_16b = {write_data,4'b0000};
    // required because controller takes in a 16 bit write_data value, but we really only need the first 12 for R G B with 4 bits each.
    
    controller #(16) dut (
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
        write_data_16b,
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
    
        
        
    always_ff @ (posedge clk)
	begin
	    if(halt) begin
	       startup_state <= IDLE;
	    end
	    else begin
            startup_state <= startup_state_nxt;
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
