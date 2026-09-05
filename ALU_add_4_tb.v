`timescale 1ns / 1ps

module ALUadd_4_tb;
    // Khai báo tín hiệu
    reg [31:0] pcout_input;
    wire [31:0] ALUadd_4out;
    
    // Kết nối module cần test
    ALUadd_4 uut (
        .pcout_input(pcout_input),
        .ALUadd_4out(ALUadd_4out)
    );
	 
    // Tạo dãy test
    initial begin
        $display("Start ALUadd_4 simulation...");
        
        pcout_input = 32'h00000000; #10;
        pcout_input = 32'h00000004; #10;
        pcout_input = 32'hFFFFFFFC; #10;
        pcout_input = 32'h12345678; #10;
        
        $display("End ALUadd_4 simulation.");
        $stop;
    end
	 // Dùng duy nhất 1 hàm display khi thay đổi input hoặc output
    always @(pcout_input or ALUadd_4out) begin
        $display(
            "Time=%0t | pcout_input=0x%08h | ALUadd_4out=0x%08h",
            $time, pcout_input, ALUadd_4out
        );
    end
endmodule
