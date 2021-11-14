module ShiftRegister(Parallel_in, LS_in, RS_in, Mode, Reset, Clk, Parallel_Output);
	input [3:0] Parallel_in;
	input [1:0] Mode;
	input LS_in, RS_in, Reset, Clk;
	output reg [3:0] Parallel_Output;
	always @ (posedge Clk)
		begin
			if(~Reset)
				Parallel_Output <= 4'b0000;
			else
				begin
					case(Mode)
						2'b01: Parallel_Output <= {RS_in, Parallel_Output [3:1]}
						2'b10: Parallel_Output <= {Parallel_Output[2:0], LS_in}
						2'b11: Parallel_Output <= Parallel_in; 
						default: Parallel_Output <= Parallel_Output;
					endcase
				end
			end
	endmodule
	