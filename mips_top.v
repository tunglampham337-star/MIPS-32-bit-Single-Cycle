module main_mips (
    input wire in_clk,
    input wire in_reset,
    output wire [31:0] s0, odd, even,
	 output wire [31:0] Operation_state,
	 
	 //debug_output
	 output [31:0] pcout,
	 output [31:0] instructionMem_out,
	 output [31:0] ALUplus4,
	 output [31:0] shiftjmp_out,
	 output [31:0] ALUadd_out,
	 output [31:0] shiftadd_out,
	 output [31:0] MUXbranch_out,
	 output [31:0] MUXjmp_or_plus4,
	 output and_out,
	 output zero_out,
	 output [4:0] MUX_trcreg_out,
	 output [31:0] signext_out,
	 output [31:0] datamem_out,
	 output RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,
	 output [1:0] ALUOp,
	 output wire [4:0] debug_WriteReg,
    output wire [31:0] debug_WriteData,
    output wire debug_RegWrite,
	 output [31:0] ALU_a,
	 output [31:0] ALU_b
);
    // === Wires ===
    wire [31:0] g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g17;
	 wire [4:0] g16;
	 wire [27:0] shift_out;
	 wire [31:0] g15;
	 wire c1, c2, c3, c4, c5, c7, c8, c9, c10, c11;
	 wire [3:0] c12;
	 wire [1:0] c6;
	 assign s0 = regfile.regmem[16]; // KET QUA CHUONG TRINH DUOC LUU TRONG THANH GHI $S0
	 assign odd = regfile.regmem[17]; // KET QUA LE DUOC LUU TRONG THANH GHI $S1
	 assign even = regfile.regmem[18]; // KET QUA CHAN DUOC LUU TRONG THANH GHI $S2
	 //debug_output
	 assign pcout = g2;
	 assign instructionMem_out = g3;
	 assign ALUplus4 = g4;
	 assign shiftjmp_out = g15;
	 assign ALUadd_out = g9;
	 assign shiftadd_out = g8;
	 assign MUXbranch_out = g10; 
	 assign MUXjmp_or_plus4 = g1;
	 assign and_out = c11;
	 assign MUX_trcreg_out = g16;
	 assign signext_out = g7; 
	 assign datamem_out = g13;
	 assign zero_out = c10;
	 assign Operation_state = g12;
	 assign debug_WriteReg = g16;         
	 assign debug_WriteData = g14;         
	 assign debug_RegWrite = c9;    

	 assign ALU_a = g5;
	 assign ALU_b = g17;	 
	 
	 assign RegDst = c1;
	 assign Jump = c2;
	 assign Branch = c3;
	 assign MemRead = c4;
	 assign MemtoReg = c5;
	 assign MemWrite = c7;
	 assign ALUSrc = c8;
	 assign RegWrite = c9;
	 assign ALUOp = c6;
	 
	PC pc(
	.clk(in_clk),
	.reset(in_reset),
	.pc_out(g2),
	.pc_in(g1)
	);
	InstructionMemory IM(
	.addr(g2),
	.instruction(g3)
	);
	ALUadd_4 plus4(
	.pcout_input(g2),
	.ALUadd_4out(g4)
	);
	ShiftL2jmp shift_jump(   //cho lenh jump
	.shiftjmpin(g3[25:0]),
	.shiftjmpout(shift_out)
	);
		assign g15 = {g4[31:28], shift_out};
	ALUadd adder(
	.pcout(g4),
	.shiftout(g8),
	.ALU_ADD_RESULT(g9)
	);
	ShiftL2 shift_add( // cho ALUadd
	.shiftin(g7),
	.shiftout(g8)
	);
	MUX branch(
	.in0(g4),
	.in1(g9),
	.ctrl(c11),
	.mux_out(g10)
	);
	MUX jmp_or_plus4(
	.in0(g10),
	.in1(g15),
	.ctrl(c2),
	.mux_out(g1)
	);
	AND_gate branch_and(
	.branch(c3), 
	.zero(c10),
	.AND_OUT(c11)
	);
	CU cu(
	.opcode(g3[31:26]),
	.reg_dst(c1), 
	.branch(c3), 
	.jump(c2), 
	.mem_read(c4), 
	.mem_to_reg(c5), 
	.mem_write(c7), 
	.alu_src(c8), 
	.reg_write(c9),  
	.alu_op(c6)
	);
	RegisterFile regfile(
    .clk(in_clk),                    
    .reg_write(c9),               
    .rs(g3[25:21]),         
    .rt(g3[20:16]),         
    .rd(g16),         
    .write_data(g14),       
    .reg_data1(g5),      
    .reg_data2(g6)       
    );
	MUX_beforeReg trcreg(  //mux truoc regFile
	 .ina(g3[20:16]),
	 .inb(g3[15:11]),
	 .control(c1),
	 .mux_output(g16)
	 );
	MUX saureg(  //mux sau regFile
	 .in0(g6),
	 .in1(g7),
	 .ctrl(c8),
	 .mux_out(g17)
	 );
	ALU alu(
	 .alu_control(c12),
	 .a(g5),
	 .b(g17),
	 .result(g12),
	 .zero(c10)
    );
	ALUControl control(
	 .alu_op(c6),
	 .funct(g3[5:0]),
	 .alu_control(c12)
	 );
	SignExtend signext(
	 .Signin(g3[15:0]), 
	 .Signout(g7)
	 );
	DATAMEM dm(
	 .clk(in_clk),
    .mem_read(c4),
    .mem_write(c7),
    .addr(g12),
    .write_data(g6),
    .read_data(g13)
    );
	MUX sau_DataMem(  //mux sau DataMem
	 .in0(g12),
	 .in1(g13),
	 .ctrl(c5),
	 .mux_out(g14)
	 );
	
endmodule