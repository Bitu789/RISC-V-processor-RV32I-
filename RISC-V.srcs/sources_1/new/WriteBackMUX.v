`timescale 1ns / 1ps

module WriteBackMUX(

    input  [31:0] ALUResult,
    input  [31:0] MemoryData,
    input  [31:0] PCPlus4,

    input  [1:0]  ResultSrc,

    output reg [31:0] WriteBackData

);

always @(*)
begin

    case(ResultSrc)

        2'b00:
            WriteBackData = ALUResult;

        2'b01:
            WriteBackData = MemoryData;

        2'b10:
            WriteBackData = PCPlus4;

        default:
            WriteBackData = 32'd0;

    endcase

end

endmodule