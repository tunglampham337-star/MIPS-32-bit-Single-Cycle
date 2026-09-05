`timescale 1ns / 1ps
module ShiftL2(shiftin, shiftout);
input [31:0] shiftin;
output [31:0] shiftout;

	assign shiftout = shiftin << 2;

endmodule