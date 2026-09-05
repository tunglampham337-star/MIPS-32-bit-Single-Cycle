`timescale 1ns / 1ps
module AND_gate_tb;
	// Inputs
	reg branch;
	reg zero;
	// Outputs
	wire AND_out;
	// Instantiate the Unit Under Test (UUT)
	AND_gate uut (
		.branch(branch), 
		.zero(zero), 
		.AND_out(AND_out)
	);
initial begin
		// Initialize Inputs
		branch = 0;
		zero = 0;

		// Wait 100 ns for global reset to finish
		#100;
		branch = 0;
		zero = 1;
		#100;
		branch = 1;
		zero = 0;
		#100;
		branch = 1;
		zero = 1;
		#100;
end  
AND_gate aa (branch, zero, AND_out);    
endmodule

