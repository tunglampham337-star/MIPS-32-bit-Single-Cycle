`timescale 1ns / 1ps
module CU_tb;
	// Inputs
	reg [5:0] Opcode;
	// Outputs
	wire RegDst;
	wire Branch;
	wire Jump;
	wire MemRead;
	wire MemtoReg;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;
	wire [1:0] ALUOp;
	// Instantiate the Unit Under Test (UUT)
	CU uut (
		.RegDst(RegDst), 
		.Branch(Branch), 
		.Jump(Jump), 
		.MemRead(MemRead), 
		.MemtoReg(MemtoReg), 
		.MemWrite(MemWrite), 
		.ALUSrc(ALUSrc), 
		.RegWrite(RegWrite), 
		.Opcode(Opcode), 
		.ALUOp(ALUOp)
	);
	initial begin
		// Initialize Inputs
		Opcode = 0;
		// Wait 100 ns for global reset to finish
		#100;
		Opcode = 35;
		#100;
		Opcode = 43;
		#100;
		Opcode = 4;
		#100;
		Opcode = 2;
		#100;       
		Opcode = 5;
		#100;        
end
CU aa (RegDst, 
		Branch, 
		Jump, 
		MemRead, 
		MemtoReg, 
		MemWrite, 
		ALUSrc, 
		RegWrite, 
		Opcode, 
		ALUOp
		);      
endmodule

