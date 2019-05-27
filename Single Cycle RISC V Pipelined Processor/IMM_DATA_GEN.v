module IMM_DATA_GEN
(
  input [31:0]instruction,  
  output reg [63:0]imm_data
);

wire [11:0]imm_data_wire;

MUX_TRI_12 m
(
  .s(instruction[6:5]),
  .a(instruction[31:20]),
  .b({instruction[31:25], instruction[11:7]}),
  .c({instruction[31], instruction[7], instruction[30:25], instruction[11:8]}),
  .o(imm_data_wire)
);

always @ (*)
  imm_data <= {{52{imm_data_wire[11]}}, imm_data_wire};


endmodule