module mux_2_1 (
    input  s, x, y,
    output m
);
    assign m = (~s & x) | (s & y);
endmodule