module td4(CLK, CLR);
  input CLK, CLR;
  wire CLK, CLR;

  ARegister areg(CLK, CLR, 1'b1, 1'b1, 4'b0000, 4'b0000);
endmodule
