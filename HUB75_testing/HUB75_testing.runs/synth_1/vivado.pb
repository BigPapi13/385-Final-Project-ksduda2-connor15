
>
Refreshing IP repositories
234*coregenZ19-234h px� 
�
 Loaded user IP repository '%s'.
1135*coregen2�
rc:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sources_1/ip2default:defaultZ19-1700h px� 
|
"Loaded Vivado IP repository '%s'.
1332*coregen23
C:/Xilinx/Vivado/2022.2/data/ip2default:defaultZ19-2313h px� 
�
�The host OS only allows 260 characters in a normal path. The IP cache path is more than 80 characters. If you experience issues with IP caching, please consider changing the IP cache to a location with a shorter path. Alternately consider using the OS subst command to map part of the path to a drive letter. 
Current IP cache path is %s 2293*coregen2}
ic:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.cache/ip2default:defaultZ19-4995h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/utils_1/imports/synth_1/controller_stillframe_test.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/utils_1/imports/synth_1/controller_stillframe_test.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
}
Command: %s
53*	vivadotcl2L
8synth_design -top frame_manager_tb -part xc7s50csga324-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7s502default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7s502default:defaultZ17-349h px� 
V
Loading part %s157*device2#
xc7s50csga324-12default:defaultZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
_
#Helper process launched with PID %s4824*oasys2
45962default:defaultZ8-7075h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
EC:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
spi_miso2default:default2
wire2default:default2�
}C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sim_1/new/controller.sv2default:default2
1582default:default8@Z8-11241h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1187.746 ; gain = 409.809
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2$
frame_manager_tb2default:default2
 2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sim_1/new/frame_manager_tb.sv2default:default2
232default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2!
frame_manager2default:default2
 2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sources_1/new/frame_manager.sv2default:default2
232default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2!
clock_divider2default:default2
 2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sources_1/new/clock_divider.sv2default:default2
32default:default8@Z8-6157h px� 
Z
%s
*synth2B
.	Parameter DIV_N bound to: 5 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
clock_divider2default:default2
 2default:default2
02default:default2
12default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sources_1/new/clock_divider.sv2default:default2
32default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2"
memory_manager2default:default2
 2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sources_1/new/memory_manager.sv2default:default2
232default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
memory_manager2default:default2
 2default:default2
02default:default2
12default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sources_1/new/memory_manager.sv2default:default2
232default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

controller2default:default2
 2default:default2�
}C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sim_1/new/controller.sv2default:default2
32default:default8@Z8-6157h px� 
d
%s
*synth2L
8	Parameter BITS_PER_PIXEL bound to: 16 - type: integer 
2default:defaulth p
x
� 
�
synthesizing module '%s'%s4497*oasys2 
sync_pdp_ram2default:default2
 2default:default2�
C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sim_1/new/sync_pdp_ram.sv2default:default2
32default:default8@Z8-6157h px� 
d
%s
*synth2L
8	Parameter BITS_PER_PIXEL bound to: 16 - type: integer 
2default:defaulth p
x
� 
�
synthesizing module '%s'%s4497*oasys2'
display_buffer_bram2default:default2
 2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.runs/synth_1/.Xil/Vivado-50924-Connors_laptop/realtime/display_buffer_bram_stub.v2default:default2
52default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2'
display_buffer_bram2default:default2
 2default:default2
02default:default2
12default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.runs/synth_1/.Xil/Vivado-50924-Connors_laptop/realtime/display_buffer_bram_stub.v2default:default2
52default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
sync_pdp_ram2default:default2
 2default:default2
02default:default2
12default:default2�
C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sim_1/new/sync_pdp_ram.sv2default:default2
32default:default8@Z8-6155h px� 
�
-case statement is not full and has no default155*oasys2�
}C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sim_1/new/controller.sv2default:default2
882default:default8@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

controller2default:default2
 2default:default2
02default:default2
12default:default2�
}C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sim_1/new/controller.sv2default:default2
32default:default8@Z8-6155h px� 
�
-case statement is not full and has no default155*oasys2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sources_1/new/frame_manager.sv2default:default2
1332default:default8@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
frame_manager2default:default2
 2default:default2
02default:default2
12default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sources_1/new/frame_manager.sv2default:default2
232default:default8@Z8-6155h px� 
�
-case statement is not full and has no default155*oasys2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sim_1/new/frame_manager_tb.sv2default:default2
782default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sim_1/new/frame_manager_tb.sv2default:default2
942default:default8@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2$
frame_manager_tb2default:default2
 2default:default2
