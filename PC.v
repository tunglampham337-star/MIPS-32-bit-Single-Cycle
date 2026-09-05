`timescale 1ns / 1ps
module PC(clk, reset, pc_out, pc_in);
input clk,reset;
input [31:0] pc_in;
output reg [31:0] pc_out;
always @(posedge clk)
begin
	if(reset == 1) begin 
		pc_out <= 32'b0;
		end
	else begin
		pc_out <= pc_in;
	end
end
endmodule