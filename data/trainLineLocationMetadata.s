macro LocationMetadata
	dw \1
	dw \2
	db \3
	dw \4
	db $00
endm
TrainLineAddressesForLocationFrameMetaData::
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
	LocationMetadata .trainLine0location0sections, 1650, 1, .trainLine0location0scenarios
	LocationMetadata .trainLine0location1sections, 1350, 0, .trainLine0location1scenarios
	LocationMetadata .trainLine0location2sections, 1770, 0, .trainLine0location2scenarios
	LocationMetadata .trainLine0location3sections, 960, 1, .trainLine0location3scenarios
	LocationMetadata .trainLine0location4sections, 1410, 0, .trainLine0location4scenarios

.trainLine3:
	LocationMetadata .trainLine3location0sections, 1650, 1, .trainLine3location0scenarios
	LocationMetadata .trainLine3location1sections, 1350, 0, .trainLine3location1scenarios
	LocationMetadata .trainLine3location2sections, 1770, 0, .trainLine3location2scenarios
	LocationMetadata .trainLine3location3sections, 960, 1, .trainLine3location3scenarios
	LocationMetadata .trainLine3location4sections, 1410, 0, .trainLine3location4scenarios
	LocationMetadata .trainLine3location5sections, 1080, 1, .trainLine3location5scenarios
	LocationMetadata .trainLine3location6sections, 1860, 0, .trainLine3location6scenarios
	LocationMetadata .trainLine3location7sections, 2280, 0, .trainLine3location7scenarios
	LocationMetadata .trainLine3location8sections, 3960, 0, .trainLine3location8scenarios
	LocationMetadata .trainLine3location9sections, 630, 3, .trainLine3location9scenarios
	LocationMetadata .trainLine3location10sections, 870, 0, .trainLine3location10scenarios
	LocationMetadata .trainLine3location11sections, 2340, 0, .trainLine3location11scenarios
	LocationMetadata .trainLine3location12sections, 1560, 0, .trainLine3location12scenarios

.trainLine5:
	LocationMetadata .trainLine5location0sections, 1650, 8, .trainLine5location0scenarios
	LocationMetadata .trainLine5location1sections, 1350, 0, .trainLine5location1scenarios
	LocationMetadata .trainLine5location2sections, 1770, 0, .trainLine5location2scenarios
	LocationMetadata .trainLine5location3sections, 960, 0, .trainLine5location3scenarios
	LocationMetadata .trainLine5location4sections, 1410, 0, .trainLine5location4scenarios
	LocationMetadata .trainLine5location5sections, 1080, 0, .trainLine5location5scenarios
	LocationMetadata .trainLine5location6sections, 1860, 0, .trainLine5location6scenarios
	LocationMetadata .trainLine5location7sections, 2280, 0, .trainLine5location7scenarios
	LocationMetadata .trainLine5location8sections, 3960, 0, .trainLine5location8scenarios
	LocationMetadata .trainLine5location9sections, 630, 3, .trainLine5location9scenarios
	LocationMetadata .trainLine5location10sections, 870, 0, .trainLine5location10scenarios
	LocationMetadata .trainLine5location11sections, 2340, 0, .trainLine5location11scenarios
	LocationMetadata .trainLine5location12sections, 1560, 0, .trainLine5location12scenarios

.trainLine1:
	LocationMetadata .trainLine1location0sections, 1710, 7, .trainLine1location0scenarios
	LocationMetadata .trainLine1location1sections, 1440, 0, .trainLine1location1scenarios
	LocationMetadata .trainLine1location2sections, 1380, 0, .trainLine1location2scenarios
	LocationMetadata .trainLine1location3sections, 2040, 0, .trainLine1location3scenarios
	LocationMetadata .trainLine1location4sections, 1680, 0, .trainLine1location4scenarios
	LocationMetadata .trainLine1location5sections, 1140, 0, .trainLine1location5scenarios
	LocationMetadata .trainLine1location6sections, 1470, 0, .trainLine1location6scenarios
	LocationMetadata .trainLine1location7sections, 1530, 0, .trainLine1location7scenarios

.trainLine4:
	LocationMetadata .trainLine4location0sections, 1710, 7, .trainLine4location0scenarios
	LocationMetadata .trainLine4location1sections, 1440, 0, .trainLine4location1scenarios
	LocationMetadata .trainLine4location2sections, 1380, 0, .trainLine4location2scenarios
	LocationMetadata .trainLine4location3sections, 2040, 0, .trainLine4location3scenarios
	LocationMetadata .trainLine4location4sections, 1680, 0, .trainLine4location4scenarios
	LocationMetadata .trainLine4location5sections, 1140, 0, .trainLine4location5scenarios
	LocationMetadata .trainLine4location6sections, 1470, 0, .trainLine4location6scenarios
	LocationMetadata .trainLine4location7sections, 1530, 0, .trainLine4location7scenarios

.trainLineA::
	LocationMetadata .trainLine10location0sections, 9840, 0, .trainLine10location0scenarios

.trainLine2:
	LocationMetadata .trainLine2location0sections, 1650, 0, .trainLine2location0scenarios
	LocationMetadata .trainLine2location1sections, 870, 3, .trainLine2location1scenarios
	LocationMetadata .trainLine2location2sections, 870, 0, .trainLine2location2scenarios
	LocationMetadata .trainLine2location3sections, 900, 0, .trainLine2location3scenarios
	LocationMetadata .trainLine2location4sections, 720, 0, .trainLine2location4scenarios
	LocationMetadata .trainLine2location5sections, 930, 1, .trainLine2location5scenarios
	LocationMetadata .trainLine2location6sections, 630, 0, .trainLine2location6scenarios
	LocationMetadata .trainLine2location7sections, 690, 1, .trainLine2location7scenarios
	LocationMetadata .trainLine2location8sections, 540, 0, .trainLine2location8scenarios

.trainLine6:
	LocationMetadata .trainLine6location0sections, 540, 0, .trainLine6location0scenarios
	LocationMetadata .trainLine6location1sections, 840, 0, .trainLine6location1scenarios
	LocationMetadata .trainLine6location2sections, 900, 0, .trainLine6location2scenarios
	LocationMetadata .trainLine6location3sections, 1110, 0, .trainLine6location3scenarios
	LocationMetadata .trainLine6location4sections, 1530, 0, .trainLine6location4scenarios
	LocationMetadata .trainLine6location5sections, 1140, 0, .trainLine6location5scenarios
	LocationMetadata .trainLine6location6sections, 540, 0, .trainLine6location6scenarios
	LocationMetadata .trainLine6location7sections, 990, 0, .trainLine6location7scenarios
	LocationMetadata .trainLine6location8sections, 1050, 0, .trainLine6location8scenarios

.trainLine8:
	LocationMetadata .trainLine8location0sections, 540, 2, .trainLine8location0scenarios
	LocationMetadata .trainLine8location1sections, 840, 0, .trainLine8location1scenarios
	LocationMetadata .trainLine8location2sections, 900, 0, .trainLine8location2scenarios
	LocationMetadata .trainLine8location3sections, 1110, 0, .trainLine8location3scenarios
	LocationMetadata .trainLine8location4sections, 1530, 3, .trainLine8location4scenarios
	LocationMetadata .trainLine8location5sections, 1140, 0, .trainLine8location5scenarios
	LocationMetadata .trainLine8location6sections, 540, 0, .trainLine8location6scenarios
	LocationMetadata .trainLine8location7sections, 990, 0, .trainLine8location7scenarios
	LocationMetadata .trainLine8location8sections, 1050, 0, .trainLine8location8scenarios

.trainLine7:
	LocationMetadata .trainLine7location0sections, 1980, 0, .trainLine7location0scenarios
	LocationMetadata .trainLine7location1sections, 1110, 0, .trainLine7location1scenarios
	LocationMetadata .trainLine7location2sections, 1290, 1, .trainLine7location2scenarios
	LocationMetadata .trainLine7location3sections, 810, 0, .trainLine7location3scenarios
	LocationMetadata .trainLine7location4sections, 780, 2, .trainLine7location4scenarios
	LocationMetadata .trainLine7location5sections, 1470, 0, .trainLine7location5scenarios
	LocationMetadata .trainLine7location6sections, 780, 0, .trainLine7location6scenarios

.trainLine9:
	LocationMetadata .trainLine9location0sections, 1170, 15, .trainLine9location0scenarios
	LocationMetadata .trainLine9location1sections, 840, 0, .trainLine9location1scenarios
	LocationMetadata .trainLine9location2sections, 1860, 0, .trainLine9location2scenarios
	LocationMetadata .trainLine9location3sections, 990, 0, .trainLine9location3scenarios
	LocationMetadata .trainLine9location4sections, 1260, 0, .trainLine9location4scenarios
	LocationMetadata .trainLine9location5sections, 1800, 0, .trainLine9location5scenarios
	LocationMetadata .trainLine9location6sections, 1080, 0, .trainLine9location6scenarios
	LocationMetadata .trainLine9location7sections, 930, 0, .trainLine9location7scenarios
	LocationMetadata .trainLine9location8sections, 1170, 0, .trainLine9location8scenarios
	LocationMetadata .trainLine9location9sections, 1440, 0, .trainLine9location9scenarios
	LocationMetadata .trainLine9location10sections, 1650, 0, .trainLine9location10scenarios
	LocationMetadata .trainLine9location11sections, 1020, 0, .trainLine9location11scenarios
	LocationMetadata .trainLine9location12sections, 2160, 0, .trainLine9location12scenarios
	LocationMetadata .trainLine9location13sections, 1770, 0, .trainLine9location13scenarios
	LocationMetadata .trainLine9location14sections, 990, 0, .trainLine9location14scenarios
	LocationMetadata .trainLine9location15sections, 1080, 0, .trainLine9location15scenarios
	LocationMetadata .trainLine9location16sections, 1980, 0, .trainLine9location16scenarios
	LocationMetadata .trainLine9location17sections, 1110, 5, .trainLine9location17scenarios
	LocationMetadata .trainLine9location18sections, 1290, 0, .trainLine9location18scenarios
	LocationMetadata .trainLine9location19sections, 810, 0, .trainLine9location19scenarios
	LocationMetadata .trainLine9location20sections, 780, 0, .trainLine9location20scenarios
	LocationMetadata .trainLine9location21sections, 1470, 0, .trainLine9location21scenarios
	LocationMetadata .trainLine9location22sections, 780, 0, .trainLine9location22scenarios

