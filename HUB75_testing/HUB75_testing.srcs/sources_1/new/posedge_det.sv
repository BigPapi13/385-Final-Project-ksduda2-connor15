`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 02:47:06 PM
// Design Name: 
// Module Name: posedge_det
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


module posedge_det (
    input  logic clk,       // Clock signal
    input  logic signal_in, // Input signal to monitor
    output logic pulse_out  // Output pulse on positive edge
);

    logic signal_delayed;

    always_ff @(posedge clk) begin
        signal_delayed <= signal_in; // Store the previous value of the input signal
    end

    assign pulse_out = signal_in & ~signal_delayed; // Detect rising edge

endmodule
