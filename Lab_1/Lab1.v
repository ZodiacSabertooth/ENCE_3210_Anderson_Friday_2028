//Part I
//module Lab1 (
//   input  [9:0] SW,
//   output [9:0] LEDR
//);
//
//    assign LEDR = SW;

//Part II
//module Lab1 (
//    input  [9:0] SW,
//    output [9:0] LEDR
//);
//    wire [7:0] M;
//
//    mux_2_1_8b u_mux8 (
//        .s(SW[9]),
//        .x({4'b0000, SW[3:0]}),
//        .y({4'b0000, SW[7:4]}),
//        .m(M)
//    );
//
//    assign LEDR[7:0] = M;
//    assign LEDR[8]   = 1'b0;
//    assign LEDR[9]   = SW[9];
	 
//Part III
//module Lab1 (
//    input  [9:0] SW,
//    output [9:0] LEDR,
//    output [7:0] HEX0
//);
//
//    wire [2:0] M;
//
//    // 3-bit wide 5-to-1 Multiplexer
//    mux3bit5_1 M0 (.S (SW[9:7]), .U (SW[2:0]), .V (SW[5:3]), .W (3'b010), .X (3'b011), .Y (3'b100), .M (M));
//
//    // Drive LEDR without contention:
//    // Bits [2:0] display mux output M; upper bits display switch positions
//    assign LEDR[2:0] = M;
//    assign LEDR[9:3] = SW[9:3];
//
//    // Turn off HEX0 segments (active-low displays off = all 1's)
//    assign HEX0 = 8'hFF;

//Part IV
//module Lab1 (
//    input  [2:0] SW,
//    output [0:6] HEX0
//);
//
//    seven_seg_decoder H0 (.c(SW[2:0]), .Disp (HEX0[0:6]));
//    

//Part V & VI
module Lab1 (
    input  [9:0] SW,
    output [9:0] LEDR,
    output [7:0] HEX5,
    output [7:0] HEX4,
    output [7:0] HEX3,
    output [7:0] HEX2,
    output [7:0] HEX1,
    output [7:0] HEX0
);

    wire [2:0] m5, m4, m3, m2, m1, m0;
	 assign LEDR = SW;
	 wire [2:0] S = SW[2:0];
	 
	 // Fixed character codes for "HELLO":
    // H = 000, E = 001, L = 010, L = 010, O = 011
	 //localparam similar to defining a variable
    localparam H = 3'b000;
    localparam E = 3'b001;
    localparam L = 3'b010;
    localparam O = 3'b011;
	 localparam _ = 3'b100; // Blank character

	 
//	 // Rotated 5-to-1 multiplexers
//    mux3bit5_1 MUX4 (.S(S), .U(H), .V(E), .W(L), .X(L), .Y(O), .M(M4));
//    mux3bit5_1 MUX3 (.S(S), .U(E), .V(L), .W(L), .X(O), .Y(H), .M(M3));
//    mux3bit5_1 MUX2 (.S(S), .U(L), .V(L), .W(O), .X(H), .Y(E), .M(M2));
//    mux3bit5_1 MUX1 (.S(S), .U(L), .V(O), .W(H), .X(E), .Y(L), .M(M1));
//    mux3bit5_1 MUX0 (.S(S), .U(O), .V(H), .W(E), .X(L), .Y(L), .M(M0));
//    // Decoders for HEX4 to HEX0
//    seven_seg_decoder D4 (.c(M4), .Disp(HEX4[6:0]));
//    seven_seg_decoder D3 (.c(M3), .Disp(HEX3[6:0]));
//    seven_seg_decoder D2 (.c(M2), .Disp(HEX2[6:0]));
//    seven_seg_decoder D1 (.c(M1), .Disp(HEX1[6:0]));
//    seven_seg_decoder D0 (.c(M0), .Disp(HEX0[6:0]));
	 
	 // 8-to-1 Multiplexers for the 6 displays on the DE10-Lite:
    // When S steps from 000 to 111, letters shift position across the board:
    mux3bit8_1 MUX5 (.S(S), .in0(_), .in1(H), .in2(E), .in3(L), .in4(L), .in5(O), .in6(_), .in7(_), .M(m5));
    mux3bit8_1 MUX4 (.S(S), .in0(H), .in1(E), .in2(L), .in3(L), .in4(O), .in5(_), .in6(_), .in7(_), .M(m4));
    mux3bit8_1 MUX3 (.S(S), .in0(E), .in1(L), .in2(L), .in3(O), .in4(_), .in5(_), .in6(_), .in7(H), .M(m3));
    mux3bit8_1 MUX2 (.S(S), .in0(L), .in1(L), .in2(O), .in3(_), .in4(_), .in5(_), .in6(H), .in7(E), .M(m2));
    mux3bit8_1 MUX1 (.S(S), .in0(L), .in1(O), .in2(_), .in3(_), .in4(_), .in5(H), .in6(E), .in7(L), .M(m1));
    mux3bit8_1 MUX0 (.S(S), .in0(O), .in1(_), .in2(_), .in3(_), .in4(H), .in5(E), .in6(L), .in7(L), .M(m0));
	 // Active-low 7-segment decoders for each display
    seven_seg_decoder D5 (.c(m5), .Disp(HEX5[6:0]));
    seven_seg_decoder D4 (.c(m4), .Disp(HEX4[6:0]));
    seven_seg_decoder D3 (.c(m3), .Disp(HEX3[6:0]));
    seven_seg_decoder D2 (.c(m2), .Disp(HEX2[6:0]));
    seven_seg_decoder D1 (.c(m1), .Disp(HEX1[6:0]));
    seven_seg_decoder D0 (.c(m0), .Disp(HEX0[6:0]));
	 
    assign HEX5[7] = 1'b1;
    assign HEX4[7] = 1'b1;
    assign HEX3[7] = 1'b1;
    assign HEX2[7] = 1'b1;
    assign HEX1[7] = 1'b1;
    assign HEX0[7] = 1'b1;
	 
endmodule
