module Rrot(in2, rot_bits, result);
  input [31:0] in2;
  input [4:0] rot_bits;
  output [31:0] result;
  assign result = (in2 >> rot_bits) | (in2 << (32-rot_bits));
endmodule
