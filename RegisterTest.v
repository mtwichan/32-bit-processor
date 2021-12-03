`timescale 1 ns/10 ps

module  registerTestBench;
    //module RegisterBank(dest,Din,srcadd1,srcadd2,src1,src2);

reg [3:0] dest,srcadd1,srcadd2;
reg [31:0] data_in;
wire [31:0] src1,src2;


RegisterBank RB(dest,data_in,srcadd1,srcadd2,src1,src2);

initial begin

    dest = 0; data_in =10;
    #5 dest = 1; data_in =11;
    #5 dest = 2; data_in =12;
    #5 dest = 3; data_in =13;
    #5 dest = 4; data_in =34;
    #5 dest = 5; data_in =45;
    #5 dest = 6; data_in =36;
    #5 dest = 7; data_in =97;
    #5 dest = 8; data_in =38;
    #5 dest = 9; data_in =29;
    #5 dest = 10; data_in =110;
    #5 dest = 11; data_in =111;
    #5 dest = 12; data_in =112;
    #5 dest = 13; data_in =113;
    #5 dest = 14; data_in =114;
    #5 dest = 15; data_in =115;
    #5;
    #5 srcadd1 =0; srcadd2 = 15;
    #5 srcadd1 =1; srcadd2 = 14;
    #5 srcadd1 =2; srcadd2 = 13;
    #5 srcadd1 =3; srcadd2 = 12;
    #5 srcadd1 =4; srcadd2 = 11;
    #5 srcadd1 =5; srcadd2 = 10;
    #5 srcadd1 =6; srcadd2 = 9;
    #5 srcadd1 =7; srcadd2 = 8;
    #5 srcadd1 =8; srcadd2 = 7;
    #5 srcadd1 =9; srcadd2 = 6;
    #5 srcadd1 =10; srcadd2 =5;
    #5 srcadd1 =11; srcadd2 = 4;
    #5 srcadd1 =12; srcadd2 = 3;
    #5 srcadd1 =13; srcadd2 = 2;
    #5 srcadd1 =14; srcadd2 = 1;
    #5 srcadd1 =15; srcadd2 = 0;
    #5;


end


endmodule