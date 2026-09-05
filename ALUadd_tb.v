`timescale 1ns / 1ps
module ALUadd_tb;

	// Inputs
	reg [31:0] PCout;
	reg [31:0] ShiftOut;

	// Outputs
	wire [31:0] ALU_add_result;

	// Instantiate the Unit Under Test (UUT)
	ALUadd uut (
		.PCout(PCout), 
		.ShiftOut(ShiftOut), 
		.ALU_add_result(ALU_add_result)
	);

	initial begin
		// Initialize Inputs
		PCout = 7;
		ShiftOut = 4;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
ALUadd aa(PCout, ShiftOut, ALU_add_result);   
endmodule

