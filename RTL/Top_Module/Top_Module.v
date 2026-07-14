module top(input clk, reset,
           output [31:0] pc, instr, wb_out);

wire [31:0] pc4, pc_next, rd1, rd2, imm, alu_b, alu_out, mem_out;
wire RegWrite, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, zero;
wire [1:0] ALUOp;
wire [3:0] alu_ctrl;

ProgramCounter PC(clk,reset,pc_next,pc);
PCPlus4 P4(pc,pc4);
InstructionMemory IM(pc,instr);
RegFile RF(clk,reset,RegWrite,instr[19:15],instr[24:20],
           instr[11:7],wb_out,rd1,rd2);
ImmGen IG(instr,imm);
Control CU(instr[6:0],RegWrite,ALUSrc,Branch,MemRead,MemWrite,MemtoReg,ALUOp);
ALUControl AC(ALUOp,instr[14:12],instr[30],alu_ctrl);

assign alu_b = ALUSrc ? imm : rd2;

ALU ALU1(rd1,alu_b,alu_ctrl,alu_out,zero);
DataMemory DM(clk,MemRead,MemWrite,alu_out,rd2,mem_out);

assign wb_out = MemtoReg ? mem_out : alu_out;
assign pc_next = (Branch && zero) ? pc + imm : pc4;

endmodule
