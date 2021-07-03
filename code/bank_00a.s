INCLUDE "includes.s"

SECTION "ROM Bank $00a", ROMX[$4000], BANK[$a]

GameState03_TrainLineSelectionMain_def::
; Replace lcdc func with 1 specific to this state
	ld   a, [wLCDCInterruptFunc]                                    ; $4000
	ld   l, a                                                       ; $4003
	ld   a, [wLCDCInterruptFunc+1]                                  ; $4004
	ld   h, a                                                       ; $4007

	ld   a, LOW(LCDCInterruptFunc_TrainLineSelection1)              ; $4008
	ld   [wLCDCInterruptFunc], a                                    ; $400a
	ld   a, HIGH(LCDCInterruptFunc_TrainLineSelection1)             ; $400d
	ld   [wLCDCInterruptFunc+1], a                                  ; $400f

; Get SCX from double SCX
	ld   hl, wScrollingText_DoubleSCX+1                             ; $4012
	ld   a, [hl-]                                                   ; $4015
	rrca                                                            ; $4016
	ld   a, [hl]                                                    ; $4017
	rra                                                             ; $4018
	ld   [wScrollingText_SCX], a                                    ; $4019

; Allow lcdc and vblank interrupts, triggering lcdc at line $1f
	xor  a                                                          ; $401c
	ldh  [rIF], a                                                   ; $401d
	ld   a, IEF_LCDC|IEF_VBLANK                                     ; $401f
	ldh  [rIE], a                                                   ; $4021
	ld   a, $1f                                                     ; $4023
	ldh  [rLYC], a                                                  ; $4025
	ld   a, STATF_LYC                                               ; $4027
	ldh  [rSTAT], a                                                 ; $4029
	jp   ResetVBlankQueueData                                       ; $402b


Script_TrainLineSelectionUpdateTrainRelatedTileData:
; Initially at 0, so arrows stop animating for now
	SCR_StoreByteInAddr wTrainLineSelectionTrainRelatedTileDataLoaded, $00
	SCR_ExecAsmBelow

; BC = train idx * $80
	ld   a, [wTrainLineSelectionSelectedTrain]                      ; $4033
	srl  a                                                          ; $4036
	ld   b, a                                                       ; $4038
	ld   c, $00                                                     ; $4039
	rr   c                                                          ; $403b

; BG palette source in HL
	ld   hl, Palettes_TrainLineSelection                            ; $403d
	add  hl, bc                                                     ; $4040

	ld   b, BANK(Palettes_TrainLineSelection)                       ; $4041
	push hl                                                         ; $4043
	call SetBGPaletteSrc                                            ; $4044
	pop  hl                                                         ; $4047

; OBJ palettes after BG palettes
	ld   bc, NUM_PALETTE_BYTES                                      ; $4048
	add  hl, bc                                                     ; $404b

	ld   b, BANK(Palettes_TrainLineSelection)                       ; $404c
	call SetOBJPaletteSrc                                           ; $404e

; Set palettes to fade in from black
	ld   a, $20                                                     ; $4051
	ld   [wPaletteFadeAmount], a                                    ; $4053
	ld   a, $01                                                     ; $4056
	ld   [wLoadPalettesFromRam], a                                  ; $4058
	call ProcessScriptsFromCurrLoc                                  ; $405b
	SCR_ResumeNextFrame
	
; No fade - call a number of funcs in vblank to update data based on train
	SCR_ExecAsmBelow
	xor  a                                                          ; $4060
	ld   [wLoadPalettesFromRam], a                                  ; $4061
	ld   b, $03                                                     ; $4064
	ld   hl, VBlankQueueFuncs_LoadTrainInfoBoxAndTrainTileData      ; $4066
	call PushStackParamsIntoVBlankQueue                             ; $4069
	call ProcessScriptsFromCurrLoc                                  ; $406c
	SCR_ResumeNextFrame
	
	SCR_ExecAsmBelow
	ld   b, $03                                                     ; $4071
	ld   hl, VBlankQueueFuncs_LoadTrainLineSpritesTiles             ; $4073
	call PushStackParamsIntoVBlankQueue                             ; $4076
	call ProcessScriptsFromCurrLoc                                  ; $4079
	SCR_ResumeNextFrame
	
	SCR_ExecAsmBelow
	ld   b, $03                                                     ; $407e
	ld   hl, VBlankQueueFuncs_LoadTrainLine1stScrollTextTiles       ; $4080
	call PushStackParamsIntoVBlankQueue                             ; $4083
	call ProcessScriptsFromCurrLoc                                  ; $4086
	SCR_ResumeNextFrame
	
	SCR_ExecAsmBelow
	ld   b, $03                                                     ; $408b
	ld   hl, VBlankQueueFuncs_LoadTrainLine2ndScrollTextTiles       ; $408d
	call PushStackParamsIntoVBlankQueue                             ; $4090
	call ProcessScriptsFromCurrLoc                                  ; $4093
	SCR_ResumeNextFrame
	
	SCR_ExecAsmBelow
	ld   b, $03                                                     ; $4098
	ld   hl, VBlankQueueFuncs_UpdateTrainLineTileMapBottomHalf      ; $409a
	call PushStackParamsIntoVBlankQueue                             ; $409d
	call ProcessScriptsFromCurrLoc                                  ; $40a0
	SCR_ResumeNextFrame

; Set that tile data is loaded for arrows to re-animate
	SCR_StoreByteInAddr wTrainLineSelectionTrainRelatedTileDataLoaded, $01
	SCR_Ret


TrainLineSelectionScript::
; Set state and black palettes - no fade
	SCR_StoreByteInAddr wGameState, GS_TRAINLINE_SELECTION_MAIN
	SCR_ExecAsmBelow

	ld   b, BANK(Palettes_AllBlack)                                 ; $40ae
	ld   hl, Palettes_AllBlack                                      ; $40b0
	call SetBGPaletteSrc                                            ; $40b3
	xor  a                                                          ; $40b6
	ld   [wPaletteFadeAmount], a                                    ; $40b7
	ld   [wLoadPalettesFromRam], a                                  ; $40ba
	ld   a, $01                                                     ; $40bd
	ld   [wLoadBGPalettesFromRom], a                                ; $40bf

	ld   b, BANK(Palettes_AllBlack)                                 ; $40c2
	ld   hl, Palettes_AllBlack                                      ; $40c4
	call SetOBJPaletteSrc                                           ; $40c7
	xor  a                                                          ; $40ca
	ld   [wPaletteFadeAmount], a                                    ; $40cb
	ld   [wLoadPalettesFromRam], a                                  ; $40ce
	ld   a, $01                                                     ; $40d1
	ld   [wLoadOBJPalettesFromRom], a                               ; $40d3
	call ProcessScriptsFromCurrLoc                                  ; $40d6
	SCR_ResumeNextFrame
	
; Load bank 1 tile data
	SCR_ExecAsmBelow
	ld   a, $01                                                     ; $40db
	ldh  [rVBK], a                                                  ; $40dd
	ld   b, BANK(Gfx_TrainLineSelectionBank1)                       ; $40df
	ld   hl, Gfx_TrainLineSelectionBank1                            ; $40e1
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $40e4

; Load bank 0 tile data ($200 bytes for train line names)
	ld   b, $03                                                     ; $40e7
	ld   hl, VBlankQueueFuncs_LoadTrainNameTiles                    ; $40e9
	call PushStackParamsIntoVBlankQueue                             ; $40ec
	call ProcessScriptsFromCurrLoc                                  ; $40ef
	SCR_ResumeNextFrame
	
; Load tile map up excluding stuff below train
	SCR_ExecAsmBelow
	ld   de, _SCRN0                                                 ; $40f4
	ldbc $0d, $15                                                   ; $40f7
	ld   hl, TileMap_TrainLineSelectionTopHalf                      ; $40fa
	ld   a, BANK(TileMap_TrainLineSelectionTopHalf)                 ; $40fd
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $40ff
	xor  a                                                          ; $4102
	call VBlankEnqueue_SetVramBank                                  ; $4103
	call ProcessScriptsFromCurrLoc                                  ; $4106
	SCR_ResumeNextFrame
	
; Load entire tile attr
	SCR_ExecAsmBelow
	ld   de, _SCRN0                                                 ; $410b
	ldbc SCREEN_TILE_HEIGHT, $15                                    ; $410e
	ld   hl, TileAttr_TrainLineSelection                            ; $4111
	ld   a, BANK(TileAttr_TrainLineSelection)                       ; $4114
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $4116
	ld   a, $01                                                     ; $4119
	call VBlankEnqueue_SetVramBank                                  ; $411b
	call ProcessScriptsFromCurrLoc                                  ; $411e
	SCR_ResumeNextFrame

; Load scrolling text left+right bars
	SCR_FarSetSpriteSrc SpriteOam_TrainLineSelectionScrollTextBars
	SCR_SetSpriteXY $38, $30

; Create script to display the train, the scrolling text and the animating arrows
	SCR_CreateOtherScript 1, OtherScript1_DisplayTrainSprite
	SCR_CreateOtherScript 2, OtherScript2_TrainLineSelectionHandleScrollingText
	SCR_CreateOtherScript 3, OtherScript3_TrainLineSelectionHandleLeftRightArrows

; Start looking at the 1st train, and load its tile data, then fade in
	SCR_StoreByteInAddr wTrainLineSelectionSelectedTrain, $00
	SCR_Call Script_TrainLineSelectionUpdateTrainRelatedTileData
	SCR_Call Script_FadeIn
	
	SCR_ExecAsmBelow
	call ProcessScriptsFromCurrLoc                                  ; $4143
	SCR_Delay $05

.mainLoop:
	SCR_ResumeNextFrame
	
; Check buttons
	SCR_ExecAsmBelow
	ld   a, [wTrainLineSelectionSelectedTrain]                      ; $414a
	ld   b, a                                                       ; $414d
	ld   a, [wButtonsPressed]                                       ; $414e
	bit  PADB_RIGHT, a                                              ; $4151
	jr   z, .rightNotPressed                                        ; $4153

; Right pressed - loop 9 up to 0
	ld   a, b                                                       ; $4155
	inc  a                                                          ; $4156
	cp   $0a                                                        ; $4157
	jr   c, .rightLeftCont                                          ; $4159

	xor  a                                                          ; $415b
	jr   .rightLeftCont                                             ; $415c

.rightNotPressed:
	bit  PADB_LEFT, a                                               ; $415e
	jr   z, .rightOrLeftNotPressed                                  ; $4160

; Left pressed - loop 0 down to 9
	ld   a, b                                                       ; $4162
	or   a                                                          ; $4163
	jr   nz, :+                                                     ; $4164
	ld   a, $0a                                                     ; $4166
:	dec  a                                                          ; $4168

.rightLeftCont:
; Set selected train, fade bottom colorful boxes, train image and scrolling text
	ld   [wTrainLineSelectionSelectedTrain], a                      ; $4169
	ld   a, $d1                                                     ; $416c
	ld   [wBitsSetPerBGPaletteFade], a                              ; $416e

; Fade out train image palettes, play sound, and clear scrolling text
	ld   a, $c0                                                     ; $4171
	ld   [wBitsSetPerOBJPaletteFade], a                             ; $4173
	call ProcessScriptsFromCurrLoc                                  ; $4176
	SCR_PlaySound SND_06|MAKE_SOUND_EFFECT
	SCR_CreateOtherScript 2, OtherScript_ClearScrollText

; Update tile data, fade palettes in, then re-create scrolling text
	SCR_Call Script_TrainLineSelectionUpdateTrainRelatedTileData
	SCR_Call Script_FadeIn
	SCR_CreateOtherScript 2, OtherScript2_TrainLineSelectionHandleScrollingText
	SCR_Jump .mainLoop

.rightOrLeftNotPressed:
	bit  PADB_B, a                                                  ; $418e
	jr   nz, .bPressed                                              ; $4190

	bit  PADB_A, a                                                  ; $4192
	jr   nz, .aOrStartPressed                                       ; $4194

	bit  PADB_START, a                                              ; $4196
	jr   nz, .aOrStartPressed                                       ; $4198

	ld   de, .mainLoop                                              ; $419a
	jp   ProcessScriptsFromDE                                       ; $419d

.bPressed:
; Play sound, fade palettes out, go back to title screen state
	call ProcessScriptsFromCurrLoc                                  ; $41a0
	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $ff
	SCR_StoreByteInAddr wBitsSetPerOBJPaletteFade, $ff
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wGameState, GS_TITLE_SCREEN_OPTS_INIT
	SCR_StopCurrScript
	SCR_ResumeNextFrame

.aOrStartPressed:
; Update selected train line, play sound, fade all palettes out
	ld   a, [wTrainLineSelectionSelectedTrain]                      ; $41b6
	ld   [wSelectedTrainLine], a                                    ; $41b9
	call ProcessScriptsFromCurrLoc                                  ; $41bc
	SCR_PlaySound SND_01|MAKE_SOUND_EFFECT
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $ff
	SCR_StoreByteInAddr wBitsSetPerOBJPaletteFade, $ff
	SCR_Call Script_FadeOut

; Lastly set game state
	SCR_StoreByteInAddr wGameState, GS_PRE_IN_GAME_GRAPHIC_INIT
	SCR_StopCurrScript
	SCR_ResumeNextFrame


OtherScript1_DisplayTrainSprite:
; Just display the train, tile data updates change it
	SCR_FarSetSpriteSrc SpriteOam_TrainLineSelectionTrainImage
	SCR_SetSpriteXY $34, $30
	SCR_ResumeNextFrame
	SCR_StopCurrScript
	SCR_ResumeNextFrame


OtherScript3_TrainLineSelectionHandleLeftRightArrows:
; Animate arrows during when train-related tile data isn't being loaded
; (due to the train being changed)
:	SCR_StoreByteInAddr wTrainLineSelectionLeftRightArrowAnimIdx, $00
	SCR_StartSubScript1 OtherScript3SubScript1_AnimateTrainLineSelectionArrows
	SCR_Call Script_Wait13framesWhileTileDataLoaded

	SCR_StoreByteInAddr wTrainLineSelectionLeftRightArrowAnimIdx, $01
	SCR_StartSubScript1 OtherScript3SubScript1_AnimateTrainLineSelectionArrows
	SCR_Call Script_Wait13framesWhileTileDataLoaded

	SCR_StoreByteInAddr wTrainLineSelectionLeftRightArrowAnimIdx, $02
	SCR_StartSubScript1 OtherScript3SubScript1_AnimateTrainLineSelectionArrows
	SCR_Call Script_Wait13framesWhileTileDataLoaded

	SCR_StoreByteInAddr wTrainLineSelectionLeftRightArrowAnimIdx, $01
	SCR_StartSubScript1 OtherScript3SubScript1_AnimateTrainLineSelectionArrows
	SCR_Call Script_Wait13framesWhileTileDataLoaded
	SCR_Jump :-


Script_Wait13framesWhileTileDataLoaded:
; Wait until tile data is loaded
	SCR_SetCounter1 $0d
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wTrainLineSelectionTrainRelatedTileDataLoaded]         ; $420f
	or   a                                                          ; $4212
	jr   nz, .tileDataLoaded                                        ; $4213

	ld   de, :-                                                     ; $4215
	jp   ProcessScriptsFromDE                                       ; $4218

.tileDataLoaded:
; Then keep waiting until $0d frames pass with tile data loaded
	call ProcessScriptsFromCurrLoc                                  ; $421b
	SCR_DecCounter1_JNE :-
	SCR_Ret


:	call ProcessScriptsFromCurrLoc                                  ; $4222
	SCR_ResumeNextFrame

OtherScript3SubScript1_AnimateTrainLineSelectionArrows:
; Keep looping this func until tile data is loaded for the train
	SCR_ExecAsmBelow
	ld   a, [wTrainLineSelectionTrainRelatedTileDataLoaded]         ; $4227
	or   a                                                          ; $422a
	jr   z, :-                                                      ; $422b

; Wait until vblank interrupt is stubbed (enqueuing done)
	call CheckIfVBlankInterruptIsStubbed                            ; $422d
	jr   nz, :-                                                     ; $4230

; Animate arrows once, then stop this subscript
	ld   b, $03                                                     ; $4232
	ld   hl, VBlankQueueFuncs_UpdateTrainLeftRightArrows            ; $4234
	call PushStackParamsIntoVBlankQueue                             ; $4237
	call ProcessScriptsFromCurrLoc                                  ; $423a
	SCR_StopSubScript1
	SCR_ResumeNextFrame


VBlankQueueFuncs_LoadTrainNameTiles:
	dw HDMATransferTrainLineSelectionNameTiles
	db $00, BANK(HDMATransferTrainLineSelectionNameTiles)
	dw VBlankQueueFunc_SetRomBank


VBlankQueueFuncs_LoadTrainInfoBoxAndTrainTileData:
	dw HDMATransferTrainLineSelectionInfoBoxesAndTrainTileData
	db $00, BANK(HDMATransferTrainLineSelectionInfoBoxesAndTrainTileData)
	dw VBlankQueueFunc_SetRomBank


VBlankQueueFuncs_LoadTrainLineSpritesTiles:
	dw VBlankQueueFunc_LoadTrainLineSelectionSpriteTiles
	db $00, BANK(VBlankQueueFunc_LoadTrainLineSelectionSpriteTiles)
	dw VBlankQueueFunc_SetRomBank
	
	
VBlankQueueFuncs_LoadTrainLine1stScrollTextTiles:
	dw HDMATransferTrainLineSelectionScrollText1stHalfTiles
	db $00, BANK(HDMATransferTrainLineSelectionScrollText1stHalfTiles)
	dw VBlankQueueFunc_SetRomBank


VBlankQueueFuncs_LoadTrainLine2ndScrollTextTiles:
	dw HDMATransferTrainLineSelectionScrollText2ndHalfTiles
	db $00, BANK(HDMATransferTrainLineSelectionScrollText2ndHalfTiles)
	dw VBlankQueueFunc_SetRomBank


VBlankQueueFuncs_UpdateTrainLineTileMapBottomHalf:
	dw HDMATransferTrainLineSelectionTileMapBottomHalf
	db $00, BANK(HDMATransferTrainLineSelectionTileMapBottomHalf)
	dw VBlankQueueFunc_SetRomBank


VBlankQueueFuncs_UpdateTrainLeftRightArrows:
	dw HDMATransferTrainLineSelectionArrowsAnimFrame
	db $00, BANK(HDMATransferTrainLineSelectionArrowsAnimFrame)
	dw VBlankQueueFunc_SetRomBank


GameState1a_GameSetupInit_def::
; Turn on LCD with windows, dont load faded palettes
	ld   a, LCDCF_ON|LCDCF_WIN9C00|LCDCF_WINON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON ; $4269
	ldh  [rLCDC], a                                                 ; $426b
	ld   a, $00                                                     ; $426d
	ld   [wLoadPalettesFromRam], a                                  ; $426f

; Clear scripts and oam
	call InitScriptStructs                                          ; $4272
	call ClearScriptsOamHideAllOam                                  ; $4275

; Keep window (for reset warning) low
	ld   a, $00                                                     ; $4278
	ld   [wWX], a                                                   ; $427a
	ld   a, $8f                                                     ; $427d
	ld   [wWY], a                                                   ; $427f

; Start main script
	M_StartMainScript 0, GameSetupScript

; Clear scroll vars
	xor  a                                                          ; $428b
	ld   hl, wScrollingText_DoubleSCX                               ; $428c
	ld   [hl+], a                                                   ; $428f
	ld   [hl], a                                                    ; $4290

; Do main loop
	jp   GameState1b_GameSetupMain                                  ; $4291


GameState1b_GameSetupMain_def::
; Get current lcd func (unused: HL is trashed)
	ld   a, [wLCDCInterruptFunc]                                    ; $4294
	ld   l, a                                                       ; $4297
	ld   a, [wLCDCInterruptFunc+1]                                  ; $4298
	ld   h, a                                                       ; $429b

; Set new LCDC func
	ld   a, LOW(LCDCInterruptFunc_GameSetupScreen1)                 ; $429c
	ld   [wLCDCInterruptFunc], a                                    ; $429e
	ld   a, HIGH(LCDCInterruptFunc_GameSetupScreen1)                ; $42a1
	ld   [wLCDCInterruptFunc+1], a                                  ; $42a3

; SCX = doubled value / 2
	ld   a, [wScrollingText_DoubleSCX+1]                            ; $42a6
	rrca                                                            ; $42a9
	ld   a, [wScrollingText_DoubleSCX]                              ; $42aa
	rra                                                             ; $42ad
	ld   [wScrollingText_SCX], a                                    ; $42ae

; Set lcd details for 1st LYC (scrolling text), and keep allowing vblank interrupt
	xor  a                                                          ; $42b1
	ldh  [rIF], a                                                   ; $42b2
	ld   a, IEF_LCDC|IEF_VBLANK                                     ; $42b4
	ldh  [rIE], a                                                   ; $42b6
	ld   a, $1f                                                     ; $42b8
	ldh  [rLYC], a                                                  ; $42ba
	ld   a, STATF_LYC                                               ; $42bc
	ldh  [rSTAT], a                                                 ; $42be

; This state uses vblank queue functions
	jp   ResetVBlankQueueData                                       ; $42c0


GameSetupScript:
; Reset selected category and set new game state
	SCR_StoreByteInAddr wGameSetupCurrSelectedCategory, $00
	SCR_StoreByteInAddr wGameState, GS_GAME_SETUP_MAIN

; Set main sprites for screen
	SCR_FarSetSpriteSrc SpriteOam_GameSetupScrollingTextBarriers
	SCR_SetSpriteXY $38, $30

; Set black palettes with no fade
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_AllBlack)                                 ; $42d3
	ld   hl, Palettes_AllBlack                                      ; $42d5
	call SetBGPaletteSrc                                            ; $42d8
	xor  a                                                          ; $42db
	ld   [wPaletteFadeAmount], a                                    ; $42dc
	ld   [wLoadPalettesFromRam], a                                  ; $42df
	ld   a, $01                                                     ; $42e2
	ld   [wLoadBGPalettesFromRom], a                                ; $42e4

	ld   b, BANK(Palettes_AllBlack)                                 ; $42e7
	ld   hl, Palettes_AllBlack                                      ; $42e9
	call SetOBJPaletteSrc                                           ; $42ec
	xor  a                                                          ; $42ef
	ld   [wPaletteFadeAmount], a                                    ; $42f0
	ld   [wLoadPalettesFromRam], a                                  ; $42f3
	ld   a, $01                                                     ; $42f6
	ld   [wLoadOBJPalettesFromRom], a                               ; $42f8

; Load tile data in bank 1 (after bank 0's tile data)
	ld   a, $01                                                     ; $42fb
	ldh  [rVBK], a                                                  ; $42fd
	ld   b, BANK(Gfx_GameSetup)                                     ; $42ff
	ld   hl, Gfx_GameSetup+$1000                                    ; $4301
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $4304

; Load tile data $8800-$97ff in bank 0
	ld   a, $00                                                     ; $4307
	ldh  [rVBK], a                                                  ; $4309
	ld   b, BANK(Gfx_GameSetup)                                     ; $430b
	ld   hl, Gfx_GameSetup-$800                                     ; $430d
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $4310

	call ProcessScriptsFromCurrLoc                                  ; $4313
	SCR_ResumeNextFrame

; Load main BG map and attr during vblank
	SCR_ExecAsmBelow
	ld   a, BANK(TileMapScrn0_GameSetup)                            ; $4318
	ldbc $07, SCREEN_TILE_WIDTH                                     ; $431a
	ld   de, _SCRN0                                                 ; $431d
	ld   hl, TileMapScrn0_GameSetup                                 ; $4320
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $4323
	xor  a                                                          ; $4326
	call VBlankEnqueue_SetVramBank                                  ; $4327

	ld   a, BANK(TileAttrScrn0_GameSetup)                           ; $432a
	ldbc $07, SCREEN_TILE_WIDTH                                     ; $432c
	ld   de, _SCRN0                                                 ; $432f
	ld   hl, TileAttrScrn0_GameSetup                                ; $4332
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $4335
	ld   a, $01                                                     ; $4338
	call VBlankEnqueue_SetVramBank                                  ; $433a

	call ProcessScriptsFromCurrLoc                                  ; $433d
	SCR_ResumeNextFrame

; Load window (reset warning) map and attr during vblank
	SCR_ExecAsmBelow
	ld   a, BANK(TileMapScrn1_GameSetup)                            ; $4342
	ldbc $09, SCREEN_TILE_WIDTH                                     ; $4344
	ld   de, _SCRN1                                                 ; $4347
	ld   hl, TileMapScrn1_GameSetup                                 ; $434a
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $434d
	xor  a                                                          ; $4350
	call VBlankEnqueue_SetVramBank                                  ; $4351

	ld   a, BANK(TileAttrScrn1_GameSetup)                           ; $4354
	ldbc $09, SCREEN_TILE_WIDTH                                     ; $4356
	ld   de, _SCRN1                                                 ; $4359
	ld   hl, TileAttrScrn1_GameSetup                                ; $435c
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $435f
	ld   a, $01                                                     ; $4362
	call VBlankEnqueue_SetVramBank                                  ; $4364

	call ProcessScriptsFromCurrLoc                                  ; $4367
	SCR_ResumeNextFrame

; E = is selected category idx, display it selected in vblank
	SCR_ExecAsmBelow
	ld   e, $00                                                     ; $436c
	call VBlankEnqueue_UpdateGameSetupCategoryDisplay               ; $436e
	call ProcessScriptsFromCurrLoc                                  ; $4371
	SCR_ResumeNextFrame

; Load BG and OBJ palettes - to fade in from black
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_GameSetup)                                ; $4376
	ld   hl, Palettes_GameSetup                                     ; $4378
	call SetBGPaletteSrc                                            ; $437b
	ld   a, $20                                                     ; $437e
	ld   [wPaletteFadeAmount], a                                    ; $4380
	ld   a, $01                                                     ; $4383
	ld   [wLoadPalettesFromRam], a                                  ; $4385

	ld   b, BANK(Palettes_GameSetup)                                ; $4388
	ld   hl, Palettes_GameSetup                                     ; $438a
	call SetOBJPaletteSrc                                           ; $438d
	ld   a, $20                                                     ; $4390
	ld   [wPaletteFadeAmount], a                                    ; $4392
	ld   a, $01                                                     ; $4395
	ld   [wLoadPalettesFromRam], a                                  ; $4397

