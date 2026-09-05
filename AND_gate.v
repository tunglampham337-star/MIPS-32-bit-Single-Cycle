`timescale 1ns / 1ps
module AND_gate(branch, zero, AND_OUT);
input branch, zero;
output reg AND_OUT; 
always @(*) begin
        AND_OUT = branch & zero;    // beq: branch if zero == 1
end
endmodule
