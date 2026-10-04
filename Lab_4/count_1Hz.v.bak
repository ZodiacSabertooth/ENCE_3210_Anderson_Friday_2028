module count_1Hz (
	input i_clk, clear,
	output reg o_clk
);

	reg [25:0] count;
	
	always @(posedge i_clk) begin
		if(clear) begin
			o_clk <= 0;
		end else begin
			if (count == 26'd49_999_999) begin
				count <= 26'd0;
				o_clk <= 1;
			end else begin
				count <= count + 1;
				o_clk <= 0;
			end
		end
	end
	
endmodule
			
			