module bit8_arithmatic (
	input add_sub,
	input [7:0] a, next_val,
	output reg [7:0] val,	
	output reg overflow
);

	always @(*) begin
		if (add_sub) begin
			val = next_val - a;
			overflow = (a[7] & ~next_val[7] & val[7]) | (~a[7] & next_val[7] & ~val[7]);
		end else begin
			val = next_val + a;
			overflow = (a[7] & next_val[7] & ~val[7]) | (~a[7] & ~next_val[7] & val[7]);
		end
	end
endmodule
