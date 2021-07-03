INCLUDE "includes.s"

SECTION "ROM Bank $006", ROMX[$4000], BANK[$6]

PreInGameGraphicScript::
; Load tile map
	SCR_ExecAsmBelow
	ld   de, _SCRN0                                                 ; $4001
	ld   a, $00                                                     ; $4004
	ldh  [rVBK], a                                                  ; $4006
	ldbc $13, SCREEN_TILE_WIDTH                                     ; $4008
	ld   hl, TileMap_PreInGameGraphics                              ; $400b
	ld   a, BANK(TileMap_PreInGameGraphics)                         ; $400e
	call FarRectCopyRowPerFrame                                     ; $4010

; Load tile attr after map source
	ld   de, _SCRN0                                                 ; $4013
	ld   a, $01                                                     ; $4016
	ldh  [rVBK], a                                                  ; $4018
	ldbc $13, SCREEN_TILE_WIDTH                                     ; $401a
	ld   a, BANK(TileAttr_PreInGameGraphics)                        ; $401d
	call FarRectCopyRowPerFrame                                     ; $401f

; HL = triple index into table
	ld   a, [wSelectedTrainLine]                                    ; $4022
	ld   c, a                                                       ; $4025
	add  a                                                          ; $4026
	add  c                                                          ; $4027
	ld   c, a                                                       ; $4028
	ld   b, $00                                                     ; $4029
	ld   hl, PreInGameGraphicTileDataSources                        ; $402b
	add  hl, bc                                                     ; $402e

; Get B, then HL from table entry (tile data src for image)
	ld   a, [hl+]                                                   ; $402f
	ld   b, a                                                       ; $4030
	ld   a, [hl+]                                                   ; $4031
	ld   h, [hl]                                                    ; $4032
	ld   l, a                                                       ; $4033
	ld   a, b                                                       ; $4034
	call HDMATransferPreInGameGraphicTileData                       ; $4035

; Display train name
	ld   hl, TrainIdxToTrainImageNameIdxes                          ; $4038
	ld   a, [wSelectedTrainLine]                                    ; $403b
	ld   c, a                                                       ; $403e
	ld   b, $00                                                     ; $403f
	add  hl, bc                                                     ; $4041
	ld   a, [hl]                                                    ; $4042
	call DisplayTrainImageName                                      ; $4043

; Start with darkest palettes, play sound, then start hi-col flow
	call ProcessScriptsFromCurrLoc                                  ; $4046
	SCR_StoreByteInAddr wPreInGameGraphicHiColIdxForFade, $03
	SCR_ResumeNextFrame
	SCR_PlaySound MUS_0c
	SCR_Delay $28
	SCR_StoreByteInAddr wShouldUpdateHiColBGPalettes, $01
	SCR_StartSubScript1 PreInGameGraphicSubScript1_FadeIn
	SCR_Delay $0a

; Main loop
	SCR_SetCounter1 $8c
:	SCR_ExecAsmBelow

; Early exit if A or Start pressed
	ld   a, [wButtonsPressed]                                       ; $405f
	bit  PADB_A, a                                                  ; $4062
	ld   de, PreInGameGraphicPressedConfirm                         ; $4064
	jp   nz, ProcessScriptsFromDE                                   ; $4067

	bit  PADB_START, a                                              ; $406a
	ld   de, PreInGameGraphicPressedConfirm                         ; $406c
	jp   nz, ProcessScriptsFromDE                                   ; $406f

; Otherwise exit after counter reaches 0
	call ProcessScriptsFromCurrLoc                                  ; $4072
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-

PreInGameGraphicPressedConfirm:
	SCR_StartSubScript1 PreInGameGraphicSubScript1_GoToNextState
:	SCR_ResumeNextFrame
	SCR_Jump :-


PreInGameGraphicSubScript1_FadeIn:
; Over time, move idx to actual palettes
	SCR_Delay $03
	SCR_StoreByteInAddr wPreInGameGraphicHiColIdxForFade, $02
	SCR_Delay $03
	SCR_StoreByteInAddr wPreInGameGraphicHiColIdxForFade, $01
	SCR_Delay $03
	SCR_StoreByteInAddr wPreInGameGraphicHiColIdxForFade, $00
	SCR_StopSubScript1
	SCR_ResumeNextFrame


PreInGameGraphicSubScript1_GoToNextState:
; Fade out over time
	SCR_StoreByteInAddr wPreInGameGraphicHiColIdxForFade, $01
	SCR_Delay $06
	SCR_StoreByteInAddr wPreInGameGraphicHiColIdxForFade, $02
	SCR_Delay $06
	SCR_StoreByteInAddr wPreInGameGraphicHiColIdxForFade, $03
	SCR_Delay $06
	SCR_StoreByteInAddr wShouldUpdateHiColBGPalettes, $00
	SCR_Delay $06
	SCR_Delay $1e

; Mute sound, and go to next state
	SCR_PlaySound MUS_NULL
	SCR_StoreByteInAddr wGameState, GS_DEPARTURE_INFO_SCREEN_INIT
	SCR_StopCurrScript


; C - 0-3 (fade idx)
GetPreInGameGraphicHiColPaletteSrces::
; HL is double index into table
	ld   b, $00                                                     ; $40b6
	ld   hl, PreInGameGraphicHiColPaletteSrces                      ; $40b8
	add  hl, bc                                                     ; $40bb
	add  hl, bc                                                     ; $40bc

; Get HL in table addresses
	ld   a, [hl+]                                                   ; $40bd
	ld   h, [hl]                                                    ; $40be
	ld   l, a                                                       ; $40bf

; HL += train line idx * 3
	ld   a, [wSelectedTrainLine]                                    ; $40c0
	ld   b, a                                                       ; $40c3
	add  a                                                          ; $40c4
	add  b                                                          ; $40c5
	ld   c, a                                                       ; $40c6
	ld   b, $00                                                     ; $40c7
	add  hl, bc                                                     ; $40c9

; Set hi col palette src
	ld   a, [hl+]                                                   ; $40ca
	ld   [wPreInGameGraphicHiColPalettesBank], a                    ; $40cb
	ld   a, [hl+]                                                   ; $40ce
	ld   [wPreInGameGraphicHiColPalettesAddr], a                    ; $40cf
	ld   a, [hl]                                                    ; $40d2
	ld   [wPreInGameGraphicHiColPalettesAddr+1], a                  ; $40d3
	ret                                                             ; $40d6


TrainIdxToTrainImageNameIdxes:
	db $44, $0a, $18, $44, $0a
	db $33, $0d, $3f, $1d, $40


PreInGameGraphicTileDataSources:
	PreInGameSrc Gfx_TrainImage_87, 1
	PreInGameSrc Gfx_TrainImage_74, 0
	PreInGameSrc Gfx_TrainImage_78, 2
	PreInGameSrc Gfx_TrainImage_87, 1
	PreInGameSrc Gfx_TrainImage_74, 0
	PreInGameSrc Gfx_TrainImage_81, 2
	PreInGameSrc Gfx_TrainImage_75, 0
	PreInGameSrc Gfx_TrainImage_85, 2
	PreInGameSrc Gfx_TrainImage_7a, 1
	PreInGameSrc Gfx_TrainImage_86, 0


PreInGameGraphicHiColPaletteSrces:
	dw .fadeIdx0
	dw .fadeIdx1
	dw .fadeIdx2
	dw .fadeIdx3

.fadeIdx0:
	FarSrc HiColPalettes_Train_43
	FarSrc HiColPalettes_Train_09
	FarSrc HiColPalettes_Train_17
	FarSrc HiColPalettes_Train_43
	FarSrc HiColPalettes_Train_09
	FarSrc HiColPalettes_Train_32
	FarSrc HiColPalettes_Train_0c
	FarSrc HiColPalettes_Train_3e
	FarSrc HiColPalettes_Train_1c
	FarSrc HiColPalettes_Train_3f

.fadeIdx1:
	FarSrc HiColPalettesFade1_Train_43
	FarSrc HiColPalettesFade1_Train_09
	FarSrc HiColPalettesFade1_Train_17
	FarSrc HiColPalettesFade1_Train_43
	FarSrc HiColPalettesFade1_Train_09
	FarSrc HiColPalettesFade1_Train_32
	FarSrc HiColPalettesFade1_Train_0c
	FarSrc HiColPalettesFade1_Train_3e
	FarSrc HiColPalettesFade1_Train_1c
	FarSrc HiColPalettesFade1_Train_3f

.fadeIdx2:
	FarSrc HiColPalettesFade2_Train_43
	FarSrc HiColPalettesFade2_Train_09
	FarSrc HiColPalettesFade2_Train_17
	FarSrc HiColPalettesFade2_Train_43
	FarSrc HiColPalettesFade2_Train_09
	FarSrc HiColPalettesFade2_Train_32
	FarSrc HiColPalettesFade2_Train_0c
	FarSrc HiColPalettesFade2_Train_3e
	FarSrc HiColPalettesFade2_Train_1c
	FarSrc HiColPalettesFade2_Train_3f

.fadeIdx3:
	FarSrc HiColPalettesFade3_Train_43
	FarSrc HiColPalettesFade3_Train_09
	FarSrc HiColPalettesFade3_Train_17
	FarSrc HiColPalettesFade3_Train_43
	FarSrc HiColPalettesFade3_Train_09
	FarSrc HiColPalettesFade3_Train_32
	FarSrc HiColPalettesFade3_Train_0c
	FarSrc HiColPalettesFade3_Train_3e
	FarSrc HiColPalettesFade3_Train_1c
	FarSrc HiColPalettesFade3_Train_3f

	
UnusedFunc_006_417f:
; Set attrs
	ld   a, $01                                                     ; $417f
	ldh  [rVBK], a                                                  ; $4181
	ld   hl, _SCRN0                                                 ; $4183
	ld   de, GB_TILE_WIDTH-SCREEN_TILE_WIDTH                        ; $4186

; For 16 rows, set palettes from 0 to 7, changing bank for row $0d
	ldbc $10, $0d                                                   ; $4189
	dec  a                                                          ; $418c

.loopB:
	ld   [hl+], a                                                   ; $418d
	ld   [hl+], a                                                   ; $418e
	ld   [hl+], a                                                   ; $418f
	inc  a                                                          ; $4190
	ld   [hl+], a                                                   ; $4191
	ld   [hl+], a                                                   ; $4192
	inc  a                                                          ; $4193
	ld   [hl+], a                                                   ; $4194
	ld   [hl+], a                                                   ; $4195
	ld   [hl+], a                                                   ; $4196
	inc  a                                                          ; $4197
	ld   [hl+], a                                                   ; $4198
	ld   [hl+], a                                                   ; $4199
	inc  a                                                          ; $419a
	ld   [hl+], a                                                   ; $419b
	ld   [hl+], a                                                   ; $419c
	ld   [hl+], a                                                   ; $419d
	inc  a                                                          ; $419e
	ld   [hl+], a                                                   ; $419f
	ld   [hl+], a                                                   ; $41a0
	inc  a                                                          ; $41a1
	ld   [hl+], a                                                   ; $41a2
	dec  c                                                          ; $41a3
	jr   nz, :+                                                     ; $41a4
	add  $08                                                        ; $41a6
:	ld   [hl+], a                                                   ; $41a8
	ld   [hl+], a                                                   ; $41a9
	inc  a                                                          ; $41aa
	ld   [hl+], a                                                   ; $41ab
	ld   [hl+], a                                                   ; $41ac
	sub  $07                                                        ; $41ad
	add  hl, de                                                     ; $41af
	dec  b                                                          ; $41b0
	jr   nz, .loopB                                                 ; $41b1

; Clear tile map for 16 rows
	ld   a, $00                                                     ; $41b3
	ldh  [rVBK], a                                                  ; $41b5
	ld   a, $80                                                     ; $41b7
	ld   hl, _SCRN0                                                 ; $41b9
	ld   c, $10                                                     ; $41bc

.loopRow:
	ld   b, SCREEN_TILE_WIDTH                                       ; $41be

.loopCol:
	ld   [hl+], a                                                   ; $41c0
	inc  a                                                          ; $41c1
	dec  b                                                          ; $41c2
	jr   nz, .loopCol                                               ; $41c3

	add  hl, de                                                     ; $41c5
	dec  c                                                          ; $41c6
	jr   nz, .loopRow                                               ; $41c7

	ret                                                             ; $41c9


InGameScript2_InitAndHandlePause::
; Set that we can update tile data in vblank, and set vblank func
	SCR_ResumeNextFrame
	SCR_StoreByteInAddr wShouldUpdateInGameSceneryTileData, $01
	SCR_StoreWordInAddr wVBlankInterruptFunc, VBlankInterruptFunc_InGame

; Set BG and OBJ palettes - fading in from black
	SCR_Delay $06
	SCR_ExecAsmBelow
	ld   b, BANK(BGPalettes_InGame)                                 ; $41d7
	ld   hl, BGPalettes_InGame                                      ; $41d9
	call SetBGPaletteSrc                                            ; $41dc
	ld   a, $20                                                     ; $41df
	ld   [wPaletteFadeAmount], a                                    ; $41e1
	ld   a, $01                                                     ; $41e4
	ld   [wLoadPalettesFromRam], a                                  ; $41e6

	ld   b, BANK(OBJPalettes_InGame)                                ; $41e9
	ld   hl, OBJPalettes_InGame                                     ; $41eb
	call SetOBJPaletteSrc                                           ; $41ee
	ld   a, $20                                                     ; $41f1
	ld   [wPaletteFadeAmount], a                                    ; $41f3
	ld   a, $01                                                     ; $41f6
	ld   [wLoadPalettesFromRam], a                                  ; $41f8

; Set lcdc interrupt func for sky color changes
	di                                                              ; $41fb
	ld   a, LOW(LCDCInterruptFunc_InGame)                           ; $41fc
	ld   [wLCDCInterruptFunc], a                                    ; $41fe
	ld   a, HIGH(LCDCInterruptFunc_InGame)                          ; $4201
	ld   [wLCDCInterruptFunc+1], a                                  ; $4203
	ei                                                              ; $4206
	call ProcessScriptsFromCurrLoc                                  ; $4207

; Fade in
	SCR_Call Script_FadeIn
	SCR_StoreByteInAddr wLoadPalettesFromRam, $00
	SCR_Delay $3c

.mainLoop:
; Continue looping if finished in-game
	SCR_ExecAsmBelow
	ld   a, [wFinishedInGame]                                       ; $4214
	or   a                                                          ; $4217
	ld   de, :+                                                     ; $4218
	jp   nz, ProcessScriptsFromDE                                   ; $421b

; Else whenever we press start, jump ahead to handle pause
	ld   a, [wInGameButtonsPressed]                                 ; $421e
	bit  PADB_START, a                                              ; $4221
	ld   de, .startPressed                                          ; $4223
	jp   nz, ProcessScriptsFromDE                                   ; $4226

	call ProcessScriptsFromCurrLoc                                  ; $4229
:	SCR_ResumeNextFrame
	SCR_Jump .mainLoop

.startPressed:
; Set paused, and middle pause selection, and play sound
	SCR_StoreByteInAddr wInGameIsPaused, $01
	SCR_StoreByteInAddr wInGamePauseOptSelected, $01
	SCR_PlaySound SND_08|MAKE_SOUND_EFFECT

.btnLoop:
	SCR_ResumeNextFrame
	SCR_CallWithSingleUseRet Script_UpdateInGamePauseSprite

; Branch depending on button pressed
	SCR_ExecAsmBelow
	ld   a, [wInGameButtonsPressed]                                 ; $423f
	bit  PADB_A, a                                                  ; $4242
	jr   nz, .aOrStartPressed                                       ; $4244

	bit  PADB_B, a                                                  ; $4246
	jr   nz, .bPressed                                              ; $4248

	bit  PADB_START, a                                              ; $424a
	jr   nz, .aOrStartPressed                                       ; $424c

	bit  PADB_UP, a                                                 ; $424e
	jr   nz, .upPressed                                             ; $4250

	bit  PADB_DOWN, a                                               ; $4252
	jp   nz, .downPressed                                           ; $4254

	call ProcessScriptsFromCurrLoc                                  ; $4257
	SCR_Jump .btnLoop

.aOrStartPressed:
; Jump if selected soft-reset option
	ld   a, [wInGamePauseOptSelected]                               ; $425d
	or   a                                                          ; $4260
	jr   z, .selectedReset                                          ; $4261

; Jump if resuming
	cp   $01                                                        ; $4263
	jr   z, .resume                                                 ; $4265

; Jump to restart the location
	jr   .stageRestarting                                           ; $4267

.selectedReset:
; Mute sound
	push af                                                         ; $4269
	lda  MUS_NULL                                                   ; $426a
	call PlaySound                                                  ; $426b
	pop  af                                                         ; $426e

; Disable vblank updates
	di                                                              ; $426f
	ld   a, LOW(StubInterruptFunc)                                  ; $4270
	ld   [wVBlankInterruptFunc], a                                  ; $4272
	ld   a, HIGH(StubInterruptFunc)                                 ; $4275
	ld   [wVBlankInterruptFunc+1], a                                ; $4277
	ei                                                              ; $427a

; Fade out, and set title screen state
	call ProcessScriptsFromCurrLoc                                  ; $427b
	SCR_Call Script_FadeOut
	SCR_ExecAsmBelow
	call IncTitleScreenDemoStepUntilTitleScreenStateSet             ; $4282
	call ProcessScriptsFromCurrLoc                                  ; $4285
	SCR_StopCurrScript

.resume:
; Set not paused, then jump back up to wait for pause button again
	ld   a, $00                                                     ; $4289
	ld   [wInGameIsPaused], a                                       ; $428b
	call ProcessScriptsFromCurrLoc                                  ; $428e
	SCR_UnsetSpriteSrc
	SCR_ResumeNextFrame
	SCR_Jump .mainLoop

.bPressed:
; Don't select any option
	jr   .resume                                                    ; $4296

.stageRestarting:
; Mute sound
	push af                                                         ; $4298
	lda  MUS_NULL                                                   ; $4299
	call PlaySound                                                  ; $429a
	pop  af                                                         ; $429d

; Disable vblank updates
	di                                                              ; $429e
	ld   a, LOW(StubInterruptFunc)                                  ; $429f
	ld   [wVBlankInterruptFunc], a                                  ; $42a1
	ld   a, HIGH(StubInterruptFunc)                                 ; $42a4
	ld   [wVBlankInterruptFunc+1], a                                ; $42a6
	ei                                                              ; $42a9

; Fade out, then go back to departure info screen
	call ProcessScriptsFromCurrLoc                                  ; $42aa
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wGameState, GS_DEPARTURE_INFO_SCREEN_INIT
	SCR_StopCurrScript

.upPressed:
; Ignore if at index 0
	ld   a, [wInGamePauseOptSelected]                               ; $42b5
	or   a                                                          ; $42b8
	ld   de, .btnLoop                                               ; $42b9
	jp   z, ProcessScriptsFromDE                                    ; $42bc

; Play sound
	push af                                                         ; $42bf
	ld   a, SND_06                                                  ; $42c0
	or   MAKE_SOUND_EFFECT                                          ; $42c2
	call PlaySound                                                  ; $42c4
	pop  af                                                         ; $42c7

; Dec option to go up, then loop for more inputs
	ld   a, [wInGamePauseOptSelected]                               ; $42c8
	dec  a                                                          ; $42cb
	ld   [wInGamePauseOptSelected], a                               ; $42cc

	ld   de, .btnLoop                                               ; $42cf
	jp   ProcessScriptsFromDE                                       ; $42d2

.downPressed:
; Ignore if at index 2
	ld   a, [wInGamePauseOptSelected]                               ; $42d5
	cp   $02                                                        ; $42d8
	ld   de, .btnLoop                                               ; $42da
	jp   z, ProcessScriptsFromDE                                    ; $42dd

; Play sound
	push af                                                         ; $42e0
	ld   a, SND_06                                                  ; $42e1
	or   MAKE_SOUND_EFFECT                                          ; $42e3
	call PlaySound                                                  ; $42e5

; Inc option to go down, then loop for more inputs
	pop  af                                                         ; $42e8
	ld   a, [wInGamePauseOptSelected]                               ; $42e9
	inc  a                                                          ; $42ec
	ld   [wInGamePauseOptSelected], a                               ; $42ed

	ld   de, .btnLoop                                               ; $42f0
	jp   ProcessScriptsFromDE                                       ; $42f3


Script_UpdateInGamePauseSprite:
	SCR_SetSpriteXY $38, $30

; Options in order are Reset, Cancel, Restart
	SCR_ExecAsmBelow
	ld   a, [wInGamePauseOptSelected]                               ; $42fa
	or   a                                                          ; $42fd
	ld   de, .setResetSprite                                        ; $42fe
	jp   z, ProcessScriptsFromDE                                    ; $4301

	cp   $01                                                        ; $4304
	ld   de, .setCancelSprite                                       ; $4306
	jp   z, ProcessScriptsFromDE                                    ; $4309

	ld   de, .setRestartSprite                                      ; $430c
	jp   ProcessScriptsFromDE                                       ; $430f

.setResetSprite:
	SCR_FarSetSpriteSrc SpriteOam_PauseAndResetSelected
	SCR_SingleUseRet

.setCancelSprite:
	SCR_FarSetSpriteSrc SpriteOam_PauseAndCancelSelected
	SCR_SingleUseRet

.setRestartSprite:
	SCR_FarSetSpriteSrc SpriteOam_PauseAndRestartSelected
	SCR_SingleUseRet


SpriteOam_PauseAndResetSelected:
	db $06
	db $18, $0c, $b2, $0a
	db $18, $14, $b4, $0a
	db $18, $1c, $b6, $0a
	db $18, $24, $b8, $0a
	db $18, $2c, $ba, $0a
	db $4e, $30, $d4, $09


SpriteOam_PauseAndCancelSelected:
	db $06
	db $18, $0c, $b2, $0a
	db $18, $14, $b4, $0a
	db $18, $1c, $b6, $0a
	db $18, $24, $b8, $0a
	db $18, $2c, $ba, $0a
	db $58, $30, $d4, $09


SpriteOam_PauseAndRestartSelected:
	db $06
	db $18, $0c, $b2, $0a
	db $18, $14, $b4, $0a
	db $18, $1c, $b6, $0a
	db $18, $24, $b8, $0a
	db $18, $2c, $ba, $0a
	db $62, $30, $d4, $09


InGameScript3_HandleDemo::
; Stop if not demo
	SCR_ExecAsmBelow
	ld   a, [wIsDemo]                                               ; $436d
	or   a                                                          ; $4370
	ld   de, .isDemo                                                ; $4371
	jp   nz, ProcessScriptsFromDE                                   ; $4374

	call ProcessScriptsFromCurrLoc                                  ; $4377
	SCR_StopCurrScript

.isDemo:
; Set subscripts to end demo, and flash start prompt, then do useless jump
	SCR_StartSubScript1 DemoScript_HandleDemoEnding
	SCR_StartSubScript2 DemoScript_FlashPushStart
	SCR_CallTableIdxInAddr :+, wIsDemo
:	dw .cont
	dw .cont

.cont:
; Loop waiting for signal to be on
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wInGameEventIdx1]                                      ; $438e
	cp   EVENT_START_SIGNAL_ON                                      ; $4391
	ld   de, :-                                                     ; $4393
	jp   nz, ProcessScriptsFromDE                                   ; $4396

; 9 times, decrease brake to its minimum
	call ProcessScriptsFromCurrLoc                                  ; $4399
	SCR_Delay $1e
	SCR_SetCounter1 $09
:	SCR_ValInAddrPlusEquByte wBrakeAppliedIdx, -1
	SCR_StoreByteInAddr wShouldUpdateBrakeLeverTileData, $01
	SCR_Delay $0a
	SCR_DecCounter1_JNE :-

; 5 times, increase acceleration to max
	SCR_SetCounter1 $05
:	SCR_ValInAddrPlusEquByte wAccelerationIdx, $01
	SCR_StoreByteInAddr wShouldUpdateAccelLeverTileData, $01
	SCR_Delay $0a
	SCR_DecCounter1_JNE :-

; Loop until speed is 60km/h
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wInGameCurrSpeed]                                      ; $43be
	cp   60                                                         ; $43c1
	ld   de, .highEnoughSpeed                                       ; $43c3
	jp   nc, ProcessScriptsFromDE                                   ; $43c6

	ld   de, :-                                                     ; $43c9
	jp   ProcessScriptsFromDE                                       ; $43cc

.highEnoughSpeed:
; Decrease acceleration so its unset
	SCR_SetCounter1 $05
:	SCR_ValInAddrPlusEquByte wAccelerationIdx, -1
	SCR_StoreByteInAddr wShouldUpdateAccelLeverTileData, $01
	SCR_Delay $0a
	SCR_DecCounter1_JNE :-

; Stay coasting in this state
:	SCR_ResumeNextFrame
	SCR_Jump :-


DemoScript_HandleDemoEnding:
.loop:
; End when Start pressed
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $43e3
	bit  PADB_START, a                                              ; $43e6
	jr   nz, .startPressed                                          ; $43e8

; Dec frame counter every frame, end when it's = 0
	ld   a, [wDemoFrameCounter]                                     ; $43ea
	ld   l, a                                                       ; $43ed
	ld   a, [wDemoFrameCounter+1]                                   ; $43ee
	ld   h, a                                                       ; $43f1
	or   l                                                          ; $43f2
	jr   z, .endOfDemo                                              ; $43f3

	dec  hl                                                         ; $43f5
	ld   a, l                                                       ; $43f6
	ld   [wDemoFrameCounter], a                                     ; $43f7
	ld   a, h                                                       ; $43fa
	ld   [wDemoFrameCounter+1], a                                   ; $43fb

	call ProcessScriptsFromCurrLoc                                  ; $43fe
	SCR_ResumeNextFrame
	SCR_Jump .loop

.endOfDemo:
; Don't display vblank updates
	di                                                              ; $4405
	ld   a, LOW(StubInterruptFunc)                                  ; $4406
	ld   [wVBlankInterruptFunc], a                                  ; $4408
	ld   a, HIGH(StubInterruptFunc)                                 ; $440b
	ld   [wVBlankInterruptFunc+1], a                                ; $440d
	ei                                                              ; $4410

; Fade out
	call ProcessScriptsFromCurrLoc                                  ; $4411
	SCR_Call Script_FadeOut
	SCR_ExecAsmBelow

; Set not demo and go to next demo-related state
	xor  a                                                          ; $4418
	ld   [wIsDemo], a                                               ; $4419
	call SetGameStateAndInGameDetailsBasedOnTitleScreenDemoStepIdx  ; $441c
	call ProcessScriptsFromCurrLoc                                  ; $441f
	SCR_StopCurrScript

.startPressed:
; Don't display vblank updates
	di                                                              ; $4423
	ld   a, LOW(StubInterruptFunc)                                  ; $4424
	ld   [wVBlankInterruptFunc], a                                  ; $4426
	ld   a, HIGH(StubInterruptFunc)                                 ; $4429
	ld   [wVBlankInterruptFunc+1], a                                ; $442b
	ei                                                              ; $442e
	call ProcessScriptsFromCurrLoc                                  ; $442f

; Fade out and stop scripts/sprites
	SCR_StopSubScript2
	SCR_UnsetSpriteSrc
	SCR_Call Script_FadeOut
	SCR_ExecAsmBelow

; Set not demo and go to next demo-related state
	xor  a                                                          ; $4438
	ld   [wIsDemo], a                                               ; $4439
	call IncTitleScreenDemoStepUntilTitleScreenStateSet             ; $443c
	call ProcessScriptsFromCurrLoc                                  ; $443f
	SCR_StopCurrScript


DemoScript_FlashPushStart:
:	SCR_SetSpriteXY $38, $38
	SCR_FarSetSpriteSrc SpriteOam_DemoPushStart
	SCR_Delay $32
	SCR_UnsetSpriteSrc
	SCR_Delay $14
	SCR_Jump :-


DepartureInfoScreenScript::
; Move info box in first
	SCR_StoreByteInAddr wDepartureInfoScrolledIn, $00
	SCR_Call DepartureInfoScript_MoveInfoBoxIn

; Main loop - wait until counter = 0, or A/Start pressed
	SCR_SetCounter1 $fa
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $445d
	bit  PADB_A, a                                                  ; $4460
	ld   de, .toNextState                                           ; $4462
	jp   nz, ProcessScriptsFromDE                                   ; $4465

	bit  PADB_START, a                                              ; $4468
	ld   de, .toNextState                                           ; $446a
	jp   nz, ProcessScriptsFromDE                                   ; $446d

	call ProcessScriptsFromCurrLoc                                  ; $4470
	SCR_DecCounter1_JNE :-

; Counter reached 0, move info box out, fade out to black
	SCR_Call DepartureInfoScript_MoveInfoBoxOut
	SCR_Call DepartureInfoScript_FadeToBlack

; Stop shutters, then go to next state
	SCR_StopOtherScript 1
	SCR_StopOtherScript 2
	SCR_StopOtherScript 3
	SCR_StopOtherScript 4
	SCR_StoreByteInAddr wGameState, GS_ROUTE_DISPLAY_INIT
	SCR_StopCurrScript
	
.toNextState:
; Fade out, stop sprite scripts, and go to next state
	SCR_Call Script_FadeOut
	SCR_StopOtherScript 1
	SCR_StopOtherScript 2
	SCR_StopOtherScript 3
	SCR_StopOtherScript 4
	SCR_StoreByteInAddr wGameState, GS_ROUTE_DISPLAY_INIT
	SCR_StopCurrScript


OtherScript1_DepartureInfoTopLeftBox:
; Set sprite details, adjust with scroll, and wait until scrolled in
	SCR_SetSpriteXY $1c, $34
	SCR_StartSubScript1 OtherScriptCommon_DepartureInfoInfAdjustShutterPosition
	SCR_Call OtherScriptCommon_WaitUntilViewScrolledIn

; Animate, stopping 1st
	SCR_SetCounter1 $06
:	SCR_CallWithSingleUseRet AnimateDepartureInfoShutter
	SCR_DecCounter1_JNE :-

; Infinite loop - display final look
	SCR_ExecAsmBelow
	ld   b, $00                                                     ; $44ac
	call UpdateShuttersFinalSpriteAddr                              ; $44ae
	call ProcessScriptsFromCurrLoc                                  ; $44b1
:	SCR_ResumeNextFrame
	SCR_Jump :-


OtherScript2_DepartureInfoTopRightBox:
; Set sprite details, adjust with scroll, and wait until scrolled in
	SCR_SetSpriteXY $63, $34
	SCR_StartSubScript1 OtherScriptCommon_DepartureInfoInfAdjustShutterPosition
	SCR_Call OtherScriptCommon_WaitUntilViewScrolledIn

; Animate, stopping 2nd
	SCR_SetCounter1 $09
:	SCR_CallWithSingleUseRet AnimateDepartureInfoShutter
	SCR_DecCounter1_JNE :-

; Infinite loop - display final look
	SCR_ExecAsmBelow
	ld   b, $01                                                     ; $44cb
	call UpdateShuttersFinalSpriteAddr                              ; $44cd
	call ProcessScriptsFromCurrLoc                                  ; $44d0