.trainLine0location0sections:
.trainLine3location0sections:
.trainLine5location0sections:
	db $c9, $3c
	db $d7, $60
	db $d8, $61
	db $d8, $61
	db $d9, $61
	db $1c, $62
	db $1d, $00
	db $1d, $01
	db $1e, $02
	db $c4, $c4
	db $c5, $c5
	db $c5, $c5
	db $c5, $c5
	db $c5, $c5
	db $c5, $c5
	db $c5, $c5
	db $c6, $c6
	db $74, $00
	db $75, $01
	db $75, $01
	db $75, $01
	db $76, $02
	db $77, $7a
	db $78, $7b
	db $79, $7c
	db $7a, $77
	db $7b, $78
	db $7b, $78
	db $7c, $79
	db $60, $60
	db $61, $61
	db $61, $61
	db $62, $62
	db $74, $13
	db $75, $14
	db $75, $14
	db $76, $15
	db $7a, $16
	db $7b, $17
	db $7b, $17
	db $7b, $17
	db $7c, $18
	db $c4, $c4
	db $c5, $c5
	db $c6, $c6
	db $00, $13
	db $01, $14
	db $01, $14
	db $01, $14
	db $01, $15
	db $02, $bb
	db $3a, $bc
	db $3b, $bc
	db $3b, $bc
	db $3b, $bd

.trainLine0location1sections:
.trainLine3location1sections:
.trainLine5location1sections:
	db $3b, $60
	db $3b, $61
	db $3b, $62
	db $3b, $c7
	db $3c, $c8
	db $60, $c9
	db $61, $00
	db $61, $01
	db $61, $01
	db $61, $01
	db $62, $02
	db $94, $66
	db $95, $67
	db $96, $68
	db $8f, $60
	db $90, $61
	db $91, $61
	db $13, $62
	db $14, $74
	db $14, $75
	db $15, $75
	db $74, $75
	db $75, $75
	db $75, $75
	db $76, $75
	db $00, $75
	db $01, $75
	db $02, $75
	db $74, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $76, $75
	db $1c, $75
	db $1d, $75
	db $1e, $76
	db $74, $27
	db $75, $28
	db $76, $28
	db $3a, $28
	db $3b, $28

.trainLine0location2sections:
.trainLine3location2sections:
.trainLine5location2sections:
	db $3b, $29
	db $3c, $74
	db $74, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $76, $76
	db $77, $7a
	db $78, $7b
	db $79, $7c
	db $80, $83
	db $81, $84
	db $82, $85
	db $80, $83
	db $81, $84
	db $81, $84
	db $82, $85
	db $7d, $7d
	db $7e, $7e
	db $7e, $7e
	db $7e, $7e
	db $7f, $7f
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $22, $1f
	db $23, $20
	db $23, $20
	db $24, $21
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $1f, $22
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $21, $24
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $4a, $4a

.trainLine0location3sections:
.trainLine3location3sections:
.trainLine5location3sections:
	db $4b, $4b
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $1f, $22
	db $20, $23
	db $21, $24
	db $6c, $6c
	db $6d, $6d
	db $6e, $6e
	db $74, $74
	db $75, $75
	db $76, $76
	db $7a, $77
	db $7b, $78
	db $7c, $78
	db $22, $78
	db $23, $78
	db $23, $78
	db $24, $78
	db $7a, $78
	db $7b, $79
	db $7c, $1f
	db $22, $20
	db $23, $20
	db $24, $21
	db $4a, $1c

.trainLine0location4sections:
.trainLine3location4sections:
.trainLine5location4sections:
	db $4b, $1d
	db $1c, $1d
	db $1d, $1d
	db $1e, $1e
	db $6c, $6c
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6e, $6e
	db $83, $80
	db $84, $81
	db $84, $81
	db $85, $82
	db $74, $7d
	db $75, $7e
	db $76, $7f
	db $1c, $1c
	db $1d, $1d
	db $1d, $1e
	db $1e, $c7
	db $3a, $c8
	db $3b, $c8

.trainLine3location5sections:
.trainLine5location5sections:
	db $3c, $c8
	db $c7, $c8
	db $c8, $c8
	db $c9, $c9
	db $cd, $77
	db $ce, $78
	db $cf, $78
	db $7a, $78
	db $7b, $78
	db $7b, $78
	db $7b, $78
	db $7b, $78
	db $7c, $79
	db $6c, $6c
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6e, $6e
	db $74, $1c
	db $75, $1d
	db $75, $1d
	db $75, $1d
	db $76, $1d
	db $27, $1d
	db $28, $1d
	db $28, $1d
	db $28, $1d
	db $28, $1e
	db $28, $27
	db $28, $28

.trainLine3location6sections:
.trainLine5location6sections:
	db $29, $29
	db $1c, $1c
	db $1d, $1d
	db $1e, $1d
	db $74, $1d
	db $75, $1d
	db $75, $1d
	db $75, $1d
	db $75, $1d
	db $75, $1d
	db $76, $1e
	db $6c, $6c
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6e, $6e
	db $4a, $4a

.trainLine3location7sections:
.trainLine5location7sections:
	db $4b, $4b
	db $6c, $6c
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6e, $6e
	db $74, $74
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $76, $76
	db $4a, $4a

.trainLine3location8sections:
.trainLine5location8sections:
	db $4b, $4b
	db $1c, $74
	db $1d, $75
	db $1d, $75
	db $1d, $75
	db $1d, $75
	db $1d, $75
	db $1d, $75
	db $1e, $75
	db $74, $75
	db $75, $75
	db $75, $75
	db $76, $76
	db $6c, $6c
	db $6d, $6d
	db $6d, $6d
	db $6e, $6e
	db $1c, $1c
	db $1d, $1d
	db $1e, $1e
	db $6c, $6c
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6e, $6e
	db $1c, $1c
	db $1d, $1d
	db $1e, $1e
	db $6c, $6c
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6e, $6e
	db $1c, $1c
	db $1d, $1d
	db $1e, $1e
	db $6c, $6c
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6e, $6e
	db $71, $71
	db $72, $72
	db $72, $72
	db $72, $72
	db $73, $73
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $6c, $6c
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6e, $6e
	db $19, $0d
	db $1a, $0e
	db $1b, $18
	db $13, $00
	db $14, $01
	db $15, $01
	db $3a, $01
	db $3b, $02
	db $3b, $8f
	db $3b, $90
	db $3b, $91
	db $3b, $00

.trainLine3location9sections:
.trainLine5location9sections:
	db $3c, $01
	db $03, $06
	db $04, $07
	db $05, $08
	db $06, $03
	db $07, $04
	db $08, $05
	db $03, $06
	db $04, $07
	db $04, $07
	db $04, $07
	db $04, $07
	db $04, $07
	db $04, $07
	db $04, $07
	db $04, $07
	db $04, $07
	db $05, $08
	db $00, $00
	db $02, $01
	db $4a, $01

.trainLine3location10sections:
.trainLine5location10sections:
	db $4b, $02
	db $6c, $6c
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $4c, $6d

.trainLine3location11sections:
.trainLine5location11sections:
	db $4d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6e, $6e
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1e
	db $1d, $4a

.trainLine3location12sections:
.trainLine5location12sections:
	db $1e, $4b
	db $1f, $22
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $21, $24
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $60, $00
	db $61, $01
	db $62, $02
	db $03, $06
	db $04, $07
	db $04, $07
	db $04, $07
	db $04, $07
	db $05, $08
	db $00, $1c
	db $01, $1d
	db $01, $1d
	db $01, $1e
	db $01, $00
	db $01, $01
	db $01, $01
	db $01, $01
	db $01, $01
	db $01, $01
	db $01, $01
	db $01, $01
	db $02, $02
	db $3a, $3a
	db $3b, $3b
	db $3d, $3d
	db $3e, $3e
	db $3b, $3b
	db $3b, $3b
	db $3c, $3c
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d

.trainLine1location0sections:
.trainLine4location0sections:
	db $3c, $d9
	db $da, $dd
	db $db, $de
	db $dc, $df
	db $d7, $74
	db $d8, $75
	db $d9, $75
	db $00, $76
	db $01, $00
	db $01, $01
	db $01, $01
	db $02, $02
	db $06, $03
	db $07, $04
	db $08, $05
	db $74, $00
	db $75, $01
	db $75, $02
	db $76, $86
	db $8f, $87
	db $90, $87
	db $91, $87
	db $d0, $88
	db $d1, $1c
	db $d1, $1d
	db $d2, $1e
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $77, $7a
	db $78, $7b
	db $79, $7c
	db $1c, $1c
	db $25, $25
	db $26, $26
	db $1d, $1d
	db $1d, $1d
	db $25, $25
	db $26, $26
	db $1e, $1d
	db $27, $1d
	db $28, $1e
	db $28, $00
	db $28, $01

.trainLine1location1sections:
.trainLine4location1sections:
	db $29, $02
	db $06, $03
	db $07, $04
	db $07, $04
	db $07, $05
	db $07, $1f
	db $07, $20
	db $08, $21
	db $1c, $74
	db $1d, $75
	db $1d, $75
	db $1e, $76
	db $00, $00
	db $01, $01
	db $02, $02
	db $06, $03
	db $07, $04
	db $07, $04
	db $07, $04
	db $08, $05
	db $1f, $7a
	db $20, $7b
	db $20, $7b
	db $21, $7c
	db $22, $89
	db $23, $8a
	db $23, $8a
	db $24, $8b
	db $1f, $22
	db $20, $23
	db $21, $24
	db $74, $74
	db $75, $75
	db $76, $76
	db $1c, $1c
	db $25, $25
	db $26, $26
	db $25, $25
	db $26, $26
	db $1d, $1e
	db $1d, $00
	db $1d, $01
	db $1e, $01
	db $3a, $01
	db $3b, $01
	db $3b, $01
	db $3b, $01
	db $3b, $01

.trainLine1location2sections:
.trainLine4location2sections:
	db $3c, $01
	db $1c, $01
	db $1d, $01
	db $1d, $01
	db $1d, $01
	db $1e, $02
	db $22, $03
	db $23, $04
	db $24, $05
	db $1c, $00
	db $1d, $01
	db $1d, $01
	db $1d, $01
	db $1e, $02
	db $1f, $06
	db $20, $07
	db $20, $07
	db $21, $08
	db $c4, $c4
	db $c5, $c5
	db $c6, $c6
	db $7a, $77
	db $7b, $78
	db $7c, $79
	db $22, $03
	db $23, $04
	db $23, $04
	db $24, $05
	db $00, $00
	db $01, $01
	db $02, $02
	db $1c, $1c
	db $1d, $1d
	db $1e, $1e
	db $74, $86
	db $75, $87
	db $76, $87
	db $86, $87
	db $87, $87
	db $88, $87
	db $27, $87
	db $28, $88
	db $28, $74
	db $28, $75
	db $28, $75
	db $28, $75

