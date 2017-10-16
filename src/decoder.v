// NOTE: (MSB) Operation[3] ..... Operation[0] (LSB)
// NOTE: SELECT[0] == SELECTA, SELECT[1] == SELECTB

module Decoder(Operation, Carry, LOAD, SELECT);
  input [3:0] Operation;
  input Carry;
  output [3:0] LOAD;
  output [1:0] SELECT;

  wire [3:0] Operation;
  wire Carry;
  wire [3:0] LOAD;
  wire [1:0] SELECT;

  assign LOAD[0] = (Operation[2] | Operation[3]);
  assign LOAD[1] = (~Operation[2] | Operation[3]);
  assign LOAD[2] = ~(~Operation[2] & Operation[3]);
  assign LOAD[3] = (~Operation[2] | ~Operation[3] | (Operation[0] & Carry));

  assign SELECT[0] = (Operation[0] | Operation[3]);
  assign SELECT[1] = (Operation[1]);
endmodule
