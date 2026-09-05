module InstructionMemory(addr, instruction);
    input [31:0] addr;
	 
    output [31:0] instruction;

    reg [31:0] memory [127:0];
	 assign instruction = memory[addr[8:2]]; // Truy xuất đồng bộ word-aligned
	
	integer i;
	initial begin
	for (i = 0; i < 128; i = i + 1)
        memory[i] = 32'b0; // Nạp sẵn NOP vào toàn bộ 64 ô
//////////////CHUONG TRINH THU NHAT: KIEM TRA XEM SO 3 LA SO LE HAY CHAN -> RESULT = 1 LA DUNG////////////////
	 /*//memory[0] = 32'b001000_00000_01000_0000000000000010;    // addi $t0, $zero, 2
	 memory[0] = 32'b001000_00000_01000_0000000000000011;    // addi $t0, $zero, 3       ; $t0 = 3
	 //memory[0] = 32'b001000_00000_01000_0000000000001001;    // addi $t0, $zero, 9       ; $t0 = 9
	 memory[1] = 32'b001000_00000_01001_0000000000000001;    // addi $t1, $zero, 1       ; $t1 = 1
	 memory[2] = 32'b000000_01000_01001_00010_00000_100100;  // and  $v0, $t0, $t1       ; $v0 = $t0 & 1
	 memory[3] = 32'b000100_00010_00000_00000_00000_000010;  // beq  $v0, $zero, 2       ; nếu chẵn, nhảy đến EVEN
	 memory[4] = 32'b001000_00000_10001_0000000000000001;    // addi $s1, $zero, 1       ; lẻ: $s1 = 1
	 memory[5] = 32'h8000005;    // j    DONE 
	 memory[6] = 32'b001000_00000_10010_0000000000000001;    // EVEN: addi $s2, $zero, 1 ; chẵn: $s2 = 1*/
////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////CHUONG TRINH THU 2: KIEM TRA SO n CO PHAI SO NGUYEN TO KHONG///////////
	/*//memory[0]  = 32'b00100000000010000000000000000100;      // addi $t0, $zero, 4
	memory[0]  = 32'b00100000000010000000000000000101;      // addi $t0, $zero, 5
	//memory[0]  = 32'h20080020;   // addi $t0, $zero, 20
	//memory[0]  = 32'h2008000B;   // addi $t0, $zero, 11
	//memory[0]  = 32'h20080017; //addi $t0, $zero, 23
	//memory[0]  = 32'h20080009;   // addi $t0, $zero, 9
	memory[1]  = 32'h20090002;   // addi $t1, $zero, 2
	memory[2]  = 32'h20100001;   // addi $s0, $zero, 1 (giả sử là nguyên tố)
	memory[3]  = 32'h210CFFFF;   // addi $t4, $t0, -1 (t4 = $t0 - 1)
	memory[4]  = 32'h109702A;    // slt $t6, $t0, $t1
	memory[5]  = 32'h11C00001;   // ✅ beq $t6, $zero, skip_jump (ở memory[7])
	memory[6]  = 32'h08000011;   // ✅ j Done (memory[17] = địa chỉ 0x44 = 0x11)
   // Start:
	memory[7]  = 32'h85020; // add $t2, $t0, $zero (copy $t0 vào $t2)

   // DivLoop:
   memory[8]  = 32'h1495022; // sub $t2, $t2, $t1
	memory[9]  = 32'h11400008;   // beq $t2, $zero, NotPrime
	memory[10]  = 32'h140582A; // slt $t3, $t2, $zero
	memory[11] = 32'h1160FFFC;   // beq $t3, $zero, DivLoop
	 // IncT1:
   memory[12] = 32'h21290001;   // addi $t1, $t1, 1

   // Kiểm tra dừng (t1 == t4):
   memory[13] = 32'h012C5826; // xor $t3, $t1, $t4
	memory[14] = 32'h11600002;   // beq $t3, $zero, Done

   // Chưa tới cuối, quay lại Start
   memory[15] = 32'h08000007;       // j Start (jump về memory[7])
	memory[16] = 32'h00000000; // NOP
   // Done:
	memory[17] = 32'h08000011; // j 16 (self-loop)
   // NotPrime:
   memory[18] = 32'h20100000;   // addi $s0, $zero, 0 (not prime)
	memory[19] = 32'h08000013;  // j 19*/
//////////////////////////////////////////////////////////////////////////////////////////////////
    //CHUONG TRINH THUC HIEN GHI/DOC DATA MEMORY
	 memory[0] = 32'b001000_00000_01000_0000000000001011; // addi $t0, $zero, 11
    memory[1] = 32'b001000_00000_00000_0000000000000000; // nop
	 memory[2] = 32'b001000_00000_00000_0000000000000000; // nop
	 memory[3] = 32'b001000_00000_00000_0000000000000000; // nop
    memory[4] = 32'b001000_00000_01001_0000000000000000; // addi $t1, $zero, 0
    memory[5] = 32'b001000_00000_00000_0000000000000000; // nop
	 memory[6] = 32'b001000_00000_00000_0000000000000000; // nop
	 memory[7] = 32'b001000_00000_00000_0000000000000000; // nop
	 memory[8] = 32'b101011_01001_01000_0000000000000000; // sw $t0, 0($t1)
    memory[9] = 32'b001000_00000_00000_0000000000000000; // nop
    memory[10] = 32'b100011_01001_01010_0000000000000000; // lw $t2, 0($t1)
    memory[11] = 32'b001000_00000_00000_0000000000000000; // nop
	 memory[12] = 32'b001000_00000_00000_0000000000000000; // nop
	 
	 //CHUONG TRINH TEST LENH BEQ VA JUMP
	 /*memory[0] = 32'b00100000000010000000000000000101; // addi $t0, $zero, 5
	 memory[1] = 32'b00100000000010010000000000000101; // addi $t1, $zero, 5
	 memory[2] = 32'b00010001000010010000000000000010; // beq $t0, $t1, offset=2
	 memory[3] = 32'b00100000000010100000000000001010; // addi $t2, $zero, 10
	 memory[4] = 32'b00000000000000000000000000000000; // NOP hazard
	 memory[5] = 32'b00100000000010110000000000010100; // addi $t3, $zero, 20
	 memory[6] = 32'b00001000000000000000000000001000; // sửa: jump đến memory[8] (PC=0x20)
	 memory[7] = 32'b00100000000011000000000000011110; // addi $t4, $zero, 30
	 memory[8] = 32'b00100000000011010000000000101000; // addi $t5, $zero, 40*/
	 

////////////////////////////////////////////////////////////////////////////////////////////////

    end
endmodule