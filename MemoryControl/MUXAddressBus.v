module MUXAddressBus(sel_add_bus, pc_instr_access, address_add_bus_in, address_add_bus_out);
	
	input sel_add_bus; // Select (LDR=1 OR STR=1)
	input [7:0] pc_instr_access; // 8-bit PC
	input [15:0] address_add_bus_in; 
	output reg [15:0] address_add_bus_out; 
	
	always @ (*)
		begin
			if (sel_add_bus)
				begin
					address_add_bus_out <= address_add_bus_in; // Send Address from Register Bank if LDR or STR opcode
				end
			else
				begin
					address_add_bus_out <= pc_instr_access; // Iterate address by 1 in RAM using PC counter
				end
		end
endmodule
