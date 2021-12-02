//THANKS KATIE FOR THE REFERNCES <3
module RAM (enable,readWrite,address,dataIn,dataOut);
input  enable,readWrite;
	input [31:0] dataIn;  
	input [15:0] address;  
	output reg[31:0] dataOut; 
reg [31:0] Mem [0:65535];     //8 x 16 memory -> reg [31:0] Mem [0:65535]; // 2^16 by 32 memory
always @*
	if (enable)
		if (readWrite) 
			dataOut = Mem[address];  //Read
		else
			Mem[address] = dataIn;   //Write
	else dataOut = 32'bz;   
endmodule