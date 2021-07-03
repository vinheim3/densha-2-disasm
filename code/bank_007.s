INCLUDE "includes.s"

SECTION "ROM Bank $007", ROMX[$4000], BANK[$7]

InGameSkyColors::
.color0::
	dw $7c00, $7c00, $7c21, $7c42
	dw $7c63, $7c84, $7ca5, $7cc6
	dw $7ce7, $7d08, $7d29, $7d4a
	dw $7d6b, $7d8c, $7dad, $7dce
	dw $7def, $7e10, $7e31, $7e52
	dw $7e73, $7e94, $7eb5, $7ed6
	dw $7ef7, $7f18, $7f39, $7f5a
	dw $7f7b, $7f9c, $7fbd, $7fde

.color1::
	dw $6021, $6021, $6042, $6063
	dw $6084, $64a5, $64c6, $64e7
	dw $6508, $6529, $694a, $696b
	dw $698c, $69ad, $6dce, $6def
	dw $6e10, $6e10, $6e31, $7252
	dw $7273, $7294, $72b5, $76d6
	dw $76f7, $7718, $7739, $775a
	dw $7b7b, $7b9c, $7bbd, $7bde

.color2::
	dw $4042, $4042, $4063, $4484
	dw $44a5, $48c6, $48e7, $4d08
	dw $4d29, $514a, $516b, $556b
	dw $558c, $59ad, $59ce, $5def
	dw $5e10, $5e31, $6252, $6273
	dw $6694, $66b5, $6ab5, $6ad6
	dw $6ef7, $6f18, $7339, $735a
	dw $777b, $779c, $7bbd, $7bde
	
.color3::
	dw $2063, $2063, $2484, $28a5
	dw $28c6, $2ce7, $3108, $3529
	dw $354a, $394a, $3d6b, $3d8c
	dw $41ad, $45ce, $49ef, $4a10
	dw $4e31, $5231, $5252, $5673
	dw $5a94, $5eb5, $5ed6, $62f7
	dw $6718, $6718, $6b39, $6f5a
	dw $737b, $739c, $77bd, $7bde

.color4::
	dw $1ce7, $1ce7, $2108, $2529
	dw $294a, $294a, $2d6b, $318c
	dw $35ad, $35ad, $39ce, $3def
	dw $4210, $4210, $4631, $4a52
	dw $4e73, $4e73, $5294, $56b5
	dw $5ad6, $5ad6, $5ef7, $6318
	dw $6739, $6739, $6b5a, $6f7b
	dw $739c, $739c, $77bd, $7bde

.color6::
	dw $7fff, $7bde, $77be, $739e
	dw $6f7e, $6b5d, $673d, $633d
	dw $5f1d, $5afd, $56dc, $52bc
	dw $4e9c, $4a9c, $467b, $425b
	dw $3e3b, $3a1b, $35fb, $31da
	dw $2dda, $29ba, $259a, $2179
	dw $1d59, $1939, $1539, $1119
	dw $0cf8, $08d8, $04b8, $0098

.color7::
	dw $7ce7, $7ce7, $7d08, $7d29
	dw $7d4a, $7d4a, $7d6b, $7d8c
	dw $7dad, $7dad, $7dce, $7def
	dw $7e10, $7e10, $7e31, $7e52
	dw $7e73, $7e73, $7e94, $7eb5
	dw $7ed6, $7ed6, $7ef7, $7f18
	dw $7f39, $7f39, $7f5a, $7f7b
	dw $7f9c, $7f9c, $7fbd, $7fde

.color8::
	dw $6021, $6021, $6042, $6063
	dw $6084, $64a5, $64c6, $64e7
	dw $6508, $6529, $694a, $696b
	dw $698c, $69ad, $6dce, $6def
	dw $6e10, $6e10, $6e31, $7252
	dw $7273, $7294, $72b5, $76d6
	dw $76f7, $7718, $7739, $775a
	dw $7b7b, $7b9c, $7bbd, $7bde

.color9::
	dw $4042, $4042, $4063, $4484
	dw $44a5, $48c6, $48e7, $4d08
	dw $4d29, $514a, $516b, $556b
	dw $558c, $59ad, $59ce, $5def
	dw $5e10, $5e31, $6252, $6273
	dw $6694, $66b5, $6ab5, $6ad6
	dw $6ef7, $6f18, $7339, $735a
	dw $777b, $779c, $7bbd, $7bde

.colorA::
	dw $2063, $2063, $2484, $28a5
	dw $28c6, $2ce7, $3108, $3529
	dw $354a, $394a, $3d6b, $3d8c
	dw $41ad, $45ce, $49ef, $4a10
	dw $4e31, $5231, $5252, $5673
	dw $5a94, $5eb5, $5ed6, $62f7
	dw $6718, $6718, $6b39, $6f5a
	dw $737b, $739c, $77bd, $7bde

.colorB::
	dw $7c00, $7c00, $7c21, $7c42
	dw $7c63, $7c84, $7ca5, $7cc6
	dw $7ce7, $7d08, $7d29, $7d4a
	dw $7d6b, $7d8c, $7dad, $7dce
	dw $7def, $7e10, $7e31, $7e52
	dw $7e73, $7e94, $7eb5, $7ed6
	dw $7ef7, $7f18, $7f39, $7f5a
	dw $7f7b, $7f9c, $7fbd, $7fde

.color5::
	dw $7ce7, $7ce7, $7d08, $7d29
	dw $7d4a, $7d4a, $7d6b, $7d8c
	dw $7dad, $7dad, $7dce, $7def
	dw $7e10, $7e10, $7e31, $7e52
	dw $7e73, $7e73, $7e94, $7eb5
	dw $7ed6, $7ed6, $7ef7, $7f18
	dw $7f39, $7f39, $7f5a, $7f7b
	dw $7f9c, $7f9c, $7fbd, $7fde


InGameScript0_HandleLoadingTileDataSources::
; Enable vblank updates, and set section in location to 0 to start with
	SCR_StoreByteInAddr wInGameVBlankIntFuncEnabled, $01
	SCR_StoreWordInAddr wInGameBGSectionWithinLocation, $0000

.mainLoop:
	SCR_ExecAsmBelow

; Section in location is double index into location's section meta-frames
	ld   a, [wInGameBGSectionWithinLocation]                        ; $430a
	ld   c, a                                                       ; $430d
	ld   a, [wInGameBGSectionWithinLocation+1]                      ; $430e
	ld   b, a                                                       ; $4311
	ld   a, [wBaseAddrForTrainLineLocationsMetaFrameIdxes]          ; $4312
	ld   l, a                                                       ; $4315
	ld   a, [wBaseAddrForTrainLineLocationsMetaFrameIdxes+1]        ; $4316
	ld   h, a                                                       ; $4319
	add  hl, bc                                                     ; $431a
	add  hl, bc                                                     ; $431b
	call LoadInGameSceneryTileDataSources                           ; $431c

	call ProcessScriptsFromCurrLoc                                  ; $431f
	SCR_ResumeNextFrame
	SCR_Jump .mainLoop


InGameScript1_HandleTrainRails::
; Start a subscript to handle animations, and base anim/pos details
	SCR_StartSubScript1 InGameScript1SubScript1_HandleRailsAnimation
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_STRAIGHT
	SCR_SetSpriteXY $38, $30

.loop:
	SCR_ExecAsmBelow

; If animating, add 1 to anim idx
	ld   a, [wTrainRailsShouldAnimate]                              ; $4332
	ld   b, a                                                       ; $4335
	ld   a, [wTrainRailsAnimIdx]                                    ; $4336
	add  b                                                          ; $4339
	cp   $03                                                        ; $433a
	jr   c, .setAnimIdx                                             ; $433c

; If at end of animation, and straightening, keep last anim idx
	ld   a, [wTrainRailsShape]                                      ; $433e
	cp   $03                                                        ; $4341
	jr   nc, .straightening                                         ; $4343

	xor  a                                                          ; $4345
	jr   .setAnimIdx                                                ; $4346

.straightening:
	ld   a, $02                                                     ; $4348
	jr   .setAnimIdx                                                ; $434a

.setAnimIdx:
; Call script to update sprite src address
	ld   [wTrainRailsAnimIdx], a                                    ; $434c
	call ProcessScriptsFromCurrLoc                                  ; $434f
	SCR_CallTableIdxInAddr :+, wTrainRailsShape
:	dw .straight
	dw .strongRight
	dw .strongLeft
	dw .straightGoingRight
	dw .straightGoingLeft
	dw .rightGoingStraight
	dw .leftGoingStraight

.straight:
	SCR_CallTableIdxInAddr .straightTable, wTrainRailsAnimIdx

.strongRight:
	SCR_CallTableIdxInAddr .strongRightTable, wTrainRailsAnimIdx

.strongLeft:
	SCR_CallTableIdxInAddr .strongLeftTable, wTrainRailsAnimIdx

.straightGoingRight:
	SCR_CallTableIdxInAddr .straightGoingRightTable, wTrainRailsAnimIdx

.straightGoingLeft:
	SCR_CallTableIdxInAddr .straightGoingLeftTable, wTrainRailsAnimIdx

.rightGoingStraight:
	SCR_CallTableIdxInAddr .rightGoingStraightTable, wTrainRailsAnimIdx

.leftGoingStraight:
	SCR_CallTableIdxInAddr .leftGoingStraightTable, wTrainRailsAnimIdx

.straightTable:
	dw .straight0
	dw .straight1
	dw .straight2

.strongRightTable:
	dw .strongRight0
	dw .strongRight1
	dw .strongRight2

.strongLeftTable:
	dw .strongLeft0
	dw .strongLeft1
	dw .strongLeft2
	
.straightGoingRightTable:
	dw .straightGoingRight0
	dw .straightGoingRight1
	dw .straightGoingRight2

.straightGoingLeftTable:
	dw .straightGoingLeft0
	dw .straightGoingLeft1
	dw .straightGoingLeft2

.rightGoingStraightTable:
	dw .rightGoingStraight0
	dw .rightGoingStraight1
	dw .rightGoingStraight2

.leftGoingStraightTable:
	dw .leftGoingStraight0
	dw .leftGoingStraight1
	dw .leftGoingStraight2

.straight0:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStraight0
	SCR_Jump .afterSetSrc

.straight1:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStraight1
	SCR_Jump .afterSetSrc

.straight2:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStraight2
	SCR_Jump .afterSetSrc

.strongRight0:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStrongRight0
	SCR_Jump .afterSetSrc

.strongRight1:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStrongRight1
	SCR_Jump .afterSetSrc

.strongRight2:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStrongRight2
	SCR_Jump .afterSetSrc

.strongLeft0:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStrongLeft0
	SCR_Jump .afterSetSrc

.strongLeft1:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStrongLeft1
	SCR_Jump .afterSetSrc

.strongLeft2:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStrongLeft2
	SCR_Jump .afterSetSrc

.straightGoingRight0:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStraightGoingRight0
	SCR_Jump .afterSetSrc

.straightGoingRight1:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStraightGoingRight1
	SCR_Jump .afterSetSrc

.straightGoingRight2:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStrongRight2
	SCR_Jump .afterSetSrc

.straightGoingLeft0:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStraightGoingLeft0
	SCR_Jump .afterSetSrc

.straightGoingLeft1:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStraightGoingLeft1
	SCR_Jump .afterSetSrc

.straightGoingLeft2:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStrongLeft2
	SCR_Jump .afterSetSrc

.rightGoingStraight0:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStraightGoingRight1
	SCR_Jump .afterSetSrc

.rightGoingStraight1:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStraightGoingRight0
	SCR_Jump .afterSetSrc

.rightGoingStraight2:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStraight2
	SCR_Jump .afterSetSrc

.leftGoingStraight0:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStraightGoingLeft1
	SCR_Jump .afterSetSrc

.leftGoingStraight1:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStraightGoingLeft0
	SCR_Jump .afterSetSrc

.leftGoingStraight2:
	SCR_FarSetSpriteSrc SpriteOam_TrainRailsStraight2
	SCR_Jump .afterSetSrc

.afterSetSrc:
	SCR_CallWithSingleUseRet OtherScript1_WaitUntilGameUnpaused
	SCR_Jump .loop


OtherScript1_WaitUntilGameUnpaused:
; Keep in infinite loop while game is paused
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wInGameIsPaused]                                       ; $444d
	or   a                                                          ; $4450
	ld   de, :-                                                     ; $4451
	jp   nz, ProcessScriptsFromDE                                   ; $4454

	call ProcessScriptsFromCurrLoc                                  ; $4457
	SCR_SingleUseRet
	
	
InGameScript1SubScript1_HandleRailsAnimation:
.loop:
	SCR_ExecAsmBelow

; Proceed if desired train rails shape is not the same as the current one
	ld   a, [wNextTrainRailsShape]                                  ; $445c
	ld   b, a                                                       ; $445f
	ld   a, [wTrainRailsShape]                                      ; $4460
	cp   b                                                          ; $4463
	ld   de, .end                                                   ; $4464
	jp   z, ProcessScriptsFromDE                                    ; $4467

	cp   RAILS_STRAIGHT                                             ; $446a
	jr   z, .isStraight                                             ; $446c

	cp   RAILS_STRONG_LEFT                                          ; $446e
	jr   z, .strongLeft                                             ; $4470

	cp   RAILS_STRONG_RIGHT                                         ; $4472
	jr   z, .strongRight                                            ; $4474

.isStraight:
	ld   a, $00                                                     ; $4476
	ld   [wTrainRailsAnimIdx], a                                    ; $4478
	ld   a, [wNextTrainRailsShape]                                  ; $447b
	cp   RAILS_STRONG_LEFT                                          ; $447e
	jr   nz, .straightGoingRight                                    ; $4480

; Straight going left
	call ProcessScriptsFromCurrLoc                                  ; $4482
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_STRAIGHT_GOING_LEFT
	SCR_Call Script_RailsWait3FramesBeforeAnimating
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_STRONG_LEFT
	SCR_Jump .end

