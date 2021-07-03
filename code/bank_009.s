INCLUDE "includes.s"

SECTION "ROM Bank $009", ROMX[$4000], BANK[$9]

GameState01_InGameMain::
; Only get tile idxes if paused for accurate vblank display
	ld   a, [wInGameIsPaused]                                       ; $4000
	or   a                                                          ; $4003
	jr   nz, .cont                                                  ; $4004

; Else these are the in-game main loop funcs
	call IncFrameCtrAndCheckIfASecondHasPassed                      ; $4006
	call CheckIfInGameShouldFinish                                  ; $4009
	call CheckIfPassedSkippableStation                              ; $400c
	call CheckIfCoastingEnforcementBroken                           ; $400f
	call HandleInGameInput                                          ; $4012
	call CheckMaxBrakePenalties                                     ; $4015
	call UpdateCurrSpeed                                            ; $4018
	call HandleSpeedRegionAndDistanceTravelled                      ; $401b
	call HandleStandardOrCustomSpeedLimitsEnding                    ; $401e
	call HandleSpeedLimitOrStopScenarios                            ; $4021
	call HandleMiscellaneousScenarios                               ; $4024
	call IncSecondsIfPassedCheckIfPassedDestTime                    ; $4027
	call CheckIfATSPassedStopStation                                ; $402a
	call CheckIfTrainNeedsToGo                                      ; $402d
	call InGameHandleSelectPressed                                  ; $4030
	call CheckIfSpeeding                                            ; $4033
	call DisplayTextIfCrashedIntoABollard                           ; $4036
	call HandleNotMovingTextsAndPenalty                             ; $4039
	call DisplayInfoEvent                                           ; $403c
	call AutoStopTrainAtDestIfGodMode                               ; $403f

.cont:
	call GetTileIdxesForInGameDisplay                               ; $4042
	ret                                                             ; $4045


HandleNotMovingTextsAndPenalty:
; Return if we shouldn't be moving
	ld   a, [wInGameEventIdx1]                                      ; $4046
	cp   EVENT_START_SIGNAL_OFF                                     ; $4049
	ret  z                                                          ; $404b

; Return if in-game is done
	ld   a, [wFinishedInGame]                                       ; $404c
	or   a                                                          ; $404f
	ret  nz                                                         ; $4050

; Reset not moving counter if moving
	ld   a, [wInGameCurrSpeed]                                      ; $4051
	or   a                                                          ; $4054
	jr   nz, .resetNotMovingCounter                                 ; $4055

	ld   a, [wInGameCurrSubSpeed]                                   ; $4057
	or   a                                                          ; $405a
	jr   nz, .resetNotMovingCounter                                 ; $405b

; Add to not moving counter
	ld   a, [wNotMovingCounter]                                     ; $405d
	ld   l, a                                                       ; $4060
	ld   a, [wNotMovingCounter+1]                                   ; $4061
	ld   h, a                                                       ; $4064
	inc  hl                                                         ; $4065
	ld   a, l                                                       ; $4066
	ld   [wNotMovingCounter], a                                     ; $4067
	ld   a, h                                                       ; $406a
	ld   [wNotMovingCounter+1], a                                   ; $406b

; Return while low byte is non-0
	ld   a, l                                                       ; $406e
	or   a                                                          ; $406f
	ret  nz                                                         ; $4070

; Jump based on high byte
	ld   a, h                                                       ; $4071
	cp   $02                                                        ; $4072
	jr   z, .proceedPlease                                          ; $4074

	cp   $04                                                        ; $4076
	jr   z, .deductPtsResetCounter                                  ; $4078

	ret                                                             ; $407a

.proceedPlease:
	ld   a, IGS_TEXT_PROCEED_PLEASE                                 ; $407b
	ld   [wInGameOnSceneryTextIdx], a                               ; $407d
	ret                                                             ; $4080

.deductPtsResetCounter:
; ie we will continue being deducted while not moving
	ld   a, IGS_TEXT_5_PTS_DEDUCTED                                 ; $4081
	ld   [wInGameOnSceneryTextIdx], a                               ; $4083
	ld   b, $05                                                     ; $4086
	call SubBFromPenaltiesAllowed                                   ; $4088

.resetNotMovingCounter:
	ld   a, $00                                                     ; $408b
	ld   [wNotMovingCounter], a                                     ; $408d
	ld   a, $00                                                     ; $4090
	ld   [wNotMovingCounter+1], a                                   ; $4092
	ret                                                             ; $4095


CheckIfCoastingEnforcementBroken:
; Return if coasting not enforced
	ld   a, [w1WhenCoastingEnforcedStart2WhenAcceleratingDuring]    ; $4096
	or   a                                                          ; $4099
	ret  z                                                          ; $409a

; Jump ahead if moving
	ld   a, [wInGameCurrSubSpeed]                                   ; $409b
	ld   b, a                                                       ; $409e
	ld   a, [wInGameCurrSpeed]                                      ; $409f
	or   b                                                          ; $40a2
	jr   nz, .cont                                                  ; $40a3

; If idle, sub 10 from penalties and display that text
	ld   a, IGS_TEXT_PTS_DEDUCTION                                  ; $40a5
	ld   [wInGameOnSceneryTextIdx], a                               ; $40a7
	ld   b, 10                                                      ; $40aa
	ld   a, b                                                       ; $40ac
	ld   [wInGamePenaltiesAboutToBeAddedOrSubbed], a                ; $40ad
	call SubBFromPenaltiesAllowed                                   ; $40b0

; Don't check for being idle during coasting (and prevent bonus pts), then return
	ld   a, $00                                                     ; $40b3
	ld   [w1WhenCoastingEnforcedStart2WhenAcceleratingDuring], a    ; $40b5

.cont:
; When coasting is enforced, and acceleration is applied, set it to 2 (no bonus pts)
	ld   a, [w1WhenCoastingEnforcedStart2WhenAcceleratingDuring]    ; $40b8
	cp   $01                                                        ; $40bb
	ret  nz                                                         ; $40bd

	ld   a, [wAccelerationIdx]                                      ; $40be
	or   a                                                          ; $40c1
	ret  z                                                          ; $40c2

	ld   a, $02                                                     ; $40c3
	ld   [w1WhenCoastingEnforcedStart2WhenAcceleratingDuring], a    ; $40c5
	ret                                                             ; $40c8


CheckIfPassedSkippableStation:
; Jump ahead if distance (including cm) is exactly 0, OR we're passed the station
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $40c9
	ld   b, a                                                       ; $40cc
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $40cd
	ld   c, a                                                       ; $40d0
	ld   a, [wCentimeterPartOfDistanceBeforeNextStation]            ; $40d1
	or   b                                                          ; $40d4
	or   c                                                          ; $40d5
	or   a                                                          ; $40d6
	jr   z, .atOrPassedStation                                      ; $40d7

	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $40d9
	bit  7, a                                                       ; $40dc
	jr   nz, .atOrPassedStation                                     ; $40de

	ret                                                             ; $40e0

.atOrPassedStation:
; Return if it's the next station to stop at
	ld   a, [wApproachingNextStationToStopAt]                       ; $40e1
	or   a                                                          ; $40e4
	ret  nz                                                         ; $40e5

; If it's not, dec from num stations to skip
	ld   a, [wNumStationsLeftToSkip]                                ; $40e6
	or   a                                                          ; $40e9
	ret  z                                                          ; $40ea

	dec  a                                                          ; $40eb
	ld   [wNumStationsLeftToSkip], a                                ; $40ec

; For next stage, allow starting with better custom restrictions
	call Trampoline_UpdateCustomRestrictions                        ; $40ef

; Jump ahead if our time is not exactly equal the destination time
	ld   a, [wDestinationTimeHours]                                 ; $40f2
	ld   b, a                                                       ; $40f5
	ld   a, [wCurrTimeHours]                                        ; $40f6
	cp   b                                                          ; $40f9
	jr   nz, .currTimeNotExactlyDestTime                            ; $40fa

	ld   a, [wDestinationTimeMinutes]                               ; $40fc
	ld   b, a                                                       ; $40ff
	ld   a, [wCurrTimeMinutes]                                      ; $4100
	cp   b                                                          ; $4103
	jr   nz, .currTimeNotExactlyDestTime                            ; $4104

	ld   a, [wDestinationTimeSeconds]                               ; $4106
	ld   b, a                                                       ; $4109
	ld   a, [wCurrTimeSeconds]                                      ; $410a
	cp   b                                                          ; $410d
	jr   nz, .currTimeNotExactlyDestTime                            ; $410e

; Display regular communication text as a result
	ld   a, IGS_TEXT_REGULAR_COMMUNICATION                          ; $4110
	ld   [wInGameOnSceneryTextIdx], a                               ; $4112

; Get trainline's bonus penalties based on good comms
	call GetBonusPenaltiesAllowedOnGoodCommunication                ; $4115

; Add onto total, ie more allowed if last stop was also perfect
	ld   a, [wTotalGoodCommsBonusPenaltiesAllowedSinceDepartureOrContinue] ; $4118
	add  b                                                          ; $411b
	ld   b, a                                                       ; $411c
	ld   a, b                                                       ; $411d
	ld   [wInGamePenaltiesAboutToBeAddedOrSubbed], a                ; $411e
	call AddBtoPenaltiesAllowed                                     ; $4121

; Accumulated value += 1
	ld   a, [wTotalGoodCommsBonusPenaltiesAllowedSinceDepartureOrContinue] ; $4124
	inc  a                                                          ; $4127
	ld   [wTotalGoodCommsBonusPenaltiesAllowedSinceDepartureOrContinue], a ; $4128
	jr   :+                                                         ; $412b

.currTimeNotExactlyDestTime:
; Anytime we don't have good comms, reset the streak
	ld   a, $00                                                     ; $412d
	ld   [wTotalGoodCommsBonusPenaltiesAllowedSinceDepartureOrContinue], a ; $412f

; Set that we haven't passed the dest time, and set some unused vars
:	ld   a, $00                                                     ; $4132
	ld   [wInGamePassedDestTime], a                                 ; $4134
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $4137
	ldh  [hUnusedDistanceVars+2], a                                 ; $413a
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $413c
	ldh  [hUnusedDistanceVars+3], a                                 ; $413f
	ld   a, [wCentimeterPartOfDistanceBeforeNextStation]            ; $4141
	ldh  [hUnusedDistanceVars], a                                   ; $4144

; Checks and sets based on station in train line, then load next metadata
	call CheckIfMoreStationsToSkip                                  ; $4146
	call Trampoline_IncLocationIdxInTrainLine                       ; $4149
	call Trampoline_SetDestinationTimeBasedOnCurrLocation           ; $414c
	call LoadTrainLocationsMetadataExceptStationsToSkip             ; $414f
	ret                                                             ; $4152


CheckIfATSPassedStopStation:
; Return if not approaching the next station to stop at
	ld   a, [wApproachingNextStationToStopAt]                       ; $4153
	or   a                                                          ; $4156
	ret  z                                                          ; $4157

; Return if before destination
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4158
	bit  7, a                                                       ; $415b
	jr   z, .done                                                   ; $415d

; Return if < 50 meters after destination
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $415f
	cpl                                                             ; $4162
	inc  a                                                          ; $4163
	cp   50                                                         ; $4164
	jr   c, .done                                                   ; $4166

	jr   .passedDestBy50M                                           ; $4168

.done:
	ret                                                             ; $416a

.passedDestBy50M:
; If not yet set, penalize player for the upcoming automatic stop
	ld   a, [w1IfIgnoredATSOp2IfIgnoredSignal]                      ; $416b
	or   a                                                          ; $416e
	jr   nz, .setAutomaticStop                                      ; $416f

	ld   hl, wLargerCounterPenaltyForVeryUnsafeBrakingOrStops       ; $4171
	ld   c, $06                                                     ; $4174
	call AddCToByteInHL_maxFFh                                      ; $4176

.setAutomaticStop:
; Then set that flag, and display text
	ld   a, $01                                                     ; $4179
	ld   [w1IfIgnoredATSOp2IfIgnoredSignal], a                      ; $417b
	ld   a, IGS_TEXT_ATS_OPERATION                                  ; $417e
	ld   [wInGameOnSceneryTextIdx], a                               ; $4180
	ret                                                             ; $4183


CheckIfTrainNeedsToGo:
; Return if we're at a signal
	ld   a, [w1IfIgnoredATSOp2IfIgnoredSignal]                      ; $4184
	cp   $02                                                        ; $4187
	ret  nz                                                         ; $4189

; Return if moving
	ld   a, [wInGameCurrSubSpeed]                                   ; $418a
	ld   b, a                                                       ; $418d
	ld   a, [wInGameCurrSpeed]                                      ; $418e
	or   b                                                          ; $4191
	ret  nz                                                         ; $4192

; Once idle, play sound
	push af                                                         ; $4193
	ld   a, SND_01                                                  ; $4194
	or   MAKE_SOUND_EFFECT                                          ; $4196
	call PlaySound                                                  ; $4198
	pop  af                                                         ; $419b

; Clear custom speed limit state, and display a green signal
	ld   a, $00                                                     ; $419c
	ld   [wCustomSpeedLimitOrStopState], a                          ; $419e
	ld   a, INFO_EV_GREEN_SIGNAL                                    ; $41a1
	ld   [wInGameInfoEventIdx], a                                   ; $41a3
	ret                                                             ; $41a6


DisplayTextIfCrashedIntoABollard:
; Jump if in a bollard-type section
	ld   a, [wInGameRightMetaSection]                               ; $41a7
	cp   $a5                                                        ; $41aa
	jr   z, .bollardSection                                         ; $41ac

	cp   $a2                                                        ; $41ae
	jr   z, .bollardSection                                         ; $41b0

	ret                                                             ; $41b2

.bollardSection:
; Once 10 frames into it..
	ld   a, [wInGameBGAnimIdxWithinSection]                         ; $41b3
	cp   $0a                                                        ; $41b6
	ret  c                                                          ; $41b8

; Display the text (goes to next game state), and stop the train
	ld   a, IGS_TEXT_BOLLARD_CLASH                                  ; $41b9
	ld   [wInGameOnSceneryTextIdx], a                               ; $41bb
	ld   a, $00                                                     ; $41be
	ld   [wInGameCurrSubSpeed], a                                   ; $41c0
	ld   a, $00                                                     ; $41c3
	ld   [wInGameCurrSpeed], a                                      ; $41c5
	ret                                                             ; $41c8


CheckIfMoreStationsToSkip::
	ld   a, [wNumStationsLeftToSkip]                                ; $41c9
	or   a                                                          ; $41cc
	jr   nz, .moreToSkip                                            ; $41cd

	ld   a, $00                                                     ; $41cf
	ld   [wMoreStationsToSkip], a                                   ; $41d1
	ret                                                             ; $41d4

.moreToSkip:
	ld   a, $01                                                     ; $41d5
	ld   [wMoreStationsToSkip], a                                   ; $41d7
	ret                                                             ; $41da


GameState04_PreInGameGraphicInit::
; Clear scripts and oam
	call InitScriptStructs                                          ; $41db
	call ClearScrollOamSetAllPalsAffectedByFade                     ; $41de

; Set vblank interrupt and unset lcdc
	di                                                              ; $41e1
	ld   a, LOW(VBlankInterruptFunc_PreInGameGraphic)               ; $41e2
	ld   [wVBlankInterruptFunc], a                                  ; $41e4
	ld   a, HIGH(VBlankInterruptFunc_PreInGameGraphic)              ; $41e7
	ld   [wVBlankInterruptFunc+1], a                                ; $41e9
	ld   a, LOW(StubInterruptFunc)                                  ; $41ec
	ld   [wLCDCInterruptFunc], a                                    ; $41ee
	ld   a, HIGH(StubInterruptFunc)                                 ; $41f1
	ld   [wLCDCInterruptFunc+1], a                                  ; $41f3

; Allow only a vblank and turn on LCD
	ld   a, $00                                                     ; $41f6
	ldh  [rIF], a                                                   ; $41f8
	ld   a, IEF_VBLANK                                              ; $41fa
	ldh  [rIE], a                                                   ; $41fc
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $41fe
	ldh  [rLCDC], a                                                 ; $4200

; Set SCY to keep text from bottom edge, and apply no palette fade
	ei                                                              ; $4202
	ld   a, $02                                                     ; $4203
	ld   [wSCY], a                                                  ; $4205
	ld   a, $00                                                     ; $4208
	ld   [wPaletteFadeAmount], a                                    ; $420a
	ld   a, $00                                                     ; $420d
	ld   [wLoadPalettesFromRam], a                                  ; $420f

; Start main script
	M_StartMainScript 0, PreInGameGraphicScript

; Set palettes to all black - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $421b
	ld   hl, Palettes_AllBlack                                      ; $421d
	call SetBGPaletteSrc                                            ; $4220
	xor  a                                                          ; $4223
	ld   [wPaletteFadeAmount], a                                    ; $4224
	ld   [wLoadPalettesFromRam], a                                  ; $4227
	ld   a, $01                                                     ; $422a
	ld   [wLoadBGPalettesFromRom], a                                ; $422c

	ld   b, BANK(Palettes_AllBlack)                                 ; $422f
	ld   hl, Palettes_AllBlack                                      ; $4231
	call SetOBJPaletteSrc                                           ; $4234
	xor  a                                                          ; $4237
	ld   [wPaletteFadeAmount], a                                    ; $4238
	ld   [wLoadPalettesFromRam], a                                  ; $423b
	ld   a, $01                                                     ; $423e
	ld   [wLoadOBJPalettesFromRom], a                               ; $4240

; Load tile data for bottom text bar
	ld   a, $01                                                     ; $4243
	ldh  [rVBK], a                                                  ; $4245
	ld   b, BANK(TileData_TrainImageBottomBar)                      ; $4247
	ld   hl, TileData_TrainImageBottomBar                           ; $4249
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $424c

; Set main stub state
	ld   a, GS_PRE_IN_GAME_GRAPHIC_MAIN                             ; $424f
	ld   [wGameState], a                                            ; $4251
	ret                                                             ; $4254


GameState05_PreInGameGraphicMain::
	ret                                                             ; $4255


GameState08_RouteDisplayInit::
; Clear scripts, oam and palettes
	call InitScriptStructs                                          ; $4256
	call ClearScrollOamSetAllPalsAffectedByFade                     ; $4259

; Set both display interrupt funcs
	di                                                              ; $425c
	ld   a, LOW(VBlankInterruptFunc_RouteDisplay)                   ; $425d
	ld   [wVBlankInterruptFunc], a                                  ; $425f
	ld   a, HIGH(VBlankInterruptFunc_RouteDisplay)                  ; $4262
	ld   [wVBlankInterruptFunc+1], a                                ; $4264
	ld   a, LOW(LCDCInterrupt_RouteDisplay)                         ; $4267
	ld   [wLCDCInterruptFunc], a                                    ; $4269
	ld   a, HIGH(LCDCInterrupt_RouteDisplay)                        ; $426c
	ld   [wLCDCInterruptFunc+1], a                                  ; $426e

; Set both ints to enabled, lcdc to trigger at line $27, and turn on LCD with window
	ld   a, $00                                                     ; $4271
	ldh  [rIF], a                                                   ; $4273
	ld   a, IEF_LCDC|IEF_VBLANK                                     ; $4275
	ldh  [rIE], a                                                   ; $4277
	ld   a, STATF_LYC                                               ; $4279
	ldh  [rSTAT], a                                                 ; $427b
	ld   a, LCDCF_ON|LCDCF_WIN9C00|LCDCF_WINON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON ; $427d
	ldh  [rLCDC], a                                                 ; $427f
	ld   a, $27                                                     ; $4281
	ldh  [rLYC], a                                                  ; $4283

; Set window params to be out of view
	ld   a, $a0                                                     ; $4285
	ld   [wWX], a                                                   ; $4287
	ld   a, $28                                                     ; $428a
	ld   [wWY], a                                                   ; $428c

; Before loading this screen, if we need to change to train line A..
	ld   a, [wShouldChangeToTrainLineAOnRouteDisplay]               ; $428f
	or   a                                                          ; $4292
	jr   z, .afterTrainLineACheck                                   ; $4293

; Set that, resetting location idx and the flag that puts us here
	ld   a, $0a                                                     ; $4295
	ld   [wSelectedTrainLine], a                                    ; $4297
	ld   a, $00                                                     ; $429a
	ld   [wLocationIdxInTrainLine], a                               ; $429c
	ld   a, $00                                                     ; $429f
	ld   [wTrainLineIdxToResumeToAfterContinue], a                  ; $42a1
	ld   a, $00                                                     ; $42a4
	ld   [wShouldChangeToTrainLineAOnRouteDisplay], a               ; $42a6
	
; Load metadata for train line A
	ld   hl, TrainLineAddressesForLocationFrameMetaData.trainLineA  ; $42a9
	ld   a, l                                                       ; $42ac
	ld   [wTrainLinesAddrForItsMetaFrameIdxes], a                   ; $42ad
	ld   a, h                                                       ; $42b0
	ld   [wTrainLinesAddrForItsMetaFrameIdxes+1], a                 ; $42b1

.afterTrainLineACheck:

; HL = address of locations complete data for trainline
	ld   a, [wSelectedTrainLine]                                    ; $42b4
	ld   h, a                                                       ; $42b7
	ld   l, MAX_LOCATIONS_IN_A_TRAINLINE                            ; $42b8
	call HLequHtimesL                                               ; $42ba
	ld   de, wTrainLineLocationsComplete                            ; $42bd
	add  hl, de                                                     ; $42c0

; Copy locations complete status here
	ld   de, wRouteDisplayLocationsComplete                         ; $42c1
	ld   bc, MAX_LOCATIONS_IN_A_TRAINLINE                           ; $42c4
	call MemCopy                                                    ; $42c7
	ei                                                              ; $42ca

; Create main script, and set main stub state
	M_StartMainScript 0, RouteDisplayScript

	ld   a, GS_ROUTE_DISPLAY_MAIN                                   ; $42d4
	ld   [wGameState], a                                            ; $42d6
	ret                                                             ; $42d9


GameState09_RouteDisplayMain::
	ret                                                             ; $42da


GameState0a_FinishedInGameInit::
; Set this var to help stop in-game stuff
	ld   a, $01                                                     ; $42db
	ld   [wFinishedInGame], a                                       ; $42dd

; Start main script, then go to main stub state
	M_StartMainScript 0, FinishedInGameScript

	ld   a, GS_FINISHED_IN_GAME_MAIN                                ; $42e9
	ld   [wGameState], a                                            ; $42eb
	ret                                                             ; $42ee


GameState0b_FinishedInGameMain::
	ret                                                             ; $42ef


GameState27_PrintTrainImageInit::
; Set all palettes to black
	waitForRequestedVBlank
	ld   b, BANK(Palettes_AllBlack)                                 ; $42fd
	ld   hl, Palettes_AllBlack                                      ; $42ff
	xor  a                                                          ; $4302
	ld   [wPaletteFadeAmount], a                                    ; $4303
	call FarLoadAllBGPalettes                                       ; $4306

	ld   b, BANK(Palettes_AllBlack)                                 ; $4309
	ld   hl, Palettes_AllBlack                                      ; $430b
	xor  a                                                          ; $430e
	ld   [wPaletteFadeAmount], a                                    ; $430f
	ld   a, $00                                                     ; $4312
	ld   [wLoadPalettesFromRam], a                                  ; $4314
	call FarLoadAllOBJPalettes                                      ; $4317

; Set interrupts, stubbing lcdc
	di                                                              ; $431a
	ld   a, LOW(VBlankInterruptFunc_PrintTrainImage)                ; $431b
	ld   [wVBlankInterruptFunc], a                                  ; $431d
	ld   a, HIGH(VBlankInterruptFunc_PrintTrainImage)               ; $4320
	ld   [wVBlankInterruptFunc+1], a                                ; $4322
	ld   a, LOW(StubInterruptFunc)                                  ; $4325
	ld   [wLCDCInterruptFunc], a                                    ; $4327
	ld   a, HIGH(StubInterruptFunc)                                 ; $432a
	ld   [wLCDCInterruptFunc+1], a                                  ; $432c

; Allow only vblank, and turn on LCD
	ld   a, $00                                                     ; $432f
	ldh  [rIF], a                                                   ; $4331
	ld   a, IEF_VBLANK                                              ; $4333
	ldh  [rIE], a                                                   ; $4335
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $4337
	ldh  [rLCDC], a                                                 ; $4339

; Clear scripts, scroll, oam and palettes
	call InitScriptStructs                                          ; $433b
	call ClearScrollOamSetAllPalsAffectedByFade                     ; $433e

; Cler print textbox text idx
	ld   a, $00                                                     ; $4341
	ld   [wPrintTrainImageTextIdx], a                               ; $4343

; Start main script, then set main stub state
	ei                                                              ; $4346
	M_StartMainScript 0, PrintTrainImageScript

	ld   a, GS_PRINT_TRAIN_IMAGE_MAIN                               ; $4350
	ld   [wGameState], a                                            ; $4352
	ret                                                             ; $4355


GameState28_PrintTrainImageMain::
	ret                                                             ; $4356


GameState2d_GameOverInit::
; If trainline not complete, go back to intro
	ld   a, [wCompletedTrainLine]                                   ; $4357
	or   a                                                          ; $435a
	jr   nz, .completedTrainLine                                    ; $435b

	ld   a, GS_INTRO_INIT                                           ; $435d
	ld   [wGameState], a                                            ; $435f
	jp   GameState0e_IntroInit                                      ; $4362

.completedTrainLine:
; Clear scripts, scroll, oam and palettes
	call InitScriptStructs                                          ; $4365
	call ClearScrollOamSetAllPalsAffectedByFade                     ; $4368
	
; Stub out display interrupts
	di                                                              ; $436b
	ld   a, LOW(StubInterruptFunc)                                  ; $436c
	ld   [wVBlankInterruptFunc], a                                  ; $436e
	ld   a, HIGH(StubInterruptFunc)                                 ; $4371
	ld   [wVBlankInterruptFunc+1], a                                ; $4373
	ld   a, LOW(StubInterruptFunc)                                  ; $4376
	ld   [wLCDCInterruptFunc], a                                    ; $4378
	ld   a, HIGH(StubInterruptFunc)                                 ; $437b
	ld   [wLCDCInterruptFunc+1], a                                  ; $437d

; Allow only vblank, then turn on lcd
	ld   a, $00                                                     ; $4380
	ldh  [rIF], a                                                   ; $4382
	ld   a, IEF_VBLANK                                              ; $4384
	ldh  [rIE], a                                                   ; $4386
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $4388
	ldh  [rLCDC], a                                                 ; $438a
	ei                                                              ; $438c

; Load tile map and attrs
	ld   de, _SCRN0                                                 ; $438d
	ld   a, $00                                                     ; $4390
	ldh  [rVBK], a                                                  ; $4392
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $4394
	ld   hl, TileMap_GameOver                                       ; $4397
	ld   a, BANK(TileMap_GameOver)                                  ; $439a
	call FarRectCopyRowPerFrame                                     ; $439c

	ld   de, _SCRN0                                                 ; $439f
	ld   a, $01                                                     ; $43a2
	ldh  [rVBK], a                                                  ; $43a4
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $43a6
	ld   a, BANK(TileAttr_GameOver)                                 ; $43a9
	call FarRectCopyRowPerFrame                                     ; $43ab

; Load the same tile data as the continue screen
	ld   a, $00                                                     ; $43ae
	ldh  [rVBK], a                                                  ; $43b0
	ld   b, BANK(Gfx_ContinueScreenBank0)                           ; $43b2
	ld   hl, Gfx_ContinueScreenBank0                                ; $43b4
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $43b7

	ld   a, $01                                                     ; $43ba
	ldh  [rVBK], a                                                  ; $43bc
	ld   b, BANK(Gfx_ContinueScreenBank1)                           ; $43be
	ld   hl, Gfx_ContinueScreenBank1                                ; $43c0
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $43c3

; Use the same palettes as the continue screen - to fade in from black
	ld   b, BANK(Palettes_ContinueScreen)                           ; $43c6
	ld   hl, Palettes_ContinueScreen                                ; $43c8
	call SetBGPaletteSrc                                            ; $43cb
	ld   a, $20                                                     ; $43ce
	ld   [wPaletteFadeAmount], a                                    ; $43d0
	ld   a, $01                                                     ; $43d3
	ld   [wLoadPalettesFromRam], a                                  ; $43d5

	ld   b, BANK(Palettes_ContinueScreen)                           ; $43d8
	ld   hl, Palettes_ContinueScreen                                ; $43da
	call SetOBJPaletteSrc                                           ; $43dd
	ld   a, $20                                                     ; $43e0
	ld   [wPaletteFadeAmount], a                                    ; $43e2
	ld   a, $01                                                     ; $43e5
	ld   [wLoadPalettesFromRam], a                                  ; $43e7
	
; Start main script and set main state
	M_StartMainScript 0, GameOverScript

	ld   a, GS_GAME_OVER_MAIN                                       ; $43f3
	ld   [wGameState], a                                            ; $43f5
	ret                                                             ; $43f8


GameState2e_GameOverMain::
	ret                                                             ; $43f9


GameState33_IntroCutsceneInit::
	call InitScriptStructs                                          ; $43fa
	call ClearScrollOamSetAllPalsAffectedByFade                     ; $43fd

; Set new vblank interrupt func, stub lcdc's
	di                                                              ; $4400
	ld   a, LOW(VBlankInterruptFunc_IntroCutscene)                  ; $4401
	ld   [wVBlankInterruptFunc], a                                  ; $4403
	ld   a, HIGH(VBlankInterruptFunc_IntroCutscene)                 ; $4406
	ld   [wVBlankInterruptFunc+1], a                                ; $4408

	ld   a, LOW(StubInterruptFunc)                                  ; $440b
	ld   [wLCDCInterruptFunc], a                                    ; $440d
	ld   a, HIGH(StubInterruptFunc)                                 ; $4410
	ld   [wLCDCInterruptFunc+1], a                                  ; $4412

