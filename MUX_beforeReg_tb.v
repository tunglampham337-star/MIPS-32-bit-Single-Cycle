`timescale 1ns / 1ps

module MUX_beforeReg_tb;
    // Tín hiệu test
    reg [4:0] ina;
    reg [4:0] inb;
    reg control;
    wire [4:0] mux_output;
	 // Kết nối module
    MUX_beforeReg uut (
        .ina(ina),
        .inb(inb),
        .control(control),
        .mux_output(mux_output)
    );
	 // Test sequence
    initial begin
        $display("Start MUX_beforeReg simulation...");

        // Test case 1: control = 0 -> chọn ina
        ina = 5'b00001;  // 1
        inb = 5'b11111;  // 31
        control = 0;
        #10;
		  // Test case 2: control = 1 -> chọn inb
        control = 1;
        #10;

        // Test case 3: đổi dữ liệu, control = 0
        ina = 5'b10101;  // 21
        inb = 5'b01010;  // 10
        control = 0;
        #10;
		  // Test case 4: control = 1
        control = 1;
        #10;

        $display("End MUX_beforeReg simulation.");
        $stop;
    end
	 // Dùng 1 display duy nhất
    always @(ina or inb or control or mux_output) begin
        $display(
            "Time=%0t | control=%b | ina=0x%02h | inb=0x%02h | mux_output=0x%02h",
            $time, control, ina, inb, mux_output
        );
    end
endmodule