module bit8_register #(
	parameter n = 8
)(
	input clk, rst_n,
	input [n - 1:0] d,
	output reg [n - 1:0] q
);

	always @(posedge clk or negedge rst_n) begin
		if (~rst_n) begin
			q <= {n{1'b0}};
		end else begin
			q <= d;
		end
	end

endmodule