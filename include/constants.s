INCLUDE "include/structs.s"

DEF XCPS_AUTO_INCREMENT = $80
DEF NUM_PALETTE_BYTES = $40
DEF SCREEN_TILE_WIDTH = $14
DEF SCREEN_TILE_HEIGHT = $12
DEF GB_TILE_WIDTH = $20
DEF GB_TILE_HEIGHT = $20
DEF NUM_SPRITES = $28
DEF ROMB0 = $2100
DEF ROMB1 = $3100
DEF RAMG_ENABLE = $0a
DEF RAMG_DISABLE = $00

DEF PAGE_0 = $c000
DEF PAGE_1 = $c100
DEF PAGE_2 = $c200
DEF PAGE_3 = $c300
DEF PAGE_4 = $c400
DEF PAGE_5 = $c500
DEF PAGE_6 = $c600
DEF PAGE_7 = $c700
DEF PAGE_8 = $c800

DEF NUM_MOVIES = $0c
DEF NUM_MUSIC = $16
DEF NUM_SOUND_EFFECTS = $1f
DEF NUM_TRAINS = $64
; Scripts are in every page of the first bank of wram
DEF MAX_SCRIPTS = $10
DEF NUM_TRAINLINES = $0b
DEF MAX_LOCATIONS_IN_A_TRAINLINE = $19
DEF SPEED_COVERING_1_CM = $229

; --
; -- Scrolling text
; --

DEF SCROLL_TEXT_COL_START = $12
DEF SCROLL_TEXT_IDX = SCRIPT_VAR_1D
; 0 - picture book, 1 - picture book submenu, 2 - trainline selection, 3 - Game Setup
DEF SCROLL_TEXT_SCREEN_IDX = SCRIPT_VAR_1E
DEF SCROLL_TEXT_CONTROL_SCHEME = $10

; --
; -- Picture book
; --

; Script 0
DEF PIC_BOOK_MAIN_SELECTION = SCRIPT_VAR_1D
DEF PIC_BOOK_MENU_MOVEMENT_COUNTER = SCRIPT_VAR_1E
DEF PIC_BOOK_SUB_MENU_SCROLL_TEXT_IDX = SCRIPT_VAR_1F
DEF PIC_BOOK_MUSIC_IDX = SCRIPT_VAR_20
DEF PIC_BOOK_SOUND_EFFECT_IDX = SCRIPT_VAR_21
DEF PIC_BOOK_NUMBER_BOX_ANIM_IDX = SCRIPT_VAR_22
DEF PIC_BOOK_MUSIC_SE_SELECTION = SCRIPT_VAR_23

DEF NUM_TRAIN_OPTS_IN_1_PAGE = $09
DEF TRAIN_OPT_HIGHEST_TOP_INDEX = $5b
ASSERT NUM_TRAIN_OPTS_IN_1_PAGE + TRAIN_OPT_HIGHEST_TOP_INDEX == NUM_TRAINS

; --
; -- Train image
; --

DEF TRAIN_IDX = SCRIPT_VAR_1D
DEF VIEWING_TRAIN_IMAGE_INFO = SCRIPT_VAR_1E

; --
; -- Rankings
; --

DEF RANKINGS_METATILE_EMPTY = $36
DEF NUM_SCORES_PER_TRAINLINE = $07
; For below, 0-7 are from trainlines 0-7
DEF RANKINGS_FROM_DEMO = $08
DEF RANKINGS_FROM_TITLE_SCREEN_OPTS = $09

; --
; -- Continue
; --

DEF CONT_TEXT_NONE = $00
DEF CONT_TEXT_BRAKES_TOO_STRONG = $01
DEF CONT_TEXT_PLEASE_PROTECT_STATION = $02
DEF CONT_TEXT_PLEASE_PROTECT_SIGNAL = $03
DEF CONT_TEXT_USE_COASTING = $04
DEF CONT_TEXT_PRESS_START_CIRCLE_MOUTH = $05
DEF CONT_TEXT_PRESS_START_CURVE_MOUTH = $06
DEF CONT_TEXT_PRESS_START_OPEN_MOUTH = $07

