`timescale 1 ns/10 ps
module atest_processor;
	// This test bench simulates the program counter fetch cycle and instruction execution

	localparam period = 10; // 10 * timescale = 10 * 1 ns  = 10ns

	reg [7:0] pc_counter = 8'd0;

	always 
	begin
		#period pc_counter = pc_counter + 1;
	end

	initial
	begin
		$monitor($time, "Progam counter: %d" , pc_counter);
	end

	initial 
	begin
		#100 $finish;		
	end

	Processor processor(.pc_counter(pc_counter));


endmodule
