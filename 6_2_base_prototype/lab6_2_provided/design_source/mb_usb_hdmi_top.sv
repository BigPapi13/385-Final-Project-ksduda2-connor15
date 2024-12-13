//-------------------------------------------------------------------------
//    mb_usb_hdmi_top.sv                                                 --
//    Zuofu Cheng                                                        --
//    2-29-24                                                            --
//                                                                       --
//                                                                       --
//    Spring 2024 Distribution                                           --
//                                                                       --
//    For use with ECE 385 USB + HDMI                                    --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------




module mb_usb_hdmi_top(
    input logic Clk,
    input logic reset_rtl_0,
    
    //USB signals
    input logic [0:0] gpio_usb_int_tri_i,
    output logic gpio_usb_rst_tri_o,
    input logic usb_spi_miso,
    output logic usb_spi_mosi,
    output logic usb_spi_sclk,
    output logic usb_spi_ss,
    
    //UART
    input logic uart_rtl_0_rxd,
    output logic uart_rtl_0_txd,
    
    //HDMI
    output logic hdmi_tmds_clk_n,
    output logic hdmi_tmds_clk_p,
    output logic [2:0]hdmi_tmds_data_n,
    output logic [2:0]hdmi_tmds_data_p,
        
    //HEX displays
    output logic [7:0] hex_segA,
    output logic [3:0] hex_gridA,
    output logic [7:0] hex_segB,
    output logic [3:0] hex_gridB
);
    
    logic [31:0] keycode0_gpio, keycode1_gpio;
    logic clk_25MHz, clk_125MHz, clk, clk_100MHz;
    logic locked;
    logic [9:0] drawX, drawY;

    logic hsync, vsync, vde;
    logic [3:0] red, green, blue;
    logic reset_ah;
    
    assign reset_ah = reset_rtl_0;
    
    
    //Keycode HEX drivers
    hex_driver HexA (
        .clk(Clk),
        .reset(reset_ah),
        .in({keycode0_gpio[31:28], keycode0_gpio[27:24], keycode0_gpio[23:20], keycode0_gpio[19:16]}),
        .hex_seg(hex_segA),
        .hex_grid(hex_gridA)
    );
    
    hex_driver HexB (
        .clk(Clk),
        .reset(reset_ah),
        .in({keycode0_gpio[15:12], keycode0_gpio[11:8], keycode0_gpio[7:4], keycode0_gpio[3:0]}),
        .hex_seg(hex_segB),
        .hex_grid(hex_gridB)
    );
    
    mb_block mb_block_i (
        .clk_100MHz(Clk),
        .gpio_usb_int_tri_i(gpio_usb_int_tri_i),
        .gpio_usb_keycode_0_tri_o(keycode0_gpio),
        .gpio_usb_keycode_1_tri_o(keycode1_gpio),
        .gpio_usb_rst_tri_o(gpio_usb_rst_tri_o),
        .reset_rtl_0(~reset_ah), //Block designs expect active low reset, all other modules are active high
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd),
        .usb_spi_miso(usb_spi_miso),
        .usb_spi_mosi(usb_spi_mosi),
        .usb_spi_sclk(usb_spi_sclk),
        .usb_spi_ss(usb_spi_ss)
    );
        
    //clock wizard configured with a 1x and 5x clock for HDMI
    clk_wiz_0 clk_wiz (
        .clk_out1(clk_25MHz),
        .clk_out2(clk_125MHz),
        .reset(reset_ah),
        .locked(locked),
        .clk_in1(Clk)
    );
    
    //VGA Sync signal generator
    vga_controller vga (
        .pixel_clk(clk_25MHz),
        .reset(reset_ah),
        .hs(hsync),
        .vs(vsync),
        .active_nblank(vde),
        .drawX(drawX),
        .drawY(drawY)
    );    

    //Real Digital VGA to HDMI converter
    hdmi_tx_0 vga_to_hdmi (
        //Clocking and Reset
        .pix_clk(clk_25MHz),
        .pix_clkx5(clk_125MHz),
        .pix_clk_locked(locked),
        //Reset is active LOW
        .rst(reset_ah),
        //Color and Sync Signals
        .red(red),
        .green(green),
        .blue(blue),
        .hsync(hsync),
        .vsync(vsync),
        .vde(vde),
        
        //aux Data (unused)
        .aux0_din(4'b0),
        .aux1_din(4'b0),
        .aux2_din(4'b0),
        .ade(1'b0),
        
        //Differential outputs
        .TMDS_CLK_P(hdmi_tmds_clk_p),          
        .TMDS_CLK_N(hdmi_tmds_clk_n),          
        .TMDS_DATA_P(hdmi_tmds_data_p),         
        .TMDS_DATA_N(hdmi_tmds_data_n)          
    );
    
    // First OBB register

logic [7 : 0] obb1_width;
logic [7 : 0] obb1_height;
logic [15 : 0] obb1_inertia;
logic [15 : 0] obb1_inv_mass;
logic [23 : 0] obb1_inv_inertia;
logic signed [23 : 0] obb1_pos_x;
logic signed [23 : 0] obb1_pos_y;
logic signed [23 : 0] obb1_vel_x;
logic signed [23 : 0] obb1_vel_y;
logic signed [10 : 0] obb1_angle;
logic signed [10 : 0] obb1_omega;
logic [7 : 0] obb1_ld_width;
logic [7 : 0] obb1_ld_height;
logic [15 : 0] obb1_ld_inertia;
logic [15 : 0] obb1_ld_inv_mass;
logic [23 : 0] obb1_ld_inv_inertia;
logic signed [23 : 0] obb1_ld_pos_x;
logic signed [23 : 0] obb1_ld_pos_y;
logic signed [23 : 0] obb1_ld_vel_x;
logic signed [23 : 0] obb1_ld_vel_y;
logic signed [10 : 0] obb1_ld_angle;
logic signed [10 : 0] obb1_ld_omega;
    obb_reg #(.X_INIT(10), .Y_INIT(32), .X_VEL_INIT(0.3), .Y_VEL_INIT(-0.1), .ANGLE_INIT(0.7), .MASS_INIT(4), .OMEGA_INIT(0)) obb1(
        .ld_width(obb1_ld_width),
.ld_height(obb1_ld_height),
.ld_inertia(obb1_ld_inertia),
.ld_inv_mass(obb1_ld_inv_mass),
.ld_inv_inertia(obb1_ld_inv_inertia),
.ld_pos_x(obb1_ld_pos_x),
.ld_pos_y(obb1_ld_pos_y),
.ld_vel_x(obb1_ld_vel_x),
.ld_vel_y(obb1_ld_vel_y),
.ld_angle(obb1_ld_angle),
.ld_omega(obb1_ld_omega),
        .width(obb1_width),
.height(obb1_height),
.inertia(obb1_inertia),
.inv_mass(obb1_inv_mass),
.inv_inertia(obb1_inv_inertia),
.pos_x(obb1_pos_x),
.pos_y(obb1_pos_y),
.vel_x(obb1_vel_x),
.vel_y(obb1_vel_y),
.angle(obb1_angle),
.omega(obb1_omega),
        .load(1'b1),
        .reset(reset_ah),
        .clk(vsync)
    );

    // Second OBB register

logic [7 : 0] obb2_width;
logic [7 : 0] obb2_height;
logic [15 : 0] obb2_inertia;
logic [15 : 0] obb2_inv_mass;
logic [23 : 0] obb2_inv_inertia;
logic signed [23 : 0] obb2_pos_x;
logic signed [23 : 0] obb2_pos_y;
logic signed [23 : 0] obb2_vel_x;
logic signed [23 : 0] obb2_vel_y;
logic signed [10 : 0] obb2_angle;
logic signed [10 : 0] obb2_omega;
logic [7 : 0] obb2_ld_width;
logic [7 : 0] obb2_ld_height;
logic [15 : 0] obb2_ld_inertia;
logic [15 : 0] obb2_ld_inv_mass;
logic [23 : 0] obb2_ld_inv_inertia;
logic signed [23 : 0] obb2_ld_pos_x;
logic signed [23 : 0] obb2_ld_pos_y;
logic signed [23 : 0] obb2_ld_vel_x;
logic signed [23 : 0] obb2_ld_vel_y;
logic signed [10 : 0] obb2_ld_angle;
logic signed [10 : 0] obb2_ld_omega;
    obb_reg #(.X_INIT(45), .Y_INIT(32), .X_VEL_INIT(-0.2), .Y_VEL_INIT(0.5), .WIDTH_INIT(15), .HEIGHT_INIT(5), .MASS_INIT(4), .OMEGA_INIT(0)) obb2(
        .ld_width(obb2_ld_width),
.ld_height(obb2_ld_height),
.ld_inertia(obb2_ld_inertia),
.ld_inv_mass(obb2_ld_inv_mass),
.ld_inv_inertia(obb2_ld_inv_inertia),
.ld_pos_x(obb2_ld_pos_x),
.ld_pos_y(obb2_ld_pos_y),
.ld_vel_x(obb2_ld_vel_x),
.ld_vel_y(obb2_ld_vel_y),
.ld_angle(obb2_ld_angle),
.ld_omega(obb2_ld_omega),
        .width(obb2_width),
.height(obb2_height),
.inertia(obb2_inertia),
.inv_mass(obb2_inv_mass),
.inv_inertia(obb2_inv_inertia),
.pos_x(obb2_pos_x),
.pos_y(obb2_pos_y),
.vel_x(obb2_vel_x),
.vel_y(obb2_vel_y),
.angle(obb2_angle),
.omega(obb2_omega),
        .load(1'b1),
        .reset(reset_ah),
        .clk(vsync)
    );

    // Use collision data to generate an impulse
logic signed [15 : 0] contact_data_normal_x;
logic signed [15 : 0] contact_data_normal_y;
logic signed [21 : 0] contact_data_location_x;
logic signed [21 : 0] contact_data_location_y;
logic signed [23 : 0] contact_data_penetration;
logic signed [23 : 0] impulse1_impulse_x;
logic signed [23 : 0] impulse1_impulse_y;
logic signed [23 : 0] impulse1_nudge_x;
logic signed [23 : 0] impulse1_nudge_y;
logic signed [10 : 0] impulse1_rotational_impulse;
logic signed [23 : 0] impulse2_impulse_x;
logic signed [23 : 0] impulse2_impulse_y;
logic signed [23 : 0] impulse2_nudge_x;
logic signed [23 : 0] impulse2_nudge_y;
logic signed [10 : 0] impulse2_rotational_impulse;
    logic ignore_impulse;
    box_box_resolver bbr_inst(
        .normal_x(contact_data_normal_x),
.normal_y(contact_data_normal_y),
.location_x(contact_data_location_x),
.location_y(contact_data_location_y),
.penetration(contact_data_penetration),
        .obb1_width(obb1_width),
.obb1_height(obb1_height),
.obb1_inertia(obb1_inertia),
.obb1_inv_mass(obb1_inv_mass),
.obb1_inv_inertia(obb1_inv_inertia),
.obb1_pos_x(obb1_pos_x),
.obb1_pos_y(obb1_pos_y),
.obb1_vel_x(obb1_vel_x),
.obb1_vel_y(obb1_vel_y),
.obb1_angle(obb1_angle),
.obb1_omega(obb1_omega),
        .obb2_width(obb2_width),
.obb2_height(obb2_height),
.obb2_inertia(obb2_inertia),
.obb2_inv_mass(obb2_inv_mass),
.obb2_inv_inertia(obb2_inv_inertia),
.obb2_pos_x(obb2_pos_x),
.obb2_pos_y(obb2_pos_y),
.obb2_vel_x(obb2_vel_x),
.obb2_vel_y(obb2_vel_y),
.obb2_angle(obb2_angle),
.obb2_omega(obb2_omega),
        .impulse1_impulse_x(impulse1_impulse_x),
.impulse1_impulse_y(impulse1_impulse_y),
.impulse1_nudge_x(impulse1_nudge_x),
.impulse1_nudge_y(impulse1_nudge_y),
.impulse1_rotational_impulse(impulse1_rotational_impulse),
        .impulse2_impulse_x(impulse2_impulse_x),
.impulse2_impulse_y(impulse2_impulse_y),
.impulse2_nudge_x(impulse2_nudge_x),
.impulse2_nudge_y(impulse2_nudge_y),
.impulse2_rotational_impulse(impulse2_rotational_impulse),
        .ignore_impulse(ignore_impulse)
    );

    // Logic for determining next state
    logic is_collision;
    obb_updater obb1_updater(
        .impulse_en(is_collision & ~ignore_impulse),
        .update_en(1'b1),
        .impulse_x(impulse1_impulse_x),
.impulse_y(impulse1_impulse_y),
.nudge_x(impulse1_nudge_x),
.nudge_y(impulse1_nudge_y),
.rotational_impulse(impulse1_rotational_impulse),
        .next_width(obb1_ld_width),
.next_height(obb1_ld_height),
.next_inertia(obb1_ld_inertia),
.next_inv_mass(obb1_ld_inv_mass),
.next_inv_inertia(obb1_ld_inv_inertia),
.next_pos_x(obb1_ld_pos_x),
.next_pos_y(obb1_ld_pos_y),
.next_vel_x(obb1_ld_vel_x),
.next_vel_y(obb1_ld_vel_y),
.next_angle(obb1_ld_angle),
.next_omega(obb1_ld_omega),
        .prev_width(obb1_width),
.prev_height(obb1_height),
.prev_inertia(obb1_inertia),
.prev_inv_mass(obb1_inv_mass),
.prev_inv_inertia(obb1_inv_inertia),
.prev_pos_x(obb1_pos_x),
.prev_pos_y(obb1_pos_y),
.prev_vel_x(obb1_vel_x),
.prev_vel_y(obb1_vel_y),
.prev_angle(obb1_angle),
.prev_omega(obb1_omega)
    );

    obb_updater obb2_updater(
        .impulse_en(is_collision & ~ignore_impulse),
        .update_en(1'b1),
        .impulse_x(impulse2_impulse_x),
.impulse_y(impulse2_impulse_y),
.nudge_x(impulse2_nudge_x),
.nudge_y(impulse2_nudge_y),
.rotational_impulse(impulse2_rotational_impulse),
        .next_width(obb2_ld_width),
.next_height(obb2_ld_height),
.next_inertia(obb2_ld_inertia),
.next_inv_mass(obb2_ld_inv_mass),
.next_inv_inertia(obb2_ld_inv_inertia),
.next_pos_x(obb2_ld_pos_x),
.next_pos_y(obb2_ld_pos_y),
.next_vel_x(obb2_ld_vel_x),
.next_vel_y(obb2_ld_vel_y),
.next_angle(obb2_ld_angle),
.next_omega(obb2_ld_omega),
        .prev_width(obb2_width),
.prev_height(obb2_height),
.prev_inertia(obb2_inertia),
.prev_inv_mass(obb2_inv_mass),
.prev_inv_inertia(obb2_inv_inertia),
.prev_pos_x(obb2_pos_x),
.prev_pos_y(obb2_pos_y),
.prev_vel_x(obb2_vel_x),
.prev_vel_y(obb2_vel_y),
.prev_angle(obb2_angle),
.prev_omega(obb2_omega)
    );

    // DID SOMEONE SAY JUICE????
    // ITS JUICIN' TIME
    
    // Juicer for register 1
logic signed [15 : 0] obb1_u_x;
logic signed [15 : 0] obb1_u_y;
logic signed [15 : 0] obb1_v_x;
logic signed [15 : 0] obb1_v_y;
logic signed [21 : 0] obb1_Point0_x;
logic signed [21 : 0] obb1_Point0_y;
logic signed [21 : 0] obb1_Point1_x;
logic signed [21 : 0] obb1_Point1_y;
logic signed [21 : 0] obb1_Point2_x;
logic signed [21 : 0] obb1_Point2_y;
logic signed [21 : 0] obb1_Point3_x;
logic signed [21 : 0] obb1_Point3_y;
logic signed [6 : 0] obb1_halfWidth;
logic signed [6 : 0] obb1_halfHeight;

    juicer juicer1(
        .width(obb1_width),
.height(obb1_height),
.inertia(obb1_inertia),
.inv_mass(obb1_inv_mass),
.inv_inertia(obb1_inv_inertia),
.pos_x(obb1_pos_x),
.pos_y(obb1_pos_y),
.vel_x(obb1_vel_x),
.vel_y(obb1_vel_y),
.angle(obb1_angle),
.omega(obb1_omega),
        .u_x(obb1_u_x),
.u_y(obb1_u_y),
.v_x(obb1_v_x),
.v_y(obb1_v_y),
.Point0_x(obb1_Point0_x),
.Point0_y(obb1_Point0_y),
.Point1_x(obb1_Point1_x),
.Point1_y(obb1_Point1_y),
.Point2_x(obb1_Point2_x),
.Point2_y(obb1_Point2_y),
.Point3_x(obb1_Point3_x),
.Point3_y(obb1_Point3_y),
.halfWidth(obb1_halfWidth),
.halfHeight(obb1_halfHeight)
    );

    // Juicer for register 2
logic signed [15 : 0] obb2_u_x;
logic signed [15 : 0] obb2_u_y;
logic signed [15 : 0] obb2_v_x;
logic signed [15 : 0] obb2_v_y;
logic signed [21 : 0] obb2_Point0_x;
logic signed [21 : 0] obb2_Point0_y;
logic signed [21 : 0] obb2_Point1_x;
logic signed [21 : 0] obb2_Point1_y;
logic signed [21 : 0] obb2_Point2_x;
logic signed [21 : 0] obb2_Point2_y;
logic signed [21 : 0] obb2_Point3_x;
logic signed [21 : 0] obb2_Point3_y;
logic signed [6 : 0] obb2_halfWidth;
logic signed [6 : 0] obb2_halfHeight;

    juicer juicer2(
        .width(obb2_width),
.height(obb2_height),
.inertia(obb2_inertia),
.inv_mass(obb2_inv_mass),
.inv_inertia(obb2_inv_inertia),
.pos_x(obb2_pos_x),
.pos_y(obb2_pos_y),
.vel_x(obb2_vel_x),
.vel_y(obb2_vel_y),
.angle(obb2_angle),
.omega(obb2_omega),
        .u_x(obb2_u_x),
.u_y(obb2_u_y),
.v_x(obb2_v_x),
.v_y(obb2_v_y),
.Point0_x(obb2_Point0_x),
.Point0_y(obb2_Point0_y),
.Point1_x(obb2_Point1_x),
.Point1_y(obb2_Point1_y),
.Point2_x(obb2_Point2_x),
.Point2_y(obb2_Point2_y),
.Point3_x(obb2_Point3_x),
.Point3_y(obb2_Point3_y),
.halfWidth(obb2_halfWidth),
.halfHeight(obb2_halfHeight)
    );

    // Collision data between boxes
    collision_detector cd_inst(
        .obb1_width(obb1_width),
.obb1_height(obb1_height),
.obb1_inertia(obb1_inertia),
.obb1_inv_mass(obb1_inv_mass),
.obb1_inv_inertia(obb1_inv_inertia),
.obb1_pos_x(obb1_pos_x),
.obb1_pos_y(obb1_pos_y),
.obb1_vel_x(obb1_vel_x),
.obb1_vel_y(obb1_vel_y),
.obb1_angle(obb1_angle),
.obb1_omega(obb1_omega),
.obb1_u_x(obb1_u_x),
.obb1_u_y(obb1_u_y),
.obb1_v_x(obb1_v_x),
.obb1_v_y(obb1_v_y),
.obb1_Point0_x(obb1_Point0_x),
.obb1_Point0_y(obb1_Point0_y),
.obb1_Point1_x(obb1_Point1_x),
.obb1_Point1_y(obb1_Point1_y),
.obb1_Point2_x(obb1_Point2_x),
.obb1_Point2_y(obb1_Point2_y),
.obb1_Point3_x(obb1_Point3_x),
.obb1_Point3_y(obb1_Point3_y),
.obb1_halfWidth(obb1_halfWidth),
.obb1_halfHeight(obb1_halfHeight),
        .obb2_width(obb2_width),
.obb2_height(obb2_height),
.obb2_inertia(obb2_inertia),
.obb2_inv_mass(obb2_inv_mass),
.obb2_inv_inertia(obb2_inv_inertia),
.obb2_pos_x(obb2_pos_x),
.obb2_pos_y(obb2_pos_y),
.obb2_vel_x(obb2_vel_x),
.obb2_vel_y(obb2_vel_y),
.obb2_angle(obb2_angle),
.obb2_omega(obb2_omega),
.obb2_u_x(obb2_u_x),
.obb2_u_y(obb2_u_y),
.obb2_v_x(obb2_v_x),
.obb2_v_y(obb2_v_y),
.obb2_Point0_x(obb2_Point0_x),
.obb2_Point0_y(obb2_Point0_y),
.obb2_Point1_x(obb2_Point1_x),
.obb2_Point1_y(obb2_Point1_y),
.obb2_Point2_x(obb2_Point2_x),
.obb2_Point2_y(obb2_Point2_y),
.obb2_Point3_x(obb2_Point3_x),
.obb2_Point3_y(obb2_Point3_y),
.obb2_halfWidth(obb2_halfWidth),
.obb2_halfHeight(obb2_halfHeight),
        .is_collision(is_collision),
        .normal_x(contact_data_normal_x),
.normal_y(contact_data_normal_y),
.location_x(contact_data_location_x),
.location_y(contact_data_location_y),
.penetration(contact_data_penetration)
    );

    //Color Mapper Module
    color_mapper color_instance(
        .obb1_width(obb1_width),
.obb1_height(obb1_height),
.obb1_inertia(obb1_inertia),
.obb1_inv_mass(obb1_inv_mass),
.obb1_inv_inertia(obb1_inv_inertia),
.obb1_pos_x(obb1_pos_x),
.obb1_pos_y(obb1_pos_y),
.obb1_vel_x(obb1_vel_x),
.obb1_vel_y(obb1_vel_y),
.obb1_angle(obb1_angle),
.obb1_omega(obb1_omega),
.obb1_u_x(obb1_u_x),
.obb1_u_y(obb1_u_y),
.obb1_v_x(obb1_v_x),
.obb1_v_y(obb1_v_y),
.obb1_Point0_x(obb1_Point0_x),
.obb1_Point0_y(obb1_Point0_y),
.obb1_Point1_x(obb1_Point1_x),
.obb1_Point1_y(obb1_Point1_y),
.obb1_Point2_x(obb1_Point2_x),
.obb1_Point2_y(obb1_Point2_y),
.obb1_Point3_x(obb1_Point3_x),
.obb1_Point3_y(obb1_Point3_y),
.obb1_halfWidth(obb1_halfWidth),
.obb1_halfHeight(obb1_halfHeight),
        .obb2_width(obb2_width),
.obb2_height(obb2_height),
.obb2_inertia(obb2_inertia),
.obb2_inv_mass(obb2_inv_mass),
.obb2_inv_inertia(obb2_inv_inertia),
.obb2_pos_x(obb2_pos_x),
.obb2_pos_y(obb2_pos_y),
.obb2_vel_x(obb2_vel_x),
.obb2_vel_y(obb2_vel_y),
.obb2_angle(obb2_angle),
.obb2_omega(obb2_omega),
.obb2_u_x(obb2_u_x),
.obb2_u_y(obb2_u_y),
.obb2_v_x(obb2_v_x),
.obb2_v_y(obb2_v_y),
.obb2_Point0_x(obb2_Point0_x),
.obb2_Point0_y(obb2_Point0_y),
.obb2_Point1_x(obb2_Point1_x),
.obb2_Point1_y(obb2_Point1_y),
.obb2_Point2_x(obb2_Point2_x),
.obb2_Point2_y(obb2_Point2_y),
.obb2_Point3_x(obb2_Point3_x),
.obb2_Point3_y(obb2_Point3_y),
.obb2_halfWidth(obb2_halfWidth),
.obb2_halfHeight(obb2_halfHeight),
        .drawPoint_x(contact_data_location_x),
.drawPoint_y(contact_data_location_y),
        .DrawX(drawX),
        .DrawY(drawY),
        .Red(red),
        .Green(green),
        .Blue(blue)
    );
    
endmodule
