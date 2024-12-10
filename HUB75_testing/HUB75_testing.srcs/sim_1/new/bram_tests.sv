`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2024 11:24:34 AM
// Design Name: 
// Module Name: bram_tests
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


module bram_tests();

    logic clk;
    logic ena;
    logic write_en;
    logic [15:0] write_data;
    logic [15:0] read_data;
    logic [11:0] addr;
    logic rst;
    
    
    display_buffer_bram test_bram(
    .clka(clk),
    .addra(addr),
    .wea(write_en),
    .ena(ena),             // CHEKC IF THIS NEEDS CHANGING
    .dina(write_data),
    .douta(read_data)
);
    
   initial 
   begin : SIM
    clk = 0;
    ena = 1'b1;
    write_en = 1'b0;
    write_data = 16'habcd;
     addr = 11'h487;
     
    #2;


    
    write_en = 1'b1;
    
    #4;
       
    addr = 11'h488;
    write_data = 16'hadcf;   
    
    #2;
    
    write_en = 1'b0;
    
    #2;
    
    #20;
    
        addr = 11'h487;

    
    
    #40
    
    $finish;
    
   end
   
   
   always
   begin : CLK_GEN
    clk = ~clk;
    #1;
   end
   
   always @ (posedge clk) begin
     
   end

endmodule
