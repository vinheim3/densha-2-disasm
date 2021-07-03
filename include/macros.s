; --
; -- Misc
; --

macro dwbe
    dw (\1>>8)+((\1&$ff)<<8)
endm

macro ldbc
    ld bc, (\1<<8)|\2
endm

macro ldde
    ld de, (\1<<8)|\2
endm

macro ldhl
    ld hl, (\1<<8)|\2
endm

macro lda
ASSERT \1 == 0
    xor a
endm

macro dwb
    dw \1
    db \2
endm

macro DEplusEquImm
    ld   a, e
    add  \1&$ff
    ld   e, a
    ld   a, d
    adc  \1>>8
    ld   d, a
endm

macro CallFromBank0
    ld   a, BANK(\1)
    call SetRomBank1stHalfOfRom
    call \1
endm

macro JumpFromBank0
    ld   a, BANK(\1)
    call SetRomBank1stHalfOfRom
    jp   \1
endm

macro M_StartMainScript
    ldhl ($c0+\1), BANK(\2)
	ld   de, \2
	call StartMainScript
endm

macro waitForRequestedVBlank
    push af
    ld   a, $00
    ld   [wRequestedVBlankFinished], a
:	ld   a, [wRequestedVBlankFinished]
    or   a
    jr   z, :-
    pop af
endm

macro HiColSrc
ASSERT BANK(\1) >= $100
    db LOW(BANK(\1))
if _NARG == 1
    dw \1
else
    dw \1+\2
endc
endm

macro SmallRectOamSources
ASSERT BANK(\1) >= $100
ASSERT BANK(\2) >= $100
    db LOW(BANK(\1))
    dw \1
    db LOW(BANK(\2))
    dw \2
endm

macro WideScreenData
ASSERT BANK(\2) < $100
    db \1 ; vram bank
    db BANK(\2) ; source bank
    db \3/$10-1 ; hdma5 num bytes
    dw \4 ; vram dest
    dw \2 ; source addr
    db $00
endm

macro BGAnimSrc
ASSERT BANK(\1) >= $100
    db LOW(BANK(\1))
    dw \1
endm

macro PreInGameSrc
    db BANK(\1)
    dw \1+\2*$1400
endm

macro FarSrc
if _NARG == 1
    db BANK(\1)
else
    db BANK(\2)
endc
    dw \1
endm

macro SrcFar
    dw \1
if _NARG == 1
    db BANK(\1)
else
    db BANK(\2)
endc
endm

macro waitUntilVramBusy
:	ldh  a, [rSTAT]
	and  STATF_LCD
	jr   z, :-
endm

macro waitUntilVramSafe
:	ldh  a, [rSTAT]
	and  STATF_LCD
	jr   nz, :-
endm

macro scrollText
    dw \1
    db (\1.end-\1)/4+SCROLL_TEXT_COL_START, 0
endm

macro SectionFrameDetails
    db LOW(BANK(\1))
    dw $4000+\2*$400
    db \3
endm

macro TrainImageTileDataSrc
    dw \1+\2*$1400
    db BANK(\1)
endm

macro FarLoadedOam
    db \1, \2
    db BANK(\3)
    dw \3
endm

; --
; -- Music
; --
Cnote = 0
Csharp = 1
Dnote = 2
Dsharp = 3
Enote = 4
Fnote = 5
Fsharp = 6
Gnote = 7
Gsharp = 8
Anote = 9
Asharp = 10
Bnote = 11
; Note, Octave, Envelope idx, Length
macro PlayNote
    db (\2-2)*12+\1 ; C2 = 0, C# = 1, C3 = 12
    db (\3<<5)+(\4/4-1)
endm

; Also counter step/width
macro NoiseSCF
    db \1
endm

macro SND_ClearHWRegs
    db SND_BYTE_CLEAR_HW_REGS
    db (\1/4-1)
endm

macro SND_SetAudTermS02
    db $d9
endm

macro SND_SetAudTermS01
    db $da
endm

macro SND_SetAudTermS01andSO2
    db $db
endm

macro SND_SetAlternatingAudTerm
    db $dc+\1-1
endm

macro SND_SetNoiseDividingRatioOfFreqs
    db $e0+\1
endm

macro SND_SaveEnvelopeValue
    db $e8+\1, \2
endm

macro SND_SquareSet25Wave1
    db $f0
endm

macro SND_SquareSet75Wave1
    db $f1
endm

macro SND_SquareSet25Wave2
    db $f2
endm

macro SND_SquareSet75Wave2
    db $f3
endm

macro SND_SetFreqTableBaseIdx
    db $f8, \1
endm

macro SND_SetSongSpeed
    db $f9, \1
endm

macro SND_SetFadingVolIncrement
    db $fb, \1
endm

macro SND_Call
    db $fc
    dw \1
endm

macro SND_Jump
    db $fd
    dw \1
endm

macro SND_Ret
    db $fe
endm

macro SND_Stop
    db $ff
endm

macro SoundChannels
if _NARG == 5
; Allow an additional param for mus 0, which uses bank 0 as its 1st param
; and NULL_SND_ADDR as its 2nd
    db \1
    shift
else
    ; Sound channels with NULL_SND_ADDR as its 1st address use bank 2
    if ISCONST(\1)
        db $02
    else
        db BANK(\1)
    endc
endc
    dw \1
    dwbe \2
    dw \3
    dwbe \4
endm