module Ram(enable, read_write, fetch_address, address, data_in, data_out, fetch_out);

	parameter DATA_SIZE = 32, ADDRESS_SIZE = 16;

	input enable, read_write;
	input [DATA_SIZE - 1:0] data_in;
	input [ADDRESS_SIZE - 1:0] address;
	input [ADDRESS_SIZE - 1:0] fetch_address;

	output reg [DATA_SIZE - 1:0] fetch_out;
	output reg [DATA_SIZE - 1:0] data_out;
	reg [DATA_SIZE - 1:0] mem [0: (1 << ADDRESS_SIZE) - 1]; // 2^16 words * 32 bits memory
	
	always @ (*) 
	begin
		if (enable)
			if(read_write) 
				data_out = mem[address]; // read -> LDR
			else
				mem[address] = data_in; // write -> STR
		else
			data_out = 32'bz;
	end
	assign fetch_out = mem[fetch_address]; // always read to instruction fetch
endmodule