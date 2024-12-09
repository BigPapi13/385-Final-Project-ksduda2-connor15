// THE JUICER
//  - Takes an input OBB and spits out all the good yummy processed data
//  - The reason this isn't coupled with the OBB register is that some of
//    the operations are very expensive, and we want to use them sparingly

$ from structs import OBB, Juice
$ from svmath import *
$ import math

module juicer(
    $$OBB.declare("input")$$,
    $$Juice.declare("output")$$
);

////// First thing to process: Getting U and V vectors

// Grab only necessary bits of angle
$ angleP = Fixed(3, 7, "angleP")
$ angleP.declare()
$ angleP.assign(OBB.angle)

// Get sine and cos
$ cos_theta = cos(angleP)
$ sin_theta = sin(angleP)

// Assign to vectors
$ Juice.u.assign([cos_theta, sin_theta])
$ Juice.v.assign([-sin_theta, cos_theta])


///// Second order of biz: Get the vertices of the OBB
assign $$Juice.halfWidth$$ = $$OBB.width$$ >> 1;
assign $$Juice.halfHeight$$ = $$OBB.height$$ >> 1;

$$$
i = 0
for w in (-Juice.halfWidth, Juice.halfWidth):
    for h in (-Juice.halfHeight, Juice.halfHeight):
        rotated_point = svmath.ExpressionVec2(w * Juice.u.x + h * Juice.v.x, w * Juice.u.y + h * Juice.v.y)
        
        p = getattr(Juice, f"Point{i}")
        p.assign(rotated_point + OBB.pos)

        i += 1
$$$

endmodule