module MemoryControl(source_1, source_2, op_code, data_in, data_out, read_write, address, LDR, alu_result, PC_instruction);
	
    //ins
	input [3:0] op_code;
	input [15:0] PC_instruction;
	input [31:0] source_1, source_2, alu_result, data_in;
	
	// outs
	output reg read_write;
	output [15:0] address;
	output [31:0] data_out, LDR;
	
	//helper Variables
	reg LDR_select;
	reg address_select;
	
    // Initiation of src2
    assign data_out = source_2;

	Mux21 LDR_mux(LDR_select, alu_result, data_in, LDR);
	Mux21 #(16) address_mux(address_select, source_1[15:0], PC_instruction, address);

	always @ (*) 
		begin
			case (op_code)
				4'b1001: // Opcode -> LDR
					begin
                        LDR_select = 0;// loadFromRam
                        read_write = 1; //readFromRam
                        address_select = 1; // get address from src1
					end
				4'b1010: // Opcode -> STR
					begin
                        LDR_select = 1;// loadFRomsrc
                        read_write = 0; //writefromram
                        address_select = 1; // get address from src1
					end
				default: // OPcode -> neither LDR or STR
					begin
                        LDR_select = 0;// loadFRomsrc
                        read_write = 0; //writefromram
                        address_select = 1; // get address from pc_instruction

					end
			endcase
	
		end
	always @(*) 
	begin
	$display("LDR: %b", LDR);
    $display("dataIn: %b", data_in);
    $display("dout: %b", data_out);
	end
endmodule

