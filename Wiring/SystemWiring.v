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
wire rw, sel_ldr, sel_add; 			//read and write flag for ram, select wires for LDR and address mux
wire [15:0] address, add_wire; 			//address bus output, add bus data access
wire [31:0] in1, in2, alu_out,data_ldr,ldr_wire;//outputs 1 and 2 from reg mux, alu result, data output from ldr mux, LDR data from ram
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
	.inflags(currentflags),//might need to be flipped
	.outflags(prevflags),//are these correct?
	.result(alu_out)
	);

FlagsReg flag(
	.prevflags(prevflags),
	.currentflags(currentflags)
	);

MemoryControl MemCtrl(
	.src1(in1), 
	.src2(in2), 
	.ram_data_in(ram_data_in), 
	.ram_data_out(ram_data_out), 
	.op_code(op_code), 
	.ram_rw_flag(rw), 
	.sel_ldr_bus(sel_ldr), 
	.sel_add_bus(sel_add), 
	.address_add_bus(add_wire), 
	.data_ldr_out(data_ldr) 
	);

MUXAddressBus MUXAdd(
	.sel_add_bus(sel_add), 
	.address_add_bus_in(add_wire), 
	.address_add_bus_out(address),
	.pc_instr_access(pc)
	);

MUXLDRBus MUXLDR(
	.sel_ldr_mux(sel_ldr), 
	.alu_result(alu_out), 
	.ram_result(ldr_wire), 
	.data_ldr_out(data_ldr)
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