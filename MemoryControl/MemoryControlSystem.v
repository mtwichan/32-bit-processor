module MemoryControlSystem(ram_rw_flag, op_code, src1, src2, ram_data_in, ram_data_out, pc_instr_access, address_add_out, alu_result);
	
	// Memory Control
	input ram_rw_flag;
	input [3:0] op_code;
	input [31:0] src1, src2, ram_data_in;

	output [31:0] ram_data_out;
	wire sel_add_wire, sel_ldr_wire;
	wire [15:0] address_add_wire;
	wire [31:0] data_ldr_wire;

	// MUXAddressBus
	input [7:0] pc_instr_access;
	output [15:0] address_add_out;

	// MUXLDRBus
	input[31:0] alu_result;

	MemoryControl MemoryControlMember(
		.src1(src1), 
		.src2(src2), 
		.ram_data_in(ram_data_in), 
		.ram_data_out(ram_data_out), 
		.op_code(op_code), 
		.ram_rw_flag(ram_rw_flag), 
		.sel_ldr_bus(sel_ldr_wire), 
		.sel_add_bus(sel_add_wire), 
		.address_add_bus(address_add_wire), 
		.data_ldr_out(data_ldr_wire) 
	);

	MUXAddressBus MUXAddressBusMember(
		.sel_add_bus(sel_add_wire), 
		.address_bus_in(address_add_wire), 
		.address_bus_out(address_add_out),
		.pc_instr_access(pc_instr_access)
	);

	MUXLDRBus MUXLDRBusMember(
		.sel_ldr_bus(sel_ldr_wire), 
		.alu_result(alu_result), 
		.ram_result(data_ldr_wire), 
		.data_ldr_out(data_ldr_wire)
	);

endmodule
