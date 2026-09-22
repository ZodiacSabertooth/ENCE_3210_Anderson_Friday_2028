//module Comparator(
//	input [3:0] v,
//	output z
//);
//
//	assign z = v[3]&v[1]|v[3]&v[2];
//
//endmodule

//Part IV
module Comparator(
	input [3:0] sum,
	input carry,
	output z
);

	assign z = carry | (sum[3] & sum[2]) | (sum[3] & sum[1]);
	
endmodule

