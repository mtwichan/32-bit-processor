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
module Registers(select,Din,rst,q0, q1, q2, q3, q4, q5, q6, q7,q8, q9, q10, q11, q12, q13, q14, q15);
	input [31:0] Din;
	input[15:0] select;
	input rst;
	output reg [31:0] q0, q1, q2, q3, q4, q5, q6, q7,q8, q9, q10, q11, q12, q13, q14, q15;
	
	always @ (Din)
	begin
		case(select)
		
		4'd0: q0<=Din;
		4'd1: q1<=Din;
		4'd2: q2<=Din;
		4'd3: q3<=Din;
		4'd4: q4<=Din;
		4'd5: q5<=Din;
		4'd6: q6<=Din;
		4'd7: q7<=Din;
		4'd8: q8<=Din;
		4'd9: q9<=Din;
		4'd10: q10<=Din;
		4'd11: q11<=Din;
		4'd12: q12<=Din;
		4'd13: q13<=Din;
		4'd14: q14<=Din;
		4'd15: q15<=Din;
		endcase
	end
	
	always @ (negedge rst)
	begin
		 q0<=0;
		q1<=0;
		q2<=0;
		 q3<=0;
		 q4<=0;
		 q5<=0;
		 q6<=0;
		 q7<=0;
		 q8<=0;
		 q9<=0;
		 q10<=0;
		 q11<=0;
		 q12<=0;
		 q13<=0;
		 q14<=0;
		 q15<=0;
	end
endmodule