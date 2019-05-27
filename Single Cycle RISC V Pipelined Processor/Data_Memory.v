module Data_Memory
(
input clk, MemWrite, MemRead,
input [63:0]Mem_Addr,
input [63:0]Write_Data,

output reg [63:0]Read_Data
);

reg [7:0] byte_array [63:0];

initial
begin
  byte_array[0] <= 8'd33;
  byte_array[1] <= 8'd60;
  byte_array[2] <= 8'd13;
  byte_array[3] <= 8'd62;
  byte_array[4] <= 8'd46;
  byte_array[5] <= 8'd23;
  byte_array[6] <= 8'd87;
  byte_array[7] <= 8'd12;
  byte_array[8] <= 8'd93;
  byte_array[9] <= 8'd78;
  byte_array[10] <= 8'd36;
  byte_array[11] <= 8'd41;
  byte_array[12] <= 8'd68;
  byte_array[13] <= 8'd18;
  byte_array[14] <= 8'd53;
  byte_array[15] <= 8'd57;
  byte_array[16] <= 8'd94;
  byte_array[17] <= 8'd36;
  byte_array[18] <= 8'd2;
  byte_array[19] <= 8'd96;
  byte_array[20] <= 8'd92;
  byte_array[21] <= 8'd52;
  byte_array[22] <= 8'd44;
  byte_array[23] <= 8'd87;
  byte_array[24] <= 8'd20;
  byte_array[25] <= 8'd79;
  byte_array[26] <= 8'd1;
  byte_array[27] <= 8'd81;
  byte_array[28] <= 8'd48;
  byte_array[29] <= 8'd32;
  byte_array[30] <= 8'd15;
  byte_array[31] <= 8'd30;
  byte_array[32] <= 8'd58;
  byte_array[33] <= 8'd57;
  byte_array[34] <= 8'd65;
  byte_array[35] <= 8'd53;
  byte_array[36] <= 8'd9;
  byte_array[37] <= 8'd97;
  byte_array[38] <= 8'd63;
  byte_array[39] <= 8'd41;
  byte_array[40] <= 8'd75;
  byte_array[41] <= 8'd33;
  byte_array[42] <= 8'd87;
  byte_array[43] <= 8'd81;
  byte_array[44] <= 8'd60;
  byte_array[45] <= 8'd14;
  byte_array[46] <= 8'd23;
  byte_array[47] <= 8'd19;
  byte_array[48] <= 8'd42;
  byte_array[49] <= 8'd11;
  byte_array[50] <= 8'd1;
  byte_array[51] <= 8'd60;
  byte_array[52] <= 8'd2;
  byte_array[53] <= 8'd33;
  byte_array[54] <= 8'd71;
  byte_array[55] <= 8'd16;
  byte_array[56] <= 8'd24;
  byte_array[57] <= 8'd21;
  byte_array[58] <= 8'd38;
  byte_array[59] <= 8'd84;
  byte_array[60] <= 8'd32;
  byte_array[61] <= 8'd98;
  byte_array[62] <= 8'd89;
  byte_array[63] <= 8'd18;
end

//writing
always @ (posedge clk)
begin
  if(MemWrite)
  begin
    byte_array[Mem_Addr] <= Write_Data[7:0];
    byte_array[Mem_Addr + 64'd1] <= Write_Data[15:8];
    byte_array[Mem_Addr + 64'd2] <= Write_Data[23:16];
    byte_array[Mem_Addr + 64'd3] <= Write_Data[31:24];
    byte_array[Mem_Addr + 64'd4] <= Write_Data[39:32];
    byte_array[Mem_Addr + 64'd5] <= Write_Data[47:40];
    byte_array[Mem_Addr + 64'd6] <= Write_Data[55:48];
    byte_array[Mem_Addr + 64'd7] <= Write_Data[63:56];
  end
end

//reading
always @ (*)
begin
  if(MemRead)
    Read_Data <= {byte_array[Mem_Addr + 64'd7], byte_array[Mem_Addr + 64'd6], byte_array[Mem_Addr + 64'd5], byte_array[Mem_Addr + 64'd4], byte_array[Mem_Addr + 64'd3], byte_array[Mem_Addr + 64'd2], byte_array[Mem_Addr + 64'd1], byte_array[Mem_Addr]};
end

endmodule