`timescale 1ns / 1ps

module ALUControl(

    input  [1:0] ALUOp,
    input  [2:0] funct3,
    input  [6:0] funct7,

    output reg [3:0] ALUControl

);

always @(*)
begin

    case(ALUOp)

        // Load / Store
        2'b00:
            ALUControl = 4'b0010;      // ADD

        // Branch
        2'b01:
            ALUControl = 4'b0110;      // SUB

        // R-Type / I-Type
        2'b10:
        begin

            case(funct3)

                3'b000:
                begin
                    if(funct7 == 7'b0100000)
                        ALUControl = 4'b0110;      // SUB
                    else
                        ALUControl = 4'b0010;      // ADD / ADDI
                end

                3'b111:
                    ALUControl = 4'b0000;          // AND

                3'b110:
                    ALUControl = 4'b0001;          // OR

                3'b100:
                    ALUControl = 4'b0011;          // XOR

                3'b010:
                    ALUControl = 4'b0111;          // SLT

                default:
                    ALUControl = 4'b1111;

            endcase

        end

        default:
            ALUControl = 4'b1111;

    endcase

end

endmodule