; Interrupt hw reg setup
	ld   a, $00                                                     ; $4415
	ldh  [rIF], a                                                   ; $4417
	ld   a, IEF_LCDC|IEF_VBLANK                                     ; $4419
	ldh  [rIE], a                                                   ; $441b
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $441d
	ldh  [rLCDC], a                                                 ; $441f
	ld   a, $00                                                     ; $4421
	ldh  [rSTAT], a                                                 ; $4423

; Load black bg palettes - no fade
	ei                                                              ; $4425
	ld   b, BANK(Palettes_AllBlack)                                 ; $4426
	ld   hl, Palettes_AllBlack                                      ; $4428
	call SetBGPaletteSrc                                            ; $442b
	xor  a                                                          ; $442e
	ld   [wPaletteFadeAmount], a                                    ; $442f
	ld   [wLoadPalettesFromRam], a                                  ; $4432
	ld   a, $01                                                     ; $4435
	ld   [wLoadBGPalettesFromRom], a                                ; $4437

; Load black obj palettes - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $443a
	ld   hl, Palettes_AllBlack                                      ; $443c
	call SetOBJPaletteSrc                                           ; $443f
	xor  a                                                          ; $4442
	ld   [wPaletteFadeAmount], a                                    ; $4443
	ld   [wLoadPalettesFromRam], a                                  ; $4446
	ld   a, $01                                                     ; $4449
	ld   [wLoadOBJPalettesFromRom], a                               ; $444b

; Load screen 0's tile map and attrs
	ld   de, _SCRN0                                                 ; $444e
	ld   a, $00                                                     ; $4451
	ldh  [rVBK], a                                                  ; $4453
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $4455
	ld   hl, TileMapScrn0_IntroCutscene                             ; $4458
	ld   a, BANK(TileMapScrn0_IntroCutscene)                        ; $445b
	call FarRectCopyRowPerFrame                                     ; $445d

	ld   de, _SCRN0                                                 ; $4460
	ld   a, $01                                                     ; $4463
	ldh  [rVBK], a                                                  ; $4465
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $4467
	ld   a, BANK(TileAttrScrn0_IntroCutscene)                       ; $446a
	call FarRectCopyRowPerFrame                                     ; $446c

; Load screen 1's tile map and attrs
	ld   de, _SCRN1                                                 ; $446f
	ld   a, $00                                                     ; $4472
	ldh  [rVBK], a                                                  ; $4474
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $4476
	ld   hl, TileMapScrn1_IntroCutscene                             ; $4479
	ld   a, BANK(TileMapScrn1_IntroCutscene)                        ; $447c
	call FarRectCopyRowPerFrame                                     ; $447e

	ld   de, _SCRN1                                                 ; $4481
	ld   a, $01                                                     ; $4484
	ldh  [rVBK], a                                                  ; $4486
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $4488
	ld   a, BANK(TileAttrScrn1_IntroCutscene)                       ; $448b
	call FarRectCopyRowPerFrame                                     ; $448d

; Start intro cutscene script
	M_StartMainScript 0, IntroCutsceneScript

; Set game state to do nothing
	ld   a, GS_INTRO_CUTSCENE_MAIN                                  ; $4499
	ld   [wGameState], a                                            ; $449b

; Start loading tile data to vram bank 1, reset some other vars
	ld   a, $01                                                     ; $449e
	ld   [wCutsceneHiColTileDataVramBank], a                        ; $44a0
	ld   a, $00                                                     ; $44a3
	ld   [wCutscene_unused_dc00], a                                 ; $44a5
	ld   a, $00                                                     ; $44a8
	ld   [wCutscene_unused_dc00+1], a                               ; $44aa
	ld   a, $00                                                     ; $44ad
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $44af
	ld   a, ANIM_ENGINE_NONE                                        ; $44b2
	ld   [wIntroCutsceneAnimationEngineType], a                     ; $44b4
	ret                                                             ; $44b7


GameState34_IntroCutsceneMain::
	ret                                                             ; $44b8


CheckMaxBrakePenalties:
; Jump if not max brake
	ld   a, [wBrakeAppliedIdx]                                      ; $44b9
	cp   $09                                                        ; $44bc
	jr   nz, .noPenalty                                             ; $44be

; Extreme braking if at max, while approaching next station
	ld   a, [wApproachingNextStationToStopAt]                       ; $44c0
	or   a                                                          ; $44c3
	jr   z, .afterExtremeBrakingCheck                               ; $44c4

	ld   a, $01                                                     ; $44c6
	ld   [wAppliedExtremeBraking], a                                ; $44c8

.afterExtremeBrakingCheck:
	ld   a, [wCounterForBrakingAtNonLowSpeeds]                      ; $44cb
	or   a                                                          ; $44ce
	jr   z, .checkBrakingAtNonLowSpeeds                             ; $44cf

; Until braking at non-low speed counter hits 14, inc it, else jump
	cp   $14                                                        ; $44d1
	jr   z, .brakingDuringNonLowSpeedsForLongEnough                 ; $44d3

	inc  a                                                          ; $44d5
	ld   [wCounterForBrakingAtNonLowSpeeds], a                      ; $44d6
	ret                                                             ; $44d9

.checkBrakingAtNonLowSpeeds:
; Non-low is considered 23km/h+
	ld   a, [wInGameCurrSpeed]                                      ; $44da
	cp   23                                                         ; $44dd
	jr   c, .noPenalty                                              ; $44df

	ld   a, $01                                                     ; $44e1
	ld   [wCounterForBrakingAtNonLowSpeeds], a                      ; $44e3
	ret                                                             ; $44e6

.brakingDuringNonLowSpeedsForLongEnough:
; Return if we have to stop
	ld   a, [w1IfIgnoredATSOp2IfIgnoredSignal]                      ; $44e7
	or   a                                                          ; $44ea
	jr   nz, .noPenalty                                             ; $44eb

; Ignore check here as always 0
	ld   a, [wUnchangedVarSetTo0_d133]                              ; $44ed
	or   a                                                          ; $44f0
	jr   nz, .noPenalty                                             ; $44f1

; Penalize once per violation
	ld   a, [wPenalizedForSuddenBraking]                            ; $44f3
	or   a                                                          ; $44f6
	ret  nz                                                         ; $44f7

	ld   a, $01                                                     ; $44f8
	ld   [wPenalizedForSuddenBraking], a                            ; $44fa

; Subtract from penalties
	ld   a, IGS_TEXT_SUDDEN_BRAKING                                 ; $44fd
	ld   [wInGameOnSceneryTextIdx], a                               ; $44ff
	call GetTrainLineDifficultyPenaltyPtsForSuddenBraking           ; $4502
	ld   a, b                                                       ; $4505
	ld   [wInGamePenaltiesAboutToBeAddedOrSubbed], a                ; $4506
	call SubBFromPenaltiesAllowed                                   ; $4509

; Add to penalty pts that considers being very unsafe
	ld   hl, wLargerCounterPenaltyForVeryUnsafeBrakingOrStops       ; $450c
	ld   c, $06                                                     ; $450f
	call AddCToByteInHL_maxFFh                                      ; $4511
	ret                                                             ; $4514

.noPenalty:
; Reset flag so we can be penalized again, and reset counter
	ld   a, $00                                                     ; $4515
	ld   [wPenalizedForSuddenBraking], a                            ; $4517
	ld   a, $00                                                     ; $451a
	ld   [wCounterForBrakingAtNonLowSpeeds], a                      ; $451c
	ret                                                             ; $451f


HandleInGameInput:
; Return if demo
	ld   a, [wIsDemo]                                               ; $4520
	or   a                                                          ; $4523
	ret  nz                                                         ; $4524

; Return if shouldn't handle input
	ld   a, [wDontHandleInGameInput]                                ; $4525
	or   a                                                          ; $4528
	ret  nz                                                         ; $4529

; If an Automatic Train Stop, or ignored a red signal, ignore inputs and auto-stop train
	ld   a, [w1IfIgnoredATSOp2IfIgnoredSignal]                      ; $452a
	or   a                                                          ; $452d
	jp   nz, .applyMaxBrake                                         ; $452e

; Check if B pressed, while A held
	ld   a, [wButtonsPressed]                                       ; $4531
	bit  PADB_B, a                                                  ; $4534
	jr   z, .afterForceBrakeCheck                                   ; $4536

	ld   a, [wButtonsHeld]                                          ; $4538
	bit  PADB_A, a                                                  ; $453b
	jp   nz, .bPressedWhileAHeld                                    ; $453d

.afterForceBrakeCheck:
	ld   a, [wControlSchemeIs1Handed]                               ; $4540
	or   a                                                          ; $4543
	jr   nz, .oneHanded                                             ; $4544

; 2-handed
	ld   a, [wStickyButtonsHeld]                                    ; $4546
	bit  PADB_UP, a                                                 ; $4549
	jr   nz, .upHeld2Handed                                         ; $454b

	bit  PADB_DOWN, a                                               ; $454d
	jr   nz, .downHeld2Handed                                       ; $454f

	bit  PADB_RIGHT, a                                              ; $4551
	jr   nz, .rightHeld2Handed                                      ; $4553

	bit  PADB_A, a                                                  ; $4555
	jp   nz, .aHeld2Handed                                          ; $4557

	bit  PADB_B, a                                                  ; $455a
	jp   nz, .bHeld2Handed                                          ; $455c

	ret                                                             ; $455f

.oneHanded:
; Jump if lever is not in neutral position
	ld   a, [wAccelerationIdx]                                      ; $4560
	or   a                                                          ; $4563
	jr   nz, .oneHandedAccelOrBrakeApplied                          ; $4564

	ld   a, [wBrakeAppliedIdx]                                      ; $4566
	or   a                                                          ; $4569
	jr   nz, .oneHandedAccelOrBrakeApplied                          ; $456a

; If in neutral, only allow pressing up/down, hold doesn't get to the other direction
	ld   a, [wButtonsPressed]                                       ; $456c
	bit  PADB_DOWN, a                                               ; $456f
	jp   nz, .oneHandedApplyDownBtn                                 ; $4571

	ld   a, [wStickyButtonsHeld]                                    ; $4574
	bit  PADB_UP, a                                                 ; $4577
	jp   nz, .oneHandedApplyUpBtn                                   ; $4579

	ret                                                             ; $457c

.oneHandedAccelOrBrakeApplied:
; While not moved to neutral, allow processing up/down if held
	ld   a, [wStickyButtonsHeld]                                    ; $457d
	bit  PADB_UP, a                                                 ; $4580
	jp   nz, .oneHandedApplyUpBtn                                   ; $4582

	bit  PADB_DOWN, a                                               ; $4585
	jp   nz, .oneHandedApplyDownBtn                                 ; $4587

	bit  PADB_RIGHT, a                                              ; $458a
	jr   nz, .rightHeld2Handed                                      ; $458c

	ret                                                             ; $458e

.upHeld2Handed:
; Sub 1 from acceleration
	ld   a, [wAccelerationIdx]                                      ; $458f
	or   a                                                          ; $4592
	jr   z, :+                                                      ; $4593
	dec  a                                                          ; $4595
:	ld   [wAccelerationIdx], a                                      ; $4596

; Have tile data updated in vblank
	ld   a, $01                                                     ; $4599
	ld   [wShouldUpdateAccelLeverTileData], a                       ; $459b
	ret                                                             ; $459e

.downHeld2Handed:
; Can't accelerate if brakes not fully released
	ld   a, [wBrakeAppliedIdx]                                      ; $459f
	or   a                                                          ; $45a2
	ret  nz                                                         ; $45a3

; Can't go further than idx 5 
	ld   a, [wAccelerationIdx]                                      ; $45a4
	cp   $05                                                        ; $45a7
	jr   nc, .setNewAccel                                           ; $45a9

; Increase acceleration, and save for after next check
	inc  a                                                          ; $45ab
	push af                                                         ; $45ac

; Poor station structure acceleration, if accelerating while approaching stopping station
	ld   a, [wApproachingNextStationToStopAt]                       ; $45ad
	or   a                                                          ; $45b0
	jr   z, :+                                                      ; $45b1

	ld   a, $01                                                     ; $45b3
	ld   [wPoorStationStructureAcceleration], a                     ; $45b5
	call SetContinueTextToUseCoasting                               ; $45b8

:	pop  af                                                         ; $45bb

.setNewAccel:
; Also set that tile data needs updating
	ld   [wAccelerationIdx], a                                      ; $45bc
	ld   a, $01                                                     ; $45bf
	ld   [wShouldUpdateAccelLeverTileData], a                       ; $45c1
	ret                                                             ; $45c4

.rightHeld2Handed:
; If no brake applied already, do nothing
	ld   a, [wBrakeAppliedIdx]                                      ; $45c5
	or   a                                                          ; $45c8
	jr   z, .rightHeldCont                                          ; $45c9

; Play sound
	push af                                                         ; $45cb
	ld   a, SND_09                                                  ; $45cc
	or   MAKE_SOUND_EFFECT                                          ; $45ce
	call PlaySound                                                  ; $45d0
	pop  af                                                         ; $45d3

; If brake applied was 5+, score is highly affected
	ld   a, [wBrakeAppliedIdx]                                      ; $45d4
	cp   $05                                                        ; $45d7
	jr   c, .rightHeldBrakeLt5                                      ; $45d9

	ld   hl, wPenaltyCounterForGoingNeutralFromHighBraking          ; $45db
	ld   c, $02                                                     ; $45de
	call AddCToByteInHL_maxFFh                                      ; $45e0
	jr   .rightHeldCont                                             ; $45e3

.rightHeldBrakeLt5:
; If brake applied 4, score is slightly affected
	ld   a, [wAccelerationIdx]                                      ; $45e5
	cp   $04                                                        ; $45e8
	jr   c, .rightHeldCont                                          ; $45ea

	ld   hl, wSmallCounterPenaltyForUnsafeBrakingOrPoorStationAccel ; $45ec
	ld   c, $01                                                     ; $45ef
	call AddCToByteInHL_maxFFh                                      ; $45f1

.rightHeldCont:
; Either way, go to neutral, and update tile data in vblank
	ld   a, $00                                                     ; $45f4
	ld   [wAccelerationIdx], a                                      ; $45f6
	ld   a, $00                                                     ; $45f9
	ld   [wBrakeAppliedIdx], a                                      ; $45fb

	ld   a, $01                                                     ; $45fe
	ld   [wShouldUpdateAccelLeverTileData], a                       ; $4600
	ld   a, $01                                                     ; $4603
	ld   [wShouldUpdateBrakeLeverTileData], a                       ; $4605
	ret                                                             ; $4608

.bPressedWhileAHeld:
; Apply the maximum brake, and update the relevant tile data
	ld   a, $00                                                     ; $4609
	ld   [wAccelerationIdx], a                                      ; $460b
	ld   a, $09                                                     ; $460e
	ld   [wBrakeAppliedIdx], a                                      ; $4610

	ld   a, $01                                                     ; $4613
	ld   [wShouldUpdateAccelLeverTileData], a                       ; $4615
	ld   a, $01                                                     ; $4618
	ld   [wShouldUpdateBrakeLeverTileData], a                       ; $461a
	ret                                                             ; $461d

.aHeld2Handed:
; If max-1 brake applied and not just pressed, return
	ld   a, [wBrakeAppliedIdx]                                      ; $461e
	cp   $08                                                        ; $4621
	jr   nz, .brakeContinue                                         ; $4623

	ld   a, [wButtonsPressed]                                       ; $4625
	bit  PADB_A, a                                                  ; $4628
	ret  z                                                          ; $462a

	jr   .brakeContinue                                             ; $462b

.oneHandedUpWithNoAccel:
; If not at the 2nd highest break continue
	ld   a, [wBrakeAppliedIdx]                                      ; $462d
	cp   $08                                                        ; $4630
	jr   nz, .brakeContinue                                         ; $4632

; Only allow going up from this position, if up was pressed
	ld   a, [wButtonsPressed]                                       ; $4634
	bit  PADB_UP, a                                                 ; $4637
	ret  z                                                          ; $4639

.brakeContinue:
; If braking while acceleration is highest or 2nd highest, score is affected
	ld   a, [wAccelerationIdx]                                      ; $463a
	cp   $04                                                        ; $463d
	jr   c, :+                                                      ; $463f

	ld   hl, wSmallCounterPenaltyForUnsafeBrakingOrPoorStationAccel ; $4641
	ld   c, $01                                                     ; $4644
	call AddCToByteInHL_maxFFh                                      ; $4646

; Clear acceleration, if we're not at the max brake, inc it
:	ld   a, $00                                                     ; $4649
	ld   [wAccelerationIdx], a                                      ; $464b
	ld   a, [wBrakeAppliedIdx]                                      ; $464e
	cp   $09                                                        ; $4651
	jr   nc, :+                                                     ; $4653
	inc  a                                                          ; $4655
:	ld   [wBrakeAppliedIdx], a                                      ; $4656

; Update tile data in vblank to reflect change
	ld   a, $01                                                     ; $4659
	ld   [wShouldUpdateAccelLeverTileData], a                       ; $465b
	ld   a, $01                                                     ; $465e
	ld   [wShouldUpdateBrakeLeverTileData], a                       ; $4660
	ret                                                             ; $4663

.bHeld2Handed:
; Jump ahead if already at 0
	ld   a, [wBrakeAppliedIdx]                                      ; $4664
	or   a                                                          ; $4667
	jr   z, .setBrakeFromBHeld                                      ; $4668

; Reduce break, and set brake if now not at 0
	dec  a                                                          ; $466a
	jr   nz, .setBrakeFromBHeld                                     ; $466b

; When at 0, play sound
	push af                                                         ; $466d
	ld   a, SND_09                                                  ; $466e
	or   MAKE_SOUND_EFFECT                                          ; $4670
	call PlaySound                                                  ; $4672
	pop  af                                                         ; $4675
	xor  a                                                          ; $4676

.setBrakeFromBHeld:
; Also update tile data
	ld   [wBrakeAppliedIdx], a                                      ; $4677
	ld   a, $01                                                     ; $467a
	ld   [wShouldUpdateBrakeLeverTileData], a                       ; $467c
	ret                                                             ; $467f

.applyMaxBrake:
; Max brake, no accel, and update tile data to show it
	ld   a, $09                                                     ; $4680
	ld   [wBrakeAppliedIdx], a                                      ; $4682
	ld   a, $00                                                     ; $4685
	ld   [wAccelerationIdx], a                                      ; $4687

	ld   a, $01                                                     ; $468a
	ld   [wShouldUpdateAccelLeverTileData], a                       ; $468c
	ld   a, $01                                                     ; $468f
	ld   [wShouldUpdateBrakeLeverTileData], a                       ; $4691
	ret                                                             ; $4694

.oneHandedApplyUpBtn:
; Performs like 2-hand accel (up held) if already accelerating
	ld   a, [wAccelerationIdx]                                      ; $4695
	or   a                                                          ; $4698
	jr   z, .oneHandedUpWithNoAccel                                 ; $4699

	jp   .upHeld2Handed                                             ; $469b

.oneHandedApplyDownBtn:
; Performs like 2-handed's accel (down held), or brake (b held)
	ld   a, [wBrakeAppliedIdx]                                      ; $469e
	or   a                                                          ; $46a1
	jp   z, .downHeld2Handed                                        ; $46a2

	jr   .bHeld2Handed                                              ; $46a5


UpdateCurrSpeed:
; Add slope onto speed and save it
	ld   a, [wInGameCurrSubSpeed]                                   ; $46a7
	ld   l, a                                                       ; $46aa
	ld   a, [wInGameCurrSpeed]                                      ; $46ab
	ld   h, a                                                       ; $46ae

	ld   a, [wSlopeSpeedIncrease]                                   ; $46af
	ld   c, a                                                       ; $46b2
	ld   a, [wSlopeSpeedIncrease+1]                                 ; $46b3
	ld   b, a                                                       ; $46b6
	call AddBContoHL_noWrapArounds                                  ; $46b7

	ld   a, l                                                       ; $46ba
	ld   [wInGameCurrSubSpeed], a                                   ; $46bb
	ld   a, h                                                       ; $46be
	ld   [wInGameCurrSpeed], a                                      ; $46bf

; Every 4 frames..
	ld   a, [wMainLoopCounter]                                      ; $46c2
	and  $03                                                        ; $46c5
	jr   nz, .afterSpeedDeduction                                   ; $46c7

; Subspeed -= 1 and save it
	ld   a, [wInGameCurrSubSpeed]                                   ; $46c9
	ld   l, a                                                       ; $46cc
	ld   a, [wInGameCurrSpeed]                                      ; $46cd
	ld   h, a                                                       ; $46d0
	ld   bc, -1                                                     ; $46d1
	call AddBContoHL_noWrapArounds                                  ; $46d4

	ld   a, l                                                       ; $46d7
	ld   [wInGameCurrSubSpeed], a                                   ; $46d8
	ld   a, h                                                       ; $46db
	ld   [wInGameCurrSpeed], a                                      ; $46dc

.afterSpeedDeduction:
; If train should auto-stop..
	ld   a, [w1IfIgnoredATSOp2IfIgnoredSignal]                      ; $46df
	or   a                                                          ; $46e2
	jr   z, .afterAutoStopCheck                                     ; $46e3

; Reduce speed by $80 per frame
	ld   bc, -$80                                                   ; $46e5
	ld   d, $ff                                                     ; $46e8
	jr   .addOntoSpeed                                              ; $46ea

.afterAutoStopCheck:
; Use the fastest acceleration and speed if God mode
	ld   a, [wGodModeApplied]                                       ; $46ec
	or   a                                                          ; $46ef
	jr   z, .useTrainLineSpeedTable                                 ; $46f0

	ld   hl, FastestAccelSpeedOffsetsAndMaxSpeed                    ; $46f2
	jr   .afterTable                                                ; $46f5

.useTrainLineSpeedTable:
; Train line is double idx into speed table
	ld   hl, TrainLineAccelSpeedOffsetsAndMaxSpeed                  ; $46f7
	ld   a, [wSelectedTrainLine]                                    ; $46fa
	add  a                                                          ; $46fd
	ld   c, a                                                       ; $46fe
	ld   b, $00                                                     ; $46ff
	add  hl, bc                                                     ; $4701
	ld   a, [hl+]                                                   ; $4702
	ld   h, [hl]                                                    ; $4703
	ld   l, a                                                       ; $4704

.afterTable:
; Offset into table, if braking, is 9-brake idx, eg hardest brake first
	ld   a, [wBrakeAppliedIdx]                                      ; $4705
	or   a                                                          ; $4708
	jr   z, .brakeNotApplied                                        ; $4709

	ld   b, a                                                       ; $470b
	ld   a, $09                                                     ; $470c
	sub  b                                                          ; $470e
	jr   .getOffsetAndMaxSpeedDetails                               ; $470f

.brakeNotApplied:
; Prevent acceleration in a coasting area
	ld   a, [w1WhenCoastingEnforcedStart2WhenAcceleratingDuring]    ; $4711
	or   a                                                          ; $4714
	ret  nz                                                         ; $4715

; Acceleration details begins at idx 9, after the brake details
	ld   a, [wAccelerationIdx]                                      ; $4716
	add  $09                                                        ; $4719

.getOffsetAndMaxSpeedDetails:
; Final applied speed is quadruple accel index into speed table
	add  a                                                          ; $471b
	add  a                                                          ; $471c
	ld   c, a                                                       ; $471d
	ld   b, $00                                                     ; $471e
	add  hl, bc                                                     ; $4720

; 1st word is an offset, 3rd byte is the max high byte of speed
	ld   a, [hl+]                                                   ; $4721
	ld   c, a                                                       ; $4722
	ld   a, [hl+]                                                   ; $4723
	ld   b, a                                                       ; $4724
	ld   d, [hl]                                                    ; $4725

.addOntoSpeed:
; Add BC onto curr speed
	ld   a, [wInGameCurrSubSpeed]                                   ; $4726
	ld   l, a                                                       ; $4729
	ld   a, [wInGameCurrSpeed]                                      ; $472a
	ld   h, a                                                       ; $472d
	call AddBContoHL_noWrapArounds                                  ; $472e

; If high byte is higher than the max from table, don't update speed
	ld   a, h                                                       ; $4731
	cp   d                                                          ; $4732
	jr   nc, .done                                                  ; $4733

; Else update the speed
	ld   a, l                                                       ; $4735
	ld   [wInGameCurrSubSpeed], a                                   ; $4736
	ld   a, h                                                       ; $4739
	ld   [wInGameCurrSpeed], a                                      ; $473a

.done:
	ret                                                             ; $473d


; Byte 0/1 - word for adding onto speed
; Byte 2 - max high byte of speed
TrainLineAccelSpeedOffsetsAndMaxSpeed:
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
	db $dd, $ff, $ff, $00
	db $e5, $ff, $ff, $00
	db $ed, $ff, $ff, $00
	db $f0, $ff, $ff, $00
	db $f3, $ff, $ff, $00
	db $f6, $ff, $ff, $00
	db $f9, $ff, $ff, $00
	db $fb, $ff, $ff, $00
	db $fd, $ff, $ff, $00
	db $00, $00, $ff, $00
	db $0a, $00, $29, $00
	db $0a, $00, $3d, $00
	db $0a, $00, $51, $00
	db $0a, $00, $5b, $00
	db $0a, $00, $78, $00

.trainLine5:
	db $dd, $ff, $ff, $00
	db $e5, $ff, $ff, $00
	db $ed, $ff, $ff, $00
	db $f0, $ff, $ff, $00
	db $f3, $ff, $ff, $00
	db $f6, $ff, $ff, $00
	db $f9, $ff, $ff, $00
	db $fb, $ff, $ff, $00
	db $fd, $ff, $ff, $00
	db $00, $00, $ff, $00
	db $0a, $00, $15, $00
	db $0a, $00, $29, $00
	db $0a, $00, $47, $00
	db $0a, $00, $5b, $00
	db $0a, $00, $a2, $00

.trainLine1:
.trainLine4:
	db $dd, $ff, $ff, $00
	db $e5, $ff, $ff, $00
	db $ed, $ff, $ff, $00
	db $f0, $ff, $ff, $00
	db $f3, $ff, $ff, $00
	db $f6, $ff, $ff, $00
	db $f9, $ff, $ff, $00
	db $fb, $ff, $ff, $00
	db $fd, $ff, $ff, $00
	db $00, $00, $ff, $00
	db $0b, $00, $15, $00
	db $0b, $00, $29, $00
	db $0b, $00, $47, $00
	db $0b, $00, $5b, $00
	db $0b, $00, $88, $00

.trainLine2:
	db $dd, $ff, $ff, $00
	db $e5, $ff, $ff, $00
	db $ed, $ff, $ff, $00
	db $f0, $ff, $ff, $00
	db $f3, $ff, $ff, $00
	db $f6, $ff, $ff, $00
	db $f9, $ff, $ff, $00
	db $fb, $ff, $ff, $00
	db $fd, $ff, $ff, $00
	db $00, $00, $ff, $00
	db $0b, $00, $15, $00
	db $0b, $00, $29, $00
	db $0b, $00, $3d, $00
	db $0b, $00, $51, $00
	db $0b, $00, $6e, $00

.trainLine6:
	db $dd, $ff, $ff, $00
	db $e5, $ff, $ff, $00
	db $ed, $ff, $ff, $00
	db $f0, $ff, $ff, $00
	db $f3, $ff, $ff, $00
	db $f6, $ff, $ff, $00
	db $f9, $ff, $ff, $00
	db $fb, $ff, $ff, $00
	db $fd, $ff, $ff, $00
	db $00, $00, $ff, $00
	db $08, $00, $15, $00
	db $08, $00, $29, $00
	db $08, $00, $33, $00
	db $08, $00, $3d, $00
	db $08, $00, $6e, $00

.trainLine8:
	db $dd, $ff, $ff, $00
	db $e5, $ff, $ff, $00
	db $ed, $ff, $ff, $00
	db $f0, $ff, $ff, $00
	db $f3, $ff, $ff, $00
	db $f6, $ff, $ff, $00
	db $f9, $ff, $ff, $00
	db $fb, $ff, $ff, $00
	db $fd, $ff, $ff, $00
	db $00, $00, $ff, $00
	db $0b, $00, $15, $00
	db $0b, $00, $29, $00
	db $0b, $00, $47, $00
	db $0b, $00, $5b, $00
	db $0b, $00, $7d, $00

.trainLine7:
	db $dd, $ff, $ff, $00
	db $e5, $ff, $ff, $00
	db $ed, $ff, $ff, $00
	db $f0, $ff, $ff, $00
	db $f3, $ff, $ff, $00
	db $f6, $ff, $ff, $00
	db $f9, $ff, $ff, $00
	db $fb, $ff, $ff, $00
	db $fd, $ff, $ff, $00
	db $00, $00, $ff, $00
	db $0b, $00, $15, $00
	db $0b, $00, $29, $00
	db $0b, $00, $47, $00
	db $0b, $00, $5b, $00
	db $0b, $00, $7d, $00

.trainLine9:
	db $dd, $ff, $ff, $00
	db $e5, $ff, $ff, $00
	db $ed, $ff, $ff, $00
	db $f0, $ff, $ff, $00
	db $f3, $ff, $ff, $00
	db $f6, $ff, $ff, $00
	db $f9, $ff, $ff, $00
	db $fb, $ff, $ff, $00
	db $fd, $ff, $ff, $00
	db $00, $00, $ff, $00
	db $0a, $00, $15, $00
	db $0a, $00, $29, $00
	db $0a, $00, $47, $00
	db $0a, $00, $5b, $00
	db $0a, $00, $91, $00

.trainLineA:
	db $d0, $ff, $ff, $00
	db $e0, $ff, $ff, $00
	db $e8, $ff, $ff, $00
	db $f0, $ff, $ff, $00
	db $f5, $ff, $ff, $00
	db $f7, $ff, $ff, $00
	db $f9, $ff, $ff, $00
	db $fb, $ff, $ff, $00
	db $fd, $ff, $ff, $00
	db $00, $00, $ff, $00
	db $0c, $00, $1f, $00
	db $0c, $00, $47, $00
	db $0c, $00, $79, $00
	db $0c, $00, $b5, $00
	db $0c, $00, $fe, $00


