module bit16_counter (
	input ena, clk, rst_n,
	output reg [15:0] q
);

    always @(posedge clk) begin
        if (rst_n)
            q <= 16'd0;
        else if (ena)
            q <= q + 16'd1;
    end
endmodule