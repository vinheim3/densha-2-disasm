INCLUDE "includes.s"

SECTION "Script engine", ROM0[$ad9]

ClearScriptsOamHideAllOam::
	ld   hl, PAGE_0+SCRIPT_SPRITE_ADDR+1                            ; $0ad9
	ld   b, MAX_SCRIPTS                                             ; $0adc
	xor  a                                                          ; $0ade

; Clear high byte of sprite addr so oam update skips it
:	ld   [hl], a                                                    ; $0adf
	inc  h                                                          ; $0ae0
	dec  b                                                          ; $0ae1
	jr   nz, :-                                                     ; $0ae2

; Hide all oam
	ld   hl, wOam                                                   ; $0ae4
	ld   b, NUM_SPRITES                                             ; $0ae7
	jp   HideUnusedOam                                              ; $0ae9


; unused - $0aec
; Sprite addr = BC, sprite bank = L, sprite X = D, sprite Y = E
	ld   a, l                                                       ; $0aec
	ld   l, SCRIPT_SPRITE_ADDR                                      ; $0aed
	ld   [hl], c                                                    ; $0aef
	inc  l                                                          ; $0af0
	ld   [hl], b                                                    ; $0af1
	inc  l                                                          ; $0af2
	ld   [hl], a                                                    ; $0af3
	inc  l                                                          ; $0af4
	ld   [hl], d                                                    ; $0af5
	inc  l                                                          ; $0af6
	ld   [hl], e                                                    ; $0af7
	ret                                                             ; $0af8


; DE - script struct address pointing to high byte of oam update func address
; H - high byte of oam update func address shifted left once
; L - low byte of oam update func
JumpToScriptsOamUpdateFunc:
	rrca                                                            ; $0af9
	ld   h, a                                                       ; $0afa
	inc  e                                                          ; $0afb
	ld   a, [de]                                                    ; $0afc
	call SetRomBank1stHalfOfRom                                     ; $0afd
	jp   hl                                                         ; $0b00


; If script's source addr high byte has bit 7 set, use above func to jump instead
; If script's source addr high byte == 0, go to next script
; Otherwise source addr contains the number of tiles for the sprite,
; Then for each tile, the Y and X offsets for the tile relative to the base Y and X
; offset for the sprite; then the tile's idx and attr
UpdateScriptsOam::
; Clear wOam starting offset
	xor  a                                                          ; $0b01
	ldh  [hCurrScriptOamOffset], a                                  ; $0b02

; Start with script 0 (-1 is reversed start of loop)
	ldde (HIGH(PAGE_0)-1), MAX_SCRIPTS                              ; $0b04

.nextScriptStruct:
; Pop when dec'ing current script counter
	inc  d                                                          ; $0b07
	push de                                                         ; $0b08

; If high byte of 1st word == 0, go to next script
; if bit 7 set on high byte, branch up, and jump to the bank/addr
	ld   e, SCRIPT_SPRITE_ADDR                                      ; $0b09
	ld   a, [de]                                                    ; $0b0b
	inc  e                                                          ; $0b0c
	ld   l, a                                                       ; $0b0d
	ld   a, [de]                                                    ; $0b0e
	ld   h, a                                                       ; $0b0f
	add  a                                                          ; $0b10
	jr   z, .toNextScriptStruct                                     ; $0b11

	jr   c, JumpToScriptsOamUpdateFunc                              ; $0b13

; Set bank (byte 2)
	inc  e                                                          ; $0b15
	ld   a, [de]                                                    ; $0b16
	call SetRomBank1stHalfOfRom                                     ; $0b17

; Byte 3 - x offset
	inc  e                                                          ; $0b1a
	ld   a, [de]                                                    ; $0b1b
	ldh  [hCurrScriptOamTileXOffset], a                             ; $0b1c

; Byte 4 - y offset in C
	inc  e                                                          ; $0b1e
	ld   a, [de]                                                    ; $0b1f
	ld   c, a                                                       ; $0b20

; First byte in address has number of tiles used for sprite
	ld   b, [hl]                                                    ; $0b21

	ldh  a, [hCurrScriptOamOffset]                                  ; $0b22
	ld   e, a                                                       ; $0b24
	rrca                                                            ; $0b25
	rra                                                             ; $0b26

; If num tiles used + num requested >= $29, skip this script's oam
	add  b                                                          ; $0b27
	cp   NUM_SPRITES+1                                              ; $0b28
	jr   nc, .toNextScriptStruct                                    ; $0b2a

; Else go to source byte after
	inc  hl                                                         ; $0b2c
	ld   d, HIGH(wOam)                                              ; $0b2d

.nextTile:
; Tile y offset + sprite offset in oam Y
	ld   a, [hl+]                                                   ; $0b2f
	add  c                                                          ; $0b30
	ld   [de], a                                                    ; $0b31
	inc  e                                                          ; $0b32

; Tile x offset + sprite offset in oam X
	ldh  a, [hCurrScriptOamTileXOffset]                             ; $0b33
	add  [hl]                                                       ; $0b35
	inc  hl                                                         ; $0b36
	ld   [de], a                                                    ; $0b37
	inc  e                                                          ; $0b38

; Next source byte is tile idx, then tile attr
	ld   a, [hl+]                                                   ; $0b39
	ld   [de], a                                                    ; $0b3a
	inc  e                                                          ; $0b3b

	ld   a, [hl+]                                                   ; $0b3c
	ld   [de], a                                                    ; $0b3d
	inc  e                                                          ; $0b3e

; Do next tile
	dec  b                                                          ; $0b3f
	jr   nz, .nextTile                                              ; $0b40

; Save next sprite's spot in wOam
	ld   a, e                                                       ; $0b42

.saveOamOffsetGoToNextScriptStruct::
	ldh  [hCurrScriptOamOffset], a                                  ; $0b43

.toNextScriptStruct:
	pop  de                                                         ; $0b45
	dec  e                                                          ; $0b46
	jr   nz, .nextScriptStruct                                      ; $0b47

