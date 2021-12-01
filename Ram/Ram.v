module Ram(read_write, fetch_address, address, data_in, data_out, fetch_out);

	parameter DATA_SIZE = 32, ADDRESS_SIZE = 16;

	input read_write;
	input [DATA_SIZE - 1:0] data_in;
	input [ADDRESS_SIZE - 1:0] address;
	input [7:0] fetch_address;

	output [DATA_SIZE - 1:0] fetch_out;
	output [DATA_SIZE - 1:0] data_out;
	reg [DATA_SIZE - 1:0] mem [0: (1 << ADDRESS_SIZE) - 1]; // 2^16 words * 32 bits memory

	assign data_out = read_write ? mem[address] : 32'bz; // read -> LDR - 1/2 line data in and out
	assign fetch_out = mem[fetch_address]; // always read to instruction fetch
	
	always @ (data_in) // write -> STR - 2/2 line data in and out
	begin
		if (!read_write) 
			mem[address] = data_in; 
	end

endmodule