.trainLine1location3sections:
.trainLine4location3sections:
	db $29, $76
	db $1f, $8c
	db $20, $8d
	db $20, $8d
	db $20, $8d
	db $20, $8d
	db $20, $8d
	db $21, $8e
	db $89, $8c
	db $8a, $8d
	db $8b, $8e
	db $89, $8c
	db $8a, $8d
	db $8b, $8e
	db $86, $86
	db $87, $87
	db $88, $88
	db $89, $8c
	db $8a, $8d
	db $8a, $8d
	db $8a, $8d
	db $8a, $8d
	db $8a, $8d
	db $8a, $8d
	db $8a, $8d
	db $8b, $8e
	db $8c, $89
	db $8d, $8a
	db $8e, $8b
	db $89, $8c
	db $8a, $8d
	db $8b, $8e
	db $8c, $89
	db $8d, $8a
	db $8e, $8b
	db $86, $86
	db $6f, $6f
	db $70, $70
	db $87, $87
	db $87, $87
	db $88, $88
	db $1f, $8c
	db $20, $8d
	db $20, $8d
	db $21, $8e
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $22, $89
	db $23, $8a
	db $24, $8b
	db $89, $8c
	db $8a, $8d
	db $8b, $8e
	db $86, $86
	db $87, $87
	db $87, $87
	db $87, $87
	db $87, $87
	db $87, $87
	db $87, $88
	db $87, $74
	db $88, $75
	db $27, $76
	db $28, $00
	db $28, $01
	db $28, $01

.trainLine1location4sections:
.trainLine4location4sections:
	db $29, $01
	db $00, $01
	db $01, $01
	db $01, $01
	db $01, $01
	db $02, $02
	db $74, $74
	db $75, $75
	db $75, $75
	db $76, $76
	db $77, $7a
	db $78, $7b
	db $79, $7c
	db $74, $74
	db $75, $75
	db $75, $75
	db $75, $75
	db $76, $76
	db $8c, $89
	db $8d, $8a
	db $8d, $8a
	db $8e, $8b
	db $86, $86
	db $87, $87
	db $6f, $6f
	db $70, $70
	db $87, $87
	db $87, $87
	db $88, $88
	db $8c, $1f
	db $8d, $20
	db $8d, $21
	db $8d, $89
	db $8d, $8a
	db $8d, $8a
	db $8d, $8a
	db $8e, $8b
	db $1f, $8c
	db $20, $8d
	db $21, $8e
	db $89, $7a
	db $8a, $7b
	db $8b, $7c
	db $8c, $89
	db $8d, $8a
	db $8d, $8a
	db $8e, $8b
	db $1f, $1f
	db $20, $20
	db $20, $20
	db $21, $20
	db $27, $21
	db $28, $00
	db $28, $01
	db $28, $02
	db $28, $86

.trainLine1location5sections:
.trainLine4location5sections:
	db $29, $87
	db $1c, $88
	db $1d, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $1f, $06
	db $20, $07
	db $21, $08
	db $1c, $1c
	db $25, $25
	db $26, $26
	db $1d, $1d
	db $1d, $1d
	db $1e, $1d
	db $74, $1d
	db $75, $1d
	db $76, $1d
	db $1c, $1d
	db $1d, $1d
	db $25, $25
	db $26, $26
	db $1e, $1d
	db $27, $1d
	db $28, $1d
	db $28, $1d
	db $28, $1e
	db $28, $00

.trainLine1location6sections:
.trainLine4location6sections:
	db $29, $01
	db $74, $02
	db $75, $8f
	db $75, $90
	db $75, $91
	db $75, $74
	db $75, $75
	db $76, $76
	db $80, $83
	db $81, $84
	db $81, $84
	db $82, $85
	db $00, $1c
	db $01, $1d
	db $02, $1d
	db $1c, $1d
	db $1d, $1d
	db $1e, $1e
	db $74, $74
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $76, $75
	db $86, $75
	db $87, $75
	db $88, $76
	db $00, $00
	db $01, $01
	db $02, $02
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $00, $00
	db $01, $01
	db $01, $01
	db $01, $01
	db $01, $01
	db $01, $01
	db $01, $01
	db $02, $01
	db $27, $01
	db $28, $01
	db $28, $01
	db $28, $02
	db $28, $13

.trainLine1location7sections:
.trainLine4location7sections:
	db $29, $14
	db $00, $15
	db $01, $00
	db $01, $01
	db $01, $02
	db $02, $1c
	db $1c, $1d
	db $1d, $1e
	db $1d, $74
	db $1d, $75
	db $1d, $76
	db $1d, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $06, $7a
	db $04, $7b
	db $05, $7c
	db $7d, $7d
	db $7e, $7e
	db $7e, $7e
	db $7f, $7f
	db $c4, $c4
	db $c5, $c5
	db $c6, $c6
	db $7d, $7d
	db $7e, $7e
	db $7e, $7e
	db $7f, $7f
	db $1f, $22
	db $20, $23
	db $21, $24
	db $1c, $1c
	db $25, $25
	db $26, $26
	db $25, $25
	db $26, $26
	db $1e, $1e
	db $00, $13
	db $01, $14
	db $02, $14
	db $13, $15
	db $14, $1c
	db $15, $1d
	db $a0, $1e
	db $a1, $3a
	db $a1, $a1
	db $a1, $a1
	db $a1, $a1
	db $a1, $a1
	db $a1, $a1
	db $a2, $a2
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d

.trainLine10location0sections:
	db $38, $30
	db $39, $31
	db $97, $94
	db $98, $95
	db $98, $95
	db $99, $96
	db $8f, $8f
	db $90, $90
	db $90, $90
	db $91, $91
	db $94, $97
	db $95, $98
	db $95, $98
	db $96, $99
	db $8f, $8f
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $91, $91
	db $94, $97
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $96, $99
	db $8f, $8f
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $91, $91
	db $97, $94
	db $98, $95
	db $98, $95
	db $98, $95
	db $98, $95
	db $99, $96
	db $8f, $8f
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $91, $91
	db $91, $91
	db $94, $97
	db $95, $98
	db $96, $99
	db $77, $7a
	db $78, $7b
	db $78, $7b
	db $78, $7b
	db $78, $7b
	db $79, $7c
	db $74, $74
	db $75, $75
	db $76, $76
	db $8f, $8f
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $91, $90
	db $74, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $76, $90
	db $8f, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $91, $91
	db $94, $97
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $95, $98
	db $96, $99
	db $8f, $8f
	db $90, $90
	db $90, $90
	db $90, $90
	db $91, $91
	db $74, $74
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $75, $75
	db $76, $76
	db $a9, $a6
	db $aa, $a7
	db $aa, $a7
	db $aa, $a7
	db $aa, $a7
	db $aa, $a7
	db $aa, $a7
	db $aa, $a7
	db $aa, $a7
	db $aa, $a7
	db $aa, $a7
	db $aa, $a7
	db $aa, $a7
	db $aa, $a7
	db $ab, $a8
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d

.trainLine2location0sections:
	db $3c, $d8
	db $d0, $d8
	db $d1, $d8
	db $d1, $d8
	db $d1, $d9
	db $d1, $09
	db $d1, $0a
	db $d1, $0a
	db $d1, $0a
	db $d1, $0a
	db $d1, $0a
	db $d1, $0a
	db $d1, $0a
	db $d1, $0a
	db $d1, $0a
	db $d1, $0a
	db $d1, $0a
	db $d1, $0a
	db $d1, $0a
	db $d1, $0a
	db $d2, $0c
	db $da, $10
	db $db, $11
	db $dc, $12
	db $09, $09
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0b, $0b
	db $0c, $0c
	db $0d, $10
	db $0e, $11
	db $0e, $11
	db $0e, $12
	db $0e, $97
	db $0e, $98
	db $0f, $99
	db $3a, $09
	db $3b, $0a
	db $3b, $0c
	db $3b, $3a
	db $3d, $3d
	db $3e, $3e
	db $3b, $3c
	db $3b, $09

.trainLine2location1sections:
	db $3c, $0a
	db $09, $0a
	db $0a, $0c
	db $0a, $13
	db $0a, $14
	db $0a, $14
	db $0a, $14
	db $0a, $14
	db $0a, $14
	db $0a, $14
	db $0a, $14
	db $0c, $15
	db $10, $0d
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $12, $0f
	db $09, $09
	db $0a, $0a
	db $0c, $0a
	db $3a, $0c
	db $3b, $3a
	db $3d, $3d
	db $3e, $3e
	db $3d, $3d
	db $3e, $3e
	db $3b, $3c

.trainLine2location2sections:
	db $3c, $09
	db $8f, $0a
	db $90, $0a
	db $90, $0a
	db $90, $0a
	db $90, $0a
	db $90, $0a
	db $90, $0a
	db $90, $0a
	db $90, $0a
	db $90, $0a
	db $90, $0c
	db $97, $0d
	db $98, $0e
	db $98, $0e
	db $98, $0e
	db $98, $0e
	db $98, $0e
	db $99, $0f
	db $09, $09
	db $0a, $0a
	db $0c, $0a
	db $3a, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a

.trainLine2location3sections:
	db $3c, $0c
	db $10, $0d
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $12, $0f
	db $09, $09
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0c, $0c
	db $0d, $10
	db $0e, $11
	db $0e, $11
	db $0f, $12
	db $09, $09
	db $0a, $0a
	db $0c, $0a
	db $3a, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a

.trainLine2location4sections:
	db $3c, $0c
	db $10, $0d
	db $11, $0e
	db $12, $0f
	db $09, $09
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0c, $0c
	db $10, $16
	db $11, $0e
	db $11, $0e
	db $12, $0f
	db $44, $47
	db $45, $48
	db $45, $48
	db $45, $48
	db $45, $48
	db $45, $48
	db $45, $48
	db $45, $48

.trainLine2location5sections:
	db $46, $49
	db $10, $b5
	db $11, $b6
	db $12, $b7
	db $09, $b2
	db $0a, $b3
	db $0c, $b4
	db $10, $b5
	db $11, $b6
	db $12, $b7
	db $09, $09
	db $0a, $0a
	db $0a, $0a
	db $0b, $0b
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0c, $0a
	db $3a, $0c
	db $3b, $3a
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b

.trainLine2location6sections:
	db $3c, $3c
	db $8f, $09
	db $90, $0a
	db $90, $0a
	db $90, $0a
	db $90, $0a
	db $90, $0a
	db $91, $0c
	db $97, $0d
	db $98, $0e
	db $98, $0e
	db $98, $0e
	db $98, $0e
	db $99, $0f
	db $3a, $09
	db $3b, $0a
	db $3b, $0c
	db $3b, $3a
	db $3d, $3d
	db $3e, $3e
	db $3b, $3c

.trainLine2location7sections:
	db $3c, $09
	db $09, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0c, $0a
	db $3a, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a

.trainLine2location8sections:
	db $3c, $0c
	db $10, $0d
	db $11, $0e
	db $11, $0e
	db $12, $0f
	db $0d, $10
	db $0e, $11
	db $0e, $11
	db $0e, $11
	db $0f, $12
	db $44, $47
	db $45, $48
	db $45, $48
	db $45, $48
	db $45, $48
	db $45, $48
	db $45, $48
	db $45, $48
	db $46, $49
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d

