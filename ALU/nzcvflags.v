module Flags(in1, in2, s_bit, opcode, op_result, flags);
  input [31:0] in1, in2, op_result;
  input [3:0] opcode;
  input s_bit;
  output reg [3:0] flags; // {N, Z, C, V}
  reg [2:0] temp_msb;
  
  always @*
  begin
    // check if opcode is CMP instruction; the result is the flags
    if ((opcode == 4'b1000) && (s_bit == 1))
      flags = op_result[3:0];
    
    // check if s-bit is enabled and if opcode is NOP instruction
    else if (s_bit && !(opcode == 4'b1111))
    begin
      // for N, result is negative if the MSB = 1
      flags[3] = (op_result[31])? 1'b1 : 1'b0;
      // for Z, result is zero if all bits are zero (inverted bitwise OR)
      flags[2] = !(|op_result);
  	     
	    case(opcode)
	       // check carry and overflow for addition
	       4'b0000: begin
	                  // for C, addition result has carry if result < in1 
	                  flags[1] = (op_result < in1)? 1'b1 : 1'b0;
	                  // for overflow, addition result has overflow if the MSB is different than both input MSBs
	                  flags[0] = (in1[31] == in2[31])? ((in1[31]^op_result[31])? 1'b1 : 1'b0) :  1'b0;
                  end
        
         // check carry and overflow for subtraction
 	       4'b0001: begin
 	          	       // for C, subtraction result has carry if in1 < in2 
  	                 flags[1] = (in1 < in2)? 1'b1 : 1'b0;
 	                  // for V, subtraction result has overflow if (-in1)-(+in2) > 0 or if (+in1)-(-in2) < 0
  	                 temp_msb = {in1[31], in2[31], op_result[31]};
  	                 flags[0] = (temp_msb == 3'b100)? 1'b1 : ((temp_msb == 3'b011)? 1'b1 : 1'b0);
 	                end
 	                
 	       // multiplication instruction preserves V but C is meaningless so set it to zero
 	       4'b0010: flags[1] = 1'b0;
 	       
 	       // move instruction preserves V but not C
 	       4'b0110: flags[1] = 1'b0;
 	       
 	       // move instruction preserves V but not C
 	       4'b0111: flags[1] = 1'b0;
 	       
 	       // default case for other instructions
 	       default: begin
 	                  // set carry and overflow flags back to zero
 	                  flags[1] = 1'b0;
 	                  flags[0] = 1'b0;
 	                end
 	     endcase
 	  end
 	  else
 	    ; // do nothing to fill else   
 	end
endmodule