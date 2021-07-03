INCLUDE "includes.s"

SECTION "ROM Bank $008", ROMX[$4000], BANK[$8]

VBlankInterruptFunc_Scoring_def::
; For hundreds, HL = quad index into table
	ld   a, $00                                                     ; $4000
	ldh  [rVBK], a                                                  ; $4002
	ld   a, [wScoringHundredsDigit]                                 ; $4004
	add  a                                                          ; $4007
	add  a                                                          ; $4008
	ld   hl, .scoringDigitsMetatileTiles                            ; $4009
	ld   e, a                                                       ; $400c
	ld   d, $00                                                     ; $400d
	add  hl, de                                                     ; $400f

; Copy 2 tiles, go to bottom left, copy last 2 tiles
	ld   de, _SCRN0+$1eb                                            ; $4010
	ld   a, [hl+]                                                   ; $4013
	ld   [de], a                                                    ; $4014
	inc  de                                                         ; $4015
	ld   a, [hl+]                                                   ; $4016
	ld   [de], a                                                    ; $4017

	DEplusEquImm (GB_TILE_WIDTH-1)

	ld   a, [hl+]                                                   ; $4020
	ld   [de], a                                                    ; $4021
	inc  de                                                         ; $4022
	ld   a, [hl+]                                                   ; $4023
	ld   [de], a                                                    ; $4024

; Repeat for tens
	ld   a, [wScoringTensDigit]                                     ; $4025
	add  a                                                          ; $4028
	add  a                                                          ; $4029
	ld   hl, .scoringDigitsMetatileTiles                            ; $402a
	ld   e, a                                                       ; $402d
	ld   d, $00                                                     ; $402e
	add  hl, de                                                     ; $4030

	ld   de, _SCRN0+$1ed                                            ; $4031
	ld   a, [hl+]                                                   ; $4034
	ld   [de], a                                                    ; $4035
	inc  de                                                         ; $4036
	ld   a, [hl+]                                                   ; $4037
	ld   [de], a                                                    ; $4038
	
	DEplusEquImm (GB_TILE_WIDTH-1)
	
	ld   a, [hl+]                                                   ; $4041
	ld   [de], a                                                    ; $4042
	inc  de                                                         ; $4043
	ld   a, [hl+]                                                   ; $4044
	ld   [de], a                                                    ; $4045

; Repeat for units
	ld   a, [wScoringUnitsDigit]                                    ; $4046
	add  a                                                          ; $4049
	add  a                                                          ; $404a
	ld   hl, .scoringDigitsMetatileTiles                            ; $404b
	ld   e, a                                                       ; $404e
	ld   d, $00                                                     ; $404f
	add  hl, de                                                     ; $4051

	ld   de, _SCRN0+$1ef                                            ; $4052
	ld   a, [hl+]                                                   ; $4055
	ld   [de], a                                                    ; $4056
	inc  de                                                         ; $4057
	ld   a, [hl+]                                                   ; $4058
	ld   [de], a                                                    ; $4059
	
	DEplusEquImm (GB_TILE_WIDTH-1)
	
	ld   a, [hl+]                                                   ; $4062
	ld   [de], a                                                    ; $4063
	inc  de                                                         ; $4064
	ld   a, [hl+]                                                   ; $4065
	ld   [de], a                                                    ; $4066
	ret                                                             ; $4067

.scoringDigitsMetatileTiles:
	db $80, $82, $81, $83
	db $84, $86, $85, $87
	db $88, $8a, $89, $8b
	db $8c, $8e, $8d, $8f
	db $90, $92, $91, $93
	db $94, $96, $95, $97
	db $98, $9a, $99, $9b
	db $9c, $9e, $9d, $9f
	db $a0, $a2, $a1, $a3
	db $a4, $a6, $a5, $a7
	db $a8, $a8, $a8, $a8


LocationDoneScript::
; Get penalties from distance and time
	SCR_ExecAsmBelow
	call CalculateBaseStopPosPenalty                                ; $4095
	call GetDiffOfCurrAndDestTimeMaxFFh                             ; $4098

; HL = 5 * trainline idx into table
	ld   a, [wSelectedTrainLine]                                    ; $409b
	ld   b, a                                                       ; $409e
	add  a                                                          ; $409f
	add  a                                                          ; $40a0
	add  b                                                          ; $40a1
	ld   c, a                                                       ; $40a2
	ld   b, $00                                                     ; $40a3
	ld   hl, LocationDoneTrainsTileMapAndAttrSrces                  ; $40a5
	add  hl, bc                                                     ; $40a8

; Get train's tile map and attr source details
	ld   a, [hl+]                                                   ; $40a9
	ld   [wLocationDoneTileMapAttrSrcBank], a                       ; $40aa
	ld   a, [hl+]                                                   ; $40ad
	ld   [wLocationDoneTileMapSrcAddr], a                           ; $40ae
	ld   a, [hl+]                                                   ; $40b1
	ld   [wLocationDoneTileMapSrcAddr+1], a                         ; $40b2
	ld   a, [hl+]                                                   ; $40b5
	ld   [wLocationDoneTileAttrSrcAddr], a                          ; $40b6
	ld   a, [hl]                                                    ; $40b9
	ld   [wLocationDoneTileAttrSrcAddr+1], a                        ; $40ba

; Subscript auto-updates train, other scripts change penalties value and scx
	call ProcessScriptsFromCurrLoc                                  ; $40bd
	SCR_StartSubScript1 LocationDoneSubScript1_Display2TrainColumnsFromScroll
	SCR_CreateOtherScript 1, LocationDoneOtherScript1_CurrPenalties
	SCR_CreateOtherScript 2, LocationDoneOtherScript2_HandleSCX
	SCR_ResumeNextFrame

; Display some train tiles already, and display static sprites
	SCR_CallWithSingleUseRet LocationDoneScript_DisplayTrainColumnsLeftOfSCX
	SCR_SetSpriteXY $38, $30
	SCR_FarSetSpriteSrc SpriteOam_LocationDoneVerticalLineAndKanji
	
; If distance from station is poor, have next continue text display it
	SCR_ExecAsmBelow
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $40da
	ld   l, a                                                       ; $40dd
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $40de
	ld   h, a                                                       ; $40e1
	call IfApplicableSetContinuTextToProtectStation                 ; $40e2

; Reset total deductions
	ld   a, $00                                                     ; $40e5
	ld   [wTotalTrainLineLocationDeductions], a                     ; $40e7
	ld   a, $00                                                     ; $40ea
	ld   [wTotalTrainLineLocationDeductions+1], a                   ; $40ec

; Load sprite tile data
	ld   a, $00                                                     ; $40ef
	ldh  [rVBK], a                                                  ; $40f1
	ld   hl, Gfx_LocationDoneSprites                                ; $40f3
	ld   de, _VRAM                                                  ; $40f6
	ld   b, (Gfx_LocationDoneSprites.end-Gfx_LocationDoneSprites)/$10-1 ; $40f9
	ld   c, BANK(Gfx_LocationDoneSprites)                           ; $40fb
	call StartFarHDMATransfer                                       ; $40fd

; Branch based on if train line 0
; Loads tile data for score category texts
; Train line 0 doesn't consider emergency brakes
	ld   a, [wSelectedTrainLine]                                    ; $4100
	or   a                                                          ; $4103
	jr   z, .trainLine0                                             ; $4104

	ld   hl, Gfx_LocationDoneBGNonTrainLine0                        ; $4106
	ld   de, _VRAM+$700                                             ; $4109
	ld   b, (Gfx_LocationDoneBGNonTrainLine0.end-Gfx_LocationDoneBGNonTrainLine0)/$10-1 ; $410c
	ld   c, BANK(Gfx_LocationDoneBGNonTrainLine0)                   ; $410e
	call StartFarHDMATransfer                                       ; $4110
	jr   :+                                                         ; $4113

.trainLine0:
	ld   hl, Gfx_LocationDoneBGTrainLine0                           ; $4115
	ld   de, _VRAM+$700                                             ; $4118
	ld   b, (Gfx_LocationDoneBGTrainLine0.end-Gfx_LocationDoneBGTrainLine0)/$10-1 ; $411b
	ld   c, BANK(Gfx_LocationDoneBGTrainLine0)                      ; $411d
	call StartFarHDMATransfer                                       ; $411f

; Load other tile data and palettes
:	call ProcessScriptsFromCurrLoc                                  ; $4122
	SCR_CallTableIdxInAddr TileDataAndPalettesForTrainLine, wSelectedTrainLine

; Fade in, then display 1st 2 possible deductions
	SCR_Call Script_FadeIn
	SCR_Delay $3c
	SCR_CreateOtherScript 3, LocationDoneOtherScript3_StopPosAccelerateScore
	SCR_PlaySound SND_08|MAKE_SOUND_EFFECT
	SCR_Delay $3c
	SCR_CreateOtherScript 4, LocationDoneOtherScript4_StationStructureScore
	SCR_PlaySound SND_08|MAKE_SOUND_EFFECT
	SCR_Delay $3c
	
; Branch based on if train line 0
	SCR_ExecAsmBelow
	ld   a, [wSelectedTrainLine]                                    ; $4142
	or   a                                                          ; $4145
	ld   de, :+                                                     ; $4146
	jp   z, ProcessScriptsFromDE                                    ; $4149

; Non-trainline 0 considers extreme braking
	call ProcessScriptsFromCurrLoc                                  ; $414c
	SCR_CreateOtherScript 5, LocationDoneOtherScript5_ExtremeBrakingScore
	SCR_PlaySound SND_08|MAKE_SOUND_EFFECT
	SCR_Delay $3c

:	SCR_CreateOtherScript 6, LocationDoneOtherScript6_TotalDeductions
	SCR_PlaySound SND_08|MAKE_SOUND_EFFECT
	SCR_Delay $3c

; BC = total deductions
	SCR_ExecAsmBelow
	ld   a, [wTotalTrainLineLocationDeductions]                     ; $4162
	ld   c, a                                                       ; $4165
	ld   a, [wTotalTrainLineLocationDeductions+1]                   ; $4166
	ld   b, a                                                       ; $4169

; HL = penalties allowed
	ld   a, [wPenaltiesAllowed]                                     ; $416a
	ld   l, a                                                       ; $416d
	ld   h, $00                                                     ; $416e

; Do penalties allowed - total deductions
	ld   a, l                                                       ; $4170
	sub  c                                                          ; $4171
	ld   l, a                                                       ; $4172
	ld   a, h                                                       ; $4173
	sbc  b                                                          ; $4174
	jr   nc, :+                                                     ; $4175

; Store subtraction with a minimum of 0
	ld   l, $00                                                     ; $4177
:	ld   a, l                                                       ; $4179
	ld   [wLocationDonePenaltiesMinusTotalDeductions], a            ; $417a
	call ProcessScriptsFromCurrLoc                                  ; $417d

.deductFromPenaltiesLoop:
	SCR_Delay $04
	
; While penalties displayed != penalties - deductions..
	SCR_ExecAsmBelow
	ld   a, [wLocationDonePenaltiesMinusTotalDeductions]            ; $4183
	ld   b, a                                                       ; $4186
	ld   a, [wPenaltiesAllowed]                                     ; $4187
	cp   b                                                          ; $418a
	ld   de, .afterPenaltiesDeduction                               ; $418b
	jp   z, ProcessScriptsFromDE                                    ; $418e

; Dec every frame and play sound
	dec  a                                                          ; $4191
	ld   [wPenaltiesAllowed], a                                     ; $4192
	push af                                                         ; $4195
	ld   a, SND_09                                                  ; $4196
	or   MAKE_SOUND_EFFECT                                          ; $4198
	call PlaySound                                                  ; $419a
	pop  af                                                         ; $419d
	ld   de, .deductFromPenaltiesLoop                               ; $419e
	jp   ProcessScriptsFromDE                                       ; $41a1

.afterPenaltiesDeduction:
	SCR_Delay $3c
	
; Jump if we weren't approaching the next station to stop at
	SCR_ExecAsmBelow
	ld   a, [wApproachingNextStationToStopAt]                       ; $41a7
	or   a                                                          ; $41aa
	jr   z, :+                                                      ; $41ab

; Jump if trainline completed
:	ld   a, [wCompletedTrainLine]                                   ; $41ad
	or   a                                                          ; $41b0
	ld   de, .completedTrainLine                                    ; $41b1
	jp   nz, ProcessScriptsFromDE                                   ; $41b4

; Jump if penalties > 0
	ld   a, [wPenaltiesAllowed]                                     ; $41b7
	or   a                                                          ; $41ba
	ld   de, .stillHavePenaltiesAllowed                             ; $41bb
	jp   nz, ProcessScriptsFromDE                                   ; $41be

; Set bit 4 of this var, so continue text will display a timeout
	ld   a, [wContinueScreenHighNybSetForTimeOutTextLowNybIsBottomTextMinus1] ; $41c1
	or   $10                                                        ; $41c4
	ld   [wContinueScreenHighNybSetForTimeOutTextLowNybIsBottomTextMinus1], a ; $41c6

; Fade out and go to the continue screen
	call ProcessScriptsFromCurrLoc                                  ; $41c9
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wGameState, GS_CONTINUE_SCREEN_INIT
	SCR_StopCurrScript

.stillHavePenaltiesAllowed:
; If in good distance, set complete and unlock train
	SCR_Call Script_FadeOut
	SCR_ExecAsmBelow
	call SetTrainLineCompleteAndUnlockTrainIfApplicable             ; $41d8

; In in good time, for next stage, allow starting with better custom restrictions
	call Trampoline_UpdateCustomRestrictions                        ; $41db

; If any trains unlocked, go to photo get state
	ld   a, [wNumTrainsUnlockedSinceDeparture]                      ; $41de
	ld   [wNumTrainsUnlockedForPhotoGet], a                         ; $41e1
	or   a                                                          ; $41e4
	ld   de, .goToPhotoGet                                          ; $41e5
	jp   nz, ProcessScriptsFromDE                                   ; $41e8

; We've seen this screen so reset this var, then go to route display
	call ProcessScriptsFromCurrLoc                                  ; $41eb
	SCR_StoreByteInAddr wStartedJourneyWithoutSeeingLocationDone, $00
	SCR_StoreByteInAddr wGameState, GS_ROUTE_DISPLAY_INIT
	SCR_StopCurrScript

.completedTrainLine:
; Fade out and set train line complete if applicable
	SCR_Call Script_FadeOut
	SCR_ExecAsmBelow
	call SetTrainLineCompleteAndUnlockTrainIfApplicable             ; $41fb

; Go to photo get state if any trains unlocked
	ld   a, [wNumTrainsUnlockedSinceDeparture]                      ; $41fe
	ld   [wNumTrainsUnlockedForPhotoGet], a                         ; $4201
	or   a                                                          ; $4204
	ld   de, .goToPhotoGet                                          ; $4205
	jp   nz, ProcessScriptsFromDE                                   ; $4208

; We've seen this screen so reset this var, then go to scoring
	call ProcessScriptsFromCurrLoc                                  ; $420b
	SCR_StoreByteInAddr wStartedJourneyWithoutSeeingLocationDone, $00
	SCR_StoreByteInAddr wGameState, GS_SCORING_INIT
	SCR_StopCurrScript

.goToPhotoGet:
; Reset these 2 streak vars
	SCR_StoreByteInAddr wNumTrainsUnlockedSinceDeparture, $00
	SCR_StoreByteInAddr wStartedJourneyWithoutSeeingLocationDone, $00
	SCR_StoreByteInAddr wGameState, GS_PHOTO_GET_INIT
	SCR_StopCurrScript


TileDataAndPalettesForTrainLine:
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
.trainLine3:
; Load BG + OBJ palettes for each trainline - to fade in from black
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_LocationDoneTrainLine0and3)               ; $423b
	ld   hl, Palettes_LocationDoneTrainLine0and3                    ; $423d
	call SetBGPaletteSrc                                            ; $4240
	ld   a, $20                                                     ; $4243
	ld   [wPaletteFadeAmount], a                                    ; $4245
	ld   a, $01                                                     ; $4248
	ld   [wLoadPalettesFromRam], a                                  ; $424a

	ld   b, BANK(Palettes_LocationDoneTrainLine0and3)               ; $424d
	ld   hl, Palettes_LocationDoneTrainLine0and3                    ; $424f
	call SetOBJPaletteSrc                                           ; $4252
	ld   a, $20                                                     ; $4255
	ld   [wPaletteFadeAmount], a                                    ; $4257
	ld   a, $01                                                     ; $425a
	ld   [wLoadPalettesFromRam], a                                  ; $425c

; Also load 2 sections of tile data
	ld   hl, Gfx_LocationDoneTrainLine0And3                         ; $425f
	ld   c, BANK(Gfx_LocationDoneTrainLine0And3)                    ; $4262
	jp   .trainLineCont                                             ; $4264

.trainLine1:
.trainLine4:
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_LocationDoneTrainLine1and4)               ; $4268
	ld   hl, Palettes_LocationDoneTrainLine1and4                    ; $426a
	call SetBGPaletteSrc                                            ; $426d
	ld   a, $20                                                     ; $4270
	ld   [wPaletteFadeAmount], a                                    ; $4272
	ld   a, $01                                                     ; $4275
	ld   [wLoadPalettesFromRam], a                                  ; $4277

	ld   b, BANK(Palettes_LocationDoneTrainLine1and4)               ; $427a
	ld   hl, Palettes_LocationDoneTrainLine1and4                    ; $427c
	call SetOBJPaletteSrc                                           ; $427f
	ld   a, $20                                                     ; $4282
	ld   [wPaletteFadeAmount], a                                    ; $4284
	ld   a, $01                                                     ; $4287
	ld   [wLoadPalettesFromRam], a                                  ; $4289

	ld   hl, Gfx_LocationDoneTrainLine1And4                         ; $428c
	ld   c, BANK(Gfx_LocationDoneTrainLine1And4)                    ; $428f
	jp   .trainLineCont                                             ; $4291

.trainLine2:
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_LocationDoneTrainLine2)                   ; $4295
	ld   hl, Palettes_LocationDoneTrainLine2                        ; $4297
	call SetBGPaletteSrc                                            ; $429a
	ld   a, $20                                                     ; $429d
	ld   [wPaletteFadeAmount], a                                    ; $429f
	ld   a, $01                                                     ; $42a2
	ld   [wLoadPalettesFromRam], a                                  ; $42a4

	ld   b, BANK(Palettes_LocationDoneTrainLine2)                   ; $42a7
	ld   hl, Palettes_LocationDoneTrainLine2                        ; $42a9
	call SetOBJPaletteSrc                                           ; $42ac
	ld   a, $20                                                     ; $42af
	ld   [wPaletteFadeAmount], a                                    ; $42b1
	ld   a, $01                                                     ; $42b4
	ld   [wLoadPalettesFromRam], a                                  ; $42b6

	ld   hl, Gfx_LocationDoneTrainLine2                             ; $42b9
	ld   c, BANK(Gfx_LocationDoneTrainLine2)                        ; $42bc
	jp   .trainLineCont                                             ; $42be