:	SCR_ResumeNextFrame
	SCR_Jump :-


OtherScript3_DepartureInfoBottomLeftBox:
; Set sprite details, adjust with scroll, and wait until scrolled in
	SCR_SetSpriteXY $20, $48
	SCR_StartSubScript1 OtherScriptCommon_DepartureInfoInfAdjustShutterPosition
	SCR_Call OtherScriptCommon_WaitUntilViewScrolledIn

; Animate, stopping 3rd
	SCR_SetCounter1 $0c
:	SCR_CallWithSingleUseRet AnimateDepartureInfoShutter
	SCR_DecCounter1_JNE :-

; Infinite loop - display final look
	SCR_ExecAsmBelow
	ld   b, $02                                                     ; $44ea
	call UpdateShuttersFinalSpriteAddr                              ; $44ec
	call ProcessScriptsFromCurrLoc                                  ; $44ef
:	SCR_ResumeNextFrame
	SCR_Jump :-


OtherScript4_DepartureInfoBottomRightBox:
; Set sprite details, adjust with scroll, and wait until scrolled in
	SCR_SetSpriteXY $58, $48
	SCR_StartSubScript1 OtherScriptCommon_DepartureInfoInfAdjustShutterPosition
	SCR_Call OtherScriptCommon_WaitUntilViewScrolledIn

; Animate, stopping 4th
	SCR_SetCounter1 $0f
:	SCR_CallWithSingleUseRet AnimateDepartureInfoShutter
	SCR_DecCounter1_JNE :-

; Infinite loop - display final look
	SCR_ExecAsmBelow
	ld   b, $03                                                     ; $4509
	call UpdateShuttersFinalSpriteAddr                              ; $450b
	call ProcessScriptsFromCurrLoc                                  ; $450e
:	SCR_ResumeNextFrame
	SCR_Jump :-


DEF SHUTTER_SPRITE_X = SCRIPT_VAR_1D
OtherScriptCommon_DepartureInfoInfAdjustShutterPosition:
; Save sprite X variable
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $4516
	ld   h, a                                                       ; $4518
	ld   l, SCRIPT_SPRITE_X                                         ; $4519
	ld   a, [hl]                                                    ; $451b
	ld   l, SHUTTER_SPRITE_X                                        ; $451c
	ld   [hl], a                                                    ; $451e
	call ProcessScriptsFromCurrLoc                                  ; $451f

; Infinite loop - original sprite X - SCX = our final script's sprite x
:	SCR_ExecAsmBelow
	ld   a, [wSCX]                                                  ; $4523
	ld   b, a                                                       ; $4526
	ldh  a, [hCurrScriptStructHighByte]                             ; $4527
	ld   h, a                                                       ; $4529
	ld   l, SHUTTER_SPRITE_X                                        ; $452a
	ld   a, [hl]                                                    ; $452c
	sub  b                                                          ; $452d
	ld   l, SCRIPT_SPRITE_X                                         ; $452e
	ld   [hl], a                                                    ; $4530
	call ProcessScriptsFromCurrLoc                                  ; $4531
	SCR_ResumeNextFrame
	SCR_Jump :-


DepartureInfoScript_FadeToBlack:
	SCR_StoreByteInAddr wLoadPalettesFromRam, $01

	SCR_ExecAsmBelow
	ld   a, $08                                                     ; $453d
	ld   [wPaletteFadeAmount], a                                    ; $453f
	ld   a, $01                                                     ; $4542
	ld   [wLoadPalettesFromRam], a                                  ; $4544
	call ProcessScriptsFromCurrLoc                                  ; $4547
	SCR_ResumeNextFrame

	SCR_ExecAsmBelow
	ld   a, $10                                                     ; $454c
	ld   [wPaletteFadeAmount], a                                    ; $454e
	ld   a, $01                                                     ; $4551
	ld   [wLoadPalettesFromRam], a                                  ; $4553
	call ProcessScriptsFromCurrLoc                                  ; $4556
	SCR_ResumeNextFrame

	SCR_ExecAsmBelow
	ld   a, $18                                                     ; $455b
	ld   [wPaletteFadeAmount], a                                    ; $455d
	ld   a, $01                                                     ; $4560
	ld   [wLoadPalettesFromRam], a                                  ; $4562
	call ProcessScriptsFromCurrLoc                                  ; $4565
	SCR_ResumeNextFrame

	SCR_ExecAsmBelow
	ld   a, $20                                                     ; $456a
	ld   [wPaletteFadeAmount], a                                    ; $456c
	ld   a, $01                                                     ; $456f
	ld   [wLoadPalettesFromRam], a                                  ; $4571
	call ProcessScriptsFromCurrLoc                                  ; $4574
	SCR_ResumeNextFrame
	SCR_Ret


OtherScriptCommon_WaitUntilViewScrolledIn:
; Default closed shutter sprite, until the view is scrolled in
	SCR_FarSetSpriteSrc SpriteOam_DepartureInfoShutter0
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wDepartureInfoScrolledIn]                              ; $457f
	or   a                                                          ; $4582
	ld   de, :-                                                     ; $4583
	jp   z, ProcessScriptsFromDE                                    ; $4586

	call ProcessScriptsFromCurrLoc                                  ; $4589
	SCR_Ret
	
	
AnimateDepartureInfoShutter:
; Play shutter sound effect while animating
	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT
	SCR_FarSetSpriteSrc SpriteOam_DepartureInfoShutter0
	SCR_Delay $03
	SCR_FarSetSpriteSrc SpriteOam_DepartureInfoShutter1
	SCR_Delay $02

	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT
	SCR_FarSetSpriteSrc SpriteOam_DepartureInfoShutter2
	SCR_Delay $02
	SCR_FarSetSpriteSrc SpriteOam_DepartureInfoShutter3
	SCR_Delay $02
	SCR_SingleUseRet


; B - shutter idx
UpdateShuttersFinalSpriteAddr:
; Get quadruple idx
	ld   a, [wSelectedTrainLine]                                    ; $45aa
	add  a                                                          ; $45ad
	add  a                                                          ; $45ae

; HL points to 1 of the 4 shutter addresses based on param idx
	add  b                                                          ; $45af
	add  a                                                          ; $45b0
	ld   e, a                                                       ; $45b1
	ld   d, $00                                                     ; $45b2
	ld   hl, .shutterFinalSrces                                     ; $45b4
	add  hl, de                                                     ; $45b7

; Copy word into sprite addr
	ldh  a, [hCurrScriptStructHighByte]                             ; $45b8
	ld   d, a                                                       ; $45ba
	ld   e, SCRIPT_SPRITE_ADDR                                      ; $45bb
	ld   a, [hl+]                                                   ; $45bd
	ld   [de], a                                                    ; $45be
	inc  de                                                         ; $45bf
	ld   a, [hl+]                                                   ; $45c0
	ld   [de], a                                                    ; $45c1
	ret                                                             ; $45c2

.shutterFinalSrces:
	dw SpriteOam_DepartureInfoTrainLine0TopLeftBox, SpriteOam_DepartureInfoTrainLine0TopRightBox, \
		SpriteOam_DepartureInfoTrainLine0BottomLeftBox, SpriteOam_DepartureInfoTrainLine0BottomRightBox
	dw SpriteOam_DepartureInfoTrainLine1TopLeftBox, SpriteOam_DepartureInfoTrainLine1TopRightBox, \
		SpriteOam_DepartureInfoTrainLine1BottomLeftBox, SpriteOam_DepartureInfoTrainLine1BottomRightBox
	dw SpriteOam_DepartureInfoTrainLine2TopLeftBox, SpriteOam_DepartureInfoTrainLine2TopRightBox, \
		SpriteOam_DepartureInfoTrainLine2BottomLeftBox, SpriteOam_DepartureInfoTrainLine2BottomRightBox
	dw SpriteOam_DepartureInfoTrainLine3TopLeftBox, SpriteOam_DepartureInfoTrainLine3TopRightBox, \
		SpriteOam_DepartureInfoTrainLine3BottomLeftBox, SpriteOam_DepartureInfoTrainLine3BottomRightBox
	dw SpriteOam_DepartureInfoTrainLine4TopLeftBox, SpriteOam_DepartureInfoTrainLine4TopRightBox, \
		SpriteOam_DepartureInfoTrainLine4BottomLeftBox, SpriteOam_DepartureInfoTrainLine4BottomRightBox
	dw SpriteOam_DepartureInfoTrainLine5TopLeftBox, SpriteOam_DepartureInfoTrainLine5TopRightBox, \
		SpriteOam_DepartureInfoTrainLine5BottomLeftBox, SpriteOam_DepartureInfoTrainLine5BottomRightBox
	dw SpriteOam_DepartureInfoTrainLine6TopLeftBox, SpriteOam_DepartureInfoTrainLine6TopRightBox, \
		SpriteOam_DepartureInfoTrainLine6BottomLeftBox, SpriteOam_DepartureInfoTrainLine6BottomRightBox
	dw SpriteOam_DepartureInfoTrainLine7TopLeftBox, SpriteOam_DepartureInfoTrainLine7TopRightBox, \
		SpriteOam_DepartureInfoTrainLine7BottomLeftBox, SpriteOam_DepartureInfoTrainLine7BottomRightBox
	dw SpriteOam_DepartureInfoTrainLine8TopLeftBox, SpriteOam_DepartureInfoTrainLine8TopRightBox, \
		SpriteOam_DepartureInfoTrainLine8BottomLeftBox, SpriteOam_DepartureInfoTrainLine8BottomRightBox
	dw SpriteOam_DepartureInfoTrainLine9TopLeftBox, SpriteOam_DepartureInfoTrainLine9TopRightBox, \
		SpriteOam_DepartureInfoTrainLine9BottomLeftBox, SpriteOam_DepartureInfoTrainLine9BottomRightBox
; unused - $4613
	dw SpriteOam_DepartureInfoTrainLine10TopLeftBox, SpriteOam_DepartureInfoTrainLine10TopRightBox, \
		SpriteOam_DepartureInfoTrainLine10BottomLeftBox, SpriteOam_DepartureInfoTrainLine10BottomRightBox


DepartureInfoScript_MoveInfoBoxIn:
; Display left boxes first
	SCR_CreateOtherScript 1, OtherScript1_DepartureInfoTopLeftBox
	SCR_CreateOtherScript 3, OtherScript3_DepartureInfoBottomLeftBox

; Wait, then scroll
	SCR_SetCounter1 $0c
:	SCR_ValInAddrPlusEquByte wSCX, $04
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-

; Then create right 2 boxes
	SCR_CreateOtherScript 2, OtherScript2_DepartureInfoTopRightBox
	SCR_CreateOtherScript 4, OtherScript4_DepartureInfoBottomRightBox
	SCR_ExecAsmBelow

; Preserve and set ram buffer wram bank
	ldh  a, [rSVBK]                                                 ; $463a
	and  $03                                                        ; $463c
	push af                                                         ; $463e
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $463f
	ldh  [rSVBK], a                                                 ; $4641

; Update tile map and attrs with box right half
	ld   de, wIntroCutsceneTileMapBuffer+$a                         ; $4643
	ldbc SCREEN_TILE_HEIGHT, $0a                                    ; $4646
	ld   hl, TileMap_DepartureInfoBoxRightHalf                      ; $4649
	ld   a, BANK(TileMap_DepartureInfoBoxRightHalf)                 ; $464c
	call FarRectCopy                                                ; $464e

	ld   de, wIntroCutsceneTileAttrBuffer+$a                        ; $4651
	ld   a, $01                                                     ; $4654
	ldh  [rVBK], a                                                  ; $4656
	ldbc SCREEN_TILE_HEIGHT, $0a                                    ; $4658
	ld   a, BANK(TileAttr_DepartureInfoBoxRightHalf)                ; $465b
	call FarRectCopy                                                ; $465d

; Restore wram bank
	pop  af                                                         ; $4660
	ldh  [rSVBK], a                                                 ; $4661

; Add to SCX over time
	call ProcessScriptsFromCurrLoc                                  ; $4663
	SCR_SetCounter1 $0e
:	SCR_ValInAddrPlusEquByte wSCX, $04
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-

; SCX-based word -= $40, ie every 4 frames, SCX diff -= 1 (slow down over time)
	SCR_StoreWordInAddr wDepartureInfoLeavingSCXinHighByte, $0400
.scrollLoop:
	SCR_ExecAsmBelow
	ld   a, [wDepartureInfoLeavingSCXinHighByte]                    ; $4676
	ld   l, a                                                       ; $4679
	ld   a, [wDepartureInfoLeavingSCXinHighByte+1]                  ; $467a
	ld   h, a                                                       ; $467d
	ld   de, -$40                                                   ; $467e
	add  hl, de                                                     ; $4681
	ld   a, h                                                       ; $4682
	or   a                                                          ; $4683
	jr   nz, :+                                                     ; $4684

; Minimum SCX delta to apply is 1
	ld   hl, $0100                                                  ; $4686
:	ld   a, l                                                       ; $4689
	ld   [wDepartureInfoLeavingSCXinHighByte], a                    ; $468a
	ld   a, h                                                       ; $468d
	ld   [wDepartureInfoLeavingSCXinHighByte+1], a                  ; $468e

; Add to SCX
	ld   a, [wSCX]                                                  ; $4691
	add  h                                                          ; $4694
	ld   [wSCX], a                                                  ; $4695
	jr   c, .done                                                   ; $4698

	call ProcessScriptsFromCurrLoc                                  ; $469a
	SCR_ResumeNextFrame
	SCR_Jump .scrollLoop

.done:
; Set that we scrolled the box in
	ld   a, $00                                                     ; $46a1
	ld   [wSCX], a                                                  ; $46a3
	ld   a, $01                                                     ; $46a6
	ld   [wDepartureInfoScrolledIn], a                              ; $46a8
	call ProcessScriptsFromCurrLoc                                  ; $46ab
	SCR_Ret
	
	
DepartureInfoScript_MoveInfoBoxOut:
; SCX += 1 at the start
	SCR_StoreWordInAddr wDepartureInfoLeavingSCXinHighByte, $0100

.loop:
; Get HL
	SCR_ExecAsmBelow
	ld   a, [wDepartureInfoLeavingSCXinHighByte]                    ; $46b5
	ld   l, a                                                       ; $46b8
	ld   a, [wDepartureInfoLeavingSCXinHighByte+1]                  ; $46b9
	ld   h, a                                                       ; $46bc

; HL += $40 (every 4 loops SCX += an additional), with a max of $400
	ld   de, $0040                                                  ; $46bd
	add  hl, de                                                     ; $46c0
	ld   a, h                                                       ; $46c1
	cp   $04                                                        ; $46c2
	jr   c, :+                                                      ; $46c4
	ld   hl, $0400                                                  ; $46c6

; Store it back in ram
:	ld   a, l                                                       ; $46c9
	ld   [wDepartureInfoLeavingSCXinHighByte], a                    ; $46ca
	ld   a, h                                                       ; $46cd
	ld   [wDepartureInfoLeavingSCXinHighByte+1], a                  ; $46ce

; SCX += a max of 4
	ld   a, [wSCX]                                                  ; $46d1
	add  h                                                          ; $46d4
	ld   [wSCX], a                                                  ; $46d5
	cp   $60                                                        ; $46d8
	jr   nc, .movedOffLeft                                          ; $46da

	call ProcessScriptsFromCurrLoc                                  ; $46dc
	SCR_ResumeNextFrame
	SCR_Jump .loop

.movedOffLeft:
; Preserve and set ram buffer wram bank
	ldh  a, [rSVBK]                                                 ; $46e3
	and  $03                                                        ; $46e5
	push af                                                         ; $46e7
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $46e8
	ldh  [rSVBK], a                                                 ; $46ea

; Clear departure info box
	ld   de, wIntroCutsceneTileMapBuffer                            ; $46ec
	ldbc SCREEN_TILE_HEIGHT, $0a                                    ; $46ef
	ld   hl, TileMap_ClearedDepartureInfoBox                        ; $46f2
	ld   a, BANK(TileMap_ClearedDepartureInfoBox)                   ; $46f5
	call FarRectCopy                                                ; $46f7

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $46fa
	ld   a, $01                                                     ; $46fd
	ldh  [rVBK], a                                                  ; $46ff
	ldbc SCREEN_TILE_HEIGHT, $0a                                    ; $4701
	ld   a, BANK(TileAttr_ClearedDepartureInfoBox)                  ; $4704
	call FarRectCopy                                                ; $4706

; Restore wram bank and hide left box sprites
	pop  af                                                         ; $4709
	ldh  [rSVBK], a                                                 ; $470a
	call ProcessScriptsFromCurrLoc                                  ; $470c
	SCR_UnsetOtherSpriteSpec 1
	SCR_UnsetOtherSpriteSpec 3

.scrollLoop:
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow

; Add 4 to SCX, returning when at $a0
	ld   a, [wSCX]                                                  ; $4715
	add  $04                                                        ; $4718
	cp   $a0                                                        ; $471a
	jr   nc, .end                                                   ; $471c

	ld   [wSCX], a                                                  ; $471e
	ld   de, .scrollLoop                                            ; $4721
	jp   ProcessScriptsFromDE                                       ; $4724

.end:
	ld   a, $a0                                                     ; $4727
	ld   [wSCX], a                                                  ; $4729
	call ProcessScriptsFromCurrLoc                                  ; $472c
	SCR_Ret
	
	
RouteDisplayScript::
; Show star and green arrow sprites, and keep window+scroll working together
	SCR_CreateOtherScript 1, RouteDisplayOtherScript1_CompletionStar
	SCR_StartSubScript1 RouteDisplayScriptSubScript1_GreenArrow
	SCR_StartSubScript2 RouteDisplayScriptSubScript2_AdjustWXForBottomScrollingBox
	
; Initial scx based on curr location in train line
	SCR_ExecAsmBelow
	call GetRouteDisplaySCXForLocationInTrainLine                   ; $473e

; Load BG + OBJ palettes - to fade in from black
	ld   b, BANK(Palettes_RouteDisplay)                             ; $4741
	ld   hl, Palettes_RouteDisplay                                  ; $4743
	call SetBGPaletteSrc                                            ; $4746
	ld   a, $20                                                     ; $4749
	ld   [wPaletteFadeAmount], a                                    ; $474b
	ld   a, $01                                                     ; $474e
	ld   [wLoadPalettesFromRam], a                                  ; $4750

	ld   b, BANK(Palettes_RouteDisplay)                             ; $4753
	ld   hl, Palettes_RouteDisplay                                  ; $4755
	call SetOBJPaletteSrc                                           ; $4758
	ld   a, $20                                                     ; $475b
	ld   [wPaletteFadeAmount], a                                    ; $475d
	ld   a, $01                                                     ; $4760
	ld   [wLoadPalettesFromRam], a                                  ; $4762

; Load relevant tile data for trainline
	call ProcessScriptsFromCurrLoc                                  ; $4765
	SCR_CallTableIdxInAddr LoadRouteDisplayTileDataMapAndAttr, wSelectedTrainLine

; Display green diamonds for completed locations, and fade in
	SCR_ExecAsmBelow
	call RouteDisplay_GreenDiamonds                                 ; $476e
	call ProcessScriptsFromCurrLoc                                  ; $4771
	SCR_Call Script_FadeIn
	
.mainLoop:
; A or Start continues to the next state
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $4778
	bit  PADB_A, a                                                  ; $477b
	ld   de, RouteDisplayScript_ToNextState                         ; $477d
	jp   nz, ProcessScriptsFromDE                                   ; $4780

	bit  PADB_START, a                                              ; $4783
	ld   de, RouteDisplayScript_ToNextState                         ; $4785
	jp   nz, ProcessScriptsFromDE                                   ; $4788

; Waste no time in this state if God mode
	ld   a, [wGodModeApplied]                                       ; $478b
	or   a                                                          ; $478e
	ld   de, RouteDisplayScript_ToNextState                         ; $478f
	jp   nz, ProcessScriptsFromDE                                   ; $4792

; Check scrolling left or right
	ld   a, [wButtonsHeld]                                          ; $4795
	bit  PADB_RIGHT, a                                              ; $4798
	ld   de, .pressedRight                                          ; $479a
	jp   nz, ProcessScriptsFromDE                                   ; $479d

	bit  PADB_LEFT, a                                               ; $47a0
	ld   de, .pressedLeft                                           ; $47a2
	jp   nz, ProcessScriptsFromDE                                   ; $47a5

	call ProcessScriptsFromCurrLoc                                  ; $47a8
	SCR_ResumeNextFrame
	SCR_Jump .mainLoop

.pressedRight:
; Loop to scroll 2 tiles worth of pixels
	SCR_SetCounter1 $08
.rightLoop:
	SCR_ExecAsmBelow

; Get SCX and inc by 2
	ld   a, [wRouteDisplayNextBottomBoxSCX]                         ; $47b2
	ld   l, a                                                       ; $47b5
	ld   a, [wRouteDisplayNextBottomBoxSCX+1]                       ; $47b6
	ld   h, a                                                       ; $47b9

	inc  hl                                                         ; $47ba
	inc  hl                                                         ; $47bb

; DE = max scx allowed
	ld   a, [wRouteDisplayMaxSCX]                                   ; $47bc
	ld   e, a                                                       ; $47bf
	ld   a, [wRouteDisplayMaxSCX+1]                                 ; $47c0
	ld   d, a                                                       ; $47c3

; If current < max, allow scx change
	ld   a, h                                                       ; $47c4
	cp   d                                                          ; $47c5
	jr   c, .setSCXForPressRight                                    ; $47c6

; If current > max, disallow scx change
	jr   nz, .setSCXfromMax                                         ; $47c8

; Else similar check with lower byte L
	ld   a, l                                                       ; $47ca
	cp   e                                                          ; $47cb
	jr   c, .setSCXForPressRight                                    ; $47cc

.setSCXfromMax:
	ld   l, e                                                       ; $47ce
	ld   h, d                                                       ; $47cf

.setSCXForPressRight:
; Set new SCX
	ld   a, l                                                       ; $47d0
	ld   [wRouteDisplayNextBottomBoxSCX], a                         ; $47d1
	ld   a, h                                                       ; $47d4
	ld   [wRouteDisplayNextBottomBoxSCX+1], a                       ; $47d5

	call ProcessScriptsFromCurrLoc                                  ; $47d8
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE .rightLoop
	SCR_Jump .mainLoop

.pressedLeft:
; Loop to scroll 2 tiles worth of pixels
	SCR_SetCounter1 $08
.leftLoop:
	SCR_ExecAsmBelow

; Get SCX and dec by 2
	ld   a, [wRouteDisplayNextBottomBoxSCX]                         ; $47e5
	ld   l, a                                                       ; $47e8
	ld   a, [wRouteDisplayNextBottomBoxSCX+1]                       ; $47e8
	ld   h, a                                                       ; $47ec
	dec  hl                                                         ; $47ed
	dec  hl                                                         ; $47ee

; If now negative, convert to 0
	bit  7, h                                                       ; $47ef
	jr   z, :+                                                      ; $47f1
	ld   hl, $0000                                                  ; $47f3

; Store new SCX
:	ld   a, l                                                       ; $47f6
	ld   [wRouteDisplayNextBottomBoxSCX], a                         ; $47f7
	ld   a, h                                                       ; $47fa
	ld   [wRouteDisplayNextBottomBoxSCX+1], a                       ; $47fb

	call ProcessScriptsFromCurrLoc                                  ; $47fe
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE .leftLoop
	SCR_Jump .mainLoop


; unused - $4808
UnusedFunc_006_4808:
; Go to previous train line, looping if at 1st, then route display state
	SCR_ExecAsmBelow
	ld   a, [wSelectedTrainLine]                                    ; $4809
	or   a                                                          ; $480c
	jr   nz, :+                                                     ; $480d
	ld   a, $0b                                                     ; $480f
:	dec  a                                                          ; $4811
	ld   [wSelectedTrainLine], a                                    ; $4812
	call ProcessScriptsFromCurrLoc                                  ; $4815
	SCR_StoreByteInAddr wGameState, GS_ROUTE_DISPLAY_INIT
	SCR_StopCurrScript
	

; unused - $481d
UnusedFunc_006_481d:
; Go to next train line, looping if at A, then route display state
	SCR_ExecAsmBelow
	ld   a, [wSelectedTrainLine]                                    ; $481e
	inc  a                                                          ; $4821
	cp   $0b                                                        ; $4822
	jr   c, :+                                                      ; $4824
	xor  a                                                          ; $4826
:	ld   [wSelectedTrainLine], a                                    ; $4827
	call ProcessScriptsFromCurrLoc                                  ; $482a
	SCR_StoreByteInAddr wGameState, GS_ROUTE_DISPLAY_INIT
	SCR_StopCurrScript
	
	
RouteDisplayScript_ToNextState:
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wGameState, GS_IN_GAME_INIT
	SCR_StopCurrScript


LoadRouteDisplayTileDataMapAndAttr:
	dw .trainLine0
	dw .trainLine1
	dw .trainLine2
	dw .trainLine3
	dw .trainLine4
	dw .trainLine5
	dw .trainLine6
	dw .trainLine7
	dw .trainLine8
	dw .trainLine9
	dw .trainLineA
	
.trainLine0:
; Repeat for other train lines below
	SCR_ExecAsmBelow

; Load entire tile data for screen
	ld   a, $00                                                     ; $4851
	ldh  [rVBK], a                                                  ; $4853
	ld   b, BANK(Gfx_RouteDisplayTrainLine0)                        ; $4855
	ld   hl, Gfx_RouteDisplayTrainLine0                             ; $4857
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $485a

; Preserve wram, using a new one if specified
	ldh  a, [rSVBK]                                                 ; $485d
	and  $03                                                        ; $485f
	push af                                                         ; $4861
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4862
	ldh  [rSVBK], a                                                 ; $4864

; Load tile map of top screen half into ram buffer
; The tile map of the 1st half of the journal
	ld   de, wRouteDisplayScrn0TileMapBuffer                        ; $4866
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4869
	ld   hl, TileMap_RouteDisplayTopTrainLine0                      ; $486c
	ld   a, BANK(TileMap_RouteDisplayTopTrainLine0)                 ; $486f
	call FarRectCopy                                                ; $4871

; As above, but copying tile attrs
	ld   de, wRouteDisplayScrn0TileAttrBuffer                       ; $4874
	ld   a, $01                                                     ; $4877
	ldh  [rVBK], a                                                  ; $4879
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $487b
	ld   a, BANK(TileAttr_RouteDisplayTopTrainLine0)                ; $487e
	call FarRectCopy                                                ; $4880

; Restore wram bank, then override it straight after
	pop  af                                                         ; $4883
	ldh  [rSVBK], a                                                 ; $4884

	ldh  a, [rSVBK]                                                 ; $4886
	and  $03                                                        ; $4888
	push af                                                         ; $488a
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $488b
	ldh  [rSVBK], a                                                 ; $488d

; Load tile map and attrs for bottom of the screen
	ld   de, wRouteDisplayScrn0TileMapBuffer+$a0                    ; $488f
	ldbc $0d, GB_TILE_WIDTH                                         ; $4892
	ld   hl, TileMap_RouteDisplayBottomTrainLine0                   ; $4895
	ld   a, BANK(TileMap_RouteDisplayBottomTrainLine0)              ; $4898
	call FarRectCopy                                                ; $489a

	ld   de, wRouteDisplayScrn0TileAttrBuffer+$a0                   ; $489d
	ld   a, $01                                                     ; $48a0
	ldh  [rVBK], a                                                  ; $48a2
	ldbc $0d, GB_TILE_WIDTH                                         ; $48a4
	ld   a, BANK(TileAttr_RouteDisplayBottomTrainLine0)             ; $48a7
	call FarRectCopy                                                ; $48a9

; Restore wram bank and set max scroll appropriately
	pop  af                                                         ; $48ac
	ldh  [rSVBK], a                                                 ; $48ad
	call ProcessScriptsFromCurrLoc                                  ; $48af

	SCR_StoreWordInAddr wRouteDisplayMaxSCX, $0000
	SCR_SingleUseRet
	
.trainLine1:
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $48b9
	ldh  [rVBK], a                                                  ; $48bb
	ld   b, BANK(Gfx_RouteDisplayTrainLine1)                        ; $48bd
	ld   hl, Gfx_RouteDisplayTrainLine1                             ; $48bf
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $48c2

	ldh  a, [rSVBK]                                                 ; $48c5
	and  $03                                                        ; $48c7
	push af                                                         ; $48c9
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $48ca
	ldh  [rSVBK], a                                                 ; $48cc

	ld   de, wRouteDisplayScrn0TileMapBuffer                        ; $48ce
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $48d1
	ld   hl, TileMap_RouteDisplayTopTrainLine1                      ; $48d4
	ld   a, BANK(TileMap_RouteDisplayTopTrainLine1)                 ; $48d7
	call FarRectCopy                                                ; $48d9

	ld   de, wRouteDisplayScrn0TileAttrBuffer                       ; $48dc
	ld   a, $01                                                     ; $48df
	ldh  [rVBK], a                                                  ; $48e1
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $48e3
	ld   a, BANK(TileAttr_RouteDisplayTopTrainLine1)                ; $48e6
	call FarRectCopy                                                ; $48e8

	pop  af                                                         ; $48eb
	ldh  [rSVBK], a                                                 ; $48ec

	ldh  a, [rSVBK]                                                 ; $48ee
	and  $03                                                        ; $48f0
	push af                                                         ; $48f2
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $48f3
	ldh  [rSVBK], a                                                 ; $48f5

	ld   de, wRouteDisplayScrn0TileMapBuffer+$a0                    ; $48f7
	ldbc $0d, GB_TILE_WIDTH                                         ; $48fa
	ld   hl, TileMap_RouteDisplayBottomTrainLine1                   ; $48fd
	ld   a, BANK(TileMap_RouteDisplayBottomTrainLine1)              ; $4900
	call FarRectCopy                                                ; $4902

	ld   de, wRouteDisplayScrn0TileAttrBuffer+$a0                   ; $4905
	ld   a, $01                                                     ; $4908
	ldh  [rVBK], a                                                  ; $490a
	ldbc $0d, GB_TILE_WIDTH                                         ; $490c
	ld   a, BANK(TileAttr_RouteDisplayBottomTrainLine1)             ; $490f
	call FarRectCopy                                                ; $4911

	pop  af                                                         ; $4914
	ldh  [rSVBK], a                                                 ; $4915
	call ProcessScriptsFromCurrLoc                                  ; $4917

	SCR_StoreWordInAddr wRouteDisplayMaxSCX, $0010
	SCR_SingleUseRet
	
