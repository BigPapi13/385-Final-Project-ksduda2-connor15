
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/utils_1/imports/synth_1/adxl345_top.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/utils_1/imports/synth_1/adxl345_top.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
x
Command: %s
53*	vivadotcl2G
3synth_design -top adxl345_top -part xc7s50csga324-12default:defaultZ4-113h px� 
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
`
#Helper process launched with PID %s4824*oasys2
549602default:defaultZ8-7075h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
EC:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2#
TEST_SIGNAL_OUT2default:default2
wire2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
602default:default8@Z8-11241h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:04 . Memory (MB): peak = 1180.445 ; gain = 410.004
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2
adxl345_top2default:default2
 2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345_test_top.sv2default:default2
292default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2!
clock_divider2default:default2
 2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/clock_divider.sv2default:default2
32default:default8@Z8-6157h px� 
[
%s
*synth2C
/	Parameter DIV_N bound to: 20 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
clock_divider2default:default2
 2default:default2
02default:default2
12default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/clock_divider.sv2default:default2
32default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ADXL345_com2default:default2
 2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
232default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys21
clock_divider__parameterized02default:default2
 2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/clock_divider.sv2default:default2
32default:default8@Z8-6157h px� 
Z
%s
*synth2B
.	Parameter DIV_N bound to: 5 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys21
clock_divider__parameterized02default:default2
 2default:default2
02default:default2
12default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/clock_divider.sv2default:default2
32default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

spi_module2default:default2
 2default:default2�
}C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/spi_module.sv2default:default2
82default:default8@Z8-6157h px� 
L
%s
*synth24
 	Parameter CPOL bound to: 1'b1 
2default:defaulth p
x
� 
L
%s
*synth24
 	Parameter CPHA bound to: 1'b1 
2default:defaulth p
x
� 
R
%s
*synth2:
&	Parameter SPI_MASTER bound to: 1'b1 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter SPI_WORD_LEN bound to: 16 - type: integer 
2default:defaulth p
x
� 
�
synthesizing module '%s'%s4497*oasys2 
pos_edge_det2default:default2
 2default:default2�
C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/pos_edge_det.sv2default:default2
32default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
pos_edge_det2default:default2
 2default:default2
02default:default2
12default:default2�
C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/pos_edge_det.sv2default:default2
32default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2 
neg_edge_det2default:default2
 2default:default2�
C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/neg_edge_det.sv2default:default2
32default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
neg_edge_det2default:default2
 2default:default2
02default:default2
12default:default2�
C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/neg_edge_det.sv2default:default2
32default:default8@Z8-6155h px� 
�
-case statement is not full and has no default155*oasys2�
}C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/spi_module.sv2default:default2
1002default:default8@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

spi_module2default:default2
 2default:default2
02default:default2
12default:default2�
}C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/spi_module.sv2default:default2
82default:default8@Z8-6155h px� 
�
-case statement is not full and has no default155*oasys2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
1372default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
2042default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
3042default:default8@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ADXL345_com2default:default2
 2default:default2
02default:default2
12default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
232default:default8@Z8-6155h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
162default:default2
DATA_STREAM2default:default2
82default:default2
ADXL345_com2default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345_test_top.sv2default:default2
732default:default8@Z8-689h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
adxl345_top2default:default2
 2default:default2
02default:default2
12default:default2�
�C:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345_test_top.sv2default:default2
292default:default8@Z8-6155h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2

DATAZ1_reg2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
2572default:default8@Z8-6014h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2)
read_axis_counter_reg2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
1402default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2!
reset_div_reg2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
672default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2!
reset_spi_reg2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
832default:default8@Z8-87h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
SS_IN2default:default2

spi_module2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
SIGNAL_SS_IN2default:default2
ADXL345_com2default:defaultZ8-7129h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:06 . Memory (MB): peak = 1272.398 ; gain = 501.957
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:04 ; elapsed = 00:00:06 . Memory (MB): peak = 1272.398 ; gain = 501.957
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
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:06 . Memory (MB): peak = 1272.398 ; gain = 501.957
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
1272.3982default:default2
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
�
Parsing XDC File [%s]
179*designutils2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2 
miso_data[7]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
142default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
142default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
miso_data[6]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
152default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
152default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
miso_data[5]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
162default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
162default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
miso_data[4]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
172default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
172default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
miso_data[3]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
182default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
182default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
miso_data[2]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
192default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
192default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
miso_data[1]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
202default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
202default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
miso_data[0]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
212default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
212default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[7]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
222default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
222default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[6]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
232default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
232default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[5]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
242default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
242default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[4]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
252default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
252default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[3]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
262default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
262default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[2]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
272default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
272default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[1]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
282default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
282default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[0]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
292default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
292default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[0]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
332default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
332default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[2]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
342default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
342default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[3]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
352default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
352default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[4]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
362default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
362default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[5]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
372default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
372default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[6]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
382default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
382default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[7]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
392default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
392default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[7]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
402default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
402default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[6]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
412default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
412default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[5]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
422default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
422default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[4]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
432default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
432default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[3]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
442default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
442default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[2]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
452default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
452default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[1]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
462default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
462default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[0]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
472default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
472default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[7]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
522default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
522default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[6]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
532default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
532default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[5]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
542default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
542default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[4]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
552default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
552default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[3]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
562default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
562default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[2]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
572default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
572default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[1]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
582default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
582default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
mosi_data[0]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
592default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
592default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[7]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
632default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
632default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[6]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
642default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
642default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[5]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
652default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
652default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[4]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
662default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
662default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[3]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
672default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
672default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[2]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
682default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
682default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[1]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
692default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
692default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[0]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
702default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
702default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[7]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
712default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
712default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2)
accelerometer_data[1]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
722default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
722default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[6]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
732default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
732default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[5]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
742default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
742default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[4]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
752default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
752default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[3]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
762default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
762default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[2]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
772default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
772default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[1]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
782default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
782default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[0]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
792default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
792default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_send[15]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
912default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
912default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_send[14]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
922default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
922default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_send[13]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
932default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
932default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_send[12]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
942default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
942default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_send[11]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
952default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
952default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_send[10]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
962default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
962default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[9]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
972default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
972default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[8]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
982default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
982default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[8]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
992default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
992default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_send[9]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1002default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1002default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_send[10]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1012default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1012default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_send[11]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1022default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1022default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_send[12]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1032default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1032default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_send[13]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1042default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1042default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_send[14]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1052default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1052default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_send[15]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1062default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1062default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_recv[15]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1082default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1082default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_recv[14]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1092default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1092default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_recv[13]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1102default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1102default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_recv[12]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1112default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1112default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_recv[11]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1122default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1122default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2&
data_word_recv[10]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1132default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1132default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_recv[9]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1142default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1142default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_recv[8]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1152default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1152default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_recv[7]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1162default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1162default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_recv[6]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1172default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1172default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_recv[5]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1182default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1182default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_recv[4]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1192default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1192default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_recv[3]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1202default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1202default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_recv[2]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1212default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1212default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_recv[1]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1222default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1222default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2%
data_word_recv[0]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1232default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1232default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
x0[7]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1262default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1262default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
x0[6]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1272default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1272default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
x0[5]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1282default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1282default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
x0[4]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1292default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1292default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
x0[3]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1302default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1302default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
x0[2]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1312default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1312default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
x0[1]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1322default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1322default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
x0[0]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1332default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1332default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
x0[7]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1342default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1342default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
x0[6]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1352default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1352default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
x0[5]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1362default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1362default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
x0[4]2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1372default:default8@Z12-584h px�
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2!
Vivado 12-5842default:default2
1002default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1372default:default8@Z17-14h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default2
1372default:default8@Z17-55h px�
�
Finished Parsing XDC File [%s]
178*designutils2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/constrs_1/new/pinmap.xdc2default:default21
.Xil/adxl345_top_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1341.5552default:default2
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
1341.5552default:default2
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
Finished Constraint Validation : Time (s): cpu = 00:00:08 ; elapsed = 00:00:12 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:08 ; elapsed = 00:00:12 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:08 ; elapsed = 00:00:12 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
spi_status_reg2default:default2

spi_module2default:defaultZ8-802h px� 
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2!
recv_data_reg2default:default2
162default:default2
82default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
2822default:default8@Z8-3936h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2%
current_state_reg2default:default2
ADXL345_com2default:defaultZ8-802h px� 
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
_                  iSTATE |                                0 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                                1 |                              111
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
spi_status_reg2default:default2

sequential2default:default2

spi_module2default:defaultZ8-3354h px� 
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
_                   RESET |                              000 |                            00000
2default:defaulth p
x
� 
�
%s
*synth2s
_  CONFIG_BW_RATE_ADDRESS |                              001 |                            00001
2default:defaulth p
x
� 
�
%s
*synth2u
aCONFIG_DATA_FORMAT_ADDRESS |                              010 |                            00010
2default:defaulth p
x
� 
�
%s
*synth2s
_CONFIG_POWER_CTL_ADDRESS |                              011 |                            00011
2default:defaulth p
x
� 
�
%s
*synth2s
_ CONFIG_FIFO_CTL_ADDRESS |                              100 |                            00100
2default:defaulth p
x
� 
�
%s
*synth2s
_          READ_AXIS_DATA |                              101 |                            00101
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
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2%
current_state_reg2default:default2

sequential2default:default2
ADXL345_com2default:defaultZ8-3354h px� 
�
!inferring latch for variable '%s'327*oasys2)
read_axis_counter_reg2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
1402default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2!
reset_spi_reg2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
832default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2!
reset_div_reg2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
672default:default8@Z8-327h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:08 ; elapsed = 00:00:13 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
,	   2 Input   15 Bit       Adders := 1     
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
,	   2 Input    5 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  16 Input    5 Bit       Adders := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 2     
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
.	               16 Bit    Registers := 4     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               15 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                8 Bit    Registers := 7     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                5 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 8     
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
,	   2 Input   16 Bit        Muxes := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   6 Input   16 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   15 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   6 Input    3 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 15    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   6 Input    1 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    1 Bit        Muxes := 6     
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
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default28
$accelerometer_master/reset_spi_reg/Q2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
2722default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
2722default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
2722default:default8@Z8-6858h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys29
%accelerometer_master/reset_spi_reg__02default:default2
adxl345_top2default:defaultZ8-3332h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default28
$accelerometer_master/reset_div_reg/Q2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
2702default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
2702default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2�
zC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.srcs/sources_1/new/ADXL345.sv2default:default2
2702default:default8@Z8-6858h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys29
%accelerometer_master/reset_div_reg__02default:default2
adxl345_top2default:defaultZ8-3332h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:08 ; elapsed = 00:00:15 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:11 ; elapsed = 00:00:20 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
}Finished Timing Optimization : Time (s): cpu = 00:00:11 ; elapsed = 00:00:20 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
|Finished Technology Mapping : Time (s): cpu = 00:00:11 ; elapsed = 00:00:20 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
vFinished IO Insertion : Time (s): cpu = 00:00:13 ; elapsed = 00:00:24 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:13 ; elapsed = 00:00:24 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:13 ; elapsed = 00:00:24 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:13 ; elapsed = 00:00:24 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:13 ; elapsed = 00:00:24 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:13 ; elapsed = 00:00:24 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px� 
D
%s*synth2,
|2     |CARRY4 |     9|
2default:defaulth px� 
D
%s*synth2,
|3     |LUT1   |    20|
2default:defaulth px� 
D
%s*synth2,
|4     |LUT2   |     6|
2default:defaulth px� 
D
%s*synth2,
|5     |LUT3   |    17|
2default:defaulth px� 
D
%s*synth2,
|6     |LUT4   |    15|
2default:defaulth px� 
D
%s*synth2,
|7     |LUT5   |    31|
2default:defaulth px� 
D
%s*synth2,
|8     |LUT6   |    48|
2default:defaulth px� 
D
%s*synth2,
|9     |FDRE   |   155|
2default:defaulth px� 
D
%s*synth2,
|10    |LD     |     3|
2default:defaulth px� 
D
%s*synth2,
|11    |IBUF   |     3|
2default:defaulth px� 
D
%s*synth2,
|12    |OBUF   |    23|
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
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
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:13 ; elapsed = 00:00:24 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
FSynthesis finished with 0 errors, 6 critical warnings and 7 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:08 ; elapsed = 00:00:22 . Memory (MB): peak = 1341.555 ; gain = 501.957
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:13 ; elapsed = 00:00:24 . Memory (MB): peak = 1341.555 ; gain = 571.113
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
00:00:00.0032default:default2
1341.5552default:default2
0.0002default:defaultZ17-268h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
122default:defaultZ29-17h px� 
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
1341.5552default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2Y
E  A total of 3 instances were transformed.
  LD => LDCE: 3 instances
2default:defaultZ1-111h px� 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
7e07160f2default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
472default:default2
1142default:default2
1062default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:162default:default2
00:00:382default:default2
1341.5552default:default2
942.9572default:defaultZ17-268h px� 
�
4The following parameters have non-default value.
%s
395*common24
 tcl.collectionResultDisplayLimit2default:defaultZ17-600h px� 
u
%s6*runtcl2Y
ESynthesis results are not added to the cache due to CRITICAL_WARNING
2default:defaulth px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2�
yC:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/SPI_testing/SPI_testing.runs/synth_1/adxl345_top.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2�
lExecuting : report_utilization -file adxl345_top_utilization_synth.rpt -pb adxl345_top_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Fri Dec 13 09:09:32 20242default:defaultZ17-206h px� 


End Record