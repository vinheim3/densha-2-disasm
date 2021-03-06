IF DEF(STRUCTS)
ELSE

DEF STRUCTS = 1

rsreset
OAM_Y rb 1 ; 0
OAM_X rb 1 ; 1
OAM_TILE rb 1 ; 2
OAM_ATTR rb 1 ; 3
OAM_SIZEOF rb

rsreset
SCRIPT_SPRITE_ADDR rw 1 ; $00
SCRIPT_SPRITE_BANK rb 1 ; $02
SCRIPT_SPRITE_X rb 1 ; $03
SCRIPT_SPRITE_Y rb 1 ; $04
SCRIPT_BANK_MAIN rb 1 ; $05
SCRIPT_DELAY_MAIN rb 1 ; $06
SCRIPT_ADDR_MAIN rw 1 ; $07
SCRIPT_BANK_SUB1 rb 1 ; $09
SCRIPT_DELAY_SUB1 rb 1 ; $0a
SCRIPT_ADDR_SUB1 rw 1 ; $0b
SCRIPT_BANK_SUB2 rb 1 ; $0d
SCRIPT_DELAY_SUB2 rb 1 ; $0e
SCRIPT_ADDR_SUB2 rw 1 ; $0f
SCRIPT_COUNTER1 rb 1 ; $11
SCRIPT_COUNTER2 rb 1 ; $12
SCRIPT_COUNTER3 rb 1 ; $13
SCRIPT_SP rb 1 ; $14 - starts at $15 ; += 2 before call
; special calls will overwrite the return address here
SCRIPT_STACK_SINGLE_USE_ADDR rw 1 ; $15
SCRIPT_STACK rb $d-7 ; $17
SCRIPT_VAR_1D rb 1 ; $1d
SCRIPT_VAR_1E rb 1 ; $1e
SCRIPT_VAR_1F rb 1 ; $1f
SCRIPT_VAR_20 rb 1 ; $20
SCRIPT_VAR_21 rb 1 ; $21
SCRIPT_VAR_22 rb 1 ; $22
SCRIPT_VAR_23 rb 1 ; $23

rsreset
SCORE_DIGITS rb 3 ; 0
SCORE_CHAR rb 1 ; 3
SCORE_BCD rb 2 ; 4
SCORE_PRO_LEVEL rb 1 ; 6
SCORE_SIZEOF rb

rsreset
AUD_Start rb $c8
AUD_COUNTER_TIL_NEXT_SOUND_BYTE rb 1 ; cxc8
AUD_THRESHOLD_FOR_COUNTER_TO_NEXT_SOUND_BYTE rb 1 ; cxc9
AUD_CHAN_BANK rb 1 ; cxca
AUD_CHAN_ADDR rw 1 ; cxcb/c
AUD_FREQ_TABLE_BASE_IDX rb 1 ; cxcd
AUD_SND_DATA_BYTE rb 1 ; cxce
AUD_SAVED_ENVELOPES rb 8 ; cxcf
AUD_LOOP_COUNTERS rb 4 ; $cxd7
AUD_ALTERNATE_TERM_COUNTER_THRESHOLD rb 1 ; cxdb
AUD_ALTERNATE_TERM_ENABLED_AND_COUNTER rb 1 ; cxdc
AUD_ALTERNATE_TERM_CURR_OUTPUT rb 1 ; cxdd
; Helps to not play music over sound effects, and to determine aud term
AUD_11h_IF_SOUND_HW_REG_USED rb 1 ; $cxde
AUD_STACK_OFFSET rb 1 ; cxdf
AUD_STACK rb $ff-$e0 ; cxe0
ENDC