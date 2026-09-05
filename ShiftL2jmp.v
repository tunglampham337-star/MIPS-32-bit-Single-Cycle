`timescale 1ns / 1ps
module ShiftL2jmp(shiftjmpin, shiftjmpout);
input [25:0] shiftjmpin;
output [27:0] shiftjmpout;

	//shiftjmpout <= shiftjmpin << 2;
	assign shiftjmpout = {shiftjmpin, 2'b00};
endmodule