.trainLine6location0sections:
.trainLine8location0sections:
	db $3b, $0a
	db $3c, $0c
	db $dd, $0d
	db $de, $0e
	db $de, $0e
	db $df, $0f
	db $09, $09
	db $0a, $0a
	db $0b, $0b
	db $0a, $0a
	db $0a, $0a
	db $0b, $0b
	db $0c, $0a
	db $3a, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a

.trainLine6location1sections:
.trainLine8location1sections:
	db $3c, $0c
	db $10, $0d
	db $11, $0e
	db $12, $0f
	db $09, $13
	db $0a, $14
	db $0a, $14
	db $0c, $15
	db $0d, $10
	db $0e, $11
	db $0f, $12
	db $09, $09
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0b, $0b
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $3a, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a
	db $3b, $0a

.trainLine6location2sections:
.trainLine8location2sections:
	db $3c, $0a
	db $13, $0a
	db $14, $0a
	db $14, $0a
	db $14, $0a
	db $14, $0c
	db $14, $13
	db $14, $14
	db $15, $14
	db $00, $14
	db $01, $14
	db $01, $14
	db $01, $14
	db $01, $14
	db $01, $14
	db $01, $14
	db $02, $15
	db $03, $19
	db $04, $1a
	db $05, $1b
	db $d7, $13
	db $d8, $14
	db $d9, $15
	db $dd, $0d
	db $de, $0e
	db $df, $0f
	db $3a, $13
	db $3b, $14
	db $3b, $14
	db $3b, $14

.trainLine6location3sections:
.trainLine8location3sections:
	db $3c, $14
	db $09, $15
	db $0a, $14
	db $0a, $14
	db $0a, $14
	db $0c, $15
	db $66, $0d
	db $67, $0e
	db $68, $0f
	db $71, $71
	db $72, $72
	db $72, $72
	db $72, $72
	db $72, $72
	db $72, $72
	db $73, $73
	db $09, $09
	db $0a, $0a
	db $0c, $0c
	db $7a, $77
	db $7b, $78
	db $7b, $78
	db $7c, $79
	db $10, $0d
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $12, $0f
	db $3a, $3a
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b

.trainLine6location4sections:
.trainLine8location4sections:
	db $3c, $3c
	db $10, $0d
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $12, $0f
	db $b2, $13
	db $b3, $14
	db $b3, $14
	db $b3, $14
	db $b3, $14
	db $b3, $14
	db $b3, $14
	db $b4, $15
	db $16, $19
	db $17, $1a
	db $17, $1a
	db $17, $1a
	db $17, $1a
	db $17, $1a
	db $17, $1a
	db $18, $1b
	db $09, $09
	db $0a, $0a
	db $0a, $0c
	db $0a, $d5
	db $0c, $d6
	db $71, $71
	db $72, $72
	db $72, $72
	db $73, $73
	db $13, $13
	db $14, $14
	db $14, $14
	db $14, $14
	db $14, $14
	db $14, $14
	db $15, $15
	db $3a, $3a
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b

.trainLine6location5sections:
.trainLine8location5sections:
	db $3c, $3c
	db $71, $71
	db $72, $72
	db $73, $73
	db $13, $13
	db $14, $14
	db $15, $15
	db $0d, $19
	db $0e, $11
	db $0e, $11
	db $0e, $11
	db $0e, $11
	db $0e, $11
	db $0e, $11
	db $0f, $12
	db $09, $09
	db $0b, $0b
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0c, $0c
	db $10, $0d
	db $11, $0e
	db $11, $0e
	db $11, $0e
	db $12, $0f
	db $3a, $3a
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b

.trainLine6location6sections:
.trainLine8location6sections:
	db $3c, $3c
	db $0d, $10
	db $0e, $11
	db $0e, $11
	db $0e, $11
	db $0e, $11
	db $0e, $11
	db $0f, $11
	db $94, $11
	db $95, $11
	db $95, $11
	db $95, $11
	db $96, $11
	db $8f, $3a
	db $90, $3b
	db $90, $3b
	db $90, $3b
	db $90, $3b

.trainLine6location7sections:
.trainLine8location7sections:
	db $91, $3c
	db $dd, $94
	db $de, $95
	db $de, $95
	db $de, $95
	db $de, $95
	db $de, $95
	db $de, $95
	db $de, $95
	db $de, $96
	db $de, $16
	db $de, $17
	db $de, $18
	db $de, $0d
	db $de, $0e
	db $de, $0e
	db $de, $0e
	db $de, $0e
	db $de, $0e
	db $de, $0e
	db $de, $0e
	db $de, $0e
	db $de, $0e
	db $df, $0f
	db $09, $09
	db $0b, $0b
	db $0a, $0c
	db $0c, $3a
	db $3a, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b

.trainLine6location8sections:
.trainLine8location8sections:
	db $3c, $3c
	db $d7, $c7
	db $d8, $c8
	db $d8, $c8
	db $d8, $c8
	db $d8, $c8
	db $d9, $c8
	db $8f, $c8
	db $90, $c8
	db $91, $c9
	db $09, $09
	db $0b, $0b
	db $0c, $0c
	db $b2, $c7
	db $b3, $c8
	db $b3, $c8
	db $b4, $c9
	db $74, $b2
	db $75, $b3
	db $75, $b4
	db $76, $8f
	db $8f, $90
	db $90, $90
	db $90, $90
	db $91, $91
	db $97, $94
	db $98, $95
	db $99, $96
	db $8f, $8f
	db $90, $90
	db $91, $91
	db $ac, $ac
	db $ad, $ad
	db $ad, $ad
	db $ad, $ad
	db $ae, $ae
	db $8f, $8f
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90
	db $90, $90

.trainLine9location0sections:
	db $3b, $28
	db $3c, $29
	db $bb, $c7
	db $bc, $c8
	db $bc, $c8
	db $bc, $c8
	db $bc, $c8
	db $bd, $c9
	db $09, $09
	db $0b, $0b
	db $0a, $0c
	db $0c, $13
	db $bb, $14
	db $bc, $14
	db $bc, $14
	db $bc, $14
	db $bc, $14
	db $bc, $14
	db $bc, $14
	db $bd, $14
	db $13, $15
	db $14, $09
	db $14, $0a
	db $14, $0c
	db $14, $13
	db $15, $14
	db $09, $15
	db $0a, $09
	db $0a, $0a
	db $0c, $0a
	db $8f, $0c
	db $90, $3a
	db $90, $3b
	db $90, $3b
	db $90, $3b
	db $90, $3b
	db $90, $3b
	db $90, $3b
	db $90, $3b

.trainLine9location1sections:
	db $90, $3c
	db $90, $09
	db $90, $0a
	db $91, $0c
	db $60, $13
	db $61, $14
	db $62, $14
	db $00, $14
	db $01, $14
	db $01, $14
	db $01, $14
	db $01, $14
	db $01, $15
	db $01, $bb
	db $01, $bc
	db $01, $bc
	db $01, $bc
	db $01, $bc
	db $01, $bc
	db $02, $bc
	db $3a, $bc
	db $3b, $bc
	db $3b, $bc
	db $3b, $bd
	db $3b, $8f
	db $3b, $90
	db $3b, $91
	db $3b, $13

.trainLine9location2sections:
	db $3c, $14
	db $00, $14
	db $01, $14
	db $02, $15
	db $06, $03
	db $07, $04
	db $07, $04
	db $07, $04
	db $08, $05
	db $13, $bb
	db $14, $bc
	db $15, $bc
	db $00, $bc
	db $01, $bc
	db $02, $bd
	db $09, $09
	db $0b, $0b
	db $0c, $0c
	db $16, $19
	db $17, $1a
	db $18, $1b
	db $c4, $c4
	db $c5, $c5
	db $c6, $c6
	db $8f, $8f
	db $92, $92
	db $93, $93
	db $91, $91
	db $94, $06
	db $95, $07
	db $96, $08
	db $22, $16
	db $23, $17
	db $24, $18
	db $1c, $13
	db $1d, $14
	db $1e, $15
	db $09, $09
	db $0b, $0b
	db $0c, $0c
	db $1c, $3f
	db $1d, $40
	db $1d, $13
	db $1d, $14
	db $1e, $15
	db $94, $19
	db $95, $1a
	db $95, $1a
	db $95, $1a
	db $95, $1a
	db $96, $1b
	db $13, $13
	db $14, $14
	db $14, $15
	db $15, $3a
	db $3a, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3c
	db $3b, $13

.trainLine9location3sections:
	db $3c, $14
	db $13, $14
	db $14, $14
	db $14, $14
	db $15, $15
	db $7a, $16
	db $7b, $17
	db $7b, $17
	db $7b, $17
	db $7b, $17
	db $7c, $18
	db $8f, $8f
	db $90, $90
	db $92, $92
	db $93, $93
	db $90, $90
	db $90, $91
	db $90, $13
	db $90, $14
	db $90, $14
	db $91, $15
	db $10, $77
	db $11, $78
	db $12, $79
	db $13, $13
	db $14, $14
	db $15, $14
	db $3a, $15
	db $3b, $3a
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b

.trainLine9location4sections:
	db $3b, $3c
	db $09, $13
	db $0a, $14
	db $0a, $14
	db $0a, $15
	db $0a, $09
	db $0a, $0a
	db $0a, $0a
	db $0b, $0b
	db $0c, $0c
	db $94, $19
	db $95, $1a
	db $96, $1b
	db $00, $13
	db $01, $14
	db $01, $15
	db $02, $60
	db $60, $61
	db $61, $61
	db $61, $61
	db $62, $62
	db $00, $00
	db $01, $01
	db $01, $01
	db $02, $02
	db $03, $06
	db $04, $07
	db $04, $07
	db $04, $07
	db $04, $07
	db $05, $08
	db $09, $13
	db $0a, $14
	db $0a, $14
	db $0a, $14
	db $0a, $14
	db $0a, $14
	db $0c, $3a
	db $3a, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b

.trainLine9location5sections:
	db $3b, $3c
	db $3c, $13
	db $13, $14
	db $14, $14
	db $14, $14
	db $15, $15
	db $06, $03
	db $07, $04
	db $07, $04
	db $08, $05
	db $8f, $8f
	db $90, $90
	db $91, $91
	db $13, $13
	db $14, $14
	db $15, $14
	db $1c, $15
	db $1d, $60
	db $1d, $61
	db $1e, $62
	db $1f, $66
	db $20, $67
	db $21, $24
	db $94, $06
	db $95, $07
	db $96, $08
	db $03, $66
	db $04, $67
	db $05, $68
	db $77, $97
	db $78, $98
	db $78, $98
	db $78, $98
	db $78, $99
	db $78, $06
	db $78, $07
	db $79, $08
	db $66, $03
	db $67, $04
	db $68, $04
	db $19, $04
	db $1a, $04
	db $1a, $04
	db $1b, $04
	db $7a, $04
	db $7b, $04
	db $7c, $05
	db $c4, $c4
	db $c5, $c5
	db $c6, $c6
	db $13, $13
	db $14, $14
	db $15, $15
	db $3a, $3a
	db $3b, $3b
	db $3d, $3d
	db $3e, $3e
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b

