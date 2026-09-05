`timescale 1ns / 1ps

module ALUadd_4(
	input [31:0] pcout_input,
	output [31:0] ALUadd_4out
  );
	assign ALUadd_4out = pcout_input + 4;
endmodule