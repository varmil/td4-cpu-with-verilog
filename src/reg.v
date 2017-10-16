// NOTE: if Im is XXXX when LOAD is Low, Out may be XXXX

/* General-Purpose register */
module GPRegister(CLK, CLR, EN, LOAD, Im, Out);
  input CLK, CLR, EN, LOAD;
  input [3:0] Im;

  wire CLK, CLR, EN, LOAD;
  wire [3:0] Im;

  output reg [3:0] Out;

  always @ (posedge CLK or negedge CLR) begin
    if (CLR == 1'b0)
      Out <= 4'b0000;
    else
      if (LOAD == 1'b0)
        Out <= Im;
      else
        Out <= Out;
  end
endmodule




/* Program Counter */
module PC(CLK, CLR, EN, LOAD, Im, Out);
  input CLK, CLR, EN, LOAD;
  input [3:0] Im;

  wire CLK, CLR, EN, LOAD;
  wire [3:0] Im;

  output reg [3:0] Out;

  always @ (posedge CLK or negedge CLR) begin
    if (CLR == 1'b0)
      Out <= 4'b0000;
    else
      if (LOAD == 1'b0)
        Out <= Im;
      else
        // count up with posedge CLK
        Out <= Out + 4'b0001;
  end
endmodule




/* flag register */
module FlagRegister(CLK, CLR, Carry, Out);
  input CLK, CLR, Carry;

  wire CLK, CLR, Carry;

  output reg Out;

  always @ ( * ) begin
    if (CLR == 1'b0)
      Out <= 1'b0;
    else
      // Negative logic
      Out <= ~Carry;
  end
endmodule
