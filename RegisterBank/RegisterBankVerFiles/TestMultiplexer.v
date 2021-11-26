`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:17:01 11/13/2021
// Design Name:   MUX161
// Module Name:   /home/retr0/VERILOGGClass/RegisterBank/TestMultiplexer.v
// Project Name:  RegisterBank
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX161
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestMultiplexer;

	// Inputs
	reg [3:0] select;
	reg [31:0] q0;
	reg [31:0] q1;
	reg [31:0] q2;
	reg [31:0] q3;
	reg [31:0] q4;
	reg [31:0] q5;
	reg [31:0] q6;
	reg [31:0] q7;
	reg [31:0] q8;
	reg [31:0] q9;
	reg [31:0] q10;
	reg [31:0] q11;
	reg [31:0] q12;
	reg [31:0] q13;
	reg [31:0] q14;
	reg [31:0] q15;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	MUX161 uut (
		.select(select), 
		.out(out), 
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
		q0 = 0;
		q1 = 1;
		q2 = 2;
		q3 = 3;
		q4 = 4;
		q5 = 5;
		q6 = 6;
		q7 = 7;
		q8 = 8;
		q9 = 9;
		q10 = 10;
		q11 = 20;
		q12 =30;
		q13 = 40;
		q14 = 50;
		q15 = 60;

		// Wait 100 ns for global reset to finish
		#100;
		select = 0;
		
		#5 select = 4'h1;
		#5 select = 4'h2;
		#5 select = 4'h3;
		#5 select = 4'h4;
		#5 select = 4'h5;
		#5 select = 4'h6;
		#5 select = 4'h7;
		#5 select = 4'h8;
		#5 select = 4'h9;
		#5 select = 4'hA;
		#5 select = 4'hB;
		#5 select = 4'hC;
		#5 select = 4'hD;
		#5 select = 4'hE;
		#5 select = 4'hF;
	end
		initial begin
		$monitor("output=%d",out);
	end
      
endmodule

