module main(
	input 	MAX10_CLK1_50,
	input		[9:0]		SW,
	input 	[1:0]		KEY,
	output	[9:0]		LEDR,
	output	[7:0]		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 

);
//	//Part I
////	bit4_counter b1 (.ena(SW[1]), .clk(KEY[0]), .clear(SW[0]), .count(LEDR[3:0]));
//	
//	wire w_clk, w_a;
//	assign w_or = (SW[0] & MAX10_CLK1_50) | w_clk;
//	count_1Hz c1 (.i_clk(MAX10_CLK1_50), .clear(SW[0]), .o_clk(w_clk));
//	
//	bit8_counter(.ena(SW[1]), .clk(w_or), .clear(SW[0]), .count(LEDR[7:0]));
//	
//	wire [6:0] seg0, seg1;
//	seg7_display h1 (.b_num(LEDR[7:4]), .seg_disp(seg1));
//	seg7_display h0 (.b_num(LEDR[3:0]), .seg_disp(seg0));
//	
//	assign HEX1 = {1'b1, seg1};
//	assign HEX0 = {1'b1, seg0};
//	
//	assign HEX2 = 8'hFF;
//   assign HEX3 = 8'hFF;
//   assign HEX4 = 8'hFF;
//   assign HEX5 = 8'hFF;
//   assign LEDR[9:8] = 2'b00;
	
	//Part II
//	// 1. Declare all wires
//	wire [15:0] count;
//	wire [6:0] seg0, seg1, seg2, seg3;
//	
//	wire w_clk, w_a;
//	assign w_or = (SW[0] & MAX10_CLK1_50) | w_clk;
//	count_1Hz c1 (.i_clk(MAX10_CLK1_50), .clear(SW[0]), .o_clk(w_clk));
//
//	// 2. Added missing instance name 'b1'
//	bit16_counter b1 (.ena(SW[1]), .clk(w_or), .rst_n(SW[0]), .q(count));
//
//	// 7-segment display decoders
//	seg7_display h3 (.b_num(count[15:12]), .seg_disp(seg3));
//	seg7_display h2 (.b_num(count[11:8]), .seg_disp(seg2));
//	seg7_display h1 (.b_num(count[7:4]), .seg_disp(seg1));
//	seg7_display h0 (.b_num(count[3:0]), .seg_disp(seg0));
//
//	// Segment assignments (including decimal point bit)
//	assign HEX3 = {1'b1, seg3};
//	assign HEX2 = {1'b1, seg2};
//	assign HEX1 = {1'b1, seg1};
//	assign HEX0 = {1'b1, seg0};
//
//	// Blank unused displays
//	assign HEX4 = 8'hFF;
//	assign HEX5 = 8'hFF;
//
//	// 3. Fixed width: drive all 10 bits of LEDR to turn them off
//	assign LEDR = 10'b00_0000_0000;

//	//Part III
//	wire w_clk, w_a;
//	assign w_or = (SW[0] & MAX10_CLK1_50) | w_clk;
//	count_1Hz c1 (.i_clk(MAX10_CLK1_50), .clear(SW[0]), .o_clk(w_clk));
//	
//	wire [15:0] count;
//	wire [6:0]  seg0, seg1, seg2, seg3;
//
//	LPM_16bit_Counter b1 (.clock(w_or), .cnt_en(SW[1]), .sclr(SW[0]), .q(count));	
//	//	// 7-segment display decoders
//	seg7_display h3 (.b_num(count[15:12]), .seg_disp(seg3));
//	seg7_display h2 (.b_num(count[11:8]), .seg_disp(seg2));
//	seg7_display h1 (.b_num(count[7:4]), .seg_disp(seg1));
//	seg7_display h0 (.b_num(count[3:0]), .seg_disp(seg0));
//
//	// Segment assignments (including decimal point bit)
//	assign HEX3 = {1'b1, seg3};
//	assign HEX2 = {1'b1, seg2};
//	assign HEX1 = {1'b1, seg1};
//	assign HEX0 = {1'b1, seg0};
//
//	// Blank unused displays
//	assign HEX4 = 8'hFF;
//	assign HEX5 = 8'hFF;
//
//	// 3. Fixed width: drive all 10 bits of LEDR to turn them off
//	assign LEDR = 10'b00_0000_0000;

	//Part IV
	wire [3:0] digit;
	wire [6:0] seg0;
	
	counter_pt4 c_pt4 (.CLK1_50(MAX10_CLK1_50), .clear(SW[0]), .digit(digit));
	seg7_display h0 (.b_num(digit),   .seg_disp(seg0));
	
	assign HEX0 = {1'b1, seg0};
	
	assign HEX1 = 8'hFF;
	assign HEX2 = 8'hFF;
   assign HEX3 = 8'hFF;
   assign HEX4 = 8'hFF;
   assign HEX5 = 8'hFF;
	
//	//Part V
//	wire [23:0] o_disp;
//	wire [6:0]  seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7;
//	bit24_rotary r1 (.CLK1_50(MAX10_CLK1_50), .clear(SW[0]), .ena(SW[1]), .o_pattern(o_disp));
//	
//	seg7_display h7 (.c(o_disp[23:21]), .disp(seg7));
//	seg7_display h6 (.c(o_disp[20:18]), .disp(seg6));
//	seg7_display h5 (.c(o_disp[17:15]), .disp(seg5));
//	seg7_display h4 (.c(o_disp[14:12]), .disp(seg4));
//	seg7_display h3 (.c(o_disp[11:9]), .disp(seg3));
//	seg7_display h2 (.c(o_disp[8:6]), .disp(seg2));
//	seg7_display h1 (.c(o_disp[5:3]), .disp(seg1));
//	seg7_display h0 (.c(o_disp[2:0]), .disp(seg0));
//	
//	assign HEX7 = {1'b1, seg7};
//	assign HEX6 = {1'b1, seg6};
//	assign HEX5 = {1'b1, seg5};
//	assign HEX4 = {1'b1, seg4};
//	assign HEX3 = {1'b1, seg3};
//	assign HEX2 = {1'b1, seg2};
//	assign HEX1 = {1'b1, seg1};
//	assign HEX0 = {1'b1, seg0};
endmodule