FastestAccelSpeedOffsetsAndMaxSpeed:
	db $b0, $ff, $ff, $00
	db $c0, $ff, $ff, $00
	db $d0, $ff, $ff, $00
	db $f3, $ff, $ff, $00
	db $f5, $ff, $ff, $00
	db $f7, $ff, $ff, $00
	db $f9, $ff, $ff, $00
	db $fb, $ff, $ff, $00
	db $fd, $ff, $ff, $00
	db $00, $00, $ff, $00
	db $18, $00, $29, $00
	db $18, $00, $3d, $00
	db $18, $00, $51, $00
	db $18, $00, $5b, $00
	db $20, $00, $fe, $00



HandleSpeedRegionAndDistanceTravelled:
; By default, train rails don't animate if below checks don't let it
	ld   a, $00                                                     ; $49ac
	ld   [wTrainRailsShouldAnimate], a                              ; $49ae

; Get negative current speed
	ld   a, [wInGameCurrSubSpeed]                                   ; $49b1
	cpl                                                             ; $49b4
	ld   e, a                                                       ; $49b5
	ld   a, [wInGameCurrSpeed]                                      ; $49b6
	cpl                                                             ; $49b9
	ld   d, a                                                       ; $49ba
	inc  de                                                         ; $49bb

; Have this count down using recorded curr speeds
	ld   a, [wReverseCounterToCheckDistanceTraversed]               ; $49bc
	ld   l, a                                                       ; $49bf
	ld   a, [wReverseCounterToCheckDistanceTraversed+1]             ; $49c0
	ld   h, a                                                       ; $49c3
	add  hl, de                                                     ; $49c4
	ld   a, l                                                       ; $49c5
	ld   [wReverseCounterToCheckDistanceTraversed], a               ; $49c6
	ld   a, h                                                       ; $49c9
	ld   [wReverseCounterToCheckDistanceTraversed+1], a             ; $49ca

; DE = distance traversed
	ld   de, $0000                                                  ; $49cd

.loopCheckingDistanceTraversed:
; HL = reverse counter above
	ld   a, [wReverseCounterToCheckDistanceTraversed]               ; $49d0
	ld   l, a                                                       ; $49d3
	ld   a, [wReverseCounterToCheckDistanceTraversed+1]             ; $49d4
	ld   h, a                                                       ; $49d7

; If count down dropped down higher than that covering 1 distance, add 1
	ld   a, h                                                       ; $49d8
	cp   HIGH(SPEED_COVERING_1_CM)                                  ; $49d9
	jr   c, .afterGettingDistanceTraversed                          ; $49db

	jr   nz, .add1Distance                                          ; $49dd

	ld   a, l                                                       ; $49df
	cp   LOW(SPEED_COVERING_1_CM)                                   ; $49e0
	jr   c, .afterGettingDistanceTraversed                          ; $49e2

	jr   z, .afterGettingDistanceTraversed                          ; $49e4

.add1Distance:
; Add SPEED_COVERING_1_CM until it's above 0
	ld   bc, SPEED_COVERING_1_CM                                    ; $49e6
	add  hl, bc                                                     ; $49e9
	ld   a, l                                                       ; $49ea
	ld   [wReverseCounterToCheckDistanceTraversed], a               ; $49eb
	ld   a, h                                                       ; $49ee
	ld   [wReverseCounterToCheckDistanceTraversed+1], a             ; $49ef
	inc  de                                                         ; $49f2
	jp   .loopCheckingDistanceTraversed                             ; $49f3

.afterGettingDistanceTraversed:
; Deduct from cm distance travelled
	ld   b, e                                                       ; $49f6
	call CMDeductDistanceTravelledFromDistanceLeft                  ; $49f7

; Add distance covered to below counter
	ld   a, [wTrainRailsAnimateCounter]                             ; $49fa
	add  e                                                          ; $49fd
	ld   [wTrainRailsAnimateCounter], a                             ; $49fe

; Once 1m travelled, animate train rails
	cp   100                                                        ; $4a01
	jr   c, .afterTrainRailsAnimateCheck                            ; $4a03

	ld   a, $01                                                     ; $4a05
	ld   [wTrainRailsShouldAnimate], a                              ; $4a07
	xor  a                                                          ; $4a0a
	ld   [wTrainRailsAnimateCounter], a                             ; $4a0b

.afterTrainRailsAnimateCheck:
; Add cm distance to this counter
	ld   a, [wCounterToCheckIfAnimatingScenery]                     ; $4a0e
	ld   l, a                                                       ; $4a11
	ld   a, [wCounterToCheckIfAnimatingScenery+1]                   ; $4a12
	ld   h, a                                                       ; $4a15
	add  hl, de                                                     ; $4a16
	ld   a, l                                                       ; $4a17
	ld   [wCounterToCheckIfAnimatingScenery], a                     ; $4a18
	ld   a, h                                                       ; $4a1b
	ld   [wCounterToCheckIfAnimatingScenery+1], a                   ; $4a1c

.checkAnimateSceneryCounter:
	ld   a, [wCounterToCheckIfAnimatingScenery]                     ; $4a1f
	ld   l, a                                                       ; $4a22
	ld   a, [wCounterToCheckIfAnimatingScenery+1]                   ; $4a23
	ld   h, a                                                       ; $4a26

; Return when counter < 2m
	ld   a, h                                                       ; $4a27
	or   a                                                          ; $4a28
	jr   nz, .animateSceneryAndIncDistanceCovered                   ; $4a29

	ld   a, l                                                       ; $4a2b
	cp   200                                                        ; $4a2c
	ret  c                                                          ; $4a2e

.animateSceneryAndIncDistanceCovered:
; Sub 2m from counter
	ld   de, -200                                                   ; $4a2f
	add  hl, de                                                     ; $4a32
	ld   a, l                                                       ; $4a33
	ld   [wCounterToCheckIfAnimatingScenery], a                     ; $4a34
	ld   a, h                                                       ; $4a37
	ld   [wCounterToCheckIfAnimatingScenery+1], a                   ; $4a38

; Set that we should update scenery tile data to the next bg, and inc distance counter
	ld   a, $01                                                     ; $4a3b
	ld   [wShouldUpdateInGameSceneryTileData], a                    ; $4a3d
	call IncInGameBGAnimIdx                                         ; $4a40
	call IncInGameDistanceCounter                                   ; $4a43

; If counter < 10, inc and set
	ld   a, [wCounterToCheckSpeedRegion]                            ; $4a46
	inc  a                                                          ; $4a49
	cp   10                                                         ; $4a4a
	jr   c, .setSpeedRegionCounter                                  ; $4a4c

; Else branch based on current speed region, play relevant sound, and clear counter
	ld   a, [wInGameCurrSpeed]                                      ; $4a4e
	cp   10                                                         ; $4a51
	jr   c, .lessThan10                                             ; $4a53

	cp   30                                                         ; $4a55
	jr   c, .lessThan30                                             ; $4a57

	cp   50                                                         ; $4a59
	jr   c, .lessThan50                                             ; $4a5b

	cp   70                                                         ; $4a5d
	jr   c, .lessThan70                                             ; $4a5f

	cp   100                                                        ; $4a61
	jr   c, .lessThan100                                            ; $4a63

	jr   .oneHundredPlus                                            ; $4a65

.lessThan10:
	push af                                                         ; $4a67
	ld   a, SND_0e                                                  ; $4a68
	call PlaySound                                                  ; $4a6a
	pop  af                                                         ; $4a6d
	jr   .clearSpeedRegionCounter                                   ; $4a6e

.lessThan30:
	push af                                                         ; $4a70
	ld   a, SND_0f                                                  ; $4a71
	call PlaySound                                                  ; $4a73
	pop  af                                                         ; $4a76
	jr   .clearSpeedRegionCounter                                   ; $4a77

.lessThan50:
	push af                                                         ; $4a79
	ld   a, SND_10                                                  ; $4a7a
	call PlaySound                                                  ; $4a7c
	pop  af                                                         ; $4a7f
	jr   .clearSpeedRegionCounter                                   ; $4a80

.lessThan70:
	push af                                                         ; $4a82
	ld   a, SND_11                                                  ; $4a83
	call PlaySound                                                  ; $4a85
	pop  af                                                         ; $4a88
	jr   .clearSpeedRegionCounter                                   ; $4a89

.lessThan100:
	push af                                                         ; $4a8b
	ld   a, SND_12                                                  ; $4a8c
	call PlaySound                                                  ; $4a8e
	pop  af                                                         ; $4a91
	jr   .clearSpeedRegionCounter                                   ; $4a92

.oneHundredPlus:
	push af                                                         ; $4a94
	ld   a, SND_13                                                  ; $4a95
	call PlaySound                                                  ; $4a97
	pop  af                                                         ; $4a9a
	jr   .clearSpeedRegionCounter                                   ; $4a9b

.clearSpeedRegionCounter:
	xor  a                                                          ; $4a9d

.setSpeedRegionCounter:
	ld   [wCounterToCheckSpeedRegion], a                            ; $4a9e
	jp   .checkAnimateSceneryCounter                                ; $4aa1


IncInGameBGAnimIdx:
; Inc anim idx, and every 15 animation frames, ...
	ld   a, [wInGameBGAnimIdxWithinSection]                         ; $4aa4
	inc  a                                                          ; $4aa7
	cp   $0f                                                        ; $4aa8
	jr   c, .setAnimIdx                                             ; $4aaa

; Inc section, and clear animidx
	ld   a, [wInGameBGSectionWithinLocation]                        ; $4aac
	ld   c, a                                                       ; $4aaf
	ld   a, [wInGameBGSectionWithinLocation+1]                      ; $4ab0
	ld   b, a                                                       ; $4ab3
	inc  bc                                                         ; $4ab4
	ld   a, c                                                       ; $4ab5
	ld   [wInGameBGSectionWithinLocation], a                        ; $4ab6
	ld   a, b                                                       ; $4ab9
	ld   [wInGameBGSectionWithinLocation+1], a                      ; $4aba
	xor  a                                                          ; $4abd

.setAnimIdx:
	ld   [wInGameBGAnimIdxWithinSection], a                         ; $4abe
	ret                                                             ; $4ac1


IncInGameDistanceCounter:
	ld   a, [wInGameDistanceCounter]                                ; $4ac2
	ld   l, a                                                       ; $4ac5
	ld   a, [wInGameDistanceCounter+1]                              ; $4ac6
	ld   h, a                                                       ; $4ac9
	inc  hl                                                         ; $4aca
	ld   a, l                                                       ; $4acb
	ld   [wInGameDistanceCounter], a                                ; $4acc
	ld   a, h                                                       ; $4acf
	ld   [wInGameDistanceCounter+1], a                              ; $4ad0
	ret                                                             ; $4ad3


; B - distance travelled
CMDeductDistanceTravelledFromDistanceLeft:
; HL = meter distance before next station
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $4ad4
	ld   l, a                                                       ; $4ad7
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4ad8
	ld   h, a                                                       ; $4adb

	ld   a, [wCentimeterPartOfDistanceBeforeNextStation]            ; $4adc
	sub  b                                                          ; $4adf
	ld   [wCentimeterPartOfDistanceBeforeNextStation], a            ; $4ae0

.loop:
; If we don't go negative, return
	ld   a, [wCentimeterPartOfDistanceBeforeNextStation]            ; $4ae3
	cp   100                                                        ; $4ae6
	ret  c                                                          ; $4ae8

; Otherwise, loop down from 100cm (add to get 100-B)
	add  100                                                        ; $4ae9
	ld   [wCentimeterPartOfDistanceBeforeNextStation], a            ; $4aeb

; Dec meters
	dec  hl                                                         ; $4aee
	ld   a, l                                                       ; $4aef
	ld   [wMeterPartOfDistanceBeforeNextStation], a                 ; $4af0
	ld   a, h                                                       ; $4af3
	ld   [wMeterPartOfDistanceBeforeNextStation+1], a               ; $4af4
	jr   .loop                                                      ; $4af7


IncSecondsIfPassedCheckIfPassedDestTime:
; Return if a second hasn't passed
	ld   a, [wSecondHasPassed]                                      ; $4af9
	or   a                                                          ; $4afc
	ret  z                                                          ; $4afd

; Add 1 to seconds
	ld   hl, wCurrTimeSeconds                                       ; $4afe
	call Add1SecondToTime                                           ; $4b01

; Jump if we've done this check, and we're already passed the dest time
	ld   a, [wInGamePassedDestTime]                                 ; $4b04
	or   a                                                          ; $4b07
	jr   nz, .passedDestTime                                        ; $4b08

; Jump if hours < dest hours
	ld   a, [wDestinationTimeHours]                                 ; $4b0a
	ld   b, a                                                       ; $4b0d
	ld   a, [wCurrTimeHours]                                        ; $4b0e
	cp   b                                                          ; $4b11
	jr   c, .done                                                   ; $4b12

	jr   nz, .justPassedDestTime                                    ; $4b14

; If hours == dest hours, jump if minutes < dest minutes
	ld   a, [wDestinationTimeMinutes]                               ; $4b16
	ld   b, a                                                       ; $4b19
	ld   a, [wCurrTimeMinutes]                                      ; $4b1a
	cp   b                                                          ; $4b1d
	jr   c, .done                                                   ; $4b1e

	jr   nz, .justPassedDestTime                                    ; $4b20

; If minutes == dest mins, done if seconds is equal or less to dest seconds
	ld   a, [wDestinationTimeSeconds]                               ; $4b22
	ld   b, a                                                       ; $4b25
	ld   a, [wCurrTimeSeconds]                                      ; $4b26
	cp   b                                                          ; $4b29
	jr   c, .done                                                   ; $4b2a
	jr   z, .done                                                   ; $4b2c

.justPassedDestTime:
; Set that we're passed dest time, to avoid above check next frame
	ld   a, $01                                                     ; $4b2e
	ld   [wInGamePassedDestTime], a                                 ; $4b30
	jr   .passedDestTime                                            ; $4b33

.done:
	ret                                                             ; $4b35

.passedDestTime:
; Play sound
	push af                                                         ; $4b36
	ld   a, SND_08                                                  ; $4b37
	or   MAKE_SOUND_EFFECT                                          ; $4b39
	call PlaySound                                                  ; $4b3b
	pop  af                                                         ; $4b3e

; Sub from penalties based on train line, with a min of 0
	call GetPenaltiesDeductedPerSecondAfterDestTime                 ; $4b3f
	ld   a, [wPenaltiesAllowed]                                     ; $4b42
	sub  b                                                          ; $4b45
	jr   nc, :+                                                     ; $4b46
	xor  a                                                          ; $4b48
:	ld   [wPenaltiesAllowed], a                                     ; $4b49
	or   a                                                          ; $4b4c
	ret  nz                                                         ; $4b4d

; Then stop in-game when penalties == 0
	call SetFinishedInGameState                                     ; $4b4e
	ret                                                             ; $4b51


SetFinishedInGameState:
; Return if already in this state
	ld   a, [wGameState]                                            ; $4b52
	cp   GS_FINISHED_IN_GAME_INIT                                   ; $4b55
	ret  z                                                          ; $4b57

	cp   GS_FINISHED_IN_GAME_MAIN                                   ; $4b58
	ret  z                                                          ; $4b5a

; Set init state, then stop train
	ld   a, GS_FINISHED_IN_GAME_INIT                                ; $4b5b
	ld   [wGameState], a                                            ; $4b5d
	ld   a, $00                                                     ; $4b60
	ld   [wInGameCurrSubSpeed], a                                   ; $4b62
	ld   a, $00                                                     ; $4b65
	ld   [wInGameCurrSpeed], a                                      ; $4b67
	ret                                                             ; $4b6a


CheckIfInGameShouldFinish:
; Auto-finish if clashed with a bollard
	ld   a, [wInGameOnSceneryTextIdx]                               ; $4b6b
	cp   IGS_TEXT_BOLLARD_CLASH                                     ; $4b6e
	jr   z, .finish                                                 ; $4b70

; Finish whenever penalties == 0
	ld   a, [wPenaltiesAllowed]                                     ; $4b72
	or   a                                                          ; $4b75
	jr   z, .finish                                                 ; $4b76

; Return if moving
	ld   a, [wInGameCurrSpeed]                                      ; $4b78
	or   a                                                          ; $4b7b
	ret  nz                                                         ; $4b7c

	ld   a, [wInGameCurrSubSpeed]                                   ; $4b7d
	or   a                                                          ; $4b80
	ret  nz                                                         ; $4b81

; Once stopped, dont have automatic stop set
	ld   a, $00                                                     ; $4b82
	ld   [w1IfIgnoredATSOp2IfIgnoredSignal], a                      ; $4b84

; Game should not finish if this is not a station to stop at
	ld   a, [wApproachingNextStationToStopAt]                       ; $4b87
	or   a                                                          ; $4b8a
	ret  z                                                          ; $4b8b

; Finish if we've stopped past the destination
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4b8c
	bit  7, a                                                       ; $4b8f
	jr   nz, .finish                                                ; $4b91

; Return if we've stopped perfectly
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4b93
	or   a                                                          ; $4b96
	ret  nz                                                         ; $4b97

; Finish if we're in an acceptable stopping distance from dest
	call GetTrainlineDifficultyMaxAcceptableDistanceBeforeStop      ; $4b98
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $4b9b
	cp   b                                                          ; $4b9e
	jr   z, .finish                                                 ; $4b9f

	ret  nc                                                         ; $4ba1

.finish:
	call SetFinishedInGameState                                     ; $4ba2
	ret                                                             ; $4ba5


IncFrameCtrAndCheckIfASecondHasPassed:
; By default, have bool at 0
	ld   a, $00                                                     ; $4ba6
	ld   [wSecondHasPassed], a                                      ; $4ba8

; Inc frame counter and return if not at 60 yet
	ld   a, [wInGameFrameCounter]                                   ; $4bab
	inc  a                                                          ; $4bae
	ld   [wInGameFrameCounter], a                                   ; $4baf
	cp   60                                                         ; $4bb2
	ret  nz                                                         ; $4bb4

; 60 frames means 1 second has passed
	xor  a                                                          ; $4bb5
	ld   [wInGameFrameCounter], a                                   ; $4bb6
	ld   a, $01                                                     ; $4bb9
	ld   [wSecondHasPassed], a                                      ; $4bbb
	ret                                                             ; $4bbe


ClearInGameFrameCtrAndIfSecondPassed::
	xor  a                                                          ; $4bbf
	ld   [wInGameFrameCounter], a                                   ; $4bc0
	ld   [wSecondHasPassed], a                                      ; $4bc3
	ret                                                             ; $4bc6


GetTileIdxesForInGameDisplay::
; --
; -- Speed
; --
	ld   a, [wSpeedMeterOption]                                     ; $4bc7
	or   a                                                          ; $4bca
	jr   z, .displayedSpeed                                         ; $4bcb

; If hidden, hide tiles
	ld   a, $19                                                     ; $4bcd
	ld   [wInGameCurrSpeedTileIdxes], a                             ; $4bcf
	ld   a, $19                                                     ; $4bd2
	ld   [wInGameCurrSpeedTileIdxes+1], a                           ; $4bd4
	ld   a, $19                                                     ; $4bd7
	ld   [wInGameCurrSpeedTileIdxes+2], a                           ; $4bd9

; Set unused vars
	ld   a, $1a                                                     ; $4bdc
	ld   [wUnusedVars_cf42], a                                      ; $4bde
	ld   a, $1a                                                     ; $4be1
	ld   [wUnusedVars_cf42+1], a                                    ; $4be3
	ld   a, $1a                                                     ; $4be6
	ld   [wUnusedVars_cf42+2], a                                    ; $4be8
	jr   .afterSpeed                                                ; $4beb

.displayedSpeed:
; Save tile idxes for speed display
	ld   a, [wInGameCurrSpeed]                                      ; $4bed
	call BCequAinBCDform                                            ; $4bf0
	ld   de, wInGameCurrSpeedTileIdxes                              ; $4bf3

; Hundreds
	ld   a, b                                                       ; $4bf6
	and  $0f                                                        ; $4bf7
	add  $01                                                        ; $4bf9
	ld   [de], a                                                    ; $4bfb

; Tens
	inc  de                                                         ; $4bfc
	ld   a, c                                                       ; $4bfd
	and  $f0                                                        ; $4bfe
	swap a                                                          ; $4c00
	add  $01                                                        ; $4c02
	ld   [de], a                                                    ; $4c04

; Units
	inc  de                                                         ; $4c05
	ld   a, c                                                       ; $4c06
	and  $0f                                                        ; $4c07
	add  $01                                                        ; $4c09
	ld   [de], a                                                    ; $4c0b

.afterSpeed:

; --
; -- Penalties
; --
	ld   a, [wPenaltiesAllowed]                                     ; $4c0c
	call BCequAinBCDform                                            ; $4c0f

; Display 100s top
	ld   de, wInGamePenaltiesTileIdxes                              ; $4c12
	ld   a, b                                                       ; $4c15
	and  $0f                                                        ; $4c16
	add  a                                                          ; $4c18
	add  $60                                                        ; $4c19
	ld   [de], a                                                    ; $4c1b
	inc  de                                                         ; $4c1c

; Display 10s top
	ld   a, c                                                       ; $4c1d
	and  $f0                                                        ; $4c1e
	swap a                                                          ; $4c20
	add  a                                                          ; $4c22
	add  $60                                                        ; $4c23
	ld   [de], a                                                    ; $4c25
	inc  de                                                         ; $4c26

; Display 1s top
	ld   a, c                                                       ; $4c27
	and  $0f                                                        ; $4c28
	add  a                                                          ; $4c2a
	add  $60                                                        ; $4c2b
	ld   [de], a                                                    ; $4c2d
	inc  de                                                         ; $4c2e

; Display 100s bottom
	ld   a, b                                                       ; $4c2f
	and  $0f                                                        ; $4c30
	add  a                                                          ; $4c32
	add  $61                                                        ; $4c33
	ld   [de], a                                                    ; $4c35
	inc  de                                                         ; $4c36

; Display 10s bottom
	ld   a, c                                                       ; $4c37
	and  $f0                                                        ; $4c38
	swap a                                                          ; $4c3a
	add  a                                                          ; $4c3c
	add  $61                                                        ; $4c3d
	ld   [de], a                                                    ; $4c3f
	inc  de                                                         ; $4c40

; Display 1s bottom
	ld   a, c                                                       ; $4c41
	and  $0f                                                        ; $4c42
	add  a                                                          ; $4c44
	add  $61                                                        ; $4c45
	ld   [de], a                                                    ; $4c47

; --
; -- Levers
; --
; Brake release = 9-brake applied + acceleration
	ld   a, [wAccelerationIdx]                                      ; $4c48
	ld   c, a                                                       ; $4c4b
	ld   a, [wBrakeAppliedIdx]                                      ; $4c4c
	ld   b, a                                                       ; $4c4f
	ld   a, $09                                                     ; $4c50
	sub  b                                                          ; $4c52
	add  c                                                          ; $4c53
	ld   [wBrakeReleaseIdx], a                                      ; $4c54

	ld   a, [wControlSchemeIs1Handed]                               ; $4c57
	or   a                                                          ; $4c5a
	jr   nz, .oneHanded                                             ; $4c5b

; 2-handed - double idx gets tile data source, for accel and brake applied
	ld   a, [wAccelerationIdx]                                      ; $4c5d
	ld   hl, TwoHandAccelTileDataSources                            ; $4c60
	add  a                                                          ; $4c63
	ld   e, a                                                       ; $4c64
	ld   d, $00                                                     ; $4c65
	add  hl, de                                                     ; $4c67
	ld   a, [hl+]                                                   ; $4c68
	ld   [w2HandAccelTileDataSource], a                             ; $4c69
	ld   a, [hl]                                                    ; $4c6c
	ld   [w2HandAccelTileDataSource+1], a                           ; $4c6d

	ld   a, [wBrakeAppliedIdx]                                      ; $4c70
	ld   hl, TwoHandBrakeAppliedTileDataSources                     ; $4c73
	add  a                                                          ; $4c76
	ld   e, a                                                       ; $4c77
	ld   d, $00                                                     ; $4c78
	add  hl, de                                                     ; $4c7a
	ld   a, [hl+]                                                   ; $4c7b
	ld   [w2HandBrakeAppliedTileDataSource], a                      ; $4c7c
	ld   a, [hl]                                                    ; $4c7f
	ld   [w2HandBrakeAppliedTileDataSource+1], a                    ; $4c80
	jr   .afterControlScheme                                        ; $4c83

.oneHanded:
; 1-hand - double idx gets tile data source for lever
	ld   a, [wBrakeReleaseIdx]                                      ; $4c85
	ld   hl, OneHandBrakeReleaseTileDataSources                     ; $4c88
	add  a                                                          ; $4c8b
	ld   e, a                                                       ; $4c8c
	ld   d, $00                                                     ; $4c8d
	add  hl, de                                                     ; $4c8f
	ld   a, [hl+]                                                   ; $4c90
	ld   [w1HandBrakeReleaseTileDataSource], a                      ; $4c91
	ld   a, [hl]                                                    ; $4c94
	ld   [w1HandBrakeReleaseTileDataSource+1], a                    ; $4c95

.afterControlScheme:

; --
; -- Brake and accel data
; --
; Brake release idx is 6-index into table
	ld   a, [wBrakeReleaseIdx]                                      ; $4c98
	add  a                                                          ; $4c9b
	ld   hl, BrakeAndAccelLevelMetadata                             ; $4c9c
	ld   e, a                                                       ; $4c9f
	ld   d, $00                                                     ; $4ca0
	add  hl, de                                                     ; $4ca2
	add  hl, de                                                     ; $4ca3
	add  hl, de                                                     ; $4ca4

; Store 6 bytes for brake level
	ld   de, wTileDataSrcForBrakeAndAccelLevel                      ; $4ca5
	ld   a, [hl+]                                                   ; $4ca8
	ld   [de], a                                                    ; $4ca9
	inc  de                                                         ; $4caa
	ld   a, [hl+]                                                   ; $4cab
	ld   [de], a                                                    ; $4cac
	inc  de                                                         ; $4cad
; wAccelLevelTileIdxes
	ld   a, [hl+]                                                   ; $4cae
	ld   [de], a                                                    ; $4caf
	inc  de                                                         ; $4cb0
	ld   a, [hl+]                                                   ; $4cb1
	ld   [de], a                                                    ; $4cb2
	inc  de                                                         ; $4cb3
; wBrakeLevelTileIdxes
	ld   a, [hl+]                                                   ; $4cb4
	ld   [de], a                                                    ; $4cb5
	inc  de                                                         ; $4cb6
	ld   a, [hl+]                                                   ; $4cb7
	ld   [de], a                                                    ; $4cb8

; Distance to BCD script
	call ConvertDistanceToNextStationIntoBCDNybbles                 ; $4cb9

; --
; -- Speed
; --
; Start filling tile idxes for 6 digits of distance, base tile idx 0 = $44
	ld   hl, wInGameDistanceLeftTileIdxes                           ; $4cbc

; Start with top 2 digits of speed, lay them out in ram sequentially
	ld   a, [wBCDFormOfDistanceToNextStation+2]                     ; $4cbf
	and  $f0                                                        ; $4cc2
	swap a                                                          ; $4cc4
	add  $44                                                        ; $4cc6
	ld   [hl+], a                                                   ; $4cc8

	ld   a, [wBCDFormOfDistanceToNextStation+2]                     ; $4cc9
	and  $0f                                                        ; $4ccc
	add  $44                                                        ; $4cce
	ld   [hl+], a                                                   ; $4cd0

; Low 2 digits of meters
	ld   a, [wBCDFormOfDistanceToNextStation+1]                     ; $4cd1
	and  $f0                                                        ; $4cd4
	swap a                                                          ; $4cd6
	add  $44                                                        ; $4cd8
	ld   [hl+], a                                                   ; $4cda

	ld   a, [wBCDFormOfDistanceToNextStation+1]                     ; $4cdb
	and  $0f                                                        ; $4cde
	add  $44                                                        ; $4ce0
	ld   [hl+], a                                                   ; $4ce2

; Digits for cm
	ld   a, [wBCDFormOfDistanceToNextStation]                       ; $4ce3
	and  $f0                                                        ; $4ce6
	swap a                                                          ; $4ce8
	add  $44                                                        ; $4cea
	ld   [hl+], a                                                   ; $4cec

	ld   a, [wBCDFormOfDistanceToNextStation]                       ; $4ced
	and  $0f                                                        ; $4cf0
	add  $44                                                        ; $4cf2
	ld   [hl+], a                                                   ; $4cf4

; --
; -- Curr time
; --
; Display 10s and 1s of hours
	ld   a, [wCurrTimeHours]                                        ; $4cf5
	call BCequAinBCDform                                            ; $4cf8
	ld   a, c                                                       ; $4cfb
	and  $f0                                                        ; $4cfc
	swap a                                                          ; $4cfe
	add  $50                                                        ; $4d00
	ld   [wInGameCurrTimeTileIdxes], a                              ; $4d02

	ld   a, c                                                       ; $4d05
	and  $0f                                                        ; $4d06
	add  $50                                                        ; $4d08
	ld   [wInGameCurrTimeTileIdxes+1], a                            ; $4d0a

; Display 10s and 1s of minutes
	ld   a, [wCurrTimeMinutes]                                      ; $4d0d
	call BCequAinBCDform                                            ; $4d10
	ld   a, c                                                       ; $4d13
	and  $f0                                                        ; $4d14
	swap a                                                          ; $4d16
	add  $50                                                        ; $4d18
	ld   [wInGameCurrTimeTileIdxes+2], a                            ; $4d1a

	ld   a, c                                                       ; $4d1d
	and  $0f                                                        ; $4d1e
	add  $50                                                        ; $4d20
	ld   [wInGameCurrTimeTileIdxes+3], a                            ; $4d22

; Display 10s and 1s of seconds
	ld   a, [wCurrTimeSeconds]                                      ; $4d25
	call BCequAinBCDform                                            ; $4d28
	ld   a, c                                                       ; $4d2b
	and  $f0                                                        ; $4d2c
	swap a                                                          ; $4d2e
	add  $50                                                        ; $4d30
	ld   [wInGameCurrTimeTileIdxes+4], a                            ; $4d32

	ld   a, c                                                       ; $4d35
	and  $0f                                                        ; $4d36
	add  $50                                                        ; $4d38
	ld   [wInGameCurrTimeTileIdxes+5], a                            ; $4d3a
	ret                                                             ; $4d3d


