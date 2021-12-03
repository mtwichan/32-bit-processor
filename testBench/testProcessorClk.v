module atestProcessorClk;
	reg clk, reset;
	initial
	begin
		$display($time, "Testing processor");
	end
	
	// initial
	// begin
		// $monitor($time, " clk=%b || reset=%b",
			// clk,
			// reset
		// );
	// end
	
	initial	begin
	clk = 0;
	reset = 1;
	#3 reset = 0;
	#4 reset = 1;
	
	#200 $finish; // Stop the simulation after 50 time units
	end
	
	always #10 clk =~ clk; // How to create a clk pulses of period 10
	
	
	ProcessorClk processor_comp(
		.clk(clk),
		.reset(reset)	
	);
	
endmodule