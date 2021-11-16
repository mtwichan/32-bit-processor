module TB_alu;
  reg s;
  reg [2:0] srctrl;
  reg [3:0] cond, opcode, inflags;
  reg [15:0] imvalue;
  reg [31:0] in1, in2;
  wire [3:0] outflags;
  wire [31:0] result;
  integer i;
	
  initial
    begin
	    cond = 4'b0000; opcode = 4'b0000; srctrl = 3'b000; s = 1'b1; in1 = 32'd5; in2 = 32'd11; imvalue = 16'b0101010000010110; inflags = 4'b0000;
	    #5
	    
	    // check all op codes (except NOP; check later)
	    // inflags = outflags assignment imitates flags register
	    for (i = 0; i < 10; i = i + 1)
	    begin
	      opcode = opcode + 1; inflags = outflags;
	      #5;
	    end
	    
	    // check NOP instruction, then reset opcode for future use
	    opcode = 4'b1111;
	    #5;
	    opcode = 4'b0000;
	    
	    // check all shift and rotate control codes
	    // inflags = outflags assignment imitates flags register
	    for (i = 0; i < 3; i = i + 1)
	    begin
	      srctrl = srctrl + 1; inflags = outflags;
	      #5;
	    end
	    
	    srctrl = 3'b000;
	    
	    // check all conditional codes
	    // inflags = outflags assignment imitates flags register
	    // make sure to do CMP instruction before trying conditions
	    for (i = 0; i < 8; i = i + 1)
	    begin
	      // reset condition and set opcode to CMP instruction to get proper flags
	      opcode = 4'b1000; inflags = outflags; cond = 4'b0000;
	      #5;
	      // enable a condition to check flags generated from previous line
	      opcode = 4'b0000; cond = cond + i + 1; inflags = outflags;
	      #5;
	    end
	    
	    // check random values
	    // inflags = outflags assignment imitates flags register
	       cond = 4'b0000; opcode = 4'b1000; srctrl = 3'b000; s = 1'b1; in1 = 32'd10; in2 = 32'd10; inflags = outflags;
	    #5 cond = 4'b0001; opcode = 4'b0000; srctrl = 3'b000; s = 1'b1; in1 = 32'd10; in2 = 32'd10; inflags = outflags;
	    #5 cond = 4'b0000; opcode = 4'b0001; srctrl = 3'b001; s = 1'b1; in1 = 32'd12; in2 = 32'd12; inflags = outflags;
	    #5 cond = 4'b0001; opcode = 4'b0000; srctrl = 3'b001; s = 1'b1; in1 = 32'd7; in2 = 32'd6; inflags = outflags;
	    #5 cond = 4'b0000; opcode = 4'b0000; srctrl = 3'b000; s = 1'b1; in1 = 32'd33; in2 = 32'd5; inflags = outflags;
	    #5 cond = 4'b0010; opcode = 4'b0000; srctrl = 3'b000; s = 1'b1; in1 = 32'd5; in2 = 32'd33; inflags = outflags;
	    #5 cond = 4'b0010; opcode = 4'b1111; srctrl = 3'b000; s = 1'b1; in1 = 32'd5; in2 = 32'd33; inflags = outflags;
	    #5 cond = 4'b0000; opcode = 4'b0000; srctrl = 3'b000; in1 = 32'd0; in2 = 32'd4294967295; inflags = outflags;
	    #5 cond = 4'b0000; opcode = 4'b0000; srctrl = 3'b000; in1 = 32'd5; in2 = 32'd4294967295; inflags = outflags;
	    //#5 $finish;
    end

  initial
  begin
	  $monitor($time, " op %d, cond %d, src %d, in1 %b %d, in2 %b %d, out %b %d, inF %b, outF %b", opcode, cond, srctrl, in1, in1, in2, in2, result, result, inflags, outflags);
  end

ALU ALU1(in1, in2, s, cond, opcode, srctrl, imvalue, inflags, outflags, result);  
endmodule