.trainLine9location6sections:
	db $3b, $3c
	db $3c, $60
	db $60, $61
	db $61, $61
	db $61, $61
	db $61, $61
	db $61, $61
	db $61, $61
	db $61, $61
	db $61, $62
	db $61, $00
	db $61, $01
	db $62, $02
	db $00, $60
	db $01, $61
	db $02, $62
	db $8f, $8f
	db $92, $92
	db $93, $93
	db $91, $91
	db $03, $19
	db $04, $1a
	db $04, $1a
	db $05, $1b
	db $06, $03
	db $07, $04
	db $07, $04
	db $07, $04
	db $07, $04
	db $07, $04
	db $07, $04
	db $08, $05
	db $27, $27
	db $28, $28
	db $28, $28
	db $28, $28

.trainLine9location7sections:
	db $28, $29
	db $29, $00
	db $00, $01
	db $01, $01
	db $01, $01
	db $01, $01
	db $02, $02
	db $1f, $22
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $20, $23
	db $21, $24
	db $c4, $c4
	db $c5, $c5
	db $c6, $c6
	db $1c, $00
	db $1d, $01
	db $1d, $02
	db $1e, $3a
	db $3a, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b

.trainLine9location8sections:
	db $3b, $3c
	db $3c, $60
	db $13, $61
	db $14, $61
	db $15, $61
	db $8f, $8f
	db $92, $92
	db $93, $93
	db $91, $91
	db $03, $7a
	db $04, $7b
	db $05, $7b
	db $94, $7b
	db $95, $22
	db $95, $23
	db $95, $23
	db $96, $24
	db $8f, $8f
	db $92, $92
	db $93, $93
	db $90, $90
	db $90, $90
	db $90, $90
	db $92, $92
	db $93, $93
	db $92, $92
	db $93, $93
	db $91, $91
	db $22, $03
	db $23, $04
	db $23, $04
	db $23, $04
	db $24, $05
	db $8f, $27
	db $90, $28
	db $91, $28
	db $27, $28
	db $28, $28
	db $28, $28

.trainLine9location9sections:
	db $28, $29
	db $29, $13
	db $8f, $14
	db $90, $14
	db $91, $15
	db $94, $19
	db $95, $1a
	db $95, $1a
	db $96, $1b
	db $8f, $8f
	db $92, $92
	db $93, $93
	db $91, $91
	db $c4, $74
	db $c5, $75
	db $c6, $76
	db $7a, $77
	db $7b, $78
	db $7b, $78
	db $7c, $79
	db $1f, $1f
	db $20, $20
	db $21, $21
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $03, $22
	db $04, $23
	db $04, $23
	db $04, $23
	db $04, $23
	db $04, $23
	db $04, $23
	db $04, $23
	db $04, $23
	db $05, $24
	db $00, $13
	db $01, $14
	db $01, $15
	db $02, $27
	db $27, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28

.trainLine9location10sections:
	db $28, $29
	db $29, $13
	db $8f, $14
	db $90, $15
	db $90, $8f
	db $92, $92
	db $93, $93
	db $16, $19
	db $17, $1a
	db $17, $1a
	db $17, $1a
	db $17, $1a
	db $17, $1a
	db $17, $1a
	db $18, $1b
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $74, $74
	db $75, $75
	db $76, $76
	db $bb, $1c
	db $bc, $1d
	db $bd, $1d
	db $1c, $1d
	db $1d, $1d
	db $1e, $1e
	db $c4, $c4
	db $c5, $c5
	db $c6, $c6
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $1f, $13
	db $20, $14
	db $20, $14
	db $20, $14
	db $20, $14
	db $21, $15
	db $09, $09
	db $0b, $0b
	db $0c, $0c
	db $1c, $13
	db $1d, $14
	db $1e, $15
	db $3a, $3a
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b

.trainLine9location11sections:
	db $3b, $3c
	db $3c, $13
	db $1c, $14
	db $1d, $14
	db $1d, $14
	db $1d, $14
	db $1d, $14
	db $1d, $14
	db $1d, $14
	db $1d, $14
	db $1d, $14
	db $1d, $14
	db $1d, $14
	db $1d, $14
	db $1d, $14
	db $1d, $14
	db $1d, $14
	db $1e, $15
	db $06, $03
	db $07, $04
	db $07, $04
	db $07, $04
	db $08, $05
	db $00, $00
	db $01, $01
	db $01, $02
	db $02, $8f
	db $27, $90
	db $28, $91
	db $28, $27
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28

.trainLine9location12sections:
	db $29, $29
	db $03, $97
	db $04, $98
	db $05, $98
	db $94, $98
	db $95, $98
	db $96, $99
	db $1c, $1c
	db $1d, $1d
	db $1e, $1e
	db $09, $09
	db $0b, $0b
	db $0c, $0c
	db $22, $94
	db $23, $95
	db $24, $95
	db $7a, $95
	db $7b, $95
	db $7c, $95
	db $22, $95
	db $23, $95
	db $24, $96
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $22, $77
	db $23, $78
	db $23, $78
	db $23, $78
	db $23, $78
	db $24, $79
	db $1c, $74
	db $1d, $75
	db $1e, $76
	db $8c, $77
	db $8d, $78
	db $8d, $78
	db $8e, $79
	db $74, $74
	db $75, $75
	db $75, $75
	db $75, $75
	db $76, $76
	db $6c, $6c
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6e, $6e
	db $97, $94
	db $98, $95
	db $98, $95
	db $98, $95
	db $99, $96
	db $8f, $8f
	db $90, $90
	db $91, $91
	db $00, $00
	db $01, $01
	db $02, $02
	db $77, $06
	db $78, $7b
	db $79, $7c
	db $27, $27
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28

.trainLine9location13sections:
	db $29, $29
	db $8f, $8f
	db $90, $90
	db $90, $90
	db $91, $90
	db $00, $90
	db $01, $90
	db $02, $91
	db $06, $03
	db $07, $04
	db $08, $05
	db $74, $86
	db $75, $87
	db $75, $87
	db $75, $87
	db $75, $87
	db $75, $87
	db $75, $87
	db $75, $87
	db $75, $87
	db $75, $87
	db $75, $87
	db $75, $87
	db $75, $87
	db $75, $87
	db $75, $87
	db $76, $88
	db $94, $97
	db $95, $98
	db $96, $99
	db $77, $06
	db $78, $07
	db $79, $08
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1e, $1e
	db $22, $03
	db $23, $04
	db $23, $05
	db $23, $1f
	db $23, $20
	db $23, $20
	db $24, $21
	db $09, $09
	db $0b, $0b
	db $0c, $0c
	db $c4, $c4
	db $c5, $c5
	db $c6, $c6
	db $27, $27
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28

.trainLine9location14sections:
	db $28, $29
	db $29, $00
	db $1c, $01
	db $1d, $01
	db $1d, $01
	db $1d, $01
	db $1e, $01
	db $74, $02
	db $75, $1c
	db $75, $1d
	db $76, $1e
	db $c4, $c4
	db $c5, $c5
	db $c6, $c6
	db $1c, $00
	db $1d, $01
	db $1e, $01
	db $00, $01
	db $01, $01
	db $02, $02
	db $c4, $c4
	db $c5, $c5
	db $c6, $c6
	db $00, $00
	db $01, $01
	db $02, $02
	db $3a, $3a
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b

.trainLine9location15sections:
	db $3c, $3c
	db $19, $16
	db $1a, $17
	db $1b, $18
	db $16, $97
	db $17, $98
	db $18, $99
	db $97, $94
	db $98, $95
	db $99, $96
	db $8f, $8f
	db $90, $90
	db $92, $92
	db $93, $93
	db $91, $91
	db $8c, $16
	db $8d, $17
	db $8d, $17
	db $8d, $17
	db $8e, $18
	db $94, $66
	db $95, $67
	db $96, $68
	db $09, $09
	db $0a, $0a
	db $0a, $0a
	db $0c, $0a
	db $27, $0a
	db $28, $0a
	db $28, $0a
	db $28, $0a
	db $28, $0a
	db $28, $0a
	db $28, $0a
	db $28, $0a
	db $28, $0a

.trainLine7location0sections:
.trainLine9location16sections:
	db $29, $0a
	db $13, $0a
	db $14, $0a
	db $14, $0a
	db $14, $0a
	db $14, $0a
	db $15, $0a
	db $09, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0b, $0b
	db $0c, $0c
	db $c4, $c4
	db $c5, $c5
	db $c6, $c6
	db $74, $13
	db $75, $14
	db $75, $14
	db $76, $15
	db $16, $06
	db $17, $07
	db $17, $07
	db $17, $07
	db $17, $08
	db $17, $19
	db $18, $1a
	db $1f, $1a
	db $20, $1a
	db $21, $1b
	db $60, $60
	db $61, $61
	db $61, $61
	db $61, $61
	db $62, $61
	db $13, $61
	db $14, $61
	db $14, $61
	db $14, $61
	db $15, $61
	db $09, $61
	db $0a, $61
	db $0a, $62
	db $0a, $1d
	db $0a, $1d
	db $0a, $1d
	db $0a, $1d
	db $0a, $1d
	db $0a, $1d
	db $0a, $1d
	db $0a, $1e
	db $0a, $09
	db $0b, $0b
	db $0a, $0a
	db $0a, $0a
	db $0a, $0a
	db $0c, $0a
	db $3a, $0c
	db $3b, $27
	db $3b, $28
	db $3b, $28
	db $3b, $28
	db $3b, $28
	db $3b, $28
	db $3b, $28

.trainLine7location1sections:
.trainLine9location17sections:
	db $3c, $29
	db $09, $13
	db $0a, $14
	db $0a, $14
	db $0a, $14
	db $0c, $15
	db $10, $16
	db $11, $17
	db $11, $17
	db $11, $17
	db $12, $18
	db $16, $7a
	db $17, $7b
	db $17, $7b
	db $17, $7b
	db $18, $7c
	db $09, $1c
	db $0a, $1d
	db $0c, $1e
	db $10, $1f
	db $11, $20
	db $11, $20
	db $11, $20
	db $11, $20
	db $12, $21
	db $13, $74
	db $14, $75
	db $14, $75
	db $14, $75
	db $14, $75
	db $15, $75
	db $3a, $75
	db $3b, $75
	db $3b, $75
	db $3b, $76
	db $3b, $8f
	db $3b, $90

