module MUX_TRI_12
(
  input [11:0]a, [11:0]b, [11:0]c, 
  input [1:0]s, 
  output reg [11:0]o
);


always @ (*)
  begin
    // load instruction
    if (s == 2'b00)
      o <= a;
    // store instruction
    else if (s == 2'b01)
      o <= b;
    // conditional branch
    else if (s == 2'b10)
      o <= c;
  end
  
endmodule