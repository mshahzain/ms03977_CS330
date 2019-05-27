onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb/Clk
add wave -noupdate -format Logic /tb/Reset
add wave -noupdate -format Logic /tb/rvp/Clk
add wave -noupdate -format Logic /tb/rvp/Reset
add wave -noupdate -format Literal /tb/rvp/IF_ID
add wave -noupdate -format Literal /tb/rvp/ID_EX
add wave -noupdate -format Literal /tb/rvp/EX_MEM
add wave -noupdate -format Literal /tb/rvp/MEM_WB
add wave -noupdate -format Literal -radix unsigned /tb/rvp/out1
add wave -noupdate -format Literal -radix unsigned /tb/rvp/out2_2
add wave -noupdate -format Logic /tb/rvp/Branch_3
add wave -noupdate -format Logic /tb/rvp/Zero_2
add wave -noupdate -format Literal -radix unsigned /tb/rvp/PC_In
add wave -noupdate -format Literal -radix unsigned /tb/rvp/PC_Out_1
add wave -noupdate -format Literal /tb/rvp/Instruction_1
add wave -noupdate -format Literal -radix unsigned /tb/rvp/PC_Out_2
add wave -noupdate -format Literal /tb/rvp/Instruction_2
add wave -noupdate -format Literal /tb/rvp/opcode
add wave -noupdate -format Literal -radix unsigned /tb/rvp/rd_1
add wave -noupdate -format Literal /tb/rvp/funct3
add wave -noupdate -format Literal -radix unsigned /tb/rvp/rs1_1
add wave -noupdate -format Literal -radix unsigned /tb/rvp/rs2_1
add wave -noupdate -format Literal /tb/rvp/funct7
add wave -noupdate -format Logic /tb/rvp/MemtoReg_1
add wave -noupdate -format Logic /tb/rvp/RegWrite_1
add wave -noupdate -format Logic /tb/rvp/Branch_1
add wave -noupdate -format Logic /tb/rvp/MemWrite_1
add wave -noupdate -format Logic /tb/rvp/MemRead_1
add wave -noupdate -format Literal /tb/rvp/ALUOp_1
add wave -noupdate -format Logic /tb/rvp/ALUSrc_1
add wave -noupdate -format Logic /tb/rvp/RegWrite_4
add wave -noupdate -format Literal -radix unsigned /tb/rvp/rd_4
add wave -noupdate -format Literal -radix unsigned /tb/rvp/WriteData
add wave -noupdate -format Literal -radix unsigned /tb/rvp/ReadData1_1
add wave -noupdate -format Literal -radix unsigned /tb/rvp/ReadData2_1
add wave -noupdate -format Literal -radix unsigned /tb/rvp/imm_data_1
add wave -noupdate -format Logic /tb/rvp/MemtoReg_2
add wave -noupdate -format Logic /tb/rvp/RegWrite_2
add wave -noupdate -format Logic /tb/rvp/Branch_2
add wave -noupdate -format Logic /tb/rvp/MemWrite_2
add wave -noupdate -format Logic /tb/rvp/MemRead_2
add wave -noupdate -format Literal -radix unsigned /tb/rvp/PC_Out_3
add wave -noupdate -format Literal -radix unsigned /tb/rvp/imm_data_2
add wave -noupdate -format Literal -radix unsigned /tb/rvp/out2_1
add wave -noupdate -format Literal -radix unsigned /tb/rvp/ReadData1_2
add wave -noupdate -format Literal -radix unsigned /tb/rvp/Mem_Addr_1
add wave -noupdate -format Literal /tb/rvp/ForwardA
add wave -noupdate -format Literal -radix unsigned /tb/rvp/TMout1
add wave -noupdate -format Literal -radix unsigned /tb/rvp/ReadData2_2
add wave -noupdate -format Literal /tb/rvp/ForwardB
add wave -noupdate -format Literal -radix unsigned /tb/rvp/TMout2
add wave -noupdate -format Logic /tb/rvp/ALUSrc_2
add wave -noupdate -format Literal -radix unsigned /tb/rvp/b
add wave -noupdate -format Literal /tb/rvp/ALUOp_2
add wave -noupdate -format Literal /tb/rvp/Funct
add wave -noupdate -format Literal /tb/rvp/Operation
add wave -noupdate -format Literal -radix unsigned /tb/rvp/rs1_2
add wave -noupdate -format Literal -radix unsigned /tb/rvp/rs2_2
add wave -noupdate -format Literal -radix unsigned /tb/rvp/rd_3
add wave -noupdate -format Logic /tb/rvp/RegWrite_3
add wave -noupdate -format Literal -radix unsigned /tb/rvp/result
add wave -noupdate -format Logic -radix unsigned /tb/rvp/carryout
add wave -noupdate -format Logic /tb/rvp/Zero_1
add wave -noupdate -format Literal -radix unsigned /tb/rvp/rd_2
add wave -noupdate -format Logic /tb/rvp/MemtoReg_3
add wave -noupdate -format Logic /tb/rvp/MemWrite_3
add wave -noupdate -format Logic /tb/rvp/MemRead_3
add wave -noupdate -format Literal -radix unsigned /tb/rvp/Write_Data
add wave -noupdate -format Literal -radix unsigned /tb/rvp/Read_Data_1
add wave -noupdate -format Logic /tb/rvp/MemtoReg_4
add wave -noupdate -format Literal -radix unsigned /tb/rvp/Read_Data_2
add wave -noupdate -format Literal -radix unsigned /tb/rvp/Mem_Addr_2
add wave -noupdate -format Literal /tb/rvp/m1/a
add wave -noupdate -format Literal /tb/rvp/m1/b
add wave -noupdate -format Logic /tb/rvp/m1/s
add wave -noupdate -format Literal /tb/rvp/m1/o
add wave -noupdate -format Logic /tb/rvp/pc/clk
add wave -noupdate -format Logic /tb/rvp/pc/reset
add wave -noupdate -format Literal /tb/rvp/pc/PC_In
add wave -noupdate -format Literal /tb/rvp/pc/PC_Out
add wave -noupdate -format Literal /tb/rvp/a1/a
add wave -noupdate -format Literal /tb/rvp/a1/b
add wave -noupdate -format Literal /tb/rvp/a1/out
add wave -noupdate -format Literal /tb/rvp/im/Inst_Address
add wave -noupdate -format Literal /tb/rvp/im/Instruction
add wave -noupdate -format Literal /tb/rvp/i/instruction
add wave -noupdate -format Literal /tb/rvp/i/opcode
add wave -noupdate -format Literal /tb/rvp/i/rd
add wave -noupdate -format Literal /tb/rvp/i/funct3
add wave -noupdate -format Literal /tb/rvp/i/rs1
add wave -noupdate -format Literal /tb/rvp/i/rs2
add wave -noupdate -format Literal /tb/rvp/i/funct7
add wave -noupdate -format Literal /tb/rvp/cu/Opcode
add wave -noupdate -format Literal /tb/rvp/cu/ALUOp
add wave -noupdate -format Logic /tb/rvp/cu/Branch
add wave -noupdate -format Logic /tb/rvp/cu/MemRead
add wave -noupdate -format Logic /tb/rvp/cu/MemtoReg
add wave -noupdate -format Logic /tb/rvp/cu/MemWrite
add wave -noupdate -format Logic /tb/rvp/cu/ALUSrc
add wave -noupdate -format Logic /tb/rvp/cu/RegWrite
add wave -noupdate -format Literal /tb/rvp/rf/WriteData
add wave -noupdate -format Literal /tb/rvp/rf/Rs1
add wave -noupdate -format Literal /tb/rvp/rf/Rs2
add wave -noupdate -format Literal /tb/rvp/rf/Rd
add wave -noupdate -format Logic /tb/rvp/rf/RegWrite
add wave -noupdate -format Logic /tb/rvp/rf/Clk
add wave -noupdate -format Logic /tb/rvp/rf/Reset
add wave -noupdate -format Literal /tb/rvp/rf/ReadData1
add wave -noupdate -format Literal /tb/rvp/rf/ReadData2
add wave -noupdate -format Literal /tb/rvp/idg/instruction
add wave -noupdate -format Literal /tb/rvp/idg/imm_data
add wave -noupdate -format Literal /tb/rvp/idg/imm_data_wire
add wave -noupdate -format Literal /tb/rvp/idg/m/a
add wave -noupdate -format Literal /tb/rvp/idg/m/b
add wave -noupdate -format Literal /tb/rvp/idg/m/c
add wave -noupdate -format Literal /tb/rvp/idg/m/s
add wave -noupdate -format Literal /tb/rvp/idg/m/o
add wave -noupdate -format Literal /tb/rvp/a2/a
add wave -noupdate -format Literal /tb/rvp/a2/b
add wave -noupdate -format Literal /tb/rvp/a2/out
add wave -noupdate -format Literal /tb/rvp/m31/a
add wave -noupdate -format Literal /tb/rvp/m31/b
add wave -noupdate -format Literal /tb/rvp/m31/c
add wave -noupdate -format Literal /tb/rvp/m31/s
add wave -noupdate -format Literal /tb/rvp/m31/o
add wave -noupdate -format Literal /tb/rvp/m32/a
add wave -noupdate -format Literal /tb/rvp/m32/b
add wave -noupdate -format Literal /tb/rvp/m32/c
add wave -noupdate -format Literal /tb/rvp/m32/s
add wave -noupdate -format Literal /tb/rvp/m32/o
add wave -noupdate -format Literal /tb/rvp/m2/a
add wave -noupdate -format Literal /tb/rvp/m2/b
add wave -noupdate -format Logic /tb/rvp/m2/s
add wave -noupdate -format Literal /tb/rvp/m2/o
add wave -noupdate -format Literal /tb/rvp/aluc/ALUOp
add wave -noupdate -format Literal /tb/rvp/aluc/Funct
add wave -noupdate -format Literal /tb/rvp/aluc/Operation
add wave -noupdate -format Literal /tb/rvp/fu/ID_EX_rs1
add wave -noupdate -format Literal /tb/rvp/fu/ID_EX_rs2
add wave -noupdate -format Literal /tb/rvp/fu/EX_MEM_rd
add wave -noupdate -format Literal /tb/rvp/fu/MEM_WB_rd
add wave -noupdate -format Logic /tb/rvp/fu/MEM_WB_RegWrite
add wave -noupdate -format Logic /tb/rvp/fu/EX_MEM_RegWrite
add wave -noupdate -format Literal /tb/rvp/fu/forwardA
add wave -noupdate -format Literal /tb/rvp/fu/forwardB
add wave -noupdate -format Literal /tb/rvp/a/a
add wave -noupdate -format Literal /tb/rvp/a/b
add wave -noupdate -format Logic /tb/rvp/a/carryin
add wave -noupdate -format Literal /tb/rvp/a/ALUop
add wave -noupdate -format Literal /tb/rvp/a/result
add wave -noupdate -format Logic /tb/rvp/a/carryout
add wave -noupdate -format Logic /tb/rvp/a/zero
add wave -noupdate -format Literal /tb/rvp/a/mux1out
add wave -noupdate -format Literal /tb/rvp/a/mux2out
add wave -noupdate -format Literal /tb/rvp/a/sum
add wave -noupdate -format Logic /tb/rvp/dm/clk
add wave -noupdate -format Logic /tb/rvp/dm/MemWrite
add wave -noupdate -format Logic /tb/rvp/dm/MemRead
add wave -noupdate -format Literal /tb/rvp/dm/Mem_Addr
add wave -noupdate -format Literal /tb/rvp/dm/Write_Data
add wave -noupdate -format Literal /tb/rvp/dm/Read_Data
add wave -noupdate -format Literal /tb/rvp/m3/a
add wave -noupdate -format Literal /tb/rvp/m3/b
add wave -noupdate -format Logic /tb/rvp/m3/s
add wave -noupdate -format Literal /tb/rvp/m3/o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {27 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {180 ns} {212 ns}
