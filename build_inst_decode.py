#!/usr/bin/env python
import sys, re
from itertools import count

template = """\
// This file was auto-generated by build_inst_decode.py. Do not edit directly.
part of armem;

class InstructionDecoder {
  List<Function> fns;
  
  InstructionDecoder(List<Function> this.fns) {
  }

  void dispatch(instruction) {
    %s
  }
}
"""

binary_regex = re.compile('[01]+')

def binary(bits):
    return int(''.join(bits), 2)

tests = []
i = count(0)
for line in sys.stdin:
    descriptors = line.strip().split()
    mask = []
    value = []
    fields = []
    for descriptor in descriptors:
        if binary_regex.match(descriptor):
            mask.extend('1' * len(descriptor))
            value.extend(descriptor)
        else:
            try:
                name, size = descriptor.split(':')
            except ValueError:
                name, size = descriptor, 1
            size = int(size)
            mask.extend('0' * size)
            value.extend('0' * size)
            lsb = 32 - len(mask)
            fields.append((name, lsb, size))
    assert(len(mask) == 32)
    tests.insert(0,
        'if ((instruction & 0x%x) == 0x%x) {\n'
        '      this.fns[%d](\n%s\n      );\n'
        '    }\n'
        % (
            binary(mask), binary(value),
            i.next(),
            ',\n'.join([
                '        /* %s */ (instruction & 0x%x) >> %d' % (name, ((1 << size) - 1) << lsb, lsb)
                for name, lsb, size in fields
                if name != ''
            ])
        )
    )
print template % '\n    else '.join(tests),
