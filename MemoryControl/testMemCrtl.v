module test_MemCtrl;
	reg [31:0] in0, in1, in3;//src1,src2,ramin
	reg [3:0] in2;//opcode
	wire rw;//rwflag
	wire ldr, add;//select for address and ldr mux
	wire [31:0] ramout,databus;
	wire [15:0] addbus;
	initial
	begin
	#0  in0=32'b11; in1=32'b100001; in2=4'b1010;in3=32'b1000;
	#10 in0=32'b110; in1=32'b10001; in2=4'b1010;in3=32'b1000;
	#10 in0=32'b1100; in1=32'b1001; in2=4'b1001;in3=32'b1000;
	#10 in0=32'b11000; in1=32'b101; in2=4'b1010;in3=32'b1000;
	#10 in0=32'b110000; in1=32'b11; in2=4'b1001;in3=32'b1000;
	end

	initial
	begin
	$monitor($time," src1=%b, src2=%b, opcode=%b, ram in=%b, ram data out=%b, RW flag=%b, sel_ldr=%b, sel_add=%b, address out=%b, data ldr out=%b",in0,in1,in2,in3,ramout,rw,ldr,add,addbus,databus);
	end

	MemoryControl memcrtl(in0,in1,in2,in3,ramout,rw,ldr,add,addbus,databus);

endmodule
