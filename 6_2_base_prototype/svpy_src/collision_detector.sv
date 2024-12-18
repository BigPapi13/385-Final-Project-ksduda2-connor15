$ from svmath import *
$ from structs import JOBB, Contact

$ obb1 = JOBB("obb1")
$ obb2 = JOBB("obb2")
$ normal = Vec2(2, 14, "normal")

module collision_detector(
    $$obb1.declare("input")$$,
    $$obb2.declare("input")$$,
    output logic is_collision,
    $$Contact.declare("output")$$
);

// Steps:
//  1. Generate bases of A and B (maybe move this to external module later to minimize cos/sin use)
//  2. Project points of B onto axes of A
//      - Need to get points of rects A and B from pos, dimensions, and angle
///     - Get points RELATIVE to rectangle A
//      - Will refer to this coordinate system as UV coords
//  3. Get minimum and maximum u and v of B
//  4. Use simple comparisons to check for separating axis
//  5. Repeat steps for A onto B
//  6. Use big OR gate to combine all the checks

// Get points of A and B
//  - Need to rotate first, then subtract
$ points1 = [obb1.Point0, obb1.Point1, obb1.Point2, obb1.Point3]
$ points2 = [obb2.Point0, obb2.Point1, obb2.Point2, obb2.Point3]

//// TEST 1: A onto B

// Project points of A onto axes of B
$$$
points1_u = []
points1_v = []
i = 0
for point in points1:
    relative = point - obb2.pos
    point_u = Fixed(8, 16, f"Point1_{i}_u")
    point_v = Fixed(8, 16, f"Point1_{i}_v")

    point_u.declare()
    point_v.declare()

    point_u.assign(relative.Dot(obb2.u))
    point_v.assign(relative.Dot(obb2.v))

    points1_u.append(point_u)
    points1_v.append(point_v)
    i += 1
$$$


// Find max u and v values for rect A
logic signed [23:0] max_uA;
logic signed [23:0] max_uA_01;    // Max of points 0 and 1
logic signed [23:0] max_uA_23;    // Max of points 2 and 3

logic signed [23:0] max_vA;
logic signed [23:0] max_vA_01;    // Max of points 0 and 1
logic signed [23:0] max_vA_23;    // Max of points 2 and 3

// Also record xy coordinate point corresponding to min values
$$$
point_max_uA = Vec2(8, 14, "point_max_uA");
point_max_uA_01 = Vec2(8, 14, "point_max_uA_01");
point_max_uA_23 = Vec2(8, 14, "point_max_uA_23");

point_max_vA = Vec2(8, 14, "point_max_vA");
point_max_vA_01 = Vec2(8, 14, "point_max_vA_01");
point_max_vA_23 = Vec2(8, 14, "point_max_vA_23");

point_max_uA.declare()
point_max_uA_01.declare()
point_max_uA_23.declare()

point_max_vA.declare()
point_max_vA_01.declare()
point_max_vA_23.declare()
$$$

$ begin_comb()

// max u
max_uA_01 = $$points1_u[0]$$;
$ point_max_uA_01.assign(points1[0])
if ($$points1_u[1]$$ > $$points1_u[0]$$) begin
    max_uA_01 = $$points1_u[1]$$;
    $ point_max_uA_01.assign(points1[1])
end

max_uA_23 = $$points1_u[2]$$;
$ point_max_uA_23.assign(points1[2])
if ($$points1_u[3]$$ > $$points1_u[2]$$) begin
    max_uA_23 = $$points1_u[3]$$;
    $ point_max_uA_23.assign(points1[3])
end

max_uA = max_uA_01;
$ point_max_uA.assign(point_max_uA_01)
if (max_uA_23 > max_uA_01) begin
    max_uA = max_uA_23;
    $ point_max_uA.assign(point_max_uA_23)
end

// max v
max_vA_01 = $$points1_v[0]$$;
$ point_max_vA_01.assign(points1[0])
if ($$points1_v[1]$$ > $$points1_v[0]$$) begin
    max_vA_01 = $$points1_v[1]$$;
    $ point_max_vA_01.assign(points1[1])
end

