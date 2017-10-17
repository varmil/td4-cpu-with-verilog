module td4(CLK, CLR, IN, OUT);
  input CLK, CLR;
  input [3:0] IN, OUT;

  // Register
  wire CLK, CLR, EN;
  wire [3:0] LOAD;
  wire [3:0] OutA, OutB;

  // Rom
  wire [3:0] Address;
  wire [7:0] Order;

  // Decoder
  wire [1:0] SELECT;

  // Data Selector
  wire [3:0] OutDataSelector;

  // ALU
  wire [3:0] ALUResult;

  // Carry
  wire Carry, CarryOut;

  // ROM
  ROM ROM(Address, Order);

  // Decoder
  Decoder Decoder(Order[7:4], CarryOut, LOAD, SELECT);

  // Data Selector
  DataSelector DataSelector(OutA, OutB, IN, SELECT, OutDataSelector);

  // ALU
  ALU ALU(OutDataSelector, Order[3:0], ALUResult, Carry);

  // register
  GPRegister ARegister(CLK, CLR, EN, LOAD[0], ALUResult, OutA);
  GPRegister BRegister(CLK, CLR, EN, LOAD[1], ALUResult, OutB);
  GPRegister OutPortRegister(CLK, CLR, EN, LOAD[2], ALUResult, OUT);
  PC PC(CLK, CLR, EN, LOAD[3], ALUResult, Address);
  FlagRegister FlagRegister(CLK, CLR, Carry, CarryOut);
endmodule