DEF CONT_TEXT_RESUME_WITH_COUNTDOWN = $01
DEF CONT_TEXT_RESUME = $02
DEF CONT_TEXT_GAME_OVER = $03

; --
; -- Enter high score
; --

DEF ENTER_SCORE_DELETE = $37
DEF ENTER_SCORE_SUBMIT = $38
DEF NUM_ENTER_SCORE_OPTS = $39

; --
; -- Train rails
; --

DEF RAILS_STRAIGHT = $00
DEF RAILS_STRONG_RIGHT = $01
DEF RAILS_STRONG_LEFT = $02
DEF RAILS_STRAIGHT_GOING_RIGHT = $03
DEF RAILS_STRAIGHT_GOING_LEFT = $04
DEF RAILS_RIGHT_GOING_STRAIGHT = $05
DEF RAILS_LEFT_GOING_STRAIGHT = $06

; --
; -- Game states
; --

DEF GAME_STATES_MAIN_HIGH_BANK = $09

DEF GS_IN_GAME_INIT = $00
DEF GS_IN_GAME_MAIN = $01
DEF GS_TRAINLINE_SELECTION_INIT = $02
DEF GS_TRAINLINE_SELECTION_MAIN = $03
DEF GS_PRE_IN_GAME_GRAPHIC_INIT = $04
DEF GS_PRE_IN_GAME_GRAPHIC_MAIN = $05
DEF GS_DEPARTURE_INFO_SCREEN_INIT = $06
DEF GS_DEPARTURE_INFO_SCREEN_MAIN = $07
DEF GS_ROUTE_DISPLAY_INIT = $08
DEF GS_ROUTE_DISPLAY_MAIN = $09
DEF GS_FINISHED_IN_GAME_INIT = $0a
DEF GS_FINISHED_IN_GAME_MAIN = $0b
DEF GS_TITLE_SCREEN_INIT = $0c
DEF GS_TITLE_SCREEN_MAIN = $0d
DEF GS_INTRO_INIT = $0e
DEF GS_INTRO_MAIN = $0f
DEF GS_LOCATION_DONE_INIT = $10
DEF GS_LOCATION_DONE_MAIN = $11
DEF GS_CONTINUE_SCREEN_INIT = $12
DEF GS_CONTINUE_SCREEN_MAIN = $13
DEF GS_SCORING_INIT = $14
DEF GS_SCORING_MAIN = $15
DEF GS_ENTER_HIGH_SCORE_INIT = $16
DEF GS_ENTER_HIGH_SCORE_MAIN = $17
DEF GS_RANKING_INIT = $18
DEF GS_RANKING_MAIN = $19
DEF GS_GAME_SETUP_INIT = $1a
DEF GS_GAME_SETUP_MAIN = $1b
DEF GS_STAGE_COMPLETE_INIT = $1c
DEF GS_STAGE_COMPLETE_MAIN = $1d
DEF GS_CREDITS_INIT = $1e
DEF GS_CREDITS_MAIN = $1f
DEF GS_TRAIN_IMAGE_INIT = $20
DEF GS_TRAIN_IMAGE_MAIN = $21
DEF GS_TRAIN_IMAGE_STUB = $22
DEF GS_TITLE_SCREEN_OPTS_INIT = $23
DEF GS_TITLE_SCREEN_OPTS_MAIN = $24
DEF GS_PICTURE_BOOK_INIT = $25
DEF GS_PICTURE_BOOK_MAIN = $26
DEF GS_PRINT_TRAIN_IMAGE_INIT = $27
DEF GS_PRINT_TRAIN_IMAGE_MAIN = $28
DEF GS_PRINT_START_INIT = $29
DEF GS_PRINT_START_MAIN = $2a
DEF GS_PHOTO_GET_INIT = $2b
DEF GS_PHOTO_GET_MAIN = $2c
DEF GS_GAME_OVER_INIT = $2d
DEF GS_GAME_OVER_MAIN = $2e
DEF GS_PICTURE_BOOK_COMPLETE_INIT = $2f
DEF GS_PICTURE_BOOK_COMPLETE_MAIN = $30
DEF GS_CONGRATS_INIT = $31
DEF GS_CONGRATS_MAIN = $32
DEF GS_INTRO_CUTSCENE_INIT = $33
DEF GS_INTRO_CUTSCENE_MAIN = $34

