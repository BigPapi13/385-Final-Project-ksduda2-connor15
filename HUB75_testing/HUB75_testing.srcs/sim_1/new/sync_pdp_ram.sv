`timescale 1ns / 1ps

module sync_pdp_ram #(parameter BITS_PER_PIXEL=0)
    (
        input logic                       buffer_toggle,
        input logic                       master_clk,
        input logic                       write_clk,
        input logic [11:0]                write_addr,
        input logic [BITS_PER_PIXEL-1:0]  write_data,
        input logic                       write_en,
        input logic                       read_clk,
        input logic [10:0]                 read_addr,
        output logic [BITS_PER_PIXEL-1:0] read_data_top,
        output logic [BITS_PER_PIXEL-1:0] read_data_bottom,
        input  logic                      read_en
    );

    //logic [BITS_PER_PIXEL-1:0] mem_top [64*32*2];   // half the display *2 for 2 frames
    //logic [BITS_PER_PIXEL-1:0] mem_bottom [64*32*2]; // half the display *2 for 2 frames
    logic [BITS_PER_PIXEL-1:0] tmp_data_top;
    logic [BITS_PER_PIXEL-1:0] tmp_data_bottom;
    
    logic [11:0] addr_top;
    logic [11:0] addr_bottom;
    
    logic write_en_top;
    logic write_en_bottom;
    
    logic ena;
    
    assign write_en_top = (write_en & ~write_addr[11]);
    assign write_en_bottom = (write_en & write_addr[11]);
    

    display_buffer_bram buffer_top(
        .clka(master_clk),
        .addra(addr_top),
        .wea(write_en_top),
        .ena(1'b1),             // CHEKC IF THIS NEEDS CHANGING
        .dina(write_data),
        .douta(tmp_data_top),
        .rsta(1'b0)
    );
    
    display_buffer_bram buffer_bottom(
        .clka(master_clk),
        .addra(addr_bottom),
        .wea(write_en_bottom),
        .ena(1'b1),             // CHEKC IF THIS NEEDS CHANGING
        .dina(write_data),
        .douta(tmp_data_bottom),
        .rsta(1'b0)
    );

    
    /*
    always @ (posedge write_clk) begin
        if (write_en) begin
            if (write_addr[11] == 1'b0)
                mem_top[{buffer_toggle, write_addr[10:0]}] <= write_data;
            else
                mem_bottom[{buffer_toggle, write_addr[10:0]}] <= write_data;
        end
    end

    always @ (posedge read_clk) begin
       if (read_en) begin
            tmp_data_top <= mem_top[{~buffer_toggle, read_addr}];
            tmp_data_bottom <= mem_bottom[{~buffer_toggle, read_addr}];
       end
    end*/
    
/*
    always @ (posedge (write_clk | read_clk)) begin
        if (write_en) begin
            if (write_addr[11] == 1'b0) begin
                addr_top <= {buffer_toggle, write_addr[10:0]};
            end
            else begin
                addr_bottom <= {buffer_toggle, write_addr[10:0]};
            end
        end
        else if (read_en) begin
            addr_top <= {~buffer_toggle, read_addr};
            addr_bottom <= {~buffer_toggle, read_addr};
       end
    end*/
    
    always @ (posedge ((write_clk & write_en) | (read_clk & read_en))) begin
        if (write_en) begin
            if (write_addr[11] == 1'b0) begin
                addr_top <= {buffer_toggle, write_addr[10:0]};
            end
            else begin
                addr_bottom <= {buffer_toggle, write_addr[10:0]};
            end
        end
        if (read_en) begin
            addr_top <= {~buffer_toggle, read_addr};
            addr_bottom <= {~buffer_toggle, read_addr};
       end
    end
    
    

    // will only output values when read_en is on.
    assign read_data_top = read_en ? tmp_data_top : {BITS_PER_PIXEL{1'b1}};
    assign read_data_bottom = read_en ? tmp_data_bottom : {BITS_PER_PIXEL{1'b1}};
endmodule