`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:57:16 11/13/2021
// Design Name:   Registers
// Module Name:   /home/retr0/VERILOGGClass/RegisterBank/TestReg.v
// Project Name:  RegisterBank
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Registers
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestReg;

	// Inputs
	reg [15:0] select;
	reg [31:0] Din;
	reg rst;

	// Outputs
	wire [31:0] q0;
	wire [31:0] q1;
	wire [31:0] q2;
	wire [31:0] q3;
	wire [31:0] q4;
	wire [31:0] q5;
	wire [31:0] q6;
	wire [31:0] q7;
	wire [31:0] q8;
	wire [31:0] q9;
	wire [31:0] q10;
	wire [31:0] q11;
	wire [31:0] q12;
	wire [31:0] q13;
	wire [31:0] q14;
	wire [31:0] q15;

	// Instantiate the Unit Under Test (UUT)
	Registers uut (
		.select(select), 
		.Din(Din),
		.q0(q0), 
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
		.q15(q15)
	);

	initial begin
		// Initialize Inputs
		select = 0;
		Din = 0;

		// Wait 100 ns for global reset to finish
		#100;
      #5 select = 0;
		#5 Din = 10;
		#5 select = 1;
		#5 Din = 11;
		#5 select = 2;
		#5 Din = 12;
		#5 select = 3;
		#5 Din = 13;
		#5 select = 4;
		#5 Din = 14;
		#5 select = 5;
		#5 Din = 15;    
		#5 select = 6;
		#5 Din = 16;
		#5 select = 7;
		#5 Din = 17;
      #5 select = 8;
		#5 Din = 18;
		#5 select = 9;
		#5 Din = 19;
		#5 select = 010;
		#5 Din = 111;
		#5 select = 11;
		#5 Din = 122;
		#5 select = 12;
		#5 Din = 133;
		#5 select = 013;
		#5 Din = 144;
		#5 select = 014;
		#5 Din = 155;
		#5 select = 015;
		#5 Din = 166;

		
		// Add stimulus here

	end
      
endmodule

