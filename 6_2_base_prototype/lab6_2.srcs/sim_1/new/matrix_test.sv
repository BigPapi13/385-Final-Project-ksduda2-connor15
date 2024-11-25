`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 03:45:50 PM
// Design Name: 
// Module Name: matrix_test
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


module matrix_test();
timeunit 10ns;
timeprecision 1ns;

    logic Clk;
    logic [15:0] a[2][2];
    logic [15:0] b[2][2];
    
    logic [15:0] out[2][2];
    
    logic [15:0] invec[2];
    logic [15:0] mat[2][2];
    logic [15:0] outvec[2];
    
    matrix_multiplier matmul_inst(
        .a(a),
        .b(b),
        .out(out)
    );
    
    vec_mat_multiplier matmul_inst2(
        .vec(invec),
        .mat(mat),
        .out(outvec)
    );
    
    always begin : CLK_GEN
        #1 Clk = ~Clk;
    end
    
    initial begin: TEST_VECTORS
        Clk = 0;
    
        a[0][0] = 16'b0000000010000000;
        a[0][1] = 16'b0000000100000000;
        a[1][0] = 16'b0000000110000000;
        a[1][1] = 16'b0000001000000000;
        
        b[0][0] = 16'b0000000110000000;
        b[0][1] = 16'b0;
        b[1][0] = 16'b0;
        b[1][1] = 16'b0000000110000000;
        
        #16;
        a[0][0] = 16'b0000000010000000;
        a[0][1] = 16'b0000000100000000;
        a[1][0] = 16'b0000000110000000;
        a[1][1] = 16'b0000001000000000;
        
        b[0][0] = 16'b0000000010100000;
        b[0][1] = 16'b0000000011000000;
        b[1][0] = 16'b0000000011100000;
        b[1][1] = 16'b1111111100000000;
        
        invec[0] = 16'b0000000010000000;
        invec[1] = 16'b0000000110000000;
        
        mat[0][0] = 16'b0000000010100000;
        mat[0][1] = 16'b0000000011000000;
        mat[1][0] = 16'b0000000011100000;
        mat[1][1] = 16'b1111111100000000;
        
    end

endmodule
