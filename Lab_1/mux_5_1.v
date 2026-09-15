module mux_5_1 (
    input  [2:0] s,
    input        u, v, w, x, y,
    output       m
);

    wire w1, w2, w3;

    mux_2_1 m0 (.s(s[0]), .x(u),  .y(v),  .m(w1));
    mux_2_1 m1 (.s(s[0]), .x(w),  .y(x),  .m(w2));
    mux_2_1 m2 (.s(s[1]), .x(w1), .y(w2), .m(w3));
    mux_2_1 m3 (.s(s[2]), .x(w3), .y(y),  .m(m));

endmodule