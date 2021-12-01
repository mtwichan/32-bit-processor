module MUXAddressBus(sel_add_bus, address_add_bus_in, address_add_bus_out);
	
	input sel_add_bus; // Select (LDR=1 OR STR=1)
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
					address_add_bus_out <= pc_addr
				end
		end
endmodule
