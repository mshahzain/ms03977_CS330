module MUX
(
  input [63:0]a, [63:0]b, 
  input s, 
  output reg [63:0]o
);


always @ (s or a or b)
  begin
    if (s)
      o <= b;
    else
      o <= a;
  end
  
endmodule

  