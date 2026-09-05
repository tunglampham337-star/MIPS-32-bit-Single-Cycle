`timescale 1ns / 1ps

module ShiftL2_tb;
    // Khai báo tín hiệu
    reg [31:0] shiftin;
    wire [31:0] shiftout;
    
    // Kết nối module
    ShiftL2 uut (
        .shiftin(shiftin),
        .shiftout(shiftout)
    );
	  // Tạo dãy test
    initial begin
        $display("Start ShiftL2 simulation...");

        shiftin = 32'h0000_0000;   #10;
        shiftin = 32'h0000_0001;   #10;
        shiftin = 32'h0000_0003;   #10;
        shiftin = 32'hFFFF_FFFF;   #10; // full 1
        shiftin = 32'h8000_0000;   #10; // bit MSB set
        shiftin = 32'h1234_5678;   #10; // random value

        $display("End ShiftL2 simulation.");
        $stop;
    end
	 // In ra console duy nhất 1 lần khi có thay đổi
    always @(shiftin or shiftout) begin
        $display(
            "Time=%0t | shiftin=0x%08h | shiftout=0x%08h",
            $time, shiftin, shiftout
        );
    end
endmodule