TwoHandAccelTileDataSources:
	dw Gfx_2HandedAccelLever+$000
	dw Gfx_2HandedAccelLever+$100
	dw Gfx_2HandedAccelLever+$200
	dw Gfx_2HandedAccelLever+$300
	dw Gfx_2HandedAccelLever+$400
	dw Gfx_2HandedAccelLever+$500


TwoHandBrakeAppliedTileDataSources:
	dw Gfx_2HandedBrakeAppliedLever+$000
	dw Gfx_2HandedBrakeAppliedLever+$100
	dw Gfx_2HandedBrakeAppliedLever+$200
	dw Gfx_2HandedBrakeAppliedLever+$300
	dw Gfx_2HandedBrakeAppliedLever+$400
	dw Gfx_2HandedBrakeAppliedLever+$500
	dw Gfx_2HandedBrakeAppliedLever+$600
	dw Gfx_2HandedBrakeAppliedLever+$700
	dw Gfx_2HandedBrakeAppliedLever+$800
	dw Gfx_2HandedBrakeAppliedLever+$900


OneHandBrakeReleaseTileDataSources:
	dw Gfx_1HandedBrakeReleaseLever+$000
	dw Gfx_1HandedBrakeReleaseLever+$100
	dw Gfx_1HandedBrakeReleaseLever+$200
	dw Gfx_1HandedBrakeReleaseLever+$300
	dw Gfx_1HandedBrakeReleaseLever+$400
	dw Gfx_1HandedBrakeReleaseLever+$500
	dw Gfx_1HandedBrakeReleaseLever+$600
	dw Gfx_1HandedBrakeReleaseLever+$700
	dw Gfx_1HandedBrakeReleaseLever+$800
	dw Gfx_1HandedBrakeReleaseLever+$900
	dw Gfx_1HandedBrakeReleaseLever+$a00
	dw Gfx_1HandedBrakeReleaseLever+$b00
	dw Gfx_1HandedBrakeReleaseLever+$c00
	dw Gfx_1HandedBrakeReleaseLever+$d00
	dw Gfx_1HandedBrakeReleaseLever+$e00


; 0/1 - Tile data source in bank $ad
; 2/3 - tile idxes for accel level
; 4/5 - tile idxes for brake level
macro BrakeAndAccelLevelData
	dw \1*$100+$4000
	db \2+1, \2
	db \3+1, \3
endm
ASSERT Gfx_BrakeAndAccelLevels == $4000
BrakeAndAccelLevelMetadata:
	BrakeAndAccelLevelData 0, $20, $34
	BrakeAndAccelLevelData 1, $20, $30
	BrakeAndAccelLevelData 2, $20, $2e
	BrakeAndAccelLevelData 3, $20, $2c
	BrakeAndAccelLevelData 4, $20, $2a
	BrakeAndAccelLevelData 5, $20, $28
	BrakeAndAccelLevelData 6, $20, $26
	BrakeAndAccelLevelData 7, $20, $24
	BrakeAndAccelLevelData 8, $20, $22
	BrakeAndAccelLevelData 9, $20, $20
	BrakeAndAccelLevelData 10, $22, $20
	BrakeAndAccelLevelData 11, $24, $20
	BrakeAndAccelLevelData 12, $26, $20
	BrakeAndAccelLevelData 13, $28, $20
	BrakeAndAccelLevelData 14, $2a, $20
	
	
ConvertDistanceToNextStationIntoBCDNybbles:
; Jump if distance is negative (passed station), and display the neg value instead
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4dd6
	bit  7, a                                                       ; $4dd9
	jr   nz, .passedStation                                         ; $4ddb

; Convert cm to BCD in the 1st of 3 bytes
	ld   a, [wCentimeterPartOfDistanceBeforeNextStation]            ; $4ddd
	call BCequAinBCDform                                            ; $4de0
	ld   a, c                                                       ; $4de3
	ld   [wBCDFormOfDistanceToNextStation], a                       ; $4de4

; Convert meters into BCD in the next 2 bytes
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $4de7
	ld   l, a                                                       ; $4dea
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4deb
	ld   h, a                                                       ; $4dee
	call ConvertHLtoNybbleBCDinBC                                   ; $4def
	ld   a, c                                                       ; $4df2
	ld   [wBCDFormOfDistanceToNextStation+1], a                     ; $4df3
	ld   a, b                                                       ; $4df6
	ld   [wBCDFormOfDistanceToNextStation+2], a                     ; $4df7
	ret                                                             ; $4dfa

.passedStation:
; Get 100-cm as the cm part of the BCD distance
	ld   a, [wCentimeterPartOfDistanceBeforeNextStation]            ; $4dfb
	ld   b, a                                                       ; $4dfe
	ld   a, 100                                                     ; $4dff
	sub  b                                                          ; $4e01
	call BCequAinBCDform                                            ; $4e02
	ld   a, c                                                       ; $4e05
	ld   [wBCDFormOfDistanceToNextStation], a                       ; $4e06

; Neg the meter part and store that BCD in meters
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $4e09
	cpl                                                             ; $4e0c
	ld   l, a                                                       ; $4e0d
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4e0e
	cpl                                                             ; $4e11
	ld   h, a                                                       ; $4e12
	call ConvertHLtoNybbleBCDinBC                                   ; $4e13
	ld   a, c                                                       ; $4e16
	ld   [wBCDFormOfDistanceToNextStation+1], a                     ; $4e17
	ld   a, b                                                       ; $4e1a
	ld   [wBCDFormOfDistanceToNextStation+2], a                     ; $4e1b
	ret                                                             ; $4e1e


DisplayInGameDestinationTime::
	ld   a, $00                                                     ; $4e1f
	ldh  [rVBK], a                                                  ; $4e21

; Get Hours BCD
	ld   de, _SCRN0+$2c                                             ; $4e23
	ld   a, [wDestinationTimeHours]                                 ; $4e26
	push de                                                         ; $4e29
	call BCequAinBCDform                                            ; $4e2a
	pop  de                                                         ; $4e2d

; Display hours - 0 is tile $50, skip 2 tiles to minutes
	ld   a, c                                                       ; $4e2e
	and  $f0                                                        ; $4e2f
	swap a                                                          ; $4e31
	add  $50                                                        ; $4e33
	ld   [de], a                                                    ; $4e35

	inc  de                                                         ; $4e36
	ld   a, c                                                       ; $4e37
	and  $0f                                                        ; $4e38
	add  $50                                                        ; $4e3a
	ld   [de], a                                                    ; $4e3c
	inc  de                                                         ; $4e3d
	inc  de                                                         ; $4e3e

; Repeate for minutes
	ld   a, [wDestinationTimeMinutes]                               ; $4e3f
	push de                                                         ; $4e42
	call BCequAinBCDform                                            ; $4e43
	pop  de                                                         ; $4e46

	ld   a, c                                                       ; $4e47
	and  $f0                                                        ; $4e48
	swap a                                                          ; $4e4a
	add  $50                                                        ; $4e4c
	ld   [de], a                                                    ; $4e4e

	inc  de                                                         ; $4e4f
	ld   a, c                                                       ; $4e50
	and  $0f                                                        ; $4e51
	add  $50                                                        ; $4e53
	ld   [de], a                                                    ; $4e55
	inc  de                                                         ; $4e56
	inc  de                                                         ; $4e57

; Repeate for seconds
	ld   a, [wDestinationTimeSeconds]                               ; $4e58
	push de                                                         ; $4e5b
	call BCequAinBCDform                                            ; $4e5c
	pop  de                                                         ; $4e5f

	ld   a, c                                                       ; $4e60
	and  $f0                                                        ; $4e61
	swap a                                                          ; $4e63
	add  $50                                                        ; $4e65
	ld   [de], a                                                    ; $4e67

	inc  de                                                         ; $4e68
	ld   a, c                                                       ; $4e69
	and  $0f                                                        ; $4e6a
	add  $50                                                        ; $4e6c
	ld   [de], a                                                    ; $4e6e
	ret                                                             ; $4e6f


InGameHandleSelectPressed:
	ld   a, [wInGameButtonsPressed]                                 ; $4e70
	bit  PADB_SELECT, a                                             ; $4e73
	jr   z, .sirenNotPressed                                        ; $4e75

; Siren pressed, jump if not waiting on bonus pt siren
	ld   a, [wCounterToPressSirenForBonusPts]                       ; $4e77
	or   a                                                          ; $4e7a
	jr   z, .check2ndCounter                                        ; $4e7b

	ld   a, $00                                                     ; $4e7d
	ld   [wCounterToPressSirenForBonusPts], a                       ; $4e7f

; Add to penalties allowed
	ld   a, IGS_TEXT_BONUS_PTS                                      ; $4e82
	ld   [wInGameOnSceneryTextIdx], a                               ; $4e84
	call GetSirenBonusPenalties                                     ; $4e87
	ld   a, b                                                       ; $4e8a
	ld   [wInGamePenaltiesAboutToBeAddedOrSubbed], a                ; $4e8b
	call AddBtoPenaltiesAllowed                                     ; $4e8e
	ret                                                             ; $4e91

.check2ndCounter:
; Play regular siren sound
	push af                                                         ; $4e92
	ld   a, SND_16                                                  ; $4e93
	or   MAKE_SOUND_EFFECT                                          ; $4e95
	call PlaySound                                                  ; $4e97
	pop  af                                                         ; $4e9a

; Reset counter 2 now so penalties not deducted
	ld   a, [wCounterToPressSirenBeforeBeingPenalized]              ; $4e9b
	or   a                                                          ; $4e9e
	jr   z, .done                                                   ; $4e9f

	ld   a, $00                                                     ; $4ea1
	ld   [wCounterToPressSirenBeforeBeingPenalized], a              ; $4ea3

.done:
	ret                                                             ; $4ea6

.sirenNotPressed:
; Dec bonus pt counter until it's 0
	ld   a, [wCounterToPressSirenForBonusPts]                       ; $4ea7
	or   a                                                          ; $4eaa
	jr   z, :+                                                      ; $4eab
	dec  a                                                          ; $4ead
:	ld   [wCounterToPressSirenForBonusPts], a                       ; $4eae

; Dec penalties counter and return if not 0
	ld   a, [wCounterToPressSirenBeforeBeingPenalized]              ; $4eb1
	or   a                                                          ; $4eb4
	ret  z                                                          ; $4eb5

	dec  a                                                          ; $4eb6
	ld   [wCounterToPressSirenBeforeBeingPenalized], a              ; $4eb7
	ret  nz                                                         ; $4eba

; Counter reached 0, deduct penalties
	ld   a, IGS_TEXT_IGNORED_SIGN_SIGNALS                           ; $4ebb
	ld   [wInGameOnSceneryTextIdx], a                               ; $4ebd
	call GetTrainLineDifficultyPenaltyPtsForNotSirening             ; $4ec0
	ld   a, b                                                       ; $4ec3
	ld   [wInGamePenaltiesAboutToBeAddedOrSubbed], a                ; $4ec4
	call SubBFromPenaltiesAllowed                                   ; $4ec7

; Add to unused counter
	ld   hl, wUnusedPenaltyCounterForNotSireningWhenPrompted        ; $4eca
	ld   c, $02                                                     ; $4ecd
	call AddCToByteInHL_maxFFh                                      ; $4ecf
	ret                                                             ; $4ed2


HandleSpeedLimitOrStopScenarios:
; Return if we can't process events
	ld   a, [wCanStartProcessingInGameEvents]                       ; $4ed3
	or   a                                                          ; $4ed6
	ret  z                                                          ; $4ed7

; HL = current events addr
	ld   a, [wCurrAddrForTrainLineLocationsSpeedLimitAndStopScenarios] ; $4ed8
	ld   l, a                                                       ; $4edb
	ld   a, [wCurrAddrForTrainLineLocationsSpeedLimitAndStopScenarios+1] ; $4edc
	ld   h, a                                                       ; $4edf
	call GetNextTrainLineLocationScenarios                          ; $4ee0

; Return if distance value == 0
	ld   a, d                                                       ; $4ee3
	or   e                                                          ; $4ee4
	ret  z                                                          ; $4ee5

; Unless scenario idx is $18+ (except darken sky)..
	ld   a, b                                                       ; $4ee6
	cp   SCEN_DARKEN_SKY                                            ; $4ee7
	jr   z, .ignore                                                 ; $4ee9

	ld   a, b                                                       ; $4eeb
	cp   $18                                                        ; $4eec
	jr   nc, .validScenario                                         ; $4eee

.ignore:
; Simply update the curr addr
	ld   a, l                                                       ; $4ef0
	ld   [wCurrAddrForTrainLineLocationsSpeedLimitAndStopScenarios], a ; $4ef1
	ld   a, h                                                       ; $4ef4
	ld   [wCurrAddrForTrainLineLocationsSpeedLimitAndStopScenarios+1], a ; $4ef5
	ret                                                             ; $4ef8

.validScenario:
; Jump ahead if no speed limit
	cp   SCEN_NO_SPEED_LIMIT                                        ; $4ef9
	jr   z, .checkScenarioDistanceAgainstCurr                       ; $4efb

; Don't care about scenarios in train line A
	ld   a, [wSelectedTrainLine]                                    ; $4efd
	cp   $0a                                                        ; $4f00
	jr   z, .checkScenarioDistanceAgainstCurr                       ; $4f02

; If no active speed limit, always consider notify distance to warn player early on
	ld   a, [wCurrSpeedLimitState]                                  ; $4f04
	or   a                                                          ; $4f07
	jr   z, .distanceCheckedBasedOnNotifyDistance                   ; $4f08

; Consider notify distance, if the cab event, custom limit, or carry on events
	ld   a, b                                                       ; $4f0a
	cp   SCEN_SPEED_LIMIT_30KM_H                                    ; $4f0b
	jr   c, .distanceCheckedBasedOnNotifyDistance                   ; $4f0d

; Consider notify distance if curr speed limit <= prev (more notice to slow down)
	ld   a, [wPrevSpeedLimitOrATCScenarioIdx]                       ; $4f0f
	cp   b                                                          ; $4f12
	jr   nc, .distanceCheckedBasedOnNotifyDistance                  ; $4f13

	jr   .checkScenarioDistanceAgainstCurr                          ; $4f15

.distanceCheckedBasedOnNotifyDistance:
	push hl                                                         ; $4f17

; Get highest distance to notify user of scenario in DE
	ld   a, [wNoticeDistanceForScenarios]                           ; $4f18
	ld   l, a                                                       ; $4f1b
	ld   a, [wNoticeDistanceForScenarios+1]                         ; $4f1c
	ld   h, a                                                       ; $4f1f
	add  hl, de                                                     ; $4f20
	ld   e, l                                                       ; $4f21
	ld   d, h                                                       ; $4f22
	push de                                                         ; $4f23

; Get highest notify distance - actual distance in HL
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $4f24
	cpl                                                             ; $4f27
	ld   e, a                                                       ; $4f28
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4f29
	cpl                                                             ; $4f2c
	ld   d, a                                                       ; $4f2d
	inc  de                                                         ; $4f2e
	add  hl, de                                                     ; $4f2f

; Save that diff, for the info event handler to work with
	ld   a, l                                                       ; $4f30
	ld   [wGlobalNotifyDistancePlusDistancePassedTrigger], a        ; $4f31
	ld   a, h                                                       ; $4f34
	ld   [wGlobalNotifyDistancePlusDistancePassedTrigger+1], a      ; $4f35

; DE = highest distance to notify user of scenario, HL = updated scenario addr
	pop  de                                                         ; $4f38
	pop  hl                                                         ; $4f39

.checkScenarioDistanceAgainstCurr:
; Return if our distance to the station is greater than the event trigger area
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4f3a
	cp   d                                                          ; $4f3d
	jr   c, .rightDistance                                          ; $4f3e

	jr   nz, .done                                                  ; $4f40

	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $4f42
	cp   e                                                          ; $4f45
	jr   c, .rightDistance                                          ; $4f46

	jr   z, .rightDistance                                          ; $4f48

.done:
	ret                                                             ; $4f4a

.rightDistance:
; Jump if no speed limit
	ld   a, b                                                       ; $4f4b
	cp   SCEN_NO_SPEED_LIMIT                                        ; $4f4c
	jr   z, .noSpeedLimit                                           ; $4f4e

; Save scenario idx to check curr, and to check next after curr
	ld   a, b                                                       ; $4f50
	ld   [wScenarioIdxForSpeedLimitAndATCScenarios], a              ; $4f51
	ld   [wPrevSpeedLimitOrATCScenarioIdx], a                       ; $4f54

; Save address for next scenario
	ld   a, l                                                       ; $4f57
	ld   [wCurrAddrForTrainLineLocationsSpeedLimitAndStopScenarios], a ; $4f58
	ld   a, h                                                       ; $4f5b
	ld   [wCurrAddrForTrainLineLocationsSpeedLimitAndStopScenarios+1], a ; $4f5c
	ret                                                             ; $4f5f

.noSpeedLimit:
	ld   a, b                                                       ; $4f60
	ld   [wScenarioIdxForMiscellaneousScenarios], a                 ; $4f61

; Save address for next scenario
	ld   a, l                                                       ; $4f64
	ld   [wCurrAddrForTrainLineLocationsSpeedLimitAndStopScenarios], a ; $4f65
	ld   a, h                                                       ; $4f68
	ld   [wCurrAddrForTrainLineLocationsSpeedLimitAndStopScenarios+1], a ; $4f69
	ret                                                             ; $4f6c


HandleMiscellaneousScenarios:
; Return if we're not processing events yet
	ld   a, [wCanStartProcessingInGameEvents]                       ; $4f6d
	or   a                                                          ; $4f70
	ret  z                                                          ; $4f71

; HL = misc scenario addr, get current distance and scenario
	ld   a, [wCurrAddrForTrainLineLocationsMiscScenarios]           ; $4f72
	ld   l, a                                                       ; $4f75
	ld   a, [wCurrAddrForTrainLineLocationsMiscScenarios+1]         ; $4f76
	ld   h, a                                                       ; $4f79
	call GetNextTrainLineLocationScenarios                          ; $4f7a

; Return if no more events
	ld   a, d                                                       ; $4f7d
	or   e                                                          ; $4f7e
	ret  z                                                          ; $4f7f

; Jump if not darken sky
	ld   a, b                                                       ; $4f80
	cp   SCEN_DARKEN_SKY                                            ; $4f81
	jr   nz, .notDarkenSky                                          ; $4f83

; Create script to handle darken sky scenario
	push af                                                         ; $4f85
	push bc                                                         ; $4f86
	push de                                                         ; $4f87
	push hl                                                         ; $4f88

	M_StartMainScript 15, MainScript_Scenario50h_DarkenSky

	pop  hl                                                         ; $4f92
	pop  de                                                         ; $4f93
	pop  bc                                                         ; $4f94
	pop  af                                                         ; $4f95
	jp   .updateScenarioSrc                                         ; $4f96

.notDarkenSky:
; If not a misc scenario..
	cp   $18                                                        ; $4f99
	jr   c, .scenarioLt18h                                          ; $4f9b

; Simply save address
	ld   a, l                                                       ; $4f9d
	ld   [wCurrAddrForTrainLineLocationsMiscScenarios], a           ; $4f9e
	ld   a, h                                                       ; $4fa1
	ld   [wCurrAddrForTrainLineLocationsMiscScenarios+1], a         ; $4fa2
	ret                                                             ; $4fa5

.scenarioLt18h:
; We're in the right distance if we're within the distance required
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4fa6
	cp   d                                                          ; $4fa9
	jr   c, .inRightDistance                                        ; $4faa

	jr   nz, .done                                                  ; $4fac

	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $4fae
	cp   e                                                          ; $4fb1
	jr   c, .inRightDistance                                        ; $4fb2

	jr   z, .inRightDistance                                        ; $4fb4

.done:
	ret                                                             ; $4fb6

.inRightDistance:
; If approaching station..
	ld   a, b                                                       ; $4fb7
	cp   SCEN_APPROACHING_STATION                                   ; $4fb8
	jr   nz, .notApproachingStation                                 ; $4fba

; And it's 1 we need to stop at, set that flag
	ld   a, [wNumStationsLeftToSkip]                                ; $4fbc
	or   a                                                          ; $4fbf
	jr   nz, .updateScenarioSrc                                     ; $4fc0

	ld   a, $01                                                     ; $4fc2
	ld   [wApproachingNextStationToStopAt], a                       ; $4fc4
	jr   .updateScenarioSrc                                         ; $4fc7

.notApproachingStation:
; Else set misc scenario idx and save scenario ptr
	ld   a, b                                                       ; $4fc9
	ld   [wScenarioIdxForMiscellaneousScenarios], a                 ; $4fca

.updateScenarioSrc:
	ld   a, l                                                       ; $4fcd
	ld   [wCurrAddrForTrainLineLocationsMiscScenarios], a           ; $4fce
	ld   a, h                                                       ; $4fd1
	ld   [wCurrAddrForTrainLineLocationsMiscScenarios+1], a         ; $4fd2
	ret                                                             ; $4fd5


AutoStopTrainAtDestIfGodMode:
; God-mode only function
	ld   a, [wGodModeApplied]                                       ; $4fd6
	or   a                                                          ; $4fd9
	ret  z                                                          ; $4fda

; Return if the station is not 1 to stop at
	ld   a, [wApproachingNextStationToStopAt]                       ; $4fdb
	or   a                                                          ; $4fde
	ret  z                                                          ; $4fdf

; Return if not at or passed station
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $4fe0
	ld   b, a                                                       ; $4fe3
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4fe4
	bit  7, a                                                       ; $4fe7
	jr   nz, .autoStop                                              ; $4fe9

	or   b                                                          ; $4feb
	ret  nz                                                         ; $4fec

.autoStop:
; Set perfect distance, and halt completely
	xor  a                                                          ; $4fed
	ld   [wMeterPartOfDistanceBeforeNextStation], a                 ; $4fee
	ld   [wMeterPartOfDistanceBeforeNextStation+1], a               ; $4ff1
	ld   [wInGameCurrSubSpeed], a                                   ; $4ff4
	ld   [wInGameCurrSpeed], a                                      ; $4ff7
	ret                                                             ; $4ffa


; BC - value to add
; HL - word to add to
AddBContoHL_noWrapArounds:
	bit  7, b                                                       ; $4ffb
	jr   nz, .negative                                              ; $4ffd

; If we didn't wrap around, enter, otherwise set the highest word value
	add  hl, bc                                                     ; $4fff
	ret  nc                                                         ; $5000

	ld   hl, $ffff                                                  ; $5001
	ret                                                             ; $5004

.negative:
; If we are a lower number, return, otherwise HL = 0
	add  hl, bc                                                     ; $5005
	ret  c                                                          ; $5006

	ld   hl, $0000                                                  ; $5007
	ret                                                             ; $500a


HandleStandardOrCustomSpeedLimitsEnding:
; B = value associated with standard speed limit/atc, or $ff if none
	ld   a, [wValueAssociatedWithInfoEvent]                         ; $500b
	ld   b, a                                                       ; $500e
	ld   a, [wCurrSpeedLimitState]                                  ; $500f
	or   a                                                          ; $5012
	jr   nz, :+                                                     ; $5013
	ld   b, $ff                                                     ; $5015

; C = value associated with custom speed limit, or $ff if none
:	ld   a, [wValueAssociatedWithCustomSpeedLimitEvent]             ; $5017
	ld   c, a                                                       ; $501a
	ld   a, [wCustomSpeedLimitOrStopState]                          ; $501b
	or   a                                                          ; $501e
	jr   nz, :+                                                     ; $501f
	ld   c, $ff                                                     ; $5021

; Jump if custom speed limit val < standard speed limit val (ie consider the lowest)
:	ld   a, c                                                       ; $5023
	cp   b                                                          ; $5024
	jr   c, .considerCustomSpeedLimit                               ; $5025

; Return if no active speed limit
	ld   a, [wCurrSpeedLimitState]                                  ; $5027
	or   a                                                          ; $502a
	jr   z, .done                                                   ; $502b

; Else branch based on current standard speed limit state
	cp   $01                                                        ; $502d
	jr   z, .currSpeedLimitLtePrev                                  ; $502f

	jr   .displayStandardSpeedLimitEvent                            ; $5031

.currSpeedLimitLtePrev:
; HL = scenario trigger distance for speed limit
	ld   a, [wSpeedLimitScenarioTriggerDistance]                    ; $5033
	ld   l, a                                                       ; $5036
	ld   a, [wSpeedLimitScenarioTriggerDistance+1]                  ; $5037
	ld   h, a                                                       ; $503a

; Branch based on that distance compared to ours
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $503b
	cp   h                                                          ; $503e
	jr   c, .currDistanceLteScenarioDistance                        ; $503f

	jr   nz, .currDistanceGtScenarioDistance                        ; $5041

	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $5043
	cp   l                                                          ; $5046
	jr   c, .currDistanceLteScenarioDistance                        ; $5047

	jr   z, .currDistanceLteScenarioDistance                        ; $5049

.currDistanceGtScenarioDistance:
; Flash event, as it's being removed
	ld   a, [wMainLoopCounter]                                      ; $504b
	and  $10                                                        ; $504e
	jr   nz, :+                                                     ; $5050

	ld   a, [wNextSpeedRecommendationOrATCInfoEventIdx]             ; $5052
	ld   [wInGameInfoEventIdx], a                                   ; $5055
	jr   .done                                                      ; $5058

:	ld   a, INFO_EV_NONE                                            ; $505a
	ld   [wInGameInfoEventIdx], a                                   ; $505c
	jr   .done                                                      ; $505f

.currDistanceLteScenarioDistance:
; Play sound and set as if our speed limit is higher than prev
; ie don't set things anymore, as if we are in a dire state
	call PlayDiffSoundEffectBasedOnIfTrainLineA                     ; $5061
	ld   a, $02                                                     ; $5064
	ld   [wCurrSpeedLimitState], a                                  ; $5066

.displayStandardSpeedLimitEvent:
; Simply display info event
	ld   a, [wNextSpeedRecommendationOrATCInfoEventIdx]             ; $5069
	ld   [wInGameInfoEventIdx], a                                   ; $506c
	jr   .done                                                      ; $506f

.done:
	ret                                                             ; $5071

.considerCustomSpeedLimit:
; Return if no active limit
	ld   a, [wCustomSpeedLimitOrStopState]                          ; $5072
	or   a                                                          ; $5075
	jr   z, .done2                                                  ; $5076

; Branch based on state, 2 - just display the event
	cp   $01                                                        ; $5078
	jr   z, .customSpeedLtePrev                                     ; $507a

	jr   .forceCustomInfoEvent                                      ; $507c

.customSpeedLtePrev:
; HL = ending distance (trigger - global notification)
	ld   a, [wCustomSpeedTriggerDistanceMinusNotifyDistance]        ; $507e
	ld   l, a                                                       ; $5081
	ld   a, [wCustomSpeedTriggerDistanceMinusNotifyDistance+1]      ; $5082
	ld   h, a                                                       ; $5085

; Branch based on our distance compared to HL
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $5086
	cp   h                                                          ; $5089
	jr   c, .currDistanceLteEndDistance                             ; $508a

	jr   nz, .currDistanceGtEndDistance                             ; $508c

	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $508e
	cp   l                                                          ; $5091
	jr   c, .currDistanceLteEndDistance                             ; $5092

	jr   z, .currDistanceLteEndDistance                             ; $5094

.currDistanceGtEndDistance:
; Flash info event
	ld   a, [wMainLoopCounter]                                      ; $5096
	and  $10                                                        ; $5099
	jr   nz, :+                                                     ; $509b

	ld   a, [wNextCustomSpeedLimitOrStopInfoEventIdx]               ; $509d
	ld   [wInGameInfoEventIdx], a                                   ; $50a0
	jr   .done2                                                     ; $50a3

:	ld   a, INFO_EV_NONE                                            ; $50a5
	ld   [wInGameInfoEventIdx], a                                   ; $50a7
	jr   .done2                                                     ; $50aa

.currDistanceLteEndDistance:
; Set state to 2 to just display info event
	ld   a, $02                                                     ; $50ac
	ld   [wCustomSpeedLimitOrStopState], a                          ; $50ae

.forceCustomInfoEvent:
	ld   a, [wNextCustomSpeedLimitOrStopInfoEventIdx]               ; $50b1
	ld   [wInGameInfoEventIdx], a                                   ; $50b4

.done2:
	ret                                                             ; $50b7


DisplayInfoEvent:
; Set info event from info idx as a double index into table
	ld   a, [wInGameInfoEventIdx]                                   ; $50b8
	ld   hl, .events                                                ; $50bb
	ld   c, a                                                       ; $50be
	ld   b, $00                                                     ; $50bf
	add  hl, bc                                                     ; $50c1
	ld   a, [hl]                                                    ; $50c2
	ld   [wInGameEventIdx2], a                                      ; $50c3
	ret                                                             ; $50c6

.events:
	db EVENT_NONE
	db EVENT_ATTENTION_45KM_H
	db EVENT_STOP_SIGNAL
	db EVENT_WARNING_25KM_H
	db EVENT_DECELERATION_70KM_H
	db EVENT_NO_SPEED_LIMIT
	db EVENT_GREEN_SIGNAL
	db EVENT_CARRY_ON_OUT
	db EVENT_CARRY_ON_FIELD
	db EVENT_SPEED_LIMIT_35KM_H
	db EVENT_SPEED_LIMIT_75KM_H
	db EVENT_SPEED_LIMIT_70KM_H
	db EVENT_SPEED_LIMIT_60KM_H
	db EVENT_SPEED_LIMIT_55KM_H
	db EVENT_SPEED_LIMIT_40KM_H
	db EVENT_SPEED_LIMIT_30KM_H
	db EVENT_SPEED_LIMIT_45KM_H
	db EVENT_SPEED_LIMIT_50KM_H
	db EVENT_SPEED_LIMIT_65KM_H
	db EVENT_SPEED_LIMIT_80KM_H
	db EVENT_SPEED_LIMIT_85KM_H
	db EVENT_SPEED_LIMIT_90KM_H
	db EVENT_SPEED_LIMIT_95KM_H
	db EVENT_SPEED_LIMIT_100KM_H
	db EVENT_SPEED_LIMIT_105KM_H
	db EVENT_SPEED_LIMIT_110KM_H
	db EVENT_SPEED_LIMIT_115KM_H
	db EVENT_SPEED_LIMIT_120KM_H
	db EVENT_SPEED_LIMIT_125KM_H
	db EVENT_SPEED_LIMIT_160KM_H
	db EVENT_SPEED_LIMIT_210KM_H
	db EVENT_SPEED_LIMIT_245KM_H
	db EVENT_CAB_GET_ON
	db EVENT_ATC_30
	db EVENT_ATC_70
	db EVENT_ATC_110
	db EVENT_ATC_160
	db EVENT_ATC_210
	db EVENT_ATC_245


