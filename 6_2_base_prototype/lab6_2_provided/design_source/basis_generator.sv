

module basis_generator
(
    input logic signed [9 : 0] angle,
    output logic signed [15 : 0] u_x, output logic signed [15 : 0] u_y,
    output logic signed [15 : 0] v_x, output logic signed [15 : 0] v_y
);

always_comb begin
logic signed [15 : 0] cos_0;
cos cos_inst_0(.theta(angle), .out(cos_0));
u_x = cos_0;
logic signed [15 : 0] sin_0;
sin sin_inst_0(.theta(angle), .out(sin_0));
u_y = sin_0;
opnet_0 = ~(u_y) + 1'b1;

v_x = opnet_0;
v_y = u_x;

end
logic signed [15 : 0] opnet_0;

endmodule