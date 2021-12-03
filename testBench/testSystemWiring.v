`timescale 1 ns/10 ps

module test_SysWiring;
	// This test bench simulates the program counter fetch cycle and instruction execution

	localparam period = 10; // 10 * timescale = 10 * 1 ns  = 10ns

	initial 
	begin
		#100 $finish;		
	end

	SysWiring SysWiring(.());


endmodule