.straightGoingRight:
	call ProcessScriptsFromCurrLoc                                  ; $4493
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_STRAIGHT_GOING_RIGHT
	SCR_Call Script_RailsWait3FramesBeforeAnimating
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_STRONG_RIGHT
	SCR_Jump .end

.strongLeft:
	ld   a, $00                                                     ; $44a4
	ld   [wTrainRailsAnimIdx], a                                    ; $44a6
	ld   a, [wNextTrainRailsShape]                                  ; $44a9
	cp   RAILS_STRAIGHT                                             ; $44ac
	jr   nz, .leftGoingRight                                        ; $44ae

; Left going straight
	call ProcessScriptsFromCurrLoc                                  ; $44b0
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_LEFT_GOING_STRAIGHT
	SCR_Call Script_RailsWait3FramesBeforeAnimating
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_STRAIGHT
	SCR_Jump .end

.leftGoingRight:
	call ProcessScriptsFromCurrLoc                                  ; $44c1
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_LEFT_GOING_STRAIGHT
	SCR_Call Script_RailsWait3FramesBeforeAnimating
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_STRAIGHT
	SCR_Call Script_RailsWait3FramesBeforeAnimating
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_STRAIGHT_GOING_RIGHT
	SCR_Call Script_RailsWait3FramesBeforeAnimating
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_STRONG_RIGHT
	SCR_Jump .end

.strongRight:
	ld   a, $00                                                     ; $44e0
	ld   [wTrainRailsAnimIdx], a                                    ; $44e2
	ld   a, [wNextTrainRailsShape]                                  ; $44e5
	cp   RAILS_STRAIGHT                                             ; $44e8
	jr   nz, .rightGoingLeft                                        ; $44ea

; Right going straight
	call ProcessScriptsFromCurrLoc                                  ; $44ec
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_RIGHT_GOING_STRAIGHT
	SCR_Call Script_RailsWait3FramesBeforeAnimating
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_STRAIGHT
	SCR_Jump .end

.rightGoingLeft:
	call ProcessScriptsFromCurrLoc                                  ; $44fd
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_RIGHT_GOING_STRAIGHT
	SCR_Call Script_RailsWait3FramesBeforeAnimating
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_STRAIGHT
	SCR_Call Script_RailsWait3FramesBeforeAnimating
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_STRAIGHT_GOING_LEFT
	SCR_Call Script_RailsWait3FramesBeforeAnimating
	SCR_StoreByteInAddr wTrainRailsShape, RAILS_STRONG_LEFT
	SCR_Jump .end

.end:
	SCR_ResumeNextFrame
	SCR_Jump .loop


Script_RailsWait3FramesBeforeAnimating:
	SCR_SetCounter2 $03
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wTrainRailsShouldAnimate]                              ; $4524
	or   a                                                          ; $4527
	ld   de, :-                                                     ; $4528
	jp   z, ProcessScriptsFromDE                                    ; $452b

	call ProcessScriptsFromCurrLoc                                  ; $452e
	SCR_DecCounter2_JNE :-
	SCR_Ret
	
	
InGameScript4_HandleOnSceneryText::
; Load sprite spec func, populate it for vblank, and call a handler func for it
	SCR_FarSetSpriteSrcFunc SpriteOamFunc_OnSceneryText
	SCR_StartSubScript1 InGameScript4SubScript1
:	SCR_Call Script_PopulateOnSceneryTextOam
	SCR_CallTableIdxInAddr InGameSceneryTextHandler, wInGameOnSceneryTextIdx
	
	SCR_ResumeNextFrame
	SCR_Jump :-


InGameScript4SubScript1:
; Unnecessary conditional, whether it's paused or not, we resume next frame
:	SCR_ExecAsmBelow
	ld   a, [wInGameIsPaused]                                       ; $454a
	or   a                                                          ; $454d
	ld   de, .paused                                                ; $454e
	jp   nz, ProcessScriptsFromDE                                   ; $4551

	call ProcessScriptsFromCurrLoc                                  ; $4554
	SCR_ResumeNextFrame
	SCR_Jump :-

.paused:
	SCR_ResumeNextFrame
	SCR_Jump :-


SpriteOamFunc_OnSceneryText:
; Simply copy from buffer to shadow OAM
	ld   hl, wInGameOnSceneryTextOam                                ; $455f
	ldbc $38, $30                                                   ; $4562
	call SaveOverrideableOamDetailsTo_wOam                          ; $4565
	jp   UpdateScriptsOam.saveOamOffsetGoToNextScriptStruct         ; $4568


Script_PopulateOnSceneryTextOam:
; Unnecessary conditional
	SCR_ExecAsmBelow
	ld   a, [wInGameOnSceneryTextIdx]                               ; $456c
	add  a                                                          ; $456f
	jr   z, :+                                                      ; $4570
	nop                                                             ; $4572

; Get address from word in table, idxed by text idx
:	ld   hl, InGameSceneryTextOamSources                            ; $4573
	ld   c, a                                                       ; $4576
	ld   b, $00                                                     ; $4577
	add  hl, bc                                                     ; $4579
	ld   a, [hl+]                                                   ; $457a
	ld   h, [hl]                                                    ; $457b
	ld   l, a                                                       ; $457c

; Every 5 bytes details an oam structure to load
	ld   de, wInGameOnSceneryTextOam                                ; $457d

.nextOamStructure:
	ld   a, [hl]                                                    ; $4580
	cp   $ff                                                        ; $4581
	jr   z, .afterLoadingOams                                       ; $4583

	call FarLoadSpriteOam                                           ; $4585
	ld   bc, $0005                                                  ; $4588
	add  hl, bc                                                     ; $458b
	jr   .nextOamStructure                                          ; $458c

.afterLoadingOams:
; Display penalties oam for some texts
	ld   a, [wInGameOnSceneryTextIdx]                               ; $458e
	cp   IGS_TEXT_IGNORED_SIGN_SIGNALS                              ; $4591
	jr   z, .hasPenalty                                             ; $4593

	cp   IGS_TEXT_PTS_DEDUCTION                                     ; $4595
	jr   z, .hasPenalty                                             ; $4597

	cp   IGS_TEXT_SUDDEN_BRAKING                                    ; $4599
	jr   z, .hasPenalty                                             ; $459b

	cp   IGS_TEXT_GOOD                                              ; $459d
	jr   z, .hasPenalty                                             ; $459f

	cp   IGS_TEXT_GREAT                                             ; $45a1
	jr   z, .hasPenalty                                             ; $45a3

	cp   IGS_TEXT_REGULAR_COMMUNICATION                             ; $45a5
	jr   z, .hasPenalty                                             ; $45a7

	cp   IGS_TEXT_SECTION_PASSAGE                                   ; $45a9
	jr   z, .hasPenalty                                             ; $45ab

	cp   IGS_TEXT_BONUS_PTS                                         ; $45ad
	jr   z, .hasPenalty                                             ; $45af

; Or just continue
	jr   .cont                                                      ; $45b1

.hasPenalty:
	push de                                                         ; $45b3

; L = 10s digits of penalties, H = 1s digit
	ld   a, [wInGamePenaltiesAboutToBeAddedOrSubbed]                ; $45b4
	ld   l, a                                                       ; $45b7
	ld   h, $00                                                     ; $45b8
	ld   e, 10                                                      ; $45ba
	call HLdivmodEinLH                                              ; $45bc

; Jump if 10s == 0
	pop  de                                                         ; $45bf
	ld   a, l                                                       ; $45c0
	or   a                                                          ; $45c1
	jr   z, .displayUnits                                           ; $45c2

; Display 10s
	ld   c, $00                                                     ; $45c4
	call LoadOnSceneryPenalty10sOam                                 ; $45c6

.displayUnits:
	ld   a, h                                                       ; $45c9
	ld   c, $08                                                     ; $45ca
	call LoadOnSceneryPenaltyUnitsOam                               ; $45cc

.cont:
; Add ending marker
	ld   a, $80                                                     ; $45cf
	ld   [de], a                                                    ; $45d1
	call ProcessScriptsFromCurrLoc                                  ; $45d2
	SCR_Ret
	
	
; A - num 10s
LoadOnSceneryPenalty10sOam:
; Double idx into table has an addr pointing to 5 bytes for 10s-related oam
	push bc                                                         ; $45d6
	push hl                                                         ; $45d7
	add  a                                                          ; $45d8
	ld   c, a                                                       ; $45d9
	ld   b, $00                                                     ; $45da
	ld   hl, InGameSceneryPenalty10sOamSources                      ; $45dc
	add  hl, bc                                                     ; $45df
	ld   a, [hl+]                                                   ; $45e0
	ld   h, [hl]                                                    ; $45e1
	ld   l, a                                                       ; $45e2
	call FarLoadSpriteOam                                           ; $45e3
	pop  hl                                                         ; $45e6
	pop  bc                                                         ; $45e7
	ret                                                             ; $45e8


; A - num 1s
LoadOnSceneryPenaltyUnitsOam:
; Double idx into table has an addr pointing to 5 bytes for 1s-related oam
	push bc                                                         ; $45e9
	push hl                                                         ; $45ea
	add  a                                                          ; $45eb
	ld   c, a                                                       ; $45ec
	ld   b, $00                                                     ; $45ed
	ld   hl, InGameSceneryPenaltyUnitsOamSources                    ; $45ef
	add  hl, bc                                                     ; $45f2
	ld   a, [hl+]                                                   ; $45f3
	ld   h, [hl]                                                    ; $45f4
	ld   l, a                                                       ; $45f5
	call FarLoadSpriteOam                                           ; $45f6
	pop  hl                                                         ; $45f9
	pop  bc                                                         ; $45fa
	ret                                                             ; $45fb


InGameSceneryTextOamSources:
	dw FarLoadedSpriteOam_Text00
	dw FarLoadedSpriteOam_Text01
	dw FarLoadedSpriteOam_Text02
	dw FarLoadedSpriteOam_Text03
	dw FarLoadedSpriteOam_Text04
	dw FarLoadedSpriteOam_Text05
	dw FarLoadedSpriteOam_Text06
	dw FarLoadedSpriteOam_Text07
	dw FarLoadedSpriteOam_Text08
	dw FarLoadedSpriteOam_Text09
	dw FarLoadedSpriteOam_Text0a
	dw FarLoadedSpriteOam_Text0b
	dw FarLoadedSpriteOam_Text0c
	dw FarLoadedSpriteOam_Text0d
	dw FarLoadedSpriteOam_Text0e
	dw FarLoadedSpriteOam_Text0f
	dw FarLoadedSpriteOam_Text10
	dw FarLoadedSpriteOam_Text11
	dw FarLoadedSpriteOam_Text12
	dw FarLoadedSpriteOam_Text13
	dw FarLoadedSpriteOam_Text14

	
InGameSceneryPenalty10sOamSources:
	dw FarLoadedSpriteOam_Penalty10s+0*5
	dw FarLoadedSpriteOam_Penalty10s+1*5
	dw FarLoadedSpriteOam_Penalty10s+2*5
	dw FarLoadedSpriteOam_Penalty10s+3*5
	dw FarLoadedSpriteOam_Penalty10s+4*5
	dw FarLoadedSpriteOam_Penalty10s+5*5
	dw FarLoadedSpriteOam_Penalty10s+6*5
	dw FarLoadedSpriteOam_Penalty10s+7*5
	dw FarLoadedSpriteOam_Penalty10s+8*5
	dw FarLoadedSpriteOam_Penalty10s+9*5


InGameSceneryPenaltyUnitsOamSources:
	dw FarLoadedSpriteOam_Penalty1s+0*5
	dw FarLoadedSpriteOam_Penalty1s+1*5
	dw FarLoadedSpriteOam_Penalty1s+2*5
	dw FarLoadedSpriteOam_Penalty1s+3*5
	dw FarLoadedSpriteOam_Penalty1s+4*5
	dw FarLoadedSpriteOam_Penalty1s+5*5
	dw FarLoadedSpriteOam_Penalty1s+6*5
	dw FarLoadedSpriteOam_Penalty1s+7*5
	dw FarLoadedSpriteOam_Penalty1s+8*5
	dw FarLoadedSpriteOam_Penalty1s+9*5


FarLoadedSpriteOam_Penalty10s:
	FarLoadedOam $20, $18, SpriteOam_PenaltyText_0
	FarLoadedOam $20, $18, SpriteOam_PenaltyText_1
	FarLoadedOam $20, $18, SpriteOam_PenaltyText_2
	FarLoadedOam $20, $18, SpriteOam_PenaltyText_3
	FarLoadedOam $20, $18, SpriteOam_PenaltyText_4
	FarLoadedOam $20, $18, SpriteOam_PenaltyText_5
	FarLoadedOam $20, $18, SpriteOam_PenaltyText_6
	FarLoadedOam $20, $18, SpriteOam_PenaltyText_7
	FarLoadedOam $20, $18, SpriteOam_PenaltyText_8
	FarLoadedOam $20, $18, SpriteOam_PenaltyText_9


FarLoadedSpriteOam_Penalty1s:
	FarLoadedOam $28, $18, SpriteOam_PenaltyText_0
	FarLoadedOam $28, $18, SpriteOam_PenaltyText_1
	FarLoadedOam $28, $18, SpriteOam_PenaltyText_2
	FarLoadedOam $28, $18, SpriteOam_PenaltyText_3
	FarLoadedOam $28, $18, SpriteOam_PenaltyText_4
	FarLoadedOam $28, $18, SpriteOam_PenaltyText_5
	FarLoadedOam $28, $18, SpriteOam_PenaltyText_6
	FarLoadedOam $28, $18, SpriteOam_PenaltyText_7
	FarLoadedOam $28, $18, SpriteOam_PenaltyText_8
	FarLoadedOam $28, $18, SpriteOam_PenaltyText_9


