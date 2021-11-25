module SysWiring(instr, result);//inputs and outs to the system?? 
cond, op_code, s_bit, dest, im_val, src1, src2, in1, in2, alu_out, pc, data_ldr, data_ram_in, data_ram_out, rw, address, ??en, ??fetch_out, ??fetch_address

input [31:0] instr;
reg [3:0] cond, op_code, dest, src1, src2;
reg s_bit;
wire rw;
wire [15:0] im_val, address;
wire [7:0] pc;
wire [31:0] in1, in2, alu_out, data_ldr, ram_data_in, ram_data_out;  
//??? wire en;
//??? wire [31:0] fetch_out;
//??? wire [15:0] fetch_address;

//separate intruction into its individul portions
assign cond = instr[31:28];
assign op_code = instr[27:24];
assign s_bit = instr [23];
assign dest = instr[22:19];
assign src1 = instr[18:15];
assign src2 = instr[14:11];
assign im_val = instr[18:3];
//shift and ROR???

ALU alu_comp(
	.in1(in1), 
	.in2(in2),
	.sbit(s_bit), 
	.cond(cond),
	.opcode(op_code),
	.srcontrol(),
	.imvalue(im_val),
	.inflags(),
	.outflags(),
	.result(alu_out)
	);

RegisterBank reg_comp(
	.dest(dest),
	.Din(data_ldr),
	.srcadd1(src1),
	.srcadd2(src2),
	.src1(in1),
	.src2(in2)
	);

MemoryControlSystem mem_comp(
	.ram_rw_flag(rw),
	.op_code(op_code),
	.src1(in1),
	.src2(in2),
	.ram_data_in(ram_data_in),
	.ram_data_out(ram_data_out),
	.pc_instr_access,
	.address_add_out,
	.alu_result
	);

Ram ram_comp(
	.enable(en),
	.read_write(rw),
	.fetch_address(fetch_address),
	.address(address),
	.data_in(ram_data_in),
	.data_out(ram_data_out),//do these need to be switched?
	.fetch_out(fetch_out)
	);
end