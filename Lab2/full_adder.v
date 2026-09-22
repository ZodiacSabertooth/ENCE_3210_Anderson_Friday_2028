module full_adder(
	 input a, b, c_i,
	 output s, c_o
);

	 wire ab_xor;
	 
	 assign ab_xor = a ^ b;
	 assign s = ab_xor ^ c_i;
	 
	 mux_2_1 mux (.s(ab_xor), .x(b), .y(c_i), .m(c_o));
	 
endmodule