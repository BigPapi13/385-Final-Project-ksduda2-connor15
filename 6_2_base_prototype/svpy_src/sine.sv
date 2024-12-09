$ from math import sin, ceil, pi

module sin
(
    input [9:0] theta,     //10 bits of precision, first 3 are integer part (unsigned)
    output [15:0] out
);

parameter ADDR_WIDTH = 10;
parameter DATA_WIDTH =  16;
logic [9:0] addr_reg;

parameter [0:2**ADDR_WIDTH-1][DATA_WIDTH-1:0] ROM = {
$$$
# max = ceil(2 * pi * 2**7)
max = 2**10
for i in range(max):
    line = svmath.to_bits(sin(i / 2**7), 2, 14)
    if i != max - 1:
        line += ","
    svwrite(line, "\n")
$$$
};

assign out[DATA_WIDTH-1:0] = ROM[theta][DATA_WIDTH-1:0];

endmodule