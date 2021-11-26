`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:34:48 11/13/2021
// Design Name:   RegisterBank
// Module Name:   /home/retr0/VERILOGGClass/RegisterBank/simulationFoRegisters.v
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

module simulationFoRegisters;

	// Inputs
	reg [3:0] destination;

	// Outputs
	wire [15:0] registerAddress;

	// Instantiate the Unit Under Test (UUT)
	RegisterBank uut (
		.destination(destination), 
		.registerAddress(registerAddress)
	);

	initial begin
		// Initialize Inputs
		destination = 0;
		#5 destination = 4'h1;
		#5 destination = 4'h2;
		#5 destination = 4'h3;
		#5 destination = 4'h4;
		#5 destination = 4'h5;
		#5 destination = 4'h6;
		#5 destination = 4'h7;
		#5 destination = 4'h8;
		#5 destination = 4'h9;
		#5 destination = 4'hA;
		#5 destination = 4'hB;
		#5 destination = 4'hC;
		#5 destination = 4'hD;
		#5 destination = 4'hE;
		#5 destination = 4'hF;
	end
	initial begin
		$monitor("output=%d",registerAddress);
	end
      
endmodule

