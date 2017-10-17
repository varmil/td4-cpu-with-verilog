module ALU(InA, InB, Out, Carry);
  input [3:0] InA, InB;
  output [3:0] Out;
  output Carry;

  wire [3:0] InA, InB, Out;
  wire Carry;

  assign { Carry, Out } = InA + InB;
endmodule
