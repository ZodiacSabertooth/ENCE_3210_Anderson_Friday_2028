module seg7_display(
	input [3:0] b_num,
	output reg [7:0] seg_disp
);

	always @(*) begin
		case(b_num)
			4'd0:  seg_disp = 8'b0100_0000; // Segments 0,1,2,3,4,5 ON  (g=1)
			4'd1:  seg_disp = 8'b0111_1001; // Segments 1,2 ON
			4'd2:  seg_disp = 8'b0010_0100; // Segments 0,1,6,4,3 ON
			4'd3:  seg_disp = 8'b0011_0000; // Segments 0,1,6,2,3 ON
			4'd4:  seg_disp = 8'b0001_1001; // Segments 5,6,1,2 ON
			4'd5:  seg_disp = 8'b0001_0010; // Segments 0,5,6,2,3 ON
			4'd6:  seg_disp = 8'b0000_0010; // Segments 0,5,4,3,2,6 ON
			4'd7:  seg_disp = 8'b0111_1000; // Segments 0,1,2 ON
         4'd8:  seg_disp = 8'b0000_0000; // Segments 0,1,2,3,4,5,6 ON
         4'd9:  seg_disp = 8'b0001_0000; // Segments 0,1,2,3,5,6 ON
         4'd10: seg_disp = 8'b0000_1000; // "A": Segments 0,1,2,4,5,6 ON
         4'd11: seg_disp = 8'b0000_0011; // "b": Segments 5,4,6,2,3 ON
         4'd12: seg_disp = 8'b0100_0110; // "C": Segments 0,5,4,3 ON
         4'd13: seg_disp = 8'b0010_0001; // "d": Segments 1,2,3,4,6 ON
         4'd14: seg_disp = 8'b0000_0110; // "E": Segments 0,5,6,4,3 ON
         4'd15: seg_disp = 8'b0000_1110; // "F": Segments 0,5,6,4 ON
         default: seg_disp = 8'b0111_1111; // All segments OFF
		endcase
	end

endmodule