module main(
	input 	MAX10_CLK1_50,
	input		[9:0]		SW,
	input 	[1:0]		KEY,
	output	[9:0]		LEDR,
	output	[35:0]	GPIO,
	output	[7:0]		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 
	
//	//part I
//	input Clk, R, S,
//	output Q
	
//	//Part IV
//	input D, clk,
//   output Qa, Qb, Qc
);

//	//part I
//	wire R_g, S_g, Qa, Qb /* synthesis keep */ ;
//	and (R_g, R, Clk);
//	and (S_g, S, Clk);
//	nor (Qa, R_g, Qb);
//	nor (Qb, S_g, Qa);
//	assign Q = Qa;

	//Part II
	d_latch dl (.D(SW[0]), .clk(SW[1]), .Q(LEDR[0]));
	
//	//Part III
//	d_ff dff (.d(SW[0]), .clk(SW[1]), .q(LEDR[0]));
	
//	//Part IV
//	d_latch dl (.D(D), .clk(clk), .Q(Qa));
//	dff_pos dff_pos (.D(D), .clk(clk), .Q(Qb));
//	dff_neg dff_neg (.D(D), .clk(clk), .Q(Qc));

//	//Part V
//	reg [9:0] A;
//	always @(posedge KEY[1] or negedge KEY[0]) begin
//		if (~KEY[0]) begin 
//			A <= 10'b0;
//		end else begin
//			A <= SW;
//		end
//	end
//	
//	wire [9:0] B = SW;
//	wire [11:0] A_ext = {2'b00, A};
//	wire [11:0] B_ext = {2'b00, B};
//	wire [6:0] seg5, seg4, seg3, seg2, seg1, seg0;
//	
//	seg7_display h5 (.b_num(A_ext[11:8]), .seg_disp(seg5));
//	seg7_display h4 (.b_num(A_ext[7:4]), .seg_disp(seg4));
//	seg7_display h3 (.b_num(A_ext[3:0]), .seg_disp(seg3));
//	
//	seg7_display h2 (.b_num(B_ext[11:8]), .seg_disp(seg2));
//	seg7_display h1 (.b_num(B_ext[7:4]), .seg_disp(seg1));
//	seg7_display h0 (.b_num(B_ext[3:0]), .seg_disp(seg0));
//	
//	assign HEX5 = {1'b1, seg5};
//   assign HEX4 = {1'b1, seg4};
//   assign HEX3 = {1'b1, seg3};
//   assign HEX2 = {1'b1, seg2};
//   assign HEX1 = {1'b1, seg1};
//   assign HEX0 = {1'b1, seg0};

endmodule