; Fade in, then start other script to handle scrolling text
	call ProcessScriptsFromCurrLoc                                  ; $439a
	SCR_Call Script_FadeIn
	SCR_CreateOtherScript 1, GameSetupOtherScript_HandleScrollingText

.mainLoop:
	SCR_ResumeNextFrame

	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $43a7
	bit  PADB_A, a                                                  ; $43aa
	jr   z, .aNotPressed                                            ; $43ac

; A pressed - ignore if not at idx 4 (reset warning)
	ld   a, [wGameSetupCurrSelectedCategory]                        ; $43ae
	cp   $04                                                        ; $43b1
	jr   nz, :+                                                     ; $43b3

	ld   de, GameSetupScript_ResetSelected                          ; $43b5
	jp   ProcessScriptsFromDE                                       ; $43b8

:	ld   de, .mainLoop                                              ; $43bb
	jp   ProcessScriptsFromDE                                       ; $43be

.aNotPressed:
	bit  PADB_B, a                                                  ; $43c1
	jr   z, .aAndBNotPressed                                        ; $43c3

; B pressed - save selections then go back to title screen
	call SaveSaveData                                               ; $43c5
	ld   de, .goToTitleScreenOpts                                   ; $43c8
	jp   ProcessScriptsFromDE                                       ; $43cb

.aAndBNotPressed:
	ld   a, [wStickyButtonsHeld]                                    ; $43ce
	bit  PADB_UP, a                                                 ; $43d1
	jr   z, .aBUpNotPressed                                         ; $43d3

; Up pressed - go to main loop if at idx 0
	ld   a, [wGameSetupCurrSelectedCategory]                        ; $43d5
	or   a                                                          ; $43d8
	jr   nz, .processUp                                             ; $43d9

	ld   de, .mainLoop                                              ; $43db
	jp   ProcessScriptsFromDE                                       ; $43de

.processUp:
	dec  a                                                          ; $43e1
	jr   .upDownCont                                                ; $43e2

.aBUpNotPressed:
	bit  PADB_DOWN, a                                               ; $43e4
	jr   z, .btnsNotPressed                                         ; $43e6

; Down pressed - go to main loop if at idx 4 already
	ld   a, [wGameSetupCurrSelectedCategory]                        ; $43e8
	inc  a                                                          ; $43eb
	cp   $05                                                        ; $43ec
	jr   c, .upDownCont                                             ; $43ee

	ld   de, .mainLoop                                              ; $43f0
	jp   ProcessScriptsFromDE                                       ; $43f3

.upDownCont:
; Save current category, and update graphics in vblank to highlight it
	ld   [wGameSetupCurrSelectedCategory], a                        ; $43f6
	ld   e, a                                                       ; $43f9
	call VBlankEnqueue_UpdateGameSetupCategoryDisplay               ; $43fa

; Play sound, then reset scrolling text
	call ProcessScriptsFromCurrLoc                                  ; $43fd
	SCR_PlaySound SND_06|MAKE_SOUND_EFFECT
	SCR_CreateOtherScript 1, GameSetupOtherScript_HandleScrollingText
	SCR_Jump .mainLoop

.btnsNotPressed:
; Check left+right, then we're done this main loop
	ld   a, [wGameSetupCurrSelectedCategory]                        ; $440a
	call GameSetup_CheckLeftRightBtnsPressed                        ; $440d
	ld   de, .mainLoop                                              ; $4410
	jp   ProcessScriptsFromDE                                       ; $4413

.goToTitleScreenOpts:
; Play sound, fade out, and clear scrolling text
	SCR_ResumeNextFrame
	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT
	SCR_Call Script_FadeOut
	SCR_CreateOtherScript 1, OtherScript_ClearScrollText

	SCR_ResumeNextFrame
	SCR_StoreByteInAddr wGameState, GS_TITLE_SCREEN_OPTS_INIT
	SCR_StopCurrScript
	SCR_ResumeNextFrame


GameSetupCategoryRamAddressesAndNumOpts:
	dw wControlSchemeIs1Handed
	dw 2
	dw wDifficultyLevel
	dw 3
	dw wSpeedMeterOption
	dw 2
	dw wDistanceMeterOption
	dw 3


; A - current category being selected
GameSetup_CheckLeftRightBtnsPressed:
; DE = quadruple idx to get wram addr and num opts
	add  a                                                          ; $4438
	add  a                                                          ; $4439
	ld   e, a                                                       ; $443a
	ld   d, $00                                                     ; $443b

; Offset into table, then get wram addr into DE
	ld   hl, GameSetupCategoryRamAddressesAndNumOpts                ; $443d
	add  hl, de                                                     ; $4440
	ld   a, [hl+]                                                   ; $4441
	ld   e, a                                                       ; $4442
	ld   a, [hl+]                                                   ; $4443
	ld   d, a                                                       ; $4444

; Return if left/right not pressed
	ld   a, [wButtonsPressed]                                       ; $4445
	and  PADF_LEFT|PADF_RIGHT                                       ; $4448
	ret  z                                                          ; $444a

; Get num opts in B
	ld   b, [hl]                                                    ; $444b

; A = current wram var
	bit  PADB_RIGHT, a                                              ; $444c
	ld   a, [de]                                                    ; $444e
	jr   z, .checkLeft                                              ; $444f

; If right, inc, and if >= B, don't process it
	inc  a                                                          ; $4451
	cp   b                                                          ; $4452
	ret  nc                                                         ; $4453

	jr   .processMove                                               ; $4454

.checkLeft:
; Don't process if idx == 0, else dec it
	or   a                                                          ; $4456
	ret  z                                                          ; $4457

	dec  a                                                          ; $4458

.processMove:
; Store new option in wram addr
	ld   [de], a                                                    ; $4459

; Play sound
	push af                                                         ; $445a
	ld   a, SND_06                                                  ; $445b
	or   MAKE_SOUND_EFFECT                                          ; $445d
	call PlaySound                                                  ; $445f
	pop  af                                                         ; $4462

; Update the display of the current category only
	ld   a, [wGameSetupCurrSelectedCategory]                        ; $4463
	ld   e, a                                                       ; $4466
	jp   VBlankEnqueue_UpdateGameSetupCategoryDisplay               ; $4467


DEF IS_SELECTING_YES = SCRIPT_VAR_1E
DEF CURR_WINDOW_PIXELS_SHOWN = SCRIPT_VAR_1F
GameSetupScript_ResetSelected:
	SCR_PlaySound SND_06|MAKE_SOUND_EFFECT
	SCR_StoreByteInStruct IS_SELECTING_YES, $00
	SCR_StoreByteInStruct CURR_WINDOW_PIXELS_SHOWN, $00

; Set display for window's reset selection
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $4473
	ld   h, a                                                       ; $4475
	ld   l, IS_SELECTING_YES                                        ; $4476
	ld   a, [hl]                                                    ; $4478
	call VBlankEnqueue_UpdateResetOptChosenDisplay                  ; $4479

; 11 times, move window up 8 pixels
	call ProcessScriptsFromCurrLoc                                  ; $447c
	SCR_SetCounter1 $0b
.showWindowLoop:
	SCR_ResumeNextFrame
	SCR_StructByteAddByte CURR_WINDOW_PIXELS_SHOWN, $08

; $8f - pixels shown = window Y
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $4486
	ld   h, a                                                       ; $4487
	ld   l, CURR_WINDOW_PIXELS_SHOWN                                ; $4489
	ld   a, $8f                                                     ; $448b
	sub  [hl]                                                       ; $448d
	ld   [wWY], a                                                   ; $448e
	call ProcessScriptsFromCurrLoc                                  ; $4491
	SCR_DecCounter1_JNE .showWindowLoop

.mainLoop:
	SCR_ResumeNextFrame

; HL contains if selecting yes
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $4499
	ld   h, a                                                       ; $449b
	ld   l, IS_SELECTING_YES                                        ; $449c

; If B pressed, go to exiting reset state
	ld   a, [wButtonsPressed]                                       ; $449e
	bit  PADB_B, a                                                  ; $44a1
	jr   nz, .playSoundThenHideWindow                               ; $44a3

	bit  PADB_A, a                                                  ; $44a5
	jr   z, .checkLeftRight                                         ; $44a7

; A pressed - if at default no option (pointing right), just exit
	ld   a, [hl]                                                    ; $44a9
	or   a                                                          ; $44aa
	jr   z, .playSoundThenHideWindow                                ; $44ab

; Erasing save data
	call ResetSaveData                                              ; $44ad
	call SaveSaveData                                               ; $44b0

; Play sound
	push af                                                         ; $44b3
	ld   a, SND_01                                                  ; $44b4
	or   MAKE_SOUND_EFFECT                                          ; $44b6
	call PlaySound                                                  ; $44b8
	pop  af                                                         ; $44bb

; Display selected Reset category, even after hiding window
	ld   e, $04                                                     ; $44bc
	call VBlankEnqueue_UpdateGameSetupCategoryDisplay               ; $44be
	ld   de, .hideWindowLoop                                        ; $44c1
	jp   ProcessScriptsFromDE                                       ; $44c4

.checkLeftRight:
; Loop again for next frame if left/right not pressed
	and  PADF_LEFT|PADF_RIGHT                                       ; $44c7
	jr   nz, :+                                                     ; $44c9

	ld   de, .mainLoop                                              ; $44cb
	jp   ProcessScriptsFromDE                                       ; $44ce

:	bit  PADB_RIGHT, a                                              ; $44d1
	ld   a, [hl]                                                    ; $44d3
	jr   z, .leftPressed                                            ; $44d4

; Right pressed - if pointing right, loop for next frame
	or   a                                                          ; $44d6
	jr   nz, .flipOptSelected                                       ; $44d7

	ld   de, .mainLoop                                              ; $44d9
	jp   ProcessScriptsFromDE                                       ; $44dc

.leftPressed:
; If pointing left, loop for next frame
	or   a                                                          ; $44df
	jr   z, .flipOptSelected                                        ; $44e0

	ld   de, .mainLoop                                              ; $44e2
	jp   ProcessScriptsFromDE                                       ; $44e5

.flipOptSelected:
; Store flipped selection
	xor  $01                                                        ; $44e8
	ld   [hl], a                                                    ; $44ea

; Update display of chosen option, then play sound
	call VBlankEnqueue_UpdateResetOptChosenDisplay                  ; $44eb
	call ProcessScriptsFromCurrLoc                                  ; $44ee
	SCR_PlaySound SND_06|MAKE_SOUND_EFFECT
	SCR_ResumeNextFrame
	SCR_Jump .mainLoop

.playSoundThenHideWindow:
	call ProcessScriptsFromCurrLoc                                  ; $44f7
	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT

.hideWindowLoop:
	SCR_ResumeNextFrame

; Pixels shown -= 8 and into B
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $44fe
	ld   h, a                                                       ; $4500
	ld   l, CURR_WINDOW_PIXELS_SHOWN                                ; $4501
	ld   a, [hl]                                                    ; $4503
	sub  $08                                                        ; $4504
	ld   b, a                                                       ; $4506
	ld   [hl], a                                                    ; $4507

; Window Y = $8f - pixels shown
	ld   a, $8f                                                     ; $4508
	sub  [hl]                                                       ; $450a
	ld   [wWY], a                                                   ; $450b

; Jump if pixels shown == 0
	ld   a, b                                                       ; $450e
	or   a                                                          ; $450f
	jr   z, .window0PixelsShown                                     ; $4510

	ld   de, .hideWindowLoop                                        ; $4512
	jp   ProcessScriptsFromDE                                       ; $4515

.window0PixelsShown:
; Jump back to main loop
	call ProcessScriptsFromCurrLoc                                  ; $4518
	SCR_Jump GameSetupScript.mainLoop


; A - 1 if selecting yes, else 0
VBlankEnqueue_UpdateResetOptChosenDisplay:
; Selecting no address
	ld   hl, TileMapAndAttr_ResetNoSelected                         ; $451e
	or   a                                                          ; $4521
	jr   z, :+                                                      ; $4522

; Selecting yes address
	ld   hl, TileMapAndAttr_ResetYesSelected                        ; $4524

; Copy 4 rows of tile map and attrs to window
:	ld   a, BANK(TileMapAndAttr_ResetNoSelected)                    ; $4527
	ldbc $04, SCREEN_TILE_WIDTH                                     ; $4529
	ld   de, _SCRN1+$100                                            ; $452c

; Use bank, cols, rows, dest and start, then vram bank 0
	push hl                                                         ; $452f
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $4530
	xor  a                                                          ; $4533
	call VBlankEnqueue_SetVramBank                                  ; $4534

; Use similar bank, source inc'ed to attr area, and similar dest but vram bank 1
	ld   a, BANK(TileMapAndAttr_ResetYesSelected)                   ; $4537
	pop  hl                                                         ; $4539
	ld   bc, TileMapAndAttr_ResetYesSelected.attr-TileMapAndAttr_ResetYesSelected ; $453a
	add  hl, bc                                                     ; $453d
	ldbc $04, SCREEN_TILE_WIDTH                                     ; $453e
	ld   de, _SCRN1+$100                                            ; $4541
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $4544

	ld   a, $01                                                     ; $4547
	jp   VBlankEnqueue_SetVramBank                                  ; $4549


; E - selected category
VBlankEnqueue_UpdateGameSetupCategoryDisplay:
; During vblank, change back to hdma func
	ld   hl, VBlankQueueFunc_SetRomBank                             ; $454c
	push hl                                                         ; $454f
	ld   a, BANK(VBlankEnqueue_HDMATransfer2TileMapAttrRows)        ; $4550
	push af                                                         ; $4552

; For 5 categories, update tile map and attrs in vblank
; Control scheme
	ld   hl, VBlankEnqueue_HDMATransfer2TileMapAttrRows             ; $4553
	push hl                                                         ; $4556
	ld   hl, _SCRN0+$e0                                             ; $4557
	push hl                                                         ; $455a
	ld   hl, GameSetup_ControlSchemeTileMapAttrAddresses            ; $455b
	ld   a, [wControlSchemeIs1Handed]                               ; $455e
	ld   d, $00                                                     ; $4561
	call GetSrcAddressForGameSetupOptCategoryTileMapsAndAttrs       ; $4563
	push hl                                                         ; $4566

; Difficulty
	ld   hl, VBlankEnqueue_HDMATransfer2TileMapAttrRows             ; $4567
	push hl                                                         ; $456a
	ld   hl, _SCRN0+$120                                            ; $456b
	push hl                                                         ; $456e
	ld   hl, GameSetup_DifficultyTileMapAttrAddresses               ; $456f
	ld   a, [wDifficultyLevel]                                      ; $4572
	ld   d, $01                                                     ; $4575
	call GetSrcAddressForGameSetupOptCategoryTileMapsAndAttrs       ; $4577
	push hl                                                         ; $457a

; Speed meter
	ld   hl, VBlankEnqueue_HDMATransfer2TileMapAttrRows             ; $457b
	push hl                                                         ; $457e
	ld   hl, _SCRN0+$160                                            ; $457f
	push hl                                                         ; $4582
	ld   hl, GameSetup_SpeedMeterOptTileMapAttrAddresses            ; $4583
	ld   a, [wSpeedMeterOption]                                     ; $4586
	ld   d, $02                                                     ; $4589
	call GetSrcAddressForGameSetupOptCategoryTileMapsAndAttrs       ; $458b
	push hl                                                         ; $458e

; Distance meter
	ld   hl, VBlankEnqueue_HDMATransfer2TileMapAttrRows             ; $458f
	push hl                                                         ; $4592
	ld   hl, _SCRN0+$1a0                                            ; $4593
	push hl                                                         ; $4596
	ld   hl, GameSetup_DistanceMeterOptTileMapAttrAddresses         ; $4597
	ld   a, [wDistanceMeterOption]                                  ; $459a
	ld   d, $03                                                     ; $459d
	call GetSrcAddressForGameSetupOptCategoryTileMapsAndAttrs       ; $459f
	push hl                                                         ; $45a2

; Reset option
	ld   hl, VBlankEnqueue_HDMATransfer2TileMapAttrRows             ; $45a3
	push hl                                                         ; $45a6
	ld   hl, _SCRN0+$1e0                                            ; $45a7
	push hl                                                         ; $45aa
	ld   hl, GameSetup_ResetOptionTileMapAttrAddresses              ; $45ab
	xor  a                                                          ; $45ae
	ld   d, $04                                                     ; $45af
	call GetSrcAddressForGameSetupOptCategoryTileMapsAndAttrs       ; $45b1
	push hl                                                         ; $45b4

; 3 addresses pushed per 5 category, plus the addresses for setting rom bank
	ld   b, 3*5 + 2                                                 ; $45b5
	ld   hl, sp+$00                                                 ; $45b7
	call PushStackParamsIntoVBlankQueue                             ; $45b9

; Return to top of the $11 addresses
	ld   hl, sp+$22                                                 ; $45bc
	ld   sp, hl                                                     ; $45be
	ret                                                             ; $45bf


; A - category opt idx
; D - curr category
; E - selected category
; HL - address of table below, for a category
GetSrcAddressForGameSetupOptCategoryTileMapsAndAttrs:
	add  a                                                          ; $45c0
	add  a                                                          ; $45c1
	ld   c, a                                                       ; $45c2

; If curr category is also selected, +2 to get the highlighted tile attr data
	ld   a, d                                                       ; $45c3
	cp   e                                                          ; $45c4
	jr   nz, :+                                                     ; $45c5

	inc  c                                                          ; $45c7
	inc  c                                                          ; $45c8

; HL = address in table offsetted by BC
:	ld   b, $00                                                     ; $45c9
	add  hl, bc                                                     ; $45cb
	ld   a, [hl+]                                                   ; $45cc
	ld   h, [hl]                                                    ; $45cd
	ld   l, a                                                       ; $45ce
	ret  nz                                                         ; $45cf


GameSetup_ControlSchemeTileMapAttrAddresses:
	dw TileMapAndAttr_GameSetup2Handed_Unselected
	dw TileMapAndAttr_GameSetup2Handed_Selected
	dw TileMapAndAttr_GameSetup1Handed_Unselected
	dw TileMapAndAttr_GameSetup1Handed_Selected


GameSetup_DifficultyTileMapAttrAddresses:
	dw TileMapAndAttr_GameSetupEasy_Unselected
	dw TileMapAndAttr_GameSetupEasy_Selected
	dw TileMapAndAttr_GameSetupNormal_Unselected
	dw TileMapAndAttr_GameSetupNormal_Selected
	dw TileMapAndAttr_GameSetupHard_Unselected
	dw TileMapAndAttr_GameSetupHard_Selected


GameSetup_SpeedMeterOptTileMapAttrAddresses:
	dw TileMapAndAttr_GameSetupSpeedAverage_Unselected
	dw TileMapAndAttr_GameSetupSpeedAverage_Selected
	dw TileMapAndAttr_GameSetupSpeedHidden_Unselected
	dw TileMapAndAttr_GameSetupSpeedHidden_Selected


GameSetup_DistanceMeterOptTileMapAttrAddresses:
	dw TileMapAndAttr_GameSetupDistanceM_Unselected
	dw TileMapAndAttr_GameSetupDistanceM_Selected
	dw TileMapAndAttr_GameSetupDistanceCM_Unselected
	dw TileMapAndAttr_GameSetupDistanceCM_Selected
	dw TileMapAndAttr_GameSetupDistanceHidden_Unselected
	dw TileMapAndAttr_GameSetupDistanceHidden_Selected


GameSetup_ResetOptionTileMapAttrAddresses:
	dw TileMapAndAttr_GameSetupReset_Unselected
	dw TileMapAndAttr_GameSetupReset_Selected


; SP/SP+1 - source
; SP+2/SP+3 - dest
; SP+4 - bank
; SP+5 - hdma5
; SP+6 - vram bank
VBlankQueueFunc_HDMATransferUsing4Addresses:
	pop  hl                                                         ; $45fc
	pop  de                                                         ; $45fd
	pop  bc                                                         ; $45fe
	pop  af                                                         ; $45ff
	jp   GenericHDMATransfer                                        ; $4600


HDMATransferPictureBookLogoSprTileData::
; Sprite uses $400 bytes
	ld   de, _VRAM                                                  ; $4603
	ldbc $00, ($400/$10-1)                                          ; $4606
	call HDMATransferPictureBookLogoTileData                        ; $4609

; Trash current vblank int, and set a new one to transfer BG after
	ld   a, [wVBlankInterruptFunc]                                  ; $460c
	ld   l, a                                                       ; $460f
	ld   a, [wVBlankInterruptFunc+1]                                ; $4610
	ld   h, a                                                       ; $4613

	ld   a, LOW(VBlankInterrupt_HDMATransferPictureBookLogoBGTileData) ; $4614
	ld   [wVBlankInterruptFunc], a                                  ; $4616
	ld   a, HIGH(VBlankInterrupt_HDMATransferPictureBookLogoBGTileData) ; $4619
	ld   [wVBlankInterruptFunc+1], a                                ; $461b
	ret                                                             ; $461e


HDMATransferPictureBookLogoBGTileData::
; BG uses $300 bytes
	ld   de, _VRAM+$1500                                            ; $461f
	ldbc $04, ($300/$10-1)                                          ; $4622
	call HDMATransferPictureBookLogoTileData                        ; $4625

; Trash current interrupt func, and replace with stub
	ld   a, [wVBlankInterruptFunc]                                  ; $4628
	ld   l, a                                                       ; $462b
	ld   a, [wVBlankInterruptFunc+1]                                ; $462c
	ld   h, a                                                       ; $462f

	ld   a, LOW(StubInterruptFunc)                                  ; $4630
	ld   [wVBlankInterruptFunc], a                                  ; $4632
	ld   a, HIGH(StubInterruptFunc)                                 ; $4635
	ld   [wVBlankInterruptFunc+1], a                                ; $4637
	ret                                                             ; $463a


; B - offset into src * $100
; C - hdma5 (num bytes/$10-1)
; DE - dest
HDMATransferPictureBookLogoTileData:
; Get source address in HL, then offset based on B (4 for BG, after $400 sprite bytes)
	ld   hl, wPictureBookLogoTileDataAddr                           ; $463b
	ld   a, [hl+]                                                   ; $463e
	ld   h, [hl]                                                    ; $463f
	ld   l, a                                                       ; $4640
	ld   a, h                                                       ; $4641
	add  b                                                          ; $4642
	ld   h, a                                                       ; $4643

; Get bank, vram bank = 0
	ld   a, [wPictureBookLogoTileDataBank]                          ; $4644
	ld   b, a                                                       ; $4647
	xor  a                                                          ; $4648
	jp   GenericHDMATransfer                                        ; $4649


LoadSpriteTilesForPictureBookMainSelection:
; Main selection is triple index into table containing
	ld   a, [PAGE_0+PIC_BOOK_MAIN_SELECTION]                        ; $464c
	ld   b, a                                                       ; $464f
	add  a                                                          ; $4650
	add  b                                                          ; $4651
	ld   c, a                                                       ; $4652
	ld   b, $00                                                     ; $4653
	ld   hl, .table                                                 ; $4655
	add  hl, bc                                                     ; $4658

; Get source details
	ld   a, [hl+]                                                   ; $4659
	ld   [wPictureBookLogoTileDataBank], a                          ; $465a
	ld   a, [hl+]                                                   ; $465d
	ld   [wPictureBookLogoTileDataAddr], a                          ; $465e
	ld   a, [hl]                                                    ; $4661
	ld   [wPictureBookLogoTileDataAddr+1], a                        ; $4662

