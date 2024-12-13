import svpy
from svpy import *
svpy.writefile = open("../lab6_2_provided/design_source/the_juicer.sv", 'w')
import svmath
import utils
svwrite("// THE JUICER\n")
dump_queue()
svwrite("//  - Takes an input OBB and spits out all the good yummy processed data\n")
dump_queue()
svwrite("//  - The reason this isn't coupled with the OBB register is that some of\n")
dump_queue()
svwrite("//    the operations are very expensive, and we want to use them sparingly\n")
dump_queue()
svwrite("\n")
dump_queue()
from structs import OBB, Juice
from svmath import *
import math
svwrite("\n")
dump_queue()
svwrite("module juicer(\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(OBB.declare("input"))
svpy.inline_state = False
svwrite(",\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(Juice.declare("output"))
svpy.inline_state = False
svwrite("\n")
dump_queue()
svwrite(");\n")
dump_queue()
svwrite("\n")
dump_queue()
svwrite("////// First thing to process: Getting U and V vectors\n")
dump_queue()
svwrite("\n")
dump_queue()
svwrite("// Grab only necessary bits of angle\n")
dump_queue()
angleP = Fixed(3, 7, "angleP")
angleP.declare()
angleP.assign(OBB.angle)
svwrite("\n")
dump_queue()
svwrite("// Get sine and cos\n")
dump_queue()
cos_theta = cos(angleP)
sin_theta = sin(angleP)
svwrite("\n")
dump_queue()
svwrite("// Assign to vectors\n")
dump_queue()
Juice.u.assign([cos_theta, sin_theta])
Juice.v.assign([-sin_theta, cos_theta])
svwrite("\n")
dump_queue()
svwrite("\n")
dump_queue()
svwrite("///// Second order of biz: Get the vertices of the OBB\n")
dump_queue()
svwrite("assign ")
svpy.inline_state = True
svwrite(Juice.halfWidth)
svpy.inline_state = False
svwrite(" = ")
svpy.inline_state = True
svwrite(OBB.width)
svpy.inline_state = False
svwrite(" >> 1;\n")
dump_queue()
svwrite("assign ")
svpy.inline_state = True
svwrite(Juice.halfHeight)
svpy.inline_state = False
svwrite(" = ")
svpy.inline_state = True
svwrite(OBB.height)
svpy.inline_state = False
svwrite(" >> 1;\n")
dump_queue()
svwrite("\n")
dump_queue()
relPoint0 = svmath.ExpressionVec2(-Juice.halfWidth * Juice.u.x + -Juice.halfHeight * Juice.v.x, -Juice.halfWidth * Juice.u.y + -Juice.halfHeight * Juice.v.y)
relPoint1 = svmath.ExpressionVec2(-Juice.halfWidth * Juice.u.x + Juice.halfHeight * Juice.v.x, -Juice.halfWidth * Juice.u.y + Juice.halfHeight * Juice.v.y)
Juice.Point0.assign(OBB.pos + relPoint0)
Juice.Point1.assign(OBB.pos + relPoint1)
Juice.Point2.assign(OBB.pos - relPoint0)
Juice.Point3.assign(OBB.pos - relPoint1)
svwrite("\n")
dump_queue()
svwrite("endmodule")
dump_queue()
svpy.writefile.close()