CheckIfSpeeding:
	call CheckIfOverSped                                            ; $50ee

; Penalties below don't apply to God mode
	ld   a, [wGodModeApplied]                                       ; $50f1
	or   a                                                          ; $50f4
	ret  nz                                                         ; $50f5

; Jump if trainline A
	ld   a, [wSelectedTrainLine]                                    ; $50f6
	cp   $0a                                                        ; $50f9
	jp   z, .trainLineA                                             ; $50fb

; E = allowable overspeed offset
	call GetAllowableSpeedOffsetOverLimit                           ; $50fe
	ld   e, b                                                       ; $5101

; If custom speed limit is greater than previous..
	ld   b, $ff                                                     ; $5102
	ld   a, [wCustomSpeedLimitOrStopState]                          ; $5104
	cp   $02                                                        ; $5107
	jr   nz, :+                                                     ; $5109

; B = associated custom speed limit, else B = $ff
	ld   a, [wValueAssociatedWithCustomSpeedLimitEvent]             ; $510b
	ld   b, a                                                       ; $510e

; If curr standard speed limit > prev speed limit, C = limit + allowable speed
; Else C = $ff
:	ld   c, $ff                                                     ; $510f
	ld   a, [wCurrSpeedLimitState]                                  ; $5111
	cp   $02                                                        ; $5114
	jr   nz, .afterSpeedLimitStateCheck                             ; $5116

	ld   a, [wValueAssociatedWithInfoEvent]                         ; $5118
	add  e                                                          ; $511b
	ld   c, a                                                       ; $511c

.afterSpeedLimitStateCheck:
; Jump if standard speed limit >= custom speed limit (ie consider lowest limit)
	ld   a, c                                                       ; $511d
	cp   b                                                          ; $511e
	jr   nc, .checkAgainstCustomLimit                               ; $511f

; Return if we've already been penalized for not following the speed limit
	ld   a, [wPenalizedForNotFollowingSpeedLimit]                   ; $5121
	or   a                                                          ; $5124
	ret  nz                                                         ; $5125

; Return if current speed <= allowable speed
	ld   a, [wInGameCurrSpeed]                                      ; $5126
	cp   c                                                          ; $5129
	ret  c                                                          ; $512a
	ret  z                                                          ; $512b

; Else display ignored text, and penalize player
	ld   a, IGS_TEXT_IGNORED_SIGN_SIGNALS                           ; $512c
	ld   [wInGameOnSceneryTextIdx], a                               ; $512e

	call GetTrainLineDifficultyPenaltyPtsWhenIgnoringSpeedSigns     ; $5131
	ld   a, b                                                       ; $5134
	ld   [wInGamePenaltiesAboutToBeAddedOrSubbed], a                ; $5135
	call SubBFromPenaltiesAllowed                                   ; $5138

; Set flag so we're penalized only once
	ld   a, $01                                                     ; $513b
	ld   [wPenalizedForNotFollowingSpeedLimit], a                   ; $513d
	ld   hl, wPenaltyCounterForNotFollowingSpeedLimit               ; $5140
	ld   c, $05                                                     ; $5143
	call AddCToByteInHL_maxFFh                                      ; $5145
	ret                                                             ; $5148

.checkAgainstCustomLimit:
; Return if current speed <= allowable custom speed
	ld   a, [wInGameCurrSpeed]                                      ; $5149
	cp   b                                                          ; $514c
	ret  c                                                          ; $514d
	ret  z                                                          ; $514e

; Return if we've already been penalized
	ld   a, [w1IfIgnoredATSOp2IfIgnoredSignal]                      ; $514f
	or   a                                                          ; $5152
	ret  nz                                                         ; $5153

; Set that we ignored the custom speed signal
	ld   a, $02                                                     ; $5154
	ld   [w1IfIgnoredATSOp2IfIgnoredSignal], a                      ; $5156
	ld   a, IGS_TEXT_IGNORED_SIGN_SIGNALS                           ; $5159
	ld   [wInGameOnSceneryTextIdx], a                               ; $515b

; E = value we oversped by, cap it, or set a minimum deduction
	ld   a, [wInGameCurrSpeed]                                      ; $515e
	sub  b                                                          ; $5161
	ld   e, a                                                       ; $5162
	call GetTrainLineDifficultyPenaltyDeductionForOverSpeedingACustomLimit ; $5163
	ld   a, e                                                       ; $5166
	ld   [wInGamePenaltiesAboutToBeAddedOrSubbed], a                ; $5167
	ld   b, a                                                       ; $516a
	call SubBFromPenaltiesAllowed                                   ; $516b

; Possible custom speeds are 25, 45, 70
	ld   a, [wValueAssociatedWithCustomSpeedLimitEvent]             ; $516e
	ld   c, $08                                                     ; $5171
	or   a                                                          ; $5173
	jr   z, .penalize                                               ; $5174

	ld   c, $06                                                     ; $5176
	cp   26                                                         ; $5178
	jr   c, .penalize                                               ; $517a

	ld   c, $04                                                     ; $517c
	cp   46                                                         ; $517e
	jr   c, .penalize                                               ; $5180

	ld   c, $02                                                     ; $5182
	cp   71                                                         ; $5184
	jr   c, .penalize                                               ; $5186

	ret                                                             ; $5188

.penalize:
; The lower the limit, the more we add to the penalty counter
	ld   hl, wPenaltyCounterForNotDeceleratingWhenNeeded            ; $5189
	call AddCToByteInHL_maxFFh                                      ; $518c
	ret                                                             ; $518f

.trainLineA:
; For trainline A, continue if the new speed limit > its previous
	ld   a, [wCurrSpeedLimitState]                                  ; $5190
	cp   $02                                                        ; $5193
	ret  nz                                                         ; $5195

; If we go over the ATC speed..
	ld   a, [wATCAssociatedValuePlus2]                              ; $5196
	ld   b, a                                                       ; $5199
	ld   a, [wInGameCurrSpeed]                                      ; $519a
	cp   b                                                          ; $519d
	ret  c                                                          ; $519e

; Display over speed text, stop the train and set penalties to 0
	ld   a, IGS_TEXT_OVER_SPEED                                     ; $519f
	ld   [wInGameOnSceneryTextIdx], a                               ; $51a1
	xor  a                                                          ; $51a4
	ld   [wInGameCurrSubSpeed], a                                   ; $51a5
	ld   [wInGameCurrSpeed], a                                      ; $51a8
	ld   a, a                                                       ; $51ab
	ld   [wPenaltiesAllowed], a                                     ; $51ac
	ret                                                             ; $51af


; Called also in Location Done (adds to streak, allows starting at restrictions 2,4,6)
UpdateCustomRestrictions::
; Return if God mode applied
	ld   a, [wGodModeApplied]                                       ; $51b0
	or   a                                                          ; $51b3
	ret  nz                                                         ; $51b4

; HL (later DE) = curr seconds excluding hr
	ld   a, [wCurrTimeSeconds]                                      ; $51b5
	ld   c, a                                                       ; $51b8
	ld   a, [wCurrTimeMinutes]                                      ; $51b9
	ld   h, a                                                       ; $51bc
	call HLequHtimes60plusC                                         ; $51bd
	push hl                                                         ; $51c0

; HL = dest seconds excluding hr
	ld   a, [wDestinationTimeSeconds]                               ; $51c1
	ld   c, a                                                       ; $51c4
	ld   a, [wDestinationTimeMinutes]                               ; $51c5
	ld   h, a                                                       ; $51c8
	call HLequHtimes60plusC                                         ; $51c9
	pop  de                                                         ; $51cc

; DE = -curr seconds
	ld   a, d                                                       ; $51cd
	cpl                                                             ; $51ce
	ld   d, a                                                       ; $51cf
	ld   a, e                                                       ; $51d0
	cpl                                                             ; $51d1
	ld   e, a                                                       ; $51d2
	inc  de                                                         ; $51d3

; HL = dest seconds - curr seconds
	add  hl, de                                                     ; $51d4

; Jump if breached dest seconds
	ld   a, l                                                       ; $51d5
	or   h                                                          ; $51d6
	jr   z, .passedDestTime                                         ; $51d7

	bit  7, h                                                       ; $51d9
	jr   nz, .passedDestTime                                        ; $51db

; Add total time diffs, and get it +1
	ld   a, [wTotalTimeAheadOfStoppingStationsSinceDepartureOrContinue] ; $51dd
	add  l                                                          ; $51e0
	ld   [wTotalTimeAheadOfStoppingStationsSinceDepartureOrContinue], a ; $51e1
	ld   d, a                                                       ; $51e4
	inc  d                                                          ; $51e5

; E = 0 for hard difficulty, 2 for medium, and 4 for easy
	ld   e, $00                                                     ; $51e6

	ld   a, [wDifficultyLevel]                                      ; $51e8
	or   a                                                          ; $51eb
	jr   z, .easyDifficulty                                         ; $51ec

	cp   $01                                                        ; $51ee
	jr   z, .mediumDifficulty                                       ; $51f0

	jr   .afterDifficultyBranch                                     ; $51f2

.easyDifficulty:
	ld   e, $04                                                     ; $51f4
	jr   .afterDifficultyBranch                                     ; $51f6

.mediumDifficulty:
	ld   e, $02                                                     ; $51f8

.afterDifficultyBranch:
; HL = 6 * trainline idx into table
	ld   a, [wSelectedTrainLine]                                    ; $51fa
	ld   c, a                                                       ; $51fd
	add  a                                                          ; $51fe
	add  c                                                          ; $51ff
	add  a                                                          ; $5200
	ld   c, a                                                       ; $5201
	ld   b, $00                                                     ; $5202
	ld   hl, .customRestrictionsThresholdTable                      ; $5204
	add  hl, bc                                                     ; $5207

; Loop 6 times, stopping when difficulty val + table val >= total time diff
; ie it's easier for B to be higher the the easier, or the lower our time diff is
	ld   b, $06                                                     ; $5208
:	ld   a, [hl+]                                                   ; $520a
	add  e                                                          ; $520b
	cp   d                                                          ; $520c
	jr   nc, .afterTableCheck                                       ; $520d

	dec  b                                                          ; $520f
	jr   nz, :-                                                     ; $5210

.afterTableCheck:
; Reverse B so that B is lower the easier, or better we are
	ld   a, $06                                                     ; $5212
	sub  b                                                          ; $5214
	ld   b, a                                                       ; $5215

; Jump if calling from location done screen
	ld   a, [wGameState]                                            ; $5216
	cp   GS_LOCATION_DONE_MAIN                                      ; $5219
	jr   z, .afterDecBCheck                                         ; $521b

; In-game, keep B = 0, 1, 1, 3, 3, 5, 5
	ld   a, b                                                       ; $521d
	cp   $02                                                        ; $521e
	jr   z, .decB                                                   ; $5220

	cp   $04                                                        ; $5222
	jr   z, .decB                                                   ; $5224

	cp   $06                                                        ; $5226
	jr   z, .decB                                                   ; $5228

	jr   .afterDecBCheck                                            ; $522a

.decB:
	dec  b                                                          ; $522c

.afterDecBCheck:
; Set index, returning if 0
	ld   a, b                                                       ; $522d
	ld   [wIndexOfCustomSpeedLimitOrStopEv], a                      ; $522e
	or   a                                                          ; $5231
	ret  z                                                          ; $5232

; Otherwise use it as an index to the restrictions table
	dec  a                                                          ; $5233
	add  a                                                          ; $5234
	ld   c, a                                                       ; $5235
	ld   b, $00                                                     ; $5236
	ld   hl, .customRestrictions                                    ; $5238
	add  hl, bc                                                     ; $523b

; Save its bank 7 address
	ld   a, [hl+]                                                   ; $523c
	ld   [wCustomSpeedLimitOrStopEventAddr], a                      ; $523d
	ld   a, [hl]                                                    ; $5240
	ld   [wCustomSpeedLimitOrStopEventAddr+1], a                    ; $5241
	ret                                                             ; $5244

.passedDestTime:
; Reset our streak
	ld   a, $00                                                     ; $5245
	ld   [wTotalTimeAheadOfStoppingStationsSinceDepartureOrContinue], a ; $5247

	ld   a, $00                                                     ; $524a
	ld   [wIndexOfCustomSpeedLimitOrStopEv], a                      ; $524c
	ret                                                             ; $524f

.customRestrictionsThresholdTable:
	db $0c, $0e, $10, $12, $14, $18
	db $07, $0c, $0c, $14, $14, $18
	db $06, $08, $0a, $0c, $0e, $18
	db $08, $0a, $0c, $0e, $10, $1a
	db $06, $0a, $0a, $14, $14, $18
	db $0a, $0e, $12, $14, $16, $1a
	db $08, $0b, $0d, $11, $15, $18
	db $07, $0b, $0e, $12, $15, $18
	db $07, $0a, $0e, $12, $15, $18
	db $0a, $0d, $10, $13, $15, $18
	db $06, $0a, $0a, $14, $14, $18

.customRestrictions:
	dw CustomRestrictions1
	dw CustomRestrictions2
	dw CustomRestrictions3
	dw CustomRestrictions4
	dw CustomRestrictions5
	dw CustomRestrictions6


CheckIfOverSped:
; Return if already penalized
	ld   a, [wOverSped]                                             ; $529e
	or   a                                                          ; $52a1
	ret  nz                                                         ; $52a2

; Return if our speed is less than what's considered overspeeding
	ld   a, [wCurrTrainLineOverspeedingSpeed]                       ; $52a3
	ld   b, a                                                       ; $52a6
	ld   a, [wInGameCurrSpeed]                                      ; $52a7
	cp   b                                                          ; $52aa
	ret  c                                                          ; $52ab

; Set this flag so we're penalized only once, then add to penalty score
	ld   a, $01                                                     ; $52ac
	ld   [wOverSped], a                                             ; $52ae

	ld   hl, wPenaltyValueForOverspeeding                           ; $52b1
	ld   c, $02                                                     ; $52b4
	call AddCToByteInHL_maxFFh                                      ; $52b6
	ret                                                             ; $52b9


IntroCutsceneScript:
; --
; -- Setup for hi-col
; --
	SCR_StartSubScript2 IntroCutsceneScript_subscript2_inputHandling
	SCR_ExecAsmBelow

; Load black BG palettes - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $52bf
	ld   hl, Palettes_AllBlack                                      ; $52c1
	call SetBGPaletteSrc                                            ; $52c4
	xor  a                                                          ; $52c7
	ld   [wPaletteFadeAmount], a                                    ; $52c8
	ld   [wLoadPalettesFromRam], a                                  ; $52cb
	ld   a, $01                                                     ; $52ce
	ld   [wLoadBGPalettesFromRom], a                                ; $52d0

; Load black OBJ palettes - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $52d3
	ld   hl, Palettes_AllBlack                                      ; $52d5
	call SetOBJPaletteSrc                                           ; $52d8
	xor  a                                                          ; $52db
	ld   [wPaletteFadeAmount], a                                    ; $52dc
	ld   [wLoadPalettesFromRam], a                                  ; $52df
	ld   a, $01                                                     ; $52e2
	ld   [wLoadOBJPalettesFromRom], a                               ; $52e4

	call ProcessScriptsFromCurrLoc                                  ; $52e7
	SCR_ResumeNextFrame

; Preserve curr wram bank
	SCR_ExecAsmBelow
	ldh  a, [rSVBK]                                                 ; $52ec
	and  $03                                                        ; $52ee
	push af                                                         ; $52f0

; Store normal screen 0 layouts shifted down 1 row, into wram bank 2
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $52f1
	ldh  [rSVBK], a                                                 ; $52f3

	ld   de, wIntroCutsceneTileMapBuffer                            ; $52f5
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $52f8
	ld   hl, TileMapScrn0_IntroCutsceneShiftedDown                  ; $52fb
	ld   a, BANK(TileMapScrn0_IntroCutsceneShiftedDown)             ; $52fe
	call FarRectCopy                                                ; $5300

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $5303
	ld   a, $01                                                     ; $5306
	ldh  [rVBK], a                                                  ; $5308
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $530a
	ld   a, BANK(TileAttrScrn0_IntroCutsceneShiftedDown)            ; $530d
	call FarRectCopy                                                ; $530f

	pop  af                                                         ; $5312
	ldh  [rSVBK], a                                                 ; $5313

; Load tile map and attrs to screen 0
	ld   a, $01                                                     ; $5315
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $5317
	call ProcessScriptsFromCurrLoc                                  ; $531a
	
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow

; Preserve curr wram bank
	ldh  a, [rSVBK]                                                 ; $531f
	and  $03                                                        ; $5321
	push af                                                         ; $5323

; Store normal screen 1 layouts shifted down 1 row, into wram bank 2
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $5324
	ldh  [rSVBK], a                                                 ; $5326

	ld   de, wIntroCutsceneTileMapBuffer                            ; $5328
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $532b
	ld   hl, TileMapScrn1_IntroCutsceneShiftedDown                  ; $532e
	ld   a, BANK(TileMapScrn1_IntroCutsceneShiftedDown)             ; $5331
	call FarRectCopy                                                ; $5333

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $5336
	ld   a, $01                                                     ; $5339
	ldh  [rVBK], a                                                  ; $533b
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $533d
	ld   a, BANK(TileAttrScrn1_IntroCutsceneShiftedDown)            ; $5340
	call FarRectCopy                                                ; $5342

	pop  af                                                         ; $5345
	ldh  [rSVBK], a                                                 ; $5346

; Load tile map and attrs to screen 1
	ld   a, $02                                                     ; $5348
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $534a
	call ProcessScriptsFromCurrLoc                                  ; $534d
	
; --
; -- Hi-col train
; --
; Have vblank run hi-col functions to animate
	SCR_ResumeNextFrame
	SCR_Call Script_SetHiColAsAnimEngine
	SCR_ExecAsmBelow

; Start with black screen
	ld   a, HI_COL_BLACK                                            ; $5355
	ld   [wCutsceneHiColIdx], a                                     ; $5357
	call LoadBGPaletteSrcForHiColScreen                             ; $535a
	call ProcessScriptsFromCurrLoc                                  ; $535d
	
; Display train, flash its lights, then set a black screen
	SCR_StoreByteInAddr wCutsceneHiColIdxToLoad, HI_COL_TRAIN_NO_LIGHTS
	SCR_Delay $1e
	SCR_PlaySound MUS_12
	SCR_Delay $06
	SCR_StoreByteInAddr wCutsceneHiColIdxToLoad, HI_COL_TRAIN_LIGHTS
	SCR_Delay $19
	SCR_StoreByteInAddr wCutsceneHiColIdxToLoad, HI_COL_BLACK

; --
; -- 1st small rect screen
; --
; Setup screen and small rect idx
	SCR_Call Script_SetUpSmallRectOamAnimType_WithScrn1
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, SMALL_RECT_TRAIN_1_START
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
	SCR_Delay $02

; Load BG and OBJ palettes
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_SmallRect1stTrain)                        ; $5381
	ld   hl, Palettes_SmallRect1stTrain                             ; $5383
	call SetBGPaletteSrc                                            ; $5386
	xor  a                                                          ; $5389
	ld   [wPaletteFadeAmount], a                                    ; $538a
	ld   [wLoadPalettesFromRam], a                                  ; $538d
	ld   a, $01                                                     ; $5390
	ld   [wLoadBGPalettesFromRom], a                                ; $5392

	ld   b, BANK(Palettes_SmallRect1stTrain)                        ; $5395
	ld   hl, Palettes_SmallRect1stTrain                             ; $5397
	call SetOBJPaletteSrc                                           ; $539a
	xor  a                                                          ; $539d
	ld   [wPaletteFadeAmount], a                                    ; $539e
	ld   [wLoadPalettesFromRam], a                                  ; $53a1
	ld   a, $01                                                     ; $53a4
	ld   [wLoadOBJPalettesFromRom], a                               ; $53a6

; Animate
	call ProcessScriptsFromCurrLoc                                  ; $53a9
	SCR_StartSubScript1 Script_FadeInQuicklyFromBlack
DEF CURR_SMALL_RECT_IDX = SMALL_RECT_TRAIN_1_START+1
rept SMALL_RECT_TRAIN_1_END-(SMALL_RECT_TRAIN_1_START+1)+1
	SCR_Delay $04
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, CURR_SMALL_RECT_IDX
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
CURR_SMALL_RECT_IDX = CURR_SMALL_RECT_IDX + 1
endr

; Fade out and unset sprite src and anim engine
	SCR_StartSubScript1 Script_FadeOutQuicklyToBlack
	SCR_Delay $04
	SCR_UnsetSpriteSrc
	SCR_StoreByteInAddr wIntroCutsceneAnimationEngineType, ANIM_ENGINE_NONE
	
; Load black BG palettes - no fade
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_AllBlack)                                 ; $5416
	ld   hl, Palettes_AllBlack                                      ; $5418
	call SetBGPaletteSrc                                            ; $541b
	xor  a                                                          ; $541e
	ld   [wPaletteFadeAmount], a                                    ; $541f
	ld   [wLoadPalettesFromRam], a                                  ; $5422
	ld   a, $01                                                     ; $5425
	ld   [wLoadBGPalettesFromRom], a                                ; $5427

; Load black OBJ palettes - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $542a
	ld   hl, Palettes_AllBlack                                      ; $542c
	call SetOBJPaletteSrc                                           ; $542f
	xor  a                                                          ; $5432
	ld   [wPaletteFadeAmount], a                                    ; $5433
	ld   [wLoadPalettesFromRam], a                                  ; $5436
	ld   a, $01                                                     ; $5439
	ld   [wLoadOBJPalettesFromRom], a                               ; $543b
	call ProcessScriptsFromCurrLoc                                  ; $543e
	SCR_ResumeNextFrame

; --
; -- Green train screen
; --
; Load tile data
	SCR_ExecAsmBelow
	ld   bc, WIDE_SCREEN_GREEN_TRAIN_1                              ; $5443
	call TransferTileDataForWideScreen                              ; $5446
	ld   bc, WIDE_SCREEN_GREEN_TRAIN_2                              ; $5449
	call TransferTileDataForWideScreen                              ; $544c
	ld   bc, WIDE_SCREEN_GREEN_TRAIN_3                              ; $544f
	call TransferTileDataForWideScreen                              ; $5452

	ldh  a, [rSVBK]                                                 ; $5455
	and  $03                                                        ; $5457
	push af                                                         ; $5459

; Copy tile map and attrs to ram
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $545a
	ldh  [rSVBK], a                                                 ; $545c
	ld   de, wIntroCutsceneTileMapBuffer                            ; $545e
	ldbc SCREEN_TILE_HEIGHT, WIDE_SCREEN_TILE_WIDTH                 ; $5461
	ld   hl, TileMap_WideScreen                                     ; $5464
	ld   a, BANK(TileMap_WideScreen)                                ; $5467
	call FarRectCopy                                                ; $5469

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $546c
	ld   a, $01                                                     ; $546f
	ldh  [rVBK], a                                                  ; $5471
	ldbc SCREEN_TILE_HEIGHT, WIDE_SCREEN_TILE_WIDTH                 ; $5473
	ld   a, BANK(TileAttr_WideScreen)                               ; $5476
	call FarRectCopy                                                ; $5478

	pop  af                                                         ; $547b
	ldh  [rSVBK], a                                                 ; $547c

; Load into screen 0
	ld   a, $01                                                     ; $547e
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $5480

; Set base green BG palettes - no fade
	ld   b, BANK(Palettes_IntroCutsceneGreenTrain)                  ; $5483
	ld   hl, Palettes_IntroCutsceneGreenTrain                       ; $5485
	call SetBGPaletteSrc                                            ; $5488
	xor  a                                                          ; $548b
	ld   [wPaletteFadeAmount], a                                    ; $548c
	ld   [wLoadPalettesFromRam], a                                  ; $548f
	ld   a, $01                                                     ; $5492
	ld   [wLoadBGPalettesFromRom], a                                ; $5494

; Set base green OBJ palettes - no fade
	ld   b, BANK(Palettes_IntroCutsceneGreenTrain)                  ; $5497
	ld   hl, Palettes_IntroCutsceneGreenTrain                       ; $5499
	call SetOBJPaletteSrc                                           ; $549c
	xor  a                                                          ; $549f
	ld   [wPaletteFadeAmount], a                                    ; $54a0
	ld   [wLoadPalettesFromRam], a                                  ; $54a3
	ld   a, $01                                                     ; $54a6
	ld   [wLoadOBJPalettesFromRom], a                               ; $54a8

; Turn on LCD and fade current screen to black
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $54ab
	ldh  [rLCDC], a                                                 ; $54ad
	call ProcessScriptsFromCurrLoc                                  ; $54af
	SCR_StartSubScript1 Script_FadeOutQuicklyToBlackAfterADelay

; Before fading, scroll widescreen right
	SCR_SetCounter1 $10
:	SCR_Delay $03
	SCR_ValInAddrPlusEquByte wSCX, $01
	SCR_DecCounter1_JNE :-

; --
; -- 2nd small rect screen
; --
; Screen 1 not overridden, do quicker setup
	SCR_StopSubScript1
	SCR_Call Script_SetUpSmallRectOamAnimType_NoScrn1
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, SMALL_RECT_TRAIN_2_START
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
	SCR_Delay $02

; Set palettes fading in from black
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_SmallRect2ndTrain)                        ; $54cf
	ld   hl, Palettes_SmallRect2ndTrain                             ; $54d1
	call SetBGPaletteSrc                                            ; $54d4
	ld   a, $20                                                     ; $54d7
	ld   [wPaletteFadeAmount], a                                    ; $54d9
	ld   a, $01                                                     ; $54dc
	ld   [wLoadPalettesFromRam], a                                  ; $54de

	ld   b, BANK(Palettes_SmallRect2ndTrain)                        ; $54e1
	ld   hl, Palettes_SmallRect2ndTrain                             ; $54e3
	call SetOBJPaletteSrc                                           ; $54e6
	ld   a, $20                                                     ; $54e9
	ld   [wPaletteFadeAmount], a                                    ; $54eb
	ld   a, $01                                                     ; $54ee
	ld   [wLoadPalettesFromRam], a                                  ; $54f0

; Animate
	call ProcessScriptsFromCurrLoc                                  ; $54f3
	SCR_StartSubScript1 Script_FadeInQuicklyFromBlack
DEF CURR_SMALL_RECT_IDX = SMALL_RECT_TRAIN_2_START+1
rept SMALL_RECT_TRAIN_2_END-(SMALL_RECT_TRAIN_2_START+1)+1
	SCR_Delay $04
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, CURR_SMALL_RECT_IDX
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
CURR_SMALL_RECT_IDX = CURR_SMALL_RECT_IDX + 1
endr

; Fade out, hide and stop using small rect animation engine
	SCR_StartSubScript1 Script_FadeOutQuicklyToBlack
	SCR_Delay $04
	SCR_StopSubScript1
	SCR_UnsetSpriteSrc
	SCR_StoreByteInAddr wIntroCutsceneAnimationEngineType, ANIM_ENGINE_NONE
	
; Set palettes to black - no fade
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_AllBlack)                                 ; $5558
	ld   hl, Palettes_AllBlack                                      ; $555a
	call SetBGPaletteSrc                                            ; $555d
	xor  a                                                          ; $5560
	ld   [wPaletteFadeAmount], a                                    ; $5561
	ld   [wLoadPalettesFromRam], a                                  ; $5564
	ld   a, $01                                                     ; $5567
	ld   [wLoadBGPalettesFromRom], a                                ; $5569

	ld   b, BANK(Palettes_AllBlack)                                 ; $556c
	ld   hl, Palettes_AllBlack                                      ; $556e
	call SetOBJPaletteSrc                                           ; $5571
	xor  a                                                          ; $5574
	ld   [wPaletteFadeAmount], a                                    ; $5575
	ld   [wLoadPalettesFromRam], a                                  ; $5578
	ld   a, $01                                                     ; $557b
	ld   [wLoadOBJPalettesFromRom], a                               ; $557d

	call ProcessScriptsFromCurrLoc                                  ; $5580
	SCR_ResumeNextFrame

; --
; -- Purple train wheel
; --
; Load tile data
	SCR_ExecAsmBelow
	ld   bc, WIDE_SCREEN_PURPLE_WHEEL_1                             ; $5585
	call TransferTileDataForWideScreen                              ; $5588
	ld   bc, WIDE_SCREEN_PURPLE_WHEEL_2                             ; $558b
	call TransferTileDataForWideScreen                              ; $558e
	ld   bc, WIDE_SCREEN_PURPLE_WHEEL_3                             ; $5591
	call TransferTileDataForWideScreen                              ; $5594

	ldh  a, [rSVBK]                                                 ; $5597
	and  $03                                                        ; $5599
	push af                                                         ; $559b

; Load tile map and attrs to ram buffer
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $559c
	ldh  [rSVBK], a                                                 ; $559e
	ld   de, wIntroCutsceneTileMapBuffer                            ; $55a0
	ldbc SCREEN_TILE_HEIGHT, WIDE_SCREEN_TILE_WIDTH                 ; $55a3
	ld   hl, TileMap_WideScreen                                     ; $55a6
	ld   a, BANK(TileMap_WideScreen)                                ; $55a9
	call FarRectCopy                                                ; $55ab

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $55ae
	ld   a, $01                                                     ; $55b1
	ldh  [rVBK], a                                                  ; $55b3
	ldbc SCREEN_TILE_HEIGHT, WIDE_SCREEN_TILE_WIDTH                 ; $55b5
	ld   a, BANK(TileAttr_WideScreen)                               ; $55b8
	call FarRectCopy                                                ; $55ba

