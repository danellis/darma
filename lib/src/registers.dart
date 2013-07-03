part of darma;

class RegisterFile {
  static const R0 = 0;
  static const R1 = 1;
  static const R2 = 2;
  static const R3 = 3;
  static const R4 = 4;
  static const R5 = 5;
  static const R6 = 6;
  static const R7 = 7;
  static const R8 = 8;
  static const R9 = 9;
  static const R10 = 10;
  static const R11 = 11;
  static const R12 = 12;
  static const R13 = 13;
  static const R14 = 14;
  static const PC = 15;
  static const R13_SVC = 16;
  static const R14_SVC = 17;
  static const R13_ABT = 18;
  static const R14_ABT = 19;
  static const R13_UND = 20;
  static const R14_UND = 21;
  static const R13_IRQ = 22;
  static const R14_IRQ = 23;
  static const R8_FIQ = 24;
  static const R9_FIQ = 25;
  static const R10_FIQ = 26;
  static const R11_FIQ = 27;
  static const R12_FIQ = 28;
  static const R13_FIQ = 29;
  static const R14_FIQ = 30;
  static const CPSR = 31;
  static const SPSR_SVC = 32;
  static const SPSR_ABT = 33;
  static const SPSR_UND = 34;
  static const SPSR_IRQ = 35;
  static const SPSR_FIQ = 36;

  static final registerMap = [
    [R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, PC],
    [R0, R1, R2, R3, R4, R5, R6, R7, R8_FIQ, R9_FIQ, R10_FIQ, R11_FIQ, R12_FIQ, R13_FIQ, R14_FIQ, PC],
    [R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13_IRQ, R14_IRQ, PC],
    [R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13_SVC, R14_SVC, PC],
    [],
    [],
    [],
    [R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13_ABT, R14_ABT, PC],
    [],
    [],
    [],
    [R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13_UND, R14_UND, PC],
    [],
    [],
    [],
    [R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, PC]
  ];
  
  static final spsrMap = [
    null, SPSR_FIQ, SPSR_IRQ, SPSR_SVC, null, null, null, SPSR_ABT, null, null, null, SPSR_UND
  ];
  
  Uint32List registers = new Uint32List(37);
  
  RegisterFile() {
  }
  
  int operator [](int register) {
    int mode = registers[CPSR] & 0xf; // Ignoring bit 4
    int value = registers[registerMap[mode][register]];
    return register == 15 ? value + 8 : value;
  }
  
  void operator []=(int register, int value) {
    int mode = registers[CPSR] & 0xf; // Ignoring bit 4
    registers[registerMap[mode][register]] = value;
  }

  void setMode(int mode) {
    registers[registerMap[mode & 0xf][14]] = this(14);
    registers[spsrMap[mode & 0xf]] = registers[CPSR];
    updateCpsr(0x1f, mode);
  }
  
  void updateCpsr(int mask, int value) {
    registers[CPSR] = (registers[CPSR] & ~mask) | value;
  }
  
  int get nFlag => (registers[CPSR] & (1 << 31)) >> 31;
  int get zFlag => (registers[CPSR] & (1 << 30)) >> 30;
  int get cFlag => (registers[CPSR] & (1 << 29)) >> 29;
  int get vFlag => (registers[CPSR] & (1 << 28)) >> 28;
  int get iFlag => (registers[CPSR] & (1 << 7)) >> 7;
  int get fFlag => (registers[CPSR] & (1 << 6)) >> 6;
  int get mode => registers[CPSR] & 0x1f;
  int get spsr => registers[spsrMap[mode & 0xf]];

  set nFlag(int value) => registers[CPSR] = (registers[CPSR] & ~(1 << 31)) | (value << 31);
  set zFlag(int value) => registers[CPSR] = (registers[CPSR] & ~(1 << 30)) | (value << 30);
  set cFlag(int value) => registers[CPSR] = (registers[CPSR] & ~(1 << 29)) | (value << 29);
  set vFlag(int value) => registers[CPSR] = (registers[CPSR] & ~(1 << 28)) | (value << 28);
  set iFlag(int value) => registers[CPSR] = (registers[CPSR] & ~(1 << 7)) | (value << 7);
  set fFlag(int value) => registers[CPSR] = (registers[CPSR] & ~(1 << 6)) | (value << 6);
  set cpsr(int status) => registers[CPSR] = status;
}
