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
logic signed [31 : 0] max_uA;
logic signed [31 : 0] max_uA_01;    // Max of points 0 and 1
logic signed [31 : 0] max_uA_23;    // Max of points 2 and 3

logic signed [31 : 0] max_vA;
logic signed [31 : 0] max_vA_01;    // Max of points 0 and 1
logic signed [31 : 0] max_vA_23;    // Max of points 2 and 3

$ begin_comb()

// Max u
max_uA_01 = $$points1_u[0]$$;
if ($$points1_u[1]$$ > $$points1_u[0]$$) begin
    max_uA_01 = $$points1_u[1]$$;
end

max_uA_23 = $$points1_u[2]$$;
if ($$points1_u[3]$$ > $$points1_u[2]$$) begin
    max_uA_23 = $$points1_u[3]$$;
end

max_uA = max_uA_01;
if (max_uA_23 > max_uA_01) begin
    max_uA = max_uA_23;
end

// Max v
max_vA_01 = $$points1_v[0]$$;
if ($$points1_v[1]$$ > $$points1_v[0]$$) begin
    max_vA_01 = $$points1_v[1]$$;
end

max_vA_23 = $$points1_v[2]$$;
if ($$points1_v[3]$$ > $$points1_v[2]$$) begin
    max_vA_23 = $$points1_v[3]$$;
end

max_vA = max_vA_01;
if (max_vA_23 > max_vA_01) begin
    max_vA = max_vA_23;
end

$ end_comb()

// Find min u and v values for rect A
logic signed [31 : 0] min_uA;
logic signed [31 : 0] min_uA_01;    // Min of points 0 and 1
logic signed [31 : 0] min_uA_23;    // Min of points 2 and 3

logic signed [31 : 0] min_vA;
logic signed [31 : 0] min_vA_01;    // Min of points 0 and 1
logic signed [31 : 0] min_vA_23;    // Min of points 2 and 3

$ begin_comb()

// Min u
min_uA_01 = $$points1_u[0]$$;
if ($$points1_u[1]$$ < $$points1_u[0]$$) begin
    min_uA_01 = $$points1_u[1]$$;
end

min_uA_23 = $$points1_u[2]$$;
if ($$points1_u[3]$$ < $$points1_u[2]$$) begin
    min_uA_23 = $$points1_u[3]$$;
end

min_uA = min_uA_01;
if (min_uA_23 < min_uA_01) begin
    min_uA = min_uA_23;
end

// Min v
min_vA_01 = $$points1_v[0]$$;
if ($$points1_v[1]$$ < $$points1_v[0]$$) begin
    min_vA_01 = $$points1_v[1]$$;
end

min_vA_23 = $$points1_v[2]$$;
if ($$points1_v[3]$$ < $$points1_v[2]$$) begin
    min_vA_23 = $$points1_v[3]$$;
end

min_vA = min_vA_01;
if (min_vA_23 < min_vA_01) begin
    min_vA = min_vA_23;
end

$ end_comb()


// Check for separating axis
logic separate_min_uA;
logic separate_max_uA;
logic separate_min_vA;
logic separate_max_vA;

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

logic signed [31:0] pen_min_uA;
logic signed [31:0] pen_max_uA;
logic signed [31:0] pen_min_vA;
logic signed [31:0] pen_max_vA;

always_comb begin
    pen_min_uA = widthB_fixed - min_uA;
    pen_max_uA = max_uA + widthB_fixed;
    pen_min_vA = heightB_fixed - min_vA;
    pen_max_vA = max_vA + heightB_fixed;
end

// If the penetration is negative, then there's separation
assign separate_min_uA = pen_min_uA[31];
assign separate_max_uA = pen_max_uA[31];
assign separate_min_vA = pen_min_vA[31];
assign separate_max_vA = pen_max_vA[31];

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
logic signed [31 : 0] max_uB;
logic signed [31 : 0] max_uB_01;    // Max of points 0 and 1
logic signed [31 : 0] max_uB_23;    // Max of points 2 and 3

logic signed [31 : 0] max_vB;
logic signed [31 : 0] max_vB_01;    // Max of points 0 and 1
logic signed [31 : 0] max_vB_23;    // Max of points 2 and 3

$ begin_comb()

// Max u
max_uB_01 = $$points2_u[0]$$;
if ($$points2_u[1]$$ > $$points2_u[0]$$) begin
    max_uB_01 = $$points2_u[1]$$;
end

max_uB_23 = $$points2_u[2]$$;
if ($$points2_u[3]$$ > $$points2_u[2]$$) begin
    max_uB_23 = $$points2_u[3]$$;
end

max_uB = max_uB_01;
if (max_uB_23 > max_uB_01) begin
    max_uB = max_uB_23;
end

// Max v
max_vB_01 = $$points2_v[0]$$;
if ($$points2_v[1]$$ > $$points2_v[0]$$) begin
    max_vB_01 = $$points2_v[1]$$;
end

max_vB_23 = $$points2_v[2]$$;
if ($$points2_v[3]$$ > $$points2_v[2]$$) begin
    max_vB_23 = $$points2_v[3]$$;
end

