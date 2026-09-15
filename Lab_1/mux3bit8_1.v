module mux3bit8_1 (
input  [2:0] S,
    input  [2:0] in0, in1, in2, in3, in4, in5, in6, in7,
    output [2:0] M
);

    // Bit 0 slice
    mux_8_1 bit0 (
        .s(S),
        .in0(in0[0]), .in1(in1[0]), .in2(in2[0]), .in3(in3[0]),
        .in4(in4[0]), .in5(in5[0]), .in6(in6[0]), .in7(in7[0]),
        .m  (M[0])
    );

    // Bit 1 slice
    mux_8_1 bit1 (
        .s  (S),
        .in0(in0[1]), .in1(in1[1]), .in2(in2[1]), .in3(in3[1]),
        .in4(in4[1]), .in5(in5[1]), .in6(in6[1]), .in7(in7[1]),
        .m  (M[1])
    );

    // Bit 2 slice
    mux_8_1 bit2 (
        .s  (S),
        .in0(in0[2]), .in1(in1[2]), .in2(in2[2]), .in3(in3[2]),
        .in4(in4[2]), .in5(in5[2]), .in6(in6[2]), .in7(in7[2]),
        .m  (M[2])
    );

endmodule