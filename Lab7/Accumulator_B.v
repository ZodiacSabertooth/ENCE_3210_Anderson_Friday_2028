
`default_nettype none

module Accumulator_B #
(
	parameter N = 4
)
(
	input MainClock,
	input ClearB,
	input LatchB,
	input [N-1:0] B,
	output reg [N-1:0] AluB
);

	always @(posedge MainClock) begin
		if (ClearB) begin
			AluB <= {N{1'b0}};
		end
		else begin
			if (LatchB) begin
				AluB <= B;
			end
		end
	end
	
endmodule

`default_nettype wire
