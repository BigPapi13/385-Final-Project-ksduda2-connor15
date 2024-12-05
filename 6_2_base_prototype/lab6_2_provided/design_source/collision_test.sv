`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 03:45:50 PM
// Design Name: 
// Module Name: collision_test
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



module collision_test();
timeunit 10ns;
timeprecision 1ns;

logic signed [7 : 0] widthA;
logic signed [7 : 0] heightA;
logic signed [31 : 0] posA [1 : 0];
logic signed [31 : 0] velA [1 : 0];
logic signed [15 : 0] uA [1 : 0];
logic signed [15 : 0] vA [1 : 0];
logic signed [7 : 0] widthB;
logic signed [7 : 0] heightB;
logic signed [31 : 0] posB [1 : 0];
logic signed [31 : 0] velB [1 : 0];
logic signed [15 : 0] uB [1 : 0];
logic signed [15 : 0] vB [1 : 0];
    
logic is_collision;

    collision_detector cd_inst(.*);
    
    initial begin: TEST_VECTORS
assign widthA = 8'b00001010;
assign heightA = 8'b00001010;
uA[0] = 16'b0100000000000000;
uA[1] = 16'b0000000000000000;
vA[0] = 16'b0000000000000000;
vA[1] = 16'b0100000000000000;
posA[0] = 32'b00001110000000000000000000000000;
posA[1] = 32'b00001110000000000000000000000000;
assign widthB = 8'b00001010;
assign heightB = 8'b00001010;
uB[0] = 16'b0100000000000000;
uB[1] = 16'b0000000000000000;
vB[0] = 16'b0000000000000000;
vB[1] = 16'b0100000000000000;
posB[0] = 32'b00101000000000000000000000000000;
posB[1] = 32'b00001110000000000000000000000000;

#16
assign posB[0] = 32'b00100110000000000000000000000000;
#16
assign posB[0] = 32'b00100100000000000000000000000000;
#16
assign posB[0] = 32'b00100010000000000000000000000000;
#16
assign posB[0] = 32'b00100000000000000000000000000000;
#16
assign posB[0] = 32'b00011110000000000000000000000000;
#16
assign posB[0] = 32'b00011100000000000000000000000000;
#16
assign posB[0] = 32'b00011010000000000000000000000000;
#16
assign posB[0] = 32'b00011000000000000000000000000000;
#16
assign posB[0] = 32'b00010110000000000000000000000000;
#16
assign posB[0] = 32'b00010100000000000000000000000000;
#16
assign posB[0] = 32'b00010010000000000000000000000000;
#16
assign posB[0] = 32'b00010000000000000000000000000000;
#16
assign posB[0] = 32'b00001110000000000000000000000000;
#16
assign posB[0] = 32'b00001100000000000000000000000000;
#16
assign posB[0] = 32'b00001010000000000000000000000000;
#16
assign posB[0] = 32'b00001000000000000000000000000000;
#16
assign posB[0] = 32'b00000110000000000000000000000000;
#16
assign posB[0] = 32'b00000100000000000000000000000000;
#16
assign posB[0] = 32'b00000010000000000000000000000000;
#16
assign posB[0] = 32'b00000000000000000000000000000000;
#16
assign posB[0] = 32'b11111110000000000000000000000000;
#16
assign posB[0] = 32'b11111100000000000000000000000000;
#16
assign posB[0] = 32'b11111010000000000000000000000000;
#16
assign posB[0] = 32'b11111000000000000000000000000000;
#16
assign posB[0] = 32'b11110110000000000000000000000000;
#16
assign posB[0] = 32'b11110100000000000000000000000000;
#16
assign posB[0] = 32'b11110010000000000000000000000000;
#16
assign posB[0] = 32'b11110000000000000000000000000000;
#16
assign posB[0] = 32'b11101110000000000000000000000000;
#16
assign posB[0] = 32'b11101100000000000000000000000000;
    end

endmodule
