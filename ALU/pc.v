module PC(clk, reset, counter);
  input clk, reset;
  output reg [7:0] counter;
  
  always @(posedge clk)
  begin
    if (!reset)
      counter <= 8'b00000000;
    else
      counter <= counter + 1;
  end
endmodule