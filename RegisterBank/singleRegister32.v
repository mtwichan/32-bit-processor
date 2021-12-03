module singleRegister32(en,q,Din);
	input en;
	input [31:0] Din;
	output reg [31:0] q;
	
	always @ (en, Din)
	begin
			if(en && !(Din === 1'bz))
				q = Din;

	end 


endmodule
