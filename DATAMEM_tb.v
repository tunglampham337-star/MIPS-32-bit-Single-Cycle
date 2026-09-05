`timescale 1ns / 1ps
module DATAMEM_tb;

	// Inputs
	reg clk;
	reg MemRead;
	reg MemWrite;
	reg [31:0] address;
	reg [31:0] writeData;

	// Outputs
	wire [31:0] readData;

	// Instantiate the Unit Under Test (UUT)
	DATAMEM uut (
		.clk(clk), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.address(address), 
		.writeData(writeData), 
		.readData(readData)
	);
always #10 clk=~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		MemRead = 0;
		MemWrite = 0;
		address = 32'd0;
		writeData = 32'd0;

		// Wait 100 ns for global reset to finish
		#10;
		MemRead = 0;
		MemWrite = 1;
		address = 32'd15;
		writeData = 32'd240 ;  
		// Add stimulus here
		#10;
		MemWrite = 0;
		#10;
		MemRead = 1;
		#10;
		MemRead = 0;
		
	end
      
endmodule

