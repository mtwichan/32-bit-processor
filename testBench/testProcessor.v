`timescale 1 ns/10 ps
module test_processor;
	// This test bench simulates the program counter fetch cycle and instruction execution

	localparam period = 10; // 10 * timescale = 10 * 1 ns  = 10ns

	reg [15:0] fetch_address;

	initial // TODO: Make it so that we can dynamically set the # of fetch cycles OR for loop
	begin
				fetch_address = 15'd0;  
		#period	fetch_address = 15'd1;
		#period	fetch_address = 15'd2;
		#period	fetch_address = 15'd3;
		#period	fetch_address = 15'd4;
		#period	fetch_address = 15'd5;
		#period	fetch_address = 15'd6;
		#period	fetch_address = 15'd7;
	end

	initial
	begin
		$monitor($time, "FetchAddress: %d" , fetch_address);
	end

	Processor processor(.fetch_address(fetch_address));

endmodule
