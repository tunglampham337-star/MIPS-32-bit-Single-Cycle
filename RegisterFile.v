module RegisterFile(
    input clk,                    // Tin hieu dong ho
    input reg_write,               // Tin hieu dieu khien thanh ghi (1:ghi)
    input [4:0] rs,         // Dia chi thanh ghi thu nhat
    input [4:0] rt,         // Dia chi thanh ghi thu hai
    input [4:0] rd,         // dia chi thanh ghi cuoi
    input [31:0] write_data,       // du lieu ghi vao thanh ghi
    output [31:0] reg_data1,      // Du lieu cua thanh ghi thu nhat
    output [31:0] reg_data2       // Du lieu cua thanh ghi thu hai
);

  // Mang thanh ghi moi thanh ghi 32bit
  reg [31:0] regmem [31:0];

integer i;

initial begin
    for (i = 0; i < 32; i = i + 1)
      regmem[i] = 32'b0;  // Reset tat ca
end
  // Ghi du lieu vo thanh ghi (neu tin hieu regWrite = 1)
  always @(posedge clk) begin
    if (reg_write && (rd != 0)) begin
      regmem[rd] <= write_data;
    end
  end

assign reg_data1 = regmem[rs];
assign reg_data2 = regmem[rt];
endmodule