; --
; -- Sounds
; --

; Sound channel structs are in the 1st 8 pages of wram
; Music - $00 - $15
; Sound - $16 - $34
DEF MUS_NULL = $00
DEF MUS_02 = $02
DEF MUS_05 = $05
DEF MUS_06 = $06
DEF MUS_07 = $07
DEF MUS_0a = $0a
DEF MUS_0b = $0b
DEF MUS_0c = $0c
DEF MUS_0d = $0d
DEF MUS_0f = $0f
DEF MUS_10 = $10
DEF MUS_12 = $12
DEF MUS_13 = $13
DEF MUS_14 = $14
DEF MUS_15 = $15

DEF SND_NULL = $16
DEF SND_01 = $17
DEF SND_02 = $18
DEF SND_06 = $1c
DEF SND_07 = $1d
DEF SND_08 = $1e
DEF SND_09 = $1f
DEF SND_0a = $20
DEF SND_0b = $21
DEF SND_0e = $24
DEF SND_0f = $25
DEF SND_10 = $26
DEF SND_11 = $27
DEF SND_12 = $28
DEF SND_13 = $29
DEF SND_15 = $2b
DEF SND_16 = $2c
DEF SND_1e = $34

DEF SPECIAL_SOUND_BYTE_START = $d0
DEF MAKE_SOUND_EFFECT = $80
DEF NULL_SND_ADDR = $8000
DEF SND_BYTE_CLEAR_HW_REGS = $6f
DEF NUM_SOUND_STRUCTS = $08
DEF VOL_SND_DENSHA_DE_GO = $00

; --
; -- Intro animations
; --

DEF WIDE_SCREEN_TILE_WIDTH = $16
DEF HI_COL_TILE_DATA_FRAGMENT_SIZE = $280
DEF HI_COL_SIZEOF = $29
DEF BG_ANIMATED_TILE_DATA_FRAGMENT_SIZE = $4e0

DEF ANIM_ENGINE_NONE = $00
DEF ANIM_ENGINE_HI_COL = $01
DEF ANIM_ENGINE_SMALL_RECT_OAM = $02
DEF ANIM_ENGINE_CREDITS = $03
DEF ANIM_ENGINE_SIMPLE_BG = $04
DEF ANIM_ENGINE_LARGE_IMAGE = $05

DEF HI_COL_BLACK = $00
DEF HI_COL_TRAIN_NO_LIGHTS = $01
DEF HI_COL_TRAIN_LIGHTS = $02

DEF SMALL_RECT_TRAIN_1_START = $01
DEF SMALL_RECT_TRAIN_1_END = $0b
DEF SMALL_RECT_TRAIN_2_START = $0c
DEF SMALL_RECT_TRAIN_2_END = $15
DEF SMALL_RECT_TRAIN_3_START = $16
DEF SMALL_RECT_TRAIN_3_END = $20
DEF SMALL_RECT_TRAIN_4_START = $21
DEF SMALL_RECT_TRAIN_4_END = $2c
DEF SMALL_RECT_TRAIN_5_START = $2d
DEF SMALL_RECT_TRAIN_5_END = $36
DEF SMALL_RECT_TRAIN_6_START = $37
DEF SMALL_RECT_TRAIN_6_END = $3b
DEF SMALL_RECT_TRAIN_7_START = $3c
DEF SMALL_RECT_TRAIN_7_END = $41
DEF SMALL_RECT_TRAIN_8_START = $42
DEF SMALL_RECT_TRAIN_8_END = $48

