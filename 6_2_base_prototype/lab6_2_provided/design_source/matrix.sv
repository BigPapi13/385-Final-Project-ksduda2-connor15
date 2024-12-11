/* matrix.sv
 *  - Author: Kobe Duda
 *  - Descrption: Contains a set of matrix operation-related modules
 *
 *  - All matrices are stored in row-major order
 *
 *
 *
*/

module matrix_multiplier
#(
    parameter DATA_WIDTH = 16,
    parameter DECIMAL_BITS = 5
)
(
    input logic [DATA_WIDTH - 1:0] a [2][2],
    input logic [DATA_WIDTH - 1:0] b [2][2],
    
    output logic [DATA_WIDTH - 1:0] out [2][2]
);

always_comb begin
       // Compute products
       logic [(DATA_WIDTH * 2) - 1:0] p0000;
       logic [(DATA_WIDTH * 2) - 1:0] p0110;
       logic [(DATA_WIDTH * 2) - 1:0] p0001;
       logic [(DATA_WIDTH * 2) - 1:0] p0111;
       logic [(DATA_WIDTH * 2) - 1:0] p1000;
       logic [(DATA_WIDTH * 2) - 1:0] p1110;
       logic [(DATA_WIDTH * 2) - 1:0] p1001;
       logic [(DATA_WIDTH * 2) - 1:0] p1111;

       p0000 = a[0][0] * b[0][0];
       p0110 = a[0][1] * b[1][0];
       p0001 = a[0][0] * b[0][1];
       p0111 = a[0][1] * b[1][1];
       p1000 = a[1][0] * b[0][0];
       p1110 = a[1][1] * b[1][0];
       p1001 = a[1][0] * b[0][1];
       p1111 = a[1][1] * b[1][1];

       // Compute output using products (products are bit sliced because fixed point multiplication is icky)
       out[0][0] = p0000[DECIMAL_BITS +: DATA_WIDTH] + p0110[DECIMAL_BITS +: DATA_WIDTH];
       out[0][1] = p0001[DECIMAL_BITS +: DATA_WIDTH] + p0111[DECIMAL_BITS +: DATA_WIDTH];
       out[1][0] = p1000[DECIMAL_BITS +: DATA_WIDTH] + p1110[DECIMAL_BITS +: DATA_WIDTH];
       out[1][1] = p1001[DECIMAL_BITS +: DATA_WIDTH] + p1111[DECIMAL_BITS +: DATA_WIDTH];
end
endmodule

module vec_mat_multiplier
#(
    parameter DATA_WIDTH = 16,
    parameter DECIMAL_BITS = 5
)
(
    input logic [DATA_WIDTH - 1:0] mat [2][2],
    input logic [DATA_WIDTH - 1:0] vec [2],
    
    output logic [DATA_WIDTH - 1:0] out [2]
);

always_comb begin
       // Compute products
       logic [(DATA_WIDTH * 2) - 1:0] p00_0;
       logic [(DATA_WIDTH * 2) - 1:0] p01_1;
       logic [(DATA_WIDTH * 2) - 1:0] p10_0;
       logic [(DATA_WIDTH * 2) - 1:0] p11_1;

       p00_0 = mat[0][0] * vec[0];
       p01_1 = mat[0][1] * vec[1];
       p10_0 = mat[1][0] * vec[0];
       p11_1 = mat[1][1] * vec[1];

       // Compute output using products (products are bit sliced because fixed point multiplication is icky)
       out[0] = p00_0[DECIMAL_BITS +: DATA_WIDTH] + p01_1[DECIMAL_BITS +: DATA_WIDTH];
       out[1] = p10_0[DECIMAL_BITS +: DATA_WIDTH] + p11_1[DECIMAL_BITS +: DATA_WIDTH];
end
endmodule