#!/usr/bin/env python3

import os
import clipboard
import json
from util import getRom, bankConv, wordIn, bankAddr, stringB

data = getRom()
offset = bankConv('8:53bd')
comps = []


tlAddresses = []
tlAddrMap = {}
for i in range(11):
    tlAddr = wordIn(data, offset+i*2)
    tlAddresses.append(tlAddr)
    assert tlAddr not in tlAddrMap
    tlAddrMap[tlAddr] = i

sortedTLAddresses = sorted(tlAddresses)
sortedTLAddresses.append(0x571b)


tlLocAddresses = []
tlLocAddrMap = {}
scenAddresses = []
scenAddrMap = {}
for i, address in enumerate(sortedTLAddresses[:-1]):
    nextAddr = sortedTLAddresses[i+1]
    tlBytes = data[bankAddr(8, address):bankAddr(8, nextAddr)]

    tlIdx = str(tlAddrMap[address])
    if tlAddrMap[address] == 10:
        comps.append(f".trainLineA::")
    else:
        comps.append(f".trainLine{tlIdx}:")

    assert len(tlBytes) % 8 == 0
    numLocations = len(tlBytes) // 8
    for j in range(numLocations):
        locOffset = bankAddr(8, address+j*8)
        locationDataAddr = wordIn(data, locOffset)
        tlLocAddresses.append(locationDataAddr)
        tlLocAddrMap.setdefault(locationDataAddr, []).append(
            f".trainLine{tlIdx}location{j}sections:")

        locationDistance = wordIn(data, locOffset+2)
        scenarioAddr = wordIn(data, locOffset+5)
        scenAddresses.append(scenarioAddr)
        scenAddrMap.setdefault(scenarioAddr, []).append(
            f".trainLine{tlIdx}location{j}scenarios:")
        

        comps.append(
            f"\tLocationMetadata .trainLine{tlIdx}location{j}sections, "
            f"{locationDistance}, {data[locOffset+4]}, .trainLine{tlIdx}location{j}scenarios")

    comps.append("")

sortedLocAddresses = sorted(set(tlLocAddresses))
sortedLocAddresses.append(0x6fbd)
sortedScenAddresses = sorted(set(scenAddresses))
sortedScenAddresses.append(0x784f)



for i, address in enumerate(sortedLocAddresses[:-1]):
    nextAddr = sortedLocAddresses[i+1]
    labels = tlLocAddrMap[address]
    for label in labels:
        comps.append(label)
    locBytes = data[bankAddr(8, address):bankAddr(8, nextAddr)]
    numLocBytes = len(locBytes)
    assert numLocBytes % 2 == 0
    numSections = numLocBytes // 2

    for j in range(numSections):
        bytes = locBytes[j*2: j*2+2]
        comps.append(stringB(bytes))
    comps.append('')


scen_map = {
    0x07: "SCEN_ALT_RED_LIGHTS_NO_BONUS",
    0x08: "SCEN_MUST_PRESS_SIREN",
    0x09: "SCEN_HIDDEN_SIREN_BONUS_PTS",
    0x0a: "SCEN_APPROACHING_STATION",
    0x15: "SCEN_COASTING_NOTICE",
    0x16: "SCEN_COASTING_IDLE",
    0x17: "SCEN_COASTING_END",
    0x18: "SCEN_NO_SPEED_LIMIT",
    0x19: "SCEN_CAB_EVENT",
    0x1a: "SCEN_CUSTOM_SPEED_LIMIT_OR_STOP",
    0x1c: "SCEN_CARRY_ON_FIELD",
    0x1e: "SCEN_SPEED_LIMIT_35KM_H",
    0x20: "SCEN_SPEED_LIMIT_45KM_H",
    0x21: "SCEN_SPEED_LIMIT_50KM_H",
    0x22: "SCEN_SPEED_LIMIT_55KM_H",
    0x23: "SCEN_SPEED_LIMIT_60KM_H",
    0x24: "SCEN_SPEED_LIMIT_65KM_H",
    0x25: "SCEN_SPEED_LIMIT_70KM_H",
    0x26: "SCEN_SPEED_LIMIT_75KM_H",
    0x27: "SCEN_SPEED_LIMIT_80KM_H",
    0x28: "SCEN_SPEED_LIMIT_85KM_H",
    0x29: "SCEN_SPEED_LIMIT_90KM_H",
    0x2a: "SCEN_SPEED_LIMIT_95KM_H",
    0x2b: "SCEN_SPEED_LIMIT_100KM_H",
    0x2c: "SCEN_SPEED_LIMIT_105KM_H",
    0x2d: "SCEN_SPEED_LIMIT_110KM_H",
    0x2e: "SCEN_SPEED_LIMIT_115KM_H",
    0x2f: "SCEN_SPEED_LIMIT_120KM_H",
    0x30: "SCEN_SPEED_LIMIT_125KM_H",
    0x34: "SCEN_ATC_30KM_H",
    0x35: "SCEN_ATC_70KM_H",
    0x36: "SCEN_ATC_110KM_H",
    0x37: "SCEN_ATC_160KM_H",
    0x38: "SCEN_ATC_210KM_H",
    0x39: "SCEN_ATC_245KM_H",
    0x50: "SCEN_DARKEN_SKY",
}


for i, address in enumerate(sortedScenAddresses[:-1]):
    nextAddr = sortedScenAddresses[i+1]
    labels = scenAddrMap[address]
    for label in labels:
        comps.append(label)

    locBytes = data[bankAddr(8, address):bankAddr(8, nextAddr)]
    
    offset = 0
    while offset < len(locBytes):
        b1 = locBytes[offset]
        b2 = locBytes[offset+1]
        if b1 == 0 and b2 == 0:
            comps.append(f"\tdw 0\n")
            offset += 2
            continue

        b3 = locBytes[offset+2]
        if b3 not in scen_map:
            print(hex(b3))
            stringB3 = f"${b3:02x}"
        else:
            stringB3 = scen_map[b3]

        offset += 3
        comps.append(f"\tdwb {b1+(b2<<8)}, {stringB3}")



final_str = '\n'.join(comps)
clipboard.copy(final_str)
# print(final_str)
