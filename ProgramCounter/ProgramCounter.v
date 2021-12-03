module ProgramCounter(clk, reset, count, instruction_in, instruction_out);
	input clk, reset;
	output reg [7:0]  count; // 8-bit counter as specified in project description

    input [31:0] instruction_in; // Instruction read from RAM
    output [31:0] instruction_out; // Instruction used by MAB, RBT and ALU
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