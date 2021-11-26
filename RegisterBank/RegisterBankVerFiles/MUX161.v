`timescale 1ns / 1ps
module MUX161(select,out,q0, q1, q2, q3, q4, q5, q6, q7,q8, q9, q10, q11, q12, q13, q14, q15);
	input [3:0] select;
	input [31:0] q0, q1, q2, q3, q4, q5, q6, q7,q8, q9, q10, q11, q12, q13, q14, q15;
	output reg [31:0] out;
	
	
  always @ (select,q0, q1, q2, q3, q4, q5, q6, q7,
            q8, q9, q10, q11, q12, q13, q14, q15)
  begin
    case (select)                                                    
		4'b0000 : out = q0;
		4'b0001 : out = q1;
		4'b0010 : out = q2;
		4'b0011 : out = q3;
		4'b0100 : out = q4;
		4'b0101 : out = q5;
		4'b0110 : out = q6;
		4'b0111 : out = q7;
		4'b1000 : out = q8;
		4'b1001 : out = q9;
		4'b1010 : out = q10;
		4'b1011 : out = q11;
		4'b1100 : out = q12;
		4'b1101 : out = q13;
		4'b1110 : out = q14;
		4'b1111 : out = q15; 
		default : out = 4'bzzzz; 
    endcase
  end

endmodule
