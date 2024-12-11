`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 03:45:50 PM
// Design Name: 
// Module Name: main_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

$ from svmath import *

module main_test();
timeunit 10ns;
timeprecision 1ns;
    logic Clk;
    logic reset_rtl_0;
    
    //USB signals
    logic [0:0] gpio_usb_int_tri_i;
    logic gpio_usb_rst_tri_o;
    logic usb_spi_miso;
    logic usb_spi_mosi;
    logic usb_spi_sclk;
    logic usb_spi_ss;
    
    //UART
    logic uart_rtl_0_rxd;
    logic uart_rtl_0_txd;
    
    //HDMI
    logic hdmi_tmds_clk_n;
    logic hdmi_tmds_clk_p;
    logic [2:0]hdmi_tmds_data_n;
    logic [2:0]hdmi_tmds_data_p;
        
    //HEX displays
    logic [7:0] hex_segA;
    logic [3:0] hex_gridA;
    logic [7:0] hex_segB;
    logic [3:0] hex_gridB;

    mb_usb_hdmi_top test(.*);
    
    always begin:CLOCK_GEN
        #1 Clk = ~Clk;
    end

    initial begin: TEST_VECTORS
        Clk = 0;
        reset_rtl_0 = 1;
        #16
        reset_rtl_0 = 0;
    end

endmodule
