`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 12:44:01 PM
// Design Name: 
// Module Name: controller_stillframe_test
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


module controller_stillframe_test #(BITS_PER_PIXEL=16) 
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

    logic n_reset;


    logic buffer_toggle;
    logic user_led;
    
    logic [31:0] input_image [64 * 64];

    localparam period = 1;

    localparam BITS_PER_RGB = BITS_PER_PIXEL / 4;
    
    
    logic [BITS_PER_PIXEL-1:0] write_data;
    logic write_pixel_clk;
    logic [11:0] write_addr; // top bit is the double-buffer flipper and is provided by spi_ss
    logic write_en;
    logic reset_mem_initialization;
    
    logic mem_write_done;
    
    
    memory_initialization mem_start(
        .clk(clk),
        .input_image(input_image),
        .reset(reset_mem_initialization),        // runs while everything else is reset
        .write_addr(write_addr),
        .write_data(write_data),
        .write_en(write_en),
        .buffer_toggle(buffer_toggle),
        .done(mem_write_done),
        .write_pixel_clk(write_pixel_clk)
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
        write_en
    );
    
    
    logic halt;
    enum logic [5:0] {
        IDLE,
        START,
        START_1,
        RUN
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
	   n_reset = 1'b0;     //default to reset
	   reset_mem_initialization = 1'b0;
	   test_led = 1'b0;
	   case(startup_state)
	       IDLE: begin
	           if(start_signal) begin
	               startup_state_nxt = START;
	               halt = 1'b0;
	           end
	           else begin
	               startup_state_nxt = IDLE;
	           end
	       end
           START: begin
                halt = 1'b0;
                n_reset = 1'b1;
                reset_mem_initialization = 1'b1;
                
                startup_state_nxt = START_1;
           end
           START_1 : begin
                halt = 1'b0;
                n_reset = 1'b0;
                reset_mem_initialization = 1'b0;
                
                startup_state_nxt = RUN;
           end
           RUN : begin
                halt = 1'b0;
                test_led = 1'b1;
                n_reset = 1'b0;
                startup_state_nxt = RUN;
                reset_mem_initialization = 1'b0;
                
                if(mem_write_done) begin
                    n_reset = 1'b1;
                end
           end
       endcase
	   
	end
    
       
       
    localparam FILE_NAME = "C:/Users/conno/Documents/test-bars-16-64x64.txt";
    initial begin
        // Must be the 32bbp input image
        $readmemh(FILE_NAME, input_image);
    end
    


endmodule