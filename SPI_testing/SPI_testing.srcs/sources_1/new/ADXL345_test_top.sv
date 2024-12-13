`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 07:28:11 PM
// Design Name: 
// Module Name: testbench_adxl345
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


`define BW_RATE_ADDR 6'h2C
`define DATA_FORMAT_ADDR 6'h31
`define POWER_CTL_ADDR 6'h2D
`define FIFO_CTL_ADDR 6'h38
`define DATAX0_ADDR 6'h32

module adxl345_top(

	input logic clk,
	input logic miso,
	input logic start_button,
	output logic sclk,
	output logic ss,
	output logic mosi,
	output logic [15:0] x,
	output logic test_clock
	);
	
    logic reset;
	logic master_ready;
	
	logic [15:0] y;
	logic [15:0] z;
	
	logic [15:0] data_word_send;
	logic [15:0] accelerometer_data;
	logic reset_div;
	logic divider_ready;
	logic [15:0] data_word_recv;

	
    clock_divider #( .DIV_N(20) )	slow_test_clock ( .clk_in(clk), .clk_out(test_clock), .do_reset(reset_div), .is_ready(divider_ready) );

	

    // Contains the SPI master control
    ADXL345_com accelerometer_master(
    .MASTER_CLK(clk),
    .reset(reset),
    .SIGNAL_SS_IN(),
    .SCLK_OUT(sclk),
    .SIGNAL_SS_OUT(ss),
    .mosi(mosi),
    .miso(miso),
    .data_word_recv(data_word_recv),
    .data_word_send(data_word_send),
    .spi_ready(master_ready),
    .DATA_STREAM(accelerometer_data),
    .DATAX(x),
    .DATAY(y),
    .DATAZ(z)
        );

   
   logic reset_slave;
   
   logic test;
   
   always_comb begin
    if(start_button) begin
        reset = 1'b0;
        reset_div = 1'b0;
    end
    else begin
        reset = 1'b1;
        reset_div = 1'b1;
    end
   end
   
    
    
endmodule
