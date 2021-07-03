#!/usr/bin/env python3

import os
import clipboard
import json
from util import getRom, bankConv, wordIn, bankAddr

data = getRom()
offset = bankConv('8:7948')


def createPng(bank, addr, size, filename):
    os.system(f"tools/dumpGfx.py {bank:02x}:{addr:04x} {size:04x}")
    os.system("tools/gfx.py png gfx_new.bin --width=16")
    os.system(f"mv gfx_new.png gfx/{filename}.png")


comps = []
b1_addrs = {}
b2_addrs = {}
for eventI in range(0x3d):
    evOffset = eventI*8+offset
    tileBank = data[evOffset]
    tileAddr = wordIn(data, evOffset+1)
    paletteAddr = wordIn(data, evOffset+3)
    palIdx = (paletteAddr-0x7200)//8

    if tileBank == 0xb1:
        b1_addrs[tileAddr] = eventI
    elif tileBank == 0xb2:
        b2_addrs[tileAddr] = eventI
        createPng(0xb2, tileAddr, 0x200, f"event{eventI:02x}")
    else:
        raise Exception(f"{tileBank:02x}")

    comps.append(f"\tEventSource Gfx_Event{eventI:02x}, BGPalettes_EventPal_{palIdx:01x}")


section_comps = []
for addr in range(0x4000, 0x7a00, 0x200):
    eventI = b2_addrs[addr]
    section_comps.append(f"Gfx_Event{eventI:02x}::")
    section_comps.append(f"\tINCBIN \"build/event{eventI:02x}.2bpp\"\n\n")


final_str = '\n'.join(section_comps)
print(final_str)
clipboard.copy(final_str)
