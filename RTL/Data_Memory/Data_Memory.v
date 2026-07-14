module DataMemory(input clk,
                  input MemRead, MemWrite,
                  input [31:0] addr, wd,
                  output [31:0] rd);

reg [31:0] mem [0:63];
integer i;

initial begin
    for(i=0;i<64;i=i+1)
        mem[i]=32'b0;
end

always @(posedge clk)
    if (MemWrite)
        mem[addr[31:2]] <= wd;

assign rd = MemRead ? mem[addr[31:2]] : 32'b0;
endmodule