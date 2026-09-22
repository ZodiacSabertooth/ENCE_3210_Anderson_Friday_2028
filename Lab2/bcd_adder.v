module bcd_adder (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire       c_i,
    output wire [3:0] s,
    output wire       c_o
);

    wire [3:0] sum;
    wire [3:0] a_out;
    wire       z;
    wire       carry;

    rip_carry_adder_4bit (.a(A), .b(B), .c_i(c_i), .s(sum), .c_o(carry));
    Comparator compare_bcd (.carry(carry), .sum(sum), .z(z));
    CircuitA convert_bcd (.carry (carry), .sum   (sum), .a_out (a_out));

    assign s[0] = (~z & sum[0]) | (z & a_out[0]);
    assign s[1] = (~z & sum[1]) | (z & a_out[1]);
    assign s[2] = (~z & sum[2]) | (z & a_out[2]);
    assign s[3] = (~z & sum[3]) | (z & a_out[3]);

    assign c_o = z;

endmodule