.trainLine7location2sections:
.trainLine9location18sections:
	db $3c, $90
	db $13, $90
	db $14, $90
	db $15, $91
	db $16, $7a
	db $17, $7b
	db $17, $7b
	db $17, $7b
	db $17, $7b
	db $17, $7b
	db $17, $7b
	db $18, $7c
	db $19, $77
	db $1a, $78
	db $1b, $78
	db $97, $78
	db $98, $78
	db $99, $78
	db $19, $78
	db $1a, $78
	db $1a, $78
	db $1a, $78
	db $1a, $78
	db $1a, $78
	db $1a, $78
	db $1a, $78
	db $1a, $78
	db $1b, $79
	db $09, $d3
	db $0a, $d4
	db $0a, $09
	db $0b, $0b
	db $0b, $0b
	db $0b, $0b
	db $0a, $0a
	db $0a, $0c
	db $0c, $27
	db $27, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28

.trainLine7location3sections:
.trainLine9location19sections:
	db $28, $29
	db $28, $09
	db $29, $0a
	db $09, $0a
	db $0a, $0a
	db $0a, $0a
	db $0c, $0c
	db $6c, $6c
	db $6d, $6d
	db $6d, $6d
	db $6d, $6d
	db $6e, $6e
	db $8f, $8f
	db $92, $92
	db $93, $93
	db $91, $91
	db $16, $19
	db $17, $1a
	db $17, $1a
	db $17, $1a
	db $18, $1b
	db $27, $13
	db $28, $14
	db $28, $14
	db $28, $14
	db $28, $14
	db $28, $14

.trainLine7location4sections:
.trainLine9location20sections:
	db $29, $14
	db $09, $14
	db $0a, $14
	db $0a, $14
	db $0a, $14
	db $0c, $15
	db $8f, $8f
	db $92, $92
	db $93, $93
	db $91, $91
	db $09, $09
	db $0b, $0b
	db $0b, $0b
	db $0a, $0a
	db $0a, $0c
	db $0a, $74
	db $0a, $75
	db $0a, $75
	db $0a, $75
	db $0c, $75
	db $27, $75
	db $28, $75
	db $28, $75
	db $28, $75
	db $28, $75
	db $28, $75

.trainLine7location5sections:
.trainLine9location21sections:
	db $29, $75
	db $8f, $75
	db $90, $75
	db $90, $75
	db $90, $75
	db $91, $75
	db $09, $76
	db $0a, $09
	db $0b, $0b
	db $0b, $0b
	db $0c, $0c
	db $09, $09
	db $0b, $0b
	db $0a, $0a
	db $0c, $0c
	db $00, $1c
	db $01, $1d
	db $01, $1d
	db $01, $1d
	db $01, $1d
	db $02, $1e
	db $09, $09
	db $0b, $0b
	db $0c, $0c
	db $13, $13
	db $14, $14
	db $14, $14
	db $15, $15
	db $16, $66
	db $17, $67
	db $18, $68
	db $c4, $c4
	db $c5, $c5
	db $c6, $c6
	db $09, $09
	db $0b, $0b
	db $0b, $0b
	db $0b, $0b
	db $0a, $0a
	db $0b, $0b
	db $0b, $0b
	db $0a, $0a
	db $0c, $0c
	db $27, $27
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28

.trainLine7location6sections:
.trainLine9location22sections:
	db $28, $29
	db $29, $b2
	db $13, $b3
	db $14, $b3
	db $15, $b3
	db $09, $b3
	db $0a, $b3
	db $0a, $b3
	db $0a, $b3
	db $0a, $b3
	db $0a, $b3
	db $0a, $b3
	db $0a, $b3
	db $0a, $b3
	db $0a, $b3
	db $0c, $b4
	db $3a, $3a
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3d, $3d
	db $3e, $3e
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3b, $3b
	db $3c, $3c
	db $1c, $1c
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d
	db $1d, $1d

.trainLine0location0scenarios:
.trainLine3location0scenarios:
	dwb 1600, SCEN_SPEED_LIMIT_35KM_H
	dwb 1420, SCEN_NO_SPEED_LIMIT
	dwb 1399, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1309, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1114, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 979, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 867, SCEN_CAB_EVENT
	dwb 800, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 649, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 489, SCEN_CAB_EVENT
	dwb 410, SCEN_MUST_PRESS_SIREN
	dwb 327, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 270, SCEN_CARRY_ON_FIELD
	dwb 207, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 140, SCEN_APPROACHING_STATION
	dw 0

.trainLine0location1scenarios:
.trainLine3location1scenarios:
	dwb 1159, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1010, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 906, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 680, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 462, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 330, SCEN_CARRY_ON_FIELD
	dwb 267, SCEN_SPEED_LIMIT_45KM_H
	dwb 258, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 220, SCEN_NO_SPEED_LIMIT
	dwb 80, SCEN_APPROACHING_STATION
	dw 0

.trainLine0location2scenarios:
.trainLine3location2scenarios:
	dwb 1469, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1435, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1357, SCEN_CAB_EVENT
	dwb 1139, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 809, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 479, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 140, SCEN_CARRY_ON_FIELD
	dwb 50, SCEN_APPROACHING_STATION
	dw 0

.trainLine0location3scenarios:
.trainLine3location3scenarios:
	dwb 620, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 616, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 120, SCEN_CARRY_ON_FIELD
	dwb 50, SCEN_APPROACHING_STATION
	dw 0

.trainLine0location4scenarios:
.trainLine3location4scenarios:
	dwb 1320, SCEN_MUST_PRESS_SIREN
	dwb 1317, SCEN_CAB_EVENT
	dwb 1099, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 769, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 235, SCEN_CARRY_ON_FIELD
	dwb 80, SCEN_APPROACHING_STATION
	dw 0

.trainLine3location5scenarios:
	dwb 759, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 710, SCEN_MUST_PRESS_SIREN
	dwb 330, SCEN_CARRY_ON_FIELD
	dwb 290, SCEN_SPEED_LIMIT_60KM_H
	dwb 80, SCEN_APPROACHING_STATION
	dw 0

.trainLine3location6scenarios:
	dwb 1745, SCEN_NO_SPEED_LIMIT
	dwb 1500, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1170, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 840, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 130, SCEN_CARRY_ON_FIELD
	dwb 50, SCEN_APPROACHING_STATION
	dw 0

.trainLine3location7scenarios:
	dwb 2270, SCEN_MUST_PRESS_SIREN
	dwb 1956, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1626, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1410, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1400, SCEN_SPEED_LIMIT_60KM_H
	dwb 1296, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1230, SCEN_NO_SPEED_LIMIT
	dwb 966, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 636, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 130, SCEN_CARRY_ON_FIELD
	dwb 50, SCEN_APPROACHING_STATION
	dw 0

.trainLine3location8scenarios:
	dwb 3590, SCEN_MUST_PRESS_SIREN
	dwb 3580, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 3380, SCEN_MUST_PRESS_SIREN
	dwb 3250, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 2920, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 2750, SCEN_MUST_PRESS_SIREN
	dwb 2590, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 2395, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 2260, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 2170, SCEN_SPEED_LIMIT_60KM_H
	dwb 1930, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1830, SCEN_NO_SPEED_LIMIT
	dwb 1600, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1270, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1070, SCEN_MUST_PRESS_SIREN
	dwb 940, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 770, SCEN_MUST_PRESS_SIREN
	dwb 610, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 240, SCEN_CARRY_ON_FIELD
	dwb 220, SCEN_SPEED_LIMIT_45KM_H
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine3location9scenarios:
	dwb 620, SCEN_DARKEN_SKY
	dwb 660, SCEN_SPEED_LIMIT_45KM_H
	dwb 535, SCEN_NO_SPEED_LIMIT
	dwb 339, SCEN_CAB_EVENT
	dwb 120, SCEN_CARRY_ON_FIELD
	dwb 50, SCEN_APPROACHING_STATION
	dwb 10, SCEN_HIDDEN_SIREN_BONUS_PTS
	dw 0

.trainLine3location10scenarios:
	dwb 536, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 130, SCEN_CARRY_ON_FIELD
	dwb 50, SCEN_APPROACHING_STATION
	dw 0

.trainLine3location11scenarios:
	dwb 2000, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1670, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1515, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1500, SCEN_SPEED_LIMIT_60KM_H
	dwb 1340, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1170, SCEN_NO_SPEED_LIMIT
	dwb 1010, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 680, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 140, SCEN_CARRY_ON_FIELD
	dwb 50, SCEN_APPROACHING_STATION
	dw 0

.trainLine3location12scenarios:
	dwb 1081, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 751, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 419, SCEN_CAB_EVENT
	dwb 385, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 345, SCEN_SPEED_LIMIT_60KM_H
	dwb 230, SCEN_SPEED_LIMIT_35KM_H
	dwb 200, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine5location0scenarios:
	dwb 1399, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1364, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1114, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1034, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 704, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 410, SCEN_MUST_PRESS_SIREN
	dwb 327, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 349, SCEN_CARRY_ON_FIELD
	dwb 207, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 140, SCEN_APPROACHING_STATION
	dw 0

.trainLine5location1scenarios:
	dwb 1159, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 994, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 906, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 462, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 384, SCEN_CARRY_ON_FIELD
	dwb 335, SCEN_SPEED_LIMIT_45KM_H
	dwb 280, SCEN_NO_SPEED_LIMIT
	dwb 258, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine5location2scenarios:
	dwb 1435, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1426, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1360, SCEN_SPEED_LIMIT_90KM_H
	dwb 1225, SCEN_SPEED_LIMIT_110KM_H
	dwb 1096, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1050, SCEN_NO_SPEED_LIMIT
	dwb 766, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 158, SCEN_CARRY_ON_FIELD
	dwb 50, SCEN_APPROACHING_STATION
	dw 0

.trainLine5location3scenarios:
	dwb 680, SCEN_SPEED_LIMIT_120KM_H
	dwb 619, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 620, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 450, SCEN_NO_SPEED_LIMIT
	dwb 140, SCEN_CARRY_ON_FIELD
	dwb 50, SCEN_APPROACHING_STATION
	dw 0

.trainLine5location4scenarios:
	dwb 1075, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 745, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 233, SCEN_CARRY_ON_FIELD
	dwb 80, SCEN_APPROACHING_STATION
	dw 0

.trainLine5location5scenarios:
	dwb 830, SCEN_SPEED_LIMIT_125KM_H
	dwb 758, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 580, SCEN_NO_SPEED_LIMIT
	dwb 353, SCEN_CARRY_ON_FIELD
	dwb 230, SCEN_APPROACHING_STATION
	dw 0

.trainLine5location6scenarios:
	dwb 1523, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1193, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 863, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 533, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 150, SCEN_CARRY_ON_FIELD
	dwb 50, SCEN_APPROACHING_STATION
	dwb 30, SCEN_MUST_PRESS_SIREN
	dw 0

