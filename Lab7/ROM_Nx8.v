
`default_nettype none

module ROM_Nx8 #
(
	parameter N = 16
)
(
	input [$clog2(N)-1:0] address,
	output reg [7:0] data
);

	(* ramstyle = "logic" *) reg [7:0] rom [0:N-1];
	
	// Initialize memory -> your asm instructions
	initial begin
rom[0] = 8'h54;  // LDA 4: A = 4
rom[1] = 8'h13;  // ADD 3: A = 7
rom[2] = 8'h30;  // OUT: display 7

rom[3] = 8'h40;  // IN: A = value from inregister
rom[4] = 8'h12;  // ADD 2: A = input value + 2
rom[5] = 8'h21;  // SUB 1: A = input value - 1
rom[6] = 8'h30;  // OUT: display input value - 1

rom[7] = 8'h53;  // LDA 3: A = 3
rom[8] = 8'h14;  // ADD 4: A = 7
rom[9] = 8'h30;  // OUT: display 7
		// maximum 16 instructions
	end
	
	// Combinational Logic (async)
	always @(*) begin
		data = rom[address];
	end

endmodule

`default_nettype wire
