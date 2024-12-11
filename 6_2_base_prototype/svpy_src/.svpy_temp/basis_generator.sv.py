import svpy
from svpy import *
svpy.writefile = open("../lab6_2_provided/design_source/basis_generator.sv", 'w')
import svmath
import utils
from svmath import *
svwrite("\n")
dump_queue()
angle = Fixed(3, 7, "angle")
u = Vec2(2, 14, "u")
v = Vec2(2, 14, "v")
svwrite("\n")
dump_queue()
svwrite("module basis_generator\n")
dump_queue()
svwrite("(\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(angle.declare("input"))
svpy.inline_state = False
svwrite(",\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(u.declare("output"))
svpy.inline_state = False
svwrite(",\n")
dump_queue()
svwrite("    ")
svpy.inline_state = True
svwrite(v.declare("output"))
svpy.inline_state = False
svwrite("\n")
dump_queue()
svwrite(");\n")
dump_queue()
svwrite("\n")
dump_queue()
begin_comb()
u.x.assign(cos(angle))
u.y.assign(sin(angle))

v.x.assign(-u.y)
v.y.assign(u.x)
svwrite("\n")
dump_queue()
end_comb()
svwrite("\n")
dump_queue()
svwrite("endmodule")
dump_queue()
svpy.writefile.close()