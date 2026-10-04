module bit24_rotary(
	input CLK1_50, clear, ena,
	output reg [23:0] o_pattern
);

	localparam [23:0] init_pattern = {3'b100, 3'b100, 3'b100, 3'b000, 3'b001, 3'b010, 3'b010, 3'b011};
	
	wire tick;
	count_1Hz c_1Hz(.i_clk(CLK1_50), .clear(clear), .o_clk(tick));
	
	always @(posedge CLK1_50) begin
		if(clear) begin
			o_pattern <= init_pattern;
		end else if (tick && ena) begin
			o_pattern <= {o_pattern[20:0], o_pattern[23:21]};
		end
	end
	
endmodule
		
	
	