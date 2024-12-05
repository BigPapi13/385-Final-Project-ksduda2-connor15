
// Parameters

module obb_reg
(
    output logic signed [7 : 0] width,
    output logic signed [7 : 0] height
);

logic signed [5 : 0] fixed_0;
logic signed [6 : 0] fixed_1;
logic signed [5 : 0] fixed_2;
logic signed [7 : 0] vec_0_x;
logic signed [7 : 0] vec_0_y;
logic signed [7 : 0] vec_1_x;
logic signed [7 : 0] vec_1_y;
logic signed [6 : 0] vec_2_x;
logic signed [6 : 0] vec_2_y;

always_comb begin
// $ c.assign(v1.Dot(v2))
logic signed [6 : 0] opnet_0;
opnet_0 = fixed_1 - 7'b1100100
fixed_0 = opnet_0 >> 2;
end

endmodule