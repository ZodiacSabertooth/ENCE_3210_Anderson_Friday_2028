module d_latch(
	input D, clk,
	output reg Q
);

//	wire R_g, S_g, Qa, Qb /* synthesis keep */ ;
//	nand (S_g, D, clk);
//	nand (R_g, ~D, clk);
//	nand (Qa, S_g, Qb);
//	nand (Qb, R_g, Qa);
//	assign Q = Qa;
	
	//Part IV
	always @(D, clk) begin
		if (clk) begin
			Q <= D;
		end
	end	

endmodule