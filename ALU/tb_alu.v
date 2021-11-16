module TB_alu;
  reg s;
  reg [2:0] srctrl;
  reg [3:0] cond, opcode;
  reg [15:0] imvalue;
  reg [31:0] in1, in2;
  wire [3:0] flags;
  wire [31:0] result;
  integer i;
	
  initial
    begin
	    cond = 4'b0000; opcode = 4'b0000; srctrl = 3'b000; s = 1'b1; in1 = 32'd5; in2 = 32'd11; imvalue = 16'b0101010000010110;
	    #5
	    
	    // check all op codes (except NOP; check later)
	    for (i = 0; i < 10; i = i + 1)
	    begin
	      opcode = opcode + 1;
	      #5;
	    end
	    
	    opcode = 4'b0000;
	    
	    // check shift and rotate control
	    for (i = 0; i < 3; i = i + 1)
	    begin
	      srctrl = srctrl + 1;
	      #5;
	    end
	    
	    srctrl = 3'b000;
	    
	    // check conditional codes
	    for (i = 0; i < 8; i = i + 1)
	    begin
	      cond = cond + 1;
	      #5;
	    end
	    
	    // check random
	       cond = 4'b0001; opcode = 4'b0000; srctrl = 3'b000; s = 1'b1; in1 = 32'd10; in2 = 32'd10;
	    #5 cond = 4'b0000; opcode = 4'b0001; srctrl = 3'b001; s = 1'b1; in1 = 32'd12; in2 = 32'd12;
	    #5 cond = 4'b0001; opcode = 4'b0000; srctrl = 3'b001; s = 1'b1; in1 = 32'd7; in2 = 32'd6;
	    #5 cond = 4'b0000; opcode = 4'b0000; srctrl = 3'b000; s = 1'b1; in1 = 32'd33; in2 = 32'd5;
	    #5 cond = 4'b0010; opcode = 4'b0000; srctrl = 3'b000; s = 1'b1; in1 = 32'd5; in2 = 32'd33;
	    #5 cond = 4'b0010; opcode = 4'b1111; srctrl = 3'b000; s = 1'b1; in1 = 32'd5; in2 = 32'd33;
	    #5 cond = 4'b0000; opcode = 4'b0000; srctrl = 3'b000; in1 = 32'd0; in2 = 32'd4294967295;
	    #5 cond = 4'b0000; opcode = 4'b0000; srctrl = 3'b000; in1 = 32'd5; in2 = 32'd4294967295;
	    //#5 $finish;
    end

  initial
  begin
	  $monitor($time, " op %d, cond %d, src %d, in1 %b %d, in2 %b %d, out %b %d, flags %b", opcode, cond, srctrl, in1, in1, in2, in2, result, result, flags);
  end

ALU ALU1(in1, in2, s, cond, opcode, srctrl, imvalue, flags, result);  
endmodule
