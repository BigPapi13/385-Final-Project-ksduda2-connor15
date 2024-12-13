import svpy
from svpy import *
svpy.writefile = open("../lab6_2_provided/design_source/box_box_resolver.sv", 'w')
import svmath
import utils
svwrite("// box_box_resolver.sv\n")
dump_queue()
svwrite("//  - Resolves contacts between two OBBs\n")
dump_queue()
svwrite("//  - Takes in the data of the OBBs and the contact data\n")
dump_queue()
svwrite("//  - Outputs the new state of the OBBs\n")
dump_queue()
svwrite("\n")
dump_queue()
RESTITUTION = 0.5
svwrite("\n")
dump_queue()
from svmath import *
from structs import OBB, JOBB, Contact, Impulse
svwrite("\n")
dump_queue()
obb1 = OBB("obb1")
obb2 = OBB("obb2")
svwrite("\n")
dump_queue()
svwrite("module box_box_resolver (\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(Contact.declare("input"))
svpy.inline_state = False
svwrite(",\n")
dump_queue()
svwrite("\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(obb1.pos.declare("input"))
svpy.inline_state = False
svwrite(",\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(obb1.vel.declare("input"))
svpy.inline_state = False
svwrite(",\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(obb1.omega.declare("input"))
svpy.inline_state = False
svwrite(",\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(obb2.pos.declare("input"))
svpy.inline_state = False
svwrite(",\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(obb2.vel.declare("input"))
svpy.inline_state = False
svwrite(",\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(obb2.omega.declare("input"))
svpy.inline_state = False
svwrite(",\n")
dump_queue()
svwrite("\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(Impulse.declare("output"))
svpy.inline_state = False
svwrite("\n")
dump_queue()
svwrite(");\n")
dump_queue()
svwrite("\n")
dump_queue()
svwrite("/* Steps:\n")
dump_queue()
svwrite("    1. Get relative velocity\n")
dump_queue()
svwrite("    2. Use to calculate separating velocity\n")
dump_queue()
svwrite("*/\n")
dump_queue()
vs = Fixed(6, 26, "vs")
vs.declare()
svwrite("\n")
dump_queue()
begin_comb()
svwrite("\n")
dump_queue()
svwrite("// Get relative velocity\n")
dump_queue()
v_rel = obb1.vel - obb2.vel
svwrite("\n")
dump_queue()
svwrite("// Get separating velocity\n")
dump_queue()
vs.assign(v_rel.Dot(Contact.normal))
svwrite("\n")
dump_queue()
svwrite("// Calculate impulse magnitude\n")
dump_queue()
Impulse.impulse.assign(Contact.normal * (vs * (-(1 + RESTITUTION) / 2)))       # /2 is to divide by the inverse masses, which are assumed to be 1
svwrite("\n")
dump_queue()
svwrite("\n")
dump_queue()
svwrite("//// Getting nudge vector\n")
dump_queue()
double_nudge = Contact.normal * Contact.penetration
svwrite("")
svpy.inline_state = True
svwrite(Impulse.nudge.x)
svpy.inline_state = False
svwrite(" = ")
svpy.inline_state = True
svwrite(double_nudge.x)
svpy.inline_state = False
svwrite(" >>> 1;\n")
dump_queue()
svwrite("")
svpy.inline_state = True
svwrite(Impulse.nudge.y)
svpy.inline_state = False
svwrite(" = ")
svpy.inline_state = True
svwrite(double_nudge.y)
svpy.inline_state = False
svwrite(" >>> 1;\n")
dump_queue()
svwrite("\n")
dump_queue()
end_comb()
svwrite("\n")
dump_queue()
svwrite("endmodule")
dump_queue()
svpy.writefile.close()