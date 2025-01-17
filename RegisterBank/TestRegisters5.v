`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:54:42 11/13/2021
// Design Name:   RegisterBank
// Module Name:   /home/retr0/VERILOGGClass/RegisterBank/PLEASEWORK.v
// Project Name:  RegisterBank
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterBank
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PLEASEWORK;

	// Inputs
	reg [3:0] dest;
	reg [31:0] Din;
	reg [3:0] srcadd1;
	reg [3:0] srcadd2;

	// Outputs
	wire [31:0] src1;
	wire [31:0] src2;

	// Instantiate the Unit Under Test (UUT)
	RegisterBank uut (
		.dest(dest), 
		.Din(Din), 
		.srcadd1(srcadd1), 
		.srcadd2(srcadd2), 
		.src1(src1), 
		.src2(src2)
	);

	initial begin
		// Initialize Inputs
		dest = 0;
		Din = 0;
		srcadd1 = 0;
		srcadd2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		 dest = 1;
		 Din = 1;
		 #10
		 dest = 4;
		 Din = 19;
		 #5
		 Din = 4'bzzzz;
		 srcadd1 = 1; 
		 srcadd2 = 4; 
		// Add stimulus here

	end
      
endmodule

