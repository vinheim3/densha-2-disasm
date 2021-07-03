#!/usr/bin/env python3

import sys
import clipboard
from util import getRom, bankConv

data = getRom()
start = bankConv(sys.argv[1])
offset = 0
baseAddr = (start % 0x4000) + 0x4000
isNoise = len(sys.argv) > 2

def readByte():
    global offset
    byte = data[start+offset]
    offset += 1
    return byte

notes = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B']
notes = [
    f"{note}note " if '#' not in note else note.replace('#', 'sharp')
    for note in notes
]

comps = []
test_comps = []
byte = None
while byte not in (0xfd, 0xfe, 0xff):
    curr_addr = baseAddr + offset
    byte = data[start+offset]
    offset += 1

    params = []
    if byte == 0x6f:
        macro = 'SND_ClearHWRegs'
        len = readByte() & 0x1f
        len = (len + 1) * 4
        params.append(f"${len:02x}")
    elif byte < 0xd0:
        if isNoise:
            macro = 'NoiseSCF'
            params.append(f"${byte:02x}")
        else:
            # 0 - C2, -1 would be B1
            octave = byte // 12 + 2
            note = notes[byte % 12]
            macro = 'PlayNote'
            params.append(note)
            params.append(str(octave))

            envLen = readByte()
            env = envLen >> 5
            len = envLen & 0x1f
            len = (len + 1) * 4
            params.append(str(env))
            params.append(f"${len:02x}")
    elif byte == 0xd9:
        macro = 'SND_SetAudTermS02'
    elif byte == 0xda:
        macro = 'SND_SetAudTermS01'
    elif byte == 0xdb:
        macro = 'SND_SetAudTermS01andSO2'
    elif 0xdc <= byte <= 0xdf:
        macro = 'SND_SetAlternatingAudTerm'
        params.append(str(byte-0xdb))
    elif 0xe0 <= byte <= 0xe7:
        assert isNoise
        macro = 'SND_SetNoiseDividingRatioOfFreqs'
        params.append(str(byte-0xe0))
    elif 0xe8 <= byte <= 0xef:
        macro = 'SND_SaveEnvelopeValue'
        params.append(str(byte-0xe8))
        params.append(f"${readByte():02x}")
    elif byte == 0xf0:
        macro = 'SND_SquareSet25Wave1'
    elif byte == 0xf1:
        macro = 'SND_SquareSet75Wave1'
    elif byte == 0xf2:
        macro = 'SND_SquareSet25Wave2'
    elif byte == 0xf3:
        macro = 'SND_SquareSet75Wave2'
    elif byte == 0xf8:
        macro = 'SND_SetFreqTableBaseIdx'
        params.append(f"${readByte():02x}")
    elif byte == 0xf9:
        macro = 'SND_SetSongSpeed'
        params.append(f"${readByte():02x}")
    elif byte == 0xfb:
        macro = 'SND_SetFadingVolIncrement'
        params.append(f"${readByte():02x}")
    elif byte == 0xfc:
        macro = 'SND_Call'
        lb = readByte()
        hb = readByte()
        params.append(f"${hb:02x}{lb:02x}")
    elif byte == 0xfd:
        macro = 'SND_Jump'
        lb = readByte()
        hb = readByte()
        params.append(f"${hb:02x}{lb:02x}")
    elif byte == 0xfe:
        macro = 'SND_Ret'
    elif byte == 0xff:
        macro = 'SND_Stop'

    else:
        raise Exception(f"Implement {byte:02x}")

    if params:
        comps.append(f"\t{macro} {', '.join(params)}")
        test_comps.append(f"\t{macro} {', '.join(params)} ; ${curr_addr:04x}")
    else:
        comps.append(f"\t{macro}")
        test_comps.append(f"\t{macro} ; ${curr_addr:04x}")

final_str = '\n'.join(comps)
print(final_str)
clipboard.copy(final_str)
with open('temp.s', 'w') as f:
    f.write('\n'.join(test_comps))
print(f"{curr_addr:02x}")
