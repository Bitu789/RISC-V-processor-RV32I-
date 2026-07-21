`timescale 1ns / 1ps

module ALU(

    input  [31:0] A,
    input  [31:0] B,
    input  [3:0]  ALUControl,

    output reg [31:0] Result,
    output Zero

);

always @(*)
begin

    case(ALUControl)

        // AND
        4'b0000:
            Result = A & B;

        // OR
        4'b0001:
            Result = A | B;

        // ADD
        4'b0010:
            Result = A + B;

        // XOR
        4'b0011:
            Result = A ^ B;

        // SUB
        4'b0110:
            Result = A - B;

        // SLT (Signed)
        4'b0111:
        begin
            if($signed(A) < $signed(B))
                Result = 32'd1;
            else
                Result = 32'd0;
        end

        default:
            Result = 32'd0;

    endcase

end

// Zero Flag (used for BEQ/BNE)
assign Zero = (Result == 32'd0);

endmodule