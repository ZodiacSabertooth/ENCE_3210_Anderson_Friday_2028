module mux_8_1 (
    input  [2:0] s,
    input        in0, in1, in2, in3, in4, in5, in6, in7,
    output       m
);

	 wire w0, w1, w2, w3;
	 wire low, high;
	 
	 mux_2_1 m0 (.s(s[0]), .x(in0), .y(in1), .m(w0));
    mux_2_1 m1 (.s(s[0]), .x(in2), .y(in3), .m(w1));
    mux_2_1 m2 (.s(s[0]), .x(in4), .y(in5), .m(w2));
    mux_2_1 m3 (.s(s[0]), .x(in6), .y(in7), .m(w3));
	 
	 mux_2_1 m4 (.s(s[1]), .x(w0), .y(w1), .m(w_low));
    mux_2_1 m5 (.s(s[1]), .x(w2), .y(w3), .m(w_high));
	 
	 mux_2_1 m6 (.s(s[2]), .x(w_low), .y(w_high), .m(m));
	 
endmodule