.trainLine2:
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $4921
	ldh  [rVBK], a                                                  ; $4923
	ld   b, BANK(Gfx_RouteDisplayTrainLine2)                        ; $4925
	ld   hl, Gfx_RouteDisplayTrainLine2                             ; $4927
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $492a

	ldh  a, [rSVBK]                                                 ; $492d
	and  $03                                                        ; $492f
	push af                                                         ; $4931
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4932
	ldh  [rSVBK], a                                                 ; $4934

	ld   de, wRouteDisplayScrn0TileMapBuffer                        ; $4936
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4939
	ld   hl, TileMap_RouteDisplayTopTrainLine2                      ; $493c
	ld   a, BANK(TileMap_RouteDisplayTopTrainLine2)                 ; $493f
	call FarRectCopy                                                ; $4941

	ld   de, wRouteDisplayScrn0TileAttrBuffer                       ; $4944
	ld   a, $01                                                     ; $4947
	ldh  [rVBK], a                                                  ; $4949
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $494b
	ld   a, BANK(TileAttr_RouteDisplayTopTrainLine2)                ; $494e
	call FarRectCopy                                                ; $4950

	pop  af                                                         ; $4953
	ldh  [rSVBK], a                                                 ; $4954

	ldh  a, [rSVBK]                                                 ; $4956
	and  $03                                                        ; $4958
	push af                                                         ; $495a
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $495b
	ldh  [rSVBK], a                                                 ; $495d

	ld   de, wRouteDisplayScrn0TileMapBuffer+$a0                    ; $495f
	ldbc $0d, GB_TILE_WIDTH                                         ; $4962
	ld   hl, TileMap_RouteDisplayBottomTrainLine2                   ; $4965
	ld   a, BANK(TileMap_RouteDisplayBottomTrainLine2)              ; $4968
	call FarRectCopy                                                ; $496a

	ld   de, wRouteDisplayScrn0TileAttrBuffer+$a0                   ; $496d
	ld   a, $01                                                     ; $4970
	ldh  [rVBK], a                                                  ; $4972
	ldbc $0d, GB_TILE_WIDTH                                         ; $4974
	ld   a, BANK(TileAttr_RouteDisplayBottomTrainLine2)             ; $4977
	call FarRectCopy                                                ; $4979

	pop  af                                                         ; $497c
	ldh  [rSVBK], a                                                 ; $497d
	call ProcessScriptsFromCurrLoc                                  ; $497f

	SCR_StoreWordInAddr wRouteDisplayMaxSCX, $0020
	SCR_SingleUseRet
	
.trainLine3:
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $4989
	ldh  [rVBK], a                                                  ; $498b
	ld   b, BANK(Gfx_RouteDisplayTrainLine0)                        ; $498d
	ld   hl, Gfx_RouteDisplayTrainLine0                             ; $498f
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $4992

	ldh  a, [rSVBK]                                                 ; $4995
	and  $03                                                        ; $4997
	push af                                                         ; $4999
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $499a
	ldh  [rSVBK], a                                                 ; $499c

	ld   de, wRouteDisplayScrn0TileMapBuffer                        ; $499e
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $49a1
	ld   hl, TileMap_RouteDisplayTopTrainLine3                      ; $49a4
	ld   a, BANK(TileMap_RouteDisplayTopTrainLine3)                 ; $49a7
	call FarRectCopy                                                ; $49a9

	ld   de, wRouteDisplayScrn0TileAttrBuffer                       ; $49ac
	ld   a, $01                                                     ; $49af
	ldh  [rVBK], a                                                  ; $49b1
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $49b3
	ld   a, BANK(TileAttr_RouteDisplayTopTrainLine3)                ; $49b6
	call FarRectCopy                                                ; $49b8

	pop  af                                                         ; $49bb
	ldh  [rSVBK], a                                                 ; $49bc

	ldh  a, [rSVBK]                                                 ; $49be
	and  $03                                                        ; $49c0
	push af                                                         ; $49c2
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $49c3
	ldh  [rSVBK], a                                                 ; $49c5

	ld   de, wRouteDisplayScrn0TileMapBuffer+$a0                    ; $49c7
	ldbc $0d, GB_TILE_WIDTH                                         ; $49ca
	ld   hl, TileMap_RouteDisplayBottomTrainLine3                   ; $49cd
	ld   a, BANK(TileMap_RouteDisplayBottomTrainLine3)              ; $49d0
	call FarRectCopy                                                ; $49d2

	ld   de, wRouteDisplayScrn0TileAttrBuffer+$a0                   ; $49d5
	ld   a, $01                                                     ; $49d8
	ldh  [rVBK], a                                                  ; $49da
	ldbc $0d, GB_TILE_WIDTH                                         ; $49dc
	ld   a, BANK(TileAttr_RouteDisplayBottomTrainLine3)             ; $49df
	call FarRectCopy                                                ; $49e1

	pop  af                                                         ; $49e4
	ldh  [rSVBK], a                                                 ; $49e5
	call ProcessScriptsFromCurrLoc                                  ; $49e7

	SCR_StoreWordInAddr wRouteDisplayMaxSCX, $0060
	SCR_SingleUseRet
	
.trainLine4:
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $49f1
	ldh  [rVBK], a                                                  ; $49f3
	ld   b, BANK(Gfx_RouteDisplayTrainLine1)                        ; $49f5
	ld   hl, Gfx_RouteDisplayTrainLine1                             ; $49f7
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $49fa

	ldh  a, [rSVBK]                                                 ; $49fd
	and  $03                                                        ; $49ff
	push af                                                         ; $4a01
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4a02
	ldh  [rSVBK], a                                                 ; $4a04

	ld   de, wRouteDisplayScrn0TileMapBuffer                        ; $4a06
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4a09
	ld   hl, TileMap_RouteDisplayTopTrainLine1                      ; $4a0c
	ld   a, BANK(TileMap_RouteDisplayTopTrainLine1)                 ; $4a0f
	call FarRectCopy                                                ; $4a11

	ld   de, wRouteDisplayScrn0TileAttrBuffer                       ; $4a14
	ld   a, $01                                                     ; $4a17
	ldh  [rVBK], a                                                  ; $4a19
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4a1b
	ld   a, BANK(TileAttr_RouteDisplayTopTrainLine1)                ; $4a1e
	call FarRectCopy                                                ; $4a20

	pop  af                                                         ; $4a23
	ldh  [rSVBK], a                                                 ; $4a24

	ldh  a, [rSVBK]                                                 ; $4a26
	and  $03                                                        ; $4a28
	push af                                                         ; $4a2a
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4a2b
	ldh  [rSVBK], a                                                 ; $4a2d

	ld   de, wRouteDisplayScrn0TileMapBuffer+$a0                    ; $4a2f
	ldbc $0d, GB_TILE_WIDTH                                         ; $4a32
	ld   hl, TileMap_RouteDisplayBottomTrainLine1                   ; $4a35
	ld   a, BANK(TileMap_RouteDisplayBottomTrainLine1)              ; $4a38
	call FarRectCopy                                                ; $4a3a

	ld   de, wRouteDisplayScrn0TileAttrBuffer+$a0                   ; $4a3d
	ld   a, $01                                                     ; $4a40
	ldh  [rVBK], a                                                  ; $4a42
	ldbc $0d, GB_TILE_WIDTH                                         ; $4a44
	ld   a, BANK(TileAttr_RouteDisplayBottomTrainLine1)             ; $4a47
	call FarRectCopy                                                ; $4a49

	pop  af                                                         ; $4a4c
	ldh  [rSVBK], a                                                 ; $4a4d
	call ProcessScriptsFromCurrLoc                                  ; $4a4f

	SCR_StoreWordInAddr wRouteDisplayMaxSCX, $0010
	SCR_SingleUseRet
	
.trainLine5:
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $4a59
	ldh  [rVBK], a                                                  ; $4a5b
	ld   b, BANK(Gfx_RouteDisplayTrainLine0)                        ; $4a5d
	ld   hl, Gfx_RouteDisplayTrainLine0                             ; $4a5f
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $4a62

	ldh  a, [rSVBK]                                                 ; $4a65
	and  $03                                                        ; $4a67
	push af                                                         ; $4a69
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4a6a
	ldh  [rSVBK], a                                                 ; $4a6c

	ld   de, wRouteDisplayScrn0TileMapBuffer                        ; $4a6e
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4a71
	ld   hl, TileMap_RouteDisplayTopTrainLine5                      ; $4a74
	ld   a, BANK(TileMap_RouteDisplayTopTrainLine5)                 ; $4a77
	call FarRectCopy                                                ; $4a79

	ld   de, wRouteDisplayScrn0TileAttrBuffer                       ; $4a7c
	ld   a, $01                                                     ; $4a7f
	ldh  [rVBK], a                                                  ; $4a81
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4a83
	ld   a, BANK(TileAttr_RouteDisplayTopTrainLine5)                ; $4a86
	call FarRectCopy                                                ; $4a88

	pop  af                                                         ; $4a8b
	ldh  [rSVBK], a                                                 ; $4a8c

	ldh  a, [rSVBK]                                                 ; $4a8e
	and  $03                                                        ; $4a90
	push af                                                         ; $4a92
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4a93
	ldh  [rSVBK], a                                                 ; $4a95

	ld   de, wRouteDisplayScrn0TileMapBuffer+$a0                    ; $4a97
	ldbc $0d, GB_TILE_WIDTH                                         ; $4a9a
	ld   hl, TileMap_RouteDisplayBottomTrainLine5                   ; $4a9d
	ld   a, BANK(TileMap_RouteDisplayBottomTrainLine5)              ; $4aa0
	call FarRectCopy                                                ; $4aa2

	ld   de, wRouteDisplayScrn0TileAttrBuffer+$a0                   ; $4aa5
	ld   a, $01                                                     ; $4aa8
	ldh  [rVBK], a                                                  ; $4aaa
	ldbc $0d, GB_TILE_WIDTH                                         ; $4aac
	ld   a, BANK(TileAttr_RouteDisplayBottomTrainLine5)             ; $4aaf
	call FarRectCopy                                                ; $4ab1

	pop  af                                                         ; $4ab4
	ldh  [rSVBK], a                                                 ; $4ab5
	call ProcessScriptsFromCurrLoc                                  ; $4ab7

	SCR_StoreWordInAddr wRouteDisplayMaxSCX, $0060
	SCR_SingleUseRet
	
.trainLine6:
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $4ac1
	ldh  [rVBK], a                                                  ; $4ac3
	ld   b, BANK(Gfx_RouteDisplayTrainLine6)                        ; $4ac5
	ld   hl, Gfx_RouteDisplayTrainLine6                             ; $4ac7
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $4aca

	ldh  a, [rSVBK]                                                 ; $4acd
	and  $03                                                        ; $4acf
	push af                                                         ; $4ad1
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4ad2
	ldh  [rSVBK], a                                                 ; $4ad4

	ld   de, wRouteDisplayScrn0TileMapBuffer                        ; $4ad6
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4ad9
	ld   hl, TileMap_RouteDisplayTopTrainLine6                      ; $4adc
	ld   a, BANK(TileMap_RouteDisplayTopTrainLine6)                 ; $4adf
	call FarRectCopy                                                ; $4ae1

	ld   de, wRouteDisplayScrn0TileAttrBuffer                       ; $4ae4
	ld   a, $01                                                     ; $4ae7
	ldh  [rVBK], a                                                  ; $4ae9
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4aeb
	ld   a, BANK(TileAttr_RouteDisplayTopTrainLine6)                ; $4aee
	call FarRectCopy                                                ; $4af0

	pop  af                                                         ; $4af3
	ldh  [rSVBK], a                                                 ; $4af4

	ldh  a, [rSVBK]                                                 ; $4af6
	and  $03                                                        ; $4af8
	push af                                                         ; $4afa
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4afb
	ldh  [rSVBK], a                                                 ; $4afd

	ld   de, wRouteDisplayScrn0TileMapBuffer+$a0                    ; $4aff
	ldbc $0d, GB_TILE_WIDTH                                         ; $4b02
	ld   hl, TileMap_RouteDisplayBottomTrainLine6                   ; $4b05
	ld   a, BANK(TileMap_RouteDisplayBottomTrainLine6)              ; $4b08
	call FarRectCopy                                                ; $4b0a

	ld   de, wRouteDisplayScrn0TileAttrBuffer+$a0                   ; $4b0d
	ld   a, $01                                                     ; $4b10
	ldh  [rVBK], a                                                  ; $4b12
	ldbc $0d, GB_TILE_WIDTH                                         ; $4b14
	ld   a, BANK(TileAttr_RouteDisplayBottomTrainLine6)             ; $4b17
	call FarRectCopy                                                ; $4b19

	pop  af                                                         ; $4b1c
	ldh  [rSVBK], a                                                 ; $4b1d
	call ProcessScriptsFromCurrLoc                                  ; $4b1f

	SCR_StoreWordInAddr wRouteDisplayMaxSCX, $0020
	SCR_SingleUseRet
	
.trainLine7:
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $4b29
	ldh  [rVBK], a                                                  ; $4b2b
	ld   b, BANK(Gfx_RouteDisplayTrainLine7)                        ; $4b2d
	ld   hl, Gfx_RouteDisplayTrainLine7                             ; $4b2f
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $4b32

	ldh  a, [rSVBK]                                                 ; $4b35
	and  $03                                                        ; $4b37
	push af                                                         ; $4b39
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4b3a
	ldh  [rSVBK], a                                                 ; $4b3c
	
	ld   de, wRouteDisplayScrn0TileMapBuffer                        ; $4b3e
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4b41
	ld   hl, TileMap_RouteDisplayTopTrainLine7                      ; $4b44
	ld   a, BANK(TileMap_RouteDisplayTopTrainLine7)                 ; $4b47
	call FarRectCopy                                                ; $4b49
	
	ld   de, wRouteDisplayScrn0TileAttrBuffer                       ; $4b4c
	ld   a, $01                                                     ; $4b4f
	ldh  [rVBK], a                                                  ; $4b51
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4b53
	ld   a, BANK(TileAttr_RouteDisplayTopTrainLine7)                ; $4b56
	call FarRectCopy                                                ; $4b58
	
	pop  af                                                         ; $4b5b
	ldh  [rSVBK], a                                                 ; $4b5c
	
	ldh  a, [rSVBK]                                                 ; $4b5e
	and  $03                                                        ; $4b60
	push af                                                         ; $4b62
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4b63
	ldh  [rSVBK], a                                                 ; $4b65
	
	ld   de, wRouteDisplayScrn0TileMapBuffer+$a0                    ; $4b67
	ldbc $0d, GB_TILE_WIDTH                                         ; $4b6a
	ld   hl, TileMap_RouteDisplayBottomTrainLine7                   ; $4b6d
	ld   a, BANK(TileMap_RouteDisplayBottomTrainLine7)              ; $4b70
	call FarRectCopy                                                ; $4b72
	
	ld   de, wRouteDisplayScrn0TileAttrBuffer+$a0                   ; $4b75
	ld   a, $01                                                     ; $4b78
	ldh  [rVBK], a                                                  ; $4b7a
	ldbc $0d, GB_TILE_WIDTH                                         ; $4b7c
	ld   a, BANK(TileAttr_RouteDisplayBottomTrainLine7)             ; $4b7f
	call FarRectCopy                                                ; $4b81
	
	pop  af                                                         ; $4b84
	ldh  [rSVBK], a                                                 ; $4b85
	call ProcessScriptsFromCurrLoc                                  ; $4b87
	
	SCR_StoreWordInAddr wRouteDisplayMaxSCX, $0000
	SCR_SingleUseRet
	
.trainLine8:
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $4b91
	ldh  [rVBK], a                                                  ; $4b93
	ld   b, BANK(Gfx_RouteDisplayTrainLine8)                        ; $4b95
	ld   hl, Gfx_RouteDisplayTrainLine8                             ; $4b97
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $4b9a

	ldh  a, [rSVBK]                                                 ; $4b9d
	and  $03                                                        ; $4b9f
	push af                                                         ; $4ba1
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4ba2
	ldh  [rSVBK], a                                                 ; $4ba4

	ld   de, wRouteDisplayScrn0TileMapBuffer                        ; $4ba6
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4ba9
	ld   hl, TileMap_RouteDisplayTopTrainLine8                      ; $4bac
	ld   a, BANK(TileMap_RouteDisplayTopTrainLine8)                 ; $4baf
	call FarRectCopy                                                ; $4bb1

	ld   de, wRouteDisplayScrn0TileAttrBuffer                       ; $4bb4
	ld   a, $01                                                     ; $4bb7
	ldh  [rVBK], a                                                  ; $4bb9
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4bbb
	ld   a, BANK(TileAttr_RouteDisplayTopTrainLine8)                ; $4bbe
	call FarRectCopy                                                ; $4bc0

	pop  af                                                         ; $4bc3
	ldh  [rSVBK], a                                                 ; $4bc4

	ldh  a, [rSVBK]                                                 ; $4bc6
	and  $03                                                        ; $4bc8
	push af                                                         ; $4bca
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4bcb
	ldh  [rSVBK], a                                                 ; $4bcd

	ld   de, wRouteDisplayScrn0TileMapBuffer+$a0                    ; $4bcf
	ldbc $0d, GB_TILE_WIDTH                                         ; $4bd2
	ld   hl, TileMap_RouteDisplayBottomTrainLine8                   ; $4bd5
	ld   a, BANK(TileMap_RouteDisplayBottomTrainLine8)              ; $4bd8
	call FarRectCopy                                                ; $4bda

	ld   de, wRouteDisplayScrn0TileAttrBuffer+$a0                   ; $4bdd
	ld   a, $01                                                     ; $4be0
	ldh  [rVBK], a                                                  ; $4be2
	ldbc $0d, GB_TILE_WIDTH                                         ; $4be4
	ld   a, BANK(TileAttr_RouteDisplayBottomTrainLine8)             ; $4be7
	call FarRectCopy                                                ; $4be9

	pop  af                                                         ; $4bec
	ldh  [rSVBK], a                                                 ; $4bed
	call ProcessScriptsFromCurrLoc                                  ; $4bef

	SCR_StoreWordInAddr wRouteDisplayMaxSCX, $0020
	SCR_SingleUseRet
	
.trainLine9:
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $4bf9
	ldh  [rVBK], a                                                  ; $4bfb
	ld   b, BANK(Gfx_RouteDisplayTrainLine7)                        ; $4bfd
	ld   hl, Gfx_RouteDisplayTrainLine7                             ; $4bff
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $4c02

	ldh  a, [rSVBK]                                                 ; $4c05
	and  $03                                                        ; $4c07
	push af                                                         ; $4c09
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4c0a
	ldh  [rSVBK], a                                                 ; $4c0c

	ld   de, wRouteDisplayScrn0TileMapBuffer                        ; $4c0e
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4c11
	ld   hl, TileMap_RouteDisplayTopTrainLine9                      ; $4c14
	ld   a, BANK(TileMap_RouteDisplayTopTrainLine9)                 ; $4c17
	call FarRectCopy                                                ; $4c19

	ld   de, wRouteDisplayScrn0TileAttrBuffer                       ; $4c1c
	ld   a, $01                                                     ; $4c1f
	ldh  [rVBK], a                                                  ; $4c21
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4c23
	ld   a, BANK(TileAttr_RouteDisplayTopTrainLine9)                ; $4c26
	call FarRectCopy                                                ; $4c28

	pop  af                                                         ; $4c2b
	ldh  [rSVBK], a                                                 ; $4c2c

	ldh  a, [rSVBK]                                                 ; $4c2e
	and  $03                                                        ; $4c30
	push af                                                         ; $4c32
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4c33
	ldh  [rSVBK], a                                                 ; $4c35

	ld   de, wRouteDisplayScrn0TileMapBuffer+$a0                    ; $4c37
	ldbc $0d, GB_TILE_WIDTH                                         ; $4c3a
	ld   hl, TileMap_RouteDisplayBottomTrainLine9                   ; $4c3d
	ld   a, BANK(TileMap_RouteDisplayBottomTrainLine9)              ; $4c40
	call FarRectCopy                                                ; $4c42

	ld   de, wRouteDisplayScrn0TileAttrBuffer+$a0                   ; $4c45
	ld   a, $01                                                     ; $4c48
	ldh  [rVBK], a                                                  ; $4c4a
	ldbc $0d, GB_TILE_WIDTH                                         ; $4c4c
	ld   a, BANK(TileAttr_RouteDisplayBottomTrainLine9)             ; $4c4f
	call FarRectCopy                                                ; $4c51

; Restore, then push again, but load tile map and attr for window portion
	pop  af                                                         ; $4c54
	ldh  [rSVBK], a                                                 ; $4c55

	ldh  a, [rSVBK]                                                 ; $4c57
	and  $03                                                        ; $4c59
	push af                                                         ; $4c5b
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4c5c
	ldh  [rSVBK], a                                                 ; $4c5e

	ld   de, wRouteDisplayScrn1TileMapBuffer                        ; $4c60
	ldbc $0d, SCREEN_TILE_WIDTH                                     ; $4c63
	ld   hl, TileMap_RouteDisplayWindowTrainLineA                   ; $4c66
	ld   a, BANK(TileMap_RouteDisplayWindowTrainLineA)              ; $4c69
	call FarRectCopy                                                ; $4c6b

	ld   de, wRouteDisplayScrn1TileAttrBuffer                       ; $4c6e
	ld   a, $01                                                     ; $4c71
	ldh  [rVBK], a                                                  ; $4c73
	ldbc $0d, SCREEN_TILE_WIDTH                                     ; $4c75
	ld   a, BANK(TileAttr_RouteDisplayWindowTrainLineA)             ; $4c78
	call FarRectCopy                                                ; $4c7a

	pop  af                                                         ; $4c7d
	ldh  [rSVBK], a                                                 ; $4c7e
	call ProcessScriptsFromCurrLoc                                  ; $4c80

	SCR_StoreWordInAddr wRouteDisplayMaxSCX, $0100
	SCR_SingleUseRet
	
.trainLineA:
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $4c8a
	ldh  [rVBK], a                                                  ; $4c8c
	ld   b, BANK(Gfx_RouteDisplayTrainLine1)                        ; $4c8e
	ld   hl, Gfx_RouteDisplayTrainLine1                             ; $4c90
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $4c93

	ldh  a, [rSVBK]                                                 ; $4c96
	and  $03                                                        ; $4c98
	push af                                                         ; $4c9a
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4c9b
	ldh  [rSVBK], a                                                 ; $4c9d
	
	ld   de, wRouteDisplayScrn0TileMapBuffer                        ; $4c9f
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4ca2
	ld   hl, TileMap_RouteDisplayTopTrainLineA                      ; $4ca5
	ld   a, BANK(TileMap_RouteDisplayTopTrainLineA)                 ; $4ca8
	call FarRectCopy                                                ; $4caa
	
	ld   de, wRouteDisplayScrn0TileAttrBuffer                       ; $4cad
	ld   a, $01                                                     ; $4cb0
	ldh  [rVBK], a                                                  ; $4cb2
	ldbc $05, SCREEN_TILE_WIDTH                                     ; $4cb4
	ld   a, BANK(TileAttr_RouteDisplayTopTrainLineA)                ; $4cb7
	call FarRectCopy                                                ; $4cb9
	
	pop  af                                                         ; $4cbc
	ldh  [rSVBK], a                                                 ; $4cbd
	
	ldh  a, [rSVBK]                                                 ; $4cbf
	and  $03                                                        ; $4cc1
	push af                                                         ; $4cc3
	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4cc4
	ldh  [rSVBK], a                                                 ; $4cc6
	
	ld   de, wRouteDisplayScrn0TileMapBuffer+$a0                    ; $4cc8
	ldbc $0d, GB_TILE_WIDTH                                         ; $4ccb
	ld   hl, TileMap_RouteDisplayBottomTrainLineA                   ; $4cce
	ld   a, BANK(TileMap_RouteDisplayBottomTrainLineA)              ; $4cd1
	call FarRectCopy                                                ; $4cd3
	
	ld   de, wRouteDisplayScrn0TileAttrBuffer+$a0                   ; $4cd6
	ld   a, $01                                                     ; $4cd9
	ldh  [rVBK], a                                                  ; $4cdb
	ldbc $0d, GB_TILE_WIDTH                                         ; $4cdd
	ld   a, BANK(TileAttr_RouteDisplayBottomTrainLineA)             ; $4ce0
	call FarRectCopy                                                ; $4ce2
	
	pop  af                                                         ; $4ce5
	ldh  [rSVBK], a                                                 ; $4ce6
	call ProcessScriptsFromCurrLoc                                  ; $4ce8
	
	SCR_StoreWordInAddr wRouteDisplayMaxSCX, $0000
	SCR_SingleUseRet
	
	
RouteDisplayScriptSubScript1_GreenArrow:
; Set base Y
	SCR_SetSpriteY $30
	SCR_ExecAsmBelow

; Based on location, set X
	ld   a, [wLocationIdxInTrainLine]                               ; $4cf4
	add  a                                                          ; $4cf7
	add  a                                                          ; $4cf8
	add  $38                                                        ; $4cf9
	ld   b, a                                                       ; $4cfb
	ldh  a, [hCurrScriptStructHighByte]                             ; $4cfc
	ld   h, a                                                       ; $4cfe
	ld   l, SCRIPT_SPRITE_X                                         ; $4cff
	ld   [hl], b                                                    ; $4d01

; Flash green arrow
	call ProcessScriptsFromCurrLoc                                  ; $4d02
:	SCR_FarSetSpriteSrc SpriteOam_RouteDisplayGreenArrow
	SCR_Delay $0c
	SCR_UnsetSpriteSrc
	SCR_Delay $08
	SCR_Jump :-


RouteDisplayOtherScript1_CompletionStar:
; Stop script if 1st byte (trainline complete) is 0
	SCR_ExecAsmBelow
	ld   a, [wRouteDisplayLocationsComplete]                        ; $4d12
	or   a                                                          ; $4d15
	ld   de, :+                                                     ; $4d16
	jp   nz, ProcessScriptsFromDE                                   ; $4d19

	call ProcessScriptsFromCurrLoc                                  ; $4d1c
	SCR_StopCurrScript

; Else set star sprite
:	SCR_FarSetSpriteSrc SpriteOam_RouteDisplayStar

.loop:
	SCR_ExecAsmBelow
; Jump if scroll >= $100
	ld   a, [wRouteDisplayNextBottomBoxSCX+1]                       ; $4d25
	or   a                                                          ; $4d28
	jr   nz, .outOfView                                             ; $4d29

; Jump if scroll > $48
	ld   a, [wRouteDisplayNextBottomBoxSCX]                         ; $4d2b
	ld   c, a                                                       ; $4d2e
	ld   a, $48                                                     ; $4d2f
	sub  c                                                          ; $4d31
	jr   c, .outOfView                                              ; $4d32

; C (sprite Y) in normal view, X = $38-scroll
	sub  $10                                                        ; $4d34
	ld   b, a                                                       ; $4d36
	ld   c, $30                                                     ; $4d37
	jr   .setCoords                                                 ; $4d39

.outOfView:
	ld   b, $00                                                     ; $4d3b
	ld   c, $a0                                                     ; $4d3d

.setCoords:
; Set x then y
	ldh  a, [hCurrScriptStructHighByte]                             ; $4d3f
	ld   h, a                                                       ; $4d41
	ld   l, SCRIPT_SPRITE_X                                         ; $4d42
	ld   a, b                                                       ; $4d44
	ld   [hl+], a                                                   ; $4d45
	ld   [hl], c                                                    ; $4d46
	call ProcessScriptsFromCurrLoc                                  ; $4d47
	SCR_ResumeNextFrame
	SCR_Jump .loop


GetRouteDisplaySCXForLocationInTrainLine:
; HL = train line * $16
	ld   a, [wSelectedTrainLine]                                    ; $4d4e
	ld   l, a                                                       ; $4d51
	ld   h, $16                                                     ; $4d52
	call HLequHtimesL                                               ; $4d54

; HL += double location idx in trainline
	ld   a, [wLocationIdxInTrainLine]                               ; $4d57
	add  a                                                          ; $4d5a
	ld   c, a                                                       ; $4d5b
	ld   b, $00                                                     ; $4d5c
	add  hl, bc                                                     ; $4d5e

; Offset into table
	ld   bc, .scxes                                                 ; $4d5f
	add  hl, bc                                                     ; $4d62

; Store scx
	ld   a, [hl+]                                                   ; $4d63
	ld   [wRouteDisplayNextBottomBoxSCX], a                         ; $4d64
	ld   a, [hl]                                                    ; $4d67
	ld   [wRouteDisplayNextBottomBoxSCX+1], a                       ; $4d68
	ret                                                             ; $4d6b

.scxes:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $10, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00
	db $00, $00, $30, $00, $30, $00, $30, $00, $30, $00, $30, $00, $30, $00, $30, $00, $30, $00, $30, $00, $30, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $60, $00, $60, $00, $60, $00, $60, $00, $60, $00, $60, $00, $60, $00, $60, $00, $60, $00, $60, $00
	db $00, $00, $10, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00, $20, $00
	db $00, $00, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00


RouteDisplay_GreenDiamonds:
; Preserve and set wram bank for wRouteDisplayLocationsComplete
	ldh  a, [rSVBK]                                                 ; $4e74
	and  $03                                                        ; $4e76
	push af                                                         ; $4e78
	ld   a, $00                                                     ; $4e79
	ldh  [rSVBK], a                                                 ; $4e7b

; Get trainline location offset in table
	ld   a, [wSelectedTrainLine]                                    ; $4e7d
	ld   l, a                                                       ; $4e80
	ld   h, MAX_LOCATIONS_IN_A_TRAINLINE                            ; $4e81
	call HLequHtimesL                                               ; $4e83
	ld   bc, .trainLineGreenStarMapOffsets                          ; $4e86
	add  hl, bc                                                     ; $4e89
	ld   de, wRouteDisplayLocationsComplete+1                       ; $4e8a
	ld   b, MAX_LOCATIONS_IN_A_TRAINLINE-1                          ; $4e8d

.nextLocation:
; If location not complete, go to next location
	push hl                                                         ; $4e8f
	push de                                                         ; $4e90
	ld   a, [de]                                                    ; $4e91
	or   a                                                          ; $4e92
	jr   z, .toNextLocation                                         ; $4e93

; DE = table value
	ld   e, [hl]                                                    ; $4e95
	ld   d, $00                                                     ; $4e96

; Trainline 9's locations are far right in the window
	ld   hl, wRouteDisplayScrn0TileMapBuffer+$c0                    ; $4e98
	ld   a, [wSelectedTrainLine]                                    ; $4e9b
	cp   $09                                                        ; $4e9e
	jr   nz, :+                                                     ; $4ea0
	ld   hl, wRouteDisplayScrn1TileMapBuffer+$20                    ; $4ea2

; Set wram bank, and ram buffer dest
:	ld   a, BANK(wRouteDisplayScrn0TileMapBuffer)                   ; $4ea5
	ldh  [rSVBK], a                                                 ; $4ea7
	add  hl, de                                                     ; $4ea9

; Set both halves of the green diamond
	ld   a, $82                                                     ; $4eaa
	ld   [hl+], a                                                   ; $4eac
	ld   a, $83                                                     ; $4ead
	ld   [hl-], a                                                   ; $4eaf

; Then palette 6
	ld   de, wRouteDisplayScrn0TileAttrBuffer-wRouteDisplayScrn0TileMapBuffer ; $4eb0
	add  hl, de                                                     ; $4eb3
	ld   a, $06                                                     ; $4eb4
	ld   [hl+], a                                                   ; $4eb6
	ld   [hl], a                                                    ; $4eb7
	ld   a, $00                                                     ; $4eb8
	ldh  [rSVBK], a                                                 ; $4eba

