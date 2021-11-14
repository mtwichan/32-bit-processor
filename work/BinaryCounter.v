module BinaryCounter(Data_in, Count, Load, Clear, Clk, A_count, C_out);
	input [3:0] Data_in;
	input Count, Load, Clear, Clk;
	output reg [3:0] A_count;
	output reg C_out;
	
	always @ (posedge Clk or negedge Clear)
		begin
			if (~Clear)
				A_count <= 4'b0000;
			else
				begin
					casex({Load, Count})
						2'b1x: A_count <= Data_in;
						2'b01: A_count <= A_count + 1;
						default: A_count <= A_count;
					endcase
				end
			end
		end
	assign C_out = (&A_count);
endmodule;

