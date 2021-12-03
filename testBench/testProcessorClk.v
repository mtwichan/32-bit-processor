module atestProcessorClk;
	reg clk, reset;
	
	initial	
    begin
        clk = 0;
        reset = 1;
        #3 reset = 0;
        #4 reset = 1;
	#200 $finish; // 20 time units
	end
	
    initial
	begin
		$display($time, "Start processor ...");
	end

	always #10 clk =~ clk; // Run clock pulse every 10 time units
	
	
	ProcessorClk processor_comp(
		.clk(clk),
		.reset(reset)	
	);
	
endmodule