module SysWiring(instr);//inputs and outs to the system?? not sure how we will be outputing everything needed 
//assumed seperate code needed to implement into the registers in order to output to the monitor.
//do we need some more code in here to fetch the next instruction??

//define variables
input [31:0] instr;				//input instruction
reg [7:0] pc;					//pc instruction access, possibly an input??
reg s_bit; 
reg [3:0] cond, op_code, dest, src1, src2;	//condition bits, op code, destination bits
reg [15:0] im_val				//immediate value
reg [2:0] sr_crtl; 				//shift and rotate control bits
wire rw; 					//read and write flag for ram
wire [15:0] address; 				//address bus output
wire [31:0] in1, in2, alu_out, data_ldr;	//outputs 1 and 2 from reg mux, alu result, data output from ldr mux 
wire [31:0] fetch_out,ram_data_in,ram_data_out;	//instruction fetch, ram data in and out
wire [15:0] fetch_address; 			//not super sure about this, matthew will review
wire [3:0] prevflags, currentflags; 		//NZCV clag updates from the ALU

//separate intruction into its individul portions
assign cond = instr[31:28];
assign op_code = instr[27:24];
assign s_bit = instr[23];
assign dest = instr[22:19];
assign src1 = instr[18:15];
assign src2 = instr[14:11];
assign im_val = instr[18:3];
assign sr_crtl = instr[2:0];

//instantiate all modules and connect wires (I don't think order matters here?)
RegisterBank reg_comp(
	.dest(dest),
	.Din(data_ldr),
	.srcadd1(src1),
	.srcadd2(src2),
	.src1(in1),
	.src2(in2)
	);

ALU alu_comp(
	.in1(in1), 
	.in2(in2),
	.sbit(s_bit), 
	.cond(cond),
	.opcode(op_code),
	.srcontrol(sr_crtl),
	.imvalue(im_val),
	.inflags(prevflags),//I'm assuming I dont have to input anything into the NZCV flags?
	.outflags(currentflags),//are these correct?
	.result(alu_out)
	);

FlagsReg flag(
	.prevflags(prevflags),
	.currentflags(currentflags)
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
	.read_write(rw),//got rid of the enable
	.fetch_address(fetch_address),//possibly changing after matthew reviews
	.address(address),
	.data_in(ram_data_in),//do these need to be switched?
	.data_out(ram_data_out),//do these need to be switched?
	.fetch_out(fetch_out)
	);

endmodule