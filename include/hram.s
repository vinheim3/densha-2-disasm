SECTION "HRAM", HRAM[$ff80]

hOamDmaFunc:: ; $ff80
    ds $0a

hff8a:
    ds $ee-$8a

hStackTop:: ; $ffee

union

hRomBank:: ; $ffee
    db

nextu

hCurrScriptOamTileXOffset:: ; $ffee
    db

nextu

hCurrTrainIdxToCheck:: ; $ffee
    db

nextu

hPictureBook_unused:: ; $ffee
    ds 2

hSavedTrainCounter:: ; $fff0
    db

nextu

hListOfTrainsLowerBound:: ; $ffee
    dw

hListOfTrainsUpperBound:: ; $fff0
    dw

nextu

hLocationDoneTrainSCXtoDrawFor:: ; $ffee
    db

nextu

hFarLoadSpriteOamXOffset:: ; $ffee
    db

hFarLoadSpriteOamYOffset:: ; $ffef
    db

nextu

hScoringCategoryPenaltyDivisorValue:: ; $ffee
    db

nextu

hUnusedRecordedMillimeters:: ; $ffee
    ds 2

hRecordedCentimeters:: ; $fff0
    db

nextu

hUnusedDistanceVars:: ; $ffee
    ds 4

endu

union

hTrainUnlockedAddr:: ; $fff2
    dw

nextu

hRecordedMeters:: ; $fff2
    dw

endu

hfff4:
    ds 5-4

h2IfGBC:: ; $fff5
    db

hVBlankIntQueueFuncCallersAddress:: ; $fff6
    dw

hfff8:
    ds $e-8

union

hCurrScriptStructHighByte:: ; $fffe
    db

nextu

hCurrScriptOamOffset:: ; $fffe
    db

endu