`timescale 1ns / 1ps
module DATAMEM(
	input  clk,
    input  mem_read,
    input  mem_write,
    input  [31:0] addr,
    input  [31:0] write_data,
    output  [31:0] read_data
    );
	 
reg [31:0] memory [0:511];  // 1KB = 1024 words
reg [31:0] read_data_reg;
assign read_data = read_data_reg;
always @(posedge clk) begin
    if (mem_write) begin
        memory[addr[11:2]] <= write_data;
		  $display(">>> [WRITE] Time=%0dns | Addr=%h | Data=%h", $time, addr, write_data);
    end
    if (mem_read) begin
        read_data_reg <= memory[addr[11:2]];
		  $display(">>> [READ]  Time=%0dns | Addr=%h | Data=%h", $time, addr, memory[addr[11:2]]);
    end
end 
endmodule
