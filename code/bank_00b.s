INCLUDE "includes.s"

SECTION "ROM Bank $00b", ROMX[$4000], BANK[$b]

InGameLocationSectionPointersForFrames::
	dw .metaSection_00
	dw .metaSection_01
	dw .metaSection_02
	dw .metaSection_03
	dw .metaSection_04
	dw .metaSection_05
	dw .metaSection_06
	dw .metaSection_07
	dw .metaSection_08
	dw .metaSection_09
	dw .metaSection_0a
	dw .metaSection_0b
	dw .metaSection_0c
	dw .metaSection_0d
	dw .metaSection_0e
	dw .metaSection_0f
	dw .metaSection_10
	dw .metaSection_11
	dw .metaSection_12
	dw .metaSection_13
	dw .metaSection_14
	dw .metaSection_15
	dw .metaSection_16
	dw .metaSection_17
	dw .metaSection_18
	dw .metaSection_19
	dw .metaSection_1a
	dw .metaSection_1b
	dw .metaSection_1c
	dw .metaSection_1d
	dw .metaSection_1e
	dw .metaSection_1f
	dw .metaSection_20
	dw .metaSection_21
	dw .metaSection_22
	dw .metaSection_23
	dw .metaSection_24
	dw .metaSection_25
	dw .metaSection_26
	dw .metaSection_27
	dw .metaSection_28
	dw .metaSection_29
	dw .metaSection_2a
	dw .metaSection_2b
	dw .metaSection_2c
	dw .metaSection_2d
	dw .metaSection_2e
	dw .metaSection_2f
	dw .metaSection_30
	dw .metaSection_31
	dw .metaSection_32
	dw .metaSection_33
	dw .metaSection_34
	dw .metaSection_35
	dw .metaSection_36
	dw .metaSection_37
	dw .metaSection_38
	dw .metaSection_39
	dw .metaSection_3a
	dw .metaSection_3b
	dw .metaSection_3c
	dw .metaSection_3d
	dw .metaSection_3e
	dw .metaSection_3f
	dw .metaSection_40
	dw .metaSection_41
	dw .metaSection_42
	dw .metaSection_43
	dw .metaSection_44
	dw .metaSection_45
	dw .metaSection_46
	dw .metaSection_47
	dw .metaSection_48
	dw .metaSection_49
	dw .metaSection_4a
	dw .metaSection_4b
	dw .metaSection_4c
	dw .metaSection_4d
	dw .metaSection_4e
	dw .metaSection_4f
	dw .metaSection_50
	dw .metaSection_51
	dw .metaSection_52
	dw .metaSection_53
	dw .metaSection_54
	dw .metaSection_55
	dw .metaSection_56
	dw .metaSection_57
	dw .metaSection_58
	dw .metaSection_59
	dw .metaSection_5a
	dw .metaSection_5b
	dw .metaSection_5c
	dw .metaSection_5d
	dw .metaSection_5e
	dw .metaSection_5f
	dw .metaSection_60
	dw .metaSection_61
	dw .metaSection_62
	dw .metaSection_63
	dw .metaSection_64
	dw .metaSection_65
	dw .metaSection_66
	dw .metaSection_67
	dw .metaSection_68
	dw .metaSection_69
	dw .metaSection_6a
	dw .metaSection_6b
	dw .metaSection_6c
	dw .metaSection_6d
	dw .metaSection_6e
	dw .metaSection_6f
	dw .metaSection_70
	dw .metaSection_71
	dw .metaSection_72
	dw .metaSection_73
	dw .metaSection_74
	dw .metaSection_75
	dw .metaSection_76
	dw .metaSection_77
	dw .metaSection_78
	dw .metaSection_79
	dw .metaSection_7a
	dw .metaSection_7b
	dw .metaSection_7c
	dw .metaSection_7d
	dw .metaSection_7e
	dw .metaSection_7f
	dw .metaSection_80
	dw .metaSection_81
	dw .metaSection_82
	dw .metaSection_83
	dw .metaSection_84
	dw .metaSection_85
	dw .metaSection_86
	dw .metaSection_87
	dw .metaSection_88
	dw .metaSection_89
	dw .metaSection_8a
	dw .metaSection_8b
	dw .metaSection_8c
	dw .metaSection_8d
	dw .metaSection_8e
	dw .metaSection_8f
	dw .metaSection_90
	dw .metaSection_91
	dw .metaSection_92
	dw .metaSection_93
	dw .metaSection_94
	dw .metaSection_95
	dw .metaSection_96
	dw .metaSection_97
	dw .metaSection_98
	dw .metaSection_99
	dw .metaSection_9a
	dw .metaSection_9b
	dw .metaSection_9c
	dw .metaSection_9d
	dw .metaSection_9e
	dw .metaSection_9f
	dw .metaSection_a0
	dw .metaSection_a1
	dw .metaSection_a2
	dw .metaSection_a3
	dw .metaSection_a4
	dw .metaSection_a5
	dw .metaSection_a6
	dw .metaSection_a7
	dw .metaSection_a8
	dw .metaSection_a9
	dw .metaSection_aa
	dw .metaSection_ab
	dw .metaSection_ac
	dw .metaSection_ad
	dw .metaSection_ae
	dw .metaSection_af
	dw .metaSection_b0
	dw .metaSection_b1
	dw .metaSection_b2
	dw .metaSection_b3
	dw .metaSection_b4
	dw .metaSection_b5
	dw .metaSection_b6
	dw .metaSection_b7
	dw .metaSection_b8
	dw .metaSection_b9
	dw .metaSection_ba
	dw .metaSection_bb
	dw .metaSection_bc
	dw .metaSection_bd
	dw .metaSection_be
	dw .metaSection_bf
	dw .metaSection_c0
	dw .metaSection_c1
	dw .metaSection_c2
	dw .metaSection_c3
	dw .metaSection_c4
	dw .metaSection_c5
	dw .metaSection_c6
	dw .metaSection_c7
	dw .metaSection_c8
	dw .metaSection_c9
	dw .metaSection_ca
	dw .metaSection_cb
	dw .metaSection_cc
	dw .metaSection_cd
	dw .metaSection_ce
	dw .metaSection_cf
	dw .metaSection_d0
	dw .metaSection_d1
	dw .metaSection_d2
	dw .metaSection_d3
	dw .metaSection_d4
	dw .metaSection_d5
	dw .metaSection_d6
	dw .metaSection_d7
	dw .metaSection_d8
	dw .metaSection_d9
	dw .metaSection_da
	dw .metaSection_db
	dw .metaSection_dc
	dw .metaSection_dd
	dw .metaSection_de
	dw .metaSection_df

	.metaSection_00:
	SectionFrameDetails Gfx_SceneryBG_100, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_100, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_100, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_100, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_100, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_100, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_100, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_100, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_100, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_100, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_100, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_100, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_100, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_100, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_100, 14, RAILS_STRAIGHT

.metaSection_01:
	SectionFrameDetails Gfx_SceneryBG_100, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_101, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_101, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_101, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_101, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_101, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_101, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_101, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_101, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_101, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_101, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_101, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_101, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_101, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_101, 13, RAILS_STRAIGHT

.metaSection_02:
	SectionFrameDetails Gfx_SceneryBG_101, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_101, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_102, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_102, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_102, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_102, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_102, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_102, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_102, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_102, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_102, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_102, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_102, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_102, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_102, 12, RAILS_STRAIGHT

.metaSection_03:
	SectionFrameDetails Gfx_SceneryBG_102, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_102, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_102, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_103, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_103, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_103, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_103, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_103, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_103, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_103, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_103, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_103, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_103, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_103, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_103, 11, RAILS_STRONG_RIGHT

.metaSection_06:
	SectionFrameDetails Gfx_SceneryBG_103, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_103, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_103, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_103, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_104, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_104, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_104, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_104, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_104, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_104, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_104, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_104, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_104, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_104, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_104, 10, RAILS_STRONG_LEFT

.metaSection_04:
	SectionFrameDetails Gfx_SceneryBG_104, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_104, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_104, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_104, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_104, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_105, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_105, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_105, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_105, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_105, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_105, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_105, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_105, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_105, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_105, 9, RAILS_STRONG_RIGHT

.metaSection_07:
	SectionFrameDetails Gfx_SceneryBG_105, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_105, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_105, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_105, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_105, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_105, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_106, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_106, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_106, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_106, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_106, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_106, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_106, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_106, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_106, 8, RAILS_STRONG_LEFT

.metaSection_05:
	SectionFrameDetails Gfx_SceneryBG_106, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_106, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_106, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_106, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_106, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_106, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_106, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_107, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_107, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_107, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_107, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_107, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_107, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_107, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_107, 7, RAILS_STRONG_RIGHT

.metaSection_08:
	SectionFrameDetails Gfx_SceneryBG_107, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_107, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_107, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_107, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_107, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_107, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_107, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_107, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_108, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_108, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_108, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_108, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_108, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_108, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_108, 6, RAILS_STRONG_LEFT

.metaSection_27:
	SectionFrameDetails Gfx_SceneryBG_11d, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11d, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11d, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11d, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11d, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11d, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11d, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11d, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11d, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11d, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11d, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11d, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11d, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11d, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11d, 15, RAILS_STRAIGHT

.metaSection_28:
	SectionFrameDetails Gfx_SceneryBG_11e, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11e, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11e, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11e, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11e, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11e, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11e, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11e, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11e, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11e, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11e, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11e, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11e, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11e, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11e, 14, RAILS_STRAIGHT

.metaSection_29:
	SectionFrameDetails Gfx_SceneryBG_11e, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11f, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11f, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11f, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11f, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11f, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11f, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11f, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11f, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11f, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11f, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11f, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11f, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11f, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11f, 13, RAILS_STRAIGHT

.metaSection_4e:
	SectionFrameDetails Gfx_SceneryBG_13c, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13d, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13d, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13d, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13d, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13d, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13d, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13d, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13d, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13d, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13d, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13d, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13d, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13d, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13d, 13, RAILS_STRAIGHT

.metaSection_4f:
	SectionFrameDetails Gfx_SceneryBG_13d, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13d, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13e, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13e, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13e, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13e, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13e, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13e, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13e, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13e, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13e, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13e, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13e, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13e, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13e, 12, RAILS_STRAIGHT

.metaSection_50:
	SectionFrameDetails Gfx_SceneryBG_13e, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13e, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13e, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13f, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13f, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13f, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13f, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13f, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13f, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13f, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13f, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13f, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13f, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13f, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13f, 11, RAILS_STRAIGHT

.metaSection_51:
	SectionFrameDetails Gfx_SceneryBG_13f, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_13f, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_13f, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_13f, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_140, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_140, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_140, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_140, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_140, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_140, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_140, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_140, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_140, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_140, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_140, 10, RAILS_STRONG_RIGHT

.metaSection_54:
	SectionFrameDetails Gfx_SceneryBG_140, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_140, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_140, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_140, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_140, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_141, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_141, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_141, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_141, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_141, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_141, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_141, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_141, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_141, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_141, 9, RAILS_STRONG_LEFT

.metaSection_52:
	SectionFrameDetails Gfx_SceneryBG_141, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_141, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_141, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_141, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_141, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_141, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_142, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_142, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_142, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_142, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_142, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_142, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_142, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_142, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_142, 8, RAILS_STRONG_RIGHT

.metaSection_55:
	SectionFrameDetails Gfx_SceneryBG_142, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_142, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_142, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_142, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_142, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_142, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_142, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_143, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_143, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_143, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_143, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_143, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_143, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_143, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_143, 7, RAILS_STRONG_LEFT

.metaSection_53:
	SectionFrameDetails Gfx_SceneryBG_143, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_143, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_143, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_143, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_143, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_143, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_143, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_143, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_144, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_144, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_144, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_144, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_144, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_144, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_144, 6, RAILS_STRONG_RIGHT

.metaSection_56:
	SectionFrameDetails Gfx_SceneryBG_144, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_144, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_144, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_144, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_144, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_144, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_144, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_144, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_144, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_145, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_145, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_145, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_145, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_145, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_145, 5, RAILS_STRONG_LEFT