max_vA_23 = $$points1_v[2]$$;
$ point_max_vA_23.assign(points1[2])
if ($$points1_v[3]$$ > $$points1_v[2]$$) begin
    max_vA_23 = $$points1_v[3]$$;
    $ point_max_vA_23.assign(points1[3])
end

max_vA = max_vA_01;
$ point_max_vA.assign(point_max_vA_01)
if (max_vA_23 > max_vA_01) begin
    max_vA = max_vA_23;
    $ point_max_vA.assign(point_max_vA_23)
end

$ end_comb()

// Find min u and v values for rect A
logic signed [23:0] min_uA;
logic signed [23:0] min_uA_01;    // Min of points 0 and 1
logic signed [23:0] min_uA_23;    // Min of points 2 and 3

logic signed [23:0] min_vA;
logic signed [23:0] min_vA_01;    // Min of points 0 and 1
logic signed [23:0] min_vA_23;    // Min of points 2 and 3

// Also record xy coordinate point corresponding to min values
$$$
point_min_uA = Vec2(8, 14, "point_min_uA");
point_min_uA_01 = Vec2(8, 14, "point_min_uA_01");
point_min_uA_23 = Vec2(8, 14, "point_min_uA_23");

point_min_vA = Vec2(8, 14, "point_min_vA");
point_min_vA_01 = Vec2(8, 14, "point_min_vA_01");
point_min_vA_23 = Vec2(8, 14, "point_min_vA_23");

point_min_uA.declare()
point_min_uA_01.declare()
point_min_uA_23.declare()

point_min_vA.declare()
point_min_vA_01.declare()
point_min_vA_23.declare()
$$$

$ begin_comb()

// Min u
min_uA_01 = $$points1_u[0]$$;
$ point_min_uA_01.assign(points1[0])
if ($$points1_u[1]$$ < $$points1_u[0]$$) begin
    min_uA_01 = $$points1_u[1]$$;
    $ point_min_uA_01.assign(points1[1])
end

min_uA_23 = $$points1_u[2]$$;
$ point_min_uA_23.assign(points1[2])
if ($$points1_u[3]$$ < $$points1_u[2]$$) begin
    min_uA_23 = $$points1_u[3]$$;
    $ point_min_uA_23.assign(points1[3])
end

min_uA = min_uA_01;
$ point_min_uA.assign(point_min_uA_01)
if (min_uA_23 < min_uA_01) begin
    min_uA = min_uA_23;
    $ point_min_uA.assign(point_min_uA_23)
end

// Min v
min_vA_01 = $$points1_v[0]$$;
$ point_min_vA_01.assign(points1[0])
if ($$points1_v[1]$$ < $$points1_v[0]$$) begin
    min_vA_01 = $$points1_v[1]$$;
    $ point_min_vA_01.assign(points1[1])
end

min_vA_23 = $$points1_v[2]$$;
$ point_min_vA_23.assign(points1[2])
if ($$points1_v[3]$$ < $$points1_v[2]$$) begin
    min_vA_23 = $$points1_v[3]$$;
    $ point_min_vA_23.assign(points1[3])
end

min_vA = min_vA_01;
$ point_min_vA.assign(point_min_vA_01)
if (min_vA_23 < min_vA_01) begin
    min_vA = min_vA_23;
    $ point_min_vA.assign(point_min_vA_23)
end

$ end_comb()

// Need to cast width and height of B into same Fixed structure as u and v
$$$
widthB_fixed = Fixed(points1_u[0].integer_bits, points1_u[0].precision, "widthB_fixed")
heightB_fixed = Fixed(points1_u[0].integer_bits, points1_u[0].precision, "heightB_fixed")

widthB_fixed.declare()
widthB_fixed.assign(obb2.halfWidth)
heightB_fixed.declare()
heightB_fixed.assign(obb2.halfHeight)
$$$

// Find penetration values for each axis
$$$
min_uA = Fixed(8, 16, "min_uA")
max_uA = Fixed(8, 16, "max_uA")
min_vA = Fixed(8, 16, "min_vA")
max_vA = Fixed(8, 16, "max_vA")
pen_min_uA = Fixed(points1_u[0].integer_bits, points1_u[0].precision, "pen_min_uA")
pen_max_uA = Fixed(points1_u[0].integer_bits, points1_u[0].precision, "pen_max_uA")
pen_min_vA = Fixed(points1_u[0].integer_bits, points1_u[0].precision, "pen_min_vA")
pen_max_vA = Fixed(points1_u[0].integer_bits, points1_u[0].precision, "pen_max_vA")
$$$

