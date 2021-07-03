; Disassembly of "Densha de Go! 2 (Japan).gbc"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "includes.s"

SECTION "RST $00", ROM0[$0]

JumpTableTrashDE::
	jp   JumpTableTrashDE_def                                       ; $0000


SECTION "RST $18", ROM0[$18]

JumpTablePreserveDE::
	jp   JumpTablePreserveDE_def                                    ; $0018


SECTION "VBlank Interrupt", ROM0[$40]

VBlankInterrupt::
	jp   VBlankInterruptHandler                                     ; $0040


SECTION "LCDC Interrupt", ROM0[$48]

LCDCInterrupt::
	jp   LCDCInterruptHandler                                       ; $0048


SECTION "Timer Interrupt", ROM0[$50]

TimerOverflowInterrupt::
	reti                                                            ; $0050


SECTION "Serial Interrupt", ROM0[$58]

SerialTransferCompleteInterrupt::
	jp   SerialTransferInterruptHandler                             ; $0058


SECTION "Joypad Interrupt", ROM0[$60]

JoypadTransitionInterrupt::
	reti                                                            ; $0060


SECTION "Boot", ROM0[$100]

Boot::
	nop                                                             ; $0100
	jp   Begin                                                      ; $0101


SECTION "Begin", ROM0[$150]

Begin:
; Set 2 in C if GBC
	cp   $11                                                        ; $0150
	ld   a, $00                                                     ; $0152
	jr   nz, :+                                                     ; $0154
	ld   a, $02                                                     ; $0156
:	ld   c, a                                                       ; $0158

; Clear all hram
	ld   hl, _HRAM                                                  ; $0159
	ld   b, $7f                                                     ; $015c
	xor  a                                                          ; $015e
:	ld   [hl+], a                                                   ; $015f
	dec  b                                                          ; $0160
	jr   nz, :-                                                     ; $0161

; Store GBC
	ld   a, c                                                       ; $0163
	ldh  [h2IfGBC], a                                               ; $0164

; Init
	ld   sp, hStackTop                                              ; $0166
	call TurnOffLCD                                                 ; $0169
	di                                                              ; $016c
	xor  a                                                          ; $016d
	ldh  [rIF], a                                                   ; $016e
	ldh  [rIE], a                                                   ; $0170
	ldh  [rSCY], a                                                  ; $0172
	ldh  [rSCX], a                                                  ; $0174
	ld   [wSCY], a                                                  ; $0176
	ld   [wSCX], a                                                  ; $0179

; LCDC interrupt during hblank
	ld   a, STATF_MODE00                                            ; $017c
	ldh  [rSTAT], a                                                 ; $017e

; Clear wram banks 0 and 1
	ld   a, $01                                                     ; $0180
	ldh  [rSVBK], a                                                 ; $0182
	ld   hl, _RAM                                                   ; $0184
	ld   de, $dfff                                                  ; $0187
	ld   b, $00                                                     ; $018a
	inc  de                                                         ; $018c
	call SetB_HLtoDE                                                ; $018d

; Clear wram banks 2-7
DEF WRAM_BANK_TO_CLEAR = 2
rept 6
	ld   a, WRAM_BANK_TO_CLEAR                                      ; $0190
	ldh  [rSVBK], a                                                 ; $0192
	ld   hl, _RAM+$1000                                             ; $0194
	ld   de, $dfff                                                  ; $0197
	ld   b, $00                                                     ; $019a
	inc  de                                                         ; $019c
	call SetB_HLtoDE                                                ; $019d
WRAM_BANK_TO_CLEAR = WRAM_BANK_TO_CLEAR + 1
endr

	call CopyOamDmaFunc                                             ; $01f0

; Allow just vblank
	ld   a, IEF_VBLANK                                              ; $01f3
	ldh  [rIE], a                                                   ; $01f5

; Set initial stub vblank and lcdc funcs
	ld   a, LOW(StubInterruptFunc)                                  ; $01f7
	ld   [wVBlankInterruptFunc], a                                  ; $01f9
	ld   [wLCDCInterruptFunc], a                                    ; $01fc
	ld   a, HIGH(StubInterruptFunc)                                 ; $01ff
	ld   [wVBlankInterruptFunc+1], a                                ; $0201
	ld   [wLCDCInterruptFunc+1], a                                  ; $0204

; Init audio regs and structs
	CallFromBank0 InitAudio

; Final branch based on if GBC
	ei                                                              ; $020f
	ldh  a, [h2IfGBC]                                               ; $0210
	cp   $02                                                        ; $0212
	jp   z, .startGBC                                               ; $0214

; --
; -- DMG
; --
; Load tile data
	ld   de, _VRAM                                                  ; $0217
	ld   bc, Gfx_DMG.end-Gfx_DMG                                    ; $021a
	ld   a, $00                                                     ; $021d
	ldh  [rVBK], a                                                  ; $021f
	ld   a, BANK(Gfx_DMG)                                           ; $0221
	ld   hl, Gfx_DMG                                                ; $0223
	call FarMemCopy                                                 ; $0226

; Load tile map
	ld   de, _SCRN0                                                 ; $0229
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $022c
	ld   hl, TileMap_DMG                                            ; $022f
	ld   a, BANK(TileMap_DMG)                                       ; $0232
	call FarRectCopy                                                ; $0234

; HW regs to be set during inf loop
	ld   a, %00011011                                               ; $0237
	ldh  [rBGP], a                                                  ; $0239
	ld   a, $00                                                     ; $023b
	ldh  [rIF], a                                                   ; $023d
	ld   a, IEF_VBLANK                                              ; $023f
	ldh  [rIE], a                                                   ; $0241
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $0243
	ldh  [rLCDC], a                                                 ; $0245

; DMG infinite loop
:	jr   :-                                                         ; $0247

.startGBC:
; --
; -- GBC
; --
; Enable double speed
	xor  a                                                          ; $0249
	ldh  [rVBK], a                                                  ; $024a
	ldh  [rSVBK], a                                                 ; $024c
	ldh  [rRP], a                                                   ; $024e

; Jump if already set
	ldh  a, [rKEY1]                                                 ; $0250
	bit  7, a                                                       ; $0252
	jr   nz, .afterDoubleSpeed                                      ; $0254

	ld   a, $30                                                     ; $0256
	ldh  [rP1], a                                                   ; $0258
	ld   a, $01                                                     ; $025a
	ldh  [rKEY1], a                                                 ; $025c
	stop                                                            ; $025e

.afterDoubleSpeed:
; Init and clear scripts, oam and screens
	ld   a, $00                                                     ; $0260
	call SetRomBank1stHalfOfRom                                     ; $0262
	call InitScriptStructs                                          ; $0265
	call ClearScriptsOamHideAllOam                                  ; $0268
	call ClearScreens                                               ; $026b

; Reset printing state, and default it to medium exposure
	call ResetPrintingState                                         ; $026e
	ld   a, $02                                                     ; $0271
	ld   [wPrintTrainImageThinness], a                              ; $0273

; Check checksum, if it doesn't match, reset save data, else load it
	call CheckChecksum                                              ; $0276
	jr   z, .checksumMatch                                          ; $0279

	call ResetSaveData                                              ; $027b
	call SaveSaveData                                               ; $027e
	jr   .setIntroGameState                                         ; $0281

.checksumMatch:
	call LoadSaveData                                               ; $0283

.setIntroGameState:
; Then set 1st state
	ld   a, GS_INTRO_INIT                                           ; $0286
	ld   [wGameState], a                                            ; $0288
	ei                                                              ; $028b

MainLoop:
; Usual main loop funcs
	call UpdateRNG                                                  ; $028c
	call PollInputCheckingForDemo                                   ; $028f
	call HandleGameState                                            ; $0292
	call RunScriptEngine                                            ; $0295

; If hi-col, dont process palette fading, OAM stuff or sound (hi-col loop will do sound)
	ld   a, [wShouldUpdateHiColBGPalettes]                          ; $0298
	or   a                                                          ; $029b
	jr   nz, .afterHiColCheck                                       ; $029c

	call FadeAllPalettes                                            ; $029e
	call UpdateScriptsOam                                           ; $02a1
	call UpdateSound                                                ; $02a4

.afterHiColCheck:
	xor  a                                                          ; $02a7
	ld   [wMainLoopCanContinue], a                                  ; $02a8
:	ld   a, [wMainLoopCanContinue]                                  ; $02ab
	or   a                                                          ; $02ae
	jr   z, :-                                                      ; $02af

; Increase main loop counter
	ld   a, [wMainLoopCounter]                                      ; $02b1
	inc  a                                                          ; $02b4
	ld   [wMainLoopCounter], a                                      ; $02b5
	jp   MainLoop                                                   ; $02b8


VBlankInterruptHandler:
; Preserve regs and rom bank
	di                                                              ; $02bb
	push af                                                         ; $02bc
	push bc                                                         ; $02bd
	push de                                                         ; $02be
	push hl                                                         ; $02bf
	ld   a, [wRomBank]                                              ; $02c0
	push af                                                         ; $02c3

; Update scroll regs
	ld   a, [wSCX]                                                  ; $02c4
	ldh  [rSCX], a                                                  ; $02c7
	ld   a, [wSCY]                                                  ; $02c9
	ldh  [rSCY], a                                                  ; $02cc

; If hi-col, dont work alongside vblank requests, dont update palettes,
; and run usual vblank funcs
	ld   a, [wShouldUpdateHiColBGPalettes]                          ; $02ce
	or   a                                                          ; $02d1
	jr   nz, .afterHiColCheck                                       ; $02d2

; Jump if vblank interrupt called before main loop could reset this
; after all other main funcs
	ld   a, [wMainLoopCanContinue]                                  ; $02d4
	or   a                                                          ; $02d7
	jr   nz, .mainLoopHasntContinued                                ; $02d8

; Start with updating palettes
	call UpdateHWPalettes                                           ; $02da

.afterHiColCheck:
	ld   hl, .return                                                ; $02dd
	push hl                                                         ; $02e0
	ld   a, [wVBlankInterruptFunc]                                  ; $02e1
	ld   l, a                                                       ; $02e4
	ld   a, [wVBlankInterruptFunc+1]                                ; $02e5
	ld   h, a                                                       ; $02e8
	jp   hl                                                         ; $02e9

.return:
; Update window
	ld   a, [wWX]                                                   ; $02ea
	add  $07                                                        ; $02ed
	ldh  [rWX], a                                                   ; $02ef
	ld   a, [wWY]                                                   ; $02f1
	ldh  [rWY], a                                                   ; $02f4

; Don't update OAM during hi-col screens
	ld   a, [wShouldUpdateHiColBGPalettes]                          ; $02f6
	or   a                                                          ; $02f9
	call z, hOamDmaFunc                                             ; $02fa

; Main loop can execute its next set of funcs
	ld   a, $ff                                                     ; $02fd
	ld   [wMainLoopCanContinue], a                                  ; $02ff
	jr   .done                                                      ; $0302

.mainLoopHasntContinued:
; We're here because something has requested waiting until in vblank
	ld   a, [wRequestedVBlankFinished]                              ; $0304
	or   a                                                          ; $0307
	jr   z, .setVBlankEntered                                       ; $0308

.done:
; Restore rom bank and regs
	pop  af                                                         ; $030a
	call SetRomBank1stHalfOfRom                                     ; $030b
	pop  hl                                                         ; $030e
	pop  de                                                         ; $030f
	pop  bc                                                         ; $0310
	pop  af                                                         ; $0311
	ei                                                              ; $0312
	reti                                                            ; $0313

.setVBlankEntered:
	ld   a, $01                                                     ; $0314
	ld   [wRequestedVBlankFinished], a                              ; $0316

; Restore rom bank and regs
	pop  af                                                         ; $0319
	call SetRomBank1stHalfOfRom                                     ; $031a
	pop  hl                                                         ; $031d
	pop  de                                                         ; $031e
	pop  bc                                                         ; $031f
	pop  af                                                         ; $0320
	ei                                                              ; $0321
	reti                                                            ; $0322


LCDCInterruptHandler:
	di                                                              ; $0323
	push af                                                         ; $0324
	push hl                                                         ; $0325

; Set ret address
	ld   hl, .return                                                ; $0326
	push hl                                                         ; $0329

; Jump to actual LCDC func
	ld   a, [wLCDCInterruptFunc]                                    ; $032a
	ld   l, a                                                       ; $032d
	ld   a, [wLCDCInterruptFunc+1]                                  ; $032e
	ld   h, a                                                       ; $0331
	jp   hl                                                         ; $0332

.return:
	pop  hl                                                         ; $0333
	pop  af                                                         ; $0334
	ei                                                              ; $0335
	reti                                                            ; $0336


PollInputCheckingForDemo:
	ld   a, $00                                                     ; $0337
	call SetRomBank1stHalfOfRom                                     ; $0339
	call PollInput                                                  ; $033c
	call ProcessStickyButtons                                       ; $033f

; Get in-game buttons based on if demo is playing
	ld   a, [wIsDemo]                                               ; $0342
	or   a                                                          ; $0345
	jr   nz, .isDemo                                                ; $0346

	ld   a, [wButtonsPressed]                                       ; $0348
	ld   [wInGameButtonsPressed], a                                 ; $034b
	ret                                                             ; $034e

.isDemo:
; Load next key once only
	ld   a, [wDemoNextButtonsPressed]                               ; $034f
	ld   [wInGameButtonsPressed], a                                 ; $0352
	xor  a                                                          ; $0355
	ld   [wDemoNextButtonsPressed], a                               ; $0356
	ret                                                             ; $0359


ProcessStickyButtons:
; Start with reset sticky buttons
	xor  a                                                          ; $035a
	ld   [wStickyButtonsHeld], a                                    ; $035b

; If prev and curr buttons held not equal, or previous is 0,
; set current buttons held to previous, and start sticky counter
	ld   a, [wPrevButtonsHeld]                                      ; $035e
	ld   b, a                                                       ; $0361
	ld   a, [wButtonsHeld]                                          ; $0362
	cp   b                                                          ; $0365
	jr   nz, .startStickyCounter                                    ; $0366

	or   a                                                          ; $0368
	jr   z, .startStickyCounter                                     ; $0369

; ret with sticky buttons held = 0 if counter still going
	ld   a, [wStickyButtonCounter]                                  ; $036b
	dec  a                                                          ; $036e
	ld   [wStickyButtonCounter], a                                  ; $036f
	ret  nz                                                         ; $0372

; Otherwise set sticky buttons held appropriately
	ld   a, $04                                                     ; $0373
	ld   [wStickyButtonCounter], a                                  ; $0375
	ld   a, [wButtonsHeld]                                          ; $0378
	ld   [wStickyButtonsHeld], a                                    ; $037b
	ret                                                             ; $037e

.startStickyCounter:
	ld   [wStickyButtonsHeld], a                                    ; $037f
	ld   [wPrevButtonsHeld], a                                      ; $0382
	ld   a, $1e                                                     ; $0385
	ld   [wStickyButtonCounter], a                                  ; $0387
	ret                                                             ; $038a


StubInterruptFunc::
	ret                                                             ; $038b


SetB_HLtoDE::
:	ld   a, b                                                       ; $038c
	ld   [hl+], a                                                   ; $038d
	ld   a, h                                                       ; $038e
	cp   d                                                          ; $038f
	jr   nz, :-                                                     ; $0390

	ld   a, l                                                       ; $0392
	cp   e                                                          ; $0393
	jr   nz, :-                                                     ; $0394

	ret                                                             ; $0396


CopyOamDmaFunc:
	ld   c, LOW(hOamDmaFunc)                                        ; $0397
	ld   b, OamDmaFunc.end-OamDmaFunc                               ; $0399
	ld   hl, OamDmaFunc                                             ; $039b
:	ld   a, [hl+]                                                   ; $039e
	ldh  [c], a                                                     ; $039f
	inc  c                                                          ; $03a0
	dec  b                                                          ; $03a1
	jr   nz, :-                                                     ; $03a2

	ret                                                             ; $03a4


OamDmaFunc:
	ld   a, HIGH(wOam)                                              ; $03a5
	ldh  [rDMA], a                                                  ; $03a7
	ld   a, NUM_SPRITES                                             ; $03a9
:	dec  a                                                          ; $03ab
	jr   nz, :-                                                     ; $03ac

	ret                                                             ; $03ae
.end


JumpTableTrashDE_def:
	add  a                                                          ; $03af
	pop  hl                                                         ; $03b0
	ld   e, a                                                       ; $03b1
	ld   d, $00                                                     ; $03b2
	add  hl, de                                                     ; $03b4
	ld   e, [hl]                                                    ; $03b5
	inc  hl                                                         ; $03b6
	ld   d, [hl]                                                    ; $03b7
	push de                                                         ; $03b8
	pop  hl                                                         ; $03b9
	jp   hl                                                         ; $03ba


TurnOffLCD::
; Return if LCD already off
	di                                                              ; $03bb
	ldh  a, [rLCDC]                                                 ; $03bc
	bit  7, a                                                       ; $03be
	ret  z                                                          ; $03c0

; Preserve and reset IE
	ldh  a, [rIE]                                                   ; $03c1
	ld   [wPreservedIE], a                                          ; $03c3
	xor  a                                                          ; $03c6
	ldh  [rIE], a                                                   ; $03c7

; Wait until start-ish of vblank
:	ldh  a, [rLY]                                                   ; $03c9
	cp   $91                                                        ; $03cb
	jr   nz, :-                                                     ; $03cd

; Turn off LCD
	ldh  a, [rLCDC]                                                 ; $03cf
	and  $ff-LCDCF_ON                                               ; $03d1
	ldh  [rLCDC], a                                                 ; $03d3

; Restore IE
	ld   a, [wPreservedIE]                                          ; $03d5
	ldh  [rIE], a                                                   ; $03d8
	ret                                                             ; $03da


TurnOnLCD::
	ldh  a, [rLCDC]                                                 ; $03db
	or   LCDCF_ON                                                   ; $03dd
	ldh  [rLCDC], a                                                 ; $03df
	ei                                                              ; $03e1
	ret                                                             ; $03e2


ClearScreens:
	ld   hl, $9fff                                                  ; $03e3
	ld   bc, $a000-_SCRN0                                           ; $03e6
:	ld   a, $00                                                     ; $03e9
	ld   [hl-], a                                                   ; $03eb
	dec  bc                                                         ; $03ec
	ld   a, b                                                       ; $03ed
	or   c                                                          ; $03ee
	jr   nz, :-                                                     ; $03ef

	ret                                                             ; $03f1


; BC - num bytes
; DE - dest addr
; HL - source addr
MemCopy::
:	ld   a, [hl+]                                                   ; $03f2
	ld   [de], a                                                    ; $03f3
	inc  de                                                         ; $03f4
	dec  bc                                                         ; $03f5
	ld   a, b                                                       ; $03f6
	or   c                                                          ; $03f7
	jr   nz, :-                                                     ; $03f8

	ret                                                             ; $03fa


; unused - $03fb
; DE - dest
; HL - source
MemCopyBAndUpdateSoundInVBlank:
	waitForRequestedVBlank

:	ld   a, [hl+]                                                   ; $0408
	ld   [de], a                                                    ; $0409
	inc  de                                                         ; $040a
	dec  b                                                          ; $040b
	jr   nz, :-                                                     ; $040c

	call UpdateSound                                                ; $040e
	ret                                                             ; $0411


; A - bank
SetRomBank1stHalfOfRom::
	ld   [wRomBank], a                                              ; $0412
	ld   [ROMB0], a                                                 ; $0415
	xor  a                                                          ; $0418
	ld   [ROMB1], a                                                 ; $0419
	ret                                                             ; $041c


OffLCDClearScrollScreensSetPalettesToWhite:
	call TurnOffLCD                                                 ; $041d

	xor  a                                                          ; $0420
	ld   [wSCX], a                                                  ; $0421
	ld   [wSCY], a                                                  ; $0424

	call ClearScriptsOamHideAllOam                                  ; $0427

	ld   a, $00                                                     ; $042a
	ldh  [rVBK], a                                                  ; $042c
	call ClearScreens                                               ; $042e

	ld   a, $01                                                     ; $0431
	ldh  [rVBK], a                                                  ; $0433
	call ClearScreens                                               ; $0435

	call FillBGPalettesWithWhite                                    ; $0438
	call FillOBJPalettesWithWhite                                   ; $043b
	ret                                                             ; $043e


ClearScrollOamSetAllPalsAffectedByFade::
	xor  a                                                          ; $043f
	ld   [wSCX], a                                                  ; $0440
	ld   [wSCY], a                                                  ; $0443

	call ClearScriptsOamHideAllOam                                  ; $0446

; By default, fade all palettes
	ld   a, $ff                                                     ; $0449
	ld   [wBitsSetPerBGPaletteFade], a                              ; $044b
	ld   a, $ff                                                     ; $044e
	ld   [wBitsSetPerOBJPaletteFade], a                             ; $0450
	ret                                                             ; $0453


; A - starting palette
; B - num colors / 2, or num bytes / 4
; HL - source addr
LoadSomeBGPalettesStartingA:
; Palette A * 8 is starting idx
	add  a                                                          ; $0454
	add  a                                                          ; $0455
	add  a                                                          ; $0456
	or   XCPS_AUTO_INCREMENT                                        ; $0457
	ldh  [rBCPS], a                                                 ; $0459
	jr   :+                                                         ; $045b

; HL - source addr
LoadAllBGPalettes:
	ld   b, NUM_PALETTE_BYTES/4                                     ; $045d
	ld   a, XCPS_AUTO_INCREMENT                                     ; $045f
	ldh  [rBCPS], a                                                 ; $0461

:	ld   c, LOW(rBCPD)                                              ; $0463

.next4bytes:
rept 4
	ld   a, [hl+]                                                   ; $0465
	ldh  [c], a                                                     ; $0466
endr
	dec  b                                                          ; $046d
	jr   nz, .next4bytes                                            ; $046e

	ret                                                             ; $0470


FillBGPalettesWithWhite:
	ld   a, XCPS_AUTO_INCREMENT                                     ; $0471
	ldh  [rBCPS], a                                                 ; $0473
	ld   b, NUM_PALETTE_BYTES/4                                     ; $0475
	ld   c, LOW(rBCPD)                                              ; $0477

; Load 2 whites
	ld   a, $ff                                                     ; $0479
:	ldh  [c], a                                                     ; $047b
	ldh  [c], a                                                     ; $047c
	ldh  [c], a                                                     ; $047d
	ldh  [c], a                                                     ; $047e

	dec  b                                                          ; $047f
	jr   nz, :-                                                     ; $0480

	ret                                                             ; $0482


; HL - source addr
LoadAllOBJPalettes:
	ld   a, XCPS_AUTO_INCREMENT                                     ; $0483
	ldh  [rOCPS], a                                                 ; $0485
	ld   b, NUM_PALETTE_BYTES/4                                     ; $0487
	ld   c, LOW(rOCPD)                                              ; $0489

.next4bytes:
rept 4
	ld   a, [hl+]                                                   ; $048b
	ldh  [c], a                                                     ; $048c
endr
	dec  b                                                          ; $0493
	jr   nz, .next4bytes                                            ; $0494

	ret                                                             ; $0496


FillOBJPalettesWithWhite:
	ld   a, XCPS_AUTO_INCREMENT                                     ; $0497
	ldh  [rOCPS], a                                                 ; $0499
	ld   b, NUM_PALETTE_BYTES/4                                     ; $049b
	ld   c, LOW(rOCPD)                                              ; $049d

; Load 2 whites
	ld   a, $ff                                                     ; $049f
:	ldh  [c], a                                                     ; $04a1
	ldh  [c], a                                                     ; $04a2
	ldh  [c], a                                                     ; $04a3
	ldh  [c], a                                                     ; $04a4
	dec  b                                                          ; $04a5
	jr   nz, :-                                                     ; $04a6

	ret                                                             ; $04a8


UpdateHWPalettes:
; Prioritize ram palette load
	ld   a, [wLoadPalettesFromRam]                                  ; $04a9
	or   a                                                          ; $04ac
	jr   z, .afterRamLoadCheck                                      ; $04ad

	JumpFromBank0 SetHWPalettesFromRam

.afterRamLoadCheck:
; Check if loading BG palettes from rom
	ld   a, [wLoadBGPalettesFromRom]                                ; $04b7
	or   a                                                          ; $04ba
	jr   z, .afterRomLoadCheck                                      ; $04bb

	ld   a, [wBGPaletteBank]                                        ; $04bd
	call SetRomBank1stHalfOfRom                                     ; $04c0
	ld   a, [wBGPaletteAddr]                                        ; $04c3
	ld   l, a                                                       ; $04c6
	ld   a, [wBGPaletteAddr+1]                                      ; $04c7
	ld   h, a                                                       ; $04ca
	call LoadAllBGPalettes                                          ; $04cb

; Unset flag
	ld   a, $00                                                     ; $04ce
	ld   [wLoadBGPalettesFromRom], a                                ; $04d0

.afterRomLoadCheck:
; Repeat with OBJ palettes from rom
	ld   a, [wLoadOBJPalettesFromRom]                               ; $04d3
	or   a                                                          ; $04d6
	ret  z                                                          ; $04d7

	ld   a, [wOBJPaletteBank]                                       ; $04d8
	call SetRomBank1stHalfOfRom                                     ; $04db
	ld   a, [wOBJPaletteAddr]                                       ; $04de
	ld   l, a                                                       ; $04e1
	ld   a, [wOBJPaletteAddr+1]                                     ; $04e2
	ld   h, a                                                       ; $04e5
	call LoadAllOBJPalettes                                         ; $04e6

; Unset flag
	ld   a, $00                                                     ; $04e9
	ld   [wLoadOBJPalettesFromRom], a                               ; $04eb
	ret                                                             ; $04ee


; A - if fade should be applied
; BC - ram dest
; HL - rom source
FadePaletteColor:
; If A = 0 (bit check yielded unset), don't apply
	or   a                                                          ; $04ef
	jp   z, .done                                                   ; $04f0

; Value to fade by in D
	ld   a, [wPaletteFadeAmount]                                    ; $04f3
	ld   d, a                                                       ; $04f6

; Get byte containing red in low, store red-fade
	ld   a, [hl]                                                    ; $04f7
	and  $1f                                                        ; $04f8
	sub  d                                                          ; $04fa
	jr   nc, :+                                                     ; $04fb
	xor  a                                                          ; $04fd
:	ld   [bc], a                                                    ; $04fe

; Same byte has green in high (put in D), next byte has green in low
	ld   a, [hl+]                                                   ; $04ff
	and  $e0                                                        ; $0500
	ld   e, a                                                       ; $0502
	ld   a, [hl]                                                    ; $0503
	and  $03                                                        ; $0504

; Add together rotate to adjust correctly, then set green-fade
	add  e                                                          ; $0506
	rlca                                                            ; $0507
	rlca                                                            ; $0508
	rlca                                                            ; $0509
	sub  d                                                          ; $050a
	jr   nc, :+                                                     ; $050b
	xor  a                                                          ; $050d

; Shift green 3 left
:	add  a                                                          ; $050e
	add  a                                                          ; $050f
	add  a                                                          ; $0510
	ld   e, a                                                       ; $0511

; Get blue-fade
	ld   a, [hl+]                                                   ; $0512
	srl  a                                                          ; $0513
	srl  a                                                          ; $0515
	sub  d                                                          ; $0517
	jr   nc, :+                                                     ; $0518
	xor  a                                                          ; $051a

; Shift green and blue 2 left (both now have bits in correct place)
:	sla  e                                                          ; $051b
	adc  a                                                          ; $051d
	sla  e                                                          ; $051e
	adc  a                                                          ; $0520
	ld   d, a                                                       ; $0521

; Store red + green in 1st byte
	ld   a, [bc]                                                    ; $0522
	add  e                                                          ; $0523
	ld   [bc], a                                                    ; $0524
	inc  bc                                                         ; $0525

; Store green + blue in 2nd byte
	ld   a, d                                                       ; $0526
	ld   [bc], a                                                    ; $0527
	inc  bc                                                         ; $0528

; Fade next color in palette
	ld   a, $01                                                     ; $0529
	ret                                                             ; $052b

.done:
	inc  hl                                                         ; $052c
	inc  hl                                                         ; $052d
	inc  bc                                                         ; $052e
	inc  bc                                                         ; $052f
	xor  a                                                          ; $0530
	ret                                                             ; $0531


FadeAllPalettes:
; If loading from ram, set palettes in ram from rom with fades applied
	ld   a, [wLoadPalettesFromRam]                                  ; $0532
	or   a                                                          ; $0535
	ret  z                                                          ; $0536

; Get BG palettes source addr
	ld   a, [wBGPaletteBank]                                        ; $0537
	call SetRomBank1stHalfOfRom                                     ; $053a
	ld   a, [wBGPaletteAddr]                                        ; $053d
	ld   l, a                                                       ; $0540
	ld   a, [wBGPaletteAddr+1]                                      ; $0541
	ld   h, a                                                       ; $0544

; Apply fade per every bit set
	ld   bc, wBGPalettes                                            ; $0545
DEF BIT_TO_CHECK = 1
rept 8
	ld   a, [wBitsSetPerBGPaletteFade]                              ; $0548
	and  BIT_TO_CHECK                                               ; $054b
	call FadePaletteColor                                           ; $054d
	call FadePaletteColor                                           ; $0550
	call FadePaletteColor                                           ; $0553
	call FadePaletteColor                                           ; $0556
BIT_TO_CHECK = BIT_TO_CHECK << 1
endr

; Get OBJ palettes source addr
	ld   a, [wOBJPaletteBank]                                       ; $05d0
	call SetRomBank1stHalfOfRom                                     ; $05d3
	ld   a, [wOBJPaletteAddr]                                       ; $05d6
	ld   l, a                                                       ; $05d9
	ld   a, [wOBJPaletteAddr+1]                                     ; $05da
	ld   h, a                                                       ; $05dd

; Apply fade per every bit set
	ld   bc, wOBJPalettes                                           ; $05de
DEF BIT_TO_CHECK = 1
rept 8
	ld   a, [wBitsSetPerOBJPaletteFade]                             ; $05e1
	and  BIT_TO_CHECK                                               ; $05e4
	call FadePaletteColor                                           ; $05e6
	call FadePaletteColor                                           ; $05e9
	call FadePaletteColor                                           ; $05ec
	call FadePaletteColor                                           ; $05ef
BIT_TO_CHECK = BIT_TO_CHECK << 1
endr

	ret                                                             ; $0669


; A - rom bank
; B - rows
; C - columns
; DE - dest addr
; HL - source addr
FarRectCopy::
; Store rom bank param, and push current
	ldh  [hRomBank], a                                              ; $066a
	ld   a, [wRomBank]                                              ; $066c
	push af                                                         ; $066f

; Rect copy in param rom bank
	ldh  a, [hRomBank]                                              ; $0670
	call SetRomBank1stHalfOfRom                                     ; $0672
	call RectCopy                                                   ; $0675

; Preserve rom bank
	pop  af                                                         ; $0678
	call SetRomBank1stHalfOfRom                                     ; $0679
	ret                                                             ; $067c


; B - rows
; C - columns
; DE - dest addr
; HL - source addr
RectCopy:
.nextRow:
; Push orig cols, and current row counter
	push bc                                                         ; $067d
	push de                                                         ; $067e

.nextCol:
; Copy a byte
	ld   a, [hl+]                                                   ; $067f
	ld   [de], a                                                    ; $0680
	inc  e                                                          ; $0681
	dec  c                                                          ; $0682
	jr   nz, .nextCol                                               ; $0683

; Increase dest to the start of the next row
	pop  de                                                         ; $0685
	DEplusEquImm GB_TILE_WIDTH

; Dec row counter
	pop  bc                                                         ; $068e
	dec  b                                                          ; $068f
	jr   nz, .nextRow                                               ; $0690

	ret                                                             ; $0692


; A - bank
; B - rows
; C - cols
; DE - dest addr
; HL - source addr
FarRectCopyRowPerFrame::
	ldh  [hRomBank], a                                              ; $0693

; Preserve and set new rom bank
	ld   a, [wRomBank]                                              ; $0695
	push af                                                         ; $0698
	ldh  a, [hRomBank]                                              ; $0699
	call SetRomBank1stHalfOfRom                                     ; $069b

	call RectCopyRowPerFrame                                        ; $069e

	pop  af                                                         ; $06a1
	call SetRomBank1stHalfOfRom                                     ; $06a2
	ret                                                             ; $06a5


; B - rows
; C - cols
; DE - dest addr
; HL - source addr
RectCopyRowPerFrame:
.nextRow:
	push bc                                                         ; $06a6
	push de                                                         ; $06a7

; Mem copy in vblank
	waitForRequestedVBlank

; Copy for each column
.nextCol:
	ld   a, [hl+]                                                   ; $06b5
	ld   [de], a                                                    ; $06b6
	inc  e                                                          ; $06b7
	dec  c                                                          ; $06b8
	jr   nz, .nextCol                                               ; $06b9

; Keep sound going
	call UpdateSound                                                ; $06bb

; To next row
	pop  de                                                         ; $06be
	DEplusEquImm GB_TILE_WIDTH
	pop  bc                                                         ; $06c7
	dec  b                                                          ; $06c8
	jr   nz, .nextRow                                               ; $06c9

	ret                                                             ; $06cb


; B - X position
; C - Y position
; HL - source address of oam details
SaveOverrideableOamDetailsTo_wOam::
; DE = correct oam offset
	ldh  a, [hCurrScriptOamOffset]                                  ; $06cc
	ld   e, a                                                       ; $06ce
	ld   d, HIGH(wOam)                                              ; $06cf

.loop:
; Until $80 end marker is found, continue
	ld   a, [hl+]                                                   ; $06d1
	cp   $80                                                        ; $06d2
	jr   z, .done                                                   ; $06d4

; Add Y offset
	add  c                                                          ; $06d6
	ld   [de], a                                                    ; $06d7
	inc  e                                                          ; $06d8

; Add X offset
	ld   a, [hl+]                                                   ; $06d9
	add  b                                                          ; $06da
	ld   [de], a                                                    ; $06db
	inc  e                                                          ; $06dc

; Then store tile idx and attr
	ld   a, [hl+]                                                   ; $06dd
	ld   [de], a                                                    ; $06de
	inc  e                                                          ; $06df

	ld   a, [hl+]                                                   ; $06e0
	ld   [de], a                                                    ; $06e1
	inc  e                                                          ; $06e2
	jp   .loop                                                      ; $06e3

.done:
; Return oam offset, to save for next script struct
	ld   a, e                                                       ; $06e6
	ret                                                             ; $06e7


ConvertHLtoNybbleBCDinBC::
	ld   b, $00                                                     ; $06e8
	ld   de, -1000                                                  ; $06ea

; B = num 1000s (if not carry, we are less than 1000)
.loopSub1000:
	add  hl, de                                                     ; $06ed
	jr   nc, .do100s                                                ; $06ee

	inc  b                                                          ; $06f0
	jr   .loopSub1000                                               ; $06f1

.do100s:
; Get 100s in top digit, add back 1000, repeat for 100s digit
	swap b                                                          ; $06f3
	ld   de, 1000                                                   ; $06f5
	add  hl, de                                                     ; $06f8
	ld   de, -100                                                   ; $06f9

.loopSub100:
	add  hl, de                                                     ; $06fc
	jr   nc, .do10s                                                 ; $06fd

	inc  b                                                          ; $06ff
	jr   .loopSub100                                                ; $0700

.do10s:
; Repeat for 10s, now using C
	ld   de, 100                                                    ; $0702
	add  hl, de                                                     ; $0705
	ld   c, $00                                                     ; $0706
	ld   de, -10                                                    ; $0708

.loopSub10:
	add  hl, de                                                     ; $070b
	jr   nc, .do1s                                                  ; $070c

	inc  c                                                          ; $070e
	jr   .loopSub10                                                 ; $070f

.do1s:
; Get remainder and or with 10s
	swap c                                                          ; $0711
	ld   de, 10                                                     ; $0713
	add  hl, de                                                     ; $0716
	ld   a, l                                                       ; $0717
	or   c                                                          ; $0718
	ld   c, a                                                       ; $0719
	ret                                                             ; $071a


; A - number to split in tens and digits
BCequAinBCDform::
; LH = A % 10, keep mod (digits) in A
	ld   l, a                                                       ; $071b
	ld   h, $00                                                     ; $071c
	ld   e, 10                                                      ; $071e
	call HLdivmodEinLH                                              ; $0720
	ld   a, h                                                       ; $0723

; L divmod 10 in LH (tens in H)
	push af                                                         ; $0724
	ld   h, $00                                                     ; $0725
	ld   e, 10                                                      ; $0727
	call HLdivmodEinLH                                              ; $0729

; Store tens in high nybble of H
	ld   a, h                                                       ; $072c
	swap a                                                          ; $072d
	ld   h, a                                                       ; $072f
	pop  af                                                         ; $0730

; Or with low nybble (units), low byte has BCD of initial A
; High byte has num 100s (0, 1, or 2)
	or   h                                                          ; $0731
	ld   c, a                                                       ; $0732
	ld   b, l                                                       ; $0733
	ret                                                             ; $0734


; unused - $0735
; B - thousands and hundreds
; C - tens and 1s
BCequBCinNonBCDForm:
; HL = 1s
	ld   a, c                                                       ; $0735
	and  $0f                                                        ; $0736
	ld   l, a                                                       ; $0738
	ld   h, $00                                                     ; $0739

; High nybble of C gets us address of relevant 10s
	ld   a, c                                                       ; $073b
	swap a                                                          ; $073c
	and  $0f                                                        ; $073e
	ld   de, .tens                                                  ; $0740
	add  e                                                          ; $0743
	ld   e, a                                                       ; $0744
	ld   a, d                                                       ; $0745
	adc  $00                                                        ; $0746
	ld   d, a                                                       ; $0748

; Add that onto hl
	ld   a, [de]                                                    ; $0749
	add  l                                                          ; $074a
	ld   l, a                                                       ; $074b
	ld   a, h                                                       ; $074c
	adc  $00                                                        ; $074d
	ld   h, a                                                       ; $074f

; Low nybble of B gets us address of relevant 100s
	ld   a, b                                                       ; $0750
	and  $0f                                                        ; $0751
	add  a                                                          ; $0753
	ld   de, .hundreds                                              ; $0754
	add  e                                                          ; $0757
	ld   e, a                                                       ; $0758
	ld   a, d                                                       ; $0759
	adc  $00                                                        ; $075a
	ld   d, a                                                       ; $075c

; Add that word onto hl
	ld   a, [de]                                                    ; $075d
	add  l                                                          ; $075e
	ld   l, a                                                       ; $075f
	inc  de                                                         ; $0760
	ld   a, [de]                                                    ; $0761
	adc  h                                                          ; $0762
	ld   h, a                                                       ; $0763

; High nybble of B gets us address of relevant 1000s
	ld   a, b                                                       ; $0764
	swap a                                                          ; $0765
	and  $0f                                                        ; $0767
	add  a                                                          ; $0769
	ld   de, .thousands                                             ; $076a
	add  e                                                          ; $076d
	ld   e, a                                                       ; $076e
	ld   a, d                                                       ; $076f
	adc  $00                                                        ; $0770
	ld   d, a                                                       ; $0772

; Add that word onto hl
	ld   a, [de]                                                    ; $0773
	add  l                                                          ; $0774
	ld   l, a                                                       ; $0775
	inc  de                                                         ; $0776
	ld   a, [de]                                                    ; $0777
	adc  h                                                          ; $0778
	ld   h, a                                                       ; $0779
	ret                                                             ; $077a

.thousands:
	dw 0
	dw 1000
	dw 2000
	dw 3000
	dw 4000
	dw 5000
	dw 6000
	dw 7000
	dw 8000
	dw 9000

.hundreds:
	dw 0
	dw 100
	dw 200
	dw 300
	dw 400
	dw 500
	dw 600
	dw 700
	dw 800
	dw 900

.tens:
	db 0
	db 10
	db 20
	db 30
	db 40
	db 50
	db 60
	db 70
	db 80
	db 90


UnusedDaaAdd1ToWord:
	or   a                                                          ; $07ad
	ld   a, [hl]                                                    ; $07ae
	add  $01                                                        ; $07af
	daa                                                             ; $07b1
	ld   [hl+], a                                                   ; $07b2
	ld   a, [hl]                                                    ; $07b3
	adc  $00                                                        ; $07b4
	daa                                                             ; $07b6
	ld   [hl], a                                                    ; $07b7
	ret                                                             ; $07b8


UnusedDaaSub1FromWord:
	or   a                                                          ; $07b9
	ld   a, [hl]                                                    ; $07ba
	sub  $01                                                        ; $07bb
	daa                                                             ; $07bd
	ld   [hl+], a                                                   ; $07be
	ld   a, [hl]                                                    ; $07bf
	sbc  $00                                                        ; $07c0
	daa                                                             ; $07c2
	ld   [hl], a                                                    ; $07c3
	ret                                                             ; $07c4


UnusedDaaAdd1ToLong:
	or   a                                                          ; $07c5
	ld   a, [hl]                                                    ; $07c6
	add  $01                                                        ; $07c7
	daa                                                             ; $07c9
	ld   [hl+], a                                                   ; $07ca
	ld   a, [hl]                                                    ; $07cb
	adc  $00                                                        ; $07cc
	daa                                                             ; $07ce
	ld   [hl+], a                                                   ; $07cf
	ld   a, [hl]                                                    ; $07d0
	adc  $00                                                        ; $07d1
	daa                                                             ; $07d3
	ld   [hl], a                                                    ; $07d4
	ret                                                             ; $07d5


UnusedDaaSub1FromLong:
	or   a                                                          ; $07d6
	ld   a, [hl]                                                    ; $07d7
	sub  $01                                                        ; $07d8
	daa                                                             ; $07da
	ld   [hl+], a                                                   ; $07db
	ld   a, [hl]                                                    ; $07dc
	sbc  $00                                                        ; $07dd
	daa                                                             ; $07df
	ld   [hl+], a                                                   ; $07e0
	ld   a, [hl]                                                    ; $07e1
	sbc  $00                                                        ; $07e2
	daa                                                             ; $07e4
	ld   [hl], a                                                    ; $07e5
	ret                                                             ; $07e6


; out: A - high byte of updated RNG
UpdateRNG::
	push de                                                         ; $07e7
	push hl                                                         ; $07e8

; RNG in HL and DE
	ld   a, [wRNGVar1]                                              ; $07e9
	ld   l, a                                                       ; $07ec
	ld   e, a                                                       ; $07ed
	ld   a, [wRNGVar2]                                              ; $07ee
	ld   h, a                                                       ; $07f1
	ld   d, a                                                       ; $07f2

; get 5 * RNG + 4523
	add  hl, hl                                                     ; $07f3
	add  hl, hl                                                     ; $07f4
	add  hl, de                                                     ; $07f5
	ld   de, $11ab                                                  ; $07f6
	add  hl, de                                                     ; $07f9

; Store RNG, returning high byte
	ld   a, l                                                       ; $07fa
	ld   [wRNGVar1], a                                              ; $07fb
	ld   a, h                                                       ; $07fe
	ld   [wRNGVar2], a                                              ; $07ff
	ld   a, h                                                       ; $0802

	pop  hl                                                         ; $0803
	pop  de                                                         ; $0804
	ret                                                             ; $0805


SetHWPalettesFromRam:
; B is unused for each palette
	ld   hl, wBGPalettes                                            ; $0806
	ld   b, $20                                                     ; $0809
	ld   a, XCPS_AUTO_INCREMENT                                     ; $080b
	ldh  [rBCPS], a                                                 ; $080d
	ld   c, LOW(rBCPD)                                              ; $080f
rept NUM_PALETTE_BYTES
	ld   a, [hl+]                                                   ; $0811
	ldh  [c], a                                                     ; $0812
endr

	ld   hl, wOBJPalettes                                           ; $0891
	ld   a, XCPS_AUTO_INCREMENT                                     ; $0894
	ldh  [rOCPS], a                                                 ; $0896
	ld   b, $20                                                     ; $0898
	ld   c, LOW(rOCPD)                                              ; $089a
rept NUM_PALETTE_BYTES
	ld   a, [hl+]                                                   ; $089c
	ldh  [c], a                                                     ; $089d
endr
	ret                                                             ; $091c


PollInput:
	ld   a, $20                                                     ; $091d
	ldh  [rP1], a                                                   ; $091f
	ldh  a, [rP1]                                                   ; $0921
	ldh  a, [rP1]                                                   ; $0923
	cpl                                                             ; $0925
	and  $0f                                                        ; $0926
	swap a                                                          ; $0928
	ld   b, a                                                       ; $092a
	ld   a, $30                                                     ; $092b
	ldh  [rP1], a                                                   ; $092d
	ld   a, $10                                                     ; $092f
	ldh  [rP1], a                                                   ; $0931
	ldh  a, [rP1]                                                   ; $0933
	ldh  a, [rP1]                                                   ; $0935
	ldh  a, [rP1]                                                   ; $0937
	ldh  a, [rP1]                                                   ; $0939
	ldh  a, [rP1]                                                   ; $093b
	ldh  a, [rP1]                                                   ; $093d
	cpl                                                             ; $093f
	and  $0f                                                        ; $0940
	or   b                                                          ; $0942
	ld   c, a                                                       ; $0943
	ld   a, [wButtonsHeld]                                          ; $0944
	xor  c                                                          ; $0947
	and  c                                                          ; $0948
	ld   [wButtonsPressed], a                                       ; $0949
	ld   a, c                                                       ; $094c
	ld   [wButtonsHeld], a                                          ; $094d
	ld   a, $30                                                     ; $0950
	ldh  [rP1], a                                                   ; $0952
	ret                                                             ; $0954


HLdivmodEinLH::
; B = num bits
	ld   b, $08                                                     ; $0955

; Clear carry
	or   a                                                          ; $0957
.nextShift:
; Shift L and H
	rl   l                                                          ; $0958
	rl   h                                                          ; $095a

; If H carried..
	ld   a, h                                                       ; $095c
	jr   c, .subE                                                   ; $095d

; Or it's >= the divisor..
	cp   e                                                          ; $095f
	jr   c, .toNextShift                                            ; $0960

.subE:
; Sub it and put back in, clear carry so that ccf sets it and grows L
	sub  e                                                          ; $0962
	ld   h, a                                                       ; $0963
	or   a                                                          ; $0964

.toNextShift:
; If a carry happened (H is too small), unset it so L doesn't grow
	ccf                                                             ; $0965
	dec  b                                                          ; $0966
	jr   nz, .nextShift                                             ; $0967

; Final shift
	rl   l                                                          ; $0969
	ret                                                             ; $096b


HLdivE_divInHLmodInD::
; B = num bits, start with a cleared D (assume working on just HL like above)
	ld   b, $10                                                     ; $096c
	ld   d, $00                                                     ; $096e
	or   a                                                          ; $0970

.nextShift:
; Shift HL and D
	rl   l                                                          ; $0971
	rl   h                                                          ; $0973
	rl   d                                                          ; $0975

; If D carried..
	ld   a, d                                                       ; $0977
	jr   c, .subE                                                   ; $0978

; Or it's >= the divisor
	cp   e                                                          ; $097a
	jr   c, .toNextShift                                            ; $097b

.subE:
; Sub it and put back in D, clear carry so that ccf sets it and grows L
	sub  e                                                          ; $097d
	ld   d, a                                                       ; $097e
	or   a                                                          ; $097f

.toNextShift:
	ccf                                                             ; $0980
	dec  b                                                          ; $0981
	jr   nz, .nextShift                                             ; $0982

; Final shifts
	rl   l                                                          ; $0984
	rl   h                                                          ; $0986
	ret                                                             ; $0988


; H/L - multiplicands
HLequHtimesL::
; DE = L, HL = H$00
	ld   d, $00                                                     ; $0989
	ld   e, l                                                       ; $098b
	ld   l, d                                                       ; $098c

; Shift 8 bits out of H. For every that comes out into carry, add orig L
	ld   b, $08                                                     ; $098d
.nextB:
	add  hl, hl                                                     ; $098f
	jr   nc, :+                                                     ; $0990

	add  hl, de                                                     ; $0992

:	dec  b                                                          ; $0993
	jr   nz, .nextB                                                 ; $0994

	ret                                                             ; $0996


UnusedAmodD:
; Done early
	inc  d                                                          ; $0997
	dec  d                                                          ; $0998
	jr   z, .done                                                   ; $0999

.loop:
; Return once A < D, subbing D each time
	cp   d                                                          ; $099b
	ret  c                                                          ; $099c

	sub  d                                                          ; $099d
	jp   .loop                                                      ; $099e

.done:
	xor  a                                                          ; $09a1
	ret                                                             ; $09a2


DEHLequDEtimesBC::
	ld   hl, $0000                                                  ; $09a3
	ld   a, $10                                                     ; $09a6

.loop:
; HL *= 2
	add  hl, hl                                                     ; $09a8

; Swap DE and HL
	push hl                                                         ; $09a9
	ld   h, d                                                       ; $09aa
	ld   l, e                                                       ; $09ab
	pop  de                                                         ; $09ac

; Orig DE *= 2 with previous carry
	rl   l                                                          ; $09ad
	rl   h                                                          ; $09af

; Swap DE and HL
; DEHL *= 2
	push hl                                                         ; $09b1
	ld   h, d                                                       ; $09b2
	ld   l, e                                                       ; $09b3
	pop  de                                                         ; $09b4

	jr   nc, .toLoop                                                ; $09b5

; If bit 7 set on DE, add BC
	add  hl, bc                                                     ; $09b7
	jr   nc, .toLoop                                                ; $09b8

	inc  de                                                         ; $09ba

.toLoop:
	dec  a                                                          ; $09bb
	jp   nz, .loop                                                  ; $09bc

	ret                                                             ; $09bf


; A - source bank
; BC - num bytes
; DE - dest addr
; HL - source addr
FarMemCopy:
; Store rom bank param
	ld   a, a                                                       ; $09c0
	ldh  [hRomBank], a                                              ; $09c1

; Push current bank
	ld   a, [wRomBank]                                              ; $09c3
	push af                                                         ; $09c6

; Mem copy in param rom bank
	ldh  a, [hRomBank]                                              ; $09c7
	call SetRomBank1stHalfOfRom                                     ; $09c9
	call MemCopy                                                    ; $09cc

; Restore current bank
	pop  af                                                         ; $09cf
	call SetRomBank1stHalfOfRom                                     ; $09d0
	ret                                                             ; $09d3


; BC - num bytes
; DE - dest addr
UnusedMemCopyWithBankAndAddrInHL:
	ld   a, [wRomBank]                                              ; $09d4
	push af                                                         ; $09d7
	ld   a, [hl+]                                                   ; $09d8
	call SetRomBank1stHalfOfRom                                     ; $09d9
	ld   a, [hl+]                                                   ; $09dc
	ld   h, [hl]                                                    ; $09dd
	ld   l, a                                                       ; $09de
	call MemCopy                                                    ; $09df
	pop  af                                                         ; $09e2
	call SetRomBank1stHalfOfRom                                     ; $09e3
	ret                                                             ; $09e6


; B - bank
; HL - big-endian source addr
HDMATransferAllTileDataWhileInVBlankProcessingSnd::
; Preserve bank and set new one
	ld   a, [wRomBank]                                              ; $09e7
	push af                                                         ; $09ea
	ld   a, b                                                       ; $09eb
	call SetRomBank1stHalfOfRom                                     ; $09ec

; Ignored
	ld   de, $0400                                                  ; $09ef

; For 6 frames hdma transfer the entire tile data, while updating sound
DEF VRAM_DEST = _VRAM
rept 6
	waitForRequestedVBlank
	ld   de, VRAM_DEST                                              ; $09ff
	ld   b, ($400/$10)-1                                            ; $0a02
	call StartHDMATransfer                                          ; $0a04
	ld   de, $0400                                                  ; $0a07
	add  hl, de                                                     ; $0a0a
	call UpdateSound                                                ; $0a0b
VRAM_DEST = VRAM_DEST + $400
endr

	pop  af                                                         ; $0a9a
	call SetRomBank1stHalfOfRom                                     ; $0a9b
	ret                                                             ; $0a9e


; B - source bank
; HL - source addr
FarLoadAllBGPalettes::
	ld   a, [wRomBank]                                              ; $0a9f
	push af                                                         ; $0aa2
	ld   a, b                                                       ; $0aa3
	call SetRomBank1stHalfOfRom                                     ; $0aa4
	call LoadAllBGPalettes                                          ; $0aa7
	pop  af                                                         ; $0aaa
	call SetRomBank1stHalfOfRom                                     ; $0aab
	ret                                                             ; $0aae


; B - bank
; HL - addr
SetBGPaletteSrc::
	ld   a, b                                                       ; $0aaf
	ld   [wBGPaletteBank], a                                        ; $0ab0
	ld   a, l                                                       ; $0ab3
	ld   [wBGPaletteAddr], a                                        ; $0ab4
	ld   a, h                                                       ; $0ab7
	ld   [wBGPaletteAddr+1], a                                      ; $0ab8
	ret                                                             ; $0abb


; B - source bank
; HL - source addr
FarLoadAllOBJPalettes::
	ld   a, [wRomBank]                                              ; $0abc
	push af                                                         ; $0abf
	ld   a, b                                                       ; $0ac0
	call SetRomBank1stHalfOfRom                                     ; $0ac1
	call LoadAllOBJPalettes                                         ; $0ac4
	pop  af                                                         ; $0ac7
	call SetRomBank1stHalfOfRom                                     ; $0ac8
	ret                                                             ; $0acb


; B - bank
; HL - addr
SetOBJPaletteSrc::
	ld   a, b                                                       ; $0acc
	ld   [wOBJPaletteBank], a                                       ; $0acd
	ld   a, l                                                       ; $0ad0
	ld   [wOBJPaletteAddr], a                                       ; $0ad1
	ld   a, h                                                       ; $0ad4
	ld   [wOBJPaletteAddr+1], a                                     ; $0ad5
	ret                                                             ; $0ad8


SECTION "Game states", ROM0[$e35]

HandleGameState:
	ld   a, GAME_STATES_MAIN_HIGH_BANK                              ; $0e35
	call SetRomBank1stHalfOfRom                                     ; $0e37
	ld   a, [wGameState]                                            ; $0e3a
	rst  JumpTableTrashDE                                           ; $0e3d
	dw GameState00_InGameInit
	dw GameState01_InGameMain
	dw GameState02_TrainLineSelectionInit
	dw GameState03_TrainLineSelectionMain
	dw GameState04_PreInGameGraphicInit
	dw GameState05_PreInGameGraphicMain
	dw GameState06_DepartureInfoScreenInit
	dw GameState07_DepartureInfoScreenMain
	dw GameState08_RouteDisplayInit
	dw GameState09_RouteDisplayMain
	dw GameState0a_FinishedInGameInit
	dw GameState0b_FinishedInGameMain
	dw GameState0c_TitleScreenInit
	dw GameState0d_TitleScreenMain
	dw GameState0e_IntroInit
	dw GameState0f_IntroMain
	dw GameState10_LocationDoneInit
	dw GameState11_LocationDoneMain
	dw GameState12_ContinueScreenInit
	dw GameState13_ContinueScreenMain
	dw GameState14_ScoringInit
	dw GameState15_ScoringMain
	dw GameState16_EnterHighScoreInit
	dw GameState16_EnterHighScoreMain
	dw GameState18_RankingInit
	dw GameState19_RankingMain
	dw GameState1a_GameSetupInit
	dw GameState1b_GameSetupMain
	dw GameState1c_StageCompleteInit
	dw GameState1d_StageCompleteMain
	dw GameState1e_CreditsInit
	dw GameState1f_CreditsMain
	dw GameState20_TrainImageInit
	dw GameState21_TrainImageMain
	dw GameState22_TrainImageStub
	dw GameState23_TitleScreenOptsInit
	dw GameState24_TitleScreenOptsMain
	dw GameState25_PictureBookInit
	dw GameState26_PictureBookMain
	dw GameState27_PrintTrainImageInit
	dw GameState28_PrintTrainImageMain
	dw GameState29_PrintStartInit
	dw GameState2a_PrintStartMain
	dw GameState2b_PhotoGetInit
	dw GameState2c_PhotoGetMain
	dw GameState2d_GameOverInit
	dw GameState2e_GameOverMain
	dw GameState2f_PicBookCompleteInit
	dw GameState30_PicBookCompleteMain
	dw GameState31_CongratsInit
	dw GameState32_CongratsMain
	dw GameState33_IntroCutsceneInit
	dw GameState34_IntroCutsceneMain


SetGameStateAndInGameDetailsBasedOnTitleScreenDemoStepIdx::
; Inc demo step, looping 7 to 0
	ld   a, [wTitleScreenDemoStep]                                  ; $0ea8
	inc  a                                                          ; $0eab
	cp   $07                                                        ; $0eac
	jr   c, :+                                                      ; $0eae
	xor  a                                                          ; $0eb0
:	ld   [wTitleScreenDemoStep], a                                  ; $0eb1

; Set game state
	ld   hl, TitleScreenDemoStepTable                               ; $0eb4
	ld   e, a                                                       ; $0eb7
	ld   d, $00                                                     ; $0eb8
	add  hl, de                                                     ; $0eba
	ld   a, [hl]                                                    ; $0ebb
	ld   [wGameState], a                                            ; $0ebc

; Tell rankings we came from demo screen
	ld   a, RANKINGS_FROM_DEMO                                      ; $0ebf
	ld   [wRankingsPrevScreen], a                                   ; $0ec1

; Tell in-game that we are demoing train line 1, from location 0
	ld   a, $01                                                     ; $0ec4
	ld   [wIsDemo], a                                               ; $0ec6
	ld   [wSelectedTrainLine], a                                    ; $0ec9
	xor  a                                                          ; $0ecc
	ld   [wLocationIdxInTrainLine], a                               ; $0ecd

; Preserve rom bank and set new one
	ld   a, [wRomBank]                                              ; $0ed0
	push af                                                         ; $0ed3
	ld   a, BANK(TrainLineAddressesForLocationFrameMetaData)        ; $0ed4
	call SetRomBank1stHalfOfRom                                     ; $0ed6

; HL = address of train line's meta data
	ld   a, [wSelectedTrainLine]                                    ; $0ed9
	add  a                                                          ; $0edc
	ld   hl, TrainLineAddressesForLocationFrameMetaData             ; $0edd
	ld   e, a                                                       ; $0ee0
	ld   d, $00                                                     ; $0ee1
	add  hl, de                                                     ; $0ee3

; Set meta frame idxes address from 1st word
	ld   a, [hl+]                                                   ; $0ee4
	ld   [wTrainLinesAddrForItsMetaFrameIdxes], a                   ; $0ee5
	ld   a, [hl]                                                    ; $0ee8
	ld   [wTrainLinesAddrForItsMetaFrameIdxes+1], a                 ; $0ee9

; Set that we haven't seen location done
	ld   a, $01                                                     ; $0eec
	ld   [wStartedJourneyWithoutSeeingLocationDone], a              ; $0eee

; Set frame counter for demo
	ld   hl, $0708                                                  ; $0ef1
	ld   a, l                                                       ; $0ef4
	ld   [wDemoFrameCounter], a                                     ; $0ef5
	ld   a, h                                                       ; $0ef8
	ld   [wDemoFrameCounter+1], a                                   ; $0ef9

; Start at 30 penalties, with the base custom speed limit
	ld   a, 30                                                      ; $0efc
	ld   [wPenaltiesAllowed], a                                     ; $0efe
	ld   a, $00                                                     ; $0f01
	ld   [wIndexOfCustomSpeedLimitOrStopEv], a                      ; $0f03

	pop  af                                                         ; $0f06
	call SetRomBank1stHalfOfRom                                     ; $0f07
	ret                                                             ; $0f0a


IncTitleScreenDemoStepUntilTitleScreenStateSet::
.loop:
; Inc demo step, looping 7 to 0
	ld   a, [wTitleScreenDemoStep]                                  ; $0f0b
	inc  a                                                          ; $0f0e
	cp   $07                                                        ; $0f0f
	jr   c, :+                                                      ; $0f11
	xor  a                                                          ; $0f13
:	ld   [wTitleScreenDemoStep], a                                  ; $0f14

; If idx points to title screen, set game state, else loop until it is title screen
	cp   $01                                                        ; $0f17
	jr   z, .titleScreenStepSet                                     ; $0f19

	cp   $03                                                        ; $0f1b
	jr   z, .titleScreenStepSet                                     ; $0f1d

	cp   $05                                                        ; $0f1f
	jr   z, .titleScreenStepSet                                     ; $0f21

	jr   .loop                                                      ; $0f23

.titleScreenStepSet:
	ld   hl, TitleScreenDemoStepTable                               ; $0f25
	ld   e, a                                                       ; $0f28
	ld   d, $00                                                     ; $0f29
	add  hl, de                                                     ; $0f2b

	ld   a, [hl]                                                    ; $0f2c
	ld   [wGameState], a                                            ; $0f2d

; Set that we came from demo
	ld   a, RANKINGS_FROM_DEMO                                      ; $0f30
	ld   [wRankingsPrevScreen], a                                   ; $0f32
	ret                                                             ; $0f35

TitleScreenDemoStepTable:
	db GS_INTRO_INIT
	db GS_TITLE_SCREEN_INIT
	db GS_IN_GAME_INIT
	db GS_TITLE_SCREEN_INIT
	db GS_RANKING_INIT
	db GS_TITLE_SCREEN_INIT
	db GS_IN_GAME_INIT


GameState18_RankingInit:
; Clear structs, scroll, oam and palettes
	call InitScriptStructs                                          ; $0f3d
	call ClearScrollOamSetAllPalsAffectedByFade                     ; $0f40

; Set new vblank interrupt func
	di                                                              ; $0f43
	ld   a, LOW(VBlankInterruptFunc_Rankings)                       ; $0f44
	ld   [wVBlankInterruptFunc], a                                  ; $0f46
	ld   a, HIGH(VBlankInterruptFunc_Rankings)                      ; $0f49
	ld   [wVBlankInterruptFunc+1], a                                ; $0f4b
	ld   a, LOW(StubInterruptFunc)                                  ; $0f4e
	ld   [wLCDCInterruptFunc], a                                    ; $0f50
	ld   a, HIGH(StubInterruptFunc)                                 ; $0f53
	ld   [wLCDCInterruptFunc+1], a                                  ; $0f55

; Only vblank, and turn on LCD with window set
	ld   a, $00                                                     ; $0f58
	ldh  [rIF], a                                                   ; $0f5a
	ld   a, IEF_VBLANK                                              ; $0f5c
	ldh  [rIE], a                                                   ; $0f5e
	ld   a, LCDCF_ON|LCDCF_WIN9C00|LCDCF_WINON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON ; $0f60
	ldh  [rLCDC], a                                                 ; $0f62

; Load base palettes - to fade in from black
	ei                                                              ; $0f64
	ld   b, BANK(Palettes_RankingScreen)                            ; $0f65
	ld   hl, Palettes_RankingScreen                                 ; $0f67
	call SetBGPaletteSrc                                            ; $0f6a
	ld   a, $20                                                     ; $0f6d
	ld   [wPaletteFadeAmount], a                                    ; $0f6f
	ld   a, $01                                                     ; $0f72
	ld   [wLoadPalettesFromRam], a                                  ; $0f74

	ld   b, BANK(Palettes_RankingScreen)                            ; $0f77
	ld   hl, Palettes_RankingScreen                                 ; $0f79
	call SetOBJPaletteSrc                                           ; $0f7c
	ld   a, $20                                                     ; $0f7f
	ld   [wPaletteFadeAmount], a                                    ; $0f81
	ld   a, $01                                                     ; $0f84
	ld   [wLoadPalettesFromRam], a                                  ; $0f86

; Load tile data bank 0 - displaying unchanging BG and window
	ld   a, $00                                                     ; $0f89
	ldh  [rVBK], a                                                  ; $0f8b
	ld   b, BANK(Gfx_RankingTilesMain)                              ; $0f8d
	ld   hl, Gfx_RankingTilesMain                                   ; $0f8f
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $0f92

; Load tile data bank 1 - text that fills in the score/names
	ld   a, $01                                                     ; $0f95
	ldh  [rVBK], a                                                  ; $0f97
	ld   b, BANK(Gfx_RankingsWindowText)                            ; $0f99
	ld   hl, Gfx_RankingsWindowText                                 ; $0f9b
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $0f9e

; Load tile map and attrs - BG top half
	ld   de, _SCRN0                                                 ; $0fa1
	ld   a, $00                                                     ; $0fa4
	ldh  [rVBK], a                                                  ; $0fa6
	ldbc $10, SCREEN_TILE_WIDTH                                     ; $0fa8
	ld   hl, TileMap_RankingsBG                                     ; $0fab
	ld   a, BANK(TileMap_RankingsBG)                                ; $0fae
	call FarRectCopyRowPerFrame                                     ; $0fb0

	ld   de, _SCRN0                                                 ; $0fb3
	ld   a, $01                                                     ; $0fb6
	ldh  [rVBK], a                                                  ; $0fb8
	ldbc $10, SCREEN_TILE_WIDTH                                     ; $0fba
	ld   a, BANK(TileAttr_RankingsBG)                               ; $0fbd
	call FarRectCopyRowPerFrame                                     ; $0fbf

; Load tile map and attrs - BG bottom half - same as top (for scrolling)
	ld   de, _SCRN0+$200                                            ; $0fc2
	ld   a, $00                                                     ; $0fc5
	ldh  [rVBK], a                                                  ; $0fc7
	ldbc $10, SCREEN_TILE_WIDTH                                     ; $0fc9
	ld   hl, TileMap_RankingsBG                                     ; $0fcc
	ld   a, BANK(TileMap_RankingsBG)                                ; $0fcf
	call FarRectCopyRowPerFrame                                     ; $0fd1

	ld   de, _SCRN0+$200                                            ; $0fd4
	ld   a, $01                                                     ; $0fd7
	ldh  [rVBK], a                                                  ; $0fd9
	ldbc $10, SCREEN_TILE_WIDTH                                     ; $0fdb
	ld   a, BANK(TileAttr_RankingsBG)                               ; $0fde
	call FarRectCopyRowPerFrame                                     ; $0fe0

; Load tile map and attrs - Window
	ld   de, _SCRN1                                                 ; $0fe3
	ld   a, $00                                                     ; $0fe6
	ldh  [rVBK], a                                                  ; $0fe8
	ldbc $10, SCREEN_TILE_WIDTH                                     ; $0fea
	ld   hl, TileMap_RankingsWindow                                 ; $0fed
	ld   a, BANK(TileMap_RankingsWindow)                            ; $0ff0
	call FarRectCopyRowPerFrame                                     ; $0ff2

	ld   de, _SCRN1                                                 ; $0ff5
	ld   a, $01                                                     ; $0ff8
	ldh  [rVBK], a                                                  ; $0ffa
	ldbc $10, SCREEN_TILE_WIDTH                                     ; $0ffc
	ld   a, BANK(TileAttr_RankingsWindow)                           ; $0fff
	call FarRectCopyRowPerFrame                                     ; $1001

; Set base window coords high up (BG is only score category)
	ld   a, $00                                                     ; $1004
	ld   [wWX], a                                                   ; $1006
	ld   a, $10                                                     ; $1009
	ld   [wWY], a                                                   ; $100b

; Start main script
	M_StartMainScript 0, RankingsScript

; Set main game state
	ld   a, GS_RANKING_MAIN                                         ; $1017
	ld   [wGameState], a                                            ; $1019
	ret                                                             ; $101c


GameState19_RankingMain:
	ret                                                             ; $101d


GameState16_EnterHighScoreInit:
; Clear scripts, scroll, oam and palettes
	call InitScriptStructs                                          ; $101e
	call ClearScrollOamSetAllPalsAffectedByFade                     ; $1021

; Set up custom display interrupts
	di                                                              ; $1024
	ld   a, LOW(VBlankInterruptFunc_EnterHighScore)                 ; $1025
	ld   [wVBlankInterruptFunc], a                                  ; $1027
	ld   a, HIGH(VBlankInterruptFunc_EnterHighScore)                ; $102a
	ld   [wVBlankInterruptFunc+1], a                                ; $102c
	ld   a, LOW(LCDCInterruptFunc_EnterHighScore)                   ; $102f
	ld   [wLCDCInterruptFunc], a                                    ; $1031
	ld   a, HIGH(LCDCInterruptFunc_EnterHighScore)                  ; $1034
	ld   [wLCDCInterruptFunc+1], a                                  ; $1036

; Allow both interrupts and turn on lcd, LCDC triggering in h-blank
	ld   a, $00                                                     ; $1039
	ldh  [rIF], a                                                   ; $103b
	ld   a, IEF_LCDC|IEF_VBLANK                                     ; $103d
	ldh  [rIE], a                                                   ; $103f
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $1041
	ldh  [rLCDC], a                                                 ; $1043
	ld   a, STATF_MODE00                                            ; $1045
	ldh  [rSTAT], a                                                 ; $1047
	ei                                                              ; $1049

; Load palettes - to fade in from black
	ld   b, BANK(Palettes_EnterHighScore)                           ; $104a
	ld   hl, Palettes_EnterHighScore                                ; $104c
	call SetBGPaletteSrc                                            ; $104f
	ld   a, $20                                                     ; $1052
	ld   [wPaletteFadeAmount], a                                    ; $1054
	ld   a, $01                                                     ; $1057
	ld   [wLoadPalettesFromRam], a                                  ; $1059

	ld   b, BANK(Palettes_EnterHighScore)                           ; $105c
	ld   hl, Palettes_EnterHighScore                                ; $105e
	call SetOBJPaletteSrc                                           ; $1061
	ld   a, $20                                                     ; $1064
	ld   [wPaletteFadeAmount], a                                    ; $1066
	ld   a, $01                                                     ; $1069
	ld   [wLoadPalettesFromRam], a                                  ; $106b

; Load tile data to both vram banks, re-using rankings metatiles tiles
	ld   a, $00                                                     ; $106e
	ldh  [rVBK], a                                                  ; $1070
	ld   b, BANK(Gfx_EnterHighScore)                                ; $1072
	ld   hl, Gfx_EnterHighScore                                     ; $1074
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $1077

	ld   a, $01                                                     ; $107a
	ldh  [rVBK], a                                                  ; $107c
	ld   b, BANK(Gfx_RankingsWindowText)                            ; $107e
	ld   hl, Gfx_RankingsWindowText                                 ; $1080
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $1083

; Load tile map and attrs
	ld   de, _SCRN0                                                 ; $1086
	ld   a, $00                                                     ; $1089
	ldh  [rVBK], a                                                  ; $108b
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $108d
	ld   hl, TileMap_EnterHighScoreMain                             ; $1090
	ld   a, BANK(TileMap_EnterHighScoreMain)                        ; $1093
	call FarRectCopyRowPerFrame                                     ; $1095

	ld   de, _SCRN0                                                 ; $1098
	ld   a, $01                                                     ; $109b
	ldh  [rVBK], a                                                  ; $109d
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $109f
	ld   a, BANK(TileAttr_EnterHighScoreMain)                       ; $10a2
	call FarRectCopyRowPerFrame                                     ; $10a4

; Load window tiles (scrolling numbers/letters)
	ld   de, _SCRN0+$1a0                                            ; $10a7
	ld   a, $00                                                     ; $10aa
	ldh  [rVBK], a                                                  ; $10ac
	ldbc $02, GB_TILE_WIDTH                                         ; $10ae
	ld   hl, TileMap_EnterHighScoreNumLetters                       ; $10b1
	ld   a, BANK(TileMap_EnterHighScoreNumLetters)                  ; $10b4
	call FarRectCopyRowPerFrame                                     ; $10b6

	ld   de, _SCRN0+$1a0                                            ; $10b9
	ld   a, $01                                                     ; $10bc
	ldh  [rVBK], a                                                  ; $10be
	ldbc $02, GB_TILE_WIDTH                                         ; $10c0
	ld   a, BANK(TileAttr_EnterHighScoreNumLetters)                 ; $10c3
	call FarRectCopyRowPerFrame                                     ; $10c5

; Start main script, and set main state
	M_StartMainScript 0, EnterHighScoreScript
	ld   a, GS_ENTER_HIGH_SCORE_MAIN                                ; $10d1
	ld   [wGameState], a                                            ; $10d3
	ret                                                             ; $10d6


GameState16_EnterHighScoreMain:
	ret                                                             ; $10d7


GameState14_ScoringInit:
; Clear scripts, scroll, oam and palettes
	call InitScriptStructs                                          ; $10d8
	call ClearScrollOamSetAllPalsAffectedByFade                     ; $10db

; Set new vblank interrupt, and stub out lcdc's
	di                                                              ; $10de
	ld   a, LOW(VBlankInterruptFunc_Scoring)                        ; $10df
	ld   [wVBlankInterruptFunc], a                                  ; $10e1
	ld   a, HIGH(VBlankInterruptFunc_Scoring)                       ; $10e4
	ld   [wVBlankInterruptFunc+1], a                                ; $10e6
	ld   a, LOW(StubInterruptFunc)                                  ; $10e9
	ld   [wLCDCInterruptFunc], a                                    ; $10eb
	ld   a, HIGH(StubInterruptFunc)                                 ; $10ee
	ld   [wLCDCInterruptFunc+1], a                                  ; $10f0

; Allow vblank interrupt and turn on LCD
	ld   a, $00                                                     ; $10f3
	ldh  [rIF], a                                                   ; $10f5
	ld   a, IEF_VBLANK                                              ; $10f7
	ldh  [rIE], a                                                   ; $10f9
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $10fb
	ldh  [rLCDC], a                                                 ; $10fd
	ei                                                              ; $10ff

; Load BG + OBJ palettes - to fade in from black
	ld   b, BANK(Palettes_Scoring)                                  ; $1100
	ld   hl, Palettes_Scoring                                       ; $1102
	call SetBGPaletteSrc                                            ; $1105
	ld   a, $20                                                     ; $1108
	ld   [wPaletteFadeAmount], a                                    ; $110a
	ld   a, $01                                                     ; $110d
	ld   [wLoadPalettesFromRam], a                                  ; $110f

	ld   b, BANK(Palettes_Scoring)                                  ; $1112
	ld   hl, Palettes_Scoring                                       ; $1114
	call SetOBJPaletteSrc                                           ; $1117
	ld   a, $20                                                     ; $111a
	ld   [wPaletteFadeAmount], a                                    ; $111c
	ld   a, $01                                                     ; $111f
	ld   [wLoadPalettesFromRam], a                                  ; $1121

; Load tile data
	ld   a, $00                                                     ; $1124
	ldh  [rVBK], a                                                  ; $1126
	ld   b, BANK(Gfx_Scoring)                                       ; $1128
	ld   hl, Gfx_Scoring                                            ; $112a
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $112d

; Load tile map and attr
	ld   de, _SCRN0                                                 ; $1130
	ld   a, $00                                                     ; $1133
	ldh  [rVBK], a                                                  ; $1135
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $1137
	ld   hl, TileMap_Scoring                                        ; $113a
	ld   a, BANK(TileMap_Scoring)                                   ; $113d
	call FarRectCopyRowPerFrame                                     ; $113f

	ld   de, _SCRN0                                                 ; $1142
	ld   a, $01                                                     ; $1145
	ldh  [rVBK], a                                                  ; $1147
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $1149
	ld   a, BANK(TileAttr_Scoring)                                  ; $114c
	call FarRectCopyRowPerFrame                                     ; $114e

; Start main script and main stub state
	M_StartMainScript 0, ScoringScript
	ld   a, GS_SCORING_MAIN                                         ; $115a
	ld   [wGameState], a                                            ; $115c
	ret                                                             ; $115f


GameState15_ScoringMain:
	ret                                                             ; $1160


GameState12_ContinueScreenInit:
; Save data, clear scripts, oam and palettes
	call SaveSaveData                                               ; $1161
	call InitScriptStructs                                          ; $1164
	call ClearScrollOamSetAllPalsAffectedByFade                     ; $1167

; Set new vblank int func, and stub lcdc's
	di                                                              ; $116a
	ld   a, LOW(VBlankInterruptFunc_ContinueScreen)                 ; $116b
	ld   [wVBlankInterruptFunc], a                                  ; $116d
	ld   a, HIGH(VBlankInterruptFunc_ContinueScreen)                ; $1170
	ld   [wVBlankInterruptFunc+1], a                                ; $1172
	ld   a, LOW(StubInterruptFunc)                                  ; $1175
	ld   [wLCDCInterruptFunc], a                                    ; $1177
	ld   a, HIGH(StubInterruptFunc)                                 ; $117a
	ld   [wLCDCInterruptFunc+1], a                                  ; $117c

; Allow only vblank interrupt, and turn on LCD
	ld   a, $00                                                     ; $117f
	ldh  [rIF], a                                                   ; $1181
	ld   a, IEF_VBLANK                                              ; $1183
	ldh  [rIE], a                                                   ; $1185
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $1187
	ldh  [rLCDC], a                                                 ; $1189

; Set base BG + OBJ palettes - no fade
	ei                                                              ; $118b
	ld   b, BANK(Palettes_ContinueScreen)                           ; $118c
	ld   hl, Palettes_ContinueScreen                                ; $118e
	call SetBGPaletteSrc                                            ; $1191
	xor  a                                                          ; $1194
	ld   [wPaletteFadeAmount], a                                    ; $1195
	ld   [wLoadPalettesFromRam], a                                  ; $1198
	ld   a, $01                                                     ; $119b
	ld   [wLoadBGPalettesFromRom], a                                ; $119d

	ld   b, BANK(Palettes_ContinueScreen)                           ; $11a0
	ld   hl, Palettes_ContinueScreen                                ; $11a2
	call SetOBJPaletteSrc                                           ; $11a5
	xor  a                                                          ; $11a8
	ld   [wPaletteFadeAmount], a                                    ; $11a9
	ld   [wLoadPalettesFromRam], a                                  ; $11ac
	ld   a, $01                                                     ; $11af
	ld   [wLoadOBJPalettesFromRom], a                               ; $11b1

; Transfer bank 0 tile data - all but textbox text
	ld   a, $00                                                     ; $11b4
	ldh  [rVBK], a                                                  ; $11b6
	ld   b, BANK(Gfx_ContinueScreenBank0)                           ; $11b8
	ld   hl, Gfx_ContinueScreenBank0                                ; $11ba
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $11bd

; Transfer bank 1 tile data - textbox text
	ld   a, $01                                                     ; $11c0
	ldh  [rVBK], a                                                  ; $11c2
	ld   b, BANK(Gfx_ContinueScreenBank1)                           ; $11c4
	ld   hl, Gfx_ContinueScreenBank1                                ; $11c6
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $11c9

; Set base tile map and attrs (nothing shown)
	ld   de, _SCRN0                                                 ; $11cc
	ld   a, $00                                                     ; $11cf
	ldh  [rVBK], a                                                  ; $11d1
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $11d3
	ld   hl, TileMap_ContinueScreen                                 ; $11d6
	ld   a, BANK(TileMap_ContinueScreen)                            ; $11d9
	call FarRectCopyRowPerFrame                                     ; $11db

	ld   de, _SCRN0                                                 ; $11de
	ld   a, $01                                                     ; $11e1
	ldh  [rVBK], a                                                  ; $11e3
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $11e5
	ld   a, BANK(TileAttr_ContinueScreen)                           ; $11e8
	call FarRectCopyRowPerFrame                                     ; $11ea

; Start continue screen script, reset penalties allowed for retry, and set main state
	M_StartMainScript 0, ContinueScreenScript
	CallFromBank0 ResetPenaltiesAllowed
	ld   a, GS_CONTINUE_SCREEN_MAIN                                 ; $11fe
	ld   [wGameState], a                                            ; $1200
	ret                                                             ; $1203


GameState13_ContinueScreenMain:
	ret                                                             ; $1204


GameState10_LocationDoneInit:
; Clear scripts, scroll, oam and palettes
	call InitScriptStructs                                          ; $1205
	call ClearScrollOamSetAllPalsAffectedByFade                     ; $1208

; Set initial train part SCX
	ld   a, $60                                                     ; $120b
	ld   [wLocationDoneTrainSCX], a                                 ; $120d

; Provide custom interrupts for both display ints
	di                                                              ; $1210
	ld   a, LOW(VBlankInterruptFunc_LocationDone)                   ; $1211
	ld   [wVBlankInterruptFunc], a                                  ; $1213
	ld   a, HIGH(VBlankInterruptFunc_LocationDone)                  ; $1216
	ld   [wVBlankInterruptFunc+1], a                                ; $1218
	ld   a, LOW(LCDCInterruptFunc_LocationDone)                     ; $121b
	ld   [wLCDCInterruptFunc], a                                    ; $121d
	ld   a, HIGH(LCDCInterruptFunc_LocationDone)                    ; $1220
	ld   [wLCDCInterruptFunc+1], a                                  ; $1222

; Allow both interrupts, LCDC triggering on line $57, and turn on LCD
	ld   a, $00                                                     ; $1225
	ldh  [rIF], a                                                   ; $1227
	ld   a, IEF_LCDC|IEF_VBLANK                                     ; $1229
	ldh  [rIE], a                                                   ; $122b
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $122d
	ldh  [rLCDC], a                                                 ; $122f
	ld   a, STATF_LYC                                               ; $1231
	ldh  [rSTAT], a                                                 ; $1233
	ld   a, $57                                                     ; $1235
	ldh  [rLYC], a                                                  ; $1237
	ei                                                              ; $1239

; Preserve curr wram bank and set the ram buffer one
	ldh  a, [rSVBK]                                                 ; $123a
	and  $03                                                        ; $123c
	push af                                                         ; $123e
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $123f
	ldh  [rSVBK], a                                                 ; $1241

; Copy tile map and attrs into ram buffer
	ld   de, wIntroCutsceneTileMapBuffer                            ; $1243
	ldbc SCREEN_TILE_HEIGHT, GB_TILE_WIDTH                          ; $1246
	ld   hl, TileMap_LocationDone                                   ; $1249
	ld   a, BANK(TileMap_LocationDone)                              ; $124c
	call FarRectCopy                                                ; $124e

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $1251
	ld   a, $01                                                     ; $1254
	ldh  [rVBK], a                                                  ; $1256
	ldbc SCREEN_TILE_HEIGHT, GB_TILE_WIDTH                          ; $1258
	ld   a, BANK(TileAttr_LocationDone)                             ; $125b
	call FarRectCopy                                                ; $125d

	pop  af                                                         ; $1260
	ldh  [rSVBK], a                                                 ; $1261

; Set main script and main stub state
	M_StartMainScript 0, LocationDoneScript
	ld   a, GS_LOCATION_DONE_MAIN                                   ; $126c
	ld   [wGameState], a                                            ; $126e
	ret                                                             ; $1271


GameState11_LocationDoneMain:
	ret                                                             ; $1272


GameState0e_IntroInit::
	call InitScriptStructs                                          ; $1273
	call OffLCDClearScrollScreensSetPalettesToWhite                 ; $1276

; Have all palettes fade
	ld   a, $ff                                                     ; $1279
	ld   [wBitsSetPerBGPaletteFade], a                              ; $127b
	ld   a, $ff                                                     ; $127e
	ld   [wBitsSetPerOBJPaletteFade], a                             ; $1280

; Do nothing special for interrupts
	ld   a, LOW(StubInterruptFunc)                                  ; $1283
	ld   [wVBlankInterruptFunc], a                                  ; $1285
	ld   a, HIGH(StubInterruptFunc)                                 ; $1288
	ld   [wVBlankInterruptFunc+1], a                                ; $128a
	ld   a, LOW(StubInterruptFunc)                                  ; $128d
	ld   [wLCDCInterruptFunc], a                                    ; $128f
	ld   a, HIGH(StubInterruptFunc)                                 ; $1292
	ld   [wLCDCInterruptFunc+1], a                                  ; $1294

; Load starting BG palettes - no fade to start with
	ld   b, BANK(BGPalettes_CyberFront_0)                           ; $1297
	ld   hl, BGPalettes_CyberFront_0                                ; $1299
	xor  a                                                          ; $129c
	ld   [wPaletteFadeAmount], a                                    ; $129d
	call FarLoadAllBGPalettes                                       ; $12a0

; Load starting OBJ palettes
	ld   b, BANK(BGPalettes_CyberFront_0)                           ; $12a3
	ld   hl, BGPalettes_CyberFront_0                                ; $12a5
	xor  a                                                          ; $12a8
	ld   [wPaletteFadeAmount], a                                    ; $12a9
	ld   a, $00                                                     ; $12ac
	ld   [wLoadPalettesFromRam], a                                  ; $12ae
	call FarLoadAllOBJPalettes                                      ; $12b1

; Load tile map
	ld   de, _SCRN0                                                 ; $12b4
	ld   a, $00                                                     ; $12b7
	ldh  [rVBK], a                                                  ; $12b9
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $12bb
	ld   hl, TileMap_CyberFront                                     ; $12be
	ld   a, BANK(TileMap_CyberFront)                                ; $12c1
	call FarRectCopy                                                ; $12c3

; Load tile attr
	ld   de, _SCRN0                                                 ; $12c6
	ld   a, $01                                                     ; $12c9
	ldh  [rVBK], a                                                  ; $12cb
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $12cd
	ld   a, BANK(TileAttr_CyberFront)                               ; $12d0
	call FarRectCopy                                                ; $12d2

; Load tile data
	ld   de, _VRAM                                                  ; $12d5
	ld   bc, Gfx_CyberFront.end-Gfx_CyberFront                      ; $12d8
	ld   a, $00                                                     ; $12db
	ldh  [rVBK], a                                                  ; $12dd
	ld   a, BANK(Gfx_CyberFront)                                    ; $12df
	ld   hl, Gfx_CyberFront                                         ; $12e1
	call FarMemCopy                                                 ; $12e4

; Enable vblank int, set lcdc
	ld   a, $00                                                     ; $12e7
	ldh  [rIF], a                                                   ; $12e9
	ld   a, IEF_VBLANK                                              ; $12eb
	ldh  [rIE], a                                                   ; $12ed
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $12ef
	ldh  [rLCDC], a                                                 ; $12f1

; Start intro script
	ei                                                              ; $12f3
	M_StartMainScript 0, IntroScript

; Set game state to do nothing
	ld   a, GS_INTRO_MAIN                                           ; $12fd
	ld   [wGameState], a                                            ; $12ff
	ret                                                             ; $1302


GameState0f_IntroMain:
	ret                                                             ; $1303


GameState0c_TitleScreenInit:
; Clear scripts, scroll, oam, palettes
	call InitScriptStructs                                          ; $1304
	call ClearScrollOamSetAllPalsAffectedByFade                     ; $1307

; Set default stub interrupt funcs
	di                                                              ; $130a
	ld   a, LOW(StubInterruptFunc)                                  ; $130b
	ld   [wVBlankInterruptFunc], a                                  ; $130d
	ld   a, HIGH(StubInterruptFunc)                                 ; $1310
	ld   [wVBlankInterruptFunc+1], a                                ; $1312
	ld   a, LOW(StubInterruptFunc)                                  ; $1315
	ld   [wLCDCInterruptFunc], a                                    ; $1317
	ld   a, HIGH(StubInterruptFunc)                                 ; $131a
	ld   [wLCDCInterruptFunc+1], a                                  ; $131c

; Only vlank interrupt, and turn on LCD
	ld   a, $00                                                     ; $131f
	ldh  [rIF], a                                                   ; $1321
	ld   a, IEF_VBLANK                                              ; $1323
	ldh  [rIE], a                                                   ; $1325
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $1327
	ldh  [rLCDC], a                                                 ; $1329

; Set BG and OBJ palettes - to fade in from black
	ei                                                              ; $132b
	ld   b, BANK(Palettes_TitleScreen)                              ; $132c
	ld   hl, Palettes_TitleScreen                                   ; $132e
	call SetBGPaletteSrc                                            ; $1331
	ld   a, $20                                                     ; $1334
	ld   [wPaletteFadeAmount], a                                    ; $1336
	ld   a, $01                                                     ; $1339
	ld   [wLoadPalettesFromRam], a                                  ; $133b

	ld   b, BANK(Palettes_TitleScreen)                              ; $133e
	ld   hl, Palettes_TitleScreen                                   ; $1340
	call SetOBJPaletteSrc                                           ; $1343
	ld   a, $20                                                     ; $1346
	ld   [wPaletteFadeAmount], a                                    ; $1348
	ld   a, $01                                                     ; $134b
	ld   [wLoadPalettesFromRam], a                                  ; $134d

; Set script, then main game state
	M_StartMainScript 0, TitleScreenScript
	
	ld   a, GS_TITLE_SCREEN_MAIN                                    ; $1359
	ld   [wGameState], a                                            ; $135b

; Mute music
	push af                                                         ; $135e
	lda MUS_NULL                                                    ; $135f
	call PlaySound                                                  ; $1360
	pop  af                                                         ; $1363
	ret                                                             ; $1364


GameState0d_TitleScreenMain:
	ret                                                             ; $1365


GameState23_TitleScreenOptsInit:
; Clear scripts, scroll, oam, palettes
	call InitScriptStructs                                          ; $1366
	call ClearScrollOamSetAllPalsAffectedByFade                     ; $1369

; Set no special interrupts functionality
	di                                                              ; $136c
	ld   a, LOW(StubInterruptFunc)                                  ; $136d
	ld   [wVBlankInterruptFunc], a                                  ; $136f
	ld   a, HIGH(StubInterruptFunc)                                 ; $1372
	ld   [wVBlankInterruptFunc+1], a                                ; $1374
	ld   a, LOW(StubInterruptFunc)                                  ; $1377
	ld   [wLCDCInterruptFunc], a                                    ; $1379
	ld   a, HIGH(StubInterruptFunc)                                 ; $137c
	ld   [wLCDCInterruptFunc+1], a                                  ; $137e

; Allow vblank and turn on CLD
	ld   a, $00                                                     ; $1381
	ldh  [rIF], a                                                   ; $1383
	ld   a, IEF_VBLANK                                              ; $1385
	ldh  [rIE], a                                                   ; $1387
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $1389
	ldh  [rLCDC], a                                                 ; $138b

; Load BG and OBJ palettes - to fade in from black
	ei                                                              ; $138d
	ld   b, BANK(Palettes_TitleScreenOpts)                          ; $138e
	ld   hl, Palettes_TitleScreenOpts                               ; $1390
	call SetBGPaletteSrc                                            ; $1393
	ld   a, $20                                                     ; $1396
	ld   [wPaletteFadeAmount], a                                    ; $1398
	ld   a, $01                                                     ; $139b
	ld   [wLoadPalettesFromRam], a                                  ; $139d

	ld   b, BANK(Palettes_TitleScreenOpts)                          ; $13a0
	ld   hl, Palettes_TitleScreenOpts                               ; $13a2
	call SetOBJPaletteSrc                                           ; $13a5
	ld   a, $20                                                     ; $13a8
	ld   [wPaletteFadeAmount], a                                    ; $13aa
	ld   a, $01                                                     ; $13ad
	ld   [wLoadPalettesFromRam], a                                  ; $13af

; Start main script, then stub state
	M_StartMainScript 0, TitleScreenOptsScript
	ld   a, GS_TITLE_SCREEN_OPTS_MAIN                               ; $13bb
	ld   [wGameState], a                                            ; $13bd
	ret                                                             ; $13c0


GameState24_TitleScreenOptsMain:
	ret                                                             ; $13c1


GameState00_InGameInit:
; Clear scripts, scroll, oam and palettes
	call InitScriptStructs                                          ; $13c2
	call ClearScrollOamSetAllPalsAffectedByFade                     ; $13c5

; Start with stubbing vblank and lcdc interrupts
	di                                                              ; $13c8
	ld   a, LOW(StubInterruptFunc)                                  ; $13c9
	ld   [wVBlankInterruptFunc], a                                  ; $13cb
	ld   a, HIGH(StubInterruptFunc)                                 ; $13ce
	ld   [wVBlankInterruptFunc+1], a                                ; $13d0
	ld   a, LOW(StubInterruptFunc)                                  ; $13d3
	ld   [wLCDCInterruptFunc], a                                    ; $13d5
	ld   a, HIGH(StubInterruptFunc)                                 ; $13d8
	ld   [wLCDCInterruptFunc+1], a                                  ; $13da

; Allow both vblanks, turn on LCD, and have LCDC trigger during hblank
	ld   a, $00                                                     ; $13dd
	ldh  [rIF], a                                                   ; $13df
	ld   a, IEF_LCDC|IEF_VBLANK                                     ; $13e1
	ldh  [rIE], a                                                   ; $13e3
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $13e5
	ldh  [rLCDC], a                                                 ; $13e7
	ld   a, STATF_MODE00                                            ; $13e9
	ldh  [rSTAT], a                                                 ; $13eb

; Set max brake, no texts and no events
	ei                                                              ; $13ed
	ld   a, $09                                                     ; $13ee
	ld   [wBrakeAppliedIdx], a                                      ; $13f0
	ld   a, IGS_TEXT_NONE                                           ; $13f3
	ld   [wInGameOnSceneryTextIdx], a                               ; $13f5
	ld   a, EVENT_NONE                                              ; $13f8
	ld   [wInGameEventIdx1], a                                      ; $13fa

; Update lever data in vblank
	ld   a, $01                                                     ; $13fd
	ld   [wShouldUpdateAccelLeverTileData], a                       ; $13ff
	ld   a, $01                                                     ; $1402
	ld   [wShouldUpdateBrakeLeverTileData], a                       ; $1404

; Default continue text, allow updating top-left box, start at anim idx 10 in section
	ld   a, CONT_TEXT_USE_COASTING-1                                ; $1407
	ld   [wContinueScreenHighNybSetForTimeOutTextLowNybIsBottomTextMinus1], a ; $1409
	ld   a, $ff                                                     ; $140c
	ld   [wPrevMoreStationsToSkip], a                               ; $140e
	ld   a, $0a                                                     ; $1411
	ld   [wInGameBGAnimIdxWithinSection], a                         ; $1413

; Clear some defaults, states, streaks and counters
	xor  a                                                          ; $1416
	ld   [wFinishedInGame], a                                       ; $1417
	ld   [wApproachingNextStationToStopAt], a                       ; $141a
	ld   [wPoorStationStructureAcceleration], a                     ; $141d
	ld   [wUnusedVar_d13f], a                                       ; $1420
	ld   [wUnusedVar_d0f0], a                                       ; $1423
	ld   [wInGameCurrSubSpeed], a                                   ; $1426
	ld   [wInGameCurrSpeed], a                                      ; $1429
	ld   [wUnusedMillimeters], a                                    ; $142c
	ld   [wInGamePassedDestTime], a                                 ; $142f
	ld   [w1IfIgnoredATSOp2IfIgnoredSignal], a                      ; $1432
	ld   [wAccelerationIdx], a                                      ; $1435
	ld   [wInGameIsPaused], a                                       ; $1438
	ld   [wSlopeSpeedIncrease], a                                   ; $143b
	ld   [wSlopeSpeedIncrease+1], a                                 ; $143e
	ld   [wUnchangedVarSetTo0_d133], a                              ; $1441
	ld   [wNotMovingCounter], a                                     ; $1444
	ld   [wNotMovingCounter+1], a                                   ; $1447
	ld   [wCounterForBrakingAtNonLowSpeeds], a                      ; $144a
	ld   [wAppliedExtremeBraking], a                                ; $144d
	ld   [wCurrSpeedLimitState], a                                  ; $1450
	ld   [wCustomSpeedLimitOrStopState], a                          ; $1453
	ld   [wInGameRightMetaSection], a                               ; $1456
	ld   [wCanStartProcessingInGameEvents], a                       ; $1459
	ld   [wInGameInfoEventIdx], a                                   ; $145c
	ld   [wInGameEventIdx2], a                                      ; $145f
	ld   [wCounterToPressSirenBeforeBeingPenalized], a              ; $1462
	ld   [wCounterToPressSirenForBonusPts], a                       ; $1465
	ld   [wShouldChangeToTrainLineAOnRouteDisplay], a               ; $1468
	ld   [wCounterToCheckIfAnimatingScenery], a                     ; $146b
	ld   [wCounterToCheckIfAnimatingScenery+1], a                   ; $146e
	ld   [wShouldUpdateInGameSceneryTileData], a                    ; $1471

; In-game init functions
	CallFromBank0 SetBaseTopLeftBoxDetails
	CallFromBank0 GetTrainLinesOverspeedingSpeed
	CallFromBank0 SetNoticeDistanceForScenariosFromTrainLineAndDifficulty
	CallFromBank0 SetSkyColorForLocation
	call LoadInitialTrainLocationsMetadata                          ; $1494
	CallFromBank0 CheckIfMoreStationsToSkip
	CallFromBank0 SetCurrLocationsStartingCurrTime
	CallFromBank0 SetDestinationTimeBasedOnCurrLocation

; Load tile map and attr based on control scheme
	ld   a, [wControlSchemeIs1Handed]                               ; $14af
	or   a                                                          ; $14b2
	jr   z, .oneHanded                                              ; $14b3

; 2-handed
	ld   de, _SCRN0                                                 ; $14b5
	ld   a, $00                                                     ; $14b8
	ldh  [rVBK], a                                                  ; $14ba
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $14bc
	ld   hl, TileMap_InGame2Handed                                  ; $14bf
	ld   a, BANK(TileMap_InGame2Handed)                             ; $14c2
	call FarRectCopyRowPerFrame                                     ; $14c4

	ld   de, _SCRN0                                                 ; $14c7
	ld   a, $01                                                     ; $14ca
	ldh  [rVBK], a                                                  ; $14cc
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $14ce
	ld   a, BANK(TileAttr_InGame2Handed)                            ; $14d1
	call FarRectCopyRowPerFrame                                     ; $14d3
	jr   .afterControlScheme                                        ; $14d6

.oneHanded:
	ld   de, _SCRN0                                                 ; $14d8
	ld   a, $00                                                     ; $14db
	ldh  [rVBK], a                                                  ; $14dd
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $14df
	ld   hl, TileMap_InGame1Handed                                  ; $14e2
	ld   a, BANK(TileMap_InGame1Handed)                             ; $14e5
	call FarRectCopyRowPerFrame                                     ; $14e7

	ld   de, _SCRN0                                                 ; $14ea
	ld   a, $01                                                     ; $14ed
	ldh  [rVBK], a                                                  ; $14ef
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $14f1
	ld   a, BANK(TileAttr_InGame1Handed)                            ; $14f4
	call FarRectCopyRowPerFrame                                     ; $14f6

.afterControlScheme:
; Load tile data in both banks
	ld   a, $00                                                     ; $14f9
	ldh  [rVBK], a                                                  ; $14fb
	ld   b, BANK(Gfx_InGameBank0)                                   ; $14fd
	ld   hl, Gfx_InGameBank0                                        ; $14ff
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $1502

	ld   a, $01                                                     ; $1505
	ldh  [rVBK], a                                                  ; $1507
	ld   b, BANK(Gfx_InGameBank1)                                   ; $1509
	ld   hl, Gfx_InGameBank1                                        ; $150b
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $150e

; Get base tile idxes to display in-game, then display destination time
	CallFromBank0 GetTileIdxesForInGameDisplay
	waitForRequestedVBlank
	CallFromBank0 DisplayInGameDestinationTime
	call UpdateSound                                                ; $152e

; Start in-game scripts
	M_StartMainScript 0, InGameScript0_HandleLoadingTileDataSources
	M_StartMainScript 1, InGameScript1_HandleTrainRails
	M_StartMainScript 2, InGameScript2_InitAndHandlePause
	M_StartMainScript 3, InGameScript3_HandleDemo
	M_StartMainScript 4, InGameScript4_HandleOnSceneryText
	M_StartMainScript 5, InGameScript5_HandleMiscellaneousScenarios
	M_StartMainScript 6, InGameScript6_HandleStartingEvent
	M_StartMainScript 7, InGameScript7_HandleSpeedLimitAndATCScenarios

; Clear counter vars and set main loop state
	CallFromBank0 ClearInGameFrameCtrAndIfSecondPassed
	ld   a, GS_IN_GAME_MAIN                                         ; $1581
	ld   [wGameState], a                                            ; $1583

; Set all palettes to black - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $1586
	ld   hl, Palettes_AllBlack                                      ; $1588
	call SetBGPaletteSrc                                            ; $158b
	xor  a                                                          ; $158e
	ld   [wPaletteFadeAmount], a                                    ; $158f
	ld   [wLoadPalettesFromRam], a                                  ; $1592
	ld   a, $01                                                     ; $1595
	ld   [wLoadBGPalettesFromRom], a                                ; $1597

	ld   b, BANK(Palettes_AllBlack)                                 ; $159a
	ld   hl, Palettes_AllBlack                                      ; $159c
	call SetOBJPaletteSrc                                           ; $159f
	xor  a                                                          ; $15a2
	ld   [wPaletteFadeAmount], a                                    ; $15a3
	ld   [wLoadPalettesFromRam], a                                  ; $15a6
	ld   a, $01                                                     ; $15a9
	ld   [wLoadOBJPalettesFromRom], a                               ; $15ab

	ret                                                             ; $15ae


LoadInitialTrainLocationsMetadata:
; Preserve curr rom bank, and set frame meta idxes rom bank
	ld   a, [wRomBank]                                              ; $15af
	push af                                                         ; $15b2
	ld   a, BANK(TrainLineAddressesForLocationFrameMetaData)        ; $15b3
	call SetRomBank1stHalfOfRom                                     ; $15b5

; HL = base addr for train line
	ld   a, [wTrainLinesAddrForItsMetaFrameIdxes]                   ; $15b8
	ld   l, a                                                       ; $15bb
	ld   a, [wTrainLinesAddrForItsMetaFrameIdxes+1]                 ; $15bc
	ld   h, a                                                       ; $15bf

; HL = octuple location index into table
	ld   a, [wLocationIdxInTrainLine]                               ; $15c0
	add  a                                                          ; $15c3
	add  a                                                          ; $15c4
	add  a                                                          ; $15c5
	ld   e, a                                                       ; $15c6
	ld   d, $00                                                     ; $15c7
	add  hl, de                                                     ; $15c9

; Reset cm distance to next station
	ld   a, $00                                                     ; $15ca
	ld   [wCentimeterPartOfDistanceBeforeNextStation], a            ; $15cc

; 1st word has base address for getting location's section's frame meta idxes
	ld   a, [hl+]                                                   ; $15cf
	ld   [wBaseAddrForTrainLineLocationsMetaFrameIdxes], a          ; $15d0
	ld   a, [hl+]                                                   ; $15d3
	ld   [wBaseAddrForTrainLineLocationsMetaFrameIdxes+1], a        ; $15d4

; 2nd word is distance to next location
	ld   a, [hl+]                                                   ; $15d7
	ld   [wMeterPartOfDistanceBeforeNextStation], a                 ; $15d8
	ld   a, [hl+]                                                   ; $15db
	ld   [wMeterPartOfDistanceBeforeNextStation+1], a               ; $15dc

; Byte 4 after is num stations to skip
	ld   a, [hl+]                                                   ; $15df
	ld   [wNumStationsLeftToSkip], a                                ; $15e0

; Load addresses for the 2 types of scenarios
	ld   a, [hl+]                                                   ; $15e3
	ld   [wCurrAddrForTrainLineLocationsSpeedLimitAndStopScenarios], a ; $15e4
	ld   [wCurrAddrForTrainLineLocationsMiscScenarios], a           ; $15e7
	ld   a, [hl]                                                    ; $15ea
	ld   [wCurrAddrForTrainLineLocationsSpeedLimitAndStopScenarios+1], a ; $15eb
	ld   [wCurrAddrForTrainLineLocationsMiscScenarios+1], a         ; $15ee

	pop  af                                                         ; $15f1
	call SetRomBank1stHalfOfRom                                     ; $15f2
	ret                                                             ; $15f5


LoadTrainLocationsMetadataExceptStationsToSkip::
; Preserve curr rom bank, and set frame meta idxes rom bank
	ld   a, [wRomBank]                                              ; $15f6
	push af                                                         ; $15f9
	ld   a, BANK(TrainLineAddressesForLocationFrameMetaData)        ; $15fa
	call SetRomBank1stHalfOfRom                                     ; $15fc
	
; HL = base addr for train line
	ld   a, [wTrainLinesAddrForItsMetaFrameIdxes]                   ; $15ff
	ld   l, a                                                       ; $1602
	ld   a, [wTrainLinesAddrForItsMetaFrameIdxes+1]                 ; $1603
	ld   h, a                                                       ; $1606

; HL = location idx * 8 as offset into train line addr
	ld   a, [wLocationIdxInTrainLine]                               ; $1607
	add  a                                                          ; $160a
	add  a                                                          ; $160b
	add  a                                                          ; $160c
	ld   e, a                                                       ; $160d
	ld   d, $00                                                     ; $160e
	add  hl, de                                                     ; $1610

; Reset cm before next station
	ld   a, $00                                                     ; $1611
	ld   [wCentimeterPartOfDistanceBeforeNextStation], a            ; $1613

; 1st word is the addr of the location's meta frame idxes
	ld   a, [hl+]                                                   ; $1616
	ld   [wBaseAddrForTrainLineLocationsMetaFrameIdxes], a          ; $1617
	ld   a, [hl+]                                                   ; $161a
	ld   [wBaseAddrForTrainLineLocationsMetaFrameIdxes+1], a        ; $161b

; 2nd word is the meter distance to the next state
	ld   a, [hl+]                                                   ; $161e
	ld   [wMeterPartOfDistanceBeforeNextStation], a                 ; $161f
	ld   a, [hl+]                                                   ; $1622
	ld   [wMeterPartOfDistanceBeforeNextStation+1], a               ; $1623

; Load addresses for new scenarios, not re-loading stations to skip
	inc  hl                                                         ; $1626
	ld   a, [hl+]                                                   ; $1627
	ld   [wCurrAddrForTrainLineLocationsSpeedLimitAndStopScenarios], a ; $1628
	ld   [wCurrAddrForTrainLineLocationsMiscScenarios], a           ; $162b
	ld   a, [hl]                                                    ; $162e
	ld   [wCurrAddrForTrainLineLocationsSpeedLimitAndStopScenarios+1], a ; $162f
	ld   [wCurrAddrForTrainLineLocationsMiscScenarios+1], a         ; $1632

; Reset section in location, and animate from the 1st section's 10th (of 15) frame
	ld   a, $0a                                                     ; $1635
	ld   [wInGameBGAnimIdxWithinSection], a                         ; $1637
	ld   a, $00                                                     ; $163a
	ld   [wInGameBGSectionWithinLocation], a                        ; $163c
	ld   a, $00                                                     ; $163f
	ld   [wInGameBGSectionWithinLocation+1], a                      ; $1641

	pop  af                                                         ; $1644
	call SetRomBank1stHalfOfRom                                     ; $1645
	ret                                                             ; $1648


GameState06_DepartureInfoScreenInit:
; Clear scripts, oam and palettes
	call InitScriptStructs                                          ; $1649
	call ClearScrollOamSetAllPalsAffectedByFade                     ; $164c

; Preserve wram bank and use bank 2
	di                                                              ; $164f
	ldh  a, [rSVBK]                                                 ; $1650
	and  $03                                                        ; $1652
	push af                                                         ; $1654
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $1655
	ldh  [rSVBK], a                                                 ; $1657

; Clear tile map and attr buffer and restore wram bank
	ld   hl, wIntroCutsceneTileMapBuffer                            ; $1659
	ld   de, wIntroCutsceneTileAttrBuffer.end-1                     ; $165c
	ld   b, $00                                                     ; $165f
	inc  de                                                         ; $1661
	call SetB_HLtoDE                                                ; $1662

	pop  af                                                         ; $1665
	ldh  [rSVBK], a                                                 ; $1666

; Set a vblank interrupt func, and stub lcdc's
	ld   a, LOW(VBlankInterruptFunc_DepartureInfoScreen)            ; $1668
	ld   [wVBlankInterruptFunc], a                                  ; $166a
	ld   a, HIGH(VBlankInterruptFunc_DepartureInfoScreen)           ; $166d
	ld   [wVBlankInterruptFunc+1], a                                ; $166f
	ld   a, LOW(StubInterruptFunc)                                  ; $1672
	ld   [wLCDCInterruptFunc], a                                    ; $1674
	ld   a, HIGH(StubInterruptFunc)                                 ; $1677
	ld   [wLCDCInterruptFunc+1], a                                  ; $1679

; Enable only vblank interrupt and turn on LCD
	ld   a, $00                                                     ; $167c
	ldh  [rIF], a                                                   ; $167e
	ld   a, IEF_VBLANK                                              ; $1680
	ldh  [rIE], a                                                   ; $1682
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $1684
	ldh  [rLCDC], a                                                 ; $1686
	ei                                                              ; $1688

; Start script
	M_StartMainScript 0, DepartureInfoScreenScript

; Again, enable only vblank interrupt and turn on LCD
	ld   a, $00                                                     ; $1692
	ldh  [rIF], a                                                   ; $1694
	ld   a, IEF_VBLANK                                              ; $1696
	ldh  [rIE], a                                                   ; $1698
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $169a
	ldh  [rLCDC], a                                                 ; $169c

; Transfer tile data to vram bank 0
	ld   a, $00                                                     ; $169e
	ldh  [rVBK], a                                                  ; $16a0
	ld   b, BANK(Gfx_DepartureInfoBank0)                            ; $16a2
	ld   hl, Gfx_DepartureInfoBank0                                 ; $16a4
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $16a7

; Transfer tile data to vram bank 1
	ld   a, $01                                                     ; $16aa
	ldh  [rVBK], a                                                  ; $16ac
	ld   b, BANK(Gfx_DepartureInfoBank1)                            ; $16ae
	ld   hl, Gfx_DepartureInfoBank1                                 ; $16b0
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $16b3

; Preserve wram bank and use bank 2
	ldh  a, [rSVBK]                                                 ; $16b6
	and  $03                                                        ; $16b8
	push af                                                         ; $16ba
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $16bb
	ldh  [rSVBK], a                                                 ; $16bd

; Copy from rom into tile map and attr ram buffer (for left half of info box)
	ld   de, wIntroCutsceneTileMapBuffer                            ; $16bf
	ldbc SCREEN_TILE_HEIGHT, $0a                                    ; $16c2
	ld   hl, TileMap_DepartureInfoBoxLeftHalf                       ; $16c5
	ld   a, BANK(TileMap_DepartureInfoBoxLeftHalf)                  ; $16c8
	call FarRectCopy                                                ; $16ca

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $16cd
	ld   a, $01                                                     ; $16d0
	ldh  [rVBK], a                                                  ; $16d2
	ldbc SCREEN_TILE_HEIGHT, $0a                                    ; $16d4
	ld   a, BANK(TileAttr_DepartureInfoBoxLeftHalf)                 ; $16d7
	call FarRectCopy                                                ; $16d9

; Restore wram bank
	pop  af                                                         ; $16dc
	ldh  [rSVBK], a                                                 ; $16dd

; Load BG and OBJ palettes - no fade
	ld   b, BANK(Palettes_DepartureInfo)                            ; $16df
	ld   hl, Palettes_DepartureInfo                                 ; $16e1
	call SetBGPaletteSrc                                            ; $16e4
	xor  a                                                          ; $16e7
	ld   [wPaletteFadeAmount], a                                    ; $16e8
	ld   [wLoadPalettesFromRam], a                                  ; $16eb
	ld   a, $01                                                     ; $16ee
	ld   [wLoadBGPalettesFromRom], a                                ; $16f0

	ld   b, BANK(Palettes_DepartureInfo)                            ; $16f3
	ld   hl, Palettes_DepartureInfo                                 ; $16f5
	call SetOBJPaletteSrc                                           ; $16f8
	xor  a                                                          ; $16fb
	ld   [wPaletteFadeAmount], a                                    ; $16fc
	ld   [wLoadPalettesFromRam], a                                  ; $16ff
	ld   a, $01                                                     ; $1702
	ld   [wLoadOBJPalettesFromRom], a                               ; $1704

; Set main stub state, and start SCX away (will scroll stuff into view later)
	ld   a, GS_DEPARTURE_INFO_SCREEN_MAIN                           ; $1707
	ld   [wGameState], a                                            ; $1709
	ld   a, $80                                                     ; $170c
	ld   [wSCX], a                                                  ; $170e

; Reset penalty values for when we 1st encounter a Location Done screen
	CallFromBank0 ResetScoringPenaltyValues

; HL = address for train line's metadata
	ld   a, BANK(TrainLineAddressesForLocationFrameMetaData)        ; $1719
	call SetRomBank1stHalfOfRom                                     ; $171b
	ld   a, [wSelectedTrainLine]                                    ; $171e
	add  a                                                          ; $1721
	ld   hl, TrainLineAddressesForLocationFrameMetaData             ; $1722
	ld   e, a                                                       ; $1725
	ld   d, $00                                                     ; $1726
	add  hl, de                                                     ; $1728

; 1st word is the meta frame idxes address
	ld   a, [hl+]                                                   ; $1729
	ld   [wTrainLinesAddrForItsMetaFrameIdxes], a                   ; $172a
	ld   a, [hl]                                                    ; $172d
	ld   [wTrainLinesAddrForItsMetaFrameIdxes+1], a                 ; $172e

; Clear streaks and departure info checks, then reset penalties
	ld   a, $00                                                     ; $1731
	ld   [wCompletedTrainLine], a                                   ; $1733
	ld   a, $00                                                     ; $1736
	ld   [wUnusedVars_d16f], a                                      ; $1738
	ld   a, $ff                                                     ; $173b
	ld   [wUnusedVars_d16f+1], a                                    ; $173d
	ld   a, $00                                                     ; $1740
	ld   [wUnusedVars_d16f+2], a                                    ; $1742
	ld   a, $01                                                     ; $1745
	ld   [wStartedJourneyWithoutSeeingLocationDone], a              ; $1747
	ld   a, $00                                                     ; $174a
	ld   [wInGameDistanceCounter], a                                ; $174c
	ld   a, $00                                                     ; $174f
	ld   [wInGameDistanceCounter+1], a                              ; $1751
	ld   a, $00                                                     ; $1754
	ld   [wLocationIdxInTrainLine], a                               ; $1756
	ld   a, $00                                                     ; $1759
	ld   [wGreatFinishStreak], a                                    ; $175b
	ld   a, $00                                                     ; $175e
	ld   [wTotalGoodCommsBonusPenaltiesAllowedSinceDepartureOrContinue], a ; $1760
	ld   a, $00                                                     ; $1763
	ld   [wIndexOfCustomSpeedLimitOrStopEv], a                      ; $1765
	ld   a, $00                                                     ; $1768
	ld   [wTotalTimeAheadOfStoppingStationsSinceDepartureOrContinue], a ; $176a
	ld   a, $00                                                     ; $176d
	ld   [wTrainLineIdxToResumeToAfterContinue], a                  ; $176f
	ld   a, $00                                                     ; $1772
	ld   [wNumTrainsUnlockedSinceDeparture], a                      ; $1774
	CallFromBank0 ResetPenaltiesAllowed
	ret                                                             ; $177f


GameState07_DepartureInfoScreenMain:
	ret                                                             ; $1780


Script_FadeOut::
	SCR_StoreByteInAddr wLoadPalettesFromRam, $01

; Get regular palettes, fade to black slightly..
DEF CURR_FADE = $04
rept 8
	SCR_ExecAsmBelow
	ld   a, CURR_FADE                                               ; $1786
	ld   [wPaletteFadeAmount], a                                    ; $1788
	ld   a, $01                                                     ; $178b
	ld   [wLoadPalettesFromRam], a                                  ; $178d
	call ProcessScriptsFromCurrLoc                                  ; $1790
	SCR_Delay $02
CURR_FADE = CURR_FADE + 4
endr

	SCR_Ret
	
	
Script_FadeIn::
DEF CURR_FADE = $20
rept 9
	SCR_ExecAsmBelow
	ld   a, CURR_FADE                                               ; $1807
	ld   [wPaletteFadeAmount], a                                    ; $1809
	ld   a, $01                                                     ; $180c
	ld   [wLoadPalettesFromRam], a                                  ; $180e
	call ProcessScriptsFromCurrLoc                                  ; $1811
	SCR_Delay $02
CURR_FADE = CURR_FADE - 4
endr

; Palettes to now just load from rom
	SCR_StoreByteInAddr wLoadPalettesFromRam, $00
	SCR_Ret
	

FinalLocationIdxInTrainLine::
	db $05, $08, $09, $0d
	db $08, $0d, $09, $07
	db $09, $17, $01, $09


SetContinueTextToUseCoasting::
	ld   a, CONT_TEXT_USE_COASTING-1                                ; $18a7
	ld   [wContinueScreenHighNybSetForTimeOutTextLowNybIsBottomTextMinus1], a ; $18a9
	ret                                                             ; $18ac


; unused - SetContinueTextToBrakesTooStrong
	ld   a, CONT_TEXT_BRAKES_TOO_STRONG-1                           ; $18ad
	ld   [wContinueScreenHighNybSetForTimeOutTextLowNybIsBottomTextMinus1], a ; $18af
	ret                                                             ; $18b2


; HL = meter part of distance to next station
IfApplicableSetContinuTextToProtectStation::
; If high byte is non-0, consider low meters as $10 (max)
	ld   a, h                                                       ; $18b3
	or   a                                                          ; $18b4
	jr   z, :+                                                      ; $18b5
	ld   l, $10                                                     ; $18b7

; Return if distance is good, else continue text will say to protect the station
:	ld   a, l                                                       ; $18b9
	cp   $0f                                                        ; $18ba
	ret  c                                                          ; $18bc

	ld   a, CONT_TEXT_PLEASE_PROTECT_STATION-1                      ; $18bd
	ld   [wContinueScreenHighNybSetForTimeOutTextLowNybIsBottomTextMinus1], a ; $18bf
	ret                                                             ; $18c2


; unused - SetContinueTextToProtectSignal
	ld   a, CONT_TEXT_PLEASE_PROTECT_SIGNAL-1                       ; $18c3
	ld   [wContinueScreenHighNybSetForTimeOutTextLowNybIsBottomTextMinus1], a ; $18c5
	ret                                                             ; $18c8


HLequHtimes60plusC::
	ld   l, 60                                                      ; $18c9
	call HLequHtimesL                                               ; $18cb
	ld   b, $00                                                     ; $18ce
	add  hl, bc                                                     ; $18d0
	ret                                                             ; $18d1


; B - hdma5, ie (num bytes / $10)-1
; DE - big-endian dest
; HL - big-endian source
StartHDMATransfer::
	ld   a, h                                                       ; $18d2
	ldh  [rHDMA1], a                                                ; $18d3
	ld   a, l                                                       ; $18d5
	ldh  [rHDMA2], a                                                ; $18d6
	ld   a, d                                                       ; $18d8
	ldh  [rHDMA3], a                                                ; $18d9
	ld   a, e                                                       ; $18db
	ldh  [rHDMA4], a                                                ; $18dc
	ld   a, b                                                       ; $18de
	ldh  [rHDMA5], a                                                ; $18df
	ret                                                             ; $18e1


; DE - dest addr
; HL - address of 5 bytes of params, X offset, y offset, bank and addr of source
FarLoadSpriteOam::
; Preserve start of 5 bytes, and rom bank
	push hl                                                         ; $18e2
	ld   a, [wRomBank]                                              ; $18e3
	push af                                                         ; $18e6

; Store X, then Y offset from first 2 bytes
	ld   a, [hl+]                                                   ; $18e7
	ldh  [hFarLoadSpriteOamXOffset], a                              ; $18e8
	ld   a, [hl+]                                                   ; $18ea
	ldh  [hFarLoadSpriteOamYOffset], a                              ; $18eb

; 3rd byte is rom bank, set just below
	ld   a, [hl+]                                                   ; $18ed
	ld   b, a                                                       ; $18ee

; HL = source address of data
	ld   a, [hl+]                                                   ; $18ef
	ld   h, [hl]                                                    ; $18f0
	ld   l, a                                                       ; $18f1

	ld   a, b                                                       ; $18f2
	call SetRomBank1stHalfOfRom                                     ; $18f3

; 1st byte in source is num loops
	ld   a, [hl+]                                                   ; $18f6
	ld   b, a                                                       ; $18f7

.loop:
; Add y offset onto next byte in source
	ldh  a, [hFarLoadSpriteOamYOffset]                              ; $18f8
	ld   c, a                                                       ; $18fa
	ld   a, [hl+]                                                   ; $18fb
	add  c                                                          ; $18fc
	ld   [de], a                                                    ; $18fd
	inc  de                                                         ; $18fe

; Add x offset onto next byte in source
	ldh  a, [hFarLoadSpriteOamXOffset]                              ; $18ff
	ld   c, a                                                       ; $1901
	ld   a, [hl+]                                                   ; $1902
	add  c                                                          ; $1903
	ld   [de], a                                                    ; $1904
	inc  de                                                         ; $1905

; Next 2 bytes in source are for tile idx and attr
	ld   a, [hl+]                                                   ; $1906
	ld   [de], a                                                    ; $1907
	inc  de                                                         ; $1908
	ld   a, [hl+]                                                   ; $1909
	ld   [de], a                                                    ; $190a
	inc  de                                                         ; $190b

	dec  b                                                          ; $190c
	jr   nz, .loop                                                  ; $190d

; Restore rom bank and start of 5 bytes
	pop  af                                                         ; $190f
	call SetRomBank1stHalfOfRom                                     ; $1910
	pop  hl                                                         ; $1913
	ret                                                             ; $1914


; HL - address of seconds part of time vars
Add1SecondToTime::
; Inc seconds
	ld   a, [hl]                                                    ; $1915
	inc  a                                                          ; $1916
	ld   [hl], a                                                    ; $1917
	cp   60                                                         ; $1918
	jr   c, .done                                                   ; $191a

; If 60 done, clear seconds and inc minutes
	xor  a                                                          ; $191c
	ld   [hl+], a                                                   ; $191d
	ld   a, [hl]                                                    ; $191e
	inc  a                                                          ; $191f
	ld   [hl], a                                                    ; $1920
	cp   60                                                         ; $1921
	jr   c, .done                                                   ; $1923

; If 60 done, clear minutes and inc hours
	xor  a                                                          ; $1925
	ld   [hl+], a                                                   ; $1926
	ld   a, [hl]                                                    ; $1927
	inc  a                                                          ; $1928
	ld   [hl], a                                                    ; $1929

.done:
	ret                                                             ; $192a


; HL - address of seconds part of time vars
Sub1SecondToTime::
; Dec seconds
	ld   a, [hl]                                                    ; $192b
	sub  $01                                                        ; $192c
	ld   [hl], a                                                    ; $192e
	jr   nc, .done                                                  ; $192f

; If 0 breached, +60 (to 59), and dec minutes
	add  60                                                         ; $1931
	ld   [hl+], a                                                   ; $1933
	ld   a, [hl]                                                    ; $1934
	sub  $01                                                        ; $1935
	ld   [hl], a                                                    ; $1937
	jr   nc, .done                                                  ; $1938

; If 0 breached, minutes = 59, dec hour
	add  60                                                         ; $193a
	ld   [hl+], a                                                   ; $193c
	ld   a, [hl]                                                    ; $193d
	dec  a                                                          ; $193e
	ld   [hl], a                                                    ; $193f

.done:
	ret                                                             ; $1940


WaitUntilVramJustSafe::
	waitUntilVramBusy
	waitUntilVramSafe
	ret                                                             ; $194d


Trampoline_SetDestinationTimeBasedOnCurrLocation::
	ld   a, [wRomBank]                                              ; $194e
	push af                                                         ; $1951
	CallFromBank0 SetDestinationTimeBasedOnCurrLocation
	pop  af                                                         ; $195a
	call SetRomBank1stHalfOfRom                                     ; $195b
	ret                                                             ; $195e


Trampoline_IncLocationIdxInTrainLine::
	ld   a, [wRomBank]                                              ; $195f
	push af                                                         ; $1962
	CallFromBank0 IncLocationIdxInTrainLine
	pop  af                                                         ; $196b
	call SetRomBank1stHalfOfRom                                     ; $196c
	ret                                                             ; $196f


SubBFromPenaltiesAllowed::
; Never sub penalties if God mode
	ld   a, [wGodModeApplied]                                       ; $1970
	or   a                                                          ; $1973
	ret  nz                                                         ; $1974

; Sub B from penalties allowed, and once <= 0, set it to 0
	ld   a, [wPenaltiesAllowed]                                     ; $1975
	sub  b                                                          ; $1978
	ld   [wPenaltiesAllowed], a                                     ; $1979

	jr   c, .setPenaltiesAllowedTo0                                 ; $197c

	jr   z, .setPenaltiesAllowedTo0                                 ; $197e

	ret                                                             ; $1980

.setPenaltiesAllowedTo0:
	xor  a                                                          ; $1981
	ld   [wPenaltiesAllowed], a                                     ; $1982
	ret                                                             ; $1985


AddBtoPenaltiesAllowed::
; Max of 256 penalties allowed
	ld   a, [wPenaltiesAllowed]                                     ; $1986
	add  b                                                          ; $1989
	jr   nc, :+                                                     ; $198a
	ld   a, $ff                                                     ; $198c
:	ld   [wPenaltiesAllowed], a                                     ; $198e
	ret                                                             ; $1991


GameState29_PrintStartInit:
; Set display interrupts, no LCDC
	di                                                              ; $1992
	ld   a, LOW(VBlankInterrupt_PrintStart)                         ; $1993
	ld   [wVBlankInterruptFunc], a                                  ; $1995
	ld   a, HIGH(VBlankInterrupt_PrintStart)                        ; $1998
	ld   [wVBlankInterruptFunc+1], a                                ; $199a
	ld   a, LOW(StubInterruptFunc)                                  ; $199d
	ld   [wLCDCInterruptFunc], a                                    ; $199f
	ld   a, HIGH(StubInterruptFunc)                                 ; $19a2
	ld   [wLCDCInterruptFunc+1], a                                  ; $19a4
	ei                                                              ; $19a7

; Reset entire state, enable int handler
	ld   a, BANK(GameState2a_PrintStartMain_def)                    ; $19a8
	call SetRomBank1stHalfOfRom                                     ; $19aa
	call ClearHWandRamPrinterVarsAndState_EnableSerialHandler       ; $19ad
	ld   a, $01                                                     ; $19b0
	ld   [wSerialIntHandlerEnabled], a                              ; $19b2

; Clear fragment data, 6 is 7 fragments-1
	ld   a, $00                                                     ; $19b5
	ld   [wPrinterCurrTileDataFragmentIdxToLoad], a                 ; $19b7
	ld   a, $06                                                     ; $19ba
	ld   [wPrinterNumTileDataFragmentsForCurrImage], a              ; $19bc

; Update exposure value to send with print command
	ld   a, [wPrinterChosenExposureValue]                           ; $19bf
	ld   [wPrinterPrintCommandExposure], a                          ; $19c2

; Allow serial comms and vblank interrupt, then set main state
	ld   a, IEF_SERIAL|IEF_VBLANK                                   ; $19c5
	ldh  [rIE], a                                                   ; $19c7
	ld   a, GS_PRINT_START_MAIN                                     ; $19c9
	ld   [wGameState], a                                            ; $19cb

GameState2a_PrintStartMain:
	CallFromBank0 GameState2a_PrintStartMain_def
	ret                                                             ; $19d6


; HL - updated address of location's upcoming scenarios
; Returns distance in DE and scenario idx in B
GetNextTrainLineLocationScenarios::
; Preserve rom bank and set meta table one
	ld   a, [wRomBank]                                              ; $19d7
	push af                                                         ; $19da
	ld   a, BANK(TrainLineAddressesForLocationFrameMetaData)        ; $19db
	call SetRomBank1stHalfOfRom                                     ; $19dd

; Get scenario distance trigger in DE, and scenario idx in B
	ld   a, [hl+]                                                   ; $19e0
	ld   e, a                                                       ; $19e1
	ld   a, [hl+]                                                   ; $19e2
	ld   d, a                                                       ; $19e3
	ld   a, [hl+]                                                   ; $19e4
	ld   b, a                                                       ; $19e5

	pop  af                                                         ; $19e6
	call SetRomBank1stHalfOfRom                                     ; $19e7
	ret                                                             ; $19ea


Trampoline_UpdateCustomRestrictions::
	ld   a, [wRomBank]                                              ; $19eb
	push af                                                         ; $19ee
	CallFromBank0 UpdateCustomRestrictions
	pop  af                                                         ; $19f7
	call SetRomBank1stHalfOfRom                                     ; $19f8
	ret                                                             ; $19fb


PlayDiffSoundEffectBasedOnIfTrainLineA::
; Simply branch and play sound
	ld   a, [wSelectedTrainLine]                                    ; $19fc
	cp   $0a                                                        ; $19ff
	jr   z, .trainLineA                                             ; $1a01

	push af                                                         ; $1a03
	ld   a, SND_01                                                  ; $1a04
	or   MAKE_SOUND_EFFECT                                          ; $1a06
	call PlaySound                                                  ; $1a08
	pop  af                                                         ; $1a0b
	ret                                                             ; $1a0c

.trainLineA:
	push af                                                         ; $1a0d
	ld   a, SND_1e                                                  ; $1a0e
	or   MAKE_SOUND_EFFECT                                          ; $1a10
	call PlaySound                                                  ; $1a12
	pop  af                                                         ; $1a15
	ret                                                             ; $1a16


VBlankInterruptFunc_InGame::
; Return if vblank updates for in-game not ready yet
	ld   a, [wInGameVBlankIntFuncEnabled]                           ; $1a17
	or   a                                                          ; $1a1a
	ret  z                                                          ; $1a1b

; Alternate updated data every other main loop
	ld   a, [wMainLoopCounter]                                      ; $1a1c
	and  $01                                                        ; $1a1f
	jr   nz, .everyOtherMainLoop                                    ; $1a21

; Return if we shouldn't update, otherwise continue and reset this flag
	ld   a, [wShouldUpdateInGameSceneryTileData]                    ; $1a23
	or   a                                                          ; $1a26
	ret  z                                                          ; $1a27

	ld   a, $00                                                     ; $1a28
	ld   [wShouldUpdateInGameSceneryTileData], a                    ; $1a2a

; --
; -- Scenery tile data
; --
	ld   a, $01                                                     ; $1a2d
	ldh  [rVBK], a                                                  ; $1a2f

	ld   a, $01                                                     ; $1a31
	ld   [ROMB1], a                                                 ; $1a33
	ld   a, [wInGameLeftHalfTileDataLowBank]                        ; $1a36
	ld   [ROMB0], a                                                 ; $1a39
	ld   de, _VRAM+$1000                                            ; $1a3c
	ld   a, [wInGameLeftHalfTileDataAddr+1]                         ; $1a3f
	ld   h, a                                                       ; $1a42
	ld   a, [wInGameLeftHalfTileDataAddr]                           ; $1a43
	ld   l, a                                                       ; $1a46
	ld   b, ($400/$10)-1                                            ; $1a47
	call StartHDMATransfer                                          ; $1a49

	ld   a, $01                                                     ; $1a4c
	ld   [ROMB1], a                                                 ; $1a4e
	ld   a, [wInGameRightHalfTileDataLowBank]                       ; $1a51
	ld   [ROMB0], a                                                 ; $1a54
	ld   de, _VRAM+$1400                                            ; $1a57
	ld   a, [wInGameRightHalfTileDataAddr+1]                        ; $1a5a
	ld   h, a                                                       ; $1a5d
	ld   a, [wInGameRightHalfTileDataAddr]                          ; $1a5e
	ld   l, a                                                       ; $1a61
	call StartHDMATransfer                                          ; $1a62

; Distance is recorded at the end of each main loop update
	call RecordCurrDistance                                         ; $1a65
	ld   a, $00                                                     ; $1a68
	ld   [ROMB1], a                                                 ; $1a6a
	ret                                                             ; $1a6d

.everyOtherMainLoop:
	ld   a, [wMainLoopCounter]                                      ; $1a6e
	and  $02                                                        ; $1a71
	jp   nz, .everyOtherOtherMainLoop                               ; $1a73

	ld   a, $00                                                     ; $1a76
	ldh  [rVBK], a                                                  ; $1a78

; --
; -- Curr speed
; --
	ld   de, wInGameCurrSpeedTileIdxes                              ; $1a7a
	ld   hl, _SCRN0+$41                                             ; $1a7d
	ld   a, [de]                                                    ; $1a80
	ld   [hl+], a                                                   ; $1a81
	inc  de                                                         ; $1a82
	ld   a, [de]                                                    ; $1a83
	ld   [hl+], a                                                   ; $1a84
	inc  de                                                         ; $1a85
	ld   a, [de]                                                    ; $1a86
	ld   [hl], a                                                    ; $1a87

; --
; -- Penalties allowed
; --
	ld   de, wInGamePenaltiesTileIdxes                              ; $1a88
	ld   hl, _SCRN0+$46                                             ; $1a8b
	ld   a, [de]                                                    ; $1a8e
	ld   [hl+], a                                                   ; $1a8f
	inc  de                                                         ; $1a90
	ld   a, [de]                                                    ; $1a91
	ld   [hl+], a                                                   ; $1a92
	inc  de                                                         ; $1a93
	ld   a, [de]                                                    ; $1a94
	ld   [hl+], a                                                   ; $1a95
	inc  de                                                         ; $1a96

; Next row
	ld   bc, GB_TILE_WIDTH-3                                        ; $1a97
	add  hl, bc                                                     ; $1a9a
	ld   a, [de]                                                    ; $1a9b
	ld   [hl+], a                                                   ; $1a9c
	inc  de                                                         ; $1a9d
	ld   a, [de]                                                    ; $1a9e
	ld   [hl+], a                                                   ; $1a9f
	inc  de                                                         ; $1aa0
	ld   a, [de]                                                    ; $1aa1
	ld   [hl+], a                                                   ; $1aa2

; --
; -- Brake and acceleration applied level
; --
; Tile data for brake/control scheme-related displays
	ld   a, BANK(Gfx_BrakeAndAccelLevels)                           ; $1aa3
	call SetRomBank1stHalfOfRom                                     ; $1aa5

; Start hdma transfer
	ld   a, [wTileDataSrcForBrakeAndAccelLevel]                     ; $1aa8
	ld   l, a                                                       ; $1aab
	ld   a, [wTileDataSrcForBrakeAndAccelLevel+1]                   ; $1aac
	ld   h, a                                                       ; $1aaf
	ld   de, _VRAM+$900                                             ; $1ab0
	ld   b, ($c0/$10)-1                                             ; $1ab3
	call StartHDMATransfer                                          ; $1ab5

; letter below right meter thing
	ld   a, [wBrakeLevelTileIdxes+1]                                ; $1ab8
	ld   [_SCRN0+$f3], a                                            ; $1abb
	ld   a, [wBrakeLevelTileIdxes]                                  ; $1abe
	ld   [_SCRN0+$113], a                                           ; $1ac1

; Draw right meter if 1-handed, else draw left meter
	ld   a, [wControlSchemeIs1Handed]                               ; $1ac4
	or   a                                                          ; $1ac7
	jr   nz, .oneHanded                                             ; $1ac8

	ld   a, [wAccelLevelTileIdxes+1]                                ; $1aca
	ld   [_SCRN0+$a0], a                                            ; $1acd
	ld   a, [wAccelLevelTileIdxes]                                  ; $1ad0
	ld   [_SCRN0+$c0], a                                            ; $1ad3
	jr   .contAfterCtrlScheme                                       ; $1ad6

.oneHanded:
	ld   a, [wAccelLevelTileIdxes+1]                                ; $1ad8
	ld   [_SCRN0+$152], a                                           ; $1adb
	ld   a, [wAccelLevelTileIdxes]                                  ; $1ade
	ld   [_SCRN0+$172], a                                           ; $1ae1

.contAfterCtrlScheme:

; --
; -- Speed
; --
; If meter, use 4 tiles from the start of the 6
	ld   hl, wInGameDistanceLeftTileIdxes                           ; $1ae4
	ld   a, [wDistanceMeterOption]                                  ; $1ae7
	or   a                                                          ; $1aea
	jr   z, .displayCurrSpeed                                       ; $1aeb

	cp   $01                                                        ; $1aed
	jr   z, .distanceCMValue                                        ; $1aef

; Hidden - display professional text
	ld   a, BANK(TileMapAndAttr_SpeedProfessional)                  ; $1af1
	call SetRomBank1stHalfOfRom                                     ; $1af3
	ld   a, $00                                                     ; $1af6
	ldh  [rVBK], a                                                  ; $1af8
	ld   de, _SCRN0+$224                                            ; $1afa
	ld   hl, TileMapAndAttr_SpeedProfessional                       ; $1afd
rept 5
	ld   a, [hl+]                                                   ; $1b00
	ld   [de], a                                                    ; $1b01
	inc  de                                                         ; $1b02
endr
	ld   a, [hl+]                                                   ; $1b0f
	ld   [de], a                                                    ; $1b10

	ld   a, $01                                                     ; $1b11
	ldh  [rVBK], a                                                  ; $1b13
	ld   de, _SCRN0+$224                                            ; $1b15
rept 5
	ld   a, [hl+]                                                   ; $1b18
	ld   [de], a                                                    ; $1b19
	inc  de                                                         ; $1b1a
endr
	ld   a, [hl+]                                                   ; $1b27
	ld   [de], a                                                    ; $1b28
	jr   .afterDistanceUnit                                         ; $1b29

.distanceCMValue:
; Display meter speed still if top 2 digits of meters are non-0
	ld   a, [wBCDFormOfDistanceToNextStation+2]                     ; $1b2b
	or   a                                                          ; $1b2e
	jr   nz, .displayCurrSpeed                                      ; $1b2f

; Else display CM now
	ld   hl, wInGameDistanceLeftTileIdxes+2                         ; $1b31

.displayCurrSpeed:
; 4 speed tiles
	ld   a, $00                                                     ; $1b34
	ldh  [rVBK], a                                                  ; $1b36
	ld   de, _SCRN0+$224                                            ; $1b38
	ld   a, [hl+]                                                   ; $1b3b
	ld   [de], a                                                    ; $1b3c
	inc  de                                                         ; $1b3d
	ld   a, [hl+]                                                   ; $1b3e
	ld   [de], a                                                    ; $1b3f
	inc  de                                                         ; $1b40
	ld   a, [hl+]                                                   ; $1b41
	ld   [de], a                                                    ; $1b42
	inc  de                                                         ; $1b43
	ld   a, [hl+]                                                   ; $1b44
	ld   [de], a                                                    ; $1b45

; --
; -- Distance
; --
	ld   a, $01                                                     ; $1b46
	ldh  [rVBK], a                                                  ; $1b48

; Jump ahead if not passed the next station
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $1b4a
	bit  7, a                                                       ; $1b4d
	jr   z, .afterRedDistanceCheck                                  ; $1b4f

; Jump ahead if at 0m from destination
	cpl                                                             ; $1b51
	ld   b, a                                                       ; $1b52
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $1b53
	cpl                                                             ; $1b56
	or   b                                                          ; $1b57
	or   a                                                          ; $1b58
	jr   z, .afterRedDistanceCheck                                  ; $1b59

; Jump ahead if BCD form of distance is also 0
	ld   a, [wBCDFormOfDistanceToNextStation]                       ; $1b5b
	ld   b, a                                                       ; $1b5e
	ld   a, [wBCDFormOfDistanceToNextStation+1]                     ; $1b5f
	ld   c, a                                                       ; $1b62
	ld   a, [wBCDFormOfDistanceToNextStation+2]                     ; $1b63
	or   b                                                          ; $1b66
	or   c                                                          ; $1b67
	jr   z, .afterRedDistanceCheck                                  ; $1b68

; If the station is one we needed to stop at..
	ld   a, [wApproachingNextStationToStopAt]                       ; $1b6a
	or   a                                                          ; $1b6d
	jr   z, .afterRedDistanceCheck                                  ; $1b6e

; Color the distance reading red
	ld   hl, _SCRN0+$224                                            ; $1b70
	ld   a, $05                                                     ; $1b73
	ld   [hl+], a                                                   ; $1b75
	ld   [hl+], a                                                   ; $1b76
	ld   [hl+], a                                                   ; $1b77
	ld   [hl+], a                                                   ; $1b78

.afterRedDistanceCheck:
	ld   a, $00                                                     ; $1b79
	ldh  [rVBK], a                                                  ; $1b7b

; If selected option to show meters, display it
	ld   a, [wDistanceMeterOption]                                  ; $1b7d
	or   a                                                          ; $1b80
	jr   z, .distanceShowsM                                         ; $1b81

; If selected hidden option, show nothing
	cp   $02                                                        ; $1b83
	jr   z, .afterDistanceUnit                                      ; $1b85

; If selected centimeters, but highest byte is non-0, show meters for now
	ld   a, [wBCDFormOfDistanceToNextStation+2]                     ; $1b87
	or   a                                                          ; $1b8a
	jr   nz, .distanceShowsM                                        ; $1b8b

; Distance shows CM
	ld   a, $5a                                                     ; $1b8d
	ld   [_SCRN0+$228], a                                           ; $1b8f
	jr   .afterDistanceUnit                                         ; $1b92

.distanceShowsM:
	ld   a, $4f                                                     ; $1b94
	ld   [_SCRN0+$228], a                                           ; $1b96

.afterDistanceUnit:

; --
; -- Dest and curr times
; --
	CallFromBank0 DisplayInGameDestinationTime

; Display current time
	ld   hl, wInGameCurrTimeTileIdxes                               ; $1ba1
	ld   de, _SCRN0+$6c                                             ; $1ba4

; For current, add hours, minutes, seconds, skipping 2 tiles to get to the next
	ld   a, [hl+]                                                   ; $1ba7
	ld   [de], a                                                    ; $1ba8
	inc  de                                                         ; $1ba9
	ld   a, [hl+]                                                   ; $1baa
	ld   [de], a                                                    ; $1bab
	inc  de                                                         ; $1bac
	inc  de                                                         ; $1bad

	ld   a, [hl+]                                                   ; $1bae
	ld   [de], a                                                    ; $1baf
	inc  de                                                         ; $1bb0
	ld   a, [hl+]                                                   ; $1bb1
	ld   [de], a                                                    ; $1bb2
	inc  de                                                         ; $1bb3
	inc  de                                                         ; $1bb4

	ld   a, [hl+]                                                   ; $1bb5
	ld   [de], a                                                    ; $1bb6
	inc  de                                                         ; $1bb7
	ld   a, [hl+]                                                   ; $1bb8
	ld   [de], a                                                    ; $1bb9

; Default orange palette when time is good
	ld   b, $03                                                     ; $1bba

; Or red if not
	ld   a, [wInGamePassedDestTime]                                 ; $1bbc
	or   a                                                          ; $1bbf
	jr   z, :+                                                      ; $1bc0
	ld   b, $05                                                     ; $1bc2

:	ld   a, $01                                                     ; $1bc4
	ldh  [rVBK], a                                                  ; $1bc6
	ld   hl, _SCRN0+$6c                                             ; $1bc8

; Set palette for all 6 digits of dest time
	ld   a, [hl]                                                    ; $1bcb
	and  $f8                                                        ; $1bcc
	or   b                                                          ; $1bce
	ld   [hl+], a                                                   ; $1bcf
	ld   a, [hl]                                                    ; $1bd0
	and  $f8                                                        ; $1bd1
	or   b                                                          ; $1bd3
	ld   [hl+], a                                                   ; $1bd4
	inc  hl                                                         ; $1bd5
	ld   a, [hl]                                                    ; $1bd6
	and  $f8                                                        ; $1bd7
	or   b                                                          ; $1bd9
	ld   [hl+], a                                                   ; $1bda
	ld   a, [hl]                                                    ; $1bdb
	and  $f8                                                        ; $1bdc
	or   b                                                          ; $1bde
	ld   [hl+], a                                                   ; $1bdf
	inc  hl                                                         ; $1be0
	ld   a, [hl]                                                    ; $1be1
	and  $f8                                                        ; $1be2
	or   b                                                          ; $1be4
	ld   [hl+], a                                                   ; $1be5
	ld   a, [hl]                                                    ; $1be6
	and  $f8                                                        ; $1be7
	or   b                                                          ; $1be9
	ld   [hl+], a                                                   ; $1bea

; --
; -- Top left box indicator
; --
	ld   a, $00                                                     ; $1beb
	ldh  [rVBK], a                                                  ; $1bed

; Compare 0 or 1 value to wPrevMoreStationsToSkip
	ld   hl, wMoreStationsToSkip                                    ; $1bef
	ld   a, [hl+]                                                   ; $1bf2
	ld   b, [hl]                                                    ; $1bf3
	cp   b                                                          ; $1bf4
	jr   z, .afterTopLeftBox                                        ; $1bf5

; Set prev, jump if non-0
	ld   [hl], a                                                    ; $1bf7
	or   a                                                          ; $1bf8
	jr   nz, .moreToSkip                                            ; $1bf9

; Display stop at next station
	ld   a, $80                                                     ; $1bfb
	ld   [wInGameTopLeftBoxNextStationIndicator], a                 ; $1bfd
	ld   a, $b7                                                     ; $1c00
	jr   :+                                                         ; $1c02

.moreToSkip:
	ld   a, $81                                                     ; $1c04
	ld   [wInGameTopLeftBoxNextStationIndicator], a                 ; $1c06
	ld   a, $b0                                                     ; $1c09

; Display a different text above dest time
:	ld   hl, _SCRN0+$d                                              ; $1c0b
	ld   [hl+], a                                                   ; $1c0e
	inc  a                                                          ; $1c0f
	ld   [hl+], a                                                   ; $1c10
	inc  a                                                          ; $1c11
	ld   [hl+], a                                                   ; $1c12
	inc  a                                                          ; $1c13
	ld   [hl+], a                                                   ; $1c14
	inc  a                                                          ; $1c15
	ld   [hl+], a                                                   ; $1c16
	inc  a                                                          ; $1c17
	ld   [hl+], a                                                   ; $1c18
	inc  a                                                          ; $1c19
	ld   [hl+], a                                                   ; $1c1a
	inc  a                                                          ; $1c1b

.afterTopLeftBox:
	call RecordCurrDistance                                         ; $1c1c
	ret                                                             ; $1c1f

.everyOtherOtherMainLoop:
	call UpdateInGameTopLeftBoxTileData                             ; $1c20

; --
; -- Control scheme
; --
	ld   a, [wControlSchemeIs1Handed]                               ; $1c23
	or   a                                                          ; $1c26
	jr   nz, .oneHandedTileData                                     ; $1c27

; 2-handed
	ld   a, [wShouldUpdateAccelLeverTileData]                       ; $1c29
	or   a                                                          ; $1c2c
	jr   z, .after2handAccelLever                                   ; $1c2d

	ld   a, $00                                                     ; $1c2f
	ld   [wShouldUpdateAccelLeverTileData], a                       ; $1c31

; Transfer accel lever tile data
	ld   a, BANK(Gfx_2HandedAccelLever)                             ; $1c34
	call SetRomBank1stHalfOfRom                                     ; $1c36
	ld   a, [w2HandAccelTileDataSource]                             ; $1c39
	ld   l, a                                                       ; $1c3c
	ld   a, [w2HandAccelTileDataSource+1]                           ; $1c3d
	ld   h, a                                                       ; $1c40
	ld   a, $00                                                     ; $1c41
	ldh  [rVBK], a                                                  ; $1c43
	ld   de, _VRAM+$e00                                             ; $1c45
	ld   b, ($80/$10)-1                                             ; $1c48
	call StartHDMATransfer                                          ; $1c4a

.after2handAccelLever:
; Jump if we don't need to update brakes, resetting if we do, then..
	ld   a, [wShouldUpdateBrakeLeverTileData]                       ; $1c4d
	or   a                                                          ; $1c50
	jr   z, .afterControlScheme                                     ; $1c51

	ld   a, $00                                                     ; $1c53
	ld   [wShouldUpdateBrakeLeverTileData], a                       ; $1c55

; Transfer brake applied lever tile data
	ld   a, BANK(Gfx_2HandedBrakeAppliedLever)                      ; $1c58
	call SetRomBank1stHalfOfRom                                     ; $1c5a
	ld   a, [w2HandBrakeAppliedTileDataSource]                      ; $1c5d
	ld   l, a                                                       ; $1c60
	ld   a, [w2HandBrakeAppliedTileDataSource+1]                    ; $1c61
	ld   h, a                                                       ; $1c64
	ld   a, $00                                                     ; $1c65
	ldh  [rVBK], a                                                  ; $1c67
	ld   de, _VRAM+$f00                                             ; $1c69
	ld   b, ($c0/$10)-1                                             ; $1c6c
	call StartHDMATransfer                                          ; $1c6e

	jr   .afterControlScheme                                        ; $1c71

.oneHandedTileData:
; Jump if no need to update the lever
	ld   a, [wShouldUpdateAccelLeverTileData]                       ; $1c73
	ld   c, a                                                       ; $1c76
	ld   a, [wShouldUpdateBrakeLeverTileData]                       ; $1c77
	or   c                                                          ; $1c7a
	jr   z, .afterControlScheme                                     ; $1c7b

; Reset that we should update
	ld   a, $00                                                     ; $1c7d
	ld   [wShouldUpdateAccelLeverTileData], a                       ; $1c7f
	ld   a, $00                                                     ; $1c82
	ld   [wShouldUpdateBrakeLeverTileData], a                       ; $1c84

; Transfer brake release tile data
	ld   a, BANK(Gfx_1HandedBrakeReleaseLever)                      ; $1c87
	call SetRomBank1stHalfOfRom                                     ; $1c89
	ld   a, [w1HandBrakeReleaseTileDataSource]                      ; $1c8c
	ld   l, a                                                       ; $1c8f
	ld   a, [w1HandBrakeReleaseTileDataSource+1]                    ; $1c90
	ld   h, a                                                       ; $1c93
	ld   a, $00                                                     ; $1c94
	ldh  [rVBK], a                                                  ; $1c96
	ld   de, _VRAM+$e00                                             ; $1c98
	ld   b, ($80/$10)-1                                             ; $1c9b
	call StartHDMATransfer                                          ; $1c9d

.afterControlScheme:

; --
; -- Event display box
; --
; By default, use event 1 (miscellaneous scenarios that stay)
	ld   a, [wInGameEventIdx1]                                      ; $1ca0
	ld   b, a                                                       ; $1ca3

; If paused, override event with pause event
	ld   a, [wInGameIsPaused]                                       ; $1ca4
	or   a                                                          ; $1ca7
	jr   z, :+                                                      ; $1ca8
	ld   b, EVENT_PAUSED                                            ; $1caa

; If event 1 == 0, use event 2 (speed limit/atc scenarios)
:	ld   a, b                                                       ; $1cac
	cp   $00                                                        ; $1cad
	jr   nz, :+                                                     ; $1caf
	ld   a, [wInGameEventIdx2]                                      ; $1cb1

; If event is the alternating red lights..
:	cp   EVENT_ALTERNATING_RED_LIGHTS_1                             ; $1cb4
	jr   nz, .afterGettingEvent                                     ; $1cb6

; Every 16 frames, swap the event with EVENT_ALTERNATING_RED_LIGHTS_2
	ld   b, a                                                       ; $1cb8
	ld   a, [wMainLoopCounter]                                      ; $1cb9
	and  $10                                                        ; $1cbc
	swap a                                                          ; $1cbe
	add  b                                                          ; $1cc0

.afterGettingEvent:
; Event is an octuple-index into the table
	add  a                                                          ; $1cc1
	add  a                                                          ; $1cc2
	ld   hl, EventsTileDataAndPaletteSrces                          ; $1cc3
	ld   e, a                                                       ; $1cc6
	ld   d, $00                                                     ; $1cc7
	add  hl, de                                                     ; $1cc9
	add  hl, de                                                     ; $1cca

; Set rom bank, and load details into B, DE, HL
	ld   a, BANK(EventsTileDataAndPaletteSrces)                     ; $1ccb
	call SetRomBank1stHalfOfRom                                     ; $1ccd
	ld   a, [hl+]                                                   ; $1cd0
	ld   b, a                                                       ; $1cd1
	ld   a, [hl+]                                                   ; $1cd2
	ld   e, a                                                       ; $1cd3
	ld   a, [hl+]                                                   ; $1cd4
	ld   d, a                                                       ; $1cd5
	ld   a, [hl+]                                                   ; $1cd6
	ld   h, [hl]                                                    ; $1cd7
	ld   l, a                                                       ; $1cd8

; 1st byte is new rom bank, tile data in vram bank 1
	ld   a, b                                                       ; $1cd9
	call SetRomBank1stHalfOfRom                                     ; $1cda
	ld   a, $01                                                     ; $1cdd
	ldh  [rVBK], a                                                  ; $1cdf

; 1st word is the source addr
	ld   a, d                                                       ; $1ce1
	ldh  [rHDMA1], a                                                ; $1ce2
	ld   a, e                                                       ; $1ce4
	ldh  [rHDMA2], a                                                ; $1ce5
	ld   a, HIGH(_VRAM+$e00)                                        ; $1ce7
	ldh  [rHDMA3], a                                                ; $1ce9
	ld   a, LOW(_VRAM+$e00)                                         ; $1ceb
	ldh  [rHDMA4], a                                                ; $1ced
	ld   a, ($200/$10)-1                                            ; $1cef
	ldh  [rHDMA5], a                                                ; $1cf1

; 2nd word is the palettes source in bank $9c, box uses palette 6
	ld   a, BANK(BGPalettes_EventPal_0)                             ; $1cf3
	call SetRomBank1stHalfOfRom                                     ; $1cf5
	ld   a, $06                                                     ; $1cf8
	ld   b, $02                                                     ; $1cfa
	call LoadSomeBGPalettesStartingA                                ; $1cfc

; Finally record distance
	call RecordCurrDistance                                         ; $1cff
	ret                                                             ; $1d02


UpdateInGameTopLeftBoxTileData:
; If ATC, jump
	ld   a, [wInGameTopLeftBoxATCIndicator]                         ; $1d03
	cp   $02                                                        ; $1d06
	jr   nc, .cont                                                  ; $1d08

; Update top-left box if bit 7 set
	ld   a, [wInGameTopLeftBoxNextStationIndicator]                 ; $1d0a
	bit  7, a                                                       ; $1d0d
	ret  z                                                          ; $1d0f

.cont:
; Low nybble is double index into table
	and  $0f                                                        ; $1d10
	ld   [wInGameTopLeftBoxNextStationIndicator], a                 ; $1d12
	add  a                                                          ; $1d15
	ld   hl, .indicatorSources                                      ; $1d16
	ld   c, a                                                       ; $1d19
	ld   b, $00                                                     ; $1d1a
	add  hl, bc                                                     ; $1d1c

; Get source address in table
	ld   a, [hl+]                                                   ; $1d1d
	ld   h, [hl]                                                    ; $1d1e
	ld   l, a                                                       ; $1d1f

; Transfer tile data
	ld   a, BANK(Gfx_InGameTopLeftBox_StopAtNextStation)            ; $1d20
	call SetRomBank1stHalfOfRom                                     ; $1d22
	ld   a, $00                                                     ; $1d25
	ldh  [rVBK], a                                                  ; $1d27
	ld   de, _VRAM+$10b0                                            ; $1d29
	ld   b, ($a0/$10)-1                                             ; $1d2c
	call StartHDMATransfer                                          ; $1d2e
	ret                                                             ; $1d31

.indicatorSources:
	dw Gfx_InGameTopLeftBox_StopAtNextStation
	dw Gfx_InGameTopLeftBox_PassTheNextStation
	dw Gfx_InGameTopLeftBox_ATC210km_h
	dw Gfx_InGameTopLeftBox_ATC245km_h
	dw Gfx_InGameTopLeftBox_ATC160km_h
	dw Gfx_InGameTopLeftBox_ATC110km_h
	dw Gfx_InGameTopLeftBox_ATC70km_h
	dw Gfx_InGameTopLeftBox_ATC30km_h


LCDCInterruptFunc_InGame::
; Update last palette, 3rd color only (sky)
	ld   a, XCPS_AUTO_INCREMENT+$3c                                 ; $1d42
	ldh  [rBCPS], a                                                 ; $1d44

; Jump if LY is above sky
	ldh  a, [rLY]                                                   ; $1d46
	cp   $27                                                        ; $1d48
	jr   c, .aboveSky                                               ; $1d4a

; Return if LY is below sky
	cp   $47                                                        ; $1d4c
	ret  nc                                                         ; $1d4e

; Preserve BC
	push bc                                                         ; $1d4f

; During sky part, BC = the color to apply
	ld   hl, wSkyColorToApplyNextLY                                 ; $1d50
	ld   c, l                                                       ; $1d53
	ld   b, h                                                       ; $1d54

; Set the color
	ld   a, [hl+]                                                   ; $1d55
	ldh  [rBCPD], a                                                 ; $1d56
	ld   a, [hl+]                                                   ; $1d58
	ldh  [rBCPD], a                                                 ; $1d59

; Preserve DE
	push de                                                         ; $1d5b

; From, wAddressOfNextSkyColorWordToUse, increase address
	ld   a, [hl]                                                    ; $1d5c
	add  LOW(2)                                                     ; $1d5d
	ld   e, a                                                       ; $1d5f
	ld   [hl+], a                                                   ; $1d60

	ld   a, [hl]                                                    ; $1d61
	adc  HIGH(2)                                                    ; $1d62
	ld   [hl], a                                                    ; $1d64

; HL points to that new address, containing the next color
	ld   l, e                                                       ; $1d65
	ld   h, a                                                       ; $1d66

.cont:
; Preserve and set bank of sky colors
	ld   a, [wRomBank]                                              ; $1d67
	push af                                                         ; $1d6a
	ld   a, BANK(InGameSkyColors)                                   ; $1d6b
	call SetRomBank1stHalfOfRom                                     ; $1d6d

; If fading, ignore this sky functionality, and apply fade instead
	ld   a, [wPaletteFadeAmount]                                    ; $1d70
	or   a                                                          ; $1d73
	jr   nz, .applyFade                                             ; $1d74

; Get color bytes from pointer to next sky color, and save it it in wSkyColorToApplyNextLY
	ld   a, [hl+]                                                   ; $1d76
	ld   [bc], a                                                    ; $1d77
	inc  bc                                                         ; $1d78
	ld   a, [hl]                                                    ; $1d79
	ld   [bc], a                                                    ; $1d7a
	jr   .restoreRegsAndRomBank                                     ; $1d7b

.applyFade:
	call FadePaletteColor                                           ; $1d7d

.restoreRegsAndRomBank:
	pop  af                                                         ; $1d80
	call SetRomBank1stHalfOfRom                                     ; $1d81
	pop  de                                                         ; $1d84
	pop  bc                                                         ; $1d85
	ret                                                             ; $1d86

.aboveSky:
; Preserve regs
	push bc                                                         ; $1d87
	push de                                                         ; $1d88

; HL = double sky color idx into table
	ld   hl, .skyColorAddresses                                     ; $1d89
	ld   a, [wInGameSkyColorsIdx]                                   ; $1d8c
	add  a                                                          ; $1d8f
	ld   c, a                                                       ; $1d90
	ld   b, $00                                                     ; $1d91
	add  hl, bc                                                     ; $1d93

; Get word pointed to
	ld   a, [hl+]                                                   ; $1d94
	ld   h, [hl]                                                    ; $1d95
	ld   l, a                                                       ; $1d96

; Get address word pointing to color to apply next LY
	ld   bc, wSkyColorToApplyNextLY                                 ; $1d97

; HL = address pointing to next sky color
	ld   a, l                                                       ; $1d9a
	ld   [wAddressOfNextSkyColorWordToUse], a                       ; $1d9b
	ld   a, h                                                       ; $1d9e
	ld   [wAddressOfNextSkyColorWordToUse+1], a                     ; $1d9f
	jr   .cont                                                      ; $1da2

.skyColorAddresses:
	dw InGameSkyColors.color0
	dw InGameSkyColors.color1
	dw InGameSkyColors.color2
	dw InGameSkyColors.color3
	dw InGameSkyColors.color4
	dw InGameSkyColors.color5
	dw InGameSkyColors.color6
	dw InGameSkyColors.color7
	dw InGameSkyColors.color8
	dw InGameSkyColors.color9
	dw InGameSkyColors.colorA
	dw InGameSkyColors.colorB


; HL - address containing 2 meta bytes for current section
LoadInGameSceneryTileDataSources::
	ld   a, [wRomBank]                                              ; $1dbc
	push af                                                         ; $1dbf

; Get right meta-section
	ld   a, BANK(TrainLineAddressesForLocationFrameMetaData)        ; $1dc0
	call SetRomBank1stHalfOfRom                                     ; $1dc2
	ld   a, [hl+]                                                   ; $1dc5
	ld   [wInGameRightMetaSection], a                               ; $1dc6

; Push inc'd HL for left later
	push hl                                                         ; $1dc9

; Get address for section pointer
	ld   hl, InGameLocationSectionPointersForFrames                 ; $1dca
	ld   e, a                                                       ; $1dcd
	ld   d, $00                                                     ; $1dce
	add  hl, de                                                     ; $1dd0
	add  hl, de                                                     ; $1dd1

; HL = address it's pointing to
	ld   a, BANK(InGameLocationSectionPointersForFrames)            ; $1dd2
	call SetRomBank1stHalfOfRom                                     ; $1dd4
	ld   a, [hl+]                                                   ; $1dd7
	ld   h, [hl]                                                    ; $1dd8
	ld   l, a                                                       ; $1dd9

; Quadruple anim idx (15 anims per section)
	ld   a, [wInGameBGAnimIdxWithinSection]                         ; $1dda
	ld   e, a                                                       ; $1ddd
	ld   d, $00                                                     ; $1dde
	add  hl, de                                                     ; $1de0
	add  hl, de                                                     ; $1de1
	add  hl, de                                                     ; $1de2
	add  hl, de                                                     ; $1de3

; The 4 bytes represent source, and the desired train shape at that section
	ld   a, [hl+]                                                   ; $1de4
	ld   [wInGameRightHalfTileDataLowBank], a                       ; $1de5
	ld   a, [hl+]                                                   ; $1de8
	ld   [wInGameRightHalfTileDataAddr], a                          ; $1de9
	ld   a, [hl+]                                                   ; $1dec
	ld   [wInGameRightHalfTileDataAddr+1], a                        ; $1ded
	ld   a, [hl]                                                    ; $1df0
	ld   [wNextTrainRailsShape], a                                  ; $1df1

; Repeat getting left's meta-section
	ld   a, BANK(TrainLineAddressesForLocationFrameMetaData)        ; $1df4
	call SetRomBank1stHalfOfRom                                     ; $1df6

	pop  hl                                                         ; $1df9
	ld   a, [hl]                                                    ; $1dfa

; Double index for address of section's frame details
	ld   hl, InGameLocationSectionPointersForFrames                 ; $1dfb
	ld   e, a                                                       ; $1dfe
	ld   d, $00                                                     ; $1dff
	add  hl, de                                                     ; $1e01
	add  hl, de                                                     ; $1e02
	ld   a, BANK(InGameLocationSectionPointersForFrames)            ; $1e03
	call SetRomBank1stHalfOfRom                                     ; $1e05

	ld   a, [hl+]                                                   ; $1e08
	ld   h, [hl]                                                    ; $1e09
	ld   l, a                                                       ; $1e0a

; Quadruple index for anim idx in section
	ld   a, [wInGameBGAnimIdxWithinSection]                         ; $1e0b
	ld   e, a                                                       ; $1e0e
	ld   d, $00                                                     ; $1e0f
	add  hl, de                                                     ; $1e11
	add  hl, de                                                     ; $1e12
	add  hl, de                                                     ; $1e13
	add  hl, de                                                     ; $1e14

; Details for left side
	ld   a, [hl+]                                                   ; $1e15
	ld   [wInGameLeftHalfTileDataLowBank], a                        ; $1e16
	ld   a, [hl+]                                                   ; $1e19
	ld   [wInGameLeftHalfTileDataAddr], a                           ; $1e1a
	ld   a, [hl+]                                                   ; $1e1d
	ld   [wInGameLeftHalfTileDataAddr+1], a                         ; $1e1e

	pop  af                                                         ; $1e21
	call SetRomBank1stHalfOfRom                                     ; $1e22
	ret                                                             ; $1e25


GameState02_TrainLineSelectionInit:
; No fade, clear scripts and oam
	ld   a, $00                                                     ; $1e26
	ld   [wLoadPalettesFromRam], a                                  ; $1e28
	call InitScriptStructs                                          ; $1e2b
	call ClearScriptsOamHideAllOam                                  ; $1e2e

; Start main script, then clear scrolling text vars
	M_StartMainScript 0, TrainLineSelectionScript
	xor  a                                                          ; $1e3a
	ld   hl, wScrollingText_DoubleSCX                               ; $1e3b
	ld   [hl+], a                                                   ; $1e3e
	ld   [hl], a                                                    ; $1e3f

GameState03_TrainLineSelectionMain:
	JumpFromBank0 GameState03_TrainLineSelectionMain_def


LCDCInterruptFunc_TrainLineSelection1::
; Triggered at the start of the scrolling text
	ld   a, [wScrollingText_SCX]                                    ; $1e48
	ld   h, a                                                       ; $1e4b
	call WaitUntilVramJustSafe_trashL                               ; $1e4c

; Preserve curr SCX, set SCX from above var
	ldh  a, [rSCX]                                                  ; $1e4f
	ld   l, a                                                       ; $1e51
	ld   a, h                                                       ; $1e52
	ldh  [rSCX], a                                                  ; $1e53
	ld   a, l                                                       ; $1e55
	ld   [wNonScrollingText_PreservedSCX], a                        ; $1e56

; Next trigger at bottom of scrolling text
	ld   a, $2f                                                     ; $1e59
	ldh  [rLYC], a                                                  ; $1e5b

; Set new lcdc interrupt func
	ld   a, [wLCDCInterruptFunc]                                    ; $1e5d
	ld   l, a                                                       ; $1e60
	ld   a, [wLCDCInterruptFunc+1]                                  ; $1e61
	ld   h, a                                                       ; $1e64

	ld   a, LOW(LCDCInterruptFunc_TrainLineSelection2)              ; $1e65
	ld   [wLCDCInterruptFunc], a                                    ; $1e67
	ld   a, HIGH(LCDCInterruptFunc_TrainLineSelection2)             ; $1e6a
	ld   [wLCDCInterruptFunc+1], a                                  ; $1e6c
	ret                                                             ; $1e6f


LCDCInterruptFunc_TrainLineSelection2:
; Set SCX to preserved pre-text scroll SCX
	ld   a, [wNonScrollingText_PreservedSCX]                        ; $1e70
	ld   h, a                                                       ; $1e73
	call WaitUntilVramJustSafe_trashL                               ; $1e74
	ld   a, h                                                       ; $1e77
	ldh  [rSCX], a                                                  ; $1e78

; Next trigger at beginning of train image
	ld   a, $37                                                     ; $1e7a
	ldh  [rLYC], a                                                  ; $1e7c

; Set new lcdc interrupt func
	ld   a, [wLCDCInterruptFunc]                                    ; $1e7e
	ld   l, a                                                       ; $1e81
	ld   a, [wLCDCInterruptFunc+1]                                  ; $1e82
	ld   h, a                                                       ; $1e85

	ld   a, LOW(LCDCInterruptFunc_TrainLineSelection3)              ; $1e86
	ld   [wLCDCInterruptFunc], a                                    ; $1e88
	ld   a, HIGH(LCDCInterruptFunc_TrainLineSelection3)             ; $1e8b
	ld   [wLCDCInterruptFunc+1], a                                  ; $1e8d
	ret                                                             ; $1e90


LCDCInterruptFunc_TrainLineSelection3:
; Set SCX to 4 to adjust train image
	ld   h, $04                                                     ; $1e91
	call WaitUntilVramJustSafe_trashL                               ; $1e93
	ld   a, h                                                       ; $1e96
	ldh  [rSCX], a                                                  ; $1e97

; Next trigger after train area
	ld   a, $67                                                     ; $1e99
	ldh  [rLYC], a                                                  ; $1e9b

; Set new lcdc interrupt func
	ld   a, [wLCDCInterruptFunc]                                    ; $1e9d
	ld   l, a                                                       ; $1ea0
	ld   a, [wLCDCInterruptFunc+1]                                  ; $1ea1
	ld   h, a                                                       ; $1ea4

	ld   a, LOW(LCDCInterruptFunc_TrainLineSelection4)              ; $1ea5
	ld   [wLCDCInterruptFunc], a                                    ; $1ea7
	ld   a, HIGH(LCDCInterruptFunc_TrainLineSelection4)             ; $1eaa
	ld   [wLCDCInterruptFunc+1], a                                  ; $1eac
	ret                                                             ; $1eaf


LCDCInterruptFunc_TrainLineSelection4:
; Set SCX to preserved pre text-scroll value
	ld   a, [wNonScrollingText_PreservedSCX]                        ; $1eb0
	ld   h, a                                                       ; $1eb3
	call WaitUntilVramJustSafe_trashL                               ; $1eb4
	ld   a, h                                                       ; $1eb7
	jp   SetSCXClearLCDCSetup                                       ; $1eb8


; B - set to STATF_LCD
Copy20hHiColPalettes::
; Wait until vram and oam unused
:	ldh  a, [rSTAT]                                                 ; $1ebb
	and  b                                                          ; $1ebd
	jr   nz, :-                                                     ; $1ebe

rept $20
	ld   a, [hl+]                                                   ; $1ec0
	ldh  [c], a                                                     ; $1ec1
endr

	ret                                                             ; $1f00


ApplyFrameHiColPalettesForPreInGameGraphic:
; Unused B (normally used as STATF_LCD)
	ldbc $03, LOW(rBCPD)                                            ; $1f01

; Get hi col palette source
	ld   a, [wPreInGameGraphicHiColPalettesBank]                    ; $1f04
	call SetRomBank1stHalfOfRom                                     ; $1f07
	ld   a, [wPreInGameGraphicHiColPalettesAddr]                    ; $1f0a
	ld   l, a                                                       ; $1f0d
	ld   a, [wPreInGameGraphicHiColPalettesAddr+1]                  ; $1f0e
	ld   h, a                                                       ; $1f11

; Load initial $40 palettes
	ld   a, XCPS_AUTO_INCREMENT                                     ; $1f12
	ldh  [rBCPS], a                                                 ; $1f14
	ld   d, NUM_PALETTE_BYTES                                       ; $1f16
:	ld   a, [hl+]                                                   ; $1f18
	ldh  [c], a                                                     ; $1f19
	dec  d                                                          ; $1f1a
	jr   nz, :-                                                     ; $1f1b

; Run for $7c scan lines
	ld   d, $3e                                                     ; $1f1d

.next40hBytes:
	call Copy20hHiColPalettes                                       ; $1f1f
	call Copy20hHiColPalettes                                       ; $1f22
	dec  d                                                          ; $1f25
	jp   nz, .next40hBytes                                          ; $1f26

; If not at actual palettes, set bottom area black
	ld   a, [wPreInGameGraphicHiColIdxForFade]                      ; $1f29
	or   a                                                          ; $1f2c
	jr   nz, .setBlackPals                                          ; $1f2d

; Else use the same palettes as when displaying the train image through picture book
	ld   a, BANK(BGPalettes_TrainImageInfo)                         ; $1f2f
	call SetRomBank1stHalfOfRom                                     ; $1f31
	ld   hl, BGPalettes_TrainImageInfo                              ; $1f34
	jr   .lastPalettes                                              ; $1f37

.setBlackPals:
	ld   a, BANK(Palettes_AllBlack)                                 ; $1f39
	call SetRomBank1stHalfOfRom                                     ; $1f3b
	ld   hl, Palettes_AllBlack                                      ; $1f3e

.lastPalettes:
; Set last $40 palettes
	ld   a, XCPS_AUTO_INCREMENT                                     ; $1f41
	ldh  [rBCPS], a                                                 ; $1f43
	call Copy20hHiColPalettes                                       ; $1f45
	call Copy20hHiColPalettes                                       ; $1f48
	ret                                                             ; $1f4b


; A - rom bank
; HL - source addr
HDMATransferPreInGameGraphicTileData::
; Transfer $800 bytes to $8800-$8fff
	call SetRomBank1stHalfOfRom                                     ; $1f4c
	ld   a, $00                                                     ; $1f4f
	ldh  [rVBK], a                                                  ; $1f51
	waitForRequestedVBlank
	ld   de, _VRAM+$800                                             ; $1f60
	ld   b, ($800/$10)-1                                            ; $1f63
	call StartHDMATransfer                                          ; $1f65

; Transfer $800 bytes to $9000-$97ff
	ld   de, $0800                                                  ; $1f68
	add  hl, de                                                     ; $1f6b
	waitForRequestedVBlank
	ld   de, _VRAM+$1000                                            ; $1f79
	call StartHDMATransfer                                          ; $1f7c

; Transfer $400 bytes to vram bank 1 $8800-$8bff
	ld   de, $0800                                                  ; $1f7f
	add  hl, de                                                     ; $1f82
	ld   a, $01                                                     ; $1f83
	ldh  [rVBK], a                                                  ; $1f85
	waitForRequestedVBlank
	ld   de, _VRAM+$800                                             ; $1f94
	ld   b, ($400/$10)-1                                            ; $1f97
	call StartHDMATransfer                                          ; $1f99

; Restore vram bank and rom bank
	ld   a, $00                                                     ; $1f9c
	ldh  [rVBK], a                                                  ; $1f9e
	ld   a, BANK(PreInGameGraphicScript)                            ; $1fa0
	call SetRomBank1stHalfOfRom                                     ; $1fa2
	ret                                                             ; $1fa5


VBlankInterruptFunc_PreInGameGraphic::
; Once done, load all black palettes
	ld   a, [wShouldUpdateHiColBGPalettes]                          ; $1fa6
	or   a                                                          ; $1fa9
	jr   z, .setBlackPalettes                                       ; $1faa

; Otherwise get palettes for screen based on 'fade index', and update sound
	ld   a, [wPreInGameGraphicHiColIdxForFade]                      ; $1fac
	ld   c, a                                                       ; $1faf
	CallFromBank0 GetPreInGameGraphicHiColPaletteSrces
	call ApplyFrameHiColPalettesForPreInGameGraphic                 ; $1fb8
	call UpdateSound                                                ; $1fbb
	ret                                                             ; $1fbe

.setBlackPalettes:
	ld   b, BANK(Palettes_AllBlack)                                 ; $1fbf
	ld   hl, Palettes_AllBlack                                      ; $1fc1
	call FarLoadAllBGPalettes                                       ; $1fc4
	ret                                                             ; $1fc7


VBlankInterruptFunc_DepartureInfoScreen:
; Every vblank, update tile map and attr from ram buffer
	ldh  a, [rSVBK]                                                 ; $1fc8
	and  $03                                                        ; $1fca
	push af                                                         ; $1fcc

	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $1fcd
	ldh  [rSVBK], a                                                 ; $1fcf
	ld   a, $00                                                     ; $1fd1
	ldh  [rVBK], a                                                  ; $1fd3
	ld   hl, wIntroCutsceneTileMapBuffer                            ; $1fd5
	ld   de, _SCRN0                                                 ; $1fd8
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $1fdb
	call StartHDMATransfer                                          ; $1fdd

	ld   a, $01                                                     ; $1fe0
	ldh  [rVBK], a                                                  ; $1fe2
	ld   hl, wIntroCutsceneTileAttrBuffer                           ; $1fe4
	ld   de, _SCRN0                                                 ; $1fe7
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $1fea
	call StartHDMATransfer                                          ; $1fec

	pop  af                                                         ; $1fef
	ldh  [rSVBK], a                                                 ; $1ff0
	ret                                                             ; $1ff2


VBlankInterruptFunc_RouteDisplay::
; Update bottom box scx for after this interrupt
	ld   a, [wRouteDisplayNextBottomBoxSCX]                         ; $1ff3
	ld   [wRouteDisplayBottomBoxSCX], a                             ; $1ff6

; Alternate functionality per vblank
	ld   a, [wMainLoopCounter]                                      ; $1ff9
	and  $01                                                        ; $1ffc
	jr   nz, .other                                                 ; $1ffe

; Preserve curr wram bank and set ram buffer bank
	ldh  a, [rSVBK]                                                 ; $2000
	and  $03                                                        ; $2002
	push af                                                         ; $2004
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $2005
	ldh  [rSVBK], a                                                 ; $2007

; Transfer into tile map
	ld   a, $00                                                     ; $2009
	ldh  [rVBK], a                                                  ; $200b
	ld   hl, wRouteDisplayScrn0TileMapBuffer                        ; $200d
	ld   de, _SCRN0                                                 ; $2010
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $2013
	call StartHDMATransfer                                          ; $2015

; Transfer into tile attr
	ld   a, $01                                                     ; $2018
	ldh  [rVBK], a                                                  ; $201a
	ld   hl, wRouteDisplayScrn0TileAttrBuffer                       ; $201c
	ld   de, _SCRN0                                                 ; $201f
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $2022
	call StartHDMATransfer                                          ; $2024

	pop  af                                                         ; $2027
	ldh  [rSVBK], a                                                 ; $2028
	ret                                                             ; $202a

.other:
; Preserve curr wram bank and set ram buffer bank
	ldh  a, [rSVBK]                                                 ; $202b
	and  $03                                                        ; $202d
	push af                                                         ; $202f
	ld   a, BANK(wRouteDisplayScrn1TileMapBuffer)                   ; $2030
	ldh  [rSVBK], a                                                 ; $2032

; Transfer into tile map
	ld   a, $00                                                     ; $2034
	ldh  [rVBK], a                                                  ; $2036
	ld   hl, wRouteDisplayScrn1TileMapBuffer                        ; $2038
	ld   de, _SCRN1                                                 ; $203b
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $203e
	call StartHDMATransfer                                          ; $2040

; Transfer into tile attr
	ld   a, $01                                                     ; $2043
	ldh  [rVBK], a                                                  ; $2045
	ld   hl, wRouteDisplayScrn1TileAttrBuffer                       ; $2047
	ld   de, _SCRN1                                                 ; $204a
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $204d
	call StartHDMATransfer                                          ; $204f

	pop  af                                                         ; $2052
	ldh  [rSVBK], a                                                 ; $2053
	ret                                                             ; $2055


LCDCInterrupt_RouteDisplay::
; Update SCX for bottom box
	waitUntilVramSafe

	ld   a, [wRouteDisplayBottomBoxSCX]                             ; $205c
	ldh  [rSCX], a                                                  ; $205f
	ret                                                             ; $2061


AddCToByteInHL_maxFFh::
	ld   a, [hl]                                                    ; $2062
	add  c                                                          ; $2063
	jr   nc, :+                                                     ; $2064
	ld   a, $ff                                                     ; $2066
:	ld   [hl], a                                                    ; $2068
	ret                                                             ; $2069


RecordCurrDistance:
; Return once game ends
	ld   a, [wFinishedInGame]                                       ; $206a
	or   a                                                          ; $206d
	ret  nz                                                         ; $206e

; Return if game paused
	ld   a, [wInGameIsPaused]                                       ; $206f
	or   a                                                          ; $2072
	ret  nz                                                         ; $2073

; HL = next address in $400 block of ram
	ld   a, [wCurrAddressOfRecordedDistances]                       ; $2074
	ld   l, a                                                       ; $2077
	ld   a, [wCurrAddressOfRecordedDistances+1]                     ; $2078
	and  $03                                                        ; $207b
	or   HIGH(wLast100hRecordedDistances)                           ; $207d
	ld   h, a                                                       ; $207f

	ld   a, [wUnusedMillimeters]                                    ; $2080
	ld   b, a                                                       ; $2083
	ld   a, [wCentimeterPartOfDistanceBeforeNextStation]            ; $2084
	ld   c, a                                                       ; $2087
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $2088
	ld   e, a                                                       ; $208b
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $208c
	ld   d, a                                                       ; $208f

; Preserve curr wram bank, and set a new one
	ldh  a, [rSVBK]                                                 ; $2090
	and  $03                                                        ; $2092
	push af                                                         ; $2094
	ld   a, BANK(wLast100hRecordedDistances)                        ; $2095
	ldh  [rSVBK], a                                                 ; $2097

; Store the 4 values
	ld   a, b                                                       ; $2099
	ld   [hl+], a                                                   ; $209a
	ld   a, c                                                       ; $209b
	ld   [hl+], a                                                   ; $209c
	ld   a, e                                                       ; $209d
	ld   [hl+], a                                                   ; $209e
	ld   a, d                                                       ; $209f
	ld   [hl+], a                                                   ; $20a0

; Restore new wram bank, and save next address
	pop  af                                                         ; $20a1
	ldh  [rSVBK], a                                                 ; $20a2
	ld   a, h                                                       ; $20a4
	and  $03                                                        ; $20a5
	or   HIGH(wLast100hRecordedDistances)                           ; $20a7
	ld   [wCurrAddressOfRecordedDistances+1], a                     ; $20a9
	ld   a, l                                                       ; $20ac
	ld   [wCurrAddressOfRecordedDistances], a                       ; $20ad
	ret                                                             ; $20b0


VBlankInterruptFunc_LocationDone::
; Preserve curr wram bank and set the ram buffer one
	ldh  a, [rSVBK]                                                 ; $20b1
	and  $03                                                        ; $20b3
	push af                                                         ; $20b5
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $20b6
	ldh  [rSVBK], a                                                 ; $20b8

; Load from tile map buffer to tile map
	ld   a, $00                                                     ; $20ba
	ldh  [rVBK], a                                                  ; $20bc
	ld   hl, wIntroCutsceneTileMapBuffer                            ; $20be
	ld   de, _SCRN0                                                 ; $20c1
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $20c4
	call StartHDMATransfer                                          ; $20c6

; Load from tile attr buffer to tile attrs
	ld   a, $01                                                     ; $20c9
	ldh  [rVBK], a                                                  ; $20cb
	ld   hl, wIntroCutsceneTileAttrBuffer                           ; $20cd
	ld   de, _SCRN0                                                 ; $20d0
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $20d3
	call StartHDMATransfer                                          ; $20d5

; Restore wram bank, and reset lcdc interrupt setup
	pop  af                                                         ; $20d8
	ldh  [rSVBK], a                                                 ; $20d9
	ld   a, STATF_LYC                                               ; $20db
	ldh  [rSTAT], a                                                 ; $20dd
	ld   a, $57                                                     ; $20df
	ldh  [rLYC], a                                                  ; $20e1
	ret                                                             ; $20e3


; DE - source addr in rom
; HL - dest addr in wram bank 2
DisplayLocationDoneColumn::
; Preserve and set relevant ram bank
	ld   a, [wRomBank]                                              ; $20e4
	push af                                                         ; $20e7
	ld   a, [wLocationDoneTileMapAttrSrcBank]                       ; $20e8
	call SetRomBank1stHalfOfRom                                     ; $20eb

; Preserve and set relevant wram bank
	ldh  a, [rSVBK]                                                 ; $20ee
	and  $03                                                        ; $20f0
	push af                                                         ; $20f2
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $20f3
	ldh  [rSVBK], a                                                 ; $20f5

	ld   bc, GB_TILE_WIDTH                                          ; $20f7

; Copy vertically 5 bytes from source to dest
	ld   a, [de]                                                    ; $20fa
	ld   [hl], a                                                    ; $20fb
	inc  de                                                         ; $20fc
	add  hl, bc                                                     ; $20fd

	ld   a, [de]                                                    ; $20fe
	ld   [hl], a                                                    ; $20ff
	inc  de                                                         ; $2100
	add  hl, bc                                                     ; $2101

	ld   a, [de]                                                    ; $2102
	ld   [hl], a                                                    ; $2103
	inc  de                                                         ; $2104
	add  hl, bc                                                     ; $2105

	ld   a, [de]                                                    ; $2106
	ld   [hl], a                                                    ; $2107
	inc  de                                                         ; $2108
	add  hl, bc                                                     ; $2109

	ld   a, [de]                                                    ; $210a
	ld   [hl], a                                                    ; $210b

; Restore wram and rom bank
	pop  af                                                         ; $210c
	ldh  [rSVBK], a                                                 ; $210d
	pop  af                                                         ; $210f
	call SetRomBank1stHalfOfRom                                     ; $2110
	ret                                                             ; $2113


DisplaySpecifiedLocationDoneColumn::
; Preserve and set relevant rom and ram bank
	ld   a, [wRomBank]                                              ; $2114
	push af                                                         ; $2117

	ldh  a, [rSVBK]                                                 ; $2118
	and  $03                                                        ; $211a
	push af                                                         ; $211c

; Unused set rom bank
	ld   a, $02                                                     ; $211d
	call SetRomBank1stHalfOfRom                                     ; $211f

; Display tile map and attr for requested column
	ldh  a, [hLocationDoneTrainSCXtoDrawFor]                        ; $2122
	ld   l, a                                                       ; $2124
	ld   a, [wLocationDoneTrainSCX+1]                               ; $2125
	ld   h, a                                                       ; $2128
	CallFromBank0 DisplayLocationDoneTrainTileMapColumnFromHL

	ldh  a, [hLocationDoneTrainSCXtoDrawFor]                        ; $2131
	ld   l, a                                                       ; $2133
	ld   a, [wLocationDoneTrainSCX+1]                               ; $2134
	ld   h, a                                                       ; $2137
	CallFromBank0 DisplayLocationDoneTrainTileAttrColumnFromHL

; Restore wram and rom bank
	pop  af                                                         ; $2140
	ldh  [rSVBK], a                                                 ; $2141
	pop  af                                                         ; $2143
	call SetRomBank1stHalfOfRom                                     ; $2144
	ret                                                             ; $2147


VBlankInterruptFunc_Scoring:
	CallFromBank0 VBlankInterruptFunc_Scoring_def                   ; $2148
	ret                                                             ; $2150


LCDCInterruptFunc_LocationDone::
; If this is triggering after train, set SCX to 0
	ldh  a, [rLY]                                                   ; $2151
	cp   $78                                                        ; $2153
	jr   nc, .setSCXto0                                             ; $2155

; Else we're at the top, set SCX from var, and trigger the next past above check
	call WaitUntilVramJustSafe                                      ; $2157
	ld   a, [wLocationDoneTrainSCX]                                 ; $215a
	ldh  [rSCX], a                                                  ; $215d
	ld   a, $7f                                                     ; $215f
	ldh  [rLYC], a                                                  ; $2161
	ret                                                             ; $2163

.setSCXto0:
	call WaitUntilVramJustSafe                                      ; $2164
	ld   a, $00                                                     ; $2167
	ldh  [rSCX], a                                                  ; $2169
	ret                                                             ; $216b


; B - hdma5
; C - new rom bank
; DE - dest
; HL - source
StartFarHDMATransfer::
	ld   a, [wRomBank]                                              ; $216c
	push af                                                         ; $216f
	ld   a, c                                                       ; $2170
	call SetRomBank1stHalfOfRom                                     ; $2171
	waitForRequestedVBlank
	call StartHDMATransfer                                          ; $2181
	pop  af                                                         ; $2184
	call SetRomBank1stHalfOfRom                                     ; $2185
	call UpdateSound                                                ; $2188
	ret                                                             ; $218b


VBlankInterruptFunc_ContinueScreen:
; Every vblank, alternate between updating top half and bottom half
	ld   a, [wMainLoopCounter]                                      ; $218c
	and  $01                                                        ; $218f
	jr   nz, .updateBottomHalfTileData                              ; $2191

; Update top half text if non-0
	ld   a, [wContinueScreenTopText1Idx]                            ; $2193
	or   a                                                          ; $2196
	ret  z                                                          ; $2197

; HL = double index into table
	dec  a                                                          ; $2198
	ld   hl, .topText                                               ; $2199
	add  a                                                          ; $219c
	ld   e, a                                                       ; $219d
	ld   d, $00                                                     ; $219e
	add  hl, de                                                     ; $21a0

; Get source address in HL
	ld   a, [hl+]                                                   ; $21a1
	ld   h, [hl]                                                    ; $21a2
	ld   l, a                                                       ; $21a3

; Transfer tile map
	ld   a, BANK(TileMapAndAttr_ContinueTopText2)                   ; $21a4
	call SetRomBank1stHalfOfRom                                     ; $21a6

	ld   a, $00                                                     ; $21a9
	ldh  [rVBK], a                                                  ; $21ab
	ld   de, _SCRN0+$60                                             ; $21ad
	ld   b, (TileMapAndAttr_ContinueTopText2.attr-TileMapAndAttr_ContinueTopText2)/$10-1 ; $21b0
	call StartHDMATransfer                                          ; $21b2

; Inc past tile map data to tile attr, and transfer it
	ld   de, TileMapAndAttr_ContinueTopText2.attr-TileMapAndAttr_ContinueTopText2 ; $21b5
	add  hl, de                                                     ; $21b8

	ld   a, $01                                                     ; $21b9
	ldh  [rVBK], a                                                  ; $21bb
	ld   de, _SCRN0+$60                                             ; $21bd
	ld   b, (TileMapAndAttr_ContinueTopText2.end-TileMapAndAttr_ContinueTopText2.attr)/$10-1 ; $21c0
	call StartHDMATransfer                                          ; $21c2

	ld   a, $00                                                     ; $21c5
	ldh  [rVBK], a                                                  ; $21c7

; Return if countdown == 0
	ld   a, [wContinueScreenCountdown1Idx]                          ; $21c9
	or   a                                                          ; $21cc
	ret  z                                                          ; $21cd

; Tile number 0 starts at $c0
	dec  a                                                          ; $21ce
	add  $c0                                                        ; $21cf
	ld   [_SCRN0+$6f], a                                            ; $21d1
	ret                                                             ; $21d4

.topText:
	dw TileMapAndAttr_ContinueTopText1 ; resume prompt with countdown
	dw TileMapAndAttr_ContinueTopText2 ; resume
	dw TileMapAndAttr_ContinueTopText3 ; game over

.updateBottomHalfTileData:
	ld   a, BANK(ContinueScreenTileMapAndAttrSources)               ; $21db
	call SetRomBank1stHalfOfRom                                     ; $21dd

; Return if idx == 0
	ld   a, [wContinueScreenBottomHalf1Idx]                         ; $21e0
	or   a                                                          ; $21e3
	ret  z                                                          ; $21e4

; HL = double index into table
	dec  a                                                          ; $21e5
	ld   hl, ContinueScreenTileMapAndAttrSources                    ; $21e6
	add  a                                                          ; $21e9
	ld   e, a                                                       ; $21ea
	ld   d, $00                                                     ; $21eb
	add  hl, de                                                     ; $21ed

; Get source address in HL
	ld   a, [hl+]                                                   ; $21ee
	ld   h, [hl]                                                    ; $21ef
	ld   l, a                                                       ; $21f0

; Transfer tile map
	ld   a, BANK(TileMapAndAttr_ContinueBottomText1)                ; $21f1
	call SetRomBank1stHalfOfRom                                     ; $21f3

	ld   a, $00                                                     ; $21f6
	ldh  [rVBK], a                                                  ; $21f8
	ld   de, _SCRN0+$160                                            ; $21fa
	ld   b, (TileMapAndAttr_ContinueBottomText1.attr-TileMapAndAttr_ContinueBottomText1)/$10-1 ; $21fd
	call StartHDMATransfer                                          ; $21ff

; Inc past tile map data to tile attr, and transfer it
	ld   de, TileMapAndAttr_ContinueBottomText1.attr-TileMapAndAttr_ContinueBottomText1 ; $2202
	add  hl, de                                                     ; $2205

	ld   a, $01                                                     ; $2206
	ldh  [rVBK], a                                                  ; $2208
	ld   de, _SCRN0+$160                                            ; $220a
	ld   b, (TileMapAndAttr_ContinueBottomText1.end-TileMapAndAttr_ContinueBottomText1.attr)/$10-1 ; $220d
	call StartHDMATransfer                                          ; $220f
	ret                                                             ; $2212


VBlankInterruptFunc_EnterHighScore:
	ld   a, $00                                                     ; $2213
	ldh  [rVBK], a                                                  ; $2215

; Copy top 8 tiles of the 4 name metatiles
	ld   hl, wEnterScoreNameTileMap                                 ; $2217
	ld   de, _SCRN0+$e6                                             ; $221a
rept 8
	ld   a, [hl+]                                                   ; $221d
	ld   [de], a                                                    ; $221e
	inc  de                                                         ; $221f
endr

; Go to next row, back to the start of the 4 metatiles
	ld   a, e                                                       ; $2235
	add  LOW(GB_TILE_WIDTH-8)                                       ; $2236
	ld   e, a                                                       ; $2238
	ld   a, d                                                       ; $2239
	adc  HIGH(GB_TILE_WIDTH-8)                                      ; $223a
	ld   d, a                                                       ; $223c

; Copy the bottom 8 tiles
rept 7
	ld   a, [hl+]                                                   ; $223d
	ld   [de], a                                                    ; $223e
	inc  de                                                         ; $223f
endr
	ld   a, [hl+]                                                   ; $2252
	ld   [de], a                                                    ; $2253

; Copy the options at the bottom
	ld   hl, wEnterScoreDisplayedLetterSelectionTileMap             ; $2254
	ld   de, _SCRN0+$1a0                                            ; $2257
	ld   b, (wEnterScoreDisplayedLetterSelectionTileMap.end-wEnterScoreDisplayedLetterSelectionTileMap)/$10-1 ; $225a
	call StartHDMATransfer                                          ; $225c

	ld   a, [wEnterScoreNextLetterSCX]                              ; $225f
	ld   [wEnterScoreLettersSCX], a                                 ; $2262
	ret                                                             ; $2265


LCDCInterruptFunc_EnterHighScore:
; Return if before letter area
	ldh  a, [rLY]                                                   ; $2266
	cp   $67                                                        ; $2268
	jr   z, .overridedSCX                                           ; $226a

	cp   $77                                                        ; $226c
	jr   z, .normalSCX                                              ; $226e

	ret                                                             ; $2270

.overridedSCX:
; Override in letter area
	ld   a, [wEnterScoreLettersSCX]                                 ; $2271
	ldh  [rSCX], a                                                  ; $2274
	ret                                                             ; $2276

.normalSCX:
; Set normal SCX in normal area
	ld   a, [wSCX]                                                  ; $2277
	ldh  [rSCX], a                                                  ; $227a
	ret                                                             ; $227c


VBlankInterruptFunc_Rankings:
; Skip metatile drawing if not needed at the moment
	ld   a, [wRankingsShouldDrawNextMetatile]                       ; $227d
	or   a                                                          ; $2280
	jr   z, .end                                                    ; $2281

; Set rom and tile map vram bank
	ld   a, BANK(RankingsMetatileTileIdxes)                         ; $2283
	call SetRomBank1stHalfOfRom                                     ; $2285
	ld   a, $00                                                     ; $2288
	ldh  [rVBK], a                                                  ; $228a

; If erasing, draw a black metatile, else draw the actual metatile
	ld   a, [wRankingsIsErasingText]                                ; $228c
	or   a                                                          ; $228f
	jr   z, .useActualMetatileIdx                                   ; $2290

	ld   a, RANKINGS_METATILE_EMPTY                                 ; $2292
	jr   .cont                                                      ; $2294

.useActualMetatileIdx:
	ld   a, [wRankingsCurrentMetatileIdxAtLocation]                 ; $2296

.cont:
; Metatile contains 4 tiles
	add  a                                                          ; $2299
	add  a                                                          ; $229a

; DE is metatile's index into table
	ld   hl, RankingsMetatileTileIdxes                              ; $229b
	ld   c, a                                                       ; $229e
	ld   b, $00                                                     ; $229f
	add  hl, bc                                                     ; $22a1
	ld   e, l                                                       ; $22a2
	ld   d, h                                                       ; $22a3

; Get double index of tile location idx being drawn on
	ld   a, [wRankingsTileLocationIdxBeingDrawn]                    ; $22a4
	add  a                                                          ; $22a7
	ld   c, a                                                       ; $22a8
	ld   b, $00                                                     ; $22a9

; Get vram address of location
	ld   hl, RankingsChangingTilesLocations                         ; $22ab
	add  hl, bc                                                     ; $22ae
	ld   a, [hl+]                                                   ; $22af
	ld   h, [hl]                                                    ; $22b0
	ld   l, a                                                       ; $22b1

; Draw top half of metatile
	ld   bc, $001f                                                  ; $22b2
	ld   a, [de]                                                    ; $22b5
	ld   [hl+], a                                                   ; $22b6
	inc  de                                                         ; $22b7
	ld   a, [de]                                                    ; $22b8
	ld   [hl], a                                                    ; $22b9
	inc  de                                                         ; $22ba

; Draw bottom half of metatile
	add  hl, bc                                                     ; $22bb
	ld   a, [de]                                                    ; $22bc
	ld   [hl+], a                                                   ; $22bd
	inc  de                                                         ; $22be
	ld   a, [de]                                                    ; $22bf
	ld   [hl], a                                                    ; $22c0

; Don't draw metatile again next vblank
	ld   a, $00                                                     ; $22c1
	ld   [wRankingsShouldDrawNextMetatile], a                       ; $22c3

.end:
	ld   a, BANK(RankingsLeftNumbersLocations)                      ; $22c6
	call SetRomBank1stHalfOfRom                                     ; $22c8

; Return if no need to change the colors of the left rankings numbers
	ld   a, [wRankingsCurrLeftNumberTileAttr]                       ; $22cb
	or   a                                                          ; $22ce
	ret  z                                                          ; $22cf

; Save attr in B
	ld   b, a                                                       ; $22d0

; Curr rankings number is double-index into table
	ld   a, [wRankingsCurrLeftNumberIdxBeingOperatedOn]             ; $22d1
	add  a                                                          ; $22d4
	ld   hl, RankingsLeftNumbersLocations                           ; $22d5
	ld   e, a                                                       ; $22d8
	ld   d, $00                                                     ; $22d9
	add  hl, de                                                     ; $22db

	ld   de, GB_TILE_WIDTH                                          ; $22dc

; Get vram addr of curr left number
	ld   a, [hl+]                                                   ; $22df
	ld   h, [hl]                                                    ; $22e0
	ld   l, a                                                       ; $22e1

; Store attr in top and bottom halves
	ld   a, $01                                                     ; $22e2
	ldh  [rVBK], a                                                  ; $22e4
	ld   [hl], b                                                    ; $22e6
	add  hl, de                                                     ; $22e7
	ld   [hl], b                                                    ; $22e8
	ret                                                             ; $22e9


GameState1a_GameSetupInit:
	JumpFromBank0 GameState1a_GameSetupInit_def


GameState1b_GameSetupMain::
	JumpFromBank0 GameState1b_GameSetupMain_def


LCDCInterruptFunc_GameSetupScreen1::
; Scrolling text SCX in H
	ld   a, [wScrollingText_SCX]                                    ; $22fa
	ld   h, a                                                       ; $22fd
	call WaitUntilVramJustSafe_trashL                               ; $22fe

; Preserve SCX for after scrolling text, and set new SCX
	ldh  a, [rSCX]                                                  ; $2301
	ld   l, a                                                       ; $2303
	ld   a, h                                                       ; $2304
	ldh  [rSCX], a                                                  ; $2305
	ld   a, l                                                       ; $2307
	ld   [wNonScrollingText_PreservedSCX], a                        ; $2308

; LY is after scrolling text
	ld   a, $2f                                                     ; $230b
	ldh  [rLYC], a                                                  ; $230d

; Get current lcdc func (trashed when returning to interrupt handler)
	ld   a, [wLCDCInterruptFunc]                                    ; $230f
	ld   l, a                                                       ; $2312
	ld   a, [wLCDCInterruptFunc+1]                                  ; $2313
	ld   h, a                                                       ; $2316

; Set new LCD func
	ld   a, LOW(LCDCInterruptFunc_GameSetupScreen2)                 ; $2317
	ld   [wLCDCInterruptFunc], a                                    ; $2319
	ld   a, HIGH(LCDCInterruptFunc_GameSetupScreen2)                ; $231c
	ld   [wLCDCInterruptFunc+1], a                                  ; $231e
	ret                                                             ; $2321


LCDCInterruptFunc_GameSetupScreen2:
; Set the standard SCX
	ld   a, [wNonScrollingText_PreservedSCX]                        ; $2322
	ld   h, a                                                       ; $2325
	call WaitUntilVramJustSafe_trashL                               ; $2326
	ld   a, h                                                       ; $2329
	ldh  [rSCX], a                                                  ; $232a

; Unset LCDC setup
	xor  a                                                          ; $232c
	ldh  [rIF], a                                                   ; $232d
	ld   a, IEF_VBLANK                                              ; $232f
	ldh  [rIE], a                                                   ; $2331
	ld   a, $00                                                     ; $2333
	ldh  [rSTAT], a                                                 ; $2335

; No more LCD funcs (HL is trashed when returning to interrupt handler)
	ld   a, [wLCDCInterruptFunc]                                    ; $2337
	ld   l, a                                                       ; $233a
	ld   a, [wLCDCInterruptFunc+1]                                  ; $233b
	ld   h, a                                                       ; $233e

	ld   a, LOW(StubInterruptFunc)                                  ; $233f
	ld   [wLCDCInterruptFunc], a                                    ; $2341
	ld   a, HIGH(StubInterruptFunc)                                 ; $2344
	ld   [wLCDCInterruptFunc+1], a                                  ; $2346
	ret                                                             ; $2349


ResetSaveData::
	ld   a, [wRomBank]                                              ; $234a
	push af                                                         ; $234d

; Clear all vars in save data area
	ld   hl, wSaveDataStart                                         ; $234e
	ld   de, wSaveDataEnd-1                                         ; $2351
	ld   b, $00                                                     ; $2354
	inc  de                                                         ; $2356
	call SetB_HLtoDE                                                ; $2357

; Reset high scores, unlocked trains and movies
	CallFromBank0 ResetHighScores
	call ResetTrainsAndMoviesUnlocked                               ; $2362

; Set game setup options to defaults, ie Medium, 2-handed, speed shown, meters shown
	ld   a, $01                                                     ; $2365
	ld   [wDifficultyLevel], a                                      ; $2367
	ld   a, $00                                                     ; $236a
	ld   [wControlSchemeIs1Handed], a                               ; $236c
	ld   a, $00                                                     ; $236f
	ld   [wSpeedMeterOption], a                                     ; $2371
	ld   a, $00                                                     ; $2374
	ld   [wDistanceMeterOption], a                                  ; $2376

	pop  af                                                         ; $2379
	call SetRomBank1stHalfOfRom                                     ; $237a
	ret                                                             ; $237d


CheckChecksum:
; Enable sram
	ld   a, $00                                                     ; $237e
	ld   [rRAMB], a                                                 ; $2380
	ld   a, RAMG_ENABLE                                             ; $2383
	ld   [rRAMG], a                                                 ; $2385

; Check special bytes
	or   a                                                          ; $2388
	ld   a, [sSpecialBytes]                                         ; $2389
	cp   $38                                                        ; $238c
	ret  nz                                                         ; $238e

	ld   a, [sSpecialBytes+1]                                       ; $238f
	cp   $12                                                        ; $2392
	ret  nz                                                         ; $2394

; Special bytes match - check checksum
	ld   de, sSaveDataStart                                         ; $2395
	ld   b, $10                                                     ; $2398
	call GetChecksum                                                ; $239a

; ret nz if checksum doesn't match
	ld   a, [sChecksum]                                             ; $239d
	cp   l                                                          ; $23a0
	ret  nz                                                         ; $23a1

	ld   a, [sChecksum+1]                                           ; $23a2
	cp   h                                                          ; $23a5

; Disable sram
	ld   a, RAMG_DISABLE                                            ; $23a6
	ld   [rRAMG], a                                                 ; $23a8
	ret                                                             ; $23ab


; B - num bytes to total
GetChecksum:
	ld   hl, $0000                                                  ; $23ac

; Total bytes from memory region
:	push bc                                                         ; $23af

	ld   a, [de]                                                    ; $23b0
	inc  de                                                         ; $23b1
	ld   c, a                                                       ; $23b2
	ld   b, $00                                                     ; $23b3
	add  hl, bc                                                     ; $23b5

	pop  bc                                                         ; $23b6
	dec  b                                                          ; $23b7
	jr   nz, :-                                                     ; $23b8

	ret                                                             ; $23ba


ASSERT sSaveDataStart.end-sSaveDataStart == wSaveDataEnd-wSaveDataStart

SaveSaveData::
; Enable sram
	ld   a, $00                                                     ; $23bb
	ld   [rRAMB], a                                                 ; $23bd
	ld   a, RAMG_ENABLE                                             ; $23c0
	ld   [rRAMG], a                                                 ; $23c2

; Indicate save data exists
	ld   a, $38                                                     ; $23c5
	ld   [sSpecialBytes], a                                         ; $23c7
	ld   a, $12                                                     ; $23ca
	ld   [sSpecialBytes+1], a                                       ; $23cc

; Copy into sram
	ld   hl, wSaveDataStart                                         ; $23cf
	ld   de, sSaveDataStart                                         ; $23d2
	ld   bc, wSaveDataEnd-wSaveDataStart                            ; $23d5
	call MemCopy                                                    ; $23d8

; Get, then store checksum
	ld   de, wSaveDataStart                                         ; $23db
	ld   b, $10                                                     ; $23de
	call GetChecksum                                                ; $23e0
	ld   a, l                                                       ; $23e3
	ld   [sChecksum], a                                             ; $23e4
	ld   a, h                                                       ; $23e7
	ld   [sChecksum+1], a                                           ; $23e8

; Disable sram
	ld   a, RAMG_DISABLE                                            ; $23eb
	ld   [rRAMG], a                                                 ; $23ed
	ret                                                             ; $23f0


LoadSaveData:
; Enable sram
	ld   a, $00                                                     ; $23f1
	ld   [rRAMB], a                                                 ; $23f3
	ld   a, RAMG_ENABLE                                             ; $23f6
	ld   [rRAMG], a                                                 ; $23f8

; Load initial data
	ld   hl, sSaveDataStart                                         ; $23fb
	ld   de, wSaveDataStart                                         ; $23fe
	ld   bc, wSaveDataEnd-wSaveDataStart                            ; $2401
	call MemCopy                                                    ; $2404

; Disable sram
	ld   a, RAMG_DISABLE                                            ; $2407
	ld   [rRAMG], a                                                 ; $2409
	ret                                                             ; $240c


ResetTrainsAndMoviesUnlocked:
; Clear trains and movies unlocked after this block
	ld   hl, wTrainsUnlocked                                        ; $240d
	ld   de, wSaveDataEnd-1                                         ; $2410
	ld   b, $00                                                     ; $2413
	inc  de                                                         ; $2415
	call SetB_HLtoDE                                                ; $2416

; Provide some train images from the start
	ld   a, $01                                                     ; $2419
	ld   [wTrainsUnlocked+$43], a                                   ; $241b
	ld   a, $01                                                     ; $241e
	ld   [wTrainsUnlocked+$32], a                                   ; $2420
	ld   a, $01                                                     ; $2423
	ld   [wTrainsUnlocked+$09], a                                   ; $2425
	ld   a, $01                                                     ; $2428
	ld   [wTrainsUnlocked+$17], a                                   ; $242a
	ld   a, $01                                                     ; $242d
	ld   [wTrainsUnlocked+$c], a                                    ; $242f
	ld   a, $01                                                     ; $2432
	ld   [wTrainsUnlocked+$1c], a                                   ; $2434
	ld   a, $01                                                     ; $2437
	ld   [wTrainsUnlocked+$3e], a                                   ; $2439
	ld   a, $01                                                     ; $243c
	ld   [wTrainsUnlocked+$3f], a                                   ; $243e

; Set that we've seen the intro cutscene
	ld   a, $01                                                     ; $2441
	ld   [wMoviesUnlocked], a                                       ; $2443
	ret                                                             ; $2446


GameState20_TrainImageInit:
; SCY to keep bottom tiles a little off the bottom edge
	ld   a, $02                                                     ; $2447
	ld   [wSCY], a                                                  ; $2449

; Clear palettes, scripts, oam, then start script
	ld   a, $00                                                     ; $244c
	ld   [wLoadPalettesFromRam], a                                  ; $244e
	call InitScriptStructs                                          ; $2451
	call ClearScriptsOamHideAllOam                                  ; $2454
	M_StartMainScript 0, TrainImageScript

GameState22_TrainImageStub:
	ret                                                             ; $2460


GameState21_TrainImageMain:
	ldbc STATF_LCD, LOW(rBCPD)                                      ; $2461

; If train info, just load base palettes for it
	ld   a, [PAGE_0+VIEWING_TRAIN_IMAGE_INFO]                       ; $2464
	or   a                                                          ; $2467
	jp   nz, .cont                                                  ; $2468

; Hi-col
	ld   a, BANK(TrainImageHiColPaletteSrces)                       ; $246b
	call SetRomBank1stHalfOfRom                                     ; $246d

; DE = 1-indexed train idx
	ld   a, [PAGE_0+TRAIN_IDX]                                      ; $2470
	ld   e, a                                                       ; $2473
	ld   d, $00                                                     ; $2474

; Get triple index in DE
	add  a                                                          ; $2476
	add  e                                                          ; $2477
	ld   e, a                                                       ; $2478
	ld   a, d                                                       ; $2479
	adc  $00                                                        ; $247a
	ld   d, a                                                       ; $247c

; Offset into table
	ld   a, e                                                       ; $247d
	add  LOW(TrainImageHiColPaletteSrces-3)                         ; $247e
	ld   e, a                                                       ; $2480
	ld   a, d                                                       ; $2481
	adc  HIGH(TrainImageHiColPaletteSrces-3)                        ; $2482
	ld   d, a                                                       ; $2484

; 3 bytes contains source addr, then bank
	ld   a, [de]                                                    ; $2485
	ld   l, a                                                       ; $2486
	inc  de                                                         ; $2487
	ld   a, [de]                                                    ; $2488
	ld   h, a                                                       ; $2489
	inc  de                                                         ; $248a
	ld   a, [de]                                                    ; $248b
	call SetRomBank1stHalfOfRom                                     ; $248c

; Copy 1st set of palettes
	ld   a, XCPS_AUTO_INCREMENT                                     ; $248f
	ldh  [rBCPS], a                                                 ; $2491
	ld   d, NUM_PALETTE_BYTES                                       ; $2493
:	ld   a, [hl+]                                                   ; $2495
	ldh  [c], a                                                     ; $2496
	dec  d                                                          ; $2497
	jr   nz, :-                                                     ; $2498

; Copy for $7c scanlines
	ld   d, $3e                                                     ; $249a

.next40hPalettes:
; Wait until vram free
:	ldh  a, [rSTAT]                                                 ; $249c
	and  b                                                          ; $249e
	jr   nz, :-                                                     ; $249f

rept $20
	ld   a, [hl+]                                                   ; $24a1
	ldh  [c], a                                                     ; $24a2
endr

; Wait until vram free
:	ldh  a, [rSTAT]                                                 ; $24e1
	and  b                                                          ; $24e3
	jr   nz, :-                                                     ; $24e4

rept $20
	ld   a, [hl+]                                                   ; $24e6
	ldh  [c], a                                                     ; $24e7
endr

	dec  d                                                          ; $2526
	jp   nz, .next40hPalettes                                       ; $2527

; Then load same palettes as info screen
.cont:
; Set bank and src of palettes
	ld   a, BANK(BGPalettes_TrainImageInfo)                         ; $252a
	call SetRomBank1stHalfOfRom                                     ; $252c
	ld   hl, BGPalettes_TrainImageInfo                              ; $252f

; Copy last set of palettes for window
	ld   a, XCPS_AUTO_INCREMENT                                     ; $2532
	ldh  [rBCPS], a                                                 ; $2534

; Wait until vram free
:	ldh  a, [rSTAT]                                                 ; $2536
	and  b                                                          ; $2538
	jr   nz, :-                                                     ; $2539

rept $20
	ld   a, [hl+]                                                   ; $253b
	ldh  [c], a                                                     ; $253c
endr

; Wait until vram free
:	ldh  a, [rSTAT]                                                 ; $257b
	and  b                                                          ; $257d
	jr   nz, :-                                                     ; $257e

rept $20
	ld   a, [hl+]                                                   ; $2580
	ldh  [c], a                                                     ; $2581
endr

	ret                                                             ; $25c0


; A - source bank
; HL - source addr
LoadTrainImageTileData::
	call SetRomBank1stHalfOfRom                                     ; $25c1

; Set palettes to all black - no fade
	push hl                                                         ; $25c4
	waitForRequestedVBlank
	ld   b, BANK(Palettes_AllBlack)                                 ; $25d2
	ld   hl, Palettes_AllBlack                                      ; $25d4
	xor  a                                                          ; $25d7
	ld   [wPaletteFadeAmount], a                                    ; $25d8
	call FarLoadAllBGPalettes                                       ; $25db

	ld   b, BANK(Palettes_AllBlack)                                 ; $25de
	ld   hl, Palettes_AllBlack                                      ; $25e0
	xor  a                                                          ; $25e3
	ld   [wPaletteFadeAmount], a                                    ; $25e4
	ld   a, $00                                                     ; $25e7
	ld   [wLoadPalettesFromRam], a                                  ; $25e9
	call FarLoadAllOBJPalettes                                      ; $25ec
	pop  hl                                                         ; $25ef

; Branch based on viewing state
	ld   a, [PAGE_0+VIEWING_TRAIN_IMAGE_INFO]                       ; $25f0
	or   a                                                          ; $25f3
	jr   nz, .viewingTrainInfo                                      ; $25f4

; Viewing hi-col image - transfer 1st BG tiles
	ld   a, $00                                                     ; $25f6
	ldh  [rVBK], a                                                  ; $25f8
	ld   de, _VRAM+$800                                             ; $25fa
	ld   b, ($800/$10)-1                                            ; $25fd
	call UpdateSound                                                ; $25ff
	waitForRequestedVBlank
	call StartHDMATransfer                                          ; $260f

; Transfer 2nd BG tiles
	ld   de, $0800                                                  ; $2612
	add  hl, de                                                     ; $2615
	ld   de, _VRAM+$1000                                            ; $2616
	ld   b, ($800/$10)-1                                            ; $2619
	call UpdateSound                                                ; $261b
	waitForRequestedVBlank
	call StartHDMATransfer                                          ; $262b

; Transfer 3rd BG tiles in vram bank 1
	ld   a, $01                                                     ; $262e
	ldh  [rVBK], a                                                  ; $2630
	ld   de, $0800                                                  ; $2632
	add  hl, de                                                     ; $2635
	ld   de, _VRAM+$800                                             ; $2636
	ld   b, ($400/$10)-1                                            ; $2639
	call UpdateSound                                                ; $263b
	waitForRequestedVBlank
	call StartHDMATransfer                                          ; $264b
	jp   .cont                                                      ; $264e

.viewingTrainInfo:
; Skip past margin
	ld   a, $00                                                     ; $2651
	ldh  [rVBK], a                                                  ; $2653
	ld   de, $0010                                                  ; $2655
	add  hl, de                                                     ; $2658

; Loop 14 times, copying $120 bytes each time
; Skip $20 bytes (margins) from source after every loop
	ld   c, $0e                                                     ; $2659
	ld   de, _VRAM+$800                                             ; $265b
	ld   b, ($120/$10)-1                                            ; $265e

.loopTrainInfo:
	call UpdateSound                                                ; $2660
	waitForRequestedVBlank
	call StartHDMATransfer                                          ; $2670

; HL += $140
	ld   a, $40                                                     ; $2673
	add  l                                                          ; $2675
	ld   l, a                                                       ; $2676
	ld   a, h                                                       ; $2677
	adc  $01                                                        ; $2678
	ld   h, a                                                       ; $267a

; DE += $120
	ld   a, $20                                                     ; $267b
	add  e                                                          ; $267d
	ld   e, a                                                       ; $267e
	ld   a, d                                                       ; $267f
	adc  $01                                                        ; $2680
	ld   d, a                                                       ; $2682

	dec  c                                                          ; $2683
	jr   nz, .loopTrainInfo                                         ; $2684

; Transfer last $40 bytes (clearing it)
	ld   b, ($40/$10)-1                                             ; $2686
	call UpdateSound                                                ; $2688
	waitForRequestedVBlank
	call StartHDMATransfer                                          ; $2698

; HL += $40
	ld   a, $40                                                     ; $269b
	add  l                                                          ; $269d
	ld   l, a                                                       ; $269e
	ld   a, h                                                       ; $269f
	adc  $00                                                        ; $26a0
	ld   h, a                                                       ; $26a2

; DE += $40
	ld   a, $40                                                     ; $26a3
	add  e                                                          ; $26a5
	ld   e, a                                                       ; $26a6
	ld   a, d                                                       ; $26a7
	adc  $00                                                        ; $26a8
	ld   d, a                                                       ; $26aa

; Transfer $e0 tiles to vram bank 1 (unknown, just clears it)
	ld   a, $01                                                     ; $26ab
	ldh  [rVBK], a                                                  ; $26ad
	ld   de, _VRAM+$800                                             ; $26af
	ld   b, ($e0/$10)-1                                             ; $26b2
	call UpdateSound                                                ; $26b4
	waitForRequestedVBlank
	call StartHDMATransfer                                          ; $26c4

; HL += $100
	ld   a, $00                                                     ; $26c7
	add  l                                                          ; $26c9
	ld   l, a                                                       ; $26ca
	ld   a, h                                                       ; $26cb
	adc  $01                                                        ; $26cc
	ld   h, a                                                       ; $26ce

; DE += $e0
	ld   a, $e0                                                     ; $26cf
	add  e                                                          ; $26d1
	ld   e, a                                                       ; $26d2
	ld   a, d                                                       ; $26d3
	adc  $00                                                        ; $26d4
	ld   d, a                                                       ; $26d6

; Loop 3 times, copying $120 bytes each time (unknown, just clears it)
; Skip $20 bytes (margins) from source after every loop
	ld   c, $03                                                     ; $26d7
	ld   de, _VRAM+$800                                             ; $26d9
	ld   b, ($120/$10)-1                                            ; $26dc

.loopTrainInfo2:
	call UpdateSound                                                ; $26de
	waitForRequestedVBlank
	call StartHDMATransfer                                          ; $26ee

; HL += $140
	ld   a, $40                                                     ; $26f1
	add  l                                                          ; $26f3
	ld   l, a                                                       ; $26f4
	ld   a, h                                                       ; $26f5
	adc  $01                                                        ; $26f6
	ld   h, a                                                       ; $26f8

; DE += $120
	ld   a, $20                                                     ; $26f9
	add  e                                                          ; $26fb
	ld   e, a                                                       ; $26fc
	ld   a, d                                                       ; $26fd
	adc  $01                                                        ; $26fe
	ld   d, a                                                       ; $2700

	dec  c                                                          ; $2701
	jr   nz, .loopTrainInfo2                                        ; $2702

.cont:
; For both hi-col and train info, transfer cleared name tile data
	ld   a, $01                                                     ; $2704
	ldh  [rVBK], a                                                  ; $2706
	ld   a, BANK(Gfx_TrainImageNames)                               ; $2708
	call SetRomBank1stHalfOfRom                                     ; $270a
	ld   hl, Gfx_TrainImageNames.end                                ; $270d
	ld   de, _VRAM+$1200                                            ; $2710
	ld   b, ($c0/$10)-1                                             ; $2713
	call UpdateSound                                                ; $2715
	waitForRequestedVBlank
	call StartHDMATransfer                                          ; $2725

; Display train image's name, then restore bank
	ld   a, [PAGE_0+TRAIN_IDX]                                      ; $2728
	call DisplayTrainImageName                                      ; $272b
	ld   a, BANK(TrainImageScript)                                  ; $272e
	call SetRomBank1stHalfOfRom                                     ; $2730
	ret                                                             ; $2733


; A - train 1-idx
DisplayTrainImageName::
	ld   de, _VRAM+$1200                                            ; $2734

; BC = A, vram bank is 1
	ld   c, a                                                       ; $2737
	ld   b, $00                                                     ; $2738
	ld   a, $01                                                     ; $273a
	ldh  [rVBK], a                                                  ; $273c

; Preserve rom bank and set new one
	ld   a, [wRomBank]                                              ; $273e
	push af                                                         ; $2741
	ld   a, BANK(TrainImageNameTileDataSources)                     ; $2742
	call SetRomBank1stHalfOfRom                                     ; $2744

; Triple train 1-index is offset into table
	ld   hl, TrainImageNameTileDataSources-3                        ; $2747
	add  hl, bc                                                     ; $274a
	add  hl, bc                                                     ; $274b
	add  hl, bc                                                     ; $274c

; First byte is hdma5 (num bytes/$10 - 1)
	ld   a, [hl+]                                                   ; $274d
	ld   b, a                                                       ; $274e

; Word after is data source
	ld   a, [hl+]                                                   ; $274f
	ld   h, [hl]                                                    ; $2750
	ld   l, a                                                       ; $2751

; Transfer bytes, then restore rom bank
	ld   a, BANK(Gfx_TrainImageNames)                               ; $2752
	call SetRomBank1stHalfOfRom                                     ; $2754
	call UpdateSound                                                ; $2757
	waitForRequestedVBlank
	call StartHDMATransfer                                          ; $2767

	pop  af                                                         ; $276a
	call SetRomBank1stHalfOfRom                                     ; $276b
	ret                                                             ; $276e


GameState1c_StageCompleteInit:
	JumpFromBank0 GameState1c_StageCompleteInit_def


GameState1d_StageCompleteMain:
	JumpFromBank0 GameState1d_StageCompleteMain_def


VBlankInterruptFunc_StageComplete::
; Set vram bank 0, and rom bank of source
	xor  a                                                          ; $277f
	ldh  [rVBK], a                                                  ; $2780
	ld   a, [wStageCompleteTileDataBank]                            ; $2782
	call SetRomBank1stHalfOfRom                                     ; $2785

; Set src + dest hdma details
	ld   a, HIGH(_VRAM+$1300)                                       ; $2788
	ldh  [rHDMA3], a                                                ; $278a
	ld   a, LOW(_VRAM+$1300)                                        ; $278c
	ldh  [rHDMA4], a                                                ; $278e
	ld   a, [wStageCompleteTileDataAddr]                            ; $2790
	ldh  [rHDMA2], a                                                ; $2793
	ld   a, [wStageCompleteTileDataAddr+1]                          ; $2795
	ldh  [rHDMA1], a                                                ; $2798

; Get end of bank - high byte of src, transfer a max of $500 bytes
	ld   b, a                                                       ; $279a
	ld   a, HIGH($8000)                                             ; $279b
	sub  b                                                          ; $279d
	cp   $05                                                        ; $279e
	jr   c, :+                                                      ; $27a0
	ld   a, $05                                                     ; $27a2
:	swap a                                                          ; $27a4
	dec  a                                                          ; $27a6
	ldh  [rHDMA5], a                                                ; $27a7

; Jump if max size sent
	cp   ($500/$10)-1                                               ; $27a9
	jr   nc, .afterTransfer                                         ; $27ab

; Less than max size sent, inc to next bank
	ld   a, [wStageCompleteTileDataBank]                            ; $27ad
	inc  a                                                          ; $27b0
	call SetRomBank1stHalfOfRom                                     ; $27b1

; Transfer from the start
	ld   a, HIGH($4000)                                             ; $27b4
	ldh  [rHDMA1], a                                                ; $27b6
	lda  LOW($4000)                                                 ; $27b8
	ldh  [rHDMA2], a                                                ; $27b9

; Get prev high byte, get num bytes left passed $8000, to help get hdma5
	ld   a, [wStageCompleteTileDataAddr+1]                          ; $27bb
	add  $05                                                        ; $27be
	and  $07                                                        ; $27c0
	swap a                                                          ; $27c2
	dec  a                                                          ; $27c4
	ldh  [rHDMA5], a                                                ; $27c5

.afterTransfer:
; Set high byte to next $500 bytes
	ld   a, [wStageCompleteTileDataAddr+1]                          ; $27c7
	add  $05                                                        ; $27ca
	cp   HIGH($8000)                                                ; $27cc
	jr   c, .setNewSrcHighByte                                      ; $27ce

; When passed end of bank, inc bank, and get new addr from start of bank
	ld   hl, wStageCompleteTileDataBank                             ; $27d0
	inc  [hl]                                                       ; $27d3
	and  $7f                                                        ; $27d4
	or   HIGH($4000)                                                ; $27d6

.setNewSrcHighByte:
	ld   [wStageCompleteTileDataAddr+1], a                          ; $27d8

; Replace vblank interrupt with stub
	ld   a, [wVBlankInterruptFunc]                                  ; $27db
	ld   l, a                                                       ; $27de
	ld   a, [wVBlankInterruptFunc+1]                                ; $27df
	ld   h, a                                                       ; $27e2
	ld   a, LOW(StubInterruptFunc)                                  ; $27e3
	ld   [wVBlankInterruptFunc], a                                  ; $27e5
	ld   a, HIGH(StubInterruptFunc)                                 ; $27e8
	ld   [wVBlankInterruptFunc+1], a                                ; $27ea
	ret                                                             ; $27ed


GameState1e_CreditsInit:
	JumpFromBank0 GameState1e_CreditsInit_def


GameState1f_CreditsMain:
	JumpFromBank0 GameState1f_CreditsMain_def


GameState25_PictureBookInit:
; Clear palettes, scripts and oam
	ld   a, $00                                                     ; $27fe
	ld   [wLoadPalettesFromRam], a                                  ; $2800
	call InitScriptStructs                                          ; $2803
	call ClearScriptsOamHideAllOam                                  ; $2806

; Clear scroll
	di                                                              ; $2809
	xor  a                                                          ; $280a
	ld   [wSCX], a                                                  ; $280b
	ld   [wSCY], a                                                  ; $280e

; VBlank and LCDC funcs are stubbed (HL in both cases are trashed)
	ld   a, [wVBlankInterruptFunc]                                  ; $2811
	ld   l, a                                                       ; $2814
	ld   a, [wVBlankInterruptFunc+1]                                ; $2815
	ld   h, a                                                       ; $2818

	ld   a, LOW(StubInterruptFunc)                                  ; $2819
	ld   [wVBlankInterruptFunc], a                                  ; $281b
	ld   a, HIGH(StubInterruptFunc)                                 ; $281e
	ld   [wVBlankInterruptFunc+1], a                                ; $2820

	ld   a, [wLCDCInterruptFunc]                                    ; $2823
	ld   l, a                                                       ; $2826
	ld   a, [wLCDCInterruptFunc+1]                                  ; $2827
	ld   h, a                                                       ; $282a
	
	ld   a, LOW(StubInterruptFunc)                                  ; $282b
	ld   [wLCDCInterruptFunc], a                                    ; $282d
	ld   a, HIGH(StubInterruptFunc)                                 ; $2830
	ld   [wLCDCInterruptFunc+1], a                                  ; $2832
	
; Allow vblank and lcdc interrupt and turn on LCD
	ld   a, $00                                                     ; $2835
	ldh  [rIF], a                                                   ; $2837
	ld   a, IEF_LCDC|IEF_VBLANK                                     ; $2839
	ldh  [rIE], a                                                   ; $283b
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $283d
	ldh  [rLCDC], a                                                 ; $283f
	ld   a, $00                                                     ; $2841
	ldh  [rSTAT], a                                                 ; $2843

; Based on the originating screen, start the scripts differently
	ei                                                              ; $2845
	ld   a, [wPictureBookPrevScreen]                                ; $2846
	cp   $01                                                        ; $2849
	jr   z, .fromTrainSubMenu                                       ; $284b

	cp   $02                                                        ; $284d
	jr   z, .fromMovieSubMenu                                       ; $284f

; From title screen opts
	M_StartMainScript 0, PictureBookScript_FromTitleScreenOpts
	ret                                                             ; $285a

.fromTrainSubMenu:
	M_StartMainScript 0, PictureBookScript_FromTrainSubMenu
	ret                                                             ; $2864

.fromMovieSubMenu:
	M_StartMainScript 0, PictureBookScript_FromMovieSubMenu
	ret                                                             ; $286e


GameState26_PictureBookMain:
	JumpFromBank0 GameState26_PictureBookMain_def


WaitUntilVramJustSafe_trashL:
; Wait for LCD unusable
:	ld   l, STATF_LCD                                               ; $2877
	ldh  a, [rSTAT]                                                 ; $2879
	and  l                                                          ; $287b
	jr   z, :-                                                      ; $287c

; Wait for LCD free
:	ldh  a, [rSTAT]                                                 ; $287e
	and  l                                                          ; $2880
	jr   nz, :-                                                     ; $2881

	ret                                                             ; $2883


; Triggered on line $1f
LCDCInterruptFunc_PictureBook1::
; Save scroll X to set later
	ld   a, [wScrollingText_SCX]                                    ; $2884
	ld   h, a                                                       ; $2887
	call WaitUntilVramJustSafe_trashL                               ; $2888

; Preserve current scroll X, and set new one
	ldh  a, [rSCX]                                                  ; $288b
	ld   l, a                                                       ; $288d
	ld   a, h                                                       ; $288e
	ldh  [rSCX], a                                                  ; $288f
	ld   a, l                                                       ; $2891
	ld   [wNonScrollingText_PreservedSCX], a                        ; $2892

; Trigger next lcdc interrupt func at line $2f
	ld   a, $2f                                                     ; $2895
	ldh  [rLYC], a                                                  ; $2897

; Replace lcdc interrupt func with new one
	ld   a, [wLCDCInterruptFunc]                                    ; $2899
	ld   l, a                                                       ; $289c
	ld   a, [wLCDCInterruptFunc+1]                                  ; $289d
	ld   h, a                                                       ; $28a0

	ld   a, LOW(LCDCInterruptFunc_PictureBook2)                     ; $28a1
	ld   [wLCDCInterruptFunc], a                                    ; $28a3
	ld   a, HIGH(LCDCInterruptFunc_PictureBook2)                    ; $28a6
	ld   [wLCDCInterruptFunc+1], a                                  ; $28a8
	ret                                                             ; $28ab


; Triggered on line $2f
LCDCInterruptFunc_PictureBook2:
; Update SCX with the preserved scroll before the scrolling text
	ld   a, [wNonScrollingText_PreservedSCX]                        ; $28ac
	ld   h, a                                                       ; $28af
	call WaitUntilVramJustSafe_trashL                               ; $28b0
	ld   a, h                                                       ; $28b3
	ldh  [rSCX], a                                                  ; $28b4

; Trigger next lcdc interrupt func at line $37
	ld   a, $37                                                     ; $28b6
	ldh  [rLYC], a                                                  ; $28b8

; Replace lcdc interrupt func with new one
	ld   a, [wLCDCInterruptFunc]                                    ; $28ba
	ld   l, a                                                       ; $28bd
	ld   a, [wLCDCInterruptFunc+1]                                  ; $28be
	ld   h, a                                                       ; $28c1

	ld   a, LOW(LCDCInterruptFunc_PictureBook3)                     ; $28c2
	ld   [wLCDCInterruptFunc], a                                    ; $28c4
	ld   a, HIGH(LCDCInterruptFunc_PictureBook3)                    ; $28c7
	ld   [wLCDCInterruptFunc+1], a                                  ; $28c9
	ret                                                             ; $28cc


; Triggered on line $37
LCDCInterruptFunc_PictureBook3:
; Save scroll of right table
	ld   a, [wPictureBookSCXForRightTable]                          ; $28cd
	ld   h, a                                                       ; $28d0
	call WaitUntilVramJustSafe_trashL                               ; $28d1
	ld   a, h                                                       ; $28d4

; A - SCX
SetSCXClearLCDCSetup:
; Set scroll. We're done with lcdc, so just have vblank
	ldh  [rSCX], a                                                  ; $28d5
	xor  a                                                          ; $28d7
	ldh  [rIF], a                                                   ; $28d8
	ld   a, IEF_VBLANK                                              ; $28da
	ldh  [rIE], a                                                   ; $28dc
	ld   a, $00                                                     ; $28de
	ldh  [rSTAT], a                                                 ; $28e0

; Replace lcdc interrupt func with a stubbed one (replaced in main state)
	ld   a, [wLCDCInterruptFunc]                                    ; $28e2
	ld   l, a                                                       ; $28e5
	ld   a, [wLCDCInterruptFunc+1]                                  ; $28e6
	ld   h, a                                                       ; $28e9

	ld   a, LOW(StubInterruptFunc)                                  ; $28ea
	ld   [wLCDCInterruptFunc], a                                    ; $28ec
	ld   a, HIGH(StubInterruptFunc)                                 ; $28ef
	ld   [wLCDCInterruptFunc+1], a                                  ; $28f1
	ret                                                             ; $28f4


; A - vram bank
; B - low rom bank
; C - hdma5 (num bytes/$10-1)
; DE - dest
; HL - source
GenericHDMATransfer::
	ldh  [rVBK], a                                                  ; $28f5

; Preserve and set new rom bank
	ld   a, [wRomBank]                                              ; $28f7
	push af                                                         ; $28fa
	ld   a, b                                                       ; $28fb
	call SetRomBank1stHalfOfRom                                     ; $28fc

	ld   a, d                                                       ; $28ff
	ldh  [rHDMA3], a                                                ; $2900
	ld   a, e                                                       ; $2902
	ldh  [rHDMA4], a                                                ; $2903
	ld   a, h                                                       ; $2905
	ldh  [rHDMA1], a                                                ; $2906
	ld   a, l                                                       ; $2908
	ldh  [rHDMA2], a                                                ; $2909
	ld   a, c                                                       ; $290b
	ldh  [rHDMA5], a                                                ; $290c

	pop  af                                                         ; $290e
	call SetRomBank1stHalfOfRom                                     ; $290f
	ret                                                             ; $2912


CheckIfVBlankInterruptIsStubbed::
	ld   a, [wVBlankInterruptFunc]                                  ; $2913
	cp   LOW(StubInterruptFunc)                                     ; $2916
	jr   nz, .done                                                  ; $2918

	ld   a, [wVBlankInterruptFunc+1]                                ; $291a
	cp   HIGH(StubInterruptFunc)                                    ; $291d

.done:
	ret                                                             ; $291f


VBlankInterrupt_HDMATransferPictureBookLogoSprTileData::
	JumpFromBank0 HDMATransferPictureBookLogoSprTileData


VBlankInterrupt_HDMATransferPictureBookLogoBGTileData::
	JumpFromBank0 HDMATransferPictureBookLogoBGTileData


ResetVBlankQueueData::
; Set vblank queue pointer to its top-most designated area in wram
	ld   hl, wPointerToVBlankQueue                                  ; $2930
	ld   a, LOW(wVBlankQueueTop)                                    ; $2933
	ld   [hl+], a                                                   ; $2935
	ld   [hl], HIGH(wVBlankQueueTop)                                ; $2936

; Store the top-most, or last vblank func, to run
	ld   hl, wVBlankQueueTop                                        ; $2938
	ld   a, LOW(VBlankQueueFuncLast)                                ; $293b
	ld   [hl+], a                                                   ; $293d
	ld   [hl], HIGH(VBlankQueueFuncLast)                            ; $293e

; Clear vblank queue func, so we can preserve the curr vblank int func
	xor  a                                                          ; $2940
	ld   hl, wPreservedVBlankFuncForVBlankQueueFunc                 ; $2941
	ld   [hl+], a                                                   ; $2944
	ld   [hl], a                                                    ; $2945
	ret                                                             ; $2946


; B - num addresses to process
; HL - points to addresses, in order of params, then func, etc
PushStackParamsIntoVBlankQueue::
; DE points to addresses
	ld   e, l                                                       ; $2947
	ld   d, h                                                       ; $2948

; Store pointer to caller's address
	ld   hl, sp+$00                                                 ; $2949
	ld   a, l                                                       ; $294b
	ld   [wVBlankQueue_PointerToCallersAddr], a                     ; $294c
	ld   a, h                                                       ; $294f
	ld   [wVBlankQueue_PointerToCallersAddr+1], a                   ; $2950

; HL and SP = next vblank queue address
	ld   hl, wPointerToVBlankQueue                                  ; $2953
	ld   a, [hl+]                                                   ; $2956
	ld   h, [hl]                                                    ; $2957
	ld   l, a                                                       ; $2958
	ld   sp, hl                                                     ; $2959

; Jump if there are addresses to process
	ld   a, b                                                       ; $295a
	or   b                                                          ; $295b
	jr   nz, :+                                                     ; $295c

; Push the pointer to the bottom-most address
	push de                                                         ; $295e
	jr   .afterPushingAddrToProcess                                 ; $295f

:	ld   l, e                                                       ; $2961
	ld   h, d                                                       ; $2962

.loop:
; Get address in stack params, and push into vblank queue
; (so vblank queue has the pushed addresses in reverse order)
	ld   a, [hl+]                                                   ; $2963
	ld   e, a                                                       ; $2964
	ld   a, [hl+]                                                   ; $2965
	ld   d, a                                                       ; $2966
	push de                                                         ; $2967
	dec  b                                                          ; $2968
	jr   nz, .loop                                                  ; $2969

.afterPushingAddrToProcess:
; Store pointer to bottom of vblank queue, if later adding more funcs
	ld   hl, sp+$00                                                 ; $296b
	ld   a, l                                                       ; $296d
	ld   [wPointerToVBlankQueue], a                                 ; $296e
	ld   a, h                                                       ; $2971
	ld   [wPointerToVBlankQueue+1], a                               ; $2972

; If vblank queue func already set, don't preserve curr and set the queue func
	ld   hl, wPreservedVBlankFuncForVBlankQueueFunc                 ; $2975
	ld   a, [hl+]                                                   ; $2978
	or   [hl]                                                       ; $2979
	jr   nz, .afterSettingVBlankQueueFunc                           ; $297a

; Preserve curr vblank func, then process vblank queue funcs
	ld   hl, wVBlankInterruptFunc                                   ; $297c
	ld   a, [hl]                                                    ; $297f
	ld   [wPreservedVBlankFuncForVBlankQueueFunc], a                ; $2980
	ld   a, LOW(VBlankIntQueueFunc)                                 ; $2983
	ld   [hl+], a                                                   ; $2985
	ld   a, [hl]                                                    ; $2986
	ld   [wPreservedVBlankFuncForVBlankQueueFunc+1], a              ; $2987
	ld   [hl], HIGH(VBlankIntQueueFunc)                             ; $298a

.afterSettingVBlankQueueFunc:
; HL and SP to point to caller's address, return to it
	ld   hl, wVBlankQueue_PointerToCallersAddr                      ; $298c
	ld   a, [hl+]                                                   ; $298f
	ld   h, [hl]                                                    ; $2990
	ld   l, a                                                       ; $2991
	ld   sp, hl                                                     ; $2992
	ret                                                             ; $2993


VBlankIntQueueFunc:
; Store pointer to caller's address
	ld   hl, sp+$00                                                 ; $2994
	ld   a, l                                                       ; $2996
	ldh  [hVBlankIntQueueFuncCallersAddress], a                     ; $2997
	ld   a, h                                                       ; $2999
	ldh  [hVBlankIntQueueFuncCallersAddress+1], a                   ; $299a

; HL = pointer to bottom-most address in vblank queue
; (addr containing a func), then return to it
	ld   hl, wPointerToVBlankQueue                                  ; $299c
	ld   a, [hl+]                                                   ; $299f
	ld   h, [hl]                                                    ; $29a0
	ld   l, a                                                       ; $29a1
	ld   sp, hl                                                     ; $29a2
	ret                                                             ; $29a3


; Calls preserved vblank interrupt func after
VBlankQueueFuncLast:
; HL and SP = pointer to queue func caller's address
	ld   hl, hVBlankIntQueueFuncCallersAddress                      ; $29a4
	ld   a, [hl+]                                                   ; $29a7
	ld   h, [hl]                                                    ; $29a8
	ld   l, a                                                       ; $29a9
	ld   sp, hl                                                     ; $29aa

; Restore previous vblank interrupt func
	ld   hl, wPreservedVBlankFuncForVBlankQueueFunc                 ; $29ab
	ld   a, [hl+]                                                   ; $29ae
	ld   c, a                                                       ; $29af
	ld   [wVBlankInterruptFunc], a                                  ; $29b0
	ld   a, [hl]                                                    ; $29b3
	ld   [wVBlankInterruptFunc+1], a                                ; $29b4

; Put prev vblank interrupt func (or stub if none) in HL,
; Push to return to it after resetting vblank queue data
	ld   h, a                                                       ; $29b7
	ld   l, c                                                       ; $29b8
	or   l                                                          ; $29b9
	jr   nz, :+                                                     ; $29ba

	ld   hl, StubInterruptFunc                                      ; $29bc

:	push hl                                                         ; $29bf
	jp   ResetVBlankQueueData                                       ; $29c0


; SP/SP+1 - rom bank
VBlankQueueFunc_SetRomBank::
	pop  af                                                         ; $29c3
	call SetRomBank1stHalfOfRom                                     ; $29c4
	ret                                                             ; $29c7


; SP/SP+1 - vram bank
VBlankQueueFunc_SetVramBank::
	pop  af                                                         ; $29c8
	ldh  [rVBK], a                                                  ; $29c9
	ret                                                             ; $29cb


; unused - $29cc
	pop  hl                                                         ; $29cc
	pop  de                                                         ; $29cd
	ret                                                             ; $29ce


; unused - $29cf
	pop  bc                                                         ; $29cf
	ret                                                             ; $29d0


; A - vram bank to set
VBlankEnqueue_SetVramBank::
	ld   hl, .vbk0                                                  ; $29d1
	or   a                                                          ; $29d4
	jr   z, :+                                                      ; $29d5
	ld   hl, .vbk1                                                  ; $29d7
:	ld   b, $02                                                     ; $29da
	jp   PushStackParamsIntoVBlankQueue                             ; $29dc

.vbk0:
	db $00, $00
	dw VBlankQueueFunc_SetVramBank

.vbk1:
	db $01, $01
	dw VBlankQueueFunc_SetVramBank


; A - bank
; B - rows
; C - cols
; DE - screen dest start
; HL - source addr
VBlankEnqueue_CopyTileMapOrAttr::
	push af                                                         ; $29e7
	push de                                                         ; $29e8
	push hl                                                         ; $29e9
	push af                                                         ; $29ea

; Store address after calling function
	ld   hl, sp+$08                                                 ; $29eb
	ld   a, l                                                       ; $29ed
	ld   [wVBlankQueue_PointerToCallersAddr], a                     ; $29ee
	ld   a, h                                                       ; $29f1
	ld   [wVBlankQueue_PointerToCallersAddr+1], a                   ; $29f2

; HL points at 1st pushed AF location
	dec  hl                                                         ; $29f5
	dec  hl                                                         ; $29f6

; It will return us to .vblankFunc
	ld   a, LOW(.vblankFunc)                                        ; $29f7
	ld   [hl+], a                                                   ; $29f9
	ld   [hl], HIGH(.vblankFunc)                                    ; $29fa

; C = GB_TILE_WIDTH-tile map width
	ld   a, GB_TILE_WIDTH                                           ; $29fc
	sub  c                                                          ; $29fe
	ld   c, a                                                       ; $29ff

; HL = above * 3 (num decrements in memCopies) idxed into memCopies code
; ie skip mem copying for cols we're not doing
	add  a                                                          ; $2a00
	add  c                                                          ; $2a01
	add  LOW(.memCopies)                                            ; $2a02
	ld   l, a                                                       ; $2a04
	ld   a, HIGH(.memCopies)                                        ; $2a05
	adc  $00                                                        ; $2a07
	ld   h, a                                                       ; $2a09

; Loop height
	ld   c, GB_TILE_HEIGHT                                          ; $2a0a

.loop:
; Push mem copy address in loop below
	push hl                                                         ; $2a0c

; Dest address += C, height times
	ld   a, e                                                       ; $2a0d
	add  c                                                          ; $2a0e
	ld   e, a                                                       ; $2a0f
	ld   a, d                                                       ; $2a10
	adc  $00                                                        ; $2a11
	ld   d, a                                                       ; $2a13

; Push that dest address (from row 1)
	push de                                                         ; $2a14
	dec  b                                                          ; $2a15
	jr   nz, .loop                                                  ; $2a16

; HL = pointer to bottom-most of the above mem copies
	ld   hl, sp+$00                                                 ; $2a18

; Get pointer to address after calling func and push it
	ld   a, [wVBlankQueue_PointerToCallersAddr+1]                   ; $2a1a
	ld   b, a                                                       ; $2a1d
	ld   a, [wVBlankQueue_PointerToCallersAddr]                     ; $2a1e
	ld   c, a                                                       ; $2a21
	push bc                                                         ; $2a22

; HL = BC - HL, ie num bytes pushed in this func
	ld   a, c                                                       ; $2a23
	sub  l                                                          ; $2a24
	ld   l, a                                                       ; $2a25
	ld   a, b                                                       ; $2a26
	sbc  h                                                          ; $2a27
	ld   h, a                                                       ; $2a28

; B and L = HL / 2 (num addresses pushed in this func)
	srl  h                                                          ; $2a29
	rr   l                                                          ; $2a2b
	ld   b, l                                                       ; $2a2d

; HL points to after address containing pointer to address after calling func
	ld   hl, sp+$02                                                 ; $2a2e

; Params to reverse are:
; Multiple of (row dest->mem copy func)
; Then bank->starting src->starting dest->.vblankFunc
	call PushStackParamsIntoVBlankQueue                             ; $2a30

; Pop to pointer to address of calling func and return to it
	pop  hl                                                         ; $2a33
	ld   sp, hl                                                     ; $2a34
	ret                                                             ; $2a35

.vblankFunc:
; Pop starting dest, starting src, then bank
	pop  de                                                         ; $2a36
	pop  hl                                                         ; $2a37
	pop  af                                                         ; $2a38
	call SetRomBank1stHalfOfRom                                     ; $2a39

; ret to mem copy func for row
	ret                                                             ; $2a3c

.memCopies:
; Offset into here to decide number of row bytes to copy
rept 31
	ld   a, [hl+]                                                   ; $2a3d
	ld   [de], a                                                    ; $2a3e
	inc  e                                                          ; $2a3f
endr
	ld   a, [hl+]                                                   ; $2a9a
	ld   [de], a                                                    ; $2a9b

; Pop next row dest and ret to mem copy func, or 'last' queue func
	pop  de                                                         ; $2a9c
	ret                                                             ; $2a9d


VBlankInterruptFunc_PrintTrainImage::
; Set attribute of number tiles top halves to 5 (unselected)
	ld   a, $01                                                     ; $2a9e
	ldh  [rVBK], a                                                  ; $2aa0

	ld   hl, _SCRN0+$1e6                                            ; $2aa2
	ld   a, $05                                                     ; $2aa5
	ld   [hl+], a                                                   ; $2aa7
	inc  hl                                                         ; $2aa8
	ld   [hl+], a                                                   ; $2aa9
	inc  hl                                                         ; $2aaa
	ld   [hl+], a                                                   ; $2aab
	inc  hl                                                         ; $2aac
	ld   [hl+], a                                                   ; $2aad
	inc  hl                                                         ; $2aae
	ld   [hl], a                                                    ; $2aaf

; Same with bottom half
	ld   hl, _SCRN0+$206                                            ; $2ab0
	ld   [hl+], a                                                   ; $2ab3
	inc  hl                                                         ; $2ab4
	ld   [hl+], a                                                   ; $2ab5
	inc  hl                                                         ; $2ab6
	ld   [hl+], a                                                   ; $2ab7
	inc  hl                                                         ; $2ab8
	ld   [hl+], a                                                   ; $2ab9
	inc  hl                                                         ; $2aba
	ld   [hl], a                                                    ; $2abb

; HL = 2 * thinness offset into numbers area
	ld   hl, _SCRN0+$1e6                                            ; $2abc
	ld   a, [wPrintTrainImageThinness]                              ; $2abf
	add  a                                                          ; $2ac2
	ld   c, a                                                       ; $2ac3
	ld   b, $00                                                     ; $2ac4
	add  hl, bc                                                     ; $2ac6

; Set attribute 4 to top and bottom half (selected)
	ld   a, $04                                                     ; $2ac7
	ld   [hl], a                                                    ; $2ac9
	ld   hl, _SCRN0+$206                                            ; $2aca
	add  hl, bc                                                     ; $2acd
	ld   a, $04                                                     ; $2ace
	ld   [hl], a                                                    ; $2ad0

; Update text box
	call UpdatePrintTrainImageTextBox                               ; $2ad1
	ret                                                             ; $2ad4


VBlankInterrupt_PrintStart:
; During every vblank, send status packet after print, and update text box
	call TransferStatusPacketWhenPrintDone_IfSerialIntEnabled       ; $2ad5
	call UpdatePrintTrainImageTextBox                               ; $2ad8
	ret                                                             ; $2adb


UpdatePrintTrainImageTextBox:
; Initial display already shows text 1
	ld   a, [wPrintTrainImageTextIdx]                               ; $2adc
	or   a                                                          ; $2adf
	ret  z                                                          ; $2ae0

; HL is double index into table
	ld   hl, .sources                                               ; $2ae1
	add  a                                                          ; $2ae4
	ld   c, a                                                       ; $2ae5
	ld   b, $00                                                     ; $2ae6
	add  hl, bc                                                     ; $2ae8

; HL is address it pointed to
	ld   a, [hl+]                                                   ; $2ae9
	ld   h, [hl]                                                    ; $2aea
	ld   l, a                                                       ; $2aeb

; Copy tile map
	ld   a, $00                                                     ; $2aec
	ldh  [rVBK], a                                                  ; $2aee
	ld   de, _SCRN0+$42                                             ; $2af0
	ldbc $06, $10                                                   ; $2af3
	ld   a, BANK(TileMapAndAttr_Text1)                              ; $2af6
	call FarRectCopy                                                ; $2af8

; Copy tile attr in source after map
	ld   a, $01                                                     ; $2afb
	ldh  [rVBK], a                                                  ; $2afd
	ld   de, _SCRN0+$42                                             ; $2aff
	ldbc $06, $10                                                   ; $2b02
	ld   a, BANK(TileMapAndAttr_Text1)                              ; $2b05
	call FarRectCopy                                                ; $2b07
	ret                                                             ; $2b0a

.sources:
	dw TileMapAndAttr_Text1 ; unused duplicate of below
	dw TileMapAndAttr_Text1
	dw TileMapAndAttr_Text2
	dw TileMapAndAttr_Text3
	dw TileMapAndAttr_Text4
	dw TileMapAndAttr_Text5
	dw TileMapAndAttr_Text6
	dw TileMapAndAttr_Text7


ResetPrintingState::
	ld   a, $00                                                     ; $2b1b
	ld   [wImagePrintingFlowStateIdx], a                            ; $2b1d
	ld   a, PRINT_SS_TRANSITIONING                                  ; $2b20
	ld   [wPrintGameStateSubState], a                               ; $2b22
	ld   a, PRINT_SS_PREP                                           ; $2b25
	ld   [wNextPrintGameStateSubState], a                           ; $2b27
	xor  a                                                          ; $2b2a
	ld   [wSerialIntHandlerEnabled], a                              ; $2b2b
	ret                                                             ; $2b2e


ClearHWandRamPrinterVarsAndState_EnableSerialHandler:
	call ClearAllPrinterRelatedVarsAndHWRegs                        ; $2b2f
	call ResetPrintingState                                         ; $2b32
	ld   a, $01                                                     ; $2b35
	ld   a, [wSerialIntHandlerEnabled]                              ; $2b37
	ret                                                             ; $2b3a


SerialTransferInterruptHandler:
; Simply process handler only if enabled
	push af                                                         ; $2b3b
	push bc                                                         ; $2b3c
	push de                                                         ; $2b3d
	push hl                                                         ; $2b3e
	ld   a, [wSerialIntHandlerEnabled]                              ; $2b3f
	and  a                                                          ; $2b42
	jr   z, .done                                                   ; $2b43

	call HandleSerialIntIfEnabled                                   ; $2b45

.done:
	pop  hl                                                         ; $2b48
	pop  de                                                         ; $2b49
	pop  bc                                                         ; $2b4a
	pop  af                                                         ; $2b4b
	reti                                                            ; $2b4c


TransferStatusPacketWhenPrintDone_IfSerialIntEnabled:
; Proceed if serial int handler enabled
	ld   a, [wSerialIntHandlerEnabled]                              ; $2b4d
	and  a                                                          ; $2b50
	jr   z, .done                                                   ; $2b51

; Transfer status packet if applicable
	call TransferStatusPacketWhenPrintDone                          ; $2b53

.done:
	ret                                                             ; $2b56


LoadPrinterTileDataFragmentIntoRam::
; Preserve rom bank
	ld   a, [wRomBank]                                              ; $2b57
	push af                                                         ; $2b5a
	ld   a, $00                                                     ; $2b5b
	ld   [rROMB0], a                                                ; $2b5d

; HL = 2 * fragment idx idxed into table
	ld   l, LOW(PrinterTileDataFragmentOffsets)                     ; $2b60
	ld   a, [wPrinterCurrTileDataFragmentIdxToLoad]                 ; $2b62
	add  a                                                          ; $2b65
	add  l                                                          ; $2b66
	ld   l, a                                                       ; $2b67
	ld   a, HIGH(PrinterTileDataFragmentOffsets)                    ; $2b68
	adc  $00                                                        ; $2b6a
	ld   h, a                                                       ; $2b6c

; Set bank
	ld   a, [wPrinterTileDataSourceBank]                            ; $2b6d
	ld   [rROMB0], a                                                ; $2b70

; DE = source address
	ld   a, [wPrinterTileDataSourceAddr]                            ; $2b73
	ld   e, a                                                       ; $2b76
	ld   a, [wPrinterTileDataSourceAddr+1]                          ; $2b77
	ld   d, a                                                       ; $2b7a

; Get fragment offset + source address into HL
	ld   a, [hl+]                                                   ; $2b7b
	add  e                                                          ; $2b7c
	ld   e, a                                                       ; $2b7d
	ld   a, [hl]                                                    ; $2b7e
	adc  $00                                                        ; $2b7f
	add  d                                                          ; $2b81
	ld   h, a                                                       ; $2b82
	ld   l, e                                                       ; $2b83

; Copy fragment into ram
	ld   de, wPrinterTileDataFragmentToSend                         ; $2b84
	ld   bc, wPrinterTileDataFragmentToSend.end-wPrinterTileDataFragmentToSend ; $2b87
	call SerialRelatedMemCopy                                       ; $2b8a

; Return the address containing tile data
	ld   hl, wPrinterTileDataFragmentToSend                         ; $2b8d
	pop  af                                                         ; $2b90
	ld   [rROMB0], a                                                ; $2b91
	ret                                                             ; $2b94


JumpTablePreserveDE_def:
	sla  a                                                          ; $2b95
	pop  hl                                                         ; $2b97
	push de                                                         ; $2b98
	ld   e, a                                                       ; $2b99
	ld   d, $00                                                     ; $2b9a
	add  hl, de                                                     ; $2b9c
	ld   e, [hl]                                                    ; $2b9d
	inc  hl                                                         ; $2b9e
	ld   d, [hl]                                                    ; $2b9f
	ld   l, e                                                       ; $2ba0
	ld   h, d                                                       ; $2ba1
	pop  de                                                         ; $2ba2
	jp   hl                                                         ; $2ba3


; BC - num bytes
; DE - dest addr
; HL - source addr
SerialRelatedMemCopy:
:	ld   a, [hl+]                                                   ; $2ba4
	ld   [de], a                                                    ; $2ba5
	inc  de                                                         ; $2ba6
	dec  bc                                                         ; $2ba7
	ld   a, c                                                       ; $2ba8
	or   b                                                          ; $2ba9
	jr   nz, :-                                                     ; $2baa

	ret                                                             ; $2bac


HandleSerialIntIfEnabledAndTransferReceived:
; Ret if we received a printer error
	ld   a, [wPrinterErrorByteReceived]                             ; $2bad
	and  a                                                          ; $2bb0
	jp   nz, PacketEnding0sJustSentOver.done                        ; $2bb1

; Jump if we've fully sent a packet without error
	ld   a, [wImagePrintingFlowStateIdx]                            ; $2bb4
	cp   $07                                                        ; $2bb7
	jp   z, PacketEnding0sJustSentOver                              ; $2bb9

; If both magic bytes not yet sent, send them 1st
	ld   a, [wPrinterMagicBytesSent]                                ; $2bbc
	and  a                                                          ; $2bbf
	jr   nz, .magicBytesSent                                        ; $2bc0

	call Transfer1of2PrinterMagicBytes                              ; $2bc2
	ret                                                             ; $2bc5

.magicBytesSent:
; Send base struct bytes, then data bytes first
	ld   a, [wPrinterPacketFullySentOnce]                           ; $2bc6
	and  a                                                          ; $2bc9
	jr   z, .sendNonSpecialPacketBytes                              ; $2bca

	ld   a, [wPrinterPacketFullySentTwice]                          ; $2bcc
	and  a                                                          ; $2bcf
	jr   z, .sendNonSpecialPacketBytes                              ; $2bd0

; If both checksum bytes not yet sent..
	ld   a, [wPrinterNumChecksumBytesSent]                          ; $2bd2
	cp   $02                                                        ; $2bd5
	jr   z, .sendEnding0s                                           ; $2bd7

; Send the checksum bytes
	call SendPacketChecksum                                         ; $2bd9
	ret                                                             ; $2bdc

.sendEnding0s:
; Else send the 0s after it
	call SendPrinterPacketEnding0s                                  ; $2bdd
	ret                                                             ; $2be0

.sendNonSpecialPacketBytes:
	call SendPrinterPacketStructBytes                               ; $2be1
	ret                                                             ; $2be4


Transfer1of2PrinterMagicBytes:
; BC = offset into transfer packets
	ld   hl, wPrinterPacketOffsetToSendNext                         ; $2be5
	ld   c, [hl]                                                    ; $2be8
	inc  [hl]                                                       ; $2be9
	ld   b, $00                                                     ; $2bea

; Get its byte in A, and put in SB
	ld   hl, PrinterMagicBytes                                      ; $2bec
	add  hl, bc                                                     ; $2bef
	ld   a, [hl]                                                    ; $2bf0
	ldh  [rSB], a                                                   ; $2bf1

; Start transfer
	ld   a, SC_MASTER                                               ; $2bf3
	ldh  [rSC], a                                                   ; $2bf5
	ld   a, SC_REQUEST|SC_MASTER                                    ; $2bf7
	ldh  [rSC], a                                                   ; $2bf9

; Return if now passed magic bytes
	ld   a, [wPrinterPacketOffsetToSendNext]                        ; $2bfb
	cp   $02                                                        ; $2bfe
	ret  nz                                                         ; $2c00

; Reset offset to 1st magic byte
	xor  a                                                          ; $2c01
	ld   [wPrinterPacketOffsetToSendNext], a                        ; $2c02

; Set that we've sent the 2 bytes now
	inc  a                                                          ; $2c05
	ld   [wPrinterMagicBytesSent], a                                ; $2c06
	ret                                                             ; $2c09


SendPrinterPacketStructBytes:
; BC = offset of defined printer packets
	ld   a, [wPrinterPacketOffsetToSendNext]                        ; $2c0a
	ld   c, a                                                       ; $2c0d
	ld   a, [wPrinterPacketOffsetToSendNext+1]                      ; $2c0e
	ld   b, a                                                       ; $2c11

; HL + offset has next packet byte to send
	ld   a, [wPrinterPacketBytesSourceAddr]                         ; $2c12
	ld   l, a                                                       ; $2c15
	ld   a, [wPrinterPacketBytesSourceAddr+1]                       ; $2c16
	ld   h, a                                                       ; $2c19
	add  hl, bc                                                     ; $2c1a

; Load the response, and send a new byte for the packet
	ldh  a, [rSB]                                                   ; $2c1b
	ld   [wPrinterNonStatusResponseSB], a                           ; $2c1d
	ld   a, [hl]                                                    ; $2c20
	ldh  [rSB], a                                                   ; $2c21

; Add A onto checksum
	ld   l, a                                                       ; $2c23
	ld   a, [wPrinterPacketChecksum]                                ; $2c24
	add  l                                                          ; $2c27
	ld   [wPrinterPacketChecksum], a                                ; $2c28
	ld   a, [wPrinterPacketChecksum+1]                              ; $2c2b
	adc  $00                                                        ; $2c2e
	ld   [wPrinterPacketChecksum+1], a                              ; $2c30

; Initiate transfer
	ld   a, SC_MASTER                                               ; $2c33
	ldh  [rSC], a                                                   ; $2c35
	ld   a, SC_REQUEST|SC_MASTER                                    ; $2c37
	ldh  [rSC], a                                                   ; $2c39

; Inc offset, inc high byte if needed
	ld   hl, wPrinterPacketOffsetToSendNext                         ; $2c3b
	inc  [hl]                                                       ; $2c3e
	jr   nz, :+                                                     ; $2c3f

	inc  hl                                                         ; $2c41
	inc  [hl]                                                       ; $2c42

; Check if curr offset is equal to final, and return if not
:	ld   hl, wPrinterPacketOffsetToSendNext                         ; $2c43
	ld   a, [wPrinterFinalOffsetForPacketBytesBeingSent]            ; $2c46
	cp   [hl]                                                       ; $2c49
	jr   nz, .done                                                  ; $2c4a

	inc  hl                                                         ; $2c4c
	ld   a, [wPrinterFinalOffsetForPacketBytesBeingSent+1]          ; $2c4d
	cp   [hl]                                                       ; $2c50
	jr   z, .fullPacketSent                                         ; $2c51

.done:
	ret                                                             ; $2c53

.fullPacketSent:
; Inc num times we sent a full packet (before these vars were reset)
	ld   hl, wPrinterPacketFullySentOnce                            ; $2c54
	ld   a, [hl]                                                    ; $2c57
	and  a                                                          ; $2c58
	jr   z, :+                                                      ; $2c59
	ld   hl, wPrinterPacketFullySentTwice                           ; $2c5b
:	inc  [hl]                                                       ; $2c5e

; Jump if not streaming, or if we're sending actual data
	ld   a, [wPrinterStreamTypePacket]                              ; $2c5f
	and  a                                                          ; $2c62
	jr   z, .notStreamingOrSendingEmptyData                         ; $2c63

	ld   a, [wImagePrintingFlowStateIdx]                            ; $2c65
	cp   $06                                                        ; $2c68
	jr   z, .notStreamingOrSendingEmptyData                         ; $2c6a

; We're sending an empty data packet, restore data len/source addr if sent twice now
	ld   hl, wPrinterPacketFullySentTwice                           ; $2c6c
	ld   a, [hl]                                                    ; $2c6f
	and  a                                                          ; $2c70
	jr   nz, .restorePrevDataLenAndSrc                              ; $2c71

; Clear packet offsets when sending sequentially
	xor  a                                                          ; $2c73
	ld   [wPrinterPacketOffsetToSendNext], a                        ; $2c74
	ld   [wPrinterPacketOffsetToSendNext+1], a                      ; $2c77

; Source addr is the updated one (+$280 at some point)
	ld   a, [wUpdatedPrinterPacketDataSourceAddr]                   ; $2c7a
	ld   [wPrinterPacketBytesSourceAddr], a                         ; $2c7d
	ld   a, [wUpdatedPrinterPacketDataSourceAddr+1]                 ; $2c80
	ld   [wPrinterPacketBytesSourceAddr+1], a                       ; $2c83

; Restore length used
	ld   a, [wUpdatedPrinterPacketDataLength]                       ; $2c86
	ld   [wPrinterFinalOffsetForPacketBytesBeingSent], a            ; $2c89
	ld   a, [wUpdatedPrinterPacketDataLength+1]                     ; $2c8c
	ld   [wPrinterFinalOffsetForPacketBytesBeingSent+1], a          ; $2c8f
	ret                                                             ; $2c92

.restorePrevDataLenAndSrc:
	call RestoreSavedPacketDataLenAndSource                         ; $2c93
	ret                                                             ; $2c96

.notStreamingOrSendingEmptyData:
; Simply copy the response over (to check for printer errors)
	ld   a, [wPrinterNonStatusResponseSB]                           ; $2c97
	ld   [wPrinterStatusResponseSB], a                              ; $2c9a

SetPacketSentOver_DoneProgress1_ClearedDataVars_RestoredDataLenSrc:
	ld   a, $07                                                     ; $2c9d
	ld   [wImagePrintingFlowStateIdx], a                            ; $2c9f
	ld   a, $01                                                     ; $2ca2
	ld   [wPrintPacketTransferProgress], a                          ; $2ca4
	call ClearPrinterDataVars                                       ; $2ca7

RestoreSavedPacketDataLenAndSource:
	ld   a, [wSavedPrinterPacketDataLength]                         ; $2caa
	ld   [wPrinterFinalOffsetForPacketBytesBeingSent], a            ; $2cad
	ld   a, [wSavedPrinterPacketDataLength+1]                       ; $2cb0
	ld   [wPrinterFinalOffsetForPacketBytesBeingSent+1], a          ; $2cb3

	ld   a, [wSavedPrinterPacketSourceAddr]                         ; $2cb6
	ld   [wPrinterPacketBytesSourceAddr], a                         ; $2cb9
	ld   a, [wSavedPrinterPacketSourceAddr+1]                       ; $2cbc
	ld   [wPrinterPacketBytesSourceAddr+1], a                       ; $2cbf
	ret                                                             ; $2cc2


; A - index of checksum byte to send
SendPacketChecksum:
	ld   c, a                                                       ; $2cc3
	ld   b, $00                                                     ; $2cc4
	ld   hl, wPrinterPacketChecksum                                 ; $2cc6
	add  hl, bc                                                     ; $2cc9
	ld   a, [hl]                                                    ; $2cca
	ldh  [rSB], a                                                   ; $2ccb

; Initiate transfer
	ld   a, SC_MASTER                                               ; $2ccd
	ldh  [rSC], a                                                   ; $2ccf
	ld   a, SC_REQUEST|SC_MASTER                                    ; $2cd1
	ldh  [rSC], a                                                   ; $2cd3

; Inc num checksum bytes sent (this func stops after 2 done)
	ld   hl, wPrinterNumChecksumBytesSent                           ; $2cd5
	inc  [hl]                                                       ; $2cd8
	ret                                                             ; $2cd9


SendPrinterPacketEnding0s:
; Load in response, and send a 0
	ldh  a, [rSB]                                                   ; $2cda
	ld   [wPrinterStatusResponseSB], a                              ; $2cdc
	xor  a                                                          ; $2cdf
	ldh  [rSB], a                                                   ; $2ce0

; Initiate transfer
	ld   a, SC_MASTER                                               ; $2ce2
	ldh  [rSC], a                                                   ; $2ce4
	ld   a, SC_REQUEST|SC_MASTER                                    ; $2ce6
	ldh  [rSC], a                                                   ; $2ce8

; Inc number of 0s sent, jumping once both keep alive and status are sent
; To set current post-done state, clearing vars
	ld   hl, wPrinterNumEnding0sSent                                ; $2cea
	inc  [hl]                                                       ; $2ced
	ld   a, [hl]                                                    ; $2cee
	cp   $02                                                        ; $2cef
	jr   z, SetPacketSentOver_DoneProgress1_ClearedDataVars_RestoredDataLenSrc ; $2cf1

	ret                                                             ; $2cf3


PacketEnding0sJustSentOver:
; Set packet struct idx var so other funcs know we just sent 0s over for it
	ld   a, [wPrinterPacketStructTypeIdx]                           ; $2cf4
	ld   [wPacketStructIdxAfter0sSentOver], a                       ; $2cf7

; Set an unused var
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $2cfa
	ld   [wSerialByteFromPrinterAfter0sSentOver], a                 ; $2cfd

; Load response from printer
	ldh  a, [rSB]                                                   ; $2d00
	ld   [wSerialByteReceivedFromPrinter], a                        ; $2d02
	cp   SB_NO_PRINTER                                              ; $2d05
	jr   nz, .printerDetected                                       ; $2d07

; No printer - clear state and post-end progress
	ld   a, $00                                                     ; $2d09
	ld   [wPrinterPacketTransferProcessInProgress], a               ; $2d0b
	ld   [wImagePrintingFlowStateIdx], a                            ; $2d0e
	ld   a, $02                                                     ; $2d11
	jr   .setPostDoneProgress                                       ; $2d13

.printerDetected:
	bit  P_PRINTING, a                                              ; $2d15
	jr   z, :+                                                      ; $2d17

; Set that we're currently printing
	ld   a, $01                                                     ; $2d19
	ld   [wIsCurrentlyPrinting], a                                  ; $2d1b

; If there's a packet error, clear flow state, else set to 1
:	bit  P_PACKET_ERROR, a                                          ; $2d1e
	ld   a, $00                                                     ; $2d20
	ld   [wImagePrintingFlowStateIdx], a                            ; $2d22
	ld   a, $01                                                     ; $2d25
	jr   nz, :+                                                     ; $2d27

; No packet error
	ld   [wImagePrintingFlowStateIdx], a                            ; $2d29

; Set post-done progress to 2 similar to no printer
:	inc  a                                                          ; $2d2c

.setPostDoneProgress:
	ld   [wPrintPacketTransferProgress], a                          ; $2d2d

; If not a streaming type, set that we're done
	ld   a, [wPrinterStreamTypePacket]                              ; $2d30
	and  a                                                          ; $2d33
	jr   nz, .done                                                  ; $2d34

	xor  a                                                          ; $2d36
	ld   [wPrinterPacketTransferProcessInProgress], a               ; $2d37

.done:
	ret                                                             ; $2d3a


HandleSerialIntIfEnabled:
; Return if printer has not sent back a byte
	push af                                                         ; $2d3b
	ldh  a, [rSC]                                                   ; $2d3c
	bit  7, a                                                       ; $2d3e
	jr   nz, .done                                                  ; $2d40

	push bc                                                         ; $2d42
	push de                                                         ; $2d43
	push hl                                                         ; $2d44

; Set that printer has transferred us a packet, then go deeper into int handling
	ld   a, $01                                                     ; $2d45
	ld   [wHandlingInterruptWhenPrinterTransferredUsAPacket], a     ; $2d47
	call HandleSerialIntIfEnabledAndTransferReceived                ; $2d4a

	pop  hl                                                         ; $2d4d
	pop  de                                                         ; $2d4e
	pop  bc                                                         ; $2d4f

.done:
	pop  af                                                         ; $2d50
	ret                                                             ; $2d51


TransferStatusPacketWhenPrintDone:
; Return if transfer didn't finish
	ld   a, [wImagePrintingFlowStateIdx]                            ; $2d52
	cp   $01                                                        ; $2d55
	ret  nz                                                         ; $2d57

; Return if no printer connected
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $2d58
	cp   SB_NO_PRINTER                                              ; $2d5b
	ret  z                                                          ; $2d5d

; Return if packet struct being sent/processed
	ld   a, [wPrinterPacketTransferProcessInProgress]               ; $2d5e
	and  a                                                          ; $2d61
	ret  nz                                                         ; $2d62

; Else inc wait counter, and return if < 6
	ld   hl, wPrinterPrintCommandWaitCounter                        ; $2d63
	inc  [hl]                                                       ; $2d66
	ld   a, [hl]                                                    ; $2d67
	cp   $06                                                        ; $2d68
	ret  c                                                          ; $2d6a

; We're not printing anymore, kickstart status command process
	xor  a                                                          ; $2d6b
	ld   [hl], a                                                    ; $2d6c
	ld   [wIsCurrentlyPrinting], a                                  ; $2d6d
	call StartStatusPacketTransferProcess                           ; $2d70
	ret                                                             ; $2d73


; unused
	xor  a                                                          ; $2d74
	ldh  [rSC], a                                                   ; $2d75
	ldh  [rSB], a                                                   ; $2d77

ClearAllPrinterRelatedVarsAndHWRegs:
	xor  a                                                          ; $2d79
	ldh  [rSB], a                                                   ; $2d7a
	ldh  [rSC], a                                                   ; $2d7c
	ld   [wImagePrintingFlowStateIdx], a                            ; $2d7e
	ld   [wPrinterUnusedVar_ce8e], a                                ; $2d81

; Set as if no printer was connected
	dec  a                                                          ; $2d84
	ld   [wSerialByteReceivedFromPrinter], a                        ; $2d85
	ld   [wPrinterStatusResponseSB], a                              ; $2d88

; Set as if 0 exposure chosen
	ld   a, $80                                                     ; $2d8b
	ld   [wPrinterPrintCommandExposure], a                          ; $2d8d

	call ClearPrinterDataAndStateVars                               ; $2d90
	ret                                                             ; $2d93


ClearPrinterDataAndStateVars:
	xor  a                                                          ; $2d94
	ld   [wPrintPacketTransferProgress], a                          ; $2d95
	ld   [wHandlingInterruptWhenPrinterTransferredUsAPacket], a     ; $2d98
	ld   [wPrinterPacketTransferProcessInProgress], a               ; $2d9b

ClearPrinterDataVars:
	xor  a                                                          ; $2d9e
	ld   [wPrinterMagicBytesSent], a                                ; $2d9f
	ld   [wPrinterPacketFullySentOnce], a                           ; $2da2
	ld   [wPrinterPacketFullySentTwice], a                          ; $2da5
	ld   [wPrinterNumChecksumBytesSent], a                          ; $2da8
	ld   [wPrinterNumEnding0sSent], a                               ; $2dab
	ld   [wPrinterPacketChecksum], a                                ; $2dae
	ld   [wPrinterPacketChecksum+1], a                              ; $2db1
	ld   [wPrinterPacketOffsetToSendNext], a                        ; $2db4
	ld   [wPrinterPacketOffsetToSendNext+1], a                      ; $2db7
	ld   [wPrinterErrorByteReceived], a                             ; $2dba
	ld   [wIsCurrentlyPrinting], a                                  ; $2dbd
	ret                                                             ; $2dc0


StartInitPacketTransferProcess::
; Jump if transfer process not yet started
	ld   a, [wPrinterPacketTransferProcessInProgress]               ; $2dc1
	and  a                                                          ; $2dc4
	jr   z, .cont                                                   ; $2dc5

; Continue also if we need to re-send
	call ReturnCarryIfNeedToReSend                                  ; $2dc7
	ret  nc                                                         ; $2dca

.cont:
; Jump if 0s not yet sent over
	ld   a, [wPacketStructIdxAfter0sSentOver]                       ; $2dcb
	cp   $01                                                        ; $2dce
	jr   nz, .startProcess                                          ; $2dd0

; Continue also if we need to re-send
	call ReturnCarryIfNeedToReSend                                  ; $2dd2
	ret  nc                                                         ; $2dd5

.startProcess:
	call UpdatePrinterPacketStructWithInitCommand                   ; $2dd6
	jp   StartPacketTransferProcess                                 ; $2dd9


ReturnCarryIfNeedToReSend:
; Continue if 0s sent over
	ld   a, [wPrintPacketTransferProgress]                          ; $2ddc
	cp   $02                                                        ; $2ddf
	jr   c, .retInProgress                                          ; $2de1

; Don't progress until next call
	call IncPacketTransferDoneProgress                              ; $2de3
	jr   nz, .retInProgress                                         ; $2de6

; Clear vars, and state that the transfer finished without actual errors
	xor  a                                                          ; $2de8
	ld   [wPrinterPrintCommandWaitCounter], a                       ; $2de9
	ld   [wPacketStructIdxAfter0sSentOver], a                       ; $2dec
	inc  a                                                          ; $2def
	ld   [wImagePrintingFlowStateIdx], a                            ; $2df0

; Jump if no printer connected
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $2df3
	cp   SB_NO_PRINTER                                              ; $2df6
	jr   z, .noPrinter                                              ; $2df8

; A checksum error, or print still in-progress, is indication to re-send
	bit  P_CHECKSUM_ERROR, a                                        ; $2dfa
	jr   nz, .setCarry                                              ; $2dfc

	bit  P_PRINTING, a                                              ; $2dfe
	jr   nz, .setCarry                                              ; $2e00

; If in-progress byte received, don't re-send
	and  PRINT_MARKER_IN_PROGRESS                                   ; $2e02
	jr   z, .clearCarry                                             ; $2e04

; Any other result, set print error, and don't re-send
	xor  a                                                          ; $2e06
	ld   [wImagePrintingFlowStateIdx], a                            ; $2e07
	ld   [wPacketStructIdxAfter0sSentOver], a                       ; $2e0a
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $2e0d
	call SetNintendoPrintError                                      ; $2e10
	jr   .clearCarry                                                ; $2e13

.setCarry:
	scf                                                             ; $2e15
	ret                                                             ; $2e16

; unused
	xor  a                                                          ; $2e17
	ld   [wPacketStructIdxAfter0sSentOver], a                       ; $2e18
	dec  a                                                          ; $2e1b

.noPrinter:
; Set to 0 (transfer done)
	inc  a                                                          ; $2e1c
	ld   [wImagePrintingFlowStateIdx], a                            ; $2e1d
	dec  a                                                          ; $2e20
	call SetNintendoPrintError                                      ; $2e21

.clearCarry:
	and  a                                                          ; $2e24
	ret                                                             ; $2e25

.retInProgress:
	xor  a                                                          ; $2e26
	ld   a, PRINT_MARKER_IN_PROGRESS                                ; $2e27
	ret                                                             ; $2e29


IncPacketTransferDoneProgress:
; Loop up to a max of 3
	ld   hl, wPrintPacketTransferProgress                           ; $2e2a
	ld   a, [hl]                                                    ; $2e2d
	cp   $03                                                        ; $2e2e
	ret  z                                                          ; $2e30

	inc  a                                                          ; $2e31
	ld   [hl], a                                                    ; $2e32
	ret                                                             ; $2e33


StartPrintPacketTransferProcess::
; Jump if transfer finished or print state in progress
	ld   a, [wImagePrintingFlowStateIdx]                            ; $2e34
	cp   $01                                                        ; $2e37
	jr   z, .initOrPrint                                            ; $2e39

	cp   $02                                                        ; $2e3b
	jr   z, .initOrPrint                                            ; $2e3d

; If state == 0 (reset/error), return with $ff, else return with in progress
	and  a                                                          ; $2e3f
	ld   a, PRINT_MARKER_ERRORED                                    ; $2e40
	ret  z                                                          ; $2e42

.inProgress:
	ld   a, PRINT_MARKER_IN_PROGRESS                                ; $2e43
	ret                                                             ; $2e45

.initOrPrint:
; If we're currently printing, return with in progress
	ld   a, [wIsCurrentlyPrinting]                                  ; $2e46
	and  a                                                          ; $2e49
	jr   nz, .inProgress                                            ; $2e4a

; Jump if we haven't set started the process
	ld   a, [wPrinterPacketTransferProcessInProgress]               ; $2e4c
	and  a                                                          ; $2e4f
	jr   z, .setFlowFromPacketStruct                                ; $2e50

; Continue if we need to re-send
	call ReturnCarryIfNeedToReSend                                  ; $2e52
	ret  nc                                                         ; $2e55

.setFlowFromPacketStruct:
; Jump if 0s not yet sent
	ld   a, [wPacketStructIdxAfter0sSentOver]                       ; $2e56
	cp   $02                                                        ; $2e59
	jr   nz, .doPrintCommandNext                                    ; $2e5b

; Continue if we need to re-send
	call ReturnCarryIfNeedToReSend                                  ; $2e5d
	ret  nc                                                         ; $2e60

.doPrintCommandNext:
; Set error if printer not connected, otherwise start process
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $2e61
	cp   SB_NO_PRINTER                                              ; $2e64
	jp   z, SetNintendoPrintError                                   ; $2e66

	call UpdatePrinterPacketStructWithPrintCommand                  ; $2e69
	jp   StartPacketTransferProcess                                 ; $2e6c


; A - 1 (num things to send)
; HL = updated source addr
StartDataFragmentPacketTransferProcess::
; Set C to 1
	ld   c, a                                                       ; $2e6f

; If state == 0, there's an error
	ld   a, [wImagePrintingFlowStateIdx]                            ; $2e70
	and  a                                                          ; $2e73
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $2e74
	jp   z, SetNintendoPrintError                                   ; $2e77

; Else continue if packet transfer finished, or empty data in progress
	ld   a, [wImagePrintingFlowStateIdx]                            ; $2e7a
	cp   $01                                                        ; $2e7d
	jr   z, .cont                                                   ; $2e7f

	cp   $03                                                        ; $2e81
	jr   z, .cont                                                   ; $2e83

	ld   a, PRINT_MARKER_IN_PROGRESS                                ; $2e85
	ret                                                             ; $2e87

.cont:
	ld   a, [wPrinterPacketTransferProcessInProgress]               ; $2e88
	and  a                                                          ; $2e8b
	jr   nz, .transferInProgress                                    ; $2e8c

; Transfer not yet started, set table idx to orig A + 1
	ld   a, c                                                       ; $2e8e
	inc  a                                                          ; $2e8f
	ld   [wPrinterUnusedTablesIdx], a                               ; $2e90

; Store address of tile data fragment (unused)
	ld   a, l                                                       ; $2e93
	ld   [wUnusedTileDataFragmentAddr], a                           ; $2e94
	ld   a, h                                                       ; $2e97
	ld   [wUnusedTileDataFragmentAddr+1], a                         ; $2e98

; Jump if no printer connected
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $2e9b
	cp   SB_NO_PRINTER                                              ; $2e9e
	jp   z, SetNintendoPrintError                                   ; $2ea0

; This is set to 0 (no compression ever applied)
	ld   a, [wGlobalPrinterDataCompressionApplied]                  ; $2ea3
	ld   [wPrinterDataCompressionApplied], a                        ; $2ea6
	and  a                                                          ; $2ea9
	jr   z, .noCompression                                          ; $2eaa

; Compressed required here, idx = orig A - 1
	ld   a, [wPrinterUnusedTablesIdx]                               ; $2eac
	dec  a                                                          ; $2eaf
	dec  a                                                          ; $2eb0
	push af                                                         ; $2eb1

; Get byte from struct offseted by above
	ld   c, a                                                       ; $2eb2
	ld   b, $00                                                     ; $2eb3
	push hl                                                         ; $2eb5
	ld   hl, wPrinterUnusedTable2                                   ; $2eb6
	add  hl, bc                                                     ; $2eb9
	ld   a, [hl]                                                    ; $2eba
	pop  hl                                                         ; $2ebb

; Override if compression applied from struct
	ld   [wPrinterDataCompressionApplied], a                        ; $2ebc

; Get double index from orig A-1
	pop  af                                                         ; $2ebf
	add  a                                                          ; $2ec0

; Get BC from struct double-indexed by above, it's the length
	ld   c, a                                                       ; $2ec1
	ld   b, $00                                                     ; $2ec2
	push hl                                                         ; $2ec4
	ld   hl, wPrinterUnusedTable1                                   ; $2ec5
	add  hl, bc                                                     ; $2ec8
	ld   a, [hl+]                                                   ; $2ec9
	ld   b, [hl]                                                    ; $2eca
	pop  hl                                                         ; $2ecb

	ld   c, a                                                       ; $2ecc
	jp   .startProcess                                              ; $2ecd

.noCompression:
; Transfer a fragment-sized packet
	ld   bc, DATA_FRAGMENT_SIZE                                     ; $2ed0

.startProcess:
	call UpdatePrinterPacketStructWithEmptyDataCommand              ; $2ed3
	jp   StartPacketTransferProcess                                 ; $2ed6

.transferInProgress:
; We're done if 0s not yet sent over
	ld   a, [wPrintPacketTransferProgress]                          ; $2ed9
	cp   $02                                                        ; $2edc
	ld   a, PRINT_MARKER_IN_PROGRESS                                ; $2ede
	jp   c, .done                                                   ; $2ee0

; Inc progress, so we do below next frame
	call IncPacketTransferDoneProgress                              ; $2ee3
	ld   a, PRINT_MARKER_IN_PROGRESS                                ; $2ee6
	jp   nz, .done                                                  ; $2ee8

; --
; -- Next frame after done
; --
	ld   hl, wPrinterUnusedTablesIdx                                ; $2eeb

; Jump if any errors received
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $2eee
	ld   c, a                                                       ; $2ef1
	and  $f0                                                        ; $2ef2
	ld   a, c                                                       ; $2ef4
	jp   nz, .setErrorReceived                                      ; $2ef5

; Jump if we're printing or there is a checksum error
	bit  P_PRINTING, a                                              ; $2ef8
	jp   nz, .nextFrameCont                                         ; $2efa

	bit  P_CHECKSUM_ERROR, a                                        ; $2efd
	jp   nz, .nextFrameCont                                         ; $2eff

; If table idx == 0, clear packet type and progress
	ld   a, [hl]                                                    ; $2f02
	and  a                                                          ; $2f03
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $2f04
	jr   z, .clearPacketTypeAndProgress                             ; $2f07

; If table idx == 1, transfer with idx-1
	ld   a, [hl]                                                    ; $2f09
	cp   $01                                                        ; $2f0a
	jp   z, .clearPacketTypeAndProgressIfLoadedElseDecTableIdxAndTransfer ; $2f0c

; Ignore below check
	dec  [hl]                                                       ; $2f0f
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $2f10
	jr   z, .clearPacketTypeAndProgress                             ; $2f13

.nextFrameCont:
; After dec, if table idx == 1, return in-progress
	ld   a, [hl]                                                    ; $2f15
	cp   $01                                                        ; $2f16
	ld   a, PRINT_MARKER_IN_PROGRESS                                ; $2f18
	jp   z, .done                                                   ; $2f1a

	ld   bc, DATA_FRAGMENT_SIZE                                     ; $2f1d

; Jump if no compression
	ld   a, [wGlobalPrinterDataCompressionApplied]                  ; $2f20
	ld   [wPrinterDataCompressionApplied], a                        ; $2f23
	and  a                                                          ; $2f26
	jr   z, .noCompression2                                         ; $2f27

; Compression applied - similar to above, get if compression applied from table 2
	ld   a, [wPrinterUnusedTablesIdx]                               ; $2f29
	dec  a                                                          ; $2f2c
	dec  a                                                          ; $2f2d

	push af                                                         ; $2f2e
	ld   c, a                                                       ; $2f2f
	ld   b, $00                                                     ; $2f30
	push hl                                                         ; $2f32
	ld   hl, wPrinterUnusedTable2                                   ; $2f33
	add  hl, bc                                                     ; $2f36
	ld   a, [hl]                                                    ; $2f37
	pop  hl                                                         ; $2f38
	ld   [wPrinterDataCompressionApplied], a                        ; $2f39

; Get fragment size from table 1
	pop  af                                                         ; $2f3c
	add  a                                                          ; $2f3d
	ld   c, a                                                       ; $2f3e
	ld   b, $00                                                     ; $2f3f
	push hl                                                         ; $2f41
	ld   hl, wPrinterUnusedTable1                                   ; $2f42
	add  hl, bc                                                     ; $2f45
	ld   a, [hl+]                                                   ; $2f46
	ld   b, [hl]                                                    ; $2f47
	pop  hl                                                         ; $2f48
	ld   c, a                                                       ; $2f49

.noCompression2:
; If printing, start process with updated source addr
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $2f4a
	bit  P_PRINTING, a                                              ; $2f4d
	jp   nz, .startTransferProcessWithUpdatedAddr                   ; $2f4f

; Else, printing done, update fragment address to the next one
	ld   a, [wUpdatedPrinterPacketDataSourceAddr]                   ; $2f52
	add  LOW(DATA_FRAGMENT_SIZE)                                    ; $2f55
	ld   [wUpdatedPrinterPacketDataSourceAddr], a                   ; $2f57
	ld   a, [wUpdatedPrinterPacketDataSourceAddr+1]                 ; $2f5a
	adc  HIGH(DATA_FRAGMENT_SIZE)                                   ; $2f5d
	ld   [wUpdatedPrinterPacketDataSourceAddr+1], a                 ; $2f5f

.startTransferProcessWithUpdatedAddr:
	ld   a, [wUpdatedPrinterPacketDataSourceAddr]                   ; $2f62
	ld   l, a                                                       ; $2f65
	ld   a, [wUpdatedPrinterPacketDataSourceAddr+1]                 ; $2f66
	ld   h, a                                                       ; $2f69
	jp   StartDataFragmentPacketTransferProcess.startProcess        ; $2f6a

.setErrorReceived:
; Set var, and print error var
	push af                                                         ; $2f6d
	ld   a, $01                                                     ; $2f6e
	ld   [wPrinterErrorByteReceived], a                             ; $2f70
	pop  af                                                         ; $2f73
	call SetNintendoPrintError                                      ; $2f74

.clearPacketTypeAndProgress:
; Returns serial byte received from printer
	push af                                                         ; $2f77
	xor  a                                                          ; $2f78
	ld   [wPrinterStreamTypePacket], a                              ; $2f79
	ld   [wPrinterPacketTransferProcessInProgress], a               ; $2f7c
	pop  af                                                         ; $2f7f

.done:
	ret                                                             ; $2f80

.clearPacketTypeAndProgressIfLoadedElseDecTableIdxAndTransfer:
; Clear if tile data all loaded
	ld   a, [wPrinterTileDataAllLoaded]                             ; $2f81
	and  a                                                          ; $2f84
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $2f85
	jr   z, .clearPacketTypeAndProgress                             ; $2f88

; Else dec counter and transfer again
	dec  [hl]                                                       ; $2f8a
	call UpdatePrinterPacketStructWithDataCommand                   ; $2f8b
	jp   StartPacketTransferProcess                                 ; $2f8e


StartUnknownPacketTransferProcess::
; Continue if transfer done, or struct idx is empty data
	ld   a, [wImagePrintingFlowStateIdx]                            ; $2f91
	cp   $01                                                        ; $2f94
	jr   z, .cont                                                   ; $2f96

	cp   $03                                                        ; $2f98
	jr   z, .cont                                                   ; $2f9a

; If state == 0 (reset/error) return with $ff
	and  a                                                          ; $2f9c
	ld   a, PRINT_MARKER_ERRORED                                    ; $2f9d
	ret  z                                                          ; $2f9f

; Else return with in-progress
	ld   a, PRINT_MARKER_IN_PROGRESS                                ; $2fa0
	ret                                                             ; $2fa2

.cont:
; Continue if transfer not started, or we need to re-send
	ld   a, [wPrinterPacketTransferProcessInProgress]               ; $2fa3
	and  a                                                          ; $2fa6
	jr   z, :+                                                      ; $2fa7

	call ReturnCarryIfNeedToReSend                                  ; $2fa9
	ret  nc                                                         ; $2fac

; Continue if 0s not yet sent over, or we need to -re-send
:	ld   a, [wPacketStructIdxAfter0sSentOver]                       ; $2fad
	cp   $04                                                        ; $2fb0
	jr   nz, .startWithUnknownCommand                               ; $2fb2

	call ReturnCarryIfNeedToReSend                                  ; $2fb4
	ret  nc                                                         ; $2fb7

.startWithUnknownCommand:
; Actual send
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $2fb8
	cp   SB_NO_PRINTER                                              ; $2fbb
	jp   z, SetNintendoPrintError                                   ; $2fbd

	call UpdatePrinterPacketStructWithUnknownCommand                ; $2fc0
	jp   StartPacketTransferProcess                                 ; $2fc3


StartStatusPacketTransferProcess:
; Jump if transfer finished, or struct idx is empty data
	ld   a, [wImagePrintingFlowStateIdx]                            ; $2fc6
	cp   $01                                                        ; $2fc9
	jr   z, .initOrData                                             ; $2fcb

	cp   $03                                                        ; $2fcd
	jr   z, .initOrData                                             ; $2fcf

; If state == 0, return with $ff, else return with in-progress
	and  a                                                          ; $2fd1
	ld   a, PRINT_MARKER_ERRORED                                    ; $2fd2
	ret  z                                                          ; $2fd4

	ld   a, PRINT_MARKER_IN_PROGRESS                                ; $2fd5
	ret                                                             ; $2fd7

.initOrData:
; Continue if transfer not yet started or we need to re-send
	ld   a, [wPrinterPacketTransferProcessInProgress]               ; $2fd8
	and  a                                                          ; $2fdb
	jr   z, .startWithStatusCommand                                 ; $2fdc

	call ReturnCarryIfNeedToReSend                                  ; $2fde
	ret  nc                                                         ; $2fe1

.startWithStatusCommand:
; Start process if printer connected
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $2fe2
	cp   SB_NO_PRINTER                                              ; $2fe5
	jp   z, SetNintendoPrintError                                   ; $2fe7

	call UpdatePrinterPacketStructWithStatusCommand                 ; $2fea
	jp   StartPacketTransferProcess                                 ; $2fed


; A - printer command idx
; BC - final offset/length of packet struct
; D - if streaming packets
; HL - source addr of struct
SetPacketStructBaseDetails:
	ld   [wPrinterPacketStructTypeIdx], a                           ; $2ff0
	ld   a, d                                                       ; $2ff3
	ld   [wPrinterStreamTypePacket], a                              ; $2ff4

; Store and cache source address of packet struct
	ld   a, l                                                       ; $2ff7
	ld   [wPrinterPacketBytesSourceAddr], a                         ; $2ff8
	ld   [wSavedPrinterPacketSourceAddr], a                         ; $2ffb

	ld   a, h                                                       ; $2ffe
	ld   [wPrinterPacketBytesSourceAddr+1], a                       ; $2fff
	ld   [wSavedPrinterPacketSourceAddr+1], a                       ; $3002

; Store and cache final offset of packet struct
	ld   a, c                                                       ; $3005
	ld   [wPrinterFinalOffsetForPacketBytesBeingSent], a            ; $3006
	ld   [wSavedPrinterPacketDataLength], a                         ; $3009
	ld   a, b                                                       ; $300c
	ld   [wPrinterFinalOffsetForPacketBytesBeingSent+1], a          ; $300d
	ld   [wSavedPrinterPacketDataLength+1], a                       ; $3010

; Clear progress and data vars
	xor  a                                                          ; $3013
	ld   [wPrintPacketTransferProgress], a                          ; $3014
	call ClearPrinterDataVars                                       ; $3017
	ret                                                             ; $301a


PrinterTransferPackets:
PrinterMagicBytes:
	db $88, $33


PrinterInitCommandPacket:
	db $01, $00, $00, $00, $01, $00, $00, $00
.end:


PrinterPrintCommandPacket:
	db $02, $00, $04, $00
.end:


PrinterDataCommandPacket:
	db $04, $00, $00, $00, $04, $00, $00, $00
.end:


PrinterUnknownCommandPacket:
	db $08, $00, $00, $00, $08, $00, $00, $00
.end:


PrinterStatusCommandPacket:
	db $0f, $00, $00, $00, $0f, $00, $00, $00
.end:


UpdatePrinterPacketStructWithInitCommand:
; Struct idx 1, not a streaming type
	ld   a, $01                                                     ; $3041
	ld   d, $00                                                     ; $3043

	ld   hl, PrinterInitCommandPacket                               ; $3045
	ld   bc, PrinterInitCommandPacket.end-PrinterInitCommandPacket  ; $3048
	jp   SetPacketStructBaseDetails                                 ; $304b


UpdatePrinterPacketStructWithPrintCommand:
; Struct idx 2, streaming type

; BC = 4 command params, 4 print params, 2 checksum bytes, and 2 0 bytes
	ld   a, $02                                                     ; $304e
	ld   d, $00                                                     ; $3050
	ld   hl, wPrinterPacketStruct                                   ; $3052
	ld   bc, $000c                                                  ; $3055
	call SetPacketStructBaseDetails                                 ; $3058

; Copy the print command params into the print packet struct
	ld   hl, PrinterPrintCommandPacket                              ; $305b
	ld   de, wPrinterPacketStruct                                   ; $305e
	ld   bc, PrinterPrintCommandPacket.end-PrinterPrintCommandPacket ; $3061
	call SerialRelatedMemCopy                                       ; $3064

; Checksum starts at 6 (Print cmd = 2, compression = 0, length = 4)
	ld   de, $0006                                                  ; $3067

; Set packet struct bytes, and update checksum
	ld   a, [wPrinterPrintCommandNumSheets]                         ; $306a
	ld   [wPrinterPacketStruct_PrintNumSheets], a                   ; $306d
	call DEplusEquA                                                 ; $3070

	ld   a, [wPrinterPrintCommandMargins]                           ; $3073
	ld   [wPrinterPacketStruct_PrintMargins], a                     ; $3076
	call DEplusEquA                                                 ; $3079

	ld   a, [wPrinterPrintPalette]                                  ; $307c
	ld   [wPrinterPacketStruct_PrintPalette], a                     ; $307f
	call DEplusEquA                                                 ; $3082

	ld   a, [wPrinterPrintCommandExposure]                          ; $3085
	ld   [wPrinterPacketStruct_PrintExposure], a                    ; $3088
	call DEplusEquA                                                 ; $308b

; Store checksum in struct
	ld   a, e                                                       ; $308e
	ld   [wPrinterPacketStruct_PrintChecksum], a                    ; $308f
	ld   a, d                                                       ; $3092
	ld   [wPrinterPacketStruct_PrintChecksum+1], a                  ; $3093

; Then ending 0s
	xor  a                                                          ; $3096
	ld   [wPrinterPacketStruct_PrintKeepAlive], a                   ; $3097
	ld   [wPrinterPacketStruct_PrintCurrStatus], a                  ; $309a
	ret                                                             ; $309d


DEplusEquA:
	add  e                                                          ; $309e
	ld   e, a                                                       ; $309f
	ld   a, d                                                       ; $30a0
	adc  $00                                                        ; $30a1
	ld   d, a                                                       ; $30a3
	ret                                                             ; $30a4


; BC - packet data length
; HL - base addr of tile data
UpdatePrinterPacketStructWithEmptyDataCommand:
; Set new source addr
	ld   a, l                                                       ; $30a5
	ld   [wUpdatedPrinterPacketDataSourceAddr], a                   ; $30a6
	ld   a, h                                                       ; $30a9
	ld   [wUpdatedPrinterPacketDataSourceAddr+1], a                 ; $30aa

; Set new length
	ld   a, c                                                       ; $30ad
	ld   [wUpdatedPrinterPacketDataLength], a                       ; $30ae
	ld   a, b                                                       ; $30b1
	ld   [wUpdatedPrinterPacketDataLength+1], a                     ; $30b2
	push bc                                                         ; $30b5

; Struct idx 3, streaming type, only send 1st half cause empty
	ld   a, $03                                                     ; $30b6
	ld   d, $01                                                     ; $30b8

	ld   hl, wPrinterPacketStruct                                   ; $30ba
	ld   bc, $0004                                                  ; $30bd
	call SetPacketStructBaseDetails                                 ; $30c0

; Set command and compression, and unused var
	ld   a, [PrinterDataCommandPacket]                              ; $30c3
	ld   [wPrinterPacketStructCommand], a                           ; $30c6
	ld   a, [wPrinterDataCompressionApplied]                        ; $30c9
	ld   [wPrinterPacketStructCompression], a                       ; $30cc

; Set base length
	pop  bc                                                         ; $30cf
	ld   a, c                                                       ; $30d0
	ld   [wPrinterPacketStructDataLength], a                        ; $30d1
	ld   a, b                                                       ; $30d4
	ld   [wPrinterPacketStructDataLength+1], a                      ; $30d5
	ret                                                             ; $30d8


UpdatePrinterPacketStructWithUnknownCommand:
; Struct idx 4, not a streaming type
	ld   a, $04                                                     ; $30d9
	ld   d, $00                                                     ; $30db

	ld   hl, PrinterUnknownCommandPacket                            ; $30dd
	ld   bc, PrinterUnknownCommandPacket.end-PrinterUnknownCommandPacket ; $30e0
	jp   SetPacketStructBaseDetails                                 ; $30e3


UpdatePrinterPacketStructWithStatusCommand:
; Struct idx 5, not a streaming type
	ld   a, $05                                                     ; $30e6
	ld   d, $00                                                     ; $30e8
	ld   hl, PrinterStatusCommandPacket                             ; $30ea
	ld   bc, PrinterStatusCommandPacket.end-PrinterStatusCommandPacket ; $30ed
	jp   SetPacketStructBaseDetails                                 ; $30f0


UpdatePrinterPacketStructWithDataCommand:
; Struct idx 6, streaming type
	ld   a, $06                                                     ; $30f3
	ld   d, $01                                                     ; $30f5

	ld   hl, PrinterDataCommandPacket                               ; $30f7
	ld   bc, PrinterDataCommandPacket.end-PrinterDataCommandPacket  ; $30fa
	jp   SetPacketStructBaseDetails                                 ; $30fd


; - unused
	ret                                                             ; $3100


StartPacketTransferProcess:
; Jump if transfer finished
	ld   a, [wImagePrintingFlowStateIdx]                            ; $3101
	cp   $01                                                        ; $3104
	jr   z, .transferFinished                                       ; $3106

; Set carry if not null state
	and  a                                                          ; $3108
	jr   nz, .setCarry                                              ; $3109

; Jump if init packet was being sent, otherwise set carry
	ld   a, [wPrinterPacketStructTypeIdx]                           ; $310b
	cp   $01                                                        ; $310e
	jr   z, .initStateInProgress                                    ; $3110

.setCarry:
	scf                                                             ; $3112
	ret                                                             ; $3113

.transferFinished:
; Set carry if init command was just transferred
	ld   a, [wPrinterPacketStructTypeIdx]                           ; $3114
	cp   $01                                                        ; $3117
	jr   z, .setCarry                                               ; $3119

; Set flow state based on packet struct type idx
	ld   [wImagePrintingFlowStateIdx], a                            ; $311b

.initStateInProgress:
; Clear progress after transfer done, and that 0s are sent over
	xor  a                                                          ; $311e
	ld   [wPrintPacketTransferProgress], a                          ; $311f
	ld   [wPacketStructIdxAfter0sSentOver], a                       ; $3122

; Set to send the 2nd magic byte and that this process has started
	ld   a, $01                                                     ; $3125
	ld   [wPrinterPacketOffsetToSendNext], a                        ; $3127
	ld   [wPrinterPacketTransferProcessInProgress], a               ; $312a

; Send 1st magic byte
	ld   a, [PrinterTransferPackets]                                ; $312d
	ldh  [rSB], a                                                   ; $3130

; Initiate transfer
	ld   a, SC_MASTER                                               ; $3132
	ldh  [rSC], a                                                   ; $3134
	ld   a, SC_REQUEST|SC_MASTER                                    ; $3136
	ldh  [rSC], a                                                   ; $3138

; Return with in-progress marker
	ld   a, PRINT_MARKER_IN_PROGRESS                                ; $313a
	ret                                                             ; $313c


SetNintendoPrintError:
	push af                                                         ; $313d
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $313e
	cp   SB_NO_PRINTER                                              ; $3141
	jr   z, .notConnected                                           ; $3143

	bit  P_LOW_BATTERY, a                                           ; $3145
	jr   z, .notLowBat                                              ; $3147

; Low battery - Print error 1
	ld   a, $00                                                     ; $3149
	jr   .setUnusedVar                                              ; $314b

.notLowBat:
	bit  P_OTHER_ERROR, a                                           ; $314d
	jr   z, .notOtherErr                                            ; $314f

; Other error - Print error 4
	ld   a, $03                                                     ; $3151
	jr   .setUnusedVar                                              ; $3153

.notOtherErr:
	bit  P_PAPER_JAM, a                                             ; $3155
	jr   z, .notConnected                                           ; $3157

; Paper jam - Print error 3
	ld   a, $02                                                     ; $3159
	jr   .setUnusedVar                                              ; $315b

.notConnected:
; Whatever response is at this point, it sets this unused flag to 1
	ld   a, [wPrinterStatusResponseSB]                              ; $315d
	cp   $81                                                        ; $3160
	jr   z, :+                                                      ; $3162

	ld   a, $01                                                     ; $3164
	jr   .setUnusedVar                                              ; $3166

:	ld   a, $01                                                     ; $3168

.setUnusedVar:
	ld   [wPrinterNintendoErrorMinus1], a                           ; $316a
	pop  af                                                         ; $316d
	ret                                                             ; $316e


; Multiples of DATA_FRAGMENT_SIZE
PrinterTileDataFragmentOffsets:
	dw $0000
	dw $0280
	dw $0500
	dw $0780
	dw $0a00
	dw $0c80
	dw $0f00
	dw $1180
	dw $1400


GameState2b_PhotoGetInit:
	JumpFromBank0 GameState2b_PhotoGetInit_def


GameState2c_PhotoGetMain:
	JumpFromBank0 GameState2c_PhotoGetMain_def


GameState2f_PicBookCompleteInit:
	JumpFromBank0 GameState2f_PicBookCompleteInit_def


GameState30_PicBookCompleteMain:
; Also bank of PicBookCompleteMainFunc_ClearPalettes
	call ResetVBlankQueueData                                       ; $3199
	ld   a, BANK(PicBookCompleteMainFunc_ApplyHiColPalettes)        ; $319c
	call SetRomBank1stHalfOfRom                                     ; $319e

; Jump to the functions in above bank
	ld   hl, wPicBookCompleteMainFunc                               ; $31a1
	ld   a, [hl+]                                                   ; $31a4
	ld   h, [hl]                                                    ; $31a5
	ld   l, a                                                       ; $31a6
	jp   hl                                                         ; $31a7


VBlankInterruptFunc_PicBookCompleteTileData1::
	ld   a, BANK(Gfx_PicBookComplete)                               ; $31a8
	call SetRomBank1stHalfOfRom                                     ; $31aa

; Set hdma details for 1st chunk
	xor  a                                                          ; $31ad
	ldh  [rVBK], a                                                  ; $31ae
	ld   a, HIGH(Gfx_PicBookComplete)                               ; $31b0
	ldh  [rHDMA1], a                                                ; $31b2
	ld   a, LOW(Gfx_PicBookComplete)                                ; $31b4
	ldh  [rHDMA2], a                                                ; $31b6
	ld   a, HIGH(_VRAM+$800)                                        ; $31b8
	ldh  [rHDMA3], a                                                ; $31ba
	ld   a, LOW(_VRAM+$800)                                         ; $31bc
	ldh  [rHDMA4], a                                                ; $31be
	ld   a, ($800-$10)/$10                                          ; $31c0
	ldh  [rHDMA5], a                                                ; $31c2

; Next vblank is below tile data load
	ld   a, [wVBlankInterruptFunc]                                  ; $31c4
	ld   l, a                                                       ; $31c7
	ld   a, [wVBlankInterruptFunc+1]                                ; $31c8
	ld   h, a                                                       ; $31cb

	ld   a, LOW(VBlankInterruptFunc_PicBookCompleteTileData2)       ; $31cc
	ld   [wVBlankInterruptFunc], a                                  ; $31ce
	ld   a, HIGH(VBlankInterruptFunc_PicBookCompleteTileData2)      ; $31d1
	ld   [wVBlankInterruptFunc+1], a                                ; $31d3
	ret                                                             ; $31d6


VBlankInterruptFunc_PicBookCompleteTileData2:
	ld   a, BANK(Gfx_PicBookComplete)                               ; $31d7
	call SetRomBank1stHalfOfRom                                     ; $31d9

; Set hdma details for 2nd chunk
	xor  a                                                          ; $31dc
	ldh  [rVBK], a                                                  ; $31dd
	ld   a, ($800-$10)/$10                                          ; $31df
	ldh  [rHDMA5], a                                                ; $31e1

; Next vblank is below tile data load
	ld   a, [wVBlankInterruptFunc]                                  ; $31e3
	ld   l, a                                                       ; $31e6
	ld   a, [wVBlankInterruptFunc+1]                                ; $31e7
	ld   h, a                                                       ; $31ea

	ld   a, LOW(VBlankInterruptFunc_PicBookCompleteTileData3)       ; $31eb
	ld   [wVBlankInterruptFunc], a                                  ; $31ed
	ld   a, HIGH(VBlankInterruptFunc_PicBookCompleteTileData3)      ; $31f0
	ld   [wVBlankInterruptFunc+1], a                                ; $31f2
	ret                                                             ; $31f5


VBlankInterruptFunc_PicBookCompleteTileData3:
	ld   a, BANK(Gfx_PicBookComplete)                               ; $31f6
	call SetRomBank1stHalfOfRom                                     ; $31f8

; Set hdma details for 2nd chunk
	ld   a, $01                                                     ; $31fb
	ldh  [rVBK], a                                                  ; $31fd
	ld   a, HIGH(_VRAM+$800)                                        ; $31ff
	ldh  [rHDMA3], a                                                ; $3201
	ld   a, LOW(_VRAM+$800)                                         ; $3203
	ldh  [rHDMA4], a                                                ; $3205
	ld   a, ($400-$10)/$10                                          ; $3207
	ldh  [rHDMA5], a                                                ; $3209

; V-blanks tile data done, stub its interrupt
	ld   a, [wVBlankInterruptFunc]                                  ; $320b
	ld   l, a                                                       ; $320e
	ld   a, [wVBlankInterruptFunc+1]                                ; $320f
	ld   h, a                                                       ; $3212
	ld   a, LOW(StubInterruptFunc)                                  ; $3213
	ld   [wVBlankInterruptFunc], a                                  ; $3215
	ld   a, HIGH(StubInterruptFunc)                                 ; $3218
	ld   [wVBlankInterruptFunc+1], a                                ; $321a
	ret                                                             ; $321d


GameState31_CongratsInit:
	JumpFromBank0 GameState31_CongratsInit_def


GameState32_CongratsMain:
	JumpFromBank0 GameState32_CongratsMain_def


LCDCInterruptFunc_Congrats::
; Set SCY, jump if not 0
	ld   a, [wCongratsSCY]                                          ; $322e
	ldh  [rSCY], a                                                  ; $3231
	or   a                                                          ; $3233
	jr   nz, .end                                                   ; $3234

; Once 0, disable lcdc setup
	xor  a                                                          ; $3236
	ldh  [rIF], a                                                   ; $3237
	ld   a, IEF_VBLANK                                              ; $3239
	ldh  [rIE], a                                                   ; $323b
	ld   a, $00                                                     ; $323d
	ldh  [rSTAT], a                                                 ; $323f

; Replace with stub funcs too
	ld   a, [wLCDCInterruptFunc]                                    ; $3241
	ld   l, a                                                       ; $3244
	ld   a, [wLCDCInterruptFunc+1]                                  ; $3245
	ld   h, a                                                       ; $3248
	ld   a, LOW(StubInterruptFunc)                                  ; $3249
	ld   [wLCDCInterruptFunc], a                                    ; $324b
	ld   a, HIGH(StubInterruptFunc)                                 ; $324e
	ld   [wLCDCInterruptFunc+1], a                                  ; $3250

.end:
; Otherwise dec SCY for next line (display the same line as above)
	dec  a                                                          ; $3253
	ld   [wCongratsSCY], a                                          ; $3254
	ldh  a, [rLYC]                                                  ; $3257
	inc  a                                                          ; $3259
	ldh  [rLYC], a                                                  ; $325a
	ret                                                             ; $325c


SECTION "Bank $000, $36e0", ROM0[$36e0]

UnlockTrains::
; Preserve regs + rom bank, and set a new one
	push af                                                         ; $36e0
	push bc                                                         ; $36e1
	push de                                                         ; $36e2
	push hl                                                         ; $36e3

	ld   a, [wRomBank]                                              ; $36e4
	push af                                                         ; $36e7
	ld   a, BANK(TrainLineParamsForUnlockingPhotos)                 ; $36e8
	call SetRomBank1stHalfOfRom                                     ; $36ea

; HL = double trainline idx into table
	ld   hl, TrainLineParamsForUnlockingPhotos                      ; $36ed
	ld   a, [wSelectedTrainLine]                                    ; $36f0
	add  a                                                          ; $36f3
	ld   c, a                                                       ; $36f4
	ld   b, $00                                                     ; $36f5
	add  hl, bc                                                     ; $36f7

; Get word in table
	ld   a, [hl+]                                                   ; $36f8
	ld   h, [hl]                                                    ; $36f9
	ld   l, a                                                       ; $36fa

; Get trainline idx offset
	ld   a, [wUnlockTrainLocationIdxInTrainLine]                    ; $36fb
	add  a                                                          ; $36fe
	add  a                                                          ; $36ff
	ld   c, a                                                       ; $3700
	add  hl, bc                                                     ; $3701

; 1st 3 bytes are the number of trains to unlock in each group
	ld   a, [hl+]                                                   ; $3702
	ld   [wNumGroup1TrainsToUnlock], a                              ; $3703
	ld   a, [hl+]                                                   ; $3706
	ld   [wNumGroup2TrainsToUnlock], a                              ; $3707
	ld   a, [hl+]                                                   ; $370a
	ld   [wNumGroup3TrainsToUnlock], a                              ; $370b

; Add last byte onto num trains unlocked
	ld   a, [wNumTrainsUnlockedSinceDeparture]                      ; $370e
	ld   b, a                                                       ; $3711
	ld   a, [hl]                                                    ; $3712
	add  b                                                          ; $3713
	ld   a, a                                                       ; $3714
	ld   [wNumTrainsUnlockedSinceDeparture], a                      ; $3715

; Unlock loaded num trains in 3 groups, save it and restore regs + rom bank
	call UnlockTrainsIn3Groups                                      ; $3718
	call SaveSaveData                                               ; $371b
	pop  af                                                         ; $371e
	call SetRomBank1stHalfOfRom                                     ; $371f
	pop  hl                                                         ; $3722
	pop  de                                                         ; $3723
	pop  bc                                                         ; $3724
	pop  af                                                         ; $3725
	ret                                                             ; $3726


GetNumTrainsUnlocked::
	ld   c, $00                                                     ; $3727
	ld   b, NUM_TRAINS                                              ; $3729
	ld   hl, wTrainsUnlocked                                        ; $372b

.nextTrain:
; Inc C if train unlocked
	ld   a, [hl+]                                                   ; $372e
	or   a                                                          ; $372f
	jr   z, :+                                                      ; $3730
	inc  c                                                          ; $3732
:	dec  b                                                          ; $3733
	jr   nz, .nextTrain                                             ; $3734

	ld   a, c                                                       ; $3736
	ret                                                             ; $3737


UnlockLast2Trains::
; Location-unlockable trains leaves 2 left in group 3
	ld   a, [wRomBank]                                              ; $3738
	push af                                                         ; $373b

	ld   a, $00                                                     ; $373c
	ld   [wNumGroup1TrainsToUnlock], a                              ; $373e
	ld   a, $00                                                     ; $3741
	ld   [wNumGroup2TrainsToUnlock], a                              ; $3743
	ld   a, $02                                                     ; $3746
	ld   [wNumGroup3TrainsToUnlock], a                              ; $3748

	CallFromBank0 UnlockTrainsIn3Groups
	pop  af                                                         ; $3753
	call SetRomBank1stHalfOfRom                                     ; $3754
	ret                                                             ; $3757


GetTrainlineDifficultyMaxAcceptableDistanceBeforeStop::
	ld   a, [wRomBank]                                              ; $3758
	push af                                                         ; $375b

	ld   a, BANK(AcceptableDistancesBeforeStationStop)              ; $375c
	call SetRomBank1stHalfOfRom                                     ; $375e
	ld   hl, AcceptableDistancesBeforeStationStop                   ; $3761
	jp   GetTrainLineAndDifficultyRelatedByteFromTable              ; $3764


GetAllowableSpeedOffsetOverLimit::
	ld   a, [wRomBank]                                              ; $3767
	push af                                                         ; $376a

	ld   a, BANK(TrainLineAllowableSpeedOffsetsOverLimit)           ; $376b
	call SetRomBank1stHalfOfRom                                     ; $376d
	ld   hl, TrainLineAllowableSpeedOffsetsOverLimit                ; $3770
	jp   GetTrainLineRelatedByteFromTable                           ; $3773


GetTrainlineStationDeductionPoints::
	ld   a, [wRomBank]                                              ; $3776
	push af                                                         ; $3779

	ld   a, BANK(StationStructureDeductionPts)                      ; $377a
	call SetRomBank1stHalfOfRom                                     ; $377c
	ld   hl, StationStructureDeductionPts                           ; $377f
	jp   GetTrainLineRelatedByteFromTable                           ; $3782


GetPenaltiesDeductedPerSecondAfterDestTime::
	ld   a, [wRomBank]                                              ; $3785
	push af                                                         ; $3788

	ld   a, BANK(PenaltiesDeductedPerSecondPassedDestTime)          ; $3789
	call SetRomBank1stHalfOfRom                                     ; $378b
	ld   hl, PenaltiesDeductedPerSecondPassedDestTime               ; $378e
	jp   GetTrainLineRelatedByteFromTable                           ; $3791


GetTrainlineStopPosPenaltyMultiplierMinus1::
	ld   a, [wRomBank]                                              ; $3794
	push af                                                         ; $3797

	ld   a, BANK(StopPosAccelDeductionMultiplierMinus1)             ; $3798
	call SetRomBank1stHalfOfRom                                     ; $379a
	ld   hl, StopPosAccelDeductionMultiplierMinus1                  ; $379d
	jp   GetTrainLineRelatedByteFromTable                           ; $37a0


GetBonusPenaltiesAllowedOnGoodCommunication::
	ld   a, [wRomBank]                                              ; $37a3
	push af                                                         ; $37a6

	ld   a, BANK(AdditionalPenaltiesAllowedOnRegularCommunication)  ; $37a7
	call SetRomBank1stHalfOfRom                                     ; $37a9
	ld   hl, AdditionalPenaltiesAllowedOnRegularCommunication       ; $37ac
	jp   GetTrainLineRelatedByteFromTable                           ; $37af


GetSirenBonusPenalties::
	ld   a, [wRomBank]                                              ; $37b2
	push af                                                         ; $37b5

	ld   a, BANK(SirenBonusPenalties)                               ; $37b6
	call SetRomBank1stHalfOfRom                                     ; $37b8
	ld   hl, SirenBonusPenalties                                    ; $37bb
	jp   GetTrainLineRelatedByteFromTable                           ; $37be


GetTrainLineBonusPtsForCoasting::
	ld   a, [wRomBank]                                              ; $37c1
	push af                                                         ; $37c4

	ld   a, BANK(CoastingFollowedBonusPts)                          ; $37c5
	call SetRomBank1stHalfOfRom                                     ; $37c7
	ld   hl, CoastingFollowedBonusPts                               ; $37ca

; HL - table addr
GetTrainLineRelatedByteFromTable:
	ld   a, [wSelectedTrainLine]                                    ; $37cd
	ld   c, a                                                       ; $37d0
	ld   b, $00                                                     ; $37d1
	add  hl, bc                                                     ; $37d3
	ld   b, [hl]                                                    ; $37d4
	pop  af                                                         ; $37d5
	call SetRomBank1stHalfOfRom                                     ; $37d6
	ret                                                             ; $37d9


GetTrainLineDifficultyPenaltiesForNotFollowingCabRules::
	ld   a, [wRomBank]                                              ; $37da
	push af                                                         ; $37dd

	ld   a, BANK(PenaltiesForNotFollowingCabRules)                  ; $37de
	call SetRomBank1stHalfOfRom                                     ; $37e0
	ld   hl, PenaltiesForNotFollowingCabRules                       ; $37e3
	jp   GetTrainLineAndDifficultyRelatedByteFromTable              ; $37e6


GetTrainLineDifficultyBonusPtsOnGreatFinish::
	ld   a, [wRomBank]                                              ; $37e9
	push af                                                         ; $37ec

	ld   a, BANK(BonusPenaltiesForGreatFinish)                      ; $37ed
	call SetRomBank1stHalfOfRom                                     ; $37ef
	ld   hl, BonusPenaltiesForGreatFinish                           ; $37f2
	jp   GetTrainLineAndDifficultyRelatedByteFromTable              ; $37f5


GetTrainLineDifficultyBonusPtsOnGoodFinish::
	ld   a, [wRomBank]                                              ; $37f8
	push af                                                         ; $37fb

	ld   a, BANK(BonusPenaltiesForGoodFinish)                       ; $37fc
	call SetRomBank1stHalfOfRom                                     ; $37fe
	ld   hl, BonusPenaltiesForGoodFinish                            ; $3801
	jp   GetTrainLineAndDifficultyRelatedByteFromTable              ; $3804


GetTrainLineDifficultyPenaltyPtsForSuddenBraking::
	ld   a, [wRomBank]                                              ; $3807
	push af                                                         ; $380a

	ld   a, BANK(PenaltyPtsForSuddenBraking)                        ; $380b
	call SetRomBank1stHalfOfRom                                     ; $380d
	ld   hl, PenaltyPtsForSuddenBraking                             ; $3810
	jp   GetTrainLineAndDifficultyRelatedByteFromTable              ; $3813


GetTrainLineDifficultyPenaltyPtsForNotSirening::
	ld   a, [wRomBank]                                              ; $3816
	push af                                                         ; $3819

	ld   a, BANK(PenaltyPtsForNotSireningWhenPrompted)              ; $381a
	call SetRomBank1stHalfOfRom                                     ; $381c
	ld   hl, PenaltyPtsForNotSireningWhenPrompted                   ; $381f
	jp   GetTrainLineAndDifficultyRelatedByteFromTable              ; $3822


GetTrainLineDifficultyPenaltyPtsWhenIgnoringSpeedSigns::
	ld   a, [wRomBank]                                              ; $3825
	push af                                                         ; $3828
	ld   a, BANK(PenaltyPointsForIgnoringSpeedSigns)                ; $3829
	call SetRomBank1stHalfOfRom                                     ; $382b
	ld   hl, PenaltyPointsForIgnoringSpeedSigns                     ; $382e

; HL - table addr
GetTrainLineAndDifficultyRelatedByteFromTable:
; Trainline is a triple-index
	ld   a, [wSelectedTrainLine]                                    ; $3831
	ld   c, a                                                       ; $3834
	add  a                                                          ; $3835
	add  c                                                          ; $3836
	ld   c, a                                                       ; $3837
	ld   b, $00                                                     ; $3838
	add  hl, bc                                                     ; $383a

; Difficulty is an index in those 3 bytes
	ld   a, [wDifficultyLevel]                                      ; $383b
	ld   c, a                                                       ; $383e
	add  hl, bc                                                     ; $383f

; Get its value in B
	ld   b, [hl]                                                    ; $3840
	pop  af                                                         ; $3841
	call SetRomBank1stHalfOfRom                                     ; $3842
	ret                                                             ; $3845


; E - value we oversped custom speed limit by
GetTrainLineDifficultyPenaltyDeductionForOverSpeedingACustomLimit::
; Preserve and set table's rom bank
	ld   a, [wRomBank]                                              ; $3846
	push af                                                         ; $3849
	ld   a, BANK(PenaltyDeductionsForOverSpeedingACustomLimit)      ; $384a
	call SetRomBank1stHalfOfRom                                     ; $384c

; Trainline is a triple idx into the table
	ld   a, [wSelectedTrainLine]                                    ; $384f
	ld   c, a                                                       ; $3852
	add  a                                                          ; $3853
	add  c                                                          ; $3854
	ld   c, a                                                       ; $3855
	ld   b, $00                                                     ; $3856
	ld   hl, PenaltyDeductionsForOverSpeedingACustomLimit           ; $3858
	add  hl, bc                                                     ; $385b

; Further offset with the difficulty
	ld   a, [wDifficultyLevel]                                      ; $385c
	ld   c, a                                                       ; $385f
	add  hl, bc                                                     ; $3860

; Branch if table value has bit 7 set
	ld   a, [hl]                                                    ; $3861
	bit  7, a                                                       ; $3862
	jr   nz, .bit7set                                               ; $3864

; Bit 7 not set, use table value if less than E (table value is a cap)
	cp   e                                                          ; $3866
	jr   nc, .cont                                                  ; $3867

	ld   e, a                                                       ; $3869
	jr   .cont                                                      ; $386a

.bit7set:
; Bit 7 set, use table value if >= E (table value is a minimum)
	and  $7f                                                        ; $386c
	cp   e                                                          ; $386e
	jr   c, .cont                                                   ; $386f

	ld   e, a                                                       ; $3871
	jr   .cont                                                      ; $3872

.cont:
; Either way, E (the value to remove from allowable penalties) is a max of 25
	ld   a, e                                                       ; $3874
	cp   25                                                         ; $3875
	jr   c, .done                                                   ; $3877

	ld   e, 25                                                      ; $3879

.done:
	pop  af                                                         ; $387b
	call SetRomBank1stHalfOfRom                                     ; $387c
	ret                                                             ; $387f
