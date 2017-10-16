module ROM(In, Out);
  input [3:0] In;
  output [7:0] Out;

  wire [3:0] In;
  wire [7:0] Out;

  function [7:0] SelectOrder;
    input [3:0] Address;

    // Ramen Timer
    case (Address)
      4'b0000: SelectOrder = 8'b1011_0111; // out 0111
      4'b0001: SelectOrder = 8'b0000_0001; // add a,0001
      4'b0010: SelectOrder = 8'b1110_0001; // jnc 0001
      4'b0011: SelectOrder = 8'b0000_0001; // add a,0001
      4'b0100: SelectOrder = 8'b1110_0011; // jnc 0011
      4'b0101: SelectOrder = 8'b1011_0110; // out 0110
      4'b0110: SelectOrder = 8'b0000_0001; // add a,0001
      4'b0111: SelectOrder = 8'b1110_0110; // jnc 0110
      4'b1000: SelectOrder = 8'b0000_0001; // add a,0001
      4'b1001: SelectOrder = 8'b1110_1000; // jnc 1000
      4'b1010: SelectOrder = 8'b1011_0000; // out 0000
      4'b1011: SelectOrder = 8'b1011_0100; // out 0100
      4'b1100: SelectOrder = 8'b0000_0001; // add 0001
      4'b1101: SelectOrder = 8'b1110_1010; // jnc 1010
      4'b1110: SelectOrder = 8'b1011_1000; // out 0000
      4'b1111: SelectOrder = 8'b1111_1111; // jmp 1111      
      default: SelectOrder = 8'b0000_0000;
    endcase
  endfunction

  assign Out = SelectOrder(In);
endmodule
