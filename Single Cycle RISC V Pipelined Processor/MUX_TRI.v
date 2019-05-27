module MUX_TRI
(
  input [63:0]a, [63:0]b, [63:0]c, 
  input [1:0]s, 
  output reg [63:0]o
);


always @ (*)
  begin
    // ReadData
    if (s == 2'b00)
      o <= a;
    // WriteData
    else if (s == 2'b01)
      o <= b;
    // Mem_Addr
    else if (s == 2'b10)
      o <= c;
  end
  
endmodule