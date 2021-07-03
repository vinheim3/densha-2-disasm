.toWaitLoop:
	jr   .waitLoop                                                  ; $38ec - 3

.processNextByte:
; Resume in current bank
	ld   a, b                                                       ; $38ee - 1
	ld   [ROMB0], a                                                 ; $38ef - 4

; Get next byte
	ld   a, [hl+]                                                   ; $38f2 - 2
	ldh  [rAUDVOL], a                                               ; $38f3 - 3

; Below checks if we are in the next bank
; Shift H left once, if a carry is detected, it adds 1 to B
	ld   a, h                                                       ; $38f5 - 1
	add  a                                                          ; $38f6 - 1
	ld   h, a                                                       ; $38f7 - 1
	adc  b                                                          ; $38f8 - 1
	sub  h                                                          ; $38f9 - 1
	ld   b, a                                                       ; $38fa - 1

; Shift H back right. If in a new bank, H is set to point to start of new bank
	ld   a, h                                                       ; $38fb - 1
	rrca                                                            ; $38fc - 1
	or   HIGH($4000)                                                ; $38fd - 2
	ld   h, a                                                       ; $38ff - 1

; Sub 1 from byte length in EDC
	ld   a, e                                                       ; $3900 - 1
	sub  $01                                                        ; $3901 - 2
	ld   a, d                                                       ; $3903 - 1
	sbc  $00                                                        ; $3904 - 2
	dec  de                                                         ; $3906 - 2
	ld   a, c                                                       ; $3907 - 1
	sbc  $00                                                        ; $3908 - 2
	ld   c, a                                                       ; $390a - 1

; Once 0, mute and stop processing
	or   e                                                          ; $390b - 1
	or   d                                                          ; $390c - 1
	jr   nz, .toWaitLoop                                            ; $390d - 3

;	ld   a, $00                                                     ; $390f
;	ldh  [rAUDVOL], a                                               ; $3911
;	ret                                                             ; $3913

.waitLoop:
; Do loop below based on given loop value
	push af                                                         ; $3914 - 4
	ld   a, [wVolumeModulatedLoopValue]                             ; $3915 - 4

:	dec  a                                                          ; $3918 - 1 - 4x-1
	jr   nz, :-                                                     ; $3919 - 2/3

	pop  af                                                         ; $391b - 3
	jr   .processNextByte                                           ; $391c - 3

; 55 + 4x - 1 = 54 + 96 = 150



; web todo:
; movies
; more pre in-game
; pic book complete
; location done
; unused data

; 0 - 4924, 0
; 6 - 3292, 0
; 7 - 1208, 0
; 8 - 2210, 0
; 9 - 3435, 0
; a - 2634, 0
; b - 369, 0
; introAnimation - 441, 0
; scriptEngine - 699, 0
; soundEngine - 665, 0
; total - 19877, 0

; diamond accuracy - judges time at dest against est
; stop pos accelerate - judges distance we stopped in station
; station structure acceleration - if accelerated while approaching stopping station
; extreme braking - max brake while approaching station

; holding A, pressing B applies max brake
; detail how to unlock trains and movies
; train line 4, on completion, then takes us to hidden train line A