`timescale 1ns/1ps

module neg_edge_det ( input logic sig,            // Input signal for which positive edge has to be detected
                      input logic clk,            // Input signal for clock
                      output logic ne);           // Output signal that gives a pulse when a positive edge occurs
 
    logic   sig_dly;                          // Internal signal to store the delayed version of signal
 
    // This always block ensures that sig_dly is exactly 1 clock behind sig
  always @ (posedge clk) begin
    sig_dly <= sig;
  end
 
    // Combinational logic where sig is AND with delayed, inverted version of sig
    // Assign statement assigns the evaluated expression in the RHS to the internal net pe
  assign ne = ~sig & sig_dly;            
endmodule 