`timescale 1ns / 1ps

module sudoProgramCounter(clk,rst,instruction_from_ram,instruction_to_ALU,PC);

input clk,rst;
input [31:0] instruction_from_ram;
output reg [31:0] instruction_to_ALU;
output reg [15:0] PC;
reg [1:0] next_state, current_state;


// Fetch = 0; Decode = 1; Execute = 2;
parameter state_1=0, state_2 = 1, state_3 = 2;


always @ (posedge clk or negedge rst)
	begin
	if(!rst)
		begin
		current_state <= state_1;
		PC <=0;
		end
	else
		begin
		current_state = next_state;
		end
	end
always @(posedge clk)
	begin
		case(current_state)
			state_1: next_state <= state_2; // Fetch to Decode
			state_2: next_state <= state_3; // Decode to Execute;
			state_3: next_state <= state_1; //Execute to Fetch
			default:
				begin 
				next_state <= state_1;
				PC <=0;
				end
		endcase
	end

always @*
begin
			case(current_state)
			state_1:
				begin
				//Usually here we would setup the instructions and decode them but bcause we are using imidiate values its ok we skip it;
				instruction_to_ALU <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;

				end
			state_2:
				begin
				//We sould set the instructions to wire but we dont do it here 
				instruction_to_ALU <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
				end			
			state_3:
				begin
				// We fetch the next instruction 
				PC <= PC +1;
				instruction_to_ALU <= instruction_from_ram;
				end			
		endcase	
end		
endmodule
