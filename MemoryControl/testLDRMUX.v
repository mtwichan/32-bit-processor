module test_ldrMux;
	reg in0;
	reg [31:0] in1, in2;
	wire [31:0] result;
	initial
	begin
	    in0=1'b1; in1=32'b0; in2=32'b111;
	#10 in0=1'b0; in1=32'b1; in2=32'b10000011001001000000001100100100;
	#10 in0=1'b0; in1=32'b11001001000110; in2=32'b01000001001001010100000100100101;
	#10 in0=1'b0; in1=32'b10110000100101011010; in2=32'b0000001100100100;
	#10 in0=1'b1; in1=32'b110000100101011010011100; in2=32'b11000010010101101100001001010110;
	end

	initial
	begin
	$monitor($time," Select=%b, ram result=%b, alu result=%b, ldr output=%b",in0,in1,in2,result);
	end

	MUXLDRBus ldr(in0,in1,in2,result);

endmodule