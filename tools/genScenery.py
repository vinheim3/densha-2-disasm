#!/usr/bin/env python3

import os
import clipboard
import json
from util import getRom, bankConv, wordIn, bankAddr

data = getRom()
offset = bankConv('b:4000')


def createPng(bank, addr, size, filename):
    os.system(f"tools/dumpGfx.py 1{bank:02x}:{addr:04x} {size:04x}")
    os.system("tools/gfx.py png gfx_new.bin --width=8")
    os.system(f"mv gfx_new.png gfx/{filename}.png")


used_banks_addresses = {}

section_comps = []
metasection_comps = []
railsMap = ['RAILS_STRAIGHT', 'RAILS_STRONG_RIGHT', 'RAILS_STRONG_LEFT']


sectionAddresses = {}

for sectionI in range(0xe0):
    sectionAddress = wordIn(data, offset+sectionI*2)
    sectionOffset = bankAddr(0xb, sectionAddress)
    section_comps.append(f"\tdw .metaSection_{sectionI:02x}")

    exists = False
    if sectionAddress in sectionAddresses:
        exists = True
    sectionAddresses.setdefault(sectionAddress, [])
    sectionAddresses[sectionAddress] = [f".metaSection_{sectionI:02x}:"] + sectionAddresses[sectionAddress]
    if exists:
        continue

    for frameI in range(15):
        bank = data[sectionOffset+frameI*4]
        addr = wordIn(data, sectionOffset+frameI*4+1)
        rails = data[sectionOffset+frameI*4+3]

        used_banks_addresses.setdefault(bank, {}).setdefault(addr, []).append((sectionI, frameI))
        addrIdx = (addr-0x4000)//0x400

        sectionAddresses[sectionAddress].append(
            f"\tSectionFrameDetails Gfx_SceneryBG_1{bank:02x}, {addrIdx}, {railsMap[rails]}")

for addr in sorted(sectionAddresses.keys()):
    sections = sectionAddresses[addr]

    metasection_comps.extend(sections)

    metasection_comps.append('')


section_comps.append('\n\n')
metasection_comps.append('\n')


# Check for missing + generate sections
high_section_comps = []
for bank in range(0xe3):
    if bank not in used_banks_addresses:
        print(f"Bank not found: {bank:02x}")
        continue

    high_section_comps.append(f'SECTION "ROM Bank $1{bank:02x}", ROMX[$4000], BANK[$1{bank:02x}]\n')
    high_section_comps.append(f'Gfx_SceneryBG_1{bank:02x}::')
    high_section_comps.append(f'\tINCBIN "build/sceneryBG_1{bank:02x}.2bpp"\n\n')
    # if bank:
    #     createPng(bank, 0x4000, 0x4000, f"sceneryBG_1{bank:02x}")
    #     os.system(f"rm code/bank_1{bank:02x}.s")
    
    for i in range(16):
        addr = 0x4000+i*0x400

        if addr not in used_banks_addresses[bank]:
            print(f"Addr not found: {bank:02x}:{addr:04x}")

with open('temp.s', 'w') as f:
    f.write('\n'.join(section_comps) + '\n'.join(metasection_comps) + '\n'.join(high_section_comps))
