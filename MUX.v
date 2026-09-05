module MUX (
    input [31:0] in0,   
    input [31:0] in1,
    input  ctrl,  
    output [31:0] mux_out
);
    assign mux_out = ctrl ? in1 : in0;
endmodule