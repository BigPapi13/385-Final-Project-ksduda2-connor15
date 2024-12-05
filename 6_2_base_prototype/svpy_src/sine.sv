$ from math import sin, ceil, pi

module sin
(
    input [9:0] theta,     //10 bits of precision, first 3 are integer part
    output [15:0] out
);

parameter [0:9][15:0] ROM = {
$$$
max = ceil(2 * pi * 2**7)
for i in range(max):
    line = svmath.to_bits(sin(i / 2**7), 2, 14)
    if i != max - 1:
        line += ","
    svwrite(line, "\n")
$$$
};

assign out = ROM[theta];

endmodule