FarLoadedSpriteOam_Text00:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_None
	db $ff


FarLoadedSpriteOam_Text01:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_OverSpeed
	db $ff


FarLoadedSpriteOam_Text02:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_IgnoredSignOrSignal
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_PointDeduction
	db $ff


FarLoadedSpriteOam_Text03:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_SuddenBraking
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_PointDeduction
	db $ff


FarLoadedSpriteOam_Text04:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_Sections
	db $ff


FarLoadedSpriteOam_Text05:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_ATSOperation
	db $ff


FarLoadedSpriteOam_Text06:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_IgnoreCabSignals
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_PointDeduction
	db $ff


FarLoadedSpriteOam_Text07:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_BollardClash
	db $ff


FarLoadedSpriteOam_Text08:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_DepartureProgress
	db $ff


FarLoadedSpriteOam_Text09:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_StationStop
	db $ff


FarLoadedSpriteOam_Text0a:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_PassingTheStation
	db $ff


FarLoadedSpriteOam_Text0b:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_AllSectionsRunning
	db $ff


FarLoadedSpriteOam_Text0c:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_TimeOut
	db $ff


FarLoadedSpriteOam_Text0d:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_PointAddition
	db $ff


FarLoadedSpriteOam_Text0e:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_Good
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_PointAddition
	db $ff


FarLoadedSpriteOam_Text0f:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_Great
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_PointAddition
	db $ff


FarLoadedSpriteOam_Text10:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_ProceedPlease
	db $ff


FarLoadedSpriteOam_Text11:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_PointDeduction
	FarLoadedOam $28, $18, SpriteOam_PenaltyText_5
	db $ff


FarLoadedSpriteOam_Text12:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_RegularCommunication
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_PointAddition
	db $ff


FarLoadedSpriteOam_Text13:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_SectionPassage
	db $ff


FarLoadedSpriteOam_Text14:
	FarLoadedOam $00, $00, SpriteOam_InGameSceneryText_PointDeduction
	db $ff


SpriteOam_InGameSceneryText_None:
	db $01
	db $10, $08, $00, $00


InGameSceneryTextHandler:
	dw .igsText00_None
	dw .igsText01_OverSpeed
	dw .igsText02_IgnoredSignOrSignal
	dw .igsText03_SuddenBraking
	dw .igsText04_Sections
	dw .igsText05_ATSOperation
	dw .igsText06_IgnoredCabSignals
	dw .igsText07_BollardClash
	dw .igsText08_DepartureProgress
	dw .igsText09_StationStop
	dw .igsText0a_PassingStation
	dw .igsText0b_AllSectionsRunning
	dw .igsText0c_TimeOut
	dw .igsText0d_PointAddition
	dw .igsText0e_Good
	dw .igsText0f_Great
	dw .igsText10_ProceedPlease
	dw .igsText11_Minus5Pts
	dw .igsText12_RegularCommunication
	dw .igsText13_SectionPassage
	dw .igsText14_PointDeduction

.igsText00_None:
	SCR_ResumeNextFrame
	SCR_SingleUseRet

.igsText01_OverSpeed:
	SCR_PlaySound SND_0b|MAKE_SOUND_EFFECT
	SCR_Jump .cont

.igsText02_IgnoredSignOrSignal:
	SCR_PlaySound SND_0b|MAKE_SOUND_EFFECT
	SCR_Jump .cont

.igsText03_SuddenBraking:
	SCR_PlaySound SND_0b|MAKE_SOUND_EFFECT
	SCR_Jump .cont

.igsText04_Sections:
	SCR_PlaySound SND_0b|MAKE_SOUND_EFFECT
	SCR_Jump .cont

.igsText05_ATSOperation:
; Play sound, and loop while ignoring ATS op
	SCR_PlaySound SND_0b|MAKE_SOUND_EFFECT
:	SCR_ResumeNextFrame
	
	SCR_ExecAsmBelow
	ld   a, [w1IfIgnoredATSOp2IfIgnoredSignal]                      ; $479c
	or   a                                                          ; $479f
	ld   de, :-                                                     ; $47a0
	jp   nz, ProcessScriptsFromDE                                   ; $47a3

; Then clear text
	call ProcessScriptsFromCurrLoc                                  ; $47a6
	SCR_StoreByteInAddr wInGameOnSceneryTextIdx, IGS_TEXT_NONE
	SCR_SingleUseRet

.igsText06_IgnoredCabSignals:
	SCR_PlaySound SND_0b|MAKE_SOUND_EFFECT
	SCR_Jump .cont

.igsText07_BollardClash:
; Play sound, then add to a used penalty counter, and an unused one
	SCR_PlaySound SND_0b|MAKE_SOUND_EFFECT
	SCR_ExecAsmBelow
	ld   hl, wLargerCounterPenaltyForVeryUnsafeBrakingOrStops       ; $47b6
	ld   c, $05                                                     ; $47b9
	call AddCToByteInHL_maxFFh                                      ; $47bb

	ld   hl, wUnusedPenaltyValueForBollardClash                     ; $47be
	ld   c, $06                                                     ; $47c1
	call AddCToByteInHL_maxFFh                                      ; $47c3
	call ProcessScriptsFromCurrLoc                                  ; $47c6
	SCR_Jump .cont

.igsText08_DepartureProgress:
	SCR_Jump .cont

.igsText09_StationStop:
	SCR_Jump .cont

.igsText0a_PassingStation:
	SCR_Jump .cont

.igsText0b_AllSectionsRunning:
	SCR_PlaySound MUS_0a|MAKE_SOUND_EFFECT
	SCR_Jump .script_481b

.igsText0c_TimeOut:
	SCR_AddToSpriteX $68
	SCR_SetCounter1 $34
:	SCR_AddToSpriteX $fe
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-
	SCR_PlaySound SND_0b|MAKE_SOUND_EFFECT
	SCR_Jump .cont

.igsText0d_PointAddition:
	SCR_Delay $0a
	SCR_PlaySound SND_0a|MAKE_SOUND_EFFECT
	SCR_Jump .cont

.igsText0e_Good:
	SCR_PlaySound MUS_06|MAKE_SOUND_EFFECT
	SCR_Jump .cont

.igsText0f_Great:
	SCR_PlaySound MUS_07|MAKE_SOUND_EFFECT
	SCR_Jump .cont

.igsText10_ProceedPlease:
	SCR_PlaySound SND_0b|MAKE_SOUND_EFFECT
	SCR_Jump .cont

.igsText11_Minus5Pts:
	SCR_PlaySound SND_0b|MAKE_SOUND_EFFECT
	SCR_Jump .cont

.igsText12_RegularCommunication:
	SCR_PlaySound SND_0a|MAKE_SOUND_EFFECT
	SCR_Jump .cont

.igsText13_SectionPassage:
	SCR_PlaySound SND_0a|MAKE_SOUND_EFFECT
	SCR_Jump .cont

.igsText14_PointDeduction:
	SCR_PlaySound SND_0b|MAKE_SOUND_EFFECT
	SCR_Jump .cont

.cont:
	SCR_StoreByteInAddr wInGameOnSceneryTextIdx, IGS_TEXT_NONE
	SCR_Call Script_FlashingTextWait
	SCR_SingleUseRet

.script_481b:
:	SCR_ResumeNextFrame
	SCR_Jump :-

	
Script_FlashingTextWait:
; Dec counter while unpaused, return when it's 0
	SCR_SetCounter3 $b4
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wInGameIsPaused]                                       ; $4823
	or   a                                                          ; $4826
	ld   de, :-                                                     ; $4827
	jp   nz, ProcessScriptsFromDE                                   ; $482a

	call ProcessScriptsFromCurrLoc                                  ; $482d
	SCR_DecCounter3_JNE :-
	SCR_Ret
	
	
InGameScript5_HandleMiscellaneousScenarios::
; These scenarios stay for a second, then clear
	SCR_StartSubScript1 InGameScript5_HandleMiscellaneousScenariosSubScript1_PlaySoundOnAlternatingRedLights

.loop:
; Loop, waiting for a misc scenario idx to be set
	SCR_ExecAsmBelow
	ld   a, [wScenarioIdxForMiscellaneousScenarios]                 ; $4839
	or   a                                                          ; $483c
	ld   de, .loopNextFrame                                         ; $483d
	jp   z, ProcessScriptsFromDE                                    ; $4840

; Store scenario to compare to it, and call its handler
	ld   a, [wScenarioIdxForMiscellaneousScenarios]                 ; $4843
	ld   [wSavedMiscellaneousScenarioIdx], a                        ; $4846
	call ProcessScriptsFromCurrLoc                                  ; $4849
	SCR_CallTableIdxInAddr InGameScript7_HandleSpeedLimitAndATCScenarios.table, wScenarioIdxForMiscellaneousScenarios

; After a second, continue, if the idx changes, loop to execute the new one
	SCR_SetCounter1 60
:	SCR_ExecAsmBelow
	ld   a, [wSavedMiscellaneousScenarioIdx]                        ; $4854
	ld   b, a                                                       ; $4857
	ld   a, [wScenarioIdxForMiscellaneousScenarios]                 ; $4858
	cp   b                                                          ; $485b
	ld   de, .loop                                                  ; $485c
	jp   nz, ProcessScriptsFromDE                                   ; $485f

	call ProcessScriptsFromCurrLoc                                  ; $4862
	SCR_ResumeNextFrame
	SCR_DecCounter1_JNE :-

; An addition to above
	SCR_ExecAsmBelow
	ld   a, [wSavedMiscellaneousScenarioIdx]                        ; $486a
	ld   b, a                                                       ; $486d
	ld   a, [wScenarioIdxForMiscellaneousScenarios]                 ; $486e
	cp   b                                                          ; $4871
	ld   de, .loop                                                  ; $4872
	jp   nz, ProcessScriptsFromDE                                   ; $4875

; Clear scenario, and remove event so it's called just once
	ld   a, $00                                                     ; $4878
	ld   [wScenarioIdxForMiscellaneousScenarios], a                 ; $487a
	call ProcessScriptsFromCurrLoc                                  ; $487d
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_NONE
	SCR_Jump .loop

.loopNextFrame:
	SCR_ResumeNextFrame
	SCR_Jump .loop


InGameScript7_HandleSpeedLimitAndATCScenarios::
; Simply call handler when idx is set, and clear so only called once
:	SCR_ExecAsmBelow
	ld   a, [wScenarioIdxForSpeedLimitAndATCScenarios]              ; $488c
	or   a                                                          ; $488f
	ld   de, .toLoop                                                ; $4890
	jp   z, ProcessScriptsFromDE                                    ; $4893

	call ProcessScriptsFromCurrLoc                                  ; $4896
	SCR_CallTableIdxInAddr .table, wScenarioIdxForSpeedLimitAndATCScenarios
	SCR_StoreByteInAddr wScenarioIdxForSpeedLimitAndATCScenarios, $00

.toLoop:
	SCR_ResumeNextFrame
	SCR_Jump :-

.table:
; InGameScript5_HandleMiscellaneousScenarios
	dw Script_Scenario00h_None
	dw Script_Scenario01h_Climbing
	dw Script_Scenario02h_SlopingDown
	dw Script_Scenario03h_NoSlope
	dw Script_Scenario04h_CabGetOn
	dw Script_Scenario05h_CabLimit
	dw Script_Scenario06h_CabStop
	dw Script_Scenario07h_AltRedLightsNoBonus
	dw Script_Scenario08h_NoSiren
	dw Script_Scenario09h_HiddenSirenBonusPts
	dw Script_Scenario0ah_ApproachingStation
	dw Script_Scenario0bh_InfLoop
	dw Script_Scenario0ch_Attention45kmh
	dw Script_Scenario0dh_StopSignal
	dw Script_Scenario0eh_Deceleration70kmh
	dw Script_Scenario0fh_Warning25kmh
	dw Script_Scenario10h_AltRedLightsSirenBonusPts
	dw Script_Scenario11h_PassingTheStation
	dw Script_Scenario12h_Stub
	dw Script_Scenario13h_Stub
	dw Script_Scenario14h_Stub
	dw Script_Scenario15h_CoastingNotice
	dw Script_Scenario16h_CoastingIdle
	dw Script_Scenario17h_CoastingEnd

; InGameScript7_HandleSpeedLimitAndATCScenarios
	dw Script_Scenario18h_NoSpeedLimit
	dw Script_Scenario19h_CabEvent
	dw Script_Scenario1ah_CustomSpeedLimitOrStop
	dw Script_Scenario1bh_CarryOnOut
	dw Script_Scenario1ch_CarryOnField
	dw Script_Scenario1dh_SpeedLimit30kmh
	dw Script_Scenario1eh_SpeedLimit35kmh
	dw Script_Scenario1fh_SpeedLimit40kmh
	dw Script_Scenario20h_SpeedLimit45kmh
	dw Script_Scenario21h_SpeedLimit50kmh
	dw Script_Scenario22h_SpeedLimit55kmh
	dw Script_Scenario23h_SpeedLimit60kmh
	dw Script_Scenario24h_SpeedLimit65kmh
	dw Script_Scenario25h_SpeedLimit70kmh
	dw Script_Scenario26h_SpeedLimit75kmh
	dw Script_Scenario27h_SpeedLimit80kmh
	dw Script_Scenario28h_SpeedLimit85kmh
	dw Script_Scenario29h_SpeedLimit90kmh
	dw Script_Scenario2ah_SpeedLimit95kmh
	dw Script_Scenario2bh_SpeedLimit100kmh
	dw Script_Scenario2ch_SpeedLimit105kmh
	dw Script_Scenario2dh_SpeedLimit110kmh
	dw Script_Scenario2eh_SpeedLimit115kmh
	dw Script_Scenario2fh_SpeedLimit120kmh
	dw Script_Scenario30h_SpeedLimit125kmh
	dw Script_Scenario31h_SpeedLimit160kmh
	dw Script_Scenario32h_SpeedLimit210kmh
	dw Script_Scenario33h_SpeedLimit245kmh
	dw Script_Scenario34h_ATC30kmh
	dw Script_Scenario35h_ATC70kmh
	dw Script_Scenario36h_ATC110kmh
	dw Script_Scenario37h_ATC160kmh
	dw Script_Scenario38h_ATC210kmh
	dw Script_Scenario39h_ATC245kmh


