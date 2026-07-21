`timescale 1ns / 1ps

module ControlUnit(

    input  [6:0] opcode,
    input  [2:0] funct3,

    output reg        RegWrite,
    output reg        MemRead,
    output reg        MemWrite,
    output reg        ALUSrc,
    output reg        Branch,
    output reg        Jump,
    output reg        BNE,

    output reg [1:0]  ResultSrc,
    output reg [1:0]  ALUOp

);

always @(*)
begin

    // Default Values
    RegWrite  = 0;
    MemRead   = 0;
    MemWrite  = 0;
    ALUSrc    = 0;
    Branch    = 0;
    Jump      = 0;
    BNE       = 0;
    ResultSrc = 2'b00;
    ALUOp     = 2'b00;

    case(opcode)

    //--------------------------------------------------
    // R-Type Instructions
    //--------------------------------------------------
    7'b0110011:
    begin
        RegWrite  = 1;
        ALUSrc    = 0;
        ResultSrc = 2'b00;
        ALUOp     = 2'b10;
    end

    //--------------------------------------------------
    // I-Type (ADDI, ANDI, ORI, XORI ...)
    //--------------------------------------------------
    7'b0010011:
    begin
        RegWrite  = 1;
        ALUSrc    = 1;
        ResultSrc = 2'b00;
        ALUOp     = 2'b10;
    end

    //--------------------------------------------------
    // LW
    //--------------------------------------------------
    7'b0000011:
    begin
        RegWrite  = 1;
        MemRead   = 1;
        ALUSrc    = 1;
        ResultSrc = 2'b01;
        ALUOp     = 2'b00;
    end

    //--------------------------------------------------
    // SW
    //--------------------------------------------------
    7'b0100011:
    begin
        MemWrite  = 1;
        ALUSrc    = 1;
        ALUOp     = 2'b00;
    end

    //--------------------------------------------------
    // Branch Instructions
    //--------------------------------------------------
    7'b1100011:
    begin

        Branch = 1;
        ALUSrc = 0;
        ALUOp  = 2'b01;

        case(funct3)

            3'b000:     // BEQ
            begin
                BNE = 0;
            end

            3'b001:     // BNE
            begin
                BNE = 1;
            end

            default
            begin
                BNE = 0;
            end

        endcase

    end

    //--------------------------------------------------
    // JAL
    //--------------------------------------------------
    7'b1101111:
    begin
        Jump      = 1;
        RegWrite  = 1;
        ResultSrc = 2'b10;
    end

    //--------------------------------------------------
    // Default
    //--------------------------------------------------
    default
    begin
        RegWrite  = 0;
        MemRead   = 0;
        MemWrite  = 0;
        ALUSrc    = 0;
        Branch    = 0;
        Jump      = 0;
        BNE       = 0;
        ResultSrc = 2'b00;
        ALUOp     = 2'b00;
    end

    endcase

end

endmodule