`timescale 1ns/1ps

`define SPI_MODULE_COMMAND_LEN 3

`define SPI_STATUS_IDLE 'b000
`define SPI_STATUS_CYCLE_BITS 'b111

module spi_module
	#( parameter CPOL = 1'b0,
	parameter CPHA = 1'b0,
	parameter INVERT_DATA_ORDER = 1'b0,
	parameter SPI_MASTER = 1'b1,
	parameter SPI_WORD_LEN = 8  )

	( input logic master_clock,
	output logic SCLK_OUT,
	input logic SCLK_IN,
	output logic SS_OUT,
	input logic SS_IN,
	output logic OUTPUT_SIGNAL,
	output logic processing_word,
	input logic process_next_word,
	input logic [SPI_WORD_LEN - 1:0] data_word_send,
	input logic INPUT_SIGNAL,
	output logic [SPI_WORD_LEN - 1:0] data_word_recv,
	input logic do_reset,
	output logic is_ready );

	//Local logicisters and logics
	logic is_ready_logic;
	logic activate_ss;
	logic activate_sclk;
	
	logic status_ignore_first_edge;
	
	logic rising_sclk_edge;
	logic falling_sclk_edge;
	
	logic [SPI_WORD_LEN - 1:0] data_word_recv_logic;
	
	logic [SPI_WORD_LEN - 1:1] bit_counter;
	
	logic [`SPI_MODULE_COMMAND_LEN - 1:0]spi_status;

	assign is_ready = is_ready_logic;
	
	assign data_word_recv = data_word_recv_logic;
	
	assign processing_word = (spi_status == `SPI_STATUS_IDLE) ? 1'b0 : 1'b1;
	
	
	generate 
	
		if(SPI_MASTER) begin
		
			assign SCLK_OUT = (activate_sclk) ? SCLK_IN : (CPOL);
			assign SS_OUT = (activate_ss) ? 1'b0 : 1'b1;

		end
		
	endgenerate
	
	//Edge detector modules
	pos_edge_det spi_edge_pos( .sig(SCLK_IN), .clk(master_clock), .pe(rising_sclk_edge));
	neg_edge_det spi_edge_neg( .sig(SCLK_IN), .clk(master_clock), .ne(falling_sclk_edge));
	
	logic delay_pol;
	assign delay_pol =  (CPHA) ? ( (CPOL) ? (rising_sclk_edge) : (falling_sclk_edge)  ) : ( (CPOL) ? (SCLK_IN) : (!SCLK_IN) );	
	
	logic get_number_edge;
	assign get_number_edge = (CPHA) ? ( (CPOL) ? (rising_sclk_edge) : (falling_sclk_edge) ) : ( (CPOL) ? (falling_sclk_edge) : (rising_sclk_edge) );
	
	logic switch_number_edge;
	assign switch_number_edge = (CPHA) ? ( (CPOL) ? (falling_sclk_edge) : (rising_sclk_edge) ) : ( (CPOL) ? (rising_sclk_edge) : (falling_sclk_edge) );
	
	logic SS;
	assign SS = (SPI_MASTER) ? SS_OUT : SS_IN;
	
	assign OUTPUT_SIGNAL = (activate_ss) ? data_word_send[bit_counter] : 1'b0;
	
	always @(posedge master_clock) begin
	
		if (do_reset) begin
			//do reset stuff
			
			activate_ss <= 1'b0;
			
			activate_sclk <= 1'b0;
			
			bit_counter <= (INVERT_DATA_ORDER) ? (0) : (SPI_WORD_LEN - 1);
			
			status_ignore_first_edge <= 1'b0;
			
			spi_status <= `SPI_STATUS_IDLE;
			
			is_ready_logic <= 1'b1;
			
		end
		else begin		
				case(spi_status)
				
					`SPI_STATUS_IDLE: begin
						
						
						if(process_next_word && delay_pol) begin
							activate_ss <= 1'b1;
							spi_status <= `SPI_STATUS_CYCLE_BITS;	
                            status_ignore_first_edge <= 1'b0;
                            
                            
                            activate_sclk <= 1'b1;	


						end
						
					end

					`SPI_STATUS_CYCLE_BITS: begin
	
						if(!SS) begin
						
							if(get_number_edge) data_word_recv_logic[bit_counter] <= INPUT_SIGNAL;
	
							if(switch_number_edge) begin
						
								if(CPHA && !status_ignore_first_edge) status_ignore_first_edge <= 1'b1;
								else begin
								
									if(bit_counter ==  ((INVERT_DATA_ORDER) ? (SPI_WORD_LEN -1) : ('sd0)) ) begin //Word processed, reset
								
										activate_ss <= 1'b0;
										activate_sclk <= 1'b0;
										bit_counter <= (INVERT_DATA_ORDER) ? (0) : (SPI_WORD_LEN - 1);
										spi_status <= `SPI_STATUS_IDLE;
									
									end
									else bit_counter <= (INVERT_DATA_ORDER) ? (bit_counter + 1) : (bit_counter - 1);	
																	
								end
							end
						
						end
						
					end
								
				endcase
				
			end
		
	end
		
endmodule
	