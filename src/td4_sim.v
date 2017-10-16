module td4_sim;
  reg CLK, CLR, EN, LOAD;
  reg [3:0] Im;
  wire [3:0] Out;

  ARegister u1(CLK, CLR, EN, LOAD, Im, Out);

  always #5 CLK = ~CLK;

  initial begin
    CLK  = 0;
    CLR  = 0;
    EN   = 1;
    LOAD = 0;
    #23  CLR = 1;
    #50  Im = 4'b0001;
    #61  LOAD = 1'b1;
    #75  Im = 4'b0010;
    #100 Im = 4'b0100;
    #150 $finish;
  end

  initial begin
    $monitor("CLK=%d, CLR=%d, Out=%d", CLK, CLR, Out);
  end

endmodule