; Load to screen 0
	pop  af                                                         ; $55bd
	ldh  [rSVBK], a                                                 ; $55be
	ld   a, $01                                                     ; $55c0
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $55c2

; Load BG palettes - no fade
	ld   b, BANK(Palettes_IntroCutscenePurpleTrainWheel)            ; $55c5
	ld   hl, Palettes_IntroCutscenePurpleTrainWheel                 ; $55c7
	call SetBGPaletteSrc                                            ; $55ca
	xor  a                                                          ; $55cd
	ld   [wPaletteFadeAmount], a                                    ; $55ce
	ld   [wLoadPalettesFromRam], a                                  ; $55d1
	ld   a, $01                                                     ; $55d4
	ld   [wLoadBGPalettesFromRom], a                                ; $55d6

; Load OBJ palettes - no fade
	ld   b, BANK(Palettes_IntroCutscenePurpleTrainWheel)            ; $55d9
	ld   hl, Palettes_IntroCutscenePurpleTrainWheel                 ; $55db
	call SetOBJPaletteSrc                                           ; $55de
	xor  a                                                          ; $55e1
	ld   [wPaletteFadeAmount], a                                    ; $55e2
	ld   [wLoadPalettesFromRam], a                                  ; $55e5
	ld   a, $01                                                     ; $55e8
	ld   [wLoadOBJPalettesFromRom], a                               ; $55ea

; Turn on LCD and fade out after scrolling
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $55ed
	ldh  [rLCDC], a                                                 ; $55ef
	call ProcessScriptsFromCurrLoc                                  ; $55f1
	SCR_StartSubScript1 Script_FadeOutQuicklyToBlackAfterADelay

; Scroll right before fade
	SCR_SetCounter1 $10
:	SCR_Delay $03
	SCR_ValInAddrPlusEquByte wSCX, $01
	SCR_DecCounter1_JNE :-

; --
; -- 3rd small rect train
; --
; Set up, screen 1 not overridden, so dont load it
	SCR_StopSubScript1
	SCR_Call Script_SetUpSmallRectOamAnimType_NoScrn1
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, SMALL_RECT_TRAIN_3_START
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
	SCR_Delay $02

; Set palettes fading in from black
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_SmallRect3rdTrain)                        ; $5611
	ld   hl, Palettes_SmallRect3rdTrain                             ; $5613
	call SetBGPaletteSrc                                            ; $5616
	ld   a, $20                                                     ; $5619
	ld   [wPaletteFadeAmount], a                                    ; $561b
	ld   a, $01                                                     ; $561e
	ld   [wLoadPalettesFromRam], a                                  ; $5620

	ld   b, BANK(Palettes_SmallRect3rdTrain)                        ; $5623
	ld   hl, Palettes_SmallRect3rdTrain                             ; $5625
	call SetOBJPaletteSrc                                           ; $5628
	ld   a, $20                                                     ; $562b
	ld   [wPaletteFadeAmount], a                                    ; $562d
	ld   a, $01                                                     ; $5630
	ld   [wLoadPalettesFromRam], a                                  ; $5632

; Animate
	call ProcessScriptsFromCurrLoc                                  ; $5635
	SCR_StartSubScript1 Script_FadeInQuicklyFromBlack
DEF CURR_SMALL_RECT_IDX = SMALL_RECT_TRAIN_3_START+1
rept SMALL_RECT_TRAIN_3_END-(SMALL_RECT_TRAIN_3_START+1)+1
	SCR_Delay $04
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, CURR_SMALL_RECT_IDX
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
CURR_SMALL_RECT_IDX = CURR_SMALL_RECT_IDX + 1
endr

; Fade out and hide sprites
	SCR_Delay $04
	SCR_StopSubScript1
	SCR_UnsetSpriteSrc

; --
; -- 1st credits screen
; --
; Set all palettes to black
	SCR_Call Script_SetUpIntroCreditsScreen
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_AllBlack)                                 ; $569e
	ld   hl, Palettes_AllBlack                                      ; $56a0
	call SetBGPaletteSrc                                            ; $56a3
	xor  a                                                          ; $56a6
	ld   [wPaletteFadeAmount], a                                    ; $56a7
	ld   [wLoadPalettesFromRam], a                                  ; $56aa
	ld   a, $01                                                     ; $56ad
	ld   [wLoadBGPalettesFromRom], a                                ; $56af

	ld   b, BANK(Palettes_AllBlack)                                 ; $56b2
	ld   hl, Palettes_AllBlack                                      ; $56b4
	call SetOBJPaletteSrc                                           ; $56b7
	xor  a                                                          ; $56ba
	ld   [wPaletteFadeAmount], a                                    ; $56bb
	ld   [wLoadPalettesFromRam], a                                  ; $56be
	ld   a, $01                                                     ; $56c1
	ld   [wLoadOBJPalettesFromRom], a                               ; $56c3

; Load tile data
	call ProcessScriptsFromCurrLoc                                  ; $56c6
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   bc, WIDE_SCREEN_1ST_CREDITS_1                              ; $56cb
	call TransferTileDataForWideScreen                              ; $56ce
	ld   bc, WIDE_SCREEN_1ST_CREDITS_2                              ; $56d1
	call TransferTileDataForWideScreen                              ; $56d4
	ld   bc, WIDE_SCREEN_1ST_CREDITS_3                              ; $56d7
	call TransferTileDataForWideScreen                              ; $56da
	ld   bc, WIDE_SCREEN_1ST_CREDITS_4                              ; $56dd
	call TransferTileDataForWideScreen                              ; $56e0
	ld   bc, WIDE_SCREEN_1ST_CREDITS_5                              ; $56e3
	call TransferTileDataForWideScreen                              ; $56e6

	ldh  a, [rSVBK]                                                 ; $56e9
	and  $03                                                        ; $56eb
	push af                                                         ; $56ed

; Load tile map and attrs to ram buffer
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $56ee
	ldh  [rSVBK], a                                                 ; $56f0

	ld   de, wIntroCutsceneTileMapBuffer                            ; $56f2
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $56f5
	ld   hl, TileMap_IntroCreditsScreen                             ; $56f8
	ld   a, BANK(TileMap_IntroCreditsScreen)                        ; $56fb
	call FarRectCopy                                                ; $56fd

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $5700
	ld   a, $01                                                     ; $5703
	ldh  [rVBK], a                                                  ; $5705
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $5707
	ld   a, BANK(TileAttr_IntroCreditsScreen)                       ; $570a
	call FarRectCopy                                                ; $570c

	pop  af                                                         ; $570f
	ldh  [rSVBK], a                                                 ; $5710

; Set BG and OBJ palettes faded out, fading in later
	ld   b, BANK(Palettes_IntroCutscene1stCreditsScreen)            ; $5712
	ld   hl, Palettes_IntroCutscene1stCreditsScreen                 ; $5714
	call SetBGPaletteSrc                                            ; $5717
	ld   a, $20                                                     ; $571a
	ld   [wPaletteFadeAmount], a                                    ; $571c
	ld   a, $01                                                     ; $571f
	ld   [wLoadPalettesFromRam], a                                  ; $5721

	ld   b, BANK(Palettes_IntroCutscene1stCreditsScreen)            ; $5724
	ld   hl, Palettes_IntroCutscene1stCreditsScreen                 ; $5726
	call SetOBJPaletteSrc                                           ; $5729
	ld   a, $20                                                     ; $572c
	ld   [wPaletteFadeAmount], a                                    ; $572e
	ld   a, $01                                                     ; $5731
	ld   [wLoadPalettesFromRam], a                                  ; $5733

; Turn on LCD and fade in
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $5736
	ldh  [rLCDC], a                                                 ; $5738
	call ProcessScriptsFromCurrLoc                                  ; $573a
	SCR_StartSubScript1 Script_FadeInQuicklyFromBlack
	SCR_Delay $12

; Fade text areas to black (cinematic)
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $3e
	SCR_StartSubScript1 Script_FadeOutQuicklyToBlack
	SCR_Delay $0c

; Fade in top text
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $0c
	SCR_StartSubScript1 Script_FadeInSlowlyFromBlack
	SCR_Call Scrip_ShiftCreditsTopBarLeft

; Fade in bottom text
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $10
	SCR_StartSubScript1 Script_FadeInSlowlyFromBlack
	SCR_Call Scrip_ShiftCreditsBottomBarRight
	SCR_Delay $14

; Flash text on screen
	SCR_FarSetSpriteSrc SpriteOam_IntroCreditsText
	SCR_SetSpriteXY $38, $30
	SCR_Call Script_CreditsScreenFlashText
	SCR_Delay $14

; Fade out all non-black palettes
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $fd
	SCR_StartSubScript1 Script_FadeOutQuicklyToBlack
	SCR_Delay $08

; Reset palette fade bits and rSTAT
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $ff
	SCR_StoreByteInAddr rSTAT, $00
	SCR_UnsetSpriteSrc

; --
; -- 4th small rect train
; --
; Set up, screen 1 overridden, so load it
	SCR_Call Script_SetUpSmallRectOamAnimType_WithScrn1
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, SMALL_RECT_TRAIN_4_START
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
	SCR_Delay $02
	
; Set palettes fading in from black
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_SmallRect4thTrain)                        ; $5791
	ld   hl, Palettes_SmallRect4thTrain                             ; $5793
	call SetBGPaletteSrc                                            ; $5796
	ld   a, $20                                                     ; $5799
	ld   [wPaletteFadeAmount], a                                    ; $579b
	ld   a, $01                                                     ; $579e
	ld   [wLoadPalettesFromRam], a                                  ; $57a0

	ld   b, BANK(Palettes_SmallRect4thTrain)                        ; $57a3
	ld   hl, Palettes_SmallRect4thTrain                             ; $57a5
	call SetOBJPaletteSrc                                           ; $57a8
	ld   a, $20                                                     ; $57ab
	ld   [wPaletteFadeAmount], a                                    ; $57ad
	ld   a, $01                                                     ; $57b0
	ld   [wLoadPalettesFromRam], a                                  ; $57b2

; Animate
	call ProcessScriptsFromCurrLoc                                  ; $57b5
	SCR_StartSubScript1 Script_FadeInQuicklyFromBlack
DEF CURR_SMALL_RECT_IDX = SMALL_RECT_TRAIN_4_START+1
rept SMALL_RECT_TRAIN_4_END-(SMALL_RECT_TRAIN_4_START+1)+1
	SCR_Delay $04
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, CURR_SMALL_RECT_IDX
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
CURR_SMALL_RECT_IDX = CURR_SMALL_RECT_IDX + 1
endr

; Fade out and hide sprites
	SCR_Delay $04
	SCR_StopSubScript1
	SCR_UnsetSpriteSrc

; --
; -- Diagonally panning 2 trains connected
; --
	SCR_StoreByteInAddr wIntroCutsceneAnimationEngineType, ANIM_ENGINE_LARGE_IMAGE

; Load all black palettes for BG and OBJ
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_AllBlack)                                 ; $5828
	ld   hl, Palettes_AllBlack                                      ; $582a
	call SetBGPaletteSrc                                            ; $582d
	xor  a                                                          ; $5830
	ld   [wPaletteFadeAmount], a                                    ; $5831
	ld   [wLoadPalettesFromRam], a                                  ; $5834
	ld   a, $01                                                     ; $5837
	ld   [wLoadBGPalettesFromRom], a                                ; $5839

	ld   b, BANK(Palettes_AllBlack)                                 ; $583c
	ld   hl, Palettes_AllBlack                                      ; $583e
	call SetOBJPaletteSrc                                           ; $5841
	xor  a                                                          ; $5844
	ld   [wPaletteFadeAmount], a                                    ; $5845
	ld   [wLoadPalettesFromRam], a                                  ; $5848
	ld   a, $01                                                     ; $584b
	ld   [wLoadOBJPalettesFromRom], a                               ; $584d

	call ProcessScriptsFromCurrLoc                                  ; $5850
	SCR_ResumeNextFrame

; Load tile data
	SCR_ExecAsmBelow
	ld   bc, LARGE_SCREEN_LINKED_TRAINS_1                           ; $5855
	call TransferTileDataForWideScreen                              ; $5858
	ld   bc, LARGE_SCREEN_LINKED_TRAINS_2                           ; $585b
	call TransferTileDataForWideScreen                              ; $585e
	ld   bc, LARGE_SCREEN_LINKED_TRAINS_3                           ; $5861
	call TransferTileDataForWideScreen                              ; $5864
	ld   bc, LARGE_SCREEN_LINKED_TRAINS_4                           ; $5867
	call TransferTileDataForWideScreen                              ; $586a

	ldh  a, [rSVBK]                                                 ; $586d
	and  $03                                                        ; $586f
	push af                                                         ; $5871

; Load tile map and attr into ram buffer except bottom 2 rows
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $5872
	ldh  [rSVBK], a                                                 ; $5874
	ld   de, wIntroCutsceneTileMapBuffer                            ; $5876
	ldbc SCREEN_TILE_HEIGHT, $19                                    ; $5879
	ld   hl, TileMap_LinkedTrainsTop                                ; $587c
	ld   a, BANK(TileMap_LinkedTrainsTop)                           ; $587f
	call FarRectCopy                                                ; $5881

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $5884
	ld   a, $01                                                     ; $5887
	ldh  [rVBK], a                                                  ; $5889
	ldbc SCREEN_TILE_HEIGHT, $19                                    ; $588b
	ld   a, BANK(TileAttr_LinkedTrainsTop)                          ; $588e
	call FarRectCopy                                                ; $5890

	pop  af                                                         ; $5893
	ldh  [rSVBK], a                                                 ; $5894

; Have those rows loaded into 1st large part of screen 0
	ld   a, $01                                                     ; $5896
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $5898
	call ProcessScriptsFromCurrLoc                                  ; $589b
	SCR_ResumeNextFrame

	SCR_ExecAsmBelow
	ldh  a, [rSVBK]                                                 ; $58a0
	and  $03                                                        ; $58a2
	push af                                                         ; $58a4

; Load tile map and attr's last 2 rows into ram buffer
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $58a5
	ldh  [rSVBK], a                                                 ; $58a7
	ld   de, wIntroCutsceneTileMapBuffer                            ; $58a9
	ldbc $02, $19                                                   ; $58ac
	ld   hl, TileMap_LinkedTrainsBottom                             ; $58af
	ld   a, BANK(TileMap_LinkedTrainsBottom)                        ; $58b2
	call FarRectCopy                                                ; $58b4

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $58b7
	ld   a, $01                                                     ; $58ba
	ldh  [rVBK], a                                                  ; $58bc
	ldbc $02, $19                                                   ; $58be
	ld   a, BANK(TileAttr_LinkedTrainsBottom)                       ; $58c1
	call FarRectCopy                                                ; $58c3

	pop  af                                                         ; $58c6
	ldh  [rSVBK], a                                                 ; $58c7

; Have 2 rows loaded into the rest of screen 0
	ld   a, $02                                                     ; $58c9
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $58cb

; Set BG and OBJ palettes - no fade
	ld   b, BANK(Palettes_LinkedTrains)                             ; $58ce
	ld   hl, Palettes_LinkedTrains                                  ; $58d0
	call SetBGPaletteSrc                                            ; $58d3
	xor  a                                                          ; $58d6
	ld   [wPaletteFadeAmount], a                                    ; $58d7
	ld   [wLoadPalettesFromRam], a                                  ; $58da
	ld   a, $01                                                     ; $58dd
	ld   [wLoadBGPalettesFromRom], a                                ; $58df
	
	ld   b, BANK(Palettes_LinkedTrains)                             ; $58e2
	ld   hl, Palettes_LinkedTrains                                  ; $58e4
	call SetOBJPaletteSrc                                           ; $58e7
	xor  a                                                          ; $58ea
	ld   [wPaletteFadeAmount], a                                    ; $58eb
	ld   [wLoadPalettesFromRam], a                                  ; $58ee
	ld   a, $01                                                     ; $58f1
	ld   [wLoadOBJPalettesFromRom], a                               ; $58f3

; Turn on LCD
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $58f6
	ldh  [rLCDC], a                                                 ; $58f8
	call ProcessScriptsFromCurrLoc                                  ; $58fa
	SCR_StartSubScript1 Script_FadeOutQuicklyToBlackAfterADelay

; Pan diagonally down-right with a preference to right
	SCR_SetCounter1 $08
:	SCR_ResumeNextFrame
	SCR_ValInAddrPlusEquByte wSCX, $01
	SCR_ResumeNextFrame
	SCR_ValInAddrPlusEquByte wSCX, $01
	SCR_ValInAddrPlusEquByte wSCY, $01
	SCR_ResumeNextFrame
	SCR_ValInAddrPlusEquByte wSCX, $01
	SCR_ResumeNextFrame
	SCR_ValInAddrPlusEquByte wSCX, $01
	SCR_ResumeNextFrame
	SCR_ValInAddrPlusEquByte wSCX, $01
	SCR_ValInAddrPlusEquByte wSCY, $01
	SCR_DecCounter1_JNE :-
	
	SCR_Delay $0a
	SCR_StopSubScript1

; --
; -- 5th small rect train
; --
; Set up, screen 1 overridden, so load it
	SCR_Call Script_SetUpSmallRectOamAnimType_WithScrn1
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, SMALL_RECT_TRAIN_5_START
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
	SCR_Delay $02

; Set palettes fading in from black
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_SmallRect5thTrain)                        ; $5937
	ld   hl, Palettes_SmallRect5thTrain                             ; $5939
	call SetBGPaletteSrc                                            ; $593c
	ld   a, $20                                                     ; $593f
	ld   [wPaletteFadeAmount], a                                    ; $5941
	ld   a, $01                                                     ; $5944
	ld   [wLoadPalettesFromRam], a                                  ; $5946

	ld   b, BANK(Palettes_SmallRect5thTrain)                        ; $5949
	ld   hl, Palettes_SmallRect5thTrain                             ; $594b
	call SetOBJPaletteSrc                                           ; $594e
	ld   a, $20                                                     ; $5951
	ld   [wPaletteFadeAmount], a                                    ; $5953
	ld   a, $01                                                     ; $5956
	ld   [wLoadPalettesFromRam], a                                  ; $5958

; Animate
	call ProcessScriptsFromCurrLoc                                  ; $595b
	SCR_StartSubScript1 Script_FadeInQuicklyFromBlack
DEF CURR_SMALL_RECT_IDX = SMALL_RECT_TRAIN_5_START+1
rept SMALL_RECT_TRAIN_5_END-(SMALL_RECT_TRAIN_5_START+1)+1
	SCR_Delay $04
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, CURR_SMALL_RECT_IDX
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
CURR_SMALL_RECT_IDX = CURR_SMALL_RECT_IDX + 1
endr

; Fade out and hide sprites
	SCR_Delay $04
	SCR_StopSubScript1
	SCR_UnsetSpriteSrc

; --
; -- 2nd credits screen
; --
; Set all palettes to black
	SCR_Call Script_SetUpIntroCreditsScreen
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_AllBlack)                                 ; $59bb
	ld   hl, Palettes_AllBlack                                      ; $59bd
	call SetBGPaletteSrc                                            ; $59c0
	xor  a                                                          ; $59c3
	ld   [wPaletteFadeAmount], a                                    ; $59c4
	ld   [wLoadPalettesFromRam], a                                  ; $59c7
	ld   a, $01                                                     ; $59ca
	ld   [wLoadBGPalettesFromRom], a                                ; $59cc

	ld   b, BANK(Palettes_AllBlack)                                 ; $59cf
	ld   hl, Palettes_AllBlack                                      ; $59d1
	call SetOBJPaletteSrc                                           ; $59d4
	xor  a                                                          ; $59d7
	ld   [wPaletteFadeAmount], a                                    ; $59d8
	ld   [wLoadPalettesFromRam], a                                  ; $59db
	ld   a, $01                                                     ; $59de
	ld   [wLoadOBJPalettesFromRom], a                               ; $59e0

; Load tile data
	call ProcessScriptsFromCurrLoc                                  ; $59e3
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   bc, WIDE_SCREEN_2ND_CREDITS_1                              ; $59e8
	call TransferTileDataForWideScreen                              ; $59eb
	ld   bc, WIDE_SCREEN_2ND_CREDITS_2                              ; $59ee
	call TransferTileDataForWideScreen                              ; $59f1
	ld   bc, WIDE_SCREEN_2ND_CREDITS_3                              ; $59f4
	call TransferTileDataForWideScreen                              ; $59f7
	ld   bc, WIDE_SCREEN_2ND_CREDITS_4                              ; $59fa
	call TransferTileDataForWideScreen                              ; $59fd
	ld   bc, WIDE_SCREEN_2ND_CREDITS_5                              ; $5a00
	call TransferTileDataForWideScreen                              ; $5a03

	ldh  a, [rSVBK]                                                 ; $5a06
	and  $03                                                        ; $5a08
	push af                                                         ; $5a0a

; Load tile map and attrs to ram buffer
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $5a0b
	ldh  [rSVBK], a                                                 ; $5a0d

	ld   de, wIntroCutsceneTileMapBuffer                            ; $5a0f
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $5a12
	ld   hl, TileMap_IntroCreditsScreen                             ; $5a15
	ld   a, BANK(TileMap_IntroCreditsScreen)                        ; $5a18
	call FarRectCopy                                                ; $5a1a

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $5a1d
	ld   a, $01                                                     ; $5a20
	ldh  [rVBK], a                                                  ; $5a22
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $5a24
	ld   a, BANK(TileAttr_IntroCreditsScreen)                       ; $5a27
	call FarRectCopy                                                ; $5a29

	pop  af                                                         ; $5a2c
	ldh  [rSVBK], a                                                 ; $5a2d

; Set BG and OBJ palettes faded out, fading in later
	ld   b, BANK(Palettes_IntroCutscene2ndCreditsScreen)            ; $5a2f
	ld   hl, Palettes_IntroCutscene2ndCreditsScreen                 ; $5a31
	call SetBGPaletteSrc                                            ; $5a34
	ld   a, $20                                                     ; $5a37
	ld   [wPaletteFadeAmount], a                                    ; $5a39
	ld   a, $01                                                     ; $5a3c
	ld   [wLoadPalettesFromRam], a                                  ; $5a3e

	ld   b, BANK(Palettes_IntroCutscene2ndCreditsScreen)            ; $5a41
	ld   hl, Palettes_IntroCutscene2ndCreditsScreen                 ; $5a43
	call SetOBJPaletteSrc                                           ; $5a46
	ld   a, $20                                                     ; $5a49
	ld   [wPaletteFadeAmount], a                                    ; $5a4b
	ld   a, $01                                                     ; $5a4e
	ld   [wLoadPalettesFromRam], a                                  ; $5a50

; Turn on LCD and fade in
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $5a53
	ldh  [rLCDC], a                                                 ; $5a55
	call ProcessScriptsFromCurrLoc                                  ; $5a57
	SCR_StartSubScript1 Script_FadeInQuicklyFromBlack
	SCR_Delay $12

; Fade text areas to black (cinematic)
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $3e
	SCR_StartSubScript1 Script_FadeOutQuicklyToBlack
	SCR_Delay $0c

; Fade in top text
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $0c
	SCR_StartSubScript1 Script_FadeInSlowlyFromBlack
	SCR_Call Scrip_ShiftCreditsTopBarLeft

; Fade in bottom text
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $10
	SCR_StartSubScript1 Script_FadeInSlowlyFromBlack
	SCR_Call Scrip_ShiftCreditsBottomBarRight
	SCR_Delay $14

; Flash text on screen
	SCR_FarSetSpriteSrc SpriteOam_IntroCreditsText
	SCR_SetSpriteXY $38, $30
	SCR_Call Script_CreditsScreenFlashText
	SCR_Delay $14

; Fade out all non-black palettes
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $fd
	SCR_StartSubScript1 Script_FadeOutQuicklyToBlack
	SCR_Delay $08

; Reset palette fade bits and rSTAT
	SCR_StoreByteInAddr wBitsSetPerBGPaletteFade, $ff
	SCR_StoreByteInAddr rSTAT, $00
	SCR_UnsetSpriteSrc

; --
; -- BG animation 1
; --
; Setup layout and tile data
	SCR_Call Script_SetUpBGAnimatedScreens
	SCR_StoreByteInAddr wBGAnimatedAnimTypeIdx, BG_ANIM_1_START
	SCR_Call Script_LoadBGAnimatedAnimTypeTileDataSrc
	SCR_Delay $02

; Set palettes - to fade in from black
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_BGAnimation1)                             ; $5aae
	ld   hl, Palettes_BGAnimation1                                  ; $5ab0
	call SetBGPaletteSrc                                            ; $5ab3
	ld   a, $20                                                     ; $5ab6
	ld   [wPaletteFadeAmount], a                                    ; $5ab8
	ld   a, $01                                                     ; $5abb
	ld   [wLoadPalettesFromRam], a                                  ; $5abd

	ld   b, BANK(Palettes_BGAnimation1)                             ; $5ac0
	ld   hl, Palettes_BGAnimation1                                  ; $5ac2
	call SetOBJPaletteSrc                                           ; $5ac5
	ld   a, $20                                                     ; $5ac8
	ld   [wPaletteFadeAmount], a                                    ; $5aca
	ld   a, $01                                                     ; $5acd
	ld   [wLoadPalettesFromRam], a                                  ; $5acf

; Actual fade in
	call ProcessScriptsFromCurrLoc                                  ; $5ad2
	SCR_StartSubScript1 Script_FadeInQuicklyFromBlack
	SCR_Delay $04

; Animate
	SCR_SetCounter1 BG_ANIM_1_END-BG_ANIM_1_START+1
:	SCR_ValInAddrPlusEquByte wBGAnimatedAnimTypeIdx, $01
	SCR_Call Script_LoadBGAnimatedAnimTypeTileDataSrc
	SCR_Delay $04
	SCR_DecCounter1_JNE :-

; --
; -- BG animation 2
; --
; Set palettes - no fade
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_BGAnimation2)                             ; $5aea
	ld   hl, Palettes_BGAnimation2                                  ; $5aec
	call SetBGPaletteSrc                                            ; $5aef
	xor  a                                                          ; $5af2
	ld   [wPaletteFadeAmount], a                                    ; $5af3
	ld   [wLoadPalettesFromRam], a                                  ; $5af6
	ld   a, $01                                                     ; $5af9
	ld   [wLoadBGPalettesFromRom], a                                ; $5afb

	ld   b, BANK(Palettes_BGAnimation2)                             ; $5afe
	ld   hl, Palettes_BGAnimation2                                  ; $5b00
	call SetOBJPaletteSrc                                           ; $5b03
	xor  a                                                          ; $5b06
	ld   [wPaletteFadeAmount], a                                    ; $5b07
	ld   [wLoadPalettesFromRam], a                                  ; $5b0a
	ld   a, $01                                                     ; $5b0d
	ld   [wLoadOBJPalettesFromRom], a                               ; $5b0f

; Animate
	call ProcessScriptsFromCurrLoc                                  ; $5b12
	SCR_SetCounter1 BG_ANIM_2_END-BG_ANIM_2_START+1
:	SCR_ValInAddrPlusEquByte wBGAnimatedAnimTypeIdx, $01
	SCR_Call Script_LoadBGAnimatedAnimTypeTileDataSrc
	SCR_Delay $04
	SCR_DecCounter1_JNE :-

; --
; -- BG animation 3
; --
; Set palettes - no fade
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_BGAnimation3)                             ; $5b24
	ld   hl, Palettes_BGAnimation3                                  ; $5b26
	call SetBGPaletteSrc                                            ; $5b29
	xor  a                                                          ; $5b2c
	ld   [wPaletteFadeAmount], a                                    ; $5b2d
	ld   [wLoadPalettesFromRam], a                                  ; $5b30
	ld   a, $01                                                     ; $5b33
	ld   [wLoadBGPalettesFromRom], a                                ; $5b35

	ld   b, BANK(Palettes_BGAnimation3)                             ; $5b38
	ld   hl, Palettes_BGAnimation3                                  ; $5b3a
	call SetOBJPaletteSrc                                           ; $5b3d
	xor  a                                                          ; $5b40
	ld   [wPaletteFadeAmount], a                                    ; $5b41
	ld   [wLoadPalettesFromRam], a                                  ; $5b44
	ld   a, $01                                                     ; $5b47
	ld   [wLoadOBJPalettesFromRom], a                               ; $5b49

; Animate
	call ProcessScriptsFromCurrLoc                                  ; $5b4c
	SCR_SetCounter1 BG_ANIM_3_END-BG_ANIM_3_START+1
:	SCR_ValInAddrPlusEquByte wBGAnimatedAnimTypeIdx, $01
	SCR_Call Script_LoadBGAnimatedAnimTypeTileDataSrc
	SCR_Delay $04
	SCR_DecCounter1_JNE :-

	SCR_StoreByteInAddr wBGAnimatedAnimTypeIdx, $00
	SCR_Delay $08

; --
; -- 6th small rect train
; --
; Set up, screen 1 overridden, so load it
	SCR_Call Script_SetUpSmallRectOamAnimType_WithScrn1
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, SMALL_RECT_TRAIN_6_START
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
	SCR_Delay $02

; Set palettes fading in from black
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_SmallRect6thTrain)                        ; $5b70
	ld   hl, Palettes_SmallRect6thTrain                             ; $5b72
	call SetBGPaletteSrc                                            ; $5b75
	ld   a, $20                                                     ; $5b78
	ld   [wPaletteFadeAmount], a                                    ; $5b7a
	ld   a, $01                                                     ; $5b7d
	ld   [wLoadPalettesFromRam], a                                  ; $5b7f

	ld   b, BANK(Palettes_SmallRect6thTrain)                        ; $5b82
	ld   hl, Palettes_SmallRect6thTrain                             ; $5b84
	call SetOBJPaletteSrc                                           ; $5b87
	ld   a, $20                                                     ; $5b8a
	ld   [wPaletteFadeAmount], a                                    ; $5b8c
	ld   a, $01                                                     ; $5b8f
	ld   [wLoadPalettesFromRam], a                                  ; $5b91

