module MUXLDRBus(sel_ldr_mux, ram_result, alu_result, data_ldr_out);
	input sel_ldr_mux; // Memory control -> LDR ? 1 : 0
	input [31:0] ram_result, alu_result; // Data from ram and ALU
	output reg [31:0] data_ldr_out; // Output to send to register bank
	
	always @ (*)
		begin
			if (sel_ldr_mux) 
				begin
					data_ldr_out <= ram_result; // opcode is LDR -> store result from ram
				end
			else
				begin
					data_ldr_out <= alu_result; // opcode is not LDR -> store result from ALU
				end
		end
endmodule