; Last script's oam offset in B
	ldh  a, [hCurrScriptOamOffset]                                  ; $0b49
	ld   hl, wPreviousFramesNextOamOffset                           ; $0b4b
	ld   b, [hl]                                                    ; $0b4e

; Save current (in l too for address to clear from if we need too)
; If current < last, we need to hide those
	ld   [hl], a                                                    ; $0b4f
	ld   l, a                                                       ; $0b50
	sub  b                                                          ; $0b51
	ret  nc                                                         ; $0b52

; Turn diff positive, div 4 to get num unused sprites
	cpl                                                             ; $0b53
	inc  a                                                          ; $0b54
	rrca                                                            ; $0b55
	rrca                                                            ; $0b56
	ld   b, a                                                       ; $0b57

	ld   h, HIGH(wOam)                                              ; $0b58

; B - num unused sprites
; HL - wOam address
HideUnusedOam:
	ld   de, OAM_SIZEOF                                             ; $0b5a
	xor  a                                                          ; $0b5d
:	ld   [hl], a                                                    ; $0b5e
	add  hl, de                                                     ; $0b5f
	dec  b                                                          ; $0b60
	jr   nz, :-                                                     ; $0b61

	ret                                                             ; $0b63


; Caller - location before script byte to process
ProcessScriptsFromCurrLoc::
	pop  de                                                         ; $0b64

; DE - script bytes location
ProcessScriptsFromDE::
	ld   a, [de]                                                    ; $0b65
	inc  de                                                         ; $0b66
	ld   l, a                                                       ; $0b67
	ld   h, HIGH(ScriptPointers)                                    ; $0b68
	ld   a, [hl+]                                                   ; $0b6a
	ld   h, [hl]                                                    ; $0b6b
	ld   l, a                                                       ; $0b6c
	jp   hl                                                         ; $0b6d


ProcessScriptsFromHL:
	ld   a, [hl+]                                                   ; $0b6e
	ld   e, l                                                       ; $0b6f
	ld   d, h                                                       ; $0b70
	ld   l, a                                                       ; $0b71
	ld   h, HIGH(ScriptPointers)                                    ; $0b72
	ld   a, [hl+]                                                   ; $0b74
	ld   h, [hl]                                                    ; $0b75
	ld   l, a                                                       ; $0b76
	jp   hl                                                         ; $0b77


InitScriptStructs::
	ld   h, HIGH(PAGE_0)                                            ; $0b78
	ldbc MAX_SCRIPTS, $00                                           ; $0b7a

.nextStruct:
; Don't run main or sub-scripts
	ld   l, SCRIPT_BANK_MAIN                                        ; $0b7d
	ld   [hl], c                                                    ; $0b7f
	ld   l, SCRIPT_BANK_SUB1                                        ; $0b80
	ld   [hl], c                                                    ; $0b82
	ld   l, SCRIPT_BANK_SUB2                                        ; $0b83
	ld   [hl], c                                                    ; $0b85

; Set default Stack details
	ld   l, SCRIPT_SP                                               ; $0b86
	ld   [hl], SCRIPT_STACK-2                                       ; $0b88

; To next struct
	inc  h                                                          ; $0b8a
	dec  b                                                          ; $0b8b
	jr   nz, .nextStruct                                            ; $0b8c

; Clear num scripts
	ld   hl, wNumScripts                                            ; $0b8e
	ld   [hl], c                                                    ; $0b91
	ret                                                             ; $0b92


; DE - script addr
; H - high byte of script struct
; L - script bank
StartMainScript::
; Store script bank
	ld   b, l                                                       ; $0b93
	ld   l, SCRIPT_BANK_MAIN                                        ; $0b94
	ld   a, [hl]                                                    ; $0b96
	ld   [hl], b                                                    ; $0b97

; Set delay to 1 (start immediately)
	inc  l                                                          ; $0b98
	ld   [hl], $01                                                  ; $0b99

; Store script addr
	inc  l                                                          ; $0b9b
	ld   [hl], e                                                    ; $0b9c
	inc  l                                                          ; $0b9d
	ld   [hl], d                                                    ; $0b9e

; If a new script (not an overwritten one), inc num scripts
	or   a                                                          ; $0b9f
	ret  nz                                                         ; $0ba0

	ld   hl, wNumScripts                                            ; $0ba1
	inc  [hl]                                                       ; $0ba4
	ret                                                             ; $0ba5


ScriptFunc00_ResumeNextFrame:
	ld   b, $01                                                     ; $0ba6
	ret                                                             ; $0ba8


; [de] - delay value
ScriptFunc02_SetDelay:
	ld   a, [de]                                                    ; $0ba9
	ld   b, a                                                       ; $0baa
	inc  de                                                         ; $0bab
	ret                                                             ; $0bac


; [de/de+1] - addr
; [de+2] - value
ScriptFunc04_StoreByteInAddr:
; HL = word in DE
	ld   a, [de]                                                    ; $0bad
	inc  de                                                         ; $0bae
	ld   l, a                                                       ; $0baf
	ld   a, [de]                                                    ; $0bb0
	inc  de                                                         ; $0bb1
	ld   h, a                                                       ; $0bb2

; Byte in DE after to be set in word
	ld   a, [de]                                                    ; $0bb3
	inc  de                                                         ; $0bb4
	ld   [hl], a                                                    ; $0bb5

	jp   ProcessScriptsFromDE                                       ; $0bb6


; [de/de+1] - addr
; [de+2/de+3] - word
ScriptFunc06_StoreWordInAddr:
; HL = word in DE
	ld   a, [de]                                                    ; $0bb9
	inc  de                                                         ; $0bba
	ld   l, a                                                       ; $0bbb
	ld   a, [de]                                                    ; $0bbc
	inc  de                                                         ; $0bbd
	ld   h, a                                                       ; $0bbe

; Store low, then high in HL
	ld   a, [de]                                                    ; $0bbf
	inc  de                                                         ; $0bc0
	ld   [hl+], a                                                   ; $0bc1
	ld   a, [de]                                                    ; $0bc2
	inc  de                                                         ; $0bc3
	ld   [hl], a                                                    ; $0bc4

	jp   ProcessScriptsFromDE                                       ; $0bc5


