module InstructionBank(clk, reset, pc_count, instruction_in, 
	im_val,
	dest, 
	s_bit,
	op_code,
	cond,
	src1,
	src2,
    sr_crtl
    );

	input clk, reset;
	input [7:0] pc_count; // the program counter count (pointer position)
	input [31:0] instruction_in;
    output reg s_bit; 
    output reg [3:0] cond, op_code, dest, src1, src2;	//condition bits, op code, destination bits
    output reg [15:0] im_val;				//immediate value
    output reg [2:0] sr_crtl; 				//shift and rotate control bits
	
	
	always @ (instruction_in) begin
		$display("Program counter: %d || Instruction Fetched... %b", pc_count, instruction_in);

		// feed data returned from memory out
        cond = instruction_in[31:28];
        op_code = instruction_in[27:24];
        s_bit = instruction_in[23];
        dest = instruction_in[22:19];
        src1 = instruction_in[18:15];
        src2 = instruction_in[14:11];
        im_val = instruction_in[18:3];
        sr_crtl = instruction_in[2:0];
	end

endmodule