Script_Scenario00h_None:
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_NONE
	SCR_SingleUseRet


Script_Scenario01h_Climbing:
	SCR_StoreWordInAddr wSlopeSpeedIncrease, -2
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_CLIMBING
	SCR_SingleUseRet


Script_Scenario02h_SlopingDown:
	SCR_StoreWordInAddr wSlopeSpeedIncrease, 2
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_SLOPING_DOWN
	SCR_SingleUseRet


Script_Scenario03h_NoSlope:
	SCR_StoreWordInAddr wSlopeSpeedIncrease, 0
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_NO_SLOPE
	SCR_SingleUseRet


Script_Scenario04h_CabGetOn:
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_CAB_GET_ON
	SCR_SingleUseRet


Script_Scenario05h_CabLimit:
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_CAB_LIMIT
	SCR_SingleUseRet


Script_Scenario06h_CabStop:
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_CAB_STOP
	SCR_SingleUseRet


Script_Scenario07h_AltRedLightsNoBonus:
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_ALTERNATING_RED_LIGHTS_1
	SCR_SingleUseRet


Script_Scenario08h_NoSiren:
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_MUST_PRESS_SIREN
	SCR_PlaySound SND_01|MAKE_SOUND_EFFECT
	SCR_StoreByteInAddr wCounterToPressSirenBeforeBeingPenalized, $b4
	SCR_SingleUseRet


Script_Scenario09h_HiddenSirenBonusPts:
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_NONE
	SCR_StoreByteInAddr wCounterToPressSirenForBonusPts, $b4
	SCR_SingleUseRet


Script_Scenario0ah_ApproachingStation:
	SCR_SingleUseRet


Script_Scenario0bh_InfLoop:
:	SCR_ResumeNextFrame
	SCR_Jump :-


Script_Scenario0ch_Attention45kmh:
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_ATTENTION_45KM_H
	SCR_SingleUseRet


Script_Scenario0dh_StopSignal:
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_STOP_SIGNAL
	SCR_SingleUseRet


Script_Scenario0eh_Deceleration70kmh:
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_DECELERATION_70KM_H
	SCR_SingleUseRet


Script_Scenario0fh_Warning25kmh:
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_WARNING_25KM_H
	SCR_SingleUseRet


Script_Scenario10h_AltRedLightsSirenBonusPts:
	SCR_PlaySound SND_15|MAKE_SOUND_EFFECT
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_ALTERNATING_RED_LIGHTS_1
	SCR_StoreByteInAddr wCounterToPressSirenForBonusPts, $b4
	SCR_SingleUseRet


Script_Scenario11h_PassingTheStation:
	SCR_StoreByteInAddr wInGameOnSceneryTextIdx, IGS_TEXT_PASSING_THE_STATION
	SCR_SingleUseRet
	
	
InGameScript5_HandleMiscellaneousScenariosSubScript1_PlaySoundOnAlternatingRedLights:
.loop:
	SCR_ExecAsmBelow
	ld   a, [wInGameEventIdx1]                                      ; $498f
	cp   EVENT_ALTERNATING_RED_LIGHTS_1                             ; $4992
	ld   de, :+                                                     ; $4994
	jp   z, ProcessScriptsFromDE                                    ; $4997

	call ProcessScriptsFromCurrLoc                                  ; $499a
	SCR_ResumeNextFrame
	SCR_Jump .loop

:	SCR_PlaySound SND_15|MAKE_SOUND_EFFECT
	SCR_Delay $1e
	SCR_Jump .loop


Script_Scenario12h_Stub:
	SCR_SingleUseRet


Script_Scenario13h_Stub:
	SCR_SingleUseRet

	
Script_Scenario14h_Stub:
	SCR_SingleUseRet


Script_Scenario15h_CoastingNotice:
	SCR_PlaySound SND_01|MAKE_SOUND_EFFECT
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_COASTING_NOTICE
	SCR_SingleUseRet


Script_Scenario16h_CoastingIdle:
	SCR_PlaySound SND_01|MAKE_SOUND_EFFECT
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_COASTING_IDLE

; Start coasting period
	SCR_ExecAsmBelow
	ld   a, $01                                                     ; $49b9
	ld   [w1WhenCoastingEnforcedStart2WhenAcceleratingDuring], a    ; $49bb
	call ProcessScriptsFromCurrLoc                                  ; $49be
	SCR_SingleUseRet

	
Script_Scenario17h_CoastingEnd:
	SCR_PlaySound SND_01|MAKE_SOUND_EFFECT
	SCR_StoreByteInAddr wInGameEventIdx1, EVENT_COASTING_END
	SCR_ExecAsmBelow

; Jump if coasting enforcement broken
	ld   a, [w1WhenCoastingEnforcedStart2WhenAcceleratingDuring]    ; $49c9
	cp   $01                                                        ; $49cc
	jr   nz, .cont                                                  ; $49ce

; Apply bonus points for not breaking coasting, and display text
	ld   a, IGS_TEXT_SECTION_PASSAGE                                ; $49d0
	ld   [wInGameOnSceneryTextIdx], a                               ; $49d2
	call GetTrainLineBonusPtsForCoasting                            ; $49d5
	ld   a, b                                                       ; $49d8
	ld   [wInGamePenaltiesAboutToBeAddedOrSubbed], a                ; $49d9
	call AddBtoPenaltiesAllowed                                     ; $49dc

.cont:
; Reset var
	ld   a, $00                                                     ; $49df
	ld   [w1WhenCoastingEnforcedStart2WhenAcceleratingDuring], a    ; $49e1
	call ProcessScriptsFromCurrLoc                                  ; $49e4
	SCR_SingleUseRet
	

Script_Scenario18h_NoSpeedLimit:
	SCR_ExecAsmBelow
	call HandleNoSpeedLimit                                         ; $49e9
	call ProcessScriptsFromCurrLoc                                  ; $49ec
	SCR_SingleUseRet


; For the other scenario type (misc), we set something that displays the progress
; Of our current custom speed limit
Script_Scenario19h_CabEvent:
; Ignore if our misc scenario is already set
	SCR_ExecAsmBelow
	ld   a, [wScenarioIdxForMiscellaneousScenarios]                 ; $49f1
	or   a                                                          ; $49f4
	jr   nz, .done                                                  ; $49f5

; Jump if we haven't done well enough to not encounter custom limits
	ld   a, [wIndexOfCustomSpeedLimitOrStopEv]                      ; $49f7
	or   a                                                          ; $49fa
	jr   nz, .ahead                                                 ; $49fb

.cabGetOn:
; Play sound
	push af                                                         ; $49fd
	ld   a, SND_01                                                  ; $49fe
	or   MAKE_SOUND_EFFECT                                          ; $4a00
	call PlaySound                                                  ; $4a02
	pop  af                                                         ; $4a05

; Display cab green
	ld   a, SCEN_CAB_GET_ON                                         ; $4a06
	ld   [wScenarioIdxForMiscellaneousScenarios], a                 ; $4a08
	call ProcessScriptsFromCurrLoc                                  ; $4a0b
	SCR_SingleUseRet

.ahead:
; Check current custom speed limit or stop
	ld   a, [wCustomSpeedLimitOrStopEventAddr]                      ; $4a0f
	ld   l, a                                                       ; $4a12
	ld   a, [wCustomSpeedLimitOrStopEventAddr+1]                    ; $4a13
	ld   h, a                                                       ; $4a16

	ld   a, [hl]                                                    ; $4a17
	cp   INFO_EV_DECELERATION_70KM_H                                ; $4a18
	jr   z, .speedRelated                                           ; $4a1a

	cp   INFO_EV_WARNING_25KM_H                                     ; $4a1c
	jr   z, .speedRelated                                           ; $4a1e

	cp   INFO_EV_ATTENTION_45KM_H                                   ; $4a20
	jr   z, .speedRelated                                           ; $4a22

	cp   INFO_EV_STOP_SIGNAL                                        ; $4a24
	jr   z, .stopSignal                                             ; $4a26

	jr   .cabGetOn                                                  ; $4a28

.speedRelated:
; Display cab limit
	ld   a, SCEN_CAB_LIMIT                                          ; $4a2a
	ld   [wScenarioIdxForMiscellaneousScenarios], a                 ; $4a2c
	jr   .playSound                                                 ; $4a2f

.stopSignal:
; Display cab stop
	ld   a, SCEN_CAB_STOP                                           ; $4a31
	ld   [wScenarioIdxForMiscellaneousScenarios], a                 ; $4a33

.playSound:
; Play sound in these limiting cases
	push af                                                         ; $4a36
	ld   a, SND_01                                                  ; $4a37
	or   MAKE_SOUND_EFFECT                                          ; $4a39
	call PlaySound                                                  ; $4a3b
	pop  af                                                         ; $4a3e

.done:
	call ProcessScriptsFromCurrLoc                                  ; $4a3f
	SCR_SingleUseRet


Script_Scenario1ah_CustomSpeedLimitOrStop:
; If no available custom speed limit or stop event, just display a green go signal
	SCR_ExecAsmBelow
	ld   a, [wIndexOfCustomSpeedLimitOrStopEv]                      ; $4a44
	or   a                                                          ; $4a47
	jr   z, .greenSignal                                            ; $4a48

; Set that new speed limit, or stop event
	call SetNextCustomSpeedLimitOrStopEvent                         ; $4a4a

; If the event is actually a green signal, jump and wait for it be done
	ld   a, c                                                       ; $4a4d
	cp   INFO_EV_GREEN_SIGNAL                                       ; $4a4e
	ld   de, .clearAfterDelay                                       ; $4a50
	jp   z, ProcessScriptsFromDE                                    ; $4a53

; Continue if one of the speed limit events
	cp   INFO_EV_STOP_SIGNAL                                        ; $4a56
	ld   de, .done                                                  ; $4a58
	jp   nz, ProcessScriptsFromDE                                   ; $4a5b

; Loop while speed != 0 (we're following the speed limit if we're idle)
	call ProcessScriptsFromCurrLoc                                  ; $4a5e
:	SCR_ResumeNextFrame
	
	SCR_ExecAsmBelow
	ld   a, [wInGameCurrSubSpeed]                                   ; $4a63
	ld   b, a                                                       ; $4a66
	ld   a, [wInGameCurrSpeed]                                      ; $4a67
	or   b                                                          ; $4a6a
	ld   de, :-                                                     ; $4a6b
	jp   nz, ProcessScriptsFromDE                                   ; $4a6e

.greenSignal:
; Display green signal, and clear speed limit-related stuff
	ld   c, INFO_EV_GREEN_SIGNAL                                    ; $4a71
	call ClearCustomSpeedLimitStateAndSetInfoEvent                  ; $4a73
	call ProcessScriptsFromCurrLoc                                  ; $4a76

.clearAfterDelay:
	SCR_StartSubScript2 Script_ClearInfoEventAfterADelay

.done:
	SCR_SingleUseRet


Script_Scenario1bh_CarryOnOut:
; Display carry on out signal, and clear speed limit-related stuff
	SCR_ExecAsmBelow
	ld   c, INFO_EV_CARRY_ON_OUT                                    ; $4a7f
	call ClearCustomSpeedLimitStateAndSetInfoEvent                  ; $4a81
	call ProcessScriptsFromCurrLoc                                  ; $4a84
	SCR_StartSubScript2 Script_ClearInfoEventAfterADelay
	SCR_SingleUseRet
	

Script_Scenario1ch_CarryOnField:
; Display carry on field signal, and clear speed limit-related stuff
	SCR_ExecAsmBelow
	ld   c, INFO_EV_CARRY_ON_FIELD                                  ; $4a8d
	call ClearCustomSpeedLimitStateAndSetInfoEvent                  ; $4a8f
	call ProcessScriptsFromCurrLoc                                  ; $4a92
	SCR_StartSubScript2 Script_ClearInfoEventAfterADelay
	SCR_SingleUseRet
	

Script_Scenario1eh_SpeedLimit35kmh:
	SCR_ExecAsmBelow
	ld   b, 35                                                      ; $4a9b
	ld   c, INFO_EV_SPEED_LIMIT_35KM_H                              ; $4a9d
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4a9f
	call ProcessScriptsFromCurrLoc                                  ; $4aa2
	SCR_SingleUseRet
	

Script_Scenario26h_SpeedLimit75kmh:
	SCR_ExecAsmBelow
	ld   b, 75                                                      ; $4aa7
	ld   c, INFO_EV_SPEED_LIMIT_75KM_H                              ; $4aa9
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4aab
	call ProcessScriptsFromCurrLoc                                  ; $4aae
	SCR_SingleUseRet
	

Script_Scenario25h_SpeedLimit70kmh:
	SCR_ExecAsmBelow
	ld   b, 70                                                      ; $4ab3
	ld   c, INFO_EV_SPEED_LIMIT_70KM_H                              ; $4ab5
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4ab7
	call ProcessScriptsFromCurrLoc                                  ; $4aba
	SCR_SingleUseRet
	

Script_Scenario23h_SpeedLimit60kmh:
	SCR_ExecAsmBelow
	ld   b, 60                                                      ; $4abf
	ld   c, INFO_EV_SPEED_LIMIT_60KM_H                              ; $4ac1
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4ac3
	call ProcessScriptsFromCurrLoc                                  ; $4ac6
	SCR_SingleUseRet
	

Script_Scenario22h_SpeedLimit55kmh:
	SCR_ExecAsmBelow
	ld   b, 55                                                      ; $4acb
	ld   c, INFO_EV_SPEED_LIMIT_55KM_H                              ; $4acd
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4acf
	call ProcessScriptsFromCurrLoc                                  ; $4ad2
	SCR_SingleUseRet
	

