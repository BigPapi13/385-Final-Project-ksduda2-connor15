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

$ # Set to true for simulation, false for synthesis
$ SIMULATION_MODE = False

$ from svpy import *
$ from svmath import *
$ from structs import OBB, Juice, JOBB, Contact, Impulse

$$$
if SIMULATION_MODE:
    reg_clk = "Clk"
else:
    reg_clk = "vsync"
$$$

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
    logic [9:0] drawX, drawY, ballxsig, ballysig, ballsizesig;

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
    $ obb1 = OBB("obb1")
    $ obb1_ld = OBB("obb1_ld")
    $ ld = OBB("ld")

    $ obb1.declare()
    $ obb1_ld.declare()
    obb_reg #(.X_INIT(10), .Y_INIT(32), .X_VEL_INIT(0.3), .Y_VEL_INIT(-0.1), .ANGLE_INIT(0.7), .OMEGA_INIT(0)) obb1(
        $$ld.module_assign(obb1_ld)$$,
        $$OBB.module_assign(obb1)$$,
        .load(1'b1),
        .reset(reset_ah),
        .clk($$reg_clk$$)
    );

    // Second OBB register
    $ obb2 = OBB("obb2")
    $ obb2_ld = OBB("obb2_ld")

    $ obb2.declare()
    $ obb2_ld.declare()
    obb_reg #(.X_INIT(45), .Y_INIT(32), .X_VEL_INIT(-0.2), .Y_VEL_INIT(0.5), .WIDTH_INIT(15), .HEIGHT_INIT(5), .OMEGA_INIT(0)) obb2(
        $$ld.module_assign(obb2_ld)$$,
        $$OBB.module_assign(obb2)$$,
        .load(1'b1),
        .reset(reset_ah),
        .clk($$reg_clk$$)
    );

    // Use collision data to generate an impulse
    $ impulse_data = Impulse("impulse_data")
    $ impulse_data.declare()
    $ contact_data = Contact("contact_data")
    $ contact_data.declare(),
    $ rotational_impulse1 = Fixed(4, 7, "rotational_impulse1")
    $ rotational_impulse2 = Fixed(4, 7, "rotational_impulse2")
    $ rotational_impulse1.declare()
    $ rotational_impulse2.declare()
    box_box_resolver bbr_inst(
        $$Contact.module_assign(contact_data)$$,
        $$obb1.module_assign(obb1)$$,
        $$obb2.module_assign(obb2)$$,
        $$Impulse.module_assign(impulse_data)$$,
        $$rotational_impulse1.module_assign(rotational_impulse1)$$,
        $$rotational_impulse2.module_assign(rotational_impulse2)$$
    );

    // Logic for determining next state
    $ prev = OBB("prev")
    $ next = OBB("next")
    $ rotational_impulse = Fixed(4, 7, "rotational_impulse")
    $ rotational_impulse.declare()
    logic is_collision;
    obb_updater obb1_updater(
        .impulse_en(is_collision),
        .update_en(1'b1),
        $$Impulse.module_assign(impulse_data)$$,
        $$next.module_assign(obb1_ld)$$,
        $$prev.module_assign(obb1)$$,
        $$rotational_impulse.module_assign(rotational_impulse1)$$
    );

    $ neg_impulse_data = Impulse("neg_impulse_data")
    $ neg_impulse_data.declare()
    $ neg_impulse_data.impulse.assign(-impulse_data.impulse)
    $ neg_impulse_data.nudge.assign(-impulse_data.nudge)

    obb_updater obb2_updater(
        .impulse_en(is_collision),
        .update_en(1'b1),
        $$Impulse.module_assign(neg_impulse_data)$$,
        $$next.module_assign(obb2_ld)$$,
        $$prev.module_assign(obb2)$$,
        $$rotational_impulse.module_assign(rotational_impulse2)$$
    );

    // DID SOMEONE SAY JUICE????
    // ITS JUICIN' TIME
    
    // Juicer for register 1
    $ jobb1 = JOBB("obb1")
    $ juice1 = Juice("obb1")
    $ juice1.declare()
    $ jobb1.OBB = obb1
    $ jobb1.Juice = juice1

    juicer juicer1(
        $$OBB.module_assign(obb1)$$,
        $$Juice.module_assign(juice1)$$
    );

    // Juicer for register 2
    $ jobb2 = JOBB("obb2")
    $ juice2 = Juice("obb2")
    $ juice2.declare()
    $ jobb2.OBB = obb2
    $ jobb2.Juice = juice2

    juicer juicer2(
        $$OBB.module_assign(obb2)$$,
        $$Juice.module_assign(juice2)$$
    );

    // Collision data between boxes
    collision_detector cd_inst(
        $$jobb1.module_assign(jobb1)$$,
        $$jobb2.module_assign(jobb2)$$,
        .is_collision(is_collision),
        $$Contact.module_assign(contact_data)$$
    );

    //Color Mapper Module
    $ drawPoint = Vec2(8, 14, "drawPoint")   
    color_mapper color_instance(
        $$jobb1.module_assign(jobb1)$$,
        $$jobb2.module_assign(jobb2)$$,
        $$drawPoint.module_assign(contact_data.location)$$,
        .DrawX(drawX),
        .DrawY(drawY),
        .Red(red),
        .Green(green),
        .Blue(blue)
    );
    
endmodule
