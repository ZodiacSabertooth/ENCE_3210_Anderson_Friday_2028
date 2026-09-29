module d_ff (
	input d, clk,
	output q
);
	
	wire q_m;
	
	d_latch lead (.D(d), .clk(~clk), .Q(q_m));
	d_latch tail (.D(q_m), .clk(clk), .Q(q));
	
endmodule