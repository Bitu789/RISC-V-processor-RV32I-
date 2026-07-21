`timescale 1ns / 1ps

module DataMemory(

    input clk,

    input MemRead,
    input MemWrite,

    input [31:0] Address,
    input [31:0] WriteData,

    output reg [31:0] ReadData

);

    // 256 x 32-bit Data Memory
    reg [31:0] memory [0:255];

    integer i;

    // Initialize Memory
    initial
    begin
        for(i=0; i<256; i=i+1)
            memory[i] = 32'b0;
    end

    // Write Operation (SW)
    always @(posedge clk)
    begin
        if(MemWrite)
            memory[Address[9:2]] <= WriteData;
    end

    // Read Operation (LW)
    always @(*)
    begin
        if(MemRead)
            ReadData = memory[Address[9:2]];
        else
            ReadData = 32'b0;
    end

endmodule