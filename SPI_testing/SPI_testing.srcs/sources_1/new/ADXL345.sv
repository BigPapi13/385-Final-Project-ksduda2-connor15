`timescale 1ns/1ps

`define SPI_WORD_LEN 8

`define CLK_DIV_COMM 'sd2

`define TEST_BYTE_LED_ON 'sd7
`define TEST_BYTE_LED_OFF 'sd15

`define SPI_CLK_DIV 'sd4        // SPI CLCK should be limited to 5mhz for the ADXL345 according to the datasheet.

// define register addresses:
`define BW_RATE_ADDR 6'h2C
`define DATA_FORMAT_ADDR 6'h31
`define POWER_CTL_ADDR 6'h2D
`define FIFO_CTL_ADDR 6'h38
`define DATAX0_ADDR 6'h32
// DATAX1-Z1 is the next 5 addresses


// Potenitally replace DATA_OUT with a channel for each axis to always read that axis's data.

module ADXL345_com ( 
	input logic MASTER_CLK,        // base clock
	input logic reset,
	output logic SCLK_OUT,         // SIGNAL_CLOCK_OUT
	output logic SIGNAL_SS_OUT,
	output logic SIGNAL_DATA_OUT,     // high when Master output sdaata
	//input logic SCLK_IN,           // SIGNAL_CLOCK_IN, divided clock
	input logic SIGNAL_SS_IN,      // shouldnt matter, is master
	input logic SIGNAL_DATA_IN,    // High when master receives data
    output logic [`SPI_WORD_LEN - 1:0] data_mosi,
	input logic [`SPI_WORD_LEN - 1:0] data_miso,
	input logic cs,                // ADXL345 CS Pin
	output logic [`SPI_WORD_LEN - 1:0] DATA_OUT    // accelerometer read data

	);       
	
	logic reset_spi;
	logic spi_ready;

	logic proc_word;
	logic process_next_word;
	
    logic [`SPI_WORD_LEN - 1:0] recv_data;
    logic [`SPI_WORD_LEN - 1:0] send_data;
    
    logic [2:0] read_axis_counter;
		
	logic test_signal_control;
	assign TEST_SIGNAL_OUT = test_signal_control;
	
	logic reset_div;
	logic divider_ready;
	logic divided_master_clock; 
	
	//Clock divider module
	clock_divider #( .DIV_N(`SPI_CLK_DIV) )	clkdiv ( .clk_in(MASTER_CLK), .clk_out(divided_master_clock), .do_reset(reset_div), .is_ready(divider_ready) );
	
