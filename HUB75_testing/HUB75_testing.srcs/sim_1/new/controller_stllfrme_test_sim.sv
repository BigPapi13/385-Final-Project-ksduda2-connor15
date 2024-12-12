`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 12:44:01 PM
// Design Name: 
// Module Name: controller_stillframe_test
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


module controller_stllfrm_test_sim #(BITS_PER_PIXEL=16);

    logic clk;
    logic [1:0] hub75_red;
    logic [1:0] hub75_green;
    logic [1:0] hub75_blue;
    logic [4:0] hub75_addr;
    logic hub75_latch;
    logic hub75_clk;
    logic hub75_oe;
        localparam period = 1;
        
    always begin : CLOCK_GEN 
            clk= 1'b1;
            #period;

            clk= 1'b0;
            #period;
    end
    
    logic n_reset;


    logic buffer_toggle;
    logic user_led;
    
    logic [31:0] input_image [64 * 64];

    localparam BITS_PER_RGB = BITS_PER_PIXEL / 4;
        
    logic [BITS_PER_PIXEL-1:0] write_data;
    logic write_pixel_clk;
    logic [11:0] write_addr; // top bit is the double-buffer flipper and is provided by spi_ss
    logic write_en;
    logic reset_mem_initialization;
    
    logic mem_write_done;
    
    memory_initialization mem_start(
        .clk(clk),
        .input_image(input_image),
        .reset(reset_mem_initialization),        // runs while everything else is reset
        .write_addr(write_addr),
        .write_data(write_data),
        .write_en(write_en),
        .buffer_toggle(buffer_toggle),
        .done(mem_write_done),
        .write_pixel_clk(write_pixel_clk)
    );
    
            
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
        buffer_toggle,
        write_en
    );
    
    logic start_signal;
    
    logic halt;
    enum logic [5:0] {
        IDLE,
        START,
        START_1,
        RUN
    } startup_state, startup_state_nxt;
    
    always_ff @ (posedge clk)
	begin
	    if(halt) begin
	       startup_state <= IDLE;
	    end
	    else begin
            startup_state <= startup_state_nxt;
        end
	end
	
	
	always_comb
	begin
	   halt = 1'b1;        // halting by default
	   n_reset = 1'b0;     //default to reset
	   reset_mem_initialization = 1'b0;
	   case(startup_state)
	       IDLE: begin
	           if(start_signal) begin
	               startup_state_nxt = START;
	               halt = 1'b0;
	           end
	           else begin
	               startup_state_nxt = IDLE;
	           end
	       end
           START: begin
                halt = 1'b0;
                n_reset = 1'b1;
                reset_mem_initialization = 1'b1;
                
                startup_state_nxt = START_1;
           end
           START_1 : begin
                halt = 1'b0;
                n_reset = 1'b0;
                reset_mem_initialization = 1'b0;
                
                startup_state_nxt = RUN;
           end
           RUN : begin
                halt = 1'b0;
                n_reset = 1'b0;
                startup_state_nxt = RUN;
                reset_mem_initialization = 1'b0;
                
                if(mem_write_done) begin
                    n_reset = 1'b1;
                end
           end
       endcase
	   
	end
    
    
        
    initial begin
        // Must be the 32bbp input image
        start_signal = 1'b0;
        $readmemh("test-bars-16-64x64.txt", input_image);
        #2;
        start_signal = 1'b1;
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
        if(n_reset && startup_state==RUN) begin
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
    end



endmodule