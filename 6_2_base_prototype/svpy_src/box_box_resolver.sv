// box_box_resolver.sv
//  - Resolves contacts between two OBBs
//  - Takes in the data of the OBBs and the contact data
//  - Outputs the new state of the OBBs

$ RESTITUTION = 0.5

$ from svmath import *
$ from svmath import ExpressionVec2
$ from structs import OBB, JOBB, Contact, Impulse

$ obb1 = OBB("obb1")
$ obb2 = OBB("obb2")

$ rotational_impulse1 = Fixed(4, 7, "rotational_impulse1")
$ rotational_impulse2 = Fixed(4, 7, "rotational_impulse2")
module box_box_resolver (
    $$Contact.declare("input")$$,

    $$obb1.declare("input")$$,
    $$obb2.declare("input")$$,

    $$Impulse.declare("output")$$,
    $$rotational_impulse1.declare("output")$$,
    $$rotational_impulse2.declare("output")$$
);

// Get vectors from centers of OBBS to contact point
$ r1 = Contact.location - obb1.pos
$ r2 = Contact.location - obb2.pos

/* Steps:
    1. Get relative velocity
    2. Use to calculate separating velocity
*/
$ vs = Fixed(6, 26, "vs")
$ vs.declare()
$ totalIMass = Fixed(2, 8, "totalIMass")
$ totalIMass.declare()

// Invert total inverse mass because we gotta divide by it
$ inv_totalIMass = inverse(totalIMass)

$ begin_comb()

// Get vector omega x r1 and omega x r2
$ vw1 = ExpressionVec2(-r1[1], r1[0]) * obb1.omega
$ vw2 = ExpressionVec2(-r2[1], r2[0]) * obb2.omega

$ print("vw:", vw1.x.integer_bits, vw1.y.precision)
$ print("obb velocity:", obb1.vel.x.integer_bits, obb1.vel.x.precision)

// Get relative velocity
$ v_rel = (obb1.vel - obb2.vel) + (vw1 - vw2)
$ print("v_rel:", v_rel.x.integer_bits, v_rel.x.precision)
$ print("Normal:", Contact.normal.integer_bits, Contact.normal.precision)

// Get separating velocity
$ vs.assign(v_rel.Dot(Contact.normal))

// Get total inverse mass/inertia
$ r1Cross = r1.Cross(Contact.normal)
$ r2Cross = r2.Cross(Contact.normal)

$ totalIMass.assign((obb1.inv_mass + obb2.inv_mass) + (r1Cross * r1Cross * obb1.inv_inertia) + (r2Cross * r2Cross * obb2.inv_inertia))


// Calculate impulse vector
$ impulse_magnitude = (vs * (-(1 + RESTITUTION)) * inv_totalIMass)
$ Impulse.impulse.assign(Contact.normal * impulse_magnitude)

//$ Impulse.impulse.assign(Contact.normal * (vs * (-(1 + RESTITUTION) / 2)))       # /2 is to divide by the inverse masses, which are assumed to be 1

// Calculate rotational impulse for both boxes
$ rotational_impulse1.assign(impulse_magnitude * r1Cross * obb1.inv_inertia)
$ rotational_impulse2.assign(-(impulse_magnitude * r2Cross * obb2.inv_inertia))
//$ rotational_impulse1.assign(0)
//$ rotational_impulse2.assign(0)


//// Getting nudge vector
$ double_nudge = Contact.normal * Contact.penetration
$$Impulse.nudge.x$$ = $$double_nudge.x$$ >>> 1;
$$Impulse.nudge.y$$ = $$double_nudge.y$$ >>> 1;

$ end_comb()

endmodule