part of armem;

class Cpu {
  const MODE_USR = 0x10;
  const MODE_FIQ = 0x11;
  const MODE_IRQ = 0x12;
  const MODE_SVC = 0x13;
  const MODE_ABT = 0x17;
  const MODE_UND = 0x1b;
  const MODE_SYS = 0x1f;

  static const VECTOR_RESET = 0x00000000;
  static const VECTOR_UNDEF = 0x00000004;
  static const VECTOR_SWI = 0x00000008;
  static const VECTOR_PABORT = 0x0000000c;
  static const VECTOR_DABORT = 0x00000010;
  static const VECTOR_IRQ = 0x00000018;
  static const VECTOR_FIQ = 0x0000001c;
  
  var reg = new RegisterFile();
  Uint32List ram = new Uint32List(32 * 1024 * 1024); // 32MiB
  InstructionDecoder decoder;
  
  Cpu() {
    this.decoder = new InstructionDecoder([
      this.exec_type_0,
      this.exec_type_1,
      this.exec_type_2,
      this.exec_type_3,
      this.exec_type_4,
      this.exec_type_5,
      this.exec_type_6,
      this.exec_type_7,
      this.exec_type_8,
      this.exec_type_9,
      this.exec_type_10,
      this.exec_type_11,
      this.exec_type_12,
      this.exec_type_13,
      this.exec_type_14,
      this.exec_type_15,
      this.exec_type_16,
      this.exec_type_17,
      this.exec_type_18
    ]);
  }
  
  void run() {
    // Exception priorities:
    // reset(); dataAbort(); fiq(); irq(); prefetchAbort();
  }
  
  void resetException() {
    reg.setMode(MODE_SVC);
    reg.updateCpsr(0x1e0, 0x1c0);
    reg[15] = VECTOR_RESET;
  }
  
  void undefinedInstructionException() {
    reg.setMode(MODE_UND);
    reg.updateCpsr(0xa0, 0x80);
    reg[15] = VECTOR_UNDEF;
  }
  
  void swiException() {
    reg.setMode(MODE_SVC);
    reg.updateCpsr(0xa0, 0x80);
    reg[15] = VECTOR_SWI;
  }
  
  void prefetchAbortException() {
    reg.setMode(MODE_ABT);
    reg.updateCpsr(0x1a0, 0x180);
    reg[15] = VECTOR_PABORT;
  }
  
  void dataAbortException() {
    reg.setMode(MODE_ABT);
    reg.updateCpsr(0x1a0, 0x180);
    reg[15] = VECTOR_DABORT;
  }
  
  void irqException() {
    reg.setMode(MODE_IRQ);
    reg.updateCpsr(0x1a0, 0x180);
    reg[15] = VECTOR_IRQ;
  }
  
  void fiqException() {
    reg.setMode(MODE_FIQ);
    reg.updateCpsr(0x1e0, 0x1c0);
    reg[15] = VECTOR_FIQ;
  }
  
  void exec_type_0() {
  }
  
  void exec_type_1() {
  }
  
  void exec_type_2() {
  }
  
  void exec_type_3() {
  }
  
  void exec_type_4() {
  }
  
  void exec_type_5() {
  }
  
  void exec_type_6() {
  }
  
  void exec_type_7() {
  }
  
  void exec_type_8() {
  }
  
  void exec_type_9() {
  }
  
  void exec_type_10() {
  }
  
  void exec_type_11() {
  }
  
  void exec_type_12() {
  }
  
  void exec_type_13() {
  }
  
  void exec_type_14() {
  }
  
  void exec_type_15() {
  }
  
  void exec_type_16() {
  }
  
  void exec_type_17() {
  }
  
  void exec_type_18() {
  }
}
