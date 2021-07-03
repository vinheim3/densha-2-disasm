INCLUDE "includes.s"

SECTION "WRAM", WRAM0[$c000]

wc000:
    ds $25

wPreviousFramesNextOamOffset:: ; $c025
    db

wNumScripts:: ; $c026
    db

wNumScriptsCounter:: ; $c027
    db

wc028:
    db

wIdxOfSoundChannelBeingUpdated:: ; $c029
    db

wLowByteOfCurrSoundChannelHWRegLastMinus4:: ; $c02a
    db

; 0-$1f -> +1 -> *4 -> 4-$80
wCurrSoundByteLengthVal:: ; $c02b
    db

wCurrSoundByteChosenEnvelope:: ; $c02c
    db

wCounterForFadingAudVol:: ; $c02d
    db

wAudVol:: ; $c02e
    db

wAudTermMask:: ; $c02f
    db

wAudioGeneralVarsScratchSpace:: ; $c030
; Music general vars - $c030-$c035
wSongSpeed:: ; $c030
    db

wNoiseDividingRatioOfFreqs:: ; $c031
    db

wFadingAudVol:: ; $c032
    db

wBuiltUpAudTermMask:: ; $c033
    db

wValueToAddToFadingVol:: ; $c034
    db

wAud1Sweep:: ; $c035
    db

; Sound effect general vars - $c036-$c03b
; Temp space - $c03c-$c041
wAudioGeneralVarsScratchSpaceCont: ; $c036
    ds 6 * 2

wMainMusicPreservedAud1Len:: ; $c042
    db

wMainMusicPreservedAud2Len:: ; $c043
    db

wc044:
    ds $825-$44

wMainLoopCounter:: ; $c825
    db

wGameState:: ; $c826
    db

wRomBank:: ; $c827
    db

wButtonsHeld:: ; $c828
    db

wPrevButtonsHeld:: ; $c829
    db

wStickyButtonsHeld:: ; $c82a
    db

wStickyButtonCounter:: ; $c82b
    db

wButtonsPressed:: ; $c82c
    db

wInGameButtonsPressed:: ; $c82d
    db

wDemoNextButtonsPressed:: ; $c82e
    db

wMainLoopCanContinue:: ; $c82f
    db

wRequestedVBlankFinished:: ; $c830
    db

wPreservedIE:: ; $c831
    db

wVBlankInterruptFunc:: ; $c832
    dw

wLCDCInterruptFunc:: ; $c834
    dw

wBGPaletteBank:: ; $c836
    db

wBGPaletteAddr:: ; $c837
    dw

wOBJPaletteBank:: ; $c839
    db

wOBJPaletteAddr:: ; $c83a
    dw

wPaletteFadeAmount:: ; $c83c
    db

wLoadPalettesFromRam:: ; $c83d
    db

wBitsSetPerBGPaletteFade:: ; $c83e
    db

wBitsSetPerOBJPaletteFade:: ; $c83f
    db

wLoadBGPalettesFromRom:: ; $c840
    db

wLoadOBJPalettesFromRom:: ; $c841
    db

wc842:
    ds 3-2

wSCX:: ; $c843
    db

wSCY:: ; $c844
    db

wWX:: ; $c845
    db

wWY:: ; $c846
    db

wRNGVar1:: ; $c847
    db

wRNGVar2:: ; $c848
    db

wBGPalettes:: ; $c849
    ds NUM_PALETTE_BYTES

wOBJPalettes:: ; $c889
    ds NUM_PALETTE_BYTES

wc8c9:
    ds $f-9

wInGameTopLeftBoxNextStationIndicator:: ; $c8cf
    db

; 0 - stop at next station, 1 - pass next station, 2+ ATC
wInGameTopLeftBoxATCIndicator:: ; $c8d0
    db

wUnusedATCRelatedVar:: ; $c8d1
    db

wATCAssociatedValuePlus2:: ; $c8d2
    db

wCreditsScreenTopSCX:: ; $c8d3
    db

wCreditsScreenBottomSCX:: ; $c8d4
    db

wc8d5:
    ds 7-5

wTotalGoodCommsBonusPenaltiesAllowedSinceDepartureOrContinue:: ; $c8d7
    db

wc8d8:
    ds $e25-$8d8

wSerialIntHandlerEnabled:: ; $ce25
    db

