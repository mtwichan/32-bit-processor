module Test_Decoder;

	localparam n = 2;
	localparam m = 4;

	reg[n-1:0] A;
	wire[m-1:0] B;	
		
	localparam period = 20;
	
	initial
		begin
			Decoder #(4, 16) dec4_16 (A, B);
		end
endmodule