; [de] - low byte of script struct
; [de+1] - value to set
ScriptFunc08_StoreByteInStruct:
; 1st byte in l - low byte of script struct
	ld   a, [de]                                                    ; $0bc8
	inc  de                                                         ; $0bc9
	ld   l, a                                                       ; $0bca

	ldh  a, [hCurrScriptStructHighByte]                             ; $0bcb
	ld   h, a                                                       ; $0bcd

; 2nd byte is val to set
	ld   a, [de]                                                    ; $0bce
	inc  de                                                         ; $0bcf
	ld   [hl], a                                                    ; $0bd0
	jp   ProcessScriptsFromDE                                       ; $0bd1


;;[de/de+1] - word 1
; [de+2/de+3] - word 2
ScriptFunc0a_StoreByteFromWord1InWord2:
; 1st word param in DE
	ld   l, e                                                       ; $0bd4
	ld   h, d                                                       ; $0bd5
	ld   e, [hl]                                                    ; $0bd6
	inc  hl                                                         ; $0bd7
	ld   d, [hl]                                                    ; $0bd8
	inc  hl                                                         ; $0bd9

; Byte in that word is val to set
	ld   a, [de]                                                    ; $0bda

; Next word param in DE
	ld   e, [hl]                                                    ; $0bdb
	inc  hl                                                         ; $0bdc
	ld   d, [hl]                                                    ; $0bdd
	inc  hl                                                         ; $0bde

; Set val, then continue processing
	ld   [de], a                                                    ; $0bdf
	jp   ProcessScriptsFromHL                                       ; $0be0


; [de/de+1] - word
; [de+2] - low byte of script struct
ScriptFunc0c_StoreByteFromWordInStruct:
; 1st word param in HL
	ld   a, [de]                                                    ; $0be3
	inc  de                                                         ; $0be4
	ld   l, a                                                       ; $0be5
	ld   a, [de]                                                    ; $0be6
	inc  de                                                         ; $0be7
	ld   h, a                                                       ; $0be8

; Byte in word above is val to set
	ld   b, [hl]                                                    ; $0be9

; Next byte param is low byte of script struct
	ld   a, [de]                                                    ; $0bea
	inc  de                                                         ; $0beb
	ld   l, a                                                       ; $0bec
	ldh  a, [hCurrScriptStructHighByte]                             ; $0bed
	ld   h, a                                                       ; $0bef

	ld   [hl], b                                                    ; $0bf0
	jp   ProcessScriptsFromDE                                       ; $0bf1


; [de] - struct byte
; [de+1/de+2] - address
ScriptFunc0e_StoreStructByteInAddr:
; Param 1 in L (struct byte)
	ld   a, [de]                                                    ; $0bf4
	inc  de                                                         ; $0bf5
	ld   l, a                                                       ; $0bf6

; 1st struct byte in B
	ldh  a, [hCurrScriptStructHighByte]                             ; $0bf7
	ld   h, a                                                       ; $0bf9
	ld   b, [hl]                                                    ; $0bfa

; Next param word in HL
	ld   a, [de]                                                    ; $0bfb
	inc  de                                                         ; $0bfc
	ld   l, a                                                       ; $0bfd

	ld   a, [de]                                                    ; $0bfe
	inc  de                                                         ; $0bff
	ld   h, a                                                       ; $0c00

; Store prev struct byte in param word
	ld   [hl], b                                                    ; $0c01

	jp   ProcessScriptsFromDE                                       ; $0c02


; [de/de+1] - addr
; [de+2] - byte
ScriptFunc10_ValInAddrPlusEquByte:
; Word param is address to affect
	ld   a, [de]                                                    ; $0c05
	inc  de                                                         ; $0c06
	ld   l, a                                                       ; $0c07
	ld   a, [de]                                                    ; $0c08
	inc  de                                                         ; $0c09
	ld   h, a                                                       ; $0c0a

; Byte param after is value to add to it
	ld   a, [de]                                                    ; $0c0b
	inc  de                                                         ; $0c0c
	add  [hl]                                                       ; $0c0d
	ld   [hl], a                                                    ; $0c0e

	jp   ProcessScriptsFromDE                                       ; $0c0f


; [de] - struct byte
; [de+1] - byte to add
ScriptFunc12_StructByteAddByte:
; Param 1 is struct byte
	ld   a, [de]                                                    ; $0c12
	inc  de                                                         ; $0c13
	ld   l, a                                                       ; $0c14

	ldh  a, [hCurrScriptStructHighByte]                             ; $0c15
	ld   h, a                                                       ; $0c17

; Param 2 is added onto it
	ld   a, [de]                                                    ; $0c18
	inc  de                                                         ; $0c19
	add  [hl]                                                       ; $0c1a
	ld   [hl], a                                                    ; $0c1b

	jp   ProcessScriptsFromDE                                       ; $0c1c


; [de] - counter
ScriptFunc14_SetCounter1:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0c1f
	ld   h, a                                                       ; $0c21
	ld   l, SCRIPT_COUNTER1                                         ; $0c22
	ld   a, [de]                                                    ; $0c24
	inc  de                                                         ; $0c25
	ld   [hl], a                                                    ; $0c26

	jp   ProcessScriptsFromDE                                       ; $0c27


; [de] - counter
ScriptFunc16_SetCounter2:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0c2a
	ld   h, a                                                       ; $0c2c
	ld   l, SCRIPT_COUNTER2                                         ; $0c2d
	ld   a, [de]                                                    ; $0c2f
	inc  de                                                         ; $0c30
	ld   [hl], a                                                    ; $0c31

	jp   ProcessScriptsFromDE                                       ; $0c32


; [de] - counter
ScriptFunc18_SetCounter3:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0c35
	ld   h, a                                                       ; $0c37
	ld   l, SCRIPT_COUNTER3                                         ; $0c38
	ld   a, [de]                                                    ; $0c3a
	inc  de                                                         ; $0c3b
	ld   [hl], a                                                    ; $0c3c

	jp   ProcessScriptsFromDE                                       ; $0c3d


