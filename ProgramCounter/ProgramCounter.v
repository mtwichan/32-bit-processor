module ProgramCounter(clk, reset, count);

input clk, reset;
output reg [7:0] count = 8'd0;

always @ (posedge clk or negedge reset)
begin
    if (!reset)
        count = 8'd0;
    else
        count = count + 1;
end

endmodule 