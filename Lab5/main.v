module main(
	input 	MAX10_CLK1_50,
	input		[9:0]		SW,
	input 	[1:0]		KEY,
	output	[9:0]		LEDR,
	output	[7:0]		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 
);

//	//Part I & II
//	bit8_accumulator acc(.clk(~KEY[1]), .rst_n(KEY[0]), .add_sub(SW[9]), .a(SW[7:0]), .val(LEDR[7:0]), .overflow(LEDR[8]));
//	
//	seg7_display seg1 (.b_num(LEDR[7:4]), .seg_disp(HEX1));
//	seg7_display seg0 (.b_num(LEDR[3:0]), .seg_disp(HEX0));
//	
//	assign HEX5 = 8'hFF;
//	assign HEX4 = 8'hFF;
//	assign HEX3 = 8'hFF;
//	assign HEX2 = 8'hFF;
	
//	//Part III
//	array_multi #(.n(4)) a_multi
//	(.a(SW[7:4]), .b(SW[3:0]), .prod(LEDR[7:0]));
//	
//   seg7_display seg5 (.b_num(SW[7:4]), .seg_disp(HEX5));
//   seg7_display seg3 (.b_num(SW[3:0]), .seg_disp(HEX3));
//   seg7_display seg1 (.b_num(LEDR[7:4]), .seg_disp(HEX1));
//   seg7_display seg0 (.b_num(LEDR[3:0]), .seg_disp(HEX0));
// 
//   assign HEX4 = 8'hFF;
//   assign HEX2 = 8'hFF;

	//Part IV
	wire [9:0] P;
	reg_multi #(.n(5)) r_multi
	(.clk(KEY[1]), .a(SW[9:5]), .b(SW[4:0]), .P(P[9:0]));
	
	assign LEDR = SW;
 
   seg7_display seg2 (.b_num({2'b00, P[9:8]}), .seg_disp(HEX2));
   seg7_display seg1 (.b_num(P[7:4]), .seg_disp(HEX1));
   seg7_display seg0 (.b_num(P[3:0]), .seg_disp(HEX0));
	
   assign HEX5 = 8'hFF;
   assign HEX4 = 8'hFF;
   assign HEX3 = 8'hFF;
 
endmodule