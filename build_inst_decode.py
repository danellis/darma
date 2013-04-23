#!/usr/bin/env python
import sys, re
from itertools import count

template = """\
part of armem;

class InstructionDecoder {
  InstructionDecoder(array this.fns) {
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
        '      fns[%d](\n%s\n      );\n'
        '    }\n'
        % (
            binary(mask), binary(value),
            i.next(),
            ',\n'.join([
                '        /* %s */ (instruction & %x) >> %d' % (name, ((1 << size) - 1) << lsb, lsb)
                for name, lsb, size in fields
                if name != ''
            ])
        )
    )
print template % '\n    else '.join(tests),
