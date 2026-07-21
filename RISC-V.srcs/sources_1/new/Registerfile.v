`timescale 1ns / 1ps

module RegisterFile(

    input clk,
    input RegWrite,

    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,

    input [31:0] WriteData,

    output [31:0] ReadData1,
    output [31:0] ReadData2

);

    // 32 General Purpose Registers
    reg [31:0] registers [0:31];

    integer i;

    // Initialize registers to zero
    initial begin
        for(i = 0; i < 32; i = i + 1)
            registers[i] = 32'b0;
    end

    // Asynchronous Read
    assign ReadData1 = (rs1 == 5'b00000) ? 32'b0 : registers[rs1];
    assign ReadData2 = (rs2 == 5'b00000) ? 32'b0 : registers[rs2];

    // Synchronous Write
    always @(posedge clk)
    begin
        if(RegWrite && (rd != 5'b00000))
            registers[rd] <= WriteData;
    end

endmodule