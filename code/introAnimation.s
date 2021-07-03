INCLUDE "includes.s"

SECTION "Intro animation", ROM0[$325d]

VBlankInterruptFunc_IntroCutscene::
; If there is setup required during vblank to load for current animation, do so
	ld   a, [wIntroCutsceneAnimationEngineType]                     ; $325d
	cp   ANIM_ENGINE_HI_COL                                         ; $3260
	jr   z, .displayHiColScreen                                     ; $3262

	cp   ANIM_ENGINE_SMALL_RECT_OAM                                 ; $3264
	jr   z, .displaySmallRectScreen                                 ; $3266

	cp   ANIM_ENGINE_CREDITS                                        ; $3268
	jp   z, .displayCreditsScreen                                   ; $326a

	cp   ANIM_ENGINE_SIMPLE_BG                                      ; $326d
	jp   z, .displayBGAnimatedScreens                               ; $326f

	cp   ANIM_ENGINE_LARGE_IMAGE                                    ; $3272
	jp   z, .displayLargeImage                                      ; $3274

; If none of the above, update tile map and attrs
	ld   a, [wHiColScreenPlus1ToLoadTileMapAndAttrsTo]              ; $3277
	cp   $01                                                        ; $327a
	jr   z, .loadTileMapAndAttrsToScrn0                             ; $327c

	cp   $02                                                        ; $327e
	jr   z, .loadTileMapAndAttrsToScrn1                             ; $3280

	ret                                                             ; $3282

.displayHiColScreen:
; LCDCF_BG8000 - set to 8800 halfway down the screen
	ldh  a, [rLCDC]                                                 ; $3283
	set  4, a                                                       ; $3285
	ldh  [rLCDC], a                                                 ; $3287

; Load hi-col tile data and palettes
	call LoadHiColTileData                                          ; $3289
	CallFromBank0 LoadBGPaletteSrcForHiColScreen

; Display hi-col screen and update sound every frame
	ld   a, [wShouldUpdateHiColBGPalettes]                          ; $3294
	or   a                                                          ; $3297
	ret  z                                                          ; $3298

	call ApplyHiColPalettes                                         ; $3299
	call UpdateSound                                                ; $329c
	ret                                                             ; $329f

.displaySmallRectScreen:
; Make sure tile map and attrs are done 1st
	ld   a, [wHiColScreenPlus1ToLoadTileMapAndAttrsTo]              ; $32a0
	cp   $01                                                        ; $32a3
	jr   z, .loadTileMapAndAttrsToScrn0                             ; $32a5

	cp   $02                                                        ; $32a7
	jr   z, .loadTileMapAndAttrsToScrn1                             ; $32a9

	call LoadSmallRectBGandOBJTileData                              ; $32ab
	ret                                                             ; $32ae

.loadTileMapAndAttrsToScrn0:
	ldh  a, [rSVBK]                                                 ; $32af
	and  $03                                                        ; $32b1
	push af                                                         ; $32b3

; Tile map, then attr
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $32b4
	ldh  [rSVBK], a                                                 ; $32b6

	ld   a, $00                                                     ; $32b8
	ldh  [rVBK], a                                                  ; $32ba
	ld   hl, wIntroCutsceneTileMapBuffer                            ; $32bc
	ld   de, _SCRN0                                                 ; $32bf
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $32c2
	call StartHDMATransfer                                          ; $32c4

	ld   a, $01                                                     ; $32c7
	ldh  [rVBK], a                                                  ; $32c9
	ld   hl, wIntroCutsceneTileAttrBuffer                           ; $32cb
	ld   de, _SCRN0                                                 ; $32ce
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $32d1
	call StartHDMATransfer                                          ; $32d3

; Restore wram bank, and dont load tile map again
	pop  af                                                         ; $32d6
	ldh  [rSVBK], a                                                 ; $32d7
	ld   a, $00                                                     ; $32d9
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $32db
	ret                                                             ; $32de

.loadTileMapAndAttrsToScrn1:
	ldh  a, [rSVBK]                                                 ; $32df
	and  $03                                                        ; $32e1
	push af                                                         ; $32e3

