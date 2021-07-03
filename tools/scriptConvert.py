#!/usr/bin/env python3

import sys
import clipboard
from util import getRom, bankConv, wordIn

data = getRom()
start = bankConv(sys.argv[1])
end = None
if len(sys.argv) > 2:
    end = bankConv(sys.argv[2])+1

offset = 0

ops = {
    0x00: ('SCR_ResumeNextFrame', None),
    0x02: ('SCR_Delay', "b"),
    0x04: ('SCR_StoreByteInAddr', "wb"),
    0x06: ('SCR_StoreWordInAddr', "ww"),
    0x08: ('SCR_StoreByteInStruct', "bb"),
    0x0a: ('SCR_StoreByteFromWord1InWord2', "ww"),
    0x0c: ('SCR_StoreByteFromWordInStruct', "wb"),
    0x0e: ('SCR_StoreStructByteInAddr', "bw"),
    0x10: ('SCR_ValInAddrPlusEquByte', "wb"),
    0x12: ('SCR_StructByteAddByte', "bb"),
    0x14: ('SCR_SetCounter1', "b"),
    0x16: ('SCR_SetCounter2', "b"),
    0x18: ('SCR_SetCounter3', "b"),
    0x1a: ('SCR_DecCounter1_JNE', "w"),
    0x1c: ('SCR_DecCounter2_JNE', "w"),
    0x1e: ('SCR_DecCounter3_JNE', "w"),
    0x20: ('SCR_Jump', "w"),
    0x22: ('SCR_CallWithSingleUseRet', "w"),
    0x24: ('SCR_Call', "w"),
    0x26: ('SCR_SingleUseRet', None),
    0x28: ('SCR_Ret', None),
    0x2a: ('SCR_CallTableIdxInAddr', "wwj0"),
    0x2c: ('SCR_CallTableIdxInStructByte', "wbj0"),
    
    0x30: ('SCR_CreateOtherScript', "cbw"),
    0x32: ('SCR_StopCurrScript', None),
    0x34: ('SCR_StopOtherScript', "c"),
    0x36: ('SCR_StartSubScript1', "bw"),
    0x38: ('SCR_StopSubScript1', None),
    0x3a: ('SCR_StartSubScript2', "bw"),
    0x3c: ('SCR_StopSubScript2', None),
    0x3e: ('SCR_TurnOnLCD', None),
    
    0x44: ('SCR_UnsetSpriteSrc', None),
    0x46: ('SCR_UnsetOtherSpriteSpec', "c"),
    0x48: ('SCR_FarSetSpriteSrc', "wb"),
    0x4a: ('SCR_SetSpriteSrc', "w"),
    0x4c: ('SCR_SetSpriteXY', "bb"),
    0x4e: ('SCR_SetSpriteX', "b"),
    0x50: ('SCR_SetSpriteY', "b"),

    0x54: ('SCR_AddToSpriteX', "b"),
    0x56: ('SCR_AddToSpriteY', "b"),
    0x58: ('SCR_PlaySound', "b"),

    0x5c: ('SCR_ExecAsmBelow', None),
}

comps = []
op = None
while op not in (0x20, 0x26, 0x28, 0x2a, 0x2c, 0x32, 0x5c,) and (end is None or start+offset < end):
    op = data[start+offset]
    offset += 1
    if op not in ops:
        raise Exception(f"Implement ${op:02x}")
    name, params = ops[op]
    if not params:
        comps.append(f"\t{name}")
        continue
    param_comps = []
    jump_counter = 0
    jump_comps = []
    for param in params:
        if jump_counter == 0xff:
            jump_counter = int(param)
            for i in range(jump_counter):
                word = wordIn(data, start+offset)
                jump_comps.append(f"\tdw ${word:04x}")
                offset += 2
            jump_counter = 0
        if param == 'b':
            byte = data[start+offset]
            offset += 1
            param_comps.append(f"${byte:02x}")
        elif param == 'c':
            byte = data[start+offset]
            offset += 1
            comp = f"${byte:02x}".replace("$c", "")
            param_comps.append(comp)
        elif param == 'w':
            word = data[start+offset]|(data[start+offset+1]<<8)
            offset += 2
            param_comps.append(f"${word:04x}")
        elif param == "j":
            jump_counter = 0xff
    comps.append(f"\t{name} {', '.join(param_comps)}")
    comps.extend(jump_comps)

final_str = "\n".join(comps)
clipboard.copy(final_str)
print(final_str)
