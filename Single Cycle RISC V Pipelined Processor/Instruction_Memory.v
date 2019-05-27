module Instruction_Memory
(
input [63:0]Inst_Address,
output reg [31:0]Instruction
);

reg [7:0] byte_array [15:0];

initial
begin
  byte_array[0] <= 8'b10000011;
  byte_array[1] <= 8'b00110100;
  byte_array[2] <= 8'b10000101;
  byte_array[3] <= 8'b00000010;

  byte_array[4] <= 8'b00110011;
  byte_array[5] <= 8'b10000100;
  byte_array[6] <= 8'b10001010;
  byte_array[7] <= 8'b00000000;

  // byte_array[4] <= 8'b10110011;
  // byte_array[5] <= 8'b10000100;
  // byte_array[6] <= 8'b10011010;
  // byte_array[7] <= 8'b00000000;
  
  byte_array[8] <= 8'b10010011;
  byte_array[9] <= 8'b10000100;
  byte_array[10] <= 8'b00010100;
  byte_array[11] <= 8'b00000000;
  
  byte_array[12] <= 8'b00100011;
  byte_array[13] <= 8'b00110100;
  byte_array[14] <= 8'b10010101;
  byte_array[15] <= 8'b00000010;
end

always @ (*)
Instruction <= {byte_array[Inst_Address + 64'd3], byte_array[Inst_Address + 64'd2], byte_array[Inst_Address + 64'd1], byte_array[Inst_Address]};

endmodule