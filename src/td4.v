module td4(CLK, CLR);
  input CLK, CLR;
  // input [3:0] Out;

  // Register
  wire CLK, CLR, EN, LOAD0, LOAD1, LOAD2, LOAD3;
  wire [3:0] Im;
  wire [3:0] OutA, OutB, OutLED;

  // Rom
  wire [3:0] Address;
  wire [7:0] Order;

  // Carry
  wire Carry, CarryOut;

  // ROM
  ROM ROM(Address, Order);

  // register
  GPRegister ARegister(CLK, CLR, EN, LOAD0, Im, OutA);
  GPRegister BRegister(CLK, CLR, EN, LOAD1, Im, OutB);
  GPRegister OutPortRegister(CLK, CLR, EN, LOAD2, Im, OutLED);
  PC PC(CLK, CLR, EN, LOAD3, Im, Address);
  FlagRegister FlagRegister(CLK, CLR, Carry, CarryOut);
endmodule