; Tile map, then attr
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $32e4
	ldh  [rSVBK], a                                                 ; $32e6

	ld   a, $00                                                     ; $32e8
	ldh  [rVBK], a                                                  ; $32ea
	ld   hl, wIntroCutsceneTileMapBuffer                            ; $32ec
	ld   de, _SCRN1                                                 ; $32ef
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $32f2
	call StartHDMATransfer                                          ; $32f4

	ld   a, $01                                                     ; $32f7
	ldh  [rVBK], a                                                  ; $32f9
	ld   hl, wIntroCutsceneTileAttrBuffer                           ; $32fb
	ld   de, _SCRN1                                                 ; $32fe
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $3301
	call StartHDMATransfer                                          ; $3303

; Restore wram bank, and dont load tile map again
	pop  af                                                         ; $3306
	ldh  [rSVBK], a                                                 ; $3307
	ld   a, $00                                                     ; $3309
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $330b
	ret                                                             ; $330e

.displayCreditsScreen:
	ldh  a, [rSVBK]                                                 ; $330f
	and  $03                                                        ; $3311
	push af                                                         ; $3313

; In vblank, transfer tile map and attrs to screen 0
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $3314
	ldh  [rSVBK], a                                                 ; $3316
	ld   a, $00                                                     ; $3318
	ldh  [rVBK], a                                                  ; $331a
	ld   hl, wIntroCutsceneTileMapBuffer                            ; $331c
	ld   de, _SCRN0                                                 ; $331f
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $3322
	call StartHDMATransfer                                          ; $3324

	ld   a, $01                                                     ; $3327
	ldh  [rVBK], a                                                  ; $3329
	ld   hl, wIntroCutsceneTileAttrBuffer                           ; $332b
	ld   de, _SCRN0                                                 ; $332e
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $3331
	call StartHDMATransfer                                          ; $3333

	pop  af                                                         ; $3336
	ldh  [rSVBK], a                                                 ; $3337

; Update scroll x for top part of screen, and LY where we stop scrolling
	ld   a, [wCreditsScreenTopSCX]                                  ; $3339
	ldh  [rSCX], a                                                  ; $333c
	ld   a, $17                                                     ; $333e
	ldh  [rLYC], a                                                  ; $3340
	ret                                                             ; $3342

.displayBGAnimatedScreens:
; Make sure tile map and attrs are done 1st
	ld   a, [wHiColScreenPlus1ToLoadTileMapAndAttrsTo]              ; $3343
	cp   $01                                                        ; $3346
	jp   z, .loadTileMapAndAttrsToScrn0                             ; $3348

	cp   $02                                                        ; $334b
	jp   z, .loadTileMapAndAttrsToScrn1                             ; $334d

	call LoadBGAnimatedTileData                                     ; $3350
	ret                                                             ; $3353

.displayLargeImage:
; Screen num actually refers to which 'half' of screen 0 to load to
	ld   a, [wHiColScreenPlus1ToLoadTileMapAndAttrsTo]              ; $3354
	cp   $01                                                        ; $3357
	jp   z, .largePartOfScrn0                                       ; $3359

	cp   $02                                                        ; $335c
	jp   z, .smallPartOfScrn0                                       ; $335e

	ret                                                             ; $3361

.largePartOfScrn0:
	ldh  a, [rSVBK]                                                 ; $3362
	and  $03                                                        ; $3364
	push af                                                         ; $3366

; Load tile map and attrs to screen 0
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $3367
	ldh  [rSVBK], a                                                 ; $3369
	ld   a, $00                                                     ; $336b
	ldh  [rVBK], a                                                  ; $336d
	ld   hl, wIntroCutsceneTileMapBuffer                            ; $336f
	ld   de, _SCRN0                                                 ; $3372
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $3375
	call StartHDMATransfer                                          ; $3377

	ld   a, $01                                                     ; $337a
	ldh  [rVBK], a                                                  ; $337c
	ld   hl, wIntroCutsceneTileAttrBuffer                           ; $337e
	ld   de, _SCRN0                                                 ; $3381
	ld   b, (GB_TILE_WIDTH*SCREEN_TILE_HEIGHT/$10)-1                ; $3384
	call StartHDMATransfer                                          ; $3386

