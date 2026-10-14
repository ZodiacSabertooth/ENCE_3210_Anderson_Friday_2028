module array_multi #(
    parameter n = 4
)(
   input [n-1:0] a, b,
   output [2*n-1:0] prod
);

	wire [n-1:0] s_row [0:n-1];
   wire [n-1:0] c_o;

   assign s_row[0] = a & {n{b[0]}};
   assign c_o[0] = 1'b0;
   assign prod[0] = s_row[0][0];

   genvar i;
   generate
       for (i = 1; i < n; i = i + 1) begin: gen_p
           ripple_adder #(.WIDTH(n)) row 
			  (.A({c_o[i-1], s_row[i-1][n-1:1]}), .B(a & {n{b[i]}}), .C_i(1'b0), .Sum(s_row[i]), .C_o(c_o[i]));

           assign prod[i] = s_row[i][0];
       end
   endgenerate

   assign prod[2*n-1:n] = {c_o[n-1], s_row[n-1][n-1:1]};
endmodule