.metaSection_57:
	SectionFrameDetails Gfx_SceneryBG_145, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_145, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_145, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_145, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_145, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_145, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_145, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_145, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_145, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_145, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_146, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_146, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_146, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_146, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_146, 4, RAILS_STRAIGHT

.metaSection_58:
	SectionFrameDetails Gfx_SceneryBG_146, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_146, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_146, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_146, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_146, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_146, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_146, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_146, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_146, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_146, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_146, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_147, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_147, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_147, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_147, 3, RAILS_STRAIGHT

.metaSection_59:
	SectionFrameDetails Gfx_SceneryBG_147, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_147, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_147, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_147, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_147, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_147, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_147, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_147, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_147, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_147, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_147, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_147, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_148, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_148, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_148, 2, RAILS_STRAIGHT

.metaSection_5a:
	SectionFrameDetails Gfx_SceneryBG_148, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_148, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_148, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_148, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_148, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_148, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_148, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_148, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_148, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_148, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_148, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_148, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_148, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_149, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_149, 1, RAILS_STRONG_RIGHT

.metaSection_5d:
	SectionFrameDetails Gfx_SceneryBG_149, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_149, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_149, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_149, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_149, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_149, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_149, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_149, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_149, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_149, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_149, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_149, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_149, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_149, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14a, 0, RAILS_STRONG_LEFT

.metaSection_5b:
	SectionFrameDetails Gfx_SceneryBG_14a, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14a, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14a, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14a, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14a, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14a, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14a, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14a, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14a, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14a, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14a, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14a, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14a, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14a, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14a, 15, RAILS_STRONG_RIGHT

.metaSection_5e:
	SectionFrameDetails Gfx_SceneryBG_14b, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14b, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14b, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14b, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14b, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14b, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14b, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14b, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14b, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14b, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14b, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14b, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14b, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14b, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14b, 14, RAILS_STRONG_LEFT

.metaSection_5c:
	SectionFrameDetails Gfx_SceneryBG_14b, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14c, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14c, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14c, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14c, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14c, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14c, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14c, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14c, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14c, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14c, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14c, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14c, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14c, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_14c, 13, RAILS_STRONG_RIGHT

.metaSection_5f:
	SectionFrameDetails Gfx_SceneryBG_14c, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14c, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14d, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14d, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14d, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14d, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14d, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14d, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14d, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14d, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14d, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14d, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14d, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14d, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_14d, 12, RAILS_STRONG_LEFT

.metaSection_60:
	SectionFrameDetails Gfx_SceneryBG_14d, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14d, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14d, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14e, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14e, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14e, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14e, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14e, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14e, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14e, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14e, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14e, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14e, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14e, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14e, 11, RAILS_STRAIGHT

.metaSection_61:
	SectionFrameDetails Gfx_SceneryBG_14e, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14e, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14e, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14e, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14f, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14f, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14f, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14f, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14f, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14f, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14f, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14f, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14f, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14f, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14f, 10, RAILS_STRAIGHT

.metaSection_62:
	SectionFrameDetails Gfx_SceneryBG_14f, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14f, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14f, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14f, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_14f, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_150, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_150, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_150, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_150, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_150, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_150, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_150, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_150, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_150, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_150, 9, RAILS_STRAIGHT

.metaSection_63:
	SectionFrameDetails Gfx_SceneryBG_150, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_150, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_150, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_150, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_150, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_150, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_151, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_151, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_151, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_151, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_151, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_151, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_151, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_151, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_151, 8, RAILS_STRONG_RIGHT

.metaSection_66:
	SectionFrameDetails Gfx_SceneryBG_151, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_151, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_151, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_151, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_151, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_151, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_151, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_152, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_152, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_152, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_152, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_152, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_152, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_152, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_152, 7, RAILS_STRONG_LEFT

.metaSection_64:
	SectionFrameDetails Gfx_SceneryBG_152, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_152, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_152, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_152, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_152, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_152, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_152, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_152, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_153, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_153, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_153, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_153, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_153, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_153, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_153, 6, RAILS_STRONG_RIGHT

.metaSection_67:
	SectionFrameDetails Gfx_SceneryBG_153, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_153, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_153, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_153, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_153, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_153, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_153, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_153, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_153, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_154, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_154, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_154, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_154, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_154, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_154, 5, RAILS_STRONG_LEFT

.metaSection_65:
	SectionFrameDetails Gfx_SceneryBG_154, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_154, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_154, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_154, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_154, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_154, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_154, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_154, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_154, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_154, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_155, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_155, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_155, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_155, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_155, 4, RAILS_STRONG_RIGHT

.metaSection_68:
	SectionFrameDetails Gfx_SceneryBG_155, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_155, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_155, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_155, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_155, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_155, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_155, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_155, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_155, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_155, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_155, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_156, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_156, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_156, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_156, 3, RAILS_STRONG_LEFT

.metaSection_69:
	SectionFrameDetails Gfx_SceneryBG_156, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_156, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_156, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_156, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_156, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_156, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_156, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_156, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_156, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_156, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_156, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_156, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 2, RAILS_STRAIGHT

.metaSection_6a:
	SectionFrameDetails Gfx_SceneryBG_157, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 1, RAILS_STRAIGHT

.metaSection_6b:
	SectionFrameDetails Gfx_SceneryBG_157, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_157, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 2, RAILS_STRAIGHT

.metaSection_d7:
.metaSection_1c:
	SectionFrameDetails Gfx_SceneryBG_11a, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11a, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11a, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11a, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11a, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11a, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11a, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11a, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11a, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11a, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11a, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11a, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11b, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11b, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11b, 2, RAILS_STRAIGHT

.metaSection_d8:
.metaSection_1d:
	SectionFrameDetails Gfx_SceneryBG_11b, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11b, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11b, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11b, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11b, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11b, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11b, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11b, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11b, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11b, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11b, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11b, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11b, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11c, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11c, 1, RAILS_STRAIGHT

.metaSection_d9:
.metaSection_1e:
	SectionFrameDetails Gfx_SceneryBG_11c, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11c, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11c, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11c, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11c, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11c, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11c, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11c, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11c, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11c, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11c, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11c, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11c, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11c, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11d, 0, RAILS_STRAIGHT

.metaSection_da:
.metaSection_1f:
	SectionFrameDetails Gfx_SceneryBG_158, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_158, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_159, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_159, 1, RAILS_STRONG_RIGHT

.metaSection_dd:
.metaSection_22:
	SectionFrameDetails Gfx_SceneryBG_159, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_159, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_159, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_159, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_159, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_159, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_159, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_159, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_159, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_159, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_159, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_159, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_159, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_159, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15a, 0, RAILS_STRONG_LEFT

.metaSection_db:
.metaSection_20:
	SectionFrameDetails Gfx_SceneryBG_15a, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15a, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15a, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15a, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15a, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15a, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15a, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15a, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15a, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15a, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15a, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15a, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15a, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15a, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15a, 15, RAILS_STRONG_RIGHT

.metaSection_de:
.metaSection_23:
	SectionFrameDetails Gfx_SceneryBG_15b, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15b, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15b, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15b, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15b, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15b, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15b, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15b, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15b, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15b, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15b, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15b, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15b, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15b, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15b, 14, RAILS_STRONG_LEFT

.metaSection_dc:
.metaSection_21:
	SectionFrameDetails Gfx_SceneryBG_15b, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15c, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15c, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15c, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15c, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15c, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15c, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15c, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15c, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15c, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15c, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15c, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15c, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15c, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_15c, 13, RAILS_STRONG_RIGHT

.metaSection_df:
.metaSection_24:
	SectionFrameDetails Gfx_SceneryBG_15c, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15c, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15d, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15d, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15d, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15d, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15d, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15d, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15d, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15d, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15d, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15d, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15d, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15d, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_15d, 12, RAILS_STRONG_LEFT

.metaSection_71:
	SectionFrameDetails Gfx_SceneryBG_15d, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15d, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15d, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15e, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15e, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15e, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15e, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15e, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15e, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15e, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15e, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15e, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15e, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15e, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15e, 11, RAILS_STRAIGHT

.metaSection_72:
	SectionFrameDetails Gfx_SceneryBG_15e, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15e, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15e, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15e, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15f, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15f, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15f, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15f, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15f, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15f, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15f, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15f, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15f, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15f, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15f, 10, RAILS_STRAIGHT

.metaSection_73:
	SectionFrameDetails Gfx_SceneryBG_15f, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15f, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15f, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15f, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_15f, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_160, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_160, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_160, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_160, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_160, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_160, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_160, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_160, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_160, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_160, 9, RAILS_STRAIGHT

.metaSection_74:
	SectionFrameDetails Gfx_SceneryBG_160, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_160, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_160, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_160, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_160, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_160, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_161, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_161, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_161, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_161, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_161, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_161, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_161, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_161, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_161, 8, RAILS_STRAIGHT

.metaSection_75:
	SectionFrameDetails Gfx_SceneryBG_161, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_161, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_161, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_161, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_161, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_161, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_161, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_162, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_162, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_162, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_162, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_162, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_162, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_162, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_162, 7, RAILS_STRAIGHT

.metaSection_76:
	SectionFrameDetails Gfx_SceneryBG_162, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_162, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_162, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_162, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_162, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_162, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_162, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_162, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_163, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_163, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_163, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_163, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_163, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_163, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_163, 6, RAILS_STRAIGHT

.metaSection_77:
	SectionFrameDetails Gfx_SceneryBG_163, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_163, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_163, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_163, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_163, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_163, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_163, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_163, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_163, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_164, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_164, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_164, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_164, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_164, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_164, 5, RAILS_STRONG_RIGHT

.metaSection_7a:
	SectionFrameDetails Gfx_SceneryBG_164, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_164, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_164, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_164, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_164, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_164, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_164, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_164, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_164, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_164, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_165, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_165, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_165, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_165, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_165, 4, RAILS_STRONG_LEFT

.metaSection_78:
	SectionFrameDetails Gfx_SceneryBG_165, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_165, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_165, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_165, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_165, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_165, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_165, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_165, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_165, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_165, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_165, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_166, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_166, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_166, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_166, 3, RAILS_STRONG_RIGHT

.metaSection_7b:
	SectionFrameDetails Gfx_SceneryBG_166, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_166, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_166, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_166, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_166, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_166, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_166, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_166, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_166, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_166, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_166, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_166, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_167, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_167, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_167, 2, RAILS_STRONG_LEFT

.metaSection_79:
	SectionFrameDetails Gfx_SceneryBG_167, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_167, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_167, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_167, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_167, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_167, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_167, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_167, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_167, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_167, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_167, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_167, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_167, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_168, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_168, 1, RAILS_STRONG_RIGHT

.metaSection_7c:
	SectionFrameDetails Gfx_SceneryBG_168, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_168, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_168, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_168, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_168, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_168, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_168, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_168, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_168, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_168, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_168, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_168, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_168, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_168, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_169, 0, RAILS_STRONG_LEFT

.metaSection_8f:
	SectionFrameDetails Gfx_SceneryBG_169, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_169, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_169, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_169, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_169, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_169, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_169, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_169, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_169, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_169, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_169, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_169, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_169, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_169, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_169, 15, RAILS_STRAIGHT

.metaSection_90:
	SectionFrameDetails Gfx_SceneryBG_16a, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16a, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16a, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16a, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16a, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16a, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16a, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16a, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16a, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16a, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16a, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16a, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16a, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16a, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16a, 14, RAILS_STRAIGHT

.metaSection_92:
	SectionFrameDetails Gfx_SceneryBG_16a, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16b, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16b, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16b, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16b, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16b, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16b, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16b, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16b, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16b, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16b, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16b, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16b, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16b, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16b, 13, RAILS_STRAIGHT

.metaSection_93:
	SectionFrameDetails Gfx_SceneryBG_16b, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16b, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16c, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16c, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16c, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16c, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16c, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16c, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16c, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16c, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16c, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16c, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16c, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16c, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16c, 12, RAILS_STRAIGHT

