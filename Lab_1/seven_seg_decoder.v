
module seven_seg_decoder (
	 input [2:0] c,
	 output [0:6] Disp
);
	 //Part IV
//	 wire c2, c1, c0;
//	 assign c2 = c[2];
//	 assign c1 = c[1];
//	 assign c0 = c[0];
//	 
//	 // Segment 0: OFF for H and Blank
//    assign Disp[0] = c2 | ~c0;
//
//    // Segment 1: OFF for E, L, and Blank
//    assign Disp[1] = c2 | (c1 ^ c0);
//
//    // Segment 2: OFF for E, L, and Blank
//    assign Disp[2] = c2 | (c1 ^ c0);
//
//    // Segment 3: OFF for H and Blank
//    assign Disp[3] = c2 | (~c1 & ~c0);
//
//    // Segment 4: OFF only for Blank
//    assign Disp[4] = c2;
//
//    // Segment 5: OFF only for Blank
//    assign Disp[5] = c2;
//
//    // Segment 6: OFF for L, O, and Blank
//    assign Disp[6] = c2 | c1;

	 //Part V
	 assign Disp = (c == 3'b000) ? 7'b0001001 : // H:  a,d off (1); b,c,e,f,g on (0)
						(c == 3'b001) ? 7'b0000110 : // E:  b,c off (1); a,d,e,f,g on (0)
						(c == 3'b010) ? 7'b1000111 : // L:  a,b,c,g off (1); d,e,f on (0)
						(c == 3'b011) ? 7'b1000000 : // O:  g off (1); a,b,c,d,e,f on (0)
                                  7'b1111111;  // Blank: all off (1)

endmodule
	 