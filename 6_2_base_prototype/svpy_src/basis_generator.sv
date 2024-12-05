$ from svmath import *

$ angle = Fixed(3, 7, "angle")
$ u = Vec2(2, 14, "u")
$ v = Vec2(2, 14, "v")

module basis_generator
(
    $$angle.declare("input")$$,
    $$u.declare("output")$$,
    $$v.declare("output")$$
);

always_comb begin
$$$
u.x.assign(cos(angle))
u.y.assign(sin(angle))

v.x.assign(-u.y)
v.y.assign(u.x)
$$$

end

endmodule