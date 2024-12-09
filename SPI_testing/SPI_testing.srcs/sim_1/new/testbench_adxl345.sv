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

`define BW_RATE_ADDR 6'h2C
`define DATA_FORMAT_ADDR 6'h31
`define POWER_CTL_ADDR 6'h2D
`define FIFO_CTL_ADDR 6'h38
`define DATAX0_ADDR 6'h32

module testbench_adxl345();

	logic clk;
	
	logic miso;
	logic sclk;
	logic reset;
	logic ss;
	logic mosi;
	logic [15:0] recv_word_master;
	logic [15:0] send_word_master;
	logic [15:0] recv_word_slave;
	logic [15:0] send_word_slave;
	logic [7:0] accelerometer_data;
	logic slave_ready;
		
	logic [15:0] x;
	logic [15:0] y;
	logic [15:0] z;
	
    // Contains the SPI master control
    ADXL345_com accelerometer_master(
    .MASTER_CLK(clk),
    .reset(reset),
    .SIGNAL_SS_IN(),
    .SCLK_OUT(sclk),
    .SIGNAL_SS_OUT(ss),
    .mosi(mosi),
    .miso(miso),
    .data_word_recv(recv_word_master),
    .data_word_send(send_word_master),
    .DATA_STREAM(accelerometer_data),
    .DATAX(x),
    .DATAY(y),
    .DATAZ(z)
        );
     
   logic proc_word_slave;
   logic process_next_word_slave; 
   //Simulated ADXL345 SPI Slave:
   spi_module#(.SPI_MASTER (1'b0), .SPI_WORD_LEN(16)) simulated_ADXL345(
   .master_clock(clk),
   .SCLK_OUT(),
   .SCLK_IN(sclk),
   .SS_OUT(),
   .SS_IN(ss),
   .OUTPUT_SIGNAL(miso),
   .INPUT_SIGNAL(mosi),
   .processing_word(proc_word_slave),
   .process_next_word(process_next_word_slave),
   .data_word_send(send_word_slave),
   .data_word_recv(recv_word_slave),
   .do_reset(reset),
   .is_ready(slave_ready));
   
   logic reset_div2;
   logic divider_ready2;
   logic test_clock;
   clock_divider #( .DIV_N(20) )	slow_test_clock ( .clk_in(clk), .clk_out(test_clock), .do_reset(reset_div2), .is_ready(divider_ready2) );

       
   initial 
   begin : SIM
        reset = 1'b1;
        reset_div2 = 1'b1;
        clk = 0;
        send_word_slave = 15'b0;
        process_next_word_slave = 1'b0;
        // slave and master ready
        #1000;
        reset = 1'b0; 
        reset_div2 = 1'b0;  
   end 
   
   	always
	begin : CLOCK_GEN
	   #1 clk = ~clk;
	   if(!proc_word_slave) begin
           if(recv_word_slave[15:8] == {1'b1, 1'b0, `DATAX0_ADDR}) begin
            send_word_slave = {8'b0,8'b00000101};
           end
           if(recv_word_slave[15:8] == {1'b1, 1'b0, (`DATAX0_ADDR + 1'b1)}) begin
            send_word_slave = {8'b0,8'b00000110};
           end
          if(recv_word_slave[15:8] == {1'b1, 1'b0, (`DATAX0_ADDR + 2'b10)}) begin
            send_word_slave = {8'b0,8'b00000111};
           end
                     if(recv_word_slave[15:8] == {1'b1, 1'b0, (`DATAX0_ADDR + 2'b11)}) begin
            send_word_slave = {8'b0,8'b00000100};
           end
                     if(recv_word_slave[15:8] == {1'b1, 1'b0, (`DATAX0_ADDR + 3'b100)}) begin
            send_word_slave = {8'b0,8'b00001001};
           end
                     if(recv_word_slave[15:8] == {1'b1, 1'b0, (`DATAX0_ADDR + 3'b101)}) begin
            send_word_slave = {8'b0,8'b00001010};
           end
          process_next_word_slave = 1'b1;
       end
       
       else if (proc_word_slave && process_next_word_slave)  process_next_word_slave <= 1'b0;
       
    end
    
endmodule
