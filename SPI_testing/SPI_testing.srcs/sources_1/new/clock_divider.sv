`timescale 1ns/1ps

module clock_divider #( parameter DIV_N = 'd4 ) ( input logic clk_in, output logic clk_out, input logic do_reset, output logic is_ready );
 
	logic [DIV_N-1:0] divcounter;
 
	always @(posedge clk_in)
		if(do_reset) begin
			divcounter <= 32'b0;
			is_ready <= 1'b1;
		end
		else divcounter <= divcounter + 'd1;
 
	assign clk_out = divcounter[DIV_N-1];

endmodule