.toNextLocation:
	pop  de                                                         ; $4ebc
	pop  hl                                                         ; $4ebd
	inc  de                                                         ; $4ebe
	inc  hl                                                         ; $4ebf
	dec  b                                                          ; $4ec0
	jr   nz, .nextLocation                                          ; $4ec1

	pop  af                                                         ; $4ec3
	ldh  [rSVBK], a                                                 ; $4ec4
	ret                                                             ; $4ec6

.trainLineGreenStarMapOffsets:
	db $00, $06, $08, $00, $0c, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $12, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $04, $00, $00, $00, $0c, $00, $10, $00, $14, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $06, $08, $00, $0c, $00, $10, $12, $14, $00, $00, $00, $1c, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $12, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $14, $00, $00, $00, $1c, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $04, $06, $08, $0a, $0c, $0e, $10, $12, $14, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $04, $06, $00, $0a, $00, $00, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $08, $0a, $00, $00, $00, $12, $14, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $04, $00, $00, $00, $00, $00, $10, $00, $00
	db $10, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $12, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00


RouteDisplayScriptSubScript2_AdjustWXForBottomScrollingBox:
.loop
	SCR_ExecAsmBelow

; HL = bottom box scx
	ld   a, [wRouteDisplayNextBottomBoxSCX]                         ; $4ff4
	ld   l, a                                                       ; $4ff7
	ld   a, [wRouteDisplayNextBottomBoxSCX+1]                       ; $4ff8
	ld   h, a                                                       ; $4ffb

; If HL < $60, keep looping
	or   a                                                          ; $4ffc
	jr   nz, .ahead                                                 ; $4ffd

	ld   a, l                                                       ; $4fff
	cp   $60                                                        ; $5000
	jr   nc, .ahead                                                 ; $5002

.toLoop:
	call ProcessScriptsFromCurrLoc                                  ; $5004
	SCR_ResumeNextFrame
	SCR_Jump .loop

.ahead:
; Otherwise WX = $a0-(scx-$60) = $100-scx
; ie the more we scroll right, the more the window (remaining part of route) moves left
	ld   de, -$60                                                   ; $500b
	add  hl, de                                                     ; $500e
	ld   a, $a0                                                     ; $500f
	sub  l                                                          ; $5011
	ld   [wWX], a                                                   ; $5012
	jr   .toLoop                                                    ; $5015


FinishedInGameScript::
; Reset var for below check to set
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $5018
	ld   [wInGameFinishedInAreaApproachingLastStation], a           ; $501a

; Jump ahead if not appraching the next station to stop at
	ld   a, [wApproachingNextStationToStopAt]                       ; $501d
	or   a                                                          ; $5020
	jr   z, .afterApproachingStationCheck                           ; $5021

; Both loads are trashed in function, jump if not approaching the next station to stop at
	ld   a, [wLocationIdxInTrainLine]                               ; $5023
	ld   a, [wSelectedTrainLine]                                    ; $5026
	call IncLocationIdxInTrainLine                                  ; $5029
	jp   c, .afterLastStationCheck                                  ; $502c

; Else set that the in-game finished while approaching a stopping station
	ld   a, $01                                                     ; $502f
	ld   [wInGameFinishedInAreaApproachingLastStation], a           ; $5031

.afterLastStationCheck:
; If we get to continue screen, save our current train line idx
	ld   a, [wLocationIdxInTrainLine]                               ; $5034
	ld   [wTrainLineIdxToResumeToAfterContinue], a                  ; $5037

.afterApproachingStationCheck:
; Jump ahead if we have 0 penalties
	ld   a, [wPenaltiesAllowed]                                     ; $503a
	or   a                                                          ; $503d
	jp   z, .noPenalties                                            ; $503e

; Jump ahead if we accelerated in the station, or applied extreme braking
	ld   a, [wPoorStationStructureAcceleration]                     ; $5041
	or   a                                                          ; $5044
	ld   de, .poorPerformance                                       ; $5045
	jp   nz, ProcessScriptsFromDE                                   ; $5048

	ld   a, [wAppliedExtremeBraking]                                ; $504b
	or   a                                                          ; $504e
	ld   de, .poorPerformance                                       ; $504f
	jp   nz, ProcessScriptsFromDE                                   ; $5052

; Get positive distance to station
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $5055
	ld   l, a                                                       ; $5058
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $5059
	ld   h, a                                                       ; $505c
	bit  7, a                                                       ; $505d
	jr   z, :+                                                      ; $505f

	ld   a, h                                                       ; $5061
	cpl                                                             ; $5062
	ld   h, a                                                       ; $5063
	ld   a, l                                                       ; $5064
	cpl                                                             ; $5065
	ld   l, a                                                       ; $5066

; If distance high byte is non-0, ie stopped too far, jump ahead
:	ld   a, h                                                       ; $5067
	or   a                                                          ; $5068
	ld   de, .poorPerformance                                       ; $5069
	jp   nz, ProcessScriptsFromDE                                   ; $506c

	ld   a, l                                                       ; $506f
	or   a                                                          ; $5070
	ld   de, .poorPerformance                                       ; $5071
	jp   nz, ProcessScriptsFromDE                                   ; $5074

; --
; -- Good / Great
; --
; Save curr time
	ld   a, [wCurrTimeSeconds]                                      ; $5077
	ld   [wFinishedInGameCurrSeconds], a                            ; $507a
	ld   a, [wCurrTimeMinutes]                                      ; $507d
	ld   [wFinishedInGameCurrMinutes], a                            ; $5080
	ld   a, [wCurrTimeHours]                                        ; $5083
	ld   [wFinishedInGameCurrHours], a                              ; $5086

; HL (later DE) = total curr seconds, excluding hrs
	ld   a, [wFinishedInGameCurrSeconds]                            ; $5089
	ld   c, a                                                       ; $508c
	ld   a, [wFinishedInGameCurrMinutes]                            ; $508d
	ld   h, a                                                       ; $5090
	call HLequHtimes60plusC                                         ; $5091
	push hl                                                         ; $5094

; HL = total dest seconds, excluding hrs
	ld   a, [wDestinationTimeSeconds]                               ; $5095
	ld   c, a                                                       ; $5098
	ld   a, [wDestinationTimeMinutes]                               ; $5099
	ld   h, a                                                       ; $509c
	call HLequHtimes60plusC                                         ; $509d
	pop  de                                                         ; $50a0

; HL = total dest - curr dest
	ld   a, d                                                       ; $50a1
	cpl                                                             ; $50a2
	ld   d, a                                                       ; $50a3
	ld   a, e                                                       ; $50a4
	cpl                                                             ; $50a5
	ld   e, a                                                       ; $50a6
	inc  de                                                         ; $50a7
	add  hl, de                                                     ; $50a8

; Keep diff positive
	bit  7, h                                                       ; $50a9
	jr   z, :+                                                      ; $50ab

	ld   a, h                                                       ; $50ad
	cpl                                                             ; $50ae
	ld   h, a                                                       ; $50af
	ld   a, l                                                       ; $50b0
	cpl                                                             ; $50b1
	ld   l, a                                                       ; $50b2
	inc  hl                                                         ; $50b3

; Display good if time diff >= 3, else display great
:	ld   a, h                                                       ; $50b4
	or   a                                                          ; $50b5
	jr   nz, .good                                                  ; $50b6

	ld   a, l                                                       ; $50b8
	cp   $03                                                        ; $50b9
	jr   c, .great                                                  ; $50bb

.good:
	ld   a, IGS_TEXT_GOOD                                           ; $50bd
	ld   [wInGameOnSceneryTextIdx], a                               ; $50bf

; Add points
	call GetTrainLineDifficultyBonusPtsOnGoodFinish                 ; $50c2
	ld   a, b                                                       ; $50c5
	ld   [wInGamePenaltiesAboutToBeAddedOrSubbed], a                ; $50c6
	call AddBtoPenaltiesAllowed                                     ; $50c9
	ld   de, .afterGoodOrGreat                                      ; $50cc
	jp   ProcessScriptsFromDE                                       ; $50cf

.great:
	ld   a, IGS_TEXT_GREAT                                          ; $50d2
	ld   [wInGameOnSceneryTextIdx], a                               ; $50d4

; Add bonus penalties onto existing great streak
	call GetTrainLineDifficultyBonusPtsOnGreatFinish                ; $50d7
	ld   a, [wGreatFinishStreak]                                    ; $50da
	add  b                                                          ; $50dd
	ld   b, a                                                       ; $50de
	ld   [wInGamePenaltiesAboutToBeAddedOrSubbed], a                ; $50df
	call AddBtoPenaltiesAllowed                                     ; $50e2

; streak+1 as a bonus
	ld   a, [wGreatFinishStreak]                                    ; $50e5
	inc  a                                                          ; $50e8
	ld   [wGreatFinishStreak], a                                    ; $50e9
	ld   de, .afterGoodOrGreat                                      ; $50ec
	jp   ProcessScriptsFromDE                                       ; $50ef

; --
; -- Poor / Good / Great
; --
.poorPerformance:
; Reset great streak
	SCR_StoreByteInAddr wGreatFinishStreak, $00
	SCR_Jump :+

.afterGoodOrGreat:
; Jump if finished in area near the last station, else go to Location Done state
	SCR_Delay $1e
:	SCR_ExecAsmBelow
	ld   a, [wInGameFinishedInAreaApproachingLastStation]           ; $50fc
	or   a                                                          ; $50ff
	jp   nz, .finishedInAreaApproachingStationToStopAt              ; $5100

	call ProcessScriptsFromCurrLoc                                  ; $5103

.goToLocationDone:
	SCR_Delay $b4
	
; Disable vblank updates
	SCR_ExecAsmBelow
	di                                                              ; $5109
	ld   a, LOW(StubInterruptFunc)                                  ; $510a
	ld   [wVBlankInterruptFunc], a                                  ; $510c
	ld   a, HIGH(StubInterruptFunc)                                 ; $510f
	ld   [wVBlankInterruptFunc+1], a                                ; $5111
	ei                                                              ; $5114
	call ProcessScriptsFromCurrLoc                                  ; $5115

; Fade out, then go to location done screen
	SCR_Call Script_FadeOut
	
	SCR_ExecAsmBelow
	ld   a, GS_LOCATION_DONE_INIT                                   ; $511c
	ld   [wGameState], a                                            ; $511e
	jp   .end                                                       ; $5121

; --
; -- No penalties / timeout
; --
.noPenalties:
; Reset a bit to help not display continue timeout text (penalties sets bit 4 though)
	ld   a, [wContinueScreenHighNybSetForTimeOutTextLowNybIsBottomTextMinus1] ; $5124
	res  7, a                                                       ; $5127
	ld   [wContinueScreenHighNybSetForTimeOutTextLowNybIsBottomTextMinus1], a ; $5129

; Stop animating train, and display time out text
	ld   a, $00                                                     ; $512c
	ld   [wTrainRailsShouldAnimate], a                              ; $512e
	call ProcessScriptsFromCurrLoc                                  ; $5131
	SCR_Delay $3c
	SCR_StoreByteInAddr wInGameOnSceneryTextIdx, IGS_TEXT_TIMEOUT
	SCR_Delay $fa

; If we finished in good distance to last station, avoid going to Continue screen
	SCR_ExecAsmBelow
	ld   a, [wInGameFinishedInAreaApproachingLastStation]           ; $513d
	or   a                                                          ; $5140
	jr   nz, .allSectionsRunning                                    ; $5141

; Else don't process vblank updates, fade out..
	di                                                              ; $5143
	ld   a, LOW(StubInterruptFunc)                                  ; $5144
	ld   [wVBlankInterruptFunc], a                                  ; $5146
	ld   a, HIGH(StubInterruptFunc)                                 ; $5149
	ld   [wVBlankInterruptFunc+1], a                                ; $514b
	ei                                                              ; $514e
	call ProcessScriptsFromCurrLoc                                  ; $514f
	SCR_Call Script_FadeOut
	
; And go to continue screen
	SCR_ExecAsmBelow
	ld   a, GS_CONTINUE_SCREEN_INIT                                 ; $5156
	ld   [wGameState], a                                            ; $5158
	jr   .end                                                       ; $515b

; --
; -- Approaching last station
; --
.finishedInAreaApproachingStationToStopAt:
; If this is train line 4..
	ld   a, [wSelectedTrainLine]                                    ; $515d
	cp   $04                                                        ; $5160
	jr   nz, .allSectionsRunning                                    ; $5162

; And we're just at the dest pt..
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $5164
	ld   b, a                                                       ; $5167
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $5168
	or   b                                                          ; $516b
	jr   z, .atOrJustPassedTrainLine4Station                        ; $516c

; Or we're 1m ahead of it..
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $516e
	cp   $ff                                                        ; $5171
	jr   nz, .allSectionsRunning                                    ; $5173

	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $5175
	cp   $ff                                                        ; $5178
	jr   nz, .allSectionsRunning                                    ; $517a

.atOrJustPassedTrainLine4Station:
; Go to train line A during route display
	ld   a, $01                                                     ; $517c
	ld   [wShouldChangeToTrainLineAOnRouteDisplay], a               ; $517e
	ld   de, .goToLocationDone                                      ; $5181
	jp   ProcessScriptsFromDE                                       ; $5184

.allSectionsRunning:
; Else display text and set that we completed the train line
	ld   a, IGS_TEXT_ALL_SECTIONS_RUNNING                           ; $5187
	ld   [wInGameOnSceneryTextIdx], a                               ; $5189

	ld   a, $01                                                     ; $518c
	ld   [wCompletedTrainLine], a                                   ; $518e
	call ProcessScriptsFromCurrLoc                                  ; $5191
	SCR_Delay $b4
	SCR_Delay $b4
	
; Disable vblank updates and fade out
	SCR_ExecAsmBelow
	di                                                              ; $5199
	ld   a, LOW(StubInterruptFunc)                                  ; $519a
	ld   [wVBlankInterruptFunc], a                                  ; $519c
	ld   a, HIGH(StubInterruptFunc)                                 ; $519f
	ld   [wVBlankInterruptFunc+1], a                                ; $51a1
	ei                                                              ; $51a4
	call ProcessScriptsFromCurrLoc                                  ; $51a5
	SCR_Call Script_FadeOut
	
; Go to Location Done if we didn't time out..
	SCR_ExecAsmBelow
	ld   a, [wPenaltiesAllowed]                                     ; $51ac
	or   a                                                          ; $51af
	jr   z, .penaltiesEqu0                                          ; $51b0

	ld   a, GS_LOCATION_DONE_INIT                                   ; $51b2
	ld   [wGameState], a                                            ; $51b4
	jr   .end                                                       ; $51b7

.penaltiesEqu0:
; Else go straight to scoring
	ld   a, $01                                                     ; $51b9
	ld   [wCompletedTrainLine], a                                   ; $51bb
	ld   a, GS_SCORING_INIT                                         ; $51be
	ld   [wGameState], a                                            ; $51c0
	jr   .end                                                       ; $51c3

.end:
	call ProcessScriptsFromCurrLoc                                  ; $51c5
	SCR_StopCurrScript


; Returns carry if we're not at the final train line idx
IncLocationIdxInTrainLine::
; B = byte pointed to by train line double idx in table
	ld   a, [wSelectedTrainLine]                                    ; $51c9
	ld   hl, FinalLocationIdxInTrainLine                            ; $51cc
	ld   e, a                                                       ; $51cf
	ld   d, $00                                                     ; $51d0
	add  hl, de                                                     ; $51d2
	ld   b, [hl]                                                    ; $51d3

; Inc current train line idx, return carry if less than the last
	ld   a, [wLocationIdxInTrainLine]                               ; $51d4
	inc  a                                                          ; $51d7
	ld   [wLocationIdxInTrainLine], a                               ; $51d8
	cp   b                                                          ; $51db
	ret  c                                                          ; $51dc

; Else keep the last idx as the current train line idx
	ld   a, b                                                       ; $51dd
	ld   [wLocationIdxInTrainLine], a                               ; $51de
	ret                                                             ; $51e1


TitleScreenScript::
; Load tile data
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $51e3
	ldh  [rVBK], a                                                  ; $51e5
	ld   b, BANK(Gfx_TitleScreen)                                   ; $51e7
	ld   hl, Gfx_TitleScreen                                        ; $51e9
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $51ec

; Load tile map and attrs
	ld   de, _SCRN0                                                 ; $51ef
	ld   a, $00                                                     ; $51f2
	ldh  [rVBK], a                                                  ; $51f4
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $51f6
	ld   hl, TileMap_TitleScreen                                    ; $51f9
	ld   a, BANK(TileMap_TitleScreen)                               ; $51fc
	call FarRectCopyRowPerFrame                                     ; $51fe

	ld   de, _SCRN0                                                 ; $5201
	ld   a, $01                                                     ; $5204
	ldh  [rVBK], a                                                  ; $5206
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $5208
	ld   a, BANK(TileAttr_TitleScreen)                              ; $520b
	call FarRectCopyRowPerFrame                                     ; $520d

; Load sprites to fix color on some symbols due to >1 bg tile making them, then fade in
	call ProcessScriptsFromCurrLoc                                  ; $5210
	SCR_SetSpriteXY $38, $30
	SCR_FarSetSpriteSrc SpriteOam_TitleScreenColorFixes
	SCR_Call Script_FadeIn
	SCR_Delay $02

; Play 'Densha de Go' sound
	SCR_ExecAsmBelow
	ld   a, VOL_SND_DENSHA_DE_GO                                    ; $5220
	call PlaySelectedVolumeModulatedSound                           ; $5222
	call ProcessScriptsFromCurrLoc                                  ; $5225

; Create script to handle Push Start sprite
	SCR_CreateOtherScript 1, TitleScreenPushStartScript

; Loop $0f * $3c times
	SCR_SetCounter1 $0f
:	SCR_SetCounter2 $3c
:	SCR_ResumeNextFrame

; Exit out of loops if Start pressed
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $5233
	bit  PADB_START, a                                              ; $5236
	ld   de, Script_GoToTitleScreenOptsState                        ; $5238
	jp   nz, ProcessScriptsFromDE                                   ; $523b

	call ProcessScriptsFromCurrLoc                                  ; $523e
	SCR_DecCounter2_JNE :-
	SCR_DecCounter1_JNE :--

; After waiting, go to next demo step
	SCR_Call Script_FadeOut
	
	SCR_ExecAsmBelow
	call SetGameStateAndInGameDetailsBasedOnTitleScreenDemoStepIdx  ; $524b
	call ProcessScriptsFromCurrLoc                                  ; $524e
	SCR_StopCurrScript


TitleScreenPushStartScript:
; Simply flash Push Start
:	SCR_SetSpriteXY $38, $30
	SCR_FarSetSpriteSrc SpriteOam_TitleScreenPushStart
	SCR_Delay $14
	SCR_UnsetSpriteSrc
	SCR_Delay $10
	SCR_Jump :-


Script_GoToTitleScreenOptsState:
	SCR_PlaySound SND_01|MAKE_SOUND_EFFECT
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wGameState, GS_TITLE_SCREEN_OPTS_INIT
	SCR_StopCurrScript


DEF MENU_OPT_IDX = SCRIPT_VAR_1D
; 1 to go brighter, -1 to go dimmer
DEF MENU_OPT_PALETTE_ATTR_OFFSET = SCRIPT_VAR_1E
TitleScreenOptsScript::
; Starting menu option = 0 (Game start)
	SCR_StoreByteInStruct MENU_OPT_IDX, $00

; Load sprites
	SCR_SetSpriteXY $38, $30
	SCR_FarSetSpriteSrc SpriteOam_TitleScreenOptsSelectionBrackets
	SCR_CreateOtherScript 1, TitleScreenOptsOtherScript1_UpArrow
	SCR_CreateOtherScript 2, TitleScreenOptsOtherScript2_DownArrow
	SCR_ResumeNextFrame
	
; Load tile data
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $5281
	ldh  [rVBK], a                                                  ; $5283
	ld   b, BANK(Gfx_TitleScreenOpts)                               ; $5285
	ld   hl, Gfx_TitleScreenOpts                                    ; $5287
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $528a

; Load tile map and attrs
	ld   de, _SCRN0                                                 ; $528d
	ld   a, $00                                                     ; $5290
	ldh  [rVBK], a                                                  ; $5292
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $5294
	ld   hl, TileMap_TitleScreenOpts                                ; $5297
	ld   a, BANK(TileMap_TitleScreenOpts)                           ; $529a
	call FarRectCopyRowPerFrame                                     ; $529c

	ld   de, _SCRN0                                                 ; $529f
	ld   a, $01                                                     ; $52a2
	ldh  [rVBK], a                                                  ; $52a4
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $52a6
	ld   a, BANK(TileAttr_TitleScreenOpts)                          ; $52a9
	call FarRectCopyRowPerFrame                                     ; $52ab

; Update menu gfx to show 1st option highlighted
	call ProcessScriptsFromCurrLoc                                  ; $52ae
	SCR_StoreByteInStruct MENU_OPT_PALETTE_ATTR_OFFSET, $01
	SCR_CallTableIdxInStructByte \
		ScriptCallTable_TitleScreenOptsUpdateArrowsLocationAndSelectionsPals, MENU_OPT_IDX

; Fade in and play sound
	SCR_Call Script_FadeIn
	SCR_PlaySound MUS_0b

.mainLoop:
	SCR_StoreByteInStruct MENU_OPT_PALETTE_ATTR_OFFSET, $ff
	SCR_SetCounter1 $0a
	SCR_ResumeNextFrame

; HL = menu option idx selected
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $52c4
	ld   h, a                                                       ; $52c6
	ld   l, MENU_OPT_IDX                                            ; $52c7

; Check buttons
	ld   a, [wButtonsPressed]                                       ; $52c9
	bit  PADB_UP, a                                                 ; $52cc
	jr   z, .upNotPressed                                           ; $52ce

; Up pressed - ignore if opt index = 0
	ld   a, [hl]                                                    ; $52d0
	or   a                                                          ; $52d1
	ld   de, .mainLoop                                              ; $52d2
	jp   z, ProcessScriptsFromDE                                    ; $52d5

; Play sound, and dim gfx
	call ProcessScriptsFromCurrLoc                                  ; $52d8
	SCR_PlaySound SND_06|MAKE_SOUND_EFFECT
	SCR_CallTableIdxInStructByte \
		ScriptCallTable_TitleScreenOptsUpdateArrowsLocationAndSelectionsPals, MENU_OPT_IDX

; Hide arrows
	SCR_StoreByteInAddr PAGE_1+SCRIPT_SPRITE_Y, $10
	SCR_StoreByteInAddr PAGE_2+SCRIPT_SPRITE_Y, $b0

; Sub 1 from option idx, then for selection brackets, 32 (-3*10+-2) Y to get past 4 tiles
	SCR_StructByteAddByte MENU_OPT_IDX, $ff
:	SCR_AddToSpriteY $fd
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-
	SCR_AddToSpriteY $fe
	SCR_Jump .dirsCont

.upNotPressed:
	bit  PADB_DOWN, a                                               ; $52f7
	jr   z, .dirsNotPressed                                         ; $52f9

; Down pressed - ignore if opt index = 3
	ld   a, [hl]                                                    ; $52fb
	cp   $03                                                        ; $52fc
	ld   de, .mainLoop                                              ; $52fe
	jp   z, ProcessScriptsFromDE                                    ; $5301

; Play sound, and dim gfx
	call ProcessScriptsFromCurrLoc                                  ; $5304
	SCR_PlaySound SND_06|MAKE_SOUND_EFFECT
	SCR_CallTableIdxInStructByte \
		ScriptCallTable_TitleScreenOptsUpdateArrowsLocationAndSelectionsPals, MENU_OPT_IDX

; Hide arrows
	SCR_StoreByteInAddr PAGE_1+SCRIPT_SPRITE_Y, $10
	SCR_StoreByteInAddr PAGE_2+SCRIPT_SPRITE_Y, $b0

; Add 1 to option idx, then for selection brackets, 32 Y to get past 4 tiles
	SCR_StructByteAddByte MENU_OPT_IDX, $01
:	SCR_AddToSpriteY $03
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-
	SCR_AddToSpriteY $02

.dirsCont:
; Brighten selected gfx
	SCR_StoreByteInStruct MENU_OPT_PALETTE_ATTR_OFFSET, $01
	SCR_CallTableIdxInStructByte \
		ScriptCallTable_TitleScreenOptsUpdateArrowsLocationAndSelectionsPals, MENU_OPT_IDX
	SCR_Jump .mainLoop

.dirsNotPressed:
	bit  PADB_B, a                                                  ; $532a
	jr   z, .notDirsOrB                                             ; $532c

; B pressed - play sound, fade out and go back to title screen
	call ProcessScriptsFromCurrLoc                                  ; $532e
	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wGameState, GS_TITLE_SCREEN_INIT
	SCR_StopCurrScript

.notDirsOrB:
; If A or Start not processed, do main loop
	bit  PADB_START, a                                              ; $533b
	jr   nz, .aOrStartPressed                                       ; $533d

	bit  PADB_A, a                                                  ; $533f
	ld   de, .mainLoop                                              ; $5341
	jp   z, ProcessScriptsFromDE                                    ; $5344

.aOrStartPressed:
; Play sound
	push af                                                         ; $5347
	ld   a, SND_01                                                  ; $5348
	or   MAKE_SOUND_EFFECT                                          ; $534a
	call PlaySound                                                  ; $534c
	pop  af                                                         ; $534f

; Jump based on menu idx
	ldh  a, [hCurrScriptStructHighByte]                             ; $5350
	ld   h, a                                                       ; $5352
	ld   l, MENU_OPT_IDX                                            ; $5353

	ld   a, [hl]                                                    ; $5355
	or   a                                                          ; $5356
	jr   z, .opt0_inGame                                            ; $5357

	cp   $02                                                        ; $5359
	jr   c, .opt1_pictureBook                                       ; $535b

	jr   z, .opt2_gameSetup                                         ; $535d

; Option 3 - rankings
	call ProcessScriptsFromCurrLoc                                  ; $535f
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wRankingsPrevScreen, RANKINGS_FROM_TITLE_SCREEN_OPTS
	SCR_StoreByteInAddr wGameState, GS_RANKING_INIT
	SCR_StopCurrScript

.opt2_gameSetup:
	call ProcessScriptsFromCurrLoc                                  ; $536e
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wGameState, GS_GAME_SETUP_INIT
	SCR_StopCurrScript

.opt1_pictureBook:
; Set that we came from title screen opts, fade out, clear music, and set state
	ld   a, $00                                                     ; $5379
	ld   [wPictureBookPrevScreen], a                                ; $537b
	call ProcessScriptsFromCurrLoc                                  ; $537e
	SCR_Call Script_FadeOut
	SCR_PlaySound MUS_NULL
	SCR_StoreByteInAddr wGameState, GS_PICTURE_BOOK_INIT
	SCR_StopCurrScript

.opt0_inGame:
; Fade out and set that we didn't go in-game from title screen
	call ProcessScriptsFromCurrLoc                                  ; $538b
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wIsDemo, $00
	SCR_StoreByteInAddr wGameState, GS_TRAINLINE_SELECTION_INIT
	SCR_StopCurrScript


ScriptCallTable_TitleScreenOptsUpdateArrowsLocationAndSelectionsPals:
	dw .entry0
	dw .entry1
	dw .entry2
	dw .entry3

; Update coords based on menu opt, hiding up/down arrow if at opt 0/3 respectively
.entry0:
	SCR_StoreByteInAddr PAGE_1+SCRIPT_SPRITE_Y, $10
	SCR_StoreByteInAddr PAGE_2+SCRIPT_SPRITE_Y, $30
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   hl, _SCRN0+$21                                             ; $53ac
	jr   .cont                                                      ; $53af

.entry1:
	SCR_StoreByteInAddr PAGE_1+SCRIPT_SPRITE_Y, $50
	SCR_StoreByteInAddr PAGE_2+SCRIPT_SPRITE_Y, $50
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   hl, _SCRN0+$a1                                             ; $53bb
	jr   .cont                                                      ; $53be

.entry2:
	SCR_StoreByteInAddr PAGE_1+SCRIPT_SPRITE_Y, $70
	SCR_StoreByteInAddr PAGE_2+SCRIPT_SPRITE_Y, $70
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   hl, _SCRN0+$121                                            ; $53ca
	jr   .cont                                                      ; $53cd

.entry3:
	SCR_StoreByteInAddr PAGE_1+SCRIPT_SPRITE_Y, $90
	SCR_StoreByteInAddr PAGE_2+SCRIPT_SPRITE_Y, $b0
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   hl, _SCRN0+$1a1                                            ; $53d9

.cont:
; Write to attrs first
	ld   a, $01                                                     ; $53dc
	ldh  [rVBK], a                                                  ; $53de

; Get 1 or -1 into B (to brighten or darken palettes)
	ldh  a, [hCurrScriptStructHighByte]                             ; $53e0
	ld   d, a                                                       ; $53e2
	ld   e, MENU_OPT_PALETTE_ATTR_OFFSET                            ; $53e3
	ld   a, [de]                                                    ; $53e5
	ld   b, a                                                       ; $53e6

; C = new attrs
	add  [hl]                                                       ; $53e7
	ld   c, a                                                       ; $53e8

; Update palettes for each of the 4 rows
	ld   de, $0d                                                    ; $53e9
	call TitleScreenOpts_UpdateSelectedPalettes                     ; $53ec
	call TitleScreenOpts_UpdateSelectedPalettes                     ; $53ef
	call TitleScreenOpts_UpdateSelectedPalettes                     ; $53f2
	call TitleScreenOpts_UpdateSelectedPalettes                     ; $53f5
	call ProcessScriptsFromCurrLoc                                  ; $53f8
	SCR_SingleUseRet


; B - 1 (value to add to tile attr)
; C - new text attrs
; DE - $0d (GB_TILE_WIDTH - $13, $13 being 2 + 1 + $10 tiles updated here)
TitleScreenOpts_UpdateSelectedPalettes:
; New attrs in 2 tiles of the left number
	ld   [hl+], a                                                   ; $53fc
	ld   [hl+], a                                                   ; $53fd

; Update colored bar palette
	xor  a                                                          ; $53fe
	ldh  [rVBK], a                                                  ; $53ff
	ld   a, [hl]                                                    ; $5401
	add  b                                                          ; $5402
	ld   [hl+], a                                                   ; $5403

; Update palettes for the rest of the row
	ld   a, $01                                                     ; $5404
	ldh  [rVBK], a                                                  ; $5406
	ld   a, c                                                       ; $5408
rept 16
	ld   [hl+], a                                                   ; $5409
endr
	add  hl, de                                                     ; $5419
	ret                                                             ; $541a


TitleScreenOptsOtherScript1_UpArrow:
:	SCR_SetSpriteX $38
	SCR_FarSetSpriteSrc SpriteOam_BouncingUpArrowLow
	SCR_Delay $0a
	SCR_SetSpriteSrc SpriteOam_BouncingUpArrowMid
	SCR_Delay $0a
	SCR_SetSpriteSrc SpriteOam_BouncingUpArrowHigh
	SCR_Delay $0a
	SCR_SetSpriteSrc SpriteOam_BouncingUpArrowMid
	SCR_Delay $0a
	SCR_Jump :-