; [de/de+1] - word to jump if counter is non-0
ScriptFunc1a_DecCounter1_JNE:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0c40
	ld   h, a                                                       ; $0c42
	ld   l, SCRIPT_COUNTER1                                         ; $0c43
	dec  [hl]                                                       ; $0c45
	jr   nz, ScriptFunc20_Jump                                      ; $0c46

; Skip word when counter == 0
	inc  de                                                         ; $0c48
	inc  de                                                         ; $0c49
	jp   ProcessScriptsFromDE                                       ; $0c4a


; [de/de+1] - word to jump if counter is non-0
ScriptFunc1c_DecCounter2_JNE:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0c4d
	ld   h, a                                                       ; $0c4f
	ld   l, SCRIPT_COUNTER2                                         ; $0c50
	dec  [hl]                                                       ; $0c52
	jr   nz, ScriptFunc20_Jump                                      ; $0c53

; Skip word when counter == 0
:	inc  de                                                         ; $0c55
	inc  de                                                         ; $0c56
	jp   ProcessScriptsFromDE                                       ; $0c57


; [de/de+1] - word to jump if counter is non-0
ScriptFunc1e_DecCounter3_JNE:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0c5a
	ld   h, a                                                       ; $0c5c
	ld   l, SCRIPT_COUNTER3                                         ; $0c5d
	dec  [hl]                                                       ; $0c5f
	jr   z, :-                                                      ; $0c60

; [de/de+1] - addr
ScriptFunc20_Jump:
; Process scripts from param
	ld   l, e                                                       ; $0c62
	ld   h, d                                                       ; $0c63
	ld   e, [hl]                                                    ; $0c64
	inc  hl                                                         ; $0c65
	ld   d, [hl]                                                    ; $0c66

	jp   ProcessScriptsFromDE                                       ; $0c67


ScriptFunc22_CallWithSingleUseRet:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0c6a
	ld   h, a                                                       ; $0c6c
	ld   l, SCRIPT_STACK_SINGLE_USE_ADDR                            ; $0c6d

:
; Param word in AC (becomes jump addr)
	ld   a, [de]                                                    ; $0c6f
	inc  de                                                         ; $0c70
	ld   c, a                                                       ; $0c71
	ld   a, [de]                                                    ; $0c72

; Store return addr in stack
	inc  de                                                         ; $0c73
	ld   [hl], e                                                    ; $0c74
	inc  l                                                          ; $0c75
	ld   [hl], d                                                    ; $0c76

	ld   e, c                                                       ; $0c77
	ld   d, a                                                       ; $0c78
	jp   ProcessScriptsFromDE                                       ; $0c79


; [de/de+1] - addr
ScriptFunc24_Call:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0c7c

; Pre-inc SP
	ld   h, a                                                       ; $0c7e
	ld   l, SCRIPT_SP                                               ; $0c7f
	ld   a, [hl]                                                    ; $0c81
	add  $02                                                        ; $0c82
	ld   [hl], a                                                    ; $0c84
	ld   l, a                                                       ; $0c85
	jr   :-                                                         ; $0c86


ScriptFunc26_SingleUseRet:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0c88
	ld   h, a                                                       ; $0c8a
	ld   l, SCRIPT_STACK_SINGLE_USE_ADDR                            ; $0c8b

	ld   e, [hl]                                                    ; $0c8d
	inc  l                                                          ; $0c8e
	ld   d, [hl]                                                    ; $0c8f

	jp   ProcessScriptsFromDE                                       ; $0c90


ScriptFunc28_Ret:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0c93

; Get offset for return address
	ld   h, a                                                       ; $0c95
	ld   l, SCRIPT_SP                                               ; $0c96
	ld   a, [hl]                                                    ; $0c98

; Post-dec SP
	dec  [hl]                                                       ; $0c99
	dec  [hl]                                                       ; $0c9a
	ld   l, a                                                       ; $0c9b
	ld   e, [hl]                                                    ; $0c9c
	inc  l                                                          ; $0c9d
	ld   d, [hl]                                                    ; $0c9e

	jp   ProcessScriptsFromDE                                       ; $0c9f


; [de/de+1] - jump table address
; [de+2/de+3] - address containing jump table idx
ScriptFunc2a_CallTableIdxInAddr:
; 1st param word in BC
	ld   a, [de]                                                    ; $0ca2
	inc  de                                                         ; $0ca3
	ld   c, a                                                       ; $0ca4
	ld   a, [de]                                                    ; $0ca5
	inc  de                                                         ; $0ca6
	ld   b, a                                                       ; $0ca7

; 2nd param word in HL
	ld   a, [de]                                                    ; $0ca8
	inc  de                                                         ; $0ca9
	ld   l, a                                                       ; $0caa
	ld   a, [de]                                                    ; $0cab
	inc  de                                                         ; $0cac
	ld   h, a                                                       ; $0cad

; Get byte in it
	ld   a, [hl]                                                    ; $0cae

; Single-use stack return address is after the above 2 words
	ld   hl, hCurrScriptStructHighByte                              ; $0caf

	ld   h, [hl]                                                    ; $0cb2
	ld   l, SCRIPT_STACK_SINGLE_USE_ADDR                            ; $0cb3
	ld   [hl], e                                                    ; $0cb5
	inc  l                                                          ; $0cb6
	ld   [hl], d                                                    ; $0cb7

; 2 * byte in 2nd param word is added onto BC
	add  a                                                          ; $0cb8
	ld   l, a                                                       ; $0cb9
	ld   h, $00                                                     ; $0cba
	add  hl, bc                                                     ; $0cbc

; That is the value to jump to
	ld   e, [hl]                                                    ; $0cbd
	inc  hl                                                         ; $0cbe
	ld   d, [hl]                                                    ; $0cbf

	jp   ProcessScriptsFromDE                                       ; $0cc0


; [de/de+1] - jump table address
; [de+2/] - struct byte containing jump table idx
ScriptFunc2c_CallTableIdxInStructByte:
; 1st param word in BC
	ld   a, [de]                                                    ; $0cc3
	inc  de                                                         ; $0cc4
	ld   c, a                                                       ; $0cc5
	ld   a, [de]                                                    ; $0cc6
	inc  de                                                         ; $0cc7
	ld   b, a                                                       ; $0cc8

