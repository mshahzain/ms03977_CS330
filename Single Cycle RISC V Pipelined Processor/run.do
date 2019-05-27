#Compiling design modules
vlog MUX.v Program_Counter.v Adder.v Instruction_Memory.v instruction.v Control_Unit.v registerFile.v MUX_TRI_12.v IMM_DATA_GEN.v MUX_TRI.v ALU_Control.v forwarding_unit.v ALU_64_BIT.v Data_Memory.v MUX_I.v RISC_V_Processor.v tb.v 

#no optimization
vsim -novopt work.tb

#view waves
view wave

#Adding waves
#add wave sim:/tb/Clk
#add wave sim:/tb/Reset

do wave.do

run 210ns
