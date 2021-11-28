module FlagsReg(prevflags, currentflags);
  input [3:0] prevflags;
  output reg [3:0] currentflags;
  
  // currentflags will be the 'inflags' ALU input as these are the updated flags
  // prevflags will be the 'outflags' ALU output as these are the previous isntruction's flags
  // when the previous flags change, update the current flags
  
  always @(prevflags)
  begin
    currentflags = prevflags;
    $display("Flags: %b", currentflags); // Display flags
  end
endmodule
    
