`timescale 1ns / 1ps

module ALUControl_tb;
    // Khai báo tín hiệu
    reg [1:0] alu_op;
    reg [5:0] funct;
    wire [3:0] alu_control;

    // Kết nối module
    ALUControl uut (
        .alu_op(alu_op),
        .funct(funct),
        .alu_control(alu_control)
    );
 // Test sequence
    initial begin
        $display("Start ALUControl simulation...");

        // Các test case
        test_case(2'b00, 6'bxxxxxx);  // lw/sw (ADD)
        test_case(2'b01, 6'bxxxxxx);  // beq (SUB)
        test_case(2'b10, 6'b100000);  // R-type ADD
        test_case(2'b10, 6'b100010);  // R-type SUB
        test_case(2'b10, 6'b100100);  // R-type AND
        test_case(2'b10, 6'b100101);  // R-type OR
        test_case(2'b10, 6'b101010);  // R-type SLT
		  test_case(2'b10, 6'b000000);  // R-type SLL
        test_case(2'b10, 6'b000010);  // R-type SRL
        test_case(2'b11, 6'bxxxxxx);  // I-type default

        $display("End ALUControl simulation.");
        $stop;
    end
	 
	  // Task gom lại để code gọn và đẹp
    task test_case(input [1:0] alu_op_in, input [5:0] funct_in);
    begin
        alu_op = alu_op_in;
        funct = funct_in;
        #1; // Chờ ổn định 1ns
        $display(
            "Time=%0t | alu_op=%b | funct=0x%02h | alu_control=%b",
            $time, alu_op, funct, alu_control
				 );
        #9; // Hoàn thành 10ns mỗi lần test
    end
    endtask
endmodule