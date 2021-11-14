`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:11:35 11/13/2021 
// Design Name: 
// Module Name:    singleRegister32 
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
module singleRegister32(en,q,Din);
	input en;
	input [31:0] Din;
	output [31:0] q;
	reg [31:0] q;
	
	always @ (en, Din)
	begin
			if(en && !(Din === 1'bz))
				q = Din;
	end 


endmodule