Script_Scenario1fh_SpeedLimit40kmh:
	SCR_ExecAsmBelow
	ld   b, 40                                                      ; $4ad7
	ld   c, INFO_EV_SPEED_LIMIT_40KM_H                              ; $4ad9
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4adb
	call ProcessScriptsFromCurrLoc                                  ; $4ade
	SCR_SingleUseRet
	

Script_Scenario1dh_SpeedLimit30kmh:
	SCR_ExecAsmBelow
	ld   b, 30                                                      ; $4ae3
	ld   c, INFO_EV_SPEED_LIMIT_30KM_H                              ; $4ae5
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4ae7
	call ProcessScriptsFromCurrLoc                                  ; $4aea
	SCR_SingleUseRet
	

Script_Scenario20h_SpeedLimit45kmh:
	SCR_ExecAsmBelow
	ld   b, 45                                                      ; $4aef
	ld   c, INFO_EV_SPEED_LIMIT_45KM_H                              ; $4af1
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4af3
	call ProcessScriptsFromCurrLoc                                  ; $4af6
	SCR_SingleUseRet
	

Script_Scenario21h_SpeedLimit50kmh:
	SCR_ExecAsmBelow
	ld   b, 50                                                      ; $4afb
	ld   c, INFO_EV_SPEED_LIMIT_50KM_H                              ; $4afd
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4aff
	call ProcessScriptsFromCurrLoc                                  ; $4b02
	SCR_SingleUseRet
	

Script_Scenario24h_SpeedLimit65kmh:
	SCR_ExecAsmBelow
	ld   b, 65                                                      ; $4b07
	ld   c, INFO_EV_SPEED_LIMIT_65KM_H                              ; $4b09
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4b0b
	call ProcessScriptsFromCurrLoc                                  ; $4b0e
	SCR_SingleUseRet
	

Script_Scenario27h_SpeedLimit80kmh:
	SCR_ExecAsmBelow
	ld   b, 80                                                      ; $4b13
	ld   c, INFO_EV_SPEED_LIMIT_80KM_H                              ; $4b15
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4b17
	call ProcessScriptsFromCurrLoc                                  ; $4b1a
	SCR_SingleUseRet
	

Script_Scenario28h_SpeedLimit85kmh:
	SCR_ExecAsmBelow
	ld   b, 85                                                      ; $4b1f
	ld   c, INFO_EV_SPEED_LIMIT_85KM_H                              ; $4b21
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4b23
	call ProcessScriptsFromCurrLoc                                  ; $4b26
	SCR_SingleUseRet
	

Script_Scenario29h_SpeedLimit90kmh:
	SCR_ExecAsmBelow
	ld   b, 90                                                      ; $4b2b
	ld   c, INFO_EV_SPEED_LIMIT_90KM_H                              ; $4b2d
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4b2f
	call ProcessScriptsFromCurrLoc                                  ; $4b32
	SCR_SingleUseRet
	

Script_Scenario2ah_SpeedLimit95kmh:
	SCR_ExecAsmBelow
	ld   b, 95                                                      ; $4b37
	ld   c, INFO_EV_SPEED_LIMIT_95KM_H                              ; $4b39
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4b3b
	call ProcessScriptsFromCurrLoc                                  ; $4b3e
	SCR_SingleUseRet
	

Script_Scenario2bh_SpeedLimit100kmh:
	SCR_ExecAsmBelow
	ld   b, 100                                                     ; $4b43
	ld   c, INFO_EV_SPEED_LIMIT_100KM_H                             ; $4b45
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4b47
	call ProcessScriptsFromCurrLoc                                  ; $4b4a
	SCR_SingleUseRet
	

Script_Scenario2ch_SpeedLimit105kmh:
	SCR_ExecAsmBelow
	ld   b, 105                                                     ; $4b4f
	ld   c, INFO_EV_SPEED_LIMIT_105KM_H                             ; $4b51
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4b53
	call ProcessScriptsFromCurrLoc                                  ; $4b56
	SCR_SingleUseRet
	

Script_Scenario2dh_SpeedLimit110kmh:
	SCR_ExecAsmBelow
	ld   b, 110                                                     ; $4b5b
	ld   c, INFO_EV_SPEED_LIMIT_110KM_H                             ; $4b5d
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4b5f
	call ProcessScriptsFromCurrLoc                                  ; $4b62
	SCR_SingleUseRet
	

Script_Scenario2eh_SpeedLimit115kmh:
	SCR_ExecAsmBelow
	ld   b, 115                                                     ; $4b67
	ld   c, INFO_EV_SPEED_LIMIT_115KM_H                             ; $4b69
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4b6b
	call ProcessScriptsFromCurrLoc                                  ; $4b6e
	SCR_SingleUseRet
	

Script_Scenario2fh_SpeedLimit120kmh:
	SCR_ExecAsmBelow
	ld   b, 120                                                     ; $4b73
	ld   c, INFO_EV_SPEED_LIMIT_120KM_H                             ; $4b75
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4b77
	call ProcessScriptsFromCurrLoc                                  ; $4b7a
	SCR_SingleUseRet
	

Script_Scenario30h_SpeedLimit125kmh:
	SCR_ExecAsmBelow
	ld   b, 125                                                     ; $4b7f
	ld   c, INFO_EV_SPEED_LIMIT_125KM_H                             ; $4b81
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4b83
	call ProcessScriptsFromCurrLoc                                  ; $4b86
	SCR_SingleUseRet
	

Script_Scenario31h_SpeedLimit160kmh:
	SCR_ExecAsmBelow
	ld   b, 160                                                     ; $4b8b
	ld   c, INFO_EV_SPEED_LIMIT_160KM_H                             ; $4b8d
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4b8f
	call ProcessScriptsFromCurrLoc                                  ; $4b92
	SCR_SingleUseRet
	

Script_Scenario32h_SpeedLimit210kmh:
	SCR_ExecAsmBelow
	ld   b, 210                                                     ; $4b97
	ld   c, INFO_EV_SPEED_LIMIT_210KM_H                             ; $4b99
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4b9b
	call ProcessScriptsFromCurrLoc                                  ; $4b9e
	SCR_SingleUseRet
	

Script_Scenario33h_SpeedLimit245kmh:
	SCR_ExecAsmBelow
	ld   b, 245                                                     ; $4ba3
	ld   c, INFO_EV_SPEED_LIMIT_245KM_H                             ; $4ba5
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4ba7
	call ProcessScriptsFromCurrLoc                                  ; $4baa
	SCR_SingleUseRet
	

Script_Scenario34h_ATC30kmh:
	SCR_ExecAsmBelow
	ld   b, 30                                                      ; $4baf
	ld   c, INFO_EV_ATC_30                                          ; $4bb1
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4bb3
	call ProcessScriptsFromCurrLoc                                  ; $4bb6
	SCR_SingleUseRet
	

Script_Scenario35h_ATC70kmh:
	SCR_ExecAsmBelow
	ld   b, 70                                                      ; $4bbb
	ld   c, INFO_EV_ATC_70                                          ; $4bbd
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4bbf
	call ProcessScriptsFromCurrLoc                                  ; $4bc2
	SCR_SingleUseRet
	

Script_Scenario36h_ATC110kmh:
	SCR_ExecAsmBelow
	ld   b, 110                                                     ; $4bc7
	ld   c, INFO_EV_ATC_110                                         ; $4bc9
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4bcb
	call ProcessScriptsFromCurrLoc                                  ; $4bce
	SCR_SingleUseRet
	

Script_Scenario37h_ATC160kmh:
	SCR_ExecAsmBelow
	ld   b, 160                                                     ; $4bd3
	ld   c, INFO_EV_ATC_160                                         ; $4bd5
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4bd7
	call ProcessScriptsFromCurrLoc                                  ; $4bda
	SCR_SingleUseRet
	

Script_Scenario38h_ATC210kmh:
	SCR_ExecAsmBelow
	ld   b, 210                                                     ; $4bdf
	ld   c, INFO_EV_ATC_210                                         ; $4be1
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4be3
	call ProcessScriptsFromCurrLoc                                  ; $4be6
	SCR_SingleUseRet
	

Script_Scenario39h_ATC245kmh:
	SCR_ExecAsmBelow
	ld   b, 245                                                     ; $4beb
	ld   c, INFO_EV_ATC_245                                         ; $4bed
	call SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState        ; $4bef
	call ProcessScriptsFromCurrLoc                                  ; $4bf2
	SCR_SingleUseRet
	
	
; B - value associated with event
; C - info event idx to set
SetNextSpeedReccOrATCInfoEventIdxAndSpeedLimitState:
	call HandleATCEventForTrainLineA                                ; $4bf6

; Branch based on if train line A
	ld   a, [wSelectedTrainLine]                                    ; $4bf9
	cp   $0a                                                        ; $4bfc
	jr   nz, .afterTrainLineACheck                                  ; $4bfe

; Trainline A - check values if already an active speed limit
; Else jump below to Gt (new speed limit considered less than or equal to previous)
	ld   a, [wCurrSpeedLimitState]                                  ; $4c00
	or   a                                                          ; $4c03
	jr   nz, .checkCurrEventValueAgainstPrev                        ; $4c04

.afterTrainLineACheck:
; If already an active comparison, consider as if prev val > curr value
	ld   a, [wCurrSpeedLimitState]                                  ; $4c06
	cp   $02                                                        ; $4c09
	jr   nz, .prevInfoEventValueGtCurrValue                         ; $4c0b

.checkCurrEventValueAgainstPrev:
; Branch based on if prev speed limit <= the one to set
	ld   a, [wValueAssociatedWithInfoEvent]                         ; $4c0d
	cp   b                                                          ; $4c10
	jr   z, .prevInfoEventValueLteCurrValue                         ; $4c11

	jr   nc, .prevInfoEventValueGtCurrValue                         ; $4c13

.prevInfoEventValueLteCurrValue:
	call PlayDiffSoundEffectBasedOnIfTrainLineA                     ; $4c15

	ld   a, $02                                                     ; $4c18
	ld   [wCurrSpeedLimitState], a                                  ; $4c1a
	jr   .cont                                                      ; $4c1d

.prevInfoEventValueGtCurrValue:
	ld   a, $01                                                     ; $4c1f
	ld   [wCurrSpeedLimitState], a                                  ; $4c21

.cont:
; Allow being penalized if speed limit not followed
	ld   a, $00                                                     ; $4c24
	ld   [wPenalizedForNotFollowingSpeedLimit], a                   ; $4c26

; HL = curr distance to station
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $4c29
	ld   l, a                                                       ; $4c2c
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4c2d
	ld   h, a                                                       ; $4c30

; HL = curr distance - global notice distance (last distance for scenario)
	ld   a, [wNoticeDistanceForScenarios]                           ; $4c31
	cpl                                                             ; $4c34
	ld   e, a                                                       ; $4c35
	ld   a, [wNoticeDistanceForScenarios+1]                         ; $4c36
	cpl                                                             ; $4c39
	ld   d, a                                                       ; $4c3a
	inc  de                                                         ; $4c3b
	add  hl, de                                                     ; $4c3c

; HL = last distance for scenario + distance passed trigger (exact scenario trigger)
	ld   a, [wGlobalNotifyDistancePlusDistancePassedTrigger]        ; $4c3d
	ld   e, a                                                       ; $4c40
	ld   a, [wGlobalNotifyDistancePlusDistancePassedTrigger+1]      ; $4c41
	ld   d, a                                                       ; $4c44
	add  hl, de                                                     ; $4c45

; Keep the value positive..
	bit  7, h                                                       ; $4c46
	jr   z, :+                                                      ; $4c48
	ld   hl, $0000                                                  ; $4c4a

; And store it
:	ld   a, l                                                       ; $4c4d
	ld   [wSpeedLimitScenarioTriggerDistance], a                    ; $4c4e
	ld   a, h                                                       ; $4c51
	ld   [wSpeedLimitScenarioTriggerDistance+1], a                  ; $4c52

; Set info event, and value associated with it
	ld   a, c                                                       ; $4c55
	ld   [wNextSpeedRecommendationOrATCInfoEventIdx], a             ; $4c56
	ld   a, b                                                       ; $4c59
	ld   [wValueAssociatedWithInfoEvent], a                         ; $4c5a
	ret                                                             ; $4c5d


HandleNoSpeedLimit:
; Allow being penalized if next speed limit not followed
	ld   a, $00                                                     ; $4c5e
	ld   [wPenalizedForNotFollowingSpeedLimit], a                   ; $4c60

; Clear speed limit and info event
	ld   a, $00                                                     ; $4c63
	ld   [wCurrSpeedLimitState], a                                  ; $4c65

	ld   a, INFO_EV_NONE                                            ; $4c68
	ld   [wInGameInfoEventIdx], a                                   ; $4c6a

; Play sound
	push af                                                         ; $4c6d
	ld   a, SND_01                                                  ; $4c6e
	or   MAKE_SOUND_EFFECT                                          ; $4c70
	call PlaySound                                                  ; $4c72
	pop  af                                                         ; $4c75

; Return if custom speed < standard speed limit
	call CpCustomSpeedLimitAgainstStandardSpeedLimit                ; $4c76
	ret  c                                                          ; $4c79

; If custom speed is higher, standard limit is void, apply no speed limit instead
; This code is not reached due to the called function always returning carry
	ld   a, EVENT_NO_SPEED_LIMIT                                    ; $4c7a
	ld   [wInGameEventIdx1], a                                      ; $4c7c
	ret                                                             ; $4c7f


CpCustomSpeedLimitAgainstStandardSpeedLimit:
; B = value associated with standard speed limit event, or $ff if none
	ld   a, [wValueAssociatedWithInfoEvent]                         ; $4c80
	ld   b, a                                                       ; $4c83

	ld   a, [wCurrSpeedLimitState]                                  ; $4c84
	or   a                                                          ; $4c87
	jr   nz, :+                                                     ; $4c88
	ld   b, $ff                                                     ; $4c8a

