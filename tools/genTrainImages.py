#!/usr/bin/env python3

import os
import clipboard
import json
from util import getRom, bankConv, wordIn, bankAddr

data = getRom()
offset = bankConv('6:6630')


def createPng(bank, addr, size, filename):
    os.system(f"tools/dumpGfx.py {bank:02x}:{addr:04x} {size:04x}")
    os.system("tools/gfx.py png gfx_new.bin --width=20")
    os.system(f"mv gfx_new.png gfx/{filename}.png")

banks = set()

table_comps = []

for i in range(100):
    bank = data[offset+i*3+2]
    addr = wordIn(data, offset+i*3)

    num = (addr-0x4000)//0x1400

    table_comps.append(f"\tTrainImageTileDataSrc Gfx_TrainImage_{bank:02x}, {num}")

    banks.add(bank)


section_comps = []


empty = bytes([0]*0x400)
for bank in sorted(banks):
    createPng(bank, 0x4000, 0x3c00, f"trainImage_{bank:02x}")
    # os.system(f"rm code/bank_0{bank:02x}.s")

    section_comps.append(f'SECTION "ROM Bank $0{bank:02x}", ROMX[$4000], BANK[$0{bank:02x}]\n')
    section_comps.append(f'Gfx_TrainImage_{bank:02x}::')
    section_comps.append(f'\tINCBIN "build/trainImage_{bank:02x}.2bpp"\n\n')


with open('temp.s', 'w') as f:
    f.write('\n'.join(table_comps))
