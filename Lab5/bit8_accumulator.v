module bit8_accumulator (
	input clk, rst_n, add_sub,
	input [7:0] a,
	output [7:0] val,
	output overflow
);

	//Part I & II
	wire [7:0] r1_o, r2_o, arith_o;
	wire ovf_o;
	
	bit8_register #(.n(8)) a_reg (.clk(clk), .rst_n(rst_n), .d(a), .q(r1_o));
//	//Part I
//	bit8_adder add (.a(r1_o), .next_sum(r2_o), .sum(arith_o), .overflow(ovf_o));
	//Part II
	bit8_arithmatic arith (.add_sub(add_sub), .a(r1_o), .next_val(r2_o), .val(arith_o), .overflow(ovf_o));
	bit8_register #(.n(8)) s_reg (.clk(clk), .rst_n(rst_n), .d(arith_o), .q(r2_o));
	
	bit8_register #(.n(1)) orf_dff (.clk(clk), .rst_n(rst_n), .d(ovf_o), .q(overflow));
	
	assign val = r2_o;

endmodule
	
	
	