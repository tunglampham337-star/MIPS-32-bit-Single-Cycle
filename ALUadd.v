`timescale 1ns / 1ps
module ALUadd(pcout, shiftout, ALU_ADD_RESULT);
input [31:0] pcout;
input [31:0] shiftout;
output [31:0] ALU_ADD_RESULT;

	assign ALU_ADD_RESULT = pcout + shiftout;
endmodule