; Preserve wram bank, and dont load this next time
	pop  af                                                         ; $3389
	ldh  [rSVBK], a                                                 ; $338a
	ld   a, $00                                                     ; $338c
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $338e
	ret                                                             ; $3391

.smallPartOfScrn0:
	ldh  a, [rSVBK]                                                 ; $3392
	and  $03                                                        ; $3394
	push af                                                         ; $3396

; Load 2 rows of tile map and attrs below above
	ld   a, BANK(wIntroCutsceneTileMapBuffer)                       ; $3397
	ldh  [rSVBK], a                                                 ; $3399
	ld   a, $00                                                     ; $339b
	ldh  [rVBK], a                                                  ; $339d
	ld   hl, wIntroCutsceneTileMapBuffer                            ; $339f
	ld   de, _SCRN0+GB_TILE_WIDTH*SCREEN_TILE_HEIGHT                ; $33a2
	ld   b, (GB_TILE_WIDTH*2/$10)-1                                 ; $33a5
	call StartHDMATransfer                                          ; $33a7

	ld   a, $01                                                     ; $33aa
	ldh  [rVBK], a                                                  ; $33ac
	ld   hl, wIntroCutsceneTileAttrBuffer                           ; $33ae
	ld   de, _SCRN0+GB_TILE_WIDTH*SCREEN_TILE_HEIGHT                ; $33b1
	ld   b, (GB_TILE_WIDTH*2/$10)-1                                 ; $33b4
	call StartHDMATransfer                                          ; $33b6

; Preserve wram bank, and dont load this next time
	pop  af                                                         ; $33b9
	ldh  [rSVBK], a                                                 ; $33ba
	ld   a, $00                                                     ; $33bc
	ld   [wHiColScreenPlus1ToLoadTileMapAndAttrsTo], a              ; $33be
	ret                                                             ; $33c1


LCDCInterruptFunc_CreditsScreen::
; Jump if triggering due to 2nd LYC ($77 here)
	ldh  a, [rLY]                                                   ; $33c2
	cp   $50                                                        ; $33c4
	jr   nc, .bottomHalfOfScreen                                    ; $33c6

; 1st LYC in vblank func ($17)
	call WaitUntilVramJustSafe                                      ; $33c8

; Don't scroll middle of the screen
	ld   a, $00                                                     ; $33cb
	ldh  [rSCX], a                                                  ; $33cd
	ld   a, $77                                                     ; $33cf
	ldh  [rLYC], a                                                  ; $33d1
	ret                                                             ; $33d3

.bottomHalfOfScreen:
	call WaitUntilVramJustSafe                                      ; $33d4

; Start scrolling bottom part of screen
	ld   a, [wCreditsScreenBottomSCX]                               ; $33d7
	ldh  [rSCX], a                                                  ; $33da
	ret                                                             ; $33dc


LoadSmallRectBGandOBJTileData:
; Set num bytes to transfer (10 cols * 8 rows * $10 bytes)
; Then set vram tile data bank, and src address in 2nd 4mb
	ld   b, ($500/$10)-1                                            ; $33dd
	ld   a, [wCutsceneHiColTileDataVramBank]                        ; $33df
	ldh  [rVBK], a                                                  ; $33e2
	ld   a, $01                                                     ; $33e4
	ld   [ROMB1], a                                                 ; $33e6

; Step 0 - obj, step 1 - bg
	ld   a, [wIntroCutsceneDataLoadStep]                            ; $33e9
	cp   $01                                                        ; $33ec
	jr   z, .loadBG                                                 ; $33ee

; Get obj tile data source
	ld   a, [wSmallRectOamOBJTileDataBank]                          ; $33f0
	ld   [ROMB0], a                                                 ; $33f3
	ld   a, [wSmallRectOamOBJTileDataAddr]                          ; $33f6
	ld   l, a                                                       ; $33f9
	ld   a, [wSmallRectOamOBJTileDataAddr+1]                        ; $33fa
	ld   h, a                                                       ; $33fd

	ld   de, _VRAM                                                  ; $33fe
	call StartHDMATransfer                                          ; $3401

