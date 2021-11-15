module test_addMux;
	reg in0;
	reg [7:0] in1;
	reg [15:0] in2;
	wire [15:0] result;
	initial
	begin
	    in0=1'b1; in1=8'b0; in2=16'b0;
	#10 in0=1'b0; in1=8'b1; in2=16'b0000001100100100;
	#10 in0=1'b0; in1=8'b0110; in2=16'b0100000100100101;
	#10 in0=1'b0; in1=8'b1010; in2=16'b0000001100100100;
	#10 in0=1'b1; in1=8'b10011100; in2=16'b1100001001010110;
	end

	initial
	begin
	$monitor($time," 1st num.%b, 2nd num.=%b, 3rd num.=%b, output=%b",in0,in1,in2,result);
	end

	MUXAddressBus bus(in0,in1,in2,result);

endmodule