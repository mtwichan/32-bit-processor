`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:53:22 11/14/2021
// Design Name:   Memorycontrol
// Module Name:   /home/retr0/VERILOGGClass/MemoryControl/MCCTest.v
// Project Name:  MemoryControl
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Memorycontrol
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MCCTest;

	// Inputs
	reg [31:0] src1;
	reg [31:0] src2;
	reg [3:0] opCode;
	reg selectAddBus;
	reg [31:0] dataBusIn;
	reg dataOutLDR;

	// Outputs
	wire selectLDR;
	wire RW;
	wire [15:0] AddbusDataAcess;
	wire [31:0] dataBusOut;

	// Instantiate the Unit Under Test (UUT)
	Memorycontrol uut (
		.src1(src1), 
		.src2(src2), 
		.opCode(opCode), 
		.selectLDR(selectLDR), 
		.selectAddBus(selectAddBus), 
		.RW(RW), 
		.AddbusDataAcess(AddbusDataAcess), 
		.dataBusIn(dataBusIn), 
		.dataBusOut(dataBusOut), 
		.dataOutLDR(dataOutLDR)
	);



      
endmodule

