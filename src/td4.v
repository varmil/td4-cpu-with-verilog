module td4(CLK, CLR, Out);
  input CLK, CLR;
  input [3:0] Out;
  wire CLK, CLR;
  wire [3:0] Out;

  ARegister areg(CLK, CLR, 1'b1, 1'b1, 4'b0000, Out);
endmodule
