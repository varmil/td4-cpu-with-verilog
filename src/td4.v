module td4(CLK, CLR);
  input CLK, CLR;
  // input [3:0] Out;

  // Register
  wire CLK, CLR, EN;
  wire [3:0] LOAD;
  wire [3:0] Im;
  wire [3:0] OutA, OutB, OutLED;

  // Rom
  wire [3:0] Address;
  wire [7:0] Order;

  // Decoder
  wire SELECTA, SELECTB;

  // Carry
  wire Carry, CarryOut;

  // ROM
  ROM ROM(Address, Order);

  // Decoder
  Decoder Decoder(Order[7:4], CarryOut, LOAD, SELECTA, SELECTB);

  // register
  GPRegister ARegister(CLK, CLR, EN, LOAD[0], Im, OutA);
  GPRegister BRegister(CLK, CLR, EN, LOAD[1], Im, OutB);
  GPRegister OutPortRegister(CLK, CLR, EN, LOAD[2], Im, OutLED);
  PC PC(CLK, CLR, EN, LOAD[3], Im, Address);
  FlagRegister FlagRegister(CLK, CLR, Carry, CarryOut);
endmodule
