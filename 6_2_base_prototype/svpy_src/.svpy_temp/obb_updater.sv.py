import svpy
from svpy import *
svpy.writefile = open("../lab6_2_provided/design_source/obb_updater.sv", 'w')
import svmath
import utils
from structs import OBB, JOBB, Contact, Impulse
from svmath import *
import math
svwrite("\n")
dump_queue()
prev = OBB("prev")
next = OBB("next")
impulse = Vec2(5, 19)
nudge = Vec2(8, 16)
svwrite("\n")
dump_queue()
svwrite("// Calculates the next state for a given OBB\n")
dump_queue()
svwrite("module obb_updater(\n")
dump_queue()
svwrite("    input logic impulse_en,     // Whether impulses should be applied\n")
dump_queue()
svwrite("    input logic update_en,      // Whether position/rotation should be updated\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(Impulse.declare("input"))
svpy.inline_state = False
svwrite(",\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(prev.declare("input"))
svpy.inline_state = False
svwrite(",\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(next.declare("output"))
svpy.inline_state = False
svwrite("\n")
dump_queue()
svwrite(");\n")
dump_queue()
svwrite("\n")
dump_queue()
next_vel = Vec2(5, 19, "n_vel")
next_vel.declare()
next_pos = Vec2(8, 16, "n_pos")
next_pos.declare()
svwrite("\n")
dump_queue()
svwrite("// Apply impulse if enabled\n")
dump_queue()
begin_comb()
next_vel.assign(prev.vel)
next_pos.assign(prev.pos)
next.omega.assign(prev.omega)
svwrite("if (impulse_en) begin\n")
dump_queue()
next_vel.assign(prev.vel + (Impulse.impulse * prev.inv_mass))
next.omega.assign(prev.omega + Impulse.rotational_impulse)
next_pos.assign(prev.pos + Impulse.nudge)
svwrite("\n")
dump_queue()
svwrite("end\n")
dump_queue()
end_comb()
svwrite("\n")
dump_queue()
svwrite("// DELETE THIS LATER\n")
dump_queue()
svwrite("//   - Over simplified wall bouncing\n")
dump_queue()
begin_comb()
next.vel.x.assign(next_vel.x)
svwrite("if(")
svpy.inline_state = True
svwrite(prev.pos.x)
svpy.inline_state = False
svwrite(" < 0 || ")
svpy.inline_state = True
svwrite(prev.pos.x)
svpy.inline_state = False
svwrite(" > ")
svpy.inline_state = True
svwrite(resize(64, prev.pos.x))
svpy.inline_state = False
svwrite(") begin\n")
dump_queue()
next.vel.x.assign(-next_vel.x)
svwrite("end\n")
dump_queue()
svwrite("\n")
dump_queue()
next.vel.y.assign(next_vel.y)
svwrite("if(")
svpy.inline_state = True
svwrite(prev.pos.y)
svpy.inline_state = False
svwrite(" < 0 || ")
svpy.inline_state = True
svwrite(prev.pos.y)
svpy.inline_state = False
svwrite(" > ")
svpy.inline_state = True
svwrite(resize(64, prev.pos.x))
svpy.inline_state = False
svwrite(") begin\n")
dump_queue()
next.vel.y.assign(-next_vel.y)
svwrite("end\n")
dump_queue()
end_comb()
svwrite("\n")
dump_queue()
svwrite("// Update pos/rotation if enabled\n")
dump_queue()
svwrite("\n")
dump_queue()
next_angle_uncorrected = Fixed(OBB.angle.integer_bits, OBB.angle.precision, "next_angle_uncorrected")
next_angle_uncorrected.declare()
svwrite("\n")
dump_queue()
begin_comb()
next.pos.assign(next_pos)
next_angle_uncorrected.assign(prev.angle)
svwrite("if (update_en) begin\n")
dump_queue()
next.pos.assign(next_pos + next.vel)
next_angle_uncorrected.assign(prev.angle + next.omega)
svwrite("end\n")
dump_queue()
end_comb()
svwrite("\n")
dump_queue()
svwrite("// Ensure next state angle is within bounds of [0, 2pi] \n")
dump_queue()
begin_comb()
next.angle.assign(next_angle_uncorrected)
svwrite("    if (")
svpy.inline_state = True
svwrite(next_angle_uncorrected)
svpy.inline_state = False
svwrite(" > ")
svpy.inline_state = True
svwrite(to_bits(2*math.pi, next_angle_uncorrected.integer_bits, next_angle_uncorrected.precision))
svpy.inline_state = False
svwrite(") begin\n")
dump_queue()
next.angle.assign(next_angle_uncorrected - (2*math.pi))        
svwrite("    end else if (")
svpy.inline_state = True
svwrite(next_angle_uncorrected)
svpy.inline_state = False
svwrite(" < 11'sb0) begin\n")
dump_queue()
next.angle.assign(next_angle_uncorrected + (2*math.pi))
svwrite("    end\n")
dump_queue()
end_comb()
svwrite("\n")
dump_queue()
svwrite("// Keep other things the same\n")
dump_queue()
next.width.assign(prev.width)
next.height.assign(prev.height)
next.inv_mass.assign(prev.inv_mass)
next.inertia.assign(prev.inertia)
next.inv_inertia.assign(prev.inv_inertia)
svwrite("\n")
dump_queue()
svwrite("endmodule")
dump_queue()
svpy.writefile.close()