/* A register */
module ARegister(CLK, CLR, EN, LOAD, Im, Out);
  input CLK, CLR, EN, LOAD;
  input [3:0] Im;

  wire CLK, CLR, EN, LOAD;
  wire [3:0] Im;

  output reg [3:0] Out;

  always @ (posedge CLK, negedge CLR, LOAD, Im) begin
    if (CLR == 1'b0)
      Out <= 4'b0000;
    else begin
      if (LOAD == 1'b0)
        Out <= Im;
      else
        Out <= Out;
    end
  end
endmodule


/* B register */
module BRegister();

endmodule


/* PC register */
module PC();

endmodule


/* flag register */
module FlagRegister();

endmodule