logic signed [23:0] pen_min_uA;
logic signed [23:0] pen_max_uA;
logic signed [23:0] pen_min_vA;
logic signed [23:0] pen_max_vA;

always_comb begin
    pen_min_uA = widthB_fixed - min_uA;
    pen_max_uA = max_uA + widthB_fixed;
    pen_min_vA = heightB_fixed - min_vA;
    pen_max_vA = max_vA + heightB_fixed;
end

//// TEST 2: B onto A

// Project points of B onto axes of A
$$$
points2_u = []
points2_v = []
i = 0
for point in points2:
    relative = point - obb1.pos    
    point_u = Fixed(8, 16, f"Point2_{i}_u")
    point_v = Fixed(8, 16, f"Point2_{i}_v")

    point_u.declare()
    point_v.declare()

    point_u.assign(relative.Dot(obb1.u))
    point_v.assign(relative.Dot(obb1.v))

    points2_u.append(point_u)
    points2_v.append(point_v)

    i += 1
$$$


// Find max u and v values for rect B
logic signed [23:0] max_uB;
logic signed [23:0] max_uB_01;    // Max of points 0 and 1
logic signed [23:0] max_uB_23;    // Max of points 2 and 3

logic signed [23:0] max_vB;
logic signed [23:0] max_vB_01;    // Max of points 0 and 1
logic signed [23:0] max_vB_23;    // Max of points 2 and 3

// Also record xy coordinate point corresponding to min values
$$$
point_max_uB = Vec2(8, 14, "point_max_uB");
point_max_uB_01 = Vec2(8, 14, "point_max_uB_01");
point_max_uB_23 = Vec2(8, 14, "point_max_uB_23");

point_max_vB = Vec2(8, 14, "point_max_vB");
point_max_vB_01 = Vec2(8, 14, "point_max_vB_01");
point_max_vB_23 = Vec2(8, 14, "point_max_vB_23");

point_max_uB.declare()
point_max_uB_01.declare()
point_max_uB_23.declare()

point_max_vB.declare()
point_max_vB_01.declare()
point_max_vB_23.declare()
$$$

$ begin_comb()

// max u
max_uB_01 = $$points2_u[0]$$;
$ point_max_uB_01.assign(points2[0])
if ($$points2_u[1]$$ > $$points2_u[0]$$) begin
    max_uB_01 = $$points2_u[1]$$;
    $ point_max_uB_01.assign(points2[1])
end

max_uB_23 = $$points2_u[2]$$;
$ point_max_uB_23.assign(points2[2])
if ($$points2_u[3]$$ > $$points2_u[2]$$) begin
    max_uB_23 = $$points2_u[3]$$;
    $ point_max_uB_23.assign(points2[3])
end

max_uB = max_uB_01;
$ point_max_uB.assign(point_max_uB_01)
if (max_uB_23 > max_uB_01) begin
    max_uB = max_uB_23;
    $ point_max_uB.assign(point_max_uB_23)
end

// max v
max_vB_01 = $$points2_v[0]$$;
$ point_max_vB_01.assign(points2[0])
if ($$points2_v[1]$$ > $$points2_v[0]$$) begin
    max_vB_01 = $$points2_v[1]$$;
    $ point_max_vB_01.assign(points2[1])
end

max_vB_23 = $$points2_v[2]$$;
$ point_max_vB_23.assign(points2[2])
if ($$points2_v[3]$$ > $$points2_v[2]$$) begin
    max_vB_23 = $$points2_v[3]$$;
    $ point_max_vB_23.assign(points2[3])
end

max_vB = max_vB_01;
$ point_max_vB.assign(point_max_vB_01)
if (max_vB_23 > max_vB_01) begin
    max_vB = max_vB_23;
    $ point_max_vB.assign(point_max_vB_23)
end

$ end_comb()

// Find min u and v values for rect B
logic signed [23:0] min_uB;
logic signed [23:0] min_uB_01;    // Min of points 0 and 1
logic signed [23:0] min_uB_23;    // Min of points 2 and 3

