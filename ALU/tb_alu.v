module TB_alu;
  reg [31:0] in1, in2;
  reg [3:0] cond, opcode, inflags;
  reg s;
  reg [2:0] srctrl;
  reg [15:0] imvalue;
  wire [3:0] outflags;
  wire [31:0] result;
  integer i;
	
  initial
    begin
	    cond = 4'b0000; opcode = 4'b0000; srctrl = 3'b000; s = 1; in1 = 32'd5; in2 = 32'd11; imvalue = 16'd5; inflags = 4'b0000;
	    #5
	    
	    // check all op codes
	    for (i = 0; i < 10; i = i + 1)
	    begin
	      opcode = opcode + 1;
	      inflags = outflags;
	      #5;
	    end
	    
	    opcode = 4'b0000; srctrl = 3'b000;
	    #5
	    
	    // check shift and rotate control
	    for (i = 0; i < 3; i = i + 1)
	    begin
	      srctrl = srctrl + 1;
	      inflags = outflags;
	      #5;
	    end
	    
	    srctrl = 3'b000;
	    #5
	    
	    // check conditional codes
	    for (i = 0; i < 8; i = i + 1)
	    begin
	      cond = cond + 1;
	      inflags = outflags;
	      #5;
	    end
	    
	    // check random
	       cond = 4'b0000; opcode = 4'b0000; srctrl = 3'b000; s = 1'b1; in1 = 32'd10; in2 = 32'd18; imvalue = 16'd5; inflags = 4'b0000;
	    #5 cond = 4'b0000; opcode = 4'b0001; srctrl = 3'b001; s = 1'b1; in1 = 32'd12; in2 = 32'd12; imvalue = 16'd5; inflags = outflags; 
	    #5 cond = 4'b0001; opcode = 4'b0000; srctrl = 3'b001; s = 1'b1; in1 = 32'd7; in2 = 32'd6; imvalue = 16'd5; inflags = outflags;
	    #5 cond = 4'b0000; opcode = 4'b0000; srctrl = 3'b000; s = 1'b1; in1 = 32'd33; in2 = 32'd5; imvalue = 16'd5; inflags = outflags;
	    #5 cond = 4'b0010; opcode = 4'b0000; srctrl = 3'b000; s = 1'b1; in1 = 32'd5; in2 = 32'd33; imvalue = 16'd5; inflags = outflags;
	    #5 cond = 4'b0010; opcode = 4'b1111; srctrl = 3'b000; s = 1'b1; in1 = 32'd5; in2 = 32'd33; imvalue = 16'd5; inflags = outflags;
	    #5 cond = 4'b0000; opcode = 4'b0000; srctrl = 3'b000; in1 = 32'd0; in2 = 32'd4294967295;
	    #5 cond = 4'b0000; opcode = 4'b0000; srctrl = 3'b000; in1 = 32'd5; in2 = 32'd4294967295;
	    //#5 $finish;
    end

  initial
  begin
	  $monitor($time, "op %d, cond %d, src %d, in1 %b %d, in2 %b %d, out %b %d, inF %b, outF %b", opcode, cond, srctrl, in1, in1, in2, in2, result, result, inflags, outflags);
  end

ALU ALU1(in1, in2, s, cond, opcode, srctrl, imvalue, inflags, outflags, result);  
endmodule
