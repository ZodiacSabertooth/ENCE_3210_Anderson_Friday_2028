module T_ff (
	input T, clk, clear,
	output Qt
);

	wire d;
	reg q;
	
	//edge trigger flip flop
    always @(posedge clk) begin
        if (clear) begin
            q <= 0;
        end else begin
            q <= d;
        end
    end
	 
	 assign d= (q & ~T) | (T & ~q);
	 assign Qt= q;
endmodule