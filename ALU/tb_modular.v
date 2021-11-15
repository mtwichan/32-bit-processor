// ADDITION
module TB_Add;
  reg [31:0] in1, in2;
  wire [31:0] out;
  
  initial
  begin
       in1 = 32'd4; in2 = 32'd10;
    #5 in1 = 32'd29; in2 = 32'd4;
    #5 in1 = 32'b11111111111111111111111111111111; in2 = 32'd1;
  end
  
initial
begin
$monitor($time, "   in1=%d, in2=%d, out=%d, carry=%b", in1, in2, out);
end

Adder Add1(in1, in2, out);
endmodule


// SUBTRACTION
module TB_Sub;
  reg [31:0] in1, in2;
  wire [31:0] out;
  
  initial
  begin
       in1 = 32'd4; in2 = 32'd10;
    #5 in1 = 32'd29; in2 = 32'd4;
    #5 in1 = 32'd0; in2 = 32'd1;
    #5 in1 = 4294967295; in2 = 1;
	  #5 in1 = 4294967295; in2 = 2;
	  #5 in1 = 555; in2 = 246;
	  #5 in1 = 0; in2 = 12345678;
    #5 in1 = 6; in2 = 9;
  end
  
initial
begin
$monitor($time, "   in1=%d, in2=%d, out=%d", in1, in2, out);
end

Subtractor Sub1(in1, in2, out);
endmodule


// MULTIPLICATION
module TB_Multi;
  reg [31:0] in1, in2;
  wire [31:0] out;
  
  initial
  begin
       in1 = 32'd4; in2 = 32'd10;
    #5 in1 = 32'd30; in2 = 32'd4;
    #5 in1 = 32'b11111111111111111111111111111111; in2 = 32'd2;
  end
  
initial
begin
$monitor($time, "   in1=%d, in2=%d, out=%d", in1, in2, out);
end

Multiplier Multip1(in1, in2, out);
endmodule


// BITWISE AND
module TB_BWAnd;
  reg [31:0] in1, in2;
  wire [31:0] out;
  
  initial
  begin
       in1 = 32'd4; in2 = 32'd10;
    #5 in1 = 32'd30; in2 = 32'd4;
    #5 in1 = 32'b11111111111111111111111111111111; in2 = 32'd2;
  end
  
initial
begin
$monitor($time, "   in1=%b, in2=%b, out=%b", in1, in2, out);
end

BW_And And1(in1, in2, out);
endmodule


// BITWISE OR
module TB_BWOr;
  reg [31:0] in1, in2;
  wire [31:0] out;
  
  initial
  begin
       in1 = 32'd4; in2 = 32'd10;
    #5 in1 = 32'd30; in2 = 32'd4;
    #5 in1 = 32'b11111111111111111111111111111111; in2 = 32'd2;
  end
  
initial
begin
$monitor($time, "   in1=%b, in2=%b, out=%b", in1, in2, out);
end

BW_Or Or1(in1, in2, out);
endmodule


// BITWISE XOR
module TB_BWXor;
  reg [31:0] in1, in2;
  wire [31:0] out;
  
  initial
  begin
       in1 = 32'd4; in2 = 32'd10;
    #5 in1 = 32'd30; in2 = 32'd4;
    #5 in1 = 32'b11111111111111111111111111111111; in2 = 32'd2;
  end
  
initial
begin
$monitor($time, "   in1=%b, in2=%b, out=%b", in1, in2, out);
end

BW_Xor Xor1(in1, in2, out);
endmodule


// MULTIPLEXER
module TB_Mux;
  reg [31:0] in1;
  reg [3:0] select;
  wire [31:0] out;
  
  initial
  begin
       in1 = 32'd10; select = 4'b0101;
    #5 in1 = 32'd30; select = 4'b0101;
    #5 in1 = 32'b11111111111111111111111111111111; select = 4'b0101;
  end
  
initial
begin
$monitor($time, "   in1=%d, select=%b, out=%d", in1, select, out);
end

Mux Mux1(,,,,,in1,,,,,,,,,,, select, out);
endmodule


