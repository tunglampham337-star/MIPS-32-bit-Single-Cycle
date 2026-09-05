`timescale 1ns / 1ps

module mips_top_tb;

	// Inputs
	reg in_clk;
	reg in_reset;

	// Outputs
	wire [31:0] s0, odd, even;
   wire [31:0] Operation_state;
	wire [31:0] pcout;
	wire [31:0] instructionMem_out;
	wire [31:0] ALUplus4;
	wire [31:0] shiftjmp_out;
	wire [31:0] ALUadd_out;
	wire [31:0] shiftadd_out;
	wire [31:0] MUXbranch_out;
	wire [31:0] MUXjmp_or_plus4;
	wire and_out;
	wire zero_out;
	wire [4:0] MUX_trcreg_out;
	wire [31:0] signext_out;
	wire [31:0] datamem_out;
	wire RegDst;
	wire Jump;
	wire Branch;
	wire MemRead;
	wire MemtoReg;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;
	wire [1:0] ALUOp;
	wire [4:0] debug_WriteReg;
   wire [31:0] debug_WriteData;
   wire debug_RegWrite;
	wire [31:0] ALU_a;
	wire [31:0] ALU_b;

	// Instantiate the Unit Under Test (UUT)
	main_mips uut (
		.in_clk(in_clk), 
		.in_reset(in_reset), 
		.s0(s0),
		.odd(odd),
		.even(even),
		.Operation_state(Operation_state),
		.pcout(pcout), 
		.instructionMem_out(instructionMem_out), 
		.ALUplus4(ALUplus4), 
		.shiftjmp_out(shiftjmp_out), 
		.ALUadd_out(ALUadd_out), 
		.shiftadd_out(shiftadd_out), 
		.MUXbranch_out(MUXbranch_out), 
		.MUXjmp_or_plus4(MUXjmp_or_plus4), 
		.and_out(and_out), 
		.zero_out(zero_out), 
		.MUX_trcreg_out(MUX_trcreg_out), 
		.signext_out(signext_out), 
		.datamem_out(datamem_out), 
		.RegDst(RegDst), 
		.Jump(Jump), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemtoReg(MemtoReg), 
		.MemWrite(MemWrite), 
		.ALUSrc(ALUSrc), 
		.RegWrite(RegWrite), 
		.ALUOp(ALUOp),
		.debug_WriteReg(debug_WriteReg),
      .debug_WriteData(debug_WriteData),
      .debug_RegWrite(debug_RegWrite),
		.ALU_a(ALU_a),
		.ALU_b(ALU_b)
	);    
	// Clock generation
	always #5 in_clk = ~in_clk;  // 10ns period
	// Initial block
	initial begin
	$monitor("Time=%0dns | PC=%h | Instr=%h | ALU_a=%h | ALU_b=%h | ALUControl=%b | ALUResult=%h | Zero=%b | Branch=%b | Jump=%b", 
             $time, 
             pcout, 
             instructionMem_out, 
             uut.g5,         // ALU input a
             uut.g17,        // ALU input b
             uut.c12,        // alu_control (4-bit control to ALU)
             uut.g12,        // ALU result
             uut.c10,        // zero output
             Branch,
             Jump);
		in_clk = 0;
		in_reset = 1;
		#10;    // giữ reset trong 20ns
		in_reset = 0;
	end
	
    /*always @(posedge in_clk) begin
    if (pcout == 32'h00000048) begin // Wait tới Done (0x38)
        $display("✅ Final Result (s0) = %d", uut.regfile.regmem[16]);
        $finish;
		  end
	//DUNG NEU CHAY CHUONG TRINH KIEM TRA SO 6 LA SO NGUYEN TO HAY KHONG
	
		   /*
			always @(posedge in_clk) begin
    if (pcout == 32'h00000040) begin // Wait tới Done
        $display("Final Result (s0) = %d", uut.regfile.regmem[16]);
        $finish;
    end
//DUNG NEU CHAY CHUONG TRINH KIEM TRA SO 3 CO PHAI SO NGUYEN TO KHONG
*/
endmodule

