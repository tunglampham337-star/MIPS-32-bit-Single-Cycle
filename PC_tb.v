`timescale 1ns / 1ps
module PC_tb;
reg clk;
reg reset;
reg [31:0] PCin;
wire [31:0] PCout;
//unit under test
PC uut (
    .clk(clk),
    .reset(reset),
    .pc_in(PCin),
    .pc_out(PCout)
);
always #5 clk = ~clk;

initial begin
	clk = 0;
	reset = 1;
	PCin = 32'h0;
	// giu reset trong 2 chu ki             
	#12; 
	reset = 0; 
	// cap gia tri moi cho PCin
	PCin = 32'h00000004; 
	#10; 
	PCin = 32'h00000008; 
	#10; 
	PCin = 32'h0000000C; 
	#10; 
	// reset lai  
	reset = 1; 
	#10;
	reset = 0; 
	PCin = 32'hDEADBEEF; 
	#10; 
end 
endmodule
	