// LOGICAL SHIFT RIGHT
module TB_Lsr;
  reg [31:0] in2;
  reg [4:0] shift_bits;
  wire [31:0] out;
    
  initial
  begin
       in2 = 32'd10; shift_bits = 5'b00001;
    #5 in2 = 32'd30; shift_bits = 5'b10011;
    #5 in2 = 32'b11111111111111111111111111111111; shift_bits = 5'b00000;
  end
  
initial
begin
$monitor($time, "   in2=%b, shift_bits=%b, out=%b", in2, shift_bits, out);
end

// logical shift according to decimal value of N shift bits
// if N=3, shift_bits=5'b01010, in2 is shifted by 2 bits

LSR LSR1(in2, shift_bits, out);
endmodule


// LOGICAL SHIFT LEFT
module TB_Lsl;
  reg [31:0] in2;
  reg [4:0] shift_bits;
  wire [31:0] out;
    
  initial
  begin
       in2 = 32'd10; shift_bits = 5'b00111;
    #5 in2 = 32'd100; shift_bits = 5'b10000;
    #5 in2 = 32'b11111111111111111111111111111111; shift_bits = 5'b01111;
  end
  
initial
begin
$monitor($time, "   in2=%b, shift_bits=%b, out=%b", in2, shift_bits, out);
end
      
LSL LSL1(in2, shift_bits, out);
endmodule


// RIGHT ROTATE
module TB_Rrot;
  reg [31:0] in2;
  reg [4:0] rot_bits;
  wire [31:0] out;
    
  initial
  begin
       in2 = 32'd10; rot_bits = 5'b01011;
    #5 in2 = 32'd100; rot_bits = 5'b00100;
    #5 in2 = 32'b11111111111111111111111111111110; rot_bits = 5'b0001;
    #5 in2 = 32'b11111111111111111111111111111111; rot_bits = 5'b1111;
  end
  
initial
begin
$monitor($time, "   in2=%b, rot_bits=%b, out=%b", in2, rot_bits, out);
end
      
Rrot Rrot1(in2, rot_bits, out);
endmodule


// MOV IMMEDIATE VALUE
module TB_MovN;
  reg [15:0] imvalue;
  wire [31:0] out;
    
  initial
  begin
       imvalue = 16'd10;
    #5 imvalue = 16'd15;
    #5 imvalue = 16'd1;
  end
  
initial
begin
$monitor($time, "   imvalue=%b, out=%b", imvalue, out);
end
      
MovN MovN1(imvalue, out);
endmodule


// MOV COPY REG
module TB_MovReg;
  reg [31:0] in1;
  wire [31:0] out;
    
  initial
  begin
       in1 = 32'd10;
    #5 in1 = 32'd15;
    #5 in1 = 32'b11111111111111111111111111111111;
  end
  
initial
begin
$monitor($time, "   in1=%b, out=%b", in1, out);
end
      
MovReg MovReg1(in1, out);
endmodule


// FLAGS
module TB_Flags;
  reg [31:0] in1, in2, op_result;
  reg [3:0] opcode;
  reg s_bit,  carry;
  wire [3:0] flags;
    
  initial
  begin
       in1 = 32'b11111111111111111111111111111111; in2 = 32'b11111111111111111111111111111111; s_bit = 1; carry = 1; opcode = 4'b0000; op_result = 32'b11111111111111111111111111111110;
  end
  
initial
begin
$monitor($time, "   flags=%b", flags);
end
      
Flags Flags1(in1, in2, s_bit, carry, opcode, op_result, flags);
endmodule


// COMPARE
module TB_Compare;
  reg [31:0] in1, in2;
  wire [3:0] flags;
    
  initial
  begin
       in1 = 32'd1; in2 = 32'd10;
    #5 in1 = 32'd10; in2 = 32'd3;
    #5 in1 = 32'd10; in2 = 32'd10;
  end
  
initial
begin
$monitor($time, "   flags=%b", flags);
end
      
Compare Cmp1(in1, in2, flags);
endmodule