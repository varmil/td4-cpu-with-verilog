module td4_sim;
  reg CLK, CLR, EN;

  td4 u1(CLK, CLR);

  always #5 CLK = ~CLK;

  initial begin
    CLK  = 0;
    CLR  = 0;
    #23  CLR = 1;
    #200 $finish;
  end

  initial begin
    $monitor("CLK=%d, CLR=%d, NA=%d", CLK, CLR, 0);
  end
endmodule
