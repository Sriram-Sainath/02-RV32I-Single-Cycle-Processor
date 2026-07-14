# Create work library
vlib work

# Compile RTL files

vlog ../RTL/Adder/Adder.v
vlog ../RTL/ALU/ALU.v
vlog ../RTL/Register_File/Register_File.v
vlog ../RTL/Control_Unit/Control_Unit.v
vlog ../RTL/Immediate_Generator/Immediate_Generator.v
vlog ../RTL/Instruction_Memory/Instruction_Memory.v
vlog ../RTL/Data_Memory/Data_Memory.v
vlog ../RTL/Multiplexers/Multiplexers.v
vlog ../RTL/Program_Counter/Program_Counter.v
vlog ../RTL/Top_Module/Top_Module.v

# Compile Testbench

vlog ../Testbench/tb_rv32i_single_cycle.v