; Trash curr vblank int func, and set new one to transfer sprite tile data=
	ld   a, [wVBlankInterruptFunc]                                  ; $4665
	ld   l, a                                                       ; $4668
	ld   a, [wVBlankInterruptFunc+1]                                ; $4669
	ld   h, a                                                       ; $466c

	ld   a, LOW(VBlankInterrupt_HDMATransferPictureBookLogoSprTileData) ; $466d
	ld   [wVBlankInterruptFunc], a                                  ; $466f
	ld   a, HIGH(VBlankInterrupt_HDMATransferPictureBookLogoSprTileData) ; $4672
	ld   [wVBlankInterruptFunc+1], a                                ; $4674
	ret                                                             ; $4677

.table:
	db BANK(Gfx_PictureBookCameraBGAndSprite)
	dw Gfx_PictureBookCameraBGAndSprite
	db BANK(Gfx_PictureBookMovieBGAndSprite)
	dw Gfx_PictureBookMovieBGAndSprite
	db BANK(Gfx_PictureBookMusicBGAndSprite)
	dw Gfx_PictureBookMusicBGAndSprite


GameState26_PictureBookMain_def::
; Current lcdc func in HL (trashed after jump)
	ld   a, [wLCDCInterruptFunc]                                    ; $4681
	ld   l, a                                                       ; $4684
	ld   a, [wLCDCInterruptFunc+1]                                  ; $4685
	ld   h, a                                                       ; $4688

; Set new lcdc interrupt func
	ld   a, LOW(LCDCInterruptFunc_PictureBook1)                     ; $4689
	ld   [wLCDCInterruptFunc], a                                    ; $468b
	ld   a, HIGH(LCDCInterruptFunc_PictureBook1)                    ; $468e
	ld   [wLCDCInterruptFunc+1], a                                  ; $4690

; Make sure current scrolling text SCX is updated
	ld   a, [wScrollingText_DoubleSCX+1]                            ; $4693
	rrca                                                            ; $4696
	ld   a, [wScrollingText_DoubleSCX]                              ; $4697
	rra                                                             ; $469a
	ld   [wScrollingText_SCX], a                                    ; $469b

; Update scroll for right table, for lcdc interrupts to handle
	ld   a, [wPictureBookNextSCXForRightTable]                      ; $469e
	ld   [wPictureBookSCXForRightTable], a                          ; $46a1

; Both lcdc and vblank allowed, with lcdc triggering on line $1f
	xor  a                                                          ; $46a4
	ldh  [rIF], a                                                   ; $46a5
	ld   a, IEF_LCDC|IEF_VBLANK                                     ; $46a7
	ldh  [rIE], a                                                   ; $46a9
	ld   a, $1f                                                     ; $46ab
	ldh  [rLYC], a                                                  ; $46ad
	ld   a, STATF_LYC                                               ; $46af
	ldh  [rSTAT], a                                                 ; $46b1

; Allow vblank queueing for small display updates
	jp   ResetVBlankQueueData                                       ; $46b3


UpdateBGPalettesForPictureBookMenuSelection:
; HL = double index into table for palette setting func
	ld   a, [PAGE_0+PIC_BOOK_MAIN_SELECTION]                        ; $46b6
	add  a                                                          ; $46b9
	ld   c, a                                                       ; $46ba
	ld   b, $00                                                     ; $46bb
	ld   hl, .paletteSettingFuncs                                   ; $46bd
	add  hl, bc                                                     ; $46c0

; Jump to it
	ld   a, [hl+]                                                   ; $46c1
	ld   h, [hl]                                                    ; $46c2
	ld   l, a                                                       ; $46c3
	jp   hl                                                         ; $46c4

.paletteSettingFuncs:
	dw .train
	dw .movie
	dw .music

; For either selection, set to fade BG+OBJ palettes in from black
.train:
	ld   b, BANK(Palettes_PictureBookCameraLogo)                    ; $46cb
	ld   hl, Palettes_PictureBookCameraLogo                         ; $46cd
	call SetBGPaletteSrc                                            ; $46d0
	ld   a, $20                                                     ; $46d3
	ld   [wPaletteFadeAmount], a                                    ; $46d5
	ld   a, $01                                                     ; $46d8
	ld   [wLoadPalettesFromRam], a                                  ; $46da

	ld   b, BANK(Palettes_PictureBookCameraLogo)                    ; $46dd
	ld   hl, Palettes_PictureBookCameraLogo                         ; $46df
	call SetOBJPaletteSrc                                           ; $46e2
	ld   a, $20                                                     ; $46e5
	ld   [wPaletteFadeAmount], a                                    ; $46e7
	ld   a, $01                                                     ; $46ea
	ld   [wLoadPalettesFromRam], a                                  ; $46ec
	ret                                                             ; $46ef

.movie:
	ld   b, BANK(Palettes_PictureBookMovieLogo)                     ; $46f0
	ld   hl, Palettes_PictureBookMovieLogo                          ; $46f2
	call SetBGPaletteSrc                                            ; $46f5
	ld   a, $20                                                     ; $46f8
	ld   [wPaletteFadeAmount], a                                    ; $46fa
	ld   a, $01                                                     ; $46fd
	ld   [wLoadPalettesFromRam], a                                  ; $46ff
	
	ld   b, BANK(Palettes_PictureBookMovieLogo)                     ; $4702
	ld   hl, Palettes_PictureBookMovieLogo                          ; $4704
	call SetOBJPaletteSrc                                           ; $4707
	ld   a, $20                                                     ; $470a
	ld   [wPaletteFadeAmount], a                                    ; $470c
	ld   a, $01                                                     ; $470f
	ld   [wLoadPalettesFromRam], a                                  ; $4711
	ret                                                             ; $4714

.music:
	ld   b, BANK(Palettes_PictureBookMusicLogo)                     ; $4715
	ld   hl, Palettes_PictureBookMusicLogo                          ; $4717
	call SetBGPaletteSrc                                            ; $471a
	ld   a, $20                                                     ; $471d
	ld   [wPaletteFadeAmount], a                                    ; $471f
	ld   a, $01                                                     ; $4722
	ld   [wLoadPalettesFromRam], a                                  ; $4724
	
	ld   b, BANK(Palettes_PictureBookMusicLogo)                     ; $4727
	ld   hl, Palettes_PictureBookMusicLogo                          ; $4729
	call SetOBJPaletteSrc                                           ; $472c
	ld   a, $20                                                     ; $472f
	ld   [wPaletteFadeAmount], a                                    ; $4731
	ld   a, $01                                                     ; $4734
	ld   [wLoadPalettesFromRam], a                                  ; $4736
	ret                                                             ; $4739


; A - 0 to unhighlight all, 1-3 to highlighted the respective option
VBlankEnqueue_DisplaySelectedPictureBookMenuOpt:
	ld   de, _SCRN0+$e8                                             ; $473a

; A - 0 to unhighlight all, 1-3 to highlighted the respective option
; DE - vram map dest
VBlankEnqueue_DisplaySelectedPictureBookMenuOptAtSpecifiedDest:
; HL = double index into table
	add  a                                                          ; $473d
	ld   c, a                                                       ; $473e
	ld   b, $00                                                     ; $473f
	ld   hl, .sources                                               ; $4741
	add  hl, bc                                                     ; $4744

; HL = addr in table
	ld   a, [hl+]                                                   ; $4745
	ld   h, [hl]                                                    ; $4746
	ld   l, a                                                       ; $4747

; Enqueue tile map details
	ldbc $0b, $0c                                                   ; $4748
	ld   a, BANK(TileMap_PictureBookMenuUnhighlighted)              ; $474b
	push de                                                         ; $474d
	push hl                                                         ; $474e
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $474f
	xor  a                                                          ; $4752
	call VBlankEnqueue_SetVramBank                                  ; $4753

; Source addr is after tile map
	pop  hl                                                         ; $4756
	ld   de, TileMap_PictureBookMenuUnhighlighted.attr-TileMap_PictureBookMenuUnhighlighted ; $4757
	add  hl, de                                                     ; $475a
	pop  de                                                         ; $475b

; Display tile attr
	ldbc $0b, $0c                                                   ; $475c
	ld   a, BANK(TileMap_PictureBookMenuUnhighlighted.attr)         ; $475f
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $4761
	ld   a, $01                                                     ; $4764
	jp   VBlankEnqueue_SetVramBank                                  ; $4766

.sources:
	dw TileMap_PictureBookMenuUnhighlighted
	dw TileMap_PictureBookMenuTrainHighlighted
	dw TileMap_PictureBookMenuMovieHighlighted
	dw TileMap_PictureBookMenuMusicHighlighted


; unused - VBlankEnqueue_DisplaySelectedPictureBookSubMenu
	ld   de, _SCRN0+$f4                                             ; $4771

; A - 0-2 to highlighted the respective option, 3 - train menu, 4 - from ram
; DE - vram map dest
VBlankEnqueue_DisplaySelectedPictureBookSubMenuAtSpecifiedDest:
; HL = double index into table
	add  a                                                          ; $4774
	ld   c, a                                                       ; $4775
	ld   b, $00                                                     ; $4776
	ld   hl, .sources                                               ; $4778
	add  hl, bc                                                     ; $477b

; HL = addr in table
	ld   a, [hl+]                                                   ; $477c
	ld   h, [hl]                                                    ; $477d
	ld   l, a                                                       ; $477e

; Enqueue tile map details
	ld   a, BANK(TileMap_PictureBookMovieSubMenu)                   ; $477f
	ldbc $0b, $0c                                                   ; $4781
	push de                                                         ; $4784
	push hl                                                         ; $4785
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $4786
	xor  a                                                          ; $4789
	call VBlankEnqueue_SetVramBank                                  ; $478a

; Source addr is after tile map
	pop  hl                                                         ; $478d
	ld   de, TileMap_PictureBookMovieSubMenu.attr-TileMap_PictureBookMovieSubMenu ; $478e
	add  hl, de                                                     ; $4791
	pop  de                                                         ; $4792

; Display tile attr
	ld   a, BANK(TileMap_PictureBookMovieSubMenu)                   ; $4793
	ldbc $0b, $0c                                                   ; $4795
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $4798
	ld   a, $01                                                     ; $479b
	jp   VBlankEnqueue_SetVramBank                                  ; $479d

.sources:
	dw TileMap_PictureBookTrainSubMenu
	dw TileMap_PictureBookMovieSubMenu
	dw TileMap_PictureBookMusicSubMenu
	dw TileMap_PictureBookTrainItemList
	dw wPictureBookSubMenuTileMap
	
	
Script_StoreSubMenuAreaInRamForScrollingLater:
	SCR_ExecAsmBelow
	
; Enqueue tile map data
	ld   b, (VBlankQueueFuncs_SaveSubMenuMapInRam.end-\
		VBlankQueueFuncs_SaveSubMenuMapInRam)/2
	ld   hl, VBlankQueueFuncs_SaveSubMenuMapInRam                   ; $47ad
	call PushStackParamsIntoVBlankQueue                             ; $47b0
	call ProcessScriptsFromCurrLoc                                  ; $47b3
	SCR_ResumeNextFrame
	
; Enqueue tile attr data
	SCR_ExecAsmBelow
	ld   b, (VBlankQueueFuncs_SaveSubMenuAttrInRam.end-\
		VBlankQueueFuncs_SaveSubMenuAttrInRam)/2
	ld   hl, VBlankQueueFuncs_SaveSubMenuAttrInRam                  ; $47ba
	call PushStackParamsIntoVBlankQueue                             ; $47bd
	call ProcessScriptsFromCurrLoc                                  ; $47c0
	SCR_ResumeNextFrame

	SCR_Ret


; SP/SP+1 - source
; SP+2/SP+3 - dest
VBlankQueueFunc_Copy12bytes:
	pop  de                                                         ; $47c5
	pop  hl                                                         ; $47c6

; Copy 12 bytes
	ld   b, $0c                                                     ; $47c7
:	ld   a, [de]                                                    ; $47c9
	ld   [hl+], a                                                   ; $47ca
	inc  e                                                          ; $47cb
	dec  b                                                          ; $47cc
	jr   nz, :-                                                     ; $47cd

	ret                                                             ; $47cf


VBlankQueueFuncs_SaveSubMenuAttrInRam:
DEF CURR_DEST = $98e8+10*$20
DEF CURR_RAM_OFFSET = 10*$c
rept 11
	dw wPictureBookSubMenuTileAttr+CURR_RAM_OFFSET
	dw CURR_DEST
	dw VBlankQueueFunc_Copy12bytes
CURR_DEST = CURR_DEST - $20
CURR_RAM_OFFSET = CURR_RAM_OFFSET - $c
endr

	db $00, BANK(VBlankQueueFunc_Copy12bytes)
	dw VBlankQueueFunc_SetRomBank
	db $01, $01
	dw VBlankQueueFunc_SetVramBank
.end:


VBlankQueueFuncs_SaveSubMenuMapInRam:
DEF CURR_DEST = $98e8+10*$20
DEF CURR_RAM_OFFSET = 10*$c
rept 11
	dw wPictureBookSubMenuTileMap+CURR_RAM_OFFSET
	dw CURR_DEST
	dw VBlankQueueFunc_Copy12bytes
CURR_DEST = CURR_DEST - $20
CURR_RAM_OFFSET = CURR_RAM_OFFSET - $c
endr

	db $00, BANK(VBlankQueueFunc_Copy12bytes)
	dw VBlankQueueFunc_SetRomBank
	db $00, $00
	dw VBlankQueueFunc_SetVramBank
.end:


; Load palettes, tile data, scroll area tile map, attr and OAM
Script_PictureBookStateInit:
; Set BG palettes to all black - no fade
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_AllBlack)                                 ; $4865
	ld   hl, Palettes_AllBlack                                      ; $4867
	call SetBGPaletteSrc                                            ; $486a
	xor  a                                                          ; $486d
	ld   [wPaletteFadeAmount], a                                    ; $486e
	ld   [wLoadPalettesFromRam], a                                  ; $4871
	ld   a, $01                                                     ; $4874
	ld   [wLoadBGPalettesFromRom], a                                ; $4876

; Set OBJ palettes to all black - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $4879
	ld   hl, Palettes_AllBlack                                      ; $487b
	call SetOBJPaletteSrc                                           ; $487e
	xor  a                                                          ; $4881
	ld   [wPaletteFadeAmount], a                                    ; $4882
	ld   [wLoadPalettesFromRam], a                                  ; $4885
	ld   a, $01                                                     ; $4888
	ld   [wLoadOBJPalettesFromRom], a                               ; $488a
	call ProcessScriptsFromCurrLoc                                  ; $488d
	SCR_ResumeNextFrame

; Set all palettes affected by fade
	SCR_ExecAsmBelow
	ld   a, $ff                                                     ; $4892
	ld   [wBitsSetPerBGPaletteFade], a                              ; $4894
	ld   a, $ff                                                     ; $4897
	ld   [wBitsSetPerOBJPaletteFade], a                             ; $4899

; Load palettes for the 'Train' selection
	call UpdateBGPalettesForPictureBookMenuSelection                ; $489c

; Load vram bank 1 tile data after bank 0
	ld   a, $01                                                     ; $489f
	ldh  [rVBK], a                                                  ; $48a1
	ld   b, BANK(Gfx_PictureBookBank1)                              ; $48a3
	ld   hl, Gfx_PictureBookBank1                                   ; $48a5
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $48a8

; Load vram bank 0 tile data to $8800-$8fff
	ld   a, $00                                                     ; $48ab
	ldh  [rVBK], a                                                  ; $48ad
	ld   b, BANK(Gfx_PictureBookBank0)                              ; $48af
	ld   hl, Gfx_PictureBookBank0-$800                              ; $48b1
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $48b4

; Load the tiles needed to display the camera image for 'Train' selection
	call LoadSpriteTilesForPictureBookMainSelection                 ; $48b7
	call ProcessScriptsFromCurrLoc                                  ; $48ba
	SCR_Delay $02
	
; Load tile map for top half
	SCR_ExecAsmBelow
	ld   a, BANK(TileMap_PictureBookTopHalf)                        ; $48c0
	ldbc $07, SCREEN_TILE_WIDTH                                     ; $48c2
	ld   de, _SCRN0                                                 ; $48c5
	ld   hl, TileMap_PictureBookTopHalf                             ; $48c8
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $48cb
	xor  a                                                          ; $48ce
	call VBlankEnqueue_SetVramBank                                  ; $48cf

; Load tile attrs for top half
	ld   a, BANK(TileAttr_PictureBookTopHalf)                       ; $48d2
	ldbc $07, SCREEN_TILE_WIDTH                                     ; $48d4
	ld   de, _SCRN0                                                 ; $48d7
	ld   hl, TileAttr_PictureBookTopHalf                            ; $48da
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $48dd
	ld   a, $01                                                     ; $48e0
	call VBlankEnqueue_SetVramBank                                  ; $48e2

; Display scrolling text bars
	call ProcessScriptsFromCurrLoc                                  ; $48e5
	SCR_ResumeNextFrame
	SCR_SetSpriteXY $38, $30
	SCR_FarSetSpriteSrc SpriteOam_PictureBookScrollingTextBars
	SCR_Ret


Script_PictureBookLoadJustLogoTileMapAndAttr:
	SCR_ExecAsmBelow

; Enqueue tile map
	ld   a, BANK(TileMap_PictureBookJustLeftLogo)                   ; $48f2
	ldbc $0b, $08                                                   ; $48f4
	ld   de, _SCRN0+$e0                                             ; $48f7
	ld   hl, TileMap_PictureBookJustLeftLogo                        ; $48fa
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $48fd
	xor  a                                                          ; $4900
	call VBlankEnqueue_SetVramBank                                  ; $4901

; Enqueue tile attr
	ld   a, BANK(TileAttr_PictureBookJustLeftLogo)                  ; $4904
	ldbc $0b, $08                                                   ; $4906
	ld   de, _SCRN0+$e0                                             ; $4909
	ld   hl, TileAttr_PictureBookJustLeftLogo                       ; $490c
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $490f
	ld   a, $01                                                     ; $4912
	call VBlankEnqueue_SetVramBank                                  ; $4914

	call ProcessScriptsFromCurrLoc                                  ; $4917
	SCR_ResumeNextFrame
	SCR_Ret
	
	
PictureBookScript_FromTitleScreenOpts::
; Clear relevant vars, set main state, and call init script
	SCR_StoreByteInAddr wPictureBookPrevScreen, $00
	SCR_StoreByteInAddr wScrollingText_DoubleSCX, $00
	SCR_StoreByteInAddr wScrollingText_DoubleSCX+1, $00
	SCR_StoreByteInAddr wPictureBookNextSCXForRightTable, $00
	SCR_StoreByteInStruct PIC_BOOK_MAIN_SELECTION, $00
	SCR_StoreByteInAddr wPictureBookMenuIsMoving, $00
	SCR_StoreByteInAddr wGameState, GS_PICTURE_BOOK_MAIN
	SCR_Call Script_PictureBookStateInit

; Load tile map for bottom half of the screen (shares scroll bottom border)
	SCR_ExecAsmBelow
	ld   a, BANK(TileMap_PictureBookBottomHalf)                     ; $493b
	ldbc $0c, SCREEN_TILE_WIDTH                                     ; $493d
	ld   de, _SCRN0+$c0                                             ; $4940
	ld   hl, TileMap_PictureBookBottomHalf-SCREEN_TILE_WIDTH        ; $4943
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $4946
	xor  a                                                          ; $4949
	call VBlankEnqueue_SetVramBank                                  ; $494a
	call ProcessScriptsFromCurrLoc                                  ; $494d
	SCR_ResumeNextFrame
	
; Load tile attrs for bottom half of the screen (shares scroll bottom border)
	SCR_ExecAsmBelow
	ld   a, BANK(TileAttr_PictureBookBottomHalf)                    ; $4952
	ldbc $0c, SCREEN_TILE_WIDTH                                     ; $4954
	ld   de, _SCRN0+$c0                                             ; $4957
	ld   hl, TileAttr_PictureBookBottomHalf-SCREEN_TILE_WIDTH       ; $495a
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $495d
	ld   a, $01                                                     ; $4960
	call VBlankEnqueue_SetVramBank                                  ; $4962

; Create other scripts, then fade in
	call ProcessScriptsFromCurrLoc                                  ; $4965
	SCR_ResumeNextFrame
	SCR_CreateOtherScript 1, OtherScript1_PictureBookLogo
	SCR_CreateOtherScript 3, OtherScript3_PictureBookMenuSelection
	SCR_CreateOtherScript 2, OtherScript2_PictureBookHandleScrollingText
	SCR_Call RapidlyFadeIn
	
; --
; -- Main loop
; --
Script_PictureBookMainLoop:
; HL is main selection
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $497c
	ld   h, a                                                       ; $497e
	ld   l, PIC_BOOK_MAIN_SELECTION                                 ; $497f

; Don't process menu selection if moving
	ld   a, [wPictureBookMenuIsMoving]                              ; $4981
	or   a                                                          ; $4984
	jp   nz, .afterMenuSelectCode                                   ; $4985

; Don't move menu if logo is still changing
	ld   a, [wPictureBookLogoPaletteIsChanging]                     ; $4988
	or   a                                                          ; $498b
	ld   a, [wButtonsPressed]                                       ; $498c
	jp   nz, .afterMenuSelectCode                                   ; $498f

	bit  PADB_A, a                                                  ; $4992
	jp   z, .afterMenuSelectCode                                    ; $4994

; A pressed
	call ProcessScriptsFromCurrLoc                                  ; $4997
	SCR_PlaySound SND_01|MAKE_SOUND_EFFECT

; Scroll text handler is replaced by a script that clears it
	SCR_ResumeNextFrame
	SCR_CreateOtherScript 2, OtherScript_ClearScrollText

; Picture book menu selection is cleared
	SCR_UnsetOtherSpriteSpec 3
	SCR_StopOtherScript 3

; --
; -- Menu moving right
; --
; 10 times, move menu rightwards
	SCR_ResumeNextFrame
	SCR_SetCounter1 $0a
	SCR_StoreByteInStruct PIC_BOOK_MENU_MOVEMENT_COUNTER, $00

; Inc counter every loop
:	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $49ad
	ld   h, a                                                       ; $49af
	ld   l, PIC_BOOK_MENU_MOVEMENT_COUNTER                          ; $49b0
	inc  [hl]                                                       ; $49b2

; Offset screen using counter
	ld   d, HIGH(_SCRN0+$e8)                                        ; $49b3
	ld   a, LOW(_SCRN0+$e8)                                         ; $49b5
	add  [hl]                                                       ; $49b7
	ld   e, a                                                       ; $49b8

; A to highlight selected option
	ld   l, PIC_BOOK_MAIN_SELECTION                                 ; $49b9
	ld   a, [hl]                                                    ; $49bb
	inc  a                                                          ; $49bc
	call VBlankEnqueue_DisplaySelectedPictureBookMenuOptAtSpecifiedDest ; $49bd
	call ProcessScriptsFromCurrLoc                                  ; $49c0
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-
	
; If selected train, load its tiles
	SCR_ExecAsmBelow
	ld   a, [PAGE_0+PIC_BOOK_MAIN_SELECTION]                        ; $49c8
	or   a                                                          ; $49cb
	call z, VBlankEnqueue_GetPictureBookTrainMenuTiles              ; $49cc
	call ProcessScriptsFromCurrLoc                                  ; $49cf
	SCR_ResumeNextFrame

; --
; -- Menu moving left
; --
; 12 times, move menu left
	SCR_SetCounter1 $0c
	SCR_StoreByteInStruct PIC_BOOK_MENU_MOVEMENT_COUNTER, $0c
	
; Dec counter every loop
:	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $49d9
	ld   h, a                                                       ; $49db
	ld   l, PIC_BOOK_MENU_MOVEMENT_COUNTER                          ; $49dc
	dec  [hl]                                                       ; $49de

; Offset screen using counter
	ld   d, HIGH(_SCRN0+$e8)                                        ; $49df
	ld   a, LOW(_SCRN0+$e8)                                         ; $49e1
	add  [hl]                                                       ; $49e3
	ld   e, a                                                       ; $49e4

; Shift in relevant submenu
	ld   l, PIC_BOOK_MAIN_SELECTION                                 ; $49e5
	ld   a, [hl]                                                    ; $49e7
	call VBlankEnqueue_DisplaySelectedPictureBookSubMenuAtSpecifiedDest ; $49e8
	call ProcessScriptsFromCurrLoc                                  ; $49eb
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-

; --
; -- Menu movement finished
; --
; Clear idxes
	SCR_StoreByteInAddr wPictureBookSubMenuOptionIdx, $00
	SCR_StoreByteInStruct PIC_BOOK_MUSIC_IDX, $00
	SCR_StoreByteInStruct PIC_BOOK_SOUND_EFFECT_IDX, $00
	SCR_StoreByteInAddr wPictureBookTrainTopItemIdxMinus1, $00
	SCR_StoreByteInAddr wPictureBookTrainIdxWithinScreen, $00
	