.metaSection_91:
	SectionFrameDetails Gfx_SceneryBG_16c, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16c, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16c, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16d, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16d, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16d, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16d, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16d, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16d, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16d, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16d, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16d, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16d, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16d, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_16d, 11, RAILS_STRAIGHT

.metaSection_94:
	SectionFrameDetails Gfx_SceneryBG_16d, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16d, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16d, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16d, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16e, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16e, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16e, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16e, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16e, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16e, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16e, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16e, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16e, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16e, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16e, 10, RAILS_STRONG_RIGHT

.metaSection_97:
	SectionFrameDetails Gfx_SceneryBG_16e, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_16e, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_16e, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_16e, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_16e, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_16f, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_16f, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_16f, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_16f, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_16f, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_16f, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_16f, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_16f, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_16f, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_16f, 9, RAILS_STRONG_LEFT

.metaSection_95:
	SectionFrameDetails Gfx_SceneryBG_16f, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16f, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16f, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16f, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16f, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_16f, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_170, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_170, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_170, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_170, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_170, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_170, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_170, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_170, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_170, 8, RAILS_STRONG_RIGHT

.metaSection_98:
	SectionFrameDetails Gfx_SceneryBG_170, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_170, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_170, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_170, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_170, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_170, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_170, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_171, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_171, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_171, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_171, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_171, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_171, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_171, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_171, 7, RAILS_STRONG_LEFT

.metaSection_96:
	SectionFrameDetails Gfx_SceneryBG_171, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_171, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_171, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_171, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_171, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_171, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_171, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_171, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_172, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_172, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_172, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_172, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_172, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_172, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_172, 6, RAILS_STRONG_RIGHT

.metaSection_99:
	SectionFrameDetails Gfx_SceneryBG_172, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_172, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_172, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_172, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_172, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_172, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_172, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_172, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_172, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_173, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_173, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_173, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_173, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_173, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_173, 5, RAILS_STRONG_LEFT

.metaSection_13:
	SectionFrameDetails Gfx_SceneryBG_111, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_111, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_111, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_112, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_112, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_112, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_112, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_112, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_112, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_112, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_112, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_112, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_112, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_112, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_112, 11, RAILS_STRAIGHT

.metaSection_14:
	SectionFrameDetails Gfx_SceneryBG_112, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_112, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_112, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_112, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_113, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_113, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_113, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_113, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_113, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_113, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_113, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_113, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_113, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_113, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_113, 10, RAILS_STRAIGHT

.metaSection_15:
	SectionFrameDetails Gfx_SceneryBG_113, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_113, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_113, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_113, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_113, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_114, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_114, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_114, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_114, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_114, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_114, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_114, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_114, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_114, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_114, 9, RAILS_STRAIGHT

.metaSection_16:
	SectionFrameDetails Gfx_SceneryBG_114, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_114, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_114, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_114, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_114, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_114, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_115, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_115, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_115, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_115, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_115, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_115, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_115, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_115, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_115, 8, RAILS_STRONG_RIGHT

.metaSection_19:
	SectionFrameDetails Gfx_SceneryBG_115, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_115, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_115, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_115, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_115, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_115, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_115, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_116, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_116, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_116, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_116, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_116, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_116, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_116, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_116, 7, RAILS_STRONG_LEFT

.metaSection_17:
	SectionFrameDetails Gfx_SceneryBG_116, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_116, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_116, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_116, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_116, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_116, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_116, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_116, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_117, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_117, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_117, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_117, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_117, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_117, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_117, 6, RAILS_STRONG_RIGHT

.metaSection_1a:
	SectionFrameDetails Gfx_SceneryBG_117, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_117, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_117, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_117, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_117, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_117, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_117, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_117, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_117, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_118, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_118, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_118, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_118, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_118, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_118, 5, RAILS_STRONG_LEFT

.metaSection_18:
	SectionFrameDetails Gfx_SceneryBG_118, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_118, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_118, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_118, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_118, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_118, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_118, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_118, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_118, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_118, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_119, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_119, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_119, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_119, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_119, 4, RAILS_STRONG_RIGHT

.metaSection_1b:
	SectionFrameDetails Gfx_SceneryBG_119, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_119, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_119, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_119, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_119, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_119, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_119, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_119, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_119, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_119, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_119, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_11a, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_11a, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_11a, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_11a, 3, RAILS_STRONG_LEFT

.metaSection_09:
	SectionFrameDetails Gfx_SceneryBG_108, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_108, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_108, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_108, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_108, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_108, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_108, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_108, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_108, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_109, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_109, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_109, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_109, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_109, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_109, 5, RAILS_STRAIGHT

.metaSection_0a:
	SectionFrameDetails Gfx_SceneryBG_109, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_109, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_109, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_109, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_109, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_109, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_109, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_109, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_109, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_109, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10a, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10a, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10a, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10a, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10a, 4, RAILS_STRAIGHT

.metaSection_0b:
	SectionFrameDetails Gfx_SceneryBG_10a, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10a, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10a, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10a, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10a, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10a, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10a, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10a, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10a, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10a, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10a, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10b, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10b, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10b, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10b, 3, RAILS_STRAIGHT

.metaSection_0c:
	SectionFrameDetails Gfx_SceneryBG_10b, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10b, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10b, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10b, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10b, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10b, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10b, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10b, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10b, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10b, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10b, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10b, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10c, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10c, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_10c, 2, RAILS_STRAIGHT

.metaSection_0d:
	SectionFrameDetails Gfx_SceneryBG_10c, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10c, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10c, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10c, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10c, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10c, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10c, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10c, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10c, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10c, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10c, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10c, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10c, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10d, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10d, 1, RAILS_STRONG_RIGHT

.metaSection_10:
	SectionFrameDetails Gfx_SceneryBG_10d, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10d, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10d, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10d, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10d, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10d, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10d, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10d, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10d, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10d, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10d, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10d, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10d, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10d, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10e, 0, RAILS_STRONG_LEFT

.metaSection_0e:
	SectionFrameDetails Gfx_SceneryBG_10e, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10e, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10e, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10e, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10e, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10e, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10e, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10e, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10e, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10e, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10e, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10e, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10e, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10e, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_10e, 15, RAILS_STRONG_RIGHT

.metaSection_11:
	SectionFrameDetails Gfx_SceneryBG_10f, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10f, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10f, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10f, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10f, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10f, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10f, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10f, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10f, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10f, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10f, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10f, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10f, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10f, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_10f, 14, RAILS_STRONG_LEFT

.metaSection_0f:
	SectionFrameDetails Gfx_SceneryBG_10f, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_110, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_110, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_110, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_110, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_110, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_110, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_110, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_110, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_110, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_110, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_110, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_110, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_110, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_110, 13, RAILS_STRONG_RIGHT

.metaSection_12:
	SectionFrameDetails Gfx_SceneryBG_110, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_110, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_111, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_111, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_111, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_111, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_111, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_111, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_111, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_111, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_111, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_111, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_111, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_111, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_111, 12, RAILS_STRONG_LEFT

.metaSection_b2:
	SectionFrameDetails Gfx_SceneryBG_179, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_179, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_179, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_179, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_179, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_179, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_179, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_179, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_179, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_179, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_179, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_179, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_179, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_179, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_179, 14, RAILS_STRAIGHT

.metaSection_b3:
	SectionFrameDetails Gfx_SceneryBG_179, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17a, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17a, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17a, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17a, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17a, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17a, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17a, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17a, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17a, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17a, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17a, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17a, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17a, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17a, 13, RAILS_STRAIGHT

.metaSection_b4:
	SectionFrameDetails Gfx_SceneryBG_17a, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17a, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17b, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17b, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17b, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17b, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17b, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17b, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17b, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17b, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17b, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17b, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17b, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17b, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_17b, 12, RAILS_STRAIGHT

.metaSection_b5:
	SectionFrameDetails Gfx_SceneryBG_17b, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17b, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17b, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17c, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17c, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17c, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17c, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17c, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17c, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17c, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17c, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17c, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17c, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17c, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17c, 11, RAILS_STRONG_RIGHT

.metaSection_b8:
	SectionFrameDetails Gfx_SceneryBG_17c, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17c, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17c, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17c, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17d, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17d, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17d, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17d, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17d, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17d, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17d, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17d, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17d, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17d, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17d, 10, RAILS_STRONG_LEFT

.metaSection_b6:
	SectionFrameDetails Gfx_SceneryBG_17d, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17d, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17d, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17d, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17d, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17e, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17e, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17e, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17e, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17e, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17e, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17e, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17e, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17e, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17e, 9, RAILS_STRONG_RIGHT

.metaSection_b9:
	SectionFrameDetails Gfx_SceneryBG_17e, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17e, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17e, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17e, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17e, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17e, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17f, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17f, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17f, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17f, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17f, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17f, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17f, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17f, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_17f, 8, RAILS_STRONG_LEFT

.metaSection_b7:
	SectionFrameDetails Gfx_SceneryBG_17f, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17f, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17f, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17f, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17f, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17f, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_17f, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_180, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_180, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_180, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_180, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_180, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_180, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_180, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_180, 7, RAILS_STRONG_RIGHT

.metaSection_ba:
	SectionFrameDetails Gfx_SceneryBG_180, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_180, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_180, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_180, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_180, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_180, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_180, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_180, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_181, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_181, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_181, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_181, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_181, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_181, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_181, 6, RAILS_STRONG_LEFT

.metaSection_bb:
	SectionFrameDetails Gfx_SceneryBG_181, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_181, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_181, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_181, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_181, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_181, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_181, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_181, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_181, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_182, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_182, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_182, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_182, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_182, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_182, 5, RAILS_STRAIGHT

.metaSection_bc:
	SectionFrameDetails Gfx_SceneryBG_182, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_182, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_182, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_182, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_182, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_182, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_182, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_182, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_182, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_182, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_183, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_183, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_183, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_183, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_183, 4, RAILS_STRAIGHT

.metaSection_bd:
	SectionFrameDetails Gfx_SceneryBG_183, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_183, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_183, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_183, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_183, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_183, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_183, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_183, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_183, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_183, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_183, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_184, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_184, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_184, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_184, 3, RAILS_STRAIGHT

.metaSection_be:
	SectionFrameDetails Gfx_SceneryBG_184, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_184, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_184, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_184, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_184, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_184, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_184, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_184, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_184, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_184, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_184, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_184, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_185, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_185, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_185, 2, RAILS_STRONG_RIGHT

.metaSection_c1:
	SectionFrameDetails Gfx_SceneryBG_185, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_185, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_185, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_185, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_185, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_185, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_185, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_185, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_185, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_185, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_185, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_185, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_185, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_186, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_186, 1, RAILS_STRONG_LEFT

.metaSection_bf:
	SectionFrameDetails Gfx_SceneryBG_186, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_186, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_186, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_186, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_186, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_186, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_186, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_186, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_186, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_186, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_186, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_186, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_186, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_186, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_187, 0, RAILS_STRONG_RIGHT

.metaSection_c2:
	SectionFrameDetails Gfx_SceneryBG_187, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_187, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_187, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_187, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_187, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_187, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_187, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_187, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_187, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_187, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_187, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_187, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_187, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_187, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_187, 15, RAILS_STRONG_LEFT

.metaSection_c0:
	SectionFrameDetails Gfx_SceneryBG_188, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_188, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_188, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_188, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_188, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_188, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_188, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_188, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_188, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_188, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_188, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_188, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_188, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_188, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_188, 14, RAILS_STRONG_RIGHT

.metaSection_c3:
	SectionFrameDetails Gfx_SceneryBG_188, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_189, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_189, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_189, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_189, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_189, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_189, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_189, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_189, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_189, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_189, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_189, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_189, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_189, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_189, 13, RAILS_STRONG_LEFT

.metaSection_c4:
	SectionFrameDetails Gfx_SceneryBG_189, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_189, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18a, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18a, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18a, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18a, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18a, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18a, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18a, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18a, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18a, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18a, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18a, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18a, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18a, 12, RAILS_STRAIGHT

.metaSection_c5:
	SectionFrameDetails Gfx_SceneryBG_18a, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18a, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18a, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18b, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18b, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18b, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18b, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18b, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18b, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18b, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18b, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18b, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18b, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18b, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18b, 11, RAILS_STRAIGHT