TitleScreenOptsOtherScript2_DownArrow:
:	SCR_SetSpriteX $38
	SCR_FarSetSpriteSrc SpriteOam_BouncingDownArrowHigh
	SCR_Delay $0a
	SCR_SetSpriteSrc SpriteOam_BouncingDownArrowMid
	SCR_Delay $0a
	SCR_SetSpriteSrc SpriteOam_BouncingDownArrowLow
	SCR_Delay $0a
	SCR_SetSpriteSrc SpriteOam_BouncingDownArrowMid
	SCR_Delay $0a
	SCR_Jump :-


IntroScript::
	SCR_Delay $3c

	SCR_StartSubScript1 .subscript1_fadeIn
	SCR_SetCounter1 $f0 

; Main waits for Start pressed
:	SCR_ResumeNextFrame

	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $5459
	bit  PADB_START, a                                              ; $545c
	ld   de, .startPressedCyberFront                                ; $545e
	jp   nz, ProcessScriptsFromDE                                   ; $5461

	call ProcessScriptsFromCurrLoc                                  ; $5464
	SCR_DecCounter1_JNE :-

; Once timer = 0, go to Taito train screen
	SCR_StopSubScript1
	SCR_Call Script_FadeOut
	SCR_Jump .cyberFrontFinished

.startPressedCyberFront:
	SCR_StopSubScript1
	SCR_Call Script_FadeOut
	SCR_ExecAsmBelow

; Inc from here to title screen, and stop script
	call IncTitleScreenDemoStepUntilTitleScreenStateSet             ; $5476
	call ProcessScriptsFromCurrLoc                                  ; $5479
	SCR_StopCurrScript

.subscript1_fadeIn:
; With no fades applied, load palettes 1 to 6 with delays
	SCR_ExecAsmBelow
	ld   b, BANK(BGPalettes_CyberFront_1)                           ; $547e
	ld   hl, BGPalettes_CyberFront_1                                ; $5480
	call SetBGPaletteSrc                                            ; $5483
	xor  a                                                          ; $5486
	ld   [wPaletteFadeAmount], a                                    ; $5487
	ld   [wLoadPalettesFromRam], a                                  ; $548a
	ld   a, $01                                                     ; $548d
	ld   [wLoadBGPalettesFromRom], a                                ; $548f
	call ProcessScriptsFromCurrLoc                                  ; $5492
	SCR_Delay $06

	SCR_ExecAsmBelow	
	ld   b, BANK(BGPalettes_CyberFront_2)                           ; $5498
	ld   hl, BGPalettes_CyberFront_2                                ; $549a
	call SetBGPaletteSrc                                            ; $549d
	xor  a                                                          ; $54a0
	ld   [wPaletteFadeAmount], a                                    ; $54a1
	ld   [wLoadPalettesFromRam], a                                  ; $54a4
	ld   a, $01                                                     ; $54a7
	ld   [wLoadBGPalettesFromRom], a                                ; $54a9
	call ProcessScriptsFromCurrLoc                                  ; $54ac
	SCR_Delay $06

	SCR_ExecAsmBelow
	ld   b, BANK(BGPalettes_CyberFront_3)                           ; $54b2
	ld   hl, BGPalettes_CyberFront_3                                ; $54b4
	call SetBGPaletteSrc                                            ; $54b7
	xor  a                                                          ; $54ba
	ld   [wPaletteFadeAmount], a                                    ; $54bb
	ld   [wLoadPalettesFromRam], a                                  ; $54be
	ld   a, $01                                                     ; $54c1
	ld   [wLoadBGPalettesFromRom], a                                ; $54c3
	call ProcessScriptsFromCurrLoc                                  ; $54c6
	SCR_Delay $06

	SCR_ExecAsmBelow
	ld   b, BANK(BGPalettes_CyberFront_4)                           ; $54cc
	ld   hl, BGPalettes_CyberFront_4                                ; $54ce
	call SetBGPaletteSrc                                            ; $54d1
	xor  a                                                          ; $54d4
	ld   [wPaletteFadeAmount], a                                    ; $54d5
	ld   [wLoadPalettesFromRam], a                                  ; $54d8
	ld   a, $01                                                     ; $54db
	ld   [wLoadBGPalettesFromRom], a                                ; $54dd
	call ProcessScriptsFromCurrLoc                                  ; $54e0
	SCR_Delay $06

	SCR_ExecAsmBelow
	ld   b, BANK(BGPalettes_CyberFront_5)                           ; $54e6
	ld   hl, BGPalettes_CyberFront_5                                ; $54e8
	call SetBGPaletteSrc                                            ; $54eb
	xor  a                                                          ; $54ee
	ld   [wPaletteFadeAmount], a                                    ; $54ef
	ld   [wLoadPalettesFromRam], a                                  ; $54f2
	ld   a, $01                                                     ; $54f5
	ld   [wLoadBGPalettesFromRom], a                                ; $54f7
	call ProcessScriptsFromCurrLoc                                  ; $54fa
	SCR_Delay $06

	SCR_ExecAsmBelow
	ld   b, BANK(BGPalettes_CyberFront_6)                           ; $5500
	ld   hl, BGPalettes_CyberFront_6                                ; $5502
	call SetBGPaletteSrc                                            ; $5505
	xor  a                                                          ; $5508
	ld   [wPaletteFadeAmount], a                                    ; $5509
	ld   [wLoadPalettesFromRam], a                                  ; $550c
	ld   a, $01                                                     ; $550f
	ld   [wLoadBGPalettesFromRom], a                                ; $5511
	call ProcessScriptsFromCurrLoc                                  ; $5514

	SCR_StopSubScript1 
	SCR_ResumeNextFrame

.cyberFrontFinished:
; Handle Taito Logo screen
	SCR_ExecAsmBelow

; Load tile map and tile attrs across entire tile data width
	ld   de, _SCRN0                                                 ; $551a
	ld   a, $00                                                     ; $551d
	ldh  [rVBK], a                                                  ; $551f
	ldbc SCREEN_TILE_HEIGHT, GB_TILE_WIDTH                          ; $5521
	ld   hl, TileMap_TaitoLogo                                      ; $5524
	ld   a, BANK(TileMap_TaitoLogo)                                 ; $5527
	call FarRectCopyRowPerFrame                                     ; $5529

	ld   de, _SCRN0                                                 ; $552c
	ld   a, $01                                                     ; $552f
	ldh  [rVBK], a                                                  ; $5531
	ldbc SCREEN_TILE_HEIGHT, GB_TILE_WIDTH                          ; $5533
	ld   a, BANK(TileAttr_TaitoLogo)                                ; $5536
	call FarRectCopyRowPerFrame                                     ; $5538

; Load tile data
	ld   a, $00                                                     ; $553b
	ldh  [rVBK], a                                                  ; $553d
	ld   b, BANK(Gfx_TaitoLogo)                                     ; $553f
	ld   hl, Gfx_TaitoLogo                                          ; $5541
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $5544

; Load palettes for BG - no fade
	ld   b, BANK(Palettes_TaitoLogo)                                ; $5547
	ld   hl, Palettes_TaitoLogo                                     ; $5549
	call SetBGPaletteSrc                                            ; $554c
	xor  a                                                          ; $554f
	ld   [wPaletteFadeAmount], a                                    ; $5550
	ld   [wLoadPalettesFromRam], a                                  ; $5553
	ld   a, $01                                                     ; $5556
	ld   [wLoadBGPalettesFromRom], a                                ; $5558

; Load palettes for OBJ - no fade
	ld   b, BANK(Palettes_TaitoLogo)                                ; $555b
	ld   hl, Palettes_TaitoLogo                                     ; $555d
	call SetOBJPaletteSrc                                           ; $5560
	xor  a                                                          ; $5563
	ld   [wPaletteFadeAmount], a                                    ; $5564
	ld   [wLoadPalettesFromRam], a                                  ; $5567
	ld   a, $01                                                     ; $556a
	ld   [wLoadOBJPalettesFromRom], a                               ; $556c
	call ProcessScriptsFromCurrLoc                                  ; $556f
	
; Start train pulling/pushing Taito logo
	SCR_Delay $3c
	SCR_StartSubScript1 .subscript1_taitoInputHandling

; Load sprite and coords, then move $38 pixels left
	SCR_SetSpriteXY $a0, $30
	SCR_FarSetSpriteSrc ScriptOam_TaitoTrain
	SCR_SetCounter1 $38
:	SCR_AddToSpriteX -1
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-
	
; Move sprite and scrollx $80 pixels left (train bringing logo in)
	SCR_SetCounter1 $80
:	SCR_AddToSpriteX -1
	SCR_ValInAddrPlusEquByte wSCX, $01
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-

; Move sprite $20 pixels left
	SCR_Delay $08
	SCR_SetCounter1 $20
:	SCR_AddToSpriteX -1
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-
	
; Reset train coords for pushing, and move it $20 pixels left
	SCR_Delay $3c
	SCR_SetSpriteXY $a0, $30
	SCR_SetCounter1 $20
:	SCR_AddToSpriteX -1
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-
	
; Play a sound, then move train and logo (through scx) $80 pixels left
	SCR_Delay $08
	SCR_PlaySound SND_07|MAKE_SOUND_EFFECT
	SCR_SetCounter1 $80
:	SCR_AddToSpriteX -1
	SCR_ValInAddrPlusEquByte wSCX, $01
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-

; Continue moving train to off-screen
	SCR_SetCounter1 $38
:	SCR_AddToSpriteX -1
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-
	
; Make screen black
	SCR_ExecAsmBelow
	ld   a, $20                                                     ; $55c3
	ld   [wPaletteFadeAmount], a                                    ; $55c5
	ld   a, $01                                                     ; $55c8
	ld   [wLoadPalettesFromRam], a                                  ; $55ca

; Set next game state
	call ProcessScriptsFromCurrLoc                                  ; $55cd
	SCR_StoreByteInAddr wGameState, GS_INTRO_CUTSCENE_INIT
	SCR_StopCurrScript


.subscript1_taitoInputHandling:
	SCR_ResumeNextFrame

; Jump to finishing script if A or Start pressed here
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $55d7
	bit  PADB_A, a                                                  ; $55da
	ld   de, .startOrAPressedTaito                                  ; $55dc
	jp   nz, ProcessScriptsFromDE                                   ; $55df

	bit  PADB_START, a                                              ; $55e2
	ld   de, .startOrAPressedTaito                                  ; $55e4
	jp   nz, ProcessScriptsFromDE                                   ; $55e7

; Else loop checking next frame's input
	ld   de, .subscript1_taitoInputHandling                         ; $55ea
	jp   ProcessScriptsFromDE                                       ; $55ed

.startOrAPressedTaito:
	SCR_Call Script_FadeOut
	SCR_ExecAsmBelow

; Inc step from here to title screen
	call IncTitleScreenDemoStepUntilTitleScreenStateSet             ; $55f4
	call ProcessScriptsFromCurrLoc                                  ; $55f7
	SCR_StopSubScript1
	SCR_ResumeNextFrame
	
	
ContinueScreenTileMapAndAttrSources::
	dw TileMapAndAttr_ContinueBottomText1 ; the brakes are too strong
	dw TileMapAndAttr_ContinueBottomText2 ; please protect the station
	dw TileMapAndAttr_ContinueBottomText3 ; please protect the signal
	dw TileMapAndAttr_ContinueBottomText4 ; use coasting
	dw TileMapAndAttr_ContinueBottomText5 ; please press start - circle mouth
	dw TileMapAndAttr_ContinueBottomText6 ; please press start - curve mouth
	dw TileMapAndAttr_ContinueBottomText7 ; please press start - open mouth


ContinueScreenScript::
; Clear custom event var, and streaks
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $560b
	ld   [wIndexOfCustomSpeedLimitOrStopEv], a                      ; $560d
	ld   a, $00                                                     ; $5610
	ld   [wTotalTimeAheadOfStoppingStationsSinceDepartureOrContinue], a ; $5612
	ld   a, $00                                                     ; $5615
	ld   [wGreatFinishStreak], a                                    ; $5617
	ld   a, $00                                                     ; $561a
	ld   [wTotalGoodCommsBonusPenaltiesAllowedSinceDepartureOrContinue], a ; $561c

; Don't show top or bottom half
	ld   a, CONT_TEXT_NONE                                          ; $561f
	ld   [wContinueScreenBottomHalf1Idx], a                         ; $5621
	ld   a, $00                                                     ; $5624
	ld   [wContinueScreenTopText1Idx], a                            ; $5626
	ld   a, $00                                                     ; $5629
	ld   [wContinueScreenCountdown1Idx], a                          ; $562b

; Branch if train line A (no continues)
	ld   a, [wSelectedTrainLine]                                    ; $562e
	cp   $0a                                                        ; $5631
	ld   de, .trainLineA                                            ; $5633
	jp   z, ProcessScriptsFromDE                                    ; $5636

; Jump if we don't need to display the timeout text
	ld   a, [wContinueScreenHighNybSetForTimeOutTextLowNybIsBottomTextMinus1] ; $5639
	and  $f0                                                        ; $563c
	ld   de, .afterTimeoutText                                      ; $563e
	jp   z, ProcessScriptsFromDE                                    ; $5641

; Re-use in-game OBJ palettes for the following custom - no fade
	ld   b, BANK(OBJPalettes_InGame)                                ; $5644
	ld   hl, OBJPalettes_InGame                                     ; $5646
	call SetOBJPaletteSrc                                           ; $5649
	xor  a                                                          ; $564c
	ld   [wPaletteFadeAmount], a                                    ; $564d
	ld   [wLoadPalettesFromRam], a                                  ; $5650
	ld   a, $01                                                     ; $5653
	ld   [wLoadOBJPalettesFromRom], a                               ; $5655

; Scroll in time out text
	call ProcessScriptsFromCurrLoc                                  ; $5658
	SCR_SetSpriteXY $a0, $30
	SCR_FarSetSpriteSrc SpriteOam_ContinueScreenTimeout
	SCR_SetCounter1 $34
:	SCR_AddToSpriteX -2
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-

; Play sound, then hide sprite
	SCR_PlaySound SND_0b|MAKE_SOUND_EFFECT
	SCR_Delay $78
	SCR_UnsetSpriteSrc
	SCR_SetSpriteXY $38, $30
	SCR_Delay $3c
	
; Set correct continue screen OBJ palettes - no fade
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_ContinueScreen)                           ; $5675
	ld   hl, Palettes_ContinueScreen                                ; $5677
	call SetOBJPaletteSrc                                           ; $567a
	xor  a                                                          ; $567d
	ld   [wPaletteFadeAmount], a                                    ; $567e
	ld   [wLoadPalettesFromRam], a                                  ; $5681
	ld   a, $01                                                     ; $5684
	ld   [wLoadOBJPalettesFromRom], a                               ; $5686
	call ProcessScriptsFromCurrLoc                                  ; $5689

.afterTimeoutText:
; Display face
	SCR_SetSpriteXY $38, $30
	SCR_FarSetSpriteSrc SpriteOam_ContinueScreenHappyFace
	
; Set bottom screen text idx
	SCR_ExecAsmBelow
	ld   a, [wContinueScreenHighNybSetForTimeOutTextLowNybIsBottomTextMinus1] ; $5694
	and  $0f                                                        ; $5697
	inc  a                                                          ; $5699
	ld   [wContinueScreenBottomHalf1Idx], a                         ; $569a
	call ProcessScriptsFromCurrLoc                                  ; $569d

; Jump ahead if A pressed or counter goes to 0
	SCR_SetCounter1 $b4
:	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $56a3
	bit  PADB_A, a                                                  ; $56a6
	ld   de, .afterInitialBottomText                                ; $56a8
	jp   nz, ProcessScriptsFromDE                                   ; $56ab

	call ProcessScriptsFromCurrLoc                                  ; $56ae
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-
	
.afterInitialBottomText:
; Have face look worried, while starting countdown
	SCR_StoreByteInAddr wContinueScreenTopText1Idx, CONT_TEXT_RESUME_WITH_COUNTDOWN
	SCR_StoreByteInAddr wContinueScreenBottomHalf1Idx, CONT_TEXT_PRESS_START_CIRCLE_MOUTH
	SCR_FarSetSpriteSrc SpriteOam_ContinueScreenSmallMouthFace
	SCR_StartSubScript1 ContinueScreenScriptSubScript1_HandleCountdown
	SCR_StoreByteInAddr wContinueScreenCountdown1Idx, 10

.loop:
	SCR_ExecAsmBelow
; Jump when countdown hits 0
	ld   a, [wContinueScreenCountdown1Idx]                          ; $56ca
	or   a                                                          ; $56cd
	ld   de, .countDownHit0                                         ; $56ce
	jp   z, ProcessScriptsFromDE                                    ; $56d1

; Exit when start is pressed
	ld   a, [wButtonsPressed]                                       ; $56d4
	bit  PADB_START, a                                              ; $56d7
	ld   de, ContinueScreenScript_PressedStart                      ; $56d9
	jp   nz, ProcessScriptsFromDE                                   ; $56dc

	call ProcessScriptsFromCurrLoc                                  ; $56df
	SCR_ResumeNextFrame
	SCR_Jump .loop

; unused - $56e6
	SCR_Delay $b4

.countDownHit0:
	SCR_StopSubScript1

; Update texts and show shocked face
	SCR_StoreByteInAddr wContinueScreenCountdown1Idx, $00
	SCR_StoreByteInAddr wContinueScreenTopText1Idx, CONT_TEXT_GAME_OVER
	SCR_StoreByteInAddr wContinueScreenBottomHalf1Idx, CONT_TEXT_PRESS_START_OPEN_MOUTH
	SCR_FarSetSpriteSrc SpriteOam_ContinueScreenShockedFace
	SCR_Delay $b4

.trainLineA:
; Fade out, and go to scoring
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wGameState, GS_SCORING_INIT
	SCR_StopCurrScript


ContinueScreenScriptSubScript1_HandleCountdown:
	SCR_ResumeNextFrame
; Loop for 10 seconds
	SCR_SetCounter2 10

; Loop for every frame of a second
.loop_2:
	SCR_SetCounter3 60
	
; Wait until A pressed or counter hits 0
:	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $5709
	bit  PADB_A, a                                                  ; $570c
	ld   de, .aPressedOrCounter0                                    ; $570e
	jp   nz, ProcessScriptsFromDE                                   ; $5711

	call ProcessScriptsFromCurrLoc                                  ; $5714
	SCR_ResumeNextFrame
	SCR_DecCounter3_JNE :-

.aPressedOrCounter0:
; Play sound, make countdown go faster
	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT
	SCR_ValInAddrPlusEquByte wContinueScreenCountdown1Idx, -1
	SCR_ResumeNextFrame
	SCR_DecCounter2_JNE .loop_2
	SCR_StopSubScript1
	SCR_ResumeNextFrame


ContinueScreenScript_PressedStart:
; Play sound, remove countdown text, and show happy face
	SCR_PlaySound SND_01|MAKE_SOUND_EFFECT
	SCR_StopSubScript1
	SCR_StoreByteInAddr wContinueScreenCountdown1Idx, $00
	SCR_StoreByteInAddr wContinueScreenTopText1Idx, CONT_TEXT_RESUME
	SCR_StoreByteInAddr wContinueScreenBottomHalf1Idx, CONT_TEXT_PRESS_START_CURVE_MOUTH
	SCR_FarSetSpriteSrc SpriteOam_ContinueScreenHappyFace
	SCR_Delay $78

; Set saved train line idx
	SCR_ExecAsmBelow
	ld   a, [wTrainLineIdxToResumeToAfterContinue]                  ; $573d
	ld   [wLocationIdxInTrainLine], a                               ; $5740

; Inc num continues, with a max of $ff
	ld   a, [wNumContinuesForLocation]                              ; $5743
	inc  a                                                          ; $5746
	jr   nz, :+                                                     ; $5747
	ld   a, $ff                                                     ; $5749
:	ld   [wNumContinuesForLocation], a                              ; $574b
	call ProcessScriptsFromCurrLoc                                  ; $574e

; Fade out, set flag that we continued, then go back to route display
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wStartedJourneyWithoutSeeingLocationDone, $01
	SCR_StoreByteInAddr wGameState, GS_ROUTE_DISPLAY_INIT
	SCR_StopCurrScript
	SCR_ResumeNextFrame


GameOverScript::
; Play music, fade in, fade out after some time, then go to intro
	SCR_ResumeNextFrame
	SCR_PlaySound MUS_15
	SCR_Call Script_FadeIn
	SCR_Delay $c8
	SCR_Call Script_FadeOut
	SCR_Delay $3c
	SCR_StoreByteInAddr wGameState, GS_INTRO_INIT
	SCR_StopCurrScript


EnterHighScoreScript::
; Game over if trainline 0 or 1 (scores for their harder versions)
	SCR_ExecAsmBelow
	ld   a, [wSelectedTrainLine]                                    ; $5771
	ld   c, a                                                       ; $5774
	or   a                                                          ; $5775
	jr   z, .gameOver                                               ; $5776

	cp   $01                                                        ; $5778
	jr   z, .gameOver                                               ; $577a

; Set ranking idx, 0 from trainline 2
	ld   b, $00                                                     ; $577c
	ld   hl, TrainLineToRankingIdx                                  ; $577e
	add  hl, bc                                                     ; $5781
	ld   a, [hl]                                                    ; $5782
	ld   [wRankingIdxForCurrentTrainLine], a                        ; $5783

; Get final score and pro level
	call GetScoreAndProLevelForRankings                             ; $5786
	ld   a, [wCurrHighScoreWereEnteringNameFor]                     ; $5789
	ld   l, a                                                       ; $578c
	ld   a, [wCurrHighScoreWereEnteringNameFor+1]                   ; $578d
	ld   h, a                                                       ; $5790

; Save the BCD form of the num
	call ConvertHLtoNybbleBCDinBC                                   ; $5791
	ld   a, c                                                       ; $5794
	ld   [wBCDFormOfCurrHighScoreWereEnteringNameFor], a            ; $5795
	ld   a, b                                                       ; $5798
	ld   [wBCDFormOfCurrHighScoreWereEnteringNameFor+1], a          ; $5799

; Get the index of the score we're replacing, and go game over if it's low
	call GetIndexOfOurScorePosition                                 ; $579c
	cp   $07                                                        ; $579f
	ld   de, .afterHighScoreCheck                                   ; $57a1
	jp   c, ProcessScriptsFromDE                                    ; $57a4

.gameOver:
	ld   a, GS_GAME_OVER_INIT                                       ; $57a7
	ld   [wGameState], a                                            ; $57a9
	call ProcessScriptsFromCurrLoc                                  ; $57ac
	SCR_StopCurrScript

.afterHighScoreCheck:
; Display sprites for selection, window underlines, and input side black bits
	SCR_SetSpriteXY $38, $30
	SCR_FarSetSpriteSrc SpriteOam_EnterHighScore

; Set scroll to center the selected tile, reset other vars
	SCR_StoreByteInAddr wEnterScoreNextLetterSCX, $08
	SCR_StoreByteInAddr wEnterScoreNumCharsInputted, $00
	SCR_StoreByteInAddr wEnterScoreCharIdxSelected, $00
	
; Default name is all blank
	SCR_ExecAsmBelow
	ld   a, " "                                                     ; $57c4
	ld   hl, wEnterScoreCurrName                                    ; $57c6
	ld   [hl+], a                                                   ; $57c9
	ld   [hl+], a                                                   ; $57ca
	ld   [hl+], a                                                   ; $57cb
	ld   [hl], a                                                    ; $57cc

; Update tile maps, fade in, then play music
	call UpdateEnterScoreLetterSelectionShadowTileMap               ; $57cd
	call ProcessScriptsFromCurrLoc                                  ; $57d0
	SCR_CallWithSingleUseRet Script_UpdateEnterScoreNameTileMap
	SCR_Call Script_FadeIn
	SCR_PlaySound MUS_05

; --
; -- Main loop
; --
.mainLoop:
; Branch when buttons pressed
	SCR_ExecAsmBelow
	ld   a, [wStickyButtonsHeld]                                    ; $57dc
	bit  PADB_RIGHT, a                                              ; $57df
	ld   de, .heldRight                                             ; $57e1
	jp   nz, ProcessScriptsFromDE                                   ; $57e4

	bit  PADB_LEFT, a                                               ; $57e7
	ld   de, .heldLeft                                              ; $57e9
	jp   nz, ProcessScriptsFromDE                                   ; $57ec

	ld   a, [wButtonsPressed]                                       ; $57ef
	bit  PADB_A, a                                                  ; $57f2
	ld   de, .pressedA                                              ; $57f4
	jp   nz, ProcessScriptsFromDE                                   ; $57f7

	ld   de, .updateTileMapThenMainLoop                             ; $57fa
	jp   ProcessScriptsFromDE                                       ; $57fd

.heldRight:
; Play sound, for 8 frames, scroll right to the next char
	SCR_PlaySound SND_06|MAKE_SOUND_EFFECT
	SCR_SetCounter1 $08
:	SCR_ResumeNextFrame
	SCR_ValInAddrPlusEquByte wEnterScoreNextLetterSCX, $02
	SCR_DecCounter1_JNE :-

; Then scroll back to original position, changing the selected char to be displayed there
	SCR_ValInAddrPlusEquByte wEnterScoreNextLetterSCX, -$10
	SCR_CallWithSingleUseRet Script_ChangeSelectedScoreCharToNext
	
; Don't do anything else while right is being held
	SCR_ExecAsmBelow
	call UpdateEnterScoreLetterSelectionShadowTileMap               ; $5814
	ld   a, [wButtonsHeld]                                          ; $5817
	bit  PADB_RIGHT, a                                              ; $581a
	ld   de, .heldRight                                             ; $581c
	jp   nz, ProcessScriptsFromDE                                   ; $581f

; Else update tile map then allow another input
	call ProcessScriptsFromCurrLoc                                  ; $5822
	SCR_Jump .updateTileMapThenMainLoop

.heldLeft:
; Play sound, for 8 frames, scroll left to the next char
	SCR_PlaySound SND_06|MAKE_SOUND_EFFECT
	SCR_SetCounter1 $08
:	SCR_ResumeNextFrame
	SCR_ValInAddrPlusEquByte wEnterScoreNextLetterSCX, -2
	SCR_DecCounter1_JNE :-

; Then scroll back to original position, changing the selected char to be displayed there
	SCR_ValInAddrPlusEquByte wEnterScoreNextLetterSCX, $10
	SCR_CallWithSingleUseRet Script_ChangeSelectedScoreCharToPrevious
	
; Don't do anything else while left is being held
	SCR_ExecAsmBelow
	call UpdateEnterScoreLetterSelectionShadowTileMap               ; $583c
	ld   a, [wButtonsHeld]                                          ; $583f
	bit  PADB_LEFT, a                                               ; $5842
	ld   de, .heldLeft                                              ; $5844
	jp   nz, ProcessScriptsFromDE                                   ; $5847

; Else update tile map then allow another input
	call ProcessScriptsFromCurrLoc                                  ; $584a
	SCR_Jump .updateTileMapThenMainLoop

.pressedA:
; Branch based on option selected
	SCR_PlaySound SND_06|MAKE_SOUND_EFFECT
	SCR_ExecAsmBelow
	ld   a, [wEnterScoreCharIdxSelected]                            ; $5853
	cp   ENTER_SCORE_DELETE                                         ; $5856
	jr   z, .deleteBtn                                              ; $5858

	cp   ENTER_SCORE_SUBMIT                                         ; $585a
	jr   z, .submitBtn                                              ; $585c

	jr   .enterChar                                                 ; $585e

.deleteBtn:
	ld   hl, wEnterScoreCurrName                                    ; $5860

; Dec num chars inputted
	ld   a, [wEnterScoreNumCharsInputted]                           ; $5863
	or   a                                                          ; $5866
	jr   z, :+                                                      ; $5867
	dec  a                                                          ; $5869
:	ld   [wEnterScoreNumCharsInputted], a                           ; $586a

; In the new idx, fill with a blank
	ld   e, a                                                       ; $586d
	ld   d, $00                                                     ; $586e
	add  hl, de                                                     ; $5870
	ld   [hl], " "                                                  ; $5871
	ld   de, .updateTileMapThenMainLoop                             ; $5873
	jp   ProcessScriptsFromDE                                       ; $5876

; --
; -- Submit
; --
.submitBtn:
; Jump at any point that any char isn't blank
	ld   a, [wEnterScoreCurrName]                                   ; $5879
	cp   " "                                                        ; $587c
	jr   nz, .afterBlankNameSubmitCheck                             ; $587e

	ld   a, [wEnterScoreCurrName+1]                                 ; $5880
	cp   " "                                                        ; $5883
	jr   nz, .afterBlankNameSubmitCheck                             ; $5885

	ld   a, [wEnterScoreCurrName+2]                                 ; $5887
	cp   " "                                                        ; $588a
	jr   nz, .afterBlankNameSubmitCheck                             ; $588c

	ld   a, [wEnterScoreCurrName+3]                                 ; $588e
	cp   " "                                                        ; $5891
	jr   nz, .afterBlankNameSubmitCheck                             ; $5893

; If all blanks, HL = quadruple ranking idx into table
	ld   hl, TrainLineRankingsDefaultNames                          ; $5895
	ld   a, [wRankingIdxForCurrentTrainLine]                        ; $5898
	add  a                                                          ; $589b
	add  a                                                          ; $589c
	ld   e, a                                                       ; $589d
	ld   d, $00                                                     ; $589e
	add  hl, de                                                     ; $58a0

; Fill name with a default based on ranking idx
	ld   de, wEnterScoreCurrName                                    ; $58a1
	ld   a, [hl+]                                                   ; $58a4
	ld   [de], a                                                    ; $58a5
	inc  de                                                         ; $58a6
	ld   a, [hl+]                                                   ; $58a7
	ld   [de], a                                                    ; $58a8
	inc  de                                                         ; $58a9
	ld   a, [hl+]                                                   ; $58aa
	ld   [de], a                                                    ; $58ab
	inc  de                                                         ; $58ac
	ld   a, [hl+]                                                   ; $58ad
	ld   [de], a                                                    ; $58ae

.afterBlankNameSubmitCheck:
; Play sound and update name tile map again
	call ProcessScriptsFromCurrLoc                                  ; $58af
	SCR_PlaySound SND_06|MAKE_SOUND_EFFECT
	SCR_CallWithSingleUseRet Script_UpdateEnterScoreNameTileMap
	
; Save our high score, then save data
	SCR_ExecAsmBelow
	call SaveOurHighScoreInTheRelevantPlace                         ; $58b8
	call SaveSaveData                                               ; $58bb
	call ProcessScriptsFromCurrLoc                                  ; $58be

; Clear sound and fade out..
	SCR_Delay $14
	SCR_PlaySound MUS_NULL
	SCR_Call Script_FadeOut

; Then set prev screen to flash the high-score we set, and go to the ranking state
	SCR_StoreByteFromWord1InWord2 wRankingIdxForCurrentTrainLine, wRankingsPrevScreen
	SCR_StoreByteInAddr wGameState, GS_RANKING_INIT
	SCR_StopCurrScript

