$ from structs import OBB
$ from svmath import *
$ import math

$ prev = OBB("prev")
$ next = OBB("next")

// Calculates the next state for a given OBB
module obb_updater(
    $$prev.declare("input")$$,
    $$next.declare("output")$$
);

$$$
next.pos.assign(prev.pos + next.vel)
next.omega.assign(prev.omega)
next.width.assign(prev.width)
next.height.assign(prev.height)
$$$

$ begin_comb()
$ next.vel.x.assign(prev.vel.x)
if($$prev.pos.x$$ < 0 || $$prev.pos.x$$ > $$resize(64, prev.pos.x)$$) begin
    $ next.vel.x.assign(-prev.vel.x)
end

$ next.vel.y.assign(prev.vel.y)
if($$prev.pos.y$$ < 0 || $$prev.pos.y$$ > $$resize(64, prev.pos.x)$$) begin
    $ next.vel.y.assign(-prev.vel.y)
end
$ end_comb()

// Ensure next state angle is within bounds of [0, 2pi] 
$ next_angle_uncorrected = prev.angle + prev.omega

$ begin_comb()
    $ next.angle.assign(next_angle_uncorrected)
    if ($$next_angle_uncorrected$$ > $$to_bits(2*math.pi, next_angle_uncorrected.integer_bits, next_angle_uncorrected.precision)$$) begin
        $ next.angle.assign(next_angle_uncorrected - (2*math.pi))        
    end
    if ($$next_angle_uncorrected$$ < 11'b0) begin
        $ next.angle.assign(next_angle_uncorrected + (2*math.pi))
    end
$ end_comb()

endmodule