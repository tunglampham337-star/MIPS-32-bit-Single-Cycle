`timescale 1ns/1ps

module RegisterFile_tb;
    // Tín hiệu kích thích (stimulus)
    reg clk;
    reg reg_write;
    reg [4:0] rs, rt, rd;
    reg [31:0] write_data;
	 wire [31:0] reg_data1;
    wire [31:0] reg_data2;
	 RegisterFile uut (
        .clk(clk),
        .reg_write(reg_write),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .write_data(write_data),
        .reg_data1(reg_data1),
        .reg_data2(reg_data2)
    );
	 initial begin
        clk = 0;
        forever #5 clk = ~clk; // Chu kỳ clock 10ns
    end
	 initial begin
        // Khởi tạo giá trị đầu tiên
        reg_write = 0;
        rs = 0;
        rt = 0;
        rd = 0;
        write_data = 0;

        #10;
		   // Ghi giá trị 32'hAAAA_BBBB vào thanh ghi số 5
        reg_write = 1;
        rd = 5;
        write_data = 32'hAAAA_BBBB;
        #10; // Chờ rising edge của clock
        
		  // Tắt tín hiệu ghi
        reg_write = 0;
        rd = 0;
        write_data = 0;
        #10;

        // Đọc dữ liệu từ thanh ghi 5 
        rs = 5;
        #10;
		   // Kiểm tra đọc từ thanh ghi 0 (luôn phải là 0)
        rs = 0;
        #10;

    end
	 always @(posedge clk) begin
        $display(
            "Time=%0t | reg_write=%0b | rd=%0d | write_data=0x%h | rs=%0d -> reg_data1=0x%h | rt=%0d -> reg_data2=0x%h",
            $time, reg_write, rd, write_data, rs, reg_data1, rt, reg_data2
        );
    end
endmodule