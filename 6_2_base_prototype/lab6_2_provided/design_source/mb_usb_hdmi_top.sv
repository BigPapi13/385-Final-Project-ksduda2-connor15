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

logic signed [7 : 0] obb1_width;
logic signed [7 : 0] obb1_height;
logic signed [31 : 0] obb1_pos_x;
logic signed [31 : 0] obb1_pos_y;
logic signed [31 : 0] obb1_vel_x;
logic signed [31 : 0] obb1_vel_y;
logic signed [10 : 0] obb1_angle;
logic signed [10 : 0] obb1_omega;
logic signed [7 : 0] obb1_ld_width;
logic signed [7 : 0] obb1_ld_height;
logic signed [31 : 0] obb1_ld_pos_x;
logic signed [31 : 0] obb1_ld_pos_y;
logic signed [31 : 0] obb1_ld_vel_x;
logic signed [31 : 0] obb1_ld_vel_y;
logic signed [10 : 0] obb1_ld_angle;
logic signed [10 : 0] obb1_ld_omega;
    obb_reg #(.X_INIT(11), .Y_INIT(53), .X_VEL_INIT(-0.3), .Y_VEL_INIT(0.5), .OMEGA_INIT(0.03)) obb1(
        .ld_width(obb1_ld_width),
.ld_height(obb1_ld_height),
.ld_pos_x(obb1_ld_pos_x),
.ld_pos_y(obb1_ld_pos_y),
.ld_vel_x(obb1_ld_vel_x),
.ld_vel_y(obb1_ld_vel_y),
.ld_angle(obb1_ld_angle),
.ld_omega(obb1_ld_omega),
        .width(obb1_width),
.height(obb1_height),
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

logic signed [7 : 0] obb2_width;
logic signed [7 : 0] obb2_height;
logic signed [31 : 0] obb2_pos_x;
logic signed [31 : 0] obb2_pos_y;
logic signed [31 : 0] obb2_vel_x;
logic signed [31 : 0] obb2_vel_y;
logic signed [10 : 0] obb2_angle;
logic signed [10 : 0] obb2_omega;
logic signed [7 : 0] obb2_ld_width;
logic signed [7 : 0] obb2_ld_height;
logic signed [31 : 0] obb2_ld_pos_x;
logic signed [31 : 0] obb2_ld_pos_y;
logic signed [31 : 0] obb2_ld_vel_x;
logic signed [31 : 0] obb2_ld_vel_y;
logic signed [10 : 0] obb2_ld_angle;
logic signed [10 : 0] obb2_ld_omega;
    obb_reg #(.X_INIT(44), .Y_INIT(13), .X_VEL_INIT(0.2), .Y_VEL_INIT(0.7), .WIDTH_INIT(15), .HEIGHT_INIT(5), .OMEGA_INIT(0.01)) obb2(
        .ld_width(obb2_ld_width),
.ld_height(obb2_ld_height),
.ld_pos_x(obb2_ld_pos_x),
.ld_pos_y(obb2_ld_pos_y),
.ld_vel_x(obb2_ld_vel_x),
.ld_vel_y(obb2_ld_vel_y),
.ld_angle(obb2_ld_angle),
.ld_omega(obb2_ld_omega),
        .width(obb2_width),
.height(obb2_height),
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

    // Logic for determining next state
    obb_updater obb1_updater(
        .next_width(obb1_ld_width),
.next_height(obb1_ld_height),
.next_pos_x(obb1_ld_pos_x),
.next_pos_y(obb1_ld_pos_y),
.next_vel_x(obb1_ld_vel_x),
.next_vel_y(obb1_ld_vel_y),
.next_angle(obb1_ld_angle),
.next_omega(obb1_ld_omega),
        .prev_width(obb1_width),
.prev_height(obb1_height),
.prev_pos_x(obb1_pos_x),
.prev_pos_y(obb1_pos_y),
.prev_vel_x(obb1_vel_x),
.prev_vel_y(obb1_vel_y),
.prev_angle(obb1_angle),
.prev_omega(obb1_omega)
    );

    obb_updater obb2_updater(
        .next_width(obb2_ld_width),
.next_height(obb2_ld_height),
.next_pos_x(obb2_ld_pos_x),
.next_pos_y(obb2_ld_pos_y),
.next_vel_x(obb2_ld_vel_x),
.next_vel_y(obb2_ld_vel_y),
.next_angle(obb2_ld_angle),
.next_omega(obb2_ld_omega),
        .prev_width(obb2_width),
.prev_height(obb2_height),
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
logic signed [20 : 0] obb1_Point0_x;
logic signed [20 : 0] obb1_Point0_y;
logic signed [20 : 0] obb1_Point1_x;
logic signed [20 : 0] obb1_Point1_y;
logic signed [20 : 0] obb1_Point2_x;
logic signed [20 : 0] obb1_Point2_y;
logic signed [20 : 0] obb1_Point3_x;
logic signed [20 : 0] obb1_Point3_y;
logic signed [6 : 0] obb1_halfWidth;
logic signed [6 : 0] obb1_halfHeight;

    juicer juicer1(
        .width(obb1_width),
.height(obb1_height),
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
logic signed [20 : 0] obb2_Point0_x;
logic signed [20 : 0] obb2_Point0_y;
logic signed [20 : 0] obb2_Point1_x;
logic signed [20 : 0] obb2_Point1_y;
logic signed [20 : 0] obb2_Point2_x;
logic signed [20 : 0] obb2_Point2_y;
logic signed [20 : 0] obb2_Point3_x;
logic signed [20 : 0] obb2_Point3_y;
logic signed [6 : 0] obb2_halfWidth;
logic signed [6 : 0] obb2_halfHeight;

    juicer juicer2(
        .width(obb2_width),
.height(obb2_height),
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

    //Color Mapper Module   
    color_mapper color_instance(
        .obb1_width(obb1_width),
.obb1_height(obb1_height),
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
        .DrawX(drawX),
        .DrawY(drawY),
        .Red(red),
        .Green(green),
        .Blue(blue)
    );
    
endmodule