logic signed [23:0] min_vB;
logic signed [23:0] min_vB_01;    // Min of points 0 and 1
logic signed [23:0] min_vB_23;    // Min of points 2 and 3

// Also record xy coordinate point corresponding to min values
$$$
point_min_uB = Vec2(8, 14, "point_min_uB");
point_min_uB_01 = Vec2(8, 14, "point_min_uB_01");
point_min_uB_23 = Vec2(8, 14, "point_min_uB_23");

point_min_vB = Vec2(8, 14, "point_min_vB");
point_min_vB_01 = Vec2(8, 14, "point_min_vB_01");
point_min_vB_23 = Vec2(8, 14, "point_min_vB_23");

point_min_uB.declare()
point_min_uB_01.declare()
point_min_uB_23.declare()

point_min_vB.declare()
point_min_vB_01.declare()
point_min_vB_23.declare()
$$$

$ begin_comb()

// Min u
min_uB_01 = $$points2_u[0]$$;
$ point_min_uB_01.assign(points2[0])
if ($$points2_u[1]$$ < $$points2_u[0]$$) begin
    min_uB_01 = $$points2_u[1]$$;
    $ point_min_uB_01.assign(points2[1])
end

min_uB_23 = $$points2_u[2]$$;
$ point_min_uB_23.assign(points2[2])
if ($$points2_u[3]$$ < $$points2_u[2]$$) begin
    min_uB_23 = $$points2_u[3]$$;
    $ point_min_uB_23.assign(points2[3])
end

min_uB = min_uB_01;
$ point_min_uB.assign(point_min_uB_01)
if (min_uB_23 < min_uB_01) begin
    min_uB = min_uB_23;
    $ point_min_uB.assign(point_min_uB_23)
end

// Min v
min_vB_01 = $$points2_v[0]$$;
$ point_min_vB_01.assign(points2[0])
if ($$points2_v[1]$$ < $$points2_v[0]$$) begin
    min_vB_01 = $$points2_v[1]$$;
    $ point_min_vB_01.assign(points2[1])
end

min_vB_23 = $$points2_v[2]$$;
$ point_min_vB_23.assign(points2[2])
if ($$points2_v[3]$$ < $$points2_v[2]$$) begin
    min_vB_23 = $$points2_v[3]$$;
    $ point_min_vB_23.assign(points2[3])
end

min_vB = min_vB_01;
$ point_min_vB.assign(point_min_vB_01)
if (min_vB_23 < min_vB_01) begin
    min_vB = min_vB_23;
    $ point_min_vB.assign(point_min_vB_23)
end

$ end_comb()

// Need to cast width and height of A into same Fixed structure as u and v
$$$
widthA_fixed = Fixed(points2_u[0].integer_bits, points2_u[0].precision, "widthA_fixed")
heightA_fixed = Fixed(points2_u[0].integer_bits, points2_u[0].precision, "heightA_fixed")

widthA_fixed.declare()
widthA_fixed.assign(obb1.halfWidth)
heightA_fixed.declare()
heightA_fixed.assign(obb1.halfHeight)
$$$

// Find penetration values for each axis
$$$
min_uB = Fixed(8, 16, "min_uB")
max_uB = Fixed(8, 16, "max_uB")
min_vB = Fixed(8, 16, "min_vB")
max_vB = Fixed(8, 16, "max_vB")
pen_min_uB = Fixed(points1_u[0].integer_bits, points1_u[0].precision, "pen_min_uB")
pen_max_uB = Fixed(points1_u[0].integer_bits, points1_u[0].precision, "pen_max_uB")
pen_min_vB = Fixed(points1_u[0].integer_bits, points1_u[0].precision, "pen_min_vB")
pen_max_vB = Fixed(points1_u[0].integer_bits, points1_u[0].precision, "pen_max_vB")
$$$

logic signed [23:0] pen_min_uB;
logic signed [23:0] pen_max_uB;
logic signed [23:0] pen_min_vB;
logic signed [23:0] pen_max_vB;