; C = value associated with custom speed limit, or $ff if none
:	ld   a, [wValueAssociatedWithCustomSpeedLimitEvent]             ; $4c8c
	ld   c, a                                                       ; $4c8f
	ld   a, [wCustomSpeedLimitOrStopState]                          ; $4c90
	or   a                                                          ; $4c93
	jr   nz, :+                                                     ; $4c94
	ld   c, $ff                                                     ; $4c96

; Compare custom speed limit against standard speed limit
; Because B = $ff due to state being cleared above, this always returns carry
:	ld   a, c                                                       ; $4c98
	cp   b                                                          ; $4c99
	ret                                                             ; $4c9a


; B - new speed limit associated value
; C - new speed limit event idx
CustomSpeedLimitCheckStateAndEndDistance:
; If no speed limit, or curr <= previous, set as if curr <= previous (no sound raising)
	ld   a, [wCustomSpeedLimitOrStopState]                          ; $4c9b
	cp   $02                                                        ; $4c9e
	jr   nz, .currLtePrev                                           ; $4ca0

; Jump if prev >= curr
	ld   a, [wValueAssociatedWithCustomSpeedLimitEvent]             ; $4ca2
	cp   b                                                          ; $4ca5
	jr   nc, .currLtePrev                                           ; $4ca6

; Else if curr > prev, play sound
	push af                                                         ; $4ca8
	ld   a, SND_01                                                  ; $4ca9
	or   MAKE_SOUND_EFFECT                                          ; $4cab
	call PlaySound                                                  ; $4cad
	pop  af                                                         ; $4cb0

; Set the relevant state
	ld   a, $02                                                     ; $4cb1
	ld   [wCustomSpeedLimitOrStopState], a                          ; $4cb3
	jr   .cont                                                      ; $4cb6

.currLtePrev:
	ld   a, $01                                                     ; $4cb8
	ld   [wCustomSpeedLimitOrStopState], a                          ; $4cba

.cont:
; Get distance from station
	ld   a, [wMeterPartOfDistanceBeforeNextStation]                 ; $4cbd
	ld   l, a                                                       ; $4cc0
	ld   a, [wMeterPartOfDistanceBeforeNextStation+1]               ; $4cc1
	ld   h, a                                                       ; $4cc4

; HL = above - notify distance
	ld   a, [wNoticeDistanceForScenarios]                           ; $4cc5
	cpl                                                             ; $4cc8
	ld   e, a                                                       ; $4cc9
	ld   a, [wNoticeDistanceForScenarios+1]                         ; $4cca
	cpl                                                             ; $4ccd
	ld   d, a                                                       ; $4cce
	inc  de                                                         ; $4ccf
	add  hl, de                                                     ; $4cd0

; Save address
	ld   a, l                                                       ; $4cd1
	ld   [wCustomSpeedTriggerDistanceMinusNotifyDistance], a        ; $4cd2
	ld   a, h                                                       ; $4cd5
	ld   [wCustomSpeedTriggerDistanceMinusNotifyDistance+1], a      ; $4cd6

; Save info event idx, and associated value
	ld   a, c                                                       ; $4cd9
	ld   [wNextCustomSpeedLimitOrStopInfoEventIdx], a               ; $4cda
	ld   a, b                                                       ; $4cdd
	ld   [wValueAssociatedWithCustomSpeedLimitEvent], a             ; $4cde
	ret                                                             ; $4ce1


; C - info event idx to set
ClearCustomSpeedLimitStateAndSetInfoEvent:
; Play sound
	push af                                                         ; $4ce2
	ld   a, SND_01                                                  ; $4ce3
	or   MAKE_SOUND_EFFECT                                          ; $4ce5
	call PlaySound                                                  ; $4ce7
	pop  af                                                         ; $4cea

; Clear state, for next custom limit, and set info event
	ld   a, $00                                                     ; $4ceb
	ld   [wCustomSpeedLimitOrStopState], a                          ; $4ced
	ld   a, c                                                       ; $4cf0
	ld   [wInGameInfoEventIdx], a                                   ; $4cf1
	ret                                                             ; $4cf4


SetNoticeDistanceForScenariosFromTrainLineAndDifficulty::
; Offset is 3*trainline + 2*difficulty
	ld   a, [wDifficultyLevel]                                      ; $4cf5
	ld   c, a                                                       ; $4cf8
	ld   a, [wSelectedTrainLine]                                    ; $4cf9
	ld   b, a                                                       ; $4cfc
	add  a                                                          ; $4cfd
	add  b                                                          ; $4cfe
	add  a                                                          ; $4cff
	add  c                                                          ; $4d00
	add  c                                                          ; $4d01
	ld   c, a                                                       ; $4d02
	ld   b, $00                                                     ; $4d03

; Get word in table and set notice distance
	ld   hl, .distances                                             ; $4d05
	add  hl, bc                                                     ; $4d08
	ld   a, [hl+]                                                   ; $4d09
	ld   [wNoticeDistanceForScenarios], a                           ; $4d0a
	ld   a, [hl]                                                    ; $4d0d
	ld   [wNoticeDistanceForScenarios+1], a                         ; $4d0e
	ret                                                             ; $4d11

.distances:
	dw 250, 220, 220
	dw 300, 250, 250
	dw 200, 200, 200
	dw 150, 150, 150
	dw 100, 100, 100
	dw 100, 100, 100
	dw 175, 175, 175
	dw 150, 150, 150
	dw 125, 100, 100
	dw 100, 100, 100
	dw 0, 0, 0


SetNextCustomSpeedLimitOrStopEvent:
; HL = address of 1 of the restrictions below this func
	ld   a, [wCustomSpeedLimitOrStopEventAddr]                      ; $4d54
	ld   l, a                                                       ; $4d57
	ld   a, [wCustomSpeedLimitOrStopEventAddr+1]                    ; $4d58
	ld   h, a                                                       ; $4d5b

; Get info event in C, if not the ending word, jump ahead
	ld   a, [hl+]                                                   ; $4d5c
	ld   c, a                                                       ; $4d5d
	cp   $ff                                                        ; $4d5e
	jr   nz, .morePossibleRestrictions                              ; $4d60

; Just provide a green signal, and clear custom speed limit-related stuff
	ld   a, $00                                                     ; $4d62
	ld   [wIndexOfCustomSpeedLimitOrStopEv], a                      ; $4d64
	ld   c, INFO_EV_GREEN_SIGNAL                                    ; $4d67
	call ClearCustomSpeedLimitStateAndSetInfoEvent                  ; $4d69
	ret                                                             ; $4d6c

.morePossibleRestrictions:
; Get value associated in B
	ld   a, [hl+]                                                   ; $4d6d
	ld   b, a                                                       ; $4d6e

; Save address of next possible restriction
	ld   a, l                                                       ; $4d6f
	ld   [wCustomSpeedLimitOrStopEventAddr], a                      ; $4d70
	ld   a, h                                                       ; $4d73
	ld   [wCustomSpeedLimitOrStopEventAddr+1], a                    ; $4d74

; Set vars for current speed limit state, and the ending distance
	call CustomSpeedLimitCheckStateAndEndDistance                   ; $4d77
	ret                                                             ; $4d7a


CustomRestrictions1::
	db INFO_EV_DECELERATION_70KM_H, 70
	dw $ffff


CustomRestrictions2::
	db INFO_EV_WARNING_25KM_H, 25
	dw $ffff


CustomRestrictions3::
	db INFO_EV_DECELERATION_70KM_H, 70
	db INFO_EV_DECELERATION_70KM_H, 70
	dw $ffff


CustomRestrictions4::
	db INFO_EV_WARNING_25KM_H, 25
	db INFO_EV_ATTENTION_45KM_H, 45
	dw $ffff


CustomRestrictions5::
	db INFO_EV_DECELERATION_70KM_H, 70
	db INFO_EV_ATTENTION_45KM_H, 45
	dw $ffff


CustomRestrictions6::
	db INFO_EV_DECELERATION_70KM_H, 70
	db INFO_EV_ATTENTION_45KM_H, 45
	db INFO_EV_STOP_SIGNAL, 45
	dw $ffff


; C - info event idx
HandleATCEventForTrainLineA:
; Return if not trainline A
	ld   a, [wSelectedTrainLine]                                    ; $4d9d
	cp   $0a                                                        ; $4da0
	ret  nz                                                         ; $4da2

; Jump based on ATC level
	ld   a, c                                                       ; $4da3
	cp   INFO_EV_ATC_245                                            ; $4da4
	jr   z, .atc245                                                 ; $4da6

	cp   INFO_EV_ATC_210                                            ; $4da8
	jr   z, .atc210                                                 ; $4daa

	cp   INFO_EV_ATC_160                                            ; $4dac
	jr   z, .atc160                                                 ; $4dae

	cp   INFO_EV_ATC_110                                            ; $4db0
	jr   z, .atc110                                                 ; $4db2

	cp   INFO_EV_ATC_70                                             ; $4db4
	jr   z, .atc70                                                  ; $4db6

	cp   INFO_EV_ATC_30                                             ; $4db8
	jp   z, .atc30                                                  ; $4dba

; Stop at next station
	ld   a, $00                                                     ; $4dbd
	ld   [wInGameTopLeftBoxATCIndicator], a                         ; $4dbf
	ret                                                             ; $4dc2

.atc245:
; Set idx for top left box display, and set speed to stay around
	ld   a, $03                                                     ; $4dc3
	ld   [wInGameTopLeftBoxATCIndicator], a                         ; $4dc5
	ld   a, 247                                                     ; $4dc8
	ld   [wATCAssociatedValuePlus2], a                              ; $4dca

; Set up so the other atc speed notifs come to us from very far away
	ld   hl, 10000                                                  ; $4dcd
	ld   a, l                                                       ; $4dd0
	ld   [wNoticeDistanceForScenarios], a                           ; $4dd1
	ld   a, h                                                       ; $4dd4
	ld   [wNoticeDistanceForScenarios+1], a                         ; $4dd5
	ret                                                             ; $4dd8

.atc210:
; For every speed here and below, play sound on atc speed changing
	ld   a, $02                                                     ; $4dd9
	ld   [wInGameTopLeftBoxATCIndicator], a                         ; $4ddb
	ld   a, 212                                                     ; $4dde
	ld   [wATCAssociatedValuePlus2], a                              ; $4de0

	push af                                                         ; $4de3
	ld   a, SND_1e                                                  ; $4de4
	or   MAKE_SOUND_EFFECT                                          ; $4de6
	call PlaySound                                                  ; $4de8
	pop  af                                                         ; $4deb
	ret                                                             ; $4dec

.atc160:
	ld   a, $04                                                     ; $4ded
	ld   [wInGameTopLeftBoxATCIndicator], a                         ; $4def
	ld   a, 162                                                     ; $4df2
	ld   [wATCAssociatedValuePlus2], a                              ; $4df4

	push af                                                         ; $4df7
	ld   a, SND_1e                                                  ; $4df8
	or   MAKE_SOUND_EFFECT                                          ; $4dfa
	call PlaySound                                                  ; $4dfc
	pop  af                                                         ; $4dff
	ret                                                             ; $4e00

.atc110:
	ld   a, $05                                                     ; $4e01
	ld   [wInGameTopLeftBoxATCIndicator], a                         ; $4e03
	ld   a, 112                                                     ; $4e06
	ld   [wATCAssociatedValuePlus2], a                              ; $4e08

	push af                                                         ; $4e0b
	ld   a, SND_1e                                                  ; $4e0c
	or   MAKE_SOUND_EFFECT                                          ; $4e0e
	call PlaySound                                                  ; $4e10
	pop  af                                                         ; $4e13
	ret                                                             ; $4e14

.atc70:
	ld   a, $06                                                     ; $4e15
	ld   [wInGameTopLeftBoxATCIndicator], a                         ; $4e17
	ld   a, 72                                                      ; $4e1a
	ld   [wATCAssociatedValuePlus2], a                              ; $4e1c

	push af                                                         ; $4e1f
	ld   a, SND_1e                                                  ; $4e20
	or   MAKE_SOUND_EFFECT                                          ; $4e22
	call PlaySound                                                  ; $4e24
	pop  af                                                         ; $4e27
	ret                                                             ; $4e28

.atc30:
	ld   a, $07                                                     ; $4e29
	ld   [wInGameTopLeftBoxATCIndicator], a                         ; $4e2b
	ld   a, 32                                                      ; $4e2e
	ld   [wATCAssociatedValuePlus2], a                              ; $4e30

	push af                                                         ; $4e33
	ld   a, SND_1e                                                  ; $4e34
	or   MAKE_SOUND_EFFECT                                          ; $4e36
	call PlaySound                                                  ; $4e38
	pop  af                                                         ; $4e3b
	ret                                                             ; $4e3c


SetSkyColorForLocation::
	ld   a, [wSelectedTrainLine]                                    ; $4e3d
	rst  JumpTableTrashDE                                           ; $4e40
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
.trainLine5:
	ld   a, [wLocationIdxInTrainLine]                               ; $4e57
	cp   $0a                                                        ; $4e5a
	jr   nc, :+                                                     ; $4e5c

	ld   a, $00                                                     ; $4e5e
	ld   [wInGameSkyColorsIdx], a                                   ; $4e60
	ret                                                             ; $4e63

:	ld   a, $03                                                     ; $4e64
	ld   [wInGameSkyColorsIdx], a                                   ; $4e66
	ret                                                             ; $4e69

.trainLine1:
.trainLine4:
	ld   a, $04                                                     ; $4e6a
	ld   [wInGameSkyColorsIdx], a                                   ; $4e6c
	ret                                                             ; $4e6f

.trainLine2:
	ld   a, $06                                                     ; $4e70
	ld   [wInGameSkyColorsIdx], a                                   ; $4e72
	ret                                                             ; $4e75

