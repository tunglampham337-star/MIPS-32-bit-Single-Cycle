`timescale 1ns / 1ps

module MUX_tb;
    // Tín hiệu test
    reg [31:0] in0;
    reg [31:0] in1;
    reg ctrl;
    wire [31:0] mux_out;
	  // Kết nối module
    MUX uut (
        .in0(in0),
        .in1(in1),
        .ctrl(ctrl),
        .mux_out(mux_out)
    );

    // Tạo test sequence
    initial begin
        $display("Start MUX simulation...");
		   // TH1: ctrl = 0 -> chọn in0
        in0 = 32'hAAAA_BBBB;
        in1 = 32'h1234_5678;
        ctrl = 0;
        #10;

        // TH2: ctrl = 1 -> chọn in1
        ctrl = 1;
        #10;

        // TH3: đổi dữ liệu in0, in1, ctrl = 0
        in0 = 32'h0000_1111;
        in1 = 32'hFFFF_0000;
        ctrl = 0;
        #10;
		  // TH4: ctrl = 1
        ctrl = 1;
        #10;

        $display("End MUX simulation.");
        $stop;
    end
	 // Dùng 1 display duy nhất
    always @(in0 or in1 or ctrl or mux_out) begin
        $display(
            "Time=%0t | ctrl=%b | in0=0x%08h | in1=0x%08h | mux_out=0x%08h",
            $time, ctrl, in0, in1, mux_out
        );
    end
endmodule