.metaSection_c6:
	SectionFrameDetails Gfx_SceneryBG_18b, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18b, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18b, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18b, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18c, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18c, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18c, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18c, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18c, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18c, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18c, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18c, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18c, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18c, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18c, 10, RAILS_STRAIGHT

.metaSection_c7:
	SectionFrameDetails Gfx_SceneryBG_18c, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18c, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18c, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18c, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18c, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18d, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18d, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18d, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18d, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18d, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18d, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18d, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18d, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18d, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18d, 9, RAILS_STRAIGHT

.metaSection_c8:
	SectionFrameDetails Gfx_SceneryBG_18d, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18d, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18d, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18d, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18d, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18d, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18e, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18e, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18e, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18e, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18e, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18e, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18e, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18e, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18e, 8, RAILS_STRAIGHT

.metaSection_c9:
	SectionFrameDetails Gfx_SceneryBG_18e, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18e, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18e, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18e, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18e, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18e, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18e, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18f, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18f, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18f, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18f, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18f, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18f, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18f, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_18f, 7, RAILS_STRAIGHT

.metaSection_ca:
	SectionFrameDetails Gfx_SceneryBG_18f, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_18f, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_18f, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_18f, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_18f, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_18f, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_18f, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_18f, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_190, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_190, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_190, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_190, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_190, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_190, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_190, 6, RAILS_STRONG_RIGHT

.metaSection_cd:
	SectionFrameDetails Gfx_SceneryBG_190, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_190, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_190, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_190, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_190, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_190, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_190, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_190, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_190, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_191, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_191, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_191, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_191, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_191, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_191, 5, RAILS_STRONG_LEFT

.metaSection_cb:
	SectionFrameDetails Gfx_SceneryBG_191, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_191, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_191, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_191, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_191, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_191, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_191, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_191, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_191, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_191, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_192, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_192, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_192, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_192, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_192, 4, RAILS_STRONG_RIGHT

.metaSection_ce:
	SectionFrameDetails Gfx_SceneryBG_192, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_192, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_192, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_192, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_192, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_192, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_192, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_192, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_192, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_192, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_192, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_193, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_193, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_193, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_193, 3, RAILS_STRONG_LEFT

.metaSection_cc:
	SectionFrameDetails Gfx_SceneryBG_193, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_193, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_193, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_193, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_193, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_193, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_193, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_193, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_193, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_193, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_193, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_193, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_194, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_194, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_194, 2, RAILS_STRONG_RIGHT

.metaSection_cf:
	SectionFrameDetails Gfx_SceneryBG_194, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_194, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_194, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_194, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_194, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_194, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_194, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_194, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_194, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_194, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_194, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_194, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_194, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_195, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_195, 1, RAILS_STRONG_LEFT

.metaSection_9a:
	SectionFrameDetails Gfx_SceneryBG_173, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_173, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_173, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_173, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_173, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_173, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_173, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_173, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_173, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_173, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_174, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_174, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_174, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_174, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_174, 4, RAILS_STRAIGHT

.metaSection_9b:
	SectionFrameDetails Gfx_SceneryBG_174, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_174, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_174, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_174, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_174, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_174, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_174, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_174, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_174, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_174, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_174, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_175, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_175, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_175, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_175, 3, RAILS_STRAIGHT

.metaSection_9c:
	SectionFrameDetails Gfx_SceneryBG_175, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_175, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_175, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_175, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_175, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_175, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_175, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_175, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_175, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_175, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_175, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_175, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_176, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_176, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_176, 2, RAILS_STRAIGHT

.metaSection_9d:
	SectionFrameDetails Gfx_SceneryBG_176, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_176, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_176, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_176, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_176, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_176, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_176, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_176, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_176, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_176, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_176, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_176, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_176, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_177, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_177, 1, RAILS_STRAIGHT

.metaSection_9e:
	SectionFrameDetails Gfx_SceneryBG_177, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_177, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_177, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_177, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_177, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_177, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_177, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_177, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_177, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_177, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_177, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_177, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_177, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_177, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_178, 0, RAILS_STRAIGHT

.metaSection_9f:
	SectionFrameDetails Gfx_SceneryBG_178, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_178, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_178, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_178, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_178, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_178, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_178, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_178, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_178, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_178, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_178, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_178, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_178, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_178, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_178, 15, RAILS_STRAIGHT

.metaSection_d0:
	SectionFrameDetails Gfx_SceneryBG_195, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_195, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_195, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_195, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_195, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_195, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_195, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_195, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_195, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_195, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_195, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_195, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_195, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_195, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_196, 0, RAILS_STRAIGHT

.metaSection_d1:
	SectionFrameDetails Gfx_SceneryBG_196, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_196, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_196, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_196, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_196, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_196, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_196, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_196, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_196, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_196, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_196, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_196, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_196, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_196, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_196, 15, RAILS_STRAIGHT

.metaSection_d2:
	SectionFrameDetails Gfx_SceneryBG_197, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_197, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_197, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_197, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_197, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_197, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_197, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_197, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_197, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_197, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_197, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_197, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_197, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_197, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_197, 14, RAILS_STRAIGHT

.metaSection_2a:
	SectionFrameDetails Gfx_SceneryBG_11f, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_11f, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_120, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_120, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_120, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_120, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_120, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_120, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_120, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_120, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_120, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_120, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_120, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_120, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_120, 12, RAILS_STRAIGHT

.metaSection_2b:
	SectionFrameDetails Gfx_SceneryBG_120, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_120, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_120, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_121, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_121, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_121, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_121, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_121, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_121, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_121, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_121, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_121, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_121, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_121, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_121, 11, RAILS_STRAIGHT

.metaSection_2c:
	SectionFrameDetails Gfx_SceneryBG_121, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_121, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_121, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_121, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_122, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_122, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_122, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_122, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_122, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_122, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_122, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_122, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_122, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_122, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_122, 10, RAILS_STRAIGHT

.metaSection_2d:
	SectionFrameDetails Gfx_SceneryBG_122, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_122, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_122, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_122, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_122, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_123, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_123, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_123, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_123, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_123, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_123, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_123, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_123, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_123, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_123, 9, RAILS_STRAIGHT

.metaSection_2e:
	SectionFrameDetails Gfx_SceneryBG_123, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_123, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_123, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_123, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_123, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_123, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_124, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_124, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_124, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_124, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_124, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_124, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_124, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_124, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_124, 8, RAILS_STRAIGHT

.metaSection_2f:
	SectionFrameDetails Gfx_SceneryBG_124, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_124, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_124, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_124, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_124, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_124, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_124, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_125, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_125, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_125, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_125, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_125, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_125, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_125, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_125, 7, RAILS_STRAIGHT

.metaSection_30:
	SectionFrameDetails Gfx_SceneryBG_125, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_125, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_125, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_125, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_125, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_125, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_125, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_125, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_126, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_126, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_126, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_126, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_126, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_126, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_126, 6, RAILS_STRAIGHT

.metaSection_31:
	SectionFrameDetails Gfx_SceneryBG_126, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_126, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_126, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_126, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_126, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_126, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_126, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_126, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_126, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_127, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_127, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_127, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_127, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_127, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_127, 5, RAILS_STRAIGHT

.metaSection_32:
	SectionFrameDetails Gfx_SceneryBG_127, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_127, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_127, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_127, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_127, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_127, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_127, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_127, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_127, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_127, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_128, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_128, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_128, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_128, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_128, 4, RAILS_STRAIGHT

.metaSection_33:
	SectionFrameDetails Gfx_SceneryBG_128, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_128, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_128, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_128, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_128, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_128, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_128, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_128, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_128, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_128, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_128, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_129, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_129, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_129, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_129, 3, RAILS_STRAIGHT

.metaSection_34:
	SectionFrameDetails Gfx_SceneryBG_129, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_129, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_129, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_129, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_129, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_129, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_129, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_129, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_129, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_129, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_129, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_129, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12a, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12a, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12a, 2, RAILS_STRAIGHT

.metaSection_35:
	SectionFrameDetails Gfx_SceneryBG_12a, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12a, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12a, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12a, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12a, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12a, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12a, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12a, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12a, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12a, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12a, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12a, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12a, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12b, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12b, 1, RAILS_STRAIGHT

.metaSection_36:
	SectionFrameDetails Gfx_SceneryBG_12b, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12b, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12b, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12b, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12b, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12b, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12b, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12b, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12b, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12b, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12b, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12b, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12b, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12b, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12c, 0, RAILS_STRAIGHT

.metaSection_37:
	SectionFrameDetails Gfx_SceneryBG_12c, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12c, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12c, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12c, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12c, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12c, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12c, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12c, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12c, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12c, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12c, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12c, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12c, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12c, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12c, 15, RAILS_STRAIGHT

.metaSection_38:
	SectionFrameDetails Gfx_SceneryBG_12d, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12d, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12d, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12d, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12d, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12d, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12d, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12d, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12d, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12d, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12d, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12d, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12d, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12d, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12d, 14, RAILS_STRAIGHT

.metaSection_39:
	SectionFrameDetails Gfx_SceneryBG_12d, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12e, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12e, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12e, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12e, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12e, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12e, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12e, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12e, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12e, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12e, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12e, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12e, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12e, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12e, 13, RAILS_STRAIGHT

.metaSection_3a:
	SectionFrameDetails Gfx_SceneryBG_12e, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12e, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12f, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12f, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12f, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12f, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12f, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12f, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12f, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12f, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12f, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12f, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12f, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12f, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12f, 12, RAILS_STRAIGHT

.metaSection_3b:
	SectionFrameDetails Gfx_SceneryBG_12f, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12f, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_12f, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_130, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_130, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_130, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_130, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_130, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_130, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_130, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_130, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_130, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_130, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_130, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_130, 11, RAILS_STRAIGHT

.metaSection_3d:
	SectionFrameDetails Gfx_SceneryBG_130, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_130, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_130, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_130, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_131, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_131, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_131, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_131, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_131, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_131, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_131, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_131, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_131, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_131, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_131, 10, RAILS_STRAIGHT

.metaSection_3e:
	SectionFrameDetails Gfx_SceneryBG_197, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_198, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_198, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_198, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_198, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_198, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_198, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_198, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_198, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_198, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_198, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_198, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_198, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_198, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_198, 13, RAILS_STRAIGHT

.metaSection_3c:
	SectionFrameDetails Gfx_SceneryBG_131, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_131, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_131, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_131, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_131, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_132, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_132, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_132, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_132, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_132, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_132, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_132, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_132, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_132, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_132, 9, RAILS_STRAIGHT

.metaSection_3f:
	SectionFrameDetails Gfx_SceneryBG_132, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_132, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_132, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_132, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_132, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_132, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_133, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_133, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_133, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_133, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_133, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_133, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_133, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_133, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_133, 8, RAILS_STRAIGHT

.metaSection_40:
	SectionFrameDetails Gfx_SceneryBG_133, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_133, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_133, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_133, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_133, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_133, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_133, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_134, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_134, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_134, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_134, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_134, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_134, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_134, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_134, 7, RAILS_STRAIGHT

.metaSection_41:
	SectionFrameDetails Gfx_SceneryBG_134, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_134, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_134, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_134, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_134, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_134, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_134, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_134, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_135, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_135, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_135, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_135, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_135, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_135, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_135, 6, RAILS_STRAIGHT

.metaSection_42:
	SectionFrameDetails Gfx_SceneryBG_135, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_135, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_135, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_135, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_135, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_135, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_135, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_135, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_135, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_136, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_136, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_136, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_136, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_136, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_136, 5, RAILS_STRAIGHT

.metaSection_43:
	SectionFrameDetails Gfx_SceneryBG_136, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_136, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_136, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_136, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_136, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_136, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_136, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_136, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_136, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_136, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_137, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_137, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_137, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_137, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_137, 4, RAILS_STRAIGHT

.metaSection_44:
	SectionFrameDetails Gfx_SceneryBG_137, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_137, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_137, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_137, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_137, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_137, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_137, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_137, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_137, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_137, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_137, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_138, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_138, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_138, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_138, 3, RAILS_STRAIGHT

