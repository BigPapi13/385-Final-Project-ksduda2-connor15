module tb2;
    parameter BITS_PER_PIXEL = 16;

    logic buffer_toggle;
    logic write_clk;
    logic [11:0] write_addr;
    logic [BITS_PER_PIXEL-1:0] write_data;
    logic write_en;

    logic read_clk;
    logic [10:0] read_addr;
    logic [BITS_PER_PIXEL-1:0] read_data_top;
    logic [BITS_PER_PIXEL-1:0] read_data_bottom;
    logic read_en;

    integer i;
    logic [BITS_PER_PIXEL-1:0] input_image [64 * 64];

    localparam period = 1;
    
    logic clk;
    assign clk = (read_clk ^ write_clk);

    sync_pdp_ram #(BITS_PER_PIXEL) dut (
        buffer_toggle,
        clk,
        write_clk, write_addr, write_data, write_en,
        read_clk, read_addr, read_data_top, read_data_bottom, read_en
    );

    logic [20*8:0] test_bars_filename;

    initial begin
        buffer_toggle = 1'b0;
        write_clk = 1'b0;
        write_addr = 12'b0;
        write_data = {BITS_PER_PIXEL{1'b0}};
        write_en = 1'b0;
        read_clk = 1'b0;
        read_addr = 11'b0;
        read_en = 1'b0;

        $readmemh("test-bars-16-64x64.txt", input_image);

        write_en = 1;
        for (i = 0; i < 64 * 64; i++) begin
            #period;
            write_data = input_image[i];
            write_clk = 1'b0;

            #period
            write_clk = 1'b1;
            write_addr = write_addr + 1;
        end

        #period;
        buffer_toggle = 1'b1;
        write_en = 1'b0;
        read_en = 1'b1;

        for (i = 0; i < 64 * (64 / 2); i++) begin
            read_clk = 1'b1;
            #period;

            read_clk = 1'b0;
            $display("Read addr %d data_top: %x data_bottom: %x", read_addr, read_data_top, read_data_bottom);
            read_addr = read_addr + 11'b1;
            #period;
        end
    end
endmodule