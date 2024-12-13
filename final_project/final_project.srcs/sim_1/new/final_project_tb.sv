`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 09:46:52 AM
// Design Name: 
// Module Name: final_project_tb
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


module final_project_tb(
    );
    
    logic clk;
    
    logic [1:0] hub75_red;
    logic [1:0] hub75_green;
    logic [1:0] hub75_blue;
    logic [4:0] hub75_addr;
    logic hub75_latch;
    logic hub75_clk;
    logic hub75_oe;
    
    logic display_frame_done;
    logic master_reset;
    
    logic start_signal;
    
    always begin : CLOCK_GEN 
            clk= 1'b1;
            #1;

            clk= 1'b0;
            #1;
            
    end
    
    
    final_project_top final_project(
        .clk(clk),
        .hub75_red(hub75_red),
        .hub75_green(hub75_green),
        .hub75_blue(hub75_blue),
        .hub75_addr(hub75_addr),
        .hub75_latch(hub75_latch),
        .hub75_clk(hub75_clk),
        .hub75_oe(hub75_oe),
        .start_signal(start_signal)
    );
    
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
        if(~master_reset)
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

    
    integer counter;
    // for simulation:
    initial begin
        counter = 0;
                    #10;
            start_signal = 1'b1;
            #500000;
            start_signal = 1'b0;
    end
    
    
    always @ (posedge display_frame_done) begin
        if(counter>20) begin
            for (integer y_count = 0; y_count < 64; y_count++) begin
                for (integer x_count = 0; x_count < 64; x_count++) begin
                    // Output the RGB of each pixel in unscaled form, which will turn back into a BMP by scaling
                    // such that the maximum intensity of any pixels R, G or B will be 255
                    $display("%0d,%0d,%0d", screen_red[x_count][y_count], screen_green[x_count][y_count],
                        screen_blue[x_count][y_count]);
                end
            end
            //$finish();
        end
        counter <= counter+1;
        
        end
    
    
endmodule
