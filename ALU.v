`timescale 1ns / 1ps
module ALU(alu_control,a,b,result,zero);
input [3:0] alu_control;
input [31:0] a,b;
output reg [31:0] result;
output zero;
always@(alu_control,a,b)begin
    case(alu_control)
    4'b0000 : result = a&b; //and
    4'b0001 : result = a|b; //or
    4'b0010 : result = a+b; //add, lw, sw, branch equal
    4'b0110 : result = a-b; //subtract
	 4'b0011 : result = a ^ b; //xor
    4'b0111 : result = ($signed(a) < $signed(b)) ? 1 : 0; //slt
	 4'b0100 : result = a << b; // SLL (shift left logical)
	 4'b0101 : result = a >> b; // SRL (shift right logical)
    default : result =32'b0000; //do nothing
    endcase
end
	 assign zero =(result==0)?1:0;
endmodule