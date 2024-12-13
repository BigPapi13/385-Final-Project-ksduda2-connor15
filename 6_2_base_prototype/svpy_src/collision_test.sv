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

$$$
widthA = Fixed(8, 0, "widthA")
heightA = Fixed(8, 0, "heightA")
posA = Vec2(7, 25, "posA")
velA = Vec2(5, 19, "velA")
uA = Vec2(2, 14, "uA")
vA = Vec2(2, 14, "vA")

widthB = Fixed(8, 0, "widthB")
heightB = Fixed(8, 0, "heightB")
posB = Vec2(7, 25, "posB")
velB = Vec2(5, 19, "velB")
uB = Vec2(2, 14, "uB")
vB = Vec2(2, 14, "vB")
$$$

module collision_test();
timeunit 10ns;
timeprecision 1ns;

$$$
widthA.declare()
heightA.declare()
posA.declare()
velA.declare()
uA.declare()
vA.declare()

widthB.declare()
heightB.declare()
posB.declare()
velB.declare()
uB.declare()
vB.declare()
$$$
    
logic is_collision;

    collision_detector cd_inst(.*);
    
    initial begin: TEST_VECTORS
$$$
widthA.assign(10)
heightA.assign(10)
uA.assign([1, 0])
vA.assign([0, 1])
posA.assign([7, 7])

widthB.assign(10)
heightB.assign(10)
uB.assign([1, 0])
vB.assign([0, 1])
posB.assign([20, 7])
$$$

$$$
for i in range(0, 30):
    svwrite("#16\n")
    j = 19 - i
    posB.x.assign(j)
$$$
    end

endmodule
