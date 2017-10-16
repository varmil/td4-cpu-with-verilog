// NOTE: (MSB) Operation[3] ..... Operation[0] (LSB)

module Decoder(Operation, Carry, LOAD, SELECTA, SELECTB);
  input [3:0] Operation;
  input Carry;
  output [3:0] LOAD;
  output SELECTA;
  output SELECTB;

  wire [3:0] Operation;
  wire Carry;
  wire [3:0] LOAD;
  wire SELECTA, SELECTB;

  assign LOAD[0] = (Operation[2] | Operation[3]);
  assign LOAD[1] = (~Operation[2] | Operation[3]);
  assign LOAD[2] = ~(~Operation[2] & Operation[3]);
  assign LOAD[3] = (~Operation[2] | ~Operation[3] | (Operation[0] & Carry));

  assign SELECTA = (Operation[0] | Operation[3]);
  assign SELECTB = (Operation[1]);
endmodule