; Byte param after is struct byte in A
	ld   a, [de]                                                    ; $0cc9
	inc  de                                                         ; $0cca
	ld   l, a                                                       ; $0ccb
	ldh  a, [hCurrScriptStructHighByte]                             ; $0ccc
	ld   h, a                                                       ; $0cce
	ld   a, [hl]                                                    ; $0ccf

; Store address after in single-use stack
	ld   l, SCRIPT_STACK_SINGLE_USE_ADDR                            ; $0cd0
	ld   [hl], e                                                    ; $0cd2
	inc  l                                                          ; $0cd3
	ld   [hl], d                                                    ; $0cd4

; 2 * byte in 2nd param word is added onto BC
	add  a                                                          ; $0cd5
	ld   l, a                                                       ; $0cd6
	ld   h, $00                                                     ; $0cd7
	add  hl, bc                                                     ; $0cd9


; That is the value to jump to
	ld   e, [hl]                                                    ; $0cda
	inc  hl                                                         ; $0cdb
	ld   d, [hl]                                                    ; $0cdc

	jp   ProcessScriptsFromDE                                       ; $0cdd


ScriptFunc2e_ClearSubscriptsAndStack:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0ce0
	ld   h, a                                                       ; $0ce2

	xor  a                                                          ; $0ce3
	ld   l, SCRIPT_BANK_SUB1                                        ; $0ce4
	ld   [hl], a                                                    ; $0ce6
	ld   l, SCRIPT_BANK_SUB2                                        ; $0ce7
	ld   [hl], a                                                    ; $0ce9
	ld   l, SCRIPT_SP                                               ; $0cea
	ld   [hl], SCRIPT_STACK-2                                       ; $0cec

	jp   ProcessScriptsFromDE                                       ; $0cee


; [de] - other script's high byte
; [de+1] - source bank
; [de+2/de+3] - source addr
ScriptFunc30_CreateOtherScript:
	ld   c, SCRIPT_BANK_MAIN                                        ; $0cf1

; Param 1 is high byte (script struct idx)
	ld   a, [de]                                                    ; $0cf3
	inc  de                                                         ; $0cf4
	ld   b, a                                                       ; $0cf5

; Jump if script is running
	ld   a, [bc]                                                    ; $0cf6
	or   a                                                          ; $0cf7
	jr   nz, .setScriptDetails                                      ; $0cf8

; If not, inc num scripts
	ld   hl, wNumScripts                                            ; $0cfa
	inc  [hl]                                                       ; $0cfd

; If current script idx < script idx being created..
	ldh  a, [hCurrScriptStructHighByte]                             ; $0cfe
	cp   b                                                          ; $0d00
	jr   nc, .setScriptDetails                                      ; $0d01

; Inc wNumScriptsCounter so that it, and scripts after, run
	inc  l                                                          ; $0d03
	inc  [hl]                                                       ; $0d04

.setScriptDetails:
; Param 2 is bank
	ld   a, [de]                                                    ; $0d05
	inc  de                                                         ; $0d06
	ld   [bc], a                                                    ; $0d07
	inc  c                                                          ; $0d08

; Delay set to 1
	ld   a, $01                                                     ; $0d09
	ld   [bc], a                                                    ; $0d0b
	inc  c                                                          ; $0d0c

; Param word after is address
	ld   a, [de]                                                    ; $0d0d
	inc  de                                                         ; $0d0e
	ld   [bc], a                                                    ; $0d0f
	inc  c                                                          ; $0d10
	ld   a, [de]                                                    ; $0d11
	inc  de                                                         ; $0d12
	ld   [bc], a                                                    ; $0d13

	jp   ProcessScriptsFromDE                                       ; $0d14


ScriptFunc32_StopCurrScript:
	ld   hl, wNumScripts                                            ; $0d17
	dec  [hl]                                                       ; $0d1a
	ldh  a, [hCurrScriptStructHighByte]                             ; $0d1b
	ld   h, a                                                       ; $0d1d
	ld   l, SCRIPT_BANK_MAIN                                        ; $0d1e
	ld   [hl], $00                                                  ; $0d20
	ret                                                             ; $0d22


; [de] - other script struct high byte
ScriptFunc34_StopOtherScript:
	ld   c, SCRIPT_BANK_MAIN                                        ; $0d23

; Param 1 is high byte of other script
	ld   a, [de]                                                    ; $0d25
	inc  de                                                         ; $0d26
	ld   b, a                                                       ; $0d27

; If already 0, exit
	ld   a, [bc]                                                    ; $0d28
	or   a                                                          ; $0d29
	jp   z, ProcessScriptsFromDE                                    ; $0d2a

; Else decrease num scripts
	ld   hl, wNumScripts                                            ; $0d2d
	dec  [hl]                                                       ; $0d30

; If our script idx < the other script idx..
	ldh  a, [hCurrScriptStructHighByte]                             ; $0d31
	cp   b                                                          ; $0d33
	jr   nc, .stopOtherScript                                       ; $0d34

; Dec wNumScriptsCounter, so that 1 less script runs
	inc  l                                                          ; $0d36
	dec  [hl]                                                       ; $0d37

.stopOtherScript:
	xor  a                                                          ; $0d38
	ld   [bc], a                                                    ; $0d39
	jp   ProcessScriptsFromDE                                       ; $0d3a


; [de] - bank
; [de+1/de+2] - addr
ScriptFunc36_StartSubScript1:
	ld   l, SCRIPT_BANK_SUB1                                        ; $0d3d

; Set for relevant script struct
:	ldh  a, [hCurrScriptStructHighByte]                             ; $0d3f
	ld   h, a                                                       ; $0d41

; 1st param into subscript bank
	ld   a, [de]                                                    ; $0d42
	inc  de                                                         ; $0d43
	ld   [hl+], a                                                   ; $0d44

; Delay = 1 (run immediately)
	ld   [hl], $01                                                  ; $0d45

