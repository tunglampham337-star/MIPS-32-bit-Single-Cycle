`timescale 1ns / 1ps

module SignExtend_tb;
    // Khai báo tín hiệu
    reg [15:0] Signin;
    wire [31:0] Signout;
    
    // Gọi module cần test
    SignExtend uut (
        .Signin(Signin),
        .Signout(Signout)
    );
	 // Test sequence
    initial begin
        $display("Start SignExtend simulation...");

        // Test các trường hợp
        Signin = 16'h0000;  #10;   // 0
        Signin = 16'h7FFF;  #10;   // Số dương lớn nhất 15-bit
        Signin = 16'h8000;  #10;   // Số âm nhỏ nhất (bit 15 = 1)
        Signin = 16'hFFFF;  #10;   // -1 (tất cả bit 1)
        Signin = 16'h00FF;  #10;   // 255
        Signin = 16'hFF00;  #10;   // -256
		  Signin = 16'h1234;  #10;   // số dương bất kỳ
        Signin = 16'hF234;  #10;   // số âm bất kỳ

        $display("End SignExtend simulation.");
        $stop;
    end
	  // 1 Display duy nhất
    always @(Signin or Signout) begin
        $display(
            "Time=%0t | Signin=0x%04h | Signout=0x%08h",
            $time, Signin, Signout
        );
    end
endmodule