; HL = double menu idx into table
	SCR_ExecAsmBelow
	ld   a, [PAGE_0+PIC_BOOK_MAIN_SELECTION]                        ; $4a05
	add  a                                                          ; $4a08
	ld   c, a                                                       ; $4a09
	ld   b, $00                                                     ; $4a0a
	ld   hl, .subMenuHandlers                                       ; $4a0c
	add  hl, bc                                                     ; $4a0f

; Jump to its handler
	ld   a, [hl+]                                                   ; $4a10
	ld   h, [hl]                                                    ; $4a11
	ld   l, a                                                       ; $4a12
	jp   hl                                                         ; $4a13

.subMenuHandlers:
	dw PictureBook_TrainSubMenuHandler
	dw PictureBook_MovieSubMenuHandler
	dw PictureBook_MusicSubMenuHandler
	
; --
; -- Non-sub-menu-related
; --
.afterMenuSelectCode:
	bit  PADB_B, a                                                  ; $4a1a
	jr   z, .aAndBNotPressed                                        ; $4a1c

; Pressed B - stop all scripts
	call ProcessScriptsFromCurrLoc                                  ; $4a1e
	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT
	SCR_StopOtherScript 1
	SCR_StopOtherScript 2
	SCR_StopOtherScript 3

; Fade out all palettes. amd set state
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $ff
	SCR_StoreByteInAddr wBitsSetPerOBJPaletteFade, $ff
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wGameState, GS_TITLE_SCREEN_OPTS_INIT
	SCR_StopCurrScript
	SCR_ResumeNextFrame

.aAndBNotPressed:
	bit  PADB_UP, a                                                 ; $4a3a
	jr   z, .aBAndUpNotPressed                                      ; $4a3c

; Up pressed - sub 1 and continue if no carry
	ld   a, [hl]                                                    ; $4a3e
	sub  $01                                                        ; $4a3f
	jr   nc, .finishUpDownProcessing                                ; $4a41

	jr   .toMainLoop                                                ; $4a43

.aBAndUpNotPressed:
	bit  PADB_DOWN, a                                               ; $4a45
	jr   z, .toMainLoop                                             ; $4a47

; Down pressed - inc and continue if not 3+
	ld   a, [hl]                                                    ; $4a49
	inc  a                                                          ; $4a4a
	cp   $03                                                        ; $4a4b
	jr   nc, .toMainLoop                                            ; $4a4d

.finishUpDownProcessing:
; Set option
	ld   [hl], a                                                    ; $4a4f
	call ProcessScriptsFromCurrLoc                                  ; $4a50

; Set that menu is moving
	SCR_StoreByteInAddr wPictureBookMenuIsMoving, $01
	SCR_PlaySound SND_06|MAKE_SOUND_EFFECT
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow

.toMainLoop:
	call ProcessScriptsFromCurrLoc                                  ; $4a5b
	SCR_ResumeNextFrame
	SCR_Jump Script_PictureBookMainLoop


PictureBookScript_FromTrainSubMenu::
; Reset prev screen, clear some vars, menu set to trains
	SCR_StoreByteInAddr wPictureBookPrevScreen, $00
	SCR_StoreByteInAddr wScrollingText_DoubleSCX, $00
	SCR_StoreByteInAddr wScrollingText_DoubleSCX+1, $00
	SCR_StoreByteInStruct PIC_BOOK_MAIN_SELECTION, $00
	SCR_StoreByteInAddr wPictureBookMenuIsMoving, $00
	SCR_StoreByteInAddr wPictureBookLogoPaletteIsChanging, $00

; Set main game state, call init func, load the logo currently out of screen
	SCR_StoreByteInAddr wGameState, GS_PICTURE_BOOK_MAIN
	SCR_ResumeNextFrame
	SCR_Call Script_PictureBookStateInit
	SCR_Call Script_PictureBookLoadJustLogoTileMapAndAttr
	
; Load train menu-specific tile data
	SCR_ExecAsmBelow
	call VBlankEnqueue_GetPictureBookTrainMenuTiles                 ; $4a85
	call ProcessScriptsFromCurrLoc                                  ; $4a88
	SCR_ResumeNextFrame
	
; Display left part of train list
	SCR_ExecAsmBelow
	ld   de, _SCRN0+$e8                                             ; $4a8d
	xor  a                                                          ; $4a90
	call VBlankEnqueue_DisplaySelectedPictureBookSubMenuAtSpecifiedDest ; $4a91
	call ProcessScriptsFromCurrLoc                                  ; $4a94
	SCR_ResumeNextFrame
	
; Display right part of train list, and train count stats
	SCR_ExecAsmBelow
	ld   de, $98f1                                                  ; $4a99
	ld   a, $03                                                     ; $4a9c
	call VBlankEnqueue_DisplaySelectedPictureBookSubMenuAtSpecifiedDest ; $4a9e
	call VBlankEnqueue_DisplayTrainCountStats                       ; $4aa1

; Update tile map and attrs of entries in table
	call ProcessScriptsFromCurrLoc                                  ; $4aa4
	SCR_ResumeNextFrame
	SCR_Call VBlankEnqueue_UpdateTrainListNamesTileMap
	SCR_Call VBlankEnqueue_UpdateTrainListSelectedOptAttrs

; Create script to handle logo, then rapidly fade in
	SCR_CreateOtherScript 1, OtherScript1_PictureBookLogo
	SCR_Call RapidlyFadeIn

; Create script to handle relevant scrolling text
	SCR_StoreByteInStruct PIC_BOOK_SUB_MENU_SCROLL_TEXT_IDX, $03
	SCR_CreateOtherScript 2, OtherScript2_PictureBookSubMenuHandleScrollingText

; Finally display the option selected orbs
	SCR_CreateOtherScript 4, OtherScript4_ShowSelectedOrbs
	SCR_Jump PictureBook_TrainSubMenuHandler.mainLoop


VBlankEnqueue_GetPictureBookTrainMenuTiles:
	ld   b, (VBlankQueueFuncs_HDMATransferTrainMenuTiles.end-\
		VBlankQueueFuncs_HDMATransferTrainMenuTiles)/2
	ld   hl, VBlankQueueFuncs_HDMATransferTrainMenuTiles            ; $4ac8
	jp   PushStackParamsIntoVBlankQueue                             ; $4acb


VBlankEnqueue_GetBackNonTrainTiles:
	ld   b, (VBlankQueueFuncs_HDMATransferNonTrainTiles.end-\
		VBlankQueueFuncs_HDMATransferNonTrainTiles)/2
	ld   hl, VBlankQueueFuncs_HDMATransferNonTrainTiles             ; $4ad0
	jp   PushStackParamsIntoVBlankQueue                             ; $4ad3


VBlankQueueFuncs_HDMATransferTrainMenuTiles:
	dw $0000 ; Vram bank
	db (Gfx_PictureBookTrainMenuTiles.end-Gfx_PictureBookTrainMenuTiles)/$10-1, \
		BANK(Gfx_PictureBookTrainMenuTiles)
	dw _VRAM+$800
	dw Gfx_PictureBookTrainMenuTiles
	dw VBlankQueueFunc_HDMATransferUsing4Addresses
	db $00, BANK(VBlankQueueFunc_HDMATransferUsing4Addresses)
	dw VBlankQueueFunc_SetRomBank
.end:


VBlankQueueFuncs_HDMATransferNonTrainTiles:
	dw $0000 ; Vram bank
	db (Gfx_PictureBookTrainMenuTiles.end-Gfx_PictureBookTrainMenuTiles)/$10-1, \
		BANK(Gfx_PictureBookBank0)
	dw _VRAM+$800
	dw Gfx_PictureBookBank0
	dw VBlankQueueFunc_HDMATransferUsing4Addresses
	db $00, BANK(VBlankQueueFunc_HDMATransferUsing4Addresses)
	dw VBlankQueueFunc_SetRomBank
.end:

	
; A - train idx
CheckIfTrainUnlocked:
; Get address offset into trains unlocked flags
	push hl                                                         ; $4af2
	ld   hl, wTrainsUnlocked                                        ; $4af3
	add  l                                                          ; $4af6
	ld   l, a                                                       ; $4af7
	ld   a, h                                                       ; $4af8
	adc  $00                                                        ; $4af9
	ld   h, a                                                       ; $4afb

; Get value and check if non-0
	ld   a, [hl]                                                    ; $4afc
	pop  hl                                                         ; $4afd
	or   a                                                          ; $4afe
	ret                                                             ; $4aff


VBlankEnqueue_DisplayTrainCountStats:
; Copy default stats into wram
	ld   b, wPictureBookTrainImageCountAreaTileAttr.end-wPictureBookTrainImageCountAreaTileMap ; $4b00
	ld   hl, TileMapAndAttr_DefaultTrainCountStats                  ; $4b02
	ld   de, wPictureBookTrainImageCountAreaTileMap                 ; $4b05
:	ld   a, [hl+]                                                   ; $4b08
	ld   [de], a                                                    ; $4b09
	inc  de                                                         ; $4b0a
	dec  b                                                          ; $4b0b
	jr   nz, :-                                                     ; $4b0c

; Counter in C, curr train in A
	xor  a                                                          ; $4b0e
	ld   c, a                                                       ; $4b0f

; Loop B trains
	ld   b, NUM_TRAINS                                              ; $4b10

.nextTrain:
	push af                                                         ; $4b12

	push bc                                                         ; $4b13
	call CheckIfTrainUnlocked                                       ; $4b14
	pop  bc                                                         ; $4b17

; Inc counter for every train unlocked
	jr   z, :+                                                      ; $4b18
	inc  c                                                          ; $4b1a

; To next train
:	pop  af                                                         ; $4b1b
	inc  a                                                          ; $4b1c
	dec  b                                                          ; $4b1d
	jr   nz, .nextTrain                                             ; $4b1e

; Get count in BC as BCD
	ld   a, c                                                       ; $4b20
	call BCequAinBCDform                                            ; $4b21

; Starting tile idx is $81, display 3 digits
	ld   a, c                                                       ; $4b24
	and  $0f                                                        ; $4b25
	add  $81                                                        ; $4b27
	ld   [wPictureBookTrainImageCountAreaTileMap+2], a              ; $4b29
	swap c                                                          ; $4b2c
	ld   a, c                                                       ; $4b2e
	and  $0f                                                        ; $4b2f
	add  $81                                                        ; $4b31
	ld   [wPictureBookTrainImageCountAreaTileMap+1], a              ; $4b33
	ld   a, b                                                       ; $4b36
	add  $81                                                        ; $4b37
	ld   [wPictureBookTrainImageCountAreaTileMap], a                ; $4b39

; Push set rom bank, and update func from ram
:	ld   b, $03                                                     ; $4b3c
	ld   hl, VBlankQueueFuncs_UpdateTrainImageCountAreaMapAndAttr   ; $4b3e
	jp   PushStackParamsIntoVBlankQueue                             ; $4b41


VBlankEnqueue_ClearTrainCountStats:
	ld   b, wPictureBookTrainImageCountAreaTileAttr.end-wPictureBookTrainImageCountAreaTileMap ; $4b44
	ld   hl, TileMapAndAttr_ClearedTrainCountStats                  ; $4b46
	ld   de, wPictureBookTrainImageCountAreaTileMap                 ; $4b49
; Copy cleared vram tile map and attr to ram
:	ld   a, [hl+]                                                   ; $4b4c
	ld   [de], a                                                    ; $4b4d
	inc  de                                                         ; $4b4e
	dec  b                                                          ; $4b4f
	jr   nz, :-                                                     ; $4b50

	jr   :--                                                        ; $4b52


VBlankQueueFuncs_UpdateTrainImageCountAreaMapAndAttr:
	dw UpdateTrainImageCountAreaMapAndAttr
	db $00, BANK(UpdateTrainImageCountAreaMapAndAttr)
	dw VBlankQueueFunc_SetRomBank


UpdateTrainImageCountAreaMapAndAttr:
; Copy into tile map
	xor  a                                                          ; $4b5a
	ldh  [rVBK], a                                                  ; $4b5b
	ld   de, _SCRN0+$0d                                             ; $4b5d
	ld   hl, wPictureBookTrainImageCountAreaTileMap                 ; $4b60
rept 7
	ld   a, [hl+]                                                   ; $4b63
	ld   [de], a                                                    ; $4b64
	inc  e                                                          ; $4b65
endr

; Copy into tile attr
	ld   a, $01                                                     ; $4b78
	ldh  [rVBK], a                                                  ; $4b7a
	ld   de, _SCRN0+$0d                                             ; $4b7c
rept 6
	ld   a, [hl+]                                                   ; $4b7f
	ld   [de], a                                                    ; $4b80
	inc  e                                                          ; $4b81
endr
	ld   a, [hl+]                                                   ; $4b91
	ld   [de], a                                                    ; $4b92
	ret                                                             ; $4b93


TileMapAndAttr_DefaultTrainCountStats:
; Displays 001/100
	db $81, $81, $82, $91, $82, $81, $81
	db $00, $00, $00, $00, $00, $00, $00


TileMapAndAttr_ClearedTrainCountStats:
	db $00, $00, $00, $00, $00, $00, $00
	db $10, $10, $10, $10, $10, $10, $10


VBlankEnqueue_UpdateTrainListSelectedOptAttrs:
; Get idx in screen in B, and multiply it by 8 (pixel height)
	SCR_ExecAsmBelow
	ld   a, [wPictureBookTrainIdxWithinScreen]                      ; $4bb1
	ld   b, a                                                       ; $4bb4
	add  a                                                          ; $4bb5
	add  a                                                          ; $4bb6
	add  a                                                          ; $4bb7

; Use it to set Y, X remains constant
	add  $40                                                        ; $4bb8
	ld   [PAGE_4+SCRIPT_SPRITE_Y], a                                ; $4bba
	ld   a, $88                                                     ; $4bbd
	ld   [PAGE_4+SCRIPT_SPRITE_X], a                                ; $4bbf

; HL = idx of item in screen going up
	ld   a, $08                                                     ; $4bc2
	sub  b                                                          ; $4bc4
	ld   l, a                                                       ; $4bc5
	ld   h, $00                                                     ; $4bc6

; HL = idx going up * $10, offset into $7780 (which has highlighted attr at the bottom)
	add  hl, hl                                                     ; $4bc8
	add  hl, hl                                                     ; $4bc9
	add  hl, hl                                                     ; $4bca
	add  hl, hl                                                     ; $4bcb
	ld   bc, TileAttr_TrainListHighlightedOption                    ; $4bcc
	add  hl, bc                                                     ; $4bcf

; Transfer to tile attributes
	ld   de, _SCRN0+$10b                                            ; $4bd0
	ldbc $09, $10                                                   ; $4bd3
	ld   a, BANK(TileAttr_TrainListHighlightedOption)               ; $4bd6
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $4bd8

; Enqueue set vram bank 1
	ld   a, $01                                                     ; $4bdb
	call VBlankEnqueue_SetVramBank                                  ; $4bdd
	call ProcessScriptsFromCurrLoc                                  ; $4be0
	SCR_ResumeNextFrame
	SCR_Ret
	
	
VBlankEnqueue_UpdateTrainListNamesTileMap:
; Enqueue set rom bank
	SCR_ExecAsmBelow
	ld   bc, VBlankQueueFunc_SetRomBank                             ; $4be6
	push bc                                                         ; $4be9
	ldbc BANK(VBlankQueueFunc_PictureBookUpdateTrainRow), $00       ; $4bea
	push bc                                                         ; $4bed

; Enqueue set vram bank to tile map
	ld   bc, VBlankQueueFunc_SetVramBank                            ; $4bee
	push bc                                                         ; $4bf1
	ld   bc, $0000                                                  ; $4bf2
	push bc                                                         ; $4bf5

; Save curr train idx for later
	ld   a, [wPictureBookTrainTopItemIdxMinus1]                     ; $4bf6
	ldh  [hCurrTrainIdxToCheck], a                                  ; $4bf9

; HL = top idx * $20 offset into table
	ld   l, a                                                       ; $4bfb
	ld   h, $00                                                     ; $4bfc
	add  hl, hl                                                     ; $4bfe
	add  hl, hl                                                     ; $4bff
	add  hl, hl                                                     ; $4c00
	add  hl, hl                                                     ; $4c01
	add  hl, hl                                                     ; $4c02
	ld   de, TileMap_PictureBookTrainItemEntries_AlternatingFilledUnfilled ; $4c03
	add  hl, de                                                     ; $4c06

; Loop through 9 trains, dest points at top left of changing tiles
	ld   de, _SCRN0+$10b                                            ; $4c07
	ld   a, $09                                                     ; $4c0a
.nextTrain:
; Preserve counter to dec at end of loop
	ldh  [hSavedTrainCounter], a                                    ; $4c0c

; Push func to call and dest
	ld   bc, VBlankQueueFunc_PictureBookUpdateTrainRow              ; $4c0e
	push bc                                                         ; $4c11
	push de                                                         ; $4c12

; DE to point to next row
	ld   a, $20                                                     ; $4c13
	add  e                                                          ; $4c15
	ld   e, a                                                       ; $4c16
	ld   a, d                                                       ; $4c17
	adc  $00                                                        ; $4c18
	ld   d, a                                                       ; $4c1a

; If train unlocked, 1st $10 bytes has tiles containing name
	ldh  a, [hCurrTrainIdxToCheck]                                  ; $4c1b
	call CheckIfTrainUnlocked                                       ; $4c1d
	ld   bc, $0020                                                  ; $4c20
	jr   nz, :+                                                     ; $4c23

; Else 2nd $10 tiles contains unfilled entry
	ld   bc, $0010                                                  ; $4c25
	add  hl, bc                                                     ; $4c28

:	push hl                                                         ; $4c29
	add  hl, bc                                                     ; $4c2a

; Inc train idx to check
	ldh  a, [hCurrTrainIdxToCheck]                                  ; $4c2b
	inc  a                                                          ; $4c2d
	ldh  [hCurrTrainIdxToCheck], a                                  ; $4c2e

; To next train
	ldh  a, [hSavedTrainCounter]                                    ; $4c30
	dec  a                                                          ; $4c32
	jr   nz, .nextTrain                                             ; $4c33

; 31 address = 4 initial + 9 rows * 3 addresses for copying
	ld   hl, sp+$00                                                 ; $4c35
	ld   b, $1f                                                     ; $4c37
	call PushStackParamsIntoVBlankQueue                             ; $4c39

; Get SP past params, then return
	ld   hl, sp+$3e                                                 ; $4c3c
	ld   sp, hl                                                     ; $4c3e
	call ProcessScriptsFromCurrLoc                                  ; $4c3f
	SCR_ResumeNextFrame
	SCR_Ret
	

PictureBook_TrainSubMenuHandler:
; Start setting scx to move table 'all the way left'
	ld   a, $08                                                     ; $4c44
	ld   [wPictureBookNextSCXForRightTable], a                      ; $4c46
	ld   de, _SCRN0+$f1                                             ; $4c49

; Display item part of train table
	ld   a, $03                                                     ; $4c4c
	call VBlankEnqueue_DisplaySelectedPictureBookSubMenuAtSpecifiedDest ; $4c4e
	call ProcessScriptsFromCurrLoc                                  ; $4c51

; Move scroll X to move table in full view
	SCR_ResumeNextFrame
	SCR_SetCounter1 $08
:	SCR_ValInAddrPlusEquByte wPictureBookNextSCXForRightTable, $08
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-

; Display train count stats, update tile map and attrs of list
	SCR_ExecAsmBelow
	call VBlankEnqueue_DisplayTrainCountStats                       ; $4c60
	call ProcessScriptsFromCurrLoc                                  ; $4c63
	SCR_ResumeNextFrame
	SCR_Call VBlankEnqueue_UpdateTrainListNamesTileMap
	SCR_CreateOtherScript 4, OtherScript4_ShowSelectedOrbs
	SCR_Call VBlankEnqueue_UpdateTrainListSelectedOptAttrs

; Set scroll text idx, and create script to handle it
	SCR_StoreByteInStruct PIC_BOOK_SUB_MENU_SCROLL_TEXT_IDX, $03
	SCR_CreateOtherScript 2, OtherScript2_PictureBookSubMenuHandleScrollingText

.mainLoop:
	SCR_ResumeNextFrame

; Start checking buttons
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $4c7c
	bit  PADB_B, a                                                  ; $4c7f
	jp   nz, .bPressed                                              ; $4c81

	bit  PADB_A, a                                                  ; $4c84
	jr   z, .aOrBNotPressed                                         ; $4c86

; A - pressed - store train idx selected
	ld   a, [wPictureBookTrainTopItemIdxMinus1]                     ; $4c88
	ld   b, a                                                       ; $4c8b
	ld   a, [wPictureBookTrainIdxWithinScreen]                      ; $4c8c
	add  b                                                          ; $4c8f
	ld   [wTrainImage1stSelectedIdx], a                             ; $4c90

; Skip if train not available
	call CheckIfTrainUnlocked                                       ; $4c93
	jr   z, .trainOptNotAvailable                                   ; $4c96

; Play sound, have all palettes fade out
	call ProcessScriptsFromCurrLoc                                  ; $4c98
	SCR_PlaySound SND_01|MAKE_SOUND_EFFECT
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $ff
	SCR_StoreByteInAddr wBitsSetPerOBJPaletteFade, $ff
	SCR_Call Script_FadeOut

; Set prev screen to train sub menu, start hi-col on screen 0
	SCR_StoreByteInAddr wPictureBookPrevScreen, $01
	SCR_StoreByteInAddr wTrainImageUsesScreen1, $00
	SCR_StoreByteInAddr wGameState, GS_TRAIN_IMAGE_INIT
	SCR_StopCurrScript
	SCR_ResumeNextFrame

.trainOptNotAvailable:
; Play error sound
	call ProcessScriptsFromCurrLoc                                  ; $4cb6
	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT
	SCR_Jump .mainLoop

.aOrBNotPressed:
	bit  PADB_RIGHT, a                                              ; $4cbe
	jr   z, .aBOrRightNotPressed                                    ; $4cc0

; Right pressed - do nothing if top idx is at its max
	ld   a, [wPictureBookTrainTopItemIdxMinus1]                     ; $4cc2
	cp   TRAIN_OPT_HIGHEST_TOP_INDEX                                ; $4cc5
	jr   c, .processRight                                           ; $4cc7

	ld   de, .mainLoop                                              ; $4cc9
	jp   ProcessScriptsFromDE                                       ; $4ccc

.processRight:
; Add to get to next page, if its past top idx, set top idx appropriately
	add  NUM_TRAIN_OPTS_IN_1_PAGE                                   ; $4ccf
	cp   TRAIN_OPT_HIGHEST_TOP_INDEX                                ; $4cd1
	jr   c, .setTopItemIdx                                          ; $4cd3

	ld   a, TRAIN_OPT_HIGHEST_TOP_INDEX                             ; $4cd5
	jr   .setTopItemIdx                                             ; $4cd7

.aBOrRightNotPressed:
	bit  PADB_LEFT, a                                               ; $4cd9
	jr   z, .checkUpThenDown                                        ; $4cdb

; Left pressed - do nothing if top idx = 0
	ld   a, [wPictureBookTrainTopItemIdxMinus1]                     ; $4cdd
	or   a                                                          ; $4ce0
	jr   nz, .goLeftAPage                                           ; $4ce1

	ld   de, .mainLoop                                              ; $4ce3
	jp   ProcessScriptsFromDE                                       ; $4ce6

.goLeftAPage:
; Go exactly left a page, and if it ends up < 0, set to 0 instead
	sub  NUM_TRAIN_OPTS_IN_1_PAGE                                   ; $4ce9
	jr   nc, .setTopItemIdx                                         ; $4ceb

	xor  a                                                          ; $4ced
	jr   .setTopItemIdx                                             ; $4cee

.checkUpThenDown:
	ld   a, [wStickyButtonsHeld]                                    ; $4cf0
	bit  PADB_UP, a                                                 ; $4cf3
	jr   z, .checkDownPressed                                       ; $4cf5

; Up pressed - try to just move up within screen
	ld   a, [wPictureBookTrainIdxWithinScreen]                      ; $4cf7
	or   a                                                          ; $4cfa
	jr   nz, .decIdxWithinScreen                                    ; $4cfb

; If going up from top, dec top item, skipping processing if already at idx 0
	ld   a, [wPictureBookTrainTopItemIdxMinus1]                     ; $4cfd
	or   a                                                          ; $4d00
	jr   nz, .decTopItemIdx                                         ; $4d01

	ld   de, .mainLoop                                              ; $4d03
	jp   ProcessScriptsFromDE                                       ; $4d06

.decTopItemIdx:
	dec  a                                                          ; $4d09
	jr   .setTopItemIdx                                             ; $4d0a

.decIdxWithinScreen:
	dec  a                                                          ; $4d0c
	jr   .setIdxWithinScreen                                        ; $4d0d

.checkDownPressed:
	bit  PADB_DOWN, a                                               ; $4d0f
	jr   nz, .downPressed                                           ; $4d11

; No buttons processable, go back to main loop
	ld   de, .mainLoop                                              ; $4d13
	jp   ProcessScriptsFromDE                                       ; $4d16

