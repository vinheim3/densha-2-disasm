macro SCR_ResumeNextFrame
    db $00
endm

macro SCR_Delay
    db $02, \1
endm

macro SCR_StoreByteInAddr
    db $04
    dw \1
    db \2
endm

macro SCR_StoreWordInAddr
    db $06
    dw \1, \2
endm

macro SCR_StoreByteInStruct
    db $08, \1, \2
endm

macro SCR_StoreByteFromWord1InWord2
    db $0a
    dw \1, \2
endm

macro SCR_StoreByteFromWordInStruct
    db $0c
    dw \1
    db \2
endm

macro SCR_StoreStructByteInAddr
    db $0e, \1
    dw \2
endm

macro SCR_ValInAddrPlusEquByte
    db $10
    dw \1
    db \2
endm

macro SCR_StructByteAddByte
    db $12, \1, \2
endm

macro SCR_SetCounter1
    db $14, \1
endm

macro SCR_SetCounter2
    db $16, \1
endm

macro SCR_SetCounter3
    db $18, \1
endm

macro SCR_DecCounter1_JNE
    db $1a
    dw \1
endm

macro SCR_DecCounter2_JNE
    db $1c
    dw \1
endm

macro SCR_DecCounter3_JNE
    db $1e
    dw \1
endm

macro SCR_Jump
    db $20
    dw \1
endm

macro SCR_CallWithSingleUseRet
    db $22
    dw \1
endm

macro SCR_Call
    db $24
    dw \1
endm

macro SCR_SingleUseRet
    db $26
endm

macro SCR_Ret
    db $28
endm

macro SCR_CallTableIdxInAddr
    db $2a
    dw \1, \2
endm

macro SCR_CallTableIdxInStructByte
    db $2c
    dw \1
    db \2
endm

macro SCR_CreateOtherScript
    db $30, $c0+\1, BANK(\2)
    dw \2
endm

macro SCR_StopCurrScript
    db $32
endm

macro SCR_StopOtherScript
    db $34, $c0+\1
endm

macro SCR_StartSubScript1
    db $36, BANK(\1)
    dw \1
endm

macro SCR_StopSubScript1
    db $38
endm

macro SCR_StartSubScript2
    db $3a, BANK(\1)
    dw \1
endm

macro SCR_StopSubScript2
    db $3c
endm

macro SCR_TurnOnLCD
    db $3e
endm

macro SCR_TurnOffLCD
    db $40
endm

macro SCR_UnsetSpriteSrc
    db $44
endm

macro SCR_UnsetOtherSpriteSpec
    db $46, $c0+\1
endm

macro SCR_FarSetSpriteSrc
if _NARG == 1
    db $48
    dw \1
    db BANK(\1)
else
    db $48
    dw \1
    db \2
endc
endm

macro SCR_FarSetSpriteSrcFunc
    db $48
    dw \1+$8000
    db BANK(\1)
endm

macro SCR_SetSpriteSrc
    db $4a
    dw \1
endm

macro SCR_SetSpriteXY
    db $4c, \1, \2
endm

macro SCR_SetSpriteX
    db $4e, \1
endm

macro SCR_SetSpriteY
    db $50, \1
endm

macro SCR_AddToSpriteXY
    db $52, \1, \2
endm

macro SCR_AddToSpriteX
    db $54, \1
endm

macro SCR_AddToSpriteY
    db $56, \1
endm

macro SCR_PlaySound
    db $58, \1
endm

macro SCR_CallAsm
    db $5a
    dw \1
endm

macro SCR_ExecAsmBelow
    db $5c
endm