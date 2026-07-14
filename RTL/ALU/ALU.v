module ALU(input [31:0] A,B,
           input [3:0] alu_ctrl,
           output reg [31:0] result,
           output zero);

always @(*) begin
    case(alu_ctrl)
        4'b0010: result = A + B;
        4'b0110: result = A - B;
        4'b0000: result = A & B;
        4'b0001: result = A | B;
        default: result = 0;
    endcase
end

assign zero = (result==0);
endmodule
