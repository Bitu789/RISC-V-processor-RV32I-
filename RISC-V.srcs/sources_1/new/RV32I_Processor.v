`timescale 1ns / 1ps

module RV32I_Processor(

    input clk,
    input rst

);

//====================================================
// Internal Signals
//====================================================

// Program Counter
wire [31:0] PC;
wire [31:0] PCNext;
wire [31:0] PCPlus4;

// Instruction
wire [31:0] Instruction;

// Instruction Fields
wire [6:0] opcode;
wire [4:0] rd;
wire [2:0] funct3;
wire [4:0] rs1;
wire [4:0] rs2;
wire [6:0] funct7;

// Register File
wire [31:0] ReadData1;
wire [31:0] ReadData2;
wire [31:0] WriteBackData;

// Immediate
wire [31:0] Immediate;

// ALU
wire [31:0] ALUInputB;
wire [31:0] ALUResult;
wire Zero;

// Memory
wire [31:0] MemoryData;

// Control Signals
wire RegWrite;
wire MemRead;
wire MemWrite;
wire ALUSrc;
wire Branch;
wire Jump;
wire BNE;

wire [1:0] ResultSrc;
wire [1:0] ALUOp;

wire [3:0] ALUControlSignal;


//====================================================
// PC + 4
//====================================================

assign PCPlus4 = PC + 32'd4;


//====================================================
// Program Counter
//====================================================

ProgramCounter PC_Module(

    .clk(clk),
    .rst(rst),
    .PCWrite(1'b1),
    .PCNext(PCNext),
    .PC(PC)

);


//====================================================
// Instruction Memory
//====================================================

InstructionMemory IM(

    .addr(PC),
    .instruction(Instruction)

);


//====================================================
// Instruction Decoder
//====================================================

InstructionDecoder ID(

    .instruction(Instruction),

    .opcode(opcode),
    .rd(rd),
    .funct3(funct3),
    .rs1(rs1),
    .rs2(rs2),
    .funct7(funct7)

);


//====================================================
// Control Unit
//====================================================

ControlUnit CU(

    .opcode(opcode),
    .funct3(funct3),

    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .Branch(Branch),
    .Jump(Jump),
    .BNE(BNE),

    .ResultSrc(ResultSrc),
    .ALUOp(ALUOp)

);


//====================================================
// Register File
//====================================================

RegisterFile RF(

    .clk(clk),

    .RegWrite(RegWrite),

    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),

    .WriteData(WriteBackData),

    .ReadData1(ReadData1),
    .ReadData2(ReadData2)

);


//====================================================
// Immediate Generator
//====================================================

ImmediateGenerator IG(

    .instruction(Instruction),

    .immediate(Immediate)

);
//====================================================
// ALU Control
//====================================================

ALUControl AC(

    .ALUOp(ALUOp),
    .funct3(funct3),
    .funct7(funct7),

    .ALUControl(ALUControlSignal)

);


//====================================================
// ALU Source MUX
//====================================================

ALUSourceMUX ASM(

    .ReadData2(ReadData2),
    .Immediate(Immediate),
    .ALUSrc(ALUSrc),

    .ALUInputB(ALUInputB)

);


//====================================================
// ALU
//====================================================

ALU ALU_Module(

    .A(ReadData1),
    .B(ALUInputB),

    .ALUControl(ALUControlSignal),

    .Result(ALUResult),
    .Zero(Zero)

);


//====================================================
// Data Memory
//====================================================

DataMemory DM(

    .clk(clk),

    .MemRead(MemRead),
    .MemWrite(MemWrite),

    .Address(ALUResult),
    .WriteData(ReadData2),

    .ReadData(MemoryData)

);


//====================================================
// Write Back MUX
//====================================================

WriteBackMUX WBM(

    .ALUResult(ALUResult),
    .MemoryData(MemoryData),
    .PCPlus4(PCPlus4),

    .ResultSrc(ResultSrc),

    .WriteBackData(WriteBackData)

);


//====================================================
// Branch Unit
//====================================================

BranchUnit BU(

    .PC(PC),
    .Immediate(Immediate),

    .Branch(Branch),
    .Jump(Jump),
    .Zero(Zero),
    .BNE(BNE),

    .PCNext(PCNext)

);


endmodule