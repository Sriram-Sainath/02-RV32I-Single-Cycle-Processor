module tb;
reg clk=0, reset=1;
wire [31:0] pc, instr, wb;

top dut(clk,reset,pc,instr,wb);

always #5 clk = ~clk;

initial begin
    #10 reset=0;
    #1000 $finish;
end

initial begin
    $display("==============================================================");
$display("Time\tPC\tInstruction\tWriteBack");
$display("==============================================================");

$monitor("%0t\t%h\t%h\t%d",
         $time,
         pc,
         instr,
         wb);
end
endmodule