; Animate - skipping idx $3a
	call ProcessScriptsFromCurrLoc                                  ; $5b94
	SCR_StartSubScript1 Script_FadeInQuicklyFromBlack
	SCR_Delay $08
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, $38
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
	SCR_Delay $08
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, $39
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
	SCR_Delay $08
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, SMALL_RECT_TRAIN_6_END
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
	SCR_Delay $02
	
; --
; -- 7th small rect train
; --
; Set palettes - no fade
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_SmallRect7thTrain)                        ; $5bb9
	ld   hl, Palettes_SmallRect7thTrain                             ; $5bbb
	call SetBGPaletteSrc                                            ; $5bbe
	xor  a                                                          ; $5bc1
	ld   [wPaletteFadeAmount], a                                    ; $5bc2
	ld   [wLoadPalettesFromRam], a                                  ; $5bc5
	ld   a, $01                                                     ; $5bc8
	ld   [wLoadBGPalettesFromRom], a                                ; $5bca

	ld   b, BANK(Palettes_SmallRect7thTrain)                        ; $5bcd
	ld   hl, Palettes_SmallRect7thTrain                             ; $5bcf
	call SetOBJPaletteSrc                                           ; $5bd2
	xor  a                                                          ; $5bd5
	ld   [wPaletteFadeAmount], a                                    ; $5bd6
	ld   [wLoadPalettesFromRam], a                                  ; $5bd9
	ld   a, $01                                                     ; $5bdc
	ld   [wLoadOBJPalettesFromRom], a                               ; $5bde

; Animate
	call ProcessScriptsFromCurrLoc                                  ; $5be1
DEF CURR_SMALL_RECT_IDX = SMALL_RECT_TRAIN_7_START
rept SMALL_RECT_TRAIN_7_END-SMALL_RECT_TRAIN_7_START+1
	SCR_Delay $08
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, CURR_SMALL_RECT_IDX
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
CURR_SMALL_RECT_IDX = CURR_SMALL_RECT_IDX + 1
endr
	SCR_Delay $02

; --
; -- 8th small rect train
; --
; Set palettes - no fade
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_SmallRect8thTrain)                        ; $5c1d
	ld   hl, Palettes_SmallRect8thTrain                             ; $5c1f
	call SetBGPaletteSrc                                            ; $5c22
	xor  a                                                          ; $5c25
	ld   [wPaletteFadeAmount], a                                    ; $5c26
	ld   [wLoadPalettesFromRam], a                                  ; $5c29
	ld   a, $01                                                     ; $5c2c
	ld   [wLoadBGPalettesFromRom], a                                ; $5c2e

	ld   b, BANK(Palettes_SmallRect8thTrain)                        ; $5c31
	ld   hl, Palettes_SmallRect8thTrain                             ; $5c33
	call SetOBJPaletteSrc                                           ; $5c36
	xor  a                                                          ; $5c39
	ld   [wPaletteFadeAmount], a                                    ; $5c3a
	ld   [wLoadPalettesFromRam], a                                  ; $5c3d
	ld   a, $01                                                     ; $5c40
	ld   [wLoadOBJPalettesFromRom], a                               ; $5c42

; Animate
	call ProcessScriptsFromCurrLoc                                  ; $5c45
DEF CURR_SMALL_RECT_IDX = SMALL_RECT_TRAIN_8_START
rept SMALL_RECT_TRAIN_8_END-SMALL_RECT_TRAIN_8_START+1
	SCR_Delay $08
	SCR_StoreByteInAddr wSmallRectOamAnimTypeIdx, CURR_SMALL_RECT_IDX
	SCR_Call Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc
CURR_SMALL_RECT_IDX = CURR_SMALL_RECT_IDX + 1
endr

; Fade out and stop fade in subscript
	SCR_StartSubScript1 Script_FadeOutQuicklyToBlack
	SCR_Delay $08
	SCR_StopSubScript1
	SCR_UnsetSpriteSrc

; --
; -- Setup for hi-col
; --
; Load black BG palettes - no fade
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_AllBlack)                                 ; $5c90
	ld   hl, Palettes_AllBlack                                      ; $5c92
	call SetBGPaletteSrc                                            ; $5c95
	xor  a                                                          ; $5c98
	ld   [wPaletteFadeAmount], a                                    ; $5c99
	ld   [wLoadPalettesFromRam], a                                  ; $5c9c
	ld   a, $01                                                     ; $5c9f
	ld   [wLoadBGPalettesFromRom], a                                ; $5ca1

	ld   b, BANK(Palettes_AllBlack)                                 ; $5ca4
	ld   hl, Palettes_AllBlack                                      ; $5ca6
	call SetOBJPaletteSrc                                           ; $5ca9
	xor  a                                                          ; $5cac
	ld   [wPaletteFadeAmount], a                                    ; $5cad
	ld   [wLoadPalettesFromRam], a                                  ; $5cb0
	ld   a, $01                                                     ; $5cb3
	ld   [wLoadOBJPalettesFromRom], a                               ; $5cb5

; Re-clear hi-col vars and sprite
	xor  a                                                          ; $5cb8
	ld   [wCutsceneHiColFrameStep], a                               ; $5cb9
	call ProcessScriptsFromCurrLoc                                  ; $5cbc
	SCR_ResumeNextFrame
	SCR_StoreByteInAddr wIntroCutsceneAnimationEngineType, ANIM_ENGINE_NONE
	SCR_UnsetSpriteSrc

; Preserve curr wram bank
	SCR_ExecAsmBelow
	ldh  a, [rSVBK]                                                 ; $5cc6
	and  $03                                                        ; $5cc8
	push af                                                         ; $5cca

; Store normal screen 0 layouts shifted down 1 row, into wram bank 2
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $5ccb
	ldh  [rSVBK], a                                                 ; $5ccd

	ld   de, wIntroCutsceneTileMapBuffer                            ; $5ccf
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $5cd2
	ld   hl, TileMapScrn0_IntroCutsceneShiftedDown                  ; $5cd5
	ld   a, BANK(TileMapScrn0_IntroCutsceneShiftedDown)             ; $5cd8
	call FarRectCopy                                                ; $5cda

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $5cdd
	ld   a, $01                                                     ; $5ce0
	ldh  [rVBK], a                                                  ; $5ce2
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $5ce4
	ld   a, BANK(TileAttrScrn0_IntroCutsceneShiftedDown)            ; $5ce7
	call FarRectCopy                                                ; $5ce9

	pop  af                                                         ; $5cec
	ldh  [rSVBK], a                                                 ; $5ced

; Load tile map and attrs to screen 0
	ld   a, $01                                                     ; $5cef
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $5cf1
	call ProcessScriptsFromCurrLoc                                  ; $5cf4

	SCR_ResumeNextFrame
	SCR_ExecAsmBelow

; Preserve curr wram bank
	ldh  a, [rSVBK]                                                 ; $5cf9
	and  $03                                                        ; $5cfb
	push af                                                         ; $5cfd

; Store normal screen 1 layouts shifted down 1 row, into wram bank 2
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $5cfe
	ldh  [rSVBK], a                                                 ; $5d00

	ld   de, wIntroCutsceneTileMapBuffer                            ; $5d02
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $5d05
	ld   hl, TileMapScrn1_IntroCutsceneShiftedDown                  ; $5d08
	ld   a, BANK(TileMapScrn1_IntroCutsceneShiftedDown)             ; $5d0b
	call FarRectCopy                                                ; $5d0d

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $5d10
	ld   a, $01                                                     ; $5d13
	ldh  [rVBK], a                                                  ; $5d15
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $5d17
	ld   a, BANK(TileAttrScrn1_IntroCutsceneShiftedDown)            ; $5d1a
	call FarRectCopy                                                ; $5d1c

	pop  af                                                         ; $5d1f
	ldh  [rSVBK], a                                                 ; $5d20

; Load tile map and attrs to screen 1
	ld   a, $02                                                     ; $5d22
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $5d24
	call ProcessScriptsFromCurrLoc                                  ; $5d27
	SCR_ResumeNextFrame

; --
; -- Anime girl
; --
	SCR_Call Script_SetHiColAsAnimEngine
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $5d2f
	ld   [wCutsceneHiColIdx], a                                     ; $5d31
	call LoadBGPaletteSrcForHiColScreen                             ; $5d34
	call ProcessScriptsFromCurrLoc                                  ; $5d37
DEF CURR_HI_COL_IDX = $03
rept $28-3
	SCR_StoreByteInAddr wCutsceneHiColIdxToLoad, CURR_HI_COL_IDX
	SCR_Delay $08
CURR_HI_COL_IDX = CURR_HI_COL_IDX + 1
endr

	SCR_StoreByteInAddr wCutsceneHiColIdxToLoad, $28
	SCR_Delay $3c
	SCR_StoreByteInAddr wCutsceneHiColIdxToLoad, $00
	SCR_Delay $1e

; --
; -- End
; --
; Load black BG palettes - no fade
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_AllBlack)                                 ; $5e25
	ld   hl, Palettes_AllBlack                                      ; $5e27
	call SetBGPaletteSrc                                            ; $5e2a
	xor  a                                                          ; $5e2d
	ld   [wPaletteFadeAmount], a                                    ; $5e2e
	ld   [wLoadPalettesFromRam], a                                  ; $5e31
	ld   a, $01                                                     ; $5e34
	ld   [wLoadBGPalettesFromRom], a                                ; $5e36

; Load black OBJ palettes - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $5e39
	ld   hl, Palettes_AllBlack                                      ; $5e3b
	call SetOBJPaletteSrc                                           ; $5e3e
	xor  a                                                          ; $5e41
	ld   [wPaletteFadeAmount], a                                    ; $5e42
	ld   [wLoadPalettesFromRam], a                                  ; $5e45
	ld   a, $01                                                     ; $5e48
	ld   [wLoadOBJPalettesFromRom], a                               ; $5e4a

; Clear palette updates and anim engine type, then jump to the end
	ld   a, $00                                                     ; $5e4d
	ld   [wShouldUpdateHiColBGPalettes], a                          ; $5e4f
	ld   a, ANIM_ENGINE_NONE                                        ; $5e52
	ld   [wIntroCutsceneAnimationEngineType], a                     ; $5e54
	call ProcessScriptsFromCurrLoc                                  ; $5e57
	SCR_Jump Script_IntroCutsceneEnd


Script_FadeOutQuicklyToBlackAfterADelay:
	SCR_Delay $28 
	
	
Script_FadeOutQuicklyToBlack:
	SCR_StoreByteInAddr wLoadPalettesFromRam, $01

	SCR_ExecAsmBelow
	ld   a, $08                                                     ; $5e64
	ld   [wPaletteFadeAmount], a                                    ; $5e66
	ld   a, $01                                                     ; $5e69
	ld   [wLoadPalettesFromRam], a                                  ; $5e6b
	call ProcessScriptsFromCurrLoc                                  ; $5e6e
	SCR_Delay $02

	SCR_ExecAsmBelow
	ld   a, $10                                                     ; $5e74
	ld   [wPaletteFadeAmount], a                                    ; $5e76
	ld   a, $01                                                     ; $5e79
	ld   [wLoadPalettesFromRam], a                                  ; $5e7b
	call ProcessScriptsFromCurrLoc                                  ; $5e7e
	SCR_Delay $02

	SCR_ExecAsmBelow
	ld   a, $18                                                     ; $5e84
	ld   [wPaletteFadeAmount], a                                    ; $5e86
	ld   a, $01                                                     ; $5e89
	ld   [wLoadPalettesFromRam], a                                  ; $5e8b
	call ProcessScriptsFromCurrLoc                                  ; $5e8e
	SCR_Delay $02

	SCR_ExecAsmBelow
	ld   a, $20                                                     ; $5e94
	ld   [wPaletteFadeAmount], a                                    ; $5e96
	ld   a, $01                                                     ; $5e99
	ld   [wLoadPalettesFromRam], a                                  ; $5e9b
	call ProcessScriptsFromCurrLoc                                  ; $5e9e
	SCR_Delay $02

	SCR_StopSubScript1
	SCR_ResumeNextFrame
	

Script_FadeInQuicklyFromBlack:
	SCR_ExecAsmBelow
	ld   a, $18                                                     ; $5ea6
	ld   [wPaletteFadeAmount], a                                    ; $5ea8
	ld   a, $01                                                     ; $5eab
	ld   [wLoadPalettesFromRam], a                                  ; $5ead
	call ProcessScriptsFromCurrLoc                                  ; $5eb0
	SCR_Delay $02
	
	SCR_ExecAsmBelow
	ld   a, $10                                                     ; $5eb6
	ld   [wPaletteFadeAmount], a                                    ; $5eb8
	ld   a, $01                                                     ; $5ebb
	ld   [wLoadPalettesFromRam], a                                  ; $5ebd
	call ProcessScriptsFromCurrLoc                                  ; $5ec0
	SCR_Delay $02

	SCR_ExecAsmBelow
	ld   a, $08                                                     ; $5ec6
	ld   [wPaletteFadeAmount], a                                    ; $5ec8
	ld   a, $01                                                     ; $5ecb
	ld   [wLoadPalettesFromRam], a                                  ; $5ecd
	call ProcessScriptsFromCurrLoc                                  ; $5ed0
	SCR_Delay $02

	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $5ed6
	ld   [wPaletteFadeAmount], a                                    ; $5ed8
	ld   a, $01                                                     ; $5edb
	ld   [wLoadPalettesFromRam], a                                  ; $5edd
	call ProcessScriptsFromCurrLoc                                  ; $5ee0
	SCR_Delay $02

	SCR_StoreByteInAddr wLoadPalettesFromRam, $00
	SCR_StopSubScript1
	SCR_ResumeNextFrame


Script_FadeInSlowlyFromBlack:
	SCR_ExecAsmBelow
	ld   a, $20                                                     ; $5eec
	ld   [wPaletteFadeAmount], a                                    ; $5eee
	ld   a, $01                                                     ; $5ef1
	ld   [wLoadPalettesFromRam], a                                  ; $5ef3
	call ProcessScriptsFromCurrLoc                                  ; $5ef6
	SCR_Delay $0a
	
	SCR_ExecAsmBelow
	ld   a, $1c                                                     ; $5efc
	ld   [wPaletteFadeAmount], a                                    ; $5efe
	ld   a, $01                                                     ; $5f01
	ld   [wLoadPalettesFromRam], a                                  ; $5f03
	call ProcessScriptsFromCurrLoc                                  ; $5f06
	SCR_ResumeNextFrame

	SCR_ExecAsmBelow
	ld   a, $18                                                     ; $5f0b
	ld   [wPaletteFadeAmount], a                                    ; $5f0d
	ld   a, $01                                                     ; $5f10
	ld   [wLoadPalettesFromRam], a                                  ; $5f12
	call ProcessScriptsFromCurrLoc                                  ; $5f15
	SCR_ResumeNextFrame
	
	SCR_ExecAsmBelow
	ld   a, $14                                                     ; $5f1a
	ld   [wPaletteFadeAmount], a                                    ; $5f1c
	ld   a, $01                                                     ; $5f1f
	ld   [wLoadPalettesFromRam], a                                  ; $5f21
	call ProcessScriptsFromCurrLoc                                  ; $5f24
	SCR_ResumeNextFrame

	SCR_ExecAsmBelow
	ld   a, $10                                                     ; $5f29
	ld   [wPaletteFadeAmount], a                                    ; $5f2b
	ld   a, $01                                                     ; $5f2e
	ld   [wLoadPalettesFromRam], a                                  ; $5f30
	call ProcessScriptsFromCurrLoc                                  ; $5f33
	SCR_ResumeNextFrame

	SCR_ExecAsmBelow
	ld   a, $0c                                                     ; $5f38
	ld   [wPaletteFadeAmount], a                                    ; $5f3a
	ld   a, $01                                                     ; $5f3d
	ld   [wLoadPalettesFromRam], a                                  ; $5f3f
	call ProcessScriptsFromCurrLoc                                  ; $5f42
	SCR_ResumeNextFrame

	SCR_ExecAsmBelow
	ld   a, $08                                                     ; $5f47
	ld   [wPaletteFadeAmount], a                                    ; $5f49
	ld   a, $01                                                     ; $5f4c
	ld   [wLoadPalettesFromRam], a                                  ; $5f4e
	call ProcessScriptsFromCurrLoc                                  ; $5f51
	SCR_ResumeNextFrame

	SCR_ExecAsmBelow
	ld   a, $04                                                     ; $5f56
	ld   [wPaletteFadeAmount], a                                    ; $5f58
	ld   a, $01                                                     ; $5f5b
	ld   [wLoadPalettesFromRam], a                                  ; $5f5d
	call ProcessScriptsFromCurrLoc                                  ; $5f60
	SCR_ResumeNextFrame

	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $5f65
	ld   [wPaletteFadeAmount], a                                    ; $5f67
	ld   a, $01                                                     ; $5f6a
	ld   [wLoadPalettesFromRam], a                                  ; $5f6c
	call ProcessScriptsFromCurrLoc                                  ; $5f6f
	SCR_Delay $02

	SCR_StoreByteInAddr wLoadPalettesFromRam, $00
	SCR_StopSubScript1
	SCR_ResumeNextFrame


IntroCutsceneHiColTileDataSources::
DEF FRAGMENT_IDX = 0
rept 8
; Black
	HiColSrc Gfx_IntroCutsceneHiCol_00, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX

; Train no lights, then lights
	HiColSrc Gfx_IntroCutsceneHiCol_01, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_02, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX

; Anime
	HiColSrc Gfx_IntroCutsceneHiCol_03, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_04, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_05, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_06, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_07, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_08, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_09, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_0a, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_0b, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_0c, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_0d, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_0e, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_0f, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_10, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_11, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_12, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_13, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_14, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_15, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_16, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_17, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_18, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_19, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_1a, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_1b, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_1c, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_1d, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_1e, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_1f, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_20, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_21, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_22, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_23, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_24, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_25, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_26, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_27, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
	HiColSrc Gfx_IntroCutsceneHiCol_28, HI_COL_TILE_DATA_FRAGMENT_SIZE*FRAGMENT_IDX
FRAGMENT_IDX = FRAGMENT_IDX + 1
endr


CutsceneHiColBGPalettesSrces:
	HiColSrc HiColPalettes_IntroCutscene_00
	HiColSrc HiColPalettes_IntroCutscene_01
	HiColSrc HiColPalettes_IntroCutscene_02
	HiColSrc HiColPalettes_IntroCutscene_03
	HiColSrc HiColPalettes_IntroCutscene_04
	HiColSrc HiColPalettes_IntroCutscene_05
	HiColSrc HiColPalettes_IntroCutscene_06
	HiColSrc HiColPalettes_IntroCutscene_07
	HiColSrc HiColPalettes_IntroCutscene_08
	HiColSrc HiColPalettes_IntroCutscene_09
	HiColSrc HiColPalettes_IntroCutscene_0a
	HiColSrc HiColPalettes_IntroCutscene_0b
	HiColSrc HiColPalettes_IntroCutscene_0c
	HiColSrc HiColPalettes_IntroCutscene_0d
	HiColSrc HiColPalettes_IntroCutscene_0e
	HiColSrc HiColPalettes_IntroCutscene_0f
	HiColSrc HiColPalettes_IntroCutscene_10
	HiColSrc HiColPalettes_IntroCutscene_11
	HiColSrc HiColPalettes_IntroCutscene_12
	HiColSrc HiColPalettes_IntroCutscene_13
	HiColSrc HiColPalettes_IntroCutscene_14
	HiColSrc HiColPalettes_IntroCutscene_15
	HiColSrc HiColPalettes_IntroCutscene_16
	HiColSrc HiColPalettes_IntroCutscene_17
	HiColSrc HiColPalettes_IntroCutscene_18
	HiColSrc HiColPalettes_IntroCutscene_19
	HiColSrc HiColPalettes_IntroCutscene_1a
	HiColSrc HiColPalettes_IntroCutscene_1b
	HiColSrc HiColPalettes_IntroCutscene_1c
	HiColSrc HiColPalettes_IntroCutscene_1d
	HiColSrc HiColPalettes_IntroCutscene_1e
	HiColSrc HiColPalettes_IntroCutscene_1f
	HiColSrc HiColPalettes_IntroCutscene_20
	HiColSrc HiColPalettes_IntroCutscene_21
	HiColSrc HiColPalettes_IntroCutscene_22
	HiColSrc HiColPalettes_IntroCutscene_23
	HiColSrc HiColPalettes_IntroCutscene_24
	HiColSrc HiColPalettes_IntroCutscene_25
	HiColSrc HiColPalettes_IntroCutscene_26
	HiColSrc HiColPalettes_IntroCutscene_27
	HiColSrc HiColPalettes_IntroCutscene_28


LoadBGPaletteSrcForHiColScreen::
; Return if already loaded tile data
	ld   a, [wCutsceneHiColIdx]                                     ; $63cd
	cp   $ff                                                        ; $63d0
	ret  z                                                          ; $63d2

; Idx * 3 into BC
	ld   b, a                                                       ; $63d3
	add  a                                                          ; $63d4
	add  b                                                          ; $63d5
	ld   c, a                                                       ; $63d6
	ld   b, $00                                                     ; $63d7

; Offset into this table gives the bank, then address
	ld   hl, CutsceneHiColBGPalettesSrces                           ; $63d9
	add  hl, bc                                                     ; $63dc
	ld   a, [hl+]                                                   ; $63dd
	ld   [wCutsceneHiColBGPaletteLowRomBank], a                     ; $63de
	ld   a, [hl+]                                                   ; $63e1
	ld   [wCutsceneHiColBGPaletteAddr], a                           ; $63e2
	ld   a, [hl+]                                                   ; $63e5
	ld   [wCutsceneHiColBGPaletteAddr+1], a                         ; $63e6
	ret                                                             ; $63e9


Script_LoadSmallRectAnimTypeBGandOBJTileDataSrc:
; Idx * 6 is offset in table
	SCR_ExecAsmBelow
	ld   a, [wSmallRectOamAnimTypeIdx]                              ; $63eb
	add  a                                                          ; $63ee
	ld   c, a                                                       ; $63ef
	ld   b, $00                                                     ; $63f0
	ld   hl, SmallRectAnimTypeTileDataSrcTable                      ; $63f2
	add  hl, bc                                                     ; $63f5
	add  hl, bc                                                     ; $63f6
	add  hl, bc                                                     ; $63f7

; 1st 3 bytes are for bank and addr src for our moving OBJ
	ld   a, [hl+]                                                   ; $63f8
	ld   [wSmallRectOamOBJTileDataBank], a                          ; $63f9
	ld   a, [hl+]                                                   ; $63fc
	ld   [wSmallRectOamOBJTileDataAddr], a                          ; $63fd
	ld   a, [hl+]                                                   ; $6400
	ld   [wSmallRectOamOBJTileDataAddr+1], a                        ; $6401


; Next 3 bytes are for bank and addr src for our moving BG
	ld   a, [hl+]                                                   ; $6404
	ld   [wSmallRectOamBGTileDataBank], a                           ; $6405
	ld   a, [hl+]                                                   ; $6408
	ld   [wSmallRectOamBGTileDataAddr], a                           ; $6409
	ld   a, [hl+]                                                   ; $640c
	ld   [wSmallRectOamBGTileDataAddr+1], a                         ; $640d

; Step 0 means load OBJ, then BG
	ld   a, $00                                                     ; $6410
	ld   [wIntroCutsceneDataLoadStep], a                            ; $6412
	call ProcessScriptsFromCurrLoc                                  ; $6415
	SCR_Ret
	
	
Script_LoadBGAnimatedAnimTypeTileDataSrc:
; Idx * 6 is offset in table
	SCR_ExecAsmBelow
	ld   a, [wBGAnimatedAnimTypeIdx]                                ; $641a
	ld   c, a                                                       ; $641d
	ld   b, $00                                                     ; $641e
	ld   hl, BGAnimatedAnimTypeTileDataSrcTable                     ; $6420
	add  hl, bc                                                     ; $6423
	add  hl, bc                                                     ; $6424
	add  hl, bc                                                     ; $6425

; 3 bytes are for bank and addr src for our entire BG screen
	ld   a, [hl+]                                                   ; $6426
	ld   [wBGAnimatedTileDataBank], a                               ; $6427
	ld   a, [hl+]                                                   ; $642a
	ld   [wBGAnimatedTileDataAddr], a                               ; $642b
	ld   a, [hl+]                                                   ; $642e
	ld   [wBGAnimatedTileDataAddr+1], a                             ; $642f

; Start with step 0 (start loading 1st of 3 fragments to load)
	ld   a, $00                                                     ; $6432
	ld   [wIntroCutsceneDataLoadStep], a                            ; $6434
	call ProcessScriptsFromCurrLoc                                  ; $6437
	SCR_Ret
	
	
Script_SetUpIntroCreditsScreen:
	SCR_StoreByteInAddr wIntroCutsceneAnimationEngineType, ANIM_ENGINE_CREDITS
	SCR_ExecAsmBelow

; Reset scroll x for top and bottom text
	xor  a                                                          ; $6440
	ld   [wCreditsScreenTopSCX], a                                  ; $6441
	ld   [wCreditsScreenBottomSCX], a                               ; $6444

; Set up LCDC func
	di                                                              ; $6447
	ld   a, LOW(LCDCInterruptFunc_CreditsScreen)                    ; $6448
	ld   [wLCDCInterruptFunc], a                                    ; $644a
	ld   a, HIGH(LCDCInterruptFunc_CreditsScreen)                   ; $644d
	ld   [wLCDCInterruptFunc+1], a                                  ; $644f

; To trigger at a certain LY
	ld   a, STATF_LYC                                               ; $6452
	ldh  [rSTAT], a                                                 ; $6454

	ei                                                              ; $6456
	call ProcessScriptsFromCurrLoc                                  ; $6457
	SCR_Ret
	
	
Script_SetHiColAsAnimEngine:
	SCR_StoreByteInAddr wIntroCutsceneAnimationEngineType, ANIM_ENGINE_HI_COL
	SCR_StoreByteInAddr wSCY, $02
	SCR_StoreByteInAddr wCutsceneHiColFrameStep, $00
	SCR_Ret


Script_SetUpSmallRectOamAnimType_NoScrn1:
	SCR_StoreByteInAddr wIntroCutsceneAnimationEngineType, ANIM_ENGINE_SMALL_RECT_OAM
	SCR_StoreByteInAddr wShouldUpdateHiColBGPalettes, $00

; No scroll
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $6471
	ld   [wSCX], a                                                  ; $6473
	ld   a, $00                                                     ; $6476
	ld   [wSCY], a                                                  ; $6478

; Default BG palettes to all black - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $647b
	ld   hl, Palettes_AllBlack                                      ; $647d
	call SetBGPaletteSrc                                            ; $6480
	xor  a                                                          ; $6483
	ld   [wPaletteFadeAmount], a                                    ; $6484
	ld   [wLoadPalettesFromRam], a                                  ; $6487
	ld   a, $01                                                     ; $648a
	ld   [wLoadBGPalettesFromRom], a                                ; $648c

; Default OBJ palettes to all black - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $648f
	ld   hl, Palettes_AllBlack                                      ; $6491
	call SetOBJPaletteSrc                                           ; $6494
	xor  a                                                          ; $6497
	ld   [wPaletteFadeAmount], a                                    ; $6498
	ld   [wLoadPalettesFromRam], a                                  ; $649b
	ld   a, $01                                                     ; $649e
	ld   [wLoadOBJPalettesFromRom], a                               ; $64a0

; Script's oam covers entire center grid
	call ProcessScriptsFromCurrLoc                                  ; $64a3
	SCR_FarSetSpriteSrc SpriteOam_AnimationType2VramBank0
	SCR_SetSpriteXY $38, $30

; Set up LCDC
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $64af
	ldh  [rLCDC], a                                                 ; $64b1
	waitForRequestedVBlank

; BG tile idx 0 is a black square in both
	ld   a, $00                                                     ; $64c0
	ldh  [rVBK], a                                                  ; $64c2
	ld   hl, _VRAM+$1000                                            ; $64c4
	ld   de, _VRAM+$100f                                            ; $64c7
	ld   b, $00                                                     ; $64ca
	inc  de                                                         ; $64cc
	call SetB_HLtoDE                                                ; $64cd

	ld   a, $01                                                     ; $64d0
	ldh  [rVBK], a                                                  ; $64d2
	ld   hl, _VRAM+$1000                                            ; $64d4
	ld   de, _VRAM+$100f                                            ; $64d7
	ld   b, $00                                                     ; $64da
	inc  de                                                         ; $64dc
	call SetB_HLtoDE                                                ; $64dd

	ldh  a, [rSVBK]                                                 ; $64e0
	and  $03                                                        ; $64e2
	push af                                                         ; $64e4

; Load tile data and attrs into ram
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $64e5
	ldh  [rSVBK], a                                                 ; $64e7
	ld   de, wIntroCutsceneTileMapBuffer                            ; $64e9
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $64ec
	ld   hl, TileMapScrn0_SmallRectOam                              ; $64ef
	ld   a, BANK(TileMapScrn0_SmallRectOam)                         ; $64f2
	call FarRectCopy                                                ; $64f4

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $64f7
	ld   a, $01                                                     ; $64fa
	ldh  [rVBK], a                                                  ; $64fc
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $64fe
	ld   a, BANK(TileAttrScrn0_SmallRectOam)                        ; $6501
	call FarRectCopy                                                ; $6503

	pop  af                                                         ; $6506
	ldh  [rSVBK], a                                                 ; $6507

; Load details in screen 0
	ld   a, $01                                                     ; $6509
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $650b
	call ProcessScriptsFromCurrLoc                                  ; $650e
	SCR_ResumeNextFrame
	SCR_Ret
	
	
Script_SetUpSmallRectOamAnimType_WithScrn1:
	SCR_StoreByteInAddr wIntroCutsceneAnimationEngineType, ANIM_ENGINE_SMALL_RECT_OAM
	SCR_StoreByteInAddr wShouldUpdateHiColBGPalettes, $00

; No scroll
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $651c
	ld   [wSCX], a                                                  ; $651e
	ld   a, $00                                                     ; $6521
	ld   [wSCY], a                                                  ; $6523