02default:default2
12default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sim_1/new/frame_manager_tb.sv2default:default2
232default:default8@Z8-6155h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2)
startup_state_nxt_reg2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sources_1/new/frame_manager.sv2default:default2
1382default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2"
next_state_reg2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sim_1/new/frame_manager_tb.sv2default:default2
812default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2$
start_signal_reg2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sim_1/new/frame_manager_tb.sv2default:default2
432default:default8@Z8-87h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 1282.539 ; gain = 504.602
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1282.539 ; gain = 504.602
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1282.539 ; gain = 504.602
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0062default:default2
1282.5392default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.gen/sources_1/ip/display_buffer_bram/display_buffer_bram/display_buffer_bram_in_context.xdc2default:default24
fm/dut/sync_pdp_ram/buffer_top	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.gen/sources_1/ip/display_buffer_bram/display_buffer_bram/display_buffer_bram_in_context.xdc2default:default24
fm/dut/sync_pdp_ram/buffer_top	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.gen/sources_1/ip/display_buffer_bram/display_buffer_bram/display_buffer_bram_in_context.xdc2default:default27
!fm/dut/sync_pdp_ram/buffer_bottom	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.gen/sources_1/ip/display_buffer_bram/display_buffer_bram/display_buffer_bram_in_context.xdc2default:default27
!fm/dut/sync_pdp_ram/buffer_bottom	2default:default8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/constrs_1/new/constraints.xdc2default:default8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2 
start_signal2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/constrs_1/new/constraints.xdc2default:default2
312default:default8@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2 
start_signal2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/constrs_1/new/constraints.xdc2default:default2
322default:default8@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
test_led2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/constrs_1/new/constraints.xdc2default:default2
442default:default8@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
test_led2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/constrs_1/new/constraints.xdc2default:default2
452default:default8@Z12-584h px�
�
Finished Parsing XDC File [%s]
178*designutils2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/constrs_1/new/constraints.xdc2default:default8Z20-178h px� 
�
�One or more constraints failed evaluation while reading constraint file [%s] and the design contains unresolved black boxes. These constraints will be read post-synthesis (as long as their source constraint file is marked as used_in_implementation) and should be applied correctly then. You should review the constraints listed in the file [%s] and check the run log file to verify that these constraints were correctly applied.301*project2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/constrs_1/new/constraints.xdc2default:default26
".Xil/frame_manager_tb_propImpl.xdc2default:defaultZ1-498h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/constrs_1/new/constraints.xdc2default:default26
".Xil/frame_manager_tb_propImpl.xdc2default:defaultZ1-236h px� 
�
Parsing XDC File [%s]
179*designutils2�
|C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.runs/synth_1/dont_touch.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2�
|C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.runs/synth_1/dont_touch.xdc2default:default8Z20-178h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1326.2422default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0032default:default2
1326.2422default:default2
0.0002default:defaultZ17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
EC:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Loading part: xc7s50csga324-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2"
read_state_reg2default:default2

controller2default:defaultZ8-802h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_       READ_STATE_PIXELS |                              000 | 00000000000000000000000000000000
2default:defaulth p
x
� 
�
%s
*synth2u
aREAD_STATE_SET_LATCH_DELAY |                              001 | 00000000000000000000000000000001
2default:defaulth p
x
� 
�
%s
*synth2s
_    READ_STATE_SET_LATCH |                              010 | 00000000000000000000000000000010
2default:defaulth p
x
� 
�
%s
*synth2s
_    READ_STATE_OE_STROBE |                              011 | 00000000000000000000000000000011
2default:defaulth p
x
� 
�
%s
*synth2s
_   READ_STATE_END_OF_ROW |                              100 | 00000000000000000000000000000100
2default:defaulth p
x
� 
�
%s
*synth2s
_    READ_STATE_NEXT_LINE |                              101 | 00000000000000000000000000000101
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2"
read_state_reg2default:default2

sequential2default:default2

