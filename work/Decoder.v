module Decoder(in, out) ;
 parameter n=2 ;
 parameter m=4 ;
 input [n-1:0] in ;
 output [m-1:0] out ;
 assign out = 1'b1<<in ;
endmodule