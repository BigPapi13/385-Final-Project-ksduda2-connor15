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

$ # Set to true for synthesis, false for simulation
$ SYNTHESIS_MODE = True


$ from svpy import *
$ from structs import OBB, Juice, JOBB

$$$
if SYNTHESIS_MODE == True:
    reg_clk = "vsync"
else:
    reg_clk = "Clk"
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

    //Ball Module
    square square_instance(
        .Reset(reset_ah),
        .frame_clk(vsync),                    //Figure out what this should be so that the ball will move
        .keycode(keycode0_gpio[7:0]),    //Notice: only one keycode connected to ball by default
        .X(ballxsig),
        .Y(ballysig),
        .S(ballsizesig)
    );
    
    // First OBB register
    $ obb1 = OBB("obb1")
    $ obb1_ld = OBB("obb1_ld")
    $ ld = OBB("ld")

    $ obb1.declare()
    $ obb1_ld.declare()
    obb_reg #(.X_INIT(11), .Y_INIT(53), .X_VEL_INIT(-0.3), .Y_VEL_INIT(0.5), .OMEGA_INIT(0.03)) obb1(
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
    obb_reg #(.X_INIT(44), .Y_INIT(13), .X_VEL_INIT(0.2), .Y_VEL_INIT(0.7), .WIDTH_INIT(15), .HEIGHT_INIT(5), .OMEGA_INIT(0.01)) obb2(
        $$ld.module_assign(obb2_ld)$$,
        $$OBB.module_assign(obb2)$$,
        .load(1'b1),
        .reset(reset_ah),
        .clk($$reg_clk$$)
    );

    // Logic for determining next state
    $ prev = OBB("prev")
    $ next = OBB("next")
    obb_updater obb1_updater(
        $$next.module_assign(obb1_ld)$$,
        $$prev.module_assign(obb1)$$
    );

    obb_updater obb2_updater(
        $$next.module_assign(obb2_ld)$$,
        $$prev.module_assign(obb2)$$
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

    //Color Mapper Module   
    color_mapper color_instance(
        $$jobb1.module_assign(jobb1)$$,
        $$jobb2.module_assign(jobb2)$$,
        .DrawX(drawX),
        .DrawY(drawY),
        .Red(red),
        .Green(green),
        .Blue(blue)
    );
    
endmodule
