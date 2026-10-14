module reg_multi #(
	parameter n = 8
)(
   input clk,
   input [n-1:0] a, b,
   output reg [2*n-1:0] P
);
	
	reg [n-1:0] a_r, b_r;
	wire [2*n-1:0] prod;
	
	array_multi #(.n(n)) multi
	(.a(a_r), .b(b_r), .prod(prod));
	
	always @(posedge clk) begin
		a_r <= a;
		b_r <= b;
		P <= prod;
	end
endmodule 