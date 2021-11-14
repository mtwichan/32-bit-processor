`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:50:47 11/14/2021 
// Design Name: 
// Module Name:    Memorycontrol 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
// Instruction			Description													Op Code		Memory Access Block's Job
// ADD R1, R2, R3		(R1=R2+R3)													0000		Send ALU alu_result to LDR
// SUB R1, R2, R3		(R1=R2-R3)													0001		Send ALU alu_result to LDR
// MUL R1, R2, R3  		(R1=R2*R3) (assume the alu_result is 32-bit maximum)			0010		Send ALU alu_result to LDR
// ORR R1, R2, R3		(R1=R2 OR R3)												0011		Send ALU alu_result to LDR
// AND R1, R2, R3		(R1=R2 AND R3)												0100		Send ALU alu_result to LDR
// EOR R1, R2, R3		(R1=R2 XOR R3)												0101		Send ALU alu_result to LDR
// MOV R1, n			Initialize R1 with an immediate number n, 0 <= n<= (2^16−1)	0110		Send ALU alu_result to LDR
// MOV R1, R2			Copy R2 to R1												0111		Send ALU alu_result to LDR Send source_1 to LDR (need to verify if source 1 or source 2), (might be easier to just send source 1 through ALU and take it as alu_result)
// MOV R1, R2, LSR #n	(R1=R2 >>n),  1 <= n<= 31									1000		Send ALU alu_result to LDR
// MOV R1, R2, LSL #n	(R1=R2 <<n), 1 <= n<= 31									1001		Send ALU alu_result to LDR
// MOV R1, R2, ROR #n	(R1=Rotate right R2 by n-bit) , 1 <= n<= 31					1010		Send ALU alu_result to LDR
// CMP R1, R2			Compare R1 with R2 and set the status flags 				1011		Do Nothing
// ADR R1, n			Initialize R1 with a 16-bit address n, 0 <= n<= (2^16−1)	1100		Send ALU alu_result to LDR 
// LDR R2, [R1]			Load R2 with the contents at memory address R1				1101		Load data from ram at address(source_1), send loaded data to LDR
// STR R2, [R1]			Store R2 at memory address R1								1110		Store data source_2 at ram address(source_1)
// NOP					No Operation -Skip this instruction							1111		Do Nothing
//
//////////////////////////////////////////////////////////////////////////////////
module Memorycontrol(src1,src2,opCode,selectLDR,selectAddBus,RW,AddbusDataAcess,
							dataBusIn,dataBusOut,dataOutLDR);

	input [3:0] opCpde;
	input [31:0] src1, src2, dataBusIn;

	output reg RW;
	output reg selectLDR = 1'b0;
	output reg add_bus_sel = 1'b0;
	output reg [15:0] AddbusDataAcess;
	output reg [31:0] dataBusOut, LDR_data_out;


	always @*
		begin
			case (opCode)
				4'b1101 : 
				begin
				  selectLDR = 1'b1;
				  add_bus_sel = 1'b1;
				  RW = 1;
				  AddbusDataAcess = src1[15:0];
				  LDR_data_out = dataBusIn;
				end
				4'b1110 : 
				begin
				  add_bus_sel = 1'b1;
				  RW = 1'b0;
				  AddbusDataAcess = src1[15:0];
				  dataBusOut = src2;
				end
				default : 
				begin
					RW = 1'b1;
					selectLDR = 1'b0;
					add_bus_sel = 1'b1;
				end
			endcase
		end

endmodule
