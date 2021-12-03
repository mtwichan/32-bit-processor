module Ram(read_write, address, data_in, data_out, fetch_out);

	parameter DATA_SIZE = 32, ADDRESS_SIZE = 16;

	input read_write;
	input [DATA_SIZE - 1:0] data_in;
	input [ADDRESS_SIZE - 1:0] address;
	
	reg [DATA_SIZE - 1:0] mem [0: (1 << ADDRESS_SIZE) - 1]; // 2^16 words * 32 bits memory
	output reg [DATA_SIZE - 1:0] fetch_out;
	output reg [DATA_SIZE - 1:0] data_out;

	initial begin // load data into memory up front -> https://projectf.io/posts/initialize-memory-in-verilog/
		$display("Loading instruction set into memory ...");
		$readmemb("TestData/test_ram_read_alu.txt", mem); // Change file to load here
		fetch_out = mem[0];
	end

	assign data_out = read_write ? mem[address] : 32'bz; // read -> LDR - 1/2 line data in and out
	// assign fetch_out = mem[address]; // always read to instruction fetch
	
	always @ (address)
	begin
		if (read_write)
			data_out = mem[address];
		else 			
			data_out = 32'bz;
			fetch_out = mem[address];
	end

	always @ (data_in) // write -> STR - 2/2 line data in and out
	begin
		if (!read_write) 
			mem[address] = data_in; 
			$display("RAM -> data_in: %b", data_in);
			$writememb("TestData/test_ram_write_str.txt", mem);

	end

endmodule