always_comb begin
    pen_min_uB = widthA_fixed - min_uB;
    pen_max_uB = max_uB + widthA_fixed;
    pen_min_vB = heightA_fixed - min_vB;
    pen_max_vB = max_vB + heightA_fixed;
end

////// TYING IT ALL TOGETHER

// Find minimum penetration

// Penetration value intermediaries
logic signed [23:0] min_pen_uA;
logic signed [23:0] min_pen_vA;
logic signed [23:0] min_pen_uB;
logic signed [23:0] min_pen_vB;

logic signed [23:0] min_pen_u;
logic signed [23:0] min_pen_v;

logic signed [23:0] min_pen;

// Normal value intermediaries and contact point intermediaries
$$$
normal_uA = Vec2(2, 14, "normal_uA")
normal_vA = Vec2(2, 14, "normal_vA")
normal_uB = Vec2(2, 14, "normal_uB")
normal_vB = Vec2(2, 14, "normal_vB")

normal_u = Vec2(2, 14, "normal_u")
normal_v = Vec2(2, 14, "normal_v")

normal_uA.declare()
normal_vA.declare()
normal_uB.declare()
normal_vB.declare()

normal_u.declare()
normal_v.declare()

location_uA = Vec2(8, 14, "location_uA")
location_vA = Vec2(8, 14, "location_vA")
location_uB = Vec2(8, 14, "location_uB")
location_vB = Vec2(8, 14, "location_vB")

location_u = Vec2(8, 14, "location_u")
location_v = Vec2(8, 14, "location_v")

location_uA.declare()
location_vA.declare()
location_uB.declare()
location_vB.declare()

location_u.declare()
location_v.declare()
$$$

// Notes on confusing naming here:
//  - min_pen_<> is the minimum penetration value found
//  - pen_min or pen_max corresponds to the penetration value from the min or max u/v values
$ begin_comb()

// First pass
min_pen_uA = pen_min_uA;
$ normal_uA.assign(-obb2.u)
$ location_uA.assign(point_min_uA)
if (pen_max_uA < pen_min_uA) begin
    min_pen_uA = pen_max_uA;
    $ normal_uA.assign(obb2.u)
    $ location_uA.assign(point_max_uA)
end

min_pen_vA = pen_min_vA;
$ normal_vA.assign(-obb2.v)
$ location_vA.assign(point_min_vA)
if (pen_max_vA < pen_min_vA) begin
    min_pen_vA = pen_max_vA;
    $ normal_vA.assign(obb2.v)
    $ location_vA.assign(point_max_vA)
end

min_pen_uB = pen_min_uB;
$ normal_uB.assign(-obb1.u)
$ location_uB.assign(point_min_uB)
if (pen_max_uB < pen_min_uB) begin
    min_pen_uB = pen_max_uB;
    $ normal_uB.assign(obb1.u)
    $ location_uB.assign(point_max_uB)
end

min_pen_vB = pen_min_vB;
$ normal_vB.assign(-obb1.v)
$ location_vB.assign(point_min_vB)
if (pen_max_vB < pen_min_vB) begin
    min_pen_vB = pen_max_vB;
    $ normal_v.assign(obb1.v)
    $ location_vB.assign(point_max_vB)
end

// Second pass
min_pen_u = min_pen_uA;
$ normal_u.assign(normal_uA)
$ location_u.assign(location_uA)
if (min_pen_uB < min_pen_uA) begin
    min_pen_u = min_pen_uB;
    $ normal_u.assign(normal_uB)
    $ location_u.assign(location_uB)
end

min_pen_v = min_pen_vA;
$ normal_v.assign(normal_vA)
$ location_v.assign(location_vA)
if (min_pen_vB < min_pen_vA) begin
    min_pen_v = min_pen_vB;
    $ normal_v.assign(normal_vB)
    $ location_v.assign(location_vB)
end

// Final pass
min_pen = min_pen_u;
$ Contact.normal.assign(normal_u)
$ Contact.location.assign(location_u)
if (min_pen_v < min_pen_u) begin
    min_pen = min_pen_v;
    $ Contact.normal.assign(normal_v)
    $ Contact.location.assign(location_v)
end

penetration = min_pen;

$ end_comb()

// If any penetration is negative, there is no collision
assign is_collision = ~min_pen[23];
endmodule