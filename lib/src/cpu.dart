part of darma;

int rol(int n, int r) {
  return (n << r) | (n >> (32 - r));
}

int ror(int n, int r) {
  return (n >> r) | (n << (32 - r));
}

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
  
  Future loadToRam(String filename, int address) {
    File file = new File(filename);

    return file.readAsBytes().then((List<int> contents) {
      new Uint8List.view(this.ram.buffer).setAll(address, contents);
    });
  }
  
  void run() {
    // Exception priorities:
    // reset(); dataAbort(); fiq(); irq(); prefetchAbort();
  }
  
  void step() {
    int pc = reg[15] - 8;
    int instruction = this.ram[pc >> 2];
    decoder.dispatch(instruction);
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
  
  void exec_type_0(int cond, int opcode, int s, int rn, int rd, int shift, int shiftType, int rm) {
    print("exec_type_0: opcode=$opcode, Rn=$rn, Rd=$rd, shift=$shift, Rm=$rm");
  }
  
  void exec_type_1() {
    print("exec_type_1");
  }
  
  void exec_type_2() {
    print("exec_type_2");
  }
  
  void exec_type_3() {
    print("exec_type_3");
  }
  
  void exec_type_4() {
    print("exec_type_4");
  }
  
  /* Data processing immediate */
  void exec_type_5(int cond, int opcode, int s, int rn, int rd, int rotate, int imm) {
    print("exec_type_5: opcode=$opcode, s=$s, Rn=$rn, Rd=$rd, rotate=$rotate, imm=$imm");
    int operand = ror(imm, rotate << 1);
    int carry = rotate == 0 ? reg.cFlag : (operand & 1 << 31) >> 31;
    dataProc(opcode, s, rd, rn, operand, carry);
    reg[15] += 4;
  }
  
  void exec_type_6() {
    print("exec_type_6");
  }
  
  void exec_type_7() {
    print("exec_type_7");
  }
  
  void exec_type_8(int cond, int p, int u, int b, int w, int l, int rn, int rd, int imm) {
    print("exec_type_8: Rn=$rn, Rd=$rd, imm=$imm");
  }
  
  void exec_type_9() {
    print("exec_type_9");
  }
  
  void exec_type_10() {
    print("exec_type_10");
  }
  
  void exec_type_11() {
    print("exec_type_11");
  }
  
  void exec_type_12() {
    print("exec_type_12");
  }
  
  void exec_type_13(int cond, int l, int offset) {
    print("exec_type_13: l=$l, offset=$offset");
    reg[15] += offset << 2;
  }
  
  void exec_type_14() {
    print("exec_type_14");
  }
  
  void exec_type_15() {
    print("exec_type_15");
  }
  
  void exec_type_16() {
    print("exec_type_16");
  }
  
  void exec_type_17() {
    print("exec_type_17");
  }
  
  void exec_type_18() {
    print("exec_type_18");
  }
  
  void dataProc(int opcode, int s, int rd, int rn, int operand, int carry) {
    print("dataProc: opcode=$opcode, s=$s, Rd=$rd, Rn=$rn, operand=$operand");
    int result;
    
    switch (opcode) {
      case 0: // AND
        int result = reg[rn] & operand;
        reg[rd] = result;
        if (s == 1) {
          if (rd == 15) {
            reg.cpsr = reg.spsr;
          } else {
            reg.nFlag = (result & (1 << 31)) >> 31;
            reg.zFlag = result == 0 ? 1 : 0;
            reg.cFlag = carry;
          }
        }
      
      case 1: // EOR
        int result = reg[rn] ^ operand;
        reg[rd] = result;
        if (s == 1) {
          if (rd == 15) {
            reg.cpsr = reg.spsr;
          } else {
            reg.nFlag = (result & (1 << 31)) >> 31;
            reg.zFlag = result == 0 ? 1 : 0;
            reg.cFlag = result < 0 ? 1 : 0;
            reg.vFlag = 
          }
        }
      
      case 2: // SUB
        result = reg[rn] - operand;
        continue store;
        
      case 3: // RSB
        result = operand - reg[rn];
        continue store;
        
      case 4: // ADD
        result = reg[rn] + operand;
        continue store;
        
      case 5: // ADC
        result = reg[rn] + operand /* FIXME: + carry flag */;
        continue store;
        
      case 6: // SBC
        result = reg[rn] - operand /* FIXME: - (1 - carry flag) */;
        continue store;
        
      case 7: // RSC
        result = operand - reg[rn] /* FIXME: - (1 - carry flag) */;
        continue store;
        
      case 8: // TST
        updateFlags(rn & operand);
        break;
        
      case 9: // TEQ
        updateFlags(rn ^ operand);
        break;
        
      case 10: // CMP
        updateFlags(rn - operand);
        break;
        
      case 11: // CMN
        updateFlags(rn + operand);
        break;
        
      case 12: // ORR
        result = reg[rn] | operand;
        continue store;
        
      case 13: // MOV
        result = operand;
        continue store;
        
      case 14: // BIC
        result = reg[rn] & ~operand;
        continue store;
        
      case 15: // MVN
        result = ~operand;
        continue store;
      
    store:
      default:
        reg[rd] = result;
        if (s == 1) updateFlags(result);
    }
  }
  
  void updateFlags(int result) {
    reg.nFlag = (result & (1 << 31)) >> 31;
    reg.zFlag = result == 0 ? 1 : 0;
    
  }
}
