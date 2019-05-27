module ALU_64_BIT
(
  input [63:0]a, 
  input [63:0]b, 
  input carryin,
  input [3:0]ALUop,
  output reg [63:0]result,  
  output reg carryout, zero
);

wire [63:0]mux1out; 
wire [63:0]mux2out;
wire [64:0]sum;

//Assigning data to wires
assign  mux1out = ALUop[3] ? ~a : a;
assign  mux2out = ALUop[2] ? ~b : b; 
assign sum = {1'b0, mux1out} + {1'b0, mux2out} + {64'h0000000000000000, carryin};
    
// 3:1 MUX output
always @ (*)
begin    
  if (ALUop[1:0] == 2'b00)
  begin
    result <= mux1out & mux2out;
    carryout <= 1'b0;
  end
  else if (ALUop[1:0] == 2'b01)
  begin
    result <= mux1out | mux2out;
    carryout <= 1'b0;
  end
  else if (ALUop[1:0] == 2'b10)
  begin
    result <= sum[63:0];
    carryout <= sum[64];
  end
  zero <= result ? 1'b0 : 1'b1;
end

endmodule