.trainLine5:
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_LocationDoneTrainLine5)                   ; $42c2
	ld   hl, Palettes_LocationDoneTrainLine5                        ; $42c4
	call SetBGPaletteSrc                                            ; $42c7
	ld   a, $20                                                     ; $42ca
	ld   [wPaletteFadeAmount], a                                    ; $42cc
	ld   a, $01                                                     ; $42cf
	ld   [wLoadPalettesFromRam], a                                  ; $42d1

	ld   b, BANK(Palettes_LocationDoneTrainLine5)                   ; $42d4
	ld   hl, Palettes_LocationDoneTrainLine5                        ; $42d6
	call SetOBJPaletteSrc                                           ; $42d9
	ld   a, $20                                                     ; $42dc
	ld   [wPaletteFadeAmount], a                                    ; $42de
	ld   a, $01                                                     ; $42e1
	ld   [wLoadPalettesFromRam], a                                  ; $42e3

	ld   hl, Gfx_LocationDoneTrainLine5                             ; $42e6
	ld   c, BANK(Gfx_LocationDoneTrainLine5)                        ; $42e9
	jp   .trainLineCont                                             ; $42eb

.trainLine6:
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_LocationDoneTrainLine6)                   ; $42ef
	ld   hl, Palettes_LocationDoneTrainLine6                        ; $42f1
	call SetBGPaletteSrc                                            ; $42f4
	ld   a, $20                                                     ; $42f7
	ld   [wPaletteFadeAmount], a                                    ; $42f9
	ld   a, $01                                                     ; $42fc
	ld   [wLoadPalettesFromRam], a                                  ; $42fe

	ld   b, BANK(Palettes_LocationDoneTrainLine6)                   ; $4301
	ld   hl, Palettes_LocationDoneTrainLine6                        ; $4303
	call SetOBJPaletteSrc                                           ; $4306
	ld   a, $20                                                     ; $4309
	ld   [wPaletteFadeAmount], a                                    ; $430b
	ld   a, $01                                                     ; $430e
	ld   [wLoadPalettesFromRam], a                                  ; $4310

	ld   hl, Gfx_LocationDoneTrainLine6                             ; $4313
	ld   c, BANK(Gfx_LocationDoneTrainLine6)                        ; $4316
	jp   .trainLineCont                                             ; $4318

.trainLine7:
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_LocationDoneTrainLine7)                   ; $431c
	ld   hl, Palettes_LocationDoneTrainLine7                        ; $431e
	call SetBGPaletteSrc                                            ; $4321
	ld   a, $20                                                     ; $4324
	ld   [wPaletteFadeAmount], a                                    ; $4326
	ld   a, $01                                                     ; $4329
	ld   [wLoadPalettesFromRam], a                                  ; $432b

	ld   b, BANK(Palettes_LocationDoneTrainLine7)                   ; $432e
	ld   hl, Palettes_LocationDoneTrainLine7                        ; $4330
	call SetOBJPaletteSrc                                           ; $4333
	ld   a, $20                                                     ; $4336
	ld   [wPaletteFadeAmount], a                                    ; $4338
	ld   a, $01                                                     ; $433b
	ld   [wLoadPalettesFromRam], a                                  ; $433d

	ld   hl, Gfx_LocationDoneTrainLine7                             ; $4340
	ld   c, BANK(Gfx_LocationDoneTrainLine7)                        ; $4343
	jp   .trainLineCont                                             ; $4345

.trainLine8:
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_LocationDoneTrainLine8)                   ; $4349
	ld   hl, Palettes_LocationDoneTrainLine8                        ; $434b
	call SetBGPaletteSrc                                            ; $434e
	ld   a, $20                                                     ; $4351
	ld   [wPaletteFadeAmount], a                                    ; $4353
	ld   a, $01                                                     ; $4356
	ld   [wLoadPalettesFromRam], a                                  ; $4358

	ld   b, BANK(Palettes_LocationDoneTrainLine8)                   ; $435b
	ld   hl, Palettes_LocationDoneTrainLine8                        ; $435d
	call SetOBJPaletteSrc                                           ; $4360
	ld   a, $20                                                     ; $4363
	ld   [wPaletteFadeAmount], a                                    ; $4365
	ld   a, $01                                                     ; $4368
	ld   [wLoadPalettesFromRam], a                                  ; $436a

	ld   hl, Gfx_LocationDoneTrainLine8                             ; $436d
	ld   c, BANK(Gfx_LocationDoneTrainLine8)                        ; $4370
	jp   .trainLineCont                                             ; $4372

.trainLine9:
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_LocationDoneTrainLine9)                   ; $4376
	ld   hl, Palettes_LocationDoneTrainLine9                        ; $4378
	call SetBGPaletteSrc                                            ; $437b
	ld   a, $20                                                     ; $437e
	ld   [wPaletteFadeAmount], a                                    ; $4380
	ld   a, $01                                                     ; $4383
	ld   [wLoadPalettesFromRam], a                                  ; $4385

	ld   b, BANK(Palettes_LocationDoneTrainLine9)                   ; $4388
	ld   hl, Palettes_LocationDoneTrainLine9                        ; $438a
	call SetOBJPaletteSrc                                           ; $438d
	ld   a, $20                                                     ; $4390
	ld   [wPaletteFadeAmount], a                                    ; $4392
	ld   a, $01                                                     ; $4395
	ld   [wLoadPalettesFromRam], a                                  ; $4397

	ld   hl, Gfx_LocationDoneTrainLine9                             ; $439a
	ld   c, BANK(Gfx_LocationDoneTrainLine9)                        ; $439d
	jp   .trainLineCont                                             ; $439f

.trainLineA:
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_LocationDoneTrainLineA)                   ; $43a3
	ld   hl, Palettes_LocationDoneTrainLineA                        ; $43a5
	call SetBGPaletteSrc                                            ; $43a8
	ld   a, $20                                                     ; $43ab
	ld   [wPaletteFadeAmount], a                                    ; $43ad
	ld   a, $01                                                     ; $43b0
	ld   [wLoadPalettesFromRam], a                                  ; $43b2

	ld   b, BANK(Palettes_LocationDoneTrainLineA)                   ; $43b5
	ld   hl, Palettes_LocationDoneTrainLineA                        ; $43b7
	call SetOBJPaletteSrc                                           ; $43ba
	ld   a, $20                                                     ; $43bd
	ld   [wPaletteFadeAmount], a                                    ; $43bf
	ld   a, $01                                                     ; $43c2
	ld   [wLoadPalettesFromRam], a                                  ; $43c4

	ld   hl, Gfx_LocationDoneTrainLineA                             ; $43c7
	ld   c, BANK(Gfx_LocationDoneTrainLineA)                        ; $43ca

.trainLineCont:
; Train lines provide bank C and src HL, transfer 2 blocks, $500 each
; 1st is title, 2nd is train
	ld   de, _VRAM+$e00                                             ; $43cc
	ld   b, ($500/$10)-1                                            ; $43cf
	call StartFarHDMATransfer                                       ; $43d1

	ld   de, $0500                                                  ; $43d4
	add  hl, de                                                     ; $43d7
	ld   de, _VRAM+$1300                                            ; $43d8
	ld   b, ($500/$10)-1                                            ; $43db
	call StartFarHDMATransfer                                       ; $43dd
	call ProcessScriptsFromCurrLoc                                  ; $43e0
	SCR_SingleUseRet
	
	
LocationDoneSubScript1_Display2TrainColumnsFromScroll:
; Display 1st train column tile map
:	SCR_ExecAsmBelow
	call DisplayLocationDoneTrainTileMapColumnFromScroll            ; $43e5

; Display 2nd train column tile map
	ld   a, [wLocationDoneTrainSCX]                                 ; $43e8
	ld   l, a                                                       ; $43eb
	ld   a, [wLocationDoneTrainSCX+1]                               ; $43ec
	ld   h, a                                                       ; $43ef
	ld   bc, $0008                                                  ; $43f0
	add  hl, bc                                                     ; $43f3
	call DisplayLocationDoneTrainTileMapColumnFromHL                ; $43f4

; Display 1st train column tile attr
	call DisplayLocationDoneTrainTileAttrColumnFromScroll           ; $43f7

; Display 2nd train column tile attr
	ld   a, [wLocationDoneTrainSCX]                                 ; $43fa
	ld   l, a                                                       ; $43fd
	ld   a, [wLocationDoneTrainSCX+1]                               ; $43fe
	ld   h, a                                                       ; $4401
	ld   bc, $0008                                                  ; $4402
	add  hl, bc                                                     ; $4405
	call DisplayLocationDoneTrainTileAttrColumnFromHL               ; $4406

; Repeat next frame
	call ProcessScriptsFromCurrLoc                                  ; $4409
	SCR_ResumeNextFrame
	SCR_Jump :-