; Reset high rom bank, and set step to 1, to load BG source next
	ld   a, $00                                                     ; $3404
	ld   [ROMB1], a                                                 ; $3406
	ld   a, $01                                                     ; $3409
	ld   [wIntroCutsceneDataLoadStep], a                            ; $340b

; Based on target vram bank for BG, use the associated oam spec
; For Bank 1 BG, the OAM refer to Bank 1 tile source
	ld   a, [wCutsceneHiColTileDataVramBank]                        ; $340e
	or   a                                                          ; $3411
	jr   nz, .useVramBank1                                          ; $3412

	ld   hl, PAGE_0                                                 ; $3414

	ld   a, LOW(SpriteOam_AnimationType2VramBank0)                  ; $3417
	ld   [PAGE_0+SCRIPT_SPRITE_ADDR], a                             ; $3419
	ld   a, HIGH(SpriteOam_AnimationType2VramBank0)                 ; $341c
	ld   [PAGE_0+SCRIPT_SPRITE_ADDR+1], a                           ; $341e
	ret                                                             ; $3421

.useVramBank1:
	ld   a, LOW(SpriteOam_AnimationType2VramBank1)                  ; $3422
	ld   [PAGE_0+SCRIPT_SPRITE_ADDR], a                             ; $3424
	ld   a, HIGH(SpriteOam_AnimationType2VramBank1)                 ; $3427
	ld   [PAGE_0+SCRIPT_SPRITE_ADDR+1], a                           ; $3429
	ret                                                             ; $342c

.loadBG:
; Get bg tile data source
	ld   a, [wSmallRectOamBGTileDataBank]                           ; $342d
	ld   [ROMB0], a                                                 ; $3430
	ld   a, [wSmallRectOamBGTileDataAddr]                           ; $3433
	ld   l, a                                                       ; $3436
	ld   a, [wSmallRectOamBGTileDataAddr+1]                         ; $3437
	ld   h, a                                                       ; $343a

; transfer to last part of vram
	ld   de, _VRAM+$1300                                            ; $343b
	call StartHDMATransfer                                          ; $343e

; Reset high rom bank, swap to our loaded screen, and reset step
	ld   a, $00                                                     ; $3441
	ld   [ROMB1], a                                                 ; $3443
	call SwapHiColVramBankCopyDestAndScreenNowSetUp                 ; $3446
	ld   a, $00                                                     ; $3449
	ld   [wIntroCutsceneDataLoadStep], a                            ; $344b
	ret                                                             ; $344e


LoadBGAnimatedTileData:
	ld   a, [wCutsceneHiColTileDataVramBank]                        ; $344f
	ldh  [rVBK], a                                                  ; $3452

; Data to load is in 2nd 4mb
	ld   a, $01                                                     ; $3454
	ld   [ROMB1], a                                                 ; $3456

; Cycle through steps 0, 1, 2, for each of 3 fragments for a whole source
	ld   a, [wIntroCutsceneDataLoadStep]                            ; $3459
	cp   $01                                                        ; $345c
	jr   z, .step1                                                  ; $345e

	cp   $02                                                        ; $3460
	jr   z, .step2                                                  ; $3462

; Get num bytes, set bank, and base source in HL
	ld   b, (BG_ANIMATED_TILE_DATA_FRAGMENT_SIZE/$10)-1             ; $3464
	ld   a, [wBGAnimatedTileDataBank]                               ; $3466
	ld   [ROMB0], a                                                 ; $3469
	ld   a, [wBGAnimatedTileDataAddr]                               ; $346c
	ld   l, a                                                       ; $346f
	ld   a, [wBGAnimatedTileDataAddr+1]                             ; $3470
	ld   h, a                                                       ; $3473

; Transfer, reset high rom bank, and inc step
	ld   de, _VRAM+$900                                             ; $3474
	call StartHDMATransfer                                          ; $3477
	ld   a, $00                                                     ; $347a
	ld   [ROMB1], a                                                 ; $347c
	ld   a, $01                                                     ; $347f
	ld   [wIntroCutsceneDataLoadStep], a                            ; $3481
	ret                                                             ; $3484

