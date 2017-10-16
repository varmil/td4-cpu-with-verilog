// NOTE: SELECT[0] == SELECTA, SELECT[1] == SELECTB

module DataSelector(InA, InB, InPort, SELECT, Out);
  // (D-register)
  parameter IM = 4'b0000;

  input [3:0] InA, InB, InPort;
  input [1:0] SELECT;
  output [3:0] Out;

  wire [3:0] InA, InB, InPort, Out;
  wire [1:0] SELECT;

  function [3:0] Select;
    input [1:0] SELECT;
    case (SELECT)
      2'b00: Select = InA;
      2'b01: Select = InB;
      2'b10: Select = InPort;
      2'b11: Select = IM;
    endcase
  endfunction

  assign Out = Select(SELECT);
endmodule