LocationDoneOtherScript3_StopPosAccelerateScore:
; If distance before next is positive (we haven't passed it), display Pass
	SCR_ExecAsmBelow
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4411
	bit  7, a                                                       ; $4414
	ld   de, .stopPosIsPositive                                     ; $4416
	jp   z, ProcessScriptsFromDE                                    ; $4419

; Get the negative value of it
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $441c
	cpl                                                             ; $441f
	ld   l, a                                                       ; $4420
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4421
	cpl                                                             ; $4424
	ld   h, a                                                       ; $4425

; If high byte is positive, we're too far out, display deduction
	ld   a, h                                                       ; $4426
	or   a                                                          ; $4427
	ld   de, .displayDeduction                                      ; $4428
	jp   nz, ProcessScriptsFromDE                                   ; $442b

; If distance > value in table, display deduction, otherwise it's an acceptable stop
	push hl                                                         ; $442e
	call GetTrainlineDifficultyMaxAcceptableDistanceBeforeStop      ; $442f
	pop  hl                                                         ; $4432
	ld   a, l                                                       ; $4433
	inc  b                                                          ; $4434
	cp   b                                                          ; $4435
	ld   de, .displayDeduction                                      ; $4436
	jp   nc, ProcessScriptsFromDE                                   ; $4439

	ld   de, .stopPosIsPositive                                     ; $443c
	jp   ProcessScriptsFromDE                                       ; $443f

.displayDeduction:
	SCR_FarSetSpriteSrcFunc SpriteOamFunc_StopPosAccelerateScore
	SCR_ExecAsmBelow

; HL = current total deductions
	ld   a, [wTotalTrainLineLocationDeductions]                     ; $4445
	ld   l, a                                                       ; $444a
	ld   a, [wTotalTrainLineLocationDeductions+1]                   ; $444b
	ld   h, a                                                       ; $444e

; E is -low byte of distance
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $444f
	cpl                                                             ; $4452
	ld   e, a                                                       ; $4453

; Get penalty multiplier-1. Can be 0 (mult*1), or 1 (mult*2). If latter, double E
	push hl                                                         ; $4454
	call GetTrainlineStopPosPenaltyMultiplierMinus1                 ; $4455
	pop  hl                                                         ; $4458
	ld   a, b                                                       ; $4459
	cp   $00                                                        ; $445a
	ld   a, e                                                       ; $445c
	jr   z, :+                                                      ; $445d
	add  a                                                          ; $445f

; Add penalty onto total deductions
:	add  l                                                          ; $4460
	ld   l, a                                                       ; $4461
	ld   a, h                                                       ; $4462
	adc  $00                                                        ; $4463
	ld   h, a                                                       ; $4465

	ld   a, l                                                       ; $4466
	ld   [wTotalTrainLineLocationDeductions], a                     ; $4467
	ld   a, h                                                       ; $446a
	ld   [wTotalTrainLineLocationDeductions+1], a                   ; $446b
	call ProcessScriptsFromCurrLoc                                  ; $446e
	SCR_StopCurrScript

.stopPosIsPositive:
	SCR_SetSpriteXY $38, $30
	SCR_FarSetSpriteSrc SpriteOam_StopPosAccelerateQualified
	SCR_StopCurrScript


LocationDoneOtherScript4_StationStructureScore:
; If station structure acceleration is good, display a pass
	SCR_ExecAsmBelow
	ld   a, [wPoorStationStructureAcceleration]                     ; $447b
	or   a                                                          ; $447e
	ld   de, .displayPass                                           ; $447f
	jp   z, ProcessScriptsFromDE                                    ; $4482

; By default, deduction is 10 pts..
	call ProcessScriptsFromCurrLoc                                  ; $4485
	SCR_SetSpriteXY $38, $30
	SCR_FarSetSpriteSrc SpriteOam_StationDeduction10pts

; Add penalties if accelerating in the station
	SCR_ExecAsmBelow
	ld   hl, wSmallCounterPenaltyForUnsafeBrakingOrPoorStationAccel ; $4490
	ld   c, $05                                                     ; $4493
	call AddCToByteInHL_maxFFh                                      ; $4495

; The other possible deduction pt value in the table, other than 10, is 15
	call GetTrainlineStationDeductionPoints                         ; $4498
	ld   a, b                                                       ; $449b
	cp   10                                                         ; $449c
	jr   z, :+                                                      ; $449e

	call ProcessScriptsFromCurrLoc                                  ; $44a0
	SCR_FarSetSpriteSrc SpriteOam_StationDeduction15pts
	SCR_ExecAsmBelow

; Add deduction pts to total deductions
:	call GetTrainlineStationDeductionPoints                         ; $44a8
	ld   a, [wTotalTrainLineLocationDeductions]                     ; $44ab
	ld   l, a                                                       ; $44ae
	ld   a, [wTotalTrainLineLocationDeductions+1]                   ; $44af
	ld   h, a                                                       ; $44b2

	ld   a, l                                                       ; $44b3
	add  b                                                          ; $44b4
	ld   l, a                                                       ; $44b5
	ld   a, h                                                       ; $44b6
	adc  $00                                                        ; $44b7
	ld   h, a                                                       ; $44b9

	ld   a, l                                                       ; $44ba
	ld   [wTotalTrainLineLocationDeductions], a                     ; $44bb
	ld   a, h                                                       ; $44be
	ld   [wTotalTrainLineLocationDeductions+1], a                   ; $44bf

	call ProcessScriptsFromCurrLoc                                  ; $44c2
	SCR_StopCurrScript

.displayPass:
	SCR_SetSpriteXY $38, $30
	SCR_FarSetSpriteSrc SpriteOam_StationDeductionPass
	SCR_StopCurrScript


LocationDoneOtherScript5_ExtremeBrakingScore:
; Branch if no extreme braking
	SCR_ExecAsmBelow
	ld   a, [wAppliedExtremeBraking]                                ; $44cf
	or   a                                                          ; $44d2
	ld   de, .noExtremeBraking                                      ; $44d3
	jp   z, ProcessScriptsFromDE                                    ; $44d6

; Add to penalty counter for scoring
	ld   hl, wLargerCounterPenaltyForVeryUnsafeBrakingOrStops       ; $44d9
	ld   c, $02                                                     ; $44dc
	call AddCToByteInHL_maxFFh                                      ; $44de

; Set coords and set sprite
	call ProcessScriptsFromCurrLoc                                  ; $44e1
	SCR_SetSpriteXY $38, $30
	SCR_FarSetSpriteSrc SpriteOam_ExtremeBraking
	SCR_ExecAsmBelow

; Add 10 to total deductions
	ld   a, [wTotalTrainLineLocationDeductions]                     ; $44ec
	ld   l, a                                                       ; $44ef
	ld   a, [wTotalTrainLineLocationDeductions+1]                   ; $44f0
	ld   h, a                                                       ; $44f3

	ld   a, l                                                       ; $44f4
	add  10                                                         ; $44f5
	ld   l, a                                                       ; $44f7
	ld   a, h                                                       ; $44f8
	adc  $00                                                        ; $44f9
	ld   h, a                                                       ; $44fb

	ld   a, l                                                       ; $44fc
	ld   [wTotalTrainLineLocationDeductions], a                     ; $44fd
	ld   a, h                                                       ; $4500
	ld   [wTotalTrainLineLocationDeductions+1], a                   ; $4501

	call ProcessScriptsFromCurrLoc                                  ; $4504
	SCR_StopCurrScript

.noExtremeBraking:
; Set coords and set sprite
	SCR_SetSpriteXY $38, $30
	SCR_FarSetSpriteSrc SpriteOam_NoExtremeBraking
	SCR_StopCurrScript


LocationDoneOtherScript6_TotalDeductions:
	SCR_FarSetSpriteSrcFunc SpriteOamFunc_TotalDeductions
	SCR_StopCurrScript
	
	
LocationDoneOtherScript1_CurrPenalties:
	SCR_FarSetSpriteSrcFunc SpriteOamFunc_DisplayPenaltiesTiles
:	SCR_ResumeNextFrame
	SCR_Jump :-


SpriteOamFunc_DisplayPenaltiesTiles:
	ld   hl, LocationDonePenaltiesOam                               ; $451d
	ld   de, wLocationDone_PenaltiesOam                             ; $4520
	ld   bc, LocationDonePenaltiesOam.end-LocationDonePenaltiesOam  ; $4523
	call MemCopy                                                    ; $4526

; Get penalties so far in BCD
	ld   a, [wPenaltiesAllowed]                                     ; $4529
	call BCequAinBCDform                                            ; $452c

; Override hundreds, base tile idx is $20 for 0
	ld   a, b                                                       ; $452f
	and  $0f                                                        ; $4530
	add  a                                                          ; $4532
	add  $20                                                        ; $4533
	ld   [wLocationDone_PenaltiesOam+2], a                          ; $4535

; Override 10s
	ld   a, c                                                       ; $4538
	swap a                                                          ; $4539
	and  $0f                                                        ; $453b
	add  a                                                          ; $453d
	add  $20                                                        ; $453e
	ld   [wLocationDone_PenaltiesOam+6], a                          ; $4540

; Override units
	ld   a, c                                                       ; $4543
	and  $0f                                                        ; $4544
	add  a                                                          ; $4546
	add  $20                                                        ; $4547
	ld   [wLocationDone_PenaltiesOam+10], a                         ; $4549

; Load into wOam
	ld   hl, wLocationDone_PenaltiesOam                             ; $454c
	ldbc $70, $08                                                   ; $454f
	call SaveOverrideableOamDetailsTo_wOam                          ; $4552
	jp   UpdateScriptsOam.saveOamOffsetGoToNextScriptStruct         ; $4555


SpriteOamFunc_StopPosAccelerateScore:
; Multiplier determines base oam to update
	call GetTrainlineStopPosPenaltyMultiplierMinus1                 ; $4558
	ld   hl, StopPosAcceleratePenaltyTimes2_Oam                     ; $455b
	ld   a, b                                                       ; $455e
	cp   $00                                                        ; $455f
	jr   nz, :+                                                     ; $4561
	ld   hl, StopPosAcceleratePenaltyTimes1_Oam                     ; $4563

; Copy base oam to ram
:	ld   de, wLocationDone_StopPosAccelerateOam                     ; $4566
	ld   bc, wLocationDone_StopPosAccelerateOam.end-wLocationDone_StopPosAccelerateOam ; $4569
	call MemCopy                                                    ; $456c

; Get distance in BC
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $456f
	cpl                                                             ; $4572
	call BCequAinBCDform                                            ; $4573

; Edit 100s
	ld   a, b                                                       ; $4576
	and  $0f                                                        ; $4577
	add  a                                                          ; $4579
	add  $40                                                        ; $457a
	ld   [wLocationDone_StopPosAccelerateOam+2], a                  ; $457c

; Edit 10s
	ld   a, c                                                       ; $457f
	swap a                                                          ; $4580
	and  $0f                                                        ; $4582
	add  a                                                          ; $4584
	add  $40                                                        ; $4585
	ld   [wLocationDone_StopPosAccelerateOam+6], a                  ; $4587

; Edit 1s
	ld   a, c                                                       ; $458a
	and  $0f                                                        ; $458b
	add  a                                                          ; $458d
	add  $40                                                        ; $458e
	ld   [wLocationDone_StopPosAccelerateOam+10], a                 ; $4590

; If distance < 100, clear hundreds choice
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $4593
	cp   100                                                        ; $4596
	jr   nc, .end                                                   ; $4598

	ld   a, $00                                                     ; $459a
	ld   [wLocationDone_StopPosAccelerateOam+2], a                  ; $459c

; If distance is also < 10, clear tens choice
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $459f
	cp   10                                                         ; $45a2
	jr   nc, .end                                                   ; $45a4

	ld   a, $00                                                     ; $45a6
	ld   [wLocationDone_StopPosAccelerateOam+6], a                  ; $45a8

.end:
; Update oam
	ld   hl, wLocationDone_StopPosAccelerateOam                     ; $45ab
	ldbc $38, $30                                                   ; $45ae
	call SaveOverrideableOamDetailsTo_wOam                          ; $45b1
	jp   UpdateScriptsOam.saveOamOffsetGoToNextScriptStruct         ; $45b4


SpriteOamFunc_TotalDeductions:
; Copy base oam to ram for editing
	ld   hl, LocationDoneTotalDeductions_Oam                        ; $45b7
	ld   de, wLocationsDoneTotalDeductionsOam                       ; $45ba
	ld   bc, wLocationsDoneTotalDeductionsOam.end-wLocationsDoneTotalDeductionsOam ; $45bd
	call MemCopy                                                    ; $45c0

; HL = total deductions
	ld   a, [wTotalTrainLineLocationDeductions]                     ; $45c3
	ld   l, a                                                       ; $45c6
	ld   a, [wTotalTrainLineLocationDeductions+1]                   ; $45c7
	ld   h, a                                                       ; $45ca

; If trainline is 0..
	ld   a, [wSelectedTrainLine]                                    ; $45cb
	or   a                                                          ; $45ce
	jr   nz, .cont                                                  ; $45cf

; And total deductions >= 20..
	ld   a, h                                                       ; $45d1
	or   a                                                          ; $45d2
	jr   nz, .totalDeductionsEqu20                                  ; $45d3

	ld   a, l                                                       ; $45d5
	cp   20                                                         ; $45d6
	jr   c, .cont                                                   ; $45d8

.totalDeductionsEqu20:
; Set total deductions to 20
	ld   hl, 20                                                     ; $45da
	ld   a, l                                                       ; $45dd
	ld   [wTotalTrainLineLocationDeductions], a                     ; $45de
	ld   a, h                                                       ; $45e1
	ld   [wTotalTrainLineLocationDeductions+1], a                   ; $45e2

.cont:
; Edit 100s
	call ConvertHLtoNybbleBCDinBC                                   ; $45e5
	ld   a, b                                                       ; $45e8
	and  $0f                                                        ; $45e9
	add  a                                                          ; $45eb
	add  $40                                                        ; $45ec
	ld   [wLocationsDoneTotalDeductionsOam+2], a                    ; $45ee

; Edit 10s
	ld   a, c                                                       ; $45f1
	swap a                                                          ; $45f2
	and  $0f                                                        ; $45f4
	add  a                                                          ; $45f6
	add  $40                                                        ; $45f7
	ld   [wLocationsDoneTotalDeductionsOam+6], a                    ; $45f9

; Edit 1s
	ld   a, c                                                       ; $45fc
	and  $0f                                                        ; $45fd
	add  a                                                          ; $45ff
	add  $40                                                        ; $4600
	ld   [wLocationsDoneTotalDeductionsOam+10], a                   ; $4602

; If total high byte non-0, we're done
	ld   a, [wTotalTrainLineLocationDeductions+1]                   ; $4605
	or   a                                                          ; $4608
	jr   nz, .end                                                   ; $4609

; If total < 100, clear 100s
	ld   a, [wTotalTrainLineLocationDeductions]                     ; $460b
	cp   100                                                        ; $460e
	jr   nc, .end                                                   ; $4610

	ld   a, $00                                                     ; $4612
	ld   [wLocationsDoneTotalDeductionsOam+2], a                    ; $4614

; If total is also < 10, clear 10s
	ld   a, [wTotalTrainLineLocationDeductions]                     ; $4617
	cp   10                                                         ; $461a
	jr   nc, .end                                                   ; $461c

	ld   a, $00                                                     ; $461e
	ld   [wLocationsDoneTotalDeductionsOam+6], a                    ; $4620

.end:
; Update oam
	ld   hl, wLocationsDoneTotalDeductionsOam                       ; $4623
	ldbc $78, $50                                                   ; $4626
	call SaveOverrideableOamDetailsTo_wOam                          ; $4629
	jp   UpdateScriptsOam.saveOamOffsetGoToNextScriptStruct         ; $462c


LocationDonePenaltiesOam:
	db $10, $08, $20, $05
	db $10, $10, $20, $05
	db $10, $18, $20, $05
	db $80
.end:


StopPosAcceleratePenaltyTimes2_Oam:
	db $f4, $20, $40, $05
	db $f4, $28, $40, $05
	db $f4, $30, $40, $05
	db $f4, $39, $38, $06
	db $f4, $42, $54, $06
	db $f4, $4a, $44, $06
	db $f4, $50, $0a, $06
	db $f4, $58, $0c, $06
	db $80


StopPosAcceleratePenaltyTimes1_Oam:
	db $f4, $20, $40, $05
	db $f4, $28, $40, $05
	db $f4, $30, $40, $05
	db $f4, $39, $38, $06
	db $f4, $42, $54, $06
	db $f4, $4a, $42, $06
	db $f4, $50, $0a, $06
	db $f4, $58, $0c, $06
	db $80


; unused - $467e (SpriteOam_StationDeduction00pts)
	db $0f, $44, $40, $05
	db $0f, $4c, $40, $05
	db $0f, $2c, $04, $06
	db $0f, $34, $06, $06
	db $0f, $3c, $08, $06
	db $0f, $51, $0a, $06
	db $0f, $59, $0c, $06
	db $80


LocationDoneTotalDeductions_Oam:
	db $00, $fc, $40, $05
	db $00, $04, $40, $05
	db $00, $0c, $40, $05
	db $80


SpriteOam_StationDeduction10pts::
	db $07
	db $02, $44, $42, $05
	db $02, $4c, $40, $05
	db $02, $2c, $04, $06
	db $02, $34, $06, $06
	db $02, $3c, $08, $06
	db $02, $51, $0a, $06
	db $02, $59, $0c, $06
	
	
SpriteOam_StationDeduction15pts::
	db $07
	db $02, $44, $42, $05
	db $02, $4c, $4a, $05
	db $02, $2c, $04, $06
	db $02, $34, $06, $06
	db $02, $3c, $08, $06
	db $02, $51, $0a, $06
	db $02, $59, $0c, $06
	
	
SpriteOam_ExtremeBraking:
	db $07
	db $0f, $44, $42, $05
	db $0f, $4c, $40, $05
	db $0f, $2c, $04, $06
	db $0f, $34, $06, $06
	db $0f, $3c, $08, $06
	db $0f, $51, $0a, $06
	db $0f, $59, $0c, $06
	
	
LocationDoneOtherScript2_HandleSCX:
; Save curr position to compare and loop to
	SCR_ExecAsmBelow
	ld   a, [wCurrAddressOfRecordedDistances]                       ; $4700
	ld   [wEndAddressOfRecordedDistances], a                        ; $4703
	ld   a, [wCurrAddressOfRecordedDistances+1]                     ; $4706
	ld   [wEndAddressOfRecordedDistances+1], a                      ; $4709
	call ProcessScriptsFromCurrLoc                                  ; $470c

.loop:
; Get address of next 4 distance bytes to process
	SCR_ExecAsmBelow
	ld   a, [wCurrAddressOfRecordedDistances]                       ; $4710
	ld   l, a                                                       ; $4713
	ld   a, [wCurrAddressOfRecordedDistances+1]                     ; $4714
	and  $03                                                        ; $4717
	or   HIGH(wLast100hRecordedDistances)                           ; $4719
	ld   h, a                                                       ; $471b

; Preserve and use the ram bank with our distances
	di                                                              ; $471c
	ldh  a, [rSVBK]                                                 ; $471d
	and  $03                                                        ; $471f
	push af                                                         ; $4721
	ld   a, BANK(wLast100hRecordedDistances)                        ; $4722
	ldh  [rSVBK], a                                                 ; $4724

; 0, centi, meter low, meter high
	ld   a, [hl+]                                                   ; $4726
	ldh  [hUnusedRecordedMillimeters], a                            ; $4727
	ld   a, [hl+]                                                   ; $4729
	ldh  [hRecordedCentimeters], a                                  ; $472a
	ld   a, [hl+]                                                   ; $472c
	ldh  [hRecordedMeters], a                                       ; $472d
	ld   a, [hl+]                                                   ; $472f
	ldh  [hRecordedMeters+1], a                                     ; $4730

; Restore wram bank
	pop  af                                                         ; $4732
	ldh  [rSVBK], a                                                 ; $4733
	ei                                                              ; $4735

; Jump if we were last passed the station
	ldh  a, [hRecordedMeters+1]                                     ; $4736
	bit  7, a                                                       ; $4738
	jr   nz, .passedDest                                            ; $473a

; Jump if >= 14m
	ldh  a, [hRecordedMeters+1]                                     ; $473c
	or   a                                                          ; $473e
	jr   nz, .moreThan14mFromDest                                   ; $473f

	ldh  a, [hRecordedMeters]                                       ; $4741
	cp   $0e                                                        ; $4743
	jr   nc, .moreThan14mFromDest                                   ; $4745

; HL = meters part * 100
	ld   h, a                                                       ; $4747
	ld   l, 100                                                     ; $4748
	call HLequHtimesL                                               ; $474a

; Add on the centimeters part for total centimeters from station
	ldh  a, [hRecordedCentimeters]                                  ; $474d
	ld   e, a                                                       ; $474f
	ld   d, $00                                                     ; $4750
	add  hl, de                                                     ; $4752

; SCX = $b0 - ((that value < 1400cm) / 15)
	ld   e, 15                                                      ; $4753
	call HLdivmodEinLH                                              ; $4755
	ld   a, $b0                                                     ; $4758
	sub  l                                                          ; $475a
	ld   [wLocationDoneTrainSCX], a                                 ; $475b
	ld   a, $00                                                     ; $475e
	ld   [wLocationDoneTrainSCX+1], a                               ; $4760
	jr   .cont                                                      ; $4763

.passedDest:
; Get positive distance * 100
	ldh  a, [hRecordedMeters]                                       ; $4765
	cpl                                                             ; $4767
	ld   h, a                                                       ; $4768
	ld   l, 100                                                     ; $4769
	call HLequHtimesL                                               ; $476b

; Add on positive centimeters
	ldh  a, [hRecordedCentimeters]                                  ; $476e
	ld   e, a                                                       ; $4770
	ld   a, 100                                                     ; $4771
	sub  e                                                          ; $4773
	ld   e, a                                                       ; $4774
	ld   d, $00                                                     ; $4775
	add  hl, de                                                     ; $4777

; SCX = $b0 + (that value / 15)
	ld   e, 15                                                      ; $4778
	call HLdivE_divInHLmodInD                                       ; $477a
	ld   de, $00b0                                                  ; $477d
	add  hl, de                                                     ; $4780
	ld   a, l                                                       ; $4781
	ld   [wLocationDoneTrainSCX], a                                 ; $4782
	ld   a, h                                                       ; $4785
	ld   [wLocationDoneTrainSCX+1], a                               ; $4786
	jr   .cont                                                      ; $4789

.moreThan14mFromDest:
; Don't scroll train through
	ld   a, $50                                                     ; $478b
	ld   [wLocationDoneTrainSCX], a                                 ; $478d
	ld   a, $00                                                     ; $4790
	ld   [wLocationDoneTrainSCX+1], a                               ; $4792
	jr   .cont                                                      ; $4795

.cont:
; Go to next speed
	ld   a, [wCurrAddressOfRecordedDistances]                       ; $4797
	ld   l, a                                                       ; $479a
	ld   a, [wCurrAddressOfRecordedDistances+1]                     ; $479b
	ld   h, a                                                       ; $479e
	ld   de, $0004                                                  ; $479f
	add  hl, de                                                     ; $47a2
	ld   a, h                                                       ; $47a3
	and  $03                                                        ; $47a4
	or   HIGH(wLast100hRecordedDistances)                           ; $47a6
	ld   h, a                                                       ; $47a8

; Save address
	ld   a, l                                                       ; $47a9
	ld   [wCurrAddressOfRecordedDistances], a                       ; $47aa
	ld   a, h                                                       ; $47ad
	ld   [wCurrAddressOfRecordedDistances+1], a                     ; $47ae

; Keep looping until we process all 100h speeds
	ld   a, [wEndAddressOfRecordedDistances+1]                      ; $47b1
	cp   h                                                          ; $47b4
	jr   nz, .toNextLoop                                            ; $47b5

	ld   a, [wEndAddressOfRecordedDistances]                        ; $47b7
	cp   l                                                          ; $47ba
	jr   nz, .toNextLoop                                            ; $47bb

	ld   de, .done                                                  ; $47bd
	jp   ProcessScriptsFromDE                                       ; $47c0

.toNextLoop:
	call ProcessScriptsFromCurrLoc                                  ; $47c3
	SCR_ResumeNextFrame
	SCR_Jump .loop

.done:
	SCR_StopCurrScript


DisplayLocationDoneTrainTileMapColumnFromScroll:
; HL = scx for train
	ld   a, [wLocationDoneTrainSCX]                                 ; $47cb
	ld   l, a                                                       ; $47ce
	ld   a, [wLocationDoneTrainSCX+1]                               ; $47cf
	ld   h, a                                                       ; $47d2

DisplayLocationDoneTrainTileMapColumnFromHL::
; HL -= $50, ignoring L's low 3 bits
	ld   de, -$50                                                   ; $47d3
	add  hl, de                                                     ; $47d6
	ld   a, l                                                       ; $47d7
	and  $f8                                                        ; $47d8
	ld   l, a                                                       ; $47da
	push hl                                                         ; $47db

; DE = upper 5 bits shifted to bit 0-4
	ld   e, a                                                       ; $47dc
	ld   d, $00                                                     ; $47dd
	srl  e                                                          ; $47df
	srl  e                                                          ; $47e1
	srl  e                                                          ; $47e3

; HL = column offset from train area
	ld   hl, wRouteDisplayScrn0TileMapBuffer+$160                   ; $47e5
	add  hl, de                                                     ; $47e8

; BC = adjusted scroll with low 3 bits ignored
	pop  bc                                                         ; $47e9
	push hl                                                         ; $47ea

; HL = tile map source
	ld   a, [wLocationDoneTileMapSrcAddr]                           ; $47eb
	ld   l, a                                                       ; $47ee
	ld   a, [wLocationDoneTileMapSrcAddr+1]                         ; $47ef
	ld   h, a                                                       ; $47f2

; DE = offsetted tile map source address
	call GetSourceOffsetForLocationDoneTrainTileMapOrAttr           ; $47f3
	add  hl, bc                                                     ; $47f6
	ld   e, l                                                       ; $47f7
	ld   d, h                                                       ; $47f8

; HL = column offset into train area
	pop  hl                                                         ; $47f9

; Store unused src and dest, then display column
	ld   a, e                                                       ; $47fa
	ld   [wLocationDone_unusedTileMapSrc], a                        ; $47fb
	ld   a, d                                                       ; $47fe
	ld   [wLocationDone_unusedTileMapSrc+1], a                      ; $47ff
	ld   a, l                                                       ; $4802
	ld   [wLocationDone_unusedTileMapOrAttrDest], a                 ; $4803
	ld   a, h                                                       ; $4806
	ld   [wLocationDone_unusedTileMapOrAttrDest+1], a               ; $4807

	call DisplayLocationDoneColumn                                  ; $480a
	ret                                                             ; $480d


DisplayLocationDoneTrainTileAttrColumnFromScroll:
; HL = scx for train
	ld   a, [wLocationDoneTrainSCX]                                 ; $480e
	ld   l, a                                                       ; $4811
	ld   a, [wLocationDoneTrainSCX+1]                               ; $4812
	ld   h, a                                                       ; $4815

DisplayLocationDoneTrainTileAttrColumnFromHL::
; HL -= $50, ignoring L's low 3 bits
	ld   de, -$50                                                   ; $4816
	add  hl, de                                                     ; $4819
	ld   a, l                                                       ; $481a
	and  $f8                                                        ; $481b
	ld   l, a                                                       ; $481d
	push hl                                                         ; $481e

; DE = upper 5 bits shifted to bit 0-4
	ld   e, a                                                       ; $481f
	ld   d, $00                                                     ; $4820
	srl  e                                                          ; $4822
	srl  e                                                          ; $4824
	srl  e                                                          ; $4826

; HL = column offset from train area
	ld   hl, wRouteDisplayScrn0TileAttrBuffer+$160                  ; $4828
	add  hl, de                                                     ; $482b

; BC = adjusted scroll with low 3 bits ignored
	pop  bc                                                         ; $482c
	push hl                                                         ; $482d

; HL = tile map source
	ld   a, [wLocationDoneTileAttrSrcAddr]                          ; $482e
	ld   l, a                                                       ; $4831
	ld   a, [wLocationDoneTileAttrSrcAddr+1]                        ; $4832
	ld   h, a                                                       ; $4835

; DE = offsetted tile map source address
	call GetSourceOffsetForLocationDoneTrainTileMapOrAttr           ; $4836
	add  hl, bc                                                     ; $4839
	ld   e, l                                                       ; $483a
	ld   d, h                                                       ; $483b

; HL = column offset into train area
	pop  hl                                                         ; $483c

; Store unused src and dest, then display column
	ld   a, e                                                       ; $483d
	ld   [wLocationDone_unusedTileAttrSrc], a                       ; $483e
	ld   a, d                                                       ; $4841
	ld   [wLocationDone_unusedTileAttrSrc+1], a                     ; $4842
	ld   a, l                                                       ; $4845
	ld   [wLocationDone_unusedTileMapOrAttrDest], a                 ; $4846
	ld   a, h                                                       ; $4849
	ld   [wLocationDone_unusedTileMapOrAttrDest+1], a               ; $484a

	call DisplayLocationDoneColumn                                  ; $484d
	ret                                                             ; $4850


; BC - scroll x without low 3 bits
GetSourceOffsetForLocationDoneTrainTileMapOrAttr:
	push hl                                                         ; $4851
	push bc                                                         ; $4852
	ld   l, c                                                       ; $4853
	ld   h, b                                                       ; $4854

.loop:
; Jump once H == 0
	ld   a, h                                                       ; $4855
	cp   $01                                                        ; $4856
	jr   c, .done                                                   ; $4858

; If H != 1, sub $90 from orig BC
	jr   nz, .sub90h                                                ; $485a

; If HL >= $130 (num tiles considered), sub $90
	ld   a, l                                                       ; $485c
	cp   $30                                                        ; $485d
	jr   nc, .sub90h                                                ; $485f

.done:
; Return BC, with < $130
	pop  bc                                                         ; $4861
	ld   c, l                                                       ; $4862
	ld   b, h                                                       ; $4863
	pop  hl                                                         ; $4864
	ret                                                             ; $4865

.sub90h:
; Sub to wrap around screen width
	ld   bc, -SCREEN_TILE_HEIGHT*8                                  ; $4866
	add  hl, bc                                                     ; $4869
	jr   .loop                                                      ; $486a


macro LocationDoneTrainSrc
	db BANK(\1)
	dw \1
	dw \2
	ASSERT BANK(\2) == BANK(\1)
endm
LocationDoneTrainsTileMapAndAttrSrces:
	LocationDoneTrainSrc VerticalTileMap_LocationDoneTrainLine0, VerticalTileAttr_LocationDoneTrainLine0
	LocationDoneTrainSrc VerticalTileMap_LocationDoneTrainLine1, VerticalTileAttr_LocationDoneTrainLine1
	LocationDoneTrainSrc VerticalTileMap_LocationDoneTrainLine2, VerticalTileAttr_LocationDoneTrainLine2
	LocationDoneTrainSrc VerticalTileMap_LocationDoneTrainLine0, VerticalTileAttr_LocationDoneTrainLine0
	LocationDoneTrainSrc VerticalTileMap_LocationDoneTrainLine1, VerticalTileAttr_LocationDoneTrainLine1
	LocationDoneTrainSrc VerticalTileMap_LocationDoneTrainLine5, VerticalTileAttr_LocationDoneTrainLine5
	LocationDoneTrainSrc VerticalTileMap_LocationDoneTrainLine6, VerticalTileAttr_LocationDoneTrainLine6
	LocationDoneTrainSrc VerticalTileMap_LocationDoneTrainLine7, VerticalTileAttr_LocationDoneTrainLine7
	LocationDoneTrainSrc VerticalTileMap_LocationDoneTrainLine8, VerticalTileAttr_LocationDoneTrainLine8
	LocationDoneTrainSrc VerticalTileMap_LocationDoneTrainLine9, VerticalTileAttr_LocationDoneTrainLine9
	LocationDoneTrainSrc VerticalTileMap_LocationDoneTrainLineA, VerticalTileAttr_LocationDoneTrainLineA


LocationDoneScript_DisplayTrainColumnsLeftOfSCX:
; SCX is initially $60, then increases over time
	SCR_ExecAsmBelow
	ld   a, [wLocationDoneTrainSCX]                                 ; $48a4
	cp   $08                                                        ; $48a7
	jp   c, .scxLt08h                                               ; $48a9

	cp   $10                                                        ; $48ac
	jp   c, .scxLt10h                                               ; $48ae

	cp   $18                                                        ; $48b1
	jp   c, .scxLt18h                                               ; $48b3

	cp   $20                                                        ; $48b6
	jp   c, .scxLt20h                                               ; $48b8

	cp   $f8                                                        ; $48bb
	jp   nc, .scxGteF8h                                             ; $48bd

	cp   $f0                                                        ; $48c0
	jp   nc, .scxGteF0h                                             ; $48c2

	cp   $e8                                                        ; $48c5
	jp   nc, .scxGteE8h                                             ; $48c7

	cp   $e0                                                        ; $48ca
	jp   nc, .scxGteE0h                                             ; $48cc

	cp   $d8                                                        ; $48cf
	jp   nc, .scxGteD8h                                             ; $48d1

	cp   $d0                                                        ; $48d4
	jp   nc, .scxGteD0h                                             ; $48d6

	cp   $c8                                                        ; $48d9
	jp   nc, .scxGteC8h                                             ; $48db

	cp   $c0                                                        ; $48de
	jp   nc, .scxGteC0h                                             ; $48e0

	cp   $b8                                                        ; $48e3
	jp   nc, .scxGteB8h                                             ; $48e5

	cp   $b0                                                        ; $48e8
	jp   nc, .scxGteB0h                                             ; $48ea

	cp   $a8                                                        ; $48ed
	jp   nc, .scxGteA8h                                             ; $48ef

	cp   $a0                                                        ; $48f2
	jp   nc, .scxGteA0h                                             ; $48f4

	cp   $98                                                        ; $48f7
	jp   nc, .scxGte98h                                             ; $48f9

	cp   $90                                                        ; $48fc
	jp   nc, .scxGte90h                                             ; $48fe

	cp   $88                                                        ; $4901
	jp   nc, .scxGte88h                                             ; $4903

	cp   $80                                                        ; $4906
	jp   nc, .scxGte80h                                             ; $4908

	cp   $78                                                        ; $490b
	jp   nc, .scxGte78h                                             ; $490d

	cp   $70                                                        ; $4910
	jp   nc, .scxGte70h                                             ; $4912

	cp   $68                                                        ; $4915
	jp   nc, .scxGte68h                                             ; $4917

	jp   .cont                                                      ; $491a

.scxLt20h:
	ld   a, $10                                                     ; $491d
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $491f
	call DisplaySpecifiedLocationDoneColumn                         ; $4921

.scxLt18h:
	ld   a, $08                                                     ; $4924
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $4926
	call DisplaySpecifiedLocationDoneColumn                         ; $4928

.scxLt10h:
	ld   a, $00                                                     ; $492b
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $492d
	call DisplaySpecifiedLocationDoneColumn                         ; $492f

.scxLt08h:
	ld   a, $f8                                                     ; $4932
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $4934
	call DisplaySpecifiedLocationDoneColumn                         ; $4936

.scxGteF8h:
	ld   a, $f0                                                     ; $4939
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $493b
	call DisplaySpecifiedLocationDoneColumn                         ; $493d

.scxGteF0h:
	ld   a, $e8                                                     ; $4940
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $4942
	call DisplaySpecifiedLocationDoneColumn                         ; $4944

.scxGteE8h:
	ld   a, $e0                                                     ; $4947
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $4949
	call DisplaySpecifiedLocationDoneColumn                         ; $494b

.scxGteE0h:
	ld   a, $d8                                                     ; $494e
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $4950
	call DisplaySpecifiedLocationDoneColumn                         ; $4952

.scxGteD8h:
	ld   a, $d0                                                     ; $4955
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $4957
	call DisplaySpecifiedLocationDoneColumn                         ; $4959

.scxGteD0h:
	ld   a, $c8                                                     ; $495c
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $495e
	call DisplaySpecifiedLocationDoneColumn                         ; $4960

.scxGteC8h:
	ld   a, $c0                                                     ; $4963
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $4965
	call DisplaySpecifiedLocationDoneColumn                         ; $4967

.scxGteC0h:
	ld   a, $b8                                                     ; $496a
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $496c
	call DisplaySpecifiedLocationDoneColumn                         ; $496e

.scxGteB8h:
	ld   a, $b0                                                     ; $4971
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $4973
	call DisplaySpecifiedLocationDoneColumn                         ; $4975

.scxGteB0h:
	ld   a, $a8                                                     ; $4978
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $497a
	call DisplaySpecifiedLocationDoneColumn                         ; $497c

.scxGteA8h:
	ld   a, $a0                                                     ; $497f
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $4981
	call DisplaySpecifiedLocationDoneColumn                         ; $4983

.scxGteA0h:
	ld   a, $98                                                     ; $4986
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $4988
	call DisplaySpecifiedLocationDoneColumn                         ; $498a

.scxGte98h:
	ld   a, $90                                                     ; $498d
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $498f
	call DisplaySpecifiedLocationDoneColumn                         ; $4991

.scxGte90h:
	ld   a, $88                                                     ; $4994
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $4996
	call DisplaySpecifiedLocationDoneColumn                         ; $4998

.scxGte88h:
	ld   a, $80                                                     ; $499b
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $499d
	call DisplaySpecifiedLocationDoneColumn                         ; $499f

.scxGte80h:
	ld   a, $78                                                     ; $49a2
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $49a4
	call DisplaySpecifiedLocationDoneColumn                         ; $49a6

.scxGte78h:
	ld   a, $70                                                     ; $49a9
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $49ab
	call DisplaySpecifiedLocationDoneColumn                         ; $49ad

.scxGte70h:
	ld   a, $68                                                     ; $49b0
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $49b2
	call DisplaySpecifiedLocationDoneColumn                         ; $49b4

.scxGte68h:
	ld   a, $60                                                     ; $49b7
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $49b9
	call DisplaySpecifiedLocationDoneColumn                         ; $49bb

.cont:
	ld   a, $58                                                     ; $49be
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $49c0
	call DisplaySpecifiedLocationDoneColumn                         ; $49c2

	ld   a, $50                                                     ; $49c5
	ldh  [hLocationDoneTrainSCXtoDrawFor], a                        ; $49c7
	call DisplaySpecifiedLocationDoneColumn                         ; $49c9

	call ProcessScriptsFromCurrLoc                                  ; $49cc
	SCR_SingleUseRet
	
	
ScoringScript::
	SCR_ExecAsmBelow

; Data crunch for final rank/trains display
	call Calculate5Scores                                           ; $49d1
	call GetRankAndTrainsForScoreCategs_SaveTotalScore              ; $49d4
	call ProcessScriptsFromCurrLoc                                  ; $49d7

; Fade in and start scripts to handle num being shuffled, and looping that sound
	SCR_Call Script_FadeIn
	SCR_StartSubScript1 ScoringSubScript1_IncShuffledNum
	SCR_StartSubScript2 ScoringSubScript2_LoopShuffleSound

; Start 3 scripts to update the constantly shuffled score
	SCR_CreateOtherScript 11, ScoringOtherScript11_HundredsDigitIsShuffled
	SCR_CreateOtherScript 12, ScoringOtherScript12_TensDigitIsShuffled
	SCR_CreateOtherScript 13, ScoringOtherScript13_UnitsDigitIsShuffled

; Display diamond accuracy stats
	SCR_Delay $28
	SCR_CreateOtherScript 1, ScoringOtherScript1_DiamondAccuracyRank
	SCR_CreateOtherScript 2, ScoringOtherScript2_DiamondAccuracyTrains

; Display stop position accuracy stats
	SCR_Delay $28
	SCR_CreateOtherScript 3, ScoringOtherScript3_StopPosAccuracyRank
	SCR_CreateOtherScript 4, ScoringOtherScript4_StopPosAccuracyTrains

; Display brake comfort stats
	SCR_Delay $28
	SCR_CreateOtherScript 5, ScoringOtherScript5_BrakeComfortRank
	SCR_CreateOtherScript 6, ScoringOtherScript6_BrakeComfortTrains

; Display safety consideration stats
	SCR_Delay $28
	SCR_CreateOtherScript 7, ScoringOtherScript7_SafetyConsiderationRank
	SCR_CreateOtherScript 8, ScoringOtherScript8_SafetyConsiderationTrains

; Display traffic lights/signs stats
	SCR_Delay $28
	SCR_CreateOtherScript 9, ScoringOtherScript9_TrafficLightsSignsRank
	SCR_CreateOtherScript 10, ScoringOtherScript10_TrafficLightsSignsTrains

; Stop sound, then display the actual score a digit at a time
	SCR_Delay $28
	SCR_StopSubScript2
	SCR_CreateOtherScript 11, ScoringOtherScript11_ShowActualHundredsDigit
	SCR_Delay $14
	SCR_CreateOtherScript 12, ScoringOtherScript12_ShowActualTensDigit
	SCR_Delay $14
	SCR_CreateOtherScript 13, ScoringOtherScript12_ShowActualUnitsDigit
	SCR_Delay $f0
	SCR_Call Script_FadeOut
	
; Jump if we didn't complete the train line
	SCR_ExecAsmBelow
	ld   a, [wCompletedTrainLine]                                   ; $4a4c
	or   a                                                          ; $4a4f
	ld   de, .end                                                   ; $4a50
	jp   z, ProcessScriptsFromDE                                    ; $4a53

; Go to stage complete state, with the right idx based on train line chosen
	call SetSceneIdxToDisplayAfterScoringAndUnlockMovie             ; $4a56
	call ProcessScriptsFromCurrLoc                                  ; $4a59
	SCR_StoreByteInAddr wGameState, GS_STAGE_COMPLETE_INIT
	SCR_StopCurrScript

.end:
	SCR_StoreByteInAddr wGameState, GS_ENTER_HIGH_SCORE_INIT
	SCR_StopCurrScript


ScoringOtherScript1_DiamondAccuracyRank:
	SCR_SetSpriteXY $38, $30
	SCR_CallTableIdxInAddr ScoringRankSpriteSources, wDiamondAccuracyRank
	SCR_StopCurrScript


ScoringOtherScript2_DiamondAccuracyTrains:
	SCR_SetSpriteXY $38, $30
	SCR_CallTableIdxInAddr ScoringTrainSpriteSources, wDiamondAccuracyTrains
	SCR_StopCurrScript


ScoringOtherScript3_StopPosAccuracyRank:
	SCR_SetSpriteXY $38, $40
	SCR_CallTableIdxInAddr ScoringRankSpriteSources, wStopPosAccuracyRank
	SCR_StopCurrScript


ScoringOtherScript4_StopPosAccuracyTrains:
	SCR_SetSpriteXY $38, $40
	SCR_CallTableIdxInAddr ScoringTrainSpriteSources, wStopPosAccuracyTrains
	SCR_StopCurrScript


ScoringOtherScript5_BrakeComfortRank:
	SCR_SetSpriteXY $38, $50
	SCR_CallTableIdxInAddr ScoringRankSpriteSources, wBrakeComfortRank
	SCR_StopCurrScript


ScoringOtherScript6_BrakeComfortTrains:
	SCR_SetSpriteXY $38, $50
	SCR_CallTableIdxInAddr ScoringTrainSpriteSources, wBrakeComfortTrains
	SCR_StopCurrScript


ScoringOtherScript7_SafetyConsiderationRank:
	SCR_SetSpriteXY $38, $60
	SCR_CallTableIdxInAddr ScoringRankSpriteSources, wSafetyConsiderationRank
	SCR_StopCurrScript


ScoringOtherScript8_SafetyConsiderationTrains:
	SCR_SetSpriteXY $38, $60
	SCR_CallTableIdxInAddr ScoringTrainSpriteSources, wSafetyConsiderationTrains
	SCR_StopCurrScript


ScoringOtherScript9_TrafficLightsSignsRank:
	SCR_SetSpriteXY $38, $70
	SCR_CallTableIdxInAddr ScoringRankSpriteSources, wTrafficLightsSignsRank
	SCR_StopCurrScript


ScoringOtherScript10_TrafficLightsSignsTrains:
	SCR_SetSpriteXY $38, $70
	SCR_CallTableIdxInAddr ScoringTrainSpriteSources, wTrafficLightsSignsTrains
	SCR_StopCurrScript


ScoringRankSpriteSources:
	dw .entry0
	dw .entry1
	dw .entry2
	dw .entry3

.entry0:
	SCR_FarSetSpriteSrc SpriteOam_093_4d53
	SCR_SingleUseRet
	
.entry1:
	SCR_FarSetSpriteSrc SpriteOam_093_4d4a
	SCR_SingleUseRet
	
.entry2:
	SCR_FarSetSpriteSrc SpriteOam_093_4d41
	SCR_SingleUseRet
	
.entry3:
	SCR_FarSetSpriteSrc SpriteOam_093_4d38
	SCR_SingleUseRet


ScoringTrainSpriteSources:
	dw .entry0
	dw .entry1
	dw .entry2
	dw .entry3
	dw .entry4
	dw .entry5

.entry0:
	SCR_UnsetSpriteSrc
	SCR_SingleUseRet

.entry1:
	SCR_FarSetSpriteSrc SpriteOam_Scoring1Train
	SCR_SingleUseRet

.entry2:
	SCR_FarSetSpriteSrc SpriteOam_Scoring2Trains
	SCR_SingleUseRet
	
.entry3:
	SCR_FarSetSpriteSrc SpriteOam_Scoring3Trains
	SCR_SingleUseRet
	
.entry4:
	SCR_FarSetSpriteSrc SpriteOam_Scoring4Trains
	SCR_SingleUseRet
	
.entry5:
	SCR_FarSetSpriteSrc SpriteOam_Scoring5Trains
	SCR_SingleUseRet


SpriteOam_Scoring1Train:
	db $01
	db $01, $41, $1a, $02


SpriteOam_Scoring2Trains:
	db $02
	db $01, $41, $1a, $02
	db $01, $49, $1a, $02


SpriteOam_Scoring3Trains:
	db $03
	db $01, $41, $1a, $02
	db $01, $49, $1a, $02
	db $01, $51, $1a, $02


SpriteOam_Scoring4Trains:
	db $04
	db $01, $41, $1a, $02
	db $01, $49, $1a, $02
	db $01, $51, $1a, $02
	db $01, $59, $1a, $02


SpriteOam_Scoring5Trains:
	db $05
	db $01, $41, $1a, $02
	db $01, $49, $1a, $02
	db $01, $51, $1a, $02
	db $01, $59, $1a, $02
	db $01, $61, $1a, $02


ScoringOtherScript11_HundredsDigitIsShuffled:
:	SCR_ExecAsmBelow
	ld   a, [wScoringShuffleNum]                                    ; $4b45
	ld   [wScoringHundredsDigit], a                                 ; $4b48
	call ProcessScriptsFromCurrLoc                                  ; $4b4b
	SCR_ResumeNextFrame
	SCR_Jump :-


ScoringOtherScript12_TensDigitIsShuffled:
:	SCR_ExecAsmBelow
	ld   a, [wScoringShuffleNum]                                    ; $4b53
	ld   [wScoringTensDigit], a                                     ; $4b56
	call ProcessScriptsFromCurrLoc                                  ; $4b59
	SCR_ResumeNextFrame
	SCR_Jump :-


ScoringOtherScript13_UnitsDigitIsShuffled:
:	SCR_ExecAsmBelow
	ld   a, [wScoringShuffleNum]                                    ; $4b61
	ld   [wScoringUnitsDigit], a                                    ; $4b64
	call ProcessScriptsFromCurrLoc                                  ; $4b67
	SCR_ResumeNextFrame
	SCR_Jump :-


ScoringOtherScript11_ShowActualHundredsDigit:
; Hundreds is blank if < 100, else 1
	SCR_ExecAsmBelow
	ld   a, [wTotalScore]                                           ; $4b6f
	cp   100                                                        ; $4b72
	ld   a, $0a                                                     ; $4b74
	jr   c, :+                                                      ; $4b76
	ld   a, $01                                                     ; $4b78
:	ld   [wScoringHundredsDigit], a                                 ; $4b7a
	call ProcessScriptsFromCurrLoc                                  ; $4b7d
	SCR_PlaySound SND_08|MAKE_SOUND_EFFECT
	SCR_StopCurrScript


ScoringOtherScript12_ShowActualTensDigit:
	SCR_ExecAsmBelow
	ld   a, [wTotalScore]                                           ; $4b84
	cp   100                                                        ; $4b87
	jr   nc, .gte_100                                               ; $4b89

; < 100, if tens == 0, jump to hide
	call BCequAinBCDform                                            ; $4b8b
	ld   a, c                                                       ; $4b8e
	swap a                                                          ; $4b8f
	and  $0f                                                        ; $4b91
	or   a                                                          ; $4b93
	jr   z, .hideTens                                               ; $4b94

; Else set tens
	jr   .setTens                                                   ; $4b96

.gte_100:
; With max score of 100, tens becomes 0
	ld   a, $00                                                     ; $4b98
	jr   .setTens                                                   ; $4b9a

.hideTens:
	ld   a, $0a                                                     ; $4b9c
	jr   .setTens                                                   ; $4b9e

.setTens:
	ld   [wScoringTensDigit], a                                     ; $4ba0
	call ProcessScriptsFromCurrLoc                                  ; $4ba3
	SCR_PlaySound SND_08|MAKE_SOUND_EFFECT
	SCR_StopCurrScript


ScoringOtherScript12_ShowActualUnitsDigit:
	SCR_StopSubScript1
	SCR_ExecAsmBelow

; Display units digit regardless of if seen tens or hundreds
	ld   a, [wTotalScore]                                           ; $4bab
	call BCequAinBCDform                                            ; $4bae
	ld   a, c                                                       ; $4bb1
	and  $0f                                                        ; $4bb2
	ld   [wScoringUnitsDigit], a                                    ; $4bb4
	call ProcessScriptsFromCurrLoc                                  ; $4bb7
	SCR_PlaySound SND_08|MAKE_SOUND_EFFECT
	SCR_StopCurrScript


ScoringSubScript1_IncShuffledNum:
; Start with displaying 0
	SCR_StoreByteInAddr wScoringShuffleNum, $00

.loop:
	SCR_Delay $02
	
; Keep between 0 and 9
	SCR_ExecAsmBelow
	ld   a, [wScoringShuffleNum]                                    ; $4bc4
	inc  a                                                          ; $4bc7
	cp   $0a                                                        ; $4bc8
	jr   c, :+                                                      ; $4bca
	xor  a                                                          ; $4bcc
:	ld   [wScoringShuffleNum], a                                    ; $4bcd
	call ProcessScriptsFromCurrLoc                                  ; $4bd0
	SCR_Jump .loop


ScoringSubScript2_LoopShuffleSound:
:	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT
	SCR_Delay $06
	SCR_Jump :-


Calculate5Scores:
; --
; -- Max final score
; --
	ld   a, [wSelectedTrainLine]                                    ; $4bdd
	cp   $04                                                        ; $4be0
	jr   z, .trainLine4                                             ; $4be2

	cp   $0a                                                        ; $4be4
	jr   z, .trainLineA                                             ; $4be6

	jr   .normalTrainLine                                           ; $4be8

.trainLine4:
	ld   h, $12                                                     ; $4bea
	ld   l, $12                                                     ; $4bec
	call GetMaxScoreForCurrLocation                                 ; $4bee
	jr   .afterTrainLineMaxScores                                   ; $4bf1

.trainLineA:
	ld   a, [wLocationIdxInTrainLine]                               ; $4bf3
	or   a                                                          ; $4bf6
	jr   nz, .normalTrainLine                                       ; $4bf7

; Train line A, location 0 - only 1 location
	call MaxScoreForCategoriesIs12h                                 ; $4bf9
	jr   .afterTrainLineMaxScores                                   ; $4bfc

.normalTrainLine:
	ld   h, $15                                                     ; $4bfe
	ld   l, $14                                                     ; $4c00
	call GetMaxScoreForCurrLocation                                 ; $4c02

.afterTrainLineMaxScores:
; --
; -- Diamond accuracy
; --
	ld   a, [wDiffOfCurrAndDestTime]                                ; $4c05
	or   a                                                          ; $4c08
	jr   z, :+                                                      ; $4c09
	dec  a                                                          ; $4c0b
:	ld   c, a                                                       ; $4c0c
	call AddOntoPenaltiesBasedOnContinues                           ; $4c0d
	ld   a, 50                                                      ; $4c10
	call CalcFinalScoreFromMaxMinusPenaltiesOverC                   ; $4c12
	ld   a, c                                                       ; $4c15
	ld   [wDiamondAccuracyScore], a                                 ; $4c16

; --
; -- Brake comfort
; --
; Start with small penalties that easily accumulate, divided by 24
	ld   a, [wSmallCounterPenaltyForUnsafeBrakingOrPoorStationAccel] ; $4c19
	ld   l, a                                                       ; $4c1c
	ld   h, $00                                                     ; $4c1d
	ld   e, 24                                                      ; $4c1f
	call HLdivmodEinLH                                              ; $4c21
	ld   c, l                                                       ; $4c24
	ld   b, $00                                                     ; $4c25

; Add penalties from larger issues
	ld   a, [wLargerCounterPenaltyForVeryUnsafeBrakingOrStops]      ; $4c27
	ld   e, a                                                       ; $4c2a
	ld   d, $00                                                     ; $4c2b

; Add penalties for leaving brake too soon
	ld   a, [wPenaltyCounterForGoingNeutralFromHighBraking]         ; $4c2d
	ld   l, a                                                       ; $4c30
	ld   h, $00                                                     ; $4c31
	add  hl, bc                                                     ; $4c33
	add  hl, de                                                     ; $4c34

; If penalty HL > $ff, use the max penalty of 50, which will give a score of 0, else use L
	ld   a, h                                                       ; $4c35
	or   a                                                          ; $4c36
	jr   nz, .maxBrakeComfortPenalty                                ; $4c37

	ld   c, l                                                       ; $4c39
	jr   :+                                                         ; $4c3a

.maxBrakeComfortPenalty:
	ld   c, 50                                                      ; $4c3c

:	call AddOntoPenaltiesBasedOnContinues                           ; $4c3e
	ld   a, 50                                                      ; $4c41
	call CalcFinalScoreFromMaxMinusPenaltiesOverC                   ; $4c43
	ld   a, c                                                       ; $4c46
	ld   [wBrakeComfortScore], a                                    ; $4c47

; --
; -- Stop position accuracy
; --
	ld   a, [wBaseStopPosPenaltyScore]                              ; $4c4a
	ld   c, a                                                       ; $4c4d
	call AddOntoPenaltiesBasedOnContinues                           ; $4c4e
	ld   a, 30                                                      ; $4c51
	call CalcFinalScoreFromMaxMinusPenaltiesOverC                   ; $4c53
	ld   a, c                                                       ; $4c56
	ld   [wStopPosAccuracyScore], a                                 ; $4c57

; --
; -- Safety consideration
; --
; Add together penalties from stopping too far out, and not following speed rules
	ld   a, [wSafetyConsiderationPenaltyFromFarStopPos]             ; $4c5a
	ld   c, a                                                       ; $4c5d
	ld   b, $00                                                     ; $4c5e
	ld   a, [wPenaltyCounterForNotDeceleratingWhenNeeded]           ; $4c60
	ld   e, a                                                       ; $4c63
	ld   d, $00                                                     ; $4c64
	ld   a, [wPenaltyCounterForNotFollowingSpeedLimit]              ; $4c66
	ld   l, a                                                       ; $4c69
	ld   h, $00                                                     ; $4c6a
	add  hl, bc                                                     ; $4c6c
	add  hl, de                                                     ; $4c6d

; If penalty HL > $ff, use the max penalty of 20, which will give a score of 0, else use L
	ld   a, h                                                       ; $4c6e
	or   a                                                          ; $4c6f
	jr   nz, .maxSafetyConsiderationPenalty                         ; $4c70

	ld   c, l                                                       ; $4c72
	jr   :+                                                         ; $4c73

.maxSafetyConsiderationPenalty:
	ld   c, 20                                                      ; $4c75

:	call AddOntoPenaltiesBasedOnContinues                           ; $4c77
	ld   a, 20                                                      ; $4c7a
	call CalcFinalScoreFromMaxMinusPenaltiesOverC                   ; $4c7c
	ld   a, c                                                       ; $4c7f
	ld   [wSafetyConsiderationScore], a                             ; $4c80

; --
; -- Traffic lights/signs
; --
; Score is affected by brake comfort-related vars, but halved (/ 48 instead of 24)
	ld   a, [wSmallCounterPenaltyForUnsafeBrakingOrPoorStationAccel] ; $4c83
	ld   l, a                                                       ; $4c86
	ld   h, $00                                                     ; $4c87
	ld   e, 48                                                      ; $4c89
	call HLdivmodEinLH                                              ; $4c8b
	ld   c, l                                                       ; $4c8e
	ld   b, $00                                                     ; $4c8f

; And leaving break too soon (/ 2 instead of not dividing)
	ld   a, [wPenaltyCounterForGoingNeutralFromHighBraking]         ; $4c91
	srl  a                                                          ; $4c94
	ld   l, a                                                       ; $4c96
	ld   h, $00                                                     ; $4c97
	add  hl, bc                                                     ; $4c99

; Specific penalties include overspeeding, and offences at the start
	ld   a, [wPenaltyValueForOverspeeding]                          ; $4c9a
	ld   c, a                                                       ; $4c9d
	add  hl, bc                                                     ; $4c9e
	ld   a, [wSmallPenaltyForDisengagingBrakeBeforeStartingGoSignal] ; $4c9f
	ld   c, a                                                       ; $4ca2
	add  hl, bc                                                     ; $4ca3
	ld   a, [wPenaltyCounterForAcceleratingBeforeStartingGoSignal]  ; $4ca4
	ld   c, a                                                       ; $4ca7
	add  hl, bc                                                     ; $4ca8

; If penalty HL > $ff, use the max penalty of 30, which will give a score of 0, else use L
	ld   a, h                                                       ; $4ca9
	or   a                                                          ; $4caa
	jr   nz, .maxTrafficLightsSignsPenalty                          ; $4cab

	ld   c, l                                                       ; $4cad
	jr   :+                                                         ; $4cae

.maxTrafficLightsSignsPenalty:
	ld   c, 30                                                      ; $4cb0

:	call AddOntoPenaltiesBasedOnContinues                           ; $4cb2
	ld   a, 30                                                      ; $4cb5
	call CalcFinalScoreFromMaxMinusPenaltiesOverC                   ; $4cb7
	ld   a, c                                                       ; $4cba
	ld   [wTrafficLightsSignsScore], a                              ; $4cbb
	ret                                                             ; $4cbe


; C - current penalty score
; Returns C as a min of $ff, or score * (1 + continues/5) with continues between 1 and 3
AddOntoPenaltiesBasedOnContinues:
; No extra penalization if we were successful our 1st time
	ld   a, [wNumContinuesForLocation]                              ; $4cbf
	or   a                                                          ; $4cc2
	ret  z                                                          ; $4cc3

; A = min(continues, 3), push our score in C
	cp   $03                                                        ; $4cc4
	jr   c, :+                                                      ; $4cc6
	ld   a, $03                                                     ; $4cc8
:	push bc                                                         ; $4cca

; HL = continues * 2 * score
	add  a                                                          ; $4ccb
	ld   l, c                                                       ; $4ccc
	ld   h, a                                                       ; $4ccd
	call HLequHtimesL                                               ; $4cce

; HL = continues * 2 * score / 10
; Add score to above
	ld   e, 10                                                      ; $4cd1
	call HLdivE_divInHLmodInD                                       ; $4cd3
	pop  bc                                                         ; $4cd6
	ld   b, $00                                                     ; $4cd7
	add  hl, bc                                                     ; $4cd9

; If h is non-0, use max penalization, else use the above calculation
	ld   a, h                                                       ; $4cda
	or   a                                                          ; $4cdb
	jr   nz, .maxPenalty                                            ; $4cdc

	ld   c, l                                                       ; $4cde
	ret                                                             ; $4cdf

.maxPenalty:
	ld   c, $ff                                                     ; $4ce0
	ret                                                             ; $4ce2


; Performs the division:
;                 /     penalties \
; C = max_score * | 1 - _________ |
;                 \         C     /
; ie the higher the penalties, the closer to 0..
; And input C being the max allowable before hitting 0
CalcFinalScoreFromMaxMinusPenaltiesOverC:
; Save penalty divisor value, get it - penalty-related value with a min of 0
	ldh  [hScoringCategoryPenaltyDivisorValue], a                   ; $4ce3
	sub  c                                                          ; $4ce5
	jr   nc, .loop                                                  ; $4ce6
	xor  a                                                          ; $4ce8

; HL = (category-penalties) * max final score
.loop:
	ld   l, a                                                       ; $4ce9
	ld   a, [wScoringMaxScoreForCategories]                         ; $4cea
	ld   h, a                                                       ; $4ced
	call HLequHtimesL                                               ; $4cee

; HL = (category-penalties) * max final score / category
	ldh  a, [hScoringCategoryPenaltyDivisorValue]                   ; $4cf1
	ld   e, a                                                       ; $4cf3
	call HLdivE_divInHLmodInD                                       ; $4cf4

; If h is somehow non-0, keep performing the described fractional multiplication
	ld   a, h                                                       ; $4cf7
	or   a                                                          ; $4cf8
	jr   nz, .loop                                                  ; $4cf9

; Calculated reduced score in L, if it's less than max score, return it in C..
	ld   a, [wScoringMaxScoreForCategories]                         ; $4cfb
	ld   e, a                                                       ; $4cfe
	ld   a, l                                                       ; $4cff
	cp   e                                                          ; $4d00
	jr   nc, .useMax                                                ; $4d01

	ld   c, a                                                       ; $4d03
	ret                                                             ; $4d04

.useMax:
; Else use the max final score
	ld   a, [wScoringMaxScoreForCategories]                         ; $4d05
	ld   c, a                                                       ; $4d08
	ret                                                             ; $4d09


GetRankAndTrainsForScoreCategs_SaveTotalScore:
; Get rank + trains for diamond accuracy
	ld   a, [wDiamondAccuracyScore]                                 ; $4d0a
	call GetRankAndTrainsNumForScoreCateg                           ; $4d0d
	ld   a, l                                                       ; $4d10
	ld   [wDiamondAccuracyRank], a                                  ; $4d11
	ld   a, h                                                       ; $4d14
	ld   [wDiamondAccuracyTrains], a                                ; $4d15

; Get rank + trains for brake comfort
	ld   a, [wBrakeComfortScore]                                    ; $4d18
	call GetRankAndTrainsNumForScoreCateg                           ; $4d1b
	ld   a, l                                                       ; $4d1e
	ld   [wBrakeComfortRank], a                                     ; $4d1f
	ld   a, h                                                       ; $4d22
	ld   [wBrakeComfortTrains], a                                   ; $4d23

; Get rank + trains for stop position accuracy
	ld   a, [wStopPosAccuracyScore]                                 ; $4d26
	call GetRankAndTrainsNumForScoreCateg                           ; $4d29
	ld   a, l                                                       ; $4d2c
	ld   [wStopPosAccuracyRank], a                                  ; $4d2d
	ld   a, h                                                       ; $4d30
	ld   [wStopPosAccuracyTrains], a                                ; $4d31

; Get rank + trains for safety consideration
	ld   a, [wSafetyConsiderationScore]                             ; $4d34
	call GetRankAndTrainsNumForScoreCateg                           ; $4d37
	ld   a, l                                                       ; $4d3a
	ld   [wSafetyConsiderationRank], a                              ; $4d3b
	ld   a, h                                                       ; $4d3e
	ld   [wSafetyConsiderationTrains], a                            ; $4d3f

; Get rank + trains for traffic lights/signs
	ld   a, [wTrafficLightsSignsScore]                              ; $4d42
	call GetRankAndTrainsNumForScoreCateg                           ; $4d45
	ld   a, l                                                       ; $4d48
	ld   [wTrafficLightsSignsRank], a                               ; $4d49
	ld   a, h                                                       ; $4d4c
	ld   [wTrafficLightsSignsTrains], a                             ; $4d4d

; Get the 5 scores in B, C, D, E, A
	ld   hl, wDiamondAccuracyScore                                  ; $4d50
	ld   a, [hl+]                                                   ; $4d53
	ld   b, a                                                       ; $4d54
	ld   a, [hl+]                                                   ; $4d55
	ld   c, a                                                       ; $4d56
	ld   a, [hl+]                                                   ; $4d57
	ld   d, a                                                       ; $4d58
	ld   a, [hl+]                                                   ; $4d59
	ld   e, a                                                       ; $4d5a
	ld   a, [hl]                                                    ; $4d5b

; Save total
	add  b                                                          ; $4d5c
	add  c                                                          ; $4d5d
	add  d                                                          ; $4d5e
	add  e                                                          ; $4d5f
	ld   [wTotalScore], a                                           ; $4d60
	ret                                                             ; $4d63


; L - full score number
GetRankAndTrainsNumForScoreCateg:
; H (A % 5) = number of trains
; L (A / 5) = rank
	ld   l, a                                                       ; $4d64
	ld   h, $00                                                     ; $4d65
	ld   e, $05                                                     ; $4d67
	call HLdivmodEinLH                                              ; $4d69

; If rank > 3 (highest)..
	ld   a, l                                                       ; $4d6c
	cp   $04                                                        ; $4d6d
	ret  c                                                          ; $4d6f

; Keep it 3, with the max number of trains
	ld   h, $05                                                     ; $4d70
	ld   l, $03                                                     ; $4d72
	ret                                                             ; $4d74


SetTrainLineCompleteAndUnlockTrainIfApplicable:
; DE = distance from station
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $4d75
	ld   e, a                                                       ; $4d78
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4d79
	ld   d, a                                                       ; $4d7c
	bit  7, a                                                       ; $4d7d
	jr   z, .afterNegCheck                                          ; $4d7f

; If negative, make diff positive
	cpl                                                             ; $4d81
	ld   d, a                                                       ; $4d82
	ld   a, e                                                       ; $4d83
	cpl                                                             ; $4d84
	ld   e, a                                                       ; $4d85

.afterNegCheck:
; Return if too far from station, eg penalties == 0
	ld   a, d                                                       ; $4d86
	or   a                                                          ; $4d87
	ret  nz                                                         ; $4d88

; Return if distance from station is not 0 or 1
	ld   a, e                                                       ; $4d89
	cp   $02                                                        ; $4d8a
	ret  nc                                                         ; $4d8c

; HL = double trainline idx into table
	ld   a, [wSelectedTrainLine]                                    ; $4d8d
	add  a                                                          ; $4d90
	ld   c, a                                                       ; $4d91
	ld   b, $00                                                     ; $4d92
	ld   hl, .trainLineLocCompleteAddresses                         ; $4d94
	add  hl, bc                                                     ; $4d97

; HL and DE is train line's base ram address for locations complete
	ld   a, [hl+]                                                   ; $4d98
	ld   h, [hl]                                                    ; $4d99
	ld   l, a                                                       ; $4d9a
	ld   e, l                                                       ; $4d9b
	ld   d, h                                                       ; $4d9c

; Set unlock idx for UnlockTrains
	ld   a, [wLocationIdxInTrainLine]                               ; $4d9d
	ld   c, a                                                       ; $4da0
	ld   [wUnlockTrainLocationIdxInTrainLine], a                    ; $4da1

; If location complete is 0, unlock its train and set it to 1
	add  hl, bc                                                     ; $4da4
	ld   a, [hl]                                                    ; $4da5
	or   a                                                          ; $4da6
	call z, UnlockTrains                                            ; $4da7
	ld   a, $01                                                     ; $4daa
	ld   [hl], a                                                    ; $4dac

; C = num stations that unlock trains
	ld   a, [wSelectedTrainLine]                                    ; $4dad
	ld   c, a                                                       ; $4db0
	ld   hl, .trainLineNumStations                                  ; $4db1
	add  hl, bc                                                     ; $4db4
	ld   c, [hl]                                                    ; $4db5

; B is num locations to check (ignore 1st)
	ld   b, MAX_LOCATIONS_IN_A_TRAINLINE-1                          ; $4db6
	ld   l, e                                                       ; $4db8
	ld   h, d                                                       ; $4db9
	inc  hl                                                         ; $4dba

; Dec from num stations if its images are unlocked
.loop:
	ld   a, [hl+]                                                   ; $4dbb
	or   a                                                          ; $4dbc
	jr   z, :+                                                      ; $4dbd
	dec  c                                                          ; $4dbf
:	dec  b                                                          ; $4dc0
	jr   nz, .loop                                                  ; $4dc1

; If not 0 (we haven't completed all stations), return
	ld   a, c                                                       ; $4dc3
	or   a                                                          ; $4dc4
	ret  nz                                                         ; $4dc5

; Return if 1st byte already set
	ld   a, [de]                                                    ; $4dc6
	or   a                                                          ; $4dc7
	ret  nz                                                         ; $4dc8

; Otherwise set 1st location as complete (whole train line complete)
	ld   a, $01                                                     ; $4dc9
	ld   [de], a                                                    ; $4dcb

; And unlock its images
	ld   a, $00                                                     ; $4dcc
	ld   [wUnlockTrainLocationIdxInTrainLine], a                    ; $4dce
	call UnlockTrains                                               ; $4dd1
	ret                                                             ; $4dd4

.trainLineLocCompleteAddresses:
	dw wTrainLineLocationsComplete+0*MAX_LOCATIONS_IN_A_TRAINLINE
	dw wTrainLineLocationsComplete+1*MAX_LOCATIONS_IN_A_TRAINLINE
	dw wTrainLineLocationsComplete+2*MAX_LOCATIONS_IN_A_TRAINLINE
	dw wTrainLineLocationsComplete+3*MAX_LOCATIONS_IN_A_TRAINLINE
	dw wTrainLineLocationsComplete+4*MAX_LOCATIONS_IN_A_TRAINLINE
	dw wTrainLineLocationsComplete+5*MAX_LOCATIONS_IN_A_TRAINLINE
	dw wTrainLineLocationsComplete+6*MAX_LOCATIONS_IN_A_TRAINLINE
	dw wTrainLineLocationsComplete+7*MAX_LOCATIONS_IN_A_TRAINLINE
	dw wTrainLineLocationsComplete+8*MAX_LOCATIONS_IN_A_TRAINLINE
	dw wTrainLineLocationsComplete+9*MAX_LOCATIONS_IN_A_TRAINLINE
	dw wTrainLineLocationsComplete+10*MAX_LOCATIONS_IN_A_TRAINLINE
	dw wTrainLineLocationsComplete+11*MAX_LOCATIONS_IN_A_TRAINLINE

.trainLineNumStations:
	db $03, $01, $04, $07
	db $01, $02, $09, $04
	db $04, $03, $01
	
	
SetSceneIdxToDisplayAfterScoringAndUnlockMovie:
; Get trainline idx into table to get scene idx to display
	ld   hl, .sceneIdxes                                            ; $4df8
	ld   a, [wSelectedTrainLine]                                    ; $4dfb
	ld   c, a                                                       ; $4dfe
	ld   b, $00                                                     ; $4dff
	add  hl, bc                                                     ; $4e01
	ld   a, [hl]                                                    ; $4e02
	ld   [wJustUnlockedStageCompleteSceneIdx], a                    ; $4e03

; Movies unlocked idx 0 is the intro cutscene, these take up idxes 1-9
	inc  a                                                          ; $4e06
	ld   c, a                                                       ; $4e07
	ld   b, $00                                                     ; $4e08
	ld   hl, wMoviesUnlocked                                        ; $4e0a
	add  hl, bc                                                     ; $4e0d
	ld   [hl], $01                                                  ; $4e0e

; Finally save it
	call SaveSaveData                                               ; $4e10
	ret                                                             ; $4e13

.sceneIdxes:
	db $00, $02, $04, $00, $02
	db $01, $05, $07, $06, $08
	db $03


; H - max score for category (score if not limited by L)
; L - max attainable score for category
GetMaxScoreForCurrLocation:
	push hl                                                         ; $4e1f

; HL = location idx in train line * max score for category
	ld   a, [wLocationIdxInTrainLine]                               ; $4e20
	ld   l, a                                                       ; $4e23
	call HLequHtimesL                                               ; $4e24

; E = final location idx for train line
	ld   de, FinalLocationIdxInTrainLine                            ; $4e27
	ld   a, [wSelectedTrainLine]                                    ; $4e2a
	add  e                                                          ; $4e2d
	ld   e, a                                                       ; $4e2e
	ld   a, d                                                       ; $4e2f
	adc  $00                                                        ; $4e30
	ld   d, a                                                       ; $4e32
	ld   a, [de]                                                    ; $4e33
	ld   e, a                                                       ; $4e34

; A = loc idx * max score / final loc idx, ie % progress in trainline * max score
	call HLdivmodEinLH                                              ; $4e35
	ld   a, l                                                       ; $4e38
	pop  hl                                                         ; $4e39

; The max actual score is A or the orig limit param L
	cp   l                                                          ; $4e3a
	jr   c, :+                                                      ; $4e3b
	ld   a, l                                                       ; $4e3d
:	ld   [wScoringMaxScoreForCategories], a                         ; $4e3e
	ret                                                             ; $4e41


MaxScoreForCategoriesIs12h:
	ld   a, $12                                                     ; $4e42
	ld   [wScoringMaxScoreForCategories], a                         ; $4e44
	ret                                                             ; $4e47


ResetScoringPenaltyValues::
	xor  a                                                          ; $4e48
	ld   [wDiffOfCurrAndDestTime], a                                ; $4e49
	ld   [wSmallCounterPenaltyForUnsafeBrakingOrPoorStationAccel], a ; $4e4c
	ld   [wLargerCounterPenaltyForVeryUnsafeBrakingOrStops], a      ; $4e4f
	ld   [wPenaltyCounterForGoingNeutralFromHighBraking], a         ; $4e52
	ld   [wBaseStopPosPenaltyScore], a                              ; $4e55
	ld   [wSafetyConsiderationPenaltyFromFarStopPos], a             ; $4e58
	ld   [wPenaltyCounterForNotDeceleratingWhenNeeded], a           ; $4e5b
	ld   [wPenaltyCounterForNotFollowingSpeedLimit], a              ; $4e5e
	ld   [wPenaltyValueForOverspeeding], a                          ; $4e61
	ld   [wSmallPenaltyForDisengagingBrakeBeforeStartingGoSignal], a ; $4e64
	ld   [wPenaltyCounterForAcceleratingBeforeStartingGoSignal], a  ; $4e67
	ld   [wNumContinuesForLocation], a                              ; $4e6a
	ld   [wScoringMaxScoreForCategories], a                         ; $4e6d
	ld   [wOverSped], a                                             ; $4e70
	ld   [wCurrTrainLineOverspeedingSpeed], a                       ; $4e73
	ld   [wUnusedPenaltyCounterForNotSireningWhenPrompted], a       ; $4e76
	ld   [wUnusedPenaltyValueForBollardClash], a                    ; $4e79
	ret                                                             ; $4e7c


GetTrainLinesOverspeedingSpeed::
; HL is trainline single-idx into table
	ld   a, [wSelectedTrainLine]                                    ; $4e7d
	ld   c, a                                                       ; $4e80
	ld   b, $00                                                     ; $4e81
	ld   hl, .speeds                                                ; $4e83
	add  hl, bc                                                     ; $4e86

; Set overspeeding vars, and reset brake release on go flag
	ld   a, [hl]                                                    ; $4e87
	ld   [wCurrTrainLineOverspeedingSpeed], a                       ; $4e88
	ld   a, $00                                                     ; $4e8b
	ld   [wOverSped], a                                             ; $4e8d
	ld   a, $00                                                     ; $4e90
	ld   [wReleasedBrakeBeforeStartingGoSignal], a                  ; $4e92
	ret                                                             ; $4e95

.speeds:
	db 114
	db 128
	db 103
	db 114
	db 128
	db 153
	db 103
	db 117
	db 117
	db 136
	db 245


GetDiffOfCurrAndDestTimeMaxFFh:
; HL = current num seconds (excluding hour)
	ld   a, [wCurrTimeSeconds]                                      ; $4ea1
	ld   c, a                                                       ; $4ea4
	ld   a, [wCurrTimeMinutes]                                      ; $4ea5
	ld   h, a                                                       ; $4ea8
	call HLequHtimes60plusC                                         ; $4ea9
	push hl                                                         ; $4eac

; HL = dest num seconds (excluding hour)
	ld   a, [wDestinationTimeSeconds]                               ; $4ead
	ld   c, a                                                       ; $4eb0
	ld   a, [wDestinationTimeMinutes]                               ; $4eb1
	ld   h, a                                                       ; $4eb4
	call HLequHtimes60plusC                                         ; $4eb5

; DE from curr, do HL = dest - curr
	pop  de                                                         ; $4eb8
	ld   a, l                                                       ; $4eb9
	sub  e                                                          ; $4eba
	ld   l, a                                                       ; $4ebb
	ld   a, h                                                       ; $4ebc
	sbc  d                                                          ; $4ebd
	ld   h, a                                                       ; $4ebe
	jr   nc, .afterDiff                                             ; $4ebf

; If dest < curr (we ran over time), neg HL to get absolute diff
	ld   a, l                                                       ; $4ec1
	cpl                                                             ; $4ec2
	ld   l, a                                                       ; $4ec3
	ld   a, h                                                       ; $4ec4
	cpl                                                             ; $4ec5
	ld   h, a                                                       ; $4ec6
	inc  hl                                                         ; $4ec7

.afterDiff:
; If diff > $100, keep it $ff
	ld   a, h                                                       ; $4ec8
	or   a                                                          ; $4ec9
	jr   nz, .setMax                                                ; $4eca

	ld   c, l                                                       ; $4ecc
	ld   hl, wDiffOfCurrAndDestTime                                 ; $4ecd
	call AddCToByteInHL_maxFFh                                      ; $4ed0
	ret                                                             ; $4ed3

.setMax:
	ld   a, $ff                                                     ; $4ed4
	ld   [wDiffOfCurrAndDestTime], a                                ; $4ed6
	ret                                                             ; $4ed9


CalculateBaseStopPosPenalty:
; DE = distance to station
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $4eda
	ld   e, a                                                       ; $4edd
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4ede
	ld   d, a                                                       ; $4ee1
	bit  7, a                                                       ; $4ee2
	jr   z, .afterNegCheck                                          ; $4ee4

; If negative, make it positive
	ld   a, e                                                       ; $4ee6
	cpl                                                             ; $4ee7
	ld   e, a                                                       ; $4ee8
	ld   a, d                                                       ; $4ee9
	cpl                                                             ; $4eea
	ld   d, a                                                       ; $4eeb
	inc  de                                                         ; $4eec

.afterNegCheck:
; Jump, eg if penalty == 0
	ld   a, d                                                       ; $4eed
	or   a                                                          ; $4eee
	jr   nz, .farFromStation                                        ; $4eef

; Add distance
	ld   c, e                                                       ; $4ef1
	ld   hl, wBaseStopPosPenaltyScore                               ; $4ef2
	call AddCToByteInHL_maxFFh                                      ; $4ef5

; if distance >= 20, add 10 penalty pts for safety consideration
	ld   a, c                                                       ; $4ef8
	cp   20                                                         ; $4ef9
	ret  c                                                          ; $4efb

	ld   hl, wSafetyConsiderationPenaltyFromFarStopPos              ; $4efc
	ld   c, 10                                                      ; $4eff
	call AddCToByteInHL_maxFFh                                      ; $4f01
	ret                                                             ; $4f04

.farFromStation:
; Max of $ff
	ld   a, $ff                                                     ; $4f05
	ld   [wBaseStopPosPenaltyScore], a                              ; $4f07

; As above, add 10 penalty pts for safety consideration
	ld   hl, wSafetyConsiderationPenaltyFromFarStopPos              ; $4f0a
	ld   c, 10                                                      ; $4f0d
	call AddCToByteInHL_maxFFh                                      ; $4f0f
	ret                                                             ; $4f12


GameState1c_StageCompleteInit_def::
; No fade, scripts, and oam
	ld   a, $00                                                     ; $4f13
	ld   [wLoadPalettesFromRam], a                                  ; $4f15
	call InitScriptStructs                                          ; $4f18
	call ClearScriptsOamHideAllOam                                  ; $4f1b

; Both vblank and lcdc interrupt funcs are stubbed
	di                                                              ; $4f1e
	ld   a, [wVBlankInterruptFunc]                                  ; $4f1f
	ld   l, a                                                       ; $4f22
	ld   a, [wVBlankInterruptFunc+1]                                ; $4f23
	ld   h, a                                                       ; $4f26
	ld   a, LOW(StubInterruptFunc)                                  ; $4f27
	ld   [wVBlankInterruptFunc], a                                  ; $4f29
	ld   a, HIGH(StubInterruptFunc)                                 ; $4f2c
	ld   [wVBlankInterruptFunc+1], a                                ; $4f2e

	ld   a, [wLCDCInterruptFunc]                                    ; $4f31
	ld   l, a                                                       ; $4f34
	ld   a, [wLCDCInterruptFunc+1]                                  ; $4f35
	ld   h, a                                                       ; $4f38
	ld   a, LOW(StubInterruptFunc)                                  ; $4f39
	ld   [wLCDCInterruptFunc], a                                    ; $4f3b
	ld   a, HIGH(StubInterruptFunc)                                 ; $4f3e
	ld   [wLCDCInterruptFunc+1], a                                  ; $4f40

; Allow vblank interrupt and turn on LCD
	ld   a, $00                                                     ; $4f43
	ldh  [rIF], a                                                   ; $4f45
	ld   a, $01                                                     ; $4f47
	ldh  [rIE], a                                                   ; $4f49
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $4f4b
	ldh  [rLCDC], a                                                 ; $4f4d
	ld   a, $00                                                     ; $4f4f
	ldh  [rSTAT], a                                                 ; $4f51
	ei                                                              ; $4f53
	M_StartMainScript 0, StageCompleteScript

GameState1d_StageCompleteMain_def::
	jp   ResetVBlankQueueData                                       ; $4f5d


StageCompleteScript:
; Set main vblank queuing state
	SCR_StoreByteInAddr wGameState, GS_STAGE_COMPLETE_MAIN
	SCR_ExecAsmBelow

; Branch out if not from picture book
	ld   a, [wPictureBookPrevScreen]                                ; $4f65
	cp   $02                                                        ; $4f68
	ld   a, [wJustUnlockedStageCompleteSceneIdx]                    ; $4f6a
	ld   [wStageCompleteSceneIdx], a                                ; $4f6d
	jr   nz, :+                                                     ; $4f70

; From picture book - store 0-indexed cutscene (0-9)
	ld   a, [wPictureBookSubMenuOptionIdx]                          ; $4f72
	sub  $02                                                        ; $4f75
	ld   [wStageCompleteSceneIdx], a                                ; $4f77

; Base tile data hdma details from idx 5 in attribute table
:	ld   c, $05                                                     ; $4f7a
	call GetStageCompleteIdxAttribute                               ; $4f7c
	ld   a, [hl+]                                                   ; $4f7f
	ld   [wStageCompleteTileDataBank], a                            ; $4f80
	ld   a, [hl+]                                                   ; $4f83
	ld   [wStageCompleteTileDataAddr], a                            ; $4f84
	ld   a, [hl]                                                    ; $4f87
	ld   [wStageCompleteTileDataAddr+1], a                          ; $4f88

; Load all black palettes - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $4f8b
	ld   hl, Palettes_AllBlack                                      ; $4f8d
	call SetBGPaletteSrc                                            ; $4f90
	xor  a                                                          ; $4f93
	ld   [wPaletteFadeAmount], a                                    ; $4f94
	ld   [wLoadPalettesFromRam], a                                  ; $4f97
	ld   a, $01                                                     ; $4f9a
	ld   [wLoadBGPalettesFromRom], a                                ; $4f9c

	ld   b, BANK(Palettes_AllBlack)                                 ; $4f9f
	ld   hl, Palettes_AllBlack                                      ; $4fa1
	call SetOBJPaletteSrc                                           ; $4fa4
	xor  a                                                          ; $4fa7
	ld   [wPaletteFadeAmount], a                                    ; $4fa8
	ld   [wLoadPalettesFromRam], a                                  ; $4fab
	ld   a, $01                                                     ; $4fae
	ld   [wLoadOBJPalettesFromRom], a                               ; $4fb0

	call ProcessScriptsFromCurrLoc                                  ; $4fb3
	SCR_ResumeNextFrame

; Bank 0 tile data from $8800-$91ff
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $4fb8
	ldh  [rVBK], a                                                  ; $4fba
	ld   b, BANK(Gfx_StageCompleteMainBG)                           ; $4fbc
	ld   hl, Gfx_StageCompleteMainBG-$800                           ; $4fbe
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $4fc1

; Bank 1 tile data from $8000-$8fff
	ld   a, $01                                                     ; $4fc4
	ldh  [rVBK], a                                                  ; $4fc6
	ld   b, BANK(Gfx_StageCompleteCongrats)                         ; $4fc8
	ld   hl, Gfx_StageCompleteCongrats                              ; $4fca
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $4fcd
	call ProcessScriptsFromCurrLoc                                  ; $4fd0
	SCR_ResumeNextFrame
	
; Get B, HL from idx 2 for scene idx attributes
	SCR_ExecAsmBelow
	ld   a, [wStageCompleteSceneIdx]                                ; $4fd5
	ld   c, $02                                                     ; $4fd8
	call GetStageCompleteIdxAttribute                               ; $4fda
	ld   a, [hl+]                                                   ; $4fdd
	ld   b, a                                                       ; $4fde
	ld   a, [hl+]                                                   ; $4fdf
	ld   h, [hl]                                                    ; $4fe0
	ld   l, a                                                       ; $4fe1

; Enqueue details to tile map
	ld   a, b                                                       ; $4fe2
	ld   de, _SCRN0                                                 ; $4fe3
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $4fe6
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $4fe9
	xor  a                                                          ; $4fec
	call VBlankEnqueue_SetVramBank                                  ; $4fed
	call ProcessScriptsFromCurrLoc                                  ; $4ff0
	SCR_ResumeNextFrame
	
; Get B, HL from idx 2 for scene idx attributes
	SCR_ExecAsmBelow
	ld   a, [wStageCompleteSceneIdx]                                ; $4ff5
	ld   c, $02                                                     ; $4ff8
	call GetStageCompleteIdxAttribute                               ; $4ffa
	ld   a, [hl+]                                                   ; $4ffd
	ld   b, a                                                       ; $4ffe
	ld   a, [hl+]                                                   ; $4fff
	ld   h, [hl]                                                    ; $5000
	ld   l, a                                                       ; $5001

; Add to get past tile map, then enqueue these tile attrs
	ld   de, SCREEN_TILE_HEIGHT * SCREEN_TILE_WIDTH                 ; $5002
	add  hl, de                                                     ; $5005
	ld   a, b                                                       ; $5006
	ld   de, _SCRN0                                                 ; $5007
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $500a
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $500d
	ld   a, $01                                                     ; $5010
	call VBlankEnqueue_SetVramBank                                  ; $5012
	call ProcessScriptsFromCurrLoc                                  ; $5015
	SCR_ResumeNextFrame
	
; Get palette source from idx 0 in attribute table
	SCR_ExecAsmBelow
	ld   a, [wStageCompleteSceneIdx]                                ; $501a
	ld   c, $00                                                     ; $501d
	call GetStageCompleteIdxAttribute                               ; $501f
	ld   a, [hl+]                                                   ; $5022
	ld   h, [hl]                                                    ; $5023
	ld   l, a                                                       ; $5024

; Load palettes - to fade in from black
	ld   b, BANK(BGPalettes_StageComplete1)                         ; $5025
	call SetBGPaletteSrc                                            ; $5027
	ld   a, $20                                                     ; $502a
	ld   [wPaletteFadeAmount], a                                    ; $502c
	ld   a, $01                                                     ; $502f
	ld   [wLoadPalettesFromRam], a                                  ; $5031
	xor  a                                                          ; $5034
	ld   [wBitsSetPerOBJPaletteFade], a                             ; $5035
	ld   a, $ff                                                     ; $5038
	ld   [wBitsSetPerBGPaletteFade], a                              ; $503a
	call ProcessScriptsFromCurrLoc                                  ; $503d
	SCR_ResumeNextFrame
	
; Set vblank interrupt func, fade in and play sound
	SCR_ExecAsmBelow
	ld   a, [wVBlankInterruptFunc]                                  ; $5042
	ld   l, a                                                       ; $5045
	ld   a, [wVBlankInterruptFunc+1]                                ; $5046
	ld   h, a                                                       ; $5049
	ld   a, LOW(VBlankInterruptFunc_StageComplete)                  ; $504a
	ld   [wVBlankInterruptFunc], a                                  ; $504c
	ld   a, HIGH(VBlankInterruptFunc_StageComplete)                 ; $504f
	ld   [wVBlankInterruptFunc+1], a                                ; $5051
	call ProcessScriptsFromCurrLoc                                  ; $5054
	SCR_ResumeNextFrame
	SCR_Call Script_FadeIn
	SCR_PlaySound MUS_07

; Main loop for animation - keep vblank interrupt enabled
	SCR_SetCounter1 $2d
:	SCR_Delay $03
	
	SCR_ExecAsmBelow
	ld   a, [wVBlankInterruptFunc]                                  ; $5062
	ld   l, a                                                       ; $5065
	ld   a, [wVBlankInterruptFunc+1]                                ; $5066
	ld   h, a                                                       ; $5069
	ld   a, LOW(VBlankInterruptFunc_StageComplete)                  ; $506a
	ld   [wVBlankInterruptFunc], a                                  ; $506c
	ld   a, HIGH(VBlankInterruptFunc_StageComplete)                 ; $506f
	ld   [wVBlankInterruptFunc+1], a                                ; $5071
	call ProcessScriptsFromCurrLoc                                  ; $5074
	SCR_DecCounter1_JNE :-
	SCR_ResumeNextFrame

; Fade out, then set next game state
	SCR_Call Script_FadeOut
	SCR_StoreByteInAddr wGameState, GS_CONGRATS_INIT
	SCR_StopCurrScript
	SCR_ResumeNextFrame


; A - stage complete scene idx
; C - attribute idx
GetStageCompleteIdxAttribute:
; BC = 8a + c
	add  a                                                          ; $5084
	add  a                                                          ; $5085
	add  a                                                          ; $5086
	add  c                                                          ; $5087
	ld   c, a                                                       ; $5088
	ld   b, $00                                                     ; $5089

; Return with HL = offset into table
	ld   hl, .table                                                 ; $508b
	add  hl, bc                                                     ; $508e
	ret                                                             ; $508f

.table:
macro StageCompleteSceneSources
	dw \1
	db BANK(\2)
	dw \2
	db BANK(\3)
	dw \3
endm
	StageCompleteSceneSources BGPalettes_StageComplete1, TileMapAndAttr_StageComplete1, Gfx_StageCompleteAnimation1
	StageCompleteSceneSources BGPalettes_StageComplete2, TileMapAndAttr_StageComplete2, Gfx_StageCompleteAnimation2
	StageCompleteSceneSources BGPalettes_StageComplete3, TileMapAndAttr_StageComplete3, Gfx_StageCompleteAnimation3
	StageCompleteSceneSources BGPalettes_StageComplete4, TileMapAndAttr_StageComplete4, Gfx_StageCompleteAnimation4
	StageCompleteSceneSources BGPalettes_StageComplete5, TileMapAndAttr_StageComplete5, Gfx_StageCompleteAnimation5
	StageCompleteSceneSources BGPalettes_StageComplete6, TileMapAndAttr_StageComplete6, Gfx_StageCompleteAnimation6
	StageCompleteSceneSources BGPalettes_StageComplete7, TileMapAndAttr_StageComplete7, Gfx_StageCompleteAnimation7
	StageCompleteSceneSources BGPalettes_StageComplete8, TileMapAndAttr_StageComplete8, Gfx_StageCompleteAnimation8
	StageCompleteSceneSources BGPalettes_StageComplete9, TileMapAndAttr_StageComplete9, Gfx_StageCompleteAnimation9


GameState1e_CreditsInit_def::
; No fade
	ld   a, $00                                                     ; $50d8
	ld   [wLoadPalettesFromRam], a                                  ; $50da

; Trash curr vblank func and set stub
	di                                                              ; $50dd
	ld   a, [wVBlankInterruptFunc]                                  ; $50de
	ld   l, a                                                       ; $50e1
	ld   a, [wVBlankInterruptFunc+1]                                ; $50e2
	ld   h, a                                                       ; $50e5
	ld   a, LOW(StubInterruptFunc)                                  ; $50e6
	ld   [wVBlankInterruptFunc], a                                  ; $50e8
	ld   a, HIGH(StubInterruptFunc)                                 ; $50eb
	ld   [wVBlankInterruptFunc+1], a                                ; $50ed

; Trash curr lcdc func and set stub
	ld   a, [wLCDCInterruptFunc]                                    ; $50f0
	ld   l, a                                                       ; $50f3
	ld   a, [wLCDCInterruptFunc+1]                                  ; $50f4
	ld   h, a                                                       ; $50f7
	ld   a, LOW(StubInterruptFunc)                                  ; $50f8
	ld   [wLCDCInterruptFunc], a                                    ; $50fa
	ld   a, HIGH(StubInterruptFunc)                                 ; $50fd
	ld   [wLCDCInterruptFunc+1], a                                  ; $50ff

; Allow vblank int only and turn on LCD
	ld   a, $00                                                     ; $5102
	ldh  [rIF], a                                                   ; $5104
	ld   a, IEF_VBLANK                                              ; $5106
	ldh  [rIE], a                                                   ; $5108
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $510a
	ldh  [rLCDC], a                                                 ; $510c
	ld   a, $00                                                     ; $510e
	ldh  [rSTAT], a                                                 ; $5110
	ei                                                              ; $5112

; Clear scripts and oam
	call InitScriptStructs                                          ; $5113
	call ClearScriptsOamHideAllOam                                  ; $5116

; Start scripts
	M_StartMainScript 0, CreditsScript0
	M_StartMainScript 2, CreditsScript2_WaitUntilStartPressed

; Clear flags used for exiting state
	xor  a                                                          ; $512b
	ld   [wCreditsStartPressed], a                                  ; $512c
	ld   [wCreditsLoadingNewSpriteTileData], a                      ; $512f

GameState1f_CreditsMain_def::
	jp   ResetVBlankQueueData                                       ; $5132


CreditsScript0:
; Set main state and reset image idx and scroll counter
	SCR_StoreByteInAddr wGameState, GS_CREDITS_MAIN
	SCR_ExecAsmBelow
	xor  a                                                          ; $513a
	ld   [wCreditsScrollCounter], a                                 ; $513b
	ld   [wCreditsScrollCounter+1], a                               ; $513e
	ld   [wCreditsSpriteImageIdx], a                                ; $5141

; Set BG and OBJ palettes to black - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $5144
	ld   hl, Palettes_AllBlack                                      ; $5146
	call SetBGPaletteSrc                                            ; $5149
	xor  a                                                          ; $514c
	ld   [wPaletteFadeAmount], a                                    ; $514d
	ld   [wLoadPalettesFromRam], a                                  ; $5150
	ld   a, $01                                                     ; $5153
	ld   [wLoadBGPalettesFromRom], a                                ; $5155

	ld   b, BANK(Palettes_AllBlack)                                 ; $5158
	ld   hl, Palettes_AllBlack                                      ; $515a
	call SetOBJPaletteSrc                                           ; $515d
	xor  a                                                          ; $5160
	ld   [wPaletteFadeAmount], a                                    ; $5161
	ld   [wLoadPalettesFromRam], a                                  ; $5164
	ld   a, $01                                                     ; $5167
	ld   [wLoadOBJPalettesFromRom], a                               ; $5169

	call ProcessScriptsFromCurrLoc                                  ; $516c
	SCR_ResumeNextFrame
	
; Load tile data for vram bank 1, then 0 (from $8800-$97ff)
	SCR_ExecAsmBelow
	ld   a, $01                                                     ; $5171
	ldh  [rVBK], a                                                  ; $5173
	ld   b, BANK(Gfx_CreditsBank1)                                  ; $5175
	ld   hl, Gfx_CreditsBank1                                       ; $5177
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $517a

	ld   a, $00                                                     ; $517d
	ldh  [rVBK], a                                                  ; $517f
	ld   b, BANK(Gfx_CreditsBank0)                                  ; $5181
	ld   hl, Gfx_CreditsBank0-$800                                  ; $5183
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $5186

	call ProcessScriptsFromCurrLoc                                  ; $5189
	SCR_ResumeNextFrame

; Load tile map
	SCR_ExecAsmBelow
	ld   de, _SCRN0                                                 ; $518e
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $5191
	ld   hl, TileMap_Credits                                        ; $5194
	ld   a, BANK(TileMap_Credits)                                   ; $5197
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $5199
	xor  a                                                          ; $519c
	call VBlankEnqueue_SetVramBank                                  ; $519d
	call ProcessScriptsFromCurrLoc                                  ; $51a0
	SCR_ResumeNextFrame
	
; Load tile attr
	SCR_ExecAsmBelow
	ld   de, _SCRN0                                                 ; $51a5
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $51a8
	ld   hl, TileAttr_Credits                                       ; $51ab
	ld   a, BANK(TileAttr_Credits)                                  ; $51ae
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $51b0
	ld   a, $01                                                     ; $51b3
	call VBlankEnqueue_SetVramBank                                  ; $51b5
	call ProcessScriptsFromCurrLoc                                  ; $51b8
	SCR_ResumeNextFrame
	
; Load BG palettes - to fade in from black
	SCR_ExecAsmBelow
	ld   b, BANK(BGPalettes_Credits)                                ; $51bd
	ld   hl, BGPalettes_Credits                                     ; $51bf
	call SetBGPaletteSrc                                            ; $51c2
	ld   a, $20                                                     ; $51c5
	ld   [wPaletteFadeAmount], a                                    ; $51c7
	ld   a, $01                                                     ; $51ca
	ld   [wLoadPalettesFromRam], a                                  ; $51cc
	call ProcessScriptsFromCurrLoc                                  ; $51cf

; Load in image behind BG
	SCR_FarSetSpriteSrc SpriteOam_CreditsImage
	SCR_SetSpriteXY $38, $30

; Fade sprite in, then after a delay, fade BG text in
	SCR_CreateOtherScript 1, CreditsScript1_LoadSpriteTileDataAndPalettes
	SCR_Delay $3c
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $ff
	SCR_StoreByteInAddr wBitsSetPerOBJPaletteFade, $00
	SCR_Call Script_FadeIn
	
; Jump if E3, 2 stars..
	SCR_ExecAsmBelow
	ld   a, [wSelectedTrainLine]                                    ; $51ec
	cp   $01                                                        ; $51ef
	jr   z, .specialCredits                                         ; $51f1

; If E3, 5 stars..
	cp   $04                                                        ; $51f3
	jr   z, .specialCredits                                         ; $51f5

; Or if special trainline
	cp   $0a                                                        ; $51f7
	jr   z, .specialCredits                                         ; $51f9

; Unlock movie 11, save it and continue
	ld   a, $01                                                     ; $51fb
	ld   [wMoviesUnlocked+10], a                                    ; $51fd
	call SaveSaveData                                               ; $5200
	ld   de, .scriptFromMovie11                                     ; $5203
	jp   ProcessScriptsFromDE                                       ; $5206

.specialCredits:
; Unlock movie 12, save it and continue
	ld   a, $01                                                     ; $5209
	ld   [wMoviesUnlocked+11], a                                    ; $520b
	call SaveSaveData                                               ; $520e
	call ProcessScriptsFromCurrLoc                                  ; $5211
	SCR_PlaySound MUS_02
	SCR_Jump :+

.scriptFromMovie11:
	SCR_PlaySound MUS_0d
	
:	SCR_Delay $5a
	SCR_StartSubScript1 CreditsScript0SubScript1_HandleScroll

; --
; -- Loop 1
; --
; Outer loop 6 times, for additional 6 sprite images
	SCR_SetCounter1 $06
.loop1:
	SCR_SetCounter2 $04
.loop2:
	SCR_SetCounter3 $52
.loop3:
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow

; If start pressed and tile data loaded, exit
	ld   a, [wCreditsStartPressed]                                  ; $5229
	or   a                                                          ; $522c
	jr   z, .toNextLoop                                             ; $522d

	ld   a, [wCreditsLoadingNewSpriteTileData]                      ; $522f
	or   a                                                          ; $5232
	jp   z, .exitCredits                                            ; $5233

.toNextLoop:
; Else inc scroll counter
	ld   hl, wCreditsScrollCounter                                  ; $5236
	ld   a, [hl+]                                                   ; $5239
	ld   c, a                                                       ; $523a
	ld   a, [hl-]                                                   ; $523b
	ld   b, a                                                       ; $523c
	inc  bc                                                         ; $523d
	ld   a, c                                                       ; $523e
	ld   [hl+], a                                                   ; $523f
	ld   [hl], b                                                    ; $5240
	call ProcessScriptsFromCurrLoc                                  ; $5241

; Load new BG image in
	SCR_DecCounter3_JNE .loop3
	SCR_DecCounter2_JNE .loop2
	SCR_StoreByteInAddr wCreditsLoadingNewSpriteTileData, $01
	SCR_StartSubScript2 CreditsScript0SubScript2_SwapOutSpriteImage
	SCR_DecCounter1_JNE .loop1

; --
; -- Loop 2
; --
	SCR_SetCounter1 $04
.loop1_2:
	SCR_SetCounter2 $2c

.loop2_2:
	SCR_ResumeNextFrame
	
; If start pressed and tile data loaded, exit
	SCR_ExecAsmBelow
	ld   a, [wCreditsStartPressed]                                  ; $525b
	or   a                                                          ; $525e
	jr   z, .toNextLoop2                                            ; $525f

	ld   a, [wCreditsLoadingNewSpriteTileData]                      ; $5261
	or   a                                                          ; $5264
	jp   z, .exitCredits                                            ; $5265

.toNextLoop2:
; Else inc scroll counter
	ld   hl, wCreditsScrollCounter                                  ; $5268
	ld   a, [hl+]                                                   ; $526b
	ld   c, a                                                       ; $526c
	ld   a, [hl-]                                                   ; $526d
	ld   b, a                                                       ; $526e
	inc  bc                                                         ; $526f
	ld   a, c                                                       ; $5270
	ld   [hl+], a                                                   ; $5271
	ld   [hl], b                                                    ; $5272
	call ProcessScriptsFromCurrLoc                                  ; $5273

; Stop scroll subscript when done
	SCR_DecCounter2_JNE .loop2_2
	SCR_DecCounter1_JNE .loop1_2
	SCR_StopSubScript1

; Wait until A pressed to exit
:	SCR_ResumeNextFrame
	
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $527f
	bit  PADB_A, a                                                  ; $5282
	jr   nz, .exitCredits                                           ; $5284

	ld   de, :-                                                     ; $5286
	jp   ProcessScriptsFromDE                                       ; $5289

.exitCredits:
; Stop scroll and sprite image subscripts, then fade in
	call ProcessScriptsFromCurrLoc                                  ; $528c
	SCR_StopSubScript1
	SCR_StopSubScript2
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $ff
	SCR_StoreByteInAddr wBitsSetPerOBJPaletteFade, $ff
	SCR_Call Script_FadeOut
	SCR_PlaySound MUS_NULL
	
; Enter hi-score if we didn't just come from picture book
	SCR_ExecAsmBelow
	ld   b, GS_ENTER_HIGH_SCORE_INIT                                ; $529f
	ld   a, [wPictureBookPrevScreen]                                ; $52a1
	cp   $02                                                        ; $52a4
	jr   nz, :+                                                     ; $52a6
	ld   b, GS_PICTURE_BOOK_INIT                                    ; $52a8
:	ld   a, b                                                       ; $52aa
	ld   [wGameState], a                                            ; $52ab
	call ProcessScriptsFromCurrLoc                                  ; $52ae
	SCR_StopCurrScript
	SCR_ResumeNextFrame


CreditsScript0SubScript1_HandleScroll:
.loop:
	SCR_ExecAsmBelow

; BC = scroll counter
	ld   hl, wCreditsScrollCounter+1                                ; $52b4
	ld   a, [hl-]                                                   ; $52b7
	ld   b, a                                                       ; $52b8

; BC /= 4 = next scy (bug: this should be loading into C)
	ld   a, [hl]                                                    ; $52b9
	srl  b                                                          ; $52ba
	rr   c                                                          ; $52bc
	srl  b                                                          ; $52be
	rr   c                                                          ; $52c0
	ld   a, c                                                       ; $52c2
	ld   [wSCY], a                                                  ; $52c3
	and  $07                                                        ; $52c6
	jr   nz, .toLoop                                                ; $52c8

; Every 8 SCYs (or every tile), HL = $90+SCY
	ld   a, $90                                                     ; $52ca
	add  c                                                          ; $52cc
	ld   l, a                                                       ; $52cd
	ld   h, $00                                                     ; $52ce

; HL *= 4, ie $240+4SCY, ie every 8 SCY, HL = next row off-screen
; Push that offset from screen 0
	add  hl, hl                                                     ; $52d0
	add  hl, hl                                                     ; $52d1
	ld   de, _SCRN0                                                 ; $52d2
	add  hl, de                                                     ; $52d5
	push hl                                                         ; $52d6

; HL = SCY, push that divided by 2
	ld   h, b                                                       ; $52d7
	ld   l, c                                                       ; $52d8
	srl  h                                                          ; $52d9
	rr   l                                                          ; $52db
	push hl                                                         ; $52dd

; SCY/2 *= 4, pop SCY/2 and add it on (SCY * 2.5)
; ie every 8 SCYs, this increments by 20 (GB_TILE_WIDTH)
	add  hl, hl                                                     ; $52de
	add  hl, hl                                                     ; $52df
	pop  de                                                         ; $52e0
	add  hl, de                                                     ; $52e1

; HL = offset into table, pop off-screen addr and re-push
	ld   de, TileMap_ScrollingCredits                               ; $52e2
	add  hl, de                                                     ; $52e5
	pop  de                                                         ; $52e6
	push de                                                         ; $52e7

; Preserve offset into table, then enqueue to set tile map
	push hl                                                         ; $52e8
	ldbc $01, SCREEN_TILE_WIDTH                                     ; $52e9
	ld   a, BANK(TileMap_ScrollingCredits)                          ; $52ec
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $52ee
	xor  a                                                          ; $52f1
	call VBlankEnqueue_SetVramBank                                  ; $52f2

; Get offset into table + 0x6cc for tile attr $14 bytes, and pop same dest
	pop  hl                                                         ; $52f5
	ld   de, TileAttr_ScrollingCredits-TileMap_ScrollingCredits     ; $52f6
	add  hl, de                                                     ; $52f9
	pop  de                                                         ; $52fa
	ldbc $01, SCREEN_TILE_WIDTH                                     ; $52fb
	ld   a, BANK(TileAttr_ScrollingCredits)                         ; $52fe
	call VBlankEnqueue_CopyTileMapOrAttr                            ; $5300
	ld   a, $01                                                     ; $5303
	call VBlankEnqueue_SetVramBank                                  ; $5305

.toLoop:
	call ProcessScriptsFromCurrLoc                                  ; $5308
	SCR_ResumeNextFrame
	SCR_Jump .loop


CreditsScript0SubScript2_SwapOutSpriteImage:
; Fade out OBJ palettes
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $00
	SCR_StoreByteInAddr wBitsSetPerOBJPaletteFade, $ff
	SCR_Call Script_FadeOut

; Inc image idx and load it
	SCR_ValInAddrPlusEquByte wCreditsSpriteImageIdx, $01
	SCR_CreateOtherScript 1, CreditsScript1_LoadSpriteTileDataAndPalettes
	SCR_StopSubScript2
	SCR_ResumeNextFrame


CreditsScript1_LoadSpriteTileDataAndPalettes:
; Load relevant tile data
	SCR_ExecAsmBelow
	call VBlankEnqueue_UpdateCreditsSprImageTileData                ; $5326
	call ProcessScriptsFromCurrLoc                                  ; $5329
	SCR_ResumeNextFrame
	
; HL = quadruple idx into table, pointing at 2nd word
	SCR_ExecAsmBelow
	ld   a, [wCreditsSpriteImageIdx]                                ; $532e
	add  a                                                          ; $5331
	add  a                                                          ; $5332
	ld   hl, CreditsSpriteImagesSources+2                           ; $5333
	ld   e, a                                                       ; $5336
	ld   d, $00                                                     ; $5337
	add  hl, de                                                     ; $5339

; HL = 2nd word address
	ld   a, [hl+]                                                   ; $533a
	ld   h, [hl]                                                    ; $533b
	ld   l, a                                                       ; $533c

; Load palettes - to fade in from black
	ld   b, BANK(OBJPalettes_CreditsImage1)                         ; $533d
	call SetOBJPaletteSrc                                           ; $533f
	ld   a, $20                                                     ; $5342
	ld   [wPaletteFadeAmount], a                                    ; $5344
	ld   a, $01                                                     ; $5347
	ld   [wLoadPalettesFromRam], a                                  ; $5349
	call ProcessScriptsFromCurrLoc                                  ; $534c

; Just the OBJ palettes affected by fading in
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $00
	SCR_StoreByteInAddr wBitsSetPerOBJPaletteFade, $ff
	SCR_Call Script_FadeIn

;
	SCR_StoreByteInAddr wCreditsLoadingNewSpriteTileData, $00
	SCR_StopCurrScript
	SCR_ResumeNextFrame


CreditsSpriteImagesSources:
	dw Gfx_CreditsSprite1, OBJPalettes_CreditsImage1
	dw Gfx_CreditsSprite2, OBJPalettes_CreditsImage2
	dw Gfx_CreditsSprite3, OBJPalettes_CreditsImage3
	dw Gfx_CreditsSprite4, OBJPalettes_CreditsImage4
	dw Gfx_CreditsSprite5, OBJPalettes_CreditsImage5
	dw Gfx_CreditsSprite6, OBJPalettes_CreditsImage6
	dw Gfx_CreditsSprite7, OBJPalettes_CreditsImage7


CreditsScript2_WaitUntilStartPressed:
; Do nothing until start pressed
	SCR_Delay $b4
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $5380
	bit  PADB_START, a                                              ; $5383
	jr   nz, .startPressed                                          ; $5385

	ld   de, :-                                                     ; $5387
	jp   ProcessScriptsFromDE                                       ; $538a

.startPressed:
; Set that start is pressed to exit this state
	ld   a, $01                                                     ; $538d
	ld   [wCreditsStartPressed], a                                  ; $538f
	call ProcessScriptsFromCurrLoc                                  ; $5392
	SCR_StopCurrScript
	SCR_ResumeNextFrame
	

VBlankEnqueue_UpdateCreditsSprImageTileData:
; HL = quadruple idx into table
	ld   a, [wCreditsSpriteImageIdx]                                ; $5397
	add  a                                                          ; $539a
	add  a                                                          ; $539b
	ld   hl, CreditsSpriteImagesSources                             ; $539c
	ld   e, a                                                       ; $539f
	ld   d, $00                                                     ; $53a0
	add  hl, de                                                     ; $53a2

; HL is 1st word in table
	ld   a, [hl+]                                                   ; $53a3
	ld   h, [hl]                                                    ; $53a4
	ld   l, a                                                       ; $53a5

; Enqueue setting tile data rom bank
	ld   de, VBlankQueueFunc_SetRomBank                             ; $53a6
	push de                                                         ; $53a9
	ld   a, BANK(VBlankQueueFunc_UpdateCreditsSpriteTileData)       ; $53aa
	push af                                                         ; $53ac

; Push vblank func, then src addr in table
	ld   de, VBlankQueueFunc_UpdateCreditsSpriteTileData            ; $53ad
	push de                                                         ; $53b0
	push hl                                                         ; $53b1

; Enqueue 2 functions with a param each
	ld   b, $04                                                     ; $53b2
	ld   hl, sp+$00                                                 ; $53b4
	call PushStackParamsIntoVBlankQueue                             ; $53b6

; Get SP passed our pushed values
	ld   hl, sp+$08                                                 ; $53b9
	ld   sp, hl                                                     ; $53bb
	ret                                                             ; $53bc


INCLUDE "data/trainLineLocationMetadata.s"


InGameScript6_HandleStartingEvent::
; Prevent input for now
	SCR_StoreByteInAddr wDontHandleInGameInput, $01
	SCR_Call Script_Wait100UnpausedFrames

; Play relevant music and wait
	SCR_ExecAsmBelow
	call PlayMusicForTrainLineLocation                              ; $7857
	call ProcessScriptsFromCurrLoc                                  ; $785a
	SCR_Call Script_Wait100UnpausedFrames

; Display start signal off
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_START_SIGNAL_OFF
	SCR_Call Script_Wait100UnpausedFrames
	SCR_Call Script_Wait100UnpausedFrames

; Allow inputs again
	SCR_StoreByteInAddr wDontHandleInGameInput, $00
	SCR_SetCounter1 $c8

.loop:
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_START_SIGNAL_OFF
	
; Jump and penalize if accelerating before the start signal is on
	SCR_ExecAsmBelow
	ld   a, [wAccelerationIdx]                                      ; $7875
	or   a                                                          ; $7878
	ld   de, .acceleratingBeforeStartSignalOn                       ; $7879
	jp   nz, ProcessScriptsFromDE                                   ; $787c

	call ProcessScriptsFromCurrLoc                                  ; $787f
	SCR_ResumeNextFrame
	
; Proceed past counter loop once the counter decs, while unpaused, to 0
	SCR_ExecAsmBelow
	ld   a, [wInGameIsPaused]                                       ; $7884
	or   a                                                          ; $7887
	ld   de, .loop                                                  ; $7888
	jp   nz, ProcessScriptsFromDE                                   ; $788b

	call ProcessScriptsFromCurrLoc                                  ; $788e
	SCR_DecCounter1_JNE .loop
	
; Jump ahead while max brake is applied
	SCR_ExecAsmBelow
	ld   a, [wBrakeAppliedIdx]                                      ; $7895
	cp   $09                                                        ; $7898
	ld   de, .maxBrakeApplied                                       ; $789a
	jp   z, ProcessScriptsFromDE                                    ; $789d

; If released brake..
	ld   a, [wReleasedBrakeBeforeStartingGoSignal]                  ; $78a0
	or   a                                                          ; $78a3
	jr   nz, .afterBrakeReleaseCheck                                ; $78a4

; Add to penalty and set flag so this is set once
	ld   hl, wSmallPenaltyForDisengagingBrakeBeforeStartingGoSignal ; $78a6
	ld   c, $01                                                     ; $78a9
	call AddCToByteInHL_maxFFh                                      ; $78ab
	ld   a, $01                                                     ; $78ae
	ld   [wReleasedBrakeBeforeStartingGoSignal], a                  ; $78b0

.afterBrakeReleaseCheck:
	call ProcessScriptsFromCurrLoc                                  ; $78b3

.maxBrakeApplied:
; Start signal go event, allow inputs, play sound, and display departure text
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_START_SIGNAL_ON
	SCR_StoreByteInAddr wDontHandleInGameInput, $00
	SCR_PlaySound SND_08|MAKE_SOUND_EFFECT
	SCR_StoreByteInAddr wInGameOnSceneryTextIdx, IGS_TEXT_DEPARTURE_PROGRESS
	SCR_Delay $06
	
; If God mode..
	SCR_ExecAsmBelow
	ld   a, [wGodModeApplied]                                       ; $78c7
	or   a                                                          ; $78ca
	ld   de, .afterGodModeCheck                                     ; $78cb
	jp   z, ProcessScriptsFromDE                                    ; $78ce

; Start train at the fastest accel level, and close to fastest speed
	ld   a, $05                                                     ; $78d1
	ld   [wAccelerationIdx], a                                      ; $78d3
	ld   a, $00                                                     ; $78d6
	ld   [wBrakeAppliedIdx], a                                      ; $78d8
	ld   a, $fe                                                     ; $78db
	ld   [wInGameCurrSpeed], a                                      ; $78dd
	call ProcessScriptsFromCurrLoc                                  ; $78e0

.afterGodModeCheck:
; Proceed once accelerating
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wAccelerationIdx]                                      ; $78e5
	or   a                                                          ; $78e8
	ld   de, :-                                                     ; $78e9
	jp   z, ProcessScriptsFromDE                                    ; $78ec

; Wait 100 frames, clear event, and set flag so we can process the location's events
	call ProcessScriptsFromCurrLoc                                  ; $78ef
	SCR_Call Script_Wait100UnpausedFrames
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_NONE
	SCR_StoreByteInAddr wCanStartProcessingInGameEvents, $01
	SCR_StopCurrScript
	
.acceleratingBeforeStartSignalOn:
; Reset accel, reapply brakes, update tile data and prevent input for now
	SCR_StoreByteInAddr wAccelerationIdx, $00
	SCR_StoreByteInAddr wBrakeAppliedIdx, $09
	SCR_StoreByteInAddr wShouldUpdateAccelLeverTileData, $01
	SCR_StoreByteInAddr wShouldUpdateBrakeLeverTileData, $01
	SCR_StoreByteInAddr wDontHandleInGameInput, $01
	
; Display ignored signal text
	SCR_ExecAsmBelow
	ld   a, IGS_TEXT_IGNORED_CAB_SIGNALS                            ; $7913
	ld   [wInGameOnSceneryTextIdx], a                               ; $7915

; Sub from penalties allowed
	call GetTrainLineDifficultyPenaltiesForNotFollowingCabRules     ; $7918
	ld   a, b                                                       ; $791b
	ld   [wInGamePenaltiesAboutToBeAddedOrSubbed], a                ; $791c
	ld   b, 10                                                      ; $791f
	call SubBFromPenaltiesAllowed                                   ; $7921

; Add to penalty counter
	ld   hl, wPenaltyCounterForAcceleratingBeforeStartingGoSignal   ; $7924
	ld   c, $02                                                     ; $7927
	call AddCToByteInHL_maxFFh                                      ; $7929

	call ProcessScriptsFromCurrLoc                                  ; $792c
	SCR_ResumeNextFrame
	SCR_Jump .loop


Script_Wait100UnpausedFrames:
	SCR_SetCounter3 100
.loop:
	SCR_ResumeNextFrame
	
	SCR_ExecAsmBelow
	ld   a, [wInGameIsPaused]                                       ; $7937
	or   a                                                          ; $793a
	ld   de, .loop                                                  ; $793b
	jp   nz, ProcessScriptsFromDE                                   ; $793e

	call ProcessScriptsFromCurrLoc                                  ; $7941
	SCR_DecCounter3_JNE .loop
	SCR_Ret
	
	
macro EventSource
	db BANK(\1)
	dw \1
	dw \2
	ASSERT BANK(\2) == $9c
	db 0, 0, 0
endm
EventsTileDataAndPaletteSrces::
	EventSource Gfx_Event00, BGPalettes_EventPal_0
	EventSource Gfx_Event01, BGPalettes_EventPal_0
	EventSource Gfx_Event02, BGPalettes_EventPal_1
	EventSource Gfx_Event03, BGPalettes_EventPal_2
	EventSource Gfx_Event04, BGPalettes_EventPal_3
	EventSource Gfx_Event05, BGPalettes_EventPal_3
	EventSource Gfx_Event06, BGPalettes_EventPal_4
	EventSource Gfx_Event07, BGPalettes_EventPal_1

	EventSource Gfx_Event08, BGPalettes_EventPal_3
	EventSource Gfx_Event09, BGPalettes_EventPal_4
	EventSource Gfx_Event0a, BGPalettes_EventPal_3
	EventSource Gfx_Event0b, BGPalettes_EventPal_3
	EventSource Gfx_Event0c, BGPalettes_EventPal_3
	EventSource Gfx_Event0d, BGPalettes_EventPal_3
	EventSource Gfx_Event0e, BGPalettes_EventPal_3
	EventSource Gfx_Event0f, BGPalettes_EventPal_3

	EventSource Gfx_Event10, BGPalettes_EventPal_3
	EventSource Gfx_Event11, BGPalettes_EventPal_2
	EventSource Gfx_Event12, BGPalettes_EventPal_2
	EventSource Gfx_Event13, BGPalettes_EventPal_3
	EventSource Gfx_Event14, BGPalettes_EventPal_5
	EventSource Gfx_Event15, BGPalettes_EventPal_6
	EventSource Gfx_Event16, BGPalettes_EventPal_7
	EventSource Gfx_Event17, BGPalettes_EventPal_8

	EventSource Gfx_Event18, BGPalettes_EventPal_9
	EventSource Gfx_Event19, BGPalettes_EventPal_9
	EventSource Gfx_Event1a, BGPalettes_EventPal_3
	EventSource Gfx_Event1b, BGPalettes_EventPal_a
	EventSource Gfx_Event1c, BGPalettes_EventPal_2
	EventSource Gfx_Event1d, BGPalettes_EventPal_3
	EventSource Gfx_Event1e, BGPalettes_EventPal_3
	EventSource Gfx_Event1f, BGPalettes_EventPal_3

	EventSource Gfx_Event20, BGPalettes_EventPal_3
	EventSource Gfx_Event21, BGPalettes_EventPal_3
	EventSource Gfx_Event22, BGPalettes_EventPal_3
	EventSource Gfx_Event23, BGPalettes_EventPal_3
	EventSource Gfx_Event24, BGPalettes_EventPal_3
	EventSource Gfx_Event25, BGPalettes_EventPal_3
	EventSource Gfx_Event26, BGPalettes_EventPal_3
	EventSource Gfx_Event27, BGPalettes_EventPal_3

	EventSource Gfx_Event28, BGPalettes_EventPal_3
	EventSource Gfx_Event29, BGPalettes_EventPal_3
	EventSource Gfx_Event2a, BGPalettes_EventPal_3
	EventSource Gfx_Event2b, BGPalettes_EventPal_3
	EventSource Gfx_Event2c, BGPalettes_EventPal_3
	EventSource Gfx_Event2d, BGPalettes_EventPal_3
	EventSource Gfx_Event2e, BGPalettes_EventPal_0
	EventSource Gfx_Event2f, BGPalettes_EventPal_1

	EventSource Gfx_Event30, BGPalettes_EventPal_2
	EventSource Gfx_Event31, BGPalettes_EventPal_0
	EventSource Gfx_Event32, BGPalettes_EventPal_0
	EventSource Gfx_Event33, BGPalettes_EventPal_0
	EventSource Gfx_Event34, BGPalettes_EventPal_1
	EventSource Gfx_Event35, BGPalettes_EventPal_2
	EventSource Gfx_Event36, BGPalettes_EventPal_6
	EventSource Gfx_Event37, BGPalettes_EventPal_3

	EventSource Gfx_Event38, BGPalettes_EventPal_3
	EventSource Gfx_Event39, BGPalettes_EventPal_3
	EventSource Gfx_Event3a, BGPalettes_EventPal_3
	EventSource Gfx_Event3b, BGPalettes_EventPal_3
	EventSource Gfx_Event3c, BGPalettes_EventPal_3


PlayMusicForTrainLineLocation:
	ld   a, [wSelectedTrainLine]                                    ; $7b30
	cp   $02                                                        ; $7b33
	jr   nz, .nonTrainLine2                                         ; $7b35

; Train line 2
	ld   a, [wLocationIdxInTrainLine]                               ; $7b37
	cp   $01                                                        ; $7b3a
	jr   z, .trainLine2location1                                    ; $7b3c

	cp   $05                                                        ; $7b3e
	jr   z, .trainLine2location5                                    ; $7b40

	cp   $07                                                        ; $7b42
	jr   z, .trainLine2location7                                    ; $7b44

; Other train line 2 locations play this music
	push af                                                         ; $7b46
	ld   a, MUS_0f                                                  ; $7b47
	call PlaySound                                                  ; $7b49
	pop  af                                                         ; $7b4c
	ret                                                             ; $7b4d

.trainLine2location1:
	push af                                                         ; $7b4e
	ld   a, MUS_13                                                  ; $7b4f
	call PlaySound                                                  ; $7b51
	pop  af                                                         ; $7b54
	ret                                                             ; $7b55

.trainLine2location5:
	push af                                                         ; $7b56
	ld   a, MUS_10                                                  ; $7b57
	call PlaySound                                                  ; $7b59
	pop  af                                                         ; $7b5c
	ret                                                             ; $7b5d

.trainLine2location7:
	push af                                                         ; $7b5e
	ld   a, MUS_14                                                  ; $7b5f
	call PlaySound                                                  ; $7b61
	pop  af                                                         ; $7b64
	ret                                                             ; $7b65

.nonTrainLine2:
	push af                                                         ; $7b66
	ld   a, SND_02                                                  ; $7b67
	or   MAKE_SOUND_EFFECT                                          ; $7b69
	call PlaySound                                                  ; $7b6b
	pop  af                                                         ; $7b6e
	ret                                                             ; $7b6f


; unused - corrupted version of above
	add  hl, sp                                                     ; $7b70
	pop  af                                                         ; $7b71
	ret                                                             ; $7b72
