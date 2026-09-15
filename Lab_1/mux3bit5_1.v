module mux3bit5_1 (
    input  [2:0] S,
    input  [2:0] U, V, W, X, Y,
    output [2:0] M
);

    mux_5_1 bit0 (.s(S), .u(U[0]), .v(V[0]), .w(W[0]), .x(X[0]), .y(Y[0]), .m(M[0]));
    mux_5_1 bit1 (.s(S), .u(U[1]), .v(V[1]), .w(W[1]), .x(X[1]), .y(Y[1]), .m(M[1]));
    mux_5_1 bit2 (.s(S), .u(U[2]), .v(V[2]), .w(W[2]), .x(X[2]), .y(Y[2]), .m(M[2]));

endmodule