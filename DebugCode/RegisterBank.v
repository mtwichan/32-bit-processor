`timescale 1ns / 1ps

module RegisterBank(dest,Din,srcadd1,srcadd2,src1,src2);
	input [3:0] dest,srcadd1,srcadd2;
	input [31:0] Din ;
	output [31:0] src1,src2;
	wire [15:0] registerAddress;
	wire [31:0] q0, q1, q2, q3, q4, q5, q6, q7,q8, q9, q10, q11, q12, q13, q14, q15;
		
	always @(*) 
	begin
		$display("dest: %b", dest);
		$display("Din: %b", Din);		
		$display("srcadd1: %b", srcadd1);		
		$display("srcadd2: %b", srcadd2);
		$display("src1:", src1);
		$display("src2:", src2);
	end 

	Decoder4to16 dec(.in(dest), .out(registerAddress));
	
	Registers regi(.Din(Din), .enable(registerAddress), 
		.q0(q0), 
		.q1(q1), 
		.q2(q2), 
		.q3(q3), 
		.q4(q4), 
		.q5(q5), 
		.q6(q6), 
		.q7(q7), 
		.q8(q8), 
		.q9(q9), 
		.q10(q10), 
		.q11(q11), 
		.q12(q12), 
		.q13(q13), 
		.q14(q14), 
		.q15(q15)
		);

		
	MUX161 mux1(.select(srcadd1), .out(src1), .q0(q0), .q1(q1), 
		.q2(q2), 
		.q3(q3), 
		.q4(q4), 
		.q5(q5), 
		.q6(q6), 
		.q7(q7), 
		.q8(q8), 
		.q9(q9), 
		.q10(q10), 
		.q11(q11), 
		.q12(q12), 
		.q13(q13), 
		.q14(q14), 
		.q15(q15));
	
	MUX161 mux2(.select(srcadd2), .out(src2),.q0(q0),.q1(q1), 
		.q2(q2), 
		.q3(q3), 
		.q4(q4), 
		.q5(q5), 
		.q6(q6), 
		.q7(q7), 
		.q8(q8), 
		.q9(q9), 
		.q10(q10), 
		.q11(q11), 
		.q12(q12), 
		.q13(q13), 
		.q14(q14), 
		.q15(q15));

		
endmodule
