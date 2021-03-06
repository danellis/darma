// This file was auto-generated by build_inst_decode.py. Do not edit directly.
part of darma;

class InstructionDecoder {
  List<Function> fns;
  
  InstructionDecoder(List<Function> this.fns) {
  }

  void dispatch(instruction) {
    if ((instruction & 0xf0000000) == 0xf0000000) {
      this.fns[18](

      );
    }

    else if ((instruction & 0xf000000) == 0xf000000) {
      this.fns[17](
        /* cond */ (instruction & 0xf0000000) >> 28,
        /* swi */ (instruction & 0xffffff) >> 0
      );
    }

    else if ((instruction & 0xf000010) == 0xe000010) {
      this.fns[16](
        /* cond */ (instruction & 0xf0000000) >> 28,
        /* opcode1 */ (instruction & 0xe00000) >> 21,
        /* L */ (instruction & 0x100000) >> 20,
        /* CRn */ (instruction & 0xf0000) >> 16,
        /* Rd */ (instruction & 0xf000) >> 12,
        /* cp_num */ (instruction & 0xf00) >> 8,
        /* opcode2 */ (instruction & 0xe0) >> 5,
        /* CRm */ (instruction & 0xf) >> 0
      );
    }

    else if ((instruction & 0xf000010) == 0xe000000) {
      this.fns[15](
        /* cond */ (instruction & 0xf0000000) >> 28,
        /* opcode1 */ (instruction & 0xf00000) >> 20,
        /* CRn */ (instruction & 0xf0000) >> 16,
        /* Rd */ (instruction & 0xf000) >> 12,
        /* cp_num */ (instruction & 0xf00) >> 8,
        /* opcode2 */ (instruction & 0xe0) >> 5,
        /* CRm */ (instruction & 0xf) >> 0
      );
    }

    else if ((instruction & 0xe000000) == 0xc000000) {
      this.fns[14](
        /* cond */ (instruction & 0xf0000000) >> 28,
        /* P */ (instruction & 0x1000000) >> 24,
        /* U */ (instruction & 0x800000) >> 23,
        /* N */ (instruction & 0x400000) >> 22,
        /* W */ (instruction & 0x200000) >> 21,
        /* L */ (instruction & 0x100000) >> 20,
        /* Rn */ (instruction & 0xf0000) >> 16,
        /* CRd */ (instruction & 0xf000) >> 12,
        /* cp_num */ (instruction & 0xf00) >> 8,
        /* offset */ (instruction & 0xff) >> 0
      );
    }

    else if ((instruction & 0xe000000) == 0xa000000) {
      this.fns[13](
        /* cond */ (instruction & 0xf0000000) >> 28,
        /* L */ (instruction & 0x1000000) >> 24,
        /* offset */ (instruction & 0xffffff) >> 0
      );
    }

    else if ((instruction & 0xe000000) == 0x8000000) {
      this.fns[12](
        /* cond */ (instruction & 0xf0000000) >> 28,
        /* P */ (instruction & 0x1000000) >> 24,
        /* U */ (instruction & 0x800000) >> 23,
        /* S */ (instruction & 0x400000) >> 22,
        /* W */ (instruction & 0x200000) >> 21,
        /* L */ (instruction & 0x100000) >> 20,
        /* Rn */ (instruction & 0xf0000) >> 16,
        /* regs */ (instruction & 0xffff) >> 0
      );
    }

    else if ((instruction & 0xff000f0) == 0x7f000f0) {
      this.fns[11](
        /* cond */ (instruction & 0xf0000000) >> 28
      );
    }

    else if ((instruction & 0xe000010) == 0x6000010) {
      this.fns[10](
        /* cond */ (instruction & 0xf0000000) >> 28
      );
    }

    else if ((instruction & 0xe000010) == 0x6000000) {
      this.fns[9](
        /* cond */ (instruction & 0xf0000000) >> 28,
        /* P */ (instruction & 0x1000000) >> 24,
        /* U */ (instruction & 0x800000) >> 23,
        /* B */ (instruction & 0x400000) >> 22,
        /* W */ (instruction & 0x200000) >> 21,
        /* L */ (instruction & 0x100000) >> 20,
        /* Rn */ (instruction & 0xf0000) >> 16,
        /* Rd */ (instruction & 0xf000) >> 12,
        /* shift_amount */ (instruction & 0xf80) >> 7,
        /* shift */ (instruction & 0x60) >> 5,
        /* Rm */ (instruction & 0xf) >> 0
      );
    }

    else if ((instruction & 0xe000000) == 0x4000000) {
      this.fns[8](
        /* cond */ (instruction & 0xf0000000) >> 28,
        /* P */ (instruction & 0x1000000) >> 24,
        /* U */ (instruction & 0x800000) >> 23,
        /* B */ (instruction & 0x400000) >> 22,
        /* W */ (instruction & 0x200000) >> 21,
        /* L */ (instruction & 0x100000) >> 20,
        /* Rn */ (instruction & 0xf0000) >> 16,
        /* Rd */ (instruction & 0xf000) >> 12,
        /* immediate */ (instruction & 0xfff) >> 0
      );
    }

    else if ((instruction & 0xfb00000) == 0x3200000) {
      this.fns[7](
        /* cond */ (instruction & 0xf0000000) >> 28,
        /* R */ (instruction & 0x400000) >> 22,
        /* mask */ (instruction & 0xf0000) >> 16,
        /* sbo */ (instruction & 0xf000) >> 12,
        /* rotate */ (instruction & 0xf00) >> 8,
        /* immediate */ (instruction & 0xff) >> 0
      );
    }

    else if ((instruction & 0xfb00000) == 0x3000000) {
      this.fns[6](
        /* cond */ (instruction & 0xf0000000) >> 28
      );
    }

    else if ((instruction & 0xe000000) == 0x2000000) {
      this.fns[5](
        /* cond */ (instruction & 0xf0000000) >> 28,
        /* opcode */ (instruction & 0x1e00000) >> 21,
        /* S */ (instruction & 0x100000) >> 20,
        /* Rn */ (instruction & 0xf0000) >> 16,
        /* Rd */ (instruction & 0xf000) >> 12,
        /* rotate */ (instruction & 0xf00) >> 8,
        /* immediate */ (instruction & 0xff) >> 0
      );
    }

    else if ((instruction & 0xe000090) == 0x90) {
      this.fns[4](
        /* cond */ (instruction & 0xf0000000) >> 28
      );
    }

    else if ((instruction & 0xf900090) == 0x1000010) {
      this.fns[3](
        /* cond */ (instruction & 0xf0000000) >> 28
      );
    }

    else if ((instruction & 0xe000090) == 0x10) {
      this.fns[2](
        /* cond */ (instruction & 0xf0000000) >> 28,
        /* opcode */ (instruction & 0x1e00000) >> 21,
        /* S */ (instruction & 0x100000) >> 20,
        /* Rn */ (instruction & 0xf0000) >> 16,
        /* Rd */ (instruction & 0xf000) >> 12,
        /* Rs */ (instruction & 0xf00) >> 8,
        /* shift */ (instruction & 0x60) >> 5,
        /* Rm */ (instruction & 0xf) >> 0
      );
    }

    else if ((instruction & 0xf900010) == 0x1000000) {
      this.fns[1](
        /* cond */ (instruction & 0xf0000000) >> 28
      );
    }

    else if ((instruction & 0xe000010) == 0x0) {
      this.fns[0](
        /* cond */ (instruction & 0xf0000000) >> 28,
        /* opcode */ (instruction & 0x1e00000) >> 21,
        /* S */ (instruction & 0x100000) >> 20,
        /* Rn */ (instruction & 0xf0000) >> 16,
        /* Rd */ (instruction & 0xf000) >> 12,
        /* shift_amount */ (instruction & 0xf80) >> 7,
        /* shift */ (instruction & 0x60) >> 5,
        /* Rm */ (instruction & 0xf) >> 0
      );
    }

  }
}