.step1:
; Get num bytes, set bank, and base source in HL
	ld   b, (BG_ANIMATED_TILE_DATA_FRAGMENT_SIZE/$10)-1             ; $3485
	ld   a, [wBGAnimatedTileDataBank]                               ; $3487
	ld   [ROMB0], a                                                 ; $348a
	ld   a, [wBGAnimatedTileDataAddr]                               ; $348d
	ld   l, a                                                       ; $3490
	ld   a, [wBGAnimatedTileDataAddr+1]                             ; $3491
	ld   h, a                                                       ; $3494

; Transfer, reset high rom bank, and inc step
	ld   de, BG_ANIMATED_TILE_DATA_FRAGMENT_SIZE                    ; $3495
	add  hl, de                                                     ; $3498
	ld   de, _VRAM+$900+BG_ANIMATED_TILE_DATA_FRAGMENT_SIZE         ; $3499
	call StartHDMATransfer                                          ; $349c
	ld   a, $00                                                     ; $349f
	ld   [ROMB1], a                                                 ; $34a1
	ld   a, $02                                                     ; $34a4
	ld   [wIntroCutsceneDataLoadStep], a                            ; $34a6
	ret                                                             ; $34a9

.step2:
; Get num bytes, set bank, and base source in HL
	ld   b, (BG_ANIMATED_TILE_DATA_FRAGMENT_SIZE/$10)-1             ; $34aa
	ld   a, [wBGAnimatedTileDataBank]                               ; $34ac
	ld   [ROMB0], a                                                 ; $34af
	ld   a, [wBGAnimatedTileDataAddr]                               ; $34b2
	ld   l, a                                                       ; $34b5
	ld   a, [wBGAnimatedTileDataAddr+1]                             ; $34b6
	ld   h, a                                                       ; $34b9

; Transfer, reset high rom bank, swap screens and cycle step
	ld   de, BG_ANIMATED_TILE_DATA_FRAGMENT_SIZE*2                  ; $34ba
	add  hl, de                                                     ; $34bd
	ld   de, _VRAM+$900+BG_ANIMATED_TILE_DATA_FRAGMENT_SIZE*2       ; $34be
	call StartHDMATransfer                                          ; $34c1
	ld   a, $00                                                     ; $34c4
	ld   [ROMB1], a                                                 ; $34c6
	call SwapHiColVramBankCopyDestAndScreenNowSetUp                 ; $34c9
	ld   a, $00                                                     ; $34cc
	ld   [wIntroCutsceneDataLoadStep], a                            ; $34ce
	ret                                                             ; $34d1


ApplyHiColPalettes:
	ldbc STATF_LCD, LOW(rBCPD)                                      ; $34d2
	ld   a, XCPS_AUTO_INCREMENT                                     ; $34d5
	ldh  [rBCPS], a                                                 ; $34d7

; BG palette data in 2nd 4mb of the rom
	ld   a, $01                                                     ; $34d9
	ld   [ROMB1], a                                                 ; $34db
	ld   a, [wCutsceneHiColBGPaletteLowRomBank]                     ; $34de
	ld   [ROMB0], a                                                 ; $34e1

; Get BG palette base addr
	ld   a, [wCutsceneHiColBGPaletteAddr]                           ; $34e4
	ld   l, a                                                       ; $34e7
	ld   a, [wCutsceneHiColBGPaletteAddr+1]                         ; $34e8
	ld   h, a                                                       ; $34eb

; Set 1st few rows entire BG palettes..
	ld   d, NUM_PALETTE_BYTES                                       ; $34ec
:	ld   a, [hl+]                                                   ; $34ee
	ldh  [c], a                                                     ; $34ef
	dec  d                                                          ; $34f0
	jr   nz, :-                                                     ; $34f1

; Until LY == 6
:	ldh  a, [rLY]                                                   ; $34f3
	cp   $06                                                        ; $34f5
	jr   nz, :-                                                     ; $34f7

; Re-load BG palettes $20 times ($40 scanlines)
	ld   d, NUM_PALETTE_BYTES/2                                     ; $34f9
:	call Copy20hHiColPalettes                                       ; $34fb
	call Copy20hHiColPalettes                                       ; $34fe
	dec  d                                                          ; $3501
	jp   nz, :-                                                     ; $3502