.metaSection_45:
	SectionFrameDetails Gfx_SceneryBG_138, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_138, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_138, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_138, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_138, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_138, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_138, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_138, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_138, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_138, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_138, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_138, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_139, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_139, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_139, 2, RAILS_STRAIGHT

.metaSection_46:
	SectionFrameDetails Gfx_SceneryBG_139, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_139, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_139, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_139, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_139, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_139, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_139, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_139, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_139, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_139, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_139, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_139, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_139, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13a, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13a, 1, RAILS_STRAIGHT

.metaSection_47:
	SectionFrameDetails Gfx_SceneryBG_13a, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13a, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13a, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13a, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13a, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13a, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13a, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13a, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13a, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13a, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13a, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13a, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13a, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13a, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13b, 0, RAILS_STRAIGHT

.metaSection_48:
	SectionFrameDetails Gfx_SceneryBG_13b, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13b, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13b, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13b, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13b, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13b, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13b, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13b, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13b, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13b, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13b, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13b, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13b, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13b, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13b, 15, RAILS_STRAIGHT

.metaSection_49:
	SectionFrameDetails Gfx_SceneryBG_13c, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13c, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13c, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13c, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13c, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13c, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13c, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13c, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13c, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13c, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13c, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13c, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13c, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13c, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_13c, 14, RAILS_STRAIGHT

.metaSection_7d:
	SectionFrameDetails Gfx_SceneryBG_198, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_198, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_199, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_199, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_199, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_199, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_199, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_199, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_199, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_199, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_199, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_199, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_199, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_199, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_199, 12, RAILS_STRAIGHT

.metaSection_7e:
	SectionFrameDetails Gfx_SceneryBG_199, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_199, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_199, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19a, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19a, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19a, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19a, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19a, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19a, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19a, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19a, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19a, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19a, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19a, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19a, 11, RAILS_STRAIGHT

.metaSection_7f:
	SectionFrameDetails Gfx_SceneryBG_19a, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19a, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19a, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19a, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19b, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19b, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19b, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19b, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19b, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19b, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19b, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19b, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19b, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19b, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_19b, 10, RAILS_STRAIGHT

.metaSection_80:
	SectionFrameDetails Gfx_SceneryBG_19b, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19b, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19b, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19b, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19b, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19c, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19c, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19c, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19c, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19c, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19c, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19c, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19c, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19c, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19c, 9, RAILS_STRONG_RIGHT

.metaSection_83:
	SectionFrameDetails Gfx_SceneryBG_19c, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19c, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19c, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19c, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19c, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19c, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19d, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19d, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19d, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19d, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19d, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19d, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19d, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19d, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19d, 8, RAILS_STRONG_LEFT

.metaSection_81:
	SectionFrameDetails Gfx_SceneryBG_19d, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19d, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19d, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19d, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19d, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19d, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19d, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19e, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19e, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19e, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19e, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19e, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19e, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19e, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19e, 7, RAILS_STRONG_RIGHT

.metaSection_84:
	SectionFrameDetails Gfx_SceneryBG_19e, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19e, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19e, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19e, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19e, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19e, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19e, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19e, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19f, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19f, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19f, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19f, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19f, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19f, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_19f, 6, RAILS_STRONG_LEFT

.metaSection_82:
	SectionFrameDetails Gfx_SceneryBG_19f, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19f, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19f, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19f, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19f, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19f, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19f, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19f, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_19f, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1a0, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1a0, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1a0, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1a0, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1a0, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1a0, 5, RAILS_STRONG_RIGHT

.metaSection_85:
	SectionFrameDetails Gfx_SceneryBG_1a0, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1a0, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1a0, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1a0, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1a0, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1a0, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1a0, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1a0, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1a0, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1a0, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1a1, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1a1, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1a1, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1a1, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1a1, 4, RAILS_STRONG_LEFT

.metaSection_86:
	SectionFrameDetails Gfx_SceneryBG_1a6, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a7, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a7, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a7, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a7, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a7, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a7, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a7, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a7, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a7, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a7, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a7, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a7, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a7, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a7, 13, RAILS_STRAIGHT

.metaSection_87:
	SectionFrameDetails Gfx_SceneryBG_1a7, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a7, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a8, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a8, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a8, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a8, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a8, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a8, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a8, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a8, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a8, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a8, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a8, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a8, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a8, 12, RAILS_STRAIGHT

.metaSection_88:
	SectionFrameDetails Gfx_SceneryBG_1a8, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a8, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a8, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a9, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a9, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a9, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a9, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a9, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a9, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a9, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a9, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a9, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a9, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a9, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a9, 11, RAILS_STRAIGHT

.metaSection_89:
	SectionFrameDetails Gfx_SceneryBG_1a9, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1a9, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1a9, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1a9, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1aa, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1aa, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1aa, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1aa, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1aa, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1aa, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1aa, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1aa, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1aa, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1aa, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1aa, 10, RAILS_STRONG_RIGHT

.metaSection_8c:
	SectionFrameDetails Gfx_SceneryBG_1aa, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1aa, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1aa, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1aa, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1aa, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ab, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ab, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ab, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ab, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ab, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ab, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ab, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ab, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ab, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ab, 9, RAILS_STRONG_LEFT

.metaSection_8a:
	SectionFrameDetails Gfx_SceneryBG_1ab, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ab, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ab, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ab, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ab, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ab, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ac, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ac, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ac, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ac, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ac, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ac, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ac, 6, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ac, 7, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ac, 8, RAILS_STRONG_RIGHT

.metaSection_8d:
	SectionFrameDetails Gfx_SceneryBG_1ac, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ac, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ac, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ac, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ac, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ac, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ac, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ad, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ad, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ad, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ad, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ad, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ad, 5, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ad, 6, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ad, 7, RAILS_STRONG_LEFT

.metaSection_8b:
	SectionFrameDetails Gfx_SceneryBG_1ad, 8, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ad, 9, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ad, 10, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ad, 11, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ad, 12, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ad, 13, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ad, 14, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ad, 15, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ae, 0, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ae, 1, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ae, 2, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ae, 3, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ae, 4, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ae, 5, RAILS_STRONG_RIGHT
	SectionFrameDetails Gfx_SceneryBG_1ae, 6, RAILS_STRONG_RIGHT

.metaSection_8e:
	SectionFrameDetails Gfx_SceneryBG_1ae, 7, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ae, 8, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ae, 9, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ae, 10, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ae, 11, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ae, 12, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ae, 13, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ae, 14, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1ae, 15, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1af, 0, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1af, 1, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1af, 2, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1af, 3, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1af, 4, RAILS_STRONG_LEFT
	SectionFrameDetails Gfx_SceneryBG_1af, 5, RAILS_STRONG_LEFT

.metaSection_4a:
	SectionFrameDetails Gfx_SceneryBG_1a1, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a1, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a1, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a1, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a1, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a1, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a1, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a1, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a1, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a1, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a1, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a2, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a2, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a2, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a2, 3, RAILS_STRAIGHT

.metaSection_4b:
	SectionFrameDetails Gfx_SceneryBG_1a2, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a2, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a2, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a2, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a2, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a2, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a2, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a2, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a2, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a2, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a2, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a2, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a3, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a3, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a3, 2, RAILS_STRAIGHT

.metaSection_4c:
	SectionFrameDetails Gfx_SceneryBG_1b6, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b6, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b6, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b6, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b6, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b6, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b6, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b6, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b6, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b6, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b7, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b7, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b7, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b7, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b7, 4, RAILS_STRAIGHT

.metaSection_4d:
	SectionFrameDetails Gfx_SceneryBG_1b7, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b7, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b7, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b7, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b7, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b7, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b7, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b7, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b7, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b7, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b7, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b8, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b8, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b8, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b8, 3, RAILS_STRAIGHT

.metaSection_6c:
	SectionFrameDetails Gfx_SceneryBG_1a3, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a3, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a3, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a3, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a3, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a3, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a3, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a3, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a3, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a3, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a3, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a3, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a3, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a4, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a4, 1, RAILS_STRAIGHT

.metaSection_6d:
	SectionFrameDetails Gfx_SceneryBG_1b8, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b8, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b8, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b8, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b8, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b8, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b8, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b8, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b8, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b8, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b8, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b8, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b9, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b9, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b9, 2, RAILS_STRAIGHT

.metaSection_6e:
	SectionFrameDetails Gfx_SceneryBG_1a4, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a4, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a4, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a4, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a4, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a4, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a4, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a4, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a4, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a4, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a4, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a4, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a4, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a4, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a5, 0, RAILS_STRAIGHT

.metaSection_a3:
.metaSection_a0:
	SectionFrameDetails Gfx_SceneryBG_1b1, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b1, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b1, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b1, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b1, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b1, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b1, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b1, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b1, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b1, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b1, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b1, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b2, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b2, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b2, 2, RAILS_STRAIGHT

.metaSection_a4:
.metaSection_a1:
	SectionFrameDetails Gfx_SceneryBG_1b2, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b2, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b2, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b2, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b2, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b2, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b2, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b2, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b2, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b2, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b2, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b2, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b2, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 1, RAILS_STRAIGHT

.metaSection_a5:
.metaSection_a2:
	SectionFrameDetails Gfx_SceneryBG_1b3, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 12, RAILS_STRAIGHT

.metaSection_a9:
.metaSection_a6:
	SectionFrameDetails Gfx_SceneryBG_1b3, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b3, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b4, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b4, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b4, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b4, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b4, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b4, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b4, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b4, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b4, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b4, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b4, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b4, 11, RAILS_STRAIGHT

.metaSection_aa:
.metaSection_a7:
	SectionFrameDetails Gfx_SceneryBG_1b4, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b4, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b4, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b4, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b5, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b5, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b5, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b5, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b5, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b5, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b5, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b5, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b5, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b5, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b5, 10, RAILS_STRAIGHT

.metaSection_ab:
.metaSection_a8:
	SectionFrameDetails Gfx_SceneryBG_1b5, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b5, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b5, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b5, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b5, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b6, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b6, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b6, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b6, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b6, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b6, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e2, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e2, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e2, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e2, 3, RAILS_STRAIGHT

.metaSection_af:
.metaSection_ac:
	SectionFrameDetails Gfx_SceneryBG_1db, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1db, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1db, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1db, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1db, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1db, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1db, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1db, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1db, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1db, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1db, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1db, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1db, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1db, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1db, 14, RAILS_STRAIGHT

.metaSection_b0:
.metaSection_ad:
	SectionFrameDetails Gfx_SceneryBG_1db, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dc, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dc, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dc, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dc, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dc, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dc, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dc, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dc, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dc, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dc, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dc, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dc, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dc, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dc, 13, RAILS_STRAIGHT

.metaSection_b1:
.metaSection_ae:
	SectionFrameDetails Gfx_SceneryBG_1dc, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dc, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dd, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dd, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dd, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dd, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dd, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dd, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dd, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dd, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dd, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dd, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dd, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dd, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dd, 12, RAILS_STRAIGHT

.metaSection_d3:
	SectionFrameDetails Gfx_SceneryBG_1dd, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dd, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1dd, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1de, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1de, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1de, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1de, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1de, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1de, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1de, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1de, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1de, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1de, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1de, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1de, 11, RAILS_STRAIGHT

.metaSection_d4:
	SectionFrameDetails Gfx_SceneryBG_1de, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1de, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1de, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1de, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1df, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1df, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1df, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1df, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1df, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1df, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1df, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1df, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1df, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1df, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1df, 10, RAILS_STRAIGHT

.metaSection_d5:
	SectionFrameDetails Gfx_SceneryBG_1df, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1df, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1df, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1df, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1df, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e0, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e0, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e0, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e0, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e0, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e0, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e0, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e0, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e0, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e0, 9, RAILS_STRAIGHT

.metaSection_d6:
	SectionFrameDetails Gfx_SceneryBG_1e0, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e0, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e0, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e0, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e0, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e0, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e1, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e1, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e1, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e1, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e1, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e1, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e1, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e1, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1e1, 8, RAILS_STRAIGHT