wPrinterCurrTileDataFragmentIdxToLoad:: ; $ce26
    db

wPrinterNumTileDataFragmentsForCurrImage:: ; $ce27
    db

wPrinterTileDataSourceBank:: ; $ce28
    db

wPrinterTileDataSourceAddr:: ; $ce29
    dw

wPrintGameStateSubState:: ; $ce2b
    db

wNextPrintGameStateSubState:: ; $ce2c
    db

wPrinterNintendoErrorMinus1:: ; $ce2d
    db

wSerialByteFromPrinterAfter0sSentOver:: ; $ce2e
    db

wce2f:
    ds $37-$2f

wPrinterUnusedTable1:: ; $ce37
    ds 18

wPrinterUnusedTable2:: ; $ce49
    ds 9

wPrintUnusedVar_ce52:: ; $ce52
    db

wWaitCounterBeforeExitingPrinterSubState7:: ; $ce53
    db

wPrinterPrintCommandExposure:: ; $ce54
    db

wPrinterPrintCommandNumSheets:: ; $ce55
    db

wPrinterPrintCommandMargins:: ; $ce56
    db

wPrinterPrintPalette:: ; $ce57
    db

wGlobalPrinterDataCompressionApplied:: ; $ce58
    db

wPrinterDataCompressionApplied:: ; $ce59
    db

; 0 - null state, 1 - packet sent w/o errors
; 1-6 - wPrinterPacketStructTypeIdx
; 7 - packet just finished sending over
wImagePrintingFlowStateIdx:: ; $ce5a
    db

wPacketStructIdxAfter0sSentOver:: ; $ce5b
    db

wPrinterMagicBytesSent:: ; $ce5c
    db

wPrinterPacketFullySentOnce:: ; $ce5d
    db

wPrinterPacketFullySentTwice:: ; $ce5e
    db

wPrinterNumChecksumBytesSent:: ; $ce5f
    db

wPrinterFinalOffsetForPacketBytesBeingSent:: ; $ce60
    dw

wSavedPrinterPacketDataLength:: ; $ce62
    dw

wUpdatedPrinterPacketDataLength:: ; $ce64
    dw

wPrinterPacketOffsetToSendNext:: ; $ce66
    dw

wPrinterPacketBytesSourceAddr:: ; $ce68
    dw

wSavedPrinterPacketSourceAddr:: ; $ce6a
    dw

wUpdatedPrinterPacketDataSourceAddr:: ; $ce6c
    dw

wUnusedTileDataFragmentAddr:: ; $ce6e
    dw

wPrinterPacketChecksum:: ; $ce70
    dw

; 1 - packet fully sent over, 2 - 0s sent over, 3 - after 2
wPrintPacketTransferProgress:: ; $ce72
    db

wPrinterNumEnding0sSent:: ; $ce73
    db

wSerialByteReceivedFromPrinter:: ; $ce74
    db

wPrinterStatusResponseSB:: ; $ce75
    db

wPrinterNonStatusResponseSB:: ; $ce76
    db

wHandlingInterruptWhenPrinterTransferredUsAPacket:: ; $ce77
    db

; 1 - init, 2 - print, 3 - empty data
; 4 - unknown, 5 - status, 6 - actual data
wPrinterPacketStructTypeIdx:: ; $ce78
    db

wPrinterStreamTypePacket:: ; $ce79
    db

wPrinterPacketStruct:: ; $ce7a
wPrinterPacketStructCommand:: ; $ce7a
    db

wPrinterPacketStructCompression:: ; $ce7b
    db

wPrinterPacketStructDataLength:: ; $ce7c
    dw

wPrinterPacketStructActualData:: ; $ce7e - unknown size
wPrinterPacketStruct_PrintNumSheets:: ; $ce7e
    db

wPrinterPacketStruct_PrintMargins:: ; $ce7f
    db

wPrinterPacketStruct_PrintPalette:: ; $ce80
    db

wPrinterPacketStruct_PrintExposure:: ; $ce81
    db

wPrinterPacketStruct_PrintChecksum:: ; $ce82
    dw

wPrinterPacketStruct_PrintKeepAlive:: ; $ce84
    db

wPrinterPacketStruct_PrintCurrStatus:: ; $ce85
    db

wce86:
    ds 8-6

