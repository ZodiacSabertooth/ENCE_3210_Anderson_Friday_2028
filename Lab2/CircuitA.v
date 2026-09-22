//module CircuitA(
//	input [2:0] v,
//	output [2:0] out
//);
//
//	assign out[2] = v[2]&v[1];
//	assign out[1] = ~v[1];
//	assign out[0] = v[0];
//
//endmodule

//Part IV
module CircuitA(
	input [3:0] sum,
	input carry,
	output [3:0] a_out
);
	
	 assign a_out[0] = sum[0];
    assign a_out[1] = ~sum[1];
    assign a_out[2] = (carry & ~sum[1]) | (sum[1] & sum[2] & sum[3]);
    assign a_out[3] = carry & sum[1];
endmodule