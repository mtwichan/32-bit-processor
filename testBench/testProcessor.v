module test_processor;


    Ram Test_Ram(.read_write(read_write), .address(address), .fetch_address(fetch_address), .data_in(data_in), .data_out(data_out), .fetch_out(fetch_out));

    // load instruction set into memory
	initial
	begin

		$readmemb("TestData/test_ram_read_alu.txt", Test_Ram.mem); 
		read_write = 0;		address = 15'd0;	fetch_address = 15'd0;  
	#5	read_write = 1;		address = 15'd0;	fetch_address = 15'd0;
	#5	read_write = 1;		address = 15'd1;	fetch_address = 15'd3;
	#5	read_write = 1;		address = 15'd2;	fetch_address = 15'd2;
	#5	read_write = 1;		address = 15'd3;	fetch_address = 15'd1;

	end

	initial
	begin

	$monitor($time, "Address: %d FetchAddress: %d DataOut: %b FetchDataOut: %b", address, fetch_address, data_out, fetch_out);

	end
endmodule