DEF WIDE_SCREEN_GREEN_TRAIN_1 = $00
DEF WIDE_SCREEN_GREEN_TRAIN_2 = $08
DEF WIDE_SCREEN_GREEN_TRAIN_3 = $10
DEF WIDE_SCREEN_PURPLE_WHEEL_1 = $18
DEF WIDE_SCREEN_PURPLE_WHEEL_2 = $20
DEF WIDE_SCREEN_PURPLE_WHEEL_3 = $28
DEF WIDE_SCREEN_1ST_CREDITS_1 = $30
DEF WIDE_SCREEN_1ST_CREDITS_2 = $38
DEF WIDE_SCREEN_1ST_CREDITS_3 = $40
DEF WIDE_SCREEN_1ST_CREDITS_4 = $48
DEF WIDE_SCREEN_1ST_CREDITS_5 = $50
DEF LARGE_SCREEN_LINKED_TRAINS_1 = $58
DEF LARGE_SCREEN_LINKED_TRAINS_2 = $60
DEF LARGE_SCREEN_LINKED_TRAINS_3 = $68
DEF LARGE_SCREEN_LINKED_TRAINS_4 = $70
DEF WIDE_SCREEN_2ND_CREDITS_1 = $78
DEF WIDE_SCREEN_2ND_CREDITS_2 = $80
DEF WIDE_SCREEN_2ND_CREDITS_3 = $88
DEF WIDE_SCREEN_2ND_CREDITS_4 = $90
DEF WIDE_SCREEN_2ND_CREDITS_5 = $98

DEF BG_ANIM_1_START = $01
DEF BG_ANIM_1_END = $0d
DEF BG_ANIM_2_START = $0e
DEF BG_ANIM_2_END = $19
DEF BG_ANIM_3_START = $1a
DEF BG_ANIM_3_END = $26

; --
; -- Serial
; --

DEF SC_REQUEST = $80
DEF SC_MASTER = $01
DEF SC_PASSIVE = $00
DEF SB_NO_PRINTER = $ff
DEF DATA_FRAGMENT_SIZE = $280
DEF P_LOW_BATTERY = 7
DEF P_OTHER_ERROR = 6
DEF P_PAPER_JAM = 5
DEF P_PACKET_ERROR = 4
DEF P_UNPROCESSED_DATA = 3
DEF P_PRINTING = 1
DEF P_CHECKSUM_ERROR = 0
DEF PRINT_SS_PREP = 0
;DEF PRINT_SS_UNKNOWN_PREP = 1
;DEF PRINT_SS_INIT = 2
DEF PRINT_SS_LOAD_TILE_DATA = 3
DEF PRINT_SS_PRINTING = 4
DEF PRINT_SS_WAIT_UNTIL_DONE = 5
DEF PRINT_SS_CANCELLING = 6
DEF PRINT_SS_TRANSITIONING = 7
DEF PRINT_MARKER_IN_PROGRESS = $f0
DEF PRINT_MARKER_ERRORED = $ff

; --
; -- Events
; --

