`timescale 1ns / 1ps

module ShiftL2jmp_tb;
    // Khai báo tín hiệu
    reg [25:0] shiftjmpin;
    wire [27:0] shiftjmpout;
    
    // Gọi module ShiftL2jmp
    ShiftL2jmp uut (
        .shiftjmpin(shiftjmpin),
        .shiftjmpout(shiftjmpout)
    );
	 // Tạo dãy test
    initial begin
        $display("Start ShiftL2jmp simulation...");

        shiftjmpin = 26'b0;            #10;
        shiftjmpin = 26'b1;            #10;
        shiftjmpin = 26'b11;           #10;
        shiftjmpin = 26'h3FFFFFF;      #10; // Giá trị lớn nhất 26-bit (all 1)
        shiftjmpin = 26'h123456;       #10; // Một số hex ngẫu nhiên
        shiftjmpin = 26'h2AAAAA;       #10; // Một mẫu bit xen kẽ
 $display("End ShiftL2jmp simulation.");
        $stop;
    end

    // 1 display duy nhất
    always @(shiftjmpin or shiftjmpout) begin
        $display(
            "Time=%0t | shiftjmpin=0x%07h | shiftjmpout=0x%07h",
            $time, shiftjmpin, shiftjmpout
        );
    end
endmodule