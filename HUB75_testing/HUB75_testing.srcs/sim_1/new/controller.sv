`timescale 1ns / 1ps

module controller #(parameter BITS_PER_PIXEL=0)
    (
        input logic n_reset,
        input logic clk,
        output logic [1:0] hub75_red,
        output logic [1:0] hub75_green,
        output logic [1:0] hub75_blue,
        output logic [4:0] hub75_addr,
        output logic hub75_clk,
        output logic hub75_latch,
        output logic hub75_oe,
        output logic user_led,
        input logic write_pixel_clk, 
        input logic [11:0] write_addr,
        input logic [BITS_PER_PIXEL-1:0] write_data,
        input logic buffer_toggle,
        input logic write_en
    );
    

    localparam BITS_PER_RGB = BITS_PER_PIXEL / 4;
    logic reset;
    assign reset = ~n_reset;
    logic [1:0] clk_counter;
    always @ (posedge clk) begin
        if(reset == 1'b1) begin
            clk_counter <= 2'b0;
        end
        else begin
            clk_counter <= clk_counter + 2'b01;
        end
    end
    // 12.5MHz on my board
    logic slow_clk;
    assign slow_clk = clk_counter[1];
    

    logic [4:0] row_addr;
    logic [9:0] column_addr;
    logic [10:0] read_addr;
    assign read_addr = { row_addr, column_addr[5:0] };
    logic [BITS_PER_PIXEL-1:0] read_data_top;
    logic [BITS_PER_PIXEL-1:0] read_data_bottom;
    logic read_en;
    
    sync_pdp_ram #(BITS_PER_PIXEL) sync_pdp_ram (
        buffer_toggle,
        clk,
        write_pixel_clk, write_addr, write_data, write_en,
        slow_clk, read_addr, read_data_top, read_data_bottom, read_en
    );

    localparam
        READ_STATE_PIXELS = 0,
        READ_STATE_SET_LATCH_DELAY = 1,
        READ_STATE_SET_LATCH = 2,
        READ_STATE_OE_STROBE = 3,
        READ_STATE_END_OF_ROW = 4,
        READ_STATE_NEXT_LINE = 5;
    integer read_state = READ_STATE_PIXELS;

    logic run_hub75_clk;
    integer bit_count;
    logic [9:0] oe_strobe_column_addr;
    always @ (posedge reset, negedge slow_clk) begin
        if (reset == 1'b1) begin
            oe_strobe_column_addr <= 10'b0000000000;
            row_addr <= 5'h0;
            column_addr <= 10'b0000000000;
            run_hub75_clk <= 1'b0;
            hub75_red <= 2'b00;
            hub75_green <= 2'b00;
            hub75_blue <= 2'b00;
            hub75_latch <= 1'b0;
            hub75_oe <= 1'b1;
            row_addr <= 4'b0000;
            bit_count <= 0;
            column_addr <= 10'b0000000000;
            oe_strobe_column_addr <= 10'b0000011111;
            read_state <= READ_STATE_PIXELS;
            read_en <= 1'b0;
        end else begin
            read_en <= 1'b1;
            case (read_state)
                READ_STATE_PIXELS: begin
                    run_hub75_clk <= 1'b1;
                    
                    hub75_red <= {
                        read_data_bottom[BITS_PER_RGB*3 + bit_count],
                        read_data_top[BITS_PER_RGB*3 + bit_count]
                    };
                    hub75_green <= {
                        read_data_bottom[BITS_PER_RGB*2 + bit_count],
                        read_data_top[BITS_PER_RGB*2 + bit_count]
                    };
                    hub75_blue <= {
                        read_data_bottom[BITS_PER_RGB*1 + bit_count],
                        read_data_top[BITS_PER_RGB*1 + bit_count]
                    };

                    column_addr <= column_addr + 10'b0000000001;
                    if (column_addr == 10'b0000111111) begin
                        read_state <= READ_STATE_SET_LATCH_DELAY;
                    end
                end

                READ_STATE_SET_LATCH_DELAY: begin
                    run_hub75_clk <= 1'b0;
                    read_state <= READ_STATE_SET_LATCH;
                end

                READ_STATE_SET_LATCH: begin
                    hub75_latch <= 1'b1;
                    column_addr <= 10'b0000000000;
                    read_state <= READ_STATE_OE_STROBE;
                end

                READ_STATE_OE_STROBE: begin
                    hub75_latch <= 1'b0;
                    hub75_oe <= 1'b0;
                    column_addr <= column_addr + 10'b0000000001;
                    if (column_addr == oe_strobe_column_addr) begin
                        hub75_oe <= 1'b1;
                        read_state <= READ_STATE_END_OF_ROW;
                    end
                end

                READ_STATE_END_OF_ROW: begin
                    bit_count <= bit_count + 1;
                    oe_strobe_column_addr <= { oe_strobe_column_addr[8:0], 1'b1 };
                    if (bit_count == BITS_PER_RGB - 1) begin
                        bit_count <= 0;
                        oe_strobe_column_addr <= 10'b0000011111;
                        row_addr <= row_addr + 5'h1;
                    end
                    read_state <= READ_STATE_NEXT_LINE;
                end

                READ_STATE_NEXT_LINE: begin
                    column_addr <= 10'b0000000000;
                    read_state <= READ_STATE_PIXELS;
                end
            endcase
        end
    end

    logic _unused_ok = &{1'b0,
        read_data_bottom[3:0],
        read_data_top[3:0],
        1'b0};

    assign hub75_addr = row_addr;
    assign hub75_clk = run_hub75_clk ? slow_clk : 1'b0;
    // We could one day use this to indicate something  back to the computer
    assign spi_miso = 1'b0;

    // So the LED can be used to show that the FPGA has a design loaded
    logic [23:0] counter = 24'h000000;
    always @ (posedge slow_clk) begin
        counter <= counter + 1;
    end
    assign user_led = counter[23];
endmodule