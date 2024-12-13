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
relPoint0 = svmath.ExpressionVec2(-Juice.halfWidth * Juice.u.x + -Juice.halfHeight * Juice.v.x, -Juice.halfWidth * Juice.u.y + -Juice.halfHeight * Juice.v.y)
relPoint1 = svmath.ExpressionVec2(-Juice.halfWidth * Juice.u.x + Juice.halfHeight * Juice.v.x, -Juice.halfWidth * Juice.u.y + Juice.halfHeight * Juice.v.y)
Juice.Point0.assign(OBB.pos + relPoint0)
Juice.Point1.assign(OBB.pos + relPoint1)
Juice.Point2.assign(OBB.pos - relPoint0)
Juice.Point3.assign(OBB.pos - relPoint1)
$$$

endmodule