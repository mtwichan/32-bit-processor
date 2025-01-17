module Ram(read_write, fetch_address, address, data_in, data_out, fetch_out);

	parameter DATA_SIZE = 32, ADDRESS_SIZE = 16;

	input read_write;
	input [DATA_SIZE - 1:0] data_in;
	input [ADDRESS_SIZE - 1:0] address;
	input [ADDRESS_SIZE - 1:0] fetch_address;

	output [DATA_SIZE - 1:0] fetch_out;
	output [DATA_SIZE - 1:0] data_out;
	reg [DATA_SIZE - 1:0] mem [0: (1 << ADDRESS_SIZE) - 1]; // 2^16 words * 32 bits memory
	
	initial begin // load data into memory up front -> https://projectf.io/posts/initialize-memory-in-verilog/
		$display("Loading instruction set into memory ...");
		$readmemb("TestData/test_ram_read_alu.txt", mem); // Change file to load here
	end

	assign data_out = read_write ? mem[address] : 32'bz; // read -> LDR - 1/2 line data in and out
	assign fetch_out = mem[fetch_address]; // always read to instruction fetch

	always @ (data_in) // write -> STR - 2/2 line data in and out
	begin
		if (!read_write) 
			mem[address] = data_in; 
	end
endmodule