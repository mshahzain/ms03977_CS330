module RISC_V_Processor
(
input Clk, Reset 
);

//BUFFERS
reg [95:0]IF_ID;
reg [282:0]ID_EX;
reg [202:0]EX_MEM;
reg [134:0]MEM_WB;

//MUX 1
/////////////////////
wire [63:0]out1;  

wire [63:0]out2_2;  
assign out2_2 = EX_MEM[68:5];

wire Branch_3;  
assign Branch_3 = EX_MEM[2];

wire Zero_2;  
assign Zero_2 = EX_MEM[69];

wire [63:0]PC_In;

MUX m1
(
.a(out1),
.b(out2_2),
//and gate
.s(Branch_3 && Zero_2),

.o(PC_In)
); 

//PROGRAM COUNTER
wire [63:0]PC_Out_1;

Program_Counter pc
(
.clk(Clk), 
.reset(Reset),
.PC_In(PC_In),

.PC_Out(PC_Out_1)
); 

//ADDER 1
Adder a1
(
.a(PC_Out_1), 
.b(64'd4),

.out(out1)
);

//INSTRUCTION MEMORY
wire [31:0]Instruction_1;

Instruction_Memory im
(
.Inst_Address(PC_Out_1),

.Instruction(Instruction_1)
);
  
//IF/ID BUFFER
///////////////////// 

wire [63:0]PC_Out_2;
assign PC_Out_2 = IF_ID[63:0];
  
//INSTRUCTION PARSER
wire [31:0]Instruction_2;
assign Instruction_2 = IF_ID[95:64];
  
wire [6:0]opcode;
wire [4:0]rd_1;
wire [2:0]funct3;  //redundant
wire [4:0]rs1_1;
wire [4:0]rs2_1;
wire [6:0]funct7;  //redundant

instruction i
(
.instruction(Instruction_2),

.opcode(opcode),
.rd(rd_1),
.funct3(funct3),
.rs1(rs1_1),
.rs2(rs2_1),
.funct7(funct7)
);

//CONTROL UNIT
//WB
wire MemtoReg_1;
wire RegWrite_1;
//M
wire Branch_1;
wire MemWrite_1;
wire MemRead_1;
//EX
wire [1:0]ALUOp_1;
wire ALUSrc_1;

Control_Unit cu
(
.Opcode(opcode),

.ALUOp(ALUOp_1),
.Branch(Branch_1), 
.MemRead(MemRead_1), 
.MemtoReg(MemtoReg_1), 
.MemWrite(MemWrite_1), 
.ALUSrc(ALUSrc_1), 
.RegWrite(RegWrite_1)
);

//REGISTER FILE
wire RegWrite_4;
assign RegWrite_4 = MEM_WB[1];

wire [4:0]rd_4;
assign rd_4 = MEM_WB[134:130];

wire [63:0]WriteData;

wire [63:0]ReadData1_1;
wire [63:0]ReadData2_1;

registerFile rf
(
.WriteData(WriteData),
.Rs1(rs1_1),
.Rs2(rs2_1),
.Rd(rd_4),
.RegWrite(RegWrite_4),
.Clk(Clk),
.Reset(Reset),

.ReadData1(ReadData1_1),
.ReadData2(ReadData2_1)
);

//IMMEDIATE DATA GENERATOR
wire [63:0]imm_data_1;

IMM_DATA_GEN idg
(
.instruction(Instruction_2),  

.imm_data(imm_data_1)
);

//ID/EX BUFFER
/////////////////////

//WB
wire MemtoReg_2;
wire RegWrite_2;
//M
wire Branch_2;
wire MemWrite_2;
wire MemRead_2;

assign MemtoReg_2 = ID_EX[0];
assign RegWrite_2 = ID_EX[1];
assign Branch_2 = ID_EX[2];
assign MemWrite_2 = ID_EX[3];
assign MemRead_2 = ID_EX[4];

//ADDER 2
wire [63:0]PC_Out_3;
assign PC_Out_3 = ID_EX[71:8];

wire [63:0]imm_data_2;
assign imm_data_2 = ID_EX[263:200];  

wire [63:0]out2_1;

Adder a2
(
.a(PC_Out_3),
//shift left
.b({imm_data_2[62:0], 1'b0}), 

.out(out2_1)
);

//TRI_MUX 1
wire [63:0]ReadData1_2;
assign ReadData1_2 = ID_EX[135:72];

wire [63:0]Mem_Addr_1;
assign Mem_Addr_1 = EX_MEM[133:70];

wire [1:0]ForwardA;

wire [63:0]TMout1;

MUX_TRI m31
(
  .s(ForwardA),
  .a(ReadData1_2),
  .b(WriteData),
  .c(Mem_Addr_1),
  .o(TMout1)
); 

//TRI_MUX 2
wire [63:0]ReadData2_2;
assign ReadData2_2 = ID_EX[199:136];

wire [1:0]ForwardB;

wire [63:0]TMout2;

MUX_TRI m32
(
  .s(ForwardB),
  .a(ReadData2_2),
  .b(WriteData),
  .c(Mem_Addr_1),
  .o(TMout2)
); 

//MUX 2
wire ALUSrc_2;
assign ALUSrc_2 = ID_EX[7];

wire [63:0]b;

MUX m2
(
.a(TMout2),
.b(imm_data_2),
.s(ALUSrc_2),

.o(b)
);

//ALU CONTROL
wire [1:0]ALUOp_2;
assign ALUOp_2 = ID_EX[6:5];

wire [3:0]Funct;
assign Funct = ID_EX[282:279];

wire [3:0]Operation;

ALU_Control aluc
(
.ALUOp(ALUOp_2),
.Funct(Funct),

.Operation(Operation)
);

//FORWARDING UNIT
wire [4:0]rs1_2;
assign rs1_2 = ID_EX[268:264];

wire [4:0]rs2_2;
assign rs2_2 = ID_EX[273:269];

wire [4:0]rd_3;
assign rd_3 = EX_MEM[202:198];

wire RegWrite_3;
assign RegWrite_3 = EX_MEM[1];

forwarding_unit fu
(
.ID_EX_rs1(rs1_2),
.ID_EX_rs2(rs2_2),
.EX_MEM_rd(rd_3),
.MEM_WB_rd(rd_4),
.MEM_WB_RegWrite(RegWrite_4),
.EX_MEM_RegWrite(RegWrite_3),

.forwardA(ForwardA),
.forwardB(ForwardB)
);

//ALU
wire [63:0]result;
wire carryout;
wire Zero_1;

ALU_64_BIT a
(
.a(TMout1), 
.b(b), 
.carryin(Operation[2]),
.ALUop(Operation),

.result(result),  
.carryout(carryout),
.zero(Zero_1)
);

wire [4:0]rd_2;
assign rd_2 = ID_EX[278:274];  

//EX/MEM BUFFER
///////////////////// 

//WB
wire MemtoReg_3;

assign MemtoReg_3 = EX_MEM[0];

//DATA MEMORY
wire MemWrite_3;
assign MemWrite_3 = EX_MEM[3];

wire MemRead_3;
assign MemRead_3 = EX_MEM[4];

wire [63:0]Write_Data;
assign Write_Data = EX_MEM[197:134];

wire [63:0]Read_Data_1;

Data_Memory dm
(
.clk(Clk), 
.MemWrite(MemWrite_3), 
.MemRead(MemRead_3),
.Mem_Addr(Mem_Addr_1),
.Write_Data(Write_Data),

.Read_Data(Read_Data_1)
);

//MEM/WB BUFFER
///////////////////// 

//MUX3
wire MemtoReg_4;
assign MemtoReg_4 = MEM_WB[0];

wire [63:0]Read_Data_2;
assign Read_Data_2 = MEM_WB[65:2];

wire [63:0]Mem_Addr_2;
assign Mem_Addr_2 = MEM_WB[129:66];

MUX_I m3
(
.a(Read_Data_2),
.b(Mem_Addr_2),
.s(MemtoReg_4),

.o(WriteData)
);

always @ (posedge Clk or Reset)
begin
	if(Reset)
	begin
		IF_ID <= 96'b0;
		ID_EX <= 283'b0;
		EX_MEM <= 203'b0;
		MEM_WB <= 135'b0;
	end
	else
	begin
		//IF_ID
		IF_ID[63:0] <= PC_Out_1;
		IF_ID[95:64] <= Instruction_1;
		//ID_EX
		ID_EX[0] <= MemtoReg_1;
		ID_EX[1] <= RegWrite_1;
		ID_EX[2] <= Branch_1;
		ID_EX[3] <= MemWrite_1;
		ID_EX[4] <= MemRead_1;
		ID_EX[6:5] <= ALUOp_1;
		ID_EX[7] <= ALUSrc_1;
		ID_EX[71:8] <= PC_Out_2; 
		ID_EX[135:72] <= ReadData1_1;
		ID_EX[199:136] <= ReadData2_1;
		ID_EX[263:200] <= imm_data_1;
		ID_EX[268:264] <= rs1_1;   
		ID_EX[273:269] <= rs2_1;  
		ID_EX[278:274] <= rd_1;
		ID_EX[282:279] <= {Instruction_2[30], Instruction_2[14:12]};
		//EX_MEM
		EX_MEM[0] <= MemtoReg_2;
		EX_MEM[1] <= RegWrite_2;
		EX_MEM[2] <= Branch_2;
		EX_MEM[3] <= MemWrite_2;
		EX_MEM[4] <= MemRead_2;
		EX_MEM[68:5] <= out2_1;
		EX_MEM[69] <= Zero_1;
		EX_MEM[133:70] <= result; 
		EX_MEM[197:134] <= TMout2;
		EX_MEM[202:198] <= rd_2;
		//MEM_WB
		MEM_WB[0] <= MemtoReg_3;
		MEM_WB[1] <= RegWrite_3;
		MEM_WB[65:2] <= Read_Data_1;
		MEM_WB[129:66] <= Mem_Addr_1;  
		MEM_WB[134:130] <= rd_3; 
	end
end

endmodule