.trainLine6:
.trainLine8:
	ld   a, [wLocationIdxInTrainLine]                               ; $4e76
	cp   $07                                                        ; $4e79
	jr   nc, :+                                                     ; $4e7b

	ld   a, $07                                                     ; $4e7d
	ld   [wInGameSkyColorsIdx], a                                   ; $4e7f
	ret                                                             ; $4e82

:	ld   a, $0a                                                     ; $4e83
	ld   [wInGameSkyColorsIdx], a                                   ; $4e85
	ret                                                             ; $4e88

.trainLine7:
.trainLine9:
	ld   a, $0b                                                     ; $4e89
	ld   [wInGameSkyColorsIdx], a                                   ; $4e8b
	ret                                                             ; $4e8e

.trainLineA:
	ld   a, $04                                                     ; $4e8f
	ld   [wInGameSkyColorsIdx], a                                   ; $4e91
	ret                                                             ; $4e94


MainScript_Scenario50h_DarkenSky::
	SCR_ValInAddrPlusEquByte wInGameSkyColorsIdx, $01
	SCR_Delay $78
	SCR_ValInAddrPlusEquByte wInGameSkyColorsIdx, $01
	SCR_Delay $78
	SCR_ValInAddrPlusEquByte wInGameSkyColorsIdx, $01
	SCR_StopCurrScript
	
	
Script_ClearInfoEventAfterADelay:
	SCR_Delay $50
	SCR_StoreByteInAddr wInGameInfoEventIdx, INFO_EV_NONE
	SCR_StopSubScript2
	SCR_ResumeNextFrame


SetBaseTopLeftBoxDetails::
; Train line A uses ATC
	ld   a, [wSelectedTrainLine]                                    ; $4eae
	cp   $0a                                                        ; $4eb1
	jr   z, .trainLineA                                             ; $4eb3

; If not train line A, clear vars
	xor  a                                                          ; $4eb5
	ld   [wInGameTopLeftBoxATCIndicator], a                         ; $4eb6
	ld   [wUnusedATCRelatedVar], a                                  ; $4eb9
	ld   a, $ff                                                     ; $4ebc
	ld   [wATCAssociatedValuePlus2], a                              ; $4ebe
	ret                                                             ; $4ec1

.trainLineA:
; 210km/h indicator
	ld   a, $02                                                     ; $4ec2
	ld   [wInGameTopLeftBoxATCIndicator], a                         ; $4ec4

	ld   a, 212                                                     ; $4ec7
	ld   [wATCAssociatedValuePlus2], a                              ; $4ec9
	ret                                                             ; $4ecc


SetDestinationTimeBasedOnCurrLocation::
; HL = double train line idx into table
	ld   a, [wSelectedTrainLine]                                    ; $4ecd
	add  a                                                          ; $4ed0
	ld   e, a                                                       ; $4ed1
	ld   d, $00                                                     ; $4ed2
	ld   hl, TrainLineLocationNextStationDestTimes                  ; $4ed4
	add  hl, de                                                     ; $4ed7

; HL = word in table
	ld   a, [hl+]                                                   ; $4ed8
	ld   h, [hl]                                                    ; $4ed9
	ld   l, a                                                       ; $4eda

; Location idx is triple idx from word
	ld   a, [wLocationIdxInTrainLine]                               ; $4edb
	ld   e, a                                                       ; $4ede
	ld   d, $00                                                     ; $4edf
	add  hl, de                                                     ; $4ee1
	add  hl, de                                                     ; $4ee2
	add  hl, de                                                     ; $4ee3

; Set the dest time for the next station
	ld   a, [hl+]                                                   ; $4ee4
	ld   [wDestinationTimeHours], a                                 ; $4ee5
	ld   a, [hl+]                                                   ; $4ee8
	ld   [wDestinationTimeMinutes], a                               ; $4ee9
	ld   a, [hl+]                                                   ; $4eec
	ld   [wDestinationTimeSeconds], a                               ; $4eed
	ret                                                             ; $4ef0


SetCurrLocationsStartingCurrTime::
; HL = double idx into table
	ld   a, [wSelectedTrainLine]                                    ; $4ef1
	add  a                                                          ; $4ef4
	ld   e, a                                                       ; $4ef5
	ld   d, $00                                                     ; $4ef6
	ld   hl, .startTimeTable                                        ; $4ef8
	add  hl, de                                                     ; $4efb

; HL = word in table
	ld   a, [hl+]                                                   ; $4efc
	ld   h, [hl]                                                    ; $4efd
	ld   l, a                                                       ; $4efe

; Location idx = 5 * idx from train line offset
	ld   a, [wLocationIdxInTrainLine]                               ; $4eff
	ld   e, a                                                       ; $4f02
	ld   d, $00                                                     ; $4f03
	add  hl, de                                                     ; $4f05
	add  hl, de                                                     ; $4f06
	add  hl, de                                                     ; $4f07
	add  hl, de                                                     ; $4f08
	add  hl, de                                                     ; $4f09

; Use the normal time if not train line 2
	ld   a, [wSelectedTrainLine]                                    ; $4f0a
	cp   $02                                                        ; $4f0d
	jr   nz, .normalTime                                            ; $4f0f

; If passed at least 1 station without dying, get a special time
	ld   a, [wStartedJourneyWithoutSeeingLocationDone]              ; $4f11
	or   a                                                          ; $4f14
	jr   z, .specialCurrTime                                        ; $4f15

.normalTime:
; 1st 2 bytes reserved for special time, actual curr time in next 3 bytes
	inc  hl                                                         ; $4f17
	inc  hl                                                         ; $4f18
	ld   a, [hl+]                                                   ; $4f19
	ld   [wCurrTimeHours], a                                        ; $4f1a
	ld   a, [hl+]                                                   ; $4f1d
	ld   [wCurrTimeMinutes], a                                      ; $4f1e
	ld   a, [hl+]                                                   ; $4f21
	ld   [wCurrTimeSeconds], a                                      ; $4f22
	jr   .sub10secondsFromCurrTime                                  ; $4f25

.specialCurrTime:
; BC = word in 1st 2 bytes
	ld   a, [hl+]                                                   ; $4f27
	ld   c, a                                                       ; $4f28
	ld   b, [hl]                                                    ; $4f29

; Add that many seconds (pushed closer to dest time)
:	ld   hl, wCurrTimeSeconds                                       ; $4f2a
	call Add1SecondToTime                                           ; $4f2d
	dec  bc                                                         ; $4f30
	ld   a, b                                                       ; $4f31
	or   c                                                          ; $4f32
	jr   nz, :-                                                     ; $4f33

.sub10secondsFromCurrTime:
; Either path, finally sub 10 seconds from final result
rept 10
	ld   hl, wCurrTimeSeconds                                       ; $4f35
	call Sub1SecondToTime                                           ; $4f38
endr
	ret                                                             ; $4f71

.startTimeTable:
	dw StartingTimesTrainLine0
	dw StartingTimesTrainLine1
	dw StartingTimesTrainLine2
	dw StartingTimesTrainLine3
	dw StartingTimesTrainLine4
	dw StartingTimesTrainLine5
	dw StartingTimesTrainLine6
	dw StartingTimesTrainLine7
	dw StartingTimesTrainLine8
	dw StartingTimesTrainLine9
	dw StartingTimesTrainLineA


TrainLineLocationNextStationDestTimes:
	dw DestTimesTrainLine0
	dw DestTimesTrainLine1
	dw DestTimesTrainLine2
	dw DestTimesTrainLine3
	dw DestTimesTrainLine4
	dw DestTimesTrainLine5
	dw DestTimesTrainLine6
	dw DestTimesTrainLine7
	dw DestTimesTrainLine8
	dw DestTimesTrainLine9
	dw DestTimesTrainLineA


macro StartingTime
	dw \1
	db \2, \3, \4
endm
StartingTimesTrainLine0:
	StartingTime 0000, 05, 56, 00
	StartingTime 0000, 00, 00, 00
	StartingTime 0030, 05, 59, 35
	StartingTime 0030, 06, 01, 55
	StartingTime 0030, 00, 00, 00


DestTimesTrainLine0:
	db 05, 57, 40
	db 05, 59, 05
	db 06, 01, 25
	db 06, 02, 55
	db 06, 04, 05


StartingTimesTrainLine3:
	StartingTime 0000, 05, 56, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 05, 59, 35
	StartingTime 0030, 06, 01, 50
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 06, 04, 25
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 06, 07, 45
	StartingTime 0030, 06, 10, 35
	StartingTime 0030, 06, 14, 50
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00


DestTimesTrainLine3:
	db 05, 57, 40
	db 05, 59, 05
	db 06, 01, 20
	db 06, 02, 50
	db 06, 03, 55
	db 06, 05, 40
	db 06, 07, 15
	db 06, 10, 05
	db 06, 14, 20
	db 06, 15, 40
	db 06, 16, 10
	db 06, 17, 55
	db 06, 19, 25


StartingTimesTrainLine5:
	StartingTime 0000, 15, 56, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 16, 06, 10
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00


DestTimesTrainLine5:
	db 15, 57, 25
	db 15, 58, 40
	db 15, 59, 45
	db 16, 00, 15
	db 16, 00, 55
	db 16, 01, 25
	db 16, 02, 15
	db 16, 03, 15
	db 16, 05, 40
	db 16, 07, 00
	db 16, 07, 30
	db 16, 08, 35
	db 16, 10, 05


StartingTimesTrainLine1:
	StartingTime 0000, 09, 22, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00


DestTimesTrainLine1:
	db 09, 23, 25
	db 09, 24, 20
	db 09, 25, 10
	db 09, 26, 25
	db 09, 27, 25
	db 09, 28, 05
	db 09, 28, 50
	db 09, 30, 20


StartingTimesTrainLine4:
	StartingTime 0000, 13, 48, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00


DestTimesTrainLine4:
	db 13, 49, 20
	db 13, 50, 10
	db 13, 51, 00
	db 13, 52, 15
	db 13, 53, 15
	db 13, 53, 50
	db 13, 54, 30
	db 13, 55, 55


StartingTimesTrainLine2:
	StartingTime 0000, 15, 29, 00
	StartingTime 0030, 15, 31, 30
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 15, 35, 05
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 15, 37, 10
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00


DestTimesTrainLine2:
	db 15, 31, 00
	db 15, 32, 25
	db 15, 33, 10
	db 15, 33, 50
	db 15, 34, 35
	db 15, 36, 00
	db 15, 36, 40
	db 15, 38, 00
	db 15, 38, 45


StartingTimesTrainLine6:
	StartingTime 0000, 16, 35, 00
	StartingTime 0030, 16, 36, 30
	StartingTime 0030, 16, 38, 15
	StartingTime 0030, 16, 40, 15
	StartingTime 0030, 16, 42, 15
	StartingTime 0030, 16, 44, 45
	StartingTime 0030, 16, 46, 45
	StartingTime 0030, 16, 48, 15
	StartingTime 0030, 16, 50, 15
	StartingTime 0030, 00, 00, 00


DestTimesTrainLine6:
	db 16, 36, 00
	db 16, 37, 45
	db 16, 39, 45
	db 16, 41, 45
	db 16, 44, 15
	db 16, 46, 15
	db 16, 47, 45
	db 16, 49, 45
	db 16, 51, 45


StartingTimesTrainLine8:
	StartingTime 0000, 14, 33, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 14, 35, 40
	StartingTime 0030, 14, 37, 35
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 14, 42, 00
	StartingTime 0030, 00, 00, 00


DestTimesTrainLine8:
	db 14, 33, 45
	db 14, 34, 20
	db 14, 35, 10
	db 14, 37, 05
	db 14, 39, 15
	db 14, 39, 55
	db 14, 40, 20
	db 14, 41, 30
	db 14, 43, 25


StartingTimesTrainLine7:
	StartingTime 0000, 08, 05, 45
	StartingTime 0030, 08, 08, 15
	StartingTime 0030, 08, 10, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 08, 12, 30
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00


DestTimesTrainLine7:
	db 08, 07, 45
	db 08, 09, 30
	db 08, 11, 10
	db 08, 12, 00
	db 08, 13, 20
	db 08, 14, 15
	db 08, 15, 15


StartingTimesTrainLine9:
	StartingTime 0000, 10, 05, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 10, 18, 00
	StartingTime 0030, 10, 20, 30
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00
	StartingTime 0030, 00, 00, 00


DestTimesTrainLine9:
	db 10, 06, 15
	db 10, 06, 40
	db 10, 07, 45
	db 10, 08, 15
	db 10, 08, 55
	db 10, 09, 45
	db 10, 10, 20
	db 10, 10, 50
	db 10, 11, 40
	db 10, 12, 30
	db 10, 13, 20
	db 10, 13, 50
	db 10, 14, 55
	db 10, 15, 50
	db 10, 16, 25
	db 10, 17, 30
	db 10, 20, 00
	db 10, 21, 35
	db 10, 22, 15
	db 10, 22, 40
	db 10, 23, 05
	db 10, 23, 50
	db 10, 24, 45


StartingTimesTrainLineA:
	StartingTime 0000, 14, 15, 00


DestTimesTrainLineA:
	db 14, 20, 00


TrainLineParamsForUnlockingPhotos::
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
	db $00, $00, $01, $01
	db $00, $00, $00, $00
	db $01, $00, $00, $01
	db $01, $00, $00, $01
	db $00, $00, $00, $00
	db $01, $00, $00, $01
	
.trainLine3:
	db $00, $00, $01, $01
	db $00, $00, $00, $00
	db $02, $00, $00, $02
	db $02, $00, $00, $02
	db $00, $00, $00, $00
	db $02, $00, $00, $02
	db $00, $00, $00, $00
	db $02, $00, $00, $02
	db $02, $00, $00, $02
	db $02, $00, $00, $02
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $02, $00, $00, $02

