$ from math import cos, ceil, pi

module cos
(
    input [9:0] theta,     //10 bits of precision, first 3 are integer part (unsigned)
    output [15:0] out      //16 bits of precision, first 2 are integer part (signed)
);

parameter [0:9][15:0] ROM = {
$$$
max = ceil(2 * pi * 2**7)
for i in range(max):
    line = svmath.to_bits(cos(i / 2**7), 2, 14)
    if i != max - 1:
        line += ","
    svwrite(line, "\n")
$$$
};

assign out = ROM[theta];

endmodule