.trainLine5location7scenarios:
	dwb 1956, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1626, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1296, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1230, SCEN_NO_SPEED_LIMIT
	dwb 966, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 636, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 153, SCEN_CARRY_ON_FIELD
	dwb 50, SCEN_APPROACHING_STATION
	dw 0

.trainLine5location8scenarios:
	dwb 3620, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 3290, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 2960, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 2630, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 2420, SCEN_MUST_PRESS_SIREN
	dwb 2300, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1970, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1640, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1310, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1070, SCEN_MUST_PRESS_SIREN
	dwb 980, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 650, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 307, SCEN_CARRY_ON_FIELD
	dwb 266, SCEN_SPEED_LIMIT_45KM_H
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine5location9scenarios:
	dwb 620, SCEN_DARKEN_SKY
	dwb 560, SCEN_SPEED_LIMIT_100KM_H
	dwb 145, SCEN_CARRY_ON_FIELD
	dwb 140, SCEN_NO_SPEED_LIMIT
	dwb 50, SCEN_MUST_PRESS_SIREN
	dwb 46, SCEN_APPROACHING_STATION
	dw 0

.trainLine5location10scenarios:
	dwb 539, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 155, SCEN_CARRY_ON_FIELD
	dwb 50, SCEN_APPROACHING_STATION
	dw 0

.trainLine5location11scenarios:
	dwb 2000, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1670, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1340, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1010, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 680, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 164, SCEN_CARRY_ON_FIELD
	dwb 115, SCEN_SPEED_LIMIT_120KM_H
	dwb 50, SCEN_APPROACHING_STATION
	dw 0

.trainLine5location12scenarios:
	dwb 1460, SCEN_SPEED_LIMIT_125KM_H
	dwb 1218, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1130, SCEN_NO_SPEED_LIMIT
	dwb 888, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 755, SCEN_SPEED_LIMIT_100KM_H
	dwb 455, SCEN_SPEED_LIMIT_60KM_H
	dwb 385, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 370, SCEN_CARRY_ON_FIELD
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine1location0scenarios:
.trainLine4location0scenarios:
	dwb 1690, SCEN_SPEED_LIMIT_55KM_H
	dwb 1445, SCEN_SPEED_LIMIT_80KM_H
	dwb 1399, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1331, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1300, SCEN_NO_SPEED_LIMIT
	dwb 1069, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 920, SCEN_COASTING_NOTICE
	dwb 800, SCEN_COASTING_IDLE
	dwb 739, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 700, SCEN_COASTING_END
	dwb 576, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 363, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 290, SCEN_CARRY_ON_FIELD
	dwb 213, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 192, SCEN_CAB_EVENT
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine1location1scenarios:
.trainLine4location1scenarios:
	dwb 1383, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1124, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1012, SCEN_CAB_EVENT
	dwb 1000, SCEN_SPEED_LIMIT_90KM_H
	dwb 956, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 850, SCEN_SPEED_LIMIT_110KM_H
	dwb 794, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 610, SCEN_NO_SPEED_LIMIT
	dwb 300, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine1location2scenarios:
.trainLine4location2scenarios:
	dwb 1057, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 970, SCEN_SPEED_LIMIT_90KM_H
	dwb 830, SCEN_SPEED_LIMIT_110KM_H
	dwb 727, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 550, SCEN_NO_SPEED_LIMIT
	dwb 478, SCEN_CAB_EVENT
	dwb 260, SCEN_CARRY_ON_FIELD
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine1location3scenarios:
.trainLine4location3scenarios:
	dwb 1940, SCEN_CAB_EVENT
	dwb 1906, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1830, SCEN_SPEED_LIMIT_80KM_H
	dwb 1721, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1710, SCEN_SPEED_LIMIT_90KM_H
	dwb 1600, SCEN_SPEED_LIMIT_100KM_H
	dwb 1391, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1280, SCEN_CAB_EVENT
	dwb 1061, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 960, SCEN_NO_SPEED_LIMIT
	dwb 980, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 950, SCEN_CAB_EVENT
	dwb 731, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 608, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 280, SCEN_CARRY_ON_FIELD
	dwb 186, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 140, SCEN_APPROACHING_STATION
	dw 0

.trainLine1location4scenarios:
.trainLine4location4scenarios:
	dwb 1494, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1370, SCEN_SPEED_LIMIT_90KM_H
	dwb 1360, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1350, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1249, SCEN_CAB_EVENT
	dwb 1030, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 980, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 970, SCEN_NO_SPEED_LIMIT
	dwb 700, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 240, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine1location5scenarios:
.trainLine4location5scenarios:
	dwb 824, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 633, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 487, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 310, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine1location6scenarios:
.trainLine4location6scenarios:
	dwb 1139, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 920, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 901, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 809, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 455, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 350, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine1location7scenarios:
.trainLine4location7scenarios:
	dwb 1194, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1110, SCEN_SPEED_LIMIT_110KM_H
	dwb 990, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 960, SCEN_NO_SPEED_LIMIT
	dwb 864, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 640, SCEN_COASTING_NOTICE
	dwb 535, SCEN_COASTING_IDLE
	dwb 440, SCEN_COASTING_END
	dwb 370, SCEN_CARRY_ON_FIELD
	dwb 345, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 205, SCEN_SPEED_LIMIT_55KM_H
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine2location0scenarios:
	dwb 1329, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 999, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 820, SCEN_SPEED_LIMIT_50KM_H
	dwb 550, SCEN_SPEED_LIMIT_75KM_H
	dwb 400, SCEN_CARRY_ON_FIELD
	dwb 350, SCEN_NO_SPEED_LIMIT
	dwb 260, SCEN_APPROACHING_STATION
	dw 0

.trainLine2location1scenarios:
	dwb 860, SCEN_SPEED_LIMIT_60KM_H
	dwb 800, SCEN_NO_SPEED_LIMIT
	dwb 345, SCEN_CARRY_ON_FIELD
	dwb 230, SCEN_APPROACHING_STATION
	dw 0

.trainLine2location2scenarios:
	dwb 360, SCEN_CARRY_ON_FIELD
	dwb 230, SCEN_SPEED_LIMIT_60KM_H
	dwb 230, SCEN_APPROACHING_STATION
	dw 0

.trainLine2location3scenarios:
	dwb 750, SCEN_NO_SPEED_LIMIT
	dwb 310, SCEN_CARRY_ON_FIELD
	dwb 260, SCEN_APPROACHING_STATION
	dw 0

.trainLine2location4scenarios:
	dwb 400, SCEN_CARRY_ON_FIELD
	dwb 330, SCEN_SPEED_LIMIT_65KM_H
	dwb 260, SCEN_APPROACHING_STATION
	dw 0

.trainLine2location5scenarios:
	dwb 900, SCEN_NO_SPEED_LIMIT
	dwb 860, SCEN_SPEED_LIMIT_70KM_H
	dwb 780, SCEN_SPEED_LIMIT_75KM_H
	dwb 710, SCEN_NO_SPEED_LIMIT
	dwb 275, SCEN_CARRY_ON_FIELD
	dwb 230, SCEN_APPROACHING_STATION
	dw 0

.trainLine2location6scenarios:
	dwb 270, SCEN_CARRY_ON_FIELD
	dwb 230, SCEN_APPROACHING_STATION
	dw 0

.trainLine2location7scenarios:
	dwb 280, SCEN_CARRY_ON_FIELD
	dwb 230, SCEN_APPROACHING_STATION
	dw 0

.trainLine2location8scenarios:
	dwb 270, SCEN_CARRY_ON_FIELD
	dwb 260, SCEN_APPROACHING_STATION
	dw 0

.trainLine6location0scenarios:
	dwb 570, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 217, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dwb 57, SCEN_SPEED_LIMIT_85KM_H
	dw 0

.trainLine6location1scenarios:
	dwb 784, SCEN_NO_SPEED_LIMIT
	dwb 220, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine6location2scenarios:
	dwb 583, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 230, SCEN_CARRY_ON_FIELD
	dwb 189, SCEN_SPEED_LIMIT_90KM_H
	dwb 182, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 140, SCEN_APPROACHING_STATION
	dw 0

.trainLine6location3scenarios:
	dwb 999, SCEN_SPEED_LIMIT_85KM_H
	dwb 903, SCEN_NO_SPEED_LIMIT
	dwb 828, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 773, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 679, SCEN_SPEED_LIMIT_90KM_H
	dwb 260, SCEN_CARRY_ON_FIELD
	dwb 208, SCEN_NO_SPEED_LIMIT
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine6location4scenarios:
	dwb 1198, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 868, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 847, SCEN_SPEED_LIMIT_60KM_H
	dwb 501, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 463, SCEN_NO_SPEED_LIMIT
	dwb 230, SCEN_CARRY_ON_FIELD
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine6location5scenarios:
	dwb 810, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 270, SCEN_CARRY_ON_FIELD
	dwb 205, SCEN_MUST_PRESS_SIREN
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine6location6scenarios:
	dwb 500, SCEN_DARKEN_SKY
	dwb 210, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine6location7scenarios:
	dwb 879, SCEN_CAB_EVENT
	dwb 660, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 250, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine6location8scenarios:
	dwb 765, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 632, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 320, SCEN_CARRY_ON_FIELD
	dwb 262, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 226, SCEN_SPEED_LIMIT_60KM_H
	dwb 140, SCEN_APPROACHING_STATION
	dw 0

.trainLine8location0scenarios:
	dwb 217, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dwb 143, SCEN_CAB_EVENT
	dwb 57, SCEN_SPEED_LIMIT_85KM_H
	dw 0

.trainLine8location1scenarios:
	dwb 784, SCEN_NO_SPEED_LIMIT
	dwb 220, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine8location2scenarios:
	dwb 583, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 230, SCEN_CARRY_ON_FIELD
	dwb 189, SCEN_SPEED_LIMIT_90KM_H
	dwb 182, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 140, SCEN_APPROACHING_STATION
	dw 0

.trainLine8location3scenarios:
	dwb 999, SCEN_SPEED_LIMIT_85KM_H
	dwb 903, SCEN_NO_SPEED_LIMIT
	dwb 828, SCEN_MUST_PRESS_SIREN
	dwb 773, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 679, SCEN_SPEED_LIMIT_90KM_H
	dwb 260, SCEN_CARRY_ON_FIELD
	dwb 208, SCEN_NO_SPEED_LIMIT
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine8location4scenarios:
	dwb 1198, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 868, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 847, SCEN_SPEED_LIMIT_60KM_H
	dwb 501, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 463, SCEN_NO_SPEED_LIMIT
	dwb 230, SCEN_CARRY_ON_FIELD
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine8location5scenarios:
	dwb 810, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 270, SCEN_CARRY_ON_FIELD
	dwb 205, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine8location6scenarios:
	dwb 500, SCEN_DARKEN_SKY
	dwb 210, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dwb 139, SCEN_CAB_EVENT
	dw 0

