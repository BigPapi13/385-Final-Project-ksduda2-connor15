// box_box_resolver.sv
//  - Resolves contacts between two OBBs
//  - Takes in the data of the OBBs and the contact data
//  - Outputs the new state of the OBBs

$ RESTITUTION = 0.5

$ from svmath import *
$ from structs import OBB, JOBB, Contact, Impulse

$ obb1 = OBB("obb1")
$ obb2 = OBB("obb2")

module box_box_resolver (
    $$Contact.declare("input")$$,

    $$obb1.pos.declare("input")$$,
    $$obb1.vel.declare("input")$$,
    $$obb1.omega.declare("input")$$,
    $$obb2.pos.declare("input")$$,
    $$obb2.vel.declare("input")$$,
    $$obb2.omega.declare("input")$$,

    $$Impulse.declare("output")$$
);

/* Steps:
    1. Get relative velocity
    2. Use to calculate separating velocity
*/
$ vs = Fixed(6, 26, "vs")
$ vs.declare()

$ begin_comb()

// Get relative velocity
$ v_rel = obb1.vel - obb2.vel

// Get separating velocity
$ vs.assign(v_rel.Dot(Contact.normal))

// Calculate impulse magnitude
$ Impulse.impulse.assign(Contact.normal * (vs * (-(1 + RESTITUTION) / 2)))       # /2 is to divide by the inverse masses, which are assumed to be 1


//// Getting nudge vector
$ double_nudge = Contact.normal * Contact.penetration
$$Impulse.nudge.x$$ = $$double_nudge.x$$ >>> 1;
$$Impulse.nudge.y$$ = $$double_nudge.y$$ >>> 1;

$ end_comb()

endmodule