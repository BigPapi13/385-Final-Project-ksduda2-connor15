`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 12:48:52 PM
// Design Name: 
// Module Name: memory_initialization
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


module memory_initialization #(parameter BITS_PER_PIXEL=16) (
    input logic clk,
    input logic [31:0] input_image [64 * 64],
    input logic reset,
    output logic [11:0] write_addr,
    output logic [BITS_PER_PIXEL-1:0] write_data,
    output logic write_en,
    output logic buffer_toggle,
    output logic done,
    output logic write_pixel_clk
    );
    
    logic spi_clk;
    logic spi_mosi;
    logic spi_miso;
    
    logic reset_spi;
    assign reset_spi = done;


    //for simulation test:
    integer write_buffer_count;
    integer write_pixel_count;
    integer write_bit_count;
    
    logic spi_clk_counter;
    
    /*
    logic [11:0] write_pixel_count;
    logic [4:0] write_bit_count;*/


    spi_slave #(BITS_PER_PIXEL) spi_slave (
        reset_spi, spi_clk, spi_mosi, write_data, write_pixel_clk
    );
    
    
     always @ (posedge buffer_toggle, negedge write_pixel_clk) begin
        // On the rising edige of spi_ss, clear the address. This acts as a reset of sorts, such that if
        // the FPGA is programmed with the computer running, the screen will quickly get into a
        // known state.
        if (buffer_toggle == 1'b1) begin
            write_addr <= 12'b111111111111;
        end else begin
            write_addr <= write_addr + 12'b1;
        end
    end
    
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            spi_clk <= 1'b0; // Reset spi_clk to a known state
            spi_clk_counter <= 1'b0;  // Reset the toggle logic
        end else begin
            spi_clk_counter <= ~spi_clk_counter; // Toggle every clock cycle
            if (spi_clk_counter) begin
                spi_clk <= ~spi_clk; // Toggle spi_clk every second cycle
            end
        end
    end
    
    
    /// SIMULATION TESTS
    /*
    initial begin
        done = 1'b0;
        #10;
        buffer_toggle = 1'b0;
        write_addr = 12'b111111111111;

       

        write_en = 1'b1;
        buffer_toggle = 1'b0;
        // Feed the image in with SS set to 0
        for (write_pixel_count = 0; write_pixel_count < 64 * 64; write_pixel_count++) begin
            for (write_bit_count = 0; write_bit_count < 32; write_bit_count++) begin
                #4;
                spi_mosi = input_image[write_pixel_count][31 - write_bit_count];
                #4;
            end
        end

        write_en = 1'b0;
        done = 1'b1;
        buffer_toggle = 1'b1;
        
    end
*/
    ////
    
    
    
    always_ff @ (posedge spi_clk, posedge reset)
	begin
		if (reset) begin

            write_en <= 1'b0;
            buffer_toggle <= 1'b1; // needs to be high at first to reset everything
            write_pixel_count <= 12'b0;
            write_bit_count  <= 5'b0;
            done <= 1'b0;
        end
		else begin
		
		    
		    if(buffer_toggle == 1'b1) begin
		    
		      buffer_toggle <= 1'b0; //start buffer toggle to 0 to begin writing.
		      
		      
		    end
                if(write_pixel_count == 12'd4095) begin        // very last pixel to count
                  //nothing we are done.
                  done <= 1'b1;
                  write_en <= 1'b0;
                  buffer_toggle <= 1'b1;
                end 
                else begin
                  write_en <= 1'b1;       // writing now
                
                  if(write_bit_count == 5'd31) begin           // very last bit to count
                      write_bit_count <= 5'b0;
                      write_pixel_count <= write_pixel_count + 1;
                  end
                  else begin
                      write_bit_count <= write_bit_count + 1;
                      spi_mosi <= input_image[write_pixel_count][31 - write_bit_count];
                  end

		    end
		end
		  
	end
	
    
    
    
    
    
    
    /*
    //BASIC DISPLAY TEST, NO LOADFILE//
    ////////////////////////
    //spi clk not actually used for spi in this context lol, just a slower clock for mem write
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            spi_clk <= 1'b0; // Reset spi_clk to a known state
            spi_clk_counter <= 1'b0;  // Reset the toggle logic
        end else begin
            spi_clk_counter <= ~spi_clk_counter; // Toggle every clock cycle
            if (spi_clk_counter) begin
                spi_clk <= ~spi_clk; // Toggle spi_clk every second cycle
            end
        end
    end
    
    logic [11:0] counter;
    
    assign write_pixel_clk = clk;
    
    always_ff @(posedge spi_clk or posedge reset) begin
        if (reset) begin
            write_en <=1'b0;
            write_addr <= 12'b0;
            write_data <= 16'b0;
            counter <= 12'b0;
            done <= 1'b0;
            buffer_toggle <= 1'b0;
        end else begin
            if(counter<12'd4095) begin
                write_en <= 1'b1;
                write_data <= counter*8;
                counter <= counter + 1;
                write_addr <= write_addr +1;
            end
            else begin
                done <= 1'b1;
                buffer_toggle <= 1'b1;
                write_en <= 1'b0;
            end
        end
    end
//////////////////////////////////
    */

endmodule
