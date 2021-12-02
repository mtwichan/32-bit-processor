module Mux21 (select, src1, src2, out);
	parameter size = 32;
	input select;
	input [size-1:0] src1, src2;
	output [size-1:0] out; 

	assign out = select ? src1: src2;
endmodule