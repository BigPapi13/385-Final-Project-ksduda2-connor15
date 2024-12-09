import svpy
from svpy import *
svpy.writefile = open("../lab6_2_provided/design_source/obb_updater.sv", 'w')
import svmath
import utils
from structs import OBB
from svmath import *
import math
svwrite("\n")
dump_queue()
prev = OBB("prev")
next = OBB("next")
svwrite("\n")
dump_queue()
svwrite("// Calculates the next state for a given OBB\n")
dump_queue()
svwrite("module obb_updater(\n")
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
next.pos.assign(prev.pos + next.vel)
next.omega.assign(prev.omega)
next.width.assign(prev.width)
next.height.assign(prev.height)
svwrite("\n")
dump_queue()
begin_comb()
next.vel.x.assign(prev.vel.x)
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
next.vel.x.assign(-prev.vel.x)
svwrite("end\n")
dump_queue()
svwrite("\n")
dump_queue()
next.vel.y.assign(prev.vel.y)
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
next.vel.y.assign(-prev.vel.y)
svwrite("end\n")
dump_queue()
end_comb()
svwrite("\n")
dump_queue()
svwrite("// Ensure next state angle is within bounds of [0, 2pi] \n")
dump_queue()
next_angle_uncorrected = prev.angle + prev.omega
svwrite("\n")
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
svwrite("    end\n")
dump_queue()
svwrite("    if (")
svpy.inline_state = True
svwrite(next_angle_uncorrected)
svpy.inline_state = False
svwrite(" < 11'b0) begin\n")
dump_queue()
next.angle.assign(next_angle_uncorrected + (2*math.pi))
svwrite("    end\n")
dump_queue()
end_comb()
svwrite("\n")
dump_queue()
svwrite("endmodule")
dump_queue()
svpy.writefile.close()