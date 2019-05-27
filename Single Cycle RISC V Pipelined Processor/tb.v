module tb
(
);

reg Clk;
reg Reset;

RISC_V_Processor rvp
(
.Clk(Clk),
.Reset(Reset)
);

initial
begin
Reset = 1;
Clk = 0;
#10 Reset = ~Reset;
end

always
#2 Clk = ~Clk;

endmodule