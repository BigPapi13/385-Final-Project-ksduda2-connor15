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
	output logic test_clock,
	output logic led,
	output logic led2,
	output logic led3
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
    
    led = 1'b0;
    if(x > 16'd3000) begin
        led = 1'b1;
    end
    led2 = 1'b0;
    if(y > 16'd3000) begin
        led2 = 1'b1;
        if(y[0]+y[1]+y[2]+y[3]+y[4]+y[5]+y[6]+y[7]+y[8]+y[9]+y[10]+y[11]+y[12]+y[13]+y[14]+y[15] == 16'd6)
            led2 = 1'b0;
    end
    led3 = 1'b0;
    if(z > 16'd3000) begin
        led3 = 1'b1;
        if(z[0]+z[1]+z[2]+z[3]+z[4]+z[5]+z[6]+z[7]+z[8]+z[9]+z[10]+z[11]+z[12]+z[13]+z[14]+z[15] == 16'd6)
            led3 = 1'b0;
    end
   end
   
    
    
endmodule
