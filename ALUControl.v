module ALUControl(
    input [1:0] alu_op,   
    input [5:0] funct,    // 6 bit funct R-type
    output reg [3:0] alu_control // ALUControl output
);
  
  always @(*) begin
    case (alu_op)
      2'b00: // load/store (lw, sw)
        alu_control = 4'b0010;  // ADD 
        
      2'b01: // Lenh beq
        alu_control = 4'b0110;  // SUB (so sanh)
        
      2'b10: //R-type
        case (funct)
          6'b100000: alu_control = 4'b0010; // ADD
          6'b100010: alu_control = 4'b0110; // SUB
          6'b100100: alu_control = 4'b0000; // AND
          6'b100101: alu_control = 4'b0001; // OR
			 6'b100110: alu_control = 4'b0011; // XOR
          6'b101010: alu_control = 4'b0111; // SLT (set less than)
          6'b000000: alu_control = 4'b0100; // SLL (shift left logical)
          6'b000010: alu_control = 4'b0101; // SRL (shift right logical)
          default:   alu_control = 4'b0000; // mac dinh and
        endcase
        
      2'b11: // I-type (addi, andi, or)
		begin
		alu_control = 4'b0000; // tạm default AND
		end
        
      default:
        alu_control = 4'b0000; // mac dinh AND
    endcase
  end
endmodule
