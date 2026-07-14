module RegFile(input clk, input reset, input RegWrite,
               input [4:0] rs1, rs2, rd,
               input [31:0] wd,
               output [31:0] rd1, rd2);

reg [31:0] regs [0:31];
integer i;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        for (i=0;i<32;i=i+1)
            regs[i] <= 0;
    end else if (RegWrite && rd!=0)
        regs[rd] <= wd;
end

assign rd1 = regs[rs1];
assign rd2 = regs[rs2];
endmodule
