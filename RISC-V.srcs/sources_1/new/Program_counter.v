`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.07.2026 21:59:43
// Design Name: 
// Module Name: Program_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ProgramCounter(
    input         clk,
    input         rst,
    input         PCWrite,
    input  [31:0] PCNext,
    output reg [31:0] PC
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        PC <= 32'h00000000;      // Reset PC to address 0
    else if (PCWrite)
        PC <= PCNext;            // Update PC
    else
        PC <= PC;                // Hold current PC
end

endmodule