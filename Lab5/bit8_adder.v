module bit8_adder (
	input [7:0] a, next_sum,
	output [7:0] sum,	
	output overflow
);
	wire c_o;
	assign {c_o, sum} = a + next_sum;
	
	assign overflow = (a[7] & next_sum[7] & ~sum[7]) | (~a[7] & ~next_sum[7] & sum[7]);

endmodule
	