; Default BG palettes to all black - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $6526
	ld   hl, Palettes_AllBlack                                      ; $6528
	call SetBGPaletteSrc                                            ; $652b
	xor  a                                                          ; $652e
	ld   [wPaletteFadeAmount], a                                    ; $652f
	ld   [wLoadPalettesFromRam], a                                  ; $6532
	ld   a, $01                                                     ; $6535
	ld   [wLoadBGPalettesFromRom], a                                ; $6537

; Default OBJ palettes to all black - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $653a
	ld   hl, Palettes_AllBlack                                      ; $653c
	call SetOBJPaletteSrc                                           ; $653f
	xor  a                                                          ; $6542
	ld   [wPaletteFadeAmount], a                                    ; $6543
	ld   [wLoadPalettesFromRam], a                                  ; $6546
	ld   a, $01                                                     ; $6549
	ld   [wLoadOBJPalettesFromRom], a                               ; $654b

; Script's oam covers entire center grid
	call ProcessScriptsFromCurrLoc                                  ; $654e
	SCR_FarSetSpriteSrc SpriteOam_AnimationType2VramBank0
	SCR_SetSpriteXY $38, $30

; Set up LCDC
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $655a
	ldh  [rLCDC], a                                                 ; $655c
	waitForRequestedVBlank

; BG tile idx 0 is a black square in both
	ld   a, $00                                                     ; $656b
	ldh  [rVBK], a                                                  ; $656d
	ld   hl, _VRAM+$1000                                            ; $656f
	ld   de, _VRAM+$100f                                            ; $6572
	ld   b, $00                                                     ; $6575
	inc  de                                                         ; $6577
	call SetB_HLtoDE                                                ; $6578

	ld   a, $01                                                     ; $657b
	ldh  [rVBK], a                                                  ; $657d
	ld   hl, _VRAM+$1000                                            ; $657f
	ld   de, _VRAM+$100f                                            ; $6582
	ld   b, $00                                                     ; $6585
	inc  de                                                         ; $6587
	call SetB_HLtoDE                                                ; $6588

	ldh  a, [rSVBK]                                                 ; $658b
	and  $03                                                        ; $658d
	push af                                                         ; $658f

; Load tile data and attrs into ram
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $6590
	ldh  [rSVBK], a                                                 ; $6592
	ld   de, wIntroCutsceneTileMapBuffer                            ; $6594
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $6597
	ld   hl, TileMapScrn0_SmallRectOam                              ; $659a
	ld   a, BANK(TileMapScrn0_SmallRectOam)                         ; $659d
	call FarRectCopy                                                ; $659f

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $65a2
	ld   a, $01                                                     ; $65a5
	ldh  [rVBK], a                                                  ; $65a7
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $65a9
	ld   a, BANK(TileAttrScrn0_SmallRectOam)                        ; $65ac
	call FarRectCopy                                                ; $65ae

	pop  af                                                         ; $65b1
	ldh  [rSVBK], a                                                 ; $65b2

; Load details in screen 0
	ld   a, $01                                                     ; $65b4
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $65b6
	call ProcessScriptsFromCurrLoc                                  ; $65b9
	SCR_ResumeNextFrame

	SCR_ExecAsmBelow
	ldh  a, [rSVBK]                                                 ; $65be
	and  $03                                                        ; $65c0
	push af                                                         ; $65c2

; Load tile data and attrs into ram
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $65c3
	ldh  [rSVBK], a                                                 ; $65c5
	ld   de, wIntroCutsceneTileMapBuffer                            ; $65c7
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $65ca
	ld   hl, TileMapScrn1_SmallRectOam                              ; $65cd
	ld   a, BANK(TileMapScrn1_SmallRectOam)                         ; $65d0
	call FarRectCopy                                                ; $65d2

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $65d5
	ld   a, $01                                                     ; $65d8
	ldh  [rVBK], a                                                  ; $65da
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $65dc
	ld   a, BANK(TileAttrScrn1_SmallRectOam)                        ; $65df
	call FarRectCopy                                                ; $65e1

	pop  af                                                         ; $65e4
	ldh  [rSVBK], a                                                 ; $65e5

; Load details in screen 1
	ld   a, $02                                                     ; $65e7
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $65e9
	call ProcessScriptsFromCurrLoc                                  ; $65ec
	SCR_ResumeNextFrame
	SCR_Ret


Script_SetUpBGAnimatedScreens:
; Init engine type
	SCR_StoreByteInAddr wIntroCutsceneAnimationEngineType, ANIM_ENGINE_SIMPLE_BG
	SCR_StoreByteInAddr wShouldUpdateHiColBGPalettes, $00

; Clear scroll
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $65fa
	ld   [wSCX], a                                                  ; $65fc
	ld   a, $00                                                     ; $65ff
	ld   [wSCY], a                                                  ; $6601

; Set BG and OBJ palettes to all black - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $6604
	ld   hl, Palettes_AllBlack                                      ; $6606
	call SetBGPaletteSrc                                            ; $6609
	xor  a                                                          ; $660c
	ld   [wPaletteFadeAmount], a                                    ; $660d
	ld   [wLoadPalettesFromRam], a                                  ; $6610
	ld   a, $01                                                     ; $6613
	ld   [wLoadBGPalettesFromRom], a                                ; $6615

	ld   b, BANK(Palettes_AllBlack)                                 ; $6618
	ld   hl, Palettes_AllBlack                                      ; $661a
	call SetOBJPaletteSrc                                           ; $661d
	xor  a                                                          ; $6620
	ld   [wPaletteFadeAmount], a                                    ; $6621
	ld   [wLoadPalettesFromRam], a                                  ; $6624
	ld   a, $01                                                     ; $6627
	ld   [wLoadOBJPalettesFromRom], a                               ; $6629

; Turn on LCD and wait until in vblank
	call ProcessScriptsFromCurrLoc                                  ; $662c
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, LCDCF_ON|LCDCF_OBJ16|LCDCF_OBJON|LCDCF_BGON             ; $6631
	ldh  [rLCDC], a                                                 ; $6633
	waitForRequestedVBlank

; Allow $10 black tiles, and cleared attrs
	ld   a, $00                                                     ; $6642
	ldh  [rVBK], a                                                  ; $6644
	ld   hl, _VRAM+$17f0                                            ; $6646
	ld   de, _VRAM+$17ff                                            ; $6649
	ld   b, $00                                                     ; $664c
	inc  de                                                         ; $664e
	call SetB_HLtoDE                                                ; $664f

	ld   a, $01                                                     ; $6652
	ldh  [rVBK], a                                                  ; $6654
	ld   hl, _VRAM+$17f0                                            ; $6656
	ld   de, _VRAM+$17ff                                            ; $6659
	ld   b, $00                                                     ; $665c
	inc  de                                                         ; $665e
	call SetB_HLtoDE                                                ; $665f

	ldh  a, [rSVBK]                                                 ; $6662
	and  $03                                                        ; $6664
	push af                                                         ; $6666

; Load base layout and attrs
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $6667
	ldh  [rSVBK], a                                                 ; $6669

	ld   de, wIntroCutsceneTileMapBuffer                            ; $666b
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $666e
	ld   hl, TileMapScrn0_BGAnimation                               ; $6671
	ld   a, BANK(TileMapScrn0_BGAnimation)                          ; $6674
	call FarRectCopy                                                ; $6676

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $6679
	ld   a, $01                                                     ; $667c
	ldh  [rVBK], a                                                  ; $667e
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $6680
	ld   a, BANK(TileAttrScrn0_BGAnimation)                         ; $6683
	call FarRectCopy                                                ; $6685

; Load above to screen 0
	pop  af                                                         ; $6688
	ldh  [rSVBK], a                                                 ; $6689
	ld   a, $01                                                     ; $668b
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $668d
	call ProcessScriptsFromCurrLoc                                  ; $6690
	SCR_ResumeNextFrame

	SCR_ExecAsmBelow
	ldh  a, [rSVBK]                                                 ; $6695
	and  $03                                                        ; $6697
	push af                                                         ; $6699

; Load tile map and attrs for double buffer
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $669a
	ldh  [rSVBK], a                                                 ; $669c

	ld   de, wIntroCutsceneTileMapBuffer                            ; $669e
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $66a1
	ld   hl, TileMapScrn1_BGAnimation                               ; $66a4
	ld   a, BANK(TileMapScrn1_BGAnimation)                          ; $66a7
	call FarRectCopy                                                ; $66a9

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $66ac
	ld   a, $01                                                     ; $66af
	ldh  [rVBK], a                                                  ; $66b1
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $66b3
	ld   a, BANK(TileAttrScrn1_BGAnimation)                         ; $66b6
	call FarRectCopy                                                ; $66b8

	pop  af                                                         ; $66bb
	ldh  [rSVBK], a                                                 ; $66bc

; Load above to screen 1
	ld   a, $02                                                     ; $66be
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $66c0
	call ProcessScriptsFromCurrLoc                                  ; $66c3
	SCR_ResumeNextFrame
	SCR_Ret
	
	
BGAnimatedAnimTypeTileDataSrcTable:
	BGAnimSrc Gfx_BGAnimation_00
	BGAnimSrc Gfx_BGAnimation_01
	BGAnimSrc Gfx_BGAnimation_02
	BGAnimSrc Gfx_BGAnimation_03
	BGAnimSrc Gfx_BGAnimation_04
	BGAnimSrc Gfx_BGAnimation_05
	BGAnimSrc Gfx_BGAnimation_06
	BGAnimSrc Gfx_BGAnimation_07
	BGAnimSrc Gfx_BGAnimation_08
	BGAnimSrc Gfx_BGAnimation_09
	BGAnimSrc Gfx_BGAnimation_0a
	BGAnimSrc Gfx_BGAnimation_0b
	BGAnimSrc Gfx_BGAnimation_0c
	BGAnimSrc Gfx_BGAnimation_0d
	BGAnimSrc Gfx_BGAnimation_0e
	BGAnimSrc Gfx_BGAnimation_0f
	BGAnimSrc Gfx_BGAnimation_10
	BGAnimSrc Gfx_BGAnimation_11
	BGAnimSrc Gfx_BGAnimation_12
	BGAnimSrc Gfx_BGAnimation_13
	BGAnimSrc Gfx_BGAnimation_14
	BGAnimSrc Gfx_BGAnimation_15
	BGAnimSrc Gfx_BGAnimation_16
	BGAnimSrc Gfx_BGAnimation_17
	BGAnimSrc Gfx_BGAnimation_18
	BGAnimSrc Gfx_BGAnimation_19
	BGAnimSrc Gfx_BGAnimation_1a
	BGAnimSrc Gfx_BGAnimation_1b
	BGAnimSrc Gfx_BGAnimation_1c
	BGAnimSrc Gfx_BGAnimation_1d
	BGAnimSrc Gfx_BGAnimation_1e
	BGAnimSrc Gfx_BGAnimation_1f
	BGAnimSrc Gfx_BGAnimation_20
	BGAnimSrc Gfx_BGAnimation_21
	BGAnimSrc Gfx_BGAnimation_22
	BGAnimSrc Gfx_BGAnimation_23
	BGAnimSrc Gfx_BGAnimation_24
	BGAnimSrc Gfx_BGAnimation_25
	BGAnimSrc Gfx_BGAnimation_26


SmallRectAnimTypeTileDataSrcTable:
; Black
	SmallRectOamSources SmallRectOamOBJ_00, SmallRectOamBG_00

; 1st train
	SmallRectOamSources SmallRectOamOBJ_01, SmallRectOamBG_01
	SmallRectOamSources SmallRectOamOBJ_02, SmallRectOamBG_02
	SmallRectOamSources SmallRectOamOBJ_03, SmallRectOamBG_03
	SmallRectOamSources SmallRectOamOBJ_04, SmallRectOamBG_04
	SmallRectOamSources SmallRectOamOBJ_05, SmallRectOamBG_05
	SmallRectOamSources SmallRectOamOBJ_06, SmallRectOamBG_06
	SmallRectOamSources SmallRectOamOBJ_07, SmallRectOamBG_07
	SmallRectOamSources SmallRectOamOBJ_08, SmallRectOamBG_08
	SmallRectOamSources SmallRectOamOBJ_09, SmallRectOamBG_09
	SmallRectOamSources SmallRectOamOBJ_0a, SmallRectOamBG_0a
	SmallRectOamSources SmallRectOamOBJ_0b, SmallRectOamBG_0b

; 2nd train
	SmallRectOamSources SmallRectOamOBJ_0c, SmallRectOamBG_0c
	SmallRectOamSources SmallRectOamOBJ_0d, SmallRectOamBG_0d
	SmallRectOamSources SmallRectOamOBJ_0e, SmallRectOamBG_0e
	SmallRectOamSources SmallRectOamOBJ_0f, SmallRectOamBG_0f
	SmallRectOamSources SmallRectOamOBJ_10, SmallRectOamBG_10
	SmallRectOamSources SmallRectOamOBJ_11, SmallRectOamBG_11
	SmallRectOamSources SmallRectOamOBJ_12, SmallRectOamBG_12
	SmallRectOamSources SmallRectOamOBJ_13, SmallRectOamBG_13
	SmallRectOamSources SmallRectOamOBJ_14, SmallRectOamBG_14
	SmallRectOamSources SmallRectOamOBJ_15, SmallRectOamBG_15

; 3rd train
	SmallRectOamSources SmallRectOamOBJ_16, SmallRectOamBG_16
	SmallRectOamSources SmallRectOamOBJ_17, SmallRectOamBG_17
	SmallRectOamSources SmallRectOamOBJ_18, SmallRectOamBG_18
	SmallRectOamSources SmallRectOamOBJ_19, SmallRectOamBG_19
	SmallRectOamSources SmallRectOamOBJ_1a, SmallRectOamBG_1a
	SmallRectOamSources SmallRectOamOBJ_1b, SmallRectOamBG_1b
	SmallRectOamSources SmallRectOamOBJ_1c, SmallRectOamBG_1c
	SmallRectOamSources SmallRectOamOBJ_1d, SmallRectOamBG_1d
	SmallRectOamSources SmallRectOamOBJ_1e, SmallRectOamBG_1e
	SmallRectOamSources SmallRectOamOBJ_1f, SmallRectOamBG_1f
	SmallRectOamSources SmallRectOamOBJ_20, SmallRectOamBG_20

; 4th train
	SmallRectOamSources SmallRectOamOBJ_21, SmallRectOamBG_21
	SmallRectOamSources SmallRectOamOBJ_22, SmallRectOamBG_22
	SmallRectOamSources SmallRectOamOBJ_23, SmallRectOamBG_23
	SmallRectOamSources SmallRectOamOBJ_24, SmallRectOamBG_24
	SmallRectOamSources SmallRectOamOBJ_25, SmallRectOamBG_25
	SmallRectOamSources SmallRectOamOBJ_26, SmallRectOamBG_26
	SmallRectOamSources SmallRectOamOBJ_27, SmallRectOamBG_27
	SmallRectOamSources SmallRectOamOBJ_28, SmallRectOamBG_28
	SmallRectOamSources SmallRectOamOBJ_29, SmallRectOamBG_29
	SmallRectOamSources SmallRectOamOBJ_2a, SmallRectOamBG_2a
	SmallRectOamSources SmallRectOamOBJ_2b, SmallRectOamBG_2b
	SmallRectOamSources SmallRectOamOBJ_2c, SmallRectOamBG_2c

; 5th train
	SmallRectOamSources SmallRectOamOBJ_2d, SmallRectOamBG_2d
	SmallRectOamSources SmallRectOamOBJ_2e, SmallRectOamBG_2e
	SmallRectOamSources SmallRectOamOBJ_2f, SmallRectOamBG_2f
	SmallRectOamSources SmallRectOamOBJ_30, SmallRectOamBG_30
	SmallRectOamSources SmallRectOamOBJ_31, SmallRectOamBG_31
	SmallRectOamSources SmallRectOamOBJ_32, SmallRectOamBG_32
	SmallRectOamSources SmallRectOamOBJ_33, SmallRectOamBG_33
	SmallRectOamSources SmallRectOamOBJ_34, SmallRectOamBG_34
	SmallRectOamSources SmallRectOamOBJ_35, SmallRectOamBG_35
	SmallRectOamSources SmallRectOamOBJ_36, SmallRectOamBG_36

; 6th train
	SmallRectOamSources SmallRectOamOBJ_37, SmallRectOamBG_37
	SmallRectOamSources SmallRectOamOBJ_38, SmallRectOamBG_38
	SmallRectOamSources SmallRectOamOBJ_39, SmallRectOamBG_39
	SmallRectOamSources SmallRectOamOBJ_3a, SmallRectOamBG_3a ; skipped
	SmallRectOamSources SmallRectOamOBJ_3b, SmallRectOamBG_3b

; 7th train
	SmallRectOamSources SmallRectOamOBJ_3c, SmallRectOamBG_3c
	SmallRectOamSources SmallRectOamOBJ_3d, SmallRectOamBG_3d
	SmallRectOamSources SmallRectOamOBJ_3e, SmallRectOamBG_3e
	SmallRectOamSources SmallRectOamOBJ_3f, SmallRectOamBG_3f
	SmallRectOamSources SmallRectOamOBJ_40, SmallRectOamBG_40
	SmallRectOamSources SmallRectOamOBJ_41, SmallRectOamBG_41

; 8th train
	SmallRectOamSources SmallRectOamOBJ_42, SmallRectOamBG_42
	SmallRectOamSources SmallRectOamOBJ_43, SmallRectOamBG_43
	SmallRectOamSources SmallRectOamOBJ_44, SmallRectOamBG_44
	SmallRectOamSources SmallRectOamOBJ_45, SmallRectOamBG_45
	SmallRectOamSources SmallRectOamOBJ_46, SmallRectOamBG_46
	SmallRectOamSources SmallRectOamOBJ_47, SmallRectOamBG_47
	SmallRectOamSources SmallRectOamOBJ_48, SmallRectOamBG_48
	
	
Scrip_ShiftCreditsTopBarLeft:
	SCR_ExecAsmBelow
	ldh  a, [rSVBK]                                                 ; $68f4
	and  $03                                                        ; $68f6
	push af                                                         ; $68f8

; Copy, for example, Komac.. tiles and attr to the top right of the screen
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $68f9
	ldh  [rSVBK], a                                                 ; $68fb
	ld   de, wIntroCutsceneTileMapBuffer+$14                        ; $68fd
	ldbc $03, $0c                                                   ; $6900
	ld   hl, TileMap_CreditsBarTextTopRight                         ; $6903
	ld   a, BANK(TileMap_CreditsBarTextTopRight)                    ; $6906
	call FarRectCopy                                                ; $6908

	ld   de, wIntroCutsceneTileAttrBuffer+$14                       ; $690b
	ld   a, $01                                                     ; $690e
	ldh  [rVBK], a                                                  ; $6910
	ldbc $03, $0c                                                   ; $6912
	ld   a, BANK(TileAttr_CreditsBarTextTopRight)                   ; $6915
	call FarRectCopy                                                ; $6917

; Shift top part of screen 8 pixels left $0c times to draw top-left
	pop  af                                                         ; $691a
	ldh  [rSVBK], a                                                 ; $691b
	call ProcessScriptsFromCurrLoc                                  ; $691d
	SCR_SetCounter2 $0c
	SCR_CallWithSingleUseRet Script_Add8ToCreditsTopSCXUsingCounter2
	
	SCR_ExecAsmBelow
	ldh  a, [rSVBK]                                                 ; $6926
	and  $03                                                        ; $6928
	push af                                                         ; $692a

; Copy, for example, ..hi tiles and attr to the top left of the screen
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $692b
	ldh  [rSVBK], a                                                 ; $692d
	ld   de, wIntroCutsceneTileMapBuffer                            ; $692f
	ldbc $03, $08                                                   ; $6932
	ld   hl, TileMap_CreditsBarTextTopLeft                          ; $6935
	ld   a, BANK(TileMap_CreditsBarTextTopLeft)                     ; $6938
	call FarRectCopy                                                ; $693a

	ld   de, wIntroCutsceneTileAttrBuffer                           ; $693d
	ld   a, $01                                                     ; $6940
	ldh  [rVBK], a                                                  ; $6942
	ldbc $03, $08                                                   ; $6944
	ld   a, BANK(TileAttr_CreditsBarTextTopLeft)                    ; $6947
	call FarRectCopy                                                ; $6949

; Shift top part of screen 8 pixels left 8 more times to reveal, eg, Komachi
	pop  af                                                         ; $694c
	ldh  [rSVBK], a                                                 ; $694d
	call ProcessScriptsFromCurrLoc                                  ; $694f
	SCR_SetCounter2 $08
	SCR_CallWithSingleUseRet Script_Add8ToCreditsTopSCXUsingCounter2
	SCR_Ret
	
	
Scrip_ShiftCreditsBottomBarRight:
	SCR_ExecAsmBelow
	ldh  a, [rSVBK]                                                 ; $6959
	and  $03                                                        ; $695b
	push af                                                         ; $695d

; Copy, for example, ..riesE3 tiles and attr to the bottom right of the screen
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $695e
	ldh  [rSVBK], a                                                 ; $6960
	ld   de, wIntroCutsceneTileMapBuffer+$1f4                       ; $6962
	ldbc $03, $0c                                                   ; $6965
	ld   hl, TileMap_CreditsBarTextBottomRight                      ; $6968
	ld   a, BANK(TileMap_CreditsBarTextBottomRight)                 ; $696b
	call FarRectCopy                                                ; $696d

	ld   de, wIntroCutsceneTileAttrBuffer+$1f4                      ; $6970
	ld   a, $01                                                     ; $6973
	ldh  [rVBK], a                                                  ; $6975
	ldbc $03, $0c                                                   ; $6977
	ld   a, BANK(TileAttr_CreditsBarTextBottomRight)                ; $697a
	call FarRectCopy                                                ; $697c

; Shift bottom part of screen 8 pixels right $0c times to draw bottom
	pop  af                                                         ; $697f
	ldh  [rSVBK], a                                                 ; $6980
	call ProcessScriptsFromCurrLoc                                  ; $6982
	SCR_SetCounter2 $0c
	SCR_CallWithSingleUseRet Script_Sub8FromCreditsBottomSCXUsingCounter2

	SCR_ExecAsmBelow
	ldh  a, [rSVBK]                                                 ; $698b
	and  $03                                                        ; $698d
	push af                                                         ; $698f

; Copy, for example, Ser.. tiles and attr to the bottom of the screen
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $6990
	ldh  [rSVBK], a                                                 ; $6992
	ld   de, wIntroCutsceneTileMapBuffer+$1ec                       ; $6994
	ldbc $03, $08                                                   ; $6997
	ld   hl, TileMap_CreditsBarTextBottom                           ; $699a
	ld   a, BANK(TileMap_CreditsBarTextBottom)                      ; $699d
	call FarRectCopy                                                ; $699f

	ld   de, wIntroCutsceneTileAttrBuffer+$1ec                      ; $69a2
	ld   a, $01                                                     ; $69a5
	ldh  [rVBK], a                                                  ; $69a7
	ldbc $03, $08                                                   ; $69a9
	ld   a, BANK(TileAttr_CreditsBarTextBottom)                     ; $69ac
	call FarRectCopy                                                ; $69ae

; Shift bottom part of screen 8 pixels right 8 more times to reveal, eg, Series E3
	pop  af                                                         ; $69b1
	ldh  [rSVBK], a                                                 ; $69b2
	call ProcessScriptsFromCurrLoc                                  ; $69b4
	SCR_SetCounter2 $08
	SCR_CallWithSingleUseRet Script_Sub8FromCreditsBottomSCXUsingCounter2
	SCR_Ret
	
	
Script_Add8ToCreditsTopSCXUsingCounter2:
:	SCR_ResumeNextFrame
	SCR_ValInAddrPlusEquByte wCreditsScreenTopSCX, $08
	SCR_DecCounter2_JNE :-
	SCR_SingleUseRet


Script_Sub8FromCreditsBottomSCXUsingCounter2:
:	SCR_ResumeNextFrame
	SCR_ValInAddrPlusEquByte wCreditsScreenBottomSCX, $f8
	SCR_DecCounter2_JNE :-
	SCR_SingleUseRet


Script_CreditsScreenFlashText:
; Animate flashing green text by changing palettes
	SCR_ExecAsmBelow
	ld   b, BANK(OBJPalettes_CreditsScreenFlashingText1)            ; $69d0
	ld   hl, OBJPalettes_CreditsScreenFlashingText1                 ; $69d2
	call SetOBJPaletteSrc                                           ; $69d5
	xor  a                                                          ; $69d8
	ld   [wPaletteFadeAmount], a                                    ; $69d9
	ld   [wLoadPalettesFromRam], a                                  ; $69dc
	ld   a, $01                                                     ; $69df
	ld   [wLoadOBJPalettesFromRom], a                               ; $69e1
	call ProcessScriptsFromCurrLoc                                  ; $69e4
	SCR_Delay $02

	SCR_ExecAsmBelow
	ld   b, BANK(OBJPalettes_CreditsScreenFlashingText2)            ; $69ea
	ld   hl, OBJPalettes_CreditsScreenFlashingText2                 ; $69ec
	call SetOBJPaletteSrc                                           ; $69ef
	xor  a                                                          ; $69f2
	ld   [wPaletteFadeAmount], a                                    ; $69f3
	ld   [wLoadPalettesFromRam], a                                  ; $69f6
	ld   a, $01                                                     ; $69f9
	ld   [wLoadOBJPalettesFromRom], a                               ; $69fb
	call ProcessScriptsFromCurrLoc                                  ; $69fe
	SCR_Delay $02

	SCR_ExecAsmBelow
	ld   b, BANK(OBJPalettes_CreditsScreenFlashingText3)            ; $6a04
	ld   hl, OBJPalettes_CreditsScreenFlashingText3                 ; $6a06
	call SetOBJPaletteSrc                                           ; $6a09
	xor  a                                                          ; $6a0c
	ld   [wPaletteFadeAmount], a                                    ; $6a0d
	ld   [wLoadPalettesFromRam], a                                  ; $6a10
	ld   a, $01                                                     ; $6a13
	ld   [wLoadOBJPalettesFromRom], a                               ; $6a15
	call ProcessScriptsFromCurrLoc                                  ; $6a18
	SCR_Delay $02

	SCR_ExecAsmBelow
	ld   b, BANK(OBJPalettes_CreditsScreenFlashingText4)            ; $6a1e
	ld   hl, OBJPalettes_CreditsScreenFlashingText4                 ; $6a20
	call SetOBJPaletteSrc                                           ; $6a23
	xor  a                                                          ; $6a26
	ld   [wPaletteFadeAmount], a                                    ; $6a27
	ld   [wLoadPalettesFromRam], a                                  ; $6a2a
	ld   a, $01                                                     ; $6a2d
	ld   [wLoadOBJPalettesFromRom], a                               ; $6a2f
	call ProcessScriptsFromCurrLoc                                  ; $6a32
	SCR_Delay $02

; Set final palettes
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_IntroCutscene1stCreditsScreen)            ; $6a38
	ld   hl, Palettes_IntroCutscene1stCreditsScreen                 ; $6a3a
	call SetOBJPaletteSrc                                           ; $6a3d
	xor  a                                                          ; $6a40
	ld   [wPaletteFadeAmount], a                                    ; $6a41
	ld   [wLoadPalettesFromRam], a                                  ; $6a44
	ld   a, $01                                                     ; $6a47
	ld   [wLoadOBJPalettesFromRom], a                               ; $6a49
	call ProcessScriptsFromCurrLoc                                  ; $6a4c
	SCR_Ret
	

IntroCutsceneScript_subscript2_inputHandling:
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow

; Keep looping while start not pressed
	ld   a, [wButtonsPressed]                                       ; $6a52
	bit  PADB_START, a                                              ; $6a55
	ld   de, :-                                                     ; $6a57
	jp   z, ProcessScriptsFromDE                                    ; $6a5a

; Start pressed
	ld   a, ANIM_ENGINE_NONE                                        ; $6a5d
	ld   [wIntroCutsceneAnimationEngineType], a                     ; $6a5f
	ld   a, $00                                                     ; $6a62
	ld   [wShouldUpdateHiColBGPalettes], a                          ; $6a64

; Set BG palettes to black - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $6a67
	ld   hl, Palettes_AllBlack                                      ; $6a69
	call SetBGPaletteSrc                                            ; $6a6c
	xor  a                                                          ; $6a6f
	ld   [wPaletteFadeAmount], a                                    ; $6a70
	ld   [wLoadPalettesFromRam], a                                  ; $6a73
	ld   a, $01                                                     ; $6a76
	ld   [wLoadBGPalettesFromRom], a                                ; $6a78

; Set OBJ palettes to black - no fade
	ld   b, BANK(Palettes_AllBlack)                                 ; $6a7b
	ld   hl, Palettes_AllBlack                                      ; $6a7d
	call SetOBJPaletteSrc                                           ; $6a80
	xor  a                                                          ; $6a83
	ld   [wPaletteFadeAmount], a                                    ; $6a84
	ld   [wLoadPalettesFromRam], a                                  ; $6a87
	ld   a, $01                                                     ; $6a8a
	ld   [wLoadOBJPalettesFromRom], a                               ; $6a8c

; Jump down
	call ProcessScriptsFromCurrLoc                                  ; $6a8f
	SCR_Jump Script_IntroCutsceneEnd
	

Script_IntroCutsceneEnd:
; If we came from picture book, set its state
	SCR_ExecAsmBelow
	ld   a, [wPictureBookPrevScreen]                                ; $6a96
	cp   $02                                                        ; $6a99
	jr   nz, .notFromPictureBook                                    ; $6a9b

	ld   a, GS_PICTURE_BOOK_INIT                                    ; $6a9d
	ld   [wGameState], a                                            ; $6a9f
	jr   .cont                                                      ; $6aa2

.notFromPictureBook:
; Else go to title screen
	call IncTitleScreenDemoStepUntilTitleScreenStateSet             ; $6aa4

.cont:
	call ProcessScriptsFromCurrLoc                                  ; $6aa7
	SCR_StopCurrScript
	SCR_StopSubScript2