.metaSection_25:
	SectionFrameDetails Gfx_SceneryBG_1a5, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a5, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a5, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a5, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a5, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a5, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a5, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a5, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a5, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a5, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a5, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a5, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a5, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a5, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a5, 15, RAILS_STRAIGHT

.metaSection_26:
	SectionFrameDetails Gfx_SceneryBG_1a6, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a6, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a6, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a6, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a6, 4, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a6, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a6, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a6, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a6, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a6, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a6, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a6, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a6, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a6, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1a6, 14, RAILS_STRAIGHT

.metaSection_6f:
	SectionFrameDetails Gfx_SceneryBG_1af, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1af, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1af, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1af, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1af, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1af, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1af, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1af, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1af, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1af, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b0, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b0, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b0, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b0, 3, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b0, 4, RAILS_STRAIGHT

.metaSection_70:
	SectionFrameDetails Gfx_SceneryBG_1b0, 5, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b0, 6, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b0, 7, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b0, 8, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b0, 9, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b0, 10, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b0, 11, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b0, 12, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b0, 13, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b0, 14, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b0, 15, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b1, 0, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b1, 1, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b1, 2, RAILS_STRAIGHT
	SectionFrameDetails Gfx_SceneryBG_1b1, 3, RAILS_STRAIGHT


GameState2a_PrintStartMain_def::
; Return if serial interrupt disabled
	ld   a, [wSerialIntHandlerEnabled]                              ; $7208
	and  a                                                          ; $720b
	jr   z, .done                                                   ; $720c

; Jump based on substate
	ld   a, [wPrintGameStateSubState]                               ; $720e
	rst  JumpTablePreserveDE                                        ; $7211
	dw PrintStartSubstate0
	dw PrintStartSubstate1
	dw PrintStartSubstate2
	dw PrintStartSubstate3
	dw PrintStartSubstate4
	dw PrintStartSubstate5
	dw PrintStartSubstate6
	dw PrintStartSubstate7

.done:
	ret                                                             ; $7222


PrintingProcessDone:
	call ResetPrintingState                                         ; $7223
	ret                                                             ; $7226


PrintStartSubstate0:
; Set base print command params
	ld   a, $13                                                     ; $7227
	ld   [wPrinterPrintCommandMargins], a                           ; $7229
	ld   a, $01                                                     ; $722c
	ld   [wPrinterPrintCommandNumSheets], a                         ; $722e
	ld   a, %11100100                                               ; $7231
	ld   [wPrinterPrintPalette], a                                  ; $7233

; Go to next state
	ld   hl, wPrintGameStateSubState                                ; $7236
	inc  [hl]                                                       ; $7239
	ret                                                             ; $723a


PrintStartSubstate1:
; Clear an unused var
	xor  a                                                          ; $723b
	ld   [wPrintUnusedVar_ce52], a                                  ; $723c

; To substate 2
	ld   hl, wPrintGameStateSubState                                ; $723f
	inc  [hl]                                                       ; $7242
	ret                                                             ; $7243


PrintStartSubstate2:
; Send init packet if not done, ret early if in-progress, or end process if errored
	call StartInitPacketTransferProcess                             ; $7244
	cp   PRINT_MARKER_IN_PROGRESS                                   ; $7247
	jr   z, .done                                                   ; $7249

	cp   PRINT_MARKER_ERRORED                                       ; $724b
	jr   z, .endProcess                                             ; $724d

; Go to substate 3 after some time
	ld   a, [wPrintGameStateSubState]                               ; $724f
	inc  a                                                          ; $7252
	ld   [wNextPrintGameStateSubState], a                           ; $7253
	xor  a                                                          ; $7256
	ld   [wWaitCounterBeforeExitingPrinterSubState7], a             ; $7257
	ld   a, PRINT_SS_TRANSITIONING                                  ; $725a
	ld   [wPrintGameStateSubState], a                               ; $725c

.done:
	ret                                                             ; $725f

.endProcess:
	jp   PrintingProcessDone                                        ; $7260


; unused
	ret                                                             ; $7263


PrintStartSubstate3:
; End early if no printer detected
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $7264
	cp   SB_NO_PRINTER                                              ; $7267
	jp   z, PrintingProcessDone                                     ; $7269

; Continue if we've not started the transfer process
	ld   a, [wPrinterPacketTransferProcessInProgress]               ; $726c
	and  a                                                          ; $726f
	jr   z, .cont                                                   ; $7270

; Continue if we're done, or we're still sending the data command
	ld   a, [wImagePrintingFlowStateIdx]                            ; $7272
	cp   $03                                                        ; $7275
	jr   z, .cont                                                   ; $7277

	cp   $01                                                        ; $7279
	jr   z, .cont                                                   ; $727b

	jp   PrintingProcessDone                                        ; $727d

.cont:
; Load fragment into ram, HL contains the ram address
	call LoadPrinterTileDataFragmentIntoRam                         ; $7280

; Jump if our pre-inc'd index is the num fragments-1 we need to load
	ld   a, [wPrinterNumTileDataFragmentsForCurrImage]              ; $7283
	ld   b, a                                                       ; $7286
	ld   a, [wPrinterCurrTileDataFragmentIdxToLoad]                 ; $7287
	cp   b                                                          ; $728a
	jr   z, .imageLoaded                                            ; $728b

; By default, set that we've loaded all data
	xor  a                                                          ; $728d
	ld   [wPrinterTileDataAllLoaded], a                             ; $728e

; Start data transfer process, ending if errored, returning if in progress
	ld   a, $01                                                     ; $7291
	call StartDataFragmentPacketTransferProcess                     ; $7293
	cp   PRINT_MARKER_ERRORED                                       ; $7296
	jp   z, PrintingProcessDone                                     ; $7298

	cp   PRINT_MARKER_IN_PROGRESS                                   ; $729b
	ret  z                                                          ; $729d

; Redo current substate, loading more data
	ld   a, $01                                                     ; $729e
	ld   [wWaitCounterBeforeExitingPrinterSubState7], a             ; $72a0
	ld   a, PRINT_SS_TRANSITIONING                                  ; $72a3
	ld   [wPrintGameStateSubState], a                               ; $72a5
	ld   a, PRINT_SS_LOAD_TILE_DATA                                 ; $72a8
	ld   [wNextPrintGameStateSubState], a                           ; $72aa

; Inc the fragment idx to load next
	ld   a, [wPrinterCurrTileDataFragmentIdxToLoad]                 ; $72ad
	inc  a                                                          ; $72b0
	ld   [wPrinterCurrTileDataFragmentIdxToLoad], a                 ; $72b1
	ret                                                             ; $72b4

.imageLoaded:
; Now set that we've loaded all data
	ld   a, $01                                                     ; $72b5
	ld   [wPrinterTileDataAllLoaded], a                             ; $72b7

; Handle last fragment, finishing if errored, returning if in-progress
	ld   a, $01                                                     ; $72ba
	call StartDataFragmentPacketTransferProcess                     ; $72bc
	cp   PRINT_MARKER_ERRORED                                       ; $72bf
	jp   z, PrintingProcessDone                                     ; $72c1

	cp   PRINT_MARKER_IN_PROGRESS                                   ; $72c4
	ret  z                                                          ; $72c6

; Go to next substate
	ld   a, $01                                                     ; $72c7
	ld   [wWaitCounterBeforeExitingPrinterSubState7], a             ; $72c9
	ld   a, PRINT_SS_TRANSITIONING                                  ; $72cc
	ld   [wPrintGameStateSubState], a                               ; $72ce
	ld   a, PRINT_SS_PRINTING                                       ; $72d1
	ld   [wNextPrintGameStateSubState], a                           ; $72d3
	ret                                                             ; $72d6


PrintStartSubstate4:
; Return early if no printer detected
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $72d7
	cp   SB_NO_PRINTER                                              ; $72da
	jp   z, PrintingProcessDone                                     ; $72dc

; Continue if we haven't started the transfer process
	ld   a, [wPrinterPacketTransferProcessInProgress]               ; $72df
	and  a                                                          ; $72e2
	jr   z, .cont                                                   ; $72e3

; Jump if print command
	ld   a, [wImagePrintingFlowStateIdx]                            ; $72e5
	cp   $02                                                        ; $72e8
	jr   z, .cont                                                   ; $72ea

; Jump if transfer finished
	cp   $01                                                        ; $72ec
	jr   z, .cont                                                   ; $72ee

	jr   .done                                                      ; $72f0

.cont:
; Return if we're still printing
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $72f2
	bit  P_PRINTING, a                                              ; $72f5
	jr   nz, .done                                                  ; $72f7

; We're not printing, start print command, end if error'd
	call StartPrintPacketTransferProcess                            ; $72f9
	cp   PRINT_MARKER_ERRORED                                       ; $72fc
	jp   z, PrintingProcessDone                                     ; $72fe

; End if in progress
	cp   PRINT_MARKER_IN_PROGRESS                                   ; $7301
	ret  z                                                          ; $7303

; Otherwise it's starting, set counter..
	ld   a, $03                                                     ; $7304
	ld   [wPrinterPrintCommandWaitCounter], a                       ; $7306

; And go to next substate
	xor  a                                                          ; $7309
	ld   [wWaitCounterBeforeExitingPrinterSubState7], a             ; $730a
	ld   a, PRINT_SS_TRANSITIONING                                  ; $730d
	ld   [wPrintGameStateSubState], a                               ; $730f
	ld   a, PRINT_SS_WAIT_UNTIL_DONE                                ; $7312
	ld   [wNextPrintGameStateSubState], a                           ; $7314

.done:
	ret                                                             ; $7317


PrintStartSubstate5:
; We're done if printer is not detected..
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $7318
	cp   SB_NO_PRINTER                                              ; $731b
	jp   z, PrintingProcessDone                                     ; $731d

	bit  P_UNPROCESSED_DATA, a                                      ; $7320
	jp   nz, .done                                                  ; $7322

	bit  P_PRINTING, a                                              ; $7325
	jp   nz, .done                                                  ; $7327

; Or printing has finished
	xor  a                                                          ; $732a
	ld   [wPrintGameStateSubState], a                               ; $732b

	xor  a                                                          ; $732e
	ld   [wImagePrintingFlowStateIdx], a                            ; $732f
	jp   PrintingProcessDone                                        ; $7332

.done:
	ret                                                             ; $7335


; Entered when pressing B during process
PrintStartSubstate6:
; End early if no printer
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $7336
	cp   SB_NO_PRINTER                                              ; $7339
	jp   z, PrintingProcessDone                                     ; $733b

; Continue if transfer not yet started
	ld   a, [wPrinterPacketTransferProcessInProgress]               ; $733e
	and  a                                                          ; $7341
	jr   z, .cont                                                   ; $7342

; Continue if we were sending an empty data packet
	ld   a, [wImagePrintingFlowStateIdx]                            ; $7344
	cp   $03                                                        ; $7347
	jr   z, .cont                                                   ; $7349

; Otherwise end early
	cp   $01                                                        ; $734b
	jp   PrintingProcessDone                                        ; $734d

; unused
	ret                                                             ; $7350

.cont:
	call StartUnknownPacketTransferProcess                          ; $7351

; Transition to substate 5 after some time
	xor  a                                                          ; $7354
	ld   [wWaitCounterBeforeExitingPrinterSubState7], a             ; $7355
	ld   a, PRINT_SS_TRANSITIONING                                  ; $7358
	ld   [wPrintGameStateSubState], a                               ; $735a
	ld   a, PRINT_SS_WAIT_UNTIL_DONE                                ; $735d
	ld   [wNextPrintGameStateSubState], a                           ; $735f
	ret                                                             ; $7362


PrintStartSubstate7:
; Once counter hits 6+..
	ld   hl, wWaitCounterBeforeExitingPrinterSubState7              ; $7363
	inc  [hl]                                                       ; $7366
	ld   a, [hl]                                                    ; $7367
	cp   $06                                                        ; $7368
	jr   c, .done                                                   ; $736a