DEF EVENT_NONE = $00
DEF EVENT_GREEN_SIGNAL = $01
DEF EVENT_ATTENTION_45KM_H = $02
DEF EVENT_STOP_SIGNAL = $03
;
DEF EVENT_MUST_PRESS_SIREN = $07
DEF EVENT_SLOPING_DOWN = $08
DEF EVENT_NO_SLOPE = $09
DEF EVENT_CLIMBING = $0a
DEF EVENT_SPEED_LIMIT_70KM_H = $0b
DEF EVENT_SPEED_LIMIT_55KM_H = $0c
DEF EVENT_SPEED_LIMIT_75KM_H = $0d
DEF EVENT_SPEED_LIMIT_60KM_H = $0e
DEF EVENT_SPEED_LIMIT_40KM_H = $0f
DEF EVENT_NO_SPEED_LIMIT = $10
;
DEF EVENT_PAUSED = $15
DEF EVENT_START_SIGNAL_OFF = $16
DEF EVENT_START_SIGNAL_ON = $17
DEF EVENT_ALTERNATING_RED_LIGHTS_1 = $18
DEF EVENT_ALTERNATING_RED_LIGHTS_2 = $19
DEF EVENT_SPEED_LIMIT_35KM_H = $1a
DEF EVENT_DECELERATION_70KM_H = $1b
DEF EVENT_WARNING_25KM_H = $1c
DEF EVENT_SPEED_LIMIT_30KM_H = $1d
DEF EVENT_SPEED_LIMIT_45KM_H = $1e
DEF EVENT_SPEED_LIMIT_50KM_H = $1f
DEF EVENT_SPEED_LIMIT_65KM_H = $20
DEF EVENT_SPEED_LIMIT_80KM_H = $21
DEF EVENT_SPEED_LIMIT_85KM_H = $22
DEF EVENT_SPEED_LIMIT_90KM_H = $23
DEF EVENT_SPEED_LIMIT_95KM_H = $24
DEF EVENT_SPEED_LIMIT_100KM_H = $25
DEF EVENT_SPEED_LIMIT_105KM_H = $26
DEF EVENT_SPEED_LIMIT_110KM_H = $27
DEF EVENT_SPEED_LIMIT_115KM_H = $28
DEF EVENT_SPEED_LIMIT_120KM_H = $29
DEF EVENT_SPEED_LIMIT_125KM_H = $2a
DEF EVENT_SPEED_LIMIT_160KM_H = $2b
DEF EVENT_SPEED_LIMIT_210KM_H = $2c
DEF EVENT_SPEED_LIMIT_245KM_H = $2d
DEF EVENT_CAB_GET_ON = $2e
DEF EVENT_CAB_LIMIT = $2f
DEF EVENT_CAB_STOP = $30
;
DEF EVENT_CARRY_ON_OUT = $32
DEF EVENT_CARRY_ON_FIELD = $33
DEF EVENT_COASTING_NOTICE = $34
DEF EVENT_COASTING_IDLE = $35
DEF EVENT_COASTING_END = $36
DEF EVENT_ATC_30 = $37
DEF EVENT_ATC_70 = $38
DEF EVENT_ATC_110 = $39
DEF EVENT_ATC_160 = $3a
DEF EVENT_ATC_210 = $3b
DEF EVENT_ATC_245 = $3c

DEF INFO_EV_NONE = $00
DEF INFO_EV_ATTENTION_45KM_H = $01
DEF INFO_EV_STOP_SIGNAL = $02
DEF INFO_EV_WARNING_25KM_H = $03
DEF INFO_EV_DECELERATION_70KM_H = $04
DEF INFO_EV_GREEN_SIGNAL = $06
DEF INFO_EV_CARRY_ON_OUT = $07
DEF INFO_EV_CARRY_ON_FIELD = $08
DEF INFO_EV_SPEED_LIMIT_35KM_H = $09
DEF INFO_EV_SPEED_LIMIT_75KM_H = $0a
DEF INFO_EV_SPEED_LIMIT_70KM_H = $0b
DEF INFO_EV_SPEED_LIMIT_60KM_H = $0c
DEF INFO_EV_SPEED_LIMIT_55KM_H = $0d
DEF INFO_EV_SPEED_LIMIT_40KM_H = $0e
DEF INFO_EV_SPEED_LIMIT_30KM_H = $0f
DEF INFO_EV_SPEED_LIMIT_45KM_H = $10
DEF INFO_EV_SPEED_LIMIT_50KM_H = $11
DEF INFO_EV_SPEED_LIMIT_65KM_H = $12
DEF INFO_EV_SPEED_LIMIT_80KM_H = $13
DEF INFO_EV_SPEED_LIMIT_85KM_H = $14
DEF INFO_EV_SPEED_LIMIT_90KM_H = $15
DEF INFO_EV_SPEED_LIMIT_95KM_H = $16
DEF INFO_EV_SPEED_LIMIT_100KM_H = $17
DEF INFO_EV_SPEED_LIMIT_105KM_H = $18
DEF INFO_EV_SPEED_LIMIT_110KM_H = $19
DEF INFO_EV_SPEED_LIMIT_115KM_H = $1a
DEF INFO_EV_SPEED_LIMIT_120KM_H = $1b
DEF INFO_EV_SPEED_LIMIT_125KM_H = $1c
DEF INFO_EV_SPEED_LIMIT_160KM_H = $1d
DEF INFO_EV_SPEED_LIMIT_210KM_H = $1e
DEF INFO_EV_SPEED_LIMIT_245KM_H = $1f
;
DEF INFO_EV_ATC_30 = $21
DEF INFO_EV_ATC_70 = $22
DEF INFO_EV_ATC_110 = $23
DEF INFO_EV_ATC_160 = $24
DEF INFO_EV_ATC_210 = $25
DEF INFO_EV_ATC_245 = $26

