`timescale 1ns / 1ps
module MUX_beforeReg(
    input [4:0] ina,   
    input [4:0] inb,
    input  control,  
    output [4:0] mux_output
);
    assign mux_output = control ? inb : ina;
endmodule
