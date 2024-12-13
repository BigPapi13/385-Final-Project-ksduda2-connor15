$ from svmath import *

$$$
widthA = Fixed(8, 0, "widthA")
heightA = Fixed(8, 0, "heightA")
posA = Vec2(7, 25, "posA")
velA = Vec2(5, 19, "velA")
uA = Vec2(2, 14, "uA")
vA = Vec2(2, 14, "vA")

widthB = Fixed(8, 0, "widthB")
heightB = Fixed(8, 0, "heightB")
posB = Vec2(7, 25, "posB")
velB = Vec2(5, 19, "velB")
uB = Vec2(2, 14, "uB")
vB = Vec2(2, 14, "vB")
$$$

module collision_detector(
    $$widthA.declare("input")$$,
    $$heightA.declare("input")$$,
    $$posA.declare("input")$$,
    $$velA.declare("input")$$,
    $$uA.declare("input")$$,
    $$vA.declare("input")$$,
    
    $$widthB.declare("input")$$,
    $$heightB.declare("input")$$,
    $$posB.declare("input")$$,
    $$velB.declare("input")$$,
    $$uB.declare("input")$$,
    $$vB.declare("input")$$,
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

// Get half width and height (this is just useful to have)
$$$
halfWidthA = Fixed(7, 0, "halfWidthA")
halfWidthB = Fixed(7, 0, "halfWidthB")
halfHeightA = Fixed(7, 0, "halfHeightA")
halfHeightB = Fixed(7, 0, "halfHeightB")
halfWidthA.declare()
halfWidthB.declare()
halfHeightA.declare()
halfHeightB.declare()
$$$

assign halfWidthA = widthA >> 1;
assign halfWidthB = widthB >> 1;
assign halfHeightA = heightA >> 1;
assign halfHeightB = heightB >> 1;


// Get points of A and B
//  - Need to rotate first, then subtract

$$$
pointsA = []
for w in (-halfWidthA, halfWidthA):
    for h in (-halfHeightA, halfHeightA):

        rotated_point = svmath.ExpressionVec2(w * uA.x + h * vA.x, w * uA.y + h * vA.y)

        pointsA.append(rotated_point + posA)

pointsB = []
for w in (-halfWidthB, halfWidthB):
    for h in (-halfHeightB, halfHeightB):
        rotated_point = svmath.ExpressionVec2(w * uB.x + h * vB.x, w * uB.y + h * vB.y)

        pointsB.append(rotated_point + posB)

$$$

//// TEST 1: A onto B

// Project points of A onto axes of B
$$$
pointsA_u = []
pointsA_v = []
for point in pointsA:
    relative = point - posB    
    point_u = Fixed(7, 25)
    point_v = Fixed(7, 25)

    point_u.declare()
    point_v.declare()

    point_u.assign(relative.Dot(uB))
    point_v.assign(relative.Dot(vB))

    pointsA_u.append(point_u)
    pointsA_v.append(point_v)
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
max_uA_01 = $$pointsA_u[0]$$;
if ($$pointsA_u[1]$$ > $$pointsA_u[0]$$) begin
    max_uA_01 = $$pointsA_u[1]$$;
end

max_uA_23 = $$pointsA_u[2]$$;
if ($$pointsA_u[3]$$ > $$pointsA_u[2]$$) begin
    max_uA_01 = $$pointsA_u[3]$$;
end

max_uA = max_uA_01;
if (max_uA_23 > max_uA_01) begin
    max_uA = max_uA_23;
end

// Max v
max_vA_01 = $$pointsA_v[0]$$;
if ($$pointsA_v[1]$$ > $$pointsA_v[0]$$) begin
    max_vA_01 = $$pointsA_v[1]$$;
end

max_vA_23 = $$pointsA_v[2]$$;
if ($$pointsA_v[3]$$ > $$pointsA_v[2]$$) begin
    max_vA_01 = $$pointsA_v[3]$$;
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
min_uA_01 = $$pointsA_u[0]$$;
if ($$pointsA_u[1]$$ < $$pointsA_u[0]$$) begin
    min_uA_01 = $$pointsA_u[1]$$;
end

min_uA_23 = $$pointsA_u[2]$$;
if ($$pointsA_u[3]$$ < $$pointsA_u[2]$$) begin
    min_uA_01 = $$pointsA_u[3]$$;
end

min_uA = min_uA_01;
if (min_uA_23 < min_uA_01) begin
    min_uA = min_uA_23;
end

// Min v
min_vA_01 = $$pointsA_v[0]$$;
if ($$pointsA_v[1]$$ < $$pointsA_v[0]$$) begin
    min_vA_01 = $$pointsA_v[1]$$;
end

min_vA_23 = $$pointsA_v[2]$$;
if ($$pointsA_v[3]$$ < $$pointsA_v[2]$$) begin
    min_vA_01 = $$pointsA_v[3]$$;
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
widthB_fixed = Fixed(pointsA_u[0].integer_bits, pointsA_u[0].precision, "widthB_fixed")
heightB_fixed = Fixed(pointsA_u[0].integer_bits, pointsA_u[0].precision, "heightB_fixed")

widthB_fixed.declare()
widthB_fixed.assign(halfWidthB)
heightB_fixed.declare()
heightB_fixed.assign(halfHeightB)
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
pointsB_u = []
pointsB_v = []
for point in pointsB:
    relative = point - posA    
    point_u = Fixed(7, 25)
    point_v = Fixed(7, 25)

    point_u.declare()
    point_v.declare()

    point_u.assign(relative.Dot(uA))
    point_v.assign(relative.Dot(vA))

    pointsB_u.append(point_u)
    pointsB_v.append(point_v)
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
max_uB_01 = $$pointsB_u[0]$$;
if ($$pointsB_u[1]$$ > $$pointsB_u[0]$$) begin
    max_uB_01 = $$pointsB_u[1]$$;
end

max_uB_23 = $$pointsB_u[2]$$;
if ($$pointsB_u[3]$$ > $$pointsB_u[2]$$) begin
    max_uB_01 = $$pointsB_u[3]$$;
end

max_uB = max_uB_01;
if (max_uB_23 > max_uB_01) begin
    max_uB = max_uB_23;
end

// Max v
max_vB_01 = $$pointsB_v[0]$$;
if ($$pointsB_v[1]$$ > $$pointsB_v[0]$$) begin
    max_vB_01 = $$pointsB_v[1]$$;
end

max_vB_23 = $$pointsB_v[2]$$;
if ($$pointsB_v[3]$$ > $$pointsB_v[2]$$) begin
    max_vB_01 = $$pointsB_v[3]$$;
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
min_uB_01 = $$pointsB_u[0]$$;
if ($$pointsB_u[1]$$ < $$pointsB_u[0]$$) begin
    min_uB_01 = $$pointsB_u[1]$$;
end

min_uB_23 = $$pointsB_u[2]$$;
if ($$pointsB_u[3]$$ < $$pointsB_u[2]$$) begin
    min_uB_01 = $$pointsB_u[3]$$;
end

min_uB = min_uB_01;
if (min_uB_23 < min_uB_01) begin
    min_uB = min_uB_23;
end

// Min v
min_vB_01 = $$pointsB_v[0]$$;
if ($$pointsB_v[1]$$ < $$pointsB_v[0]$$) begin
    min_vB_01 = $$pointsB_v[1]$$;
end

min_vB_23 = $$pointsB_v[2]$$;
if ($$pointsB_v[3]$$ < $$pointsB_v[2]$$) begin
    min_vB_01 = $$pointsB_v[3]$$;
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
widthA_fixed = Fixed(pointsB_u[0].integer_bits, pointsB_u[0].precision, "widthA_fixed")
heightA_fixed = Fixed(pointsB_u[0].integer_bits, pointsB_u[0].precision, "heightA_fixed")

widthA_fixed.declare()
widthA_fixed.assign(halfWidthA)
heightA_fixed.declare()
heightA_fixed.assign(halfHeightA)
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