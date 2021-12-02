module ALU(in1, in2, sbit, cond, opcode, srcontrol, imvalue, inflags, outflags, result);
  input sbit;
  input [2:0] srcontrol;
  input [3:0] cond, opcode, inflags; // {N, Z, C, V}
  input [15:0] imvalue;
  input [31:0] in1, in2;
  output [3:0] outflags; // {N, Z, C, V}
  output reg [31:0] result;
  reg cond_met;
  reg [3:0] opcode_interim;
  reg [31:0] in2_interim;
  wire [3:0] cmp_wire;
  // wire [7:0] count = 8'b00000000;
  wire [31:0] add_wire, sub_wire, mul_wire, and_wire, or_wire, xor_wire, lsr_wire, lsl_wire, rrot_wire, srcontrol_wire, movn_wire, movreg_wire, ldr_wire, str_wire, nop_wire;
		  
  // check condition bits
  always @ (cond)
  begin
    opcode_interim = opcode;
		
    case(cond)
      // equal; Z = 1
      4'b0001: cond_met = (inflags[2])? 1'b1 : 1'b0;
      // greater than; Z = 0 and N = V
      4'b0010: cond_met = (!inflags[2])? ((inflags[3] == inflags[0])? 1'b1 : 1'b0) : 1'b0;
      // less than; Z = 0 and N != V
      4'b0011: cond_met = (!inflags[2])? ((inflags[3]^inflags[0])? 1'b1 : 1'b0) : 1'b0;
      // greater than or equal to; Z = 0/1 and N = V
      4'b0100: cond_met = (inflags[3] == inflags[0])? 1'b1 : 1'b0;
      // less than or equal to; Z = 0/1 and N != V
      4'b0101: cond_met = (inflags[3]^inflags[0])? 1'b1 : 1'b0;
      // unsigned higher; Z = 0 and C = 1
      4'b0110: cond_met = (!inflags[2])? ((inflags[1])? 1'b1 : 1'b0) : 1'b0;
      // unsigned lower; C = 0
      4'b0111: cond_met = (!inflags[1])? 1'b1 : 1'b0;
      // unsigned higher or same; C = 1
      4'b1000: cond_met = (inflags[1])? 1'b1 : 1'b0;
      default: cond_met = 1'b1;
    endcase
    
    if (!cond_met)
      // change op code to NOP if condition is not met
      opcode_interim = 4'b1111;
    else
      ; // retain original opcode
  end
  
  // check shift or rotate control bits
  always @ (srcontrol)
  begin
      case(srcontrol)
        // logical shift right
        3'b001: in2_interim = lsr_wire;
        // logical shift left
        3'b010: in2_interim = lsl_wire;
        // right rotate
        3'b011: in2_interim = rrot_wire;
        // no shift or rotate
        default: in2_interim = in2;
      endcase
  end
  
  // check op code bits
  always @ (opcode_interim)
  begin
    case(opcode_interim)
      // addition
      4'b0000: result = add_wire;
      // subtraction
      4'b0001: result = sub_wire;
      // multiplication
      4'b0010: result = mul_wire;
      // bitwise oring
      4'b0011: result = or_wire;
      // bitwise anding
      4'b0100: result = and_wire;
      // bitwise xoring
      4'b0101: result = xor_wire;
      // move immediate value
      4'b0110: result = movn_wire;
      // copy register value
      4'b0111: result = movreg_wire;
      // compare
      4'b1000: result = cmp_wire;
      // load
      4'b1001: result = ldr_wire;
      // store
      4'b1010: result = str_wire;
      // no operation
      4'b1111: result = nop_wire;
      default: result = 32'bx;
    endcase
  end    
  
  // call submodules
  Adder Add1(.in1(in1), .in2(in2_interim), .result(add_wire));
  Subtractor Sub1(.in1(in1), .in2(in2_interim), .result(sub_wire));
  Multiplier Mul1(.in1(in1), .in2(in2_interim), .result(mul_wire));
  BW_And And1(.in1(in1), .in2(in2_interim), .result(and_wire));
  BW_Or Or1(.in1(in1), .in2(in2_interim), .result(or_wire));
  BW_Xor Xor1(.in1(in1), .in2(in2_interim), .result(xor_wire));
  LSR LSR1(.in2(in2), .shift_bits(imvalue[7:3]), .result(lsr_wire));
  LSL LSL1(.in2(in2), .shift_bits(imvalue[7:3]), .result(lsl_wire));
  Rrot Rrot1(.in2(in2), .rot_bits(imvalue[7:3]), .result(rrot_wire));
  MovN MovN1(.imvalue(imvalue), .result(movn_wire));  
  MovReg MovReg1(.in1(in1), .result(movreg_wire));
  Load LDR1(.in(32'bx), .result(ldr_wire));
  Store STR1(.in(32'bx), .result(str_wire));
  Nop NOP1(.in(32'bx), .result(nop_wire));
  Flags Flags1(.in1(in1), .in2(in2_interim), .s_bit(sbit), .opcode(opcode_interim), .op_result(result), .flags(outflags));
  Compare Cmp1(.in1(in1), .in2(in2_interim), .flags(cmp_wire));

  // increment program counter
  // PC pc1(.clk(1'b1), .reset(1'b1), .counter(count));
endmodule