.enterChar:
; Ignore if all 4 chars already entered
	ld   a, [wEnterScoreNumCharsInputted]                           ; $58d2
	cp   $04                                                        ; $58d5
	jr   nc, .toUpdateTileMapThenMainLoop                           ; $58d7

; HL = name addr to write char to
	ld   hl, wEnterScoreCurrName                                    ; $58d9
	ld   a, [wEnterScoreNumCharsInputted]                           ; $58dc
	ld   e, a                                                       ; $58df
	ld   d, $00                                                     ; $58e0
	add  hl, de                                                     ; $58e2

; Save char in it
	ld   a, [wEnterScoreCharIdxSelected]                            ; $58e3
	ld   [hl], a                                                    ; $58e6

; Save inc'd num chars done
	inc  e                                                          ; $58e7
	ld   a, e                                                       ; $58e8
	ld   [wEnterScoreNumCharsInputted], a                           ; $58e9

; Jump ahead if we didn't fill in all 4 chars yet
	cp   $04                                                        ; $58ec
	ld   de, .updateTileMapThenMainLoop                             ; $58ee
	jp   nz, ProcessScriptsFromDE                                   ; $58f1

.loopMovingToSubmitBtn:
; Once all 4 chars are submitted, exit out of this loop when Submit is selected..
	call UpdateEnterScoreLetterSelectionShadowTileMap               ; $58f4
	ld   a, [wEnterScoreCharIdxSelected]                            ; $58f7
	cp   ENTER_SCORE_SUBMIT                                         ; $58fa
	ld   de, .updateTileMapThenMainLoop                             ; $58fc
	jp   z, ProcessScriptsFromDE                                    ; $58ff

; Else update name tile map, and scroll selected score char right
	call ProcessScriptsFromCurrLoc                                  ; $5902
	SCR_CallWithSingleUseRet Script_UpdateEnterScoreNameTileMap
	SCR_CallWithSingleUseRet Script_ChangeSelectedScoreCharToNext
	SCR_ResumeNextFrame
	
	SCR_ExecAsmBelow
	jr   .loopMovingToSubmitBtn                                     ; $590d

.toUpdateTileMapThenMainLoop:
	ld   de, .updateTileMapThenMainLoop                             ; $590f
	jp   ProcessScriptsFromDE                                       ; $5912

.updateTileMapThenMainLoop:
	SCR_CallWithSingleUseRet Script_UpdateEnterScoreNameTileMap
	SCR_ResumeNextFrame
	SCR_Jump .mainLoop


Script_UpdateEnterScoreNameTileMap:
	SCR_ExecAsmBelow
	ld   de, wEnterScoreNameTileMap                                 ; $591d
	ld   bc, wEnterScoreNameTileMap+8                               ; $5920

DEF SCORE_CURR_NAME_ADDR = $dc40
ASSERT wEnterScoreCurrName == $dc40
rept 4
; For curr char, get its quadruple idx into the metatile data table
	ld   a, [SCORE_CURR_NAME_ADDR]                                  ; $5923
	add  a                                                          ; $5926
	add  a                                                          ; $5927
	ld   hl, RankingsMetatileTileIdxes                              ; $5928
	add  l                                                          ; $592b
	ld   l, a                                                       ; $592c
	ld   a, h                                                       ; $592d
	adc  $00                                                        ; $592e
	ld   h, a                                                       ; $5930

; Copy the metatile's tiles into the name tile map top half..
	ld   a, [hl+]                                                   ; $5931
	ld   [de], a                                                    ; $5932
	inc  de                                                         ; $5933
	ld   a, [hl+]                                                   ; $5934
	ld   [de], a                                                    ; $5935
	inc  de                                                         ; $5936

; Then the name tile map bottom half
	ld   a, [hl+]                                                   ; $5937
	ld   [bc], a                                                    ; $5938
	inc  bc                                                         ; $5939
	ld   a, [hl+]                                                   ; $593a
	ld   [bc], a                                                    ; $593b
	inc  bc                                                         ; $593c

SCORE_CURR_NAME_ADDR = SCORE_CURR_NAME_ADDR + 1
endr

	call ProcessScriptsFromCurrLoc                                  ; $598b
	SCR_SingleUseRet
	
	
RankingsMetatileTileIdxes::
	db $9c, $9e, $9d, $9f
	db $a0, $a2, $a1, $a3
	db $a4, $a6, $a5, $a7
	db $a8, $aa, $a9, $ab
	db $ac, $ae, $ad, $af
	db $b0, $b2, $b1, $b3
	db $b4, $b6, $b5, $b7
	db $b8, $ba, $b9, $bb
	db $bc, $be, $bd, $bf
	db $c0, $c2, $c1, $c3
	db $c4, $c6, $c5, $c7
	db $c8, $ca, $c9, $cb
	db $cc, $ce, $cd, $cf
	db $d0, $d2, $d1, $d3
	db $d4, $d6, $d5, $d7
	db $d8, $da, $d9, $db
	db $dc, $de, $dd, $df
	db $e0, $e2, $e1, $e3
	db $e4, $e6, $e5, $e7
	db $e8, $ea, $e9, $eb
	db $ec, $ee, $ed, $ef
	db $f0, $f2, $f1, $f3
	db $f4, $f6, $f5, $f7
	db $f8, $fa, $f9, $fb
	db $fc, $fe, $fd, $ff
	db $00, $02, $01, $03
	db $04, $06, $05, $07
	db $08, $0a, $09, $0b
	db $0c, $0e, $0d, $0f
	db $10, $12, $11, $13
	db $14, $16, $15, $17
	db $18, $1a, $19, $1b
	db $1c, $1e, $1d, $1f
	db $20, $22, $21, $23
	db $24, $26, $25, $27
	db $28, $2a, $29, $2b
	db $2c, $2e, $2d, $2f
	db $30, $32, $31, $33
	db $34, $36, $35, $37
	db $38, $3a, $39, $3b
	db $3c, $3e, $3d, $3f
	db $40, $42, $41, $43
	db $44, $46, $45, $47
	db $48, $4a, $49, $4b
	db $4c, $4e, $4d, $4f
	db $50, $52, $51, $53
	db $54, $56, $55, $57
	db $58, $5a, $59, $5b
	db $5c, $5e, $5d, $5f
	db $60, $62, $61, $63
	db $64, $66, $65, $67
	db $68, $6a, $69, $6b
	db $6c, $6e, $6d, $6f
	db $70, $72, $71, $73
	db $74, $76, $75, $77
	db $78, $7a, $79, $7b
	db $7c, $7e, $7d, $7f
	db $9c, $9e, $9d, $9f
	db $a0, $a2, $a1, $a3
	db $a4, $a6, $a5, $a7
	db $a8, $aa, $a9, $ab
	db $ac, $ae, $ad, $af
	db $b0, $b2, $b1, $b3
	db $b4, $b6, $b5, $b7
	db $b8, $ba, $b9, $bb
	db $bc, $be, $bd, $bf
	db $c0, $c2, $c1, $c3
	db $c4, $c6, $c5, $c7
	db $c8, $ca, $c9, $cb
	db $cc, $ce, $cd, $cf
	db $d0, $d2, $d1, $d3
	db $d4, $d6, $d5, $d7
	db $d8, $da, $d9, $db
	db $dc, $de, $dd, $df
	db $e0, $e2, $e1, $e3
	db $e4, $e6, $e5, $e7
	db $e8, $ea, $e9, $eb
	db $ec, $ee, $ed, $ef
	db $f0, $f2, $f1, $f3
	db $f4, $f6, $f5, $f7
	db $f8, $fa, $f9, $fb
	db $fc, $fe, $fd, $ff
	db $00, $02, $01, $03
	db $04, $06, $05, $07
	db $08, $0a, $09, $0b
	db $0c, $0e, $0d, $0f
	db $10, $12, $11, $13
	db $14, $16, $15, $17
	db $18, $1a, $19, $1b
	db $1c, $1e, $1d, $1f
	db $20, $22, $21, $23
	db $24, $26, $25, $27
	db $28, $2a, $29, $2b
	db $2c, $2e, $2d, $2f
	db $30, $32, $31, $33
	db $34, $36, $35, $37
	db $38, $3a, $39, $3b
	db $3c, $3e, $3d, $3f
	db $40, $42, $41, $43
	db $44, $46, $45, $47
	db $48, $4a, $49, $4b
	db $4c, $4e, $4d, $4f
	db $50, $52, $51, $53
	db $54, $56, $55, $57
	db $58, $5a, $59, $5b
	db $5c, $5e, $5d, $5f
	db $60, $62, $61, $63
	db $64, $66, $65, $67
	db $68, $6a, $69, $6b
	db $6c, $6e, $6d, $6f
	db $70, $72, $71, $73
	db $74, $76, $75, $77
	db $78, $7a, $79, $7b
	db $7c, $7e, $7d, $7f


RankingsChangingTilesLocations::
	dw $9c21
	dw $9c23
	dw $9c25
	dw $9c27
	dw $9c2a
	dw $9c2c
	dw $9c2e
	dw $9c31
	dw $9c61
	dw $9c63
	dw $9c65
	dw $9c67
	dw $9c6a
	dw $9c6c
	dw $9c6e
	dw $9c71
	dw $9ca1
	dw $9ca3
	dw $9ca5
	dw $9ca7
	dw $9caa
	dw $9cac
	dw $9cae
	dw $9cb1
	dw $9ce1
	dw $9ce3
	dw $9ce5
	dw $9ce7
	dw $9cea
	dw $9cec
	dw $9cee
	dw $9cf1
	dw $9d21
	dw $9d23
	dw $9d25
	dw $9d27
	dw $9d2a
	dw $9d2c
	dw $9d2e
	dw $9d31
	dw $9d61
	dw $9d63
	dw $9d65
	dw $9d67
	dw $9d6a
	dw $9d6c
	dw $9d6e
	dw $9d71
	dw $9da1
	dw $9da3
	dw $9da5
	dw $9da7
	dw $9daa
	dw $9dac
	dw $9dae
	dw $9db1


RankingsLeftNumbersLocations::
	dw $9c20
	dw $9c60
	dw $9ca0
	dw $9ce0
	dw $9d20
	dw $9d60
	dw $9da0


Script_ChangeSelectedScoreCharToNext:
	SCR_ExecAsmBelow
	ld   a, [wEnterScoreCharIdxSelected]                            ; $5bd6
	inc  a                                                          ; $5bd9
	cp   NUM_ENTER_SCORE_OPTS                                       ; $5bda
	jr   c, :+                                                      ; $5bdc
	xor  a                                                          ; $5bde
:	ld   [wEnterScoreCharIdxSelected], a                            ; $5bdf
	call ProcessScriptsFromCurrLoc                                  ; $5be2
	SCR_SingleUseRet
	
	
Script_ChangeSelectedScoreCharToPrevious:
	SCR_ExecAsmBelow
	ld   a, [wEnterScoreCharIdxSelected]                            ; $5be7
	sub  $01                                                        ; $5bea
	jr   nc, :+                                                     ; $5bec
	ld   a, NUM_ENTER_SCORE_OPTS-1                                  ; $5bee
:	ld   [wEnterScoreCharIdxSelected], a                            ; $5bf0
	call ProcessScriptsFromCurrLoc                                  ; $5bf3
	SCR_SingleUseRet
	
	
UpdateEnterScoreLetterSelectionShadowTileMap:
; 5th character before selected is the 1st to display
; Metatiles are repeated, so NUM_ENTER_SCORE_OPTS-5 is also the correct choice
	ld   a, [wEnterScoreCharIdxSelected]                            ; $5bf7
	ld   de, wEnterScoreDisplayedLetterSelectionTileMap             ; $5bfa
	sub  $05                                                        ; $5bfd
	jr   nc, :+                                                     ; $5bff
	add  NUM_ENTER_SCORE_OPTS                                       ; $5c01

; Metatile idx is a quadruple index into the table
:	add  a                                                          ; $5c03
	add  a                                                          ; $5c04
	ld   c, a                                                       ; $5c05
	ld   b, $00                                                     ; $5c06
	ld   hl, RankingsMetatileTileIdxes                              ; $5c08
	add  hl, bc                                                     ; $5c0b

; For 16 loaded tiles, copy 2 bytes from the metatile..
	ld   b, $10                                                     ; $5c0c
.loopTopHalf:
	ld   a, [hl+]                                                   ; $5c0e
	ld   [de], a                                                    ; $5c0f
	inc  de                                                         ; $5c10
	ld   a, [hl+]                                                   ; $5c11
	ld   [de], a                                                    ; $5c12

; Then skip the bottom 2, and move to the next character
	inc  de                                                         ; $5c13
	inc  hl                                                         ; $5c14
	inc  hl                                                         ; $5c15
	dec  b                                                          ; $5c16
	jr   nz, .loopTopHalf                                           ; $5c17

; Repeat for bottom half
	ld   a, [wEnterScoreCharIdxSelected]                            ; $5c19
	sub  $05                                                        ; $5c1c
	jr   nc, :+                                                     ; $5c1e
	add  NUM_ENTER_SCORE_OPTS                                       ; $5c20

; Quadruple index, into bottom half of metatile
:	add  a                                                          ; $5c22
	add  a                                                          ; $5c23
	ld   c, a                                                       ; $5c24
	ld   b, $00                                                     ; $5c25
	ld   hl, RankingsMetatileTileIdxes+2                            ; $5c27
	add  hl, bc                                                     ; $5c2a

; Copy 2 bottom half bytes, skip the next one's top, do their bottom, etc
	ld   b, $10                                                     ; $5c2b

.loopBottomHalf:
	ld   a, [hl+]                                                   ; $5c2d
	ld   [de], a                                                    ; $5c2e
	inc  de                                                         ; $5c2f
	ld   a, [hl+]                                                   ; $5c30
	ld   [de], a                                                    ; $5c31
	inc  de                                                         ; $5c32
	inc  hl                                                         ; $5c33
	inc  hl                                                         ; $5c34
	dec  b                                                          ; $5c35
	jr   nz, .loopBottomHalf                                        ; $5c36

	ret                                                             ; $5c38


TrainLineRankingsDefaultNames:
	db "209", $34
	db "100", $35
	db "E3", $34, $36
	db "681", $34
	db "103", $34
	db "813", $34
	db "223", $34
	db "883", $34


SaveOurHighScoreInTheRelevantPlace:
; Return if we're at the last place in the rankings
	ld   a, [wRankingsCurrLeftNumberIdxBeingOperatedOn]             ; $5c59
	cp   $07                                                        ; $5c5c
	ret  nc                                                         ; $5c5e

; C = 1 to 7
	inc  a                                                          ; $5c5f
	ld   c, a                                                       ; $5c60

; Get trainline's ranking double idx into table
	ld   a, [wRankingIdxForCurrentTrainLine]                        ; $5c61
	add  a                                                          ; $5c64
	ld   hl, EnterScoreStartAddressesToCopyDownwards                ; $5c65
	ld   e, a                                                       ; $5c68
	ld   d, $00                                                     ; $5c69
	add  hl, de                                                     ; $5c6b

; Get word pointed to into DE, add add 7 to it to get HL
; ie to start with, DE points to 6th place, HL points to 7th place
	ld   a, [hl+]                                                   ; $5c6c
	ld   d, [hl]                                                    ; $5c6d
	ld   e, a                                                       ; $5c6e
	ld   hl, SCORE_SIZEOF                                           ; $5c6f
	add  hl, de                                                     ; $5c72

; Exit out of loop once B == ranking place+1
	ld   b, $07                                                     ; $5c73
.loop:
	ld   a, c                                                       ; $5c75
	cp   b                                                          ; $5c76
	jr   z, .saveCurrName                                           ; $5c77

; Copy ranking to next one
rept 7
	ld   a, [de]                                                    ; $5c79
	ld   [hl+], a                                                   ; $5c7a
	inc  de                                                         ; $5c7b
endr

; Shift copying addresses to start of ranking above
	ld   a, e                                                       ; $5c8e
	sub  LOW(2*SCORE_SIZEOF)                                        ; $5c8f
	ld   e, a                                                       ; $5c91
	ld   a, d                                                       ; $5c92
	sbc  HIGH(2*SCORE_SIZEOF)                                       ; $5c93
	ld   d, a                                                       ; $5c95

	ld   a, l                                                       ; $5c96
	sub  LOW(2*SCORE_SIZEOF)                                        ; $5c97
	ld   l, a                                                       ; $5c99
	ld   a, h                                                       ; $5c9a
	sbc  HIGH(2*SCORE_SIZEOF)                                       ; $5c9b
	ld   h, a                                                       ; $5c9d

	dec  b                                                          ; $5c9e
	jr   nz, .loop                                                  ; $5c9f

	ret                                                             ; $5ca1

.saveCurrName:
; Now save our score, starting with our entered name..
	ld   de, wEnterScoreCurrName                                    ; $5ca2
	ld   a, [de]                                                    ; $5ca5
	ld   [hl+], a                                                   ; $5ca6
	inc  de                                                         ; $5ca7
	ld   a, [de]                                                    ; $5ca8
	ld   [hl+], a                                                   ; $5ca9
	inc  de                                                         ; $5caa
	ld   a, [de]                                                    ; $5cab
	ld   [hl+], a                                                   ; $5cac
	inc  de                                                         ; $5cad
	ld   a, [de]                                                    ; $5cae
	ld   [hl+], a                                                   ; $5caf

; The the 2-byte BCD form of our score
	ld   de, wBCDFormOfCurrHighScoreWereEnteringNameFor+1           ; $5cb0
	ld   a, [de]                                                    ; $5cb3
	ld   [hl+], a                                                   ; $5cb4
	dec  de                                                         ; $5cb5
	ld   a, [de]                                                    ; $5cb6
	ld   [hl+], a                                                   ; $5cb7

; Then our pro level
	ld   a, [wCurrProLevelWereEnteringNameFor]                      ; $5cb8
	ld   [hl], a                                                    ; $5cbb
	ret                                                             ; $5cbc


EnterScoreStartAddressesToCopyDownwards:
	dw wTrainlineRankings+5*7 + 0*7*SCORE_SIZEOF
	dw wTrainlineRankings+5*7 + 1*7*SCORE_SIZEOF
	dw wTrainlineRankings+5*7 + 2*7*SCORE_SIZEOF
	dw wTrainlineRankings+5*7 + 3*7*SCORE_SIZEOF
	dw wTrainlineRankings+5*7 + 4*7*SCORE_SIZEOF
	dw wTrainlineRankings+5*7 + 5*7*SCORE_SIZEOF
	dw wTrainlineRankings+5*7 + 6*7*SCORE_SIZEOF
	dw wTrainlineRankings+5*7 + 7*7*SCORE_SIZEOF
	
	
ResetHighScores::
; For each score for a trainline ranking struct..
DEF RANKINGS_DEST = $d17b
DEF DEFAULT_NAME_SRC = TrainLineRankingsDefaultNames
ASSERT wTrainlineRankings == $d17b

rept 8
	ld   b, $07                                                     ; $5ccd
	ld   de, RANKINGS_DEST                                          ; $5ccf
	ld   hl, DEFAULT_NAME_SRC                                       ; $5cd2
:	push hl                                                         ; $5cd5

; Copy 4 bytes of the trainline's default name
	ld   a, [hl+]                                                   ; $5cd6
	ld   [de], a                                                    ; $5cd7
	inc  de                                                         ; $5cd8
	ld   a, [hl+]                                                   ; $5cd9
	ld   [de], a                                                    ; $5cda
	inc  de                                                         ; $5cdb
	ld   a, [hl+]                                                   ; $5cdc
	ld   [de], a                                                    ; $5cdd
	inc  de                                                         ; $5cde
	ld   a, [hl]                                                    ; $5cdf
	ld   [de], a                                                    ; $5ce0
	inc  de                                                         ; $5ce1

; SCORE_BCD of struct = eg 0700
	ld   a, b                                                       ; $5ce2
	ld   [de], a                                                    ; $5ce3
	inc  de                                                         ; $5ce4
	ld   a, $00                                                     ; $5ce5
	ld   [de], a                                                    ; $5ce7
	inc  de                                                         ; $5ce8

; No pro rating
	ld   a, $00                                                     ; $5ce9
	ld   [de], a                                                    ; $5ceb
	inc  de                                                         ; $5cec
	pop  hl                                                         ; $5ced
	dec  b                                                          ; $5cee
	jr   nz, :-                                                     ; $5cef

RANKINGS_DEST = RANKINGS_DEST + 49
DEFAULT_NAME_SRC = DEFAULT_NAME_SRC + 4

endr

	ret                                                             ; $5ded


GetIndexOfOurScorePosition:
; HL = ranking double idx into table
	ld   a, [wRankingIdxForCurrentTrainLine]                        ; $5dee
	add  a                                                          ; $5df1
	ld   e, a                                                       ; $5df2
	ld   d, $00                                                     ; $5df3
	ld   hl, TrainLineRankingsAddressesForLowestBCDScore            ; $5df5
	add  hl, de                                                     ; $5df8

; HL = word pointed to
	ld   a, [hl+]                                                   ; $5df9
	ld   h, [hl]                                                    ; $5dfa
	ld   l, a                                                       ; $5dfb

	ld   de, -SCORE_SIZEOF                                          ; $5dfc
	ld   b, $07                                                     ; $5dff

.loopB:
; C = current score (starting from the lowest) high BCD byte
	push hl                                                         ; $5e01
	ld   a, [hl+]                                                   ; $5e02
	ld   c, a                                                       ; $5e03

; We're done if our score highest BCD byte is less, loop if we're greater
	ld   a, [wBCDFormOfCurrHighScoreWereEnteringNameFor+1]          ; $5e04
	cp   c                                                          ; $5e07
	jr   c, .popHLdone                                              ; $5e08

	jr   nz, .toLoop                                                ; $5e0a

; C = current score low BCD byte
	ld   c, [hl]                                                    ; $5e0c

; If our score is <= the saved high-score, we're done
	ld   a, [wBCDFormOfCurrHighScoreWereEnteringNameFor]            ; $5e0d
	cp   c                                                          ; $5e10
	jr   c, .popHLdone                                              ; $5e11

	jr   z, .popHLdone                                              ; $5e13

.toLoop:
; Dec to score above
	pop  hl                                                         ; $5e15
	add  hl, de                                                     ; $5e16
	dec  b                                                          ; $5e17
	jr   nz, .loopB                                                 ; $5e18

	jr   .done                                                      ; $5e1a

.popHLdone:
	pop  hl                                                         ; $5e1c

.done:
	ld   a, b                                                       ; $5e1d
	ld   [wRankingsCurrLeftNumberIdxBeingOperatedOn], a             ; $5e1e
	ret                                                             ; $5e21


TrainLineRankingsAddressesForLowestBCDScore:
	dw wTrainlineRankings + 6*SCORE_SIZEOF + SCORE_BCD + 0 * 7*SCORE_SIZEOF
	dw wTrainlineRankings + 6*SCORE_SIZEOF + SCORE_BCD + 1 * 7*SCORE_SIZEOF
	dw wTrainlineRankings + 6*SCORE_SIZEOF + SCORE_BCD + 2 * 7*SCORE_SIZEOF
	dw wTrainlineRankings + 6*SCORE_SIZEOF + SCORE_BCD + 3 * 7*SCORE_SIZEOF
	dw wTrainlineRankings + 6*SCORE_SIZEOF + SCORE_BCD + 4 * 7*SCORE_SIZEOF
	dw wTrainlineRankings + 6*SCORE_SIZEOF + SCORE_BCD + 5 * 7*SCORE_SIZEOF
	dw wTrainlineRankings + 6*SCORE_SIZEOF + SCORE_BCD + 6 * 7*SCORE_SIZEOF
	dw wTrainlineRankings + 6*SCORE_SIZEOF + SCORE_BCD + 7 * 7*SCORE_SIZEOF


GetScoreAndProLevelForRankings:
; DE = in-game distance counter, DEHL becomes distance ctr * 15
	ld   a, [wInGameDistanceCounter]                                ; $5e32
	ld   e, a                                                       ; $5e35
	ld   a, [wInGameDistanceCounter+1]                              ; $5e36
	ld   d, a                                                       ; $5e39
	ld   bc, 15                                                     ; $5e3a
	call DEHLequDEtimesBC                                           ; $5e3d

; DEHL /= 4
	srl  d                                                          ; $5e40
	rr   e                                                          ; $5e42
	rr   h                                                          ; $5e44
	rr   l                                                          ; $5e46
	srl  d                                                          ; $5e48
	rr   e                                                          ; $5e4a
	rr   h                                                          ; $5e4c
	rr   l                                                          ; $5e4e

; Divide again by 25, distance ctr*15/100 ie distance ctr * num frames in 1 second * 10
	ld   e, 25                                                      ; $5e50
	call HLdivE_divInHLmodInD                                       ; $5e52
	push hl                                                         ; $5e55

; HL = total score * 10
	ld   a, [wTotalScore]                                           ; $5e56
	ld   l, a                                                       ; $5e59
	ld   h, 10                                                      ; $5e5a
	call HLequHtimesL                                               ; $5e5c

; Save 10 * seconds in-game + total score * 10, ie 10*(distance+score)
; Although display has a decimal, so score km is (distance + score)
	pop  de                                                         ; $5e5f
	add  hl, de                                                     ; $5e60
	ld   a, l                                                       ; $5e61
	ld   [wCurrHighScoreWereEnteringNameFor], a                     ; $5e62
	ld   a, h                                                       ; $5e65
	ld   [wCurrHighScoreWereEnteringNameFor+1], a                   ; $5e66

; Get speed meter option + 2, if distance is hidden
; speed hidden | distance hidden | total
;           No |              No |     0
;          Yes |              No |     1
;           No |             Yes |     2
;          Yes |             Yes |     3
	ld   b, $00                                                     ; $5e69
	ld   a, [wSpeedMeterOption]                                     ; $5e6b
	add  b                                                          ; $5e6e
	ld   b, a                                                       ; $5e6f
	ld   a, [wDistanceMeterOption]                                  ; $5e70
	and  $02                                                        ; $5e73
	add  b                                                          ; $5e75

; Set pro level
	ld   a, a                                                       ; $5e76
	ld   [wCurrProLevelWereEnteringNameFor], a                      ; $5e77
	ret                                                             ; $5e7a


TrainLineToRankingIdx:
	db $01, $02, $00, $01
	db $02, $03, $04, $05
	db $06, $07, $02


RankingsScript::
; Reset state vars
	SCR_StoreByteInAddr wRankingsCurrLeftNumberTileAttr, $00
	SCR_StoreByteInAddr wRankingsShouldDrawNextMetatile, $00
	SCR_StoreByteInAddr wRankingsIsErasingText, $00

; Different init based on which state we came from
	SCR_ExecAsmBelow
	ld   a, [wRankingsPrevScreen]                                   ; $5e93
	cp   RANKINGS_FROM_DEMO                                         ; $5e96
	ld   de, RankingsScriptFromTrainlineStage                       ; $5e98
	jp   c, ProcessScriptsFromDE                                    ; $5e9b

	cp   RANKINGS_FROM_TITLE_SCREEN_OPTS                            ; $5e9e
	ld   de, .cameFromTitleScreenOpts                               ; $5ea0
	jp   z, ProcessScriptsFromDE                                    ; $5ea3

; From title screen demo
	call ProcessScriptsFromCurrLoc                                  ; $5ea6
	SCR_Call Script_FadeIn
	SCR_StartSubScript1 RankingsSubscript1_WaitingForStartPressedToTitleScreen
	SCR_Jump .mainLoop

; From title screen opts
.cameFromTitleScreenOpts:
	SCR_Call Script_FadeIn
	SCR_StartSubScript1 RankingsSubscript1_WaitingForBPressedToTitleScreenOpts

.mainLoop:
; Start with 1st header
	SCR_StoreByteInAddr wSCY, $00

; Display initial screen
	SCR_StoreWordInAddr wRankingsCurrTrainLineBeingDisplayed, wTrainlineRankings
	SCR_Call Script_DisplayRankingsText
	SCR_Call Script_FlashProOnProScores
	SCR_Call Script_WaitUntilNextRankingsScreenToDisplay

DEF CURR_TRAINLINE_SCORES_ADDR = $d17b + 7 * 7
ASSERT wTrainlineRankings == $d17b
rept 7
	SCR_Call Script_StopOtherScriptsAndHideTheirSprites
	SCR_Call Script_EraseRankingsText
	SCR_Call Script_ScrollRankingsBGHeaderDown
	SCR_StoreWordInAddr wRankingsCurrTrainLineBeingDisplayed, CURR_TRAINLINE_SCORES_ADDR
	SCR_Call Script_DisplayRankingsText
	SCR_Call Script_FlashProOnProScores
	SCR_Call Script_WaitUntilNextRankingsScreenToDisplay
DEF CURR_TRAINLINE_SCORES_ADDR = CURR_TRAINLINE_SCORES_ADDR + 7 * 7
endr

; Once all train line scores shown, exit state
	SCR_ExecAsmBelow
	ld   a, [wRankingsPrevScreen]                                   ; $5f6e
	cp   RANKINGS_FROM_DEMO                                         ; $5f71
	ld   de, .exitTitleScreenDemo                                   ; $5f73
	jp   z, ProcessScriptsFromDE                                    ; $5f76

; Else start from 1st trainline again
	call ProcessScriptsFromCurrLoc                                  ; $5f79
	SCR_Call Script_StopOtherScriptsAndHideTheirSprites
	SCR_Call Script_EraseRankingsText
	SCR_Call Script_ScrollRankingsBGHeaderDown
	SCR_Jump .mainLoop

.exitTitleScreenDemo:
	SCR_StopSubScript1
	SCR_Call Script_FadeOut
	SCR_ExecAsmBelow
	call SetGameStateAndInGameDetailsBasedOnTitleScreenDemoStepIdx  ; $5f8d
	call ProcessScriptsFromCurrLoc                                  ; $5f90
	SCR_StopCurrScript


RankingsSubscript1_WaitingForStartPressedToTitleScreen:
; Exit loop when Start pressed
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $5f96
	bit  PADB_START, a                                              ; $5f99
	ld   de, :-                                                     ; $5f9b
	jp   z, ProcessScriptsFromDE                                    ; $5f9e

; Start fade
	call ProcessScriptsFromCurrLoc                                  ; $5fa1
	SCR_StoreByteInAddr wLoadPalettesFromRam, $01

DEF CURR_FADE = 4
rept 8
	SCR_ExecAsmBelow
	ld   a, CURR_FADE                                               ; $5fa9
	ld   [wPaletteFadeAmount], a                                    ; $5fab
	ld   a, $01                                                     ; $5fae
	ld   [wLoadPalettesFromRam], a                                  ; $5fb0
	call ProcessScriptsFromCurrLoc                                  ; $5fb3
	SCR_Delay $02
CURR_FADE = CURR_FADE + 4
endr

; Inc demo step to get to title screen
	SCR_ExecAsmBelow
	call IncTitleScreenDemoStepUntilTitleScreenStateSet             ; $6029
	call ProcessScriptsFromCurrLoc                                  ; $602c
	SCR_StopSubScript1
	SCR_ResumeNextFrame


