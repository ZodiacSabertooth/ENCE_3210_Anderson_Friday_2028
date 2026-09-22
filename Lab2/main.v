module main(
	input [9:0] SW,
	output [9:0] LEDR,
	
	input 	MAX10_CLK1_50,
	output	[7:0]		HEX0,
	output	[7:0]		HEX1,
	output	[7:0]		HEX2,
	output	[7:0]		HEX3,
	output	[7:0]		HEX4,
	output	[7:0]		HEX5
);
//	// PART II
//	wire [3:0] w_m;
//	
//	// 7 Segment Display 
//	Seg7_Decoder D0(.m(w_m), .out(HEX0));
//	
//	wire w_z;
//	wire [2:0] w_ca;
//	
//	// MUltiplexers
//	mux_2_1 M0(.s(w_z), .x(SW[0]), .y(w_ca[0]), .m(w_m[0]));
//	mux_2_1 M1(.s(w_z), .x(SW[1]), .y(w_ca[1]), .m(w_m[1]));
//	mux_2_1 M2(.s(w_z), .x(SW[2]), .y(w_ca[2]), .m(w_m[2]));
//	mux_2_1 M3(.s(w_z), .x(SW[3]), .y(1'b0), .m(w_m[3]));
//	
//	// Circuit A
//	CircuitA CA(.v({SW[2], SW[1], SW[0]}), .out(w_ca));
//	
//	// Comparator
//	Comparator myC(.v({SW[3], SW[2], SW[1], SW[0]}), .z(w_z));
//	
//	// Circuit B
//	CircuitB CB( .z(w_z), .s(HEX1));
	
//	//Part III
//	wire [3:0] s;
//	wire c_o;
//	
//	assign LEDR[8:0] = SW[8:0];
//	assign LEDR[9] = c_o;
//	
//	rip_carry_adder_4bit rca (.a(SW[7:4]), .b(SW[3:0]), .c_i(SW[8]), .s(s), .c_o(c_o));
//	Seg7_Decoder dec0 (.m(s), .out(HEX0));

////Part IV
//
//	 wire [3:0] A, B, sum, S0;
//	 wire cin, carry, z;
//	 
//    assign A   = SW[7:4];
//    assign B   = SW[3:0];
//    assign cin = SW[8];
//
//    assign LEDR[8:0] = SW[8:0];
//    assign LEDR[9]   = (A[3] & (A[2] | A[1])) | (B[3] & (B[2] | B[1]));
//	 
//	 wire [3:0] a_out;
//	 CircuitA CA (.carry(carry), .sum(sum), .a_out(a_out));
//	 Comparator comp (.carry(carry), .sum(sum), .z(z));
//	 rip_carry_adder_4bit adder (.a(A), .b(B), .c_i(cin), .s(sum), .c_o(carry));
//	
//	 assign S0[0] = (~z & sum[0]) | (z & a_out[0]);
//    assign S0[1] = (~z & sum[1]) | (z & a_out[1]);
//    assign S0[2] = (~z & sum[2]) | (z & a_out[2]);
//    assign S0[3] = (~z & sum[3]) | (z & a_out[3]);
//	 
//	 assign S1 = {3'b000, z};
//	 
//	 Seg7_Decoder dec_S0 (.m(S0), .out(HEX0));  // Ones digit of sum
//	 Seg7_Decoder dec_S1 (.m(S1), .out(HEX1));
//    Seg7_Decoder dec_B  (.m(B),  .out(HEX3));  // Input B
//    Seg7_Decoder dec_A  (.m(A),  .out(HEX5));  // Input A
//	 
//	 assign HEX2 = 8'hFF;
//    assign HEX4 = 8'hFF;

//Part V

	wire [3:0] A0, B0, A1, B1, S0, S1, S2;
	wire c1, c2;
	
	assign A0 = SW[7:4];
	assign B0 = SW[3:0];
	assign A1 = {3'b000, SW[8]};
	assign B1 = {3'b000, SW[9]};
	
	assign LEDR = SW;
	assign S2 = {3'b000, c2};
	
	bcd_adder bcd0 (.A(A0), .B(B0), .c_i(1'b0), .s(S0), .c_o(c1));
	bcd_adder bcd1 (.A(A1), .B(B1), .c_i(c1), .s(S1), .c_o(c2));
	
	Seg7_Decoder disp_S0 (.m(S0), .out(HEX0));
	Seg7_Decoder disp_S1 (.m(S1), .out(HEX1));
	Seg7_Decoder disp_S2 (.m(S2), .out(HEX2));
	
endmodule
