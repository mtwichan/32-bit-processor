`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:53:50 11/14/2021 
// Design Name: 
// Module Name:    MUXLDR 
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
module MUXLDR(select,fromRam,fromALU,toRegisters);
	input select;
	input [31:0] fromRam, fromALU;
	output [31:0] toRegisters;
	
	always@ (select)
		begin
		if(select == 0)
			begin
			toRegisters<=fromALU;
			end
		else
			begin
			toRegisters <= fromRam;
			end
		end
		

		

endmodule
