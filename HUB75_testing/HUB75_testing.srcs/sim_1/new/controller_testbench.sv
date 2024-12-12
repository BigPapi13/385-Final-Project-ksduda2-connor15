`timescale 1ns / 1ps

module tb1 #(BITS_PER_PIXEL=16);
    logic n_reset;
    logic clk;
    logic [1:0] hub75_red;
    logic [1:0] hub75_green;
    logic [1:0] hub75_blue;
    logic [4:0] hub75_addr;
    logic hub75_latch;
    logic hub75_clk;
    logic hub75_oe;
    logic spi_clk;
    logic spi_mosi;
    logic spi_ss;
    logic spi_miso;
    logic user_led;

    logic [31:0] input_image [64 * 64];

    localparam period = 1;

    localparam BITS_PER_RGB = BITS_PER_PIXEL / 4;
        
    logic [BITS_PER_PIXEL-1:0] write_data;
    logic write_pixel_clk;
    logic [11:0] write_addr; // top bit is the double-buffer flipper and is provided by spi_ss
    logic write_en;
    
    logic reset_spi;
    
            
    controller #(BITS_PER_PIXEL) dut (
        n_reset,
        clk,
        hub75_red,
        hub75_green,
        hub75_blue,
        hub75_addr,
        hub75_clk,
        hub75_latch,
        hub75_oe,
        user_led,
        write_pixel_clk, 
        write_addr,
        write_data,
        spi_ss,
        write_en
    );

    initial begin
        $dumpfile("controller.vcd");
        $dumpvars();
                

        n_reset = 1'b1;
        spi_clk= 1'b0;
        spi_mosi = 1'b0;
        spi_ss = 1'b0;
        reset_spi = 1'b0;

        #period;
        n_reset = 1'b0;

        //#period
        //n_reset = 1'b1;
        
    end

    integer write_buffer_count;
    integer write_pixel_count;
    integer write_bit_count;
    
    logic [15:0] temp2;

        
    spi_slave #(BITS_PER_PIXEL) spi_slave (
        reset_spi, spi_clk, spi_mosi, write_data, write_pixel_clk
    );

    always @ (posedge spi_ss, negedge write_pixel_clk) begin
        // On the rising edige of spi_ss, clear the address. This acts as a reset of sorts, such that if
        // the FPGA is programmed with the computer running, the screen will quickly get into a
        // known state.
        if (spi_ss == 1'b1) begin
            write_addr <= 12'b111111111111;
        end else begin
            write_addr <= write_addr + 12'b1;
        end
    end
    
    initial begin
        // Must be the 32bbp input image
        $readmemh("test-bars-16-64x64.txt", input_image);
        $display("%h",input_image[0]);
        // Wait for the intial state to be done
        #(period * 10);

        spi_ss = 1'b0;
        write_addr <= 12'b111111111111;
        write_en = 1'b1;



        // Feed the image in with SS set to 0
        for (write_pixel_count = 0; write_pixel_count < 64 * 64; write_pixel_count++) begin
            temp2 = input_image[write_pixel_count];
            for (write_bit_count = 0; write_bit_count < 32; write_bit_count++) begin
                #period;
                spi_clk= 1'b0;
                spi_mosi = input_image[write_pixel_count][31 - write_bit_count];
                #period;
                spi_clk= 1'b1;
            end
        end
        
        write_en = 1'b0;
        

        // Now flip the SS to 1; the reader side will be reading what we just wrote
        #period;
        spi_ss = 1'b1;
        #period;
        

        
        n_reset = 1'b1;
        reset_spi = 1'b1;
    end
    
    always begin : CLOCK_GEN 
            clk= 1'b1;
            #period;

            clk= 1'b0;
            #period;
    end

    logic [5:0] this_line_x = 6'b000000;
    logic [1:0] this_line_red[64];
    logic [1:0] this_line_green[64];
    logic [1:0] this_line_blue[64];

    // Pull in the individual rows into a local buffer (top and bottom at the same time)
    always @ (posedge hub75_clk) begin
        this_line_red[this_line_x] <= hub75_red;
        this_line_green[this_line_x] <= hub75_green;
        this_line_blue[this_line_x] <= hub75_blue;
        this_line_x <= this_line_x + 6'b000001;
    end

    logic [1:0] latched_line_red[64];
    logic [1:0] latched_line_green[64];
    logic [1:0] latched_line_blue[64];

    // Copy the current line into the latched line on the latched clock edge
    always @ (posedge clk) begin
        if (hub75_latch == 1'b1) begin
            for (integer x_count = 0; x_count < 64; x_count++) begin
                latched_line_red[x_count] <= this_line_red[x_count];
                latched_line_green[x_count] <= this_line_green[x_count];
                latched_line_blue[x_count] <= this_line_blue[x_count];
            end
        end
    end

    integer screen_red[64][64];
    integer screen_green[64][64];
    integer screen_blue[64][64];

    // Must init the screen memory as we add to it through the frame
    initial begin
        for (integer y_count = 0; y_count < 64; y_count++) begin
            for (integer x_count = 0; x_count < 64; x_count++) begin
                screen_red[x_count][y_count] = 0;
                screen_green[x_count][y_count] = 0;
                screen_blue[x_count][y_count] = 0;
            end
        end
    end

    always @ (posedge clk) begin
        if(n_reset)
            if (hub75_oe == 1'b0) begin
                // Sum up the intensities when the Output Enable input is asserted
                for (integer x_count = 0; x_count < 64; x_count++) begin
                    if (latched_line_red[x_count][0] == 1'b1) begin
                        screen_red[x_count][{1'b0, hub75_addr}] = screen_red[x_count][{1'b0, hub75_addr}] + 1;
                    end
                    if (latched_line_red[x_count][1] == 1'b1) begin
                        screen_red[x_count][{1'b1, hub75_addr}] = screen_red[x_count][{1'b1, hub75_addr}] + 1;
                    end
                    if (latched_line_green[x_count][0] == 1'b1) begin
                        screen_green[x_count][{1'b0, hub75_addr}] = screen_green[x_count][{1'b0, hub75_addr}] + 1;
                    end
                    if (latched_line_green[x_count][1] == 1'b1) begin
                        screen_green[x_count][{1'b1, hub75_addr}] = screen_green[x_count][{1'b1, hub75_addr}] + 1;
                    end
                    if (latched_line_blue[x_count][0] == 1'b1) begin
                        screen_blue[x_count][{1'b0, hub75_addr}] = screen_blue[x_count][{1'b0, hub75_addr}] + 1;
                    end
                    if (latched_line_blue[x_count][1] == 1'b1) begin
                        screen_blue[x_count][{1'b1, hub75_addr}] = screen_blue[x_count][{1'b1, hub75_addr}] + 1;
                    end
                end
        end
    end
    
    
    // Watch for the top addr bit going low, this indicates the end of the frame
    always @ (negedge hub75_addr[4]) begin  //this will trigger immediately by default for some reason so
        if(n_reset)
                for (integer y_count = 0; y_count < 64; y_count++) begin
                    for (integer x_count = 0; x_count < 64; x_count++) begin
                        // Output the RGB of each pixel in unscaled form, which will turn back into a BMP by scaling
                        // such that the maximum intensity of any pixels R, G or B will be 255
                        $display("%0d,%0d,%0d", screen_red[x_count][y_count], screen_green[x_count][y_count],
                            screen_blue[x_count][y_count]);
                    end
                end
                $finish();
    end
    
    
endmodule