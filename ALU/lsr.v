module LSR(in2, shift_bits, result);
  input [31:0] in2;
  input [4:0] shift_bits;
  output [31:0] result;
  assign result = in2 >> shift_bits;
endmodule
