$ from svmath import *

// Parameters
$$$
width = Fixed(8, 0, "width")
height = Fixed(8, 0, "height")
pos = Vec2(7, 25, "pos")
vel = Vec2(6, 26, "vel")
angle = Fixed(3, 7, "angle")
$$$

module obb_reg
(
    $$width.declare("output")$$,
    $$height.declare("output")$$,
    $$pos.declare("output")$$,
    $$vel.declare("output")$$,
    $$angle.declare("output")$$
);

always_comb begin


end

endmodule