; Clear it again and set next substate
	xor  a                                                          ; $736c
	ld   [hl], a                                                    ; $736d
	ld   a, [wNextPrintGameStateSubState]                           ; $736e
	ld   [wPrintGameStateSubState], a                               ; $7371

.done:
	ret                                                             ; $7374


PrintTrainImageScript::
; Load tile data
	SCR_Delay $1e
	SCR_ExecAsmBelow
	ld   a, $00                                                     ; $7378
	ldh  [rVBK], a                                                  ; $737a
	ld   b, BANK(Gfx_PrintTrainImage)                               ; $737c
	ld   hl, Gfx_PrintTrainImage                                    ; $737e
	call HDMATransferAllTileDataWhileInVBlankProcessingSnd          ; $7381

; Load tile map
	ld   de, _SCRN0                                                 ; $7384
	ld   a, $00                                                     ; $7387
	ldh  [rVBK], a                                                  ; $7389
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $738b
	ld   hl, TileMap_PrintTrainImage                                ; $738e
	ld   a, BANK(TileMap_PrintTrainImage)                           ; $7391
	call FarRectCopyRowPerFrame                                     ; $7393

; Load tile attr
	ld   de, _SCRN0                                                 ; $7396
	ld   a, $01                                                     ; $7399
	ldh  [rVBK], a                                                  ; $739b
	ldbc SCREEN_TILE_HEIGHT, SCREEN_TILE_WIDTH                      ; $739d
	ld   a, BANK(TileAttr_PrintTrainImage)                          ; $73a0
	call FarRectCopyRowPerFrame                                     ; $73a2

; Load BG palettes - to fade in from black
	ld   b, BANK(Palettes_PrintTrainImage)                          ; $73a5
	ld   hl, Palettes_PrintTrainImage                               ; $73a7
	call SetBGPaletteSrc                                            ; $73aa
	ld   a, $20                                                     ; $73ad
	ld   [wPaletteFadeAmount], a                                    ; $73af
	ld   a, $01                                                     ; $73b2
	ld   [wLoadPalettesFromRam], a                                  ; $73b4

; Load OBJ palettes - to fade in from black
	ld   b, BANK(Palettes_PrintTrainImage)                          ; $73b7
	ld   hl, Palettes_PrintTrainImage                               ; $73b9
	call SetOBJPaletteSrc                                           ; $73bc
	ld   a, $20                                                     ; $73bf
	ld   [wPaletteFadeAmount], a                                    ; $73c1
	ld   a, $01                                                     ; $73c4
	ld   [wLoadPalettesFromRam], a                                  ; $73c6

; Fade in
	call ProcessScriptsFromCurrLoc                                  ; $73c9
	SCR_Call Script_FadeIn
	SCR_Delay $0a
	
.mainLoop:
; Check buttons
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $73d2
	bit  PADB_A, a                                                  ; $73d5
	jr   nz, .aPressed                                              ; $73d7

	bit  PADB_B, a                                                  ; $73d9
	jp   nz, .bPressed                                              ; $73db

	bit  PADB_LEFT, a                                               ; $73de
	jp   nz, .leftPressed                                           ; $73e0

	bit  PADB_RIGHT, a                                              ; $73e3
	jp   nz, .rightPressed                                          ; $73e5

; None of above pressed - do nothing
	call ProcessScriptsFromCurrLoc                                  ; $73e8

.toMainLoopNextFrame:
:	SCR_ResumeNextFrame
	SCR_Jump PrintTrainImageScript.mainLoop

.aPressed:
; BC = 0-indexed train idx
	ld   a, [wTrainImage1stSelectedIdx]                             ; $73ef
	ld   c, a                                                       ; $73f2
	ld   b, $00                                                     ; $73f3

; Based on screen seen, get triple index into a table, to get data source bank+addr
	ld   hl, PrintedTrainImageSources                               ; $73f5
	ld   a, [wTrainImageUsesScreen1]                                ; $73f8
	or   a                                                          ; $73fb
	jr   z, :+                                                      ; $73fc
	ld   hl, PrintedTrainInfoSources                                ; $73fe
:	add  hl, bc                                                     ; $7401
	add  hl, bc                                                     ; $7402
	add  hl, bc                                                     ; $7403
	ld   a, [hl+]                                                   ; $7404
	ld   [wPrinterTileDataSourceBank], a                            ; $7405
	ld   a, [hl+]                                                   ; $7408
	ld   [wPrinterTileDataSourceAddr], a                            ; $7409
	ld   a, [hl+]                                                   ; $740c
	ld   [wPrinterTileDataSourceAddr+1], a                          ; $740d

; HL = image thinness, indexed into table
	ld   a, [wPrintTrainImageThinness]                              ; $7410
	ld   c, a                                                       ; $7413
	ld   b, $00                                                     ; $7414
	ld   hl, PrinterExposureValues                                  ; $7416
	add  hl, bc                                                     ; $7419

; Set 7-bit exposure value based on it
	ld   a, [hl]                                                    ; $741a
	ld   [wPrinterChosenExposureValue], a                           ; $741b

; Update tile map and attr of textbox to say "Checking connection"
	ld   de, _SCRN0+$42                                             ; $741e
	ld   a, $00                                                     ; $7421
	ldh  [rVBK], a                                                  ; $7423
	ldbc $06, $10                                                   ; $7425
	ld   hl, TileMapAndAttr_Text1                                   ; $7428
	ld   a, BANK(TileMapAndAttr_Text1)                              ; $742b
	call FarRectCopyRowPerFrame                                     ; $742d

	ld   de, _SCRN0+$42                                             ; $7430
	ld   a, $01                                                     ; $7433
	ldh  [rVBK], a                                                  ; $7435
	ldbc $06, $10                                                   ; $7437
	ld   a, BANK(TileMapAndAttr_Text1)                              ; $743a
	call FarRectCopyRowPerFrame                                     ; $743c

; Set print start init state, and set that we are displaying the checking conn text
	ld   a, GS_PRINT_START_INIT                                     ; $743f
	ld   [wGameState], a                                            ; $7441

	ld   a, $01                                                     ; $7444
	ld   [wPrintTrainImageTextIdx], a                               ; $7446

; Play sound and start sub-script to auto-update text status
	call ProcessScriptsFromCurrLoc                                  ; $7449
	SCR_PlaySound SND_01|MAKE_SOUND_EFFECT
	SCR_StartSubScript1 PrintTrainImageSubScript1_UpdateTextBasedOnStatus

.loopWaitingForPrintFlowDone:
	SCR_ResumeNextFrame
	
; If B pressed at any point, set cancelling print substate
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $7454
	bit  PADB_B, a                                                  ; $7457
	jr   z, .afterBCheck                                            ; $7459

	ld   a, PRINT_SS_CANCELLING                                     ; $745b
	ld   [wPrintGameStateSubState], a                               ; $745d

.afterBCheck:
; Keep looping while we're processing bytes
	ld   a, [wSerialIntHandlerEnabled]                              ; $7460
	or   a                                                          ; $7463
	ld   de, .loopWaitingForPrintFlowDone                           ; $7464
	jp   nz, ProcessScriptsFromDE                                   ; $7467

; Check response once print flow is done
	ld   a, [wSerialByteReceivedFromPrinter]                        ; $746a
	ld   b, a                                                       ; $746d
	ld   a, [wPrinterStatusResponseSB]                              ; $746e

; Display correct Nintendo error
	and  b                                                          ; $7471
	cp   $ff                                                        ; $7472
	jr   z, .printError2                                            ; $7474

	bit  P_LOW_BATTERY, b                                           ; $7476
	jr   nz, .printError1                                           ; $7478

	bit  P_PAPER_JAM, b                                             ; $747a
	jr   nz, .printError3                                           ; $747c

	bit  P_OTHER_ERROR, b                                           ; $747e
	jr   nz, .printError4                                           ; $7480

; If successful, go straight back to train image screen
	ld   de, .goToTrainImageState                                   ; $7482
	jp   ProcessScriptsFromDE                                       ; $7485

; Else display the relevant print error
.printError1:
	ld   a, $04                                                     ; $7488
	ld   [wPrintTrainImageTextIdx], a                               ; $748a
	ld   de, .waitUntilBPressed                                     ; $748d
	jp   ProcessScriptsFromDE                                       ; $7490

.printError2:
	ld   a, $05                                                     ; $7493
	ld   [wPrintTrainImageTextIdx], a                               ; $7495
	ld   de, .waitUntilBPressed                                     ; $7498
	jp   ProcessScriptsFromDE                                       ; $749b

.printError3:
	ld   a, $06                                                     ; $749e
	ld   [wPrintTrainImageTextIdx], a                               ; $74a0
	ld   de, .waitUntilBPressed                                     ; $74a3
	jp   ProcessScriptsFromDE                                       ; $74a6

.printError4:
	ld   a, $07                                                     ; $74a9
	ld   [wPrintTrainImageTextIdx], a                               ; $74ab
	ld   de, .waitUntilBPressed                                     ; $74ae
	jp   ProcessScriptsFromDE                                       ; $74b1

; --
; -- Exiting to train images
; --
.waitUntilBPressed:
; Once pressed, go to train image game state
	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wButtonsPressed]                                       ; $74b6
	bit  PADB_B, a                                                  ; $74b9
	ld   de, .waitUntilBPressed                                     ; $74bb
	jp   z, ProcessScriptsFromDE                                    ; $74be

	call ProcessScriptsFromCurrLoc                                  ; $74c1

.goToTrainImageState:
; Set BG + OBJ palettes to all black - no fade
	SCR_ExecAsmBelow
	ld   b, BANK(Palettes_AllBlack)                                 ; $74c5
	ld   hl, Palettes_AllBlack                                      ; $74c7
	call SetBGPaletteSrc                                            ; $74ca
	xor  a                                                          ; $74cd
	ld   [wPaletteFadeAmount], a                                    ; $74ce
	ld   [wLoadPalettesFromRam], a                                  ; $74d1
	ld   a, $01                                                     ; $74d4
	ld   [wLoadBGPalettesFromRom], a                                ; $74d6

	ld   b, BANK(Palettes_AllBlack)                                 ; $74d9
	ld   hl, Palettes_AllBlack                                      ; $74db
	call SetOBJPaletteSrc                                           ; $74de
	xor  a                                                          ; $74e1
	ld   [wPaletteFadeAmount], a                                    ; $74e2
	ld   [wLoadPalettesFromRam], a                                  ; $74e5
	ld   a, $01                                                     ; $74e8
	ld   [wLoadOBJPalettesFromRom], a                               ; $74ea

; Set next game state
	ld   a, GS_TRAIN_IMAGE_INIT                                     ; $74ed
	ld   [wGameState], a                                            ; $74ef
	call ProcessScriptsFromCurrLoc                                  ; $74f2
	SCR_StopCurrScript

; --
; -- Not A pressed
; --
.bPressed:
	call ProcessScriptsFromCurrLoc                                  ; $74f6
	SCR_PlaySound SND_09|MAKE_SOUND_EFFECT
	SCR_Jump .goToTrainImageState

.leftPressed:
; Ignore if at leftmost (1)
	ld   a, [wPrintTrainImageThinness]                              ; $74fe
	or   a                                                          ; $7501
	ld   de, .toMainLoopNextFrame                                   ; $7502
	jp   z, ProcessScriptsFromDE                                    ; $7505

; Set new thinness, and play sound
	dec  a                                                          ; $7508
	ld   [wPrintTrainImageThinness], a                              ; $7509
	push af                                                         ; $750c
	ld   a, SND_06                                                  ; $750d
	or   MAKE_SOUND_EFFECT                                          ; $750f
	call PlaySound                                                  ; $7511
	pop  af                                                         ; $7514

	ld   de, .toMainLoopNextFrame                                   ; $7515
	jp   ProcessScriptsFromDE                                       ; $7518

.rightPressed:
; Ignore if at rightmost (5)
	ld   a, [wPrintTrainImageThinness]                              ; $751b
	cp   $04                                                        ; $751e
	ld   de, .toMainLoopNextFrame                                   ; $7520
	jp   z, ProcessScriptsFromDE                                    ; $7523