spi_module 
	#( .SPI_MASTER (1'b1), .CPOL(1'b1), .CPHA(1'b1))
	spi_master
	( .master_clock(MASTER_CLK),         // NOT divided 
	.SCLK_OUT(SCLK_OUT),                 // to pass to slave clock
  	.SCLK_IN(divided_master_clock),      // divided, for passing to slaves
  	.SS_OUT(SIGNAL_SS_OUT),
  	.SS_IN(),
	.OUTPUT_SIGNAL(SIGNAL_DATA_OUT),
	.processing_word(proc_word),         
	.process_next_word(process_next_word),
	.data_word_send(data_mosi),
	.INPUT_SIGNAL(SIGNAL_DATA_IN),
	.data_word_recv(data_miso),
	.do_reset(reset_spi),
	.is_ready(spi_ready) );
	
	/*
	   References: https://www.analog.com/media/en/technical-documentation/data-sheets/adxl345.pdf
	               https://github.com/libdriver/adxl345/blob/main/src/driver_adxl345.c
	               https://github.com/nagimov/adxl345spi/blob/master/adxl345spi.c
	   
	   
	   Notes:
	   
	   Has many registres for settings and readings on chip.
	   The way data is written and access is as follows:
	   1) The first bit indicates write(LOW) or read(HIGH)
	   2) The next bit is MB, this is for multi-byte reading and writing and for simplicity i will probability just set this to 0
	   3) The next 6 bits are the register address bits, and refer to the register to write or read (depending on bit 1)
	   4) This is the command byte, the next date byte (or bytes of MB is enabled) is for data,
	    and this either data read from the register on MISO or data written to the register on MOSI.
	    
	   So in essence every read/write is broken into 2 bytes (at least for what i plan on implementing)
	   
	   - Uses a FIFO system, this system contains 32 readings and can be configured in a couple of ways. The simplest and best way for this right now is to use the FIFO Stream mode, which 
	   stores the last 32 bits in the chips memory and when new measurements come in it overwrites the oldest measurements.
	   This FIFO System must be set in its register.
	   
	   Here is how I will design my flow of communication:
	   1) Set BW_RATE to 00001101, this samples at 800hz with low power mode off
	   2) Set DATA_FORMAT to 00000101 Disable Test bit, set SPI to 4 wire mode, Set device to 10 bit mode, Set left-justified mode, and g range to +/- 4gs
	   3) Set POWER_CTRL to 00001000  TO enable Measurement but disable any other power saving features.
	   4) Set FIFO_CTL to 10000000  To enable Stream mode for the FIFO, Overwrite old measurements in the 32 entry FIFO
	   5) To read value: Read from DATAX0 through DATAZ1 (data for each axis), 2 registers each          
	*/
	
   typedef enum logic [4:0] {
        RESET,
        CONFIG_BW_RATE_ADDRESS,
        CONFIG_BW_RATE_DATA,
        CONFIG_DATA_FORMAT_ADDRESS,
        CONFIG_DATA_FORMAT_DATA,
        CONFIG_POWER_CTL_ADDRESS,
        CONFIG_POWER_CTL_DATA,
        CONFIG_FIFO_CTL_ADDRESS,
        CONFIG_FIFO_CTL_DATA,
        READ_AXIS_DATA,
        DONE
    } state;
    
    state current_state, next_state;
    
    
    // Each instruction is seperated into 2 steps, send date to access the register, and the data that will be written to that register
    // (unless we are in the read stage)
    // TODO: Make this more efficient with a 2 step counter for the states that require 2 words to be sent
    always_comb begin
        
        next_state = current_state;

        case (current_state)
            RESET: begin
                if (!reset && divider_ready && spi_ready) begin
                    next_state = CONFIG_BW_RATE_ADDRESS;
                end
            end

            CONFIG_BW_RATE_ADDRESS: begin
                if (!proc_word && !process_next_word) begin
                    next_state = CONFIG_BW_RATE_DATA;
                end
            end
            CONFIG_BW_RATE_DATA: begin
                if (!proc_word && !process_next_word) begin
                    next_state = CONFIG_DATA_FORMAT_ADDRESS;
                end
            end

            CONFIG_DATA_FORMAT_ADDRESS: begin
                if (!proc_word && !process_next_word) begin
                    next_state = CONFIG_DATA_FORMAT_DATA;
                end
            end
            CONFIG_DATA_FORMAT_DATA: begin
                if (!proc_word && !process_next_word) begin
                    next_state = CONFIG_POWER_CTL_ADDRESS;
                end
            end            

            CONFIG_POWER_CTL_ADDRESS: begin
                if (!proc_word && !process_next_word) begin
                    next_state = CONFIG_POWER_CTL_DATA;
                end
            end
            CONFIG_POWER_CTL_DATA: begin
                if (!proc_word && !process_next_word) begin
                    next_state = CONFIG_FIFO_CTL_ADDRESS;
                end
            end

            CONFIG_FIFO_CTL_ADDRESS: begin
                if (!proc_word && !process_next_word) begin
                    next_state = CONFIG_FIFO_CTL_DATA;
                end
            end
            CONFIG_FIFO_CTL_DATA: begin
                if (!proc_word && !process_next_word) begin
                    //next_state = READ_AXIS_DATA;
                    $finish;
                end
            end
            
            
            //Setup done.

            READ_AXIS_DATA: begin
                if (!proc_word && !process_next_word) begin
                    if (read_axis_counter < 3'd6) begin          // iterate through all axis's
                        next_state = READ_AXIS_DATA;
                        read_axis_counter = read_axis_counter + 1;
                    end else begin
                        // loop back and keep reading data
                        next_state = READ_AXIS_DATA;
                        read_axis_counter = 0;
                    end
                end
            end

            DONE: begin
                // Maintain state or handle data
            end
        endcase
    end
    
    
    // keep note of this line for potential problems:
    // Originally this was desigend to update data_mosi sequentially at each state transition, but the problem was it would send the the last states output in the current state
    // now this will alawys just assign data_mosi to whatever send data will be, so essentially there is no difference between those two variables.
    assign data_mosi = send_data;      // always set data_mosi to whatever send_data is.
    
    // State Outputs
    always_comb begin
                
    send_data = 0;  //default to no data being sent.
    
    case (current_state)
            RESET: begin
                DATA_OUT = 1'b0;
            
                //do reset stuff
                
                reset_div = 1'b1;
                process_next_word = 1'b0;
                reset_spi = 1'b1;
                data_mosi = 'sd0;
            end

            CONFIG_BW_RATE_ADDRESS: begin
                send_data = {1'b0, 1'b0, `BW_RATE_ADDR};
            end
            CONFIG_BW_RATE_DATA: begin
                send_data = 8'b00001101;
            end

            CONFIG_DATA_FORMAT_ADDRESS: begin
               send_data = {1'b0, 1'b0, `DATA_FORMAT_ADDR};
            end
            CONFIG_DATA_FORMAT_DATA: begin
                send_data = 8'b00000101;
            end

            CONFIG_POWER_CTL_ADDRESS: begin
                send_data = {1'b0, 1'b0, `POWER_CTL_ADDR};
            end
            CONFIG_POWER_CTL_DATA: begin
                send_data = 8'b00001000;
            end

            CONFIG_FIFO_CTL_ADDRESS: begin
                send_data = {1'b0, 1'b0, `FIFO_CTL_ADDR};         
            end
            CONFIG_FIFO_CTL_DATA: begin
                send_data = 8'b10000000;
            end

            READ_AXIS_DATA: begin
                send_data = {1'b1, 1'b0, `DATAX0_ADDR + read_axis_counter};
            end

            DONE: begin
                // Maintain state or handle data
            end
        endcase
    end

    // Output data
    always_ff @(posedge MASTER_CLK) begin
    
        // will not be able to enter the FSM till reset signal is sent.
        if(reset)
            current_state <= RESET;
        else begin
            current_state <= next_state;
        end
            
        //default behavior for all control signals unless the FSM is in reset state, in which these values will be overriden.
         if (divider_ready) begin
            reset_div <= 1'b0;
            if(spi_ready) begin
                reset_spi <= 1'b0;
                if (!proc_word) begin
                    if (!process_next_word) begin
                        // Load the next word to send
                        //data_mosi <= send_data;   // NOTE: MOVED this into combinational section because otherwise the data_msoi being sent will always be the data from the last state.
                    end
                    process_next_word <= 1'b1;
                end 
                else if (proc_word && process_next_word) begin
                    process_next_word <= 1'b0;
                    recv_data <= data_miso;
                end
            end
        end
            
        if (current_state == READ_AXIS_DATA && proc_word && process_next_word) begin
            DATA_OUT <= recv_data;
        end
    end

	
endmodule