; Next param word is addr of sub script
	inc  l                                                          ; $0d47
	ld   a, [de]                                                    ; $0d48
	inc  de                                                         ; $0d49
	ld   [hl+], a                                                   ; $0d4a

	ld   a, [de]                                                    ; $0d4b
	inc  de                                                         ; $0d4c
	ld   [hl], a                                                    ; $0d4d

	jp   ProcessScriptsFromDE                                       ; $0d4e


ScriptFunc38_StopSubScript1:
; For current script struct, clear bank (prevents running it)
	ldh  a, [hCurrScriptStructHighByte]                             ; $0d51
	ld   h, a                                                       ; $0d53
	ld   l, SCRIPT_BANK_SUB1                                        ; $0d54
	ld   [hl], $00                                                  ; $0d56

	jp   ProcessScriptsFromDE                                       ; $0d58


; [de] - bank
; [de+1/de+2] - addr
ScriptFunc3a_StartSubScript2:
	ld   l, SCRIPT_BANK_SUB2                                        ; $0d5b
	jr   :-                                                         ; $0d5d


ScriptFunc3c_StopSubScript2:
; For current script struct, clear bank (prevents running it)
	ldh  a, [hCurrScriptStructHighByte]                             ; $0d5f
	ld   h, a                                                       ; $0d61
	ld   l, SCRIPT_BANK_SUB2                                        ; $0d62
	ld   [hl], $00                                                  ; $0d64
	jp   ProcessScriptsFromDE                                       ; $0d66


ScriptFunc3e_TurnOnLCD:
	call TurnOnLCD                                                  ; $0d69
	jp   ProcessScriptsFromDE                                       ; $0d6c


ScriptFunc40_TurnOffLCD:
	call TurnOffLCD                                                 ; $0d6f
	jp   ProcessScriptsFromDE                                       ; $0d72


ScriptFunc42_Unused_GetBCfrom2ndWord:
; 1st param word in DE
	ld   l, e                                                       ; $0d75
	ld   h, d                                                       ; $0d76

	ld   a, [hl+]                                                   ; $0d77
	ld   e, a                                                       ; $0d78
	ld   a, [hl+]                                                   ; $0d79
	ld   d, a                                                       ; $0d7a

; Next byte param in B
	ld   a, [hl+]                                                   ; $0d7b
	ld   b, a                                                       ; $0d7c

; Next word param in AC (later HL)
	ld   a, [hl+]                                                   ; $0d7d
	ld   c, a                                                       ; $0d7e
	ld   a, [hl+]                                                   ; $0d7f

; Push so that ProcessScripts func takes us past 5 param bytes
	push hl                                                         ; $0d80

; A, H, L are all trashed, only B (3rd byte) and C (4th byte) are retained
	ld   l, c                                                       ; $0d81
	ld   h, a                                                       ; $0d82

; Set script bank to same as scripts
	ldh  a, [hCurrScriptStructHighByte]                             ; $0d83
	ld   h, a                                                       ; $0d85
	ld   l, SCRIPT_BANK_MAIN                                        ; $0d86
	ld   a, [hl]                                                    ; $0d88
	call SetRomBank1stHalfOfRom                                     ; $0d89

	jp   ProcessScriptsFromCurrLoc                                  ; $0d8c


ScriptFunc44_UnsetSpriteSpec:
; Setting high byte to 0 prevents it from sending to wOam
	ldh  a, [hCurrScriptStructHighByte]                             ; $0d8f
	ld   h, a                                                       ; $0d91
	ld   l, SCRIPT_SPRITE_ADDR+1                                    ; $0d92
	ld   [hl], $00                                                  ; $0d94

	jp   ProcessScriptsFromDE                                       ; $0d96


; [de] - high byte of other script struct
ScriptFunc46_UnsetOtherSpriteSpec:
	ld   a, [de]                                                    ; $0d99
	inc  de                                                         ; $0d9a
	ld   h, a                                                       ; $0d9b
	ld   l, SCRIPT_SPRITE_ADDR+1                                    ; $0d9c
	ld   [hl], $00                                                  ; $0d9e

	jp   ProcessScriptsFromDE                                       ; $0da0


; [de/de+1] - addr
; [de+2] - bank
ScriptFunc48_FarSetSpriteSrc:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0da3
	ld   h, a                                                       ; $0da5
	ld   l, SCRIPT_SPRITE_ADDR                                      ; $0da6

	ld   a, [de]                                                    ; $0da8
	inc  de                                                         ; $0da9
	ld   [hl+], a                                                   ; $0daa

	ld   a, [de]                                                    ; $0dab
	inc  de                                                         ; $0dac
	ld   [hl+], a                                                   ; $0dad

; SCRIPT_SPRITE_BANK
	ld   a, [de]                                                    ; $0dae
	inc  de                                                         ; $0daf
	ld   [hl], a                                                    ; $0db0

	jp   ProcessScriptsFromDE                                       ; $0db1


; [de/de+1] - same bank source address of sprite's data
ScriptFunc4a_SetSpriteSrc:
; HL is current sprite addr
	ldh  a, [hCurrScriptStructHighByte]                             ; $0db4
	ld   h, a                                                       ; $0db6
	ld   l, SCRIPT_SPRITE_ADDR                                      ; $0db7

; Store word param in it
	ld   a, [de]                                                    ; $0db9
	inc  de                                                         ; $0dba
	ld   [hl+], a                                                   ; $0dbb

	ld   a, [de]                                                    ; $0dbc
	inc  de                                                         ; $0dbd
	ld   [hl+], a                                                   ; $0dbe

	jp   ProcessScriptsFromDE                                       ; $0dbf


; [de] - X
; [de+1] - Y
ScriptFunc4c_SetSpriteXY:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0dc2
	ld   h, a                                                       ; $0dc4
	ld   l, SCRIPT_SPRITE_X                                         ; $0dc5

	ld   a, [de]                                                    ; $0dc7
	inc  de                                                         ; $0dc8
	ld   [hl+], a                                                   ; $0dc9

