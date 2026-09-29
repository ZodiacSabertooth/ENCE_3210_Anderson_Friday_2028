module part4_circuit (
	input D, clk,
	output reg Qa, Qb, Qc
);

	
	
	always @(posedge clk) begin
		if (clk) begin
			Qb <= D;
		end
	end
	
	always @(negedge clk) begin
		if (clk) begin
			Qc <= D;
		end
	end
	
endmodule