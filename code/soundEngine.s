INCLUDE "includes.s"

SECTION "Sound engine", ROM0[$3880]

; A - $18 - wait loop value between bytes
; HL - address containing data source address
ProcessVolumeModulatedSndBytes:
	ld   [wVolumeModulatedLoopValue], a                             ; $3880

; Clear volume, output to all terminals, and disable sound
	ld   a, $00                                                     ; $3883
	ldh  [rAUDVOL], a                                               ; $3885
	ld   a, $ff                                                     ; $3887
	ldh  [rAUDTERM], a                                              ; $3889
	ld   a, $00                                                     ; $388b
	ldh  [rAUD3ENA], a                                              ; $388d

; Clear wav ram
	ldbc $10, LOW(_AUD3WAVERAM)                                     ; $388f
	xor  a                                                          ; $3892
:	ldh  [c], a                                                     ; $3893
	inc  c                                                          ; $3894
	dec  b                                                          ; $3895
	jr   nz, :-                                                     ; $3896

; Sound hardware reg setup
; All - no len, no env, restart sound, max freq
; Aud 1 - no sweep, max env vol
; Aud 2 - max env vol
; Aud 3 - enable, no level
; Aud 4 - min env vol, scf of $d and max div ratio
	ld   a, $00                                                     ; $3898
	ldh  [rAUD1SWEEP], a                                            ; $389a
	ld   a, $80                                                     ; $389c
	ldh  [rAUD3ENA], a                                              ; $389e
	xor  a                                                          ; $38a0
	ldh  [rAUD1LEN], a                                              ; $38a1
	ldh  [rAUD2LEN], a                                              ; $38a3
	ldh  [rAUD3LEN], a                                              ; $38a5
	ldh  [rAUD4LEN], a                                              ; $38a7
	ld   a, $f0                                                     ; $38a9
	ldh  [rAUD1ENV], a                                              ; $38ab
	ld   a, $f0                                                     ; $38ad
	ldh  [rAUD2ENV], a                                              ; $38af
	ld   a, $00                                                     ; $38b1
	ldh  [rAUD3LEVEL], a                                            ; $38b3
	ld   a, $10                                                     ; $38b5
	ldh  [rAUD4ENV], a                                              ; $38b7
	ld   a, $ff                                                     ; $38b9
	ldh  [rAUD1LOW], a                                              ; $38bb
	ld   a, $ff                                                     ; $38bd
	ldh  [rAUD2LOW], a                                              ; $38bf
	ld   a, $ff                                                     ; $38c1
	ldh  [rAUD3LOW], a                                              ; $38c3
	ld   a, $d7                                                     ; $38c5
	ldh  [rAUD4POLY], a                                             ; $38c7
	ld   a, $87                                                     ; $38c9
	ldh  [rAUD1HIGH], a                                             ; $38cb
	ld   a, $87                                                     ; $38cd
	ldh  [rAUD2HIGH], a                                             ; $38cf
	ld   a, $87                                                     ; $38d1
	ldh  [rAUD3HIGH], a                                             ; $38d3
	ld   a, $80                                                     ; $38d5
	ldh  [rAUD4GO], a                                               ; $38d7

; 1st byte is rom bank, put in B
	ld   a, [hl+]                                                   ; $38d9
	ld   [ROMB0], a                                                 ; $38da
	ld   b, a                                                       ; $38dd

; HL = source address
	ld   a, [hl+]                                                   ; $38de
	ld   h, [hl]                                                    ; $38df
	ld   l, a                                                       ; $38e0

; Skip 1st 4 bytes in bank
	ld   de, $0004                                                  ; $38e1
	add  hl, de                                                     ; $38e4

; Next 3 bytes in EDC (volume byte length), skip byte after that
	ld   a, [hl+]                                                   ; $38e5
	ld   e, a                                                       ; $38e6
	ld   a, [hl+]                                                   ; $38e7
	ld   d, a                                                       ; $38e8
	ld   a, [hl+]                                                   ; $38e9
	ld   c, a                                                       ; $38ea
	inc  hl                                                         ; $38eb

.toWaitLoop:
	jr   .waitLoop                                                  ; $38ec

.processNextByte:
; Resume in current bank
	ld   a, b                                                       ; $38ee
	ld   [ROMB0], a                                                 ; $38ef

; Get next byte
	ld   a, [hl+]                                                   ; $38f2
	ldh  [rAUDVOL], a                                               ; $38f3

; Below checks if we are in the next bank
; Shift H left once, if a carry is detected, it adds 1 to B
	ld   a, h                                                       ; $38f5
	add  a                                                          ; $38f6
	ld   h, a                                                       ; $38f7
	adc  b                                                          ; $38f8
	sub  h                                                          ; $38f9
	ld   b, a                                                       ; $38fa

; Shift H back right. If in a new bank, H is set to point to start of new bank
	ld   a, h                                                       ; $38fb
	rrca                                                            ; $38fc
	or   HIGH($4000)                                                ; $38fd
	ld   h, a                                                       ; $38ff

; Sub 1 from byte length in EDC
	ld   a, e                                                       ; $3900
	sub  $01                                                        ; $3901
	ld   a, d                                                       ; $3903
	sbc  $00                                                        ; $3904
	dec  de                                                         ; $3906
	ld   a, c                                                       ; $3907
	sbc  $00                                                        ; $3908
	ld   c, a                                                       ; $390a

; Once 0, mute and stop processing
	or   e                                                          ; $390b
	or   d                                                          ; $390c
	jr   nz, .toWaitLoop                                            ; $390d

	ld   a, $00                                                     ; $390f
	ldh  [rAUDVOL], a                                               ; $3911
	ret                                                             ; $3913

.waitLoop:
; Do loop below based on given loop value
	push af                                                         ; $3914
	ld   a, [wVolumeModulatedLoopValue]                             ; $3915

:	dec  a                                                          ; $3918
	jr   nz, :-                                                     ; $3919

	pop  af                                                         ; $391b
	jr   .processNextByte                                           ; $391c


