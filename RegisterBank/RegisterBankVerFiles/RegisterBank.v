`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:05:12 11/13/2021 
// Design Name: 
// Module Name:    RegisterBank 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RegisterBank(dest,Din,srcadd1,srcadd2,src1,src2);
	input [3:0] dest,srcadd1,srcadd2;
	input [31:0] Din ;
	output [31:0] src1,src2;
	wire [15:0] registerAddress;
	wire [31:0] q0, q1, q2, q3, q4, q5, q6, q7,q8, q9, q10, q11, q12, q13, q14, q15;
		
	Decoder4to16 dec(.in(dest), .out(registerAddress));
	
	Registers regi(.Din(Din), .enable(registerAddress),.q0(q0), 
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
		.q15(q15));
		
	MUX161 mux1(.select(srcadd1), .out(src1),.q0(q0),.q1(q1), 
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