wPrinterPacketTransferProcessInProgress:: ; $ce88
    db

wPrinterErrorByteReceived:: ; $ce89
    db

wPrinterTileDataAllLoaded:: ; $ce8a
    db

wPrinterUnusedTablesIdx:: ; $ce8b
    db

wce8c:
    ds $d-$c

wPrinterPrintCommandWaitCounter:: ; $ce8d
    db

wPrinterUnusedVar_ce8e:: ; $ce8d
    db

wIsCurrentlyPrinting:: ; $ce8f
    db

wce90:
    ds $f26-$e90

wVolumeModulatedLoopValue:: ; $cf26
    db

wMoreStationsToSkip:: ; $cf27
    db

wPrevMoreStationsToSkip:: ; $cf28
    db

wInGameVBlankIntFuncEnabled:: ; $cf29
    db

wInGameLeftHalfTileDataLowBank:: ; $cf2a
    db

wcf2b:
    ds $c-$b

wInGameLeftHalfTileDataAddr:: ; $cf2c
    dw

wInGameRightHalfTileDataLowBank:: ; $cf2e
    db

wcf2f:
    ds $30-$2f

wInGameRightHalfTileDataAddr:: ; $cf30
    dw

wcf32:
    ds 6-2

wInGameBGAnimIdxWithinSection:: ; $cf36
    db

wReverseCounterToCheckDistanceTraversed:: ; $cf37
    dw

wInGameBGSectionWithinLocation:: ; $cf39
    dw

wTrainRailsAnimIdx:: ; $cf3b
    db

wNextTrainRailsShape:: ; $cf3c
    db

wTrainRailsAnimateCounter:: ; $cf3d
    db

wTrainRailsShouldAnimate:: ; $cf3e
    db

wInGameCurrSpeedTileIdxes:: ; $cf3f
    ds 3 ; bcd

wUnusedVars_cf42:: ; $cf42
    ds 3

wInGamePenaltiesTileIdxes:: ; $cf45
    ds 6

wInGameCurrTimeTileIdxes:: ; $cf4b
    ds 6

wcf51:
    ds 2-1

wInGameDistanceLeftTileIdxes:: ; $cf52
    ds 6

wcf58:
    ds $c-8

wTileDataSrcForBrakeAndAccelLevel:: ; $cf5c
    dw
wAccelLevelTileIdxes:: ; $cf5e
    dw
wBrakeLevelTileIdxes:: ; $cf60
    dw

wShouldUpdateAccelLeverTileData:: ; $cf62
    db

w2HandAccelTileDataSource:: ; $cf63
    dw

wShouldUpdateBrakeLeverTileData:: ; $cf65
    db

w2HandBrakeAppliedTileDataSource:: ; $cf66
    dw

w1HandBrakeReleaseTileDataSource:: ; $cf68
    dw

wInGameOnSceneryTextIdx:: ; $cf6a
    db

wInGamePenaltiesAboutToBeAddedOrSubbed:: ; $cf6b
    db

wInGameEventIdx1:: ; $cf6c
    db

wInGameEventIdx2:: ; $cf6d
    db

wcf6e:
    ds $f-$e

wShouldUpdateInGameSceneryTileData:: ; $cf6f
    db

wcf70:
    ds 1-0

wBaseAddrForTrainLineLocationsMetaFrameIdxes:: ; $cf71
    dw

wCurrAddrForTrainLineLocationsSpeedLimitAndStopScenarios:: ; $cf73
    dw

wCurrAddrForTrainLineLocationsMiscScenarios:: ; $cf75
    dw

wTrainLinesAddrForItsMetaFrameIdxes:: ; $cf77
    dw

wTrainRailsShape:: ; $cf79
    db

wSkyColorToApplyNextLY:: ; $cf7a
    dw

wAddressOfNextSkyColorWordToUse:: ; $cf7c
    dw

wInGameIsPaused:: ; $cf7e
    db

wInGamePauseOptSelected:: ; $cf7f
    db

wAppliedExtremeBraking:: ; $cf80
    db

; If loading a hi-col screen, this is set to 1 after all tile data is loaded
wShouldUpdateHiColBGPalettes:: ; $cf81
    db

wNumStationsLeftToSkip:: ; $cf82
    db

wcf83:
    ds 4-3

