module Ram(Enable, ReadWrite, Address, DataIn, DataOut);
	input Enable, ReadWrite;
	input [15:0] DataIn;
	input [2:0] Address;
	output reg[15:0] DataOut;
	
	reg[15:0] Mem[0:7];
	
	always @*
		if (Enable)
			if (ReadWrite)
				DataOut = Mem[Address];
			else
				Mem[Address] = DataIn;
		else DataOut = 16'bz;
endmodule