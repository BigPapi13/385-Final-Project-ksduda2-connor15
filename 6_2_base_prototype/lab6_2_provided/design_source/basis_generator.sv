

module basis_generator
(
    input logic signed [9 : 0] angle,
    output logic signed [15 : 0] u [1 : 0],
    output logic signed [15 : 0] v [1 : 0]
);

always_comb begin
logic signed [15 : 0] cos_0;
cos cos_inst_0(.theta(angle), .out(cos_0));
assign u[0] = cos_0;
logic signed [15 : 0] cos_0;
sin sin_inst_0(.theta(angle), .out(cos_0));
assign u[1] = cos_0;
logic signed [15 : 0] opnet_0;
assign opnet_0 = u[1] * 2'b11;
assign v[0] = opnet_0;
assign v[1] = u[0];

end

endmodule