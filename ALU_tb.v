`timescale 1ns / 1ps
module ALU_tb();
reg [31:0] a,b;
reg [3:0] alu_control;
wire zero;
wire [31:0] result;
initial begin
    alu_control = 0;
    a = 7;
    b = 3;
    #50;
    alu_control = 5;
    a = 10;
    b = 10;
    #50;
    alu_control = 1;
    a = 10;
    b = 20;
    #50;
    alu_control = 2;
    a = 32;
    b = 32;
    #50;
	 alu_control = 7;
    a = 400;
    b = 300;
    #50;
    alu_control = 6;
    a = 40;
    b = 44;
    #50;
    alu_control = 7;
    a = 200;
    b = 300;
    #50;
    #150;
	 //$finish
end
ALU aa (alu_control,a,b,result,zero);
endmodule

