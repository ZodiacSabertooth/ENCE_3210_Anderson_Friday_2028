module rip_carry_adder_4bit (
	 input [3:0] a, b,
	 input c_i,
	 output [3:0] s,
	 output c_o
);

	 wire c1, c2, c3;
	 full_adder fa0 (.a(a[0]), .b(b[0]), .c_i(c_i), .s(s[0]), .c_o(c1));
	 full_adder fa1 (.a(a[1]), .b(b[1]), .c_i(c1), .s(s[1]), .c_o(c2));
	 full_adder fa2 (.a(a[2]), .b(b[2]), .c_i(c2), .s(s[2]), .c_o(c3));
	 full_adder fa3 (.a(a[3]), .b(b[3]), .c_i(c3), .s(s[3]), .c_o(c_o));
	 
endmodule