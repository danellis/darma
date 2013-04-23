library darma;

import 'dart:typeddata';
import 'dart:io';
import 'dart:async';

part '../lib/src/cpu.dart';
part '../lib/src/registers.dart';
part '../lib/src/decoder.dart';

void main() {
  var cpu = new Cpu();
  cpu.loadToRam('asm/test.bin', 0).whenComplete(() {
    dumpRegs(cpu);
    cpu.step();
    dumpRegs(cpu);
    cpu.step();
    dumpRegs(cpu);
  });
}

void dumpRam(Cpu cpu, int start, int count) {
  for (int addr = start; addr < start + (count << 2); addr += 4) {
    print("${addr.toRadixString(16)}: ${cpu.ram[addr >> 2].toRadixString(16)}");
  }
}

void dumpRegs(Cpu cpu) {
  List<String> regs = [];
  for (int r = 0; r <= 15; ++r ) {
    regs.add("R$r = ${cpu.reg[r].toRadixString(16)}");
  }
  print(regs.join(', '));
}