max_vB = max_vB_01;
if (max_vB_23 > max_vB_01) begin
    max_vB = max_vB_23;
end

$ end_comb()

// Find min u and v values for rect B
logic signed [31 : 0] min_uB;
logic signed [31 : 0] min_uB_01;    // Min of points 0 and 1
logic signed [31 : 0] min_uB_23;    // Min of points 2 and 3

logic signed [31 : 0] min_vB;
logic signed [31 : 0] min_vB_01;    // Min of points 0 and 1
logic signed [31 : 0] min_vB_23;    // Min of points 2 and 3

$ begin_comb()

// Min u
min_uB_01 = $$points2_u[0]$$;
if ($$points2_u[1]$$ < $$points2_u[0]$$) begin
    min_uB_01 = $$points2_u[1]$$;
end

min_uB_23 = $$points2_u[2]$$;
if ($$points2_u[3]$$ < $$points2_u[2]$$) begin
    min_uB_23 = $$points2_u[3]$$;
end

min_uB = min_uB_01;
if (min_uB_23 < min_uB_01) begin
    min_uB = min_uB_23;
end

// Min v
min_vB_01 = $$points2_v[0]$$;
if ($$points2_v[1]$$ < $$points2_v[0]$$) begin
    min_vB_01 = $$points2_v[1]$$;
end

min_vB_23 = $$points2_v[2]$$;
if ($$points2_v[3]$$ < $$points2_v[2]$$) begin
    min_vB_23 = $$points2_v[3]$$;
end

min_vB = min_vB_01;
if (min_vB_23 < min_vB_01) begin
    min_vB = min_vB_23;
end

$ end_comb()


// Check for separating axis
logic separate_min_uB;
logic separate_max_uB;
logic separate_min_vB;
logic separate_max_vB;

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

logic signed [31:0] pen_min_uB;
logic signed [31:0] pen_max_uB;
logic signed [31:0] pen_min_vB;
logic signed [31:0] pen_max_vB;

always_comb begin
    pen_min_uB = widthA_fixed - min_uB;
    pen_max_uB = max_uB + widthA_fixed;
    pen_min_vB = heightA_fixed - min_vB;
    pen_max_vB = max_vB + heightA_fixed;
end

// If the penetration is negative, then there's separation
assign separate_min_uB = pen_min_uB[31];
assign separate_max_uB = pen_max_uB[31];
assign separate_min_vB = pen_min_vB[31];
assign separate_max_vB = pen_max_vB[31];

////// TYING IT ALL TOGETHER

// Find minimum penetration

// Penetration value intermediaries
logic signed [31:0] min_pen_uA;
logic signed [31:0] min_pen_vA;
logic signed [31:0] min_pen_uB;
logic signed [31:0] min_pen_vB;

logic signed [31:0] min_pen_u;
logic signed [31:0] min_pen_v;

logic signed [31:0] min_pen;

// Normal value intermediaries
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
$$$

// Notes on confusing naming here:
//  - min_pen_<> is the minimum penetration value found
//  - pen_min or pen_max corresponds to the penetration value from the min or max u/v values
$ begin_comb()

// First pass
min_pen_uA = pen_min_uA;
$ normal_uA.assign(-obb2.u)
if (pen_max_uA < pen_min_uA) begin
    min_pen_uA = pen_max_uA;
    $ normal_uA.assign(obb2.u)
end

min_pen_vA = pen_min_vA;
$ normal_vA.assign(-obb2.v)
if (pen_max_vA < pen_min_vA) begin
    min_pen_vA = pen_max_vA;
    $ normal_vA.assign(obb2.v)
end

min_pen_uB = pen_min_uB;
$ normal_uB.assign(-obb1.u)
if (pen_max_uB < pen_min_uB) begin
    min_pen_uB = pen_max_uB;
    $ normal_uB.assign(obb1.u)
end

min_pen_vB = pen_min_vB;
$ normal_vB.assign(-obb1.v)
if (pen_max_vB < pen_min_vB) begin
    min_pen_vB = pen_max_vB;
    $ normal_v.assign(obb1.v)
end

// Second pass
min_pen_u = min_pen_uA;
$ normal_u.assign(normal_uA)
if (min_pen_uB < min_pen_uA) begin
    min_pen_u = min_pen_uB;
    $ normal_u.assign(normal_uB)
end

min_pen_v = min_pen_vA;
$ normal_v.assign(normal_vA)
if (min_pen_vB < min_pen_vA) begin
    min_pen_v = min_pen_vB;
    $ normal_v.assign(normal_vB)
end

// Final pass
min_pen = min_pen_u;
$ Contact.normal.assign(normal_u)
if (min_pen_v < min_pen_u) begin
    min_pen = min_pen_v;
    $ Contact.normal.assign(normal_v)
end

$ end_comb()

/*
$ begin_comb()
is_collision = ~(separate_min_uA | separate_max_uA | separate_min_vA | separate_max_vA | separate_min_uB | separate_max_uB | separate_min_vB | separate_max_vB);
$ end_comb()
*/

// If any penetrations is negative, there is no collision
assign is_collision = ~min_pen[31];
endmodule