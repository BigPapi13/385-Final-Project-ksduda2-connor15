$ from svmath import *
$ from structs import JOBB

$ obb1 = JOBB("obb1")
$ obb2 = JOBB("obb2")

module collision_detector(
    $$obb1.declare("input")$$,
    $$obb2.declare("input")$$,
    output logic is_collision
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
for point in points1:
    relative = point - obb2.pos
    point_u = Fixed(7, 25)
    point_v = Fixed(7, 25)

    point_u.declare()
    point_v.declare()

    point_u.assign(relative.Dot(obb2.u))
    point_v.assign(relative.Dot(obb2.v))

    points1_u.append(point_u)
    points1_v.append(point_v)
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
    max_uA_01 = $$points1_u[3]$$;
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
    max_vA_01 = $$points1_v[3]$$;
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
    min_uA_01 = $$points1_u[3]$$;
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
    min_vA_01 = $$points1_v[3]$$;
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

$ begin_comb()
separate_min_uA = 1'b0;
if (min_uA >= widthB_fixed) begin
    separate_min_uA = 1'b1;
end

separate_max_uA = 1'b0;
if (max_uA <= -widthB_fixed) begin
    separate_max_uA = 1'b1;
end

separate_min_vA = 1'b0;
if (min_vA >= heightB_fixed) begin
    separate_min_vA = 1'b1;
end

separate_max_vA = 1'b0;
if (max_vA <= -heightB_fixed) begin
    separate_max_vA = 1'b1;
end

$ end_comb()



//// TEST 2: B onto A

// Project points of B onto axes of A
$$$
points2_u = []
points2_v = []
for point in points2:
    relative = point - obb1.pos    
    point_u = Fixed(7, 25)
    point_v = Fixed(7, 25)

    point_u.declare()
    point_v.declare()

    point_u.assign(relative.Dot(obb1.u))
    point_v.assign(relative.Dot(obb1.v))

    points2_u.append(point_u)
    points2_v.append(point_v)
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
    max_uB_01 = $$points2_u[3]$$;
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
    max_vB_01 = $$points2_v[3]$$;
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
    min_uB_01 = $$points2_u[3]$$;
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
    min_vB_01 = $$points2_v[3]$$;
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

$ begin_comb()
separate_min_uB = 1'b0;
if (min_uB >= widthA_fixed) begin
    separate_min_uB = 1'b1;
end

separate_max_uB = 1'b0;
if (max_uB <= -widthA_fixed) begin
    separate_max_uB = 1'b1;
end

separate_min_vB = 1'b0;
if (min_vB >= heightA_fixed) begin
    separate_min_vB = 1'b1;
end

separate_max_vB = 1'b0;
if (max_vB <= -heightA_fixed) begin
    separate_max_vB = 1'b1;
end

$ end_comb()

////// TYING IT ALL TOGETHER

$ begin_comb()
is_collision = ~(separate_min_uA | separate_max_uA | separate_min_vA | separate_max_vA | separate_min_uB | separate_max_uB | separate_min_vB | separate_max_vB);
$ end_comb()

endmodule