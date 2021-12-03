module Compare(in1, in2, flags);
  input [31:0] in1, in2;
  output reg [3:0] flags; // {N, Z, C, V}
  reg [31:0] temp_res;
  reg [2:0] temp_msb;
  
  always @ (*)
  begin
    temp_res = in1 - in2; // definition of CMP instruction
    flags[3] = (temp_res[31] == 1)? 1'b1 : 1'b0; // if the MSB = 1, it's neg
    flags[2] = !(|temp_res); // inverted bitwise OR to see if result=0
    flags[1] = (in1 < in2)? 1'b1 : 1'b0; // carry occurs if in1 < in2 for subtraction
    temp_msb = {in1[31], in2[31], temp_res[31]};
    flags[0] = (temp_msb == 3'b100)? 1'b1 : ((temp_msb == 3'b011)? 1'b1 : 1'b0);
 	  // (-in1)-(+in2) > 0 trips flag; (+in1)-(-in2) < 0 trips flag
 	end
endmodule