RankingsSubscript1_WaitingForBPressedToTitleScreenOpts:
; Exit loop when B pressed
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $6033
	bit  PADB_B, a                                                  ; $6036
	ld   de, :-                                                     ; $6038
	jp   z, ProcessScriptsFromDE                                    ; $603b

; Start fade out
	call ProcessScriptsFromCurrLoc                                  ; $603e
	SCR_StoreByteInAddr wLoadPalettesFromRam, $01

DEF CURR_FADE = $04
rept 8
	SCR_ExecAsmBelow
	ld   a, CURR_FADE                                               ; $6046
	ld   [wPaletteFadeAmount], a                                    ; $6048
	ld   a, $01                                                     ; $604b
	ld   [wLoadPalettesFromRam], a                                  ; $604d
	call ProcessScriptsFromCurrLoc                                  ; $6050
	SCR_Delay $02
CURR_FADE = CURR_FADE + 4
endr

; Set title screen opts state
	SCR_StoreByteInAddr wGameState, GS_TITLE_SCREEN_OPTS_INIT
	SCR_StopSubScript1
	SCR_ResumeNextFrame


RankingsScriptFromTrainlineStage:
; Flash while doing functionality below
	SCR_StartSubScript1 RankingsSubScript1_FlashLeftmostNumbers
	SCR_CallTableIdxInAddr :+, wRankingsPrevScreen
:	dw .trainline1
	dw .trainline2
	dw .trainline3
	dw .trainline4
	dw .trainline5
	dw .trainline6
	dw .trainline7
	dw .trainline8

.trainline1:
	SCR_StoreByteInAddr wSCY, $00
	SCR_StoreWordInAddr wRankingsCurrTrainLineBeingDisplayed, \
		wTrainlineRankings+0*NUM_SCORES_PER_TRAINLINE*SCORE_SIZEOF
	SCR_Jump .cont

.trainline2:
	SCR_StoreByteInAddr wSCY, $10
	SCR_StoreWordInAddr wRankingsCurrTrainLineBeingDisplayed, \
		wTrainlineRankings+1*NUM_SCORES_PER_TRAINLINE*SCORE_SIZEOF
	SCR_Jump .cont

.trainline3:
	SCR_StoreByteInAddr wSCY, $20
	SCR_StoreWordInAddr wRankingsCurrTrainLineBeingDisplayed, \
		wTrainlineRankings+2*NUM_SCORES_PER_TRAINLINE*SCORE_SIZEOF
	SCR_Jump .cont

.trainline4:
	SCR_StoreByteInAddr wSCY, $30
	SCR_StoreWordInAddr wRankingsCurrTrainLineBeingDisplayed, \
		wTrainlineRankings+3*NUM_SCORES_PER_TRAINLINE*SCORE_SIZEOF
	SCR_Jump .cont

.trainline5:
	SCR_StoreByteInAddr wSCY, $40
	SCR_StoreWordInAddr wRankingsCurrTrainLineBeingDisplayed, \
		wTrainlineRankings+4*NUM_SCORES_PER_TRAINLINE*SCORE_SIZEOF
	SCR_Jump .cont

.trainline6:
	SCR_StoreByteInAddr wSCY, $50
	SCR_StoreWordInAddr wRankingsCurrTrainLineBeingDisplayed, \
		wTrainlineRankings+5*NUM_SCORES_PER_TRAINLINE*SCORE_SIZEOF
	SCR_Jump .cont

.trainline7:
	SCR_StoreByteInAddr wSCY, $60
	SCR_StoreWordInAddr wRankingsCurrTrainLineBeingDisplayed, \
		wTrainlineRankings+6*NUM_SCORES_PER_TRAINLINE*SCORE_SIZEOF
	SCR_Jump .cont

.trainline8:
	SCR_StoreByteInAddr wSCY, $70
	SCR_StoreWordInAddr wRankingsCurrTrainLineBeingDisplayed, \
		wTrainlineRankings+7*NUM_SCORES_PER_TRAINLINE*SCORE_SIZEOF

.cont:
; Fade screen in, then display all scores while shuttering them
	SCR_Call Script_FadeIn
	SCR_CreateOtherScript 1, RankingsOtherScript_Col0
	SCR_Delay $04
	SCR_CreateOtherScript 2, RankingsOtherScript_Col1
	SCR_Delay $04
	SCR_CreateOtherScript 3, RankingsOtherScript_Col2
	SCR_Delay $04
	SCR_CreateOtherScript 4, RankingsOtherScript_Col3
	SCR_Delay $04
	SCR_CreateOtherScript 5, RankingsOtherScript_Col4
	SCR_Delay $04
	SCR_CreateOtherScript 6, RankingsOtherScript_Col5
	SCR_Delay $04
	SCR_CreateOtherScript 7, RankingsOtherScript_Col6
	SCR_Delay $04
	SCR_CreateOtherScript 8, RankingsOtherScript_Col7

; Flash pro after
	SCR_Delay $04
	SCR_Delay $e0
	SCR_Call Script_FlashProOnProScores

; After a delay, hide shutters
	SCR_Delay $b4
	SCR_Call Script_StopOtherScriptsAndHideTheirSprites
	SCR_StopSubScript1

; Stop flashing left num, fade out, then set game state
	SCR_StoreByteInAddr wRankingsCurrLeftNumberTileAttr, $01
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wGameState, GS_GAME_OVER_INIT
	SCR_StopCurrScript


RankingsSubScript1_FlashLeftmostNumbers:
:	SCR_StoreByteInAddr wRankingsCurrLeftNumberTileAttr, $01
	SCR_Delay $0a
	SCR_StoreByteInAddr wRankingsCurrLeftNumberTileAttr, $02
	SCR_Delay $08
	SCR_Jump :-


DEF SCORE_STRUCT_BYTE_OFFSET = SCRIPT_VAR_1D
DEF TILE_IDX_WITHIN_ROW = SCRIPT_VAR_1E
RankingsOtherScript_Col0:
	SCR_StoreByteInStruct SCORE_STRUCT_BYTE_OFFSET, $00
	SCR_StoreByteInStruct TILE_IDX_WITHIN_ROW, $00
	SCR_SetSpriteXY $08, $18
	SCR_Jump RankingsColScript_TileFromByte


RankingsOtherScript_Col1:
	SCR_StoreByteInStruct SCORE_STRUCT_BYTE_OFFSET, $01
	SCR_StoreByteInStruct TILE_IDX_WITHIN_ROW, $01
	SCR_SetSpriteXY $18, $18
	SCR_Jump RankingsColScript_TileFromByte


RankingsOtherScript_Col2:
	SCR_StoreByteInStruct SCORE_STRUCT_BYTE_OFFSET, $02
	SCR_StoreByteInStruct TILE_IDX_WITHIN_ROW, $02
	SCR_SetSpriteXY $28, $18
	SCR_Jump RankingsColScript_TileFromByte


RankingsOtherScript_Col3:
	SCR_StoreByteInStruct SCORE_STRUCT_BYTE_OFFSET, $03
	SCR_StoreByteInStruct TILE_IDX_WITHIN_ROW, $03
	SCR_SetSpriteXY $38, $18
	SCR_Jump RankingsColScript_TileFromByte


RankingsOtherScript_Col4:
	SCR_StoreByteInStruct SCORE_STRUCT_BYTE_OFFSET, $04
	SCR_StoreByteInStruct TILE_IDX_WITHIN_ROW, $04
	SCR_SetSpriteXY $50, $18
	SCR_Jump RankingsColScript_TileFromHighNybble


RankingsOtherScript_Col5:
	SCR_StoreByteInStruct SCORE_STRUCT_BYTE_OFFSET, $04
	SCR_StoreByteInStruct TILE_IDX_WITHIN_ROW, $05
	SCR_SetSpriteXY $60, $18
	SCR_Jump RankingsColScript_TileFromLowNybble


RankingsOtherScript_Col6:
	SCR_StoreByteInStruct SCORE_STRUCT_BYTE_OFFSET, $05
	SCR_StoreByteInStruct TILE_IDX_WITHIN_ROW, $06
	SCR_SetSpriteXY $70, $18
	SCR_Jump RankingsColScript_TileFromHighNybble


RankingsOtherScript_Col7:
	SCR_StoreByteInStruct SCORE_STRUCT_BYTE_OFFSET, $05
	SCR_StoreByteInStruct TILE_IDX_WITHIN_ROW, $07
	SCR_SetSpriteXY $88, $18
	SCR_Jump RankingsColScript_TileFromLowNybble


RankingsColScript_TileFromByte:
	SCR_SetCounter1 $07
.nextRow:
; 3 times, animate the tile shuttering
	SCR_SetCounter2 $03
:	SCR_FarSetSpriteSrc SpriteOam_RankingsTileFlipping1
	SCR_Delay $02
	SCR_FarSetSpriteSrc SpriteOam_RankingsTileFlipping2
	SCR_Delay $02
	SCR_DecCounter2_JNE :-

; Set location being drawn based on col, incrementing by 8 per row
	SCR_StoreStructByteInAddr TILE_IDX_WITHIN_ROW, wRankingsTileLocationIdxBeingDrawn
	SCR_StoreByteInAddr wRankingsShouldDrawNextMetatile, $01
	SCR_ExecAsmBelow

; DE = byte offset
	ldh  a, [hCurrScriptStructHighByte]                             ; $621e
	ld   h, a                                                       ; $6220
	ld   l, SCORE_STRUCT_BYTE_OFFSET                                ; $6221
	ld   e, [hl]                                                    ; $6223
	ld   d, $00                                                     ; $6224

; Val in HL is byte to read for metatile
	ld   a, [wRankingsCurrTrainLineBeingDisplayed]                  ; $6226
	ld   l, a                                                       ; $6229
	ld   a, [wRankingsCurrTrainLineBeingDisplayed+1]                ; $622a
	ld   h, a                                                       ; $622d
	add  hl, de                                                     ; $622e
	ld   a, [hl]                                                    ; $622f
	ld   [wRankingsCurrentMetatileIdxAtLocation], a                 ; $6230

; Add, to process same col in the next score struct
	call ProcessScriptsFromCurrLoc                                  ; $6233
	SCR_StructByteAddByte SCORE_STRUCT_BYTE_OFFSET, SCORE_SIZEOF
	SCR_StructByteAddByte TILE_IDX_WITHIN_ROW, $08

; Shutter animation twice
	SCR_SetCounter2 $02
:	SCR_FarSetSpriteSrc SpriteOam_RankingsTileFlipping1
	SCR_Delay $02
	SCR_FarSetSpriteSrc SpriteOam_RankingsTileFlipping2
	SCR_Delay $02
	SCR_DecCounter2_JNE :-

; Hide shutter, then move it to next row
	SCR_UnsetSpriteSrc
	SCR_Delay $0c
	SCR_AddToSpriteY $10
	SCR_DecCounter1_JNE .nextRow
	SCR_StopCurrScript


RankingsColScript_TileFromHighNybble:
	SCR_SetCounter1 $07
.nextRow:
; 3 times, animate the tile shuttering
	SCR_SetCounter2 $03
:	SCR_FarSetSpriteSrc SpriteOam_RankingsTileFlipping1
	SCR_Delay $02
	SCR_FarSetSpriteSrc SpriteOam_RankingsTileFlipping2
	SCR_Delay $02
	SCR_DecCounter2_JNE :-

; Set location being drawn based on col, incrementing by 8 per row
	SCR_StoreStructByteInAddr TILE_IDX_WITHIN_ROW, wRankingsTileLocationIdxBeingDrawn
	SCR_StoreByteInAddr wRankingsShouldDrawNextMetatile, $01
	SCR_ExecAsmBelow

; DE = byte offset
	ldh  a, [hCurrScriptStructHighByte]                             ; $6272
	ld   h, a                                                       ; $6274
	ld   l, SCORE_STRUCT_BYTE_OFFSET                                ; $6275
	ld   e, [hl]                                                    ; $6277
	ld   d, $00                                                     ; $6278

; High nybble in HL is byte to read for metatile
	ld   a, [wRankingsCurrTrainLineBeingDisplayed]                  ; $627a
	ld   l, a                                                       ; $627d
	ld   a, [wRankingsCurrTrainLineBeingDisplayed+1]                ; $627e
	ld   h, a                                                       ; $6281
	add  hl, de                                                     ; $6282
	ld   a, [hl]                                                    ; $6283
	swap a                                                          ; $6284
	and  $0f                                                        ; $6286
	ld   [wRankingsCurrentMetatileIdxAtLocation], a                 ; $6288

; Add, to process same col in the next score struct
	call ProcessScriptsFromCurrLoc                                  ; $628b
	SCR_StructByteAddByte SCORE_STRUCT_BYTE_OFFSET, SCORE_SIZEOF
	SCR_StructByteAddByte TILE_IDX_WITHIN_ROW, $08

; Shutter animation twice
	SCR_SetCounter2 $02
:	SCR_FarSetSpriteSrc SpriteOam_RankingsTileFlipping1
	SCR_Delay $02
	SCR_FarSetSpriteSrc SpriteOam_RankingsTileFlipping2
	SCR_Delay $02
	SCR_DecCounter2_JNE :-

; Hide shutter, then move it to next row
	SCR_UnsetSpriteSrc
	SCR_Delay $0c
	SCR_AddToSpriteY $10
	SCR_DecCounter1_JNE .nextRow
	SCR_StopCurrScript


RankingsColScript_TileFromLowNybble:
	SCR_SetCounter1 $07
.nextRow:
; 3 times, animate the tile shuttering
	SCR_SetCounter2 $03
:	SCR_FarSetSpriteSrc SpriteOam_RankingsTileFlipping1
	SCR_Delay $02
	SCR_FarSetSpriteSrc SpriteOam_RankingsTileFlipping2
	SCR_Delay $02
	SCR_DecCounter2_JNE :-

; Set location being drawn based on col, incrementing by 8 per row
	SCR_StoreStructByteInAddr TILE_IDX_WITHIN_ROW, wRankingsTileLocationIdxBeingDrawn
	SCR_StoreByteInAddr wRankingsShouldDrawNextMetatile, $01
	SCR_ExecAsmBelow

; DE = byte offset
	ldh  a, [hCurrScriptStructHighByte]                             ; $62ca
	ld   h, a                                                       ; $62cc
	ld   l, SCORE_STRUCT_BYTE_OFFSET                                ; $62cd
	ld   e, [hl]                                                    ; $62cf
	ld   d, $00                                                     ; $62d0

; Val in HL is byte to read for metatile
	ld   a, [wRankingsCurrTrainLineBeingDisplayed]                  ; $62d2
	ld   l, a                                                       ; $62d5
	ld   a, [wRankingsCurrTrainLineBeingDisplayed+1]                ; $62d6
	ld   h, a                                                       ; $62d9
	add  hl, de                                                     ; $62da
	ld   a, [hl]                                                    ; $62db
	and  $0f                                                        ; $62dc
	ld   [wRankingsCurrentMetatileIdxAtLocation], a                 ; $62de

; Add, to process same col in the next score struct
	call ProcessScriptsFromCurrLoc                                  ; $62e1
	SCR_StructByteAddByte SCORE_STRUCT_BYTE_OFFSET, SCORE_SIZEOF
	SCR_StructByteAddByte TILE_IDX_WITHIN_ROW, $08

; Shutter animation twice
	SCR_SetCounter2 $02
:	SCR_FarSetSpriteSrc SpriteOam_RankingsTileFlipping1
	SCR_Delay $02
	SCR_FarSetSpriteSrc SpriteOam_RankingsTileFlipping2
	SCR_Delay $02
	SCR_DecCounter2_JNE :-

; Hide shutter, then move it to next row
	SCR_UnsetSpriteSrc
	SCR_Delay $0c
	SCR_AddToSpriteY $10
	SCR_DecCounter1_JNE .nextRow
	SCR_StopCurrScript


Script_DisplayRankingsText:
	SCR_StoreByteInAddr wRankingsIsErasingText, $00

; Create a script for every tile in a row
	SCR_CreateOtherScript 1, RankingsOtherScript_Col0
	SCR_Delay $04
	SCR_CreateOtherScript 2, RankingsOtherScript_Col1
	SCR_Delay $04
	SCR_CreateOtherScript 3, RankingsOtherScript_Col2
	SCR_Delay $04
	SCR_CreateOtherScript 4, RankingsOtherScript_Col3
	SCR_Delay $04
	SCR_CreateOtherScript 5, RankingsOtherScript_Col4
	SCR_Delay $04
	SCR_CreateOtherScript 6, RankingsOtherScript_Col5
	SCR_Delay $04
	SCR_CreateOtherScript 7, RankingsOtherScript_Col6
	SCR_Delay $04
	SCR_CreateOtherScript 8, RankingsOtherScript_Col7

	SCR_Delay $04
	SCR_Delay $e0
	SCR_Ret


Script_EraseRankingsText:
	SCR_StoreByteInAddr wRankingsIsErasingText, $01

; Create a script for every tile in a row
	SCR_CreateOtherScript 1, RankingsOtherScript_Col0
	SCR_Delay $04
	SCR_CreateOtherScript 2, RankingsOtherScript_Col1
	SCR_Delay $04
	SCR_CreateOtherScript 3, RankingsOtherScript_Col2
	SCR_Delay $04
	SCR_CreateOtherScript 4, RankingsOtherScript_Col3
	SCR_Delay $04
	SCR_CreateOtherScript 5, RankingsOtherScript_Col4
	SCR_Delay $04
	SCR_CreateOtherScript 6, RankingsOtherScript_Col5
	SCR_Delay $04
	SCR_CreateOtherScript 7, RankingsOtherScript_Col6
	SCR_Delay $04
	SCR_CreateOtherScript 8, RankingsOtherScript_Col7

; Stop erasing
	SCR_Delay $04
	SCR_Delay $e0
	SCR_StoreByteInAddr wRankingsIsErasingText, $00
	SCR_Ret


Script_ScrollRankingsBGHeaderDown:
	SCR_SetCounter1 $10
:	SCR_ValInAddrPlusEquByte wSCY, $01
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-
	SCR_Ret
	
	
Script_WaitUntilNextRankingsScreenToDisplay:
; If demo, go to next trainline rankings after a delay..
	SCR_ExecAsmBelow
	ld   a, [wRankingsPrevScreen]                                   ; $6392
	cp   RANKINGS_FROM_TITLE_SCREEN_OPTS                            ; $6395
	ld   de, :+                                                     ; $6397
	jp   z, ProcessScriptsFromDE                                    ; $639a

	call ProcessScriptsFromCurrLoc                                  ; $639d
	SCR_Delay $3c
	SCR_Ret
	
; Else from title screen opts, it's when A is pressed
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $63a5
	bit  PADB_A, a                                                  ; $63a8
	ld   de, :-                                                     ; $63aa
	jp   z, ProcessScriptsFromDE                                    ; $63ad

	call ProcessScriptsFromCurrLoc                                  ; $63b0
	SCR_Ret
	
	
Script_StopOtherScriptsAndHideTheirSprites:
	SCR_StopOtherScript 1
	SCR_StopOtherScript 2
	SCR_StopOtherScript 3
	SCR_StopOtherScript 4
	SCR_StopOtherScript 5
	SCR_StopOtherScript 6
	SCR_StopOtherScript 7
	SCR_UnsetOtherSpriteSpec 1
	SCR_UnsetOtherSpriteSpec 2
	SCR_UnsetOtherSpriteSpec 3
	SCR_UnsetOtherSpriteSpec 4
	SCR_UnsetOtherSpriteSpec 5
	SCR_UnsetOtherSpriteSpec 6
	SCR_UnsetOtherSpriteSpec 7
	SCR_Ret
	
	
Script_FlashProOnProScores:
; For each ranking, set address of pro level, and coords
	SCR_CreateOtherScript 1, .rank1
	SCR_CreateOtherScript 2, .rank2
	SCR_CreateOtherScript 3, .rank3
	SCR_CreateOtherScript 4, .rank4
	SCR_CreateOtherScript 5, .rank5
	SCR_CreateOtherScript 6, .rank6
	SCR_CreateOtherScript 7, .rank7
	SCR_Ret

DEF SCRIPT_VAR_TRAINLINE_OFFSET_FOR_ROWS_PRO = SCRIPT_VAR_1D
DEF SCRIPT_VAR_CURR_ROWS_PRO_LEVEL = SCRIPT_VAR_1E

.rank1:
	SCR_StoreByteInStruct SCRIPT_VAR_TRAINLINE_OFFSET_FOR_ROWS_PRO, \
		SCORE_PRO_LEVEL+NUM_SCORES_PER_TRAINLINE*0
	SCR_SetSpriteXY $38, $40
	SCR_Jump .cont

.rank2:
	SCR_StoreByteInStruct SCRIPT_VAR_TRAINLINE_OFFSET_FOR_ROWS_PRO, \
		SCORE_PRO_LEVEL+NUM_SCORES_PER_TRAINLINE*1
	SCR_SetSpriteXY $38, $50
	SCR_Jump .cont

.rank3:
	SCR_StoreByteInStruct SCRIPT_VAR_TRAINLINE_OFFSET_FOR_ROWS_PRO, \
		SCORE_PRO_LEVEL+NUM_SCORES_PER_TRAINLINE*2
	SCR_SetSpriteXY $38, $60
	SCR_Jump .cont

.rank4:
	SCR_StoreByteInStruct SCRIPT_VAR_TRAINLINE_OFFSET_FOR_ROWS_PRO, \
		SCORE_PRO_LEVEL+NUM_SCORES_PER_TRAINLINE*3
	SCR_SetSpriteXY $38, $70
	SCR_Jump .cont

.rank5:
	SCR_StoreByteInStruct SCRIPT_VAR_TRAINLINE_OFFSET_FOR_ROWS_PRO, \
		SCORE_PRO_LEVEL+NUM_SCORES_PER_TRAINLINE*4
	SCR_SetSpriteXY $38, $80
	SCR_Jump .cont

.rank6:
	SCR_StoreByteInStruct SCRIPT_VAR_TRAINLINE_OFFSET_FOR_ROWS_PRO, \
		SCORE_PRO_LEVEL+NUM_SCORES_PER_TRAINLINE*5
	SCR_SetSpriteXY $38, $90
	SCR_Jump .cont

.rank7:
	SCR_StoreByteInStruct SCRIPT_VAR_TRAINLINE_OFFSET_FOR_ROWS_PRO, \
		SCORE_PRO_LEVEL+NUM_SCORES_PER_TRAINLINE*6
	SCR_SetSpriteXY $38, $a0

.cont:
	SCR_ExecAsmBelow

; DE = offset into curr trainline's scores
	ldh  a, [hCurrScriptStructHighByte]                             ; $6432
	ld   h, a                                                       ; $6434
	ld   l, SCRIPT_VAR_TRAINLINE_OFFSET_FOR_ROWS_PRO                ; $6435
	ld   e, [hl]                                                    ; $6437
	ld   d, $00                                                     ; $6438

; Add onto curr trainline's scores
	ld   a, [wRankingsCurrTrainLineBeingDisplayed]                  ; $643a
	ld   l, a                                                       ; $643d
	ld   a, [wRankingsCurrTrainLineBeingDisplayed+1]                ; $643e
	ld   h, a                                                       ; $6441
	add  hl, de                                                     ; $6442

; Store pro level in B, to store in struct byte
	ld   b, [hl]                                                    ; $6443
	ldh  a, [hCurrScriptStructHighByte]                             ; $6444
	ld   h, a                                                       ; $6446
	ld   l, SCRIPT_VAR_CURR_ROWS_PRO_LEVEL                          ; $6447
	ld   [hl], b                                                    ; $6449
	call ProcessScriptsFromCurrLoc                                  ; $644a

; Flash sprite based on pro level
	SCR_CallTableIdxInStructByte :+, SCRIPT_VAR_CURR_ROWS_PRO_LEVEL
:	dw .nonPro
	dw .proBronze
	dw .proSilver
	dw .proGold

.nonPro:
:	SCR_UnsetSpriteSrc
	SCR_ResumeNextFrame
	SCR_Jump :-

.proBronze:
:	SCR_FarSetSpriteSrc SpriteOam_ProBronze
	SCR_Delay $14
	SCR_FarSetSpriteSrc SpriteOam_ProHidden
	SCR_Delay $14
	SCR_Jump :-

.proSilver:
:	SCR_FarSetSpriteSrc SpriteOam_ProSilver
	SCR_Delay $14
	SCR_FarSetSpriteSrc SpriteOam_ProHidden
	SCR_Delay $14
	SCR_Jump :-

.proGold:
:	SCR_FarSetSpriteSrc SpriteOam_ProGold
	SCR_Delay $14
	SCR_FarSetSpriteSrc SpriteOam_ProHidden
	SCR_Delay $14
	SCR_Jump :-


TrainImageScript::
; Load train idx (1-idx it), and that we're viewing the train, not its info
	SCR_StoreByteFromWordInStruct wTrainImage1stSelectedIdx, TRAIN_IDX
	SCR_StoreByteFromWordInStruct wTrainImageUsesScreen1, VIEWING_TRAIN_IMAGE_INFO
	SCR_StructByteAddByte TRAIN_IDX, $01

; Stub out interrupts
	SCR_ExecAsmBelow
	di                                                              ; $6497
	ld   a, LOW(StubInterruptFunc)                                  ; $6498
	ld   [wVBlankInterruptFunc], a                                  ; $649a
	ld   a, HIGH(StubInterruptFunc)                                 ; $649d
	ld   [wVBlankInterruptFunc+1], a                                ; $649f
	ld   a, LOW(StubInterruptFunc)                                  ; $64a2
	ld   [wLCDCInterruptFunc], a                                    ; $64a4
	ld   a, HIGH(StubInterruptFunc)                                 ; $64a7
	ld   [wLCDCInterruptFunc+1], a                                  ; $64a9
	ei                                                              ; $64ac

; Set palettes to all black - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $64ad
	ld   hl, Palettes_AllBlack                                      ; $64af
	call SetBGPaletteSrc                                            ; $64b2
	xor  a                                                          ; $64b5
	ld   [wPaletteFadeAmount], a                                    ; $64b6
	ld   [wLoadPalettesFromRam], a                                  ; $64b9
	ld   a, $01                                                     ; $64bc
	ld   [wLoadBGPalettesFromRom], a                                ; $64be

	ld   b, BANK(Palettes_AllBlack)                                 ; $64c1
	ld   hl, Palettes_AllBlack                                      ; $64c3
	call SetOBJPaletteSrc                                           ; $64c6
	xor  a                                                          ; $64c9
	ld   [wPaletteFadeAmount], a                                    ; $64ca
	ld   [wLoadPalettesFromRam], a                                  ; $64cd
	ld   a, $01                                                     ; $64d0
	ld   [wLoadOBJPalettesFromRom], a                               ; $64d2

; Load tile data for bottom bar
	ld   a, $01                                                     ; $64d5
	ldh  [rVBK], a                                                  ; $64d7
	ld   b, BANK(TileData_TrainImageBottomBar)                      ; $64d9
	ld   hl, TileData_TrainImageBottomBar                           ; $64db
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $64de

; Load tile map and attr for screen 0 (hi-col trashes top part later)
	ld   de, _SCRN0                                                 ; $64e1
	ld   a, $00                                                     ; $64e4
	ldh  [rVBK], a                                                  ; $64e6
	ldbc $13, SCREEN_TILE_WIDTH                                     ; $64e8
	ld   hl, TileMap_TrainImageInfo                                 ; $64eb
	ld   a, BANK(TileMap_TrainImageInfo)                            ; $64ee
	call FarRectCopyRowPerFrame                                     ; $64f0

	ld   de, _SCRN0                                                 ; $64f3
	ld   a, $01                                                     ; $64f6
	ldh  [rVBK], a                                                  ; $64f8
	ldbc $13, SCREEN_TILE_WIDTH                                     ; $64fa
	ld   a, BANK(TileAttr_TrainImageInfo)                           ; $64fd
	call FarRectCopyRowPerFrame                                     ; $64ff

; Load tile map and attr for screen 1 (train info)
	ld   de, _SCRN1                                                 ; $6502
	ld   a, $00                                                     ; $6505
	ldh  [rVBK], a                                                  ; $6507
	ldbc $13, SCREEN_TILE_WIDTH                                     ; $6509
	ld   hl, TileMap_TrainImageInfo                                 ; $650c
	ld   a, BANK(TileMap_TrainImageInfo)                            ; $650f
	call FarRectCopyRowPerFrame                                     ; $6511

	ld   de, _SCRN1                                                 ; $6514
	ld   a, $01                                                     ; $6517
	ldh  [rVBK], a                                                  ; $6519
	ldbc $13, SCREEN_TILE_WIDTH                                     ; $651b
	ld   a, BANK(TileAttr_TrainImageInfo)                           ; $651e
	call FarRectCopyRowPerFrame                                     ; $6520

; Load actual hi-col tile map
	ld   de, _SCRN0                                                 ; $6523
	ld   a, $00                                                     ; $6526
	ldh  [rVBK], a                                                  ; $6528
	ldbc $10, SCREEN_TILE_WIDTH                                     ; $652a
	ld   hl, TileMap_TrainImageHiCol                                ; $652d
	ld   a, BANK(TileMap_TrainImageHiCol)                           ; $6530
	call FarRectCopyRowPerFrame                                     ; $6532

	ld   de, _SCRN0                                                 ; $6535
	ld   a, $01                                                     ; $6538
	ldh  [rVBK], a                                                  ; $653a
	ldbc $10, SCREEN_TILE_WIDTH                                     ; $653c
	ld   a, BANK(TileAttr_TrainImageHiCol)                          ; $653f
	call FarRectCopyRowPerFrame                                     ; $6541

; Set LCD based on boolean here
	ld   a, [wTrainImageUsesScreen1]                                ; $6544
	or   a                                                          ; $6547
	jr   nz, .bgScreen1                                             ; $6548

	ld   a, LCDCF_ON|LCDCF_BG9800|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON ; $654a
	ldh  [rLCDC], a                                                 ; $654c
	jr   .afterSettingLCD                                           ; $654e

.bgScreen1:
	ld   a, LCDCF_ON|LCDCF_BG9C00|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON ; $6550
	ldh  [rLCDC], a                                                 ; $6552

.afterSettingLCD:
; Set stub state, then wait til next frame
	call ProcessScriptsFromCurrLoc                                  ; $6554
	SCR_StoreByteInAddr wGameState, GS_TRAIN_IMAGE_STUB
	SCR_ExecAsmBelow
	call ProcessScriptsFromCurrLoc                                  ; $655c
	SCR_ResumeNextFrame

; Then set main state
	SCR_StoreByteInAddr wGameState, GS_TRAIN_IMAGE_MAIN
	SCR_ExecAsmBelow

; Branch based on screen we're looking at
	ld   a, [wTrainImageUsesScreen1]                                ; $6565
	or   a                                                          ; $6568
	ld   de, .hiColScreenStart                                      ; $6569
	jp   z, ProcessScriptsFromDE                                    ; $656c

	ld   de, .trainInfoScreenStart                                  ; $656f
	jp   ProcessScriptsFromDE                                       ; $6572