;
DEF SCEN_CAB_GET_ON = $04
DEF SCEN_CAB_LIMIT = $05
DEF SCEN_CAB_STOP = $06
DEF SCEN_ALT_RED_LIGHTS_NO_BONUS = $07
DEF SCEN_MUST_PRESS_SIREN = $08
DEF SCEN_HIDDEN_SIREN_BONUS_PTS = $09
DEF SCEN_APPROACHING_STATION = $0a
;
DEF SCEN_COASTING_NOTICE = $15
DEF SCEN_COASTING_IDLE = $16
DEF SCEN_COASTING_END = $17
DEF SCEN_NO_SPEED_LIMIT = $18
DEF SCEN_CAB_EVENT = $19
DEF SCEN_CUSTOM_SPEED_LIMIT_OR_STOP = $1a
;
DEF SCEN_CARRY_ON_FIELD = $1c
DEF SCEN_SPEED_LIMIT_30KM_H = $1d
DEF SCEN_SPEED_LIMIT_35KM_H = $1e
;
DEF SCEN_SPEED_LIMIT_45KM_H = $20
DEF SCEN_SPEED_LIMIT_50KM_H = $21
DEF SCEN_SPEED_LIMIT_55KM_H = $22
DEF SCEN_SPEED_LIMIT_60KM_H = $23
DEF SCEN_SPEED_LIMIT_65KM_H = $24
DEF SCEN_SPEED_LIMIT_70KM_H = $25
DEF SCEN_SPEED_LIMIT_75KM_H = $26
DEF SCEN_SPEED_LIMIT_80KM_H = $27
DEF SCEN_SPEED_LIMIT_85KM_H = $28
DEF SCEN_SPEED_LIMIT_90KM_H = $29
DEF SCEN_SPEED_LIMIT_95KM_H = $2a
DEF SCEN_SPEED_LIMIT_100KM_H = $2b
DEF SCEN_SPEED_LIMIT_105KM_H = $2c
DEF SCEN_SPEED_LIMIT_110KM_H = $2d
DEF SCEN_SPEED_LIMIT_115KM_H = $2e
DEF SCEN_SPEED_LIMIT_120KM_H = $2f
DEF SCEN_SPEED_LIMIT_125KM_H = $30
;
DEF SCEN_ATC_30KM_H = $34
DEF SCEN_ATC_70KM_H = $35
DEF SCEN_ATC_110KM_H = $36
DEF SCEN_ATC_160KM_H = $37
DEF SCEN_ATC_210KM_H = $38
DEF SCEN_ATC_245KM_H = $39
DEF SCEN_DARKEN_SKY = $50

; --
; -- In-game scenery texts
; --

DEF IGS_TEXT_NONE = $00
DEF IGS_TEXT_OVER_SPEED = $01
DEF IGS_TEXT_IGNORED_SIGN_SIGNALS = $02
DEF IGS_TEXT_SUDDEN_BRAKING = $03
;
DEF IGS_TEXT_ATS_OPERATION = $05
DEF IGS_TEXT_IGNORED_CAB_SIGNALS = $06
DEF IGS_TEXT_BOLLARD_CLASH = $07
DEF IGS_TEXT_DEPARTURE_PROGRESS = $08
;
DEF IGS_TEXT_PASSING_THE_STATION = $0a
DEF IGS_TEXT_ALL_SECTIONS_RUNNING = $0b
DEF IGS_TEXT_TIMEOUT = $0c
DEF IGS_TEXT_BONUS_PTS = $0d
DEF IGS_TEXT_GOOD = $0e
DEF IGS_TEXT_GREAT = $0f
DEF IGS_TEXT_PROCEED_PLEASE = $10
DEF IGS_TEXT_5_PTS_DEDUCTED = $11
DEF IGS_TEXT_REGULAR_COMMUNICATION = $12
DEF IGS_TEXT_SECTION_PASSAGE = $13
DEF IGS_TEXT_PTS_DEDUCTION = $14