`timescale 1ns / 1ps

module BranchUnit(

    input  [31:0] PC,
    input  [31:0] Immediate,

    input         Branch,
    input         Jump,
    input         Zero,

    input         BNE,

    output reg [31:0] PCNext

);

always @(*)
begin

    // Default: Next Sequential Instruction
    PCNext = PC + 32'd4;

    // JAL
    if(Jump)
    begin
        PCNext = PC + Immediate;
    end

    // BEQ
    else if(Branch && !BNE && Zero)
    begin
        PCNext = PC + Immediate;
    end

    // BNE
    else if(Branch && BNE && !Zero)
    begin
        PCNext = PC + Immediate;
    end

end

endmodule