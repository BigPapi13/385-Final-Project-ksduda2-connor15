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

$ signed_obb1_inv_I = Fixed(2, 23, "signed_obb1_inv_I");
$ signed_obb2_inv_I = Fixed(2, 23, "signed_obb2_inv_I");
$ signed_obb1_inv_I.declare()
$ signed_obb2_inv_I.declare()
assign signed_obb1_inv_I = {1'b0, $$obb1.inv_inertia$$};
assign signed_obb2_inv_I = {1'b0, $$obb2.inv_inertia$$};

$ npos = Vec2(8, 14, "npos")
$ npos.assign(Contact.location + impulse1.nudge)
$ npos.declare()

// Get vectors from centers of OBBS to contact point
$ r1 = Vec2(8, 14, "r1")
$ r2 = Vec2(8, 14, "r2")
$ r1.declare()
$ r2.declare()
$ r1.assign(npos - obb1.pos)
$ r2.assign(npos - obb2.pos)
$ print(r1.x.integer_bits, r1.x.precision)

/* Steps:
    1. Get relative velocity
    2. Use to calculate separating velocity
*/
$ vs = Fixed(5, 19, "vs")
$ vs.declare()
$ totalIMass = Fixed(2, 8, "totalIMass")
$ totalIMass.declare()

$ vw1 = Vec2(5, 19, "vw1")
$ vw2 = Vec2(5, 19, "vw2")
$ vw1.declare()
$ vw2.declare()

// Invert total inverse mass because we gotta divide by it
$ inv_totalIMass = inverse(totalIMass)

$ double_nudge = Vec2(8, 16, "double_nudge")
$ double_nudge.declare()

$ r1Cross = Fixed(8, 14, "r1Cross")
$ r2Cross = Fixed(8, 14, "r2Cross")
$ r1Cross.declare()
$ r2Cross.declare()
$ r1CrossInertia = Fixed(8, 24, "r1CrossInertia")
$ r2CrossInertia = Fixed(8, 24, "r2CrossInertia")
$ r1CrossInertia.declare()
$ r2CrossInertia.declare()

$ v_rel = Vec2(5, 19, "v_rel")
$ v_rel.declare()
$ impulse_magnitude = Fixed(5, 19, "impulse_magnitude")
$ impulse_magnitude.declare()

$ begin_comb()

// Get vector omega x r1 and omega x r2
$ vw1.assign(ExpressionVec2(-r1[1].unrestrained_mul(obb1.omega), r1[0].unrestrained_mul(obb1.omega)))
$ vw2.assign(ExpressionVec2(-r2[1].unrestrained_mul(obb2.omega), r2[0].unrestrained_mul(obb2.omega)))

$ print(vw1.x.integer_bits, vw1.x.precision)

// Get relative velocity
$ v_rel.assign((obb1.vel - obb2.vel) + (vw1 - vw2))

// Get separating velocity
$ vs.assign(v_rel.Dot(Contact.normal))

// Get total inverse mass/inertia
$ r1Cross.assign(r1.Cross(Contact.normal))
$ r2Cross.assign(r2.Cross(Contact.normal))
$ r1CrossInertia.assign(r1Cross.unrestrained_mul(signed_obb1_inv_I))
$ r2CrossInertia.assign(r2Cross.unrestrained_mul(signed_obb2_inv_I))
$ print(r1CrossInertia.integer_bits, r1CrossInertia.precision)

$ totalIMass.assign((obb1.inv_mass + obb2.inv_mass) + (r1Cross * r1CrossInertia) + (r2Cross * r2CrossInertia))

// Calculate impulse vector
$ impulse_magnitude.assign(vs * (-(1 + RESTITUTION)) * inv_totalIMass)
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