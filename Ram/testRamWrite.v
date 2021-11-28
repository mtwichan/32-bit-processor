module test_ram_write;
    parameter DATA_SIZE = 32, ADDRESS_SIZE = 16;
    reg enable, read_write;
    reg [DATA_SIZE - 1: 0] data_in;
    reg [ADDRESS_SIZE - 1: 0] address;
    reg [ADDRESS_SIZE - 1: 0] fetch_address;
    wire [DATA_SIZE - 1: 0] data_out;
    wire [DATA_SIZE - 1:0] fetch_out;

	Ram Test_Ram(.enable(enable), .read_write(read_write), .address(address), .fetch_address(fetch_address), .data_in(data_in), .data_out(data_out), .fetch_out(fetch_out));

    initial  
    begin
       enable =0;   read_write=0;	address=16'd0;	fetch_address=16'd0;    data_in =32'b00000000000000000000000000000000;
    #5 enable =1;   read_write=0;	address=16'd0;	fetch_address=16'd1;    data_in =32'b01100111000110100101011000011101;
    #5 enable =1;   read_write=0;	address=16'd1;	fetch_address=16'd0;    data_in =32'b11111111111111111111111111111111;
    #10

    $writememb("Ram/test_data_files/test_ram_write.txt", Test_Ram.mem);
    end
endmodule