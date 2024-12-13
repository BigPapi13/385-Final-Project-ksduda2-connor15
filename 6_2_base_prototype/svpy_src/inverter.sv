// inverse.sv
//  - Uses a lookup table to compute the multiplicative inverse 
//  - Note: This only works for unsigned values because that's all we need for this project

$ from svmath import *

$ x = Fixed(10, 0, "x")
$ x_inverse = Fixed(1, 15, "x_inverse")

module inverter
(
    input logic [9 : 0] x,
    output logic [15 : 0] x_inverse
);

parameter ADDR_WIDTH = 10;
parameter DATA_WIDTH = 16;
logic [9:0] addr_reg;

parameter [0:2**ADDR_WIDTH-1][DATA_WIDTH-1:0] ROM = {
10'b0,
$$$
for i in range(1, 2**10):
    line = svmath.to_bits(1 / i, 1, 15, signed=False)
    if i != 2**10 - 1:
        line += ","
    svwrite(line, "\n")
$$$
};

assign x_inverse[DATA_WIDTH-1:0] = ROM[x][DATA_WIDTH-1:0];

endmodule