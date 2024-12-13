`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 09:20:36 AM
// Design Name: 
// Module Name: final_project_top
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


module final_project_top(
        input logic clk,
        input logic start_signal,
        
        output logic [1:0] hub75_red,
        output logic [1:0] hub75_green,
        output logic [1:0] hub75_blue,
        output logic [4:0] hub75_addr,
        output logic hub75_latch,
        output logic hub75_clk,
        output logic hub75_oe,
        
        input logic miso,
	       output logic sclk,
	       output logic ss,
       output logic mosi
    );
    
    
    logic [5:0] write_x;
    logic [5:0] write_y;
    logic [11:0] write_data;
    logic display_frame_done;
    logic master_reset;
    
    logic display_frame_done;
    logic display_frame_done_modified;
    
    logic divided_master_clock;
    logic divder_ready;
    logic [15:0] data_word_send;
	logic [15:0] accelerometer_data;
	logic reset_div;
	logic divider_ready;
	logic [15:0] data_word_recv;
		logic [15:0] x;
    	logic [15:0] y;
	logic [15:0] z;
		logic master_ready;

    
    clock_divider #( .DIV_N(2) )	clkdiv ( .clk_in(clk), .clk_out(divided_master_clock), .do_reset(master_reset), .is_ready(divider_ready) );

    
    // Accelerometer:

    ADXL345_com accelerometer_master(
    .MASTER_CLK(clk),
    .reset(master_reset),
    .SIGNAL_SS_IN(),
    .SCLK_OUT(sclk),
    .SIGNAL_SS_OUT(ss),
    .mosi(mosi),
    .miso(miso),
    .data_word_recv(data_word_recv),
    .data_word_send(data_word_send),
    .spi_ready(master_ready),
    .DATA_STREAM(accelerometer_data),
    .DATAX(x),
    .DATAY(y),
    .DATAZ(z)
        );
        
    // Control logic for display_frame_done_modified
    always_ff @(posedge clk) begin
        if (start_signal) begin
            master_reset <= 1'b1;
        end
        else begin
            master_reset <= 1'b0;
        end
    end
    

        
    // Manage rigid body simulations //
    simulation_top sim (
        .Clk(divided_master_clock),
        .reset_rtl_0(master_reset),
        .drawX(write_x),
        .drawY(write_y),
        .frame_done(display_frame_done),
        .write_data(write_data),
        .x(x)
    );
    
    // Manage display framebuffer //
    frame_manager fm(
        .clk(clk),
        .start_signal(~master_reset),
        .write_data(write_data),
        .display_frame_done(display_frame_done),
        .write_x(write_x),
        .write_y(write_y),
        .hub75_red(hub75_red),
        .hub75_green(hub75_green),
        .hub75_blue(hub75_blue),
        .hub75_addr(hub75_addr),
        .hub75_latch(hub75_latch),
        .hub75_clk(hub75_clk),
        .hub75_oe(hub75_oe)
    );
    
    
    //////////////////// FSM Control logic ////////////////////////////////////
    /*
    logic reset;

    enum logic [5:0] {
        RESET,
        RUN
    } state, next_state;
    always_ff @ (posedge clk) begin
        if(reset) begin
            state <= RESET;
        end
        else begin
            state <= next_state;
        end
    end
    // STATE TRANSITIONS
    always_comb begin
        //automatically start in reset mode
        reset = 1'b1;
        case(state)
            RESET: begin
                // automatically run when reset is active
                next_state = RUN;
                reset = 1'b0;
            end
            RUN : begin
                // run forever
                next_state = RUN;
                reset = 1'b0;
            end
        endcase
        
    end
    // STATE OUTPUTS
    always_comb begin        
        case(state)
            RESET: begin
                master_reset = 1'b1;
            end
            RUN : begin
                master_reset = 1'b0;
            end
        endcase
        
    end*/
    //////////////////////////////////////////////////////////
    
    
    
endmodule
