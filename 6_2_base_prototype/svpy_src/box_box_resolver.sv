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

$ impulse1 = Impulse("impulse1")
$ impulse2 = Impulse("impulse2")
module box_box_resolver (
    $$Contact.declare("input")$$,

    $$obb1.declare("input")$$,
    $$obb2.declare("input")$$,

    $$impulse1.declare("output")$$,
    $$impulse2.declare("output")$$,
    output logic ignore_impulse
);

// Get vectors from centers of OBBS to contact point
$ r1 = Contact.location - obb1.pos
$ r2 = Contact.location - obb2.pos

/* Steps:
    1. Get relative velocity
    2. Use to calculate separating velocity
*/
$ vs = Fixed(5, 19, "vs")
$ vs.declare()
$ totalIMass = Fixed(2, 8, "totalIMass")
$ totalIMass.declare()

// Invert total inverse mass because we gotta divide by it
$ inv_totalIMass = inverse(totalIMass)

$ double_nudge = Vec2(8, 16, "double_nudge")
$ double_nudge.declare()

$ r1Cross = Fixed(8, 14, "r1Cross")
$ r2Cross = Fixed(8, 14, "r2Cross")
$ r1Cross.declare()
$ r2Cross.declare()

$ v_rel = Vec2(5, 19, "v_rel")
$ v_rel.declare()

$ begin_comb()

// Get vector omega x r1 and omega x r2
$ vw1 = ExpressionVec2(-r1[1], r1[0]) * obb1.omega
$ vw2 = ExpressionVec2(-r2[1], r2[0]) * obb2.omega

// Get relative velocity
$ v_rel.assign((obb1.vel - obb2.vel) + (vw1 - vw2))

// Get separating velocity
$ vs.assign(v_rel.Dot(Contact.normal))

// Get total inverse mass/inertia
$ r1Cross.assign(r1.Cross(Contact.normal))
$ r2Cross.assign(r2.Cross(Contact.normal))
$ r1CrossInertia = r1Cross * obb1.inv_inertia
$ r2CrossInertia = r2Cross * obb2.inv_inertia
$ print(r1CrossInertia.integer_bits, r1CrossInertia.precision)

$ totalIMass.assign((obb1.inv_mass + obb2.inv_mass) + (r1Cross * r1CrossInertia) + (r2Cross * r2CrossInertia))

// Calculate impulse vector
$ impulse_magnitude = (vs * (-(1 + RESTITUTION)) * inv_totalIMass)
$ impulse1.impulse.assign(Contact.normal * impulse_magnitude)
$ impulse2.impulse.assign(-impulse1.impulse)

// Calculate rotational impulse for both boxes
$ impulse1.rotational_impulse.assign(impulse_magnitude * r1CrossInertia)
$ impulse2.rotational_impulse.assign(-(impulse_magnitude * r2CrossInertia))

//// Getting nudge vector
$ double_nudge.assign(Contact.normal * Contact.penetration)
$$impulse1.nudge.x$$ = $$double_nudge.x$$ >>> 1;
$$impulse1.nudge.y$$ = $$double_nudge.y$$ >>> 1;
$ impulse2.nudge.assign(-impulse1.nudge)

$ end_comb()

// If separating velocity is positive, don't apply the impulse
assign ignore_impulse = ~vs[23];

endmodule