; SCRIPT_SPRITE_Y
	ld   a, [de]                                                    ; $0dca
	inc  de                                                         ; $0dcb
	ld   [hl], a                                                    ; $0dcc

	jp   ProcessScriptsFromDE                                       ; $0dcd


; [de] - X
ScriptFunc4e_SetSpriteX:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0dd0
	ld   h, a                                                       ; $0dd2
	ld   l, SCRIPT_SPRITE_X                                         ; $0dd3

	ld   a, [de]                                                    ; $0dd5
	inc  de                                                         ; $0dd6
	ld   [hl], a                                                    ; $0dd7

	jp   ProcessScriptsFromDE                                       ; $0dd8


; [de] - Y
ScriptFunc50_SetSpriteY:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0ddb
	ld   h, a                                                       ; $0ddd
	ld   l, SCRIPT_SPRITE_Y                                         ; $0dde

	ld   a, [de]                                                    ; $0de0
	inc  de                                                         ; $0de1
	ld   [hl], a                                                    ; $0de2

	jp   ProcessScriptsFromDE                                       ; $0de3


; [de] - X offset
; [de+1] - Y offset
ScriptFunc52_AddToSpriteXY:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0de6
	ld   h, a                                                       ; $0de8
	ld   l, SCRIPT_SPRITE_X                                         ; $0de9

; 2 byte params are added to X, then Y
	ld   a, [de]                                                    ; $0deb
	inc  de                                                         ; $0dec
	add  [hl]                                                       ; $0ded
	ld   [hl+], a                                                   ; $0dee

	ld   a, [de]                                                    ; $0def
	inc  de                                                         ; $0df0
	add  [hl]                                                       ; $0df1
	ld   [hl], a                                                    ; $0df2

	jp   ProcessScriptsFromDE                                       ; $0df3


; [de] - X offset
ScriptFunc54_AddToSpriteX:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0df6
	ld   h, a                                                       ; $0df8
	ld   l, SCRIPT_SPRITE_X                                         ; $0df9

; Add param to sprite X
	ld   a, [de]                                                    ; $0dfb
	inc  de                                                         ; $0dfc
	add  [hl]                                                       ; $0dfd
	ld   [hl], a                                                    ; $0dfe

	jp   ProcessScriptsFromDE                                       ; $0dff


; [de] - Y offset
ScriptFunc56_AddToSpriteY:
	ldh  a, [hCurrScriptStructHighByte]                             ; $0e02
	ld   h, a                                                       ; $0e04
	ld   l, SCRIPT_SPRITE_Y                                         ; $0e05

; Add param to sprite X
	ld   a, [de]                                                    ; $0e07
	inc  de                                                         ; $0e08
	add  [hl]                                                       ; $0e09
	ld   [hl], a                                                    ; $0e0a

	jp   ProcessScriptsFromDE                                       ; $0e0b


; [de] - sound index
ScriptFunc58_PlaySound:
; Call PlaySound with param
	ld   a, [de]                                                    ; $0e0e
	inc  de                                                         ; $0e0f

	push af                                                         ; $0e10
	push bc                                                         ; $0e11
	push de                                                         ; $0e12
	push hl                                                         ; $0e13
	call PlaySound                                                  ; $0e14
	pop  hl                                                         ; $0e17
	pop  de                                                         ; $0e18
	pop  bc                                                         ; $0e19
	pop  af                                                         ; $0e1a

; Continue the script from the right rom bank
	ldh  a, [hCurrScriptStructHighByte]                             ; $0e1b
	ld   h, a                                                       ; $0e1d
	ld   l, SCRIPT_BANK_MAIN                                        ; $0e1e
	ld   a, [hl]                                                    ; $0e20
	call SetRomBank1stHalfOfRom                                     ; $0e21

	jp   ProcessScriptsFromDE                                       ; $0e24


; [de/de+1] - addr
ScriptFunc5a_CallAsm:
; ret from asm process more scripts
	ld   hl, ProcessScriptsFromDE                                   ; $0e27
	push hl                                                         ; $0e2a

; Jump to word from param
	ld   a, [de]                                                    ; $0e2b
	inc  de                                                         ; $0e2c
	ld   l, a                                                       ; $0e2d
	ld   a, [de]                                                    ; $0e2e
	inc  de                                                         ; $0e2f
	ld   h, a                                                       ; $0e30
	jp   hl                                                         ; $0e31


ScriptFunc5c_ExecAsmBelow:
	ld   l, e                                                       ; $0e32
	ld   h, d                                                       ; $0e33
	jp   hl                                                         ; $0e34


SECTION "Script pointers and engine", ROM0[$3f00]

ScriptPointers:
	dw ScriptFunc00_ResumeNextFrame
	dw ScriptFunc02_SetDelay
	dw ScriptFunc04_StoreByteInAddr
	dw ScriptFunc06_StoreWordInAddr
	dw ScriptFunc08_StoreByteInStruct
	dw ScriptFunc0a_StoreByteFromWord1InWord2
	dw ScriptFunc0c_StoreByteFromWordInStruct
	dw ScriptFunc0e_StoreStructByteInAddr
	dw ScriptFunc10_ValInAddrPlusEquByte
	dw ScriptFunc12_StructByteAddByte
	dw ScriptFunc14_SetCounter1
	dw ScriptFunc16_SetCounter2
	dw ScriptFunc18_SetCounter3
	dw ScriptFunc1a_DecCounter1_JNE
	dw ScriptFunc1c_DecCounter2_JNE
	dw ScriptFunc1e_DecCounter3_JNE
	dw ScriptFunc20_Jump
	dw ScriptFunc22_CallWithSingleUseRet
	dw ScriptFunc24_Call
	dw ScriptFunc26_SingleUseRet
	dw ScriptFunc28_Ret
	dw ScriptFunc2a_CallTableIdxInAddr
	dw ScriptFunc2c_CallTableIdxInStructByte
	dw ScriptFunc2e_ClearSubscriptsAndStack
	dw ScriptFunc30_CreateOtherScript
	dw ScriptFunc32_StopCurrScript
	dw ScriptFunc34_StopOtherScript
	dw ScriptFunc36_StartSubScript1
	dw ScriptFunc38_StopSubScript1
	dw ScriptFunc3a_StartSubScript2
	dw ScriptFunc3c_StopSubScript2
	dw ScriptFunc3e_TurnOnLCD
	dw ScriptFunc40_TurnOffLCD
	dw ScriptFunc42_Unused_GetBCfrom2ndWord
	dw ScriptFunc44_UnsetSpriteSpec
	dw ScriptFunc46_UnsetOtherSpriteSpec
	dw ScriptFunc48_FarSetSpriteSrc
	dw ScriptFunc4a_SetSpriteSrc
	dw ScriptFunc4c_SetSpriteXY
	dw ScriptFunc4e_SetSpriteX
	dw ScriptFunc50_SetSpriteY
	dw ScriptFunc52_AddToSpriteXY
	dw ScriptFunc54_AddToSpriteX
	dw ScriptFunc56_AddToSpriteY
	dw ScriptFunc58_PlaySound
	dw ScriptFunc5a_CallAsm
	dw ScriptFunc5c_ExecAsmBelow
	
	