w1WhenCoastingEnforcedStart2WhenAcceleratingDuring:: ; $cf84
    db

wTrainImage1stSelectedIdx:: ; $cf85
    db

wTrainImageUsesScreen1:: ; $cf86
    db

; 0 - title screen opts, 1 - its train sub menu, 2 - its movie sub menu
wPictureBookPrevScreen:: ; $cf87
    db

wPrintTrainImageThinness:: ; $cf88
    db

; 0/1 - Checking connection
; 2 - Data transfer in progress
; 3 - Printing out
; 4-7 - Print error 1-4
wPrintTrainImageTextIdx:: ; $cf89
    db

wPrinterChosenExposureValue:: ; $cf8a
    db

wNumTrainsUnlockedForPhotoGet:: ; $cf8b
    db

wTrainLineIdxToResumeToAfterContinue:: ; $cf8c
    db

wInGameRightMetaSection:: ; $cf8d
    db

wNoticeDistanceForScenarios:: ; $cf8e
    dw

wcf90:
    ds 2-0

wGlobalNotifyDistancePlusDistancePassedTrigger:: ; $cf92
    dw

wPenalizedForNotFollowingSpeedLimit:: ; $cf94
    db

; 0 - no active custom speed limit
; 1 - curr speed is less than or equal to previous
; 2 - curr speed is greater than previous
wCustomSpeedLimitOrStopState:: ; $cf95
    db

wCustomSpeedTriggerDistanceMinusNotifyDistance:: ; $cf96
    dw

wNextCustomSpeedLimitOrStopInfoEventIdx:: ; $cf98
    db

wValueAssociatedWithCustomSpeedLimitEvent:: ; $cf99
    db

wcf9a:
    ds $b-$a

; 0 - no active speed limits
; 1 - curr speed limit is lower or equal to previous
; 2 - curr speed limit is higher than previous
wCurrSpeedLimitState:: ; $cf9b
    db

wSpeedLimitScenarioTriggerDistance:: ; $cf9c
    dw

wNextSpeedRecommendationOrATCInfoEventIdx:: ; $cf9e
    db

wValueAssociatedWithInfoEvent:: ; $cf9f
    db

wcfa0:
    ds 1-0

wUnlockTrainLocationIdxInTrainLine:: ; $cfa1
    db

wNumGroup1TrainsToUnlock:: ; $cfa2
    db

wNumGroup2TrainsToUnlock:: ; $cfa3
    db

wNumGroup3TrainsToUnlock:: ; $cfa4
    db

wNumTrainsUnlockedSinceDeparture:: ; $cfa5
    db

wJustUnlockedStageCompleteSceneIdx:: ; $cfa6
    db

wInGameSkyColorsIdx:: ; $cfa7
    db

wInGameFinishedInAreaApproachingLastStation:: ; $cfa8
    db

SECTION "WRAM Bank 1", WRAMX[$d000], BANK[$1]

wOam:: ; $d000
    ds OAM_SIZEOF * NUM_SPRITES

w1_d0a0:
    ds $f0-$a0

wUnusedVar_d0f0:: ; $d0f0
    db

wInGameCurrSubSpeed:: ; $d0f1
    db

wInGameCurrSpeed:: ; $d0f2
    db

wPenaltiesAllowed:: ; $d0f3
    db

wBrakeAppliedIdx:: ; $d0f4
    db

; 0-5
wAccelerationIdx:: ; $d0f5
    db

; Grows when going left (releasing brake) and accelerating
wBrakeReleaseIdx:: ; $d0f6
    db

wMeterPartOfDistanceBeforeNextStation:: ; $d0f7
    dw

wCentimeterPartOfDistanceBeforeNextStation:: ; $d0f9
    db

wBCDFormOfDistanceToNextStation:: ; $d0fa
    ds 3

wUnusedMillimeters:: ; $d0fd
    db

wCurrTimeSeconds:: ; $d0fe
    db

wCurrTimeMinutes:: ; $d0ff
    db

wCurrTimeHours:: ; $d100
    db

wDestinationTimeSeconds:: ; $d101
    db

wDestinationTimeMinutes:: ; $d102
    db

wDestinationTimeHours:: ; $d103
    db

wInGamePassedDestTime:: ; $d104
    db

wSlopeSpeedIncrease:: ; $d105
    dw

