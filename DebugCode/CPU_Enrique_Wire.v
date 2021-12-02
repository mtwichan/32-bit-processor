`timescale 1 ns/10 ps

module CPU_Enrique ;
    
//Wires
wire [15:0] addressToRam;
wire [31:0] data_in, data_out;
wire [31:0] source_2, source_1;
wire [31:0] result; // Output from ALU
wire [31:0] LDR;
wire [15:0] PC_out;
wire read_write; // to RAM

//HelperVariables
wire [3:0] prev_flags, current_flags; 

//reg
reg enable;

reg [31:0]  raw_instruction;

// Instructions Brokedown 
//wire [31:0] instruction; 
wire [3:0] condition;
wire [3:0] op_code;
wire s_bit;
wire [3:0] destination;
wire [3:0] source_2_selection;
wire [3:0] source_1_selection;
wire [15:0] immediate_value;
wire [1:0] current_state;

//extra Instruction Breakdown
reg [2:0] sr_crtl;

assign condition = raw_instruction[31:28];
assign op_code = raw_instruction[27:24];
assign s_bit = raw_instruction[23];
assign destination = raw_instruction[22:19];
assign source_2_selection = raw_instruction[18:15];
assign source_1_selection = raw_instruction[14:11];
assign immediate_value = raw_instruction[18:3];
//Asssigning Extra Instructuons
assign sr_crtl = raw_instruction[2:0];


//Modules Setup
//module ALU(source_1, source_2, sbit, cond, opcode, srcontrol(shiftRotateControl), imvalue, inflags, outflags, result);
ALU ALU(.in1(source_1), .in2(source_2), .sbit(s_bit), .cond(condition), .opcode(op_code), .srcontrol(sr_crtl), .imvalue(immediate_value), .inflags(prev_flags), .outflags(current_flags), .result(result));

//module MemoryControl(source_1, source_2, op_code, data_in, data_out, read_write, address, LDR, alu_result, PC_instruction);
MemoryControl MemCtrl(.source_1(source_1), .source_2(source_2), .op_code(op_code), .data_in(data_in), .data_out(data_out), .read_write(read_write), .address(addressToRam), .LDR(LDR), .alu_result(result), .PC_instruction(PC_out));

//RegisterBank(dest,Din,srcadd1,srcadd2,src1,src2);
RegisterBank RB(.dest(destination),.Din(LDR),.srcadd1(source_1_selection),.srcadd2(source_2_selection),.src1(source_1),.src2(source_2));

//(enable,readWrite,address,dataIn,dataOut);
RAM ram (.enable(enable),.readWrite(read_write), .address(addressToRam), .dataIn(data_in), .dataOut(data_out));

//MOOOCKKK PC

initial begin
	
 raw_instruction = 0;
 enable = 1;

//MOV R3,#4

#5 raw_instruction = 32'b00000110000110000000000000100000;
//MOV R8,#4
#5 raw_instruction = 32'b00000110010000000000000000100000;
//CMP R3, R8 
#5 raw_instruction = 32'b00001000000000011100000000000000;
//ADDGT R1, R3, R8
#5 raw_instruction = 32'b00100000000010011100000000000000;
// MULEQ R2, R3, R8 LSR#1
#5 raw_instruction = 32'b00010010000100011100000001000001;
//SUBS R7, R8, R2
#5 raw_instruction = 32'b00000001101111000001000000000000;
//NOP
#5 raw_instruction = 32'b00001111000000000000000000000000;
//NOP
#5 raw_instruction = 32'b00001111000000000000000000000000;
//MOV R9, #0
#5 raw_instruction = 32'b00000110010010000000000000000000;
//LDR R10, [R9]
#5 raw_instruction = 32'b00001001010101001000000000000000;
//NOP
#5 raw_instruction = 32'b00001111000000000000000000000000;
//NOP
#5 raw_instruction = 32'b00001111000000000000000000000000;
//NOP
#5 raw_instruction = 32'b00001111000000000000000000000000;
//MOV R11, #0
#5 raw_instruction = 32'b00000110010110000000000000000000;
//MOV R6, #26947
#5 raw_instruction = 32'b00000110000100110100101000011000;
//STR R6, [R11]
#5 raw_instruction = 32'b00001010000001011011000000000000;
//NOP
#5 raw_instruction = 32'b00001111000000000000000000000000;
//NOP
#5 raw_instruction = 32'b00001111000000000000000000000000;
//NOP
#5 raw_instruction = 32'b00001111000000000000000000000000;
//NOP
#5 raw_instruction = 32'b00001111000000000000000000000000;
//NOP
#5 raw_instruction = 32'b00001111000000000000000000000000;

end

endmodule


/*
wire [15:0] address; //From MAB to RAM_CPU
	wire read_write; // From MAB to RAM
	wire [31:0] data_in; // From MAB to RAM
	wire [31:0] data_out; // From RAM to MAB and State Machine

	wire [31:0] source_1; // From RBT to ALU
	wire [31:0] source_2; // From RBT to ALU

	wire [31:0] result; // From ALU to MAB

	wire [31:0] LDR; // From MAB to RBT

	wire [15:0] PC_out; // From state machine to MAB
	
	reg Enable, clk, reset;

	//Break up instruction into components
	wire [31:0] instruction; // From state machine
	wire [3:0] condition;
	wire [3:0] op_code;
	wire s_bit;
	wire [3:0] destination;
	wire [3:0] source_2_selection;
	wire [3:0] source_1_selection;
	wire [15:0] immediate_value;
	wire [1:0] current_state;
	wire [3:0] flags;

	assign condition = instruction[31:28];
	assign op_code = instruction[27:24];
	assign s_bit = instruction[23];
	assign destination = instruction[22:19];
	assign source_2_selection = instruction[18:15];
	assign source_1_selection = instruction[14:11];
	assign immediate_value = instruction[18:3];

	//Submodules

	ALU ALU_CPU(op_code, source_2, source_1, immediate_value, condition, s_bit, result, flags);

	memory_access_block MAB_CPU(reset, data_out, data_in, read_write, address, LDR, source_1, source_2, result, op_code, PC_out);

	reg_bank_toplevel RBT_CPU(destination, LDR, source_1_selection, source_2_selection, source_1, source_2);

	
	memory RAM_CPU(Enable,read_write,address,data_in, data_out);

	state_machine SM_CPU(clk, reset, data_out, instruction, PC_out, current_state);
	
	initial
	begin
	
	//$readmemb("final_presentation.txt", RAM_CPU.Mem);
	$readmemb("load_ram.txt", RAM_CPU.Mem);
	//$readmemb("example.txt", RAM_CPU.Mem);
	reset = 1; clk = 0; Enable = 0;
	#5 reset = 0;
	#5 reset = 1; Enable = 1;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	
	#10
	$writememb("ram_results.txt", RAM_CPU.Mem);
	end
	initial
	begin
	$monitor($time, "\n ============== \n Program Counter: %d\nINSTRUCTIONS:\n Instruction: %b\n Op_code: %b\n Conditional: %b\n S-bit %b\n\nREGISTERS:\n Source 1 Register: %d\n Source 2 Register: %d\n Result Register: %d\n\nDEC RESULTS:\n Source 1: %d\n Source 2: %d\n Result: %d\n\n Flags: %b\n\nBIN RESULTS\n Source 1: %b\n Source 2: %b\n Result: %b\n\nRAM:\n Read/Write: %b\n Address: %d\n",PC_out, instruction, op_code,condition,s_bit,source_1_selection,source_2_selection,destination,source_1,source_2,result,flags,source_1,source_2,result,read_write,address);
	end
endmodule
*/