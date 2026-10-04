module bit4_counter (
	input ena, clk, clear,
	output [3:0] count
);

	wire [2:0] w_a;
	wire [3:0] w_o;
	assign count = w_o;

	assign w_a[0] = ena & w_o[0];
	assign w_a[1] = w_a[0] & w_o[1];
	assign w_a[2] = w_a[1] & w_o[2];

	T_ff t0 (.T(ena),    .clk(clk), .clear(clear), .Qt(w_o[0]));
	T_ff t1 (.T(w_a[0]), .clk(clk), .clear(clear), .Qt(w_o[1]));
	T_ff t2 (.T(w_a[1]), .clk(clk), .clear(clear), .Qt(w_o[2]));
	T_ff t3 (.T(w_a[2]), .clk(clk), .clear(clear), .Qt(w_o[3]));

endmodule