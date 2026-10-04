module bit8_counter (
	input ena, clk, clear,
	output [7:0] count
);

	wire [6:0] w_a;
	wire [7:0] w_o;
	
	assign count = w_o;
	assign w_a[0] = ena & w_o[0];
	
	genvar i;
	generate 
		for (i = 0; i < 6; i = i + 1) begin: gen_fa
			assign w_a[i + 1] = w_a[i] & w_o[i + 1];
		end
	endgenerate
	
	T_ff t0 (.T(ena), .clk(clk), .clear(clear), .Qt(w_o[0]));
	T_ff t1 (.T(w_a[0]), .clk(clk), .clear(clear), .Qt(w_o[1]));
	T_ff t2 (.T(w_a[1]), .clk(clk), .clear(clear), .Qt(w_o[2]));
	T_ff t3 (.T(w_a[2]), .clk(clk), .clear(clear), .Qt(w_o[3]));
	T_ff t4 (.T(w_a[3]), .clk(clk), .clear(clear), .Qt(w_o[4]));
	T_ff t5 (.T(w_a[4]), .clk(clk), .clear(clear), .Qt(w_o[5]));
	T_ff t6 (.T(w_a[5]), .clk(clk), .clear(clear), .Qt(w_o[6]));
	T_ff t7 (.T(w_a[6]), .clk(clk), .clear(clear), .Qt(w_o[7]));
	
endmodule