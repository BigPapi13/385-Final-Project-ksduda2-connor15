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

timeunit 10ns;
timeprecision 1ns;

module testbench_adxl345();

	logic clk;
	
	logic miso_en;
	logic sclk;
	logic reset;
	logic ss;
	logic mosi_en;
	logic [7:0] miso_data;
	logic [7:0] mosi_data;
	logic [7:0] accelerometer_data;
	logic slave_ready;
	
	logic cs;  //CS pin is the serial enable pin, this must go low before transmission/read. and high after transmission/read.
	
	always
	begin : CLOCK_GEN
	   #1 clk = ~clk;
    end

    // Contains the SPI master control
    ADXL345_com accelerometer_master(
    .MASTER_CLK(clk),
    .reset(reset),
    .SIGNAL_SS_IN(),
    .SCLK_OUT(sclk),
    .SIGNAL_SS_OUT(ss),
    .SIGNAL_DATA_OUT(mosi_en),
    .SIGNAL_DATA_IN(miso_en),
    .data_miso(miso_data),
    .data_mosi(mosi_data),
    .DATA_OUT(accelerometer_data),
    .cs(cs)
        );
     
   logic proc_word;
   logic process_next_word; 
   //Simulated ADXL345 SPI Slave:
   spi_module#(.SPI_MASTER (1'b0)) simulated_ADXL345(
   .master_clock(clk),
   .SCLK_OUT(),
   .SCLK_IN(sclk),
   .SS_OUT(),
   .SS_IN(ss),
   .OUTPUT_SIGNAL(miso_en),
   .processing_word(proc_word),
   .process_next_word(process_next_word),
   .data_word_send(miso_data),
   .do_reset(reset),
   .is_ready(slave_ready));
   
    
    
   initial 
   begin : SIM
        reset = 1'b1;
        clk = 0;
        #5;
        reset = 1'b0;
   end 
    
    
endmodule