; LCDCF_BG8800 while we're on tile idxes using the shared $80+ area
	ldh  a, [rLCDC]                                                 ; $3505
	res  4, a                                                       ; $3507
	ldh  [rLCDC], a                                                 ; $3509

; Do another $40 scanlines
; Since we wasted cycles here, 1st loop only copies $20h palettes
	ld   d, NUM_PALETTE_BYTES/2                                     ; $350b
	jp   :+                                                         ; $350d
.loop:
	call Copy20hHiColPalettes                                       ; $3510
:	call Copy20hHiColPalettes                                       ; $3513
	dec  d                                                          ; $3516
	jp   nz, .loop                                                  ; $3517

; Everything below hi-col is all black
	ld   a, BANK(Palettes_AllBlack)                                 ; $351a
	call SetRomBank1stHalfOfRom                                     ; $351c
	ld   hl, Palettes_AllBlack                                      ; $351f

	ld   a, XCPS_AUTO_INCREMENT                                     ; $3522
	ldh  [rBCPS], a                                                 ; $3524
	call Copy20hHiColPalettes                                       ; $3526
	call Copy20hHiColPalettes                                       ; $3529
	ret                                                             ; $352c


LoadHiColTileData:
; Return if already loaded
	ld   a, [wCutsceneHiColIdxToLoad]                               ; $352d
	cp   $ff                                                        ; $3530
	ret  z                                                          ; $3532

; Intro cutscene bank has sources to all cutscene tile data source addresses
	ld   a, BANK(IntroCutsceneHiColTileDataSources)                 ; $3533
	call SetRomBank1stHalfOfRom                                     ; $3535

	ld   a, [wCutsceneHiColFrameStep]                               ; $3538
	or   a                                                          ; $353b
	jr   z, .step0                                                  ; $353c

	cp   $01                                                        ; $353e
	jr   z, .step1                                                  ; $3540

	cp   $02                                                        ; $3542
	jr   z, .step2                                                  ; $3544

	cp   $03                                                        ; $3546
	jr   z, .step3                                                  ; $3548

	cp   $04                                                        ; $354a
	jr   z, .step4                                                  ; $354c

	cp   $05                                                        ; $354e
	jr   z, .step5                                                  ; $3550

	cp   $06                                                        ; $3552
	jr   z, .step6                                                  ; $3554

	jr   .step7                                                     ; $3556

.step0:
	ld   hl, IntroCutsceneHiColTileDataSources+HI_COL_SIZEOF*3*0    ; $3558
	call GetCutsceneHiColTileDataFragmentSrc                        ; $355b
	ld   de, _VRAM+HI_COL_TILE_DATA_FRAGMENT_SIZE*0                 ; $355e
	jr   .cont                                                      ; $3561

.step1:
	ld   hl, IntroCutsceneHiColTileDataSources+HI_COL_SIZEOF*3*1    ; $3563
	call GetCutsceneHiColTileDataFragmentSrc                        ; $3566
	ld   de, _VRAM+HI_COL_TILE_DATA_FRAGMENT_SIZE*1                 ; $3569
	jr   .cont                                                      ; $356c

.step2:
	ld   hl, IntroCutsceneHiColTileDataSources+HI_COL_SIZEOF*3*2    ; $356e
	call GetCutsceneHiColTileDataFragmentSrc                        ; $3571
	ld   de, _VRAM+HI_COL_TILE_DATA_FRAGMENT_SIZE*2                 ; $3574
	jr   .cont                                                      ; $3577

.step3:
	ld   hl, IntroCutsceneHiColTileDataSources+HI_COL_SIZEOF*3*3    ; $3579
	call GetCutsceneHiColTileDataFragmentSrc                        ; $357c
	ld   de, _VRAM+HI_COL_TILE_DATA_FRAGMENT_SIZE*3                 ; $357f
	jr   .cont                                                      ; $3582

.step4:
	ld   hl, IntroCutsceneHiColTileDataSources+HI_COL_SIZEOF*3*4    ; $3584
	call GetCutsceneHiColTileDataFragmentSrc                        ; $3587
	ld   de, _VRAM+HI_COL_TILE_DATA_FRAGMENT_SIZE*4                 ; $358a
	jr   .cont                                                      ; $358d

