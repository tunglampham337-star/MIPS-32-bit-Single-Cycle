`timescale 1ns / 1ps
module CU(reg_dst, branch, jump, mem_read, mem_to_reg, mem_write, alu_src, reg_write, opcode, alu_op);
input [5:0] opcode;
output reg reg_dst, jump, branch, mem_to_reg, mem_read, mem_write, alu_src, reg_write;
output reg [1:0] alu_op;
always @(*) 
begin
	case (opcode)
		0 : begin		//lenh R-type
			reg_dst = 1;
			alu_src = 0;
			mem_to_reg = 0;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			jump = 0;
			alu_op = 2'b10;
				end
		35 : begin 		//lenh lw
			reg_dst = 0;
			alu_src = 1;
			mem_to_reg = 1;
			reg_write = 1;
			mem_read = 1;
			mem_write = 0;
			branch = 0;
			jump = 0;
			alu_op = 2'b00;
				end
		43 : begin 		//lenh sw
			reg_dst = 1'bx; //don't care
			alu_src = 1;
			mem_to_reg = 1'bx; //don't care
			reg_write = 0;
			mem_read = 0;
			mem_write = 1;
			branch = 0;
			jump = 0;
			alu_op = 2'b00;
				end
		4 : begin 		//lenh beq
			reg_dst = 1'bx; //don't care
			alu_src = 0;
			mem_to_reg = 1'bx; //don't care
			reg_write = 0;
			mem_read = 0;
			mem_write = 0;
			branch = 1;
			jump = 0;
			alu_op = 2'b01;
				end
		2 : begin 		//lenh jump
			reg_dst = 1'bx; //don't care
			alu_src = 1'bx; //don't care
			mem_to_reg = 1'bx; //don't care
			reg_write = 0;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			jump = 1;
			alu_op = 2'b00;
				end
		8 : begin        // lenh ADDI
			reg_dst = 0;
			alu_src = 1;
			mem_to_reg = 0;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			jump = 0;
		   alu_op = 2'b00; // ALU thuc hien cong
				end
		12 : begin   // Lệnh andi
         reg_dst = 0;
         alu_src = 1;
         mem_to_reg = 0;
         reg_write = 1;
         mem_read = 0;
			mem_write = 0;
         branch = 0;
         jump = 0;
         alu_op = 2'b11; // ALU thực hiện phép AND
				end
		 13 : begin // ori
            reg_dst    = 0;
            alu_src    = 1;
            mem_to_reg = 0;
            reg_write  = 1;
            mem_read   = 0;
            mem_write  = 0;
            branch     = 0;
            jump       = 0;
            alu_op     = 2'b11; // ALU or (I-type)
        end
		 default : begin 		//no action
			reg_dst = 0;
			alu_src = 0;
			mem_to_reg = 0;
			reg_write = 0;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			jump = 0;
			alu_op = 2'b00;
				end
endcase
end
endmodule
