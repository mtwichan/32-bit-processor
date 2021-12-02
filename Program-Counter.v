module ProgramCounter (reset, pc);
input reset; //possible input if a reset funtion is needed?
output reg [7:0] pc = 8'b0; //program counter
wire pc_flag = 1'bx;//flag to initiate pc increment
reg sel_ldr;
reg sel_add;

assign pc_flag = sel_ldr | sel_add; //so the intention is when this assign statement... 
				//...updates (from ldr or str select updating)...

always @(reset, pc_flag)//...this will then increment once or reset 
	begin
		if (reset)
		pc <= 8'b00000000;
		else
		pc <= pc + 1;
	end

MemoryControl MemCrtl(
	.sel_ldr_bus(sel_ldr),
	.sel_add_bus(sel_add)
	);
endmodule