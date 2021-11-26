`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:40:03 11/13/2021 
// Design Name: 
// Module Name:    Registers 
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
module Registers(Din,enable,q0, q1, q2, q3, q4, q5, q6, q7,q8, q9, q10, q11, q12, q13, q14, q15);
	input [31:0] Din;
	input[15:0] enable;
	output[31:0] q0, q1, q2, q3, q4, q5, q6, q7,q8, q9, q10, q11, q12, q13, q14, q15;
	
	singleRegister32 R0(.en(enable[0]), .q(q0), .Din(Din)); 
	singleRegister32 R1(.en(enable[1]), .q(q1), .Din(Din)); 
	singleRegister32 R2(.en(enable[2]), .q(q2), .Din(Din)); 
	singleRegister32 R3(.en(enable[3]), .q(q3), .Din(Din)); 
	singleRegister32 R4(.en(enable[4]), .q(q4), .Din(Din)); 
	singleRegister32 R5(.en(enable[5]), .q(q5), .Din(Din)); 
	singleRegister32 R6(.en(enable[6]), .q(q6), .Din(Din)); 
	singleRegister32 R7(.en(enable[7]), .q(q7), .Din(Din)); 
	singleRegister32 R8(.en(enable[8]), .q(q8), .Din(Din)); 
	singleRegister32 R9(.en(enable[9]), .q(q9), .Din(Din)); 
	singleRegister32 R10(.en(enable[10]), .q(q10), .Din(Din)); 
	singleRegister32 R11(.en(enable[11]), .q(q11), .Din(Din)); 
	singleRegister32 R12(.en(enable[12]), .q(q12), .Din(Din)); 
	singleRegister32 R13(.en(enable[13]), .q(q13), .Din(Din)); 
	singleRegister32 R14(.en(enable[14]), .q(q14), .Din(Din)); 
	singleRegister32 R15(.en(enable[15]), .q(q15), .Din(Din)); 
	
endmodule