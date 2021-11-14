`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:51:27 11/13/2021
// Design Name:   RegisterBank
// Module Name:   /home/retr0/VERILOGGClass/RegisterBank/TopModuleTestRegisterBank.v
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

module TopModuleTestRegisterBank;

	// Inputs
	reg [3:0] dest;
	reg [31:0] Din;
	reg [3:0] srcadd1;
	reg [3:0] srcadd2;
	
	


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
        
		// Add stimulus here

	end
      
endmodule