.downPressed:
; Move down within screen if possible
	ld   a, [wPictureBookTrainIdxWithinScreen]                      ; $4d19
	cp   NUM_TRAIN_OPTS_IN_1_PAGE-1                                 ; $4d1c
	jr   c, .incIdxWithinScreen                                     ; $4d1e

; If moving down from bottom option, inc top idx if top idx isn't at max
	ld   a, [wPictureBookTrainTopItemIdxMinus1]                     ; $4d20
	cp   TRAIN_OPT_HIGHEST_TOP_INDEX                                ; $4d23
	jr   c, .incTopItemIdx                                          ; $4d25

	ld   de, .mainLoop                                              ; $4d27
	jp   ProcessScriptsFromDE                                       ; $4d2a

.incTopItemIdx:
	inc  a                                                          ; $4d2d

.setTopItemIdx:
; Set top item, play sound, update tile map
	ld   [wPictureBookTrainTopItemIdxMinus1], a                     ; $4d2e
	call ProcessScriptsFromCurrLoc                                  ; $4d31
	SCR_PlaySound SND_06|MAKE_SOUND_EFFECT
	SCR_Call VBlankEnqueue_UpdateTrainListNamesTileMap
	SCR_Jump .mainLoop

.incIdxWithinScreen:
	inc  a                                                          ; $4d3c

.setIdxWithinScreen:
; Set idx within screen, play sound, and update highlighted option attr
	ld   [wPictureBookTrainIdxWithinScreen], a                      ; $4d3d
	call ProcessScriptsFromCurrLoc                                  ; $4d40
	SCR_PlaySound SND_06|MAKE_SOUND_EFFECT
	SCR_Call VBlankEnqueue_UpdateTrainListSelectedOptAttrs
	SCR_Jump .mainLoop

.bPressed:
; Play sound, replace text scroll script with 1 that clears it
	call ProcessScriptsFromCurrLoc                                  ; $4d4b
	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT
	SCR_CreateOtherScript 2, OtherScript_ClearScrollText

; Hide selected orbs, and save train list graphic in ram to scroll later
	SCR_UnsetOtherSpriteSpec 4
	SCR_ResumeNextFrame
	SCR_Call Script_StoreSubMenuAreaInRamForScrollingLater

; Finally move scroll back and display main menu
	SCR_SetCounter1 $09
:	SCR_ValInAddrPlusEquByte wPictureBookNextSCXForRightTable, -8
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-
	SCR_Jump Script_PictureBookSwapSubMenuOutForMainMenu


OtherScript4_ShowSelectedOrbs:
	SCR_FarSetSpriteSrc SpriteOam_PictureBookTrainListSelectedOrbs
	SCR_StopCurrScript
	SCR_ResumeNextFrame


; A - animation idx of number box
; DE - vram dest
VBlankEnqueue_UpdateNumberBoxAnimation:
	push de                                                         ; $4d6e

; Get 32x idx into table (16 bytes for tile map and attr)
	add  a                                                          ; $4d6f
	add  a                                                          ; $4d70
	add  a                                                          ; $4d71
	add  a                                                          ; $4d72
	add  a                                                          ; $4d73
	add  LOW(TileMap_NumberBoxAnimation)                            ; $4d74
	ld   l, a                                                       ; $4d76
	ld   a, HIGH(TileMap_NumberBoxAnimation)                        ; $4d77
	adc  $00                                                        ; $4d79
	ld   h, a                                                       ; $4d7b

; Copy into ram
	ld   de, wPictureBookNumberBoxTileMap                           ; $4d7c
	ld   b, wPictureBookNumberBoxTileAttr.end-wPictureBookNumberBoxTileMap ; $4d7f
:	ld   a, [hl+]                                                   ; $4d81
	ld   [de], a                                                    ; $4d82
	inc  de                                                         ; $4d83
	dec  b                                                          ; $4d84
	jr   nz, :-                                                     ; $4d85

; Get vram dest for tile map
	pop  de                                                         ; $4d87
	push de                                                         ; $4d88
	ld   a, BANK(TileMap_NumberBoxAnimation)                        ; $4d89
	ldbc $02, $08                                                   ; $4d8b
	ld   hl, wPictureBookNumberBoxTileMap                           ; $4d8e
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $4d91
	xor  a                                                          ; $4d94
	call VBlankEnqueue_SetVramBank                                  ; $4d95

; Same vram dest for tile attr
	pop  de                                                         ; $4d98
	ld   a, BANK(TileMap_NumberBoxAnimation)                        ; $4d99
	ldbc $02, $08                                                   ; $4d9b
	ld   hl, wPictureBookNumberBoxTileAttr                          ; $4d9e
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $4da1
	ld   a, $01                                                     ; $4da4
	jp   VBlankEnqueue_SetVramBank                                  ; $4da6


TileMap_NumberBoxAnimation:
	db $40, $fd, $a0, $a2, $a0, $a2, $fd, $40, $40, $fd, $a1, $a3, $a1, $a3, $fd, $40
	db $29, $08, $08, $08, $08, $08, $28, $09, $69, $08, $08, $08, $08, $08, $28, $49

	db $41, $fd, $a0, $a2, $a0, $a2, $fd, $41, $41, $fd, $a1, $a3, $a1, $a3, $fd, $41
	db $29, $08, $08, $08, $08, $08, $28, $09, $69, $08, $08, $08, $08, $08, $28, $49

	db $42, $fd, $a0, $a2, $a0, $a2, $fd, $42, $42, $fd, $a1, $a3, $a1, $a3, $fd, $42
	db $29, $08, $08, $08, $08, $08, $28, $09, $69, $08, $08, $08, $08, $08, $28, $49


; A - digit
UpdateNumberBoxRamTileMapAttrForDigit:
; Digit has 4 tiles starting with $a0
	and  $0f                                                        ; $4e09
	add  a                                                          ; $4e0b
	add  a                                                          ; $4e0c
	add  $a0                                                        ; $4e0d
	ld   [hl+], a                                                   ; $4e0f

; Tile across is tile 3 of 4
	add  $02                                                        ; $4e10
	ld   [hl+], a                                                   ; $4e12

; Bottom left tile is tile 2 of 4 (+6 to loop through 8 rows of number box)
	dec  a                                                          ; $4e13
	inc  hl                                                         ; $4e14
	inc  hl                                                         ; $4e15
	inc  hl                                                         ; $4e16
	inc  hl                                                         ; $4e17
	inc  hl                                                         ; $4e18
	inc  hl                                                         ; $4e19
	ld   [hl+], a                                                   ; $4e1a

; Bottom right tile is tile 4 of 4
	add  $02                                                        ; $4e1b
	ld   [hl], a                                                    ; $4e1d
	ret                                                             ; $4e1e


; A - number to update number box
UpdateNumberBoxRamTileMapAttrWithNumbers:
	call BCequAinBCDform                                            ; $4e1f

; Low nybble of C is unit digit to display
	ld   a, c                                                       ; $4e22
	ld   hl, wPictureBookNumberBoxTileMap+4                         ; $4e23
	call UpdateNumberBoxRamTileMapAttrForDigit                      ; $4e26

; Upper nybble is tens digit to display
	ld   a, c                                                       ; $4e29
	swap a                                                          ; $4e2a
	ld   hl, wPictureBookNumberBoxTileMap+2                         ; $4e2c
	jp   UpdateNumberBoxRamTileMapAttrForDigit                      ; $4e2f


PictureBookScript_FromMovieSubMenu::
; No music, reset vars, main menu on movie, set main state
	SCR_PlaySound MUS_NULL
	SCR_StoreByteInAddr wPictureBookPrevScreen, $00
	SCR_StoreByteInAddr wScrollingText_DoubleSCX, $00
	SCR_StoreByteInAddr wScrollingText_DoubleSCX+1, $00
	SCR_StoreByteInAddr wPictureBookNextSCXForRightTable, $00
	SCR_StoreByteInStruct PIC_BOOK_MAIN_SELECTION, $01
	SCR_StoreByteInAddr wPictureBookMenuIsMoving, $00
	SCR_StoreByteInAddr wPictureBookLogoPaletteIsChanging, $00
	SCR_StoreByteInAddr wGameState, GS_PICTURE_BOOK_MAIN

; Init state and load left logo BG details
	SCR_ResumeNextFrame
	SCR_Call Script_PictureBookStateInit
	SCR_Call Script_PictureBookLoadJustLogoTileMapAndAttr
	
; Load tile map for top half except bottom border of scrolling text
	SCR_ExecAsmBelow
	ld   a, BANK(TileMap_PictureBookTopHalf)                        ; $4e5b
	ldbc $06, SCREEN_TILE_WIDTH                                     ; $4e5d
	ld   de, _SCRN0                                                 ; $4e60
	ld   hl, TileMap_PictureBookTopHalf                             ; $4e63
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $4e66
	xor  a                                                          ; $4e69
	call VBlankEnqueue_SetVramBank                                  ; $4e6a

; Load tile attr for top half
	ld   a, BANK(TileAttr_PictureBookTopHalf)                       ; $4e6d
	ldbc $06, SCREEN_TILE_WIDTH                                     ; $4e6f
	ld   de, _SCRN0                                                 ; $4e72
	ld   hl, TileAttr_PictureBookTopHalf                            ; $4e75
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $4e78
	ld   a, $01                                                     ; $4e7b
	call VBlankEnqueue_SetVramBank                                  ; $4e7d

	call ProcessScriptsFromCurrLoc                                  ; $4e80
	SCR_ResumeNextFrame

; Last thing to display is the submenu
	SCR_ExecAsmBelow
	ld   de, _SCRN0+$e8                                             ; $4e85
	ld   a, $01                                                     ; $4e88
	call VBlankEnqueue_DisplaySelectedPictureBookSubMenuAtSpecifiedDest ; $4e8a

; Create a script to handle the logo, other main menu scripts load when pressing B
	call ProcessScriptsFromCurrLoc                                  ; $4e8d
	SCR_ResumeNextFrame
	SCR_CreateOtherScript 1, OtherScript1_PictureBookLogo

