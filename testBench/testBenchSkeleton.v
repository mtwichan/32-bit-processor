module test_1;

reg clk,rst;
reg [31:0] in;
wire [15:0] PC;
wire [31:0] out;

SysWiring CPU(.instruction_to_ALU(in), .instruction_from_RAM(out));
sudoProgramCounter sudo_PC(.clk(clk),.rst(rst), .instruction_from_ram(out),.instruction_to_ALU(in),.PC(PC));
initial begin
clk = 0;
end
always #10 clk = ~clk;
initial begin
$readmemb("ram.txt", CPU.ram_comp.mem);
end


initial begin
    //$monitor(,);
end

endmodule

