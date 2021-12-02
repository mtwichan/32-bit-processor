module ProgramCounter(clk, reset, pc_count);

input clk, reset;
output reg [7:0] pc_count = 8'd0;

always @ (posedge clk or negedge reset)
begin
    if (!reset)
        pc_count = 8'd0;
    else
        pc_count = pc_count + 1;
end

endmodule