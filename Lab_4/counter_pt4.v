module counter_pt4 (
	input CLK1_50, clear, 
	output reg [3:0] digit
);

	wire tick;
	count_1Hz c_1Hz(.i_clk(CLK1_50), .clear(clear), .o_clk(tick));

	always @(posedge CLK1_50) begin
		if (clear)
			digit <= 4'd0;
		else if (tick) begin
			if (digit == 4'd9)
				digit <= 4'd0;
			else
				digit <= digit + 1'b1;
		end
	end

endmodule