wScenarioIdxForMiscellaneousScenarios:: ; $d107
    db

wScenarioIdxForSpeedLimitAndATCScenarios:: ; $d108
    db

wPrevSpeedLimitOrATCScenarioIdx:: ; $d109
    db

wShouldChangeToTrainLineAOnRouteDisplay:: ; $d10a
    db

wInGameInfoEventIdx:: ; $d10b
    db

wSavedMiscellaneousScenarioIdx:: ; $d10c
    db

wCounterToCheckIfAnimatingScenery:: ; $d10d
    dw

wInGameFrameCounter:: ; $d10f
    db

wSecondHasPassed:: ; $d110
    db

wLocationIdxInTrainLine:: ; $d111
    db

w1IfIgnoredATSOp2IfIgnoredSignal:: ; $d112
    db

wSelectedTrainLine:: ; $d113
    db

w1_d114:
    ds $f-4

wApproachingNextStationToStopAt:: ; $d11f
    db

wFinishedInGame:: ; $d120
    db

wFinishedInGameCurrSeconds:: ; $d121
    db

wFinishedInGameCurrMinutes:: ; $d122
    db

wFinishedInGameCurrHours:: ; $d123
    db

wGreatFinishStreak:: ; $d124
    db

wTitleScreenDemoStep:: ; $d125
    db

; Set to 1 in departure info, and continue screen
wStartedJourneyWithoutSeeingLocationDone:: ; $d126
    db

wIndexOfCustomSpeedLimitOrStopEv:: ; $d127
    db

wTotalTimeAheadOfStoppingStationsSinceDepartureOrContinue:: ; $d128
    db

wCustomSpeedLimitOrStopEventAddr:: ; $d129
    dw

wPenalizedForSuddenBraking:: ; $d12b
    db

wDontHandleInGameInput:: ; $d12c
    db

wCounterToPressSirenForBonusPts:: ; $d12d
    db

wCounterToPressSirenBeforeBeingPenalized:: ; $d12e
    db

wCanStartProcessingInGameEvents:: ; $d12f
    db

wCompletedTrainLine:: ; $d130
    db

w1_d131:
    ds 2-1

wCounterToCheckSpeedRegion:: ; $d132
    db

wUnchangedVarSetTo0_d133:: ; $d133
    db

w1_d134:
    ds 5-4

wNotMovingCounter:: ; $d135
    dw

wCounterForBrakingAtNonLowSpeeds:: ; $d137
    db

wIsDemo:: ; $d138
    db

wDemoFrameCounter:: ; $d139
    dw

w1_d13b:
    ds $c-$b

wLocationDoneTrainSCX:: ; $d13c
    dw

wPoorStationStructureAcceleration:: ; $d13e
    db

wUnusedVar_d13f:: ; $d13f
    db

wTotalTrainLineLocationDeductions:: ; $d140
    dw

wLocationDonePenaltiesMinusTotalDeductions:: ; $d142
    db

wCurrAddressOfRecordedDistances:: ; $d143
    dw

wEndAddressOfRecordedDistances:: ; $d145
    dw

wDiamondAccuracyScore:: ; $d147
    db

wBrakeComfortScore:: ; $d148
    db

wStopPosAccuracyScore:: ; $d149
    db

wSafetyConsiderationScore:: ; $d14a
    db

wTrafficLightsSignsScore:: ; $d14b
    db

wDiamondAccuracyRank:: ; $d14c
    db

wStopPosAccuracyRank:: ; $d14d
    db

wBrakeComfortRank:: ; $d14e
    db

wSafetyConsiderationRank:: ; $d14f
    db

wTrafficLightsSignsRank:: ; $d150
    db

wDiamondAccuracyTrains:: ; $d151
    db

wStopPosAccuracyTrains:: ; $d152
    db

wBrakeComfortTrains:: ; $d153
    db

wSafetyConsiderationTrains:: ; $d154
    db

wTrafficLightsSignsTrains:: ; $d155
    db

wTotalScore:: ; $d156
    db

wScoringHundredsDigit:: ; $d157
    db

wScoringTensDigit:: ; $d158
    db

wScoringUnitsDigit:: ; $d159
    db

wScoringShuffleNum:: ; $d15a
    db

wInGameDistanceCounter:: ; $d15b
    dw

wDiffOfCurrAndDestTime:: ; $d15d
    db

