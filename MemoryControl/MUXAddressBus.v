`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:52:30 11/14/2021 
// Design Name: 
// Module Name:    MUXAddressBus 
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
module MUXAddressBus(select,addBusDataAccess,pcInstructionAccess,AdressBus);
	input select;
	input [31:0] addBusDataAccess, pcInstructionAccess;
	output [31:0] AdressBus;
	
	always@ (select)
		begin
		if(select == 0)
			begin
			AdressBus<=pcInstructionAccess;
			end
		else
			begin
			AdressBus <= addBusDataAccess;
			end
		end
		



endmodule
