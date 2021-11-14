module Test_Ram_Read;
	parameter DATA_SIZE = 32, ADDRESS_SIZE = 16;
	reg enable, read_write;
	reg [DATA_SIZE - 1:0] data_in;
	reg [ADDRESS_SIZE - 1:0] address;
	reg [ADDRESS_SIZE - 1:0] fetch_address;
	wire [DATA_SIZE - 1:0] data_out;
	wire [DATA_SIZE - 1:0] fetch_out;

	Ram Test_Ram(.enable(enable), .read_write(read_write), .address(address), .fetch_address(fetch_address), .data_in(data_in), .data_out(data_out), .fetch_out(fetch_out));

	initial
	begin

		$readmemb("test_ram_read.txt", Test_Ram.mem);
		enable = 0;	read_write = 0;		address = 15'd0;	fetch_address = 15'd0;  
	#5	enable = 1;	read_write = 1;		address = 15'd0;	fetch_address = 15'd0;
	#5	enable = 1;	read_write = 1;		address = 15'd1;	fetch_address = 15'd3;
	#5	enable = 1;	read_write = 1;		address = 15'd2;	fetch_address = 15'd2;
	#5	enable = 1;	read_write = 1;		address = 15'd3;	fetch_address = 15'd1;

	end

	initial
	begin

	$monitor($time, "Address: %d FetchAddress: %d Data: %b FetchData: %b", address, fetch_address, data_out, fetch_out);

	end
endmodule