; Set new thinness, and play sound
	inc  a                                                          ; $7526
	ld   [wPrintTrainImageThinness], a                              ; $7527
	push af                                                         ; $752a
	ld   a, SND_06                                                  ; $752b
	or   MAKE_SOUND_EFFECT                                          ; $752d
	call PlaySound                                                  ; $752f
	pop  af                                                         ; $7532

	ld   de, .toMainLoopNextFrame                                   ; $7533
	jp   ProcessScriptsFromDE                                       ; $7536


PrintTrainImageSubScript1_UpdateTextBasedOnStatus:
; Text idx 2 = Data transfer in progress
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wPrintGameStateSubState]                               ; $753b
	cp   PRINT_SS_LOAD_TILE_DATA                                    ; $753e
	ld   de, :-                                                     ; $7540
	jp   nz, ProcessScriptsFromDE                                   ; $7543

	ld   a, $02                                                     ; $7546
	ld   [wPrintTrainImageTextIdx], a                               ; $7548

; Text idx 3 = Printing out
	call ProcessScriptsFromCurrLoc                                  ; $754b
:	SCR_ResumeNextFrame
	SCR_ExecAsmBelow
	ld   a, [wPrintGameStateSubState]                               ; $7550
	cp   PRINT_SS_PRINTING                                          ; $7553
	ld   de, :-                                                     ; $7555
	jp   nz, ProcessScriptsFromDE                                   ; $7558

	ld   a, $03                                                     ; $755b
	ld   [wPrintTrainImageTextIdx], a                               ; $755d

; Display no other texts
	call ProcessScriptsFromCurrLoc                                  ; $7560
	SCR_StopSubScript1
	SCR_ResumeNextFrame

	
PrintedTrainImageSources:
	FarSrc Gfx_PrintedTrain_00
	FarSrc Gfx_PrintedTrain_01
	FarSrc Gfx_PrintedTrain_02
	FarSrc Gfx_PrintedTrain_03
	FarSrc Gfx_PrintedTrain_04
	FarSrc Gfx_PrintedTrain_05
	FarSrc Gfx_PrintedTrain_06
	FarSrc Gfx_PrintedTrain_07
	FarSrc Gfx_PrintedTrain_08
	FarSrc Gfx_PrintedTrain_09
	FarSrc Gfx_PrintedTrain_0a
	FarSrc Gfx_PrintedTrain_0b
	FarSrc Gfx_PrintedTrain_0c
	FarSrc Gfx_PrintedTrain_0d
	FarSrc Gfx_PrintedTrain_0e
	FarSrc Gfx_PrintedTrain_0f
	FarSrc Gfx_PrintedTrain_10
	FarSrc Gfx_PrintedTrain_11
	FarSrc Gfx_PrintedTrain_12
	FarSrc Gfx_PrintedTrain_13
	FarSrc Gfx_PrintedTrain_14
	FarSrc Gfx_PrintedTrain_15
	FarSrc Gfx_PrintedTrain_16
	FarSrc Gfx_PrintedTrain_17
	FarSrc Gfx_PrintedTrain_18
	FarSrc Gfx_PrintedTrain_19
	FarSrc Gfx_PrintedTrain_1a
	FarSrc Gfx_PrintedTrain_1b
	FarSrc Gfx_PrintedTrain_1c
	FarSrc Gfx_PrintedTrain_1d
	FarSrc Gfx_PrintedTrain_1e
	FarSrc Gfx_PrintedTrain_1f
	FarSrc Gfx_PrintedTrain_20
	FarSrc Gfx_PrintedTrain_21
	FarSrc Gfx_PrintedTrain_22
	FarSrc Gfx_PrintedTrain_23
	FarSrc Gfx_PrintedTrain_24
	FarSrc Gfx_PrintedTrain_25
	FarSrc Gfx_PrintedTrain_26
	FarSrc Gfx_PrintedTrain_27
	FarSrc Gfx_PrintedTrain_28
	FarSrc Gfx_PrintedTrain_29
	FarSrc Gfx_PrintedTrain_2a
	FarSrc Gfx_PrintedTrain_2b
	FarSrc Gfx_PrintedTrain_2c
	FarSrc Gfx_PrintedTrain_2d
	FarSrc Gfx_PrintedTrain_2e
	FarSrc Gfx_PrintedTrain_2f
	FarSrc Gfx_PrintedTrain_30
	FarSrc Gfx_PrintedTrain_31
	FarSrc Gfx_PrintedTrain_32
	FarSrc Gfx_PrintedTrain_33
	FarSrc Gfx_PrintedTrain_34
	FarSrc Gfx_PrintedTrain_35
	FarSrc Gfx_PrintedTrain_36
	FarSrc Gfx_PrintedTrain_37
	FarSrc Gfx_PrintedTrain_38
	FarSrc Gfx_PrintedTrain_39
	FarSrc Gfx_PrintedTrain_3a
	FarSrc Gfx_PrintedTrain_3b
	FarSrc Gfx_PrintedTrain_3c
	FarSrc Gfx_PrintedTrain_3d
	FarSrc Gfx_PrintedTrain_3e
	FarSrc Gfx_PrintedTrain_3f
	FarSrc Gfx_PrintedTrain_40
	FarSrc Gfx_PrintedTrain_41
	FarSrc Gfx_PrintedTrain_42
	FarSrc Gfx_PrintedTrain_43
	FarSrc Gfx_PrintedTrain_44
	FarSrc Gfx_PrintedTrain_45
	FarSrc Gfx_PrintedTrain_46
	FarSrc Gfx_PrintedTrain_47
	FarSrc Gfx_PrintedTrain_48
	FarSrc Gfx_PrintedTrain_49
	FarSrc Gfx_PrintedTrain_4a
	FarSrc Gfx_PrintedTrain_4b
	FarSrc Gfx_PrintedTrain_4c
	FarSrc Gfx_PrintedTrain_4d
	FarSrc Gfx_PrintedTrain_4e
	FarSrc Gfx_PrintedTrain_4f
	FarSrc Gfx_PrintedTrain_50
	FarSrc Gfx_PrintedTrain_51
	FarSrc Gfx_PrintedTrain_52
	FarSrc Gfx_PrintedTrain_53
	FarSrc Gfx_PrintedTrain_54
	FarSrc Gfx_PrintedTrain_55
	FarSrc Gfx_PrintedTrain_56
	FarSrc Gfx_PrintedTrain_57
	FarSrc Gfx_PrintedTrain_58
	FarSrc Gfx_PrintedTrain_59
	FarSrc Gfx_PrintedTrain_5a
	FarSrc Gfx_PrintedTrain_5b
	FarSrc Gfx_PrintedTrain_5c
	FarSrc Gfx_PrintedTrain_5d
	FarSrc Gfx_PrintedTrain_5e
	FarSrc Gfx_PrintedTrain_5f
	FarSrc Gfx_PrintedTrain_60
	FarSrc Gfx_PrintedTrain_61
	FarSrc Gfx_PrintedTrain_62
	FarSrc Gfx_PrintedTrain_63


PrintedTrainInfoSources:
	FarSrc Gfx_TrainInfo_00
	FarSrc Gfx_TrainInfo_01
	FarSrc Gfx_TrainInfo_02
	FarSrc Gfx_TrainInfo_03
	FarSrc Gfx_TrainInfo_04
	FarSrc Gfx_TrainInfo_05
	FarSrc Gfx_TrainInfo_06
	FarSrc Gfx_TrainInfo_07
	FarSrc Gfx_TrainInfo_08
	FarSrc Gfx_TrainInfo_09
	FarSrc Gfx_TrainInfo_0a
	FarSrc Gfx_TrainInfo_0b
	FarSrc Gfx_TrainInfo_0c
	FarSrc Gfx_TrainInfo_0d
	FarSrc Gfx_TrainInfo_0e
	FarSrc Gfx_TrainInfo_0f
	FarSrc Gfx_TrainInfo_10
	FarSrc Gfx_TrainInfo_11
	FarSrc Gfx_TrainInfo_12
	FarSrc Gfx_TrainInfo_13
	FarSrc Gfx_TrainInfo_14
	FarSrc Gfx_TrainInfo_15
	FarSrc Gfx_TrainInfo_16
	FarSrc Gfx_TrainInfo_17
	FarSrc Gfx_TrainInfo_18
	FarSrc Gfx_TrainInfo_19
	FarSrc Gfx_TrainInfo_1a
	FarSrc Gfx_TrainInfo_1b
	FarSrc Gfx_TrainInfo_1c
	FarSrc Gfx_TrainInfo_1d
	FarSrc Gfx_TrainInfo_1e
	FarSrc Gfx_TrainInfo_1f
	FarSrc Gfx_TrainInfo_20
	FarSrc Gfx_TrainInfo_21
	FarSrc Gfx_TrainInfo_22
	FarSrc Gfx_TrainInfo_23
	FarSrc Gfx_TrainInfo_24
	FarSrc Gfx_TrainInfo_25
	FarSrc Gfx_TrainInfo_26
	FarSrc Gfx_TrainInfo_27
	FarSrc Gfx_TrainInfo_28
	FarSrc Gfx_TrainInfo_29
	FarSrc Gfx_TrainInfo_2a
	FarSrc Gfx_TrainInfo_2b
	FarSrc Gfx_TrainInfo_2c
	FarSrc Gfx_TrainInfo_2d
	FarSrc Gfx_TrainInfo_2e
	FarSrc Gfx_TrainInfo_2f
	FarSrc Gfx_TrainInfo_30
	FarSrc Gfx_TrainInfo_31
	FarSrc Gfx_TrainInfo_32
	FarSrc Gfx_TrainInfo_33
	FarSrc Gfx_TrainInfo_34
	FarSrc Gfx_TrainInfo_35
	FarSrc Gfx_TrainInfo_36
	FarSrc Gfx_TrainInfo_37
	FarSrc Gfx_TrainInfo_38
	FarSrc Gfx_TrainInfo_39
	FarSrc Gfx_TrainInfo_3a
	FarSrc Gfx_TrainInfo_3b
	FarSrc Gfx_TrainInfo_3c
	FarSrc Gfx_TrainInfo_3d
	FarSrc Gfx_TrainInfo_3e
	FarSrc Gfx_TrainInfo_3f
	FarSrc Gfx_TrainInfo_40
	FarSrc Gfx_TrainInfo_41
	FarSrc Gfx_TrainInfo_42
	FarSrc Gfx_TrainInfo_43
	FarSrc Gfx_TrainInfo_44
	FarSrc Gfx_TrainInfo_45
	FarSrc Gfx_TrainInfo_46
	FarSrc Gfx_TrainInfo_47
	FarSrc Gfx_TrainInfo_48
	FarSrc Gfx_TrainInfo_49
	FarSrc Gfx_TrainInfo_4a
	FarSrc Gfx_TrainInfo_4b
	FarSrc Gfx_TrainInfo_4c
	FarSrc Gfx_TrainInfo_4d
	FarSrc Gfx_TrainInfo_4e
	FarSrc Gfx_TrainInfo_4f
	FarSrc Gfx_TrainInfo_50
	FarSrc Gfx_TrainInfo_51
	FarSrc Gfx_TrainInfo_52
	FarSrc Gfx_TrainInfo_53
	FarSrc Gfx_TrainInfo_54
	FarSrc Gfx_TrainInfo_55
	FarSrc Gfx_TrainInfo_56
	FarSrc Gfx_TrainInfo_57
	FarSrc Gfx_TrainInfo_58
	FarSrc Gfx_TrainInfo_59
	FarSrc Gfx_TrainInfo_5a
	FarSrc Gfx_TrainInfo_5b
	FarSrc Gfx_TrainInfo_5c
	FarSrc Gfx_TrainInfo_5d
	FarSrc Gfx_TrainInfo_5e
	FarSrc Gfx_TrainInfo_5f
	FarSrc Gfx_TrainInfo_60
	FarSrc Gfx_TrainInfo_61
	FarSrc Gfx_TrainInfo_62
	FarSrc Gfx_TrainInfo_63


PrinterExposureValues:
	db $00, $20, $40, $60, $7f