wSmallCounterPenaltyForUnsafeBrakingOrPoorStationAccel:: ; $d15e
    db

; Bollard clash, extreme braking, sudden braking, or automatic stop (dest+50M)
wLargerCounterPenaltyForVeryUnsafeBrakingOrStops:: ; $d15f
    db

wPenaltyCounterForGoingNeutralFromHighBraking:: ; $d160
    db

wBaseStopPosPenaltyScore:: ; $d161
    db

wSafetyConsiderationPenaltyFromFarStopPos:: ; $d162
    db

wPenaltyCounterForNotDeceleratingWhenNeeded:: ; $d163
    db

wPenaltyCounterForNotFollowingSpeedLimit:: ; $d164
    db

wPenaltyValueForOverspeeding:: ; $d165
    db

wSmallPenaltyForDisengagingBrakeBeforeStartingGoSignal:: ; $d166
    db

wPenaltyCounterForAcceleratingBeforeStartingGoSignal:: ; $d167
    db

wNumContinuesForLocation:: ; $d168
    db

wScoringMaxScoreForCategories:: ; $d169
    db

wUnusedPenaltyCounterForNotSireningWhenPrompted:: ; $d16a
    db

wUnusedPenaltyValueForBollardClash:: ; $d16b
    db

wOverSped:: ; $d16c
    db

wCurrTrainLineOverspeedingSpeed:: ; $d16d
    db

wReleasedBrakeBeforeStartingGoSignal:: ; $d16e
    db

wUnusedVars_d16f:: ; $d16f
    ds 3

wContinueScreenHighNybSetForTimeOutTextLowNybIsBottomTextMinus1:: ; $d172
    db

wContinueScreenTopText1Idx:: ; $d173
    db

wContinueScreenBottomHalf1Idx:: ; $d174
    db

wContinueScreenCountdown1Idx:: ; $d175
    db

wRankingIdxForCurrentTrainLine:: ; $d176
    db

wSaveDataStart:: ; $d177
wControlSchemeIs1Handed:: ; $d177
    db

wDifficultyLevel:: ; $d178
    db

; 0 - average, 1 - hidden
wSpeedMeterOption:: ; $d179
    db

; 0 - m, 1 - cm, 2 - hidden
wDistanceMeterOption:: ; $d17a
    db

wTrainlineRankings:: ; $d17b
    ds 8 * 7 * 7

; Flags set when distance from station is 0 or 1
wTrainLineLocationsComplete:: ; $d303
    ds NUM_TRAINLINES * MAX_LOCATIONS_IN_A_TRAINLINE

w1_d416:
    ds 7-6

wTrainsUnlocked:: ; $d417
    ds NUM_TRAINS

wMoviesUnlocked:: ; $d47b
    ds NUM_MOVIES
wSaveDataEnd:: ; $d487

wGodModeApplied:: ; $d487
    db

wPrinterTileDataFragmentToSend:: ; $d488
    ds $280
.end::

union

wPictureBookSubMenuOptionIdx:: ; $d708
    db

nextu

wPictureBookTrainTopItemIdxMinus1:: ; $d708
    db

wPictureBookTrainIdxWithinScreen:: ; $d709
    db

endu

wScrollingTextIdxOfByteWithinText:: ; $d70a
    db

wScrollingTextLengthPlusInitialBlackCols:: ; $d70b
    db

wScrollingText_DoubleSCX:: ; $d70c
    dw

wScrollingText_SCX:: ; $d70e
    db

wNonScrollingText_PreservedSCX:: ; $d70f
    db

wVBlankQueue_PointerToCallersAddr:: ; $d710
    dw

wPreservedVBlankFuncForVBlankQueueFunc:: ; $d712
    dw

wPointerToVBlankQueue:: ; $d714
    dw

w1_d716:
    ds $806-$716

wVBlankQueueTop:: ; $d806
    db ; unknown size, from $716-$806

w1_d807:
    ds $c00-$807

union

wGameSetupCurrSelectedCategory:: ; $dc00
    db

nextu

wPictureBookMenuIsMoving:: ; $dc00
    db

wPictureBookLogoPaletteIsChanging:: ; $dc01
    db

wPictureBookSCXForRightTable:: ; $dc02
    db

wPictureBookNextSCXForRightTable:: ; $dc03
    db

