module Flags(in1, in2, s_bit, opcode, op_result, flags);
  input [31:0] in1, in2, op_result;
  input [3:0] opcode;
  input s_bit;
  output reg [3:0] flags; // {N, Z, C, V}
  reg [2:0] temp_msb;
  
  always @*
  begin
    // check if opcode is CMP instruction; the result is the flags
    if (opcode == 4'b1000)
      flags = op_result[3:0];
    
    // check if s-bit is enabled and that it's not NOP
    else if (s_bit && !(opcode == 4'b1111))
      begin
        flags = 4'b0000; // set default value
        flags[3] = (op_result[31] == 1)? 1'b1 : 1'b0; // if the MSB = 1, it's neg
        flags[2] = !(|op_result); // inverted bitwise OR to see if result=0
  	     
  	     // check carry and overflow for addition
  	     if (opcode == 4'b0000)
  	     begin
  	       flags[1] = (op_result < in1)? 1'b1 : 1'b0; // carry
  	       flags[0] = (in1[31] == in2[31])? ((in1[31]^op_result[31])? 1'b1 : 1'b0) :  1'b0; // ADDITION: same input MSBs, different result MSB.
        end
        
        // check carry and overflow for subtraction
   	    else if (opcode == 4'b0001)
   	      begin
   	        flags[1] = (in1 < in2)? 1'b1 : 1'b0; // carry
   	        temp_msb = {in1[31], in2[31], op_result[31]};
   	        flags[0] = (temp_msb == 3'b100)? 1'b1 : ((temp_msb == 3'b011)? 1'b1 : 1'b0); // SUBTRACTION: (-in1)-(+in2) > 0 trips flag; (+in1)-(-in2) < 0 trips flag
 	        end
 	    end
 	  else
 	    temp_msb = 0; // do nothing to fill else   
 	end
endmodule
