module ProgramCounter(clk, reset, count, instruction_in, instruction_out);
	input clk, reset;
	output reg [7:0] count; // 8-bit counter 

    input [31:0] instruction_in; 
    output [31:0] instruction_out; 
    reg [31:0] instruction_out;

    always @(posedge clk or negedge reset) begin
    	if (!reset)
    		count = 8'b0;
    	else begin
			count = count + 1;
            instruction_out = instruction_in;
    	end
    end
endmodule