wPictureBook_unused_dc04:
    ds 6

wPictureBookLogoTileDataBank:: ; $dc0a
    db

wPictureBookLogoTileDataAddr:: ; $dc0b
    dw

nextu

wCreditsScrollCounter:: ; $dc00
    dw

wCreditsSpriteImageIdx:: ; $dc02
    db

wCreditsStartPressed:: ; $dc03
    db

wCreditsLoadingNewSpriteTileData:: ; $dc04
    db

nextu

wStageCompleteSceneIdx:: ; $dc00
    db

wStageCompleteTileDataBank:: ; $dc01
    db

wStageCompleteTileDataAddr:: ; $dc02
    dw

nextu

wCongratsFrameSCY:: ; $dc00
    db

wCongratsSCY:: ; $dc01
    db

nextu

wTrainLineSelectionTrainRelatedTileDataLoaded:: ; $dc00
    db

wTrainLineSelectionSelectedTrain:: ; $dc01
    db

wTrainLineSelectionLeftRightArrowAnimIdx:: ; $dc02
    db

nextu

wPreInGameGraphicHiColPalettesBank:: ; $dc00
    db

wPreInGameGraphicHiColPalettesAddr:: ; $dc01
    dw

; 0 - actual palettes, 3 - close to black
wPreInGameGraphicHiColIdxForFade:: ; $dc03
    db

nextu

wDepartureInfoLeavingSCXinHighByte:: ; $dc00
    dw

wDepartureInfoScrolledIn:: ; $dc02
    db

nextu

wRouteDisplayNextBottomBoxSCX:: ; $dc00
    dw

wRouteDisplayBottomBoxSCX:: ; $dc02
    db

wRouteDisplayMaxSCX:: ; $dc03
    dw

wRouteDisplayLocationsComplete:: ; $dc05
    ds $19

nextu

wPhotoGetPointerToAddrWithLeftDigitTileIdxes:: ; $dc00
    dw

wPhotoGetPointerToAddrWithRightDigitTileIdxes:: ; $dc02
    dw

nextu

wPicBookCompleteMainFunc:: ; $dc00
    dw

wPicBook_unused:
    ds $b

    union

    wPictureBookNumberBoxTileMap:: ; $dc0d
        ds $10

    wPictureBookNumberBoxTileAttr:: ; $dc1d
        ds $10
    .end::

    nextu

    wPictureBookTrainImageCountAreaTileMap:: ; $dc0d
        ds 7

    wPictureBookTrainImageCountAreaTileAttr:: ; $dc14
        ds 7
    .end::

    endu

wPictureBookSubMenuTileMap:: ; $dc2d
    ds $0c * $0b ; rows * cols

wPictureBookSubMenuTileAttr:: ; $dcb1
    ds $0c * $0b ; rows * cols


nextu

wCutscene_unused_dc00:: ; $dc00
    dw

wCutscene_unused_dc02:
    ds 2

wCutsceneHiColBGPaletteLowRomBank:: ; $dc04
    db

wCutsceneHiColBGPaletteAddr:: ; $dc05
    dw

; When $ff, data is already loaded
wCutsceneHiColIdxToLoad:: ; $dc07
    db

wCutsceneHiColIdx:: ; $dc08
    db

wCutsceneHiColFrameStep:: ; $dc09
    db

wIntroCutsceneDataLoadStep:: ; $dc0a
    db

wIntroCutsceneAnimationEngineType:: ; $dc0b
    db

wCutsceneHiColTileDataVramBank:: ; $dc0c
    db

nextu

wScrollingText_unused_dc00:
    ds 4

wScrollingTextTileIdxTop:: ; $dc04
    db

wScrollingTextTileAttrTop:: ; $dc05
    db

wScrollingTextTileIdxBottom:: ; $dc06
    db

wScrollingTextTileAttrBottom:: ; $dc07
    db

wScrollingTextVramDestForTile:: ; $dc08
    dw

nextu

wLocationDoneTileMapAttrSrcBank:: ; $dc00
    db

wLocationDoneTileMapSrcAddr:: ; $dc01
    dw

wLocationDoneTileAttrSrcAddr:: ; $dc03
    dw

wLocationDone_unusedTileMapOrAttrDest:: ; $dc05
    dw

wLocationDone_unusedTileMapSrc:: ; $dc07
    dw