; Create subscript to display number box, then remove (it's re-created after jump)
	SCR_StartSubScript2 PictureBookSubScript2_HandleNumberBoxTileMapAttr
	SCR_ResumeNextFrame
	SCR_StopSubScript2

; Fade in, then continue from main movie submenu handler
	SCR_Call RapidlyFadeIn
	SCR_Jump PictureBookScript_MovieSubMenuHandler


CheckIfMovieUnlocked:
; Preserve opt in B
	ld   b, a                                                       ; $4ea2
	or   a                                                          ; $4ea3
	jr   z, .movie0alwaysAvailable                                  ; $4ea4

; Get offset into movie unlocked set of bytes
	ld   hl, wMoviesUnlocked                                        ; $4ea6
	dec  a                                                          ; $4ea9
	add  l                                                          ; $4eaa
	ld   l, a                                                       ; $4eab
	ld   a, h                                                       ; $4eac
	adc  $00                                                        ; $4ead
	ld   h, a                                                       ; $4eaf

; Z flag based on if movie unlocked, return option
	ld   a, [hl]                                                    ; $4eb0
	or   a                                                          ; $4eb1
	ld   a, b                                                       ; $4eb2
	ret                                                             ; $4eb3

.movie0alwaysAvailable:
; Unset Z flag, and return option
	ld   a, $01                                                     ; $4eb4
	or   a                                                          ; $4eb6
	ld   a, b                                                       ; $4eb7
	ret                                                             ; $4eb8


PictureBook_MovieSubMenuHandler:
	call ProcessScriptsFromCurrLoc                                  ; $4eb9

PictureBookScript_MovieSubMenuHandler:
; Configure scrolling text
	SCR_StoreByteInStruct PIC_BOOK_SUB_MENU_SCROLL_TEXT_IDX, $04
	SCR_CreateOtherScript 2, OtherScript2_PictureBookSubMenuHandleScrollingText

; Configure number box animation
	SCR_StartSubScript1 PictureBookSubScript1_UpdateNumberBoxAnimIdx
	SCR_StartSubScript2 PictureBookSubScript2_HandleNumberBoxTileMapAttr

.mainLoop:
	SCR_ResumeNextFrame
	
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $4ece
	bit  PADB_A, a                                                  ; $4ed1
	jr   z, .aNotPressed                                            ; $4ed3

; A pressed
	ld   a, [wPictureBookSubMenuOptionIdx]                          ; $4ed5
	or   a                                                          ; $4ed8
	jr   z, .option0                                                ; $4ed9

; For either of these options, set that we came from this movie sub menu
; So that we can return here on it ending
; Also play sound effect, fade out all palettes and set relevant game state

	dec  a                                                          ; $4edb
	jr   z, .option1                                                ; $4edc

	dec  a                                                          ; $4ede
	cp   $09                                                        ; $4edf
	jr   nc, .optionBorC                                            ; $4ee1

; Option 2-A - Stage complete cutscenes
	ld   a, $02                                                     ; $4ee3
	ld   [wPictureBookPrevScreen], a                                ; $4ee5
	
	call ProcessScriptsFromCurrLoc                                  ; $4ee8
	SCR_PlaySound SND_01|MAKE_SOUND_EFFECT
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $ff
	SCR_StoreByteInAddr wBitsSetPerOBJPaletteFade, $ff
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wGameState, GS_STAGE_COMPLETE_INIT
	SCR_ResumeNextFrame

.option1:
; Option 1 - intro cutscene
	ld   a, $02                                                     ; $4efd
	ld   [wPictureBookPrevScreen], a                                ; $4eff
	
	call ProcessScriptsFromCurrLoc                                  ; $4f02
	SCR_PlaySound SND_01|MAKE_SOUND_EFFECT
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $ff
	SCR_StoreByteInAddr wBitsSetPerOBJPaletteFade, $ff
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wGameState, GS_INTRO_CUTSCENE_INIT
	SCR_ResumeNextFrame

.optionBorC:
; Credits cutscenes

; A = 9 or A, set selected train line to 0 (standard credits) or 4 (E3 - 5stars)
	sub  $09                                                        ; $4f17
	jr   z, :+                                                      ; $4f19
	ld   a, $04                                                     ; $4f1b
:	ld   [wSelectedTrainLine], a                                    ; $4f1d

; Set that we came from picture book
	ld   a, $02                                                     ; $4f20
	ld   [wPictureBookPrevScreen], a                                ; $4f22
	
; Set state, play sound, fade all palettes out
	call ProcessScriptsFromCurrLoc                                  ; $4f25
	SCR_StoreByteInAddr wGameState, GS_CREDITS_INIT
	SCR_PlaySound SND_01|MAKE_SOUND_EFFECT
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $ff
	SCR_StoreByteInAddr wBitsSetPerOBJPaletteFade, $ff
	SCR_Call Script_FadeOut
	SCR_ResumeNextFrame

.option0:
; Do nothing
	call ProcessScriptsFromCurrLoc                                  ; $4f3a
	SCR_ResumeNextFrame
	SCR_Jump .mainLoop

; --
; -- A not pressed
; --
.aNotPressed:
	bit  PADB_B, a                                                  ; $4f41
	jr   z, .aAndBNotPressed                                        ; $4f43

; B pressed
	ld   de, Script_HandlePressedBInMovieSubMenu                    ; $4f45
	jp   ProcessScriptsFromDE                                       ; $4f48

.aAndBNotPressed:
; Sticky buttons in B, curr option in A
	ld   a, [wStickyButtonsHeld]                                    ; $4f4b
	ld   b, a                                                       ; $4f4e
	ld   a, [wPictureBookSubMenuOptionIdx]                          ; $4f4f

	bit  PADB_UP, b                                                 ; $4f52
	jr   nz, .upOrLeftSelected                                      ; $4f54

	bit  PADB_LEFT, b                                               ; $4f56
	jr   z, .checkDownRight                                         ; $4f58

.upOrLeftSelected:
; Dec, looping 0 to last option
	or   a                                                          ; $4f5a
	jr   nz, :+                                                     ; $4f5b
	ld   a, NUM_MOVIES+1                                            ; $4f5d
:	dec  a                                                          ; $4f5f
; Keep looping until we get to an option we've unlocked
	call CheckIfMovieUnlocked                                       ; $4f60
	jr   z, .upOrLeftSelected                                       ; $4f63

	jr   .setOption                                                 ; $4f65

.checkDownRight:
	bit  PADB_DOWN, b                                               ; $4f67
	jr   nz, .downOrRightSelected                                   ; $4f69

	bit  PADB_RIGHT, b                                              ; $4f6b
	jr   z, .toMainLoop                                             ; $4f6d

.downOrRightSelected:
; Inc, looping back to 1st movie after the end
	inc  a                                                          ; $4f6f
	cp   NUM_MOVIES+1                                               ; $4f70
	jr   c, :+                                                      ; $4f72
	xor  a                                                          ; $4f74
; Keep looping until we get to an option we've unlocked
:	call CheckIfMovieUnlocked                                       ; $4f75
	jr   z, .downOrRightSelected                                    ; $4f78

.setOption:
; Finall set option and play sound
	ld   [wPictureBookSubMenuOptionIdx], a                          ; $4f7a
	call ProcessScriptsFromCurrLoc                                  ; $4f7d
	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT
	SCR_Jump .mainLoop

.toMainLoop:
	ld   de, .mainLoop                                              ; $4f85
	jp   ProcessScriptsFromDE                                       ; $4f88


Script_HandlePressedBInMovieSubMenu:
; Play sound and stop number box subscripts
	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT
	SCR_StopSubScript1
	SCR_StopSubScript2

; Replace scroll script with a clear scroll text script
	SCR_CreateOtherScript 2, OtherScript_ClearScrollText
	SCR_ResumeNextFrame

; Handle sub menu bit of the screen moving out, then main menu back in
	SCR_Call Script_StoreSubMenuAreaInRamForScrollingLater
	SCR_Jump Script_PictureBookSwapSubMenuOutForMainMenu


PictureBookSubScript1_UpdateNumberBoxAnimIdx:
:	SCR_StoreByteInStruct PIC_BOOK_NUMBER_BOX_ANIM_IDX, $00
	SCR_Delay $08
	SCR_StoreByteInStruct PIC_BOOK_NUMBER_BOX_ANIM_IDX, $01
	SCR_Delay $08
	SCR_StoreByteInStruct PIC_BOOK_NUMBER_BOX_ANIM_IDX, $02
	SCR_Delay $08
	SCR_StoreByteInStruct PIC_BOOK_NUMBER_BOX_ANIM_IDX, $01
	SCR_Delay $08
	SCR_Jump :-


PictureBookSubScript2_HandleNumberBoxTileMapAttr:
; Based on animation idx, display updated number box (arrows change)
:	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $4fb3
	ld   h, a                                                       ; $4fb5
	ld   l, PIC_BOOK_NUMBER_BOX_ANIM_IDX                            ; $4fb6
	ld   a, [hl]                                                    ; $4fb8
	ld   de, _SCRN0+$16a                                            ; $4fb9
	call VBlankEnqueue_UpdateNumberBoxAnimation                     ; $4fbc

; Based on option val, update the tile map and attrs in ram from func above
	ld   a, [wPictureBookSubMenuOptionIdx]                          ; $4fbf
	call UpdateNumberBoxRamTileMapAttrWithNumbers                   ; $4fc2
	call ProcessScriptsFromCurrLoc                                  ; $4fc5
	SCR_ResumeNextFrame
	SCR_Jump :-


PictureBook_MusicSubMenuHandler:
; Set scroll text idx, create script to display it
	call ProcessScriptsFromCurrLoc                                  ; $4fcc
	SCR_StoreByteInStruct PIC_BOOK_SUB_MENU_SCROLL_TEXT_IDX, $05
	SCR_CreateOtherScript 2, OtherScript2_PictureBookSubMenuHandleScrollingText

; By default, hover over music selection, create sub scripts to update number box
	SCR_StoreByteInStruct PIC_BOOK_MUSIC_SE_SELECTION, $00
	SCR_StartSubScript1 PictureBookSubScript1_UpdateNumberBoxAnimIdx
	SCR_StartSubScript2 Script_PictureBookUpdateMusicNumberBox

PictureBookScript_MusicSubMenuHandler:
.mainLoop:
	SCR_ResumeNextFrame
	
; B = num choices based on if selecting music or sound effect
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $4fe4
	ld   h, a                                                       ; $4fe6
	ld   l, PIC_BOOK_MUSIC_SE_SELECTION                             ; $4fe7
	ld   a, [hl]                                                    ; $4fe9

; Music has $16 choices
	ld   b, NUM_MUSIC                                               ; $4fea
	ld   l, PIC_BOOK_MUSIC_IDX                                      ; $4fec
	cp   $00                                                        ; $4fee
	jr   z, :+                                                      ; $4ff0

; Sound effect has $1f choices
	ld   b, NUM_SOUND_EFFECTS                                       ; $4ff2
	ld   l, PIC_BOOK_SOUND_EFFECT_IDX                               ; $4ff4

; Check buttons
:	ld   a, [wButtonsPressed]                                       ; $4ff6
	bit  PADB_A, a                                                  ; $4ff9
	jr   z, .aNotPressed                                            ; $4ffb

; A pressed - get mus or sound effect idx in B
	ld   b, [hl]                                                    ; $4ffd

; Get null idx for mus or SE
	ld   l, PIC_BOOK_MUSIC_SE_SELECTION                             ; $4ffe
	ld   a, [hl]                                                    ; $5000
	cp   $00                                                        ; $5001
	ld   a, MUS_NULL                                                ; $5003
	jr   z, :+                                                      ; $5005
	ld   a, SND_NULL                                                ; $5007

; Add idx in number box and play that sound
:	add  b                                                          ; $5009
	call PlaySound                                                  ; $500a
	ld   de, .mainLoop                                              ; $500d
	jp   ProcessScriptsFromDE                                       ; $5010

.aNotPressed:
	bit  PADB_B, a                                                  ; $5013
	jr   nz, .backToMainMenu                                        ; $5015

; A or B not pressed
	and  PADF_DOWN|PADF_UP                                          ; $5017
	jr   z, .checkLeftRight                                         ; $5019

; Up/down pressed - restart animations
	call ProcessScriptsFromCurrLoc                                  ; $501b
	SCR_StartSubScript1 PictureBookSubScript1_UpdateNumberBoxAnimIdx
	SCR_StartSubScript2 Script_PictureBookUpdateMusicNumberBox
	SCR_ResumeNextFrame

; By default, have sound effect updated
	SCR_StartSubScript2 Script_PictureBookUpdateSoundEffectNumberBox
	SCR_ResumeNextFrame
	
; Flip selection
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $502d
	ld   h, a                                                       ; $502f
	ld   l, PIC_BOOK_MUSIC_SE_SELECTION                             ; $5030
	ld   a, [hl]                                                    ; $5032
	xor  $01                                                        ; $5033
	ld   [hl], a                                                    ; $5035

; If now choosing music, replace default to have music updated
	cp   $00                                                        ; $5036
	jr   z, .haveMusicSelectionUpdated                              ; $5038

	ld   de, .mainLoop                                              ; $503a
	jp   ProcessScriptsFromDE                                       ; $503d

.haveMusicSelectionUpdated:
	call ProcessScriptsFromCurrLoc                                  ; $5040
	SCR_StartSubScript2 Script_PictureBookUpdateMusicNumberBox
	SCR_Jump .mainLoop

.checkLeftRight:
	ld   a, [wStickyButtonsHeld]                                    ; $504a
	bit  PADB_RIGHT, a                                              ; $504d
	jr   z, .checkLeft                                              ; $504f

; Right pressed - inc idx, if now equal num idxes, loop to 0
	ld   a, [hl]                                                    ; $5051
	inc  a                                                          ; $5052
	cp   b                                                          ; $5053
	jr   c, .setMusOrSEIdx                                          ; $5054

	xor  a                                                          ; $5056
	jr   .setMusOrSEIdx                                             ; $5057

.checkLeft:
	bit  PADB_LEFT, a                                               ; $5059
	jr   nz, .leftPressed                                           ; $505b

; No buttons pressed - do nothing
	ld   de, .mainLoop                                              ; $505d
	jp   ProcessScriptsFromDE                                       ; $5060

.leftPressed:
; If 0, idx = num idxes-1, else idx = idx-1
	ld   a, [hl]                                                    ; $5063
	or   a                                                          ; $5064
	jr   nz, :+                                                     ; $5065
	ld   a, b                                                       ; $5067
:	dec  a                                                          ; $5068

.setMusOrSEIdx:
	ld   [hl], a                                                    ; $5069
	call ProcessScriptsFromCurrLoc                                  ; $506a
	SCR_Jump .mainLoop

.backToMainMenu:
; Play sound, stop animation/number update subscripts
	call ProcessScriptsFromCurrLoc                                  ; $5070
	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT
	SCR_StopSubScript1
	SCR_StopSubScript2

; Replace scrolling text script with one that clears it
	SCR_CreateOtherScript 2, OtherScript_ClearScrollText

; Stop music, play menu changing sound effect
	SCR_PlaySound MUS_NULL
	SCR_ResumeNextFrame
	SCR_ResumeNextFrame
	SCR_PlaySound SND_0a|MAKE_SOUND_EFFECT

; Finally swap submenu out for main menu
	SCR_ResumeNextFrame
	SCR_Call Script_StoreSubMenuAreaInRamForScrollingLater
	SCR_Jump Script_PictureBookSwapSubMenuOutForMainMenu


Script_PictureBookUpdateMusicNumberBox:
; Update number box animation
:	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $508a
	ld   h, a                                                       ; $508c
	ld   l, PIC_BOOK_NUMBER_BOX_ANIM_IDX                            ; $508d
	ld   a, [hl]                                                    ; $508f
	ld   de, _SCRN0+$12a                                            ; $5090
	call VBlankEnqueue_UpdateNumberBoxAnimation                     ; $5093

; Update numbers in ram for vblank
	ldh  a, [hCurrScriptStructHighByte]                             ; $5096
	ld   h, a                                                       ; $5098
	ld   l, PIC_BOOK_MUSIC_IDX                                      ; $5099
	ld   a, [hl]                                                    ; $509b
	call UpdateNumberBoxRamTileMapAttrWithNumbers                   ; $509c

	call ProcessScriptsFromCurrLoc                                  ; $509f
	SCR_ResumeNextFrame
	SCR_Jump :-


Script_PictureBookUpdateSoundEffectNumberBox:
; Update number box animation
:	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $50a7
	ld   h, a                                                       ; $50a9
	ld   l, PIC_BOOK_NUMBER_BOX_ANIM_IDX                            ; $50aa
	ld   a, [hl]                                                    ; $50ac
	ld   de, _SCRN0+$1ca                                            ; $50ad
	call VBlankEnqueue_UpdateNumberBoxAnimation                     ; $50b0

; Update numbers in ram for vblank
	ldh  a, [hCurrScriptStructHighByte]                             ; $50b3
	ld   h, a                                                       ; $50b5
	ld   l, PIC_BOOK_SOUND_EFFECT_IDX                               ; $50b6
	ld   a, [hl]                                                    ; $50b8
	call UpdateNumberBoxRamTileMapAttrWithNumbers                   ; $50b9

	call ProcessScriptsFromCurrLoc                                  ; $50bc
	SCR_ResumeNextFrame
	SCR_Jump :-


Script_PictureBookSwapSubMenuOutForMainMenu:
; --
; -- Sub menu moving right
; --
; 11 times, move menu right
	SCR_SetCounter1 $0b
	SCR_StoreByteInStruct PIC_BOOK_MENU_MOVEMENT_COUNTER, $00

; Inc counter every loop
:	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $50c9
	ld   h, a                                                       ; $50cb
	ld   l, PIC_BOOK_MENU_MOVEMENT_COUNTER                          ; $50cc
	inc  [hl]                                                       ; $50ce

; Offset screen using counter
	ld   d, HIGH(_SCRN0+$e8)                                        ; $50cf
	ld   a, LOW(_SCRN0+$e8)                                         ; $50d1
	add  [hl]                                                       ; $50d3
	ld   e, a                                                       ; $50d4

; Display moving sub menu saved in ram
	ld   a, $04                                                     ; $50d5
	call VBlankEnqueue_DisplaySelectedPictureBookSubMenuAtSpecifiedDest ; $50d7
	call ProcessScriptsFromCurrLoc                                  ; $50da
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-
	
; If come back from train sub menu, revert train-specific tiles, and clear stats
	SCR_ExecAsmBelow
	call VBlankEnqueue_GetBackNonTrainTiles                         ; $50e2
	call VBlankEnqueue_ClearTrainCountStats                         ; $50e5
	call ProcessScriptsFromCurrLoc                                  ; $50e8
	SCR_ResumeNextFrame

; --
; -- Main menu moving left
; --
; 11 times, move menu left
	SCR_SetCounter1 $0b
	SCR_StoreByteInStruct PIC_BOOK_MENU_MOVEMENT_COUNTER, $0b

; Dec counter every loop
:	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $50f2
	ld   h, a                                                       ; $50f4
	ld   l, PIC_BOOK_MENU_MOVEMENT_COUNTER                          ; $50f5
	dec  [hl]                                                       ; $50f7

; Offset screen using counter
	ld   d, HIGH(_SCRN0+$e8)                                        ; $50f8
	ld   a, LOW(_SCRN0+$e8)                                         ; $50fa
	add  [hl]                                                       ; $50fc
	ld   e, a                                                       ; $50fd

; Highlight submenu we came out of
	ld   l, PIC_BOOK_MAIN_SELECTION                                 ; $50fe
	ld   a, [hl]                                                    ; $5100
	inc  a                                                          ; $5101
	call VBlankEnqueue_DisplaySelectedPictureBookMenuOptAtSpecifiedDest ; $5102
	call ProcessScriptsFromCurrLoc                                  ; $5105
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-

; Create other scripts used for changed scrolling text, and new main menu
	SCR_CreateOtherScript 3, OtherScript3_PictureBookMenuSelection
	SCR_CreateOtherScript 2, OtherScript2_PictureBookHandleScrollingText
	SCR_ResumeNextFrame
	SCR_Jump Script_PictureBookMainLoop


OtherScript3_PictureBookMenuSelection:
	SCR_SetSpriteX $38

; HL points to sprite Y
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $511d
	ld   h, a                                                       ; $511f
	ld   l, SCRIPT_SPRITE_Y                                         ; $5120

; Main selection -> $00, $20, $40
	ld   a, [PAGE_0+PIC_BOOK_MAIN_SELECTION]                        ; $5122
	ld   b, a                                                       ; $5125
	swap a                                                          ; $5126
	rlca                                                            ; $5128

; Store $30, $50, $70 into sprite Y
	add  $30                                                        ; $5129
	ld   [hl], a                                                    ; $512b

; Get main menu selection and display it highlighted
	ld   a, b                                                       ; $512c
	inc  a                                                          ; $512d
	call VBlankEnqueue_DisplaySelectedPictureBookMenuOpt            ; $512e
	call ProcessScriptsFromCurrLoc                                  ; $5131

; Show menu selection sprite, start unused subscript,
; As selection sprite disappears when menu option is selected
	SCR_FarSetSpriteSrc SpriteOam_PictureBookMainMenuSelection
	SCR_StartSubScript2 PictureBookOtherScriptSubscript_SpriteShovedByTrainSelection

.nextFrame:
	SCR_ResumeNextFrame
	
; Main selection -> $00, $20, $40
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $513e
	ld   h, a                                                       ; $5140
	ld   a, [PAGE_0+PIC_BOOK_MAIN_SELECTION]                        ; $5141
	swap a                                                          ; $5144
	rlca                                                            ; $5146

; B = $30, $50, $70
	add  $30                                                        ; $5147
	ld   b, a                                                       ; $5149

; Check main menu selection against current sprite Y, skipping if nothing's changed
	ld   l, SCRIPT_SPRITE_Y                                         ; $514a
	sub  [hl]                                                       ; $514c
	ld   a, [hl]                                                    ; $514d
	jr   z, .toNextFrame                                            ; $514e

; If main menu is above our sprite Y, move up
	jr   c, .moveUp                                                 ; $5150

; Move down
	add  $04                                                        ; $5152
	jr   .applyMove                                                 ; $5154

.moveUp:
	sub  $04                                                        ; $5156

.applyMove:
; Set sprite Y
	ld   [hl], a                                                    ; $5158

; Jump if now at correct Y
	cp   b                                                          ; $5159
	jr   z, .moveComplete                                           ; $515a

; If still moving, and vblank interrupt is stubbed..
	call CheckIfVBlankInterruptIsStubbed                            ; $515c
	jr   nz, .toNextFrame                                           ; $515f

; Clear highlighted menu options
	xor  a                                                          ; $5161
	call VBlankEnqueue_DisplaySelectedPictureBookMenuOpt            ; $5162
	jr   .toNextFrame                                               ; $5165

.moveComplete:
; Highlight the new options
	call ProcessScriptsFromCurrLoc                                  ; $5167
	SCR_StartSubScript1 OtherScript3Subscript1_HighlightPictureBookMenuSelection
	SCR_ExecAsmBelow

.toNextFrame:
	call ProcessScriptsFromCurrLoc                                  ; $516f
	SCR_Jump .nextFrame


OtherScript3Subscript1_HighlightPictureBookMenuSelection:
; Wait until vblank interrupt is stubbed
:	SCR_ExecAsmBelow
	call CheckIfVBlankInterruptIsStubbed                            ; $5176
	jr   z, .vblankIntStubbed                                       ; $5179

	call ProcessScriptsFromCurrLoc                                  ; $517b
	SCR_ResumeNextFrame
	SCR_Jump :-

.vblankIntStubbed:
; Highlight the new selected option
	ld   a, [PAGE_0+PIC_BOOK_MAIN_SELECTION]                        ; $5182
	inc  a                                                          ; $5185
	call VBlankEnqueue_DisplaySelectedPictureBookMenuOpt            ; $5186
	call ProcessScriptsFromCurrLoc                                  ; $5189
	SCR_ResumeNextFrame

; Indicate to main script that we're done moving
	SCR_StoreByteInAddr wPictureBookMenuIsMoving, $00
	SCR_StopSubScript1
	SCR_ResumeNextFrame


DEF LOGO_DISPLAYED_IDX = SCRIPT_VAR_1D
OtherScript1_PictureBookLogo:
	SCR_SetSpriteXY $38, $30
	SCR_FarSetSpriteSrc SpriteOam_PictureBookLogo
	
; Store main menu selection in struct byte
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $519b
	ld   h, a                                                       ; $519d
	ld   l, LOGO_DISPLAYED_IDX                                      ; $519e
	ld   a, [PAGE_0+PIC_BOOK_MAIN_SELECTION]                        ; $51a0
	ld   [hl], a                                                    ; $51a3

.menuUnchanged:
; Keep changing status unchecked, and have sprite shovable by selecting train
	call ProcessScriptsFromCurrLoc                                  ; $51a4
	SCR_StoreByteInAddr wPictureBookLogoPaletteIsChanging, $00
	SCR_StartSubScript1 PictureBookOtherScriptSubscript_SpriteShovedByTrainSelection

:	SCR_ResumeNextFrame
	
; Loop while unchanged
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $51b1
	ld   h, a                                                       ; $51b3
	ld   l, LOGO_DISPLAYED_IDX                                      ; $51b4
	ld   a, [PAGE_0+PIC_BOOK_MAIN_SELECTION]                        ; $51b6
	cp   [hl]                                                       ; $51b9
	jr   z, .menuUnchanged                                          ; $51ba

; Palettes that can fade are those used by logo
	ld   a, $40                                                     ; $51bc
	ld   [wBitsSetPerBGPaletteFade], a                              ; $51be
	ld   a, $80                                                     ; $51c1
	ld   [wBitsSetPerOBJPaletteFade], a                             ; $51c3

; Set that we are now changing and fade out
	call ProcessScriptsFromCurrLoc                                  ; $51c6
	SCR_StoreByteInAddr wPictureBookLogoPaletteIsChanging, $01
	SCR_Call Script_CallFadeOut
	
; Set the correct logo idx
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $51d1
	ld   h, a                                                       ; $51d3
	ld   l, LOGO_DISPLAYED_IDX                                      ; $51d4
	ld   a, [PAGE_0+PIC_BOOK_MAIN_SELECTION]                        ; $51d6
	ld   [hl], a                                                    ; $51d9

; Load correct tile data and palettes, unset that we're changing then rapidly fade in
	call LoadSpriteTilesForPictureBookMainSelection                 ; $51da
	call UpdateBGPalettesForPictureBookMenuSelection                ; $51dd
	call ProcessScriptsFromCurrLoc                                  ; $51e0
	SCR_Delay $02
	SCR_StoreByteInAddr wPictureBookLogoPaletteIsChanging, $00
	SCR_Call RapidlyFadeIn
	SCR_Jump :-


PictureBookOtherScriptSubscript_SpriteShovedByTrainSelection:
; HL points to sprite X
:	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $51f0
	ld   h, a                                                       ; $51f2
	ld   l, SCRIPT_SPRITE_X                                         ; $51f3

; Get $38 - SCX on right table, and set our X
; ie as train table scroll moves left, we move left to be shoved off
	ld   a, [wPictureBookNextSCXForRightTable]                      ; $51f5
	ld   b, a                                                       ; $51f8
	ld   a, $38                                                     ; $51f9
	sub  b                                                          ; $51fb
	ld   [hl], a                                                    ; $51fc

	call ProcessScriptsFromCurrLoc                                  ; $51fd
	SCR_ResumeNextFrame
	SCR_Jump :-


Script_CallFadeOut:
	SCR_Jump Script_FadeOut


RapidlyFadeIn:
DEF CURR_FADE = $20
rept 9
	SCR_ExecAsmBelow
	ld   a, CURR_FADE                                               ; $5208
	ld   [wPaletteFadeAmount], a                                    ; $520a
	ld   a, $01                                                     ; $520d
	ld   [wLoadPalettesFromRam], a                                  ; $520f
	call ProcessScriptsFromCurrLoc                                  ; $5212
	SCR_Delay $01
CURR_FADE = CURR_FADE - 4
endr

	SCR_Ret
	
	
GameSetupOtherScript_HandleScrollingText:
	SCR_StoreByteInStruct SCROLL_TEXT_SCREEN_IDX, $03
	SCR_Jump OtherScript_HandleScrollingText


OtherScript2_TrainLineSelectionHandleScrollingText:
	SCR_StoreByteInStruct SCROLL_TEXT_SCREEN_IDX, $02
	SCR_Jump OtherScript_HandleScrollingText


OtherScript2_PictureBookSubMenuHandleScrollingText:
	SCR_StoreByteInStruct SCROLL_TEXT_SCREEN_IDX, $01
	SCR_Jump OtherScript_HandleScrollingText


OtherScript2_PictureBookHandleScrollingText:
	SCR_StoreByteInStruct SCROLL_TEXT_SCREEN_IDX, $00

OtherScript_HandleScrollingText:
	SCR_ExecAsmBelow

.reCheckTextIdx:
; Based on screen, get relevant text idx
	ldh  a, [hCurrScriptStructHighByte]                             ; $52ae
	ld   h, a                                                       ; $52b0
	ld   l, SCROLL_TEXT_SCREEN_IDX                                  ; $52b1

; 0 - Picture book
	ld   a, [hl]                                                    ; $52b3
	or   a                                                          ; $52b4
	jr   z, .pictureBook                                            ; $52b5

; 1 - Picture book sub-menu
	dec  a                                                          ; $52b7
	jr   z, .screen1                                                ; $52b8

; 2 - Trainline selection
	dec  a                                                          ; $52ba
	jr   z, .screen2                                                ; $52bb

; 3 - Game Setup screen, 1st text is for control scheme
	ld   a, [wGameSetupCurrSelectedCategory]                        ; $52bd
	add  SCROLL_TEXT_CONTROL_SCHEME                                 ; $52c0
	jr   .afterGettingTextIdx                                       ; $52c2

.screen2:
; Index starts at 6
	ld   a, [wTrainLineSelectionSelectedTrain]                      ; $52c4
	add  $06                                                        ; $52c7
	jr   .afterGettingTextIdx                                       ; $52c9

.screen1:
	ld   a, [PAGE_0+PIC_BOOK_SUB_MENU_SCROLL_TEXT_IDX]              ; $52cb
	jr   .afterGettingTextIdx                                       ; $52ce

.pictureBook:
; Text idx is 0-2 for main menu selection
	ld   a, [PAGE_0+PIC_BOOK_MAIN_SELECTION]                        ; $52d0

.afterGettingTextIdx:
; Store text idx
	ld   l, SCROLL_TEXT_IDX                                         ; $52d3
	ld   [hl], a                                                    ; $52d5

; HL = quadruple index into table, pointing to text length + initial black cols
	add  a                                                          ; $52d6
	add  a                                                          ; $52d7
	ld   c, a                                                       ; $52d8
	ld   b, $00                                                     ; $52d9
	ld   hl, ScrollingTexts+2                                       ; $52db
	add  hl, bc                                                     ; $52de

; Store that full length
	ld   a, [hl]                                                    ; $52df
	ld   [wScrollingTextLengthPlusInitialBlackCols], a              ; $52e0

.repeatDisplayingCurrText:
; Clear scroll vars
	xor  a                                                          ; $52e3
	ld   [wScrollingText_DoubleSCX], a                              ; $52e4
	ld   [wScrollingText_DoubleSCX+1], a                            ; $52e7
	ld   [wScrollingTextIdxOfByteWithinText], a                     ; $52ea

; Display initial scrolling text (eg fully black), then reset scroll text subscript
	ldh  a, [hCurrScriptStructHighByte]                             ; $52ed
	ld   h, a                                                       ; $52ef
	ld   l, SCROLL_TEXT_SCREEN_IDX                                  ; $52f0
	ld   a, [hl]                                                    ; $52f2
	call VBlankEnqueue_DisplayInitialScrollingText                  ; $52f3
	call ProcessScriptsFromCurrLoc                                  ; $52f6
	SCR_StartSubScript1 GameSetupOtherScriptSubScript1_ScrollText

.keepScrolling:
	SCR_ResumeNextFrame

; If screen idx == 0 (picture book)..
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $52ff
	ld   h, a                                                       ; $5301
	ld   l, SCROLL_TEXT_SCREEN_IDX                                  ; $5302
	ld   a, [hl]                                                    ; $5304
	or   a                                                          ; $5305
	jr   nz, .afterPicBookCheck                                     ; $5306

; If main menu option changed, re-get new text index
	ld   l, SCROLL_TEXT_IDX                                         ; $5308
	ld   a, [PAGE_0+PIC_BOOK_MAIN_SELECTION]                        ; $530a
	cp   [hl]                                                       ; $530d
	jr   nz, .reCheckTextIdx                                        ; $530e

.afterPicBookCheck:
; Once text is done, repeat the text
	ld   a, [wScrollingTextLengthPlusInitialBlackCols]              ; $5310
	ld   c, a                                                       ; $5313
	ld   a, [wScrollingTextIdxOfByteWithinText]                     ; $5314
	cp   c                                                          ; $5317
	jr   nc, .repeatDisplayingCurrText                              ; $5318

; Else keep scrolling
	call ProcessScriptsFromCurrLoc                                  ; $531a
	SCR_Jump .keepScrolling


GameSetupOtherScriptSubScript1_ScrollText:
	SCR_Delay $14

.loop:
	SCR_ExecAsmBelow
	ld   a, [wScrollingText_DoubleSCX]                              ; $5323
	and  $0f                                                        ; $5326
	jp   nz, .cont                                                  ; $5328

; Every $10 double scx, or 8 scx or every tile col scrolled by, display a text col
	ldh  a, [hCurrScriptStructHighByte]                             ; $532b
	ld   h, a                                                       ; $532d
	ld   l, SCROLL_TEXT_IDX                                         ; $532e
	ld   a, [hl]                                                    ; $5330
	call VBlankEnqueue_DisplayNewScrollingTextCol                   ; $5331

.cont:
; Get double scx, add 1 to it, then store it back
	ld   hl, wScrollingText_DoubleSCX                               ; $5334
	ld   a, [hl+]                                                   ; $5337
	ld   h, [hl]                                                    ; $5338
	ld   l, a                                                       ; $5339
	inc  hl                                                         ; $533a
	ld   a, l                                                       ; $533b
	ld   [wScrollingText_DoubleSCX], a                              ; $533c
	ld   a, h                                                       ; $533f
	ld   [wScrollingText_DoubleSCX+1], a                            ; $5340

	call ProcessScriptsFromCurrLoc                                  ; $5343
	SCR_ResumeNextFrame
	SCR_Jump .loop


OtherScript_ClearScrollText:
	SCR_StopSubScript1
	SCR_StopSubScript2
	
; Clear scroll vars
	SCR_ExecAsmBelow
	xor  a                                                          ; $534d
	ld   [wScrollingText_DoubleSCX], a                              ; $534e
	ld   [wScrollingText_DoubleSCX+1], a                            ; $5351
	ld   [wScrollingTextIdxOfByteWithinText], a                     ; $5354

; Based on screen, clear scrolling text
	ldh  a, [hCurrScriptStructHighByte]                             ; $5357
	ld   h, a                                                       ; $5359
	ld   l, SCROLL_TEXT_SCREEN_IDX                                  ; $535a
	ld   a, [hl]                                                    ; $535c
	call VBlankEnqueue_DisplayInitialScrollingText                  ; $535d
	call ProcessScriptsFromCurrLoc                                  ; $5360
	SCR_StopCurrScript
	SCR_ResumeNextFrame


InitialScrollingTextTileMapAndAttrAddresses:
	dw TileMapAndAttr_ClearedScrollingText1
	dw TileMapAndAttr_ClearedScrollingText1
	dw TileMapAndAttr_ClearedScrollingTextForTrainLineSelect
	dw TileMapAndAttr_ClearedScrollingText2


; A - screen idx
VBlankEnqueue_DisplayInitialScrollingText:
; HL = double index into table
	add  a                                                          ; $536d
	ld   c, a                                                       ; $536e
	ld   b, $00                                                     ; $536f
	ld   hl, InitialScrollingTextTileMapAndAttrAddresses            ; $5371
	add  hl, bc                                                     ; $5374

; HL = address in table
	ld   a, [hl+]                                                   ; $5375
	ld   h, [hl]                                                    ; $5376
	ld   l, a                                                       ; $5377

; Load tile map, using bank, rows, cols, dest and src, then vram bank 0
	ld   de, _SCRN0+$80                                             ; $5378
	ldbc $02, SCREEN_TILE_WIDTH                                     ; $537b
	ld   a, BANK(TileMapAndAttr_ClearedScrollingText1)              ; $537e

	push hl                                                         ; $5380
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $5381
	xor  a                                                          ; $5384
	call VBlankEnqueue_SetVramBank                                  ; $5385
	pop  hl                                                         ; $5388

; Same with tile attr
	ld   de, 2 * SCREEN_TILE_WIDTH                                  ; $5389
	add  hl, de                                                     ; $538c
	ld   de, _SCRN0+$80                                             ; $538d
	ldbc $02, SCREEN_TILE_WIDTH                                     ; $5390
	ld   a, BANK(TileMapAndAttr_ClearedScrollingText1)              ; $5393
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $5395
	ld   a, $01                                                     ; $5398
	jp   VBlankEnqueue_SetVramBank                                  ; $539a


; A - text idx
VBlankEnqueue_DisplayNewScrollingTextCol:
; HL = quadruple idx into table
	add  a                                                          ; $539d
	add  a                                                          ; $539e
	ld   c, a                                                       ; $539f
	ld   b, $00                                                     ; $53a0
	ld   hl, ScrollingTexts                                         ; $53a2
	add  hl, bc                                                     ; $53a5

; DE = text length without the initial black cols
	ld   a, [wScrollingTextLengthPlusInitialBlackCols]              ; $53a6
	sub  SCROLL_TEXT_COL_START                                      ; $53a9
	ld   e, a                                                       ; $53ab
	ld   d, $00                                                     ; $53ac

; HL is word in table (text source)
	ld   a, [hl+]                                                   ; $53ae
	ld   h, [hl]                                                    ; $53af
	ld   l, a                                                       ; $53b0

; C = double scx / 16 (col idx)
	ld   a, [wScrollingText_DoubleSCX]                              ; $53b1
	ld   c, a                                                       ; $53b4
	ld   a, [wScrollingText_DoubleSCX+1]                            ; $53b5
	rrca                                                            ; $53b8
	rr   c                                                          ; $53b9
	rrca                                                            ; $53bb
	rr   c                                                          ; $53bc
	rrca                                                            ; $53be
	rr   c                                                          ; $53bf
	rrca                                                            ; $53c1
	rr   c                                                          ; $53c2

; Store col idx
	ld   a, c                                                       ; $53c4
	ld   [wScrollingTextIdxOfByteWithinText], a                     ; $53c5

; HL points to text char, jump if col idx < length
	ld   b, $00                                                     ; $53c8
	add  hl, bc                                                     ; $53ca
	cp   e                                                          ; $53cb
	jr   c, .cont                                                   ; $53cc

; Reached the end of the text, DE is the length of these default text displays
	ld   de, (TileMapAndAttr_ClearedScrollingText1.end-TileMapAndAttr_ClearedScrollingText1)/4 ; $53ce

; Get correct address to cleared text, based on if in trainline selection screen
	ldh  a, [hCurrScriptStructHighByte]                             ; $53d1
	ld   h, a                                                       ; $53d3
	ld   l, SCROLL_TEXT_SCREEN_IDX                                  ; $53d4
	ld   a, [hl]                                                    ; $53d6
	ld   hl, TileMapAndAttr_ClearedScrollingText1                   ; $53d7
	cp   $02                                                        ; $53da
	jr   nz, .cont                                                  ; $53dc

	ld   hl, TileMapAndAttr_ClearedScrollingTextForTrainLineSelect  ; $53de

.cont:
; Store tile map top, then bottom, then attr top, then bottom
	ld   a, [hl]                                                    ; $53e1
	ld   [wScrollingTextTileIdxTop], a                              ; $53e2
	add  hl, de                                                     ; $53e5
	ld   a, [hl]                                                    ; $53e6
	ld   [wScrollingTextTileIdxBottom], a                           ; $53e7
	add  hl, de                                                     ; $53ea
	ld   a, [hl]                                                    ; $53eb
	ld   [wScrollingTextTileAttrTop], a                             ; $53ec
	add  hl, de                                                     ; $53ef
	ld   a, [hl]                                                    ; $53f0
	ld   [wScrollingTextTileAttrBottom], a                          ; $53f1

; Get actual SCX
	ld   a, [wScrollingText_DoubleSCX+1]                            ; $53f4
	rrca                                                            ; $53f7
	ld   a, [wScrollingText_DoubleSCX]                              ; $53f8
	rra                                                             ; $53fb

; HL = location to draw to
	add  8 * SCROLL_TEXT_COL_START                                  ; $53fc
	srl  a                                                          ; $53fe
	srl  a                                                          ; $5400
	srl  a                                                          ; $5402
	ld   c, a                                                       ; $5404
	ld   b, $00                                                     ; $5405
	ld   hl, _SCRN0+$80                                             ; $5407
	add  hl, bc                                                     ; $540a

; Store for vblank display
	ld   a, l                                                       ; $540b
	ld   [wScrollingTextVramDestForTile], a                         ; $540c
	ld   a, h                                                       ; $540f
	ld   [wScrollingTextVramDestForTile+1], a                       ; $5410

; Enqueue funcs - set rom bank, then actual drawing func
	ld   b, $03                                                     ; $5413
	ld   hl, .vblankQueueFuncs                                      ; $5415
	jp   PushStackParamsIntoVBlankQueue                             ; $5418

.vblankQueueFuncs:
	dw DrawScrollingTextCol
	db $00, BANK(DrawScrollingTextCol)
	dw VBlankQueueFunc_SetRomBank


DrawScrollingTextCol:
; Dest in DE
	ld   hl, wScrollingTextVramDestForTile                          ; $5421
	ld   a, [hl+]                                                   ; $5424
	ld   d, [hl]                                                    ; $5425
	ld   e, a                                                       ; $5426

; Start with tile map top
	ld   hl, wScrollingTextTileIdxTop                               ; $5427
	xor  a                                                          ; $542a
	ldh  [rVBK], a                                                  ; $542b
	ld   a, [hl+]                                                   ; $542d
	ld   [de], a                                                    ; $542e

; Tile attr top
	ld   a, $01                                                     ; $542f
	ldh  [rVBK], a                                                  ; $5431
	ld   a, [hl+]                                                   ; $5433
	ld   [de], a                                                    ; $5434

	ld   a, LOW(GB_TILE_WIDTH)                                      ; $5435
	add  a, e                                                       ; $5437
	ld   e, a                                                       ; $5438
	ld   a, d                                                       ; $5439
	adc  HIGH(GB_TILE_WIDTH)                                        ; $543a
	ld   d, a                                                       ; $543c
	
; Tile map bottom
	xor  a                                                          ; $543d
	ldh  [rVBK], a                                                  ; $543e
	ld   a, [hl+]                                                   ; $5440
	ld   [de], a                                                    ; $5441

; Tile attr bottom
	ld   a, $01                                                     ; $5442
	ldh  [rVBK], a                                                  ; $5444
	ld   a, [hl]                                                    ; $5446
	ld   [de], a                                                    ; $5447
	ret                                                             ; $5448


ScrollingTexts:
	scrollText ScrollingText_PictureBookTrainDescrip
	scrollText ScrollingText_PictureBookVideoDescrip
	scrollText ScrollingText_PictureBookMusicDescrip
	scrollText ScrollingText_PictureBookTrainHeader
	scrollText ScrollingText_PictureBookVideoHeader
	scrollText ScrollingText_PictureBookMusicHeader

	scrollText ScrollingText_TrainSelect1
	scrollText ScrollingText_TrainSelect2
	scrollText ScrollingText_TrainSelect3
	scrollText ScrollingText_TrainSelect4
	scrollText ScrollingText_TrainSelect5
	scrollText ScrollingText_TrainSelect6
	scrollText ScrollingText_TrainSelect7
	scrollText ScrollingText_TrainSelect7
	scrollText ScrollingText_TrainSelect8
	scrollText ScrollingText_TrainSelect3

	scrollText ScrollingText_GameSetupControlScheme
	scrollText ScrollingText_GameSetupDifficulty
	scrollText ScrollingText_GameSetupSpeedMeter
	scrollText ScrollingText_GameSetupDistanceMeter
	scrollText ScrollingText_GameSetupReset


TileMapAndAttr_ClearedScrollingText1:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

	db $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10
	db $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10
.end:


ScrollingText_PictureBookTrainDescrip:
	db $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8a, $8b, $8c, $8d, $8e, $8f, $e0, $e1, $e2, $e3, $e4, $e5, $e6, $e7, $e8, $e9
	db $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9a, $9b, $9c, $9d, $9e, $9f, $f0, $f1, $f2, $f3, $f4, $f5, $f6, $f7, $f8, $f9
	
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:
	
	
ScrollingText_PictureBookVideoDescrip:
	db $a0, $a1, $a2, $a3, $a4, $a5, $a6, $a7, $a8, $a9, $aa, $ab, $ac, $ad, $ae, $af, $e2, $e3, $e4, $e5, $e6, $e7, $e8, $e9
	db $b0, $b1, $b2, $b3, $b4, $b5, $b6, $b7, $b8, $b9, $ba, $bb, $bc, $bd, $be, $bf, $f2, $f3, $f4, $f5, $f6, $f7, $f8, $f9

	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:
	

ScrollingText_PictureBookMusicDescrip:
	db $c0, $c1, $c2, $c3, $c4, $c5, $c6, $c7, $c8, $c9, $ca, $cb, $cc, $cd, $ce, $cf, $09, $0a, $0b, $0c, $0d, $0e, $0f
	db $d0, $d1, $d2, $d3, $d4, $d5, $d6, $d7, $d8, $d9, $da, $db, $dc, $dd, $de, $df, $19, $1a, $1b, $1c, $1d, $1e, $1f

	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:
	

ScrollingText_PictureBookTrainHeader:
	db $20, $21, $25, $26, $27, $22, $23, $24, $2e, $2f
	db $30, $31, $35, $36, $37, $32, $33, $34, $3e, $3f

	db $00, $00, $04, $04, $04, $04, $04, $04, $00, $00
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:


ScrollingText_PictureBookVideoHeader:
	db $20, $21, $2b, $2c, $2d, $22, $23, $24, $2e, $2f
	db $30, $31, $3b, $3c, $3d, $32, $33, $34, $3e, $3f

	db $00, $00, $04, $04, $04, $04, $04, $04, $00, $00
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:


ScrollingText_PictureBookMusicHeader:
	db $20, $21, $28, $29, $2a, $22, $23, $24, $2e, $2f
	db $30, $31, $38, $39, $3a, $32, $33, $34, $3e, $3f

	db $00, $00, $04, $04, $04, $04, $04, $04, $00, $00
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:


TileMapAndAttr_ClearedScrollingTextForTrainLineSelect:
	db $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f
	db $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f, $5f

	db $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09
	db $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09


ScrollingText_TrainSelect2:
	db $80, $82, $84, $86, $88, $8a, $8c, $8e, $90, $92, $94, $96, $98, $9a, $9c, $9e, $a0, $a2, $a4, $a6, $a8, $aa, $ac, $ae, $b0, $b2, $b4, $b6, $b8, $ba, $bc, $be, $c0, $c2, $c4, $c6, $c8, $ca, $cc, $ce
	db $81, $83, $85, $87, $89, $8b, $8d, $8f, $91, $93, $95, $97, $99, $9b, $9d, $9f, $a1, $a3, $a5, $a7, $a9, $ab, $ad, $af, $b1, $b3, $b5, $b7, $b9, $bb, $bd, $bf, $c1, $c3, $c5, $c7, $c9, $cb, $cd, $cf

	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:


ScrollingText_TrainSelect7:
	db $80, $82, $84, $86, $88, $8a, $8c, $8e, $90, $92, $94, $96, $98, $9a, $9c, $9e, $a0, $a2, $a4, $a6, $a8, $aa, $ac, $ae, $b0, $b2, $b4, $b6, $b8, $ba, $bc, $be, $c0, $c2, $c4, $c6, $c8, $ca, $cc, $ce, $d0, $d2
	db $81, $83, $85, $87, $89, $8b, $8d, $8f, $91, $93, $95, $97, $99, $9b, $9d, $9f, $a1, $a3, $a5, $a7, $a9, $ab, $ad, $af, $b1, $b3, $b5, $b7, $b9, $bb, $bd, $bf, $c1, $c3, $c5, $c7, $c9, $cb, $cd, $cf, $d1, $d3

	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:


ScrollingText_TrainSelect1:
	db $80, $82, $84, $86, $88, $8a, $8c, $8e, $90, $92, $94, $96, $98, $9a, $9c, $9e, $a0, $a2, $a4, $a6, $a8, $aa, $ac, $ae, $b0, $b2, $b4, $b6, $b8, $ba, $bc, $be, $c0, $c2, $c4, $c6, $c8, $ca, $cc, $ce, $d0, $d2, $d4, $d6, $d8
	db $81, $83, $85, $87, $89, $8b, $8d, $8f, $91, $93, $95, $97, $99, $9b, $9d, $9f, $a1, $a3, $a5, $a7, $a9, $ab, $ad, $af, $b1, $b3, $b5, $b7, $b9, $bb, $bd, $bf, $c1, $c3, $c5, $c7, $c9, $cb, $cd, $cf, $d1, $d3, $d5, $d7, $d9

	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:


ScrollingText_TrainSelect3:
	db $80, $82, $84, $86, $88, $8a, $8c, $8e, $90, $92, $94, $96, $98, $9a, $9c, $9e, $a0, $a2, $a4, $a6, $a8, $aa, $ac, $ae, $b0, $b2, $b4, $b6, $b8, $ba, $bc, $be, $c0, $c2, $c4, $c6, $c8, $ca, $cc, $ce, $d0, $d2, $d4, $d6, $d8, $da
	db $81, $83, $85, $87, $89, $8b, $8d, $8f, $91, $93, $95, $97, $99, $9b, $9d, $9f, $a1, $a3, $a5, $a7, $a9, $ab, $ad, $af, $b1, $b3, $b5, $b7, $b9, $bb, $bd, $bf, $c1, $c3, $c5, $c7, $c9, $cb, $cd, $cf, $d1, $d3, $d5, $d7, $d9, $db

	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:


ScrollingText_TrainSelect6:
	db $80, $82, $84, $86, $88, $8a, $8c, $8e, $90, $92, $94, $96, $98, $9a, $9c, $9e, $a0, $a2, $a4, $a6, $a8, $aa, $ac, $ae, $b0, $b2, $b4, $b6, $b8, $ba, $bc, $be, $c0, $c2, $c4, $c6, $c8, $ca, $cc, $ce, $d0, $d2, $d4, $d6, $d8, $da, $dc, $de
	db $81, $83, $85, $87, $89, $8b, $8d, $8f, $91, $93, $95, $97, $99, $9b, $9d, $9f, $a1, $a3, $a5, $a7, $a9, $ab, $ad, $af, $b1, $b3, $b5, $b7, $b9, $bb, $bd, $bf, $c1, $c3, $c5, $c7, $c9, $cb, $cd, $cf, $d1, $d3, $d5, $d7, $d9, $db, $dd, $df

	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:


ScrollingText_TrainSelect8:
	db $80, $82, $84, $86, $88, $8a, $8c, $8e, $90, $92, $94, $96, $98, $9a, $9c, $9e, $a0, $a2, $a4, $a6, $a8, $aa, $ac, $ae, $b0, $b2, $b4, $b6, $b8, $ba, $bc, $be, $c0, $c2, $c4, $c6, $c8, $ca, $cc, $ce, $d0, $d2, $d4, $d6, $d8, $da, $dc, $de, $e0, $e2, $e4, $e6, $e8, $ea, $ec, $ee
	db $81, $83, $85, $87, $89, $8b, $8d, $8f, $91, $93, $95, $97, $99, $9b, $9d, $9f, $a1, $a3, $a5, $a7, $a9, $ab, $ad, $af, $b1, $b3, $b5, $b7, $b9, $bb, $bd, $bf, $c1, $c3, $c5, $c7, $c9, $cb, $cd, $cf, $d1, $d3, $d5, $d7, $d9, $db, $dd, $df, $e1, $e3, $e5, $e7, $e9, $eb, $ed, $ef
	
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:


ScrollingText_TrainSelect4:
	db $80, $82, $84, $86, $88, $8a, $8c, $8e, $90, $92, $94, $96, $98, $9a, $9c, $9e, $a0, $a2, $a4, $a6, $a8, $aa, $ac, $ae, $b0, $b2, $b4, $b6, $b8, $ba, $bc, $be, $c0, $c2, $c4, $c6, $c8, $ca, $cc, $ce, $d0, $d2, $d4, $d6, $d8, $da, $dc, $de, $e0, $e2, $e4, $e6, $e8, $ea, $ec, $ee, $f0, $f2, $f4, $f6, $f8, $fa, $fc, $fe, $00, $02, $04, $06
	db $81, $83, $85, $87, $89, $8b, $8d, $8f, $91, $93, $95, $97, $99, $9b, $9d, $9f, $a1, $a3, $a5, $a7, $a9, $ab, $ad, $af, $b1, $b3, $b5, $b7, $b9, $bb, $bd, $bf, $c1, $c3, $c5, $c7, $c9, $cb, $cd, $cf, $d1, $d3, $d5, $d7, $d9, $db, $dd, $df, $e1, $e3, $e5, $e7, $e9, $eb, $ed, $ef, $f1, $f3, $f5, $f7, $f9, $fb, $fd, $ff, $01, $03, $05, $07
	
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:

	
ScrollingText_TrainSelect5:
	db $80, $82, $84, $86, $88, $8a, $8c, $8e, $90, $92, $94, $96, $98, $9a, $9c, $9e, $a0, $a2, $a4, $a6, $a8, $aa, $ac, $ae, $b0, $b2, $b4, $b6, $b8, $ba, $bc, $be, $c0, $c2, $c4, $c6, $c8, $ca, $cc, $ce, $d0, $d2, $d4, $d6, $d8, $da, $dc, $de, $e0, $e2, $e4, $e6, $e8, $ea, $ec, $ee, $f0, $f2, $f4, $f6, $f8, $fa, $fc, $fe, $00, $02, $04, $06, $08, $0a
	db $81, $83, $85, $87, $89, $8b, $8d, $8f, $91, $93, $95, $97, $99, $9b, $9d, $9f, $a1, $a3, $a5, $a7, $a9, $ab, $ad, $af, $b1, $b3, $b5, $b7, $b9, $bb, $bd, $bf, $c1, $c3, $c5, $c7, $c9, $cb, $cd, $cf, $d1, $d3, $d5, $d7, $d9, $db, $dd, $df, $e1, $e3, $e5, $e7, $e9, $eb, $ed, $ef, $f1, $f3, $f5, $f7, $f9, $fb, $fd, $ff, $01, $03, $05, $07, $09, $0b

	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:


ScrollingText_GameSetupControlScheme:
	db $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $23, $24, $25, $26, $27, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8a
	db $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $33, $34, $35, $36, $37, $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9a

	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:


ScrollingText_GameSetupDifficulty:
	db $a0, $a1, $a2, $a3, $a4, $a5, $a6, $a7, $a8, $a9, $aa, $ab, $ac, $ad, $ae, $af, $c0, $c1, $c2, $82, $83, $84, $85, $86, $87, $88, $89, $8a
	db $b0, $b1, $b2, $b3, $b4, $b5, $b6, $b7, $b8, $b9, $ba, $bb, $bc, $bd, $be, $bf, $d0, $d1, $d2, $92, $93, $94, $95, $96, $97, $98, $99, $9a

	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:


ScrollingText_GameSetupSpeedMeter:
	db $c3, $c4, $c5, $c6, $c7, $c8, $c9, $ca, $cb, $cc, $e0, $e1, $e2, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8a
	db $d3, $d4, $d5, $d6, $d7, $d8, $d9, $da, $db, $dc, $f0, $f1, $f2, $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9a

	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:


ScrollingText_GameSetupDistanceMeter:
	db $cd, $ce, $cf, $c6, $c7, $c8, $c9, $ca, $cb, $cc, $e0, $e1, $e2, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8a
	db $dd, $de, $df, $d6, $d7, $d8, $d9, $da, $db, $dc, $f0, $f1, $f2, $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9a

	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:
	

ScrollingText_GameSetupReset:
	db $e3, $e4, $e5, $e6, $e7, $e8, $e9, $ea, $eb, $ec, $ed, $ee, $ef, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e
	db $f3, $f4, $f5, $f6, $f7, $f8, $f9, $fa, $fb, $fc, $fd, $fe, $ff, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e
	
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.end:


TileMapAndAttr_ClearedScrollingText2:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

	db $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10
	db $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10


GameState2b_PhotoGetInit_def::
; No palette fade, clear scripts and oam
	ld   a, $00                                                     ; $5fad
	ld   [wLoadPalettesFromRam], a                                  ; $5faf
	call InitScriptStructs                                          ; $5fb2
	call ClearScriptsOamHideAllOam                                  ; $5fb5

; Stub out both display interrupts
	di                                                              ; $5fb8
	ld   a, [wVBlankInterruptFunc]                                  ; $5fb9
	ld   l, a                                                       ; $5fbc
	ld   a, [wVBlankInterruptFunc+1]                                ; $5fbd
	ld   h, a                                                       ; $5fc0

	ld   a, LOW(StubInterruptFunc)                                  ; $5fc1
	ld   [wVBlankInterruptFunc], a                                  ; $5fc3
	ld   a, HIGH(StubInterruptFunc)                                 ; $5fc6
	ld   [wVBlankInterruptFunc+1], a                                ; $5fc8

	ld   a, [wLCDCInterruptFunc]                                    ; $5fcb
	ld   l, a                                                       ; $5fce
	ld   a, [wLCDCInterruptFunc+1]                                  ; $5fcf
	ld   h, a                                                       ; $5fd2

	ld   a, LOW(StubInterruptFunc)                                  ; $5fd3
	ld   [wLCDCInterruptFunc], a                                    ; $5fd5
	ld   a, HIGH(StubInterruptFunc)                                 ; $5fd8
	ld   [wLCDCInterruptFunc+1], a                                  ; $5fda
	ei                                                              ; $5fdd

; Turn on LCD, start script and allow vblank enqueueing
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $5fde
	ldh  [rLCDC], a                                                 ; $5fe0
	M_StartMainScript 0, PhotoGetScript

GameState2c_PhotoGetMain_def::
	jp   ResetVBlankQueueData                                       ; $5feb


DEF NUM_TRAINS_DISPLAYED = SCRIPT_VAR_1D
DEF NUM_TRAINS_UNLOCKED = SCRIPT_VAR_1E
PhotoGetScript:
; Set main state, num trains counter, and actual num trains
	SCR_StoreByteInAddr wGameState, GS_PHOTO_GET_MAIN
	SCR_StoreByteInStruct NUM_TRAINS_DISPLAYED, $00
	SCR_StoreByteFromWordInStruct wNumTrainsUnlockedForPhotoGet, NUM_TRAINS_UNLOCKED

; Set palettes to all black - no fade
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_AllBlack)                                 ; $5ffa
	ld   hl, Palettes_AllBlack                                      ; $5ffc
	call SetBGPaletteSrc                                            ; $5fff
	xor  a                                                          ; $6002
	ld   [wPaletteFadeAmount], a                                    ; $6003
	ld   [wLoadPalettesFromRam], a                                  ; $6006
	ld   a, $01                                                     ; $6009
	ld   [wLoadBGPalettesFromRom], a                                ; $600b

	ld   b, BANK(Palettes_AllBlack)                                 ; $600e
	ld   hl, Palettes_AllBlack                                      ; $6010
	call SetOBJPaletteSrc                                           ; $6013
	xor  a                                                          ; $6016
	ld   [wPaletteFadeAmount], a                                    ; $6017
	ld   [wLoadPalettesFromRam], a                                  ; $601a
	ld   a, $01                                                     ; $601d
	ld   [wLoadOBJPalettesFromRom], a                               ; $601f

	call ProcessScriptsFromCurrLoc                                  ; $6022
	SCR_ResumeNextFrame

