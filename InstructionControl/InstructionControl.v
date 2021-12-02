module InstructionControl(clk, instruction_in, instruction_out, pc_count, ram_pc_address_out);
    input clk;
    input [7:0] pc_count;
    input [31:0] instruction_in;
    output reg [31:0] instruction_out;
    output reg [15:0] ram_pc_address_out;
    
    always @ (posedge clk)
        begin
            instruction_out = instruction_in;
            ram_pc_address_out = pc_count;
        end

endmodule