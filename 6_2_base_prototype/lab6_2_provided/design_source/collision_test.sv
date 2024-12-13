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
logic signed [31 : 0] posA_x;
logic signed [31 : 0] posA_y;
logic signed [23 : 0] velA_x;
logic signed [23 : 0] velA_y;
logic signed [15 : 0] uA_x;
logic signed [15 : 0] uA_y;
logic signed [15 : 0] vA_x;
logic signed [15 : 0] vA_y;
logic signed [7 : 0] widthB;
logic signed [7 : 0] heightB;
logic signed [31 : 0] posB_x;
logic signed [31 : 0] posB_y;
logic signed [23 : 0] velB_x;
logic signed [23 : 0] velB_y;
logic signed [15 : 0] uB_x;
logic signed [15 : 0] uB_y;
logic signed [15 : 0] vB_x;
logic signed [15 : 0] vB_y;
    
logic is_collision;

    collision_detector cd_inst(.*);
    
    initial begin: TEST_VECTORS
assign widthA = 8'sb00001010;
assign heightA = 8'sb00001010;
assign uA_x = 16'sb0100000000000000;
assign uA_y = 16'sb0000000000000000;
assign vA_x = 16'sb0000000000000000;
assign vA_y = 16'sb0100000000000000;
assign posA_x = 32'sb00001110000000000000000000000000;
assign posA_y = 32'sb00001110000000000000000000000000;
assign widthB = 8'sb00001010;
assign heightB = 8'sb00001010;
assign uB_x = 16'sb0100000000000000;
assign uB_y = 16'sb0000000000000000;
assign vB_x = 16'sb0000000000000000;
assign vB_y = 16'sb0100000000000000;
assign posB_x = 32'sb00101000000000000000000000000000;
assign posB_y = 32'sb00001110000000000000000000000000;

#16
assign posB_x = 32'sb00100110000000000000000000000000;
#16
assign posB_x = 32'sb00100100000000000000000000000000;
#16
assign posB_x = 32'sb00100010000000000000000000000000;
#16
assign posB_x = 32'sb00100000000000000000000000000000;
#16
assign posB_x = 32'sb00011110000000000000000000000000;
#16
assign posB_x = 32'sb00011100000000000000000000000000;
#16
assign posB_x = 32'sb00011010000000000000000000000000;
#16
assign posB_x = 32'sb00011000000000000000000000000000;
#16
assign posB_x = 32'sb00010110000000000000000000000000;
#16
assign posB_x = 32'sb00010100000000000000000000000000;
#16
assign posB_x = 32'sb00010010000000000000000000000000;
#16
assign posB_x = 32'sb00010000000000000000000000000000;
#16
assign posB_x = 32'sb00001110000000000000000000000000;
#16
assign posB_x = 32'sb00001100000000000000000000000000;
#16
assign posB_x = 32'sb00001010000000000000000000000000;
#16
assign posB_x = 32'sb00001000000000000000000000000000;
#16
assign posB_x = 32'sb00000110000000000000000000000000;
#16
assign posB_x = 32'sb00000100000000000000000000000000;
#16
assign posB_x = 32'sb00000010000000000000000000000000;
#16
assign posB_x = 32'sb00000000000000000000000000000000;
#16
assign posB_x = 32'sb11111110000000000000000000000000;
#16
assign posB_x = 32'sb11111100000000000000000000000000;
#16
assign posB_x = 32'sb11111010000000000000000000000000;
#16
assign posB_x = 32'sb11111000000000000000000000000000;
#16
assign posB_x = 32'sb11110110000000000000000000000000;
#16
assign posB_x = 32'sb11110100000000000000000000000000;
#16
assign posB_x = 32'sb11110010000000000000000000000000;
#16
assign posB_x = 32'sb11110000000000000000000000000000;
#16
assign posB_x = 32'sb11101110000000000000000000000000;
#16
assign posB_x = 32'sb11101100000000000000000000000000;
    end

endmodule