.trainLine5:
	db $00, $00, $01, $01
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $03, $00, $03
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $03, $00, $03

.trainLine1:
	db $00, $00, $01, $01
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $03, $00, $00, $03

.trainLine4:
	db $00, $00, $01, $01
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $03, $00, $03

.trainLine2:
	db $00, $00, $01, $01
	db $01, $00, $00, $01
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $01, $00, $00, $01
	db $00, $00, $00, $00
	db $01, $00, $00, $01
	db $00, $00, $00, $00
	db $03, $00, $00, $03

.trainLine6:
	db $00, $00, $01, $01
	db $01, $00, $00, $01
	db $01, $00, $00, $01
	db $01, $00, $00, $01
	db $01, $00, $00, $01
	db $01, $00, $00, $01
	db $01, $00, $00, $01
	db $01, $00, $00, $01
	db $01, $00, $00, $01
	db $03, $00, $00, $03

.trainLine8:
	db $00, $00, $01, $01
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $03, $00, $03
	db $00, $03, $00, $03
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $03, $00, $03
	db $00, $02, $01, $03
	
.trainLine7:
	db $00, $00, $01, $01
	db $02, $00, $00, $02
	db $02, $00, $00, $02
	db $00, $00, $00, $00
	db $02, $00, $00, $02
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $02, $01, $00, $03

.trainLine9:
	db $00, $00, $01, $01
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $03, $00, $03
	db $00, $03, $00, $03
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $00, $00, $00
	db $00, $02, $01, $03
	
.trainLineA:
	db $00, $00, $01, $01
	db $00, $02, $01, $03
	
	
; 1st 3 bytes of a row above
; Last byte is a total of the 3
UnlockTrainsIn3Groups::
; --
; -- Group 1
; --
	ld   a, [wNumGroup1TrainsToUnlock]                              ; $54f9
	or   a                                                          ; $54fc
	jr   z, .checkGroup2                                            ; $54fd

	ld   b, a                                                       ; $54ff

.loopGroup1:
	push bc                                                         ; $5500

; For each train to unlock, get rng * length
	call UpdateRNG                                                  ; $5501
	ld   l, a                                                       ; $5504
	ld   h, UnlockableTrainsGroup1.end-UnlockableTrainsGroup1       ; $5505
	call HLequHtimesL                                               ; $5507

; C = random idx to start within length, loop through and choose one to unlocked
	ld   c, h                                                       ; $550a
	ld   hl, UnlockableTrainsGroup1                                 ; $550b
	ld   de, UnlockableTrainsGroup1.end                             ; $550e
	call GetANewTrainAddrInAList                                    ; $5511
	ld   [hl], $01                                                  ; $5514

	pop  bc                                                         ; $5516
	dec  b                                                          ; $5517
	jr   nz, .loopGroup1                                            ; $5518

; --
; -- Group 2
; --
.checkGroup2:
	ld   a, [wNumGroup2TrainsToUnlock]                              ; $551a
	or   a                                                          ; $551d
	jr   z, .checkGroup3                                            ; $551e

	ld   b, a                                                       ; $5520

.loopGroup2:
	push bc                                                         ; $5521

	call UpdateRNG                                                  ; $5522
	ld   l, a                                                       ; $5525
	ld   h, UnlockableTrainsGroup2.end-UnlockableTrainsGroup2       ; $5526
	call HLequHtimesL                                               ; $5528

	ld   c, h                                                       ; $552b
	ld   hl, UnlockableTrainsGroup2                                 ; $552c
	ld   de, UnlockableTrainsGroup2.end                             ; $552f
	call GetANewTrainAddrInAList                                    ; $5532
	ld   [hl], $01                                                  ; $5535

	pop  bc                                                         ; $5537
	dec  b                                                          ; $5538
	jr   nz, .loopGroup2                                            ; $5539

; --
; -- Group 3
; --
.checkGroup3:
	ld   a, [wNumGroup3TrainsToUnlock]                              ; $553b
	or   a                                                          ; $553e
	jr   z, .done                                                   ; $553f

; loop its value
	ld   b, a                                                       ; $5541

.loopGroup3:
	push bc                                                         ; $5542

	call UpdateRNG                                                  ; $5543
	ld   l, a                                                       ; $5546
	ld   h, UnlockableTrainsGroup3.end-UnlockableTrainsGroup3       ; $5547
	call HLequHtimesL                                               ; $5549

	ld   c, h                                                       ; $554c
	ld   hl, UnlockableTrainsGroup3                                 ; $554d
	ld   de, UnlockableTrainsGroup3.end                             ; $5550
	call GetANewTrainAddrInAList                                    ; $5553
	ld   [hl], $01                                                  ; $5556

	pop  bc                                                         ; $5558
	dec  b                                                          ; $5559
	jr   nz, .loopGroup3                                            ; $555a

.done:
	ret                                                             ; $555c


; C - counter until chosen an unlocked train from a list
; DE - points to the upper bound of the list
; HL - points to the lower bound of the list
GetANewTrainAddrInAList:
.loopFromLowerBound:
; Save lower bound (retrieved to loop through list repeatedly)
	ld   a, l                                                       ; $555d
	ldh  [hListOfTrainsLowerBound], a                               ; $555e
	ld   a, h                                                       ; $5560
	ldh  [hListOfTrainsLowerBound+1], a                             ; $5561

; Save upper bound (not needed)
	ld   a, e                                                       ; $5563
	ldh  [hListOfTrainsUpperBound], a                               ; $5564
	ld   a, d                                                       ; $5566
	ldh  [hListOfTrainsUpperBound+1], a                             ; $5567

.nextTrainInList:
; If train unlocked already, or C counter not at 0, keep looping
	ld   a, [hl]                                                    ; $5569
	call CheckIfTrainUnlocked_SaveUnlockAddr                        ; $556a
	jr   nz, .toNextTrainInList                                     ; $556d

	dec  c                                                          ; $556f
	jr   nz, .toNextTrainInList                                     ; $5570

; If train not unlocked, and C counter == 0, return its address in HL
	ldh  a, [hTrainUnlockedAddr]                                    ; $5572
	ld   l, a                                                       ; $5574
	ldh  a, [hTrainUnlockedAddr+1]                                  ; $5575
	ld   h, a                                                       ; $5577
	ret                                                             ; $5578

.toNextTrainInList:
; Inc lower bound until it meets the upper bound..
	inc  hl                                                         ; $5579
	ld   a, d                                                       ; $557a
	cp   h                                                          ; $557b
	jr   nz, .nextTrainInList                                       ; $557c

	ld   a, e                                                       ; $557e
	cp   l                                                          ; $557f
	jr   nz, .nextTrainInList                                       ; $5580

; Then loop again from lower bound
	ldh  a, [hListOfTrainsLowerBound]                               ; $5582
	ld   l, a                                                       ; $5584
	ldh  a, [hListOfTrainsLowerBound+1]                             ; $5585
	ld   h, a                                                       ; $5587
	jr   .loopFromLowerBound                                        ; $5588


; A - index into trains unlocked
CheckIfTrainUnlocked_SaveUnlockAddr:
; HL is trains unlocked offset by A
	push hl                                                         ; $558a
	ld   hl, wTrainsUnlocked                                        ; $558b
	add  l                                                          ; $558e
	ld   l, a                                                       ; $558f
	ld   a, h                                                       ; $5590
	adc  $00                                                        ; $5591
	ld   h, a                                                       ; $5593

; Store that address, and set Z based off if train unlocked
	ld   a, l                                                       ; $5594
	ldh  [hTrainUnlockedAddr], a                                    ; $5595
	ld   a, h                                                       ; $5597
	ldh  [hTrainUnlockedAddr+1], a                                  ; $5598
	ld   a, [hl]                                                    ; $559a
	pop  hl                                                         ; $559b
	or   a                                                          ; $559c
	ret                                                             ; $559d

	
; unused - $559e
	dw UnlockableTrainsGroup3
	dw UnlockableTrainsGroup2
	dw UnlockableTrainsGroup1


UnlockableTrainsGroup3:
	db $0b, $10, $25, $2a, $2e, $2f, $42, $44
	db $45, $48, $4c, $53, $54, $56, $57, $58
.end:


UnlockableTrainsGroup2:
	db $00, $05, $0a, $0d, $11, $19, $1f, $21
	db $22, $24, $26, $27, $2b, $2c, $2d, $34
	db $37, $38, $3f, $40, $43, $46, $47, $49
	db $4b, $4d, $50, $52, $5c, $5e, $5f, $60
	db $61
.end:


UnlockableTrainsGroup1:
	db $01, $02, $03, $04, $06, $07, $08, $09
	db $0c, $0e, $0f, $12, $13, $14, $15, $16
	db $17, $18, $1a, $1b, $1c, $1d, $1e, $20
	db $23, $28, $29, $30, $31, $32, $33, $35
	db $36, $39, $3a, $3b, $3c, $3d, $3e, $41
	db $4a, $4e, $4f, $51, $55, $59, $5a, $5b
	db $5d, $62, $63
.end:


ResetPenaltiesAllowed::
; HL = triple trainline index into table
	ld   a, [wSelectedTrainLine]                                    ; $5608
	ld   c, a                                                       ; $560b
	add  a                                                          ; $560c
	add  c                                                          ; $560d
	ld   c, a                                                       ; $560e
	ld   b, $00                                                     ; $560f
	ld   hl, .table                                                 ; $5611
	add  hl, bc                                                     ; $5614

; Offset through 3 options based on difficulty level
	ld   a, [wDifficultyLevel]                                      ; $5615
	ld   c, a                                                       ; $5618
	add  hl, bc                                                     ; $5619

; Store value in table in ram
	ld   a, [hl]                                                    ; $561a
	ld   [wPenaltiesAllowed], a                                     ; $561b
	ret                                                             ; $561e

.table:
	db 40, 30, 30
	db 40, 30, 30
	db 40, 30, 30
	db 30, 20, 20
	db 30, 20, 20
	db 30, 20, 20
	db 40, 30, 30
	db 30, 30, 20
	db 30, 20, 20
	db 30, 20, 20
	db 30, 20, 20
	

PenaltyDeductionsForOverSpeedingACustomLimit::
	db $0a, $0f, $0f
	db $0a, $0f, $0f
	db $14, $14, $14
	db $85, $8a, $8a
	db $85, $8a, $8f
	db $85, $8a, $8f
	db $0f, $14, $14
	db $85, $8a, $8a
	db $85, $8f, $8f
	db $85, $8f, $8f
	db $85, $8a, $8f


PenaltyPointsForIgnoringSpeedSigns::
	db 05, 10, 10
	db 10, 10, 10
	db 10, 10, 10
	db 10, 15, 15
	db 10, 15, 15
	db 10, 15, 15
	db 10, 10, 10
	db 10, 15, 15
	db 10, 15, 15
	db 10, 15, 15
	db 10, 15, 15


PenaltyPtsForSuddenBraking::
	db 05, 05, 05
	db 05, 05, 05
	db 10, 10, 10
	db 10, 10, 10
	db 10, 15, 15
	db 10, 15, 15
	db 10, 10, 10
	db 10, 10, 10
	db 10, 15, 15
	db 10, 15, 15
	db 10, 15, 15


PenaltyPtsForNotSireningWhenPrompted::
	db 03, 05, 05
	db 05, 05, 05
	db 05, 05, 05
	db 10, 10, 10
	db 10, 10, 10
	db 10, 10, 10
	db 05, 05, 05
	db 10, 10, 10
	db 10, 10, 10
	db 10, 10, 10
	db 10, 10, 10


BonusPenaltiesForGoodFinish::
	db $05, $05, $05
	db $03, $03, $03
	db $03, $03, $03
	db $03, $03, $03
	db $02, $01, $01
	db $02, $01, $01
	db $03, $03, $03
	db $03, $03, $03
	db $02, $01, $01
	db $02, $01, $01
	db $02, $01, $01


BonusPenaltiesForGreatFinish::
	db $0a, $07, $07
	db $05, $05, $05
	db $05, $05, $05
	db $05, $05, $05
	db $03, $03, $03
	db $03, $03, $03
	db $05, $05, $05
	db $05, $05, $05
	db $03, $03, $03
	db $03, $03, $03
	db $03, $03, $03


PenaltiesForNotFollowingCabRules::
	db 01, 02, 02
	db 02, 02, 05
	db 05, 05, 05
	db 10, 10, 10
	db 10, 10, 10
	db 10, 10, 10
	db 05, 05, 05
	db 10, 10, 10
	db 10, 10, 10
	db 10, 10, 10
	db 10, 10, 10


CoastingFollowedBonusPts::
	db $00, $05, $00, $00
	db $02, $00, $00, $03
	db $00, $02, $02


SirenBonusPenalties::
	db $05, $03, $02, $02
	db $02, $02, $03, $02
	db $02, $02, $02


AdditionalPenaltiesAllowedOnRegularCommunication::
	db $07, $05, $05, $03
	db $03, $03, $00, $03
	db $03, $03, $03


StopPosAccelDeductionMultiplierMinus1::
	db $00, $00, $01, $01
	db $01, $01, $01, $01
	db $01, $01, $01


PenaltiesDeductedPerSecondPassedDestTime::
	db $01, $02, $01, $02
	db $02, $02, $01, $02
	db $02, $02, $02


StationStructureDeductionPts::
	db 10, 10, 10, 10
	db 15, 15, 10, 10
	db 15, 15, 15


TrainLineAllowableSpeedOffsetsOverLimit::
	db $05, $05, $05, $05
	db $03, $03, $05, $05
	db $03, $03, $03


AcceptableDistancesBeforeStationStop::
	db $03, $02, $02
	db $02, $02, $02
	db $01, $01, $01
	db $01, $01, $01
	db $01, $01, $01
	db $01, $01, $01
	db $01, $01, $01
	db $01, $01, $01
	db $01, $01, $01
	db $01, $01, $01
	db $01, $01, $01
