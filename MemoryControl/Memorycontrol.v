//////////////////////////////////////////////////////////////////////////////////
// Instruction Description Op Code
// ADD R1, R2, R3 (R1=R2+R3) 0000
// SUB R1, R2, R3 (R1=R2-R3) 0001
// MUL R1, R2, R3 (R1=R2*R3) 0010
// ORR R1, R2, R3 (R1=R2 OR R3) 0011
// AND R1, R2, R3 (R1=R2 AND R3) 0100
// EOR R1, R2, R3 (R1=R2 XOR R3) 0101
// MOV R1, n Initialize R1 with a 16-bit immediate value n, 0 <= n <= (216 − 1) 0110
// MOV R1, R2 Copy R2 to R1 0111
// CMP R1, R2 Compare R1 with R2 and set the status flags 1000
// LDR R2, [R1] Load R2 with the contents at memory address R1 1001
// STR R2, [R1] Store R2 at memory address R1 1010
// NOP No Operation - Skip this instruction 1111
//////////////////////////////////////////////////////////////////////////////////
module MemoryControl(src1, src2, op_code, ram_data_in, ram_data_out, ram_rw_flag, sel_ldr_bus, sel_add_bus, address_add_bus, data_ldr_out);
	
	input [3:0] op_code; // op code from instruction fetch
	input [31:0] src1, src2, ram_data_in; // source 1/2 and data from ram 

	// LDR MUX
	output reg sel_add_bus; // LDR = 1 OR STR = 1 
	output reg [31:0] data_ldr_out;

	// ADD BUS MUX
	output reg sel_ldr_bus; // LDR ? 1 : 0
	output reg [15:0] address_add_bus;

	// RAM
	output reg ram_rw_flag; // RAM -> Read (1) = LDR / Write (1) = STR 
	output reg [31:0] ram_data_out; // RAM data to read/write

	always @ (*) 
		begin
			case (op_code)
				4'b1001: // Opcode -> LDR
					begin
						// LDR MUX 						
						sel_ldr_bus = 1'b1;
						data_ldr_out = ram_data_in;

						// ADD BUS MUX
						sel_add_bus = 1'b1;
						address_add_bus = src1[15:0]; 

						// RAM
						ram_rw_flag = 1'b1;
					end
				4'b1010: // Opcode -> STR
					begin
						// LDR MUX
						sel_ldr_bus = 0'b1;
	
						// ADD BUS MUX
						sel_add_bus = 1'b1;
						address_add_bus = src1[15:0];

						// RAM
						ram_rw_flag = 1'b0;
						ram_data_out = src2;
					end
				default: // OPcode -> neither LDR or STR
					begin
						// LDR MUX
						sel_ldr_bus = 1'b0;
						
						// ADD BUS MUX
						sel_add_bus = 1'b0;

						// RAM
						ram_rw_flag = 1'b0;
					end
			endcase
	end
endmodule
