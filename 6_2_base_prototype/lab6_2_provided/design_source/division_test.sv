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




module division_test();
timeunit 10ns;
timeprecision 1ns;

logic signed [9 : 0] a;
logic signed [15 : 0] b;

logic signed [15 : 0] inverter_1;
inverter inverter_inst_2(.x(a), .x_inverse(inverter_1));
assign b = inverter_1;

logic is_collision;
    
    initial begin: TEST_VECTORS
#1
assign a = 10'sb0000000000;
#1
assign a = 10'sb0000000001;
#1
assign a = 10'sb0000000010;
#1
assign a = 10'sb0000000011;
#1
assign a = 10'sb0000000100;
#1
assign a = 10'sb0000000101;
#1
assign a = 10'sb0000000110;
#1
assign a = 10'sb0000000111;
#1
assign a = 10'sb0000001000;
#1
assign a = 10'sb0000001001;
#1
assign a = 10'sb0000001010;
#1
assign a = 10'sb0000001011;
#1
assign a = 10'sb0000001100;
#1
assign a = 10'sb0000001101;
#1
assign a = 10'sb0000001110;
#1
assign a = 10'sb0000001111;
#1
assign a = 10'sb0000010000;
#1
assign a = 10'sb0000010001;
#1
assign a = 10'sb0000010010;
#1
assign a = 10'sb0000010011;
#1
assign a = 10'sb0000010100;
#1
assign a = 10'sb0000010101;
#1
assign a = 10'sb0000010110;
#1
assign a = 10'sb0000010111;
#1
assign a = 10'sb0000011000;
#1
assign a = 10'sb0000011001;
#1
assign a = 10'sb0000011010;
#1
assign a = 10'sb0000011011;
#1
assign a = 10'sb0000011100;
#1
assign a = 10'sb0000011101;
#1
assign a = 10'sb0000011110;
#1
assign a = 10'sb0000011111;
#1
assign a = 10'sb0000100000;
#1
assign a = 10'sb0000100001;
#1
assign a = 10'sb0000100010;
#1
assign a = 10'sb0000100011;
#1
assign a = 10'sb0000100100;
#1
assign a = 10'sb0000100101;
#1
assign a = 10'sb0000100110;
#1
assign a = 10'sb0000100111;
#1
assign a = 10'sb0000101000;
#1
assign a = 10'sb0000101001;
#1
assign a = 10'sb0000101010;
#1
assign a = 10'sb0000101011;
#1
assign a = 10'sb0000101100;
#1
assign a = 10'sb0000101101;
#1
assign a = 10'sb0000101110;
#1
assign a = 10'sb0000101111;
#1
assign a = 10'sb0000110000;
#1
assign a = 10'sb0000110001;
#1
assign a = 10'sb0000110010;
#1
assign a = 10'sb0000110011;
#1
assign a = 10'sb0000110100;
#1
assign a = 10'sb0000110101;
#1
assign a = 10'sb0000110110;
#1
assign a = 10'sb0000110111;
#1
assign a = 10'sb0000111000;
#1
assign a = 10'sb0000111001;
#1
assign a = 10'sb0000111010;
#1
assign a = 10'sb0000111011;
#1
assign a = 10'sb0000111100;
#1
assign a = 10'sb0000111101;
#1
assign a = 10'sb0000111110;
#1
assign a = 10'sb0000111111;
#1
assign a = 10'sb0001000000;
#1
assign a = 10'sb0001000001;
#1
assign a = 10'sb0001000010;
#1
assign a = 10'sb0001000011;
#1
assign a = 10'sb0001000100;
#1
assign a = 10'sb0001000101;
#1
assign a = 10'sb0001000110;
#1
assign a = 10'sb0001000111;
#1
assign a = 10'sb0001001000;
#1
assign a = 10'sb0001001001;
#1
assign a = 10'sb0001001010;
#1
assign a = 10'sb0001001011;
#1
assign a = 10'sb0001001100;
#1
assign a = 10'sb0001001101;
#1
assign a = 10'sb0001001110;
#1
assign a = 10'sb0001001111;
#1
assign a = 10'sb0001010000;
#1
assign a = 10'sb0001010001;
#1
assign a = 10'sb0001010010;
#1
assign a = 10'sb0001010011;
#1
assign a = 10'sb0001010100;
#1
assign a = 10'sb0001010101;
#1
assign a = 10'sb0001010110;
#1
assign a = 10'sb0001010111;
#1
assign a = 10'sb0001011000;
#1
assign a = 10'sb0001011001;
#1
assign a = 10'sb0001011010;
#1
assign a = 10'sb0001011011;
#1
assign a = 10'sb0001011100;
#1
assign a = 10'sb0001011101;
#1
assign a = 10'sb0001011110;
#1
assign a = 10'sb0001011111;
#1
assign a = 10'sb0001100000;
#1
assign a = 10'sb0001100001;
#1
assign a = 10'sb0001100010;
#1
assign a = 10'sb0001100011;
#1
assign a = 10'sb0001100100;
#1
assign a = 10'sb0001100101;
#1
assign a = 10'sb0001100110;
#1
assign a = 10'sb0001100111;
#1
assign a = 10'sb0001101000;
#1
assign a = 10'sb0001101001;
#1
assign a = 10'sb0001101010;
#1
assign a = 10'sb0001101011;
#1
assign a = 10'sb0001101100;
#1
assign a = 10'sb0001101101;
#1
assign a = 10'sb0001101110;
#1
assign a = 10'sb0001101111;
#1
assign a = 10'sb0001110000;
#1
assign a = 10'sb0001110001;
#1
assign a = 10'sb0001110010;
#1
assign a = 10'sb0001110011;
#1
assign a = 10'sb0001110100;
#1
assign a = 10'sb0001110101;
#1
assign a = 10'sb0001110110;
#1
assign a = 10'sb0001110111;
#1
assign a = 10'sb0001111000;
#1
assign a = 10'sb0001111001;
#1
assign a = 10'sb0001111010;
#1
assign a = 10'sb0001111011;
#1
assign a = 10'sb0001111100;
#1
assign a = 10'sb0001111101;
#1
assign a = 10'sb0001111110;
#1
assign a = 10'sb0001111111;
#1
assign a = 10'sb0010000000;
#1
assign a = 10'sb0010000001;
#1
assign a = 10'sb0010000010;
#1
assign a = 10'sb0010000011;
#1
assign a = 10'sb0010000100;
#1
assign a = 10'sb0010000101;
#1
assign a = 10'sb0010000110;
#1
assign a = 10'sb0010000111;
#1
assign a = 10'sb0010001000;
#1
assign a = 10'sb0010001001;
#1
assign a = 10'sb0010001010;
#1
assign a = 10'sb0010001011;
#1
assign a = 10'sb0010001100;
#1
assign a = 10'sb0010001101;
#1
assign a = 10'sb0010001110;
#1
assign a = 10'sb0010001111;
#1
assign a = 10'sb0010010000;
#1
assign a = 10'sb0010010001;
#1
assign a = 10'sb0010010010;
#1
assign a = 10'sb0010010011;
#1
assign a = 10'sb0010010100;
#1
assign a = 10'sb0010010101;
#1
assign a = 10'sb0010010110;
#1
assign a = 10'sb0010010111;
#1
assign a = 10'sb0010011000;
#1
assign a = 10'sb0010011001;
#1
assign a = 10'sb0010011010;
#1
assign a = 10'sb0010011011;
#1
assign a = 10'sb0010011100;
#1
assign a = 10'sb0010011101;
#1
assign a = 10'sb0010011110;
#1
assign a = 10'sb0010011111;
#1
assign a = 10'sb0010100000;
#1
assign a = 10'sb0010100001;
#1
assign a = 10'sb0010100010;
#1
assign a = 10'sb0010100011;
#1
assign a = 10'sb0010100100;
#1
assign a = 10'sb0010100101;
#1
assign a = 10'sb0010100110;
#1
assign a = 10'sb0010100111;
#1
assign a = 10'sb0010101000;
#1
assign a = 10'sb0010101001;
#1
assign a = 10'sb0010101010;
#1
assign a = 10'sb0010101011;
#1
assign a = 10'sb0010101100;
#1
assign a = 10'sb0010101101;
#1
assign a = 10'sb0010101110;
#1
assign a = 10'sb0010101111;
#1
assign a = 10'sb0010110000;
#1
assign a = 10'sb0010110001;
#1
assign a = 10'sb0010110010;
#1
assign a = 10'sb0010110011;
#1
assign a = 10'sb0010110100;
#1
assign a = 10'sb0010110101;
#1
assign a = 10'sb0010110110;
#1
assign a = 10'sb0010110111;
#1
assign a = 10'sb0010111000;
#1
assign a = 10'sb0010111001;
#1
assign a = 10'sb0010111010;
#1
assign a = 10'sb0010111011;
#1
assign a = 10'sb0010111100;
#1
assign a = 10'sb0010111101;
#1
assign a = 10'sb0010111110;
#1
assign a = 10'sb0010111111;
#1
assign a = 10'sb0011000000;
#1
assign a = 10'sb0011000001;
#1
assign a = 10'sb0011000010;
#1
assign a = 10'sb0011000011;
#1
assign a = 10'sb0011000100;
#1
assign a = 10'sb0011000101;
#1
assign a = 10'sb0011000110;
#1
assign a = 10'sb0011000111;
#1
assign a = 10'sb0011001000;
#1
assign a = 10'sb0011001001;
#1
assign a = 10'sb0011001010;
#1
assign a = 10'sb0011001011;
#1
assign a = 10'sb0011001100;
#1
assign a = 10'sb0011001101;
#1
assign a = 10'sb0011001110;
#1
assign a = 10'sb0011001111;
#1
assign a = 10'sb0011010000;
#1
assign a = 10'sb0011010001;
#1
assign a = 10'sb0011010010;
#1
assign a = 10'sb0011010011;
#1
assign a = 10'sb0011010100;
#1
assign a = 10'sb0011010101;
#1
assign a = 10'sb0011010110;
#1
assign a = 10'sb0011010111;
#1
assign a = 10'sb0011011000;
#1
assign a = 10'sb0011011001;
#1
assign a = 10'sb0011011010;
#1
assign a = 10'sb0011011011;
#1
assign a = 10'sb0011011100;
#1
assign a = 10'sb0011011101;
#1
assign a = 10'sb0011011110;
#1
assign a = 10'sb0011011111;
#1
assign a = 10'sb0011100000;
#1
assign a = 10'sb0011100001;
#1
assign a = 10'sb0011100010;
#1
assign a = 10'sb0011100011;
#1
assign a = 10'sb0011100100;
#1
assign a = 10'sb0011100101;
#1
assign a = 10'sb0011100110;
#1
assign a = 10'sb0011100111;
#1
assign a = 10'sb0011101000;
#1
assign a = 10'sb0011101001;
#1
assign a = 10'sb0011101010;
#1
assign a = 10'sb0011101011;
#1
assign a = 10'sb0011101100;
#1
assign a = 10'sb0011101101;
#1
assign a = 10'sb0011101110;
#1
assign a = 10'sb0011101111;
#1
assign a = 10'sb0011110000;
#1
assign a = 10'sb0011110001;
#1
assign a = 10'sb0011110010;
#1
assign a = 10'sb0011110011;
#1
assign a = 10'sb0011110100;
#1
assign a = 10'sb0011110101;
#1
assign a = 10'sb0011110110;
#1
assign a = 10'sb0011110111;
#1
assign a = 10'sb0011111000;
#1
assign a = 10'sb0011111001;
#1
assign a = 10'sb0011111010;
#1
assign a = 10'sb0011111011;
#1
assign a = 10'sb0011111100;
#1
assign a = 10'sb0011111101;
#1
assign a = 10'sb0011111110;
#1
assign a = 10'sb0011111111;
#1
assign a = 10'sb0100000000;
#1
assign a = 10'sb0100000001;
#1
assign a = 10'sb0100000010;
#1
assign a = 10'sb0100000011;
#1
assign a = 10'sb0100000100;
#1
assign a = 10'sb0100000101;
#1
assign a = 10'sb0100000110;
#1
assign a = 10'sb0100000111;
#1
assign a = 10'sb0100001000;
#1
assign a = 10'sb0100001001;
#1
assign a = 10'sb0100001010;
#1
assign a = 10'sb0100001011;
#1
assign a = 10'sb0100001100;
#1
assign a = 10'sb0100001101;
#1
assign a = 10'sb0100001110;
#1
assign a = 10'sb0100001111;
#1
assign a = 10'sb0100010000;
#1
assign a = 10'sb0100010001;
#1
assign a = 10'sb0100010010;
#1
assign a = 10'sb0100010011;
#1
assign a = 10'sb0100010100;
#1
assign a = 10'sb0100010101;
#1
assign a = 10'sb0100010110;
#1
assign a = 10'sb0100010111;
#1
assign a = 10'sb0100011000;
#1
assign a = 10'sb0100011001;
#1
assign a = 10'sb0100011010;
#1
assign a = 10'sb0100011011;
#1
assign a = 10'sb0100011100;
#1
assign a = 10'sb0100011101;
#1
assign a = 10'sb0100011110;
#1
assign a = 10'sb0100011111;
#1
assign a = 10'sb0100100000;
#1
assign a = 10'sb0100100001;
#1
assign a = 10'sb0100100010;
#1
assign a = 10'sb0100100011;
#1
assign a = 10'sb0100100100;
#1
assign a = 10'sb0100100101;
#1
assign a = 10'sb0100100110;
#1
assign a = 10'sb0100100111;
#1
assign a = 10'sb0100101000;
#1
assign a = 10'sb0100101001;
#1
assign a = 10'sb0100101010;
#1
assign a = 10'sb0100101011;
#1
assign a = 10'sb0100101100;
#1
assign a = 10'sb0100101101;
#1
assign a = 10'sb0100101110;
#1
assign a = 10'sb0100101111;
#1
assign a = 10'sb0100110000;
#1
assign a = 10'sb0100110001;
#1
assign a = 10'sb0100110010;
#1
assign a = 10'sb0100110011;
#1
assign a = 10'sb0100110100;
#1
assign a = 10'sb0100110101;
#1
assign a = 10'sb0100110110;
#1
assign a = 10'sb0100110111;
#1
assign a = 10'sb0100111000;
#1
assign a = 10'sb0100111001;
#1
assign a = 10'sb0100111010;
#1
assign a = 10'sb0100111011;
#1
assign a = 10'sb0100111100;
#1
assign a = 10'sb0100111101;
#1
assign a = 10'sb0100111110;
#1
assign a = 10'sb0100111111;
#1
assign a = 10'sb0101000000;
#1
assign a = 10'sb0101000001;
#1
assign a = 10'sb0101000010;
#1
assign a = 10'sb0101000011;
#1
assign a = 10'sb0101000100;
#1
assign a = 10'sb0101000101;
#1
assign a = 10'sb0101000110;
#1
assign a = 10'sb0101000111;
#1
assign a = 10'sb0101001000;
#1
assign a = 10'sb0101001001;
#1
assign a = 10'sb0101001010;
#1
assign a = 10'sb0101001011;
#1
assign a = 10'sb0101001100;
#1
assign a = 10'sb0101001101;
#1
assign a = 10'sb0101001110;
#1
assign a = 10'sb0101001111;
#1
assign a = 10'sb0101010000;
#1
assign a = 10'sb0101010001;
#1
assign a = 10'sb0101010010;
#1
assign a = 10'sb0101010011;
#1
assign a = 10'sb0101010100;
#1
assign a = 10'sb0101010101;
#1
assign a = 10'sb0101010110;
#1
assign a = 10'sb0101010111;
#1
assign a = 10'sb0101011000;
#1
assign a = 10'sb0101011001;
#1
assign a = 10'sb0101011010;
#1
assign a = 10'sb0101011011;
#1
assign a = 10'sb0101011100;
#1
assign a = 10'sb0101011101;
#1
assign a = 10'sb0101011110;
#1
assign a = 10'sb0101011111;
#1
assign a = 10'sb0101100000;
#1
assign a = 10'sb0101100001;
#1
assign a = 10'sb0101100010;
#1
assign a = 10'sb0101100011;
#1
assign a = 10'sb0101100100;
#1
assign a = 10'sb0101100101;
#1
assign a = 10'sb0101100110;
#1
assign a = 10'sb0101100111;
#1
assign a = 10'sb0101101000;
#1
assign a = 10'sb0101101001;
#1
assign a = 10'sb0101101010;
#1
assign a = 10'sb0101101011;
#1
assign a = 10'sb0101101100;
#1
assign a = 10'sb0101101101;
#1
assign a = 10'sb0101101110;
#1
assign a = 10'sb0101101111;
#1
assign a = 10'sb0101110000;
#1
assign a = 10'sb0101110001;
#1
assign a = 10'sb0101110010;
#1
assign a = 10'sb0101110011;
#1
assign a = 10'sb0101110100;
#1
assign a = 10'sb0101110101;
#1
assign a = 10'sb0101110110;
#1
assign a = 10'sb0101110111;
#1
assign a = 10'sb0101111000;
#1
assign a = 10'sb0101111001;
#1
assign a = 10'sb0101111010;
#1
assign a = 10'sb0101111011;
#1
assign a = 10'sb0101111100;
#1
assign a = 10'sb0101111101;
#1
assign a = 10'sb0101111110;
#1
assign a = 10'sb0101111111;
#1
assign a = 10'sb0110000000;
#1
assign a = 10'sb0110000001;
#1
assign a = 10'sb0110000010;
#1
assign a = 10'sb0110000011;
#1
assign a = 10'sb0110000100;
#1
assign a = 10'sb0110000101;
#1
assign a = 10'sb0110000110;
#1
assign a = 10'sb0110000111;
#1
assign a = 10'sb0110001000;
#1
assign a = 10'sb0110001001;
#1
assign a = 10'sb0110001010;
#1
assign a = 10'sb0110001011;
#1
assign a = 10'sb0110001100;
#1
assign a = 10'sb0110001101;
#1
assign a = 10'sb0110001110;
#1
assign a = 10'sb0110001111;
#1
assign a = 10'sb0110010000;
#1
assign a = 10'sb0110010001;
#1
assign a = 10'sb0110010010;
#1
assign a = 10'sb0110010011;
#1
assign a = 10'sb0110010100;
#1
assign a = 10'sb0110010101;
#1
assign a = 10'sb0110010110;
#1
assign a = 10'sb0110010111;
#1
assign a = 10'sb0110011000;
#1
assign a = 10'sb0110011001;
#1
assign a = 10'sb0110011010;
#1
assign a = 10'sb0110011011;
#1
assign a = 10'sb0110011100;
#1
assign a = 10'sb0110011101;
#1
assign a = 10'sb0110011110;
#1
assign a = 10'sb0110011111;
#1
assign a = 10'sb0110100000;
#1
assign a = 10'sb0110100001;
#1
assign a = 10'sb0110100010;
#1
assign a = 10'sb0110100011;
#1
assign a = 10'sb0110100100;
#1
assign a = 10'sb0110100101;
#1
assign a = 10'sb0110100110;
#1
assign a = 10'sb0110100111;
#1
assign a = 10'sb0110101000;
#1
assign a = 10'sb0110101001;
#1
assign a = 10'sb0110101010;
#1
assign a = 10'sb0110101011;
#1
assign a = 10'sb0110101100;
#1
assign a = 10'sb0110101101;
#1
assign a = 10'sb0110101110;
#1
assign a = 10'sb0110101111;
#1
assign a = 10'sb0110110000;
#1
assign a = 10'sb0110110001;
#1
assign a = 10'sb0110110010;
#1
assign a = 10'sb0110110011;
#1
assign a = 10'sb0110110100;
#1
assign a = 10'sb0110110101;
#1
assign a = 10'sb0110110110;
#1
assign a = 10'sb0110110111;
#1
assign a = 10'sb0110111000;
#1
assign a = 10'sb0110111001;
#1
assign a = 10'sb0110111010;
#1
assign a = 10'sb0110111011;
#1
assign a = 10'sb0110111100;
#1
assign a = 10'sb0110111101;
#1
assign a = 10'sb0110111110;
#1
assign a = 10'sb0110111111;
#1
assign a = 10'sb0111000000;
#1
assign a = 10'sb0111000001;
#1
assign a = 10'sb0111000010;
#1
assign a = 10'sb0111000011;
#1
assign a = 10'sb0111000100;
#1
assign a = 10'sb0111000101;
#1
assign a = 10'sb0111000110;
#1
assign a = 10'sb0111000111;
#1
assign a = 10'sb0111001000;
#1
assign a = 10'sb0111001001;
#1
assign a = 10'sb0111001010;
#1
assign a = 10'sb0111001011;
#1
assign a = 10'sb0111001100;
#1
assign a = 10'sb0111001101;
#1
assign a = 10'sb0111001110;
#1
assign a = 10'sb0111001111;
#1
assign a = 10'sb0111010000;
#1
assign a = 10'sb0111010001;
#1
assign a = 10'sb0111010010;
#1
assign a = 10'sb0111010011;
#1
assign a = 10'sb0111010100;
#1
assign a = 10'sb0111010101;
#1
assign a = 10'sb0111010110;
#1
assign a = 10'sb0111010111;
#1
assign a = 10'sb0111011000;
#1
assign a = 10'sb0111011001;
#1
assign a = 10'sb0111011010;
#1
assign a = 10'sb0111011011;
#1
assign a = 10'sb0111011100;
#1
assign a = 10'sb0111011101;
#1
assign a = 10'sb0111011110;
#1
assign a = 10'sb0111011111;
#1
assign a = 10'sb0111100000;
#1
assign a = 10'sb0111100001;
#1
assign a = 10'sb0111100010;
#1
assign a = 10'sb0111100011;
#1
assign a = 10'sb0111100100;
#1
assign a = 10'sb0111100101;
#1
assign a = 10'sb0111100110;
#1
assign a = 10'sb0111100111;
#1
assign a = 10'sb0111101000;
#1
assign a = 10'sb0111101001;
#1
assign a = 10'sb0111101010;
#1
assign a = 10'sb0111101011;
#1
assign a = 10'sb0111101100;
#1
assign a = 10'sb0111101101;
#1
assign a = 10'sb0111101110;
#1
assign a = 10'sb0111101111;
#1
assign a = 10'sb0111110000;
#1
assign a = 10'sb0111110001;
#1
assign a = 10'sb0111110010;
#1
assign a = 10'sb0111110011;
#1
assign a = 10'sb0111110100;
#1
assign a = 10'sb0111110101;
#1
assign a = 10'sb0111110110;
#1
assign a = 10'sb0111110111;
#1
assign a = 10'sb0111111000;
#1
assign a = 10'sb0111111001;
#1
assign a = 10'sb0111111010;
#1
assign a = 10'sb0111111011;
#1
assign a = 10'sb0111111100;
#1
assign a = 10'sb0111111101;
#1
assign a = 10'sb0111111110;
#1
assign a = 10'sb0111111111;
#1
assign a = 10'sb1000000000;
#1
assign a = 10'sb1000000001;
#1
assign a = 10'sb1000000010;
#1
assign a = 10'sb1000000011;
#1
assign a = 10'sb1000000100;
#1
assign a = 10'sb1000000101;
#1
assign a = 10'sb1000000110;
#1
assign a = 10'sb1000000111;
#1
assign a = 10'sb1000001000;
#1
assign a = 10'sb1000001001;
#1
assign a = 10'sb1000001010;
#1
assign a = 10'sb1000001011;
#1
assign a = 10'sb1000001100;
#1
assign a = 10'sb1000001101;
#1
assign a = 10'sb1000001110;
#1
assign a = 10'sb1000001111;
#1
assign a = 10'sb1000010000;
#1
assign a = 10'sb1000010001;
#1
assign a = 10'sb1000010010;
#1
assign a = 10'sb1000010011;
#1
assign a = 10'sb1000010100;
#1
assign a = 10'sb1000010101;
#1
assign a = 10'sb1000010110;
#1
assign a = 10'sb1000010111;
#1
assign a = 10'sb1000011000;
#1
assign a = 10'sb1000011001;
#1
assign a = 10'sb1000011010;
#1
assign a = 10'sb1000011011;
#1
assign a = 10'sb1000011100;
#1
assign a = 10'sb1000011101;
#1
assign a = 10'sb1000011110;
#1
assign a = 10'sb1000011111;
#1
assign a = 10'sb1000100000;
#1
assign a = 10'sb1000100001;
#1
assign a = 10'sb1000100010;
#1
assign a = 10'sb1000100011;
#1
assign a = 10'sb1000100100;
#1
assign a = 10'sb1000100101;
#1
assign a = 10'sb1000100110;
#1
assign a = 10'sb1000100111;
#1
assign a = 10'sb1000101000;
#1
assign a = 10'sb1000101001;
#1
assign a = 10'sb1000101010;
#1
assign a = 10'sb1000101011;
#1
assign a = 10'sb1000101100;
#1
assign a = 10'sb1000101101;
#1
assign a = 10'sb1000101110;
#1
assign a = 10'sb1000101111;
#1
assign a = 10'sb1000110000;
#1
assign a = 10'sb1000110001;
#1
assign a = 10'sb1000110010;
#1
assign a = 10'sb1000110011;
#1
assign a = 10'sb1000110100;
#1
assign a = 10'sb1000110101;
#1
assign a = 10'sb1000110110;
#1
assign a = 10'sb1000110111;
#1
assign a = 10'sb1000111000;
#1
assign a = 10'sb1000111001;
#1
assign a = 10'sb1000111010;
#1
assign a = 10'sb1000111011;
#1
assign a = 10'sb1000111100;
#1
assign a = 10'sb1000111101;
#1
assign a = 10'sb1000111110;
#1
assign a = 10'sb1000111111;
#1
assign a = 10'sb1001000000;
#1
assign a = 10'sb1001000001;
#1
assign a = 10'sb1001000010;
#1
assign a = 10'sb1001000011;
#1
assign a = 10'sb1001000100;
#1
assign a = 10'sb1001000101;
#1
assign a = 10'sb1001000110;
#1
assign a = 10'sb1001000111;
#1
assign a = 10'sb1001001000;
#1
assign a = 10'sb1001001001;
#1
assign a = 10'sb1001001010;
#1
assign a = 10'sb1001001011;
#1
assign a = 10'sb1001001100;
#1
assign a = 10'sb1001001101;
#1
assign a = 10'sb1001001110;
#1
assign a = 10'sb1001001111;
#1
assign a = 10'sb1001010000;
#1
assign a = 10'sb1001010001;
#1
assign a = 10'sb1001010010;
#1
assign a = 10'sb1001010011;
#1
assign a = 10'sb1001010100;
#1
assign a = 10'sb1001010101;
#1
assign a = 10'sb1001010110;
#1
assign a = 10'sb1001010111;
#1
assign a = 10'sb1001011000;
#1
assign a = 10'sb1001011001;
#1
assign a = 10'sb1001011010;
#1
assign a = 10'sb1001011011;
#1
assign a = 10'sb1001011100;
#1
assign a = 10'sb1001011101;
#1
assign a = 10'sb1001011110;
#1
assign a = 10'sb1001011111;
#1
assign a = 10'sb1001100000;
#1
assign a = 10'sb1001100001;
#1
assign a = 10'sb1001100010;
#1
assign a = 10'sb1001100011;
#1
assign a = 10'sb1001100100;
#1
assign a = 10'sb1001100101;
#1
assign a = 10'sb1001100110;
#1
assign a = 10'sb1001100111;
#1
assign a = 10'sb1001101000;
#1
assign a = 10'sb1001101001;
#1
assign a = 10'sb1001101010;
#1
assign a = 10'sb1001101011;
#1
assign a = 10'sb1001101100;
#1
assign a = 10'sb1001101101;
#1
assign a = 10'sb1001101110;
#1
assign a = 10'sb1001101111;
#1
assign a = 10'sb1001110000;
#1
assign a = 10'sb1001110001;
#1
assign a = 10'sb1001110010;
#1
assign a = 10'sb1001110011;
#1
assign a = 10'sb1001110100;
#1
assign a = 10'sb1001110101;
#1
assign a = 10'sb1001110110;
#1
assign a = 10'sb1001110111;
#1
assign a = 10'sb1001111000;
#1
assign a = 10'sb1001111001;
#1
assign a = 10'sb1001111010;
#1
assign a = 10'sb1001111011;
#1
assign a = 10'sb1001111100;
#1
assign a = 10'sb1001111101;
#1
assign a = 10'sb1001111110;
#1
assign a = 10'sb1001111111;
#1
assign a = 10'sb1010000000;
#1
assign a = 10'sb1010000001;
#1
assign a = 10'sb1010000010;
#1
assign a = 10'sb1010000011;
#1
assign a = 10'sb1010000100;
#1
assign a = 10'sb1010000101;
#1
assign a = 10'sb1010000110;
#1
assign a = 10'sb1010000111;
#1
assign a = 10'sb1010001000;
#1
assign a = 10'sb1010001001;
#1
assign a = 10'sb1010001010;
#1
assign a = 10'sb1010001011;
#1
assign a = 10'sb1010001100;
#1
assign a = 10'sb1010001101;
#1
assign a = 10'sb1010001110;
#1
assign a = 10'sb1010001111;
#1
assign a = 10'sb1010010000;
#1
assign a = 10'sb1010010001;
#1
assign a = 10'sb1010010010;
#1
assign a = 10'sb1010010011;
#1
assign a = 10'sb1010010100;
#1
assign a = 10'sb1010010101;
#1
assign a = 10'sb1010010110;
#1
assign a = 10'sb1010010111;
#1
assign a = 10'sb1010011000;
#1
assign a = 10'sb1010011001;
#1
assign a = 10'sb1010011010;
#1
assign a = 10'sb1010011011;
#1
assign a = 10'sb1010011100;
#1
assign a = 10'sb1010011101;
#1
assign a = 10'sb1010011110;
#1
assign a = 10'sb1010011111;
#1
assign a = 10'sb1010100000;
#1
assign a = 10'sb1010100001;
#1
assign a = 10'sb1010100010;
#1
assign a = 10'sb1010100011;
#1
assign a = 10'sb1010100100;
#1
assign a = 10'sb1010100101;
#1
assign a = 10'sb1010100110;
#1
assign a = 10'sb1010100111;
#1
assign a = 10'sb1010101000;
#1
assign a = 10'sb1010101001;
#1
assign a = 10'sb1010101010;
#1
assign a = 10'sb1010101011;
#1
assign a = 10'sb1010101100;
#1
assign a = 10'sb1010101101;
#1
assign a = 10'sb1010101110;
#1
assign a = 10'sb1010101111;
#1
assign a = 10'sb1010110000;
#1
assign a = 10'sb1010110001;
#1
assign a = 10'sb1010110010;
#1
assign a = 10'sb1010110011;
#1
assign a = 10'sb1010110100;
#1
assign a = 10'sb1010110101;
#1
assign a = 10'sb1010110110;
#1
assign a = 10'sb1010110111;
#1
assign a = 10'sb1010111000;
#1
assign a = 10'sb1010111001;
#1
assign a = 10'sb1010111010;
#1
assign a = 10'sb1010111011;
#1
assign a = 10'sb1010111100;
#1
assign a = 10'sb1010111101;
#1
assign a = 10'sb1010111110;
#1
assign a = 10'sb1010111111;
#1
assign a = 10'sb1011000000;
#1
assign a = 10'sb1011000001;
#1
assign a = 10'sb1011000010;
#1
assign a = 10'sb1011000011;
#1
assign a = 10'sb1011000100;
#1
assign a = 10'sb1011000101;
#1
assign a = 10'sb1011000110;
#1
assign a = 10'sb1011000111;
#1
assign a = 10'sb1011001000;
#1
assign a = 10'sb1011001001;
#1
assign a = 10'sb1011001010;
#1
assign a = 10'sb1011001011;
#1
assign a = 10'sb1011001100;
#1
assign a = 10'sb1011001101;
#1
assign a = 10'sb1011001110;
#1
assign a = 10'sb1011001111;
#1
assign a = 10'sb1011010000;
#1
assign a = 10'sb1011010001;
#1
assign a = 10'sb1011010010;
#1
assign a = 10'sb1011010011;
#1
assign a = 10'sb1011010100;
#1
assign a = 10'sb1011010101;
#1
assign a = 10'sb1011010110;
#1
assign a = 10'sb1011010111;
#1
assign a = 10'sb1011011000;
#1
assign a = 10'sb1011011001;
#1
assign a = 10'sb1011011010;
#1
assign a = 10'sb1011011011;
#1
assign a = 10'sb1011011100;
#1
assign a = 10'sb1011011101;
#1
assign a = 10'sb1011011110;
#1
assign a = 10'sb1011011111;
#1
assign a = 10'sb1011100000;
#1
assign a = 10'sb1011100001;
#1
assign a = 10'sb1011100010;
#1
assign a = 10'sb1011100011;
#1
assign a = 10'sb1011100100;
#1
assign a = 10'sb1011100101;
#1
assign a = 10'sb1011100110;
#1
assign a = 10'sb1011100111;
#1
assign a = 10'sb1011101000;
#1
assign a = 10'sb1011101001;
#1
assign a = 10'sb1011101010;
#1
assign a = 10'sb1011101011;
#1
assign a = 10'sb1011101100;
#1
assign a = 10'sb1011101101;
#1
assign a = 10'sb1011101110;
#1
assign a = 10'sb1011101111;
#1
assign a = 10'sb1011110000;
#1
assign a = 10'sb1011110001;
#1
assign a = 10'sb1011110010;
#1
assign a = 10'sb1011110011;
#1
assign a = 10'sb1011110100;
#1
assign a = 10'sb1011110101;
#1
assign a = 10'sb1011110110;
#1
assign a = 10'sb1011110111;
#1
assign a = 10'sb1011111000;
#1
assign a = 10'sb1011111001;
#1
assign a = 10'sb1011111010;
#1
assign a = 10'sb1011111011;
#1
assign a = 10'sb1011111100;
#1
assign a = 10'sb1011111101;
#1
assign a = 10'sb1011111110;
#1
assign a = 10'sb1011111111;
#1
assign a = 10'sb1100000000;
#1
assign a = 10'sb1100000001;
#1
assign a = 10'sb1100000010;
#1
assign a = 10'sb1100000011;
#1
assign a = 10'sb1100000100;
#1
assign a = 10'sb1100000101;
#1
assign a = 10'sb1100000110;
#1
assign a = 10'sb1100000111;
#1
assign a = 10'sb1100001000;
#1
assign a = 10'sb1100001001;
#1
assign a = 10'sb1100001010;
#1
assign a = 10'sb1100001011;
#1
assign a = 10'sb1100001100;
#1
assign a = 10'sb1100001101;
#1
assign a = 10'sb1100001110;
#1
assign a = 10'sb1100001111;
#1
assign a = 10'sb1100010000;
#1
assign a = 10'sb1100010001;
#1
assign a = 10'sb1100010010;
#1
assign a = 10'sb1100010011;
#1
assign a = 10'sb1100010100;
#1
assign a = 10'sb1100010101;
#1
assign a = 10'sb1100010110;
#1
assign a = 10'sb1100010111;
#1
assign a = 10'sb1100011000;
#1
assign a = 10'sb1100011001;
#1
assign a = 10'sb1100011010;
#1
assign a = 10'sb1100011011;
#1
assign a = 10'sb1100011100;
#1
assign a = 10'sb1100011101;
#1
assign a = 10'sb1100011110;
#1
assign a = 10'sb1100011111;
#1
assign a = 10'sb1100100000;
#1
assign a = 10'sb1100100001;
#1
assign a = 10'sb1100100010;
#1
assign a = 10'sb1100100011;
#1
assign a = 10'sb1100100100;
#1
assign a = 10'sb1100100101;
#1
assign a = 10'sb1100100110;
#1
assign a = 10'sb1100100111;
#1
assign a = 10'sb1100101000;
#1
assign a = 10'sb1100101001;
#1
assign a = 10'sb1100101010;
#1
assign a = 10'sb1100101011;
#1
assign a = 10'sb1100101100;
#1
assign a = 10'sb1100101101;
#1
assign a = 10'sb1100101110;
#1
assign a = 10'sb1100101111;
#1
assign a = 10'sb1100110000;
#1
assign a = 10'sb1100110001;
#1
assign a = 10'sb1100110010;
#1
assign a = 10'sb1100110011;
#1
assign a = 10'sb1100110100;
#1
assign a = 10'sb1100110101;
#1
assign a = 10'sb1100110110;
#1
assign a = 10'sb1100110111;
#1
assign a = 10'sb1100111000;
#1
assign a = 10'sb1100111001;
#1
assign a = 10'sb1100111010;
#1
assign a = 10'sb1100111011;
#1
assign a = 10'sb1100111100;
#1
assign a = 10'sb1100111101;
#1
assign a = 10'sb1100111110;
#1
assign a = 10'sb1100111111;
#1
assign a = 10'sb1101000000;
#1
assign a = 10'sb1101000001;
#1
assign a = 10'sb1101000010;
#1
assign a = 10'sb1101000011;
#1
assign a = 10'sb1101000100;
#1
assign a = 10'sb1101000101;
#1
assign a = 10'sb1101000110;
#1
assign a = 10'sb1101000111;
#1
assign a = 10'sb1101001000;
#1
assign a = 10'sb1101001001;
#1
assign a = 10'sb1101001010;
#1
assign a = 10'sb1101001011;
#1
assign a = 10'sb1101001100;
#1
assign a = 10'sb1101001101;
#1
assign a = 10'sb1101001110;
#1
assign a = 10'sb1101001111;
#1
assign a = 10'sb1101010000;
#1
assign a = 10'sb1101010001;
#1
assign a = 10'sb1101010010;
#1
assign a = 10'sb1101010011;
#1
assign a = 10'sb1101010100;
#1
assign a = 10'sb1101010101;
#1
assign a = 10'sb1101010110;
#1
assign a = 10'sb1101010111;
#1
assign a = 10'sb1101011000;
#1
assign a = 10'sb1101011001;
#1
assign a = 10'sb1101011010;
#1
assign a = 10'sb1101011011;
#1
assign a = 10'sb1101011100;
#1
assign a = 10'sb1101011101;
#1
assign a = 10'sb1101011110;
#1
assign a = 10'sb1101011111;
#1
assign a = 10'sb1101100000;
#1
assign a = 10'sb1101100001;
#1
assign a = 10'sb1101100010;
#1
assign a = 10'sb1101100011;
#1
assign a = 10'sb1101100100;
#1
assign a = 10'sb1101100101;
#1
assign a = 10'sb1101100110;
#1
assign a = 10'sb1101100111;
#1
assign a = 10'sb1101101000;
#1
assign a = 10'sb1101101001;
#1
assign a = 10'sb1101101010;
#1
assign a = 10'sb1101101011;
#1
assign a = 10'sb1101101100;
#1
assign a = 10'sb1101101101;
#1
assign a = 10'sb1101101110;
#1
assign a = 10'sb1101101111;
#1
assign a = 10'sb1101110000;
#1
assign a = 10'sb1101110001;
#1
assign a = 10'sb1101110010;
#1
assign a = 10'sb1101110011;
#1
assign a = 10'sb1101110100;
#1
assign a = 10'sb1101110101;
#1
assign a = 10'sb1101110110;
#1
assign a = 10'sb1101110111;
#1
assign a = 10'sb1101111000;
#1
assign a = 10'sb1101111001;
#1
assign a = 10'sb1101111010;
#1
assign a = 10'sb1101111011;
#1
assign a = 10'sb1101111100;
#1
assign a = 10'sb1101111101;
#1
assign a = 10'sb1101111110;
#1
assign a = 10'sb1101111111;
#1
assign a = 10'sb1110000000;
#1
assign a = 10'sb1110000001;
#1
assign a = 10'sb1110000010;
#1
assign a = 10'sb1110000011;
#1
assign a = 10'sb1110000100;
#1
assign a = 10'sb1110000101;
#1
assign a = 10'sb1110000110;
#1
assign a = 10'sb1110000111;
#1
assign a = 10'sb1110001000;
#1
assign a = 10'sb1110001001;
#1
assign a = 10'sb1110001010;
#1
assign a = 10'sb1110001011;
#1
assign a = 10'sb1110001100;
#1
assign a = 10'sb1110001101;
#1
assign a = 10'sb1110001110;
#1
assign a = 10'sb1110001111;
#1
assign a = 10'sb1110010000;
#1
assign a = 10'sb1110010001;
#1
assign a = 10'sb1110010010;
#1
assign a = 10'sb1110010011;
#1
assign a = 10'sb1110010100;
#1
assign a = 10'sb1110010101;
#1
assign a = 10'sb1110010110;
#1
assign a = 10'sb1110010111;
#1
assign a = 10'sb1110011000;
#1
assign a = 10'sb1110011001;
#1
assign a = 10'sb1110011010;
#1
assign a = 10'sb1110011011;
#1
assign a = 10'sb1110011100;
#1
assign a = 10'sb1110011101;
#1
assign a = 10'sb1110011110;
#1
assign a = 10'sb1110011111;
#1
assign a = 10'sb1110100000;
#1
assign a = 10'sb1110100001;
#1
assign a = 10'sb1110100010;
#1
assign a = 10'sb1110100011;
#1
assign a = 10'sb1110100100;
#1
assign a = 10'sb1110100101;
#1
assign a = 10'sb1110100110;
#1
assign a = 10'sb1110100111;
#1
assign a = 10'sb1110101000;
#1
assign a = 10'sb1110101001;
#1
assign a = 10'sb1110101010;
#1
assign a = 10'sb1110101011;
#1
assign a = 10'sb1110101100;
#1
assign a = 10'sb1110101101;
#1
assign a = 10'sb1110101110;
#1
assign a = 10'sb1110101111;
#1
assign a = 10'sb1110110000;
#1
assign a = 10'sb1110110001;
#1
assign a = 10'sb1110110010;
#1
assign a = 10'sb1110110011;
#1
assign a = 10'sb1110110100;
#1
assign a = 10'sb1110110101;
#1
assign a = 10'sb1110110110;
#1
assign a = 10'sb1110110111;
#1
assign a = 10'sb1110111000;
#1
assign a = 10'sb1110111001;
#1
assign a = 10'sb1110111010;
#1
assign a = 10'sb1110111011;
#1
assign a = 10'sb1110111100;
#1
assign a = 10'sb1110111101;
#1
assign a = 10'sb1110111110;
#1
assign a = 10'sb1110111111;
#1
assign a = 10'sb1111000000;
#1
assign a = 10'sb1111000001;
#1
assign a = 10'sb1111000010;
#1
assign a = 10'sb1111000011;
#1
assign a = 10'sb1111000100;
#1
assign a = 10'sb1111000101;
#1
assign a = 10'sb1111000110;
#1
assign a = 10'sb1111000111;
#1
assign a = 10'sb1111001000;
#1
assign a = 10'sb1111001001;
#1
assign a = 10'sb1111001010;
#1
assign a = 10'sb1111001011;
#1
assign a = 10'sb1111001100;
#1
assign a = 10'sb1111001101;
#1
assign a = 10'sb1111001110;
#1
assign a = 10'sb1111001111;
#1
assign a = 10'sb1111010000;
#1
assign a = 10'sb1111010001;
#1
assign a = 10'sb1111010010;
#1
assign a = 10'sb1111010011;
#1
assign a = 10'sb1111010100;
#1
assign a = 10'sb1111010101;
#1
assign a = 10'sb1111010110;
#1
assign a = 10'sb1111010111;
#1
assign a = 10'sb1111011000;
#1
assign a = 10'sb1111011001;
#1
assign a = 10'sb1111011010;
#1
assign a = 10'sb1111011011;
#1
assign a = 10'sb1111011100;
#1
assign a = 10'sb1111011101;
#1
assign a = 10'sb1111011110;
#1
assign a = 10'sb1111011111;
#1
assign a = 10'sb1111100000;
#1
assign a = 10'sb1111100001;
#1
assign a = 10'sb1111100010;
#1
assign a = 10'sb1111100011;
#1
assign a = 10'sb1111100100;
#1
assign a = 10'sb1111100101;
#1
assign a = 10'sb1111100110;
#1
assign a = 10'sb1111100111;
#1
assign a = 10'sb1111101000;
#1
assign a = 10'sb1111101001;
#1
assign a = 10'sb1111101010;
#1
assign a = 10'sb1111101011;
#1
assign a = 10'sb1111101100;
#1
assign a = 10'sb1111101101;
#1
assign a = 10'sb1111101110;
#1
assign a = 10'sb1111101111;
#1
assign a = 10'sb1111110000;
#1
assign a = 10'sb1111110001;
#1
assign a = 10'sb1111110010;
#1
assign a = 10'sb1111110011;
#1
assign a = 10'sb1111110100;
#1
assign a = 10'sb1111110101;
#1
assign a = 10'sb1111110110;
#1
assign a = 10'sb1111110111;
#1
assign a = 10'sb1111111000;
#1
assign a = 10'sb1111111001;
#1
assign a = 10'sb1111111010;
#1
assign a = 10'sb1111111011;
#1
assign a = 10'sb1111111100;
#1
assign a = 10'sb1111111101;
#1
assign a = 10'sb1111111110;
#1
assign a = 10'sb1111111111;
    end

endmodule