.hiColScreenStart:
	SCR_ExecAsmBelow
	ld   de, TrainImageHiColTileDataSources-3                       ; $6576

.afterScreenStart:
; Set all palettes to black
	ld   a, XCPS_AUTO_INCREMENT                                     ; $6579
	ldh  [rBCPS], a                                                 ; $657b
	ldbc NUM_PALETTE_BYTES, LOW(rBCPD)                              ; $657d
	ld   a, $00                                                     ; $6580
:	ldh  [c], a                                                     ; $6582
	dec  b                                                          ; $6583
	jr   nz, :-                                                     ; $6584

; Get train 1-idx in HL
	ldh  a, [hCurrScriptStructHighByte]                             ; $6586
	ld   h, a                                                       ; $6588
	ld   l, TRAIN_IDX                                               ; $6589
	ld   a, [hl]                                                    ; $658b
	ld   l, a                                                       ; $658c
	ld   h, $00                                                     ; $658d

; HL *= 3
	add  a                                                          ; $658f
	add  l                                                          ; $6590
	ld   l, a                                                       ; $6591
	ld   a, h                                                       ; $6592
	adc  $00                                                        ; $6593
	ld   h, a                                                       ; $6595

; Triple index into table, then get source addr, then source bank
	add  hl, de                                                     ; $6596
	ld   e, l                                                       ; $6597
	ld   d, h                                                       ; $6598
	ld   a, [de]                                                    ; $6599
	ld   l, a                                                       ; $659a
	inc  de                                                         ; $659b
	ld   a, [de]                                                    ; $659c
	ld   h, a                                                       ; $659d
	inc  de                                                         ; $659e
	ld   a, [de]                                                    ; $659f

; Using source details from screen we're viewing, load relevant tile data
	call LoadTrainImageTileData                                     ; $65a0
	call ProcessScriptsFromCurrLoc                                  ; $65a3

.nextFrame:
	SCR_ResumeNextFrame

; --
; -- Button check
; --

; HL points to which screen we're looking at
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $65a8
	ld   h, a                                                       ; $65aa
	ld   l, VIEWING_TRAIN_IMAGE_INFO                                ; $65ab

; Start checking buttons
	ld   a, [wStickyButtonsHeld]                                    ; $65ad
	bit  PADB_START, a                                              ; $65b0
	jp   nz, TrainImage_PrintScreenHandler                          ; $65b2

; PADB_DOWN
	add  a                                                          ; $65b5
	jr   c, .downOrUpPressed                                        ; $65b6

	add  a                                                          ; $65b8
	jr   nc, .upDownOrStartNotPressed                               ; $65b9

; PADB_UP

.downOrUpPressed:
; Flip screen we're looking at, B contains LCDC value
	ld   a, [hl]                                                    ; $65bb
	xor  $08                                                        ; $65bc
	ld   [hl], a                                                    ; $65be
	or   $83                                                        ; $65bf
	ld   b, a                                                       ; $65c1

; Wait until in vblank
:	ldh  a, [rLY]                                                   ; $65c2
	cp   $90                                                        ; $65c4
	jr   c, :-                                                      ; $65c6

; Set LCDC and go to next frame
	ld   a, b                                                       ; $65c8
	ldh  [rLCDC], a                                                 ; $65c9
	jr   .afterBtnPressed                                           ; $65cb

.upDownOrStartNotPressed:
; HL points to TRAIN_IDX
	dec  l                                                          ; $65cd
	add  a                                                          ; $65ce
	jr   nc, .checkRightAndBPressed                                 ; $65cf

; PADB_LEFT pressed - get 1-indexed new train index before curr
	ld   a, [hl]                                                    ; $65d1
	dec  a                                                          ; $65d2
	call GetNextAvailableTrainIdxBeforeCurr                         ; $65d3
	inc  a                                                          ; $65d6
	jr   .setTrainIdx                                               ; $65d7

.checkRightAndBPressed:
	add  a                                                          ; $65d9
	jr   nc, .checkBPressed                                         ; $65da

; PADB_RIGHT pressed - get 1-indexed new train index after curr
	ld   a, [hl]                                                    ; $65dc
	dec  a                                                          ; $65dd
	call GetNextAvailableTrainIdxAfterCurr                          ; $65de
	inc  a                                                          ; $65e1
	jr   .setTrainIdx                                               ; $65e2

.checkBPressed:
; Nothing pressed - do nothing
	add  a                                                          ; $65e4
	add  a                                                          ; $65e5
	add  a                                                          ; $65e6
	ld   de, .nextFrame                                             ; $65e7
	jp   nc, ProcessScriptsFromDE                                   ; $65ea

; PADB_B pressed - play sound and set stub state
	call ProcessScriptsFromCurrLoc                                  ; $65ed
	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT
	SCR_StoreByteInAddr wGameState, GS_TRAIN_IMAGE_STUB
	SCR_ResumeNextFrame
	
; Set all palettes to black
	SCR_ExecAsmBelow
	ld   a, XCPS_AUTO_INCREMENT                                     ; $65f8
	ldh  [rBCPS], a                                                 ; $65fa
	ldbc NUM_PALETTE_BYTES, LOW(rBCPD)                              ; $65fc
	ld   a, $00                                                     ; $65ff
:	ldh  [c], a                                                     ; $6601
	dec  b                                                          ; $6602
	jr   nz, :-                                                     ; $6603

; Set that we came from train sub menu, then set state
	ld   a, $01                                                     ; $6605
	ld   [wPictureBookPrevScreen], a                                ; $6607
	call ProcessScriptsFromCurrLoc                                  ; $660a
	SCR_StoreByteInAddr wGameState, GS_PICTURE_BOOK_INIT
	SCR_StopCurrScript

.setTrainIdx:
	ld   [hl], a                                                    ; $6612

.afterBtnPressed:
	call ProcessScriptsFromCurrLoc                                  ; $6613
	SCR_PlaySound SND_06|MAKE_SOUND_EFFECT
	
; HL is pointing to the screen we're looking at
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $6619
	ld   h, a                                                       ; $661b
	ld   l, VIEWING_TRAIN_IMAGE_INFO                                ; $661c

; Go to relevant screen start
	ld   a, [hl]                                                    ; $661e
	or   a                                                          ; $661f
	ld   de, .hiColScreenStart                                      ; $6620
	jp   z, ProcessScriptsFromDE                                    ; $6623

	call ProcessScriptsFromCurrLoc                                  ; $6626

.trainInfoScreenStart:
	SCR_ExecAsmBelow
	ld   de, TrainImageInfoTileDataSources-3                        ; $662a
	jp   .afterScreenStart                                          ; $662d


TrainImageHiColTileDataSources:
	TrainImageTileDataSrc Gfx_TrainImage_71, 0
	TrainImageTileDataSrc Gfx_TrainImage_71, 1
	TrainImageTileDataSrc Gfx_TrainImage_71, 2
	TrainImageTileDataSrc Gfx_TrainImage_72, 0
	TrainImageTileDataSrc Gfx_TrainImage_72, 1
	TrainImageTileDataSrc Gfx_TrainImage_72, 2
	TrainImageTileDataSrc Gfx_TrainImage_73, 0
	TrainImageTileDataSrc Gfx_TrainImage_73, 1
	TrainImageTileDataSrc Gfx_TrainImage_73, 2
	TrainImageTileDataSrc Gfx_TrainImage_74, 0
	TrainImageTileDataSrc Gfx_TrainImage_74, 1
	TrainImageTileDataSrc Gfx_TrainImage_74, 2
	TrainImageTileDataSrc Gfx_TrainImage_75, 0
	TrainImageTileDataSrc Gfx_TrainImage_75, 1
	TrainImageTileDataSrc Gfx_TrainImage_75, 2
	TrainImageTileDataSrc Gfx_TrainImage_76, 0
	TrainImageTileDataSrc Gfx_TrainImage_76, 1
	TrainImageTileDataSrc Gfx_TrainImage_76, 2
	TrainImageTileDataSrc Gfx_TrainImage_77, 0
	TrainImageTileDataSrc Gfx_TrainImage_77, 1
	TrainImageTileDataSrc Gfx_TrainImage_77, 2
	TrainImageTileDataSrc Gfx_TrainImage_78, 0
	TrainImageTileDataSrc Gfx_TrainImage_78, 1
	TrainImageTileDataSrc Gfx_TrainImage_78, 2
	TrainImageTileDataSrc Gfx_TrainImage_79, 0
	TrainImageTileDataSrc Gfx_TrainImage_79, 1
	TrainImageTileDataSrc Gfx_TrainImage_79, 2
	TrainImageTileDataSrc Gfx_TrainImage_7a, 0
	TrainImageTileDataSrc Gfx_TrainImage_7a, 1
	TrainImageTileDataSrc Gfx_TrainImage_7a, 2
	TrainImageTileDataSrc Gfx_TrainImage_7b, 0
	TrainImageTileDataSrc Gfx_TrainImage_7b, 1
	TrainImageTileDataSrc Gfx_TrainImage_7b, 2
	TrainImageTileDataSrc Gfx_TrainImage_7c, 0
	TrainImageTileDataSrc Gfx_TrainImage_7c, 1
	TrainImageTileDataSrc Gfx_TrainImage_7c, 2
	TrainImageTileDataSrc Gfx_TrainImage_7d, 0
	TrainImageTileDataSrc Gfx_TrainImage_7d, 1
	TrainImageTileDataSrc Gfx_TrainImage_7d, 2
	TrainImageTileDataSrc Gfx_TrainImage_7e, 0
	TrainImageTileDataSrc Gfx_TrainImage_7e, 1
	TrainImageTileDataSrc Gfx_TrainImage_7e, 2
	TrainImageTileDataSrc Gfx_TrainImage_7f, 0
	TrainImageTileDataSrc Gfx_TrainImage_7f, 1
	TrainImageTileDataSrc Gfx_TrainImage_7f, 2
	TrainImageTileDataSrc Gfx_TrainImage_80, 0
	TrainImageTileDataSrc Gfx_TrainImage_80, 1
	TrainImageTileDataSrc Gfx_TrainImage_80, 2
	TrainImageTileDataSrc Gfx_TrainImage_81, 0
	TrainImageTileDataSrc Gfx_TrainImage_81, 1
	TrainImageTileDataSrc Gfx_TrainImage_81, 2
	TrainImageTileDataSrc Gfx_TrainImage_82, 0
	TrainImageTileDataSrc Gfx_TrainImage_82, 1
	TrainImageTileDataSrc Gfx_TrainImage_82, 2
	TrainImageTileDataSrc Gfx_TrainImage_83, 0
	TrainImageTileDataSrc Gfx_TrainImage_83, 1
	TrainImageTileDataSrc Gfx_TrainImage_83, 2
	TrainImageTileDataSrc Gfx_TrainImage_84, 0
	TrainImageTileDataSrc Gfx_TrainImage_84, 1
	TrainImageTileDataSrc Gfx_TrainImage_84, 2
	TrainImageTileDataSrc Gfx_TrainImage_85, 0
	TrainImageTileDataSrc Gfx_TrainImage_85, 1
	TrainImageTileDataSrc Gfx_TrainImage_85, 2
	TrainImageTileDataSrc Gfx_TrainImage_86, 0
	TrainImageTileDataSrc Gfx_TrainImage_86, 1
	TrainImageTileDataSrc Gfx_TrainImage_86, 2
	TrainImageTileDataSrc Gfx_TrainImage_87, 0
	TrainImageTileDataSrc Gfx_TrainImage_87, 1
	TrainImageTileDataSrc Gfx_TrainImage_87, 2
	TrainImageTileDataSrc Gfx_TrainImage_88, 0
	TrainImageTileDataSrc Gfx_TrainImage_88, 1
	TrainImageTileDataSrc Gfx_TrainImage_88, 2
	TrainImageTileDataSrc Gfx_TrainImage_89, 0
	TrainImageTileDataSrc Gfx_TrainImage_89, 1
	TrainImageTileDataSrc Gfx_TrainImage_89, 2
	TrainImageTileDataSrc Gfx_TrainImage_8a, 0
	TrainImageTileDataSrc Gfx_TrainImage_8a, 1
	TrainImageTileDataSrc Gfx_TrainImage_8a, 2
	TrainImageTileDataSrc Gfx_TrainImage_8b, 0
	TrainImageTileDataSrc Gfx_TrainImage_8b, 1
	TrainImageTileDataSrc Gfx_TrainImage_8b, 2
	TrainImageTileDataSrc Gfx_TrainImage_8c, 0
	TrainImageTileDataSrc Gfx_TrainImage_8c, 1
	TrainImageTileDataSrc Gfx_TrainImage_8c, 2
	TrainImageTileDataSrc Gfx_TrainImage_8d, 0
	TrainImageTileDataSrc Gfx_TrainImage_8d, 1
	TrainImageTileDataSrc Gfx_TrainImage_8d, 2
	TrainImageTileDataSrc Gfx_TrainImage_8e, 0
	TrainImageTileDataSrc Gfx_TrainImage_8e, 1
	TrainImageTileDataSrc Gfx_TrainImage_8e, 2
	TrainImageTileDataSrc Gfx_TrainImage_8f, 0
	TrainImageTileDataSrc Gfx_TrainImage_8f, 1
	TrainImageTileDataSrc Gfx_TrainImage_8f, 2
	TrainImageTileDataSrc Gfx_TrainImage_90, 0
	TrainImageTileDataSrc Gfx_TrainImage_90, 1
	TrainImageTileDataSrc Gfx_TrainImage_90, 2
	TrainImageTileDataSrc Gfx_TrainImage_91, 0
	TrainImageTileDataSrc Gfx_TrainImage_91, 1
	TrainImageTileDataSrc Gfx_TrainImage_91, 2
	TrainImageTileDataSrc Gfx_TrainImage_92, 0


TrainImageHiColPaletteSrces::
	SrcFar HiColPalettes_Train_00
	SrcFar HiColPalettes_Train_01
	SrcFar HiColPalettes_Train_02
	SrcFar HiColPalettes_Train_03
	SrcFar HiColPalettes_Train_04
	SrcFar HiColPalettes_Train_05
	SrcFar HiColPalettes_Train_06
	SrcFar HiColPalettes_Train_07
	SrcFar HiColPalettes_Train_08
	SrcFar HiColPalettes_Train_09
	SrcFar HiColPalettes_Train_0a
	SrcFar HiColPalettes_Train_0b
	SrcFar HiColPalettes_Train_0c
	SrcFar HiColPalettes_Train_0d
	SrcFar HiColPalettes_Train_0e
	SrcFar HiColPalettes_Train_0f
	SrcFar HiColPalettes_Train_10
	SrcFar HiColPalettes_Train_11
	SrcFar HiColPalettes_Train_12
	SrcFar HiColPalettes_Train_13
	SrcFar HiColPalettes_Train_14
	SrcFar HiColPalettes_Train_15
	SrcFar HiColPalettes_Train_16
	SrcFar HiColPalettes_Train_17
	SrcFar HiColPalettes_Train_18
	SrcFar HiColPalettes_Train_19
	SrcFar HiColPalettes_Train_1a
	SrcFar HiColPalettes_Train_1b
	SrcFar HiColPalettes_Train_1c
	SrcFar HiColPalettes_Train_1d
	SrcFar HiColPalettes_Train_1e
	SrcFar HiColPalettes_Train_1f
	SrcFar HiColPalettes_Train_20
	SrcFar HiColPalettes_Train_21
	SrcFar HiColPalettes_Train_22
	SrcFar HiColPalettes_Train_23
	SrcFar HiColPalettes_Train_24
	SrcFar HiColPalettes_Train_25
	SrcFar HiColPalettes_Train_26
	SrcFar HiColPalettes_Train_27
	SrcFar HiColPalettes_Train_28
	SrcFar HiColPalettes_Train_29
	SrcFar HiColPalettes_Train_2a
	SrcFar HiColPalettes_Train_2b
	SrcFar HiColPalettes_Train_2c
	SrcFar HiColPalettes_Train_2d
	SrcFar HiColPalettes_Train_2e
	SrcFar HiColPalettes_Train_2f
	SrcFar HiColPalettes_Train_30
	SrcFar HiColPalettes_Train_31
	SrcFar HiColPalettes_Train_32
	SrcFar HiColPalettes_Train_33
	SrcFar HiColPalettes_Train_34
	SrcFar HiColPalettes_Train_35
	SrcFar HiColPalettes_Train_36
	SrcFar HiColPalettes_Train_37
	SrcFar HiColPalettes_Train_38
	SrcFar HiColPalettes_Train_39
	SrcFar HiColPalettes_Train_3a
	SrcFar HiColPalettes_Train_3b
	SrcFar HiColPalettes_Train_3c
	SrcFar HiColPalettes_Train_3d
	SrcFar HiColPalettes_Train_3e
	SrcFar HiColPalettes_Train_3f
	SrcFar HiColPalettes_Train_40
	SrcFar HiColPalettes_Train_41
	SrcFar HiColPalettes_Train_42
	SrcFar HiColPalettes_Train_43
	SrcFar HiColPalettes_Train_44
	SrcFar HiColPalettes_Train_45
	SrcFar HiColPalettes_Train_46
	SrcFar HiColPalettes_Train_47
	SrcFar HiColPalettes_Train_48
	SrcFar HiColPalettes_Train_49
	SrcFar HiColPalettes_Train_4a
	SrcFar HiColPalettes_Train_4b
	SrcFar HiColPalettes_Train_4c
	SrcFar HiColPalettes_Train_4d
	SrcFar HiColPalettes_Train_4e
	SrcFar HiColPalettes_Train_4f
	SrcFar HiColPalettes_Train_50
	SrcFar HiColPalettes_Train_51
	SrcFar HiColPalettes_Train_52
	SrcFar HiColPalettes_Train_53
	SrcFar HiColPalettes_Train_54
	SrcFar HiColPalettes_Train_55
	SrcFar HiColPalettes_Train_56
	SrcFar HiColPalettes_Train_57
	SrcFar HiColPalettes_Train_58
	SrcFar HiColPalettes_Train_59
	SrcFar HiColPalettes_Train_5a
	SrcFar HiColPalettes_Train_5b
	SrcFar HiColPalettes_Train_5c
	SrcFar HiColPalettes_Train_5d
	SrcFar HiColPalettes_Train_5e
	SrcFar HiColPalettes_Train_5f
	SrcFar HiColPalettes_Train_60
	SrcFar HiColPalettes_Train_61
	SrcFar HiColPalettes_Train_62
	SrcFar HiColPalettes_Train_63


TrainImageInfoTileDataSources:
	SrcFar Gfx_TrainInfo_00
	SrcFar Gfx_TrainInfo_01
	SrcFar Gfx_TrainInfo_02
	SrcFar Gfx_TrainInfo_03
	SrcFar Gfx_TrainInfo_04
	SrcFar Gfx_TrainInfo_05
	SrcFar Gfx_TrainInfo_06
	SrcFar Gfx_TrainInfo_07
	SrcFar Gfx_TrainInfo_08
	SrcFar Gfx_TrainInfo_09
	SrcFar Gfx_TrainInfo_0a
	SrcFar Gfx_TrainInfo_0b
	SrcFar Gfx_TrainInfo_0c
	SrcFar Gfx_TrainInfo_0d
	SrcFar Gfx_TrainInfo_0e
	SrcFar Gfx_TrainInfo_0f
	SrcFar Gfx_TrainInfo_10
	SrcFar Gfx_TrainInfo_11
	SrcFar Gfx_TrainInfo_12
	SrcFar Gfx_TrainInfo_13
	SrcFar Gfx_TrainInfo_14
	SrcFar Gfx_TrainInfo_15
	SrcFar Gfx_TrainInfo_16
	SrcFar Gfx_TrainInfo_17
	SrcFar Gfx_TrainInfo_18
	SrcFar Gfx_TrainInfo_19
	SrcFar Gfx_TrainInfo_1a
	SrcFar Gfx_TrainInfo_1b
	SrcFar Gfx_TrainInfo_1c
	SrcFar Gfx_TrainInfo_1d
	SrcFar Gfx_TrainInfo_1e
	SrcFar Gfx_TrainInfo_1f
	SrcFar Gfx_TrainInfo_20
	SrcFar Gfx_TrainInfo_21
	SrcFar Gfx_TrainInfo_22
	SrcFar Gfx_TrainInfo_23
	SrcFar Gfx_TrainInfo_24
	SrcFar Gfx_TrainInfo_25
	SrcFar Gfx_TrainInfo_26
	SrcFar Gfx_TrainInfo_27
	SrcFar Gfx_TrainInfo_28
	SrcFar Gfx_TrainInfo_29
	SrcFar Gfx_TrainInfo_2a
	SrcFar Gfx_TrainInfo_2b
	SrcFar Gfx_TrainInfo_2c
	SrcFar Gfx_TrainInfo_2d
	SrcFar Gfx_TrainInfo_2e
	SrcFar Gfx_TrainInfo_2f
	SrcFar Gfx_TrainInfo_30
	SrcFar Gfx_TrainInfo_31
	SrcFar Gfx_TrainInfo_32
	SrcFar Gfx_TrainInfo_33
	SrcFar Gfx_TrainInfo_34
	SrcFar Gfx_TrainInfo_35
	SrcFar Gfx_TrainInfo_36
	SrcFar Gfx_TrainInfo_37
	SrcFar Gfx_TrainInfo_38
	SrcFar Gfx_TrainInfo_39
	SrcFar Gfx_TrainInfo_3a
	SrcFar Gfx_TrainInfo_3b
	SrcFar Gfx_TrainInfo_3c
	SrcFar Gfx_TrainInfo_3d
	SrcFar Gfx_TrainInfo_3e
	SrcFar Gfx_TrainInfo_3f
	SrcFar Gfx_TrainInfo_40
	SrcFar Gfx_TrainInfo_41
	SrcFar Gfx_TrainInfo_42
	SrcFar Gfx_TrainInfo_43
	SrcFar Gfx_TrainInfo_44
	SrcFar Gfx_TrainInfo_45
	SrcFar Gfx_TrainInfo_46
	SrcFar Gfx_TrainInfo_47
	SrcFar Gfx_TrainInfo_48
	SrcFar Gfx_TrainInfo_49
	SrcFar Gfx_TrainInfo_4a
	SrcFar Gfx_TrainInfo_4b
	SrcFar Gfx_TrainInfo_4c
	SrcFar Gfx_TrainInfo_4d
	SrcFar Gfx_TrainInfo_4e
	SrcFar Gfx_TrainInfo_4f
	SrcFar Gfx_TrainInfo_50
	SrcFar Gfx_TrainInfo_51
	SrcFar Gfx_TrainInfo_52
	SrcFar Gfx_TrainInfo_53
	SrcFar Gfx_TrainInfo_54
	SrcFar Gfx_TrainInfo_55
	SrcFar Gfx_TrainInfo_56
	SrcFar Gfx_TrainInfo_57
	SrcFar Gfx_TrainInfo_58
	SrcFar Gfx_TrainInfo_59
	SrcFar Gfx_TrainInfo_5a
	SrcFar Gfx_TrainInfo_5b
	SrcFar Gfx_TrainInfo_5c
	SrcFar Gfx_TrainInfo_5d
	SrcFar Gfx_TrainInfo_5e
	SrcFar Gfx_TrainInfo_5f
	SrcFar Gfx_TrainInfo_60
	SrcFar Gfx_TrainInfo_61
	SrcFar Gfx_TrainInfo_62
	SrcFar Gfx_TrainInfo_63


; ununsed - $69b4
	dw $4000
	dw $4020
	dw $4060
	dw $40a0
	dw $40e0
	dw $4120
	dw $4160
	dw $41a0
	dw $41d0
	dw $4200
	dw $4230
	dw $4260
	dw $42a0
	dw $42e0
	dw $4320
	dw $4360
	dw $43a0
	dw $43e0
	dw $4420
	dw $44a0
	dw $44e0
	dw $4520
	dw $4560
	dw $45a0
	dw $45e0
	dw $4620
	dw $4660
	dw $46b0
	dw $46f0
	dw $4730
	dw $4770
	dw $47b0
	dw $47f0
	dw $4830
	dw $4870
	dw $48b0
	dw $48f0
	dw $4940
	dw $4980
	dw $49c0
	dw $4a00
	dw $4a40
	dw $4a80
	dw $4ac0
	dw $4b00
	dw $4b40
	dw $4bf0
	dw $4ca0
	dw $4ce0
	dw $4d30
	dw $4d70
	dw $4db0
	dw $4df0
	dw $4e30
	dw $4e70
	dw $4eb0
	dw $4ef0
	dw $4f40
	dw $4f80
	dw $4fc0
	dw $5000
	dw $5040
	dw $5080
	dw $50c0
	dw $5100
	dw $5140
	dw $5190
	dw $51f0
	dw $5250
	dw $5290
	dw $52d0
	dw $5320
	dw $5370
	dw $53c0
	dw $5420
	dw $5470
	dw $54c0
	dw $5510
	dw $5560
	dw $55b0
	dw $5600
	dw $5650
	dw $56b0
	dw $5710
	dw $5770
	dw $57c0
	dw $5810
	dw $5860
	dw $58b0
	dw $5900
	dw $5950
	dw $59b0
	dw $5a10
	dw $5a70
	dw $5ad0
	dw $5b30
	dw $5b90
	dw $5bf0
	dw $5c50
	dw $5ca0


TrainImage_PrintScreenHandler:
; Train idx here is 0-indexed (main func sets it back to 1-indexed)
	call ProcessScriptsFromCurrLoc                                  ; $6a7c
	SCR_StructByteAddByte TRAIN_IDX, -1

; Preserve vars and play sound
	SCR_StoreStructByteInAddr TRAIN_IDX, wTrainImage1stSelectedIdx
	SCR_StoreStructByteInAddr VIEWING_TRAIN_IMAGE_INFO, wTrainImageUsesScreen1
	SCR_PlaySound SND_01|MAKE_SOUND_EFFECT
	
; Set all palettes to black - no fade
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_AllBlack)                                 ; $6a8d
	ld   hl, Palettes_AllBlack                                      ; $6a8f
	call SetBGPaletteSrc                                            ; $6a92
	xor  a                                                          ; $6a95
	ld   [wPaletteFadeAmount], a                                    ; $6a96
	ld   [wLoadPalettesFromRam], a                                  ; $6a99
	ld   a, $01                                                     ; $6a9c
	ld   [wLoadBGPalettesFromRom], a                                ; $6a9e

	ld   b, BANK(Palettes_AllBlack)                                 ; $6aa1
	ld   hl, Palettes_AllBlack                                      ; $6aa3
	call SetOBJPaletteSrc                                           ; $6aa6
	xor  a                                                          ; $6aa9
	ld   [wPaletteFadeAmount], a                                    ; $6aaa
	ld   [wLoadPalettesFromRam], a                                  ; $6aad
	ld   a, $01                                                     ; $6ab0
	ld   [wLoadOBJPalettesFromRom], a                               ; $6ab2

; Set new game state
	call ProcessScriptsFromCurrLoc                                  ; $6ab5
	SCR_StoreByteInAddr wGameState, GS_PRINT_TRAIN_IMAGE_INIT
	SCR_StopCurrScript


; unused - $6abd - cleared name tile data source (doesn't clear 4+ hdma5 names)
	db $03
	dw Gfx_TrainImageNames.end


DEF TRAIN_IMAGE_NAME_OFFSET = $4000
; Byte 1 - hdma 5, word after - source
; Entries are sequential, source is in bank $bc
macro TrainImageNameSrc
	db \1-1
	dw TRAIN_IMAGE_NAME_OFFSET
TRAIN_IMAGE_NAME_OFFSET = TRAIN_IMAGE_NAME_OFFSET + \1*$10
endm
TrainImageNameTileDataSources::
	TrainImageNameSrc 2
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 3
	TrainImageNameSrc 3
	TrainImageNameSrc 3
	TrainImageNameSrc 3
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 8
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 5
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 5
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 11
	TrainImageNameSrc 11
	TrainImageNameSrc 4
	TrainImageNameSrc 5
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 5
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 5
	TrainImageNameSrc 6
	TrainImageNameSrc 6
	TrainImageNameSrc 4
	TrainImageNameSrc 4
	TrainImageNameSrc 5
	TrainImageNameSrc 5
	TrainImageNameSrc 5
	TrainImageNameSrc 6
	TrainImageNameSrc 5
	TrainImageNameSrc 5
	TrainImageNameSrc 5
	TrainImageNameSrc 5
	TrainImageNameSrc 5
	TrainImageNameSrc 5
	TrainImageNameSrc 5
	TrainImageNameSrc 6
	TrainImageNameSrc 6
	TrainImageNameSrc 6
	TrainImageNameSrc 5
	TrainImageNameSrc 5
	TrainImageNameSrc 5
	TrainImageNameSrc 5
	TrainImageNameSrc 5
	TrainImageNameSrc 5
	TrainImageNameSrc 6
	TrainImageNameSrc 6
	TrainImageNameSrc 6
	TrainImageNameSrc 6
	TrainImageNameSrc 6
	TrainImageNameSrc 6
	TrainImageNameSrc 6
	TrainImageNameSrc 6
	TrainImageNameSrc 5
	TrainImageNameSrc 5


; A - curr train idx
GetNextAvailableTrainIdxAfterCurr:
	push bc                                                         ; $6bec
	push hl                                                         ; $6bed

; BC is 0-indexed train idx we came from
	ld   c, a                                                       ; $6bee
	ld   b, $00                                                     ; $6bef

.loop:
; Dec index, wrapping to 0 from 99
	inc  c                                                          ; $6bf1
	ld   a, c                                                       ; $6bf2
	cp   NUM_TRAINS                                                 ; $6bf3
	jr   c, :+                                                      ; $6bf5
	ld   c, $00                                                     ; $6bf7

; Loop if train not unlocked
:	ld   hl, wTrainsUnlocked                                        ; $6bf9
	add  hl, bc                                                     ; $6bfc
	ld   a, [hl]                                                    ; $6bfd
	or   a                                                          ; $6bfe
	jr   z, .loop                                                   ; $6bff

; Return new train index
	ld   a, c                                                       ; $6c01

	pop  hl                                                         ; $6c02
	pop  bc                                                         ; $6c03
	ret                                                             ; $6c04


; A - curr train idx
GetNextAvailableTrainIdxBeforeCurr:
	push bc                                                         ; $6c05
	push hl                                                         ; $6c06

; BC is 0-indexed train idx we came from
	ld   c, a                                                       ; $6c07
	ld   b, $00                                                     ; $6c08

.loop:
; Dec index, wrapping to 99 from 0
	dec  c                                                          ; $6c0a
	bit  7, c                                                       ; $6c0b
	jr   z, :+                                                      ; $6c0d
	ld   c, NUM_TRAINS-1                                            ; $6c0f

; Loop if train not unlocked
:	ld   hl, wTrainsUnlocked                                        ; $6c11
	add  hl, bc                                                     ; $6c14
	ld   a, [hl]                                                    ; $6c15
	or   a                                                          ; $6c16
	jr   z, .loop                                                   ; $6c17

; Return new train index
	ld   a, c                                                       ; $6c19

	pop  hl                                                         ; $6c1a
	pop  bc                                                         ; $6c1b
	ret                                                             ; $6c1c