RunScriptEngine::
; Exit if no scripts
	ld   a, [wNumScripts]                                           ; $3f5e
	or   a                                                          ; $3f61
	ret  z                                                          ; $3f62

; Set counter for num loops
	ld   [wNumScriptsCounter], a                                    ; $3f63

; Start from script 0 (dec, then inc)
	ld   a, HIGH(PAGE_0)-1                                          ; $3f66
	ldh  [hCurrScriptStructHighByte], a                             ; $3f68

.nextScript:
	ld   hl, hCurrScriptStructHighByte                              ; $3f6a
	inc  [hl]                                                       ; $3f6d

; --
; -- Main script
; --
	ld   h, [hl]                                                    ; $3f6e
	ld   l, SCRIPT_BANK_MAIN                                        ; $3f6f

; If no bank specified, try next script
	ld   a, [hl]                                                    ; $3f71
	or   a                                                          ; $3f72
	jp   z, .nextScript                                             ; $3f73

; Check delay, skipping executing the script until delay is 0
	inc  l                                                          ; $3f76
	ld   b, [hl]                                                    ; $3f77
	dec  b                                                          ; $3f78
	jp   nz, .setMainDelay                                          ; $3f79

; Set bank, and put script address in DE
	call SetRomBank1stHalfOfRom                                     ; $3f7c
	inc  l                                                          ; $3f7f
	ld   e, [hl]                                                    ; $3f80
	inc  l                                                          ; $3f81
	ld   d, [hl]                                                    ; $3f82

	call ProcessScriptsFromDE                                       ; $3f83

; Update script address
	ldh  a, [hCurrScriptStructHighByte]                             ; $3f86
	ld   h, a                                                       ; $3f88
	ld   l, SCRIPT_ADDR_MAIN+1                                      ; $3f89
	ld   [hl], d                                                    ; $3f8b
	dec  l                                                          ; $3f8c
	ld   [hl], e                                                    ; $3f8d
	dec  l                                                          ; $3f8e

.setMainDelay:
; For scripts that return, B is the delay
	ld   [hl], b                                                    ; $3f8f

; --
; -- Sub-Script 1
; --
; Repeat what was done for sub-script 1
	ld   l, SCRIPT_BANK_SUB1                                        ; $3f90
	ld   a, [hl]                                                    ; $3f92
	or   a                                                          ; $3f93
	jp   z, .processSubScript2                                      ; $3f94

	inc  l                                                          ; $3f97
	ld   b, [hl]                                                    ; $3f98
	dec  b                                                          ; $3f99
	jp   nz, .setSub1Delay                                          ; $3f9a

	call SetRomBank1stHalfOfRom                                     ; $3f9d
	inc  l                                                          ; $3fa0
	ld   e, [hl]                                                    ; $3fa1
	inc  l                                                          ; $3fa2
	ld   d, [hl]                                                    ; $3fa3

	call ProcessScriptsFromDE                                       ; $3fa4

	ldh  a, [hCurrScriptStructHighByte]                             ; $3fa7
	ld   h, a                                                       ; $3fa9
	ld   l, SCRIPT_ADDR_SUB1+1                                      ; $3faa
	ld   [hl], d                                                    ; $3fac
	dec  l                                                          ; $3fad
	ld   [hl], e                                                    ; $3fae
	dec  l                                                          ; $3faf

.setSub1Delay:
	ld   [hl], b                                                    ; $3fb0

.processSubScript2:
; --
; -- Sub-Script 2
; --
; Repeat what was done for sub-script 2
	ld   l, SCRIPT_BANK_SUB2                                        ; $3fb1
	ld   a, [hl]                                                    ; $3fb3
	or   a                                                          ; $3fb4
	jp   z, .toNextScript                                           ; $3fb5

	inc  l                                                          ; $3fb8
	ld   b, [hl]                                                    ; $3fb9
	dec  b                                                          ; $3fba
	jp   nz, .setSub2Delay                                          ; $3fbb

	call SetRomBank1stHalfOfRom                                     ; $3fbe
	inc  l                                                          ; $3fc1
	ld   e, [hl]                                                    ; $3fc2
	inc  l                                                          ; $3fc3
	ld   d, [hl]                                                    ; $3fc4

	call ProcessScriptsFromDE                                       ; $3fc5

	ldh  a, [hCurrScriptStructHighByte]                             ; $3fc8
	ld   h, a                                                       ; $3fca
	ld   l, SCRIPT_ADDR_SUB2+1                                      ; $3fcb
	ld   [hl], d                                                    ; $3fcd
	dec  l                                                          ; $3fce
	ld   [hl], e                                                    ; $3fcf
	dec  l                                                          ; $3fd0

.setSub2Delay:
	ld   [hl], b                                                    ; $3fd1

.toNextScript:
	ld   hl, wNumScriptsCounter                                     ; $3fd2
	dec  [hl]                                                       ; $3fd5
	jp   nz, .nextScript                                            ; $3fd6

	ret                                                             ; $3fd9
