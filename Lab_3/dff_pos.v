module dff_pos (
	input D, clk,
	output reg Q
);

	always @(posedge clk) begin
		if (clk) begin
			Q <= D;
		end
	end
	
endmodule