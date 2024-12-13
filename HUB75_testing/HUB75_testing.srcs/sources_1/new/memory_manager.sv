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


module memory_manager #(parameter BITS_PER_PIXEL=16) (
    input logic clk,
    input logic reset,
    output logic [11:0] write_addr,
    output logic write_en,
    output logic buffer_toggle,
    output logic write_pixel_clk,
    output logic [5:0] write_x,   // coordinates currently being written
    output logic [5:0] write_y,    // coordinates currently being written
    output logic write_done
    );

    
    // we no longer have to write bit by bit because all data is expected to be available every pixel clock unlike the previous test which had to iterate through all the bits of the word
    logic write_pixel_clk_counter;
    
    
    logic [11:0] write_pixel_count;
    
        
    assign write_x = write_pixel_count[5:0];  // col
    assign write_y = write_pixel_count[11:6];   // row
    
    
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
            write_pixel_clk <= 1'b0; // Reset spi_clk to a known state
            write_pixel_clk_counter <= 1'b0;  // Reset the toggle logic
        end else begin
            write_pixel_clk_counter <= ~write_pixel_clk_counter; // Toggle every clock cycle
            if (write_pixel_clk_counter) begin
                write_pixel_clk <= ~write_pixel_clk; // Toggle spi_clk every second cycle
            end
        end
    end
    
    
    always_ff @ (posedge write_pixel_clk, posedge reset)
	begin
		if (reset) begin
            write_done <= 1'b0;
            write_en <= 1'b0;
            buffer_toggle <= 1'b1; // needs to be high at first to reset everything
            write_pixel_count <= 12'b0;
        end
		else begin
		
		    
		    if(buffer_toggle == 1'b1) begin
		    
		      buffer_toggle <= 1'b0; //start buffer toggle to 0 to begin writing.
		      
		      
		    end
                if(write_pixel_count == 12'd4095) begin        // very last pixel to count
                      // frame done
                      write_en <= 1'b0;
                      buffer_toggle <= 1'b1;
                      write_pixel_count <= 12'd0;
                      write_done <= 1'b1;       // signal up that the frame is done writing, next thing that will happen is we will get reset and wait for the next frame.
                end 
                else begin
                    write_en <= 1'b1;       // writing now
                    write_pixel_count <= write_pixel_count + 1;
                    
		    end
		end
		  
	end
	
endmodule
