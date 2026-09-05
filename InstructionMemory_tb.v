`timescale 1ns / 1ps
module InstructionMemory_tb;

	// Inputs
	reg [31:0] addr;
	// Outputs
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	InstructionMemory uut (
		.addr(addr), 
		.instruction(instruction)
	);
 initial begin
		  addr = 0;    #10;
        addr = 4;    #10;
        addr = 8;    #10;
		  addr = 12;   #10;
        addr = 16;   #10;
        addr = 20;   #10;
		  addr = 24;   #10;
        addr = 28;   #10;
        addr = 32;   #10;
		  addr = 36;   #10;
        addr = 40;   #10;
        addr = 44;   #10;
        addr = 48;   #10;
		  addr = 52;   #10;
        addr = 63 * 4; #10; // Địa chỉ 63 (đã gán riêng)
	end
      
endmodule

