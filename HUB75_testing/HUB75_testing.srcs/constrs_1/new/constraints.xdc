set_property PACKAGE_PIN N15 [get_ports clk]
set_property PACKAGE_PIN D10 [get_ports {hub75_red[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hub75_red[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hub75_red[0]}]
set_property PACKAGE_PIN C11 [get_ports {hub75_blue[0]}]
set_property PACKAGE_PIN G16 [get_ports {hub75_red[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hub75_blue[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hub75_blue[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hub75_green[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hub75_green[0]}]
set_property PACKAGE_PIN H16 [get_ports {hub75_blue[1]}]
set_property PACKAGE_PIN H17 [get_ports {hub75_addr[0]}]
set_property PACKAGE_PIN K16 [get_ports {hub75_addr[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS25 [get_ports {hub75_addr[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hub75_addr[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hub75_addr[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hub75_addr[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hub75_addr[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports hub75_clk]
set_property PACKAGE_PIN K14 [get_ports hub75_clk]
set_property PACKAGE_PIN G18 [get_ports {hub75_green[0]}]
set_property PACKAGE_PIN H18 [get_ports {hub75_green[1]}]
set_property PACKAGE_PIN E16 [get_ports {hub75_addr[4]}]
set_property PACKAGE_PIN C12 [get_ports {hub75_addr[1]}]
set_property PACKAGE_PIN D11 [get_ports {hub75_addr[3]}]
set_property PACKAGE_PIN H14 [get_ports hub75_latch]
set_property IOSTANDARD LVCMOS25 [get_ports hub75_latch]
set_property PACKAGE_PIN J15 [get_ports hub75_oe]
set_property IOSTANDARD LVCMOS25 [get_ports hub75_oe]
set_property PACKAGE_PIN J2 [get_ports start_signal]
set_property IOSTANDARD LVCMOS25 [get_ports start_signal]

connect_debug_port u_ila_0/probe1 [get_nets [list dut/write_pixel_clk_BUFG]]
connect_debug_port u_ila_1/clk [get_nets [list write_pixel_clk_BUFG]]
connect_debug_port u_ila_1/probe0 [get_nets [list {write_addr[0]} {write_addr[1]} {write_addr[2]} {write_addr[3]} {write_addr[4]} {write_addr[5]} {write_addr[6]} {write_addr[7]} {write_addr[8]} {write_addr[9]} {write_addr[10]}]]
connect_debug_port u_ila_1/probe1 [get_nets [list sync_pdp_ram/write_en_bottom]]
connect_debug_port u_ila_1/probe2 [get_nets [list sync_pdp_ram/write_en_top]]
connect_debug_port dbg_hub/clk [get_nets write_pixel_clk_BUFG]




set_property PACKAGE_PIN C13 [get_ports test_led]
set_property IOSTANDARD LVCMOS25 [get_ports test_led]
connect_debug_port u_ila_1/probe2 [get_nets [list dut_n_3]]

connect_debug_port u_ila_0/clk [get_nets [list slow_clk]]
connect_debug_port u_ila_0/probe0 [get_nets [list {hub75_red_OBUF[0]} {hub75_red_OBUF[1]}]]
connect_debug_port u_ila_0/probe1 [get_nets [list {hub75_addr_OBUF[0]} {hub75_addr_OBUF[1]} {hub75_addr_OBUF[2]} {hub75_addr_OBUF[3]} {hub75_addr_OBUF[4]}]]
connect_debug_port u_ila_0/probe2 [get_nets [list {hub75_blue_OBUF[0]} {hub75_blue_OBUF[1]}]]
connect_debug_port u_ila_0/probe3 [get_nets [list {hub75_green_OBUF[0]} {hub75_green_OBUF[1]}]]
connect_debug_port u_ila_0/probe4 [get_nets [list hub75_latch_OBUF]]
connect_debug_port u_ila_1/probe2 [get_nets [list hub75_clk_OBUF]]
connect_debug_port u_ila_1/probe3 [get_nets [list slow_clk]]


connect_debug_port u_ila_0/probe2 [get_nets [list {write_data[11]}]]

connect_debug_port u_ila_0/probe0 [get_nets [list {frame_counter[0]} {frame_counter[1]} {frame_counter[2]} {frame_counter[3]} {frame_counter[4]} {frame_counter[5]} {frame_counter[6]} {frame_counter[7]} {frame_counter[8]} {frame_counter[9]} {frame_counter[10]} {frame_counter[11]}]]







connect_debug_port u_ila_0/probe0 [get_nets [list {frame_counter[0]} {frame_counter[1]} {frame_counter[2]} {frame_counter[3]} {frame_counter[4]} {frame_counter[5]} {frame_counter[6]} {frame_counter[7]} {frame_counter[8]} {frame_counter[9]} {frame_counter[10]} {frame_counter[11]}]]





connect_debug_port u_ila_0/probe2 [get_nets [list clk_divided]]