.step5:
	ld   hl, IntroCutsceneHiColTileDataSources+HI_COL_SIZEOF*3*5    ; $358f
	call GetCutsceneHiColTileDataFragmentSrc                        ; $3592
	ld   de, _VRAM+HI_COL_TILE_DATA_FRAGMENT_SIZE*5                 ; $3595
	jr   .cont                                                      ; $3598

.step6:
	ld   hl, IntroCutsceneHiColTileDataSources+HI_COL_SIZEOF*3*6    ; $359a
	call GetCutsceneHiColTileDataFragmentSrc                        ; $359d
	ld   de, _VRAM+HI_COL_TILE_DATA_FRAGMENT_SIZE*6                 ; $35a0
	jr   .cont                                                      ; $35a3

.step7:
; Set flag that all tile data is loaded, and we will switch to it
	ld   a, $01                                                     ; $35a5
	ld   [wShouldUpdateHiColBGPalettes], a                          ; $35a7

	ld   hl, IntroCutsceneHiColTileDataSources+HI_COL_SIZEOF*3*7    ; $35aa
	call GetCutsceneHiColTileDataFragmentSrc                        ; $35ad
	ld   de, _VRAM+HI_COL_TILE_DATA_FRAGMENT_SIZE*7                 ; $35b0
	jr   .cont                                                      ; $35b3

.cont:
; Transfer to correct vram bank
	ld   a, [wCutsceneHiColTileDataVramBank]                        ; $35b5
	ldh  [rVBK], a                                                  ; $35b8

; Fragment of hi-color data found in 2nd 4mb of the game, low byte in B
	ld   a, $01                                                     ; $35ba
	ld   [ROMB1], a                                                 ; $35bc
	ld   a, b                                                       ; $35bf
	ld   [ROMB0], a                                                 ; $35c0
	ld   b, (HI_COL_TILE_DATA_FRAGMENT_SIZE/$10)-1                  ; $35c3
	call StartHDMATransfer                                          ; $35c5

; Inc step and store it
	ld   a, [wCutsceneHiColFrameStep]                               ; $35c8
	inc  a                                                          ; $35cb
	cp   $08                                                        ; $35cc
	jr   c, .storeFrameStep                                         ; $35ce

; After 8 steps, swap to correct set-up screen, dont load more tiles
	call SwapHiColVramBankCopyDestAndScreenNowSetUp                 ; $35d0

	ld   a, [wCutsceneHiColIdxToLoad]                               ; $35d3
	ld   [wCutsceneHiColIdx], a                                     ; $35d6
	ld   a, $ff                                                     ; $35d9
	ld   [wCutsceneHiColIdxToLoad], a                               ; $35db

	xor  a                                                          ; $35de
.storeFrameStep:
	ld   [wCutsceneHiColFrameStep], a                               ; $35df

; Save LY for profiling
	ldh  a, [rLY]                                                   ; $35e2
	ld   [wUnusedLYAfterLoadingHiColTileDataFragment], a            ; $35e4
	ret                                                             ; $35e7


GetCutsceneHiColTileDataFragmentSrc:
; Idx * 3 to get bank byte and addr word
	ld   a, [wCutsceneHiColIdxToLoad]                               ; $35e8
	ld   b, a                                                       ; $35eb
	add  a                                                          ; $35ec
	add  b                                                          ; $35ed
	ld   c, a                                                       ; $35ee
	ld   b, $00                                                     ; $35ef
	add  hl, bc                                                     ; $35f1

; HL offset with above to get B (rom bank) and HL (source addr)
	ld   a, [hl+]                                                   ; $35f2
	ld   b, a                                                       ; $35f3
	ld   a, [hl+]                                                   ; $35f4
	ld   h, [hl]                                                    ; $35f5
	ld   l, a                                                       ; $35f6
	ret                                                             ; $35f7


SwapHiColVramBankCopyDestAndScreenNowSetUp:
; Copying to vram bank 1 has us use screen 0, which uses tiles from vram bank 0
; Vice versa with vram bank 0
	ld   a, [wCutsceneHiColTileDataVramBank]                        ; $35f8
	xor  $01                                                        ; $35fb
	ld   [wCutsceneHiColTileDataVramBank], a                        ; $35fd
	jr   nz, :+                                                     ; $3600

