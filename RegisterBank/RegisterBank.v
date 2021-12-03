module RegisterBank(dest,Din,srcadd1,srcadd2,src1,src2, opcode);
	input [3:0] dest,srcadd1,srcadd2;
	input [31:0] Din;
	input [3:0] opcode;
	output [31:0] src1,src2;
	wire [15:0] registerAddress;
	wire [31:0] q0, q1, q2, q3, q4, q5, q6, q7,q8, q9, q10, q11, q12, q13, q14, q15;
	
	reg [31:0] registerBank [0:15];

	Decoder4to16 dec(.in(dest), .out(registerAddress));
		
	MUX161 mux1(.select(srcadd1), .out(src1), .q0(registerBank[0]), .q1(registerBank[1]), 
		.q2(registerBank[2]), 
		.q3(registerBank[3]), 
		.q4(registerBank[4]), 
		.q5(registerBank[5]), 
		.q6(registerBank[6]), 
		.q7(registerBank[7]), 
		.q8(registerBank[8]), 
		.q9(registerBank[9]), 
		.q10(registerBank[10]), 
		.q11(registerBank[11]), 
		.q12(registerBank[12]), 
		.q13(registerBank[13]), 
		.q14(registerBank[14]), 
		.q15(registerBank[15]));
	
	MUX161 mux2(.select(srcadd2), .out(src2), .q0(registerBank[0]), .q1(registerBank[1]), 
		.q2(registerBank[2]), 
		.q3(registerBank[3]), 
		.q4(registerBank[4]), 
		.q5(registerBank[5]), 
		.q6(registerBank[6]), 
		.q7(registerBank[7]), 
		.q8(registerBank[8]), 
		.q9(registerBank[9]), 
		.q10(registerBank[10]), 
		.q11(registerBank[11]), 
		.q12(registerBank[12]), 
		.q13(registerBank[13]), 
		.q14(registerBank[14]), 
		.q15(registerBank[15]));

	always @ (registerAddress, Din) begin
		if ((opcode != 4'b1110) && (opcode != 4'b1111) && (opcode != 4'b1011)) begin
			case (registerAddress)
				16'b0000000000000001: begin
					registerBank[0] = Din;	
				end
				16'b0000000000000010: begin 
					registerBank[1] = Din;	
				end
				16'b0000000000000100: begin
					registerBank[2] = Din;
				end
				16'b0000000000001000: begin
					registerBank[3] = Din;					
				end
				16'b0000000000010000: begin
					registerBank[4] = Din;
				end
				16'b0000000000100000: begin
					registerBank[5] = Din;
				end
				16'b0000000001000000: begin
					registerBank[6] = Din;
				end
				16'b0000000010000000: begin
					registerBank[7] = Din;
				end
				16'b0000000100000000: begin
					registerBank[8] = Din;
				end
				16'b0000001000000000: begin
					registerBank[9] = Din;
				end
				16'b0000010000000000: begin
					registerBank[10] = Din;
				end
				16'b0000100000000000: begin
					registerBank[11] = Din;
				end
				16'b0001000000000000: begin
					registerBank[12] = Din;
				end
				16'b0010000000000000: begin
					registerBank[13] = Din;
				end
				16'b0100000000000000: begin
					registerBank[14] = Din;
				end
				16'b1000000000000000: begin
					registerBank[15] = Din;	// R16
				end
				default: begin
					// do nothing
				end
			endcase
			$display("RegisterBank -> dest: %b", dest);
			$display("RegisterBank -> Din: %b", Din);	
			$display("RegisterBank -> registerAddress: %b", registerAddress);		
			$display("RegisterBank -> srcadd1: %b", srcadd1);		
			$display("RegisterBank -> srcadd2: %b", srcadd2);
			$display("RegisterBank -> src1:", src1);
			$display("RegisterBank -> src2:", src2);
			$display("RegisterBank -> opcode:", opcode);
			$display("RegisterBank -> r[0]: %b", registerBank[0]);
			$display("RegisterBank -> r[1]: %b", registerBank[1]);
			$display("RegisterBank -> r[2]: %b", registerBank[2]);
			$display("RegisterBank -> r[3]: %b", registerBank[3]);
			$display("RegisterBank -> r[4]: %b", registerBank[4]);
			$display("RegisterBank -> r[5]: %b", registerBank[5]);
			$display("RegisterBank -> r[6]: %b", registerBank[6]);
			$display("RegisterBank -> r[7]: %b", registerBank[7]);
			$display("RegisterBank -> r[8]: %b", registerBank[8]);
			$display("RegisterBank -> r[9]: %b", registerBank[9]);
			$display("RegisterBank -> r[10]: %b", registerBank[10]);
			$display("RegisterBank -> r[11]: %b", registerBank[11]);
			$display("RegisterBank -> r[12]: %b", registerBank[12]);
			$display("RegisterBank -> r[13]: %b", registerBank[13]);
			$display("RegisterBank -> r[14]: %b", registerBank[14]);
			$display("RegisterBank -> Case statement running: %b", ((opcode != 4'b1110) && (opcode != 4'b1111) && (opcode != 4'b1011)));
		end
    end

	// Registers regi(.Din(Din), .enable(registerAddress), 
	// 	.q0(q0), 
	// 	.q1(q1), 
	// 	.q2(q2), 
	// 	.q3(q3), 
	// 	.q4(q4), 
	// 	.q5(q5), 
	// 	.q6(q6), 
	// 	.q7(q7), 
	// 	.q8(q8), 
	// 	.q9(q9), 
	// 	.q10(q10), 
	// 	.q11(q11), 
	// 	.q12(q12), 
	// 	.q13(q13), 
	// 	.q14(q14), 
	// 	.q15(q15)
	// 	);

endmodule
