`timescale 1 ns/10 ps
module test_processor;
	// This test bench simulates the program counter fetch cycle and instruction execution

	localparam period = 10; // 10 * timescale = 10 * 1 ns  = 10ns

	reg [7:0] pc_counter = 8'd0;
	reg [31:0] mem [0: (1 << 16) - 1]; // 2^16 words * 32 bits memory

	initial begin // load data into memory up front -> https://projectf.io/posts/initialize-memory-in-verilog/
		$display("Loading instruction set into memory ...");
		$readmemb("TestData/test_ram_read_alu.txt", mem); // Change file to load here
	end

	always 
	begin
		#period pc_counter = pc_counter + 1;
	end

	initial
	begin
		$monitor($time, "PC : %d" , pc_counter);
	end

	initial 
	begin
		#100 $finish;		
	end
	
	Processor processor(.pc_counter(pc_counter), .loaded_mem(mem));


endmodule