; LCDCF_BG9C00
	ldh  a, [rLCDC]                                                 ; $3602
	set  3, a                                                       ; $3604
	ldh  [rLCDC], a                                                 ; $3606
	ret                                                             ; $3608

; LCDCF_BG9800
:	ldh  a, [rLCDC]                                                 ; $3609
	res  3, a                                                       ; $360b
	ldh  [rLCDC], a                                                 ; $360d
	ret                                                             ; $360f


; BC - multiple of 8 - offset into table
TransferTileDataForWideScreen::
	ld   hl, .table                                                 ; $3610
	add  hl, bc                                                     ; $3613

; Byte 0 - vram bank
	ld   a, [hl+]                                                   ; $3614
	ldh  [rVBK], a                                                  ; $3615

	ld   a, [wRomBank]                                              ; $3617
	push af                                                         ; $361a

; Byte 1 - rom bank src
	ld   a, [hl+]                                                   ; $361b
	call SetRomBank1stHalfOfRom                                     ; $361c

; Byte 2 - hdma5 (num bytes/$10-1)
	ld   a, [hl+]                                                   ; $361f
	ld   b, a                                                       ; $3620

; Byte 3/4 - dest
	ld   a, [hl+]                                                   ; $3621
	ld   e, a                                                       ; $3622
	ld   a, [hl+]                                                   ; $3623
	ld   d, a                                                       ; $3624

; Byte 5/6 - source
	ld   a, [hl+]                                                   ; $3625
	ld   h, [hl]                                                    ; $3626
	ld   l, a                                                       ; $3627

; Transfer in vblank and update sound
	waitForRequestedVBlank
	call StartHDMATransfer                                          ; $3635
	call UpdateSound                                                ; $3638

	pop  af                                                         ; $363b
	call SetRomBank1stHalfOfRom                                     ; $363c
	ret                                                             ; $363f

.table:
; Green train
	WideScreenData 0, Gfx_WideScreenGreenTrain1, $800, _VRAM+$900
	WideScreenData 0, Gfx_WideScreenGreenTrain2, $700, _VRAM+$1100
	WideScreenData 1, Gfx_WideScreenGreenTrain3, $700, _VRAM+$1100

; Purple train wheel
	WideScreenData 0, Gfx_WideScreenPurpleTrain1, $800, _VRAM+$900
	WideScreenData 0, Gfx_WideScreenPurpleTrain2, $700, _VRAM+$1100
	WideScreenData 1, Gfx_WideScreenPurpleTrain3, $700, _VRAM+$1100

; 1st credits
	WideScreenData 0, Gfx_WideScreen1stCredits1, $800, _VRAM
	WideScreenData 0, Gfx_WideScreen1stCredits2, $800, _VRAM+$800
	WideScreenData 0, Gfx_WideScreen1stCredits3, $800, _VRAM+$1000
	WideScreenData 1, Gfx_WideScreen1stCredits4, $800, _VRAM+$800
	WideScreenData 1, Gfx_WideScreen1stCredits5, $800, _VRAM+$1000

; Large linked trains
	WideScreenData 0, Gfx_LargeScreenLinkedTrains1, $800, _VRAM+$800
	WideScreenData 0, Gfx_LargeScreenLinkedTrains2, $800, _VRAM+$1000
	WideScreenData 1, Gfx_LargeScreenLinkedTrains3, $800, _VRAM+$800
	WideScreenData 1, Gfx_LargeScreenLinkedTrains4, $800, _VRAM+$1000

; 2nd credits
	WideScreenData 0, Gfx_WideScreen2ndCredits1, $800, _VRAM
	WideScreenData 0, Gfx_WideScreen2ndCredits2, $800, _VRAM+$800
	WideScreenData 0, Gfx_WideScreen2ndCredits3, $800, _VRAM+$1000
	WideScreenData 1, Gfx_WideScreen2ndCredits4, $800, _VRAM+$800
	WideScreenData 1, Gfx_WideScreen2ndCredits5, $800, _VRAM+$1000