; Idx 1 not used (bank doesn't exist)
VolumeModulatedSounds:
	db BANK(VolumeModulatedSound_DenshaDeGo)
	dw VolumeModulatedSound_DenshaDeGo
	db $05, $00, $40


; A - idx of sound to play
PlaySelectedVolumeModulatedSound::
; Disable interrupts during this, DE contains sound idx
	di                                                              ; $3924
	ld   e, a                                                       ; $3925
	ld   d, $00                                                     ; $3926

; Preserve rom bank, HL = triple offset into table
	ld   a, [wRomBank]                                              ; $3928
	push af                                                         ; $392b
	ld   hl, VolumeModulatedSounds                                  ; $392c
	add  hl, de                                                     ; $392f
	add  hl, de                                                     ; $3930
	add  hl, de                                                     ; $3931

; Go through sound bytes
	ld   a, $18                                                     ; $3932
	call ProcessVolumeModulatedSndBytes                             ; $3934

; Disable sound
	ld   a, $00                                                     ; $3937
	ldh  [rAUDENA], a                                               ; $3939

; Play null music
	lda  MUS_NULL                                                   ; $393b
	call PlaySound                                                  ; $393c
	call UpdateSound                                                ; $393f

; Play null sound effect
	ld   a, SND_NULL                                                ; $3942
	call PlaySound                                                  ; $3944
	call UpdateSound                                                ; $3947

; Reset audio vars again
	call InitAudio                                                  ; $394a

; Restore rom bank and re-allow interrupts
	pop  af                                                         ; $394d
	call SetRomBank1stHalfOfRom                                     ; $394e
	ei                                                              ; $3951
	ret                                                             ; $3952


InitAudio::
; All sound on, enable all channels
	ld   a, $8f                                                     ; $3953
	ldh  [rAUDENA], a                                               ; $3955

; Copy default wav ram
	ld   hl, DefaultWavRam                                          ; $3957
	ldbc (DefaultWavRam.end-DefaultWavRam), LOW(_AUD3WAVERAM)       ; $395a
:	ld   a, [hl+]                                                   ; $395d
	ldh  [c], a                                                     ; $395e
	inc  c                                                          ; $395f
	dec  b                                                          ; $3960
	jr   nz, :-                                                     ; $3961

; Enable all sound and set base song speed
	ld   a, $80                                                     ; $3963
	ldh  [rAUD3ENA], a                                              ; $3965
	ld   a, $04                                                     ; $3967
	ld   [wSongSpeed], a                                            ; $3969

; Aud vol to be maxed, aud term to output to all, and set aud1 sweep to subtract
	ld   a, $7f                                                     ; $396c
	ld   [wFadingAudVol], a                                         ; $396e
	ld   a, $ff                                                     ; $3971
	ld   [wBuiltUpAudTermMask], a                                   ; $3973
	call SoundByte_F6_SetAud1SweepToSubtract                        ; $3976

; Clear sound struct channel addresses and init stack offsets
	ld   a, HIGH(NULL_SND_ADDR)                                     ; $3979
	ld   h, HIGH(PAGE_0)                                            ; $397b
	ldbc NUM_SOUND_STRUCTS, $ff                                     ; $397d
:	ld   l, AUD_CHAN_ADDR+1                                         ; $3980
	ld   [hl], a                                                    ; $3982
	ld   l, AUD_STACK_OFFSET                                        ; $3983
	ld   [hl], l                                                    ; $3985
	inc  h                                                          ; $3986
	dec  b                                                          ; $3987
	jr   nz, :-                                                     ; $3988

	ret                                                             ; $398a


; A - sound idx
PlaySound::
; Preserve sound regs
	push af                                                         ; $398b
	push bc                                                         ; $398c
	push de                                                         ; $398d
	push hl                                                         ; $398e

; A preserved to preserve rom bank
	ld   b, a                                                       ; $398f
	ld   a, [wRomBank]                                              ; $3990
	push af                                                         ; $3993
	ld   a, b                                                       ; $3994

; Double idx to check if bit 7 set
	ld   de, PAGE_0+AUD_CHAN_BANK                                   ; $3995
	add  a                                                          ; $3998
	jr   nc, :+                                                     ; $3999

; If bit 7 set, it is a sound effect that can override music
	ld   d, HIGH(PAGE_4)                                            ; $399b

; Double sound idx in hl
:	ld   l, a                                                       ; $399d
	ld   h, $00                                                     ; $399e

; HL = 8 * sound idx
	add  hl, hl                                                     ; $39a0
	add  hl, hl                                                     ; $39a1

; Carry into C = sound idx, HL = 9 * sound idx offset into table
	rrca                                                            ; $39a2
	ld   c, a                                                       ; $39a3
	ld   b, HIGH(MusicAndSoundEffectsChannelDataLocations)          ; $39a4
	add  hl, bc                                                     ; $39a6

; Set rom bank to table
	ld   a, BANK(MusicAndSoundEffectsChannelDataLocations)          ; $39a7
	call SetRomBank1stHalfOfRom                                     ; $39a9

; Store 9 vars, starting with song's bank
	ld   a, [hl+]                                                   ; $39ac
	ld   [de], a                                                    ; $39ad

; Then word into Aud 1 channel's address
	inc  e                                                          ; $39ae
	ld   a, [hl+]                                                   ; $39af
	ld   [de], a                                                    ; $39b0
	inc  e                                                          ; $39b1
	ld   a, [hl+]                                                   ; $39b2
	ld   [de], a                                                    ; $39b3

; Then big-endian word into Aud 2 channel's address
	inc  d                                                          ; $39b4
	ld   a, [hl+]                                                   ; $39b5
	ld   [de], a                                                    ; $39b6
	dec  e                                                          ; $39b7
	ld   a, [hl+]                                                   ; $39b8
	ld   [de], a                                                    ; $39b9

; Then word into Aud 3 channel's address
	inc  d                                                          ; $39ba
	ld   a, [hl+]                                                   ; $39bb
	ld   [de], a                                                    ; $39bc
	inc  e                                                          ; $39bd
	ld   a, [hl+]                                                   ; $39be
	ld   [de], a                                                    ; $39bf

; Then big-endian word into Aud 4 channel's address
	inc  d                                                          ; $39c0
	ld   a, [hl+]                                                   ; $39c1
	ld   [de], a                                                    ; $39c2
	dec  e                                                          ; $39c3
	ld   a, [hl]                                                    ; $39c4
	ld   [de], a                                                    ; $39c5

; At page 3 or 7 now. For this and 3 pages below..
	ld   h, d                                                       ; $39c6
	ld   b, $04                                                     ; $39c7

.nextSndChannel:
; Clear counter var and AUD_THRESHOLD_FOR_COUNTER_TO_NEXT_SOUND_BYTE
	xor  a                                                          ; $39c9
	ld   l, AUD_COUNTER_TIL_NEXT_SOUND_BYTE                         ; $39ca
	ld   [hl+], a                                                   ; $39cc
	ld   [hl], a                                                    ; $39cd

; Disable alternating aud term, and clear freq table idx
	ld   l, AUD_ALTERNATE_TERM_ENABLED_AND_COUNTER                  ; $39ce
	ld   [hl], a                                                    ; $39d0
	ld   l, AUD_FREQ_TABLE_BASE_IDX                                 ; $39d1
	ld   [hl-], a                                                   ; $39d3

	dec  h                                                          ; $39d4
	dec  b                                                          ; $39d5
	jr   nz, .nextSndChannel                                        ; $39d6

; Restore rom bank and regs
	pop  af                                                         ; $39d8
	call SetRomBank1stHalfOfRom                                     ; $39d9
	pop  hl                                                         ; $39dc
	pop  de                                                         ; $39dd
	pop  bc                                                         ; $39de
	pop  af                                                         ; $39df
	ret                                                             ; $39e0


UpdateSound::
; Preserve regs and rom bank
	push af                                                         ; $39e1
	push bc                                                         ; $39e2
	push de                                                         ; $39e3
	push hl                                                         ; $39e4
	ld   a, [wRomBank]                                              ; $39e5
	push af                                                         ; $39e8

; --
; -- Sound effect
; --
; Move music general vars into scratch space (0->12)
; Move sound effect general vars into 1st spot (6->0)
	ld   hl, wAudioGeneralVarsScratchSpace+0                        ; $39e9
	ld   de, wAudioGeneralVarsScratchSpace+12                       ; $39ec
	ld   bc, wAudioGeneralVarsScratchSpace+6                        ; $39ef

rept 5
	ld   a, [hl]                                                    ; $39f2
	ld   [de], a                                                    ; $39f3
	ld   a, [bc]                                                    ; $39f4
	ld   [hl+], a                                                   ; $39f5
	inc  c                                                          ; $39f6
	inc  e                                                          ; $39f7
endr
	ld   a, [hl]                                                    ; $3a10
	ld   [de], a                                                    ; $3a11
	ld   a, [bc]                                                    ; $3a12
	ld   [hl], a                                                    ; $3a13

; Preserve main music's square wave lengths
	ldh  a, [rAUD1LEN]                                              ; $3a14
	ld   [wMainMusicPreservedAud1Len], a                            ; $3a16
	ldh  a, [rAUD2LEN]                                              ; $3a19
	ld   [wMainMusicPreservedAud2Len], a                            ; $3a1b

; Clear if sound is playing for sound effects
	ld   hl, PAGE_7+AUD_11h_IF_SOUND_HW_REG_USED                    ; $3a1e
	xor  a                                                          ; $3a21
rept 3
	ld   [hl], a                                                    ; $3a22
	dec  h                                                          ; $3a23
endr
	ld   [hl], a                                                    ; $3a28

; Then process the sound effect
	call UpdateMusicOrSoundEffect                                   ; $3a29

; --
; -- Music
; --
; Move sound effect general vars in its original spot (0->6)
; Move music general vars in its 1st spot (12->0)
	ld   hl, wAudioGeneralVarsScratchSpace+0                        ; $3a2c
	ld   de, wAudioGeneralVarsScratchSpace+12                       ; $3a2f
	ld   bc, wAudioGeneralVarsScratchSpace+6                        ; $3a32
rept 5
	ld   a, [hl]                                                    ; $3a35
	ld   [bc], a                                                    ; $3a36
	ld   a, [de]                                                    ; $3a37
	ld   [hl+], a                                                   ; $3a38
	inc  c                                                          ; $3a39
	inc  e                                                          ; $3a3a
endr
	ld   a, [hl]                                                    ; $3a53
	ld   [bc], a                                                    ; $3a54
	ld   a, [de]                                                    ; $3a55
	ld   [hl], a                                                    ; $3a56

; Restore square wave lengths for music
	ld   a, [wMainMusicPreservedAud1Len]                            ; $3a57
	ldh  [rAUD1LEN], a                                              ; $3a5a
	ld   a, [wMainMusicPreservedAud2Len]                            ; $3a5c
	ldh  [rAUD2LEN], a                                              ; $3a5f

; Copy state of if hardware regs are used, so music doesn't play over it
	ld   de, PAGE_7+AUD_11h_IF_SOUND_HW_REG_USED                    ; $3a61
	ld   hl, PAGE_3+AUD_11h_IF_SOUND_HW_REG_USED                    ; $3a64
rept 3
	ld   a, [de]                                                    ; $3a67
	ld   [hl], a                                                    ; $3a68
	dec  h                                                          ; $3a69
	dec  d                                                          ; $3a6a
endr
	ld   a, [de]                                                    ; $3a73
	ld   [hl], a                                                    ; $3a74

; Then update music
	call UpdateMusicOrSoundEffect                                   ; $3a75

; --
; -- Aud term and vol
; --
; Based on final state of if hw regs are used for channels,
; Take $11 (output SQ1 to SO1 and SO2) and shift it left based on sound channel
	ld   hl, PAGE_3+AUD_11h_IF_SOUND_HW_REG_USED                    ; $3a78

	ld   a, [hl]                                                    ; $3a7b
	dec  h                                                          ; $3a7c
	add  a                                                          ; $3a7d
	or   [hl]                                                       ; $3a7e
	dec  h                                                          ; $3a7f
	add  a                                                          ; $3a80
	or   [hl]                                                       ; $3a81
	dec  h                                                          ; $3a82
	add  a                                                          ; $3a83
	or   [hl]                                                       ; $3a84

; Finally apply mask if set
	ld   hl, wAudTermMask                                           ; $3a85
	and  [hl]                                                       ; $3a88
	ldh  [rAUDTERM], a                                              ; $3a89

; Set from wAudVol
	dec  l                                                          ; $3a8b
	ld   a, [hl]                                                    ; $3a8c
	ldh  [rAUDVOL], a                                               ; $3a8d

; Restore rom bank and regs
	pop  af                                                         ; $3a8f
	call SetRomBank1stHalfOfRom                                     ; $3a90
	pop  hl                                                         ; $3a93
	pop  de                                                         ; $3a94
	pop  bc                                                         ; $3a95
	pop  af                                                         ; $3a96
	ret                                                             ; $3a97


UpdateMusicOrSoundEffect:
; Set rom bank containing sound data bytes
	ld   l, AUD_CHAN_BANK                                           ; $3a98
	ld   a, [hl]                                                    ; $3a9a
	call SetRomBank1stHalfOfRom                                     ; $3a9b

; --
; -- Aud channel loop
; --
; SQ1 = 0, SQ2 = 1, etc
	xor  a                                                          ; $3a9e
	ld   [wIdxOfSoundChannelBeingUpdated], a                        ; $3a9f

; Start with A = low byte of 1st SQ1 reg
; SQ2 and Noise will have A = 1st hw reg-1, since they have 4 regs instead of 5
	ld   a, LOW(rAUD1SWEEP)                                         ; $3aa2

.nextSndChannel:
	ld   [wLowByteOfCurrSoundChannelHWRegLastMinus4], a             ; $3aa4

; If addr high byte is $80, ie address $8000, this marks that we should skip this channel
	ld   l, AUD_CHAN_ADDR+1                                         ; $3aa7
	ld   a, [hl]                                                    ; $3aa9
	add  a                                                          ; $3aaa
	jr   c, .toNextSndChannel                                       ; $3aab

; If sound byte counter > AUD_THRESHOLD_FOR_COUNTER_TO_NEXT_SOUND_BYTE, ...
	ld   l, AUD_COUNTER_TIL_NEXT_SOUND_BYTE                         ; $3aad
	ld   a, [hl+]                                                   ; $3aaf
	sub  [hl]                                                       ; $3ab0
	jr   c, .addTempo                                               ; $3ab1

; Store diff back in AUD_COUNTER_TIL_NEXT_SOUND_BYTE and process next sound byte
	dec  l                                                          ; $3ab3
	ld   [hl], a                                                    ; $3ab4
	call HandleNextSoundByte                                        ; $3ab5

.addTempo:
; Add song speed to counter
	ld   a, [wSongSpeed]                                            ; $3ab8
	ld   l, AUD_COUNTER_TIL_NEXT_SOUND_BYTE                         ; $3abb
	add  [hl]                                                       ; $3abd
	ld   [hl], a                                                    ; $3abe

; Set that this sound hw channel was used
	ld   l, AUD_11h_IF_SOUND_HW_REG_USED                            ; $3abf
	ld   [hl], $11                                                  ; $3ac1

.toNextSndChannel:
; Preserve sound channel struct high byte
	ld   b, h                                                       ; $3ac3

; Get low byte of hw reg for later
	ld   hl, wLowByteOfCurrSoundChannelHWRegLastMinus4              ; $3ac4
	ld   a, [hl-]                                                   ; $3ac7

; Inc wIdxOfSoundChannelBeingUpdated
	inc  [hl]                                                       ; $3ac8

; Get sound channel struct high byte and inc it
	ld   h, b                                                       ; $3ac9
	inc  h                                                          ; $3aca

; Add 5 to low byte of hw reg to get to low byte of next channel's hw regs
	add  $05                                                        ; $3acb
	cp   LOW(rAUD4GO)+1                                             ; $3acd
	jr   c, .nextSndChannel                                         ; $3acf

; --
; -- Aud Term
; --
; Inc aud vol fade counter (every 32 of this function being invocated), vol changes
	ld   hl, wCounterForFadingAudVol                                ; $3ad1
	inc  [hl]                                                       ; $3ad4
	ld   a, [hl]                                                    ; $3ad5
	and  $1f                                                        ; $3ad6
	ld   e, a                                                       ; $3ad8

; High byte of fading aud vol is the actual vol for both sound outputs
	ld   a, [wFadingAudVol]                                         ; $3ad9
	ld   b, a                                                       ; $3adc
	and  $70                                                        ; $3add
	ld   c, a                                                       ; $3adf
	swap c                                                          ; $3ae0
	or   c                                                          ; $3ae2
	ld   [wAudVol], a                                               ; $3ae3

; Every 16 frames, for music, continue
	dec  e                                                          ; $3ae6
	jr   nz, .audTermEnd                                            ; $3ae7

; C = fading aud vol + increment
	ld   a, [wValueToAddToFadingVol]                                ; $3ae9
	add  b                                                          ; $3aec
	ld   c, a                                                       ; $3aed

; Jump and set new aud vol if increment does not change bit 7 (ie goes past max)
	xor  b                                                          ; $3aee
	add  a                                                          ; $3aef
	ld   a, c                                                       ; $3af0
	jr   nc, .setFadingAudVolThenMask                               ; $3af1

; Remove bit 7
	add  a                                                          ; $3af3

; If bit 6 set (negative fade), new aud vol = 0, else (positive fade) new aud vol = $ff
	add  a                                                          ; $3af4
	sbc  a                                                          ; $3af5
	cpl                                                             ; $3af6

.setFadingAudVolThenMask:
	ld   [wFadingAudVol], a                                         ; $3af7

.audTermEnd:
	ld   a, [wBuiltUpAudTermMask]                                   ; $3afa
	ld   c, a                                                       ; $3afd

; If fading aud vol is 0, have mask = 0 to mute
	ld   a, [wFadingAudVol]                                         ; $3afe
	or   a                                                          ; $3b01
	jr   z, :+                                                      ; $3b02
	ld   a, c                                                       ; $3b04
:	ld   [wAudTermMask], a                                          ; $3b05
	ret                                                             ; $3b08


; A - sound data byte
; H - sound channel's struct high byte
HandleSpecialSoundByte:
; Save struct high byte in B, and sound data byte in C
	ld   b, h                                                       ; $3b09
	ld   c, a                                                       ; $3b0a

; DE = double index into handlers table
	add  a                                                          ; $3b0b
	ld   e, a                                                       ; $3b0c
	ld   d, HIGH(SpecialSoundByteHandlers)                          ; $3b0d

; Get handler address in HL
	ld   a, [de]                                                    ; $3b0f
	ld   l, a                                                       ; $3b10
	inc  e                                                          ; $3b11
	ld   a, [de]                                                    ; $3b12
	ld   h, a                                                       ; $3b13

; A = idx from $d0, eg for functions shared between different sound bytes
	ld   a, c                                                       ; $3b14
	sub  SPECIAL_SOUND_BYTE_START                                   ; $3b15

; Then jump to handler
	jp   hl                                                         ; $3b17


; After special byte processed, it re-calls
:	call HandleSpecialSoundByte                                     ; $3b18

; H - sound channel's struct high byte
HandleNextSoundByte:
; Read sound data byte, jumping if special
	call ReadSoundChannelsNextDataByte                              ; $3b1b
	cp   SPECIAL_SOUND_BYTE_START                                   ; $3b1e
	jr   nc, :-                                                     ; $3b20

; --
; -- Non-special sound data byte
; --
; C = non-special byte
	ld   c, a                                                       ; $3b22

; Low 5 bits of byte after is used for sound byte length
	call GetByteFromAddrInHL_UpdateAddrInHL                         ; $3b23
	ld   [wCurrSoundByteLengthVal], a                               ; $3b26

; High 3 bits determine which saved envelope val to use later
	swap a                                                          ; $3b29
	rrca                                                            ; $3b2b
	and  $07                                                        ; $3b2c
	ld   [wCurrSoundByteChosenEnvelope], a                          ; $3b2e

; Skip processing, eg music if sound effect is taking over
	ld   l, AUD_11h_IF_SOUND_HW_REG_USED                            ; $3b31
	ld   a, [hl]                                                    ; $3b33
	or   a                                                          ; $3b34
	jr   nz, .afterProcessingSoundByte                              ; $3b35

; Store sound data byte for noise (could also use B later)
	ld   a, c                                                       ; $3b37
	ld   l, AUD_SND_DATA_BYTE                                       ; $3b38
	ld   [hl], a                                                    ; $3b3a

; Check if sound byte indicates clearing hw regs
	cp   SND_BYTE_CLEAR_HW_REGS                                     ; $3b3b
	jr   nz, .byteNotEqu6fh                                         ; $3b3d

; Clear last 3 hw regs
	ld   a, [wLowByteOfCurrSoundChannelHWRegLastMinus4]             ; $3b3f
	add  $02                                                        ; $3b42
	ld   c, a                                                       ; $3b44
	xor  a                                                          ; $3b45
	ldh  [c], a                                                     ; $3b46
	inc  c                                                          ; $3b47
	ldh  [c], a                                                     ; $3b48
	inc  c                                                          ; $3b49
	ldh  [c], a                                                     ; $3b4a
	jr   .afterProcessingSoundByte                                  ; $3b4b

.byteNotEqu6fh:
; Sound data byte into B
	ld   b, a                                                       ; $3b4d

; Branch off if noise
	ld   a, [wIdxOfSoundChannelBeingUpdated]                        ; $3b4e
	cp   $03                                                        ; $3b51
	jr   z, .processNoise                                           ; $3b53

; Get chosen envelope value
	ld   a, [wCurrSoundByteChosenEnvelope]                          ; $3b55
	add  AUD_SAVED_ENVELOPES                                        ; $3b58
	ld   l, a                                                       ; $3b5a

; C = envelope hw reg, store env value in it
	ld   a, [wLowByteOfCurrSoundChannelHWRegLastMinus4]             ; $3b5b
	add  $02                                                        ; $3b5e
	ld   c, a                                                       ; $3b60
	ld   a, [hl]                                                    ; $3b61
	ldh  [c], a                                                     ; $3b62

; C points to freq lo
	inc  c                                                          ; $3b63

; A = base freq + sound data byte
	ld   l, AUD_FREQ_TABLE_BASE_IDX                                 ; $3b64
	ld   a, [hl]                                                    ; $3b66
	add  b                                                          ; $3b67

; Preserve sound channel struct high byte
	ld   b, h                                                       ; $3b68

; Get double index into frequency table, then store low
	add  a                                                          ; $3b69
	ld   l, a                                                       ; $3b6a
	ld   h, HIGH(FrequencyTable)                                    ; $3b6b
	ld   a, [hl+]                                                   ; $3b6d
	ldh  [c], a                                                     ; $3b6e

; Inc to high, process in .afterSquareOrWav
	inc  c                                                          ; $3b6f

; Branch off here based on channel
	ld   a, [wIdxOfSoundChannelBeingUpdated]                        ; $3b70
	cp   $01                                                        ; $3b73
	jr   z, .afterSquareOrWav                                       ; $3b75

	jr   nc, .contWav                                               ; $3b77

; Additionally set square 1 sweep
	ld   a, [wAud1Sweep]                                            ; $3b79
	ldh  [rAUD1SWEEP], a                                            ; $3b7c
	jr   .afterSquareOrWav                                          ; $3b7e

.contWav:
; Restart wav
	xor  a                                                          ; $3b80
	ldh  [rAUD3ENA], a                                              ; $3b81
	nop                                                             ; $3b83
	nop                                                             ; $3b84
	nop                                                             ; $3b85
	ld   a, $80                                                     ; $3b86
	ldh  [rAUD3ENA], a                                              ; $3b88

.afterSquareOrWav:
; Set high to high byte of frequency, and restart
	ld   a, [hl]                                                    ; $3b8a
	or   $80                                                        ; $3b8b
	ldh  [c], a                                                     ; $3b8d

; Restore high byte of sound channel struct
	ld   h, b                                                       ; $3b8e
	jr   .afterProcessingSoundByte                                  ; $3b8f

.processNoise:
; Get saved envelope val, and set it in hw reg
	ld   a, [wCurrSoundByteChosenEnvelope]                          ; $3b91
	add  AUD_SAVED_ENVELOPES                                        ; $3b94
	ld   l, a                                                       ; $3b96
	ld   a, [hl]                                                    ; $3b97
	ldh  [rAUD4ENV], a                                              ; $3b98

; Sound data byte * 8 into B (shift clock frequency)
	ld   l, AUD_SND_DATA_BYTE                                       ; $3b9a
	ld   a, [hl]                                                    ; $3b9c
	add  a                                                          ; $3b9d
	add  a                                                          ; $3b9e
	add  a                                                          ; $3b9f
	ld   b, a                                                       ; $3ba0

	ld   a, [wNoiseDividingRatioOfFreqs]                            ; $3ba1
	or   b                                                          ; $3ba4
	ldh  [rAUD4POLY], a                                             ; $3ba5

; Restart sound, don't stop affter len done
	ld   a, $80                                                     ; $3ba7
	ldh  [rAUD4GO], a                                               ; $3ba9

.afterProcessingSoundByte:
; Convert low 5 bits after sound byte into 4-$80
; (threshold before next sound byte is processed)
	ld   a, [wCurrSoundByteLengthVal]                               ; $3bab
	and  $1f                                                        ; $3bae
	inc  a                                                          ; $3bb0
	add  a                                                          ; $3bb1
	add  a                                                          ; $3bb2
	ld   l, AUD_THRESHOLD_FOR_COUNTER_TO_NEXT_SOUND_BYTE            ; $3bb3
	ld   [hl], a                                                    ; $3bb5

; --
; -- Alternating Aud Term
; --
; Return if alternating aud term not enabled
	ld   l, AUD_ALTERNATE_TERM_ENABLED_AND_COUNTER                  ; $3bb6
	ld   a, [hl-]                                                   ; $3bb8
	or   a                                                          ; $3bb9
	ret  z                                                          ; $3bba

; HL = AUD_ALTERNATE_TERM_COUNTER_THRESHOLD, A = counter+1 (max $0f)
	inc  a                                                          ; $3bbb
	and  $0f                                                        ; $3bbc
	ld   c, $00                                                     ; $3bbe

; If threshold hit, C = $ff, else C = 0. A is counter
	cp   [hl]                                                       ; $3bc0
	jr   nz, :+                                                     ; $3bc1

	dec  c                                                          ; $3bc3
	xor  a                                                          ; $3bc4

; Set current counter with enabled flag
:	or   $f0                                                        ; $3bc5
	inc  l                                                          ; $3bc7
; HL = AUD_ALTERNATE_TERM_ENABLED_AND_COUNTER
	ld   [hl+], a                                                   ; $3bc8

; HL = AUD_ALTERNATE_TERM_CURR_OUTPUT, get its val and flip if counter hit threshold
	inc  l                                                          ; $3bc9
	ld   a, [hl]                                                    ; $3bca
	xor  c                                                          ; $3bcb

; If bit 0 is set, aud term mask is SO1, else SO2
	and  $01                                                        ; $3bcc
	inc  a                                                          ; $3bce

; A - bit 1: SO1, bit 0: S02
SetAudTermMaskForCurrAudChannel:
; C = bit 1 of A put into bit 0 (S01)
	rra                                                             ; $3bcf
	ld   c, a                                                       ; $3bd0

; A bit 0 in bit 4 (S02)
	rla                                                             ; $3bd1
	and  $01                                                        ; $3bd2
	swap a                                                          ; $3bd4
	or   c                                                          ; $3bd6
	ld   c, a                                                       ; $3bd7

; If square 1, mask = $ee
	ld   b, %11101110                                               ; $3bd8
	ld   a, [wIdxOfSoundChannelBeingUpdated]                        ; $3bda
	or   a                                                          ; $3bdd
	jr   z, .end                                                    ; $3bde

; If wav, mask = $bb, C *= 4
	sla  c                                                          ; $3be0
	cp   $02                                                        ; $3be2
	ld   b, %10111011                                               ; $3be4
	jr   z, .doubleCEnd                                             ; $3be6

; If square 2, mask = $dd, C *= 2
	ld   b, %11011101                                               ; $3be8
	jr   c, .end                                                    ; $3bea

; If noise, mask = $77, C *= 8
	ld   b, %01110111                                               ; $3bec
	sla  c                                                          ; $3bee

.doubleCEnd:
	sla  c                                                          ; $3bf0

.end:
; Apply mask to get other sound channel's aud term, then OR with C
	ld   de, wBuiltUpAudTermMask                                    ; $3bf2
	ld   a, [de]                                                    ; $3bf5
	and  b                                                          ; $3bf6
	or   c                                                          ; $3bf7
	ld   [de], a                                                    ; $3bf8
	ret                                                             ; $3bf9


; B - high byte of sound channel struct
ReadSoundChannelsNextDataByte_FromSpecialByte:
	ld   h, b                                                       ; $3bfa

; H - high byte of sound channel struct
ReadSoundChannelsNextDataByte:
	ld   l, AUD_CHAN_ADDR                                           ; $3bfb

; HL - address to get byte from
GetByteFromAddrInHL_UpdateAddrInHL:
; Address into DE
	ld   e, [hl]                                                    ; $3bfd
	inc  l                                                          ; $3bfe
	ld   d, [hl]                                                    ; $3bff

; Get byte in DE to return with
	ld   a, [de]                                                    ; $3c00

; Store inc'd address
	inc  de                                                         ; $3c01
	ld   [hl], d                                                    ; $3c02
	dec  l                                                          ; $3c03
	ld   [hl], e                                                    ; $3c04
	ret                                                             ; $3c05


SoundByte_D0toD3_SetLoopCounter:
; D0-D3 determines counter
	and  $03                                                        ; $3c06
	add  $d7                                                        ; $3c08
	ld   c, a                                                       ; $3c0a

; Store next byte in it
	call ReadSoundChannelsNextDataByte_FromSpecialByte              ; $3c0b
	ld   l, c                                                       ; $3c0e
	ld   [hl], a                                                    ; $3c0f
	ret                                                             ; $3c10


; A = 1-3, S02-only, SO1-only, SO1+SO2
SoundByte_D9toDB_SetAudTerm_DisableAlternating:
	and  $03                                                        ; $3c11
	ld   h, b                                                       ; $3c13
	call SetAudTermMaskForCurrAudChannel                            ; $3c14

; Disable alternating capability
	ld   l, AUD_ALTERNATE_TERM_ENABLED_AND_COUNTER                  ; $3c17
	ld   [hl], $00                                                  ; $3c19
	ret                                                             ; $3c1b


; A = 1-4 (threshold)
SoundByte_DCtoDF_SetAlternatingAudTerm:
	and  $03                                                        ; $3c1c
	inc  a                                                          ; $3c1e

; Store threshold value
	ld   l, AUD_ALTERNATE_TERM_COUNTER_THRESHOLD                    ; $3c1f
	ld   h, b                                                       ; $3c21
	ld   [hl+], a                                                   ; $3c22

; Enable AUD_ALTERNATE_TERM_ENABLED_AND_COUNTER
; 0 in AUD_ALTERNATE_TERM_CURR_OUTPUT (start with SO1)
	ld   [hl], $f0                                                  ; $3c23
	inc  l                                                          ; $3c25
	ld   [hl], $00                                                  ; $3c26
	ret                                                             ; $3c28


SoundByte_D8_DisableAlternatingAudTerm:
	ld   l, AUD_ALTERNATE_TERM_ENABLED_AND_COUNTER                  ; $3c29
	ld   h, b                                                       ; $3c2b
	ld   [hl], $00                                                  ; $3c2c
	ret                                                             ; $3c2e


; A - 0-7
SoundByte_E0toE7_SetNoiseDividingRatioOfFreqs:
	and  $07                                                        ; $3c2f
	ld   [wNoiseDividingRatioOfFreqs], a                            ; $3c31
	ld   h, b                                                       ; $3c34
	ret                                                             ; $3c35


; A - 0-7 - chosen envelope to save to
SoundByte_E8toEF_SaveAnEnvelopeByte:
	and  $07                                                        ; $3c36
	add  AUD_SAVED_ENVELOPES                                        ; $3c38
	ld   c, a                                                       ; $3c3a

; Next data byte is value to save
	call ReadSoundChannelsNextDataByte_FromSpecialByte              ; $3c3b
	ld   [bc], a                                                    ; $3c3e
	ret                                                             ; $3c3f


; $f0/2 - 25%, $f1/3 - 75%
SoundByte_F0toF3_SquareSet25or75Wave:
; Return if wav/noise
	ld   h, b                                                       ; $3c40
	ld   a, [wIdxOfSoundChannelBeingUpdated]                        ; $3c41
	cp   $02                                                        ; $3c44
	ret  nc                                                         ; $3c46

; C = square wave/len
	ld   a, [wLowByteOfCurrSoundChannelHWRegLastMinus4]             ; $3c47
	inc  a                                                          ; $3c4a
	ld   c, a                                                       ; $3c4b

; E = $e1-$e7, rotating rightmost 2 bits gives $40, $c0, $40, $c0
; ie 25% wave pattern, or 75% wave pattern (no len)
	ld   a, e                                                       ; $3c4c
	rrca                                                            ; $3c4d
	rrca                                                            ; $3c4e
	and  $c0                                                        ; $3c4f
	ldh  [c], a                                                     ; $3c51
	ret                                                             ; $3c52


SoundByte_F6_SetAud1SweepToSubtract:
	ld   a, $08                                                     ; $3c53
	ld   [wAud1Sweep], a                                            ; $3c55
	ld   h, b                                                       ; $3c58
	ret                                                             ; $3c59


SoundByte_F7_SetAud1Sweep:
	call ReadSoundChannelsNextDataByte_FromSpecialByte              ; $3c5a
	ld   [wAud1Sweep], a                                            ; $3c5d
	ret                                                             ; $3c60


SoundByte_F8_SetFreqTableBaseIdx:
	call ReadSoundChannelsNextDataByte_FromSpecialByte              ; $3c61
	ld   l, AUD_FREQ_TABLE_BASE_IDX                                 ; $3c64
	ld   [hl], a                                                    ; $3c66
	ret                                                             ; $3c67


SoundByte_F9_SetSongSpeed:
	call ReadSoundChannelsNextDataByte_FromSpecialByte              ; $3c68
	ld   [wSongSpeed], a                                            ; $3c6b
	ret                                                             ; $3c6e


SoundByte_FA_SetVolNoFade:
; Next byte has vol in upper 7 bits
	call ReadSoundChannelsNextDataByte_FromSpecialByte              ; $3c6f
	srl  a                                                          ; $3c72
	ld   [wFadingAudVol], a                                         ; $3c74
	xor  a                                                          ; $3c77
	ld   [wValueToAddToFadingVol], a                                ; $3c78
	ret                                                             ; $3c7b


SoundByte_FB_SetFadingVolIncrement:
	call ReadSoundChannelsNextDataByte_FromSpecialByte              ; $3c7c
	ld   [wValueToAddToFadingVol], a                                ; $3c7f
	ret                                                             ; $3c82


SoundByte_FC_Call:
; Read next word into BC
	call ReadSoundChannelsNextDataByte_FromSpecialByte              ; $3c83
	ld   c, a                                                       ; $3c86
	call GetByteFromAddrInHL_UpdateAddrInHL                         ; $3c87
	ld   b, a                                                       ; $3c8a

; A = current stack offset
	ld   l, AUD_STACK_OFFSET                                        ; $3c8b
	ld   a, [hl]                                                    ; $3c8d
	ld   d, h                                                       ; $3c8e

; Inc to where low byte will be (in E)
	inc  a                                                          ; $3c8f
	or   AUD_STACK                                                  ; $3c90
	ld   e, a                                                       ; $3c92

; Get low byte of current addr and store in stack
	ld   l, AUD_CHAN_ADDR                                           ; $3c93
	ld   a, [hl]                                                    ; $3c95
	ld   [de], a                                                    ; $3c96

; Replace it with low byte of word param
	ld   [hl], c                                                    ; $3c97
	inc  e                                                          ; $3c98
	inc  l                                                          ; $3c99

; HL points to AUD_CHAN_ADDR+1, DE = stack where high byte will be
; Store high byte of current addr in stack, then replace with high byte of word param
	ld   a, [hl]                                                    ; $3c9a
	ld   [de], a                                                    ; $3c9b
	ld   [hl], b                                                    ; $3c9c

; Stack offset points to high byte of address to return to
	ld   l, AUD_STACK_OFFSET                                        ; $3c9d
	ld   [hl], e                                                    ; $3c9f
	ret                                                             ; $3ca0


SoundByte_D4toD7_DecLoopCounter_JNE:
; D4 - D7 determines the counter
	and  $03                                                        ; $3ca1
	add  AUD_LOOP_COUNTERS                                          ; $3ca3
	ld   l, a                                                       ; $3ca5
	ld   h, b                                                       ; $3ca6

; Dec it. If non-0, jump presumably up
	dec  [hl]                                                       ; $3ca7
	jr   nz, :+                                                     ; $3ca8

; Once 0, carry on skipping jump address
	call ReadSoundChannelsNextDataByte                              ; $3caa
	jp   GetByteFromAddrInHL_UpdateAddrInHL                         ; $3cad


SoundByte_FD_Jump:
	ld   h, b                                                       ; $3cb0

; Get low, then high byte of jump address
:	call ReadSoundChannelsNextDataByte                              ; $3cb1
	ld   c, a                                                       ; $3cb4
	call GetByteFromAddrInHL_UpdateAddrInHL                         ; $3cb5

; A = high byte, C = low byte
	ld   l, AUD_CHAN_ADDR+1                                         ; $3cb8
	ld   [hl-], a                                                   ; $3cba
	ld   [hl], c                                                    ; $3cbb
	ret                                                             ; $3cbc


SoundByte_FE_Ret:
; C = current stack offset
	ld   l, AUD_STACK_OFFSET                                        ; $3cbd
	ld   h, b                                                       ; $3cbf
	ld   c, [hl]                                                    ; $3cc0

; Store currently pointed byte into jump addr high byte
	ld   l, AUD_CHAN_ADDR+1                                         ; $3cc1
	ld   a, [bc]                                                    ; $3cc3
	ld   [hl-], a                                                   ; $3cc4

; Store byte in stack below into low byte
	dec  c                                                          ; $3cc5
	ld   a, [bc]                                                    ; $3cc6
	ld   [hl], a                                                    ; $3cc7

; Store double dec'd stack offset back, looping it between $e0 and $ff
	dec  c                                                          ; $3cc8
	ld   a, c                                                       ; $3cc9
	or   AUD_STACK                                                  ; $3cca
	ld   l, AUD_STACK_OFFSET                                        ; $3ccc
	ld   [hl], a                                                    ; $3cce
	ret                                                             ; $3ccf


SoundByte_F4_F5_FF_End:
; Prevent this channel from playing
	ld   l, AUD_CHAN_ADDR+1                                         ; $3cd0
	ld   h, b                                                       ; $3cd2
	ld   [hl], HIGH(NULL_SND_ADDR)                                  ; $3cd3

; C = env reg, or wav level to clear below
	ld   a, [wLowByteOfCurrSoundChannelHWRegLastMinus4]             ; $3cd5
	add  $02                                                        ; $3cd8
	ld   c, a                                                       ; $3cda

; Also clear counter + AUD_THRESHOLD_FOR_COUNTER_TO_NEXT_SOUND_BYTE
	xor  a                                                          ; $3cdb
	ld   l, AUD_COUNTER_TIL_NEXT_SOUND_BYTE                         ; $3cdc
	ld   [hl+], a                                                   ; $3cde
	ld   [hl], a                                                    ; $3cdf
	ldh  [c], a                                                     ; $3ce0

; Song has ended, return from sound channel processing
	pop  de                                                         ; $3ce1
	ret                                                             ; $3ce2


SECTION "Bank $000, $3e00", ROM0[$3e00]

FrequencyTable:
	dw $002c ; C2
	dw $009d
	dw $0107
	dw $016b
	dw $01ca
	dw $0223
	dw $0277
	dw $02c7
	dw $0312
	dw $0359
	dw $039c
	dw $03db
	dw $0416 ; C3
	dw $044f
	dw $0484
	dw $04b6
	dw $04e5
	dw $0512
	dw $053c
	dw $0564
	dw $0589
	dw $05ad
	dw $05ce
	dw $05ee
	dw $060b ; C4
	dw $0628
	dw $0642
	dw $065b
	dw $0673
	dw $0689
	dw $069e
	dw $06b2
	dw $06c5
	dw $06d7
	dw $06e7
	dw $06f7
	dw $0706 ; C5
	dw $0714
	dw $0721
	dw $072e
	dw $073a
	dw $0745
	dw $074f
	dw $0759
	dw $0763
	dw $076c
	dw $0774
	dw $077c
	dw $0783 ; C6
	dw $078a
	dw $0791
	dw $0797
	dw $079d
	dw $07a3
	dw $07a8
	dw $07ad
	dw $07b2
	dw $07b6
	dw $07ba
	dw $07be
	dw $07c2 ; C7
	dw $07c5
	dw $07c9
	dw $07cc
	dw $07cf
	dw $07d2
	dw $07d4
	dw $07d7
	dw $07d9
	dw $07db
	dw $07dd
	dw $07df ; B7


DefaultWavRam:
	db $01, $23, $45, $67, $89, $ab, $cd, $ef
	db $fe, $dc, $ba, $98, $76, $54, $32, $10
.end:


SpecialSoundByteHandlers:
	dw SoundByte_D0toD3_SetLoopCounter
	dw SoundByte_D0toD3_SetLoopCounter
	dw SoundByte_D0toD3_SetLoopCounter
	dw SoundByte_D0toD3_SetLoopCounter
	dw SoundByte_D4toD7_DecLoopCounter_JNE
	dw SoundByte_D4toD7_DecLoopCounter_JNE
	dw SoundByte_D4toD7_DecLoopCounter_JNE
	dw SoundByte_D4toD7_DecLoopCounter_JNE
	dw SoundByte_D8_DisableAlternatingAudTerm
	dw SoundByte_D9toDB_SetAudTerm_DisableAlternating
	dw SoundByte_D9toDB_SetAudTerm_DisableAlternating
	dw SoundByte_D9toDB_SetAudTerm_DisableAlternating
	dw SoundByte_DCtoDF_SetAlternatingAudTerm
	dw SoundByte_DCtoDF_SetAlternatingAudTerm
	dw SoundByte_DCtoDF_SetAlternatingAudTerm
	dw SoundByte_DCtoDF_SetAlternatingAudTerm
	dw SoundByte_E0toE7_SetNoiseDividingRatioOfFreqs
	dw SoundByte_E0toE7_SetNoiseDividingRatioOfFreqs
	dw SoundByte_E0toE7_SetNoiseDividingRatioOfFreqs
	dw SoundByte_E0toE7_SetNoiseDividingRatioOfFreqs
	dw SoundByte_E0toE7_SetNoiseDividingRatioOfFreqs
	dw SoundByte_E0toE7_SetNoiseDividingRatioOfFreqs
	dw SoundByte_E0toE7_SetNoiseDividingRatioOfFreqs
	dw SoundByte_E0toE7_SetNoiseDividingRatioOfFreqs
	dw SoundByte_E8toEF_SaveAnEnvelopeByte
	dw SoundByte_E8toEF_SaveAnEnvelopeByte
	dw SoundByte_E8toEF_SaveAnEnvelopeByte
	dw SoundByte_E8toEF_SaveAnEnvelopeByte
	dw SoundByte_E8toEF_SaveAnEnvelopeByte
	dw SoundByte_E8toEF_SaveAnEnvelopeByte
	dw SoundByte_E8toEF_SaveAnEnvelopeByte
	dw SoundByte_E8toEF_SaveAnEnvelopeByte
	dw SoundByte_F0toF3_SquareSet25or75Wave
	dw SoundByte_F0toF3_SquareSet25or75Wave
	dw SoundByte_F0toF3_SquareSet25or75Wave
	dw SoundByte_F0toF3_SquareSet25or75Wave
	dw SoundByte_F4_F5_FF_End
	dw SoundByte_F4_F5_FF_End
	dw SoundByte_F6_SetAud1SweepToSubtract
	dw SoundByte_F7_SetAud1Sweep
	dw SoundByte_F8_SetFreqTableBaseIdx
	dw SoundByte_F9_SetSongSpeed
	dw SoundByte_FA_SetVolNoFade
	dw SoundByte_FB_SetFadingVolIncrement
	dw SoundByte_FC_Call
	dw SoundByte_FD_Jump
	dw SoundByte_FE_Ret
	dw SoundByte_F4_F5_FF_End

INCLUDE "data/soundData.s"
