module bit8_adder #(
	parameter WIDTH = 4
)(
	input [WIDTH-1:0] A, B, C_i,
	output [WIDTH-1:0] Sum, C_o
);
   wire [WIDTH:0] c;

   assign c[0] = C_i;
   assign C_o = c[WIDTH];
	
	genvar i;
	
	generate 
		for (i = 0; i < WIDTH; i = i + 1) begin: gen_fa
			assign Sum[i] = A[i] ^ B[i] ^ c[i];
			assign c[i+1] = (A[i] & B[i]) | (c[i] & ( A[i] ^ B[i]));
		end
	endgenerate
endmodule