.trainLine8location7scenarios:
	dwb 895, SCEN_CAB_EVENT
	dwb 676, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 278, SCEN_SPEED_LIMIT_60KM_H
	dwb 250, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine8location8scenarios:
	dwb 995, SCEN_NO_SPEED_LIMIT
	dwb 709, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 592, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 320, SCEN_CARRY_ON_FIELD
	dwb 192, SCEN_MUST_PRESS_SIREN
	dwb 169, SCEN_SPEED_LIMIT_60KM_H
	dwb 140, SCEN_APPROACHING_STATION
	dw 0

.trainLine7location0scenarios:
	dwb 1900, SCEN_NO_SPEED_LIMIT
	dwb 1659, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1547, SCEN_CAB_EVENT
	dwb 1510, SCEN_COASTING_NOTICE
	dwb 1413, SCEN_COASTING_IDLE
	dwb 1357, SCEN_SPEED_LIMIT_105KM_H
	dwb 1329, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1313, SCEN_COASTING_END
	dwb 1217, SCEN_CAB_EVENT
	dwb 1210, SCEN_NO_SPEED_LIMIT
	dwb 999, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 660, SCEN_SPEED_LIMIT_85KM_H
	dwb 480, SCEN_NO_SPEED_LIMIT
	dwb 340, SCEN_CARRY_ON_FIELD
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine7location1scenarios:
	dwb 1030, SCEN_SPEED_LIMIT_110KM_H
	dwb 900, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 846, SCEN_NO_SPEED_LIMIT
	dwb 794, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 790, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 589, SCEN_CAB_EVENT
	dwb 370, SCEN_CARRY_ON_FIELD
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine7location2scenarios:
	dwb 1003, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 673, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 489, SCEN_CAB_EVENT
	dwb 270, SCEN_CARRY_ON_FIELD
	dwb 230, SCEN_APPROACHING_STATION
	dw 0

.trainLine7location3scenarios:
	dwb 600, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 528, SCEN_SPEED_LIMIT_115KM_H
	dwb 370, SCEN_NO_SPEED_LIMIT
	dwb 330, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine7location4scenarios:
	dwb 610, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 280, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

	dwb 1177, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 847, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 650, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 495, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 470, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 250, SCEN_CARRY_ON_FIELD
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine7location6scenarios:
	dwb 390, SCEN_CARRY_ON_FIELD
	dwb 340, SCEN_SPEED_LIMIT_45KM_H
	dwb 290, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location0scenarios:
	dwb 1128, SCEN_SPEED_LIMIT_60KM_H
	dwb 910, SCEN_SPEED_LIMIT_80KM_H
	dwb 850, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 560, SCEN_CAB_EVENT
	dwb 340, SCEN_CARRY_ON_FIELD
	dwb 289, SCEN_SPEED_LIMIT_120KM_H
	dwb 260, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location1scenarios:
	dwb 725, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 717, SCEN_NO_SPEED_LIMIT
	dwb 710, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 518, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 420, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 280, SCEN_CARRY_ON_FIELD
	dwb 230, SCEN_APPROACHING_STATION
	dwb 218, SCEN_SPEED_LIMIT_120KM_H
	dw 0

.trainLine9location2scenarios:
	dwb 1743, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1717, SCEN_NO_SPEED_LIMIT
	dwb 1600, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1574, SCEN_COASTING_NOTICE
	dwb 1521, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1470, SCEN_COASTING_IDLE
	dwb 1367, SCEN_COASTING_END
	dwb 1305, SCEN_SPEED_LIMIT_95KM_H
	dwb 1256, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1220, SCEN_MUST_PRESS_SIREN
	dwb 1192, SCEN_NO_SPEED_LIMIT
	dwb 1191, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1080, SCEN_CAB_EVENT
	dwb 1070, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 861, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 847, SCEN_SPEED_LIMIT_125KM_H
	dwb 765, SCEN_NO_SPEED_LIMIT
	dwb 527, SCEN_SPEED_LIMIT_115KM_H
	dwb 420, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 350, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 330, SCEN_CARRY_ON_FIELD
	dwb 284, SCEN_SPEED_LIMIT_120KM_H
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location3scenarios:
	dwb 870, SCEN_NO_SPEED_LIMIT
	dwb 690, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 280, SCEN_CARRY_ON_FIELD
	dwb 244, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 230, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location4scenarios:
	dwb 949, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 742, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 619, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 590, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 280, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 260, SCEN_CARRY_ON_FIELD
	dwb 206, SCEN_SPEED_LIMIT_120KM_H
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location5scenarios:
	dwb 1523, SCEN_NO_SPEED_LIMIT
	dwb 1430, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1429, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1310, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1099, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 840, SCEN_COASTING_NOTICE
	dwb 760, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 730, SCEN_COASTING_IDLE
	dwb 649, SCEN_COASTING_END
	dwb 610, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 375, SCEN_CARRY_ON_FIELD
	dwb 290, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 200, SCEN_APPROACHING_STATION
	dwb 198, SCEN_SPEED_LIMIT_120KM_H
	dw 0

.trainLine9location6scenarios:
	dwb 980, SCEN_NO_SPEED_LIMIT
	dwb 800, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 786, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 480, SCEN_CAB_EVENT
	dwb 260, SCEN_CARRY_ON_FIELD
	dwb 210, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 140, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location7scenarios:
	dwb 720, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 330, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 380, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 300, SCEN_CARRY_ON_FIELD
	dwb 247, SCEN_SPEED_LIMIT_110KM_H
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location8scenarios:
	dwb 1033, SCEN_SPEED_LIMIT_90KM_H
	dwb 875, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 220, SCEN_CARRY_ON_FIELD
	dwb 200, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location9scenarios:
	dwb 1330, SCEN_NO_SPEED_LIMIT
	dwb 1119, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 870, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 789, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 670, SCEN_MUST_PRESS_SIREN
	dwb 630, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 530, SCEN_CAB_EVENT
	dwb 310, SCEN_CARRY_ON_FIELD
	dwb 230, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location10scenarios:
	dwb 1331, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1220, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1100, SCEN_COASTING_NOTICE
	dwb 1031, SCEN_COASTING_IDLE
	dwb 1001, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1000, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 900, SCEN_COASTING_END
	dwb 740, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 676, SCEN_SPEED_LIMIT_120KM_H
	dwb 579, SCEN_CAB_EVENT
	dwb 550, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 360, SCEN_CARRY_ON_FIELD
	dwb 300, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location11scenarios:
	dwb 911, SCEN_NO_SPEED_LIMIT
	dwb 860, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 695, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 340, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 270, SCEN_CARRY_ON_FIELD
	dwb 230, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location12scenarios:
	dwb 1820, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1814, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1484, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1154, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1042, SCEN_CAB_EVENT
	dwb 923, SCEN_SPEED_LIMIT_120KM_H
	dwb 830, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 824, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 495, SCEN_NO_SPEED_LIMIT
	dwb 310, SCEN_CARRY_ON_FIELD
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location13scenarios:
	dwb 1750, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 1482, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1152, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 822, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 550, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 360, SCEN_CARRY_ON_FIELD
	dwb 290, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 200, SCEN_APPROACHING_STATION
	dwb 54, SCEN_SPEED_LIMIT_100KM_H
	dw 0

.trainLine9location14scenarios:
	dwb 725, SCEN_NO_SPEED_LIMIT
	dwb 650, SCEN_MUST_PRESS_SIREN
	dwb 635, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 260, SCEN_CARRY_ON_FIELD
	dwb 230, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location15scenarios:
	dwb 775, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 410, SCEN_CARRY_ON_FIELD
	dwb 323, SCEN_SPEED_LIMIT_55KM_H
	dwb 290, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location16scenarios:
	dwb 1900, SCEN_NO_SPEED_LIMIT
	dwb 1659, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1547, SCEN_CAB_EVENT
	dwb 1510, SCEN_COASTING_NOTICE
	dwb 1413, SCEN_COASTING_IDLE
	dwb 1357, SCEN_SPEED_LIMIT_115KM_H
	dwb 1329, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 1313, SCEN_COASTING_END
	dwb 1217, SCEN_CAB_EVENT
	dwb 1210, SCEN_NO_SPEED_LIMIT
	dwb 999, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 660, SCEN_SPEED_LIMIT_95KM_H
	dwb 480, SCEN_NO_SPEED_LIMIT
	dwb 340, SCEN_CARRY_ON_FIELD
	dwb 230, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location17scenarios:
	dwb 1030, SCEN_SPEED_LIMIT_120KM_H
	dwb 900, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 846, SCEN_NO_SPEED_LIMIT
	dwb 794, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 790, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 589, SCEN_CAB_EVENT
	dwb 370, SCEN_CARRY_ON_FIELD
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location18scenarios:
	dwb 1003, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 673, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 489, SCEN_CAB_EVENT
	dwb 270, SCEN_CARRY_ON_FIELD
	dwb 230, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location19scenarios:
	dwb 590, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 528, SCEN_SPEED_LIMIT_120KM_H
	dwb 370, SCEN_NO_SPEED_LIMIT
	dwb 330, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location20scenarios:
	dwb 610, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 280, SCEN_CARRY_ON_FIELD
	dwb 170, SCEN_APPROACHING_STATION
	dw 0

.trainLine7location5scenarios:
.trainLine9location21scenarios:
	dwb 1177, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 847, SCEN_CUSTOM_SPEED_LIMIT_OR_STOP
	dwb 650, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 560, SCEN_HIDDEN_SIREN_BONUS_PTS
	dwb 470, SCEN_ALT_RED_LIGHTS_NO_BONUS
	dwb 250, SCEN_CARRY_ON_FIELD
	dwb 200, SCEN_APPROACHING_STATION
	dw 0

.trainLine9location22scenarios:
	dwb 390, SCEN_CARRY_ON_FIELD
	dwb 340, SCEN_SPEED_LIMIT_45KM_H
	dwb 290, SCEN_APPROACHING_STATION
	dw 0

.trainLine10location0scenarios:
	dwb 9840, SCEN_ATC_210KM_H
	dwb 7200, SCEN_ATC_245KM_H
	dwb 4800, SCEN_ATC_210KM_H
	dwb 4000, SCEN_ATC_210KM_H
	dwb 3300, SCEN_ATC_160KM_H
	dwb 2500, SCEN_ATC_160KM_H
	dwb 2000, SCEN_ATC_110KM_H
	dwb 1400, SCEN_ATC_110KM_H
	dwb 1000, SCEN_ATC_70KM_H
	dwb 500, SCEN_ATC_70KM_H
	dwb 440, SCEN_APPROACHING_STATION
	dwb 350, SCEN_ATC_30KM_H
	dwb 150, SCEN_ATC_30KM_H
	dw 0
