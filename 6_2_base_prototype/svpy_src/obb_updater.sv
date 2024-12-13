$ from structs import OBB, JOBB, Contact, Impulse
$ from svmath import *
$ import math

$ prev = OBB("prev")
$ next = OBB("next")
$ impulse = Vec2(6, 26)
$ nudge = Vec2(8, 24)
$ rotational_impulse = Fixed(4, 7, "rotational_impulse")

// Calculates the next state for a given OBB
module obb_updater(
    input logic impulse_en,     // Whether impulses should be applied
    input logic update_en,      // Whether position/rotation should be updated
    $$Impulse.declare("input")$$,
    $$rotational_impulse.declare("input")$$,
    $$prev.declare("input")$$,
    $$next.declare("output")$$
);

$ next_vel = Vec2(6, 26, "n_vel")
$ next_vel.declare()

// Apply impulse if enabled
$ begin_comb()
$ next_vel.assign(prev.vel)
$ next.omega.assign(prev.omega)
if (impulse_en) begin
    $ next_vel.assign(prev.vel + (Impulse.impulse * prev.inv_mass))
    $ next.omega.assign(prev.omega + rotational_impulse)
    ///////// TO-DO: MAKE IT SO OMEGA IS UPDATED WITH IMPULSE AS WELL
    ////////  ALSO TO-DO: Apply shift here
end
$ end_comb()

// DELETE THIS LATER
//   - Over simplified wall bouncing
$ begin_comb()
$ next.vel.x.assign(next_vel.x)
if($$prev.pos.x$$ < 0 || $$prev.pos.x$$ > $$resize(64, prev.pos.x)$$) begin
    $ next.vel.x.assign(-next_vel.x)
end

$ next.vel.y.assign(next_vel.y)
if($$prev.pos.y$$ < 0 || $$prev.pos.y$$ > $$resize(64, prev.pos.x)$$) begin
    $ next.vel.y.assign(-next_vel.y)
end
$ end_comb()

// Update pos/rotation if enabled

$ next_angle_uncorrected = Fixed(OBB.angle.integer_bits, OBB.angle.precision, "next_angle_uncorrected")
$ next_angle_uncorrected.declare()

$ begin_comb()
$ next.pos.assign(prev.pos)
$ next_angle_uncorrected.assign(prev.angle)
if (update_en) begin
    $ next.pos.assign(prev.pos + next.vel)
    ////////// TO-DO: UPDATE ROTATION WITH UPDATED VALUE FROM IMPULSE
    $ next_angle_uncorrected.assign(prev.angle + next.omega)
end
$ end_comb()

// Ensure next state angle is within bounds of [0, 2pi] 
$ begin_comb()
    $ next.angle.assign(next_angle_uncorrected)
    if ($$next_angle_uncorrected$$ > $$to_bits(2*math.pi, next_angle_uncorrected.integer_bits, next_angle_uncorrected.precision)$$) begin
        $ next.angle.assign(next_angle_uncorrected - (2*math.pi))        
    end else if ($$next_angle_uncorrected$$ < 11'sb0) begin
        $ next.angle.assign(next_angle_uncorrected + (2*math.pi))
    end
$ end_comb()

// Keep other things the same
$ next.width.assign(prev.width)
$ next.height.assign(prev.height)
$ next.mass.assign(prev.mass)
$ next.inv_mass.assign(prev.inv_mass)
$ next.inertia.assign(prev.inertia)
$ next.inv_inertia.assign(prev.inv_inertia)

endmodule