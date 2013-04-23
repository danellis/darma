part of armem;

class InstructionDecoder {
  var fns;
  
  InstructionDecoder(this.fns) {
  }

  void dispatch(instruction) {
    if ((instruction & 0xf0000000) == 0xf0000000) {
      fns[18](

      );
    }

    else if ((instruction & 0xf000000) == 0xf000000) {
      fns[17](
        /* cond */ (instruction & f0000000) >> 28,
        /* swi */ (instruction & ffffff) >> 0
      );
    }

    else if ((instruction & 0xf000010) == 0xe000010) {
      fns[16](
        /* cond */ (instruction & f0000000) >> 28,
        /* opcode1 */ (instruction & e00000) >> 21,
        /* L */ (instruction & 100000) >> 20,
        /* CRn */ (instruction & f0000) >> 16,
        /* Rd */ (instruction & f000) >> 12,
        /* cp_num */ (instruction & f00) >> 8,
        /* opcode2 */ (instruction & e0) >> 5,
        /* CRm */ (instruction & f) >> 0
      );
    }

    else if ((instruction & 0xf000010) == 0xe000000) {
      fns[15](
        /* cond */ (instruction & f0000000) >> 28,
        /* opcode1 */ (instruction & f00000) >> 20,
        /* CRn */ (instruction & f0000) >> 16,
        /* Rd */ (instruction & f000) >> 12,
        /* cp_num */ (instruction & f00) >> 8,
        /* opcode2 */ (instruction & e0) >> 5,
        /* CRm */ (instruction & f) >> 0
      );
    }

    else if ((instruction & 0xe000000) == 0xc000000) {
      fns[14](
        /* cond */ (instruction & f0000000) >> 28,
        /* P */ (instruction & 1000000) >> 24,
        /* U */ (instruction & 800000) >> 23,
        /* N */ (instruction & 400000) >> 22,
        /* W */ (instruction & 200000) >> 21,
        /* L */ (instruction & 100000) >> 20,
        /* Rn */ (instruction & f0000) >> 16,
        /* CRd */ (instruction & f000) >> 12,
        /* cp_num */ (instruction & f00) >> 8,
        /* offset */ (instruction & ff) >> 0
      );
    }

    else if ((instruction & 0xe000000) == 0xa000000) {
      fns[13](
        /* cond */ (instruction & f0000000) >> 28,
        /* L */ (instruction & 1000000) >> 24,
        /* offset */ (instruction & ffffff) >> 0
      );
    }

    else if ((instruction & 0xe000000) == 0x8000000) {
      fns[12](
        /* cond */ (instruction & f0000000) >> 28,
        /* P */ (instruction & 1000000) >> 24,
        /* U */ (instruction & 800000) >> 23,
        /* S */ (instruction & 400000) >> 22,
        /* W */ (instruction & 200000) >> 21,
        /* L */ (instruction & 100000) >> 20,
        /* Rn */ (instruction & f0000) >> 16,
        /* regs */ (instruction & ffff) >> 0
      );
    }

    else if ((instruction & 0xff000f0) == 0x7f000f0) {
      fns[11](
        /* cond */ (instruction & f0000000) >> 28
      );
    }

    else if ((instruction & 0xe000010) == 0x6000010) {
      fns[10](
        /* cond */ (instruction & f0000000) >> 28
      );
    }

    else if ((instruction & 0xe000010) == 0x6000000) {
      fns[9](
        /* cond */ (instruction & f0000000) >> 28,
        /* P */ (instruction & 1000000) >> 24,
        /* U */ (instruction & 800000) >> 23,
        /* B */ (instruction & 400000) >> 22,
        /* W */ (instruction & 200000) >> 21,
        /* L */ (instruction & 100000) >> 20,
        /* Rn */ (instruction & f0000) >> 16,
        /* Rd */ (instruction & f000) >> 12,
        /* shift_amount */ (instruction & f80) >> 7,
        /* shift */ (instruction & 60) >> 5,
        /* Rm */ (instruction & f) >> 0
      );
    }

    else if ((instruction & 0xe000000) == 0x4000000) {
      fns[8](
        /* cond */ (instruction & f0000000) >> 28,
        /* P */ (instruction & 1000000) >> 24,
        /* U */ (instruction & 800000) >> 23,
        /* B */ (instruction & 400000) >> 22,
        /* W */ (instruction & 200000) >> 21,
        /* L */ (instruction & 100000) >> 20,
        /* Rn */ (instruction & f0000) >> 16,
        /* Rd */ (instruction & f000) >> 12,
        /* immediate */ (instruction & fff) >> 0
      );
    }

    else if ((instruction & 0xfb00000) == 0x3200000) {
      fns[7](
        /* cond */ (instruction & f0000000) >> 28,
        /* R */ (instruction & 400000) >> 22,
        /* mask */ (instruction & f0000) >> 16,
        /* sbo */ (instruction & f000) >> 12,
        /* rotate */ (instruction & f00) >> 8,
        /* immediate */ (instruction & ff) >> 0
      );
    }

    else if ((instruction & 0xfb00000) == 0x3000000) {
      fns[6](
        /* cond */ (instruction & f0000000) >> 28
      );
    }

    else if ((instruction & 0xe000000) == 0x2000000) {
      fns[5](
        /* cond */ (instruction & f0000000) >> 28,
        /* opcode */ (instruction & 1e00000) >> 21,
        /* S */ (instruction & 100000) >> 20,
        /* Rn */ (instruction & f0000) >> 16,
        /* Rd */ (instruction & f000) >> 12,
        /* rotate */ (instruction & f00) >> 8,
        /* immediate */ (instruction & ff) >> 0
      );
    }

    else if ((instruction & 0xe000090) == 0x90) {
      fns[4](
        /* cond */ (instruction & f0000000) >> 28
      );
    }

    else if ((instruction & 0xf900090) == 0x1000010) {
      fns[3](
        /* cond */ (instruction & f0000000) >> 28
      );
    }

    else if ((instruction & 0xe000090) == 0x10) {
      fns[2](
        /* cond */ (instruction & f0000000) >> 28,
        /* opcode */ (instruction & 1e00000) >> 21,
        /* S */ (instruction & 100000) >> 20,
        /* Rn */ (instruction & f0000) >> 16,
        /* Rd */ (instruction & f000) >> 12,
        /* Rs */ (instruction & f00) >> 8,
        /* shift */ (instruction & 60) >> 5,
        /* Rm */ (instruction & f) >> 0
      );
    }

    else if ((instruction & 0xf900010) == 0x1000000) {
      fns[1](
        /* cond */ (instruction & f0000000) >> 28
      );
    }

    else if ((instruction & 0xe000010) == 0x0) {
      fns[0](
        /* cond */ (instruction & f0000000) >> 28,
        /* opcode */ (instruction & 1e00000) >> 21,
        /* S */ (instruction & 100000) >> 20,
        /* Rn */ (instruction & f0000) >> 16,
        /* Rd */ (instruction & f000) >> 12,
        /* shift_amount */ (instruction & f80) >> 7,
        /* shift */ (instruction & 60) >> 5,
        /* Rm */ (instruction & f) >> 0
      );
    }

  }
}
