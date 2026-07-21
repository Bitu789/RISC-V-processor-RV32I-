`timescale 1ns / 1ps

module ALUSourceMUX(

    input  [31:0] ReadData2,
    input  [31:0] Immediate,
    input         ALUSrc,

    output [31:0] ALUInputB

);

assign ALUInputB = (ALUSrc) ? Immediate : ReadData2;

endmodule