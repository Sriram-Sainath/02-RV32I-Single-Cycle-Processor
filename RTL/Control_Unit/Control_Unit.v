module Control(input [6:0] opcode,
               output reg RegWrite, ALUSrc, Branch,
               output reg MemRead, MemWrite, MemtoReg,
               output reg [1:0] ALUOp);

always @(*) begin
    RegWrite=0; ALUSrc=0; Branch=0;
    MemRead=0; MemWrite=0; MemtoReg=0; ALUOp=2'b00;

    case(opcode)
        7'b0110011: begin RegWrite=1; ALUOp=2'b10; end
        7'b0010011: begin RegWrite=1; ALUSrc=1; ALUOp=2'b10; end
        7'b0000011: begin RegWrite=1; ALUSrc=1; MemRead=1; MemtoReg=1; end
        7'b0100011: begin ALUSrc=1; MemWrite=1; end
        7'b1100011: begin Branch=1; ALUOp=2'b01; end
    endcase
end
endmodule