; Enqueue loading tile map, then attrs
	SCR_ExecAsmBelow
	ld   a, BANK(TileMap_PhotoGet)                                  ; $6027
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $6029
	ld   de, _SCRN0                                                 ; $602c
	ld   hl, TileMap_PhotoGet                                       ; $602f
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $6032
	xor  a                                                          ; $6035
	call VBlankEnqueue_SetVramBank                                  ; $6036
	call ProcessScriptsFromCurrLoc                                  ; $6039
	SCR_ResumeNextFrame
	
	SCR_ExecAsmBelow
	ld   a, BANK(TileAttr_PhotoGet)                                 ; $603e
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $6040
	ld   de, _SCRN0                                                 ; $6043
	ld   hl, TileAttr_PhotoGet                                      ; $6046
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $6049
	ld   a, $01                                                     ; $604c
	call VBlankEnqueue_SetVramBank                                  ; $604e

	call ProcessScriptsFromCurrLoc                                  ; $6051
	SCR_ResumeNextFrame

; By default, display a 0
	SCR_ExecAsmBelow
	xor  a                                                          ; $6056
	call StoreAddressesOfPhotoNumDigitsInRam                        ; $6057
	call ProcessScriptsFromCurrLoc                                  ; $605a
	SCR_ResumeNextFrame

; Load tile data to $8d00-$97ff
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $605f
	ldh  [rVBK], a                                                  ; $6061
	ld   b, BANK(Gfx_PhotoGet)                                      ; $6063
	ld   hl, Gfx_PhotoGet-$d00                                      ; $6065
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $6068

; Load BG palettes and fade them in from black
	ld   b, BANK(BGPalettes_PhotoGet)                               ; $606b
	ld   hl, BGPalettes_PhotoGet                                    ; $606d
	call SetBGPaletteSrc                                            ; $6070
	ld   a, $20                                                     ; $6073
	ld   [wPaletteFadeAmount], a                                    ; $6075
	ld   a, $01                                                     ; $6078
	ld   [wLoadPalettesFromRam], a                                  ; $607a
	call ProcessScriptsFromCurrLoc                                  ; $607d
	SCR_Call Script_FadeIn

; Over time, loop num up
	SCR_StartSubScript1 PhotoGetSubScript1_DisplayNumIncingToTrainsUnlocked

.loop:
	SCR_ResumeNextFrame
	
; Check buttons
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $6089
	ld   h, a                                                       ; $608b
	ld   a, [wButtonsPressed]                                       ; $608c
	and  PADF_START|PADF_B|PADF_A                                   ; $608f
	jr   z, .cont                                                   ; $6091

; If 1 of the relevant buttons pressed, and displayed <= actual..
	ld   l, NUM_TRAINS_UNLOCKED                                     ; $6093
	ld   a, [hl]                                                    ; $6095
	ld   l, NUM_TRAINS_DISPLAYED                                    ; $6096
	cp   [hl]                                                       ; $6098
	jr   c, .cont                                                   ; $6099

; Sub 1 from trains displayed so that it takes longer to leave this state
	dec  a                                                          ; $609b
	ld   [hl], a                                                    ; $609c

.cont:
	ld   l, NUM_TRAINS_DISPLAYED                                    ; $609d
	ld   a, [hl]                                                    ; $609f
	ld   l, NUM_TRAINS_UNLOCKED                                     ; $60a0
	cp   [hl]                                                       ; $60a2
	jr   nc, .displayedGTEactual                                    ; $60a3

; Stay in loop while displayed num < actual num
	ld   de, .loop                                                  ; $60a5
	jp   ProcessScriptsFromDE                                       ; $60a8

.displayedGTEactual:
; This call adds 1 to displayed, which actually stops it from looping more
	call ProcessScriptsFromCurrLoc                                  ; $60ab
	SCR_StartSubScript1 PhotoGetSubScript1_DisplayNumIncingToTrainsUnlocked
	SCR_ResumeNextFrame
	SCR_StopSubScript1

; --
; -- End
; --
	SCR_SetCounter1 $b4
.loop2:
	SCR_ResumeNextFrame
	
; If no buttons pressed, try to loop
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $60b8
	and  PADF_START|PADF_B|PADF_A                                   ; $60bb
	jr   z, .toLoop2                                                ; $60bd

	jr   .end                                                       ; $60bf

.toLoop2:
; End loop if counter = 0 as well
	call ProcessScriptsFromCurrLoc                                  ; $60c1
	SCR_DecCounter1_JNE .loop2
	SCR_Jump :+

