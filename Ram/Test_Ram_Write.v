module Test_Ram_Write;
    parameter DATA_SIZE = 32;
    parameter ADDRESS_SIZE = 16;
    reg enable, read_write;
    reg [DATA_SIZE - 1: 0] data_in;
    reg [ADDRESS_SIZE - 1: 0] address;
    wire [DATA_SIZE - 1: 0] data_out;

    Ram Test_Ram(.enable(enable), .read_write(read_write), .address(address), .data_in(data_in), .data_out(data_out));

    initial  
    begin
       enable =0;   read_write=0;	address=16'd0;	data_in =32'b00000000000000000000000000000000;
    #5 enable =1;   read_write=0;	address=16'd0;	data_in =32'b01100111000110100101011000011101;
    #5 enable =1;   read_write=0;	address=16'd1;	data_in =32'b11111111111111111111111111111111;
    #10

    $writememb("test_ram_write.txt", Test_Ram.mem);
    end
endmodule