wLocationDone_unusedTileAttrSrc:: ; $dc09
    dw

wLocationDone_PenaltiesOam:: ; $dc0b
    ds $0d

wLocationDone_unused_dc18:
    ds $4b-$18

wLocationDone_StopPosAccelerateOam:: ; $dc4b
    ds $21
.end::

wLocationDone_unused_dc6c:
    ds $cb-$6c

wLocationsDoneTotalDeductionsOam:: ; $dccb
    ds $0d
.end::

nextu

wInGameOnSceneryTextOam:: ; $dc00
    ds $a0

nextu

wSmallRectUnused_dc00:
    ds $d

wSmallRectOamAnimTypeIdx:: ; $dc0d
    db

wSmallRectOamOBJTileDataBank:: ; $dc0e
    db

wSmallRectOamOBJTileDataAddr:: ; $dc0f
    dw

wSmallRectOamBGTileDataBank:: ; $dc11
    db

wSmallRectOamBGTileDataAddr:: ; $dc12
    dw

nextu

wBGAnimated_unused_dc00:
    ds $d

wBGAnimatedAnimTypeIdx:: ; $dc0d
    db

wBGAnimated_unused:: ; $dc0e
    ds $11-$0e

wBGAnimatedTileDataBank:: ; $dc11
    db

wBGAnimatedTileDataAddr:: ; $dc12
    dw

nextu

wHiCol_unused::
    ds $14

wHiColScreenPlus1ToLoadTileMapAndAttrsTo:: ; $dc14
    db

wUnusedLYAfterLoadingHiColTileDataFragment:: ; $dc15
    db

nextu

wRankings_unused:
    ds $98

wRankingsCurrLeftNumberIdxBeingOperatedOn:: ; $dc98
    db

wBCDFormOfCurrHighScoreWereEnteringNameFor:: ; $dc99
    dw

wCurrHighScoreWereEnteringNameFor:: ; $dc9b
    dw

wCurrProLevelWereEnteringNameFor:: ; $dc9d
    db

wRankingsCurrTrainLineBeingDisplayed:: ; $dc9e
    dw

wRankingsTileLocationIdxBeingDrawn:: ; $dca0
    db

wRankingsCurrentMetatileIdxAtLocation:: ; $dca1
    db

wRankingsShouldDrawNextMetatile:: ; $dca2
    db

wRankingsIsErasingText:: ; $dca3
    db

wRankingsPrevScreen:: ; $dca4
    db

wRankingsCurrLeftNumberTileAttr:: ; $dca5
    db

nextu

wEnterScoreDisplayedLetterSelectionTileMap:: ; $dc00
    ds 2 * GB_TILE_WIDTH
.end::

wEnterScoreCurrName:: ; $dc40
    ds 4

wEnterScoreNameTileMap:: ; $dc44
    ds $10

wEnterScoreCharIdxSelected:: ; $dc54
    db

wEnterScoreLettersSCX:: ; $dc55
    db

wEnterScoreNextLetterSCX:: ; $dc56
    db

wEnterScoreNumCharsInputted:: ; $dc57
    db

endu

SECTION "WRAM Bank 2", WRAMX[$d000], BANK[$2]

union

wIntroCutsceneTileMapBuffer:: ; $d000
    ds GB_TILE_WIDTH * SCREEN_TILE_HEIGHT

wIntroCutsceneTileAttrBuffer:: ; $d240
    ds GB_TILE_WIDTH * SCREEN_TILE_HEIGHT
.end::

nextu

wRouteDisplayScrn0TileMapBuffer:: ; $d000
    ds GB_TILE_WIDTH * SCREEN_TILE_HEIGHT

wRouteDisplayScrn0TileAttrBuffer:: ; $d240
    ds GB_TILE_WIDTH * SCREEN_TILE_HEIGHT

wRouteDisplayScrn1TileMapBuffer:: ; $d480
    ds GB_TILE_WIDTH * SCREEN_TILE_HEIGHT

wRouteDisplayScrn1TileAttrBuffer:: ; $d6c0
    ds GB_TILE_WIDTH * SCREEN_TILE_HEIGHT

endu

SECTION "WRAM Bank 3", WRAMX[$d000], BANK[$3]

wLast100hRecordedDistances:: ; $d000
    ds $400
