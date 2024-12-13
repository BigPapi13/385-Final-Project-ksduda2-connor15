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

$ from svmath import *



module division_test();
timeunit 10ns;
timeprecision 1ns;

$$$
a = Fixed(10, 0, "a")
b = Fixed(1, 15, "b")
a.declare()
b.declare()
$$$

$ b.assign(inverse(a))

logic is_collision;
    
    initial begin: TEST_VECTORS
$$$
for i in range(0, 2**10):
    svwrite("#1\n")
    a.assign(i)
$$$
    end

endmodule
