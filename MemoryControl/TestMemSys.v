module test_MemSys;
	reg [31:0] in0, in1, in3;//src1,src2,ramin
	reg [3:0] in2;//opcode
	wire rw;//ram rw flag
	wire [31:0] ramout;
	// MUXAddressBus
	reg [7:0] pc;
	wire [15:0] addbus;
	// MUXLDRBus
	reg[31:0] alu;

	initial
	begin
	#0  in0=32'b11; in1=32'b100001; in2=4'b1010;in3=32'b1000; pc=8'b0; alu=32'b10;
	#10 in0=32'b110; in1=32'b10001; in2=4'b1010;in3=32'b11000; pc=8'b0; alu=32'b10;
	#10 in0=32'b1100; in1=32'b1001; in2=4'b1001;in3=32'b111000; pc=8'b0; alu=32'b10;
	#10 in0=32'b11000; in1=32'b101; in2=4'b1000;in3=32'b1111000; pc=8'b0; alu=32'b10;
	#10 in0=32'b110000; in1=32'b11; in2=4'b1001;in3=32'b11111000; pc=8'b0; alu=32'b10;
	end

	initial
	begin
	$monitor($time," src1=%b, src2=%b, opcode=%b, ram data in=%b, RW flag=%b, ram data out=%b, pc instr=%b, address out=%b, ALU result=%b",in0,in1,in2,in3,rw,ramout, pc, addbus, alu);
	end

	MemoryControlSystem mem(rw, in2, in0, in1, in3, ramout, pc, addbus, alu);

endmodule