controller2default:defaultZ8-3354h px� 
�
!inferring latch for variable '%s'327*oasys2)
startup_state_nxt_reg2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sources_1/new/frame_manager.sv2default:default2
1382default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2$
start_signal_reg2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sim_1/new/frame_manager_tb.sv2default:default2
432default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2"
next_state_reg2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.srcs/sim_1/new/frame_manager_tb.sv2default:default2
812default:default8@Z8-327h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:10 ; elapsed = 00:00:12 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   12 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   11 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   10 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    6 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    5 Bit       Adders := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit       Adders := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               32 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               12 Bit    Registers := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               11 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               10 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                6 Bit    Registers := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                5 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                2 Bit    Registers := 4     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 11    
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   16 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   12 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   11 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   10 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   6 Input   10 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    6 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    6 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   6 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 13    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   6 Input    1 Bit        Muxes := 12    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 5     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 120 (col length:60)
BRAMs: 150 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2/
fm/startup_state_nxt_reg[2]2default:default2$
frame_manager_tb2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
start_signal_reg2default:default2$
frame_manager_tb2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2%
next_state_reg[1]2default:default2$
frame_manager_tb2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2%
next_state_reg[0]2default:default2$
frame_manager_tb2default:defaultZ8-3332h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:17 ; elapsed = 00:00:18 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:00:17 ; elapsed = 00:00:18 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:00:17 ; elapsed = 00:00:18 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:00:20 ; elapsed = 00:00:22 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:20 ; elapsed = 00:00:22 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:20 ; elapsed = 00:00:22 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:20 ; elapsed = 00:00:22 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:20 ; elapsed = 00:00:22 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:20 ; elapsed = 00:00:22 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
U
%s
*synth2=
)+------+--------------------+----------+
2default:defaulth p
x
� 
U
%s
*synth2=
)|      |BlackBox name       |Instances |
2default:defaulth p
x
� 
U
%s
*synth2=
)+------+--------------------+----------+
2default:defaulth p
x
� 
U
%s
*synth2=
)|1     |display_buffer_bram |         2|
2default:defaulth p
x
� 
U
%s
*synth2=
)+------+--------------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
Q
%s*synth29
%+------+--------------------+------+
2default:defaulth px� 
Q
%s*synth29
%|      |Cell                |Count |
2default:defaulth px� 
Q
%s*synth29
%+------+--------------------+------+
2default:defaulth px� 
Q
%s*synth29
%|1     |display_buffer_bram |     2|
2default:defaulth px� 
Q
%s*synth29
%|3     |BUFG                |     2|
2default:defaulth px� 
Q
%s*synth29
%|4     |CARRY4              |    15|
2default:defaulth px� 
Q
%s*synth29
%|5     |LUT1                |     7|
2default:defaulth px� 
Q
%s*synth29
%|6     |LUT2                |    29|
2default:defaulth px� 
Q
%s*synth29
%|7     |LUT3                |    28|
2default:defaulth px� 
Q
%s*synth29
%|8     |LUT4                |    32|
2default:defaulth px� 
Q
%s*synth29
%|9     |LUT5                |    57|
2default:defaulth px� 
Q
%s*synth29
%|10    |LUT6                |    32|
2default:defaulth px� 
Q
%s*synth29
%|11    |FDCE                |    81|
2default:defaulth px� 
Q
%s*synth29
%|12    |FDPE                |    14|
2default:defaulth px� 
Q
%s*synth29
%|13    |FDRE                |    45|
2default:defaulth px� 
Q
%s*synth29
%|14    |LD                  |     2|
2default:defaulth px� 
Q
%s*synth29
%|15    |IBUF                |     1|
2default:defaulth px� 
Q
%s*synth29
%|16    |OBUF                |    14|
2default:defaulth px� 
Q
%s*synth29
%+------+--------------------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:20 ; elapsed = 00:00:22 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 8 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:14 ; elapsed = 00:00:21 . Memory (MB): peak = 1326.242 ; gain = 504.602
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:20 ; elapsed = 00:00:22 . Memory (MB): peak = 1326.242 ; gain = 548.305
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0042default:default2
1326.2422default:default2
0.0002default:defaultZ17-268h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
172default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1328.8712default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2Y
E  A total of 2 instances were transformed.
  LD => LDCE: 2 instances
2default:defaultZ1-111h px� 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
f39313442default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
472default:default2
172default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:232default:default2
00:00:262default:default2
1328.8712default:default2
924.9262default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/HUB75_testing/HUB75_testing.runs/synth_1/frame_manager_tb.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2�
vExecuting : report_utilization -file frame_manager_tb_utilization_synth.rpt -pb frame_manager_tb_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Fri Dec 13 02:04:36 20242default:defaultZ17-206h px� 


End Record