.end:
; Fade out..
	call ProcessScriptsFromCurrLoc                                  ; $60ca
:	SCR_StopSubScript1
	SCR_Call Script_FadeOut
	
; If unlocked 98/100 trains..
	SCR_ExecAsmBelow
	call GetNumTrainsUnlocked                                       ; $60d2
	cp   98                                                         ; $60d5
	jr   nz, .setGameState                                          ; $60d7

; Unlock the last 2 and set a special game state
	call UnlockLast2Trains                                          ; $60d9
	call ProcessScriptsFromCurrLoc                                  ; $60dc
	SCR_StoreByteInAddr wGameState, GS_PICTURE_BOOK_COMPLETE_INIT
	SCR_StopCurrScript
	SCR_ResumeNextFrame

.setGameState:
; If train line done, go to scoring, otherwise continue to route display
	ld   a, [wCompletedTrainLine]                                   ; $60e5
	or   a                                                          ; $60e8
	ld   de, :+                                                     ; $60e9
	jp   nz, ProcessScriptsFromDE                                   ; $60ec

	call ProcessScriptsFromCurrLoc                                  ; $60ef
	SCR_StoreByteInAddr wGameState, GS_ROUTE_DISPLAY_INIT
	SCR_StopCurrScript
	SCR_ResumeNextFrame

:	SCR_StoreByteInAddr wGameState, GS_SCORING_INIT
	SCR_StopCurrScript
	SCR_ResumeNextFrame


PhotoGetSubScript1_DisplayNumIncingToTrainsUnlocked:
.loop:
; Add 1 to displayed num
	SCR_StructByteAddByte NUM_TRAINS_DISPLAYED, $01
	SCR_ExecAsmBelow
	ldh  a, [hCurrScriptStructHighByte]                             ; $6102
	ld   h, a                                                       ; $6104

; Jump if trains displayed >= trains unlocked
	ld   l, NUM_TRAINS_DISPLAYED                                    ; $6105
	ld   a, [hl]                                                    ; $6107
	ld   l, NUM_TRAINS_UNLOCKED                                     ; $6108
	cp   [hl]                                                       ; $610a
	jr   nc, .displayedGTEactual                                    ; $610b

; If less than num trains, display digits, play sound, and loop after delay
	call StoreAddressesOfPhotoNumDigitsInRam                        ; $610d
	call ProcessScriptsFromCurrLoc                                  ; $6110
	SCR_PlaySound SND_06|MAKE_SOUND_EFFECT
	SCR_Delay $14
	SCR_Jump .loop

.displayedGTEactual:
	jr   z, .displayedEQUactual                                     ; $611a

; Do nothing (from +1 below)
	ld   de, .done                                                  ; $611c
	jp   ProcessScriptsFromDE                                       ; $611f

.displayedEQUactual:
; Final display, add 1 again, so that this script does nothing next time, and play sound
	call StoreAddressesOfPhotoNumDigitsInRam                        ; $6122
	call ProcessScriptsFromCurrLoc                                  ; $6125
	SCR_StructByteAddByte NUM_TRAINS_DISPLAYED, $01
	SCR_PlaySound SND_01|MAKE_SOUND_EFFECT

.done:
	SCR_StopSubScript1
	SCR_ResumeNextFrame


; A - photo unlocked
StoreAddressesOfPhotoNumDigitsInRam:
; Get photo unlocked with digits in C
	call BCequAinBCDform                                            ; $612f
	ld   de, 10*2                                                   ; $6132

; A = tens digit of C, if it's 0, use above 10th index in the table (blank tiles)
	ld   a, c                                                       ; $6135
	swap a                                                          ; $6136
	and  $0f                                                        ; $6138
	jr   z, .store10sThenUnits                                      ; $613a

; Else, it is a double index into the table
	add  a                                                          ; $613c
	ld   e, a                                                       ; $613d
	ld   d, $00                                                     ; $613e

.store10sThenUnits:
; Store address for 10s digit in ram
	ld   hl, .sourcesForDigitsAndBlankTiles                         ; $6140
	add  hl, de                                                     ; $6143
	ld   a, [hl+]                                                   ; $6144
	ld   [wPhotoGetPointerToAddrWithLeftDigitTileIdxes], a          ; $6145
	ld   a, [hl]                                                    ; $6148
	ld   [wPhotoGetPointerToAddrWithLeftDigitTileIdxes+1], a        ; $6149

; Get units nybble of C, double indexed into table
	ld   a, c                                                       ; $614c
	and  $0f                                                        ; $614d
	add  a                                                          ; $614f
	ld   e, a                                                       ; $6150
	ld   d, $00                                                     ; $6151
	ld   hl, .sourcesForDigitsAndBlankTiles                         ; $6153
	add  hl, de                                                     ; $6156

; Store address of units digit in ram
	ld   a, [hl+]                                                   ; $6157
	ld   [wPhotoGetPointerToAddrWithRightDigitTileIdxes], a         ; $6158
	ld   a, [hl]                                                    ; $615b
	ld   [wPhotoGetPointerToAddrWithRightDigitTileIdxes+1], a       ; $615c

; Enqueue funcs to update tile map
	ld   b, $03                                                     ; $615f
	ld   hl, .vblankQueueFuncs                                      ; $6161
	jp   PushStackParamsIntoVBlankQueue                             ; $6164

.vblankQueueFuncs:
	dw VBlankQueueFunc_UpdatePhotoGetNumTileMap
	db $00, BANK(VBlankQueueFunc_UpdatePhotoGetNumTileMap)
	dw VBlankQueueFunc_SetRomBank

.sourcesForDigitsAndBlankTiles:
	dw TileMap_PhotoGet0
	dw TileMap_PhotoGet1
	dw TileMap_PhotoGet2
	dw TileMap_PhotoGet3
	dw TileMap_PhotoGet4
	dw TileMap_PhotoGet5
	dw TileMap_PhotoGet6
	dw TileMap_PhotoGet7
	dw TileMap_PhotoGet8
	dw TileMap_PhotoGet9
	dw TileMap_PhotoGetBlank


GameState2f_PicBookCompleteInit_def::
; No - fade
	ld   a, $00                                                     ; $6183
	ld   [wLoadPalettesFromRam], a                                  ; $6185

; Set tile 0 of vram bank 1 to a black tile (bottom bar of image)
	ld   a, $01                                                     ; $6188
	ldh  [rVBK], a                                                  ; $618a
	ld   hl, _VRAM+$1000                                            ; $618c
	xor  a                                                          ; $618f
rept $10
	ld   [hl+], a                                                   ; $6190
endr

; Clear scripts and oam
	call InitScriptStructs                                          ; $61a0
	call ClearScriptsOamHideAllOam                                  ; $61a3

; Stub current display interrupt funcs
	di                                                              ; $61a6
	ld   a, [wVBlankInterruptFunc]                                  ; $61a7
	ld   l, a                                                       ; $61aa
	ld   a, [wVBlankInterruptFunc+1]                                ; $61ab
	ld   h, a                                                       ; $61ae

	ld   a, LOW(StubInterruptFunc)                                  ; $61af
	ld   [wVBlankInterruptFunc], a                                  ; $61b1
	ld   a, HIGH(StubInterruptFunc)                                 ; $61b4
	ld   [wVBlankInterruptFunc+1], a                                ; $61b6

	ld   a, [wLCDCInterruptFunc]                                    ; $61b9
	ld   l, a                                                       ; $61bc
	ld   a, [wLCDCInterruptFunc+1]                                  ; $61bd
	ld   h, a                                                       ; $61c0

	ld   a, LOW(StubInterruptFunc)                                  ; $61c1
	ld   [wLCDCInterruptFunc], a                                    ; $61c3
	ld   a, HIGH(StubInterruptFunc)                                 ; $61c6
	ld   [wLCDCInterruptFunc+1], a                                  ; $61c8

; Turn on LCD, and set main state
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $61cb
	ldh  [rLCDC], a                                                 ; $61cd
	ei                                                              ; $61cf
	M_StartMainScript 0, PicBookCompleteScript

; Have palettes cleared in main func
	ld   hl, wPicBookCompleteMainFunc                               ; $61d9
	ld   a, LOW(PicBookCompleteMainFunc_ClearPalettes)              ; $61dc
	ld   [hl+], a                                                   ; $61de
	ld   [hl], HIGH(PicBookCompleteMainFunc_ClearPalettes)          ; $61df
	ret                                                             ; $61e1


PicBookCompleteScript:
	SCR_StoreByteInAddr wGameState, GS_PICTURE_BOOK_COMPLETE_MAIN

; Set BG + OBJ palettes are black - no fade
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_AllBlack)                                 ; $61e7
	ld   hl, Palettes_AllBlack                                      ; $61e9
	call SetBGPaletteSrc                                            ; $61ec
	xor  a                                                          ; $61ef
	ld   [wPaletteFadeAmount], a                                    ; $61f0
	ld   [wLoadPalettesFromRam], a                                  ; $61f3
	ld   a, $01                                                     ; $61f6
	ld   [wLoadBGPalettesFromRom], a                                ; $61f8

	ld   b, BANK(Palettes_AllBlack)                                 ; $61fb
	ld   hl, Palettes_AllBlack                                      ; $61fd
	call SetOBJPaletteSrc                                           ; $6200
	xor  a                                                          ; $6203
	ld   [wPaletteFadeAmount], a                                    ; $6204
	ld   [wLoadPalettesFromRam], a                                  ; $6207
	ld   a, $01                                                     ; $620a
	ld   [wLoadOBJPalettesFromRom], a                               ; $620c

	call ProcessScriptsFromCurrLoc                                  ; $620f
	SCR_ResumeNextFrame

; Load tile map
	SCR_ExecAsmBelow
	ld   a, BANK(TileMap_PicBookComplete)                           ; $6214
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $6216
	ld   de, _SCRN0                                                 ; $6219
	ld   hl, TileMap_PicBookComplete                                ; $621c
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $621f
	xor  a                                                          ; $6222
	call VBlankEnqueue_SetVramBank                                  ; $6223

	call ProcessScriptsFromCurrLoc                                  ; $6226
	SCR_ResumeNextFrame
	
; Load tile attr
	SCR_ExecAsmBelow
	ld   a, BANK(TileAttr_PicBookComplete)                          ; $622b
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $622d
	ld   de, _SCRN0                                                 ; $6230
	ld   hl, TileAttr_PicBookComplete                               ; $6233
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $6236
	ld   a, $01                                                     ; $6239
	call VBlankEnqueue_SetVramBank                                  ; $623b

	call ProcessScriptsFromCurrLoc                                  ; $623e
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow

; Set new vblank interrupt func
	ld   a, [wVBlankInterruptFunc]                                  ; $6243
	ld   l, a                                                       ; $6246
	ld   a, [wVBlankInterruptFunc+1]                                ; $6247
	ld   h, a                                                       ; $624a
	ld   a, LOW(VBlankInterruptFunc_PicBookCompleteTileData1)       ; $624b
	ld   [wVBlankInterruptFunc], a                                  ; $624d
	ld   a, HIGH(VBlankInterruptFunc_PicBookCompleteTileData1)      ; $6250
	ld   [wVBlankInterruptFunc+1], a                                ; $6252

	call ProcessScriptsFromCurrLoc                                  ; $6255
	SCR_Delay $03
	
; Have main func prep and execute application of hi-col palettes
	SCR_ExecAsmBelow
	ld   hl, wPicBookCompleteMainFunc                               ; $625b
	ld   a, LOW(PicBookCompleteMainFunc_ApplyHiColPalettes)         ; $625e
	ld   [hl+], a                                                   ; $6260
	ld   [hl], HIGH(PicBookCompleteMainFunc_ApplyHiColPalettes)     ; $6261
	call ProcessScriptsFromCurrLoc                                  ; $6263

.mainLoop:
; Execute the main loop until A is pressed
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $6268
	bit  PADB_A, a                                                  ; $626b
	jr   nz, .aPressed                                              ; $626d

	ld   de, .mainLoop                                              ; $626f
	jp   ProcessScriptsFromDE                                       ; $6272

.aPressed:
; Clear palettes in main loop
	ld   hl, wPicBookCompleteMainFunc                               ; $6275
	ld   a, LOW(PicBookCompleteMainFunc_ClearPalettes)              ; $6278
	ld   [hl+], a                                                   ; $627a
	ld   [hl], HIGH(PicBookCompleteMainFunc_ClearPalettes)          ; $627b

; Set BG + OBJ palettes - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $627d
	ld   hl, Palettes_AllBlack                                      ; $627f
	call SetBGPaletteSrc                                            ; $6282
	xor  a                                                          ; $6285
	ld   [wPaletteFadeAmount], a                                    ; $6286
	ld   [wLoadPalettesFromRam], a                                  ; $6289

	ld   a, $01                                                     ; $628c
	ld   [wLoadBGPalettesFromRom], a                                ; $628e
	ld   b, BANK(Palettes_AllBlack)                                 ; $6291
	ld   hl, Palettes_AllBlack                                      ; $6293
	call SetOBJPaletteSrc                                           ; $6296
	xor  a                                                          ; $6299
	ld   [wPaletteFadeAmount], a                                    ; $629a
	ld   [wLoadPalettesFromRam], a                                  ; $629d
	ld   a, $01                                                     ; $62a0
	ld   [wLoadOBJPalettesFromRom], a                               ; $62a2

	call ProcessScriptsFromCurrLoc                                  ; $62a5
	SCR_ResumeNextFrame

; If completed the train line, go to scoring, else go to the route display state
	SCR_ExecAsmBelow
	ld   a, [wCompletedTrainLine]                                   ; $62aa
	or   a                                                          ; $62ad
	ld   de, .completedTrainLine                                    ; $62ae
	jp   nz, ProcessScriptsFromDE                                   ; $62b1

	call ProcessScriptsFromCurrLoc                                  ; $62b4
	SCR_StoreByteInAddr wGameState, GS_ROUTE_DISPLAY_INIT
	SCR_StopCurrScript
	SCR_ResumeNextFrame

.completedTrainLine:
	SCR_StoreByteInAddr wGameState, GS_SCORING_INIT
	SCR_StopCurrScript
	SCR_ResumeNextFrame


GameState31_CongratsInit_def::
; No fade, clear scripts and oam
	ld   a, $00                                                     ; $62c3
	ld   [wLoadPalettesFromRam], a                                  ; $62c5
	call InitScriptStructs                                          ; $62c8
	call ClearScriptsOamHideAllOam                                  ; $62cb

; Turn on LCD and start script
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $62ce
	ldh  [rLCDC], a                                                 ; $62d0
	M_StartMainScript 0, CongratsScript

; Set initial frame SCY - where we start displaying graphics
	ld   a, $64                                                     ; $62db
	ld   [wCongratsFrameSCY], a                                     ; $62dd

GameState32_CongratsMain_def::
; Copy base frame scy for multiple frame lcdc funcs to use, if non-0
	ld   a, [wCongratsFrameSCY]                                     ; $62e0
	ld   [wCongratsSCY], a                                          ; $62e3
	or   a                                                          ; $62e6
	jr   z, .end                                                    ; $62e7

; Set up lcdc func to drop the congrats text in
	di                                                              ; $62e9
	ld   a, [wLCDCInterruptFunc]                                    ; $62ea
	ld   l, a                                                       ; $62ed
	ld   a, [wLCDCInterruptFunc+1]                                  ; $62ee
	ld   h, a                                                       ; $62f1
	ld   a, LOW(LCDCInterruptFunc_Congrats)                         ; $62f2
	ld   [wLCDCInterruptFunc], a                                    ; $62f4
	ld   a, HIGH(LCDCInterruptFunc_Congrats)                        ; $62f7
	ld   [wLCDCInterruptFunc+1], a                                  ; $62f9

; Allow vblank and lcdc interrupts, lcdc triggers on lyc
	xor  a                                                          ; $62fc
	ldh  [rIF], a                                                   ; $62fd
	ld   a, IEF_LCDC|IEF_VBLANK                                     ; $62ff
	ldh  [rIE], a                                                   ; $6301
	ld   a, $00                                                     ; $6303
	ldh  [rLYC], a                                                  ; $6305
	ld   a, STATF_LYC                                               ; $6307
	ldh  [rSTAT], a                                                 ; $6309
	ei                                                              ; $630b

.end:
	jp   ResetVBlankQueueData                                       ; $630c


CongratsScript:
; Set main vblank queue-enabled state
	SCR_StoreByteInAddr wGameState, GS_CONGRATS_MAIN
	SCR_ExecAsmBelow

; Load all black palettes to BG and OBJ - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $6314
	ld   hl, Palettes_AllBlack                                      ; $6316
	call SetBGPaletteSrc                                            ; $6319
	xor  a                                                          ; $631c
	ld   [wPaletteFadeAmount], a                                    ; $631d
	ld   [wLoadPalettesFromRam], a                                  ; $6320
	ld   a, $01                                                     ; $6323
	ld   [wLoadBGPalettesFromRom], a                                ; $6325

	ld   b, BANK(Palettes_AllBlack)                                 ; $6328
	ld   hl, Palettes_AllBlack                                      ; $632a
	call SetOBJPaletteSrc                                           ; $632d
	xor  a                                                          ; $6330
	ld   [wPaletteFadeAmount], a                                    ; $6331
	ld   [wLoadPalettesFromRam], a                                  ; $6334
	ld   a, $01                                                     ; $6337
	ld   [wLoadOBJPalettesFromRom], a                               ; $6339

	call ProcessScriptsFromCurrLoc                                  ; $633c
	SCR_ResumeNextFrame

; Load tile map
	SCR_ExecAsmBelow
	ld   a, BANK(TileMap_Congrats)                                  ; $6341
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $6343
	ld   de, _SCRN0                                                 ; $6346
	ld   hl, TileMap_Congrats                                       ; $6349
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $634c
	xor  a                                                          ; $634f
	call VBlankEnqueue_SetVramBank                                  ; $6350
	call ProcessScriptsFromCurrLoc                                  ; $6353
	SCR_ResumeNextFrame
	
; Load tile attr
	SCR_ExecAsmBelow
	ld   a, BANK(TileAttr_Congrats)                                 ; $6358
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $635a
	ld   de, _SCRN0                                                 ; $635d
	ld   hl, TileAttr_Congrats                                      ; $6360
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $6363
	ld   a, $01                                                     ; $6366
	call VBlankEnqueue_SetVramBank                                  ; $6368
	call ProcessScriptsFromCurrLoc                                  ; $636b
	SCR_ResumeNextFrame
	
; Load tile data to bank 0 ($8800-$97ff, unused here), then bank 1
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $6370
	ldh  [rVBK], a                                                  ; $6372
	ld   b, BANK(Gfx_StageCompleteMainBG)                           ; $6374
	ld   hl, Gfx_StageCompleteMainBG-$800                           ; $6376
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $6379

	ld   a, $01                                                     ; $637c
	ldh  [rVBK], a                                                  ; $637e
	ld   b, BANK(Gfx_StageCompleteCongrats)                         ; $6380
	ld   hl, Gfx_StageCompleteCongrats                              ; $6382
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $6385

; Load BG and OBJ palettes - no fade
	ld   b, BANK(Palettes_Congrats)                                 ; $6388
	ld   hl, Palettes_Congrats                                      ; $638a
	call SetBGPaletteSrc                                            ; $638d
	xor  a                                                          ; $6390
	ld   [wPaletteFadeAmount], a                                    ; $6391
	ld   [wLoadPalettesFromRam], a                                  ; $6394
	ld   a, $01                                                     ; $6397
	ld   [wLoadBGPalettesFromRom], a                                ; $6399

	ld   b, BANK(Palettes_Congrats)                                 ; $639c
	ld   hl, Palettes_Congrats                                      ; $639e
	call SetOBJPaletteSrc                                           ; $63a1
	xor  a                                                          ; $63a4
	ld   [wPaletteFadeAmount], a                                    ; $63a5
	ld   [wLoadPalettesFromRam], a                                  ; $63a8
	ld   a, $01                                                     ; $63ab
	ld   [wLoadOBJPalettesFromRom], a                               ; $63ad

; Call to handle SCY effect, then color the text red, left to right
	call ProcessScriptsFromCurrLoc                                  ; $63b0
	SCR_ResumeNextFrame
	SCR_Call CongratsScript_HandleMoveBaseFrameSCYUp
	SCR_Call CongratsScript_ColorText
	
; Fade out BG and OBJ
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $63bb
	ld   [wPaletteFadeAmount], a                                    ; $63bd
	ld   a, $01                                                     ; $63c0
	ld   [wLoadPalettesFromRam], a                                  ; $63c2

	ld   b, BANK(Palettes_CongratsFadeOut)                          ; $63c5
	ld   hl, Palettes_CongratsFadeOut                               ; $63c7
	call SetBGPaletteSrc                                            ; $63ca
	ld   a, $20                                                     ; $63cd
	ld   [wPaletteFadeAmount], a                                    ; $63cf
	ld   a, $01                                                     ; $63d2
	ld   [wLoadPalettesFromRam], a                                  ; $63d4

	ld   b, BANK(Palettes_CongratsFadeOut)                          ; $63d7
	ld   hl, Palettes_CongratsFadeOut                               ; $63d9
	call SetOBJPaletteSrc                                           ; $63dc
	ld   a, $20                                                     ; $63df
	ld   [wPaletteFadeAmount], a                                    ; $63e1
	ld   a, $01                                                     ; $63e4
	ld   [wLoadPalettesFromRam], a                                  ; $63e6

	ld   a, $ff                                                     ; $63e9
	ld   [wBitsSetPerOBJPaletteFade], a                             ; $63eb
	ld   [wBitsSetPerBGPaletteFade], a                              ; $63ee
	call ProcessScriptsFromCurrLoc                                  ; $63f1
	SCR_Call Script_FadeOut
	SCR_Delay $3c

; Set next state based on if we came from picture book
	SCR_ExecAsmBelow
	ld   b, GS_CREDITS_INIT                                         ; $63fa
	ld   a, [wPictureBookPrevScreen]                                ; $63fc
	cp   $02                                                        ; $63ff
	jr   nz, :+                                                     ; $6401
	ld   b, GS_PICTURE_BOOK_INIT                                    ; $6403
:	ld   a, b                                                       ; $6405
	ld   [wGameState], a                                            ; $6406
	call ProcessScriptsFromCurrLoc                                  ; $6409
	SCR_StopCurrScript
	SCR_ResumeNextFrame


CongratsScript_HandleMoveBaseFrameSCYUp:
	SCR_StoreByteInAddr wCongratsFrameSCY, $58
	SCR_SetCounter1 $20
:	SCR_Delay $02
	SCR_ValInAddrPlusEquByte wCongratsFrameSCY, -1
	SCR_DecCounter1_JNE :-

; Once loops are done, set SCY to 0, to stop lcdc
	SCR_StoreByteInAddr wCongratsFrameSCY, $00
	SCR_Ret


CongratsScript_ColorText:
; These sprites color the text red from left to right
	SCR_SetSpriteXY $38, $30
	SCR_FarSetSpriteSrc SpriteOam_Congrats1
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats2
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats3
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats4
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats5
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats6
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats7
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats8
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats9
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats10
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats11
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats12
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats13
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats14
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats15
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats16
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_Congrats17
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_CongratsLast
	SCR_Delay $05
	SCR_FarSetSpriteSrc SpriteOam_CongratsLast
	SCR_Delay $05
	
; Enqueue palette changes
	SCR_ExecAsmBelow
	ld   hl, VBlankQueueFuncs_CongratsPalettes2                     ; $6498
	call VBlankEnqueue_CongratsPaletteUpdate                        ; $649b
	call ProcessScriptsFromCurrLoc                                  ; $649e
	SCR_Delay $05

	SCR_ExecAsmBelow
	ld   hl, VBlankQueueFuncs_CongratsPalettes3                     ; $64a4
	call VBlankEnqueue_CongratsPaletteUpdate                        ; $64a7
	call ProcessScriptsFromCurrLoc                                  ; $64aa
	SCR_Delay $06
	SCR_Ret


VBlankEnqueue_CongratsPaletteUpdate:
	ld   b, $03                                                     ; $64b0
	jp   PushStackParamsIntoVBlankQueue                             ; $64b2


; unused - $64b5:
	dw VBlankQueueFunc_CongratsUpdatePalettes1
	db $00, BANK(VBlankQueueFunc_CongratsUpdatePalettes1)
	dw VBlankQueueFunc_SetRomBank


VBlankQueueFuncs_CongratsPalettes2:
	dw VBlankQueueFunc_CongratsUpdatePalettes2
	db $00, BANK(VBlankQueueFunc_CongratsUpdatePalettes2)
	dw VBlankQueueFunc_SetRomBank
	
	
VBlankQueueFuncs_CongratsPalettes3:
	dw VBlankQueueFunc_CongratsUpdatePalettes3
	db $00, BANK(VBlankQueueFunc_CongratsUpdatePalettes3)
	dw VBlankQueueFunc_SetRomBank
