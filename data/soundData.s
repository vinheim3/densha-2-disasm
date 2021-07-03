SECTION "ROM Bank $001", ROMX[$4000], BANK[$1]

MusicAndSoundEffectsChannelDataLocations::
	SoundChannels 0, NULL_SND_ADDR, NULL_SND_ADDR, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels Music01_SQ1, Music01_SQ2, Music01_Wav, Music01_Noise
	SoundChannels Music02_SQ1, Music02_SQ2, Music02_Wav, Music02_Noise
	SoundChannels Music03_SQ1, Music03_SQ2, Music03_Wav, Music03_Noise
	SoundChannels Music04_SQ1, Music04_SQ2, Music04_Wav, Music04_Noise
	SoundChannels Music05_SQ1, Music05_SQ2, Music05_Wav, Music05_Noise
	SoundChannels Music06_SQ1, Music06_SQ2, Music06_Wav, Music06_Noise
	SoundChannels Music07_SQ1, Music07_SQ2, Music07_Wav, Music07_Noise
	SoundChannels Music08_SQ1, Music08_SQ2, Music08_Wav, Music08_Noise
	SoundChannels Music09_SQ1, Music09_SQ2, Music09_Wav, Music09_Noise
	SoundChannels Music0a_SQ1, Music0a_SQ2, Music0a_Wav, Music0a_Noise
	SoundChannels Music0b_SQ1, Music0b_SQ2, Music0b_Wav, Music0b_Noise
	SoundChannels Music0c_SQ1, Music0c_SQ2, Music0c_Wav, Music0c_Noise
	SoundChannels Music0d_SQ1, Music0d_SQ2, Music0d_Wav, Music0d_Noise
	SoundChannels Music0e_SQ1, Music0e_SQ2, Music0e_Wav, Music0e_Noise
	SoundChannels Music0f_SQ1, Music0f_SQ2, Music0f_Wav, Music0f_Noise
	SoundChannels Music10_SQ1, Music10_SQ2, Music10_Wav, Music10_Noise
	SoundChannels Music11_SQ1, Music11_SQ2, Music11_Wav, Music11_Noise
	SoundChannels Music12_SQ1, Music12_SQ2, Music12_Wav, Music12_Noise
	SoundChannels Music13_SQ1, Music13_SQ2, Music13_Wav, Music13_Noise
	SoundChannels Music14_SQ1, Music14_SQ2, Music14_Wav, Music14_Noise
	SoundChannels Music15_SQ1, Music15_SQ2, Music15_Wav, Music15_Noise

	SoundChannels NULL_SND_ADDR, NULL_SND_ADDR, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels Sound01_SQ1, Sound01_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels NULL_SND_ADDR, Sound02_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels NULL_SND_ADDR, Sound03_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels NULL_SND_ADDR, Sound04_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels NULL_SND_ADDR, Sound05_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels NULL_SND_ADDR, NULL_SND_ADDR, NULL_SND_ADDR, Sound06_Noise
	SoundChannels Sound07_SQ1, Sound07_SQ2, Sound07_Wav, Sound07_Noise
	SoundChannels NULL_SND_ADDR, Sound08_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels NULL_SND_ADDR, NULL_SND_ADDR, NULL_SND_ADDR, Sound09_Noise
	SoundChannels NULL_SND_ADDR, Sound0a_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels Sound0b_SQ1, Sound0b_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels NULL_SND_ADDR, NULL_SND_ADDR, NULL_SND_ADDR, Sound0c_Noise
	SoundChannels Sound0d_SQ1, Sound0d_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels NULL_SND_ADDR, NULL_SND_ADDR, NULL_SND_ADDR, Sound0e_Noise
	SoundChannels NULL_SND_ADDR, NULL_SND_ADDR, NULL_SND_ADDR, Sound0f_Noise
	SoundChannels NULL_SND_ADDR, NULL_SND_ADDR, NULL_SND_ADDR, Sound10_Noise
	SoundChannels NULL_SND_ADDR, NULL_SND_ADDR, NULL_SND_ADDR, Sound11_Noise
	SoundChannels NULL_SND_ADDR, NULL_SND_ADDR, NULL_SND_ADDR, Sound12_Noise
	SoundChannels NULL_SND_ADDR, NULL_SND_ADDR, NULL_SND_ADDR, Sound13_Noise
	SoundChannels NULL_SND_ADDR, NULL_SND_ADDR, NULL_SND_ADDR, Sound14_Noise
	SoundChannels Sound15_SQ1, Sound15_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels Sound16_SQ1, Sound16_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels Sound17_SQ1, Sound17_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels Sound18_SQ1, Sound18_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels Sound19_SQ1, Sound19_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels Sound1a_SQ1, Sound1a_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels Sound1b_SQ1, Sound1b_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels Sound1c_SQ1, Sound1c_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels NULL_SND_ADDR, Sound1d_SQ2, NULL_SND_ADDR, NULL_SND_ADDR
	SoundChannels NULL_SND_ADDR, Sound1e_SQ2, NULL_SND_ADDR, NULL_SND_ADDR


; unused - $41dd
	SND_ClearHWRegs $60
	SND_Stop


Music01_SQ1:
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 3, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 1, $66
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 6, $a0
	SND_SaveEnvelopeValue 7, $60
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS02
	SND_SetSongSpeed $03
	PlayNote Fnote , 7, 3, $18
	PlayNote Asharp, 6, 3, $18
	PlayNote Dnote , 7, 3, $18
	PlayNote Dsharp, 7, 3, $18
	PlayNote Fnote , 7, 3, $18
	PlayNote Asharp, 6, 3, $18
	PlayNote Asharp, 7, 3, $18
	PlayNote Asharp, 6, 3, $18
	PlayNote Anote , 7, 3, $18
	PlayNote Asharp, 6, 3, $18
	PlayNote Gnote , 7, 3, $18
	PlayNote Asharp, 6, 3, $18
	PlayNote Fnote , 7, 3, $18
	PlayNote Asharp, 7, 3, $18
	PlayNote Cnote , 8, 3, $18
	PlayNote Dnote , 8, 3, $18
	PlayNote Fnote , 8, 7, $60
	PlayNote Fnote , 8, 7, $60
	PlayNote Fnote , 8, 3, $30
	PlayNote Fnote , 8, 1, $0c
	SND_Stop


Music01_SQ2:
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 3, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 1, $66
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 7, $a0
	SND_SaveEnvelopeValue 6, $60
	SND_SquareSet25Wave1
	SND_SetFreqTableBaseIdx $e8
	SND_SetAlternatingAudTerm 1
	PlayNote Fnote , 7, 1, $18
	PlayNote Asharp, 6, 1, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dsharp, 7, 1, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dsharp, 7, 1, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Asharp, 6, 1, $18
	PlayNote Asharp, 7, 1, $18
	PlayNote Asharp, 6, 1, $18
	PlayNote Anote , 7, 1, $18
	PlayNote Asharp, 6, 1, $18
	PlayNote Gnote , 7, 1, $18
	PlayNote Asharp, 6, 1, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Asharp, 7, 1, $18
	PlayNote Cnote , 8, 1, $18
	PlayNote Dnote , 8, 1, $18
	PlayNote Fnote , 8, 6, $60
	PlayNote Fnote , 8, 6, $60
	PlayNote Fnote , 8, 1, $60
	SND_Stop


Music01_Wav:
	SND_SaveEnvelopeValue 7, $46
	SND_SetAlternatingAudTerm 2
	PlayNote Asharp, 6, 7, $30
	SND_ClearHWRegs $18
	PlayNote Asharp, 4, 7, $08
	SND_ClearHWRegs $10
	PlayNote Asharp, 6, 7, $30
	SND_ClearHWRegs $18
	PlayNote Asharp, 4, 7, $08
	SND_ClearHWRegs $10
	PlayNote Asharp, 6, 7, $30
	SND_ClearHWRegs $18
	PlayNote Asharp, 4, 7, $08
	SND_ClearHWRegs $10
	PlayNote Asharp, 6, 7, $30
	SND_ClearHWRegs $18
	PlayNote Asharp, 4, 7, $08
	SND_ClearHWRegs $10
	PlayNote Asharp, 6, 7, $30
	SND_ClearHWRegs $18
	PlayNote Asharp, 4, 7, $08
	SND_ClearHWRegs $10
	PlayNote Asharp, 6, 7, $30
	SND_ClearHWRegs $18
	PlayNote Asharp, 4, 7, $08
	SND_ClearHWRegs $10
	PlayNote Asharp, 6, 7, $30
	SND_ClearHWRegs $18
	PlayNote Asharp, 4, 7, $08
	SND_ClearHWRegs $10
	PlayNote Asharp, 6, 7, $30
	SND_ClearHWRegs $18
	PlayNote Asharp, 4, 7, $08
	SND_SetAudTermS01andSO2
	SND_Stop


Music01_Noise:
	SND_ClearHWRegs $60
	SND_Stop


Music02_SQ1:
:	SND_SaveEnvelopeValue 1, $c6
	SND_SaveEnvelopeValue 0, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_Call SquareFunc_001_42bc
	SND_Jump :-


SquareFunc_001_42bc:
	SND_SetFadingVolIncrement $07
	PlayNote Dsharp, 7, 1, $30
	PlayNote Fnote , 7, 1, $30
	PlayNote Fsharp, 7, 1, $30
	PlayNote Gsharp, 7, 0, $30
	PlayNote Asharp, 7, 0, $60
	PlayNote Asharp, 7, 0, $60
	PlayNote Asharp, 7, 0, $60
	PlayNote Asharp, 7, 2, $48
	PlayNote Asharp, 7, 6, $18
	PlayNote Gsharp, 7, 1, $60
	PlayNote Gsharp, 7, 1, $18
	PlayNote Gsharp, 7, 6, $18
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $18
	PlayNote Asharp, 7, 6, $18
	PlayNote Gsharp, 7, 1, $48
	PlayNote Gsharp, 7, 6, $18
	PlayNote Fsharp, 7, 1, $30
	PlayNote Fsharp, 7, 3, $18
	PlayNote Gsharp, 7, 1, $30
	PlayNote Gsharp, 7, 3, $18
	PlayNote Fsharp, 7, 1, $30
	PlayNote Fnote , 7, 1, $30
	PlayNote Fnote , 7, 3, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dsharp, 7, 3, $18
	PlayNote Csharp, 7, 1, $30
	PlayNote Dsharp, 7, 1, $60
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dsharp, 7, 3, $18
	PlayNote Dsharp, 7, 6, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dsharp, 7, 3, $18
	PlayNote Csharp, 7, 1, $30
	PlayNote Csharp, 7, 3, $18
	PlayNote Asharp, 6, 1, $30
	PlayNote Bnote , 6, 0, $60
	PlayNote Bnote , 6, 1, $30
	PlayNote Bnote , 6, 3, $18
	PlayNote Bnote , 6, 6, $18
	PlayNote Bnote , 6, 1, $30
	PlayNote Bnote , 6, 3, $18
	PlayNote Csharp, 7, 1, $30
	PlayNote Csharp, 7, 3, $18
	PlayNote Dsharp, 7, 1, $24
	PlayNote Dsharp, 7, 3, $0c
	PlayNote Csharp, 7, 1, $60
	PlayNote Csharp, 7, 1, $30
	PlayNote Fsharp, 7, 1, $60
	PlayNote Fsharp, 7, 1, $60
	PlayNote Fsharp, 7, 3, $18
	PlayNote Fsharp, 7, 6, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dsharp, 7, 3, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dsharp, 7, 3, $18
	PlayNote Fnote , 7, 1, $30
	PlayNote Fsharp, 7, 1, $30
	PlayNote Fsharp, 7, 3, $18
	PlayNote Gsharp, 7, 1, $30
	PlayNote Gsharp, 7, 3, $18
	PlayNote Fsharp, 7, 1, $30
	PlayNote Fnote , 7, 1, $60
	PlayNote Fnote , 7, 1, $30
	PlayNote Fnote , 7, 3, $18
	PlayNote Fnote , 7, 6, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Fnote , 7, 1, $30
	PlayNote Fsharp, 7, 1, $30
	PlayNote Gsharp, 7, 1, $30
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 3, $60
	PlayNote Asharp, 7, 3, $48
	PlayNote Asharp, 7, 6, $18
	PlayNote Gsharp, 7, 1, $60
	PlayNote Gsharp, 7, 1, $18
	PlayNote Gsharp, 7, 6, $18
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $18
	PlayNote Asharp, 7, 6, $18
	PlayNote Gsharp, 7, 1, $60
	PlayNote Fsharp, 7, 1, $30
	PlayNote Fsharp, 7, 3, $18
	PlayNote Gsharp, 7, 1, $30
	PlayNote Gsharp, 7, 3, $18
	PlayNote Fsharp, 7, 1, $30
	PlayNote Fnote , 7, 1, $30
	PlayNote Fnote , 7, 3, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dsharp, 7, 3, $18
	PlayNote Csharp, 7, 1, $30
	PlayNote Dsharp, 7, 1, $60
	PlayNote Dsharp, 7, 1, $48
	PlayNote Dsharp, 7, 6, $18
	PlayNote Dsharp, 7, 1, $48
	PlayNote Csharp, 7, 1, $48
	PlayNote Asharp, 6, 1, $30
	PlayNote Bnote , 6, 1, $60
	PlayNote Bnote , 6, 1, $48
	PlayNote Bnote , 6, 6, $18
	PlayNote Bnote , 6, 1, $48
	PlayNote Csharp, 7, 1, $48
	PlayNote Dsharp, 7, 1, $30
	PlayNote Csharp, 7, 1, $60
	PlayNote Csharp, 7, 1, $30
	PlayNote Fsharp, 7, 1, $60
	PlayNote Fsharp, 7, 1, $60
	PlayNote Fsharp, 7, 1, $18
	PlayNote Fsharp, 7, 6, $18
	PlayNote Dsharp, 7, 1, $48
	PlayNote Dsharp, 7, 1, $48
	PlayNote Fnote , 7, 1, $30
	PlayNote Fsharp, 7, 1, $48
	PlayNote Gsharp, 7, 1, $48
	PlayNote Fsharp, 7, 1, $30
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
	PlayNote Asharp, 6, 2, $0c
	PlayNote Asharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Cnote , 7, 2, $0c
	PlayNote Cnote , 7, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Csharp, 7, 2, $48
	PlayNote Cnote , 7, 2, $48
	PlayNote Asharp, 6, 2, $18
	PlayNote Asharp, 6, 2, $18
	SND_ClearHWRegs $30
	PlayNote Asharp, 6, 2, $0c
	PlayNote Asharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Gsharp, 6, 2, $0c
	PlayNote Gsharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Fsharp, 6, 2, $48
	PlayNote Gsharp, 6, 2, $48
	PlayNote Fsharp, 6, 2, $30
	SND_ClearHWRegs $30
	PlayNote Asharp, 6, 2, $0c
	PlayNote Asharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Cnote , 7, 2, $0c
	PlayNote Cnote , 7, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Csharp, 7, 2, $48
	PlayNote Cnote , 7, 2, $48
	PlayNote Asharp, 6, 2, $18
	PlayNote Asharp, 6, 6, $18
	SND_ClearHWRegs $30
	PlayNote Asharp, 6, 2, $0c
	PlayNote Asharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Gsharp, 6, 2, $0c
	PlayNote Gsharp, 6, 6, $0c
	SND_ClearHWRegs $18
	PlayNote Fsharp, 6, 2, $0c
	PlayNote Fsharp, 6, 6, $0c
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 6, $18
	PlayNote Dsharp, 6, 1, $30
	PlayNote Dsharp, 6, 6, $18
	SND_ClearHWRegs $60
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Fsharp, 6, 1, $48
	PlayNote Fsharp, 6, 6, $18
	PlayNote Fnote , 6, 1, $48
	PlayNote Dsharp, 6, 1, $48
	PlayNote Dsharp, 6, 6, $18
	SND_ClearHWRegs $30
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 6, $18
	PlayNote Dsharp, 6, 1, $30
	PlayNote Dsharp, 6, 6, $18
	SND_ClearHWRegs $48
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $48
	PlayNote Asharp, 5, 6, $18
	PlayNote Gsharp, 5, 1, $48
	PlayNote Fsharp, 5, 1, $18
	SND_ClearHWRegs $78
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 6, $18
	PlayNote Dsharp, 6, 1, $30
	PlayNote Dsharp, 6, 6, $18
	SND_ClearHWRegs $60
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Fsharp, 6, 1, $48
	PlayNote Fsharp, 6, 6, $18
	PlayNote Gsharp, 6, 1, $48
	PlayNote Dsharp, 6, 1, $48
	PlayNote Dsharp, 6, 6, $18
	SND_ClearHWRegs $30
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 6, $18
	PlayNote Dsharp, 6, 1, $30
	PlayNote Dsharp, 6, 6, $18
	SND_ClearHWRegs $60
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 1, $48
	PlayNote Asharp, 5, 6, $18
	PlayNote Gsharp, 5, 1, $48
	PlayNote Fsharp, 5, 1, $18
	SND_Ret


; unused - $44b1
	PlayNote Dsharp, 7, 1, $30
	PlayNote Fnote , 7, 1, $30
	PlayNote Fsharp, 7, 1, $30
	PlayNote Gsharp, 7, 1, $30
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $48
	PlayNote Asharp, 7, 6, $18
	PlayNote Gsharp, 7, 1, $60
	PlayNote Gsharp, 7, 1, $18
	PlayNote Gsharp, 7, 6, $18
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $18
	PlayNote Asharp, 7, 6, $18
	PlayNote Gsharp, 7, 1, $48
	PlayNote Gsharp, 7, 6, $18
	PlayNote Fsharp, 7, 1, $30
	PlayNote Fsharp, 7, 6, $18
	PlayNote Gsharp, 7, 1, $30
	PlayNote Gsharp, 7, 6, $18
	PlayNote Fsharp, 7, 1, $18
	PlayNote Fsharp, 7, 6, $18
	PlayNote Fnote , 7, 1, $30
	PlayNote Fnote , 7, 6, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dsharp, 7, 6, $18
	PlayNote Csharp, 7, 1, $18
	PlayNote Csharp, 7, 6, $18
	PlayNote Dsharp, 7, 1, $60
	PlayNote Dsharp, 7, 1, $48
	PlayNote Dsharp, 7, 6, $18
	PlayNote Dsharp, 7, 1, $48
	PlayNote Csharp, 7, 1, $48
	PlayNote Asharp, 6, 1, $30
	PlayNote Bnote , 6, 1, $60
	PlayNote Bnote , 6, 1, $48
	PlayNote Bnote , 6, 6, $18
	PlayNote Bnote , 6, 1, $48
	PlayNote Csharp, 7, 1, $48
	PlayNote Dsharp, 7, 1, $30
	PlayNote Csharp, 7, 1, $60
	PlayNote Csharp, 7, 1, $30
	PlayNote Fsharp, 7, 1, $60
	PlayNote Fsharp, 7, 1, $60
	PlayNote Fsharp, 7, 1, $18
	PlayNote Fsharp, 7, 6, $18
	PlayNote Dsharp, 7, 1, $48
	PlayNote Dsharp, 7, 1, $48
	PlayNote Fnote , 7, 1, $30
	PlayNote Fsharp, 7, 1, $48
	PlayNote Gsharp, 7, 1, $48
	PlayNote Fsharp, 7, 1, $30
	PlayNote Fnote , 7, 1, $60
	PlayNote Fnote , 7, 1, $48
	PlayNote Fnote , 7, 6, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Fnote , 7, 1, $30
	PlayNote Fsharp, 7, 1, $30
	PlayNote Gsharp, 7, 1, $30
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $48
	PlayNote Asharp, 7, 6, $18
	PlayNote Gsharp, 7, 1, $60
	PlayNote Gsharp, 7, 1, $18
	PlayNote Gsharp, 7, 6, $18
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $18
	PlayNote Asharp, 7, 6, $18
	PlayNote Gsharp, 7, 1, $48
	PlayNote Gsharp, 7, 6, $18
	PlayNote Fsharp, 7, 1, $30
	PlayNote Fsharp, 7, 6, $18
	PlayNote Gsharp, 7, 1, $30
	PlayNote Gsharp, 7, 6, $18
	PlayNote Fsharp, 7, 1, $18
	PlayNote Fsharp, 7, 6, $18
	PlayNote Fnote , 7, 1, $30
	PlayNote Fnote , 7, 6, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dsharp, 7, 6, $18
	PlayNote Csharp, 7, 1, $18
	PlayNote Csharp, 7, 6, $18
	PlayNote Dsharp, 7, 1, $60
	PlayNote Dsharp, 7, 1, $48
	PlayNote Dsharp, 7, 6, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dsharp, 7, 6, $18
	PlayNote Csharp, 7, 1, $30
	PlayNote Csharp, 7, 6, $18
	PlayNote Asharp, 6, 1, $18
	PlayNote Asharp, 6, 6, $18
	PlayNote Bnote , 6, 1, $60
	PlayNote Bnote , 6, 1, $48
	PlayNote Bnote , 6, 6, $18
	PlayNote Bnote , 6, 1, $30
	PlayNote Bnote , 6, 6, $18
	PlayNote Csharp, 7, 1, $30
	PlayNote Csharp, 7, 6, $18
	PlayNote Dsharp, 7, 1, $18
	PlayNote Dsharp, 7, 6, $18
	PlayNote Csharp, 7, 1, $60
	PlayNote Csharp, 7, 1, $18
	PlayNote Csharp, 7, 6, $18
	PlayNote Fsharp, 7, 1, $60
	PlayNote Fsharp, 7, 1, $60
	PlayNote Fsharp, 7, 1, $18
	PlayNote Fsharp, 7, 6, $18
	PlayNote Dsharp, 7, 1, $48
	PlayNote Dsharp, 7, 1, $48
	PlayNote Fnote , 7, 1, $30
	PlayNote Fsharp, 7, 1, $48
	PlayNote Gsharp, 7, 1, $48
	PlayNote Fsharp, 7, 1, $30
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	PlayNote Dsharp, 7, 1, $18
	PlayNote Dsharp, 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dsharp, 7, 6, $30
	SND_ClearHWRegs $30
	PlayNote Cnote , 6, 1, $60
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 6, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 6, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 6, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 6, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 6, $18
	PlayNote Gnote , 5, 1, $30
	PlayNote Asharp, 5, 1, $18
	PlayNote Gnote , 5, 1, $48
	PlayNote Gnote , 5, 6, $30
	PlayNote Dsharp, 7, 1, $18
	PlayNote Dsharp, 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dsharp, 7, 6, $30
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 6, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 6, $18
	PlayNote Dsharp, 6, 1, $30
	PlayNote Dsharp, 6, 6, $30
	PlayNote Fnote , 6, 1, $30
	PlayNote Fnote , 6, 6, $30
	PlayNote Dnote , 6, 1, $60
	PlayNote Dnote , 6, 1, $60
	PlayNote Dnote , 6, 1, $30
	PlayNote Dnote , 6, 6, $30
	PlayNote Dsharp, 7, 1, $18
	PlayNote Dsharp, 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dsharp, 7, 6, $30
	SND_ClearHWRegs $30
	PlayNote Cnote , 6, 1, $60
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 6, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 6, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 6, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 6, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 6, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Gnote , 5, 1, $48
	PlayNote Gnote , 5, 6, $30
	PlayNote Fnote , 5, 1, $18
	PlayNote Fnote , 5, 6, $18
	PlayNote Dsharp, 5, 1, $18
	PlayNote Dsharp, 5, 6, $18
	PlayNote Fnote , 5, 1, $48
	PlayNote Fnote , 5, 6, $18
	PlayNote Fnote , 5, 1, $18
	PlayNote Fnote , 5, 6, $18
	PlayNote Dsharp, 5, 1, $18
	PlayNote Dsharp, 5, 6, $18
	PlayNote Fnote , 5, 1, $48
	PlayNote Fnote , 5, 6, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 6, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 6, $18
	PlayNote Cnote , 6, 1, $60
	PlayNote Cnote , 6, 1, $60
	PlayNote Cnote , 6, 1, $30
	PlayNote Cnote , 6, 6, $30
	PlayNote Dsharp, 7, 1, $18
	PlayNote Dsharp, 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dsharp, 7, 6, $30
	SND_ClearHWRegs $30
	PlayNote Cnote , 6, 1, $60
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 6, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 6, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 6, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 6, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 6, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Gnote , 5, 1, $48
	PlayNote Gnote , 5, 6, $30
	PlayNote Dsharp, 7, 1, $18
	PlayNote Dsharp, 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dsharp, 7, 6, $30
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 6, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 6, $18
	PlayNote Dsharp, 6, 1, $30
	PlayNote Dsharp, 6, 6, $30
	PlayNote Fnote , 6, 1, $30
	PlayNote Fnote , 6, 6, $30
	PlayNote Dnote , 6, 1, $60
	PlayNote Dnote , 6, 1, $60
	PlayNote Dnote , 6, 1, $30
	PlayNote Dnote , 6, 6, $30
	PlayNote Dsharp, 7, 1, $18
	PlayNote Dsharp, 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dsharp, 7, 6, $30
	SND_ClearHWRegs $30
	PlayNote Cnote , 6, 1, $60
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 6, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 6, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 6, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 6, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 6, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Gnote , 5, 1, $48
	PlayNote Gnote , 5, 6, $30
	PlayNote Fnote , 5, 1, $18
	PlayNote Fnote , 5, 6, $18
	PlayNote Dsharp, 5, 1, $18
	PlayNote Dsharp, 5, 6, $18
	PlayNote Fnote , 5, 1, $48
	PlayNote Fnote , 5, 6, $18
	PlayNote Fnote , 5, 1, $18
	PlayNote Fnote , 5, 6, $18
	PlayNote Dsharp, 5, 1, $18
	PlayNote Dsharp, 5, 6, $18
	PlayNote Fnote , 5, 1, $48
	PlayNote Fnote , 5, 6, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 6, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 6, $18
	PlayNote Cnote , 6, 4, $60
	PlayNote Cnote , 6, 4, $60
	PlayNote Cnote , 6, 4, $60
	PlayNote Cnote , 6, 4, $60
	PlayNote Cnote , 6, 4, $14
	PlayNote Cnote , 6, 1, $60
	PlayNote Cnote , 6, 1, $60
	PlayNote Cnote , 6, 1, $60
	PlayNote Cnote , 6, 1, $60
	PlayNote Anote , 3, 1, $60
	SND_ClearHWRegs $30
	PlayNote Cnote , 6, 1, $60
	PlayNote Dnote , 6, 1, $30
	PlayNote Enote , 6, 1, $30
	PlayNote Gnote , 6, 4, $44
	PlayNote Gnote , 6, 1, $30
	PlayNote Gnote , 6, 1, $30
	PlayNote Fnote , 6, 1, $30
	PlayNote Enote , 6, 1, $30
	PlayNote Dnote , 6, 1, $30
	PlayNote Cnote , 6, 1, $60
	PlayNote Bnote , 5, 4, $44
	PlayNote Bnote , 5, 1, $30
	PlayNote Bnote , 5, 1, $30
	PlayNote Cnote , 6, 1, $60
	PlayNote Dnote , 6, 1, $30
	PlayNote Gnote , 6, 1, $60
	PlayNote Anote , 6, 4, $44
	PlayNote Anote , 6, 1, $60
	PlayNote Anote , 6, 1, $48
	PlayNote Gnote , 6, 1, $48
	PlayNote Anote , 6, 1, $30
	SND_ClearHWRegs $18
	PlayNote Bnote , 6, 1, $48
	PlayNote Cnote , 7, 1, $60
	PlayNote Cnote , 7, 1, $30
	PlayNote Dnote , 7, 1, $60
	PlayNote Enote , 7, 1, $60
	PlayNote Dnote , 7, 4, $44
	PlayNote Dnote , 7, 1, $30
	PlayNote Dnote , 7, 1, $30
	PlayNote Cnote , 7, 1, $30
	PlayNote Bnote , 6, 1, $60
	PlayNote Anote , 6, 1, $30
	PlayNote Gnote , 6, 1, $30
	PlayNote Cnote , 7, 4, $44
	PlayNote Cnote , 7, 1, $60
	PlayNote Cnote , 7, 1, $30
	PlayNote Dnote , 7, 1, $60
	PlayNote Dsharp, 7, 1, $60
	PlayNote Fnote , 7, 4, $44
	PlayNote Fnote , 7, 1, $30
	PlayNote Fnote , 7, 1, $30
	PlayNote Dsharp, 7, 1, $30
	PlayNote Dnote , 7, 1, $60
	PlayNote Cnote , 7, 1, $30
	PlayNote Asharp, 6, 1, $60
	PlayNote Gnote , 4, 1, $10
	PlayNote Gnote , 6, 1, $30
	PlayNote Bnote , 4, 1, $10
	PlayNote Dnote , 5, 1, $10
	PlayNote Bnote , 4, 1, $10
	PlayNote Dnote , 5, 1, $10
	PlayNote Gnote , 5, 1, $10
	PlayNote Dnote , 5, 1, $10
	PlayNote Gnote , 5, 1, $10
	PlayNote Bnote , 5, 1, $10
	PlayNote Gnote , 5, 1, $10
	PlayNote Bnote , 5, 1, $10
	PlayNote Dnote , 6, 1, $10
	PlayNote Bnote , 5, 1, $10
	PlayNote Dnote , 6, 1, $10
	PlayNote Gnote , 6, 1, $10
	PlayNote Dnote , 6, 1, $10
	PlayNote Gnote , 6, 1, $10
	PlayNote Bnote , 6, 1, $10
	PlayNote Gnote , 6, 1, $10
	PlayNote Bnote , 6, 1, $10
	PlayNote Dnote , 7, 1, $10
	PlayNote Bnote , 6, 1, $10
	PlayNote Dnote , 7, 1, $10
	PlayNote Gnote , 7, 1, $10
	SND_Ret
	
	
Music02_SQ2:
:	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 3, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet75Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAlternatingAudTerm 1
	SND_Call SquareFunc_001_47ac
	SND_Jump :-


SquareFunc_001_47ac:
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	PlayNote Dsharp, 5, 3, $0c
	PlayNote Dsharp, 5, 6, $0c
	PlayNote Asharp, 5, 3, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Asharp, 5, 3, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Asharp, 6, 3, $0c
	PlayNote Asharp, 6, 6, $0c
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Csharp, 6, 3, $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Dsharp, 5, 3, $0c
	PlayNote Dsharp, 5, 6, $0c
	PlayNote Asharp, 5, 3, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Asharp, 5, 3, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Asharp, 6, 3, $0c
	PlayNote Asharp, 6, 6, $0c
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Csharp, 6, 3, $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Asharp, 5, 3, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Fnote , 5, 3, $0c
	PlayNote Fnote , 5, 6, $0c
	PlayNote Csharp, 6, 3, $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Fnote , 6, 3, $0c
	PlayNote Fnote , 6, 6, $0c
	PlayNote Csharp, 6, 3, $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Asharp, 6, 3, $0c
	PlayNote Asharp, 6, 6, $0c
	PlayNote Fnote , 6, 3, $0c
	PlayNote Fnote , 6, 6, $0c
	PlayNote Dnote , 6, 3, $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Fnote , 6, 3, $0c
	PlayNote Fnote , 6, 6, $0c
	PlayNote Asharp, 5, 3, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Csharp, 6, 3, $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Fnote , 6, 3, $0c
	PlayNote Fnote , 6, 6, $0c
	PlayNote Gsharp, 6, 3, $0c
	PlayNote Gsharp, 6, 6, $0c
	PlayNote Asharp, 6, 3, $0c
	PlayNote Asharp, 6, 6, $0c
	PlayNote Fnote , 6, 3, $0c
	PlayNote Fnote , 6, 6, $0c
	PlayNote Dnote , 6, 3, $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Asharp, 5, 3, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Asharp, 5, 3, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Dsharp, 6, 6, $0c
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Asharp, 6, 3, $0c
	PlayNote Asharp, 6, 6, $0c
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Dsharp, 6, 6, $0c
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Fnote , 6, 3, $0c
	PlayNote Fnote , 6, 6, $0c
	PlayNote Gsharp, 5, 3, $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Csharp, 6, 3, $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Fnote , 6, 3, $0c
	PlayNote Fnote , 6, 6, $0c
	PlayNote Gsharp, 6, 3, $0c
	PlayNote Gsharp, 6, 6, $0c
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Csharp, 6, 3, $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Gsharp, 5, 3, $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Bnote , 4, 3, $0c
	PlayNote Bnote , 4, 6, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Bnote , 5, 3, $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Dsharp, 6, 6, $0c
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Dsharp, 6, 6, $0c
	PlayNote Bnote , 5, 3, $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Bnote , 4, 3, $0c
	PlayNote Bnote , 4, 6, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Bnote , 5, 3, $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Asharp, 4, 3, $0c
	PlayNote Asharp, 4, 6, $0c
	PlayNote Fnote , 5, 3, $0c
	PlayNote Fnote , 5, 6, $0c
	PlayNote Asharp, 5, 3, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Fnote , 6, 3, $0c
	PlayNote Fnote , 6, 6, $0c
	PlayNote Gsharp, 4, 3, $0c
	PlayNote Gsharp, 4, 6, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Gsharp, 5, 3, $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Dsharp, 6, 6, $0c
	PlayNote Gsharp, 6, 3, $0c
	PlayNote Gsharp, 6, 6, $0c
	PlayNote Gsharp, 5, 3, $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Gsharp, 4, 3, $0c
	PlayNote Gsharp, 4, 6, $0c
	PlayNote Gsharp, 4, 3, $0c
	PlayNote Gsharp, 4, 6, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Gsharp, 5, 3, $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Dsharp, 6, 6, $0c
	PlayNote Gsharp, 6, 3, $0c
	PlayNote Gsharp, 6, 6, $0c
	PlayNote Gsharp, 5, 3, $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Gsharp, 4, 3, $0c
	PlayNote Gsharp, 4, 6, $0c
	PlayNote Asharp, 4, 3, $0c
	PlayNote Asharp, 4, 6, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Asharp, 5, 3, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Csharp, 6, 3, $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Csharp, 6, 3, $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Asharp, 5, 3, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Asharp, 4, 3, $0c
	PlayNote Asharp, 4, 6, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Asharp, 5, 3, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Csharp, 6, 3, $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Csharp, 6, 3, $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Asharp, 5, 3, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Csharp, 6, 3, $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Bnote , 4, 3, $0c
	PlayNote Bnote , 4, 6, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Bnote , 5, 3, $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Dsharp, 6, 6, $0c
	PlayNote Bnote , 6, 3, $0c
	PlayNote Bnote , 6, 6, $0c
	PlayNote Bnote , 5, 3, $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Bnote , 4, 3, $0c
	PlayNote Bnote , 4, 6, $0c
	PlayNote Bnote , 5, 3, $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Bnote , 5, 3, $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Dsharp, 6, 6, $0c
	PlayNote Bnote , 6, 3, $0c
	PlayNote Bnote , 6, 6, $0c
	PlayNote Bnote , 5, 3, $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Bnote , 4, 3, $0c
	PlayNote Bnote , 4, 6, $0c
	PlayNote Anote , 2, 3, $0c
	PlayNote Anote , 2, 6, $0c
	PlayNote Gsharp, 5, 3, $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Csharp, 6, 3, $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Fnote , 6, 3, $0c
	PlayNote Fnote , 6, 6, $0c
	PlayNote Gsharp, 6, 3, $0c
	PlayNote Gsharp, 6, 6, $0c
	PlayNote Csharp, 7, 3, $0c
	PlayNote Csharp, 7, 6, $0c
	PlayNote Fnote , 7, 3, $0c
	PlayNote Fnote , 7, 6, $0c
	PlayNote Gsharp, 7, 3, $0c
	PlayNote Gsharp, 7, 6, $0c
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dsharp, 6, 2, $60
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $30
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $30
	PlayNote Dsharp, 6, 2, $30
	PlayNote Asharp, 5, 2, $30
	PlayNote Dsharp, 6, 2, $30
	PlayNote Fsharp, 6, 2, $30
	PlayNote Fnote , 6, 2, $30
	PlayNote Gsharp, 5, 2, $30
	PlayNote Csharp, 6, 2, $30
	PlayNote Asharp, 5, 2, $30
	PlayNote Anote , 5, 2, $60
	PlayNote Anote , 5, 2, $60
	PlayNote Anote , 5, 2, $60
	PlayNote Asharp, 5, 2, $60
	PlayNote Bnote , 5, 2, $60
	PlayNote Bnote , 5, 2, $60
	PlayNote Bnote , 5, 2, $60
	PlayNote Bnote , 5, 2, $60
	PlayNote Asharp, 5, 2, $60
	PlayNote Asharp, 5, 2, $30
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $30
	PlayNote Bnote , 5, 2, $48
	PlayNote Bnote , 5, 2, $48
	PlayNote Bnote , 5, 2, $30
	PlayNote Bnote , 5, 2, $48
	PlayNote Bnote , 5, 2, $48
	PlayNote Bnote , 5, 2, $30
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $30
	PlayNote Fsharp, 6, 2, $0c
	PlayNote Fsharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Gsharp, 6, 2, $0c
	PlayNote Gsharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Asharp, 6, 2, $48
	PlayNote Gsharp, 6, 2, $48
	PlayNote Fsharp, 6, 2, $18
	PlayNote Fsharp, 6, 2, $18
	SND_ClearHWRegs $30
	PlayNote Fsharp, 6, 2, $0c
	PlayNote Fsharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Fnote , 6, 2, $0c
	PlayNote Fnote , 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Dsharp, 6, 2, $48
	PlayNote Fnote , 6, 2, $48
	PlayNote Dsharp, 6, 2, $30
	SND_ClearHWRegs $30
	PlayNote Fsharp, 6, 2, $0c
	PlayNote Fsharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Gsharp, 6, 2, $0c
	PlayNote Gsharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Asharp, 6, 2, $48
	PlayNote Gsharp, 6, 2, $48
	PlayNote Fsharp, 6, 2, $18
	PlayNote Fsharp, 6, 6, $18
	SND_ClearHWRegs $30
	PlayNote Fsharp, 6, 2, $0c
	PlayNote Fsharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Fnote , 6, 2, $0c
	PlayNote Fnote , 6, 6, $0c
	SND_ClearHWRegs $18
	PlayNote Dsharp, 6, 2, $0c
	PlayNote Dsharp, 6, 6, $0c
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
	PlayNote Asharp, 6, 2, $0c
	PlayNote Asharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Cnote , 7, 2, $0c
	PlayNote Cnote , 7, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Csharp, 7, 2, $48
	PlayNote Cnote , 7, 2, $48
	PlayNote Asharp, 6, 2, $18
	PlayNote Asharp, 6, 2, $18
	SND_ClearHWRegs $30
	PlayNote Asharp, 6, 2, $0c
	PlayNote Asharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Gsharp, 6, 2, $0c
	PlayNote Gsharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Fsharp, 6, 2, $48
	PlayNote Gsharp, 6, 2, $48
	PlayNote Fsharp, 6, 2, $30
	SND_ClearHWRegs $30
	PlayNote Asharp, 6, 2, $0c
	PlayNote Asharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Cnote , 7, 2, $0c
	PlayNote Cnote , 7, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Csharp, 7, 2, $48
	PlayNote Cnote , 7, 2, $48
	PlayNote Asharp, 6, 2, $18
	PlayNote Asharp, 6, 2, $18
	SND_ClearHWRegs $30
	PlayNote Asharp, 6, 2, $0c
	PlayNote Asharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Gsharp, 6, 2, $0c
	PlayNote Gsharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Fsharp, 6, 2, $24
	PlayNote Fsharp, 6, 6, $24
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	SND_ClearHWRegs $30
	PlayNote Asharp, 6, 2, $0c
	PlayNote Asharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Cnote , 7, 2, $0c
	PlayNote Cnote , 7, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Csharp, 7, 2, $48
	PlayNote Cnote , 7, 2, $48
	PlayNote Asharp, 6, 2, $18
	PlayNote Asharp, 6, 2, $18
	SND_ClearHWRegs $30
	PlayNote Asharp, 6, 2, $0c
	PlayNote Asharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Gsharp, 6, 2, $0c
	PlayNote Gsharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Fsharp, 6, 2, $48
	PlayNote Gsharp, 6, 2, $48
	PlayNote Fsharp, 6, 2, $30
	SND_ClearHWRegs $30
	PlayNote Asharp, 6, 2, $0c
	PlayNote Asharp, 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Cnote , 7, 2, $0c
	PlayNote Cnote , 7, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Csharp, 7, 2, $48
	PlayNote Cnote , 7, 2, $48
	PlayNote Asharp, 6, 2, $30
	SND_ClearHWRegs $30
	PlayNote Asharp, 6, 2, $0c
	PlayNote Asharp, 6, 6, $0c
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gsharp, 6, 2, $0c
	PlayNote Gsharp, 6, 6, $0c
	SND_ClearHWRegs $18
	PlayNote Fsharp, 6, 2, $0c
	PlayNote Fsharp, 6, 6, $0c
	SND_Ret


; unused - $4ae7
	SND_ClearHWRegs $60
	PlayNote Asharp, 5, 2, $60
	PlayNote Asharp, 5, 2, $60
	PlayNote Asharp, 5, 2, $60
	PlayNote Asharp, 5, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $30
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $30
	PlayNote Fsharp, 6, 2, $30
	PlayNote Asharp, 5, 2, $30
	PlayNote Dsharp, 6, 2, $30
	PlayNote Fsharp, 6, 2, $30
	PlayNote Fnote , 6, 2, $30
	PlayNote Gsharp, 5, 2, $30
	PlayNote Csharp, 6, 2, $30
	PlayNote Asharp, 5, 2, $30
	PlayNote Bnote , 5, 2, $60
	PlayNote Bnote , 5, 2, $60
	PlayNote Bnote , 5, 2, $60
	PlayNote Asharp, 5, 2, $60
	PlayNote Gsharp, 5, 2, $60
	PlayNote Gsharp, 5, 2, $60
	PlayNote Gsharp, 5, 2, $60
	PlayNote Gsharp, 5, 2, $60
	PlayNote Asharp, 5, 2, $60
	PlayNote Asharp, 5, 2, $30
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $30
	PlayNote Bnote , 5, 2, $60
	PlayNote Bnote , 5, 2, $60
	PlayNote Bnote , 5, 2, $60
	PlayNote Bnote , 5, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dsharp, 6, 2, $60
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $30
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $30
	PlayNote Dsharp, 6, 2, $30
	PlayNote Asharp, 5, 2, $30
	PlayNote Dsharp, 6, 2, $30
	PlayNote Fsharp, 6, 2, $30
	PlayNote Fnote , 6, 2, $30
	PlayNote Gsharp, 5, 2, $30
	PlayNote Csharp, 6, 2, $30
	PlayNote Fnote , 6, 2, $30
	PlayNote Anote , 5, 2, $60
	PlayNote Anote , 5, 2, $60
	PlayNote Anote , 5, 2, $60
	PlayNote Asharp, 5, 2, $60
	PlayNote Bnote , 5, 2, $60
	PlayNote Bnote , 5, 2, $60
	PlayNote Bnote , 5, 2, $60
	PlayNote Bnote , 5, 2, $60
	PlayNote Asharp, 5, 2, $60
	PlayNote Asharp, 5, 2, $30
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $30
	PlayNote Bnote , 5, 2, $48
	PlayNote Bnote , 5, 2, $48
	PlayNote Bnote , 5, 2, $30
	PlayNote Bnote , 5, 2, $48
	PlayNote Bnote , 5, 2, $48
	PlayNote Bnote , 5, 2, $30
	PlayNote Asharp, 5, 2, $18
	PlayNote Asharp, 5, 2, $18
	SND_ClearHWRegs $60
	PlayNote Asharp, 5, 2, $18
	PlayNote Asharp, 5, 2, $18
	SND_ClearHWRegs $60
	PlayNote Asharp, 5, 2, $18
	PlayNote Asharp, 5, 2, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 5, 2, $18
	PlayNote Asharp, 5, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	PlayNote Asharp, 5, 2, $60
	PlayNote Bnote , 5, 2, $60
	PlayNote Cnote , 6, 2, $30
	PlayNote Cnote , 6, 6, $0c
	PlayNote Dnote , 6, 4, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Fnote , 6, 2, $0c
	PlayNote Gnote , 6, 2, $0c
	PlayNote Gsharp, 6, 1, $0c
	PlayNote Asharp, 6, 0, $0c
	PlayNote Cnote , 7, 2, $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
	PlayNote Cnote , 6, 6, $0c
	PlayNote Dnote , 6, 4, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Fnote , 6, 2, $0c
	PlayNote Gnote , 6, 2, $0c
	PlayNote Gsharp, 6, 1, $0c
	PlayNote Asharp, 6, 4, $18
	PlayNote Asharp, 6, 0, $04
	PlayNote Cnote , 7, 2, $60
	PlayNote Cnote , 7, 2, $30
	PlayNote Bnote , 6, 2, $60
	PlayNote Bnote , 6, 2, $30
	PlayNote Asharp, 5, 2, $30
	PlayNote Bnote , 5, 2, $30
	PlayNote Cnote , 6, 2, $30
	PlayNote Cnote , 6, 6, $0c
	PlayNote Dnote , 6, 4, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Fnote , 6, 2, $0c
	PlayNote Gnote , 6, 2, $0c
	PlayNote Gsharp, 6, 1, $0c
	PlayNote Asharp, 6, 0, $0c
	PlayNote Cnote , 7, 2, $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	PlayNote Cnote , 7, 2, $60
	PlayNote Gnote , 7, 2, $60
	PlayNote Fnote , 7, 2, $48
	PlayNote Dsharp, 7, 2, $48
	PlayNote Dnote , 7, 2, $30
	PlayNote Dsharp, 7, 2, $18
	PlayNote Dnote , 7, 2, $18
	PlayNote Cnote , 7, 2, $60
	PlayNote Cnote , 7, 2, $60
	PlayNote Cnote , 7, 2, $60
	PlayNote Cnote , 7, 2, $30
	PlayNote Cnote , 6, 2, $30
	PlayNote Cnote , 6, 6, $0c
	PlayNote Dnote , 6, 4, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Fnote , 6, 2, $0c
	PlayNote Gnote , 6, 2, $0c
	PlayNote Gsharp, 6, 1, $0c
	PlayNote Asharp, 6, 0, $0c
	PlayNote Cnote , 7, 2, $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
	PlayNote Cnote , 6, 6, $0c
	PlayNote Dnote , 6, 4, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Fnote , 6, 2, $0c
	PlayNote Gnote , 6, 2, $0c
	PlayNote Gsharp, 6, 1, $0c
	PlayNote Asharp, 6, 4, $18
	PlayNote Asharp, 6, 0, $04
	PlayNote Cnote , 7, 2, $60
	PlayNote Cnote , 7, 2, $30
	PlayNote Bnote , 6, 2, $60
	PlayNote Bnote , 6, 2, $30
	PlayNote Asharp, 5, 2, $30
	PlayNote Bnote , 5, 2, $30
	PlayNote Cnote , 6, 2, $30
	PlayNote Cnote , 6, 6, $0c
	PlayNote Dnote , 6, 4, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Fnote , 6, 2, $0c
	PlayNote Gnote , 6, 2, $0c
	PlayNote Gsharp, 6, 1, $0c
	PlayNote Asharp, 6, 0, $0c
	PlayNote Cnote , 7, 2, $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	PlayNote Cnote , 7, 2, $60
	PlayNote Gnote , 7, 2, $60
	PlayNote Fnote , 7, 2, $48
	PlayNote Dsharp, 7, 2, $48
	PlayNote Dnote , 7, 2, $30
	PlayNote Dsharp, 7, 2, $18
	PlayNote Dnote , 7, 2, $18
	PlayNote Cnote , 7, 2, $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
	PlayNote Anote , 5, 1, $60
	PlayNote Bnote , 5, 1, $30
	PlayNote Cnote , 6, 1, $30
	PlayNote Enote , 6, 4, $44
	PlayNote Enote , 6, 1, $30
	PlayNote Enote , 6, 1, $30
	PlayNote Dnote , 6, 1, $30
	PlayNote Cnote , 6, 1, $30
	PlayNote Bnote , 5, 1, $30
	PlayNote Anote , 5, 1, $60
	PlayNote Gnote , 5, 4, $44
	PlayNote Gnote , 5, 1, $30
	PlayNote Gnote , 5, 1, $30
	PlayNote Anote , 5, 1, $60
	PlayNote Bnote , 5, 1, $30
	PlayNote Dnote , 6, 1, $60
	PlayNote Dnote , 6, 4, $44
	PlayNote Dnote , 6, 1, $60
	PlayNote Dnote , 6, 1, $48
	PlayNote Enote , 6, 1, $48
	PlayNote Enote , 6, 1, $30
	SND_ClearHWRegs $18
	PlayNote Enote , 6, 1, $48
	PlayNote Enote , 6, 1, $60
	PlayNote Enote , 6, 1, $30
	PlayNote Gnote , 6, 1, $60
	PlayNote Anote , 6, 1, $60
	PlayNote Gnote , 6, 4, $44
	PlayNote Gnote , 6, 1, $30
	PlayNote Gnote , 6, 1, $30
	PlayNote Gnote , 6, 1, $30
	PlayNote Enote , 6, 1, $60
	PlayNote Enote , 6, 1, $30
	PlayNote Enote , 6, 1, $30
	PlayNote Dsharp, 6, 4, $44
	PlayNote Dsharp, 6, 1, $60
	PlayNote Dsharp, 6, 1, $30
	PlayNote Dsharp, 6, 1, $60
	PlayNote Dsharp, 6, 1, $60
	PlayNote Fnote , 6, 4, $44
	PlayNote Fnote , 6, 1, $30
	PlayNote Fnote , 6, 1, $30
	PlayNote Fnote , 6, 1, $30
	PlayNote Fnote , 6, 1, $60
	PlayNote Fnote , 6, 1, $30
	PlayNote Fnote , 6, 1, $60
	PlayNote Dnote , 6, 1, $30
	PlayNote Gnote , 3, 1, $60
	PlayNote Gnote , 3, 1, $60
	PlayNote Gnote , 3, 1, $60
	PlayNote Gnote , 3, 1, $60
	PlayNote Gnote , 7, 2, $10
	SND_ClearHWRegs $10
	PlayNote Gnote , 7, 2, $10
	PlayNote Bnote , 7, 2, $10
	PlayNote Gnote , 7, 1, $10
	PlayNote Bnote , 7, 1, $10
	PlayNote Dnote , 8, 1, $10
	PlayNote Bnote , 7, 1, $10
	PlayNote Dnote , 8, 1, $10
	PlayNote Gnote , 8, 1, $10
	SND_Ret
	
	
Music02_Wav:
:	SND_SaveEnvelopeValue 0, $20
	SND_SetFreqTableBaseIdx $00
	SND_SetAudTermS01andSO2
	SND_Call WavFunc_001_4d19
	SND_Jump :-


WavFunc_001_4d19:
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	PlayNote Dsharp, 4, 0, $30
	PlayNote Dsharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Dsharp, 4, 0, $30
	PlayNote Dsharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Dsharp, 4, 0, $30
	PlayNote Dsharp, 4, 0, $30
	PlayNote Fnote , 4, 0, $30
	PlayNote Fnote , 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Asharp, 4, 0, $30
	PlayNote Asharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Asharp, 4, 0, $30
	PlayNote Asharp, 4, 0, $30
	PlayNote Dsharp, 4, 0, $30
	PlayNote Dsharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Dsharp, 4, 0, $30
	PlayNote Csharp, 4, 0, $30
	PlayNote Csharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Csharp, 4, 0, $30
	PlayNote Bnote , 3, 0, $30
	PlayNote Bnote , 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Bnote , 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Bnote , 3, 0, $30
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gsharp, 3, 0, $30
	PlayNote Gsharp, 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Gsharp, 3, 0, $30
	PlayNote Gsharp, 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Gsharp, 3, 0, $30
	PlayNote Gsharp, 3, 0, $30
	PlayNote Asharp, 3, 0, $30
	PlayNote Asharp, 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Asharp, 3, 0, $30
	PlayNote Asharp, 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Asharp, 3, 0, $30
	PlayNote Asharp, 3, 0, $30
	PlayNote Bnote , 3, 0, $30
	PlayNote Bnote , 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Bnote , 3, 0, $30
	PlayNote Bnote , 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Bnote , 3, 0, $30
	PlayNote Bnote , 3, 0, $30
	PlayNote Csharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Csharp, 4, 0, $30
	PlayNote Csharp, 4, 0, $30
	PlayNote Dnote , 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Dnote , 4, 0, $30
	PlayNote Dnote , 4, 0, $30
	PlayNote Dsharp, 4, 0, $30
	PlayNote Dsharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Dsharp, 4, 0, $30
	PlayNote Dsharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Dsharp, 4, 0, $30
	PlayNote Dsharp, 4, 0, $30
	PlayNote Csharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Csharp, 4, 0, $30
	PlayNote Fsharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Fsharp, 4, 0, $30
	PlayNote Fsharp, 4, 0, $30
	PlayNote Fsharp, 4, 0, $30
	PlayNote Bnote , 3, 0, $30
	PlayNote Bnote , 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Bnote , 3, 0, $30
	PlayNote Asharp, 3, 0, $30
	PlayNote Asharp, 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Asharp, 3, 0, $30
	PlayNote Anote , 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Anote , 3, 0, $30
	PlayNote Anote , 3, 0, $30
	PlayNote Anote , 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Anote , 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Gsharp, 3, 0, $30
	PlayNote Gsharp, 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Gsharp, 3, 0, $30
	PlayNote Gsharp, 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Gsharp, 3, 0, $30
	PlayNote Gsharp, 3, 0, $30
	PlayNote Asharp, 3, 0, $30
	PlayNote Asharp, 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Asharp, 3, 0, $30
	PlayNote Asharp, 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Asharp, 3, 0, $30
	PlayNote Asharp, 3, 0, $30
	PlayNote Bnote , 3, 0, $30
	PlayNote Bnote , 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Bnote , 3, 0, $30
	PlayNote Bnote , 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Bnote , 3, 0, $30
	PlayNote Bnote , 3, 0, $30
	PlayNote Asharp, 3, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $30
	SND_ClearHWRegs $30
	PlayNote Asharp, 3, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $60
	PlayNote Asharp, 3, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 3, 0, $18
	PlayNote Asharp, 4, 0, $30
	PlayNote Asharp, 3, 0, $10
	PlayNote Asharp, 4, 0, $10
	PlayNote Asharp, 3, 0, $10
	PlayNote Cnote , 5, 0, $18
	PlayNote Cnote , 5, 0, $18
	PlayNote Cnote , 4, 0, $18
	PlayNote Cnote , 5, 0, $18
	PlayNote Csharp, 4, 0, $18
	PlayNote Csharp, 4, 0, $18
	PlayNote Csharp, 4, 0, $18
	PlayNote Csharp, 4, 0, $18
	PlayNote Dnote , 5, 0, $18
	PlayNote Dnote , 4, 0, $18
	PlayNote Dnote , 4, 0, $18
	PlayNote Dnote , 5, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $30
	PlayNote Dsharp, 5, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 3, 0, $18
	PlayNote Gsharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 3, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $30
	PlayNote Dsharp, 5, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Csharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 5, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 3, 0, $18
	PlayNote Gsharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 3, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 5, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 4, 0, $48
	PlayNote Fsharp, 4, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Csharp, 4, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 5, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 3, 0, $18
	PlayNote Gsharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 3, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 5, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Csharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 5, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 3, 0, $18
	PlayNote Gsharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 3, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 5, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Fsharp, 3, 0, $04
	PlayNote Gnote , 3, 0, $04
	PlayNote Gsharp, 3, 0, $04
	PlayNote Anote , 3, 0, $04
	PlayNote Asharp, 3, 0, $04
	PlayNote Bnote , 3, 0, $04
	PlayNote Cnote , 4, 0, $04
	PlayNote Csharp, 4, 0, $04
	PlayNote Dnote , 4, 0, $04
	PlayNote Dsharp, 4, 0, $04
	PlayNote Enote , 4, 0, $04
	PlayNote Fnote , 4, 0, $04
	PlayNote Fsharp, 4, 0, $04
	PlayNote Gnote , 4, 0, $04
	PlayNote Gsharp, 4, 0, $04
	PlayNote Anote , 4, 0, $04
	PlayNote Asharp, 4, 0, $04
	PlayNote Bnote , 4, 0, $04
	SND_ClearHWRegs $28
	SND_ClearHWRegs $18
	PlayNote Asharp, 3, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 5, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 3, 0, $18
	PlayNote Gsharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 3, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $30
	PlayNote Dsharp, 5, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Csharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 5, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 3, 0, $18
	PlayNote Gsharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 3, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 5, 0, $18
	PlayNote Dsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 4, 0, $18
	SND_Ret


; unused - $4fce
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 4, 0, $30
	PlayNote Fsharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Fsharp, 4, 0, $30
	PlayNote Fsharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Fsharp, 4, 0, $30
	PlayNote Fsharp, 4, 0, $30
	PlayNote Fnote , 4, 0, $30
	PlayNote Fnote , 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Asharp, 4, 0, $30
	PlayNote Asharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Asharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Dsharp, 4, 0, $30
	PlayNote Dsharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Dsharp, 4, 0, $30
	PlayNote Csharp, 4, 0, $30
	PlayNote Csharp, 4, 0, $30
	SND_ClearHWRegs $30
	PlayNote Csharp, 4, 0, $30
	PlayNote Bnote , 3, 0, $18
	PlayNote Bnote , 3, 0, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 3, 0, $30
	SND_ClearHWRegs $30
	PlayNote Bnote , 3, 0, $48
	SND_ClearHWRegs $18
	PlayNote Asharp, 3, 0, $48
	SND_ClearHWRegs $18
	PlayNote Gsharp, 3, 0, $60
	PlayNote Gsharp, 3, 0, $60
	PlayNote Gsharp, 3, 0, $60
	PlayNote Gsharp, 3, 0, $60
	PlayNote Asharp, 3, 0, $60
	PlayNote Asharp, 3, 0, $60
	PlayNote Asharp, 3, 0, $60
	PlayNote Asharp, 3, 0, $60
	PlayNote Bnote , 3, 0, $60
	PlayNote Bnote , 3, 0, $60
	PlayNote Bnote , 3, 0, $60
	PlayNote Bnote , 3, 0, $60
	PlayNote Csharp, 4, 0, $60
	PlayNote Csharp, 4, 0, $60
	PlayNote Dnote , 4, 0, $60
	PlayNote Dnote , 4, 0, $60
	PlayNote Dsharp, 4, 0, $60
	PlayNote Dsharp, 4, 0, $60
	PlayNote Dsharp, 4, 0, $60
	PlayNote Dsharp, 4, 0, $60
	PlayNote Csharp, 4, 0, $60
	PlayNote Csharp, 4, 0, $30
	PlayNote Fsharp, 4, 0, $60
	PlayNote Fsharp, 4, 0, $60
	PlayNote Fsharp, 4, 0, $30
	PlayNote Bnote , 3, 0, $60
	PlayNote Bnote , 3, 0, $60
	PlayNote Asharp, 3, 0, $60
	PlayNote Asharp, 3, 0, $60
	PlayNote Anote , 3, 0, $60
	PlayNote Anote , 3, 0, $60
	PlayNote Anote , 3, 0, $60
	PlayNote Anote , 3, 0, $60
	PlayNote Gsharp, 3, 0, $60
	PlayNote Gsharp, 3, 0, $60
	PlayNote Gsharp, 3, 0, $60
	PlayNote Gsharp, 3, 0, $60
	PlayNote Asharp, 3, 0, $60
	PlayNote Asharp, 3, 0, $60
	PlayNote Asharp, 3, 0, $60
	PlayNote Asharp, 3, 0, $60
	PlayNote Bnote , 3, 0, $60
	PlayNote Bnote , 3, 0, $60
	PlayNote Bnote , 3, 0, $60
	PlayNote Bnote , 3, 0, $60
	PlayNote Asharp, 3, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 0, $0c
	SND_ClearHWRegs $60
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 0, $0c
	SND_ClearHWRegs $60
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 0, $0c
	SND_ClearHWRegs $24
	PlayNote Asharp, 3, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 0, $0c
	SND_ClearHWRegs $60
	SND_ClearHWRegs $54
	PlayNote Asharp, 3, 0, $60
	PlayNote Bnote , 3, 0, $60
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 5, 0, $48
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 5, 0, $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Cnote , 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dnote , 4, 0, $48
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Fnote , 4, 0, $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Fnote , 4, 0, $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Dnote , 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 5, 0, $48
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 5, 0, $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Cnote , 4, 0, $18
	PlayNote Dnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dnote , 4, 0, $18
	PlayNote Dnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dnote , 4, 0, $18
	PlayNote Gnote , 4, 0, $30
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Fnote , 4, 0, $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Fnote , 4, 0, $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Dnote , 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 5, 0, $48
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 5, 0, $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Cnote , 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dnote , 4, 0, $48
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fnote , 4, 0, $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $18
	PlayNote Gnote , 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Dnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Bnote , 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 5, 0, $18
	PlayNote Bnote , 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 4, 0, $18
	PlayNote Anote , 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gsharp, 3, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 4, 0, $30
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $30
	PlayNote Cnote , 5, 0, $48
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 5, 0, $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Cnote , 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dnote , 4, 0, $48
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Fnote , 4, 0, $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Fnote , 4, 0, $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Dnote , 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 5, 0, $48
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 5, 0, $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Cnote , 4, 0, $18
	PlayNote Dnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dnote , 4, 0, $18
	PlayNote Dnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dnote , 4, 0, $18
	PlayNote Gnote , 4, 0, $30
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Fnote , 4, 0, $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Fnote , 4, 0, $18
	PlayNote Dsharp, 4, 0, $18
	PlayNote Dnote , 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $30
	PlayNote Cnote , 5, 0, $48
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 5, 0, $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Cnote , 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 3, 0, $30
	PlayNote Dnote , 4, 0, $48
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fnote , 4, 0, $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $18
	PlayNote Gnote , 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Dnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Bnote , 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 5, 0, $18
	PlayNote Bnote , 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 4, 0, $18
	PlayNote Anote , 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gsharp, 3, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 5, 0, $18
	PlayNote Bnote , 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 4, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 4, 0, $18
	PlayNote Anote , 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gsharp, 3, 0, $18
	PlayNote Asharp, 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Anote , 3, 0, $60
	PlayNote Anote , 4, 0, $30
	SND_ClearHWRegs $18
	PlayNote Anote , 3, 0, $30
	SND_ClearHWRegs $18
	PlayNote Enote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Anote , 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fnote , 4, 4, $44
	PlayNote Fnote , 4, 0, $60
	PlayNote Fnote , 4, 0, $30
	SND_ClearHWRegs $18
	PlayNote Fnote , 4, 0, $30
	SND_ClearHWRegs $18
	PlayNote Fnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 4, 0, $30
	PlayNote Gnote , 4, 4, $44
	PlayNote Gnote , 4, 0, $60
	PlayNote Gnote , 4, 0, $24
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 0, $18
	PlayNote Gnote , 4, 0, $18
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Enote , 2, 4, $44
	PlayNote Enote , 2, 0, $60
	PlayNote Enote , 2, 0, $30
	PlayNote Enote , 2, 0, $30
	SND_ClearHWRegs $30
	PlayNote Enote , 2, 0, $3c
	SND_ClearHWRegs $0c
	PlayNote Dsharp, 4, 0, $3c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 0, $60
	PlayNote Dnote , 4, 0, $30
	PlayNote Dnote , 4, 0, $60
	PlayNote Anote , 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Enote , 2, 4, $44
	PlayNote Enote , 2, 0, $60
	PlayNote Enote , 2, 0, $30
	PlayNote Enote , 2, 0, $60
	PlayNote Bnote , 3, 0, $18
	SND_ClearHWRegs $18
	PlayNote Enote , 2, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fnote , 4, 4, $44
	PlayNote Fnote , 4, 0, $60
	PlayNote Fnote , 4, 0, $30
	PlayNote Fnote , 4, 0, $60
	PlayNote Cnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 4, $44
	PlayNote Gnote , 4, 0, $30
	PlayNote Dnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dnote , 4, 0, $60
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dnote , 4, 0, $60
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $18
	SND_Ret
	
	
Music02_Noise:
:	SND_SaveEnvelopeValue 0, $a1
	SND_SaveEnvelopeValue 1, $46
	SND_SetNoiseDividingRatioOfFreqs 1
	SND_SetAudTermS01andSO2
	SND_ClearHWRegs $78
	SND_SetAudTermS01
	NoiseSCF $02
	NoiseSCF $00
	SND_SetAudTermS01andSO2
	NoiseSCF $02
	NoiseSCF $20
	SND_ClearHWRegs $10
	SND_SetAudTermS01
	NoiseSCF $02
	NoiseSCF $00
	SND_SetAudTermS01andSO2
	NoiseSCF $02
	NoiseSCF $20
	SND_ClearHWRegs $10
	SND_SetAudTermS01
	NoiseSCF $02
	NoiseSCF $00
	SND_SetAudTermS01andSO2
	NoiseSCF $02
	NoiseSCF $20
	SND_ClearHWRegs $10
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Jump :-


NoiseFunc_001_53c0:
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	SND_Ret


; unused - $5401
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $02
	NoiseSCF $03
	SND_ClearHWRegs $08
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	SND_ClearHWRegs $30
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	SND_ClearHWRegs $30
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	SND_ClearHWRegs $30
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	SND_ClearHWRegs $30
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	SND_ClearHWRegs $30
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	SND_ClearHWRegs $30
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	SND_ClearHWRegs $30
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $11
	NoiseSCF $02
	NoiseSCF $03
	NoiseSCF $0f
	NoiseSCF $01
	NoiseSCF $02
	NoiseSCF $01
	NoiseSCF $0f
	NoiseSCF $03
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $00
	NoiseSCF $0f
	NoiseSCF $00
	NoiseSCF $06
	NoiseSCF $03
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	SND_ClearHWRegs $30
	NoiseSCF $03
	NoiseSCF $05
	NoiseSCF $03
	NoiseSCF $17
	NoiseSCF $03
	NoiseSCF $05
	NoiseSCF $03
	NoiseSCF $05
	NoiseSCF $03
	NoiseSCF $17
	NoiseSCF $03
	NoiseSCF $05
	NoiseSCF $03
	NoiseSCF $05
	NoiseSCF $03
	NoiseSCF $05
	SND_ClearHWRegs $30
	NoiseSCF $03
	NoiseSCF $05
	NoiseSCF $03
	NoiseSCF $17
	NoiseSCF $03
	NoiseSCF $10
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $01
	NoiseSCF $06
	NoiseSCF $03
	NoiseSCF $06
	NoiseSCF $0b
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $0b
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $00
	NoiseSCF $06
	NoiseSCF $03
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $00
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $06
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $0b
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $09
	NoiseSCF $16
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $0b
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $00
	NoiseSCF $06
	NoiseSCF $17
	NoiseSCF $06
	NoiseSCF $0f
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $02
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $00
	NoiseSCF $0f
	NoiseSCF $00
	NoiseSCF $06
	NoiseSCF $03
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $17
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $17
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $0b
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $0b
	NoiseSCF $06
	NoiseSCF $01
	NoiseSCF $06
	NoiseSCF $00
	NoiseSCF $0f
	NoiseSCF $03
	NoiseSCF $06
	NoiseSCF $03
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $04
	NoiseSCF $05
	NoiseSCF $04
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $0b
	NoiseSCF $06
	NoiseSCF $17
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $04
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $06
	NoiseSCF $00
	NoiseSCF $09
	NoiseSCF $00
	NoiseSCF $06
	NoiseSCF $03
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $04
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $04
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $04
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $04
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $04
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $04
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $06
	NoiseSCF $05
	NoiseSCF $0d
	NoiseSCF $05
	NoiseSCF $09
	NoiseSCF $05
	NoiseSCF $0f
	NoiseSCF $0b
	NoiseSCF $0f
	NoiseSCF $0b
	NoiseSCF $0f
	NoiseSCF $0b
	NoiseSCF $0f
	NoiseSCF $0b
	NoiseSCF $0f
	NoiseSCF $0b
	NoiseSCF $0f
	NoiseSCF $0b
	NoiseSCF $0f
	NoiseSCF $0b
	NoiseSCF $0f
	NoiseSCF $0b
	SND_Ret
	
	
Music03_SQ1:
:	SND_SaveEnvelopeValue 1, $c6
	SND_SaveEnvelopeValue 0, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet75Wave1
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $03
	SND_Call SquareFunc_001_42bc
	SND_Jump :-


Music03_SQ2:
:	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 3, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet75Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAlternatingAudTerm 1
	SND_ClearHWRegs $60
	SND_Stop


; unused - $6025
	SND_Call SquareFunc_001_47ac
	SND_Jump :-


Music03_Wav:
:	SND_SaveEnvelopeValue 0, $20
	SND_SetFreqTableBaseIdx $00
	SND_SetAudTermS01andSO2
	SND_ClearHWRegs $60
	SND_Stop


; unused - $6033
	SND_Call WavFunc_001_4d19
	SND_Jump :-


Music03_Noise:
:	SND_SaveEnvelopeValue 0, $a1
	SND_SaveEnvelopeValue 1, $46
	SND_SetNoiseDividingRatioOfFreqs 1
	SND_SetAudTermS01andSO2
	SND_ClearHWRegs $60
	SND_Stop


; unused - $6042
	SND_ClearHWRegs $78
	NoiseSCF $02
	NoiseSCF $00
	SND_SetAlternatingAudTerm 1
	NoiseSCF $02
	NoiseSCF $20
	SND_ClearHWRegs $10
	SND_SetAudTermS01andSO2
	NoiseSCF $02
	NoiseSCF $00
	SND_SetAlternatingAudTerm 1
	NoiseSCF $02
	NoiseSCF $20
	SND_ClearHWRegs $10
	SND_SetAudTermS01andSO2
	NoiseSCF $02
	NoiseSCF $00
	SND_SetAlternatingAudTerm 1
	NoiseSCF $02
	NoiseSCF $20
	SND_ClearHWRegs $10
	SND_SetAudTermS01andSO2
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Call NoiseFunc_001_53c0
	SND_Jump :-


Music04_SQ1:
	SND_SaveEnvelopeValue 2, $66
	SND_SaveEnvelopeValue 3, $60
	SND_SaveEnvelopeValue 4, $46
	SND_SaveEnvelopeValue 5, $20
	SND_SaveEnvelopeValue 6, $a0
	SND_SaveEnvelopeValue 1, $c6
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	PlayNote Csharp, 7, 1, $30
	PlayNote Csharp, 7, 1, $18
	PlayNote Enote , 7, 1, $30
	PlayNote Enote , 7, 1, $18
	PlayNote Anote , 6, 1, $18
	PlayNote Anote , 6, 3, $18
	PlayNote Gsharp, 6, 1, $48
	PlayNote Gsharp, 6, 3, $18
	PlayNote Enote , 6, 1, $48
	PlayNote Enote , 6, 3, $18
	PlayNote Fsharp, 6, 6, $60
	PlayNote Fsharp, 6, 6, $60
	PlayNote Fsharp, 6, 1, $18
	PlayNote Fsharp, 6, 3, $18
	PlayNote Fsharp, 6, 1, $18
	PlayNote Fsharp, 6, 3, $18
	SND_ClearHWRegs $60
	PlayNote Anote , 6, 1, $30
	PlayNote Anote , 6, 1, $18
	PlayNote Fsharp, 7, 1, $30
	PlayNote Fsharp, 7, 1, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 3, $18
	PlayNote Dnote , 7, 1, $48
	PlayNote Dnote , 7, 3, $18
	PlayNote Csharp, 7, 1, $48
	PlayNote Csharp, 7, 3, $18
	PlayNote Csharp, 7, 6, $60
	PlayNote Csharp, 7, 1, $30
	PlayNote Bnote , 6, 1, $18
	PlayNote Anote , 6, 1, $18
	PlayNote Bnote , 6, 1, $60
	PlayNote Bnote , 6, 1, $30
	PlayNote Bnote , 6, 1, $18
	PlayNote Bnote , 6, 3, $18
	PlayNote Bnote , 6, 1, $30
	PlayNote Bnote , 6, 1, $18
	PlayNote Dnote , 7, 1, $30
	PlayNote Dnote , 7, 1, $18
	PlayNote Csharp, 7, 1, $18
	PlayNote Csharp, 7, 2, $18
	PlayNote Gsharp, 6, 1, $48
	PlayNote Gsharp, 6, 2, $18
	PlayNote Csharp, 6, 1, $60
	PlayNote Gsharp, 6, 6, $60
	PlayNote Gsharp, 6, 1, $30
	PlayNote Anote , 6, 1, $18
	PlayNote Bnote , 6, 1, $18
	PlayNote Anote , 6, 1, $48
	PlayNote Anote , 6, 3, $18
	PlayNote Enote , 6, 1, $48
	PlayNote Enote , 6, 3, $18
	PlayNote Fsharp, 6, 1, $30
	PlayNote Fsharp, 6, 1, $18
	PlayNote Dnote , 6, 6, $30
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 3, $18
	PlayNote Csharp, 7, 1, $48
	PlayNote Csharp, 7, 3, $18
	PlayNote Anote , 6, 1, $48
	PlayNote Anote , 6, 3, $18
	PlayNote Bnote , 6, 1, $30
	PlayNote Bnote , 6, 1, $18
	PlayNote Gsharp, 6, 1, $30
	PlayNote Gsharp, 6, 3, $18
	PlayNote Fsharp, 6, 6, $18
	PlayNote Fsharp, 6, 1, $18
	PlayNote Enote , 6, 6, $60
	PlayNote Enote , 6, 1, $30
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 3, $18
	PlayNote Csharp, 7, 1, $30
	PlayNote Csharp, 7, 1, $18
	PlayNote Enote , 7, 1, $30
	PlayNote Enote , 7, 3, $18
	PlayNote Anote , 6, 1, $18
	PlayNote Anote , 6, 3, $18
	PlayNote Gsharp, 6, 1, $48
	PlayNote Gsharp, 6, 3, $18
	PlayNote Enote , 6, 1, $48
	PlayNote Enote , 6, 3, $18
	PlayNote Fsharp, 6, 6, $60
	PlayNote Fsharp, 6, 6, $60
	PlayNote Fsharp, 6, 1, $18
	PlayNote Fsharp, 6, 3, $18
	PlayNote Fsharp, 6, 1, $18
	PlayNote Fsharp, 6, 3, $18
	SND_ClearHWRegs $60
	PlayNote Anote , 6, 1, $30
	PlayNote Anote , 6, 1, $18
	PlayNote Fsharp, 7, 1, $30
	PlayNote Fsharp, 7, 3, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 3, $18
	PlayNote Dnote , 7, 1, $48
	PlayNote Dnote , 7, 3, $18
	PlayNote Csharp, 7, 1, $48
	PlayNote Csharp, 7, 3, $18
	PlayNote Csharp, 7, 6, $60
	PlayNote Csharp, 7, 1, $30
	PlayNote Bnote , 6, 1, $18
	PlayNote Anote , 6, 1, $18
	PlayNote Bnote , 6, 6, $60
	PlayNote Bnote , 6, 1, $30
	PlayNote Bnote , 6, 1, $18
	PlayNote Bnote , 6, 3, $18
	PlayNote Bnote , 6, 1, $30
	PlayNote Bnote , 6, 1, $18
	PlayNote Dnote , 7, 1, $30
	PlayNote Dnote , 7, 1, $18
	PlayNote Csharp, 7, 1, $18
	PlayNote Csharp, 7, 3, $18
	PlayNote Gsharp, 6, 1, $48
	PlayNote Gsharp, 6, 3, $18
	PlayNote Csharp, 6, 1, $60
	PlayNote Gsharp, 6, 6, $60
	PlayNote Gsharp, 6, 1, $30
	PlayNote Anote , 6, 1, $18
	PlayNote Bnote , 6, 3, $18
	PlayNote Anote , 6, 1, $48
	PlayNote Anote , 6, 3, $18
	PlayNote Enote , 6, 1, $48
	PlayNote Enote , 6, 3, $18
	PlayNote Fsharp, 6, 1, $30
	PlayNote Fsharp, 6, 1, $18
	PlayNote Dnote , 6, 1, $30
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 3, $18
	PlayNote Csharp, 7, 1, $30
	PlayNote Csharp, 7, 1, $18
	PlayNote Bnote , 6, 1, $48
	PlayNote Bnote , 6, 3, $18
	PlayNote Anote , 6, 1, $0c
	PlayNote Gsharp, 6, 3, $0c
	PlayNote Anote , 6, 6, $60
	PlayNote Anote , 6, 6, $60
	PlayNote Anote , 6, 6, $60
	PlayNote Anote , 6, 1, $60
	PlayNote Csharp, 7, 1, $30
	PlayNote Csharp, 7, 1, $18
	PlayNote Enote , 7, 1, $30
	PlayNote Enote , 7, 3, $18
	PlayNote Anote , 6, 1, $18
	PlayNote Anote , 6, 3, $18
	PlayNote Gsharp, 6, 1, $48
	PlayNote Gsharp, 6, 3, $18
	PlayNote Enote , 6, 1, $48
	PlayNote Enote , 6, 3, $18
	PlayNote Fsharp, 6, 6, $60
	PlayNote Fsharp, 6, 6, $60
	PlayNote Fsharp, 6, 6, $18
	PlayNote Fsharp, 6, 3, $18
	PlayNote Fsharp, 6, 1, $18
	PlayNote Fsharp, 6, 3, $18
	SND_ClearHWRegs $60
	PlayNote Anote , 6, 1, $30
	PlayNote Anote , 6, 1, $18
	PlayNote Fsharp, 7, 1, $30
	PlayNote Fsharp, 7, 3, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 3, $18
	PlayNote Dnote , 7, 1, $48
	PlayNote Dnote , 7, 3, $18
	PlayNote Csharp, 7, 1, $48
	PlayNote Csharp, 7, 3, $18
	PlayNote Csharp, 7, 6, $60
	PlayNote Csharp, 7, 1, $30
	PlayNote Bnote , 6, 1, $18
	PlayNote Anote , 6, 1, $18
	PlayNote Bnote , 6, 6, $60
	PlayNote Bnote , 6, 1, $30
	PlayNote Bnote , 6, 1, $18
	PlayNote Bnote , 6, 3, $18
	PlayNote Bnote , 6, 1, $30
	PlayNote Bnote , 6, 1, $18
	PlayNote Dnote , 7, 1, $30
	PlayNote Dnote , 7, 1, $18
	PlayNote Csharp, 7, 1, $18
	PlayNote Csharp, 7, 3, $18
	PlayNote Gsharp, 6, 1, $48
	PlayNote Gsharp, 6, 3, $18
	PlayNote Csharp, 6, 1, $60
	PlayNote Gsharp, 6, 6, $60
	PlayNote Gsharp, 6, 1, $30
	PlayNote Anote , 6, 1, $18
	PlayNote Bnote , 6, 1, $18
	PlayNote Anote , 6, 1, $48
	PlayNote Anote , 6, 3, $18
	PlayNote Enote , 6, 1, $48
	PlayNote Enote , 6, 3, $18
	PlayNote Fsharp, 6, 1, $30
	PlayNote Fsharp, 6, 1, $18
	PlayNote Dnote , 6, 1, $30
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 3, $18
	PlayNote Csharp, 7, 1, $48
	PlayNote Csharp, 7, 3, $18
	PlayNote Anote , 6, 1, $48
	PlayNote Anote , 6, 3, $18
	PlayNote Bnote , 6, 1, $30
	PlayNote Bnote , 6, 1, $18
	PlayNote Gsharp, 6, 1, $30
	PlayNote Gsharp, 6, 3, $18
	PlayNote Fsharp, 6, 1, $18
	PlayNote Fsharp, 6, 3, $18
	PlayNote Enote , 6, 6, $60
	PlayNote Enote , 6, 1, $30
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 3, $18
	PlayNote Enote , 7, 1, $30
	PlayNote Enote , 7, 1, $18
	PlayNote Gnote , 7, 6, $30
	PlayNote Gnote , 7, 1, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 3, $18
	PlayNote Bnote , 6, 6, $48
	PlayNote Bnote , 6, 1, $18
	PlayNote Gnote , 6, 6, $48
	PlayNote Gnote , 6, 1, $18
	PlayNote Anote , 6, 6, $60
	PlayNote Anote , 6, 6, $60
	PlayNote Anote , 6, 6, $60
	PlayNote Anote , 6, 1, $18
	PlayNote Anote , 6, 3, $18
	PlayNote Anote , 6, 1, $18
	PlayNote Anote , 6, 3, $18
	PlayNote Cnote , 7, 1, $30
	PlayNote Cnote , 7, 1, $18
	PlayNote Anote , 7, 1, $30
	PlayNote Anote , 7, 1, $18
	PlayNote Gnote , 7, 1, $18
	PlayNote Gnote , 7, 3, $18
	PlayNote Fnote , 7, 1, $48
	PlayNote Fnote , 7, 3, $18
	PlayNote Enote , 7, 1, $48
	PlayNote Enote , 7, 3, $18
	PlayNote Enote , 7, 6, $60
	PlayNote Enote , 7, 1, $30
	PlayNote Dnote , 7, 1, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Dnote , 7, 1, $48
	PlayNote Dnote , 7, 3, $18
	PlayNote Enote , 7, 1, $48
	PlayNote Enote , 7, 3, $18
	PlayNote Cnote , 7, 1, $30
	PlayNote Cnote , 7, 1, $18
	PlayNote Enote , 7, 1, $30
	PlayNote Enote , 7, 1, $18
	PlayNote Cnote , 8, 1, $18
	PlayNote Cnote , 8, 3, $18
	PlayNote Bnote , 7, 1, $30
	PlayNote Bnote , 7, 3, $18
	PlayNote Anote , 7, 1, $30
	PlayNote Anote , 7, 3, $18
	PlayNote Bnote , 7, 1, $18
	PlayNote Cnote , 8, 3, $18
	PlayNote Gnote , 7, 1, $18
	PlayNote Gnote , 7, 3, $18
	PlayNote Gnote , 7, 1, $18
	PlayNote Anote , 7, 3, $18
	PlayNote Enote , 7, 6, $60
	PlayNote Enote , 7, 1, $60
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 3, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Gnote , 7, 1, $18
	PlayNote Cnote , 8, 1, $30
	PlayNote Cnote , 8, 1, $18
	PlayNote Cnote , 8, 3, $18
	PlayNote Gnote , 7, 1, $30
	PlayNote Gnote , 7, 1, $18
	PlayNote Gnote , 7, 3, $18
	PlayNote Enote , 8, 1, $30
	PlayNote Enote , 8, 1, $18
	PlayNote Fnote , 8, 6, $30
	PlayNote Fnote , 8, 1, $18
	PlayNote Dnote , 8, 1, $18
	PlayNote Dnote , 8, 3, $18
	PlayNote Enote , 8, 6, $60
	PlayNote Enote , 8, 6, $60
	PlayNote Enote , 8, 6, $60
	PlayNote Enote , 8, 6, $60
	PlayNote Enote , 8, 6, $60
	PlayNote Enote , 8, 6, $60
	PlayNote Enote , 8, 6, $60
	PlayNote Enote , 8, 6, $60
	PlayNote Enote , 8, 6, $60
	PlayNote Enote , 8, 6, $60
	PlayNote Enote , 8, 6, $60
	PlayNote Enote , 8, 6, $60
	PlayNote Enote , 8, 6, $60
	PlayNote Enote , 8, 6, $60
	PlayNote Enote , 8, 1, $60
	SND_ClearHWRegs $60
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 3, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 3, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 3, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 3, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 3, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 3, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 3, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 3, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Gsharp, 6, 3, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Gsharp, 6, 3, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Gsharp, 6, 3, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Gsharp, 6, 3, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Gsharp, 6, 3, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Gsharp, 6, 3, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Gsharp, 6, 3, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Gsharp, 6, 3, $18
	PlayNote Gnote , 6, 6, $60
	PlayNote Gnote , 6, 6, $60
	PlayNote Gnote , 6, 6, $60
	PlayNote Gnote , 6, 6, $60
	PlayNote Gnote , 6, 6, $60
	PlayNote Gnote , 6, 6, $60
	PlayNote Gnote , 6, 6, $60
	PlayNote Gnote , 6, 6, $60
	PlayNote Gnote , 6, 6, $60
	PlayNote Gnote , 6, 6, $60
	PlayNote Gnote , 6, 1, $60
	SND_ClearHWRegs $60
	SND_Stop


Music04_SQ2:
	SND_SaveEnvelopeValue 2, $c6
	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 0, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 6, $a0
	SND_SaveEnvelopeValue 3, $60
	SND_SquareSet25Wave2
	SND_SetAlternatingAudTerm 1
	SND_SetFreqTableBaseIdx $e8
	SND_Call SquareFunc_001_6e6e
	SND_Call SquareFunc_001_6e6e
	SND_Call SquareFunc_001_6e6e
	SND_Call SquareFunc_001_6e6e
	SND_Call SquareFunc_001_6e6e
	SND_Call SquareFunc_001_6e6e
	SND_SetFreqTableBaseIdx $ea
	SND_Call SquareFunc_001_6e6e
	SND_SetFreqTableBaseIdx $e8
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 5, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 4, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 1, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 4, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Gsharp, 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Gsharp, 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Gsharp, 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Gsharp, 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Gsharp, 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Gsharp, 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Gsharp, 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Gsharp, 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Gsharp, 4, 1, $08
	SND_ClearHWRegs $04
	PlayNote Gsharp, 4, 4, $08
	SND_ClearHWRegs $04
	PlayNote Csharp, 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Csharp, 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Csharp, 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Csharp, 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Csharp, 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Fnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Fsharp, 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fsharp, 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Fsharp, 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Fsharp, 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Fsharp, 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fsharp, 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Fsharp, 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Fsharp, 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Fsharp, 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fsharp, 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 1, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 4, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 1, $2c
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Gnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Gnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Fnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Gnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Gnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Gnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 5, 1, $08
	SND_ClearHWRegs $10
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 4, $08
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 3, $60
	PlayNote Cnote , 5, 3, $60
	PlayNote Cnote , 5, 3, $60
	PlayNote Cnote , 5, 3, $60
	PlayNote Cnote , 5, 3, $60
	PlayNote Cnote , 5, 3, $60
	PlayNote Cnote , 5, 3, $60
	PlayNote Cnote , 5, 3, $60
	PlayNote Cnote , 5, 3, $60
	PlayNote Cnote , 5, 3, $60
	PlayNote Cnote , 5, 3, $60
	SND_ClearHWRegs $60
	SND_Stop


SquareFunc_001_6e6e:
	PlayNote Anote , 4, 4, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 3, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 4, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 3, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 4, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 3, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 4, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 3, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 4, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 3, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 4, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 3, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 4, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 3, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 4, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 4, 3, $08
	SND_ClearHWRegs $10
	SND_Ret
	
	
Music04_Wav:
	SND_SaveEnvelopeValue 2, $20
	SND_SetAudTermS01andSO2
	SND_SetFreqTableBaseIdx $e8
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 3, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 3, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 3, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 3, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 3, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 3, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 3, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 3, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fsharp, 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Csharp, 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Enote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Cnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Cnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Cnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Gnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Fnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Dnote , 8, 2, $08
	SND_ClearHWRegs $10
	PlayNote Bnote , 7, 2, $08
	SND_ClearHWRegs $10
	PlayNote Anote , 6, 2, $60
	PlayNote Anote , 6, 2, $58
	SND_ClearHWRegs $08
	PlayNote Csharp, 7, 2, $60
	PlayNote Csharp, 7, 2, $58
	SND_ClearHWRegs $08
	PlayNote Anote , 6, 2, $2c
	SND_ClearHWRegs $04
	PlayNote Anote , 7, 2, $14
	SND_ClearHWRegs $34
	PlayNote Gsharp, 7, 2, $14
	SND_ClearHWRegs $34
	PlayNote Fsharp, 7, 2, $14
	SND_ClearHWRegs $34
	PlayNote Enote , 7, 2, $14
	SND_ClearHWRegs $34
	PlayNote Csharp, 7, 2, $14
	SND_ClearHWRegs $1c
	PlayNote Bnote , 5, 2, $58
	SND_ClearHWRegs $08
	PlayNote Dnote , 6, 2, $58
	SND_ClearHWRegs $08
	PlayNote Fsharp, 6, 2, $58
	SND_ClearHWRegs $08
	PlayNote Anote , 6, 2, $58
	SND_ClearHWRegs $08
	PlayNote Gsharp, 6, 2, $60
	PlayNote Gsharp, 6, 2, $58
	SND_ClearHWRegs $08
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $58
	SND_ClearHWRegs $08
	PlayNote Fsharp, 6, 2, $60
	PlayNote Fsharp, 6, 2, $28
	SND_ClearHWRegs $08
	PlayNote Gsharp, 6, 2, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 6, 2, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 2, $58
	SND_ClearHWRegs $08
	PlayNote Gsharp, 6, 2, $58
	SND_ClearHWRegs $08
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $58
	SND_ClearHWRegs $08
	PlayNote Csharp, 7, 2, $60
	PlayNote Csharp, 7, 2, $58
	SND_ClearHWRegs $08
	PlayNote Dnote , 7, 2, $44
	SND_ClearHWRegs $04
	PlayNote Anote , 6, 2, $44
	SND_ClearHWRegs $04
	PlayNote Fsharp, 7, 2, $2c
	SND_ClearHWRegs $04
	PlayNote Enote , 7, 2, $58
	SND_ClearHWRegs $08
	PlayNote Csharp, 7, 2, $58
	SND_ClearHWRegs $08
	PlayNote Dnote , 7, 2, $44
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 2, $44
	SND_ClearHWRegs $04
	PlayNote Anote , 6, 2, $2c
	SND_ClearHWRegs $04
	PlayNote Gsharp, 6, 2, $60
	PlayNote Gsharp, 6, 2, $58
	SND_ClearHWRegs $08
	PlayNote Gnote , 6, 2, $60
	PlayNote Gnote , 6, 2, $58
	SND_ClearHWRegs $08
	PlayNote Enote , 6, 4, $60
	PlayNote Enote , 6, 4, $60
	PlayNote Enote , 6, 2, $2c
	SND_ClearHWRegs $04
	PlayNote Cnote , 8, 2, $14
	SND_ClearHWRegs $34
	PlayNote Bnote , 7, 2, $14
	SND_ClearHWRegs $34
	PlayNote Anote , 7, 2, $14
	SND_ClearHWRegs $34
	PlayNote Gnote , 7, 2, $14
	SND_ClearHWRegs $34
	PlayNote Enote , 7, 2, $14
	SND_ClearHWRegs $1c
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $5c
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 2, $2c
	SND_ClearHWRegs $04
	PlayNote Dnote , 8, 2, $14
	SND_ClearHWRegs $34
	PlayNote Cnote , 8, 2, $14
	SND_ClearHWRegs $34
	PlayNote Bnote , 7, 2, $14
	SND_ClearHWRegs $34
	PlayNote Gsharp, 7, 2, $14
	SND_ClearHWRegs $34
	PlayNote Enote , 7, 2, $14
	SND_ClearHWRegs $1c
	PlayNote Fnote , 6, 2, $44
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 2, $44
	SND_ClearHWRegs $04
	PlayNote Fnote , 7, 2, $2c
	SND_ClearHWRegs $04
	PlayNote Enote , 7, 2, $44
	SND_ClearHWRegs $04
	PlayNote Dnote , 7, 2, $44
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 2, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 7, 2, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 7, 2, $44
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 2, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 2, $60
	PlayNote Gnote , 6, 2, $60
	PlayNote Gnote , 6, 2, $2c
	SND_ClearHWRegs $04
	PlayNote Fnote , 6, 2, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 2, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 2, $58
	SND_ClearHWRegs $08
	PlayNote Dnote , 7, 2, $44
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 2, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 2, $08
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 2, $44
	SND_ClearHWRegs $04
	PlayNote Dnote , 7, 2, $44
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 2, $2c
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 2, $60
	PlayNote Cnote , 7, 2, $60
	PlayNote Cnote , 7, 2, $60
	PlayNote Cnote , 7, 2, $60
	PlayNote Cnote , 7, 2, $60
	PlayNote Cnote , 7, 2, $60
	PlayNote Cnote , 7, 2, $60
	PlayNote Cnote , 7, 2, $5c
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 2, $60
	PlayNote Gnote , 6, 2, $60
	PlayNote Gnote , 6, 2, $60
	PlayNote Gnote , 6, 2, $60
	PlayNote Gnote , 6, 2, $60
	PlayNote Gnote , 6, 2, $60
	PlayNote Gnote , 6, 2, $60
	PlayNote Gnote , 6, 2, $5c
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $28
	SND_ClearHWRegs $08
	PlayNote Fnote , 6, 2, $08
	SND_ClearHWRegs $04
	PlayNote Asharp, 6, 2, $08
	SND_ClearHWRegs $04
	PlayNote Dnote , 7, 2, $44
	SND_ClearHWRegs $04
	PlayNote Enote , 7, 2, $44
	SND_ClearHWRegs $04
	PlayNote Fnote , 7, 2, $44
	SND_ClearHWRegs $04
	PlayNote Asharp, 7, 2, $60
	PlayNote Asharp, 7, 2, $58
	SND_ClearHWRegs $08
	PlayNote Cnote , 8, 2, $58
	SND_ClearHWRegs $08
	PlayNote Dnote , 8, 2, $58
	SND_ClearHWRegs $08
	PlayNote Cnote , 8, 2, $44
	SND_ClearHWRegs $04
	PlayNote Gnote , 7, 2, $44
	SND_ClearHWRegs $04
	PlayNote Dsharp, 7, 2, $2c
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 2, $44
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 2, $44
	SND_ClearHWRegs $04
	PlayNote Dsharp, 6, 2, $2c
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 2, $60
	PlayNote Cnote , 6, 2, $60
	PlayNote Cnote , 6, 2, $5c
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 2, $58
	SND_ClearHWRegs $08
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $5c
	SND_ClearHWRegs $60
	SND_ClearHWRegs $04
	SND_Stop


Music04_Noise:
	SND_SaveEnvelopeValue 0, $a1
	SND_SetNoiseDividingRatioOfFreqs 1
	SND_Call NoiseFunc_001_7b05
	SND_Call NoiseFunc_001_7b05
	SND_Call NoiseFunc_001_7b05
	SND_Call NoiseFunc_001_7b05
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $0b
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_Call NoiseFunc_001_7b39
	SND_Call NoiseFunc_001_7b39
	SND_Call NoiseFunc_001_7b39
	SND_Call NoiseFunc_001_7b39
	SND_Call NoiseFunc_001_7b39
	SND_Call NoiseFunc_001_7b39
	SND_Call NoiseFunc_001_7b39
	SND_Call NoiseFunc_001_7b39
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $50
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_Stop


NoiseFunc_001_7b05:
	SND_SetAudTermS01
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	SND_SetAudTermS02
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	SND_SetAudTermS02
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	SND_SetAudTermS01
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	SND_SetAudTermS02
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	SND_SetAudTermS02
	NoiseSCF $07
	NoiseSCF $03
	SND_ClearHWRegs $08
	SND_SetAudTermS01
	NoiseSCF $03
	NoiseSCF $01
	SND_ClearHWRegs $28
	SND_SetAudTermS01andSO2
	SND_Ret


NoiseFunc_001_7b39:
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $20
	SND_SetAudTermS02
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $28
	SND_SetAudTermS01andSO2
	NoiseSCF $08
	NoiseSCF $03
	SND_ClearHWRegs $20
	SND_SetAudTermS02
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $08
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $20
	SND_SetAudTermS02
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $28
	SND_SetAudTermS01andSO2
	NoiseSCF $08
	NoiseSCF $03
	SND_ClearHWRegs $20
	SND_SetAudTermS02
	NoiseSCF $07
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $08
	SND_SetAudTermS01andSO2
	SND_Ret


    SECTION "ROM Bank $002", ROMX[$4000], BANK[$2]

Music05_SQ1::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 7, $46
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 6, $a0
	SND_SaveEnvelopeValue 4, $60
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $ee
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_ClearHWRegs $18
	PlayNote Enote , 7, 1, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 6, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 6, $18
:	PlayNote Bnote , 6, 1, $60
	PlayNote Bnote , 6, 6, $30
	PlayNote Gnote , 6, 1, $30
	PlayNote Gnote , 6, 6, $60
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Enote , 6, 1, $30
	PlayNote Enote , 6, 6, $60
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 1, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 3, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 3, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 3, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 3, $18
	PlayNote Bnote , 6, 1, $60
	PlayNote Bnote , 6, 6, $30
	PlayNote Gnote , 6, 1, $30
	PlayNote Gnote , 6, 6, $60
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 3, $18
	PlayNote Enote , 7, 1, $30
	PlayNote Enote , 7, 1, $60
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 3, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Gnote , 7, 1, $18
	PlayNote Gnote , 7, 3, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 3, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 3, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 3, $18
	PlayNote Dnote , 7, 1, $60
	PlayNote Dnote , 7, 6, $30
	PlayNote Cnote , 8, 1, $30
	PlayNote Cnote , 8, 1, $60
	PlayNote Dnote , 8, 1, $60
	PlayNote Cnote , 8, 1, $30
	PlayNote Cnote , 8, 3, $18
	PlayNote Bnote , 7, 1, $18
	PlayNote Bnote , 7, 6, $18
	PlayNote Bnote , 7, 6, $18
	PlayNote Anote , 7, 1, $18
	PlayNote Anote , 7, 3, $18
	PlayNote Gnote , 7, 1, $60
	PlayNote Dnote , 7, 1, $60
	PlayNote Enote , 7, 1, $60
	PlayNote Enote , 7, 6, $60
	PlayNote Enote , 7, 6, $60
	PlayNote Enote , 7, 6, $60
	PlayNote Enote , 7, 6, $18
	PlayNote Enote , 7, 3, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 3, $18
	SND_ClearHWRegs $30
	PlayNote Dnote , 7, 1, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 3, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 3, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 3, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 3, $18
	PlayNote Bnote , 6, 1, $60
	PlayNote Bnote , 6, 6, $30
	PlayNote Gnote , 6, 1, $30
	PlayNote Gnote , 6, 6, $60
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Enote , 6, 1, $30
	PlayNote Enote , 6, 1, $60
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 3, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 3, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 3, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 3, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 3, $18
	PlayNote Bnote , 6, 1, $60
	PlayNote Bnote , 6, 6, $30
	PlayNote Gnote , 6, 1, $30
	PlayNote Gnote , 6, 6, $60
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 3, $18
	PlayNote Enote , 7, 1, $30
	PlayNote Enote , 7, 6, $60
	PlayNote Enote , 7, 3, $18
	PlayNote Enote , 7, 4, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Gnote , 7, 1, $18
	PlayNote Gnote , 7, 3, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 3, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 3, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 3, $18
	PlayNote Dnote , 7, 1, $60
	PlayNote Dnote , 7, 1, $30
	PlayNote Anote , 7, 1, $60
	PlayNote Gnote , 7, 1, $60
	PlayNote Fnote , 7, 1, $30
	PlayNote Enote , 7, 1, $60
	PlayNote Cnote , 7, 1, $60
	PlayNote Gnote , 6, 1, $60
	PlayNote Enote , 6, 1, $60
	PlayNote Dnote , 6, 1, $60
	PlayNote Dnote , 6, 6, $60
	PlayNote Dnote , 6, 6, $60
	PlayNote Dnote , 6, 6, $30
	PlayNote Cnote , 6, 1, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Enote , 6, 1, $60
	PlayNote Enote , 6, 6, $60
	PlayNote Enote , 6, 6, $60
	PlayNote Enote , 6, 6, $18
	PlayNote Enote , 6, 3, $0c
	PlayNote Fnote , 6, 2, $0c
	PlayNote Gnote , 6, 2, $0c
	PlayNote Anote , 6, 1, $0c
	PlayNote Bnote , 6, 1, $0c
	PlayNote Cnote , 7, 1, $0c
	PlayNote Dnote , 7, 1, $60
	PlayNote Dnote , 7, 6, $60
	PlayNote Dnote , 7, 6, $60
	SND_ClearHWRegs $30
	PlayNote Cnote , 7, 1, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dsharp, 7, 1, $60
	PlayNote Dsharp, 7, 6, $60
	PlayNote Dsharp, 7, 6, $60
	PlayNote Fnote , 7, 1, $60
	PlayNote Dnote , 7, 1, $60
	PlayNote Dnote , 7, 6, $60
	PlayNote Dnote , 7, 6, $60
	PlayNote Dnote , 7, 6, $60
	PlayNote Dnote , 7, 6, $60
	PlayNote Dnote , 7, 6, $60
	PlayNote Dnote , 7, 6, $60
	PlayNote Dnote , 7, 6, $60
	PlayNote Dnote , 7, 6, $60
	PlayNote Dnote , 7, 6, $60
	PlayNote Dnote , 7, 6, $60
	PlayNote Dnote , 7, 6, $60
	SND_Jump :-


Music05_SQ2::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 7, $46
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 4, $a0
	SND_SaveEnvelopeValue 6, $60
	SND_SquareSet75Wave2
	SND_SetFreqTableBaseIdx $ee
	SND_SetAlternatingAudTerm 1
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
:	PlayNote Gnote , 4, 1, $18
	PlayNote Gnote , 4, 4, $18
	PlayNote Dnote , 5, 1, $18
	PlayNote Dnote , 5, 4, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 4, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Gnote , 4, 1, $18
	PlayNote Gsharp, 4, 4, $18
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 4, $18
	PlayNote Enote , 5, 1, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 4, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 4, $18
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 4, $18
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 4, $18
	SND_ClearHWRegs $30
	PlayNote Bnote , 4, 1, $18
	PlayNote Bnote , 4, 4, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 4, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Anote , 4, 1, $18
	PlayNote Bnote , 4, 4, $18
	PlayNote Cnote , 5, 1, $18
	PlayNote Cnote , 5, 4, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 4, $18
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 4, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 4, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 4, $18
	SND_ClearHWRegs $30
	PlayNote Dnote , 5, 1, $18
	PlayNote Dnote , 5, 4, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Fnote , 6, 4, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Fnote , 6, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Cnote , 5, 1, $18
	PlayNote Dnote , 5, 4, $18
	PlayNote Enote , 4, 1, $18
	PlayNote Enote , 4, 4, $18
	PlayNote Enote , 5, 1, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Gnote , 6, 1, $18
	PlayNote Gnote , 6, 4, $18
	PlayNote Gnote , 6, 1, $18
	PlayNote Gnote , 6, 4, $18
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 4, $18
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 4, $18
	SND_ClearHWRegs $30
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 4, $18
	PlayNote Enote , 5, 1, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Enote , 5, 1, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 4, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 4, $18
	PlayNote Enote , 5, 1, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Enote , 5, 1, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 4, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 4, $18
	PlayNote Enote , 5, 1, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Enote , 5, 1, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Gnote , 4, 1, $18
	PlayNote Gnote , 4, 4, $18
	PlayNote Dnote , 5, 1, $18
	PlayNote Dnote , 5, 4, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 4, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Gnote , 4, 1, $18
	PlayNote Fsharp, 4, 4, $18
	PlayNote Fnote , 4, 1, $18
	PlayNote Fnote , 4, 4, $18
	PlayNote Cnote , 5, 1, $18
	PlayNote Cnote , 5, 4, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 4, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 4, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 4, $18
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 4, $18
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 4, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Fnote , 6, 4, $18
	PlayNote Gnote , 4, 1, $18
	PlayNote Gnote , 4, 4, $18
	PlayNote Dnote , 5, 1, $18
	PlayNote Dnote , 5, 4, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 4, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Gnote , 4, 1, $18
	PlayNote Gsharp, 4, 4, $18
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 4, $18
	PlayNote Enote , 5, 1, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 4, $18
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 4, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 4, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 4, $18
	SND_ClearHWRegs $30
	PlayNote Asharp, 4, 1, $18
	PlayNote Asharp, 4, 4, $18
	PlayNote Fnote , 5, 1, $18
	PlayNote Fnote , 5, 4, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Fnote , 6, 4, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Fnote , 6, 4, $18
	SND_ClearHWRegs $30
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 4, $18
	PlayNote Enote , 5, 1, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 4, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 4, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 4, $18
	SND_ClearHWRegs $30
	PlayNote Gnote , 4, 1, $18
	PlayNote Gnote , 4, 4, $18
	PlayNote Dnote , 5, 1, $18
	PlayNote Dnote , 5, 4, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 4, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 4, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 4, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 4, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 4, $18
	SND_ClearHWRegs $30
	PlayNote Fnote , 4, 1, $18
	PlayNote Fnote , 4, 4, $18
	PlayNote Cnote , 5, 1, $18
	PlayNote Cnote , 5, 4, $18
	PlayNote Enote , 5, 1, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 4, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 4, $18
	PlayNote Fnote , 5, 1, $18
	PlayNote Fnote , 5, 4, $18
	PlayNote Fnote , 5, 1, $18
	PlayNote Fnote , 5, 4, $18
	SND_ClearHWRegs $30
	PlayNote Dsharp, 5, 1, $18
	PlayNote Dsharp, 5, 4, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Gnote , 6, 1, $18
	PlayNote Gnote , 6, 4, $18
	PlayNote Gnote , 6, 1, $18
	PlayNote Gnote , 6, 4, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 4, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 5, 4, $18
	SND_ClearHWRegs $30
	PlayNote Csharp, 5, 1, $18
	PlayNote Csharp, 5, 4, $18
	PlayNote Gsharp, 5, 1, $18
	PlayNote Gsharp, 5, 4, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 4, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Fnote , 6, 4, $18
	PlayNote Fnote , 6, 4, $18
	PlayNote Fnote , 6, 4, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 4, $18
	PlayNote Csharp, 6, 4, $18
	PlayNote Csharp, 6, 4, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 4, $18
	PlayNote Cnote , 5, 1, $18
	PlayNote Cnote , 5, 4, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 4, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 4, $18
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 4, $18
	PlayNote Enote , 6, 1, $18
	PlayNote Enote , 6, 4, $18
	PlayNote Gnote , 6, 1, $60
	PlayNote Fsharp, 6, 1, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Enote , 6, 1, $60
	PlayNote Enote , 6, 4, $60
	PlayNote Enote , 6, 4, $60
	PlayNote Enote , 6, 4, $60
	PlayNote Enote , 6, 4, $60
	PlayNote Enote , 6, 4, $60
	PlayNote Enote , 6, 4, $60
	PlayNote Enote , 6, 4, $60
	SND_Jump :-


Music05_Wav::
	SND_SaveEnvelopeValue 2, $a6
	SND_SetFreqTableBaseIdx $fa
	SND_SetAudTermS01andSO2
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
:	PlayNote Gnote , 4, 2, $60
	SND_ClearHWRegs $30
	PlayNote Gnote , 4, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	PlayNote Gnote , 4, 2, $18
	PlayNote Gsharp, 4, 2, $18
	PlayNote Anote , 4, 2, $30
	PlayNote Anote , 5, 2, $18
	SND_ClearHWRegs $18
	PlayNote Anote , 4, 2, $18
	SND_ClearHWRegs $18
	PlayNote Anote , 4, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Bnote , 4, 2, $60
	SND_ClearHWRegs $30
	PlayNote Bnote , 4, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	PlayNote Anote , 4, 2, $18
	PlayNote Bnote , 4, 2, $18
	PlayNote Cnote , 5, 2, $30
	PlayNote Cnote , 6, 2, $30
	PlayNote Cnote , 5, 2, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 5, 2, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	PlayNote Dnote , 5, 2, $60
	SND_ClearHWRegs $30
	PlayNote Dnote , 5, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	PlayNote Cnote , 5, 2, $18
	PlayNote Dnote , 5, 2, $18
	PlayNote Enote , 5, 2, $30
	PlayNote Enote , 6, 2, $30
	PlayNote Enote , 5, 2, $18
	SND_ClearHWRegs $18
	PlayNote Enote , 5, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Anote , 4, 2, $60
	SND_ClearHWRegs $30
	PlayNote Anote , 4, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	PlayNote Gnote , 4, 2, $18
	PlayNote Gsharp, 4, 2, $18
	PlayNote Anote , 4, 2, $30
	PlayNote Anote , 5, 2, $30
	PlayNote Anote , 4, 2, $18
	SND_ClearHWRegs $18
	PlayNote Anote , 4, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 2, $60
	SND_ClearHWRegs $30
	PlayNote Gnote , 4, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	PlayNote Gnote , 4, 2, $18
	PlayNote Fsharp, 4, 2, $18
	PlayNote Fnote , 4, 2, $30
	PlayNote Fnote , 5, 2, $30
	PlayNote Fnote , 4, 2, $18
	SND_ClearHWRegs $18
	PlayNote Fnote , 4, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 2, $60
	SND_ClearHWRegs $30
	PlayNote Gnote , 4, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	PlayNote Gnote , 4, 2, $18
	PlayNote Gsharp, 4, 2, $18
	PlayNote Anote , 4, 2, $30
	PlayNote Anote , 5, 2, $30
	PlayNote Anote , 4, 2, $18
	SND_ClearHWRegs $18
	PlayNote Anote , 4, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Asharp, 4, 2, $30
	PlayNote Asharp, 5, 2, $24
	SND_ClearHWRegs $0c
	PlayNote Asharp, 4, 2, $18
	SND_ClearHWRegs $18
	PlayNote Asharp, 4, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Anote , 4, 2, $30
	PlayNote Anote , 5, 2, $24
	SND_ClearHWRegs $0c
	PlayNote Anote , 4, 2, $18
	SND_ClearHWRegs $18
	PlayNote Anote , 4, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 2, $30
	PlayNote Gnote , 5, 2, $24
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 2, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Fnote , 4, 2, $30
	PlayNote Fnote , 5, 2, $24
	SND_ClearHWRegs $0c
	PlayNote Fnote , 4, 2, $18
	SND_ClearHWRegs $18
	PlayNote Fnote , 4, 2, $18
	SND_ClearHWRegs $48
	PlayNote Fnote , 5, 2, $60
	PlayNote Fnote , 5, 2, $30
	PlayNote Dsharp, 5, 2, $30
	PlayNote Dsharp, 6, 2, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 5, 2, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 5, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Csharp, 5, 2, $30
	PlayNote Csharp, 6, 2, $30
	PlayNote Csharp, 5, 2, $18
	SND_ClearHWRegs $18
	PlayNote Csharp, 5, 2, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Cnote , 5, 2, $60
	PlayNote Cnote , 5, 2, $60
	PlayNote Cnote , 5, 2, $60
	PlayNote Cnote , 5, 2, $60
	PlayNote Cnote , 5, 2, $60
	PlayNote Cnote , 5, 2, $60
	PlayNote Cnote , 5, 2, $60
	PlayNote Cnote , 5, 2, $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_Jump :-


Music05_Noise::
	SND_SetNoiseDividingRatioOfFreqs 1
	SND_SaveEnvelopeValue 0, $66
	SND_SetAudTermS01
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
:	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	SND_Call NoiseFunc_002_45c4
	SND_Call NoiseFunc_002_45c4
	SND_Call NoiseFunc_002_45c4
	SND_Call NoiseFunc_002_45c4
	SND_Call NoiseFunc_002_45c4
	SND_Call NoiseFunc_002_45c4
	SND_Call NoiseFunc_002_45c4
	SND_Call NoiseFunc_002_45c4
	SND_Call NoiseFunc_002_45c4
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $58
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $20
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	SND_ClearHWRegs $60
	SND_Jump :-


NoiseFunc_002_45c4:
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $20
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $50
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $20
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $20
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $08
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $08
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $08
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $20
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $20
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $03
	SND_ClearHWRegs $20
	SND_Ret
	
	
Music06_SQ1::
	SND_SaveEnvelopeValue 3, $c6
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 0, $86
	SND_SaveEnvelopeValue 6, $66
	SND_SaveEnvelopeValue 4, $26
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 7, $a0
	SND_SaveEnvelopeValue 1, $60
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	PlayNote Bnote , 6, 2, $10
	SND_SetAudTermS01
	PlayNote Bnote , 6, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Dnote , 7, 2, $10
	SND_SetAudTermS01
	PlayNote Dnote , 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Fnote , 7, 2, $10
	SND_SetAudTermS01
	PlayNote Fnote , 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Anote , 7, 2, $10
	SND_SetAudTermS01
	PlayNote Anote , 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Dnote , 8, 2, $10
	SND_SetAudTermS01
	PlayNote Dnote , 8, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Cnote , 8, 2, $10
	SND_SetAudTermS01
	PlayNote Cnote , 8, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Anote , 7, 2, $10
	SND_SetAudTermS01
	PlayNote Anote , 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Fnote , 7, 2, $10
	SND_SetAudTermS01
	PlayNote Fnote , 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Cnote , 8, 2, $10
	SND_SetAudTermS01
	PlayNote Cnote , 8, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Asharp, 7, 2, $10
	SND_SetAudTermS01
	PlayNote Asharp, 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Gsharp, 7, 2, $10
	SND_SetAudTermS01
	PlayNote Gsharp, 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Dsharp, 7, 2, $10
	SND_SetAudTermS01
	PlayNote Dsharp, 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Asharp, 7, 2, $10
	SND_SetAudTermS01
	PlayNote Asharp, 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Gsharp, 7, 2, $10
	SND_SetAudTermS01
	PlayNote Gsharp, 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Fsharp, 7, 2, $10
	SND_SetAudTermS01
	PlayNote Fsharp, 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Csharp, 7, 2, $10
	SND_SetAudTermS01
	PlayNote Csharp, 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Enote , 7, 2, $28
	SND_SetAudTermS01
	PlayNote Enote , 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Enote , 7, 6, $10
	SND_SetAudTermS01
	PlayNote Enote , 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Enote , 7, 2, $10
	SND_SetAudTermS01
	PlayNote Enote , 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Enote , 7, 2, $10
	SND_SetAudTermS01
	PlayNote Enote , 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Enote , 7, 2, $28
	SND_SetAudTermS01
	PlayNote Enote , 7, 4, $08
	SND_SetAudTermS01andSO2
	PlayNote Enote , 7, 6, $10
	SND_SetAudTermS01
	PlayNote Enote , 7, 4, $08
	SND_Stop


Music06_SQ2::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 3, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 6, $66
	SND_SaveEnvelopeValue 4, $26
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 1, $a0
	SND_SaveEnvelopeValue 7, $60
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $f4
	SND_SetAudTermS01
	PlayNote Cnote , 6, 3, $10
	PlayNote Cnote , 6, 4, $08
	PlayNote Cnote , 6, 3, $10
	PlayNote Cnote , 6, 4, $08
	PlayNote Enote , 6, 3, $10
	PlayNote Enote , 6, 4, $08
	PlayNote Gnote , 6, 3, $10
	PlayNote Gnote , 6, 4, $08
	PlayNote Bnote , 6, 3, $10
	PlayNote Bnote , 6, 4, $08
	PlayNote Fnote , 5, 3, $10
	PlayNote Fnote , 5, 4, $08
	PlayNote Asharp, 5, 3, $10
	PlayNote Asharp, 5, 4, $08
	PlayNote Dnote , 6, 3, $10
	PlayNote Dnote , 6, 4, $08
	PlayNote Fnote , 6, 3, $10
	PlayNote Fnote , 6, 4, $08
	PlayNote Gsharp, 5, 3, $10
	PlayNote Gsharp, 5, 4, $08
	PlayNote Cnote , 6, 3, $10
	PlayNote Cnote , 6, 4, $08
	PlayNote Dsharp, 6, 3, $10
	PlayNote Dsharp, 6, 4, $08
	PlayNote Gsharp, 6, 3, $10
	PlayNote Gsharp, 6, 4, $08
	PlayNote Asharp, 5, 3, $10
	PlayNote Asharp, 5, 4, $08
	PlayNote Csharp, 6, 3, $10
	PlayNote Csharp, 6, 4, $08
	PlayNote Fsharp, 6, 3, $10
	PlayNote Fsharp, 6, 4, $08
	PlayNote Asharp, 6, 3, $10
	PlayNote Asharp, 6, 4, $08
	PlayNote Cnote , 7, 3, $20
	PlayNote Cnote , 7, 4, $10
	PlayNote Cnote , 7, 6, $10
	PlayNote Cnote , 7, 4, $08
	PlayNote Cnote , 7, 3, $10
	PlayNote Cnote , 7, 4, $08
	PlayNote Cnote , 7, 6, $10
	PlayNote Cnote , 7, 4, $08
	PlayNote Cnote , 7, 3, $20
	PlayNote Cnote , 7, 4, $10
	PlayNote Cnote , 7, 6, $10
	PlayNote Cnote , 7, 4, $08
	SND_Stop


Music06_Wav::
	SND_SaveEnvelopeValue 1, $c6
	SND_SetAudTermS01andSO2
	PlayNote Fnote , 4, 1, $18
	PlayNote Gnote , 4, 1, $18
	PlayNote Gsharp, 4, 1, $18
	PlayNote Anote , 4, 1, $18
	PlayNote Asharp, 4, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Asharp, 4, 1, $18
	SND_ClearHWRegs $18
	PlayNote Gsharp, 4, 1, $18
	PlayNote Gsharp, 5, 1, $18
	PlayNote Gsharp, 4, 1, $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 4, 1, $18
	PlayNote Fsharp, 5, 1, $18
	PlayNote Fsharp, 4, 1, $18
	SND_ClearHWRegs $08
	PlayNote Fsharp, 4, 1, $18
	PlayNote Fnote , 4, 1, $30
	SND_ClearHWRegs $18
	PlayNote Fnote , 5, 1, $18
	SND_ClearHWRegs $30
	PlayNote Fnote , 4, 1, $30
	SND_Stop


Music06_Noise::
	SND_SaveEnvelopeValue 0, $46
	SND_SetNoiseDividingRatioOfFreqs 1
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $08
	NoiseSCF $03
	SND_ClearHWRegs $20
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $02
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_Stop


Music07_SQ1::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 1, $86
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 4, $a0
	SND_SaveEnvelopeValue 6, $60
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_ClearHWRegs $18
	PlayNote Fnote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Gsharp, 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 8, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 8, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 8, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 8, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 8, 3, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 8, 4, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 7, 4, $60
	PlayNote Bnote , 7, 4, $60
	PlayNote Bnote , 7, 4, $30
	PlayNote Bnote , 7, 4, $60
	PlayNote Bnote , 7, 4, $60
	PlayNote Bnote , 7, 4, $60
	SND_ClearHWRegs $60
	SND_Stop


Music07_SQ2::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 1, $86
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 4, $a0
	SND_SaveEnvelopeValue 6, $60
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAlternatingAudTerm 1
	PlayNote Fnote , 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Dsharp, 5, 1, $14
	SND_ClearHWRegs $04
	PlayNote Dsharp, 5, 3, $14
	SND_ClearHWRegs $04
	PlayNote Asharp, 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Asharp, 6, 3, $14
	SND_ClearHWRegs $04
	PlayNote Asharp, 6, 4, $14
	SND_ClearHWRegs $04
	PlayNote Asharp, 6, 6, $14
	SND_ClearHWRegs $04
	PlayNote Asharp, 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Asharp, 6, 3, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 6, 3, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 6, 4, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 6, 3, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 6, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 1, $2c
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 3, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 4, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 5, 4, $18
	PlayNote Bnote , 5, 4, $60
	PlayNote Bnote , 5, 4, $60
	PlayNote Bnote , 5, 4, $5c
	SND_Stop


Music07_Wav::
	SND_SaveEnvelopeValue 2, $a6
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	PlayNote Fnote , 5, 2, $60
	PlayNote Fnote , 5, 2, $58
	SND_ClearHWRegs $08
	PlayNote Dsharp, 5, 2, $2c
	SND_ClearHWRegs $04
	PlayNote Dsharp, 6, 2, $14
	SND_ClearHWRegs $1c
	PlayNote Dsharp, 5, 2, $2c
	SND_ClearHWRegs $04
	PlayNote Dsharp, 6, 2, $14
	SND_ClearHWRegs $1c
	PlayNote Csharp, 5, 2, $2c
	SND_ClearHWRegs $1c
	PlayNote Csharp, 5, 2, $14
	SND_ClearHWRegs $34
	PlayNote Cnote , 5, 2, $60
	PlayNote Cnote , 5, 2, $60
	PlayNote Cnote , 5, 2, $30
	PlayNote Cnote , 5, 2, $60
	PlayNote Cnote , 5, 2, $60
	PlayNote Cnote , 5, 2, $60
	SND_Stop


Music07_Noise::
	SND_SaveEnvelopeValue 0, $86
	SND_SetAudTermS01andSO2
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS02
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS02
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS02
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS02
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS02
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS02
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS02
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS02
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS02
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS02
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $01
	SND_Stop
	
	
Music08_SQ1::
:	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 6, $a0
	SND_SaveEnvelopeValue 7, $60
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Csharp, 8, 1, $08
	SND_ClearHWRegs $04
	PlayNote Dnote , 8, 1, $08
	SND_ClearHWRegs $04
	PlayNote Csharp, 8, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 3, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 3, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 3, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 6, 3, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 6, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 3, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 6, 3, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 6, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 3, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 3, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 5, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 3, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 6, 4, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 1, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 3, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 4, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 7, 3, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 7, 4, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 7, 1, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 7, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 7, 1, $44
	SND_ClearHWRegs $04
	PlayNote Anote , 7, 4, $14
	SND_ClearHWRegs $04
	PlayNote Gsharp, 7, 1, $44
	SND_ClearHWRegs $04
	PlayNote Gsharp, 7, 4, $14
	SND_ClearHWRegs $04
	SND_Jump :-


Music08_SQ2::
:	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 6, $a0
	SND_SaveEnvelopeValue 7, $60
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $00
	SND_SetAlternatingAudTerm 1
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 6, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 6, $14
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $1c
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 6, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 6, $14
	SND_ClearHWRegs $1c
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dsharp, 7, 2, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 7, 2, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 2, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 7, 2, $14
	SND_ClearHWRegs $04
	PlayNote Fsharp, 6, 2, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 2, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 6, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 6, $14
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $1c
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 3, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 6, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 6, $14
	SND_ClearHWRegs $1c
	PlayNote Anote , 4, 1, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 4, $14
	SND_ClearHWRegs $04
	PlayNote Dsharp, 7, 2, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 7, 2, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 2, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 7, 2, $14
	SND_ClearHWRegs $04
	PlayNote Fsharp, 6, 2, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 6, 2, $14
	SND_ClearHWRegs $04
	SND_Jump :-


Music08_Wav::
:	SND_SaveEnvelopeValue 2, $a6
	SND_SetFreqTableBaseIdx $f4
	SND_SetAudTermS01andSO2
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	SND_Jump :-


Music08_Noise::
:	SND_SaveEnvelopeValue 0, $66
	SND_SetAudTermS01andSO2
	SND_Call NoiseFunc_002_4c0c
	SND_Call NoiseFunc_002_4c0c
	SND_Call NoiseFunc_002_4c0c
	SND_Call NoiseFunc_002_4c0c
	SND_Call NoiseFunc_002_4c2d
	SND_Call NoiseFunc_002_4c2d
	SND_Call NoiseFunc_002_4c2d
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	SND_Jump :-


NoiseFunc_002_4c0c:
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $28
	SND_Ret
	
	
NoiseFunc_002_4c2d:
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $28
	SND_Ret
	
	
Music09_SQ1::
	SND_SaveEnvelopeValue 6, $c6
	SND_SaveEnvelopeValue 0, $a6
	SND_SaveEnvelopeValue 1, $86
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 4, $26
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 2, $a0
	SND_SaveEnvelopeValue 7, $60
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e9
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	PlayNote Dnote , 5, 0, $2c
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 0, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 2, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 0, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 2, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 0, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 0, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 0, $14
	SND_ClearHWRegs $04
	PlayNote Gnote , 5, 0, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 5, 0, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 0, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 5, 0, $14
	SND_ClearHWRegs $04
	PlayNote Anote , 4, 0, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 4, 0, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 5, 0, $14
	SND_ClearHWRegs $04
	PlayNote Dsharp, 5, 0, $2c
	SND_ClearHWRegs $04
	PlayNote Dsharp, 5, 0, $14
	SND_ClearHWRegs $04
	PlayNote Dsharp, 5, 2, $14
	SND_ClearHWRegs $04
	PlayNote Dsharp, 5, 0, $14
	SND_ClearHWRegs $04
	PlayNote Dsharp, 5, 2, $14
	SND_ClearHWRegs $34
	PlayNote Dsharp, 5, 0, $44
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 0, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 0, $14
	SND_ClearHWRegs $04
	PlayNote Enote , 5, 0, $14
	SND_ClearHWRegs $04
	PlayNote Fnote , 4, 0, $30
	PlayNote Fnote , 4, 2, $60
	PlayNote Fnote , 4, 2, $60
	PlayNote Fnote , 4, 2, $60
	PlayNote Fnote , 4, 2, $60
	PlayNote Fnote , 4, 2, $40
	PlayNote Fnote , 4, 4, $20
	SND_Stop


Music09_SQ2::
	SND_SaveEnvelopeValue 1, $c6
	SND_SaveEnvelopeValue 0, $a6
	SND_SaveEnvelopeValue 6, $86
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 4, $46
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 2, $a0
	SND_SaveEnvelopeValue 7, $60
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e9
	SND_SetAudTermS01andSO2
	PlayNote Bnote , 6, 0, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 2, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 0, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 2, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 0, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 2, $14
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 0, $14
	SND_ClearHWRegs $04
	PlayNote Bnote , 6, 2, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 0, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 2, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 0, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 2, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 0, $14
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 2, $14
	SND_ClearHWRegs $34
	PlayNote Cnote , 7, 0, $2c
	SND_ClearHWRegs $04
	PlayNote Cnote , 7, 2, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 7, 0, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 7, 2, $14
	SND_ClearHWRegs $04
	PlayNote Csharp, 7, 0, $14
	SND_ClearHWRegs $04
	PlayNote Dnote , 7, 2, $30
	PlayNote Dnote , 7, 2, $60
	PlayNote Dnote , 7, 2, $60
	PlayNote Dnote , 7, 2, $60
	PlayNote Dnote , 7, 2, $60
	PlayNote Dnote , 7, 2, $40
	PlayNote Dnote , 7, 4, $20
	SND_Stop


Music09_Wav::
	SND_SaveEnvelopeValue 2, $c0
	SND_SetFreqTableBaseIdx $f5
	SND_SetAudTermS01andSO2
	PlayNote Cnote , 6, 2, $14
	SND_ClearHWRegs $34
	PlayNote Cnote , 6, 2, $14
	SND_ClearHWRegs $34
	PlayNote Cnote , 6, 2, $18
	PlayNote Dnote , 6, 2, $18
	PlayNote Fnote , 6, 2, $18
	PlayNote Gnote , 6, 2, $18
	PlayNote Fnote , 6, 2, $18
	PlayNote Dnote , 6, 2, $18
	PlayNote Cnote , 6, 2, $18
	PlayNote Anote , 5, 2, $18
	PlayNote Dnote , 5, 2, $18
	PlayNote Dnote , 6, 2, $18
	PlayNote Csharp, 6, 2, $14
	SND_ClearHWRegs $34
	PlayNote Csharp, 6, 2, $14
	SND_ClearHWRegs $60
	SND_ClearHWRegs $04
	PlayNote Fnote , 6, 2, $44
	SND_ClearHWRegs $04
	PlayNote Fsharp, 6, 2, $14
	SND_ClearHWRegs $34
	PlayNote Gnote , 6, 2, $30
	PlayNote Gnote , 6, 2, $60
	PlayNote Gnote , 6, 2, $28
	SND_Stop


Music09_Noise::
	SND_SaveEnvelopeValue 0, $46
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $28
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $10
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $40
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $40
	NoiseSCF $02
	NoiseSCF $01
	SND_ClearHWRegs $28
	SND_Stop


Music0a_SQ1::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 6, $a0
	SND_SaveEnvelopeValue 7, $60
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_ClearHWRegs $30
	PlayNote Dsharp, 7, 1, $18
	PlayNote Gsharp, 7, 1, $18
	PlayNote Csharp, 8, 1, $18
	PlayNote Dsharp, 8, 1, $48
	PlayNote Fsharp, 7, 1, $18
	PlayNote Asharp, 7, 1, $18
	PlayNote Bnote , 7, 1, $18
	PlayNote Csharp, 8, 1, $78
	PlayNote Enote , 7, 1, $18
	PlayNote Dsharp, 7, 1, $18
	PlayNote Csharp, 7, 1, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Dsharp, 7, 1, $18
	PlayNote Csharp, 7, 1, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Fsharp, 7, 1, $18
	PlayNote Fsharp, 7, 3, $18
	PlayNote Fsharp, 7, 4, $18
	PlayNote Gnote , 8, 1, $18
	PlayNote Gnote , 8, 3, $18
	PlayNote Gnote , 8, 4, $18
	PlayNote Gnote , 8, 1, $18
	PlayNote Gnote , 8, 3, $18
	PlayNote Gnote , 8, 4, $18
	PlayNote Gnote , 8, 1, $18
	PlayNote Gnote , 8, 4, $18
	PlayNote Gnote , 8, 4, $18
	SND_Stop


Music0a_SQ2::
	SND_SaveEnvelopeValue 2, $c6
	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 0, $86
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 6, $a0
	SND_SaveEnvelopeValue 7, $60
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	PlayNote Gsharp, 5, 0, $18
	PlayNote Dsharp, 6, 0, $18
	PlayNote Csharp, 7, 0, $18
	PlayNote Csharp, 7, 0, $18
	PlayNote Csharp, 7, 0, $18
	PlayNote Cnote , 7, 0, $18
	PlayNote Cnote , 7, 0, $18
	PlayNote Cnote , 7, 0, $18
	PlayNote Bnote , 6, 0, $30
	PlayNote Bnote , 6, 0, $18
	PlayNote Asharp, 6, 0, $18
	PlayNote Asharp, 6, 0, $18
	PlayNote Asharp, 6, 0, $18
	PlayNote Asharp, 6, 0, $18
	PlayNote Asharp, 6, 0, $18
	PlayNote Anote , 6, 0, $18
	PlayNote Anote , 6, 2, $18
	PlayNote Anote , 6, 0, $18
	PlayNote Anote , 6, 2, $18
	PlayNote Anote , 6, 0, $18
	PlayNote Anote , 6, 2, $18
	PlayNote Bnote , 6, 0, $18
	PlayNote Bnote , 6, 2, $18
	PlayNote Bnote , 6, 0, $18
	PlayNote Bnote , 6, 2, $18
	PlayNote Cnote , 7, 0, $18
	PlayNote Cnote , 7, 2, $18
	PlayNote Cnote , 7, 0, $18
	PlayNote Cnote , 7, 2, $18
	PlayNote Cnote , 7, 0, $18
	PlayNote Cnote , 7, 2, $18
	PlayNote Cnote , 7, 0, $18
	PlayNote Cnote , 7, 2, $18
	PlayNote Cnote , 7, 2, $18
	SND_Stop


Music0a_Wav::
	SND_SaveEnvelopeValue 2, $86
	SND_SetFreqTableBaseIdx $f4
	SND_SetAudTermS01andSO2
	PlayNote Gsharp, 4, 2, $30
	PlayNote Gsharp, 5, 2, $18
	PlayNote Gsharp, 4, 2, $18
	PlayNote Dsharp, 5, 2, $30
	PlayNote Gsharp, 4, 2, $18
	PlayNote Fsharp, 4, 2, $30
	PlayNote Fsharp, 5, 2, $18
	PlayNote Fsharp, 4, 2, $18
	PlayNote Fnote , 4, 2, $18
	PlayNote Fsharp, 4, 2, $30
	PlayNote Anote , 4, 2, $18
	PlayNote Gsharp, 4, 2, $18
	PlayNote Fsharp, 4, 2, $18
	PlayNote Anote , 4, 2, $18
	PlayNote Gsharp, 4, 2, $18
	PlayNote Fsharp, 4, 2, $18
	PlayNote Anote , 4, 2, $18
	PlayNote Bnote , 4, 2, $48
	PlayNote Cnote , 5, 2, $48
	PlayNote Cnote , 5, 2, $48
	PlayNote Cnote , 5, 2, $60
	SND_Stop


Music0a_Noise::
	SND_SaveEnvelopeValue 0, $c6
	SND_SetAudTermS01andSO2
	SND_SetNoiseDividingRatioOfFreqs 1
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_Stop


Music0b_SQ1::
:	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 4, $46
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 6, $a0
	SND_SaveEnvelopeValue 7, $60
	SND_SquareSet25Wave1
	SND_SetFreqTableBaseIdx $ee
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $80
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Bnote , 6, 1, $18
	PlayNote Csharp, 7, 1, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Enote , 7, 6, $60
	PlayNote Enote , 7, 1, $28
	SND_ClearHWRegs $08
	PlayNote Dnote , 7, 1, $18
	PlayNote Csharp, 7, 1, $18
	PlayNote Bnote , 6, 1, $60
	PlayNote Enote , 6, 1, $60
	PlayNote Bnote , 6, 2, $18
	PlayNote Anote , 6, 1, $18
	PlayNote Bnote , 6, 2, $18
	PlayNote Csharp, 7, 6, $60
	PlayNote Csharp, 7, 6, $60
	PlayNote Csharp, 7, 6, $60
	PlayNote Csharp, 7, 1, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Csharp, 7, 1, $18
	PlayNote Bnote , 6, 1, $18
	PlayNote Enote , 6, 6, $18
	PlayNote Enote , 6, 6, $60
	PlayNote Enote , 6, 1, $60
	PlayNote Enote , 7, 1, $60
	PlayNote Fsharp, 7, 1, $48
	PlayNote Gsharp, 7, 1, $0c
	PlayNote Anote , 7, 1, $3c
	PlayNote Gsharp, 7, 1, $30
	PlayNote Fsharp, 7, 1, $48
	PlayNote Enote , 7, 1, $48
	PlayNote Anote , 6, 1, $30
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 3, $18
	PlayNote Anote , 5, 4, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 3, $18
	PlayNote Anote , 5, 4, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 3, $18
	PlayNote Anote , 5, 4, $18
	SND_ClearHWRegs $48
	SND_ClearHWRegs $60
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 3, $18
	PlayNote Anote , 5, 4, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Fsharp, 7, 3, $18
	PlayNote Anote , 7, 1, $18
	PlayNote Anote , 7, 3, $18
	PlayNote Anote , 7, 1, $18
	PlayNote Anote , 7, 3, $18
	PlayNote Anote , 7, 1, $18
	PlayNote Anote , 7, 3, $18
	SND_ClearHWRegs $30
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 3, $18
	PlayNote Anote , 5, 4, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 3, $18
	PlayNote Anote , 5, 4, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Anote , 5, 1, $18
	PlayNote Anote , 5, 3, $18
	PlayNote Anote , 5, 4, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	SND_Jump :-


Music0b_SQ2::
:	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 6, $a0
	SND_SaveEnvelopeValue 7, $60
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $fa
	SND_SetAudTermS01andSO2
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 3, $18
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 3, $18
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Enote , 5, 1, $48
	PlayNote Anote , 5, 1, $48
	PlayNote Dnote , 6, 1, $30
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 3, $18
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 3, $18
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Enote , 5, 1, $30
	PlayNote Dsharp, 6, 1, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Enote , 6, 1, $0c
	PlayNote Enote , 6, 3, $0c
	PlayNote Cnote , 6, 1, $0c
	PlayNote Cnote , 6, 3, $0c
	PlayNote Csharp, 6, 1, $0c
	PlayNote Csharp, 6, 3, $0c
	PlayNote Fsharp, 5, 1, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Gnote , 5, 1, $0c
	PlayNote Gnote , 5, 3, $0c
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 3, $18
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 3, $18
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Enote , 5, 1, $48
	PlayNote Anote , 5, 1, $48
	PlayNote Dnote , 6, 1, $30
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 3, $18
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 3, $18
	PlayNote Anote , 4, 1, $18
	PlayNote Anote , 4, 3, $18
	PlayNote Csharp, 6, 1, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Enote , 5, 1, $48
	PlayNote Bnote , 5, 1, $48
	PlayNote Csharp, 6, 1, $30
	SND_Jump :-


Music0b_Wav::
:	SND_SaveEnvelopeValue 2, $a6
	SND_SetFreqTableBaseIdx $e2
	SND_SetAudTermS02
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
	PlayNote Enote , 7, 2, $18
	PlayNote Fsharp, 7, 2, $18
	PlayNote Enote , 7, 2, $60
	PlayNote Enote , 7, 2, $60
	PlayNote Enote , 7, 2, $60
	PlayNote Enote , 7, 2, $60
	PlayNote Enote , 7, 2, $30
	PlayNote Dnote , 7, 2, $48
	PlayNote Csharp, 7, 2, $30
	PlayNote Bnote , 6, 2, $0c
	PlayNote Anote , 6, 2, $0c
	PlayNote Bnote , 6, 2, $60
	PlayNote Bnote , 6, 2, $60
	PlayNote Bnote , 6, 2, $60
	PlayNote Bnote , 6, 2, $30
	PlayNote Anote , 6, 2, $18
	PlayNote Gsharp, 6, 2, $18
	PlayNote Fsharp, 6, 2, $48
	PlayNote Gsharp, 6, 2, $18
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Enote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Anote , 5, 2, $60
	PlayNote Anote , 5, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Csharp, 6, 2, $60
	PlayNote Anote , 5, 2, $48
	PlayNote Enote , 6, 2, $48
	PlayNote Fsharp, 7, 2, $30
	PlayNote Enote , 7, 2, $60
	PlayNote Enote , 7, 2, $60
	PlayNote Enote , 7, 2, $48
	PlayNote Dnote , 7, 2, $48
	PlayNote Csharp, 7, 2, $30
	PlayNote Bnote , 6, 2, $48
	PlayNote Gsharp, 6, 2, $48
	PlayNote Fsharp, 6, 2, $30
	PlayNote Enote , 6, 2, $60
	PlayNote Fsharp, 7, 2, $60
	PlayNote Enote , 7, 2, $60
	PlayNote Enote , 7, 2, $60
	PlayNote Enote , 7, 2, $48
	PlayNote Dnote , 7, 2, $48
	PlayNote Csharp, 7, 2, $30
	PlayNote Dnote , 7, 2, $48
	PlayNote Csharp, 7, 2, $48
	PlayNote Bnote , 6, 2, $30
	PlayNote Enote , 6, 2, $60
	PlayNote Fsharp, 7, 2, $60
	PlayNote Enote , 7, 2, $60
	PlayNote Enote , 7, 2, $60
	PlayNote Enote , 7, 2, $48
	PlayNote Dnote , 7, 2, $48
	PlayNote Csharp, 7, 2, $30
	PlayNote Enote , 6, 2, $60
	PlayNote Fsharp, 6, 2, $60
	PlayNote Gsharp, 6, 2, $60
	PlayNote Anote , 6, 2, $60
	PlayNote Bnote , 6, 2, $48
	PlayNote Csharp, 7, 2, $48
	PlayNote Bnote , 6, 2, $60
	PlayNote Bnote , 6, 2, $60
	PlayNote Csharp, 7, 2, $18
	PlayNote Dnote , 7, 2, $18
	PlayNote Enote , 7, 2, $48
	PlayNote Dnote , 8, 2, $48
	PlayNote Csharp, 8, 2, $30
	PlayNote Anote , 7, 2, $60
	PlayNote Anote , 7, 2, $60
	SND_Jump :-


Music0b_Noise::
:	SND_SaveEnvelopeValue 0, $46
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $24
	SND_Jump :-


Music0c_SQ1::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 6, $a0
	SND_SaveEnvelopeValue 7, $60
	SND_SquareSet75Wave2
	SND_SetFreqTableBaseIdx $f4
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_ClearHWRegs $30
	PlayNote Anote , 6, 1, $18
	PlayNote Anote , 6, 3, $18
	PlayNote Anote , 6, 1, $18
	PlayNote Anote , 6, 3, $18
	PlayNote Anote , 6, 1, $18
	PlayNote Anote , 6, 3, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 3, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 3, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 3, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 3, $18
	PlayNote Gnote , 6, 1, $48
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 3, $18
	PlayNote Gnote , 7, 1, $18
	PlayNote Gnote , 7, 3, $18
	PlayNote Anote , 7, 6, $60
	PlayNote Anote , 7, 6, $60
	PlayNote Anote , 7, 6, $60
	PlayNote Anote , 7, 6, $60
	PlayNote Anote , 7, 6, $60
	PlayNote Anote , 7, 1, $60
	SND_Stop


Music0c_SQ2::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 6, $a0
	SND_SaveEnvelopeValue 7, $60
	SND_SquareSet75Wave2
	SND_SetFreqTableBaseIdx $f4
	SND_SetAudTermS01andSO2
	SND_ClearHWRegs $30
	PlayNote Bnote , 5, 1, $18
	PlayNote Bnote , 5, 3, $18
	PlayNote Bnote , 5, 1, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Fnote , 6, 3, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Fnote , 6, 3, $18
	PlayNote Dsharp, 6, 1, $48
	PlayNote Gnote , 6, 1, $18
	PlayNote Gnote , 6, 1, $18
	PlayNote Gnote , 6, 3, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 3, $18
	PlayNote Anote , 8, 1, $0c
	PlayNote Fsharp, 8, 1, $0c
	PlayNote Dnote , 8, 1, $0c
	PlayNote Fsharp, 8, 1, $0c
	PlayNote Dnote , 8, 1, $0c
	PlayNote Anote , 7, 1, $0c
	PlayNote Dnote , 8, 1, $0c
	PlayNote Anote , 7, 1, $0c
	PlayNote Fsharp, 7, 1, $0c
	PlayNote Anote , 7, 1, $0c
	PlayNote Fsharp, 7, 1, $0c
	PlayNote Dnote , 7, 1, $0c
	PlayNote Fsharp, 7, 1, $0c
	PlayNote Dnote , 7, 1, $0c
	PlayNote Anote , 6, 1, $0c
	PlayNote Dnote , 7, 1, $0c
	PlayNote Anote , 6, 1, $0c
	PlayNote Fsharp, 6, 1, $0c
	PlayNote Anote , 6, 1, $0c
	PlayNote Fsharp, 6, 1, $0c
	PlayNote Dnote , 6, 1, $0c
	PlayNote Fsharp, 6, 1, $0c
	PlayNote Dnote , 6, 1, $0c
	PlayNote Anote , 5, 1, $0c
	PlayNote Dnote , 6, 1, $0c
	PlayNote Anote , 5, 1, $0c
	PlayNote Fsharp, 5, 1, $0c
	PlayNote Dnote , 5, 6, $60
	PlayNote Dnote , 5, 6, $60
	PlayNote Dnote , 5, 1, $3c
	SND_Stop


Music0c_Wav::
	SND_SaveEnvelopeValue 2, $a6
	SND_SetFreqTableBaseIdx $f4
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	PlayNote Gnote , 4, 2, $30
	PlayNote Gnote , 5, 2, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 2, $30
	PlayNote Cnote , 5, 2, $18
	PlayNote Dnote , 5, 2, $0c
	SND_ClearHWRegs $0c
	PlayNote Fnote , 5, 2, $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 4, 2, $30
	PlayNote Asharp, 5, 2, $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 4, 2, $30
	PlayNote Fnote , 5, 2, $18
	PlayNote Gnote , 5, 2, $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 5, 2, $0c
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 4, 2, $48
	PlayNote Dsharp, 5, 2, $48
	PlayNote Gsharp, 5, 2, $30
	PlayNote Gnote , 4, 2, $60
	PlayNote Gnote , 4, 2, $60
	PlayNote Gnote , 4, 2, $60
	PlayNote Gnote , 4, 2, $60
	PlayNote Gnote , 4, 2, $60
	PlayNote Gnote , 4, 2, $60
	SND_Stop


Music0c_Noise::
	SND_SaveEnvelopeValue 0, $c6
	SND_SetAudTermS01
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $3c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $0f
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $02
	NoiseSCF $02
	SND_ClearHWRegs $0c
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $24
	NoiseSCF $08
	NoiseSCF $02
	SND_ClearHWRegs $54
	NoiseSCF $08
	NoiseSCF $02
	SND_Stop


Music0d_SQ1::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave1
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $03
	SND_Call SquareFunc_002_5437
	SND_Stop


Music0d_SQ2::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01
	SND_Call SquareFunc_002_598a
	SND_Stop


Music0d_Wav::
	SND_SaveEnvelopeValue 1, $c6
	SND_SetFreqTableBaseIdx $00
	SND_SetAudTermS01andSO2
	SND_Call WavFunc_002_5c37
	SND_Stop


Music0d_Noise::
	SND_SaveEnvelopeValue 1, $66
	SND_SetAudTermS01andSO2
	NoiseSCF $0f
	NoiseSCF $21
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $21
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $21
	SND_ClearHWRegs $04
	NoiseSCF $08
	NoiseSCF $21
	SND_ClearHWRegs $04
	NoiseSCF $08
	NoiseSCF $21
	SND_ClearHWRegs $04
	NoiseSCF $08
	NoiseSCF $21
	SND_ClearHWRegs $04
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Call NoiseFunc_002_5406
	SND_Stop


NoiseFunc_002_5406:
	NoiseSCF $0f
	NoiseSCF $21
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $21
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $21
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $21
	SND_ClearHWRegs $28
	NoiseSCF $0f
	NoiseSCF $21
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $21
	SND_ClearHWRegs $10
	NoiseSCF $08
	NoiseSCF $21
	SND_ClearHWRegs $10
	NoiseSCF $0f
	NoiseSCF $21
	SND_ClearHWRegs $28
	NoiseSCF $08
	NoiseSCF $21
	SND_ClearHWRegs $04
	NoiseSCF $08
	NoiseSCF $21
	SND_ClearHWRegs $04
	NoiseSCF $08
	NoiseSCF $21
	SND_ClearHWRegs $04
	NoiseSCF $08
	NoiseSCF $21
	SND_ClearHWRegs $04
	SND_Ret
	
	
SquareFunc_002_5437:
	SND_ClearHWRegs $60
	PlayNote Anote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 5, 6, $0c
	PlayNote Dnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 6, $0c
	PlayNote Fsharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Anote , 5, 3, $18
	PlayNote Bnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	PlayNote Dnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 6, $0c
	PlayNote Fsharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	PlayNote Csharp, 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Csharp, 6, 3, $18
	PlayNote Dnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 6, $0c
	PlayNote Fsharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Csharp, 6, 3, $18
	PlayNote Bnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	PlayNote Dnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 6, $0c
	PlayNote Fsharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Anote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 5, 6, $0c
	PlayNote Gnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Gnote , 5, 6, $0c
	PlayNote Dnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 6, $0c
	PlayNote Enote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 5, 6, $0c
	PlayNote Fsharp, 5, 3, $18
	PlayNote Gnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Gnote , 5, 6, $0c
	PlayNote Gnote , 5, 3, $18
	PlayNote Anote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Csharp, 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Dnote , 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Csharp, 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Dnote , 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Enote , 6, 3, $18
	PlayNote Fsharp, 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Fsharp, 6, 3, $18
	PlayNote Enote , 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 6, 6, $0c
	PlayNote Dnote , 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Csharp, 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Bnote , 5, 3, $18
	PlayNote Fsharp, 5, 4, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Dnote , 5, 4, $0c
	PlayNote Dnote , 5, 6, $0c
	PlayNote Csharp, 6, 3, $18
	PlayNote Fsharp, 5, 4, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Dnote , 5, 4, $0c
	PlayNote Dnote , 5, 6, $0c
	PlayNote Dnote , 6, 3, $18
	PlayNote Fsharp, 5, 4, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Dnote , 5, 4, $0c
	PlayNote Dnote , 5, 6, $0c
	PlayNote Csharp, 6, 3, $18
	PlayNote Fsharp, 5, 4, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Dnote , 5, 4, $0c
	PlayNote Dnote , 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	PlayNote Bnote , 4, 4, $0c
	PlayNote Bnote , 4, 6, $0c
	PlayNote Anote , 5, 3, $18
	PlayNote Fsharp, 4, 4, $0c
	PlayNote Fsharp, 4, 6, $0c
	PlayNote Anote , 5, 3, $18
	PlayNote Fsharp, 5, 4, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Csharp, 5, 4, $0c
	PlayNote Csharp, 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	PlayNote Fsharp, 5, 4, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Csharp, 5, 4, $0c
	PlayNote Csharp, 5, 6, $0c
	PlayNote Csharp, 6, 3, $18
	PlayNote Fsharp, 5, 4, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Csharp, 5, 4, $0c
	PlayNote Csharp, 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	PlayNote Fsharp, 5, 4, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Csharp, 5, 4, $0c
	PlayNote Csharp, 5, 6, $0c
	PlayNote Anote , 5, 3, $18
	PlayNote Bnote , 5, 3, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Dnote , 6, 3, $18
	PlayNote Enote , 6, 3, $54
	PlayNote Enote , 6, 4, $24
	PlayNote Enote , 6, 6, $18
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Gsharp, 6, 3, $0c
	PlayNote Bnote , 6, 3, $0c
	PlayNote Dsharp, 7, 3, $0c
	PlayNote Enote , 7, 3, $54
	PlayNote Enote , 7, 4, $24
	PlayNote Enote , 7, 6, $18
	PlayNote Fsharp, 7, 3, $18
	PlayNote Gsharp, 7, 3, $18
	PlayNote Anote , 7, 3, $24
	SND_ClearHWRegs $0c
	PlayNote Anote , 7, 6, $18
	PlayNote Bnote , 7, 3, $24
	SND_ClearHWRegs $0c
	PlayNote Bnote , 7, 6, $18
	PlayNote Csharp, 8, 3, $24
	SND_ClearHWRegs $0c
	PlayNote Csharp, 8, 6, $18
	PlayNote Dnote , 8, 3, $24
	SND_ClearHWRegs $0c
	PlayNote Dnote , 8, 6, $18
	PlayNote Enote , 8, 3, $24
	SND_ClearHWRegs $0c
	PlayNote Enote , 8, 6, $18
	SND_ClearHWRegs $18
	PlayNote Anote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 5, 6, $0c
	PlayNote Dnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 6, $0c
	PlayNote Fsharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Anote , 5, 3, $18
	PlayNote Bnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	PlayNote Dnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 6, $0c
	PlayNote Fsharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	PlayNote Csharp, 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Csharp, 6, 3, $18
	PlayNote Dnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 6, $0c
	PlayNote Fsharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Csharp, 6, 3, $18
	PlayNote Bnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	PlayNote Dnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 6, $0c
	PlayNote Fsharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Anote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 5, 6, $0c
	PlayNote Cnote , 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 6, 6, $0c
	PlayNote Dnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 6, $0c
	PlayNote Fnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fnote , 5, 6, $0c
	PlayNote Anote , 5, 3, $18
	PlayNote Cnote , 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 6, 6, $0c
	PlayNote Cnote , 6, 3, $18
	PlayNote Asharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Anote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 5, 6, $0c
	PlayNote Gnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Gnote , 5, 6, $0c
	PlayNote Fnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fnote , 5, 6, $0c
	PlayNote Cnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 5, 6, $0c
	PlayNote Fnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fnote , 5, 6, $0c
	PlayNote Gnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Gnote , 5, 6, $0c
	PlayNote Anote , 5, 3, $3c
	PlayNote Gsharp, 5, 3, $0c
	PlayNote Gnote , 5, 3, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fnote , 5, 3, $48
	PlayNote Enote , 5, 3, $0c
	PlayNote Dsharp, 5, 3, $0c
	PlayNote Dnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 6, $0c
	PlayNote Dnote , 5, 3, $18
	PlayNote Fnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fnote , 5, 6, $0c
	PlayNote Fnote , 5, 3, $18
	PlayNote Asharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Dnote , 6, 3, $60
	PlayNote Dnote , 6, 4, $30
	PlayNote Dnote , 6, 6, $18
	SND_ClearHWRegs $18
	PlayNote Csharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Csharp, 5, 6, $0c
	PlayNote Csharp, 5, 3, $18
	PlayNote Fnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fnote , 5, 6, $0c
	PlayNote Fnote , 5, 3, $18
	PlayNote Gsharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Csharp, 6, 3, $48
	PlayNote Csharp, 6, 6, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Csharp, 6, 6, $18
	PlayNote Dsharp, 6, 3, $18
	PlayNote Dsharp, 6, 6, $18
	PlayNote Enote , 6, 3, $60
	PlayNote Enote , 6, 3, $0c
	PlayNote Enote , 6, 6, $0c
	PlayNote Bnote , 5, 3, $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Gsharp, 5, 3, $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Enote , 5, 3, $0c
	PlayNote Enote , 5, 6, $0c
	PlayNote Bnote , 4, 3, $10
	PlayNote Bnote , 4, 6, $10
	PlayNote Enote , 5, 3, $10
	PlayNote Enote , 5, 6, $10
	PlayNote Gsharp, 5, 3, $10
	PlayNote Gsharp, 5, 6, $10
	PlayNote Bnote , 5, 3, $10
	PlayNote Bnote , 5, 6, $10
	PlayNote Enote , 6, 3, $10
	PlayNote Enote , 6, 6, $10
	PlayNote Gsharp, 6, 3, $10
	PlayNote Gsharp, 6, 6, $10
	PlayNote Bnote , 6, 3, $60
	PlayNote Bnote , 6, 3, $0c
	PlayNote Bnote , 6, 6, $0c
	PlayNote Gnote , 6, 3, $0c
	PlayNote Gnote , 6, 6, $0c
	PlayNote Dnote , 6, 3, $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Bnote , 5, 3, $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Gnote , 5, 3, $10
	PlayNote Gnote , 5, 6, $10
	PlayNote Bnote , 5, 3, $10
	PlayNote Bnote , 5, 6, $10
	PlayNote Dnote , 6, 3, $10
	PlayNote Dnote , 6, 6, $10
	PlayNote Gnote , 6, 3, $10
	PlayNote Gnote , 6, 6, $10
	PlayNote Bnote , 6, 3, $10
	PlayNote Bnote , 6, 6, $10
	PlayNote Csharp, 7, 3, $10
	PlayNote Csharp, 7, 6, $10
	PlayNote Enote , 7, 4, $0c
	PlayNote Fnote , 7, 4, $0c
	PlayNote Fsharp, 7, 4, $0c
	PlayNote Gnote , 7, 4, $0c
	PlayNote Gsharp, 7, 4, $0c
	PlayNote Anote , 7, 4, $0c
	PlayNote Asharp, 7, 4, $0c
	PlayNote Bnote , 7, 4, $0c
	PlayNote Cnote , 8, 4, $0c
	PlayNote Csharp, 8, 4, $0c
	PlayNote Dnote , 8, 4, $0c
	PlayNote Dsharp, 8, 4, $0c
	PlayNote Enote , 8, 4, $0c
	PlayNote Fnote , 8, 4, $0c
	PlayNote Fsharp, 8, 4, $0c
	PlayNote Gnote , 8, 4, $0c
	PlayNote Gsharp, 8, 4, $0c
	PlayNote Anote , 8, 4, $0c
	PlayNote Asharp, 8, 4, $0c
	PlayNote Bnote , 8, 4, $0c
	PlayNote Cnote , 9, 4, $0c
	PlayNote Csharp, 9, 4, $0c
	PlayNote Dnote , 9, 4, $0c
	PlayNote Dsharp, 9, 4, $0c
	SND_ClearHWRegs $60
	PlayNote Fsharp, 6, 3, $20
	PlayNote Fsharp, 6, 6, $10
	PlayNote Fsharp, 6, 3, $18
	SND_ClearHWRegs $08
	PlayNote Fsharp, 6, 6, $10
	PlayNote Csharp, 6, 3, $18
	PlayNote Fsharp, 6, 3, $20
	PlayNote Fsharp, 6, 6, $10
	PlayNote Gsharp, 6, 3, $18
	PlayNote Asharp, 6, 3, $18
	PlayNote Asharp, 6, 6, $10
	PlayNote Gsharp, 6, 3, $20
	PlayNote Gsharp, 6, 6, $18
	PlayNote Fsharp, 6, 3, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Dsharp, 6, 3, $18
	PlayNote Fsharp, 6, 3, $18
	PlayNote Gsharp, 6, 3, $20
	PlayNote Gsharp, 6, 6, $10
	PlayNote Gsharp, 6, 3, $18
	PlayNote Gsharp, 6, 3, $20
	PlayNote Gsharp, 6, 6, $10
	PlayNote Asharp, 6, 3, $20
	PlayNote Asharp, 6, 6, $10
	PlayNote Fnote , 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fnote , 6, 6, $0c
	PlayNote Csharp, 6, 3, $48
	PlayNote Dsharp, 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dsharp, 6, 6, $0c
	PlayNote Fnote , 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fnote , 6, 6, $0c
	PlayNote Fsharp, 6, 3, $20
	PlayNote Fsharp, 6, 6, $20
	SND_ClearHWRegs $08
	PlayNote Fsharp, 6, 3, $20
	PlayNote Fsharp, 6, 6, $20
	SND_ClearHWRegs $08
	PlayNote Fsharp, 6, 3, $20
	PlayNote Fsharp, 6, 6, $20
	SND_ClearHWRegs $08
	PlayNote Fsharp, 6, 3, $24
	PlayNote Fsharp, 6, 6, $24
	PlayNote Fsharp, 6, 3, $18
	PlayNote Fsharp, 6, 6, $18
	PlayNote Gsharp, 6, 3, $18
	PlayNote Gsharp, 6, 6, $18
	PlayNote Fsharp, 6, 3, $60
	PlayNote Fsharp, 6, 3, $30
	PlayNote Fnote , 6, 4, $0c
	PlayNote Enote , 6, 4, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Dnote , 6, 3, $0c
	PlayNote Csharp, 6, 3, $30
	PlayNote Csharp, 6, 4, $18
	PlayNote Csharp, 6, 6, $18
	PlayNote Dsharp, 6, 3, $30
	PlayNote Enote , 6, 3, $0c
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Gsharp, 6, 3, $0c
	PlayNote Asharp, 6, 3, $0c
	PlayNote Cnote , 7, 3, $60
	PlayNote Cnote , 7, 4, $18
	PlayNote Cnote , 7, 6, $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 7, 3, $18
	PlayNote Dsharp, 7, 3, $18
	PlayNote Fnote , 7, 3, $30
	PlayNote Fnote , 7, 6, $10
	PlayNote Gnote , 7, 3, $30
	PlayNote Gnote , 7, 6, $10
	PlayNote Gsharp, 7, 3, $30
	PlayNote Gsharp, 7, 6, $10
	PlayNote Asharp, 7, 3, $30
	PlayNote Asharp, 7, 4, $18
	PlayNote Asharp, 7, 6, $0c
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 7, 3, $30
	PlayNote Gsharp, 7, 4, $18
	PlayNote Gsharp, 7, 6, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 7, 3, $30
	PlayNote Gsharp, 7, 3, $18
	PlayNote Fnote , 7, 3, $60
	PlayNote Fnote , 7, 6, $18
	PlayNote Fsharp, 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Fsharp, 6, 3, $20
	PlayNote Fsharp, 6, 6, $10
	PlayNote Csharp, 6, 3, $18
	PlayNote Fsharp, 6, 3, $20
	PlayNote Fsharp, 6, 6, $10
	PlayNote Gsharp, 6, 3, $18
	PlayNote Asharp, 6, 3, $20
	PlayNote Asharp, 6, 6, $10
	PlayNote Gsharp, 6, 3, $20
	PlayNote Gsharp, 6, 6, $10
	PlayNote Fsharp, 6, 3, $18
	PlayNote Csharp, 6, 3, $18
	PlayNote Dsharp, 6, 3, $18
	PlayNote Fsharp, 6, 3, $18
	PlayNote Gsharp, 6, 3, $20
	PlayNote Gsharp, 6, 6, $10
	PlayNote Gsharp, 6, 3, $0c
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 6, 3, $20
	PlayNote Gsharp, 6, 6, $10
	PlayNote Asharp, 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Asharp, 6, 6, $0c
	PlayNote Fnote , 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fnote , 6, 6, $0c
	PlayNote Csharp, 6, 3, $48
	PlayNote Dsharp, 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dsharp, 6, 6, $0c
	PlayNote Fnote , 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fnote , 6, 6, $0c
	PlayNote Fsharp, 6, 3, $60
	PlayNote Fsharp, 6, 3, $30
	PlayNote Fnote , 6, 3, $18
	PlayNote Enote , 6, 3, $0c
	PlayNote Dsharp, 6, 3, $0c
	PlayNote Dnote , 6, 3, $30
	PlayNote Dnote , 6, 4, $18
	PlayNote Dnote , 6, 6, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 6, 3, $20
	PlayNote Fnote , 6, 3, $20
	PlayNote Dsharp, 6, 3, $20
	PlayNote Fnote , 6, 3, $60
	PlayNote Fnote , 6, 3, $24
	PlayNote Fsharp, 6, 3, $0c
	PlayNote Gsharp, 6, 3, $30
	PlayNote Fsharp, 6, 2, $30
	PlayNote Fsharp, 6, 4, $18
	PlayNote Fsharp, 6, 6, $0c
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 6, 6, $0c
	PlayNote Asharp, 6, 3, $18
	PlayNote Asharp, 6, 6, $0c
	SND_ClearHWRegs $0c
	PlayNote Bnote , 6, 3, $54
	PlayNote Asharp, 6, 3, $0c
	PlayNote Gsharp, 6, 3, $60
	PlayNote Gsharp, 6, 3, $54
	PlayNote Gnote , 6, 3, $0c
	PlayNote Fnote , 6, 3, $60
	PlayNote Fnote , 6, 4, $18
	PlayNote Fnote , 6, 6, $0c
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Asharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Csharp, 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Dsharp, 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dsharp, 6, 6, $0c
	PlayNote Fnote , 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fnote , 6, 6, $0c
	PlayNote Fsharp, 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Gsharp, 6, 3, $54
	PlayNote Gnote , 6, 3, $0c
	PlayNote Fnote , 6, 3, $60
	PlayNote Fnote , 6, 3, $54
	PlayNote Enote , 6, 3, $0c
	PlayNote Csharp, 6, 3, $60
	PlayNote Csharp, 6, 4, $18
	PlayNote Csharp, 6, 6, $0c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Csharp, 5, 6, $0c
	PlayNote Dsharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dsharp, 5, 6, $0c
	PlayNote Fnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fnote , 5, 6, $0c
	PlayNote Fsharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Gsharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Asharp, 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
	PlayNote Csharp, 5, 3, $0c
	PlayNote Csharp, 5, 6, $0c
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Gsharp, 5, 3, $48
	PlayNote Gsharp, 5, 4, $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Asharp, 5, 3, $48
	PlayNote Asharp, 5, 4, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Bnote , 5, 3, $30
	PlayNote Bnote , 5, 4, $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Asharp, 5, 3, $18
	PlayNote Asharp, 5, 4, $0c
	PlayNote Asharp, 5, 6, $0c
	SND_ClearHWRegs $18
	PlayNote Fsharp, 5, 3, $48
	PlayNote Fsharp, 5, 4, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Asharp, 5, 3, $18
	PlayNote Asharp, 5, 4, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Fsharp, 5, 3, $18
	PlayNote Fsharp, 5, 4, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Gsharp, 5, 3, $18
	PlayNote Gsharp, 5, 4, $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Asharp, 5, 3, $30
	PlayNote Asharp, 5, 4, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Bnote , 5, 3, $30
	PlayNote Bnote , 5, 4, $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Csharp, 6, 3, $48
	PlayNote Csharp, 6, 4, $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Bnote , 5, 3, $18
	PlayNote Bnote , 5, 4, $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Asharp, 5, 3, $18
	PlayNote Asharp, 5, 4, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Fsharp, 5, 3, $18
	PlayNote Fsharp, 5, 4, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Gsharp, 5, 3, $30
	PlayNote Gsharp, 5, 4, $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Fsharp, 5, 3, $30
	PlayNote Fsharp, 5, 4, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Dnote , 5, 3, $60
	PlayNote Dnote , 5, 3, $30
	PlayNote Dnote , 5, 4, $18
	PlayNote Dnote , 5, 6, $0c
	SND_ClearHWRegs $3c
	PlayNote Csharp, 5, 3, $48
	PlayNote Csharp, 5, 6, $18
	PlayNote Fsharp, 4, 3, $48
	PlayNote Fsharp, 4, 6, $18
	PlayNote Csharp, 5, 3, $48
	PlayNote Csharp, 5, 6, $18
	PlayNote Fsharp, 5, 3, $48
	PlayNote Fsharp, 5, 6, $18
	PlayNote Gsharp, 5, 3, $60
	PlayNote Gsharp, 5, 4, $18
	PlayNote Gsharp, 5, 6, $18
	PlayNote Fsharp, 5, 3, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Gsharp, 5, 3, $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Asharp, 5, 3, $30
	PlayNote Asharp, 5, 4, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Gsharp, 5, 3, $30
	PlayNote Gsharp, 5, 4, $0c
	PlayNote Gsharp, 5, 6, $0c
	PlayNote Asharp, 5, 3, $18
	PlayNote Asharp, 5, 4, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Bnote , 5, 3, $30
	PlayNote Bnote , 5, 4, $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Asharp, 5, 3, $30
	PlayNote Asharp, 5, 4, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Fsharp, 5, 3, $60
	PlayNote Fsharp, 5, 3, $30
	PlayNote Fsharp, 5, 4, $30
	PlayNote Fsharp, 5, 6, $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 5, 3, $30
	PlayNote Bnote , 5, 4, $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Asharp, 5, 3, $24
	PlayNote Asharp, 5, 4, $0c
	PlayNote Asharp, 5, 6, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 5, 3, $60
	PlayNote Fsharp, 5, 4, $18
	PlayNote Fsharp, 5, 6, $0c
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 5, 3, $24
	PlayNote Gsharp, 5, 4, $0c
	PlayNote Gsharp, 5, 6, $0c
	SND_ClearHWRegs $24
	PlayNote Asharp, 5, 3, $60
	PlayNote Asharp, 5, 3, $60
	PlayNote Asharp, 5, 3, $60
	PlayNote Asharp, 5, 3, $30
	PlayNote Asharp, 5, 4, $18
	PlayNote Asharp, 5, 6, $18
	SND_Ret
	
	
SquareFunc_002_598a:
	PlayNote Anote , 6, 1, $60
	PlayNote Anote , 7, 1, $60
	PlayNote Anote , 7, 1, $60
	PlayNote Anote , 7, 4, $18
	PlayNote Anote , 7, 6, $18
	PlayNote Gnote , 7, 1, $30
	PlayNote Fsharp, 7, 1, $30
	PlayNote Dnote , 7, 1, $30
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 6, $18
	PlayNote Fsharp, 7, 1, $18
	PlayNote Anote , 6, 1, $60
	PlayNote Anote , 6, 1, $30
	PlayNote Anote , 6, 4, $18
	PlayNote Anote , 6, 6, $18
	SND_ClearHWRegs $18
	PlayNote Anote , 6, 1, $30
	PlayNote Asharp, 6, 1, $30
	PlayNote Bnote , 6, 1, $48
	PlayNote Gnote , 7, 1, $60
	PlayNote Gnote , 7, 1, $30
	PlayNote Gnote , 7, 6, $18
	PlayNote Fsharp, 7, 1, $30
	PlayNote Gnote , 7, 1, $30
	PlayNote Bnote , 7, 1, $30
	PlayNote Anote , 7, 1, $18
	PlayNote Anote , 7, 6, $18
	PlayNote Bnote , 7, 1, $18
	PlayNote Fsharp, 7, 1, $60
	PlayNote Fsharp, 7, 1, $30
	PlayNote Fsharp, 7, 4, $24
	PlayNote Fsharp, 7, 6, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 7, 1, $60
	PlayNote Bnote , 7, 1, $60
	PlayNote Bnote , 7, 1, $60
	PlayNote Bnote , 7, 1, $18
	PlayNote Bnote , 7, 6, $18
	PlayNote Anote , 7, 1, $30
	PlayNote Csharp, 7, 1, $30
	PlayNote Anote , 7, 4, $30
	PlayNote Anote , 7, 1, $60
	PlayNote Anote , 7, 1, $60
	PlayNote Anote , 7, 1, $18
	PlayNote Anote , 7, 6, $18
	PlayNote Gnote , 7, 1, $30
	PlayNote Fsharp, 7, 1, $30
	PlayNote Anote , 6, 1, $30
	PlayNote Gsharp, 6, 1, $48
	PlayNote Dnote , 7, 1, $60
	PlayNote Dnote , 7, 1, $30
	PlayNote Dnote , 7, 6, $18
	PlayNote Bnote , 6, 1, $30
	PlayNote Csharp, 7, 1, $30
	PlayNote Dnote , 7, 1, $30
	PlayNote Enote , 7, 1, $60
	PlayNote Enote , 7, 1, $60
	PlayNote Enote , 7, 1, $24
	PlayNote Enote , 7, 4, $24
	PlayNote Enote , 7, 6, $18
	PlayNote Anote , 6, 1, $60
	PlayNote Anote , 7, 1, $60
	PlayNote Anote , 7, 1, $60
	PlayNote Anote , 7, 4, $18
	PlayNote Anote , 7, 6, $18
	PlayNote Gnote , 7, 1, $30
	PlayNote Fsharp, 7, 1, $30
	PlayNote Dnote , 7, 1, $30
	PlayNote Anote , 7, 1, $60
	PlayNote Anote , 7, 1, $60
	PlayNote Anote , 7, 4, $18
	PlayNote Anote , 7, 6, $18
	PlayNote Gnote , 7, 1, $30
	PlayNote Fsharp, 7, 1, $30
	PlayNote Dnote , 7, 1, $30
	PlayNote Anote , 7, 1, $60
	PlayNote Anote , 7, 1, $30
	PlayNote Anote , 7, 4, $18
	PlayNote Anote , 7, 6, $18
	PlayNote Asharp, 7, 1, $30
	PlayNote Asharp, 7, 4, $18
	PlayNote Asharp, 7, 6, $18
	PlayNote Cnote , 8, 1, $30
	PlayNote Cnote , 8, 4, $18
	PlayNote Cnote , 8, 6, $18
	PlayNote Dnote , 8, 1, $48
	PlayNote Cnote , 8, 1, $24
	PlayNote Cnote , 8, 6, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 7, 1, $60
	PlayNote Enote , 7, 1, $30
	PlayNote Enote , 7, 6, $30
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 6, $18
	PlayNote Fnote , 7, 1, $60
	PlayNote Fnote , 7, 1, $60
	PlayNote Fnote , 7, 4, $18
	PlayNote Fnote , 7, 6, $18
	PlayNote Enote , 7, 1, $30
	PlayNote Dnote , 7, 1, $30
	PlayNote Enote , 7, 1, $18
	PlayNote Fnote , 7, 4, $18
	PlayNote Fnote , 7, 1, $60
	PlayNote Fnote , 7, 1, $60
	PlayNote Fnote , 7, 4, $18
	PlayNote Fnote , 7, 6, $18
	SND_ClearHWRegs $30
	PlayNote Fnote , 7, 1, $30
	PlayNote Gnote , 7, 1, $18
	PlayNote Gsharp, 7, 4, $18
	PlayNote Gsharp, 7, 1, $60
	PlayNote Gsharp, 7, 1, $60
	PlayNote Gsharp, 7, 1, $30
	PlayNote Gsharp, 7, 4, $18
	PlayNote Gsharp, 7, 6, $18
	PlayNote Gsharp, 7, 1, $30
	PlayNote Anote , 7, 1, $18
	PlayNote Bnote , 7, 4, $18
	PlayNote Bnote , 7, 1, $60
	PlayNote Bnote , 7, 1, $48
	PlayNote Bnote , 7, 4, $18
	PlayNote Bnote , 7, 6, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 7, 1, $30
	PlayNote Anote , 7, 1, $30
	PlayNote Bnote , 7, 1, $30
	PlayNote Csharp, 8, 1, $60
	PlayNote Csharp, 8, 1, $60
	PlayNote Csharp, 8, 1, $60
	PlayNote Csharp, 8, 1, $30
	PlayNote Csharp, 8, 6, $30
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $18
	PlayNote Asharp, 7, 6, $18
	PlayNote Fnote , 7, 1, $60
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 6, $18
	PlayNote Csharp, 7, 1, $48
	PlayNote Csharp, 7, 6, $18
	PlayNote Csharp, 8, 1, $60
	PlayNote Csharp, 8, 1, $18
	PlayNote Csharp, 8, 6, $18
	PlayNote Fnote , 7, 1, $60
	PlayNote Fnote , 7, 4, $18
	PlayNote Fnote , 7, 6, $18
	PlayNote Csharp, 7, 1, $30
	PlayNote Csharp, 8, 1, $30
	PlayNote Csharp, 8, 1, $20
	PlayNote Bnote , 7, 1, $20
	PlayNote Asharp, 7, 1, $20
	PlayNote Bnote , 7, 1, $20
	PlayNote Asharp, 7, 1, $20
	PlayNote Gsharp, 7, 1, $20
	PlayNote Fsharp, 7, 1, $48
	PlayNote Fsharp, 7, 6, $18
	PlayNote Gsharp, 7, 1, $48
	PlayNote Gsharp, 7, 6, $18
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $0c
	PlayNote Asharp, 7, 6, $24
	PlayNote Fnote , 7, 1, $30
	PlayNote Fsharp, 7, 1, $60
	PlayNote Fsharp, 7, 1, $30
	PlayNote Fsharp, 7, 6, $30
	PlayNote Dsharp, 7, 1, $60
	PlayNote Dsharp, 7, 1, $18
	PlayNote Dsharp, 7, 6, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Fsharp, 7, 1, $18
	PlayNote Gsharp, 7, 1, $40
	PlayNote Asharp, 7, 1, $40
	PlayNote Bnote , 7, 1, $40
	PlayNote Csharp, 8, 1, $3c
	PlayNote Csharp, 8, 4, $18
	PlayNote Csharp, 8, 6, $0c
	PlayNote Bnote , 7, 1, $3c
	PlayNote Bnote , 7, 4, $18
	PlayNote Bnote , 7, 6, $0c
	PlayNote Asharp, 7, 1, $30
	PlayNote Bnote , 7, 1, $18
	PlayNote Gsharp, 7, 1, $60
	PlayNote Gsharp, 7, 6, $18
	PlayNote Asharp, 7, 1, $60
	PlayNote Asharp, 7, 1, $18
	PlayNote Asharp, 7, 6, $18
	PlayNote Fnote , 7, 1, $60
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 6, $18
	PlayNote Csharp, 7, 1, $48
	PlayNote Csharp, 7, 6, $18
	PlayNote Csharp, 8, 1, $60
	PlayNote Csharp, 8, 1, $18
	PlayNote Csharp, 8, 6, $18
	PlayNote Fnote , 7, 1, $60
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 6, $18
	PlayNote Csharp, 7, 1, $30
	PlayNote Csharp, 8, 1, $30
	PlayNote Dsharp, 8, 1, $18
	PlayNote Dsharp, 8, 6, $08
	PlayNote Fnote , 8, 1, $18
	PlayNote Fnote , 8, 6, $08
	PlayNote Fsharp, 8, 1, $18
	PlayNote Fsharp, 8, 6, $08
	PlayNote Fsharp, 8, 1, $18
	PlayNote Fsharp, 8, 6, $08
	PlayNote Fnote , 8, 1, $18
	PlayNote Fnote , 8, 6, $08
	PlayNote Dsharp, 8, 1, $18
	PlayNote Dsharp, 8, 6, $08
	PlayNote Fnote , 8, 1, $18
	PlayNote Fnote , 8, 6, $08
	PlayNote Fsharp, 8, 1, $18
	PlayNote Fsharp, 8, 6, $08
	PlayNote Gsharp, 8, 1, $18
	PlayNote Gsharp, 8, 6, $08
	PlayNote Fsharp, 8, 1, $18
	PlayNote Fsharp, 8, 6, $08
	PlayNote Fnote , 8, 1, $18
	PlayNote Fnote , 8, 6, $08
	PlayNote Dsharp, 8, 1, $18
	PlayNote Dsharp, 8, 6, $08
	PlayNote Dnote , 8, 1, $60
	PlayNote Dnote , 8, 4, $18
	PlayNote Dnote , 8, 6, $18
	PlayNote Fnote , 8, 1, $30
	PlayNote Fsharp, 8, 1, $60
	PlayNote Fsharp, 8, 1, $30
	PlayNote Fsharp, 8, 6, $30
	SND_ClearHWRegs $60
	PlayNote Dsharp, 7, 1, $30
	PlayNote Fnote , 7, 1, $18
	PlayNote Fsharp, 7, 1, $48
	PlayNote Fsharp, 7, 4, $18
	PlayNote Fsharp, 7, 6, $18
	PlayNote Gsharp, 7, 1, $30
	PlayNote Asharp, 7, 1, $18
	PlayNote Bnote , 7, 4, $18
	PlayNote Bnote , 7, 1, $60
	PlayNote Bnote , 7, 1, $60
	PlayNote Bnote , 7, 1, $60
	PlayNote Bnote , 7, 1, $30
	PlayNote Bnote , 7, 6, $30
	SND_ClearHWRegs $60
	PlayNote Fnote , 7, 1, $30
	PlayNote Fsharp, 7, 1, $18
	PlayNote Gsharp, 7, 1, $60
	PlayNote Gsharp, 7, 6, $18
	PlayNote Asharp, 7, 1, $30
	PlayNote Bnote , 7, 1, $18
	PlayNote Csharp, 8, 4, $18
	PlayNote Csharp, 8, 1, $60
	PlayNote Csharp, 8, 1, $60
	PlayNote Csharp, 8, 1, $60
	PlayNote Csharp, 8, 1, $30
	PlayNote Csharp, 8, 6, $30
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
	PlayNote Csharp, 6, 1, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Asharp, 6, 1, $60
	PlayNote Asharp, 6, 1, $48
	PlayNote Asharp, 6, 6, $18
	SND_ClearHWRegs $48
	PlayNote Bnote , 6, 1, $30
	PlayNote Bnote , 6, 6, $18
	PlayNote Asharp, 6, 1, $30
	PlayNote Fsharp, 6, 1, $20
	PlayNote Fsharp, 6, 6, $20
	PlayNote Asharp, 6, 1, $20
	PlayNote Asharp, 6, 6, $20
	PlayNote Bnote , 6, 1, $20
	PlayNote Bnote , 6, 6, $20
	PlayNote Csharp, 7, 1, $48
	PlayNote Dsharp, 7, 1, $24
	PlayNote Dsharp, 7, 4, $0c
	PlayNote Dsharp, 7, 6, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 6, 1, $60
	PlayNote Fsharp, 6, 1, $30
	PlayNote Fsharp, 6, 4, $18
	PlayNote Fsharp, 6, 6, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Fsharp, 6, 1, $18
	PlayNote Csharp, 7, 1, $48
	PlayNote Dnote , 7, 1, $24
	PlayNote Dnote , 7, 4, $0c
	PlayNote Dnote , 7, 6, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 6, 1, $60
	PlayNote Fsharp, 6, 1, $18
	PlayNote Fsharp, 6, 6, $18
	PlayNote Csharp, 6, 1, $48
	PlayNote Csharp, 6, 6, $18
	PlayNote Csharp, 7, 1, $30
	PlayNote Bnote , 6, 1, $18
	PlayNote Asharp, 6, 1, $18
	PlayNote Asharp, 6, 6, $18
	PlayNote Fsharp, 6, 1, $48
	PlayNote Fsharp, 7, 1, $24
	PlayNote Fsharp, 7, 6, $0c
	PlayNote Fnote , 7, 1, $24
	PlayNote Fnote , 7, 6, $0c
	PlayNote Fsharp, 6, 1, $24
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Fsharp, 7, 1, $24
	PlayNote Fsharp, 7, 6, $0c
	PlayNote Fnote , 7, 1, $48
	PlayNote Fsharp, 7, 1, $18
	PlayNote Fsharp, 7, 6, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Csharp, 7, 1, $30
	PlayNote Fsharp, 7, 1, $30
	PlayNote Fnote , 7, 1, $30
	PlayNote Csharp, 7, 1, $18
	PlayNote Fsharp, 7, 1, $18
	PlayNote Gsharp, 7, 1, $18
	PlayNote Asharp, 7, 1, $18
	PlayNote Bnote , 7, 1, $48
	PlayNote Asharp, 7, 1, $18
	PlayNote Asharp, 7, 6, $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 7, 1, $60
	PlayNote Fsharp, 7, 1, $3c
	PlayNote Fsharp, 7, 4, $18
	PlayNote Fsharp, 7, 6, $0c
	PlayNote Dsharp, 7, 1, $30
	PlayNote Bnote , 7, 1, $48
	PlayNote Asharp, 7, 1, $18
	PlayNote Asharp, 7, 6, $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 7, 1, $48
	PlayNote Bnote , 7, 1, $48
	PlayNote Asharp, 7, 1, $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 7, 1, $30
	PlayNote Csharp, 8, 1, $60
	PlayNote Csharp, 8, 1, $60
	PlayNote Csharp, 8, 1, $60
	PlayNote Csharp, 8, 1, $30
	PlayNote Csharp, 8, 4, $18
	PlayNote Csharp, 8, 6, $18
	SND_Ret
	
	
WavFunc_002_5c37:
	SND_ClearHWRegs $60
	PlayNote Dnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $24
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $24
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $24
	PlayNote Csharp, 4, 1, $24
	SND_ClearHWRegs $18
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Enote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Enote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Enote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Enote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Enote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Enote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $24
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $24
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Enote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Enote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Enote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Enote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Enote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Enote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Dsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Dsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Dsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Bnote , 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Dnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Cnote , 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Dsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Dsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Dsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Anote , 3, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Csharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $3c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $54
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 4, 1, $60
	PlayNote Fsharp, 4, 1, $60
	PlayNote Fsharp, 4, 1, $60
	PlayNote Fsharp, 4, 1, $30
	SND_ClearHWRegs $30
	SND_Ret


; unused - $5ff2
:	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet75Wave1
	SND_SetFreqTableBaseIdx $ee
	SND_SetAudTermS02
	SND_SetSongSpeed $03
	SND_ClearHWRegs $60
	SND_Stop


; unused - $6003
	PlayNote Gnote , 6, 1, $30
	PlayNote Gnote , 6, 1, $30
	PlayNote Fsharp, 6, 1, $30
	PlayNote Fsharp, 6, 6, $30
	PlayNote Gnote , 6, 1, $30
	PlayNote Asharp, 5, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Gnote , 6, 1, $18
	PlayNote Gnote , 6, 6, $18
	PlayNote Asharp, 6, 1, $18
	PlayNote Asharp, 6, 6, $18
	SND_ClearHWRegs $30
	PlayNote Asharp, 5, 1, $30
	PlayNote Dsharp, 6, 1, $30
	PlayNote Gsharp, 6, 1, $60
	PlayNote Gnote , 6, 1, $30
	PlayNote Fnote , 6, 1, $30
	PlayNote Enote , 6, 1, $30
	PlayNote Fnote , 6, 1, $30
	PlayNote Fnote , 6, 1, $30
	PlayNote Enote , 6, 1, $30
	PlayNote Enote , 6, 6, $30
	PlayNote Fnote , 6, 1, $30
	PlayNote Asharp, 5, 1, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Fnote , 6, 6, $18
	PlayNote Asharp, 6, 1, $18
	PlayNote Asharp, 6, 6, $18
	SND_ClearHWRegs $30
	PlayNote Asharp, 5, 1, $30
	PlayNote Dnote , 6, 1, $30
	PlayNote Gnote , 6, 1, $60
	PlayNote Fnote , 6, 1, $30
	PlayNote Dsharp, 6, 1, $30
	PlayNote Dnote , 6, 1, $30
	PlayNote Dsharp, 6, 1, $30
	PlayNote Dsharp, 6, 1, $30
	PlayNote Dnote , 6, 1, $30
	PlayNote Dnote , 6, 6, $30
	PlayNote Dsharp, 6, 1, $30
	PlayNote Cnote , 6, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 6, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Gsharp, 6, 6, $18
	PlayNote Cnote , 6, 2, $18
	PlayNote Dsharp, 6, 2, $18
	PlayNote Dsharp, 7, 2, $18
	PlayNote Dsharp, 7, 6, $18
	PlayNote Cnote , 7, 2, $18
	PlayNote Cnote , 7, 6, $18
	PlayNote Dsharp, 6, 1, $60
	PlayNote Dsharp, 6, 1, $30
	PlayNote Fnote , 6, 1, $3c
	SND_ClearHWRegs $24
	PlayNote Gnote , 6, 1, $30
	PlayNote Gnote , 6, 1, $30
	PlayNote Fsharp, 6, 1, $30
	PlayNote Fsharp, 6, 6, $30
	PlayNote Gnote , 6, 1, $30
	PlayNote Asharp, 5, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Gnote , 6, 1, $18
	PlayNote Gnote , 6, 6, $18
	PlayNote Asharp, 6, 1, $18
	PlayNote Asharp, 6, 6, $18
	PlayNote Gsharp, 5, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 6, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Cnote , 6, 6, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Gnote , 6, 1, $18
	PlayNote Asharp, 6, 1, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 6, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 6, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 6, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 6, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Asharp, 6, 1, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Fnote , 6, 6, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Fnote , 6, 6, $18
	PlayNote Gnote , 6, 1, $60
	PlayNote Gnote , 6, 1, $30
	PlayNote Gsharp, 6, 1, $60
	PlayNote Gsharp, 6, 1, $30
	PlayNote Gnote , 6, 1, $60
	PlayNote Fsharp, 6, 1, $60
	PlayNote Fsharp, 6, 1, $30
	PlayNote Cnote , 7, 1, $60
	PlayNote Cnote , 7, 1, $30
	PlayNote Dnote , 7, 1, $60
	PlayNote Cnote , 7, 1, $60
	PlayNote Cnote , 7, 1, $30
	PlayNote Asharp, 6, 1, $60
	PlayNote Asharp, 6, 1, $30
	PlayNote Dsharp, 7, 1, $60
	PlayNote Dnote , 7, 1, $60
	PlayNote Dnote , 7, 1, $30
	PlayNote Asharp, 6, 1, $60
	PlayNote Asharp, 6, 1, $30
	PlayNote Gnote , 6, 1, $60
	PlayNote Gsharp, 6, 1, $60
	PlayNote Gsharp, 6, 1, $30
	PlayNote Asharp, 6, 1, $60
	PlayNote Asharp, 6, 1, $30
	PlayNote Gsharp, 6, 1, $60
	PlayNote Fnote , 6, 1, $60
	PlayNote Fnote , 6, 1, $30
	PlayNote Cnote , 7, 1, $60
	PlayNote Cnote , 7, 1, $30
	PlayNote Dnote , 7, 1, $60
	PlayNote Asharp, 6, 1, $60
	PlayNote Asharp, 6, 1, $30
	PlayNote Gsharp, 6, 1, $60
	PlayNote Gsharp, 6, 1, $30
	PlayNote Fnote , 6, 1, $60
	PlayNote Dnote , 6, 1, $60
	PlayNote Dnote , 6, 1, $30
	PlayNote Cnote , 6, 1, $60
	PlayNote Cnote , 6, 1, $30
	PlayNote Asharp, 5, 1, $60
	PlayNote Gnote , 6, 1, $60
	PlayNote Gnote , 6, 1, $30
	PlayNote Gsharp, 6, 1, $60
	PlayNote Gsharp, 6, 1, $30
	PlayNote Gnote , 6, 1, $60
	PlayNote Fsharp, 6, 1, $60
	PlayNote Fsharp, 6, 1, $30
	PlayNote Cnote , 7, 1, $60
	PlayNote Cnote , 7, 1, $30
	PlayNote Dnote , 7, 1, $60
	PlayNote Cnote , 7, 1, $60
	PlayNote Cnote , 7, 1, $30
	PlayNote Asharp, 6, 1, $60
	PlayNote Asharp, 6, 1, $30
	PlayNote Dsharp, 7, 1, $60
	PlayNote Dnote , 7, 1, $60
	PlayNote Dnote , 7, 1, $30
	PlayNote Asharp, 6, 1, $60
	PlayNote Asharp, 6, 1, $30
	PlayNote Gnote , 6, 1, $60
	PlayNote Gsharp, 6, 1, $60
	PlayNote Gsharp, 6, 1, $30
	PlayNote Asharp, 6, 1, $60
	PlayNote Asharp, 6, 1, $30
	PlayNote Gsharp, 6, 1, $60
	PlayNote Fnote , 6, 1, $60
	PlayNote Fnote , 6, 1, $30
	PlayNote Cnote , 7, 1, $60
	PlayNote Cnote , 7, 1, $30
	PlayNote Dnote , 7, 1, $60
	PlayNote Asharp, 6, 1, $60
	PlayNote Asharp, 6, 1, $30
	PlayNote Gsharp, 6, 1, $60
	PlayNote Gsharp, 6, 1, $30
	PlayNote Fnote , 6, 1, $60
	PlayNote Dnote , 6, 1, $60
	PlayNote Dnote , 6, 1, $30
	PlayNote Cnote , 6, 1, $60
	PlayNote Cnote , 6, 1, $30
	PlayNote Asharp, 5, 1, $60
	SND_Jump :-


; unused - $616e
:	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 4, $c0
	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 2, $66
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $ee
	SND_SetAudTermS01
	SND_ClearHWRegs $60
	SND_Stop


; unused - $6183
	PlayNote Dsharp, 6, 1, $30
	PlayNote Dsharp, 6, 1, $30
	PlayNote Dsharp, 6, 1, $30
	PlayNote Dsharp, 6, 6, $30
	PlayNote Dsharp, 6, 1, $30
	PlayNote Gnote , 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 6, $18
	PlayNote Gnote , 6, 1, $18
	PlayNote Gnote , 6, 6, $18
	SND_ClearHWRegs $30
	PlayNote Asharp, 5, 3, $30
	PlayNote Dsharp, 6, 3, $30
	PlayNote Gsharp, 6, 3, $60
	PlayNote Gnote , 6, 3, $30
	PlayNote Fnote , 6, 3, $30
	PlayNote Enote , 6, 3, $30
	PlayNote Dnote , 6, 1, $30
	PlayNote Dnote , 6, 1, $30
	PlayNote Dnote , 6, 1, $30
	PlayNote Dnote , 6, 6, $30
	PlayNote Dnote , 6, 1, $30
	PlayNote Gnote , 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Dnote , 6, 6, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Fnote , 6, 6, $18
	SND_ClearHWRegs $30
	PlayNote Asharp, 5, 3, $30
	PlayNote Dnote , 6, 3, $30
	PlayNote Gnote , 6, 3, $60
	PlayNote Fnote , 6, 3, $30
	PlayNote Dsharp, 6, 3, $30
	PlayNote Dnote , 6, 3, $30
	PlayNote Cnote , 6, 1, $30
	PlayNote Cnote , 6, 1, $30
	PlayNote Cnote , 6, 1, $30
	PlayNote Cnote , 6, 6, $30
	PlayNote Cnote , 6, 1, $30
	PlayNote Gsharp, 5, 1, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Gsharp, 6, 6, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 6, $18
	PlayNote Gsharp, 5, 1, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Gsharp, 6, 2, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 2, $18
	PlayNote Dsharp, 6, 7, $60
	PlayNote Dsharp, 6, 1, $60
	SND_ClearHWRegs $30
	PlayNote Dsharp, 6, 1, $30
	PlayNote Dsharp, 6, 1, $30
	PlayNote Dnote , 6, 1, $30
	PlayNote Dnote , 6, 6, $30
	PlayNote Dsharp, 6, 1, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Asharp, 5, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Dsharp, 6, 6, $18
	PlayNote Gnote , 6, 1, $18
	PlayNote Gnote , 6, 6, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 6, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Gsharp, 6, 6, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Cnote , 6, 1, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Asharp, 6, 1, $18
	PlayNote Asharp, 6, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Gnote , 6, 1, $18
	PlayNote Dnote , 6, 1, $18
	PlayNote Asharp, 6, 1, $18
	PlayNote Dsharp, 7, 1, $18
	PlayNote Dsharp, 7, 6, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 6, $18
	PlayNote Dsharp, 7, 1, $18
	PlayNote Gsharp, 6, 1, $18
	PlayNote Dsharp, 6, 1, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Asharp, 6, 1, $18
	PlayNote Fnote , 6, 1, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dsharp, 6, 2, $30
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dsharp, 6, 2, $30
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $30
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $30
	PlayNote Dnote , 6, 2, $60
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dsharp, 6, 2, $30
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dsharp, 6, 2, $30
	PlayNote Cnote , 7, 1, $60
	PlayNote Asharp, 6, 1, $60
	PlayNote Asharp, 6, 1, $30
	PlayNote Gnote , 6, 1, $60
	PlayNote Gnote , 6, 1, $30
	PlayNote Dsharp, 6, 1, $60
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $30
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $30
	PlayNote Fnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $30
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $30
	PlayNote Dnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $30
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $30
	PlayNote Dnote , 6, 1, $60
	PlayNote Asharp, 5, 1, $60
	PlayNote Asharp, 5, 1, $30
	PlayNote Asharp, 5, 1, $60
	PlayNote Asharp, 5, 1, $30
	PlayNote Fnote , 5, 1, $60
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dsharp, 6, 2, $30
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dsharp, 6, 2, $30
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $30
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $30
	PlayNote Dnote , 6, 2, $60
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dsharp, 6, 2, $30
	PlayNote Dsharp, 6, 2, $60
	PlayNote Dsharp, 6, 2, $30
	PlayNote Cnote , 7, 1, $60
	PlayNote Asharp, 6, 1, $60
	PlayNote Asharp, 6, 1, $30
	PlayNote Gnote , 6, 1, $60
	PlayNote Gnote , 6, 1, $30
	PlayNote Dsharp, 6, 1, $60
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $30
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $30
	PlayNote Fnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $30
	PlayNote Dnote , 6, 2, $60
	PlayNote Dnote , 6, 2, $30
	PlayNote Dnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $30
	PlayNote Fnote , 6, 2, $60
	PlayNote Fnote , 6, 2, $30
	PlayNote Dnote , 6, 1, $60
	PlayNote Asharp, 5, 1, $60
	PlayNote Asharp, 5, 1, $30
	PlayNote Asharp, 5, 1, $60
	PlayNote Asharp, 5, 1, $30
	PlayNote Fnote , 5, 1, $60
	SND_Jump :-


; unused - $62ee
:	SND_SaveEnvelopeValue 1, $c6
	SND_SetFreqTableBaseIdx $06
	SND_SetAudTermS01andSO2
	SND_ClearHWRegs $60
	SND_Stop


; unused - $62f6
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $08
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $14
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $08
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $14
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $08
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $14
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $08
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $14
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $08
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $14
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $08
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $14
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $08
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $14
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $48
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $48
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $48
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $48
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0e
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0e
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0e
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0e
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0e
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0e
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0e
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0e
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0f
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1b
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $11
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $1d
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $0a
	NoiseSCF $25
	SND_ClearHWRegs $18
	NoiseSCF $16
	NoiseSCF $25
	SND_ClearHWRegs $18
	SND_Jump :-


; unused - $6609
:	SND_SaveEnvelopeValue 0, $a1
	SND_SetNoiseDividingRatioOfFreqs 1
	SND_ClearHWRegs $60
	SND_Stop


; unused - $660f
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66ba
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66ba
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66ba
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66ba
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66ba
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66ba
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66ba
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66ba
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66ba
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66ba
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66a8
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66ba
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66af
	SND_Call UnusedNoiseFunc_002_66ba
	SND_Jump :-


UnusedNoiseFunc_002_66a8:
	SND_ClearHWRegs $60
	NoiseSCF $0f
	NoiseSCF $00
	SND_ClearHWRegs $5c
	SND_Ret


UnusedNoiseFunc_002_66af:
	SND_ClearHWRegs $30
	NoiseSCF $0f
	NoiseSCF $00
	SND_ClearHWRegs $2c
	NoiseSCF $0f
	NoiseSCF $00
	SND_ClearHWRegs $5c
	SND_Ret


UnusedNoiseFunc_002_66ba:
	SND_ClearHWRegs $30
	NoiseSCF $0f
	NoiseSCF $00
	SND_ClearHWRegs $5c
	NoiseSCF $0f
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $0f
	NoiseSCF $00
	SND_ClearHWRegs $14
	SND_Ret
	

Music0e_SQ1::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 2, $c0
	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet75Wave2
	SND_SetFreqTableBaseIdx $f4
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_Call SquareFunc_002_66e3
	SND_Stop


SquareFunc_002_66e3:
	PlayNote Dnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Enote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 6, 6, $0c
	PlayNote Gnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Gnote , 6, 6, $0c
	PlayNote Enote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 6, 6, $0c
	PlayNote Dnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Enote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 6, 6, $0c
	PlayNote Enote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 6, 6, $0c
	PlayNote Anote , 5, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 5, 6, $0c
	SND_ClearHWRegs $60
	PlayNote Dnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Enote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 6, 6, $0c
	PlayNote Gnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Gnote , 6, 6, $0c
	PlayNote Enote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 6, 6, $0c
	PlayNote Dnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Enote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 6, 6, $0c
	PlayNote Enote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 6, 6, $0c
	SND_Ret
	
	
Music0e_SQ2::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave1
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_Call SquareFunc_002_6758
	SND_Stop


SquareFunc_002_6758:
	PlayNote Anote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Dnote , 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Bnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Anote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Anote , 7, 4, $0c
	PlayNote Anote , 7, 4, $0c
	PlayNote Anote , 7, 4, $0c
	PlayNote Anote , 7, 3, $0c
	PlayNote Anote , 7, 3, $0c
	PlayNote Anote , 7, 2, $0c
	PlayNote Anote , 7, 2, $0c
	PlayNote Anote , 7, 1, $0c
	PlayNote Anote , 7, 1, $0c
	PlayNote Anote , 7, 3, $0c
	PlayNote Anote , 7, 4, $0c
	PlayNote Anote , 7, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Anote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Dnote , 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Bnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Anote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Bnote , 5, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	SND_Ret
	
	
Music0e_Wav::
	SND_SaveEnvelopeValue 3, $c6
	SND_SetAudTermS01andSO2
	SND_Call WavFunc_002_67c8
	SND_Stop


WavFunc_002_67c8:
	PlayNote Anote , 5, 3, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 5, 3, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 6, 3, $18
	SND_ClearHWRegs $18
	PlayNote Enote , 6, 3, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	SND_ClearHWRegs $60
	PlayNote Anote , 5, 3, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 5, 3, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 6, 3, $18
	SND_ClearHWRegs $18
	PlayNote Enote , 6, 3, $18


Music0e_Noise::
	SND_ClearHWRegs $38
	SND_Stop


Music0f_SQ1::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $05
	SND_Call SquareFunc_002_6809
	SND_Stop


SquareFunc_002_6809:
	PlayNote Enote , 8, 1, $18
	PlayNote Enote , 8, 6, $18
	PlayNote Gnote , 7, 1, $18
	PlayNote Gnote , 7, 6, $18
	PlayNote Cnote , 8, 1, $18
	PlayNote Cnote , 8, 6, $18
	PlayNote Enote , 8, 1, $18
	PlayNote Enote , 8, 6, $18
	PlayNote Dnote , 8, 1, $18
	PlayNote Dnote , 8, 6, $18
	PlayNote Gnote , 7, 1, $18
	PlayNote Gnote , 7, 6, $18
	PlayNote Bnote , 7, 1, $18
	PlayNote Bnote , 7, 6, $18
	PlayNote Dnote , 8, 1, $18
	PlayNote Dnote , 8, 6, $18
	PlayNote Anote , 7, 1, $18
	PlayNote Anote , 7, 6, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 6, $18
	PlayNote Anote , 7, 1, $18
	PlayNote Anote , 7, 6, $18
	PlayNote Cnote , 8, 1, $18
	PlayNote Cnote , 8, 6, $18
	PlayNote Bnote , 7, 1, $18
	PlayNote Bnote , 7, 6, $18
	PlayNote Anote , 7, 1, $18
	PlayNote Anote , 7, 6, $18
	PlayNote Bnote , 7, 1, $18
	PlayNote Bnote , 7, 6, $18
	PlayNote Gnote , 7, 1, $18
	PlayNote Gnote , 7, 6, $18
	PlayNote Enote , 8, 1, $18
	PlayNote Enote , 8, 6, $18
	PlayNote Gnote , 7, 1, $18
	PlayNote Gnote , 7, 6, $18
	PlayNote Cnote , 8, 1, $18
	PlayNote Cnote , 8, 6, $18
	PlayNote Enote , 8, 1, $18
	PlayNote Enote , 8, 6, $18
	PlayNote Dnote , 8, 1, $18
	PlayNote Dnote , 8, 6, $18
	PlayNote Gnote , 7, 1, $18
	PlayNote Gnote , 7, 6, $18
	PlayNote Bnote , 7, 1, $18
	PlayNote Bnote , 7, 6, $18
	PlayNote Dnote , 8, 1, $18
	PlayNote Dnote , 8, 6, $18
	PlayNote Cnote , 8, 1, $18
	PlayNote Cnote , 8, 6, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 6, $18
	PlayNote Anote , 7, 1, $18
	PlayNote Anote , 7, 6, $18
	PlayNote Cnote , 8, 1, $18
	PlayNote Cnote , 8, 6, $18
	PlayNote Gnote , 7, 1, $18
	PlayNote Gnote , 7, 6, $18
	PlayNote Anote , 7, 1, $18
	PlayNote Anote , 7, 6, $18
	PlayNote Bnote , 7, 1, $18
	PlayNote Bnote , 7, 6, $18
	PlayNote Dnote , 8, 1, $18
	PlayNote Dnote , 8, 6, $18
	PlayNote Enote , 6, 3, $0c
	PlayNote Gnote , 6, 2, $0c
	PlayNote Cnote , 7, 3, $0c
	PlayNote Enote , 7, 2, $0c
	PlayNote Gnote , 7, 2, $0c
	SND_ClearHWRegs $24
	PlayNote Cnote , 8, 1, $48
	PlayNote Cnote , 8, 6, $18
	SND_Ret
	
	
Music0f_SQ2::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_Call SquareFunc_002_68b2
	SND_Stop


SquareFunc_002_68b2:
	PlayNote Enote , 7, 2, $30
	PlayNote Enote , 7, 3, $30
	PlayNote Enote , 7, 4, $30
	PlayNote Enote , 7, 6, $30
	PlayNote Dnote , 7, 2, $30
	PlayNote Dnote , 7, 3, $30
	PlayNote Dnote , 7, 4, $30
	PlayNote Dnote , 7, 6, $30
	PlayNote Cnote , 7, 2, $30
	PlayNote Cnote , 7, 3, $30
	PlayNote Cnote , 7, 4, $30
	PlayNote Cnote , 7, 6, $30
	PlayNote Gnote , 6, 2, $30
	PlayNote Gnote , 6, 3, $30
	PlayNote Gnote , 6, 4, $30
	PlayNote Gnote , 6, 6, $30
	PlayNote Cnote , 7, 2, $30
	PlayNote Cnote , 7, 3, $30
	PlayNote Cnote , 7, 4, $30
	PlayNote Cnote , 7, 6, $30
	PlayNote Bnote , 6, 2, $30
	PlayNote Bnote , 6, 3, $30
	PlayNote Bnote , 6, 4, $30
	PlayNote Bnote , 6, 6, $30
	PlayNote Anote , 6, 2, $30
	PlayNote Anote , 6, 3, $30
	PlayNote Anote , 6, 4, $30
	PlayNote Anote , 6, 6, $30
	PlayNote Bnote , 6, 2, $30
	PlayNote Bnote , 6, 3, $30
	PlayNote Bnote , 6, 4, $30
	PlayNote Bnote , 6, 6, $30
	PlayNote Cnote , 7, 2, $30
	PlayNote Cnote , 7, 3, $30
	PlayNote Cnote , 7, 4, $30
	PlayNote Cnote , 7, 6, $30
	SND_Ret


Music0f_Wav::
	SND_SaveEnvelopeValue 0, $c6
	SND_SetFreqTableBaseIdx $e8
	SND_SetAlternatingAudTerm 1
	SND_Call WavFunc_002_6904
	SND_Stop


WavFunc_002_6904:
	SND_ClearHWRegs $04
	PlayNote Enote , 8, 0, $30
	PlayNote Gnote , 7, 0, $30
	PlayNote Cnote , 8, 0, $30
	PlayNote Enote , 8, 0, $30
	PlayNote Dnote , 8, 0, $30
	PlayNote Gnote , 7, 0, $30
	PlayNote Bnote , 7, 0, $30
	PlayNote Dnote , 8, 4, $30
	PlayNote Dnote , 8, 0, $18
	PlayNote Anote , 7, 0, $30
	PlayNote Fnote , 7, 0, $30
	PlayNote Anote , 7, 0, $30
	PlayNote Cnote , 8, 0, $30
	PlayNote Bnote , 7, 0, $30
	PlayNote Anote , 7, 0, $30
	PlayNote Bnote , 7, 0, $30
	PlayNote Gnote , 7, 4, $30
	PlayNote Gnote , 7, 0, $18
	PlayNote Enote , 8, 0, $30
	PlayNote Gnote , 7, 0, $30
	PlayNote Cnote , 8, 0, $30
	PlayNote Enote , 8, 0, $30
	PlayNote Dnote , 8, 0, $30
	PlayNote Gnote , 7, 0, $30
	PlayNote Bnote , 7, 0, $30
	PlayNote Dnote , 8, 0, $30
	PlayNote Dnote , 8, 0, $18
	PlayNote Cnote , 8, 0, $30
	PlayNote Enote , 7, 0, $30
	PlayNote Anote , 7, 0, $30
	PlayNote Cnote , 8, 0, $30
	PlayNote Gnote , 7, 0, $30
	PlayNote Anote , 7, 0, $30
	PlayNote Bnote , 7, 0, $30
	PlayNote Dnote , 8, 0, $30
	PlayNote Dnote , 8, 0, $18
	PlayNote Enote , 7, 0, $18
	PlayNote Gnote , 7, 0, $18
	PlayNote Cnote , 8, 0, $60
	PlayNote Cnote , 8, 0, $18
	SND_Ret
	
	
Music0f_Noise::
	SND_Call NoiseFunc_002_695b
	SND_Stop


NoiseFunc_002_695b:
	SND_ClearHWRegs $60
	SND_Ret
	
	
Music10_SQ1::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $f4
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_Call SquareFunc_002_6978
	SND_Stop


SquareFunc_002_6978:
	PlayNote Anote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 6, 6, $0c
	PlayNote Bnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 6, 6, $0c
	PlayNote Csharp, 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Csharp, 7, 6, $0c
	PlayNote Cnote , 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 7, 6, $0c
	PlayNote Csharp, 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Csharp, 7, 6, $0c
	PlayNote Enote , 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 7, 6, $0c
	PlayNote Dnote , 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 7, 6, $0c
	PlayNote Csharp, 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Csharp, 7, 6, $0c
	PlayNote Bnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 6, 6, $0c
	PlayNote Anote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 6, 6, $0c
	PlayNote Bnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 6, 6, $0c
	PlayNote Csharp, 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Csharp, 7, 6, $0c
	SND_ClearHWRegs $60
	PlayNote Anote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 6, 6, $0c
	PlayNote Gsharp, 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 6, 6, $0c
	PlayNote Anote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 6, 6, $0c
	PlayNote Csharp, 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Csharp, 7, 6, $0c
	PlayNote Bnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 6, 6, $0c
	PlayNote Fsharp, 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Gsharp, 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 6, 6, $0c
	PlayNote Fsharp, 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Gsharp, 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 6, 6, $0c
	PlayNote Anote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 6, 6, $0c
	SND_ClearHWRegs $60
	PlayNote Cnote , 7, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Fnote , 7, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Anote , 7, 1, $0c
	SND_ClearHWRegs $0c
	PlayNote Cnote , 8, 6, $0c
	SND_ClearHWRegs $0c
	PlayNote Fnote , 8, 6, $0c
	SND_Ret
	
	
Music10_SQ2::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $f4
	SND_SetAudTermS01andSO2
	SND_Call SquareFunc_002_6a2b
	SND_Stop


SquareFunc_002_6a2b:
	SND_ClearHWRegs $60
	PlayNote Anote , 5, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 5, 6, $18
	SND_ClearHWRegs $54
	PlayNote Anote , 5, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 5, 6, $18
	SND_ClearHWRegs $54
	PlayNote Anote , 5, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 5, 6, $18
	SND_ClearHWRegs $54
	PlayNote Anote , 5, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 5, 6, $10
	PlayNote Csharp, 5, 1, $18
	PlayNote Csharp, 5, 6, $18
	PlayNote Enote , 5, 1, $18
	PlayNote Enote , 5, 6, $18
	PlayNote Fsharp, 5, 1, $18
	PlayNote Fsharp, 5, 6, $18
	SND_ClearHWRegs $60
	PlayNote Fsharp, 5, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 5, 6, $18
	SND_ClearHWRegs $54
	PlayNote Enote , 5, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 5, 6, $18
	SND_ClearHWRegs $54
	PlayNote Fnote , 5, 1, $18
	PlayNote Fnote , 5, 6, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Cnote , 7, 2, $0c
	SND_ClearHWRegs $08
	PlayNote Fnote , 7, 2, $0c
	SND_ClearHWRegs $08
	PlayNote Anote , 7, 2, $0c
	SND_ClearHWRegs $08
	PlayNote Cnote , 8, 6, $0c
	SND_ClearHWRegs $08
	PlayNote Fnote , 8, 6, $0c
	SND_ClearHWRegs $08
	PlayNote Anote , 8, 6, $0c
	SND_ClearHWRegs $60
	SND_ClearHWRegs $38
	SND_Ret
	
	
Music10_Wav::
	SND_SaveEnvelopeValue 1, $c6
	SND_SetFreqTableBaseIdx $f4
	SND_SetAudTermS01andSO2
	SND_Call WavFunc_002_6a95
	SND_Stop


WavFunc_002_6a95:
	SND_ClearHWRegs $60
	PlayNote Gnote , 6, 1, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Fsharp, 6, 1, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Fnote , 6, 1, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Enote , 6, 1, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Enote , 6, 1, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Dsharp, 6, 1, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Dnote , 6, 1, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	PlayNote Cnote , 6, 1, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $18
	SND_Ret
	
	
Music10_Noise::
	SND_SaveEnvelopeValue 0, $c6
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_ClearHWRegs $60
	SND_Stop


Music11_SQ1::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $05
	SND_Call SquareFunc_002_6aea
	SND_Stop


SquareFunc_002_6aea:
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 6, $18
	PlayNote Gnote , 6, 1, $18
	PlayNote Gnote , 6, 6, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 6, $18
	SND_ClearHWRegs $30
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 6, $18
	SND_ClearHWRegs $30
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 6, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 6, $18
	PlayNote Bnote , 6, 1, $18
	PlayNote Bnote , 6, 6, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Bnote , 6, 1, $18
	PlayNote Bnote , 6, 6, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 6, $18
	PlayNote Gnote , 6, 1, $18
	PlayNote Gnote , 6, 6, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 6, $18
	SND_ClearHWRegs $30
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 6, $18
	SND_ClearHWRegs $30
	PlayNote Anote , 7, 1, $18
	PlayNote Anote , 7, 6, $18
	PlayNote Gnote , 7, 1, $18
	PlayNote Gnote , 7, 6, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 6, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 6, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	SND_SetSongSpeed $04
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 4, $18
	SND_ClearHWRegs $30
	PlayNote Gnote , 7, 1, $18
	PlayNote Gnote , 7, 4, $18
	SND_ClearHWRegs $30
	PlayNote Cnote , 8, 1, $60
	PlayNote Cnote , 8, 1, $54
	PlayNote Cnote , 8, 4, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	SND_Ret
	
	
Music11_SQ2::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_Call SquareFunc_002_6b97
	SND_Stop


SquareFunc_002_6b97:
	PlayNote Cnote , 6, 2, $30
	PlayNote Cnote , 6, 6, $30
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
	PlayNote Gnote , 6, 2, $18
	PlayNote Gnote , 6, 6, $18
	PlayNote Enote , 6, 2, $18
	PlayNote Enote , 6, 6, $18
	PlayNote Gnote , 6, 2, $18
	PlayNote Gnote , 6, 6, $18
	PlayNote Anote , 6, 2, $30
	PlayNote Anote , 6, 6, $30
	SND_ClearHWRegs $60
	PlayNote Gsharp, 6, 2, $30
	PlayNote Gsharp, 6, 6, $30
	SND_ClearHWRegs $60
	PlayNote Cnote , 6, 2, $30
	PlayNote Cnote , 6, 6, $30
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
	PlayNote Gnote , 6, 2, $18
	PlayNote Gnote , 6, 6, $18
	PlayNote Enote , 6, 2, $18
	PlayNote Enote , 6, 6, $18
	PlayNote Gnote , 6, 2, $18
	PlayNote Gnote , 6, 6, $18
	PlayNote Fnote , 7, 1, $18
	PlayNote Fnote , 7, 6, $18
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 6, $18
	PlayNote Bnote , 6, 1, $18
	PlayNote Bnote , 6, 6, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 6, $18
	PlayNote Dnote , 7, 1, $18
	PlayNote Dnote , 7, 6, $18
	PlayNote Bnote , 6, 1, $18
	PlayNote Bnote , 6, 6, $18
	PlayNote Cnote , 7, 1, $18
	PlayNote Cnote , 7, 4, $18
	SND_ClearHWRegs $30
	PlayNote Enote , 7, 1, $18
	PlayNote Enote , 7, 4, $18
	SND_ClearHWRegs $30
	PlayNote Gnote , 7, 1, $60
	PlayNote Gnote , 7, 1, $60
	PlayNote Gnote , 7, 4, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	SND_Ret
	
	
Music11_Wav::
	SND_SaveEnvelopeValue 2, $c6
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAlternatingAudTerm 1
	SND_ClearHWRegs $08
	SND_Call WavFunc_002_6c12
	SND_Stop


WavFunc_002_6c12:
	PlayNote Cnote , 6, 2, $30
	SND_ClearHWRegs $30
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
	PlayNote Gnote , 6, 2, $18
	SND_ClearHWRegs $18
	PlayNote Enote , 6, 2, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 6, 2, $18
	SND_ClearHWRegs $18
	PlayNote Anote , 6, 2, $30
	SND_ClearHWRegs $30
	SND_ClearHWRegs $60
	PlayNote Gsharp, 6, 2, $30
	SND_ClearHWRegs $30
	SND_ClearHWRegs $60
	PlayNote Cnote , 6, 2, $30
	SND_ClearHWRegs $30
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
	PlayNote Gnote , 6, 2, $18
	SND_ClearHWRegs $18
	PlayNote Enote , 6, 2, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 6, 2, $18
	SND_ClearHWRegs $18
	PlayNote Fnote , 7, 2, $18
	SND_ClearHWRegs $18
	PlayNote Enote , 7, 2, $18
	SND_ClearHWRegs $18
	PlayNote Dnote , 7, 2, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 7, 2, $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 6, 2, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 7, 2, $18
	SND_ClearHWRegs $18
	PlayNote Dnote , 7, 2, $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 6, 2, $18
	SND_ClearHWRegs $18
	PlayNote Cnote , 7, 2, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $30
	PlayNote Enote , 7, 2, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $30
	PlayNote Gnote , 7, 2, $60
	PlayNote Gnote , 7, 2, $60
	SND_ClearHWRegs $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	SND_Ret
	
	
Music11_Noise::
	SND_SaveEnvelopeValue 0, $c6
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_Call NoiseFunc_002_6c8b
	SND_Stop


NoiseFunc_002_6c8b:
	SND_ClearHWRegs $30
	SND_ClearHWRegs $30
	SND_Ret
	
	
Music12_SQ1::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 3, $c0
	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_Call SquareFunc_002_6caa
	SND_Stop


SquareFunc_002_6caa:
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Asharp, 5, 2, $48
	PlayNote Gsharp, 5, 2, $18
	PlayNote Gsharp, 5, 6, $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Asharp, 5, 2, $48
	PlayNote Gsharp, 5, 2, $18
	PlayNote Gsharp, 5, 6, $18
	PlayNote Gnote , 6, 1, $60
	PlayNote Gnote , 6, 1, $18
	PlayNote Dnote , 7, 2, $0c
	PlayNote Fsharp, 7, 1, $0c
	PlayNote Gnote , 7, 0, $30
	PlayNote Fnote , 7, 1, $30
	PlayNote Fnote , 7, 6, $18
	PlayNote Cnote , 7, 1, $30
	PlayNote Cnote , 7, 6, $18
	PlayNote Dnote , 7, 4, $30
	PlayNote Dnote , 7, 1, $60
	PlayNote Dnote , 7, 1, $30
	PlayNote Dnote , 7, 6, $30
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Asharp, 5, 2, $48
	PlayNote Gsharp, 5, 2, $18
	PlayNote Gsharp, 5, 6, $18
	PlayNote Gnote , 6, 1, $60
	PlayNote Gnote , 6, 1, $18
	PlayNote Dnote , 7, 2, $0c
	PlayNote Fsharp, 7, 1, $0c
	PlayNote Gnote , 7, 0, $30
	PlayNote Fnote , 7, 1, $30
	PlayNote Fnote , 7, 6, $18
	PlayNote Cnote , 7, 1, $30
	PlayNote Cnote , 7, 6, $18
	PlayNote Dnote , 7, 4, $30
	PlayNote Dnote , 7, 1, $60
	PlayNote Dnote , 7, 1, $30
	PlayNote Dnote , 7, 6, $30
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 1, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Asharp, 5, 2, $48
	PlayNote Gsharp, 5, 2, $18
	PlayNote Gsharp, 5, 6, $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Gnote , 5, 2, $18
	PlayNote Gnote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gsharp, 5, 2, $18
	PlayNote Gsharp, 5, 2, $18
	PlayNote Gsharp, 5, 6, $18
	PlayNote Gsharp, 5, 2, $18
	PlayNote Gsharp, 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Anote , 5, 2, $18
	PlayNote Anote , 5, 2, $18
	PlayNote Anote , 5, 6, $18
	PlayNote Asharp, 5, 2, $48
	PlayNote Cnote , 6, 2, $18
	PlayNote Cnote , 6, 6, $18
	PlayNote Bnote , 5, 2, $18
	PlayNote Bnote , 5, 2, $18
	PlayNote Bnote , 5, 6, $18
	PlayNote Bnote , 5, 2, $18
	PlayNote Bnote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Csharp, 6, 2, $18
	PlayNote Csharp, 6, 2, $18
	PlayNote Csharp, 6, 6, $18
	PlayNote Csharp, 6, 2, $18
	PlayNote Csharp, 6, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 6, 2, $48
	PlayNote Fnote , 6, 2, $48
	PlayNote Gsharp, 6, 2, $24
	SND_ClearHWRegs $0c
	PlayNote Asharp, 6, 2, $60
	PlayNote Asharp, 6, 2, $60
	PlayNote Asharp, 6, 2, $60
	PlayNote Asharp, 6, 2, $60
	PlayNote Asharp, 6, 2, $60
	PlayNote Asharp, 6, 2, $60
	PlayNote Asharp, 6, 6, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	SND_Ret
	
	
Music12_SQ2::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAlternatingAudTerm 2
	SND_Call SquareFunc_002_6e0d
	SND_Stop


SquareFunc_002_6e0d:
	PlayNote Bnote , 5, 4, $18
	PlayNote Bnote , 5, 3, $18
	PlayNote Bnote , 5, 6, $18
	PlayNote Bnote , 5, 3, $18
	PlayNote Bnote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Bnote , 5, 3, $18
	PlayNote Bnote , 5, 6, $18
	PlayNote Bnote , 5, 3, $18
	PlayNote Bnote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Bnote , 5, 3, $18
	PlayNote Bnote , 5, 6, $18
	PlayNote Dnote , 6, 4, $48
	PlayNote Fnote , 5, 4, $18
	PlayNote Fnote , 5, 6, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Enote , 5, 3, $18
	PlayNote Enote , 5, 6, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Enote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Bnote , 5, 3, $18
	PlayNote Bnote , 5, 6, $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Bnote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 5, 4, $18
	PlayNote Bnote , 5, 3, $18
	PlayNote Bnote , 5, 6, $18
	PlayNote Dnote , 6, 4, $48
	PlayNote Gnote , 6, 4, $18
	PlayNote Gnote , 5, 6, $18
	PlayNote Gnote , 4, 4, $18
	PlayNote Gnote , 4, 3, $18
	PlayNote Gnote , 4, 6, $18
	PlayNote Gnote , 4, 4, $18
	PlayNote Gnote , 4, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 4, $18
	PlayNote Gnote , 4, 3, $18
	PlayNote Gnote , 4, 6, $18
	PlayNote Gnote , 4, 4, $18
	PlayNote Gnote , 4, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 4, $18
	PlayNote Gnote , 4, 3, $18
	PlayNote Gnote , 4, 6, $18
	PlayNote Asharp, 4, 4, $48
	PlayNote Gsharp, 4, 4, $18
	PlayNote Gsharp, 4, 6, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Enote , 5, 3, $18
	PlayNote Enote , 5, 6, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Enote , 5, 6, $18
	SND_ClearHWRegs $48
	PlayNote Enote , 5, 4, $18
	PlayNote Enote , 5, 3, $18
	PlayNote Enote , 5, 6, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Enote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Enote , 5, 4, $18
	PlayNote Enote , 5, 3, $18
	PlayNote Enote , 5, 6, $18
	PlayNote Gnote , 5, 4, $48
	PlayNote Fnote , 5, 4, $18
	PlayNote Fnote , 5, 6, $18
	PlayNote Gnote , 4, 3, $18
	PlayNote Gnote , 4, 2, $18
	PlayNote Gnote , 4, 6, $18
	PlayNote Gnote , 4, 3, $18
	PlayNote Gnote , 4, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 3, $18
	PlayNote Gnote , 4, 2, $18
	PlayNote Gnote , 4, 6, $18
	PlayNote Gnote , 4, 3, $18
	PlayNote Gnote , 4, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 4, 3, $18
	PlayNote Gnote , 4, 2, $18
	PlayNote Gnote , 4, 6, $18
	PlayNote Asharp, 4, 3, $48
	PlayNote Gsharp, 4, 3, $18
	PlayNote Gsharp, 4, 6, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Enote , 5, 3, $18
	PlayNote Enote , 5, 6, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Enote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Enote , 5, 4, $18
	PlayNote Enote , 5, 3, $18
	PlayNote Enote , 5, 6, $18
	PlayNote Enote , 5, 4, $18
	PlayNote Enote , 5, 6, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Enote , 5, 4, $18
	PlayNote Enote , 5, 3, $18
	PlayNote Enote , 5, 6, $18
	PlayNote Gnote , 5, 4, $48
	PlayNote Fnote , 5, 4, $18
	PlayNote Fnote , 5, 6, $18
	PlayNote Gnote , 4, 4, $48
	PlayNote Gnote , 4, 4, $18
	SND_ClearHWRegs $60
	PlayNote Gsharp, 4, 4, $48
	PlayNote Gsharp, 4, 4, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Anote , 4, 4, $48
	PlayNote Asharp, 4, 4, $48
	PlayNote Cnote , 5, 4, $30
	PlayNote Bnote , 4, 4, $48
	PlayNote Bnote , 4, 4, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Csharp, 5, 4, $48
	PlayNote Csharp, 5, 4, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 5, 3, $48
	PlayNote Fnote , 5, 3, $48
	PlayNote Gsharp, 5, 3, $30
	PlayNote Asharp, 5, 3, $60
	PlayNote Asharp, 5, 3, $60
	PlayNote Gnote , 8, 3, $10
	PlayNote Gsharp, 8, 3, $10
	PlayNote Gnote , 8, 3, $10
	PlayNote Dsharp, 8, 3, $10
	PlayNote Csharp, 8, 3, $10
	PlayNote Cnote , 8, 3, $10
	PlayNote Fsharp, 7, 3, $14
	PlayNote Gnote , 7, 3, $14
	PlayNote Gsharp, 7, 3, $14
	PlayNote Anote , 7, 3, $14
	PlayNote Asharp, 7, 4, $10
	PlayNote Asharp, 7, 3, $60
	PlayNote Asharp, 7, 3, $60
	PlayNote Asharp, 7, 6, $18
	SND_Ret
	
	
Music12_Wav::
	SND_SaveEnvelopeValue 0, $c6
	SND_SetFreqTableBaseIdx $f4
	SND_SetAudTermS01andSO2
	SND_Call WavFunc_002_6f71
	SND_Stop


WavFunc_002_6f71:
	PlayNote Enote , 5, 0, $18
	PlayNote Enote , 5, 0, $18
	SND_ClearHWRegs $18
	PlayNote Enote , 5, 0, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Enote , 5, 0, $18
	PlayNote Enote , 5, 0, $18
	SND_ClearHWRegs $18
	PlayNote Enote , 5, 0, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Enote , 5, 0, $18
	PlayNote Enote , 5, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 5, 0, $48
	PlayNote Fnote , 5, 0, $18
	SND_ClearHWRegs $18
	PlayNote Enote , 5, 0, $18
	PlayNote Enote , 5, 0, $18
	SND_ClearHWRegs $18
	PlayNote Enote , 5, 0, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Enote , 5, 0, $18
	PlayNote Enote , 5, 0, $18
	SND_ClearHWRegs $18
	PlayNote Enote , 5, 0, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Enote , 5, 0, $18
	PlayNote Enote , 5, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 5, 0, $48
	PlayNote Fnote , 5, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fnote , 5, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 5, 0, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 0, $30
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 0, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 0, $18
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Cnote , 5, 0, $18
	PlayNote Asharp, 4, 0, $30
	PlayNote Gnote , 4, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 0, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 0, $30
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Enote , 5, 0, $30
	PlayNote Fnote , 5, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 5, 0, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 0, $30
	PlayNote Dnote , 5, 0, $30
	PlayNote Dnote , 5, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 0, $3c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 0, $18
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Cnote , 5, 0, $18
	PlayNote Asharp, 4, 0, $30
	PlayNote Gnote , 4, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 0, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 0, $30
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Enote , 5, 0, $24
	SND_ClearHWRegs $0c
	PlayNote Fnote , 5, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 5, 0, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 0, $30
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 0, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 0, $18
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Cnote , 5, 0, $18
	PlayNote Asharp, 4, 0, $30
	PlayNote Gnote , 4, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 0, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 0, $3c
	SND_ClearHWRegs $0c
	PlayNote Enote , 5, 0, $30
	PlayNote Fnote , 5, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 5, 0, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 0, $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 0, $30
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 4, 0, $3c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 5, 0, $18
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Cnote , 5, 0, $18
	PlayNote Asharp, 4, 0, $30
	PlayNote Gnote , 4, 0, $18
	PlayNote Gnote , 4, 0, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $30
	PlayNote Enote , 5, 0, $18
	PlayNote Enote , 5, 0, $18
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Enote , 5, 0, $24
	SND_ClearHWRegs $60
	PlayNote Fnote , 5, 0, $18
	PlayNote Fnote , 5, 0, $18
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Fnote , 5, 0, $30
	SND_ClearHWRegs $48
	PlayNote Fsharp, 5, 0, $18
	PlayNote Fsharp, 5, 0, $18
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 5, 0, $30
	PlayNote Gnote , 4, 0, $18
	PlayNote Anote , 5, 0, $30
	PlayNote Fsharp, 5, 0, $18
	PlayNote Fsharp, 5, 0, $18
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 5, 0, $30
	SND_ClearHWRegs $48
	PlayNote Gsharp, 5, 0, $18
	PlayNote Gsharp, 5, 0, $18
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 5, 0, $18
	SND_ClearHWRegs $30
	SND_ClearHWRegs $30
	PlayNote Asharp, 5, 0, $3c
	SND_ClearHWRegs $0c
	PlayNote Cnote , 6, 0, $3c
	SND_ClearHWRegs $0c
	PlayNote Dsharp, 6, 0, $24
	SND_ClearHWRegs $0c
	PlayNote Fnote , 6, 0, $18
	PlayNote Fnote , 6, 0, $18
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Fnote , 6, 0, $18
	SND_ClearHWRegs $30
	PlayNote Fnote , 6, 0, $18
	PlayNote Fnote , 6, 0, $18
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Fnote , 6, 0, $18
	SND_ClearHWRegs $30
	PlayNote Fnote , 6, 0, $18
	PlayNote Fnote , 6, 0, $18
	SND_ClearHWRegs $30
	PlayNote Fnote , 6, 0, $30
	SND_Ret
	
	
Music12_Noise::
	SND_SaveEnvelopeValue 0, $66
	SND_SetAudTermS01andSO2
	SND_Call NoiseFunc_002_7125
	SND_Stop


NoiseFunc_002_7125:
	SND_Call NoiseFunc_002_7215
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	SND_ClearHWRegs $18
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $18
	SND_ClearHWRegs $14
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	SND_ClearHWRegs $18
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	SND_ClearHWRegs $18
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	SND_ClearHWRegs $18
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	SND_ClearHWRegs $18
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $2c
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $2c
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $2c
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $2c
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	SND_Call NoiseFunc_002_7215
	SND_Call NoiseFunc_002_7215
	SND_Call NoiseFunc_002_7215
	SND_Call NoiseFunc_002_7215
	SND_Call NoiseFunc_002_7215
	SND_Call NoiseFunc_002_7215
	SND_Call NoiseFunc_002_7215
	SND_Call NoiseFunc_002_7215
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $2c
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $2c
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $2c
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $2c
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $00
	SND_ClearHWRegs $08
	SND_Stop


NoiseFunc_002_7215:
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	SND_ClearHWRegs $18
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	SND_ClearHWRegs $18
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	SND_ClearHWRegs $18
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	SND_ClearHWRegs $18
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $2c
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $14
	NoiseSCF $0b
	NoiseSCF $00
	SND_ClearHWRegs $2c
	SND_Ret
	
	
Music13_SQ1::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_Call SquareFunc_002_7260
	SND_Stop


SquareFunc_002_7260:
	PlayNote Enote , 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 7, 6, $0c
	PlayNote Dsharp, 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Dsharp, 7, 6, $0c
	PlayNote Bnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 6, 6, $0c
	PlayNote Gsharp, 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 6, 6, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Enote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Enote , 6, 3, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Gsharp, 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 6, 6, $0c
	PlayNote Bnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 6, 6, $0c
	PlayNote Dsharp, 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Dsharp, 7, 6, $0c
	PlayNote Enote , 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 7, 6, $0c
	PlayNote Dsharp, 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Dsharp, 7, 6, $0c
	PlayNote Bnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 6, 6, $0c
	PlayNote Gsharp, 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 6, 6, $0c
	PlayNote Fsharp, 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 7, 6, $0c
	PlayNote Dnote , 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 7, 6, $0c
	PlayNote Bnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 6, 6, $0c
	PlayNote Anote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Gnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Gnote , 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Gnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Gnote , 6, 6, $0c
	SND_ClearHWRegs $30
	PlayNote Fsharp, 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 7, 6, $0c
	PlayNote Gnote , 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Gnote , 7, 6, $0c
	PlayNote Fsharp, 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 7, 6, $0c
	PlayNote Gnote , 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Gnote , 7, 6, $0c
	PlayNote Fsharp, 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 7, 6, $0c
	PlayNote Dnote , 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 7, 6, $0c
	PlayNote Bnote , 6, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 6, 6, $0c
	PlayNote Dnote , 7, 1, $10
	PlayNote Fnote , 7, 1, $10
	PlayNote Anote , 7, 1, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 7, 6, $0c
	SND_Ret
	
	
Music13_SQ2::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_Call SquareFunc_002_7331
	SND_Stop


SquareFunc_002_7331:
	PlayNote Enote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 5, 6, $0c
	PlayNote Bnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Gsharp, 6, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 6, 6, $0c
	PlayNote Bnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Fsharp, 6, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 6, 4, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 6, 6, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 4, $0c
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Enote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Enote , 5, 6, $0c
	PlayNote Bnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Gsharp, 6, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Gsharp, 6, 6, $0c
	PlayNote Bnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	PlayNote Fsharp, 6, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 6, 4, $0c
	SND_ClearHWRegs $0c
	PlayNote Fsharp, 6, 6, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 4, $0c
	SND_ClearHWRegs $0c
	PlayNote Bnote , 5, 6, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Gnote , 5, 6, $0c
	PlayNote Dnote , 6, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Gnote , 6, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Gnote , 6, 6, $0c
	PlayNote Dnote , 6, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Anote , 6, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 6, 4, $0c
	SND_ClearHWRegs $0c
	PlayNote Anote , 6, 6, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 4, $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 6, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Gnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Gnote , 5, 6, $0c
	PlayNote Dnote , 6, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Bnote , 6, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Bnote , 6, 6, $0c
	PlayNote Dnote , 6, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Anote , 6, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Anote , 6, 4, $0c
	SND_ClearHWRegs $0c
	PlayNote Anote , 6, 6, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 4, $0c
	SND_ClearHWRegs $0c
	PlayNote Dnote , 6, 6, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Asharp, 5, 6, $0c
	SND_ClearHWRegs $0c
	SND_Ret
	
	
Music13_Wav::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_Call WavFunc_002_7422
	SND_Stop


WavFunc_002_7422:
	PlayNote Enote , 7, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 7, 0, $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 6, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gsharp, 6, 0, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Enote , 6, 0, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $30
	PlayNote Gsharp, 6, 0, $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 6, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 7, 0, $18
	SND_ClearHWRegs $18
	PlayNote Enote , 7, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dsharp, 7, 0, $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 6, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gsharp, 6, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 7, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dnote , 7, 0, $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 6, 0, $18
	SND_ClearHWRegs $18
	PlayNote Anote , 6, 0, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 6, 0, $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 6, 0, $18
	SND_ClearHWRegs $48
	PlayNote Fsharp, 7, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 7, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 7, 0, $18
	SND_ClearHWRegs $18
	PlayNote Gnote , 7, 0, $18
	SND_ClearHWRegs $18
	PlayNote Fsharp, 7, 0, $18
	SND_ClearHWRegs $18
	PlayNote Dnote , 7, 0, $18
	SND_ClearHWRegs $18
	PlayNote Bnote , 6, 0, $18
	SND_ClearHWRegs $30
	PlayNote Dnote , 7, 0, $10
	PlayNote Fnote , 7, 0, $10
	PlayNote Anote , 7, 0, $18
	SND_Stop


Music13_Noise::
	SND_ClearHWRegs $60
	SND_Stop


Music14_SQ1::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $00
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_Call SquareFunc_002_74c0
	SND_Stop


SquareFunc_002_74c0:
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 4, 2, $18
	PlayNote Cnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 5, 4, $0c
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 4, 2, $18
	PlayNote Cnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 5, 4, $0c
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 4, 2, $18
	PlayNote Cnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 5, 4, $0c
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 4, 2, $18
	PlayNote Cnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 5, 4, $0c
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 4, 2, $18
	PlayNote Cnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 5, 4, $0c
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 4, 2, $18
	PlayNote Cnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 5, 4, $0c
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 4, 2, $18
	PlayNote Cnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 5, 4, $0c
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 4, 2, $18
	PlayNote Cnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 5, 4, $0c
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 4, 2, $18
	PlayNote Cnote , 5, 2, $18
	PlayNote Cnote , 5, 2, $18
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 4, 2, $18
	PlayNote Cnote , 5, 2, $18
	PlayNote Cnote , 5, 2, $18
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 4, 2, $18
	PlayNote Cnote , 5, 2, $18
	PlayNote Cnote , 5, 2, $18
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 4, 2, $18
	PlayNote Cnote , 5, 2, $18
	PlayNote Cnote , 5, 2, $18
	PlayNote Gsharp, 4, 1, $18
	PlayNote Cnote , 6, 1, $0c
	PlayNote Cnote , 6, 4, $0c
	PlayNote Dsharp, 6, 1, $0c
	PlayNote Dsharp, 6, 4, $0c
	PlayNote Gsharp, 6, 1, $0c
	PlayNote Gsharp, 6, 4, $0c
	PlayNote Asharp, 6, 1, $0c
	PlayNote Asharp, 6, 4, $0c
	PlayNote Gsharp, 6, 1, $0c
	PlayNote Gsharp, 6, 4, $0c
	PlayNote Dsharp, 6, 1, $0c
	PlayNote Dsharp, 6, 4, $0c
	PlayNote Gsharp, 6, 1, $0c
	PlayNote Gsharp, 6, 4, $0c
	PlayNote Asharp, 4, 1, $18
	PlayNote Asharp, 5, 1, $0c
	PlayNote Asharp, 5, 4, $0c
	PlayNote Dnote , 6, 1, $0c
	PlayNote Dnote , 6, 4, $0c
	PlayNote Fnote , 6, 1, $0c
	PlayNote Fnote , 6, 4, $0c
	PlayNote Asharp, 6, 1, $0c
	PlayNote Asharp, 6, 4, $0c
	PlayNote Dnote , 7, 1, $0c
	PlayNote Dnote , 7, 4, $0c
	PlayNote Fnote , 7, 1, $0c
	PlayNote Fnote , 7, 6, $0c
	PlayNote Cnote , 8, 1, $0c
	PlayNote Cnote , 8, 6, $0c
	SND_Ret
	
	
Music14_SQ2::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $00
	SND_SetAudTermS01andSO2
	SND_Call SquareFunc_002_7585
	SND_Stop


SquareFunc_002_7585:
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 6, 6, $0c
	PlayNote Gnote , 5, 2, $18
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 6, 6, $0c
	PlayNote Gnote , 5, 2, $18
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 6, 6, $0c
	PlayNote Gnote , 5, 2, $18
	PlayNote Cnote , 5, 2, $18
	PlayNote Gnote , 5, 2, $18
	SND_ClearHWRegs $0c
	PlayNote Cnote , 6, 6, $0c
	PlayNote Gnote , 5, 2, $18
	PlayNote Cnote , 6, 2, $18
	PlayNote Gnote , 6, 2, $18
	PlayNote Cnote , 7, 2, $18
	PlayNote Gnote , 6, 2, $18
	PlayNote Cnote , 6, 2, $18
	PlayNote Gnote , 6, 2, $18
	PlayNote Cnote , 7, 2, $18
	PlayNote Gnote , 6, 2, $18
	PlayNote Cnote , 6, 2, $18
	PlayNote Gnote , 6, 2, $18
	PlayNote Cnote , 7, 2, $18
	PlayNote Gnote , 6, 2, $18
	PlayNote Cnote , 6, 2, $18
	PlayNote Gnote , 6, 2, $18
	PlayNote Cnote , 7, 2, $18
	PlayNote Gnote , 6, 2, $18
	SND_ClearHWRegs $24
	PlayNote Cnote , 6, 4, $0c
	PlayNote Cnote , 6, 6, $0c
	PlayNote Dsharp, 6, 4, $0c
	PlayNote Dsharp, 6, 6, $0c
	PlayNote Gsharp, 6, 4, $0c
	PlayNote Gsharp, 6, 6, $0c
	PlayNote Asharp, 6, 4, $0c
	PlayNote Asharp, 6, 6, $0c
	PlayNote Gsharp, 6, 4, $0c
	PlayNote Gsharp, 6, 6, $0c
	PlayNote Dsharp, 6, 4, $0c
	PlayNote Dsharp, 6, 6, $0c
	PlayNote Gsharp, 6, 4, $0c
	PlayNote Gsharp, 6, 6, $0c
	SND_ClearHWRegs $0c
	SND_ClearHWRegs $0c
	PlayNote Asharp, 5, 4, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Dnote , 6, 4, $0c
	PlayNote Dnote , 6, 6, $0c
	PlayNote Fnote , 6, 4, $0c
	PlayNote Fnote , 6, 6, $0c
	PlayNote Asharp, 6, 4, $0c
	PlayNote Asharp, 6, 6, $0c
	PlayNote Dnote , 7, 4, $0c
	PlayNote Dnote , 7, 6, $0c
	PlayNote Fnote , 7, 4, $0c
	PlayNote Cnote , 8, 4, $18
	PlayNote Cnote , 8, 6, $18
	SND_Ret
	
	
Music14_Wav::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_Call WavFunc_002_7626
	SND_Stop


WavFunc_002_7626:
	SND_SetFreqTableBaseIdx $00
	SND_SetAudTermS01andSO2
	PlayNote Cnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 5, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 5, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 5, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 5, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 5, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 5, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 5, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 5, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 5, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 5, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 5, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Cnote , 5, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gnote , 4, 3, $10
	SND_ClearHWRegs $08
	PlayNote Gsharp, 3, 3, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $48
	PlayNote Asharp, 3, 3, $14
	SND_ClearHWRegs $04
	SND_Ret
	
	
Music14_Noise::
	SND_ClearHWRegs $60
	SND_Stop


Music15_SQ1::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_Call SquareFunc_002_7711
	SND_Stop


SquareFunc_002_7711:
	PlayNote Csharp, 7, 1, $30
	PlayNote Csharp, 7, 3, $18
	PlayNote Enote , 7, 1, $30
	PlayNote Enote , 7, 3, $18
	PlayNote Anote , 6, 1, $18
	PlayNote Anote , 6, 3, $18
	PlayNote Gsharp, 6, 1, $48
	PlayNote Gsharp, 6, 3, $18
	PlayNote Enote , 6, 1, $48
	PlayNote Enote , 6, 3, $18
	PlayNote Fsharp, 6, 2, $60
	PlayNote Fsharp, 6, 2, $20
	PlayNote Fsharp, 6, 4, $18
	SND_ClearHWRegs $60
	SND_ClearHWRegs $60
	SND_ClearHWRegs $28
	SND_Ret
	
	
Music15_SQ2::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_Call SquareFunc_002_774a
	SND_Stop


SquareFunc_002_774a:
	PlayNote Anote , 6, 3, $30
	PlayNote Anote , 6, 4, $18
	PlayNote Csharp, 7, 3, $30
	PlayNote Csharp, 7, 4, $18
	PlayNote Fsharp, 6, 3, $18
	PlayNote Fsharp, 6, 4, $18
	PlayNote Enote , 6, 3, $44
	SND_ClearHWRegs $04
	PlayNote Enote , 6, 4, $18
	PlayNote Csharp, 6, 3, $44
	SND_ClearHWRegs $04
	PlayNote Csharp, 6, 4, $18
	PlayNote Fsharp, 5, 3, $18
	PlayNote Fsharp, 5, 4, $0c
	PlayNote Fsharp, 5, 6, $0c
	PlayNote Asharp, 5, 3, $18
	PlayNote Asharp, 5, 4, $0c
	PlayNote Asharp, 5, 6, $0c
	PlayNote Csharp, 6, 3, $18
	PlayNote Csharp, 6, 4, $0c
	PlayNote Csharp, 6, 6, $0c
	PlayNote Fsharp, 6, 3, $18
	PlayNote Fsharp, 6, 4, $0c
	PlayNote Fsharp, 6, 6, $0c
	PlayNote Asharp, 6, 3, $18
	PlayNote Asharp, 6, 4, $0c
	PlayNote Asharp, 6, 6, $0c
	PlayNote Csharp, 7, 3, $18
	PlayNote Csharp, 7, 4, $0c
	PlayNote Csharp, 7, 6, $0c
	PlayNote Fsharp, 7, 3, $18
	PlayNote Fsharp, 7, 4, $0c
	PlayNote Fsharp, 7, 6, $0c
	SND_ClearHWRegs $30
	SND_Ret
	
	
Music15_Wav::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $c0
	SND_SaveEnvelopeValue 2, $a6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 5, $46
	SND_SaveEnvelopeValue 6, $26
	SND_SaveEnvelopeValue 7, $a0
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $e8
	SND_SetAudTermS01andSO2
	SND_Call WavFunc_002_77a7
	SND_Stop


WavFunc_002_77a7:
	PlayNote Dnote , 5, 2, $60
	PlayNote Dnote , 5, 2, $60
	PlayNote Enote , 5, 2, $60
	PlayNote Enote , 5, 2, $60
	PlayNote Fsharp, 4, 2, $60
	PlayNote Fsharp, 4, 2, $60
	PlayNote Fsharp, 4, 2, $60
	PlayNote Fsharp, 4, 2, $60
	SND_Stop


Music15_Noise::
	SND_ClearHWRegs $60
	SND_Stop


Sound01_SQ1::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 4, $66
	SND_SetSongSpeed $07
	SND_SquareSet75Wave1
	SND_SetAlternatingAudTerm 2
	SND_SetFreqTableBaseIdx $02
	PlayNote Fnote , 5, 0, $08
	PlayNote Fsharp, 5, 3, $08
	PlayNote Gnote , 5, 4, $08
	PlayNote Fsharp, 5, 0, $08
	PlayNote Gnote , 5, 3, $08
	PlayNote Gsharp, 5, 4, $08
	PlayNote Gnote , 5, 0, $08
	PlayNote Gsharp, 5, 3, $08
	PlayNote Anote , 5, 4, $08
	PlayNote Gsharp, 5, 0, $08
	PlayNote Anote , 5, 3, $08
	PlayNote Asharp, 5, 4, $08
	PlayNote Asharp, 5, 0, $08
	PlayNote Bnote , 5, 3, $08
	PlayNote Cnote , 6, 4, $08
	SND_Stop

; unused - $77e6
	SND_SetAudTermS01andSO2


Sound01_SQ2::
	SND_SetAudTermS01andSO2
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 3, $86
	SND_SquareSet75Wave1
	SND_SetFreqTableBaseIdx $02
	SND_ClearHWRegs $0c
	PlayNote Dnote , 7, 0, $08
	PlayNote Dsharp, 7, 2, $08
	PlayNote Enote , 7, 3, $08
	PlayNote Fnote , 7, 0, $08
	PlayNote Fsharp, 7, 2, $08
	PlayNote Gnote , 7, 3, $08
	SND_Stop


; unused - $77fe
	SND_SaveEnvelopeValue 0, $c6
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $07
	PlayNote Cnote , 5, 0, $30
	SND_ClearHWRegs $08
	PlayNote Cnote , 5, 0, $28
	SND_Stop


Sound02_SQ2::
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 4, $66
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $fe
	PlayNote Cnote , 6, 0, $0c
	PlayNote Cnote , 6, 4, $0c
	PlayNote Cnote , 6, 0, $0c
	PlayNote Cnote , 6, 4, $0c
	PlayNote Cnote , 6, 0, $0c
	PlayNote Cnote , 6, 4, $0c
	PlayNote Cnote , 6, 0, $0c
	PlayNote Cnote , 6, 4, $0c
	PlayNote Cnote , 6, 0, $0c
	PlayNote Cnote , 6, 4, $0c
	PlayNote Cnote , 6, 0, $0c
	PlayNote Cnote , 6, 4, $0c
	PlayNote Cnote , 6, 0, $0c
	PlayNote Cnote , 6, 4, $0c
	PlayNote Cnote , 6, 0, $0c
	PlayNote Cnote , 6, 4, $0c
	PlayNote Cnote , 6, 0, $0c
	SND_Stop


Sound03_SQ2::
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $06
	SND_SaveEnvelopeValue 0, $c6
	SND_SquareSet75Wave1
	SND_SetFreqTableBaseIdx $06
	PlayNote Dsharp, 6, 0, $0c
	PlayNote Dnote , 6, 0, $0c
	PlayNote Csharp, 6, 0, $0c
	PlayNote Cnote , 6, 0, $0c
	PlayNote Bnote , 5, 0, $0c
	PlayNote Asharp, 5, 0, $0c
	PlayNote Anote , 5, 0, $0c
	PlayNote Gsharp, 5, 0, $0c
	PlayNote Gnote , 5, 0, $0c
	SND_Stop


Sound04_SQ2::
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $07
	SND_SaveEnvelopeValue 0, $f6
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $00
	PlayNote Asharp, 4, 0, $04
	PlayNote Bnote , 4, 0, $04
	PlayNote Cnote , 5, 0, $04
	PlayNote Csharp, 5, 0, $04
	PlayNote Dnote , 5, 0, $04
	PlayNote Dsharp, 5, 0, $04
	PlayNote Enote , 5, 0, $04
	PlayNote Fnote , 5, 0, $04
	PlayNote Fsharp, 5, 0, $04
	PlayNote Gnote , 5, 0, $04
	PlayNote Gsharp, 5, 0, $04
	PlayNote Anote , 5, 0, $04
	PlayNote Asharp, 5, 0, $04
	PlayNote Bnote , 5, 0, $04
	PlayNote Cnote , 6, 0, $04
	PlayNote Csharp, 6, 0, $04
	PlayNote Dnote , 6, 0, $04
	PlayNote Dsharp, 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Fsharp, 6, 0, $04
	SND_SetFreqTableBaseIdx $05
	PlayNote Anote , 5, 0, $04
	PlayNote Asharp, 5, 0, $04
	PlayNote Bnote , 5, 0, $04
	PlayNote Cnote , 6, 0, $04
	PlayNote Csharp, 6, 0, $04
	PlayNote Dnote , 6, 0, $04
	PlayNote Dsharp, 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Fsharp, 6, 0, $04
	SND_SetFreqTableBaseIdx $0c
	PlayNote Cnote , 6, 0, $04
	PlayNote Csharp, 6, 0, $04
	PlayNote Dnote , 6, 0, $04
	PlayNote Dsharp, 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Fsharp, 6, 0, $04
	SND_Stop


Sound05_SQ2::
	SND_SetSongSpeed $06
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 6, $46
	SND_SaveEnvelopeValue 3, $26
	SND_SetAudTermS01andSO2
	SND_SetFreqTableBaseIdx $01
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	SND_ClearHWRegs $08
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	PlayNote Enote , 3, 0, $04
	PlayNote Fnote , 3, 0, $04
	SND_ClearHWRegs $08
	PlayNote Fnote , 4, 6, $04
	PlayNote Fsharp, 4, 3, $04
	SND_SetAlternatingAudTerm 2
	SND_SetFreqTableBaseIdx $08
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	SND_SetAudTermS01andSO2
	SND_Stop


Sound06_Noise::
	SND_SetSongSpeed $02
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 6, $46
	SND_SaveEnvelopeValue 3, $26
	SND_SetAudTermS01andSO2
	NoiseSCF $06
	NoiseSCF $01
	NoiseSCF $06
	NoiseSCF $c1
	SND_Stop


Sound07_SQ1::
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $07
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 3, $26
	SND_SaveEnvelopeValue 4, $66
	SND_SaveEnvelopeValue 6, $46
	SND_SetAlternatingAudTerm 2
	SND_SetFreqTableBaseIdx $13
	PlayNote Gnote , 6, 4, $04
	PlayNote Gsharp, 6, 4, $04
	PlayNote Anote , 6, 4, $04
	PlayNote Asharp, 6, 4, $04
	PlayNote Bnote , 6, 4, $04
	SND_SetFreqTableBaseIdx $14
	PlayNote Gnote , 6, 4, $04
	PlayNote Gsharp, 6, 4, $04
	PlayNote Anote , 6, 4, $04
	PlayNote Asharp, 6, 4, $04
	PlayNote Bnote , 6, 4, $04
	SND_SetFreqTableBaseIdx $19
	PlayNote Gnote , 6, 4, $04
	PlayNote Gsharp, 6, 4, $04
	PlayNote Anote , 6, 4, $04
	PlayNote Asharp, 6, 4, $04
	PlayNote Bnote , 6, 4, $04
	SND_SetFreqTableBaseIdx $19
	SND_SetAudTermS01
	PlayNote Asharp, 6, 6, $04
	PlayNote Bnote , 6, 6, $04
	SND_SetAudTermS01andSO2
	SND_Stop


Sound07_SQ2::
	SND_SaveEnvelopeValue 0, $c6
	SND_SaveEnvelopeValue 1, $a6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 3, $a0
	SND_SaveEnvelopeValue 4, $26
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 6, $60
	SND_SquareSet75Wave1
	SND_SetAudTermS01andSO2
	SND_ClearHWRegs $60
	PlayNote Fnote , 5, 0, $08
	PlayNote Fnote , 6, 5, $0c
	PlayNote Fnote , 7, 5, $0c
	PlayNote Fnote , 6, 0, $08
	PlayNote Fnote , 7, 5, $0c
	PlayNote Fnote , 8, 5, $0c
	SND_Stop


Sound07_Wav::
	SND_SaveEnvelopeValue 5, $a6
	SND_SetAlternatingAudTerm 2
	SND_SetFreqTableBaseIdx $0c
	PlayNote Dsharp, 6, 5, $04
	PlayNote Dnote , 6, 5, $04
	PlayNote Dsharp, 6, 5, $04
	PlayNote Enote , 6, 5, $04
	PlayNote Fnote , 6, 5, $04
	PlayNote Fsharp, 6, 5, $04
	PlayNote Gnote , 6, 5, $04
	PlayNote Gsharp, 6, 5, $04
	PlayNote Anote , 6, 5, $04
	PlayNote Asharp, 6, 5, $04
	PlayNote Bnote , 6, 5, $04
	SND_Stop


Sound07_Noise::
	SND_SetAudTermS01andSO2
	SND_SaveEnvelopeValue 0, $e6
	SND_SetNoiseDividingRatioOfFreqs 2
	NoiseSCF $08
	NoiseSCF $17
	SND_ClearHWRegs $08
	NoiseSCF $08
	NoiseSCF $01
	SND_ClearHWRegs $08
	SND_Stop
	
	
Sound08_SQ2::
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $07
	SND_SaveEnvelopeValue 0, $f6
	SND_SaveEnvelopeValue 2, $86
	SND_SaveEnvelopeValue 4, $26
	SND_SquareSet75Wave1
	PlayNote Enote , 6, 0, $10
	PlayNote Fnote , 6, 0, $10
	SND_ClearHWRegs $04
	SND_SetAlternatingAudTerm 1
	PlayNote Enote , 6, 2, $10
	PlayNote Fnote , 6, 2, $10
	SND_ClearHWRegs $08
	SND_SetAlternatingAudTerm 2
	PlayNote Enote , 6, 4, $10
	PlayNote Fnote , 6, 4, $10
	SND_SetAudTermS01andSO2
	SND_Stop


Sound09_Noise::
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 7, $46
	SND_SetNoiseDividingRatioOfFreqs 0
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $06
	NoiseSCF $06
	NoiseSCF $61
	SND_SetAlternatingAudTerm 1
	NoiseSCF $04
	SND_SquareSet75Wave2
	SND_SetAlternatingAudTerm 2
	NoiseSCF $04
	SND_SetNoiseDividingRatioOfFreqs 3
	SND_SetAudTermS01andSO2
	SND_Stop


Sound0a_SQ2::
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $07
	SND_SaveEnvelopeValue 0, $e6
	SND_SaveEnvelopeValue 3, $86
	SND_SquareSet25Wave1
	SND_SetFreqTableBaseIdx $07
	SND_SetAudTermS01andSO2
	PlayNote Enote , 5, 0, $04
	SND_SetAlternatingAudTerm 1
	PlayNote Enote , 5, 3, $04
	SND_SetAudTermS01andSO2
	PlayNote Fnote , 5, 0, $04
	SND_SetAlternatingAudTerm 2
	PlayNote Fnote , 5, 3, $04
	SND_SetAudTermS01andSO2
	PlayNote Fsharp, 5, 0, $04
	SND_SetAlternatingAudTerm 1
	PlayNote Fsharp, 5, 3, $04
	SND_SetAudTermS01andSO2
	PlayNote Gnote , 5, 0, $04
	SND_SetAlternatingAudTerm 2
	PlayNote Gnote , 5, 3, $04
	SND_SetAudTermS01andSO2
	PlayNote Fnote , 6, 0, $04
	SND_SetAlternatingAudTerm 1
	PlayNote Fnote , 6, 3, $04
	SND_SetAudTermS01andSO2
	PlayNote Gsharp, 6, 0, $04
	SND_SetAlternatingAudTerm 2
	PlayNote Gsharp, 6, 3, $04
	SND_SetAudTermS01andSO2
	PlayNote Asharp, 6, 0, $04
	SND_SetAlternatingAudTerm 1
	PlayNote Asharp, 6, 3, $04
	SND_SetAudTermS01andSO2
	PlayNote Bnote , 6, 0, $04
	SND_SetAlternatingAudTerm 2
	PlayNote Bnote , 6, 3, $04
	SND_SetAudTermS01andSO2
	SND_Stop


Sound0b_SQ1::
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $05
	SND_SaveEnvelopeValue 3, $e6
	SND_SetFreqTableBaseIdx $03
	SND_SquareSet75Wave2
	SND_Call SquareFunc_002_7a50
	SND_Stop


Sound0b_SQ2::
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $05
	SND_SaveEnvelopeValue 3, $86
	SND_SetFreqTableBaseIdx $02
	SND_SquareSet75Wave2
	SND_Call SquareFunc_002_7a50
	SND_Stop


SquareFunc_002_7a50:
	PlayNote Anote , 6, 3, $08
	PlayNote Dsharp, 6, 3, $08
	PlayNote Anote , 6, 3, $08
	PlayNote Dsharp, 6, 3, $08
	PlayNote Anote , 6, 3, $08
	PlayNote Dsharp, 6, 3, $08
	PlayNote Anote , 6, 3, $08
	PlayNote Dsharp, 6, 3, $08
	PlayNote Anote , 6, 3, $08
	PlayNote Dsharp, 6, 3, $08
	PlayNote Anote , 6, 3, $08
	PlayNote Dsharp, 6, 3, $08
	PlayNote Anote , 6, 3, $08
	PlayNote Dsharp, 6, 3, $08
	PlayNote Anote , 6, 3, $08
	PlayNote Dsharp, 6, 3, $08
	PlayNote Anote , 6, 3, $08
	PlayNote Dsharp, 6, 3, $08
	PlayNote Anote , 6, 3, $08
	PlayNote Dsharp, 6, 3, $08
	SND_Ret


; unused - $7a79
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 7, $46
	SND_SetAlternatingAudTerm 2
	SND_SetSongSpeed $07
	PlayNote Anote , 6, 3, $08
	PlayNote Dsharp, 6, 7, $08
	PlayNote Anote , 6, 3, $08
	PlayNote Dsharp, 6, 7, $08
	SND_SetFreqTableBaseIdx $02
	PlayNote Anote , 6, 3, $08
	PlayNote Dsharp, 6, 7, $08
	PlayNote Anote , 6, 3, $08
	PlayNote Dsharp, 6, 7, $08
	SND_Stop


Sound0c_Noise::
	SND_SaveEnvelopeValue 3, $86
	SND_SaveEnvelopeValue 7, $46
	SND_SetNoiseDividingRatioOfFreqs 1
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $02
	NoiseSCF $0e
	NoiseSCF $6b
	NoiseSCF $04
	SND_Stop


; unused - $7a9f
	SND_Stop


Sound0d_SQ1::
	SND_SetSongSpeed $03
	SND_SaveEnvelopeValue 3, $46
	SND_SquareSet25Wave2
	SND_SetAudTermS01andSO2
	SND_SetAlternatingAudTerm 2
	SND_SetFreqTableBaseIdx $08
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	PlayNote Fnote , 6, 0, $04
	PlayNote Enote , 6, 0, $04
	SND_SetAudTermS01andSO2
	SND_Stop


Sound0d_SQ2::
	SND_SetSongSpeed $03
	SND_SaveEnvelopeValue 3, $46
	SND_SquareSet25Wave2
	SND_SetAudTermS01andSO2
	PlayNote Fnote , 4, 3, $08
	SND_ClearHWRegs $04
	PlayNote Fsharp, 4, 3, $08
	SND_ClearHWRegs $04
	PlayNote Fnote , 4, 3, $08
	SND_ClearHWRegs $04
	PlayNote Fsharp, 4, 3, $08
	SND_ClearHWRegs $04
	PlayNote Fnote , 4, 3, $08
	SND_ClearHWRegs $04
	PlayNote Fsharp, 4, 3, $08
	SND_ClearHWRegs $04
	PlayNote Fnote , 4, 3, $08
	SND_Stop


Sound0e_Noise::
	SND_SetSongSpeed $01
	SND_Call NoiseFunc_002_7b1a
	SND_Stop


Sound0f_Noise::
	SND_SetSongSpeed $02
	SND_Call NoiseFunc_002_7b1a
	SND_Stop


Sound10_Noise::
	SND_SetSongSpeed $03
	SND_Call NoiseFunc_002_7b1a
	SND_Stop


Sound11_Noise::
	SND_SetSongSpeed $04
	SND_Call NoiseFunc_002_7b1a
	SND_Stop


Sound12_Noise::
	SND_SetSongSpeed $05
	SND_Call NoiseFunc_002_7b1a
	SND_Stop


Sound13_Noise::
	SND_SetSongSpeed $06
	SND_Call NoiseFunc_002_7b1a
	SND_Stop


NoiseFunc_002_7b1a:
	SND_SaveEnvelopeValue 0, $a1
	SND_SaveEnvelopeValue 1, $c1
	SND_SetNoiseDividingRatioOfFreqs 1
	SND_SetAudTermS01andSO2
	NoiseSCF $04
	NoiseSCF $0b
	NoiseSCF $02
	NoiseSCF $23
	SND_Ret
	
	
Sound14_Noise::
	SND_SaveEnvelopeValue 0, $a1
	SND_SaveEnvelopeValue 1, $c1
	SND_SetNoiseDividingRatioOfFreqs 0
	SND_SetAudTermS01andSO2
	NoiseSCF $04
	NoiseSCF $02
	NoiseSCF $02
	NoiseSCF $23
	SND_Stop


Sound15_SQ1::
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_SaveEnvelopeValue 0, $a6
	SND_SaveEnvelopeValue 1, $c6
	SND_SaveEnvelopeValue 2, $a0
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 6, $86
	SND_SaveEnvelopeValue 7, $60
	SND_SquareSet75Wave1
	PlayNote Enote , 5, 1, $10
	PlayNote Enote , 5, 5, $10
	PlayNote Enote , 5, 0, $10
	PlayNote Enote , 5, 2, $10
	PlayNote Enote , 5, 6, $10
	PlayNote Enote , 5, 7, $10
	SND_Stop


Sound15_SQ2::
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_SaveEnvelopeValue 1, $c6
	SND_SaveEnvelopeValue 0, $a6
	SND_SaveEnvelopeValue 6, $86
	SND_SaveEnvelopeValue 3, $66
	SND_SaveEnvelopeValue 5, $c0
	SND_SaveEnvelopeValue 2, $a0
	SND_SaveEnvelopeValue 7, $60
	SND_SquareSet75Wave1
	PlayNote Dsharp, 5, 1, $10
	PlayNote Dsharp, 5, 5, $10
	PlayNote Dsharp, 5, 0, $10
	PlayNote Dsharp, 5, 2, $10
	PlayNote Dsharp, 5, 6, $10
	PlayNote Dsharp, 5, 7, $10
	SND_Stop


Sound16_SQ1::
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_SaveEnvelopeValue 1, $c6
	SND_SquareSet75Wave1
	SND_SetFreqTableBaseIdx $0d
	PlayNote Enote , 3, 1, $80
	SND_Stop


Sound16_SQ2::
	SND_SetAudTermS01andSO2
	SND_SetSongSpeed $04
	SND_SaveEnvelopeValue 1, $c6
	SND_SquareSet75Wave1
	SND_SetFreqTableBaseIdx $0d
	PlayNote Fnote , 4, 1, $80
	SND_Stop


Sound17_SQ1::
	SND_SetSongSpeed $02
	SND_SaveEnvelopeValue 1, $c6
	SND_SaveEnvelopeValue 3, $60
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $fb
	SND_SetAudTermS01andSO2
	PlayNote Cnote , 3, 3, $80
	SND_Stop


Sound17_SQ2::
	SND_SetSongSpeed $02
	SND_SaveEnvelopeValue 1, $c6
	SND_SaveEnvelopeValue 3, $60
	SND_SetFreqTableBaseIdx $fb
	SND_SquareSet25Wave2
	SND_SetAudTermS01andSO2
	PlayNote Csharp, 3, 3, $80
	SND_Stop


Sound18_SQ1::
	SND_SetSongSpeed $02
	SND_SaveEnvelopeValue 3, $60
	SND_SetFreqTableBaseIdx $fb
	SND_SquareSet25Wave2
	SND_SetAudTermS01andSO2
	PlayNote Dnote , 3, 3, $80
	SND_Stop


Sound18_SQ2::
	SND_SetSongSpeed $02
	SND_SaveEnvelopeValue 3, $60
	SND_SetFreqTableBaseIdx $fb
	SND_SquareSet25Wave2
	SND_SetAudTermS01andSO2
	PlayNote Dsharp, 3, 3, $80
	SND_Stop


Sound19_SQ1::
	SND_SetSongSpeed $02
	SND_SaveEnvelopeValue 3, $60
	SND_SetFreqTableBaseIdx $fb
	SND_SquareSet25Wave2
	SND_SetAudTermS01andSO2
	PlayNote Fnote , 3, 3, $80
	SND_Stop


Sound19_SQ2::
	SND_SetSongSpeed $02
	SND_SaveEnvelopeValue 3, $60
	SND_SetFreqTableBaseIdx $fb
	SND_SquareSet25Wave2
	SND_SetAudTermS01andSO2
	PlayNote Enote , 3, 3, $80
	SND_Stop


Sound1a_SQ1::
	SND_SetSongSpeed $02
	SND_SaveEnvelopeValue 3, $60
	SND_SquareSet25Wave2
	SND_SetFreqTableBaseIdx $f7
	SND_SetAudTermS01andSO2
	PlayNote Cnote , 3, 3, $80
	SND_Stop


Sound1a_SQ2::
	SND_SetSongSpeed $02
	SND_SaveEnvelopeValue 3, $60
	SND_SetFreqTableBaseIdx $f7
	SND_SquareSet25Wave2
	SND_SetAudTermS01andSO2
	PlayNote Dsharp, 3, 3, $80
	SND_Stop


Sound1b_SQ1::
	SND_SetSongSpeed $02
	SND_SaveEnvelopeValue 3, $60
	SND_SetFreqTableBaseIdx $f9
	SND_SquareSet25Wave2
	SND_SetAudTermS01andSO2
	PlayNote Cnote , 3, 3, $80
	SND_Stop


Sound1b_SQ2::
	SND_SetSongSpeed $02
	SND_SaveEnvelopeValue 3, $60
	SND_SetFreqTableBaseIdx $f9
	SND_SquareSet25Wave2
	SND_SetAudTermS01andSO2
	PlayNote Dsharp, 3, 3, $80
	SND_Stop


Sound1c_SQ1::
	SND_SetSongSpeed $02
	SND_SaveEnvelopeValue 3, $60
	SND_SetFreqTableBaseIdx $fb
	SND_SquareSet25Wave2
	SND_SetAudTermS01andSO2
	PlayNote Cnote , 3, 3, $80
	SND_Stop


Sound1c_SQ2::
	SND_SetSongSpeed $07
	SND_SaveEnvelopeValue 3, $c6
	SND_SetFreqTableBaseIdx $fb
	SND_SquareSet25Wave2
	SND_SetAudTermS01andSO2
	PlayNote Dsharp, 3, 3, $08
	SND_Stop


Sound1d_SQ2::
	SND_SaveEnvelopeValue 3, $c6
	SND_SetFreqTableBaseIdx $18
	SND_SquareSet25Wave2
	SND_SetAudTermS01andSO2
	PlayNote Dsharp, 3, 3, $08
	PlayNote Dnote , 3, 3, $08
	PlayNote Csharp, 3, 3, $08
	PlayNote Dnote , 3, 3, $08
	PlayNote Dsharp, 3, 3, $08
	PlayNote Enote , 3, 3, $08
	PlayNote Fnote , 3, 3, $08
	PlayNote Fsharp, 3, 3, $08
	PlayNote Gnote , 3, 3, $08
	SND_Stop


Sound1e_SQ2::
	SND_SaveEnvelopeValue 3, $c6
	SND_SaveEnvelopeValue 1, $60
	SND_SetFreqTableBaseIdx $10
	SND_SquareSet25Wave2
	SND_SetSongSpeed $04
	SND_SetAudTermS01andSO2
	PlayNote Anote , 6, 3, $08
	PlayNote Anote , 5, 3, $08
	PlayNote Anote , 4, 3, $08
	SND_SetAlternatingAudTerm 1
	PlayNote Anote , 5, 1, $18
	SND_SetAudTermS01andSO2
	PlayNote Anote , 5, 3, $08
	PlayNote Anote , 4, 3, $08
	PlayNote Anote , 3, 3, $08
	SND_SetAudTermS01andSO2
	PlayNote Anote , 4, 3, $18
	PlayNote Anote , 4, 1, $18
	SND_SetAudTermS01andSO2
	SND_Stop


    SECTION "ROM Bank $003", ROMX[$4000], BANK[$3]

VolumeModulatedSound_DenshaDeGo::
; Unknown
	db $b0, $36, $00, $00

; Length is $0041fd, 4th byte is unknown
	db $fd, $41, $00, $00

; Actual volume data
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $33, $44, $44, $44, $44, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $55, $44, $44, $44, $55
	db $55, $55, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $22, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $55, $55, $55
	db $55, $66, $66, $55, $44, $44, $66, $77, $55, $44, $44, $44, $44, $33, $44, $44
	db $44, $33, $22, $22, $22, $22, $22, $22, $33, $33, $22, $22, $33, $44, $44, $33
	db $33, $33, $33, $33, $44, $44, $55, $44, $44, $44, $33, $33, $33, $44, $44, $33
	db $22, $22, $33, $33, $22, $22, $22, $33, $33, $22, $22, $33, $33, $33, $44, $44
	db $44, $44, $55, $55, $66, $66, $66, $77, $77, $66, $33, $44, $66, $77, $55, $33
	db $33, $33, $33, $22, $22, $33, $33, $11, $00, $00, $22, $22, $22, $22, $33, $22
	db $11, $22, $55, $55, $44, $33, $44, $55, $55, $44, $44, $66, $66, $44, $33, $33
	db $33, $33, $33, $33, $22, $11, $11, $22, $22, $22, $11, $11, $22, $33, $33, $33
	db $33, $44, $44, $44, $44, $55, $77, $77, $77, $77, $77, $77, $66, $33, $55, $77
	db $77, $55, $11, $11, $33, $22, $11, $11, $22, $22, $00, $00, $00, $11, $33, $33
	db $33, $33, $22, $22, $44, $77, $77, $66, $44, $55, $66, $66, $44, $55, $66, $66
	db $44, $22, $11, $22, $33, $22, $11, $00, $00, $11, $22, $22, $22, $11, $11, $22
	db $44, $44, $55, $55, $55, $55, $55, $66, $77, $77, $77, $77, $77, $55, $22, $44
	db $77, $77, $55, $00, $00, $22, $33, $11, $00, $22, $22, $00, $00, $00, $33, $66
	db $44, $22, $22, $33, $44, $55, $77, $77, $66, $44, $44, $66, $55, $44, $55, $66
	db $55, $11, $00, $11, $44, $44, $11, $00, $00, $11, $22, $33, $33, $33, $22, $22
	db $33, $55, $66, $66, $55, $55, $44, $55, $66, $77, $77, $77, $55, $22, $00, $66
	db $77, $77, $33, $00, $00, $22, $11, $11, $22, $44, $33, $00, $00, $00, $55, $77
	db $55, $22, $11, $22, $44, $77, $77, $77, $44, $33, $55, $55, $33, $22, $44, $55
	db $33, $00, $00, $11, $55, $44, $00, $00, $00, $33, $44, $44, $44, $33, $22, $22
	db $44, $66, $77, $66, $55, $44, $55, $66, $77, $77, $77, $22, $00, $44, $77, $77
	db $22, $00, $22, $44, $00, $00, $33, $66, $55, $00, $00, $11, $44, $55, $55, $55
	db $44, $22, $33, $66, $77, $66, $33, $33, $55, $44, $11, $22, $44, $55, $11, $00
	db $00, $22, $33, $22, $11, $11, $11, $22, $44, $55, $55, $33, $22, $33, $66, $77
	db $77, $66, $66, $66, $66, $77, $77, $77, $22, $00, $55, $77, $66, $00, $00, $44
	db $44, $00, $00, $33, $55, $11, $00, $11, $66, $66, $33, $33, $55, $55, $44, $44
	db $77, $77, $44, $11, $44, $55, $33, $11, $33, $55, $22, $00, $00, $22, $33, $11
	db $00, $11, $22, $22, $22, $33, $55, $55, $33, $22, $55, $77, $77, $77, $77, $77
	db $77, $77, $44, $22, $44, $77, $77, $22, $00, $11, $55, $22, $00, $11, $44, $33
	db $00, $00, $33, $55, $55, $44, $44, $33, $33, $66, $77, $77, $33, $00, $44, $77
	db $66, $11, $11, $44, $33, $00, $00, $11, $22, $22, $11, $00, $00, $11, $44, $44
	db $33, $22, $22, $22, $33, $66, $77, $77, $77, $77, $77, $55, $33, $22, $77, $77
	db $55, $00, $00, $77, $66, $00, $00, $55, $55, $00, $00, $33, $66, $44, $33, $44
	db $33, $00, $22, $77, $77, $55, $00, $11, $77, $77, $33, $22, $44, $33, $00, $00
	db $33, $33, $22, $11, $22, $11, $11, $33, $55, $55, $33, $11, $11, $44, $66, $77
	db $77, $77, $77, $33, $00, $00, $77, $77, $77, $00, $00, $33, $66, $33, $33, $66
	db $44, $00, $00, $44, $77, $77, $44, $44, $33, $00, $11, $77, $77, $66, $00, $00
	db $22, $44, $33, $44, $44, $11, $00, $00, $22, $55, $55, $33, $11, $11, $22, $44
	db $66, $77, $77, $33, $11, $33, $77, $77, $77, $77, $11, $00, $00, $77, $77, $55
	db $00, $00, $00, $00, $11, $66, $77, $33, $00, $11, $55, $77, $77, $77, $66, $22
	db $22, $66, $77, $77, $44, $33, $22, $00, $00, $22, $44, $22, $00, $00, $00, $11
	db $44, $44, $33, $11, $11, $33, $66, $77, $77, $77, $66, $44, $66, $77, $77, $77
	db $33, $00, $11, $77, $77, $00, $00, $33, $11, $00, $00, $44, $66, $22, $00, $33
	db $33, $44, $77, $77, $77, $33, $55, $77, $77, $44, $44, $77, $55, $00, $00, $11
	db $22, $11, $00, $00, $00, $00, $11, $44, $22, $00, $11, $55, $77, $77, $77, $77
	db $77, $77, $77, $77, $77, $55, $00, $55, $77, $44, $00, $00, $44, $00, $00, $00
	db $44, $22, $00, $00, $44, $44, $33, $77, $77, $66, $33, $77, $77, $77, $55, $55
	db $66, $55, $22, $11, $11, $00, $00, $00, $00, $00, $00, $00, $11, $22, $11, $11
	db $33, $55, $66, $77, $77, $77, $77, $77, $77, $55, $22, $77, $77, $66, $00, $00
	db $44, $11, $00, $00, $22, $00, $00, $00, $11, $22, $44, $77, $77, $33, $33, $77
	db $77, $77, $77, $55, $44, $55, $55, $33, $11, $11, $11, $00, $00, $00, $00, $00
	db $11, $00, $00, $11, $44, $66, $66, $77, $77, $77, $77, $77, $66, $44, $77, $77
	db $77, $00, $00, $55, $33, $00, $00, $00, $00, $00, $00, $11, $11, $44, $77, $44
	db $22, $55, $77, $77, $77, $77, $66, $44, $55, $77, $44, $11, $11, $11, $00, $00
	db $00, $11, $00, $00, $00, $00, $22, $44, $55, $66, $77, $77, $77, $77, $55, $55
	db $77, $77, $77, $11, $33, $55, $11, $00, $22, $44, $00, $00, $00, $00, $00, $22
	db $77, $33, $00, $33, $77, $77, $77, $77, $77, $44, $55, $66, $44, $33, $44, $22
	db $00, $00, $11, $22, $22, $11, $00, $00, $22, $55, $55, $66, $77, $77, $66, $22
	db $33, $77, $77, $77, $22, $22, $44, $22, $11, $55, $44, $00, $00, $00, $00, $22
	db $55, $55, $11, $00, $33, $55, $66, $77, $66, $33, $44, $55, $33, $33, $44, $55
	db $11, $00, $00, $11, $22, $44, $33, $00, $11, $33, $55, $66, $77, $77, $66, $22
	db $11, $77, $77, $77, $44, $44, $22, $00, $11, $55, $44, $11, $00, $00, $00, $11
	db $66, $66, $33, $22, $33, $33, $55, $77, $77, $33, $33, $44, $22, $22, $44, $44
	db $11, $00, $00, $00, $22, $44, $44, $22, $11, $44, $66, $77, $77, $77, $22, $22
	db $77, $77, $55, $44, $55, $44, $00, $00, $33, $33, $22, $22, $00, $00, $11, $55
	db $55, $33, $33, $55, $44, $55, $77, $66, $44, $55, $44, $22, $11, $33, $33, $11
	db $11, $00, $00, $11, $33, $33, $22, $33, $55, $66, $77, $77, $55, $44, $77, $77
	db $55, $55, $77, $66, $22, $11, $33, $33, $11, $22, $11, $00, $11, $44, $44, $11
	db $22, $44, $55, $44, $55, $55, $44, $55, $55, $33, $33, $44, $44, $11, $11, $22
	db $22, $33, $22, $22, $22, $44, $66, $55, $66, $66, $55, $44, $77, $66, $44, $44
	db $66, $55, $11, $22, $44, $33, $22, $22, $22, $11, $33, $55, $44, $33, $44, $44
	db $55, $55, $66, $44, $33, $33, $33, $22, $33, $33, $11, $00, $11, $11, $11, $33
	db $44, $33, $33, $66, $77, $77, $55, $55, $66, $77, $77, $44, $44, $55, $44, $11
	db $11, $22, $22, $11, $11, $00, $00, $33, $44, $33, $33, $44, $55, $66, $66, $55
	db $44, $44, $55, $44, $22, $33, $33, $11, $00, $11, $11, $11, $22, $22, $22, $33
	db $66, $77, $77, $44, $44, $66, $77, $77, $44, $55, $66, $55, $22, $22, $33, $33
	db $11, $00, $00, $00, $22, $44, $22, $11, $22, $44, $55, $55, $44, $44, $55, $55
	db $33, $22, $44, $44, $22, $00, $11, $22, $33, $33, $22, $33, $44, $77, $66, $22
	db $33, $77, $77, $66, $44, $55, $55, $44, $33, $33, $33, $33, $22, $00, $00, $33
	db $44, $33, $11, $11, $33, $55, $55, $55, $44, $33, $55, $44, $22, $33, $44, $44
	db $11, $00, $11, $22, $33, $33, $33, $33, $55, $77, $44, $33, $66, $77, $77, $44
	db $44, $55, $55, $55, $33, $33, $33, $22, $11, $11, $11, $33, $44, $22, $11, $22
	db $44, $44, $44, $44, $33, $44, $55, $44, $33, $44, $33, $22, $22, $22, $33, $33
	db $33, $33, $44, $55, $66, $44, $33, $55, $77, $77, $44, $44, $44, $44, $44, $33
	db $44, $44, $22, $00, $00, $22, $44, $55, $11, $00, $22, $44, $44, $44, $44, $33
	db $33, $44, $33, $33, $44, $33, $22, $22, $11, $33, $44, $44, $44, $44, $55, $44
	db $44, $33, $77, $77, $66, $44, $44, $55, $44, $33, $44, $55, $33, $11, $11, $11
	db $22, $44, $44, $11, $00, $11, $22, $33, $44, $33, $33, $22, $22, $33, $44, $44
	db $33, $33, $22, $33, $44, $55, $55, $66, $55, $22, $22, $55, $77, $77, $55, $44
	db $33, $44, $44, $44, $55, $55, $22, $22, $22, $22, $44, $55, $33, $11, $11, $11
	db $22, $44, $33, $22, $33, $22, $11, $33, $44, $44, $33, $22, $22, $33, $55, $66
	db $66, $66, $22, $22, $55, $55, $66, $66, $55, $44, $33, $33, $44, $66, $55, $22
	db $11, $22, $22, $33, $44, $33, $22, $11, $11, $11, $33, $33, $22, $22, $22, $22
	db $33, $44, $44, $44, $44, $33, $33, $55, $66, $77, $44, $33, $33, $55, $55, $55
	db $55, $44, $44, $33, $22, $44, $66, $55, $33, $22, $22, $33, $44, $44, $33, $33
	db $11, $11, $22, $33, $33, $33, $22, $11, $11, $22, $33, $44, $33, $33, $44, $44
	db $55, $77, $55, $55, $55, $66, $55, $55, $55, $55, $55, $44, $11, $33, $55, $44
	db $22, $22, $22, $22, $33, $33, $22, $33, $22, $11, $22, $22, $33, $33, $33, $11
	db $22, $33, $33, $33, $44, $33, $44, $55, $55, $55, $44, $55, $55, $55, $44, $55
	db $55, $55, $55, $33, $22, $44, $55, $33, $22, $22, $22, $33, $33, $22, $22, $33
	db $22, $22, $22, $22, $33, $33, $33, $22, $22, $33, $33, $33, $33, $33, $44, $44
	db $55, $55, $44, $55, $55, $55, $55, $55, $55, $55, $55, $44, $33, $55, $55, $33
	db $22, $22, $22, $33, $33, $22, $11, $22, $22, $11, $22, $22, $22, $22, $22, $22
	db $33, $44, $44, $33, $33, $44, $55, $66, $66, $44, $55, $55, $55, $55, $55, $55
	db $55, $55, $44, $33, $44, $55, $44, $33, $22, $22, $33, $33, $22, $22, $22, $22
	db $22, $22, $22, $22, $33, $22, $22, $22, $33, $33, $33, $33, $33, $44, $55, $55
	db $55, $44, $55, $66, $66, $55, $55, $55, $55, $55, $44, $44, $55, $55, $33, $33
	db $33, $22, $33, $22, $11, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $33
	db $33, $33, $33, $33, $44, $55, $55, $55, $55, $44, $55, $66, $66, $55, $55, $55
	db $55, $55, $44, $44, $55, $44, $44, $33, $33, $33, $22, $22, $22, $22, $22, $22
	db $11, $22, $22, $22, $22, $22, $22, $22, $33, $33, $33, $44, $44, $44, $55, $55
	db $55, $55, $55, $55, $55, $66, $55, $66, $55, $55, $44, $55, $55, $44, $44, $33
	db $33, $33, $22, $22, $22, $22, $22, $11, $11, $22, $22, $11, $22, $22, $22, $22
	db $22, $33, $44, $44, $44, $44, $55, $55, $44, $55, $55, $66, $66, $55, $55, $55
	db $55, $55, $55, $44, $44, $44, $44, $33, $33, $22, $22, $22, $22, $22, $22, $22
	db $22, $22, $22, $22, $22, $22, $22, $22, $33, $33, $33, $44, $44, $44, $44, $55
	db $44, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $44, $44, $33
	db $33, $33, $33, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22
	db $22, $33, $22, $33, $44, $44, $44, $44, $44, $44, $44, $55, $55, $55, $55, $55
	db $55, $55, $55, $55, $55, $55, $44, $44, $44, $33, $44, $33, $22, $22, $22, $22
	db $22, $22, $22, $22, $22, $22, $22, $22, $33, $22, $33, $22, $33, $33, $44, $44
	db $44, $44, $44, $44, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $44
	db $44, $44, $44, $44, $33, $33, $33, $22, $22, $22, $22, $22, $22, $22, $22, $22
	db $22, $22, $22, $22, $33, $22, $33, $33, $44, $44, $44, $44, $55, $44, $55, $55
	db $55, $55, $55, $55, $55, $55, $55, $55, $44, $44, $44, $44, $44, $44, $33, $33
	db $33, $33, $33, $22, $33, $22, $33, $22, $22, $22, $33, $22, $33, $22, $33, $33
	db $33, $33, $44, $33, $55, $22, $55, $44, $55, $44, $44, $55, $55, $55, $55, $55
	db $55, $55, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $22, $33, $22
	db $33, $22, $22, $22, $33, $22, $22, $33, $33, $33, $33, $33, $33, $44, $44, $33
	db $44, $44, $44, $33, $55, $44, $44, $44, $44, $44, $55, $55, $44, $44, $44, $44
	db $44, $44, $44, $33, $44, $33, $33, $33, $33, $33, $33, $33, $22, $33, $22, $33
	db $22, $33, $33, $33, $33, $33, $44, $33, $44, $33, $33, $44, $33, $44, $44, $44
	db $44, $44, $55, $44, $55, $44, $44, $44, $44, $33, $55, $44, $44, $33, $33, $44
	db $33, $44, $22, $44, $22, $44, $33, $33, $44, $22, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $44, $33, $44, $44, $33, $55, $33, $55, $33, $55, $44, $44
	db $33, $55, $33, $44, $44, $44, $44, $44, $33, $44, $33, $44, $33, $44, $22, $44
	db $33, $33, $33, $44, $33, $33, $33, $33, $33, $44, $33, $44, $33, $33, $33, $44
	db $44, $33, $44, $44, $33, $55, $33, $44, $44, $44, $44, $44, $44, $33, $55, $33
	db $44, $33, $55, $33, $44, $44, $33, $44, $33, $44, $33, $44, $44, $33, $33, $44
	db $33, $44, $33, $44, $33, $33, $33, $33, $33, $44, $33, $33, $44, $33, $44, $22
	db $66, $33, $44, $33, $44, $44, $33, $44, $33, $66, $33, $44, $33, $44, $44, $33
	db $44, $33, $55, $33, $66, $22, $55, $33, $55, $33, $55, $33, $44, $44, $33, $44
	db $44, $44, $22, $55, $33, $44, $22, $44, $22, $55, $33, $33, $44, $44, $22, $44
	db $33, $55, $33, $44, $33, $44, $44, $44, $33, $44, $44, $33, $55, $33, $55, $33
	db $44, $44, $33, $44, $33, $33, $33, $44, $33, $55, $22, $55, $33, $44, $22, $55
	db $22, $55, $22, $44, $33, $33, $44, $33, $33, $33, $33, $44, $33, $44, $33, $44
	db $44, $44, $33, $44, $44, $44, $44, $44, $33, $55, $33, $44, $44, $44, $44, $44
	db $33, $55, $33, $44, $44, $44, $33, $55, $33, $44, $44, $33, $44, $33, $33, $33
	db $33, $33, $44, $33, $44, $33, $33, $44, $22, $44, $44, $22, $44, $44, $44, $33
	db $55, $44, $33, $55, $33, $44, $44, $44, $44, $33, $33, $44, $44, $33, $33, $44
	db $33, $44, $55, $22, $44, $22, $44, $22, $55, $22, $44, $22, $44, $44, $11, $55
	db $11, $55, $22, $55, $33, $44, $33, $44, $44, $44, $33, $44, $33, $44, $44, $22
	db $44, $33, $44, $44, $44, $44, $33, $44, $33, $33, $44, $33, $33, $44, $22, $44
	db $22, $44, $22, $33, $33, $33, $44, $33, $33, $44, $33, $44, $22, $44, $22, $44
	db $44, $33, $44, $44, $44, $33, $44, $22, $44, $44, $44, $44, $44, $44, $33, $33
	db $44, $44, $44, $44, $33, $33, $44, $33, $33, $33, $44, $22, $44, $33, $44, $33
	db $33, $33, $33, $33, $44, $33, $33, $44, $33, $44, $22, $44, $44, $33, $44, $33
	db $33, $44, $33, $44, $44, $44, $33, $44, $33, $44, $44, $33, $44, $33, $44, $33
	db $33, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $44, $33, $44, $22, $44, $33, $44, $44, $44, $33, $44, $33, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $33, $44, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $22, $33, $22, $33, $33, $33, $33, $33, $33, $33, $33, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $55, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $33, $33, $33, $33, $44, $33, $33, $33, $33, $33, $22, $33, $22
	db $33, $33, $22, $33, $33, $33, $33, $44, $33, $44, $33, $44, $44, $44, $44, $44
	db $44, $44, $55, $44, $55, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33
	db $33, $33, $22, $33, $33, $22, $33, $33, $22, $33, $22, $33, $33, $33, $33, $33
	db $44, $33, $44, $44, $44, $44, $55, $44, $55, $44, $44, $44, $44, $55, $55, $44
	db $44, $44, $44, $44, $44, $33, $33, $33, $22, $22, $22, $22, $22, $22, $22, $22
	db $22, $22, $22, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $55, $55, $55
	db $55, $55, $55, $55, $44, $55, $55, $44, $44, $44, $33, $33, $44, $33, $33, $33
	db $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $33, $33, $33, $33, $44
	db $44, $44, $55, $55, $55, $55, $55, $55, $44, $55, $55, $55, $55, $55, $44, $44
	db $44, $33, $33, $33, $33, $33, $33, $22, $22, $22, $22, $22, $22, $22, $22, $22
	db $22, $22, $22, $33, $33, $33, $44, $44, $55, $55, $55, $55, $66, $66, $55, $44
	db $55, $55, $44, $44, $44, $33, $33, $33, $22, $22, $33, $33, $33, $33, $33, $22
	db $33, $33, $33, $33, $33, $33, $22, $22, $22, $22, $33, $33, $33, $44, $44, $44
	db $55, $55, $66, $66, $66, $55, $44, $44, $44, $44, $44, $44, $44, $33, $33, $22
	db $22, $33, $33, $44, $33, $33, $22, $22, $33, $33, $33, $33, $33, $22, $22, $22
	db $22, $22, $33, $33, $33, $33, $44, $44, $55, $66, $77, $66, $55, $55, $33, $44
	db $44, $55, $55, $44, $33, $22, $22, $22, $22, $44, $44, $44, $44, $33, $22, $22
	db $33, $33, $44, $44, $33, $22, $22, $11, $22, $33, $33, $33, $33, $33, $33, $44
	db $55, $66, $77, $77, $55, $44, $44, $44, $44, $44, $44, $44, $33, $11, $11, $22
	db $33, $44, $55, $44, $44, $33, $33, $33, $33, $44, $44, $44, $33, $22, $11, $11
	db $11, $22, $33, $44, $33, $33, $33, $44, $55, $77, $77, $77, $55, $44, $33, $44
	db $44, $44, $44, $55, $33, $11, $00, $11, $33, $55, $66, $55, $44, $33, $22, $22
	db $22, $44, $44, $33, $22, $11, $00, $00, $11, $33, $44, $44, $44, $44, $33, $44
	db $66, $77, $77, $77, $44, $33, $22, $22, $22, $44, $55, $44, $33, $11, $00, $22
	db $44, $55, $77, $66, $55, $44, $22, $11, $11, $33, $44, $33, $22, $00, $00, $00
	db $11, $33, $55, $55, $55, $44, $33, $44, $55, $77, $77, $77, $77, $22, $11, $00
	db $11, $33, $55, $55, $44, $22, $00, $00, $22, $55, $77, $77, $77, $55, $33, $11
	db $00, $11, $22, $44, $33, $22, $00, $00, $00, $22, $44, $55, $55, $44, $33, $22
	db $33, $66, $77, $77, $77, $77, $11, $00, $00, $11, $33, $66, $66, $55, $22, $00
	db $00, $22, $55, $77, $77, $77, $55, $33, $11, $00, $11, $22, $44, $44, $33, $00
	db $00, $00, $22, $44, $55, $55, $44, $33, $33, $44, $66, $77, $77, $77, $55, $11
	db $00, $00, $11, $44, $55, $55, $55, $11, $00, $00, $11, $55, $77, $77, $77, $55
	db $33, $11, $11, $11, $22, $33, $33, $22, $00, $00, $00, $22, $44, $44, $44, $44
	db $44, $44, $44, $66, $77, $77, $77, $55, $11, $00, $00, $11, $44, $55, $55, $44
	db $22, $00, $00, $22, $55, $77, $77, $77, $55, $44, $22, $11, $11, $11, $22, $33
	db $22, $00, $00, $00, $22, $33, $44, $44, $44, $44, $55, $55, $77, $77, $77, $77
	db $44, $11, $00, $00, $11, $33, $44, $44, $44, $11, $00, $00, $22, $55, $77, $77
	db $77, $66, $44, $22, $11, $22, $22, $22, $22, $11, $00, $00, $00, $22, $33, $44
	db $44, $44, $44, $55, $55, $66, $77, $77, $77, $66, $22, $00, $00, $00, $22, $44
	db $44, $44, $33, $00, $00, $22, $44, $77, $77, $77, $66, $55, $33, $11, $22, $22
	db $22, $22, $22, $00, $00, $00, $11, $22, $44, $44, $44, $44, $55, $55, $66, $77
	db $77, $77, $77, $33, $00, $00, $00, $11, $33, $44, $55, $33, $00, $00, $11, $33
	db $77, $77, $77, $77, $66, $33, $11, $11, $11, $22, $33, $22, $00, $00, $00, $00
	db $11, $44, $44, $44, $55, $44, $44, $55, $66, $77, $77, $77, $77, $33, $00, $00
	db $00, $22, $44, $44, $55, $33, $00, $00, $22, $33, $77, $77, $77, $77, $66, $22
	db $11, $22, $22, $33, $44, $22, $00, $00, $00, $00, $22, $44, $44, $55, $55, $44
	db $44, $55, $66, $77, $77, $77, $77, $33, $00, $00, $00, $33, $44, $33, $44, $33
	db $00, $00, $00, $22, $77, $77, $77, $66, $66, $33, $11, $22, $22, $44, $55, $22
	db $00, $00, $00, $00, $22, $33, $44, $44, $44, $33, $33, $44, $55, $77, $77, $77
	db $77, $55, $00, $22, $00, $33, $33, $44, $44, $33, $00, $00, $00, $11, $66, $77
	db $77, $66, $77, $44, $33, $44, $33, $55, $77, $44, $11, $00, $00, $00, $11, $22
	db $22, $33, $33, $22, $22, $22, $44, $77, $77, $77, $77, $77, $55, $11, $66, $22
	db $44, $44, $22, $33, $11, $00, $00, $00, $00, $55, $66, $55, $66, $66, $55, $55
	db $55, $55, $77, $77, $55, $22, $00, $00, $00, $00, $00, $11, $22, $11, $11, $11
	db $22, $44, $66, $77, $77, $77, $77, $77, $55, $77, $33, $55, $44, $33, $11, $22
	db $00, $00, $00, $00, $11, $44, $44, $44, $66, $66, $55, $77, $66, $77, $77, $77
	db $44, $33, $22, $00, $11, $00, $00, $00, $00, $00, $00, $11, $22, $44, $66, $77
	db $77, $77, $77, $77, $77, $66, $66, $66, $55, $33, $33, $11, $00, $00, $00, $00
	db $11, $22, $11, $33, $44, $44, $55, $66, $66, $77, $77, $66, $55, $55, $33, $33
	db $22, $11, $11, $11, $00, $00, $00, $11, $22, $33, $55, $66, $55, $77, $66, $77
	db $77, $77, $77, $77, $66, $44, $22, $11, $11, $11, $11, $11, $11, $11, $22, $22
	db $22, $33, $44, $44, $55, $55, $55, $55, $55, $55, $55, $44, $44, $22, $22, $22
	db $11, $22, $22, $22, $33, $33, $22, $33, $44, $44, $55, $66, $66, $66, $66, $55
	db $44, $44, $44, $33, $44, $33, $22, $22, $22, $11, $22, $22, $22, $33, $33, $33
	db $44, $44, $44, $55, $55, $55, $44, $44, $33, $33, $33, $22, $22, $22, $22, $22
	db $11, $22, $22, $33, $44, $44, $44, $55, $55, $55, $55, $55, $55, $55, $55, $44
	db $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $33, $33, $33, $22, $22, $11, $11, $22, $22, $22, $22
	db $33, $33, $44, $44, $44, $44, $55, $55, $55, $55, $55, $44, $44, $44, $33, $44
	db $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $33, $33, $22, $22, $22, $22, $22, $22, $33, $33, $33, $33, $33
	db $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33
	db $33, $33, $22, $33, $22, $22, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $33, $33
	db $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $33, $33, $33, $44, $44, $44
	db $55, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33
	db $44, $44, $44, $33, $33, $22, $22, $33, $33, $33, $33, $33, $33, $22, $22, $33
	db $33, $44, $44, $44, $44, $44, $44, $33, $44, $44, $44, $55, $44, $44, $44, $44
	db $44, $44, $33, $44, $44, $33, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $22, $22, $22, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $55, $66, $55
	db $44, $33, $55, $55, $66, $66, $55, $44, $44, $33, $22, $33, $44, $44, $33, $22
	db $11, $22, $33, $33, $44, $33, $33, $44, $33, $22, $22, $44, $44, $44, $33, $22
	db $22, $33, $33, $44, $44, $55, $66, $44, $33, $22, $55, $55, $66, $66, $44, $44
	db $44, $33, $22, $33, $55, $44, $44, $22, $11, $22, $33, $44, $44, $44, $33, $44
	db $33, $22, $22, $33, $44, $44, $33, $22, $22, $33, $33, $33, $33, $44, $55, $55
	db $44, $22, $22, $66, $66, $55, $55, $55, $44, $44, $33, $22, $44, $55, $55, $33
	db $11, $11, $22, $44, $44, $33, $33, $33, $44, $33, $22, $33, $44, $44, $44, $22
	db $22, $33, $33, $33, $33, $44, $55, $55, $55, $33, $33, $44, $66, $55, $55, $55
	db $55, $44, $33, $33, $33, $44, $55, $44, $22, $11, $22, $33, $33, $44, $33, $33
	db $44, $33, $22, $33, $33, $33, $33, $22, $22, $22, $33, $22, $33, $33, $44, $55
	db $66, $55, $33, $33, $55, $66, $66, $55, $55, $44, $44, $33, $33, $33, $44, $44
	db $22, $11, $11, $33, $33, $33, $44, $33, $33, $44, $33, $22, $33, $44, $33, $33
	db $22, $22, $22, $33, $33, $33, $44, $44, $55, $66, $55, $33, $33, $66, $55, $55
	db $66, $55, $44, $33, $33, $22, $44, $55, $44, $22, $11, $22, $33, $33, $44, $44
	db $33, $33, $44, $33, $44, $44, $33, $22, $33, $22, $22, $22, $22, $22, $22, $33
	db $44, $55, $77, $55, $33, $33, $66, $66, $66, $66, $55, $33, $33, $33, $22, $33
	db $44, $44, $11, $11, $11, $22, $33, $44, $44, $33, $44, $55, $44, $44, $33, $33
	db $33, $44, $33, $22, $22, $33, $33, $33, $33, $33, $55, $77, $55, $22, $33, $66
	db $66, $66, $55, $55, $33, $33, $33, $22, $22, $44, $44, $11, $00, $22, $22, $33
	db $55, $44, $22, $44, $55, $44, $44, $33, $33, $33, $33, $22, $11, $22, $33, $33
	db $22, $33, $44, $66, $77, $33, $22, $44, $77, $66, $55, $55, $55, $33, $33, $33
	db $22, $33, $55, $33, $00, $00, $22, $33, $44, $55, $33, $22, $55, $55, $33, $44
	db $33, $33, $44, $33, $11, $11, $33, $22, $22, $22, $33, $55, $77, $77, $44, $33
	db $44, $77, $77, $55, $55, $55, $33, $22, $33, $22, $22, $55, $33, $00, $00, $22
	db $33, $44, $66, $33, $33, $55, $55, $44, $44, $33, $33, $44, $22, $11, $11, $33
	db $22, $22, $22, $33, $55, $77, $77, $33, $33, $55, $77, $77, $55, $66, $55, $22
	db $22, $33, $11, $33, $55, $22, $00, $11, $22, $33, $44, $55, $33, $33, $55, $55
	db $44, $33, $33, $33, $44, $22, $11, $22, $22, $22, $22, $33, $33, $55, $77, $77
	db $33, $33, $66, $77, $66, $55, $66, $44, $22, $33, $33, $11, $33, $55, $11, $00
	db $11, $33, $33, $55, $55, $33, $44, $55, $55, $44, $44, $33, $22, $33, $22, $11
	db $22, $22, $22, $22, $22, $44, $66, $77, $77, $33, $33, $66, $77, $66, $66, $66
	db $33, $11, $33, $22, $22, $44, $44, $00, $00, $11, $33, $44, $55, $55, $33, $44
	db $55, $55, $55, $55, $33, $22, $22, $11, $11, $22, $22, $11, $11, $22, $44, $66
	db $77, $77, $44, $33, $55, $77, $77, $66, $77, $44, $11, $22, $33, $22, $33, $44
	db $11, $00, $00, $22, $44, $55, $55, $33, $33, $55, $55, $55, $44, $44, $33, $33
	db $11, $11, $22, $22, $22, $11, $11, $33, $55, $77, $66, $44, $33, $55, $77, $77
	db $66, $77, $55, $22, $22, $33, $22, $33, $44, $11, $00, $11, $22, $33, $44, $55
	db $33, $33, $55, $55, $33, $44, $55, $55, $22, $11, $22, $22, $33, $33, $22, $22
	db $44, $66, $66, $55, $33, $33, $77, $77, $55, $55, $66, $44, $22, $33, $22, $22
	db $44, $44, $11, $00, $22, $33, $44, $44, $33, $22, $44, $55, $44, $44, $33, $33
	db $22, $22, $22, $22, $22, $22, $22, $33, $44, $55, $66, $77, $44, $33, $33, $77
	db $77, $55, $66, $44, $11, $22, $33, $22, $33, $44, $22, $00, $11, $33, $44, $55
	db $55, $33, $33, $44, $55, $55, $44, $33, $22, $22, $22, $22, $22, $22, $22, $22
	db $22, $44, $55, $77, $77, $55, $33, $33, $77, $77, $66, $66, $55, $11, $11, $33
	db $22, $22, $44, $22, $00, $00, $22, $44, $55, $55, $33, $33, $44, $55, $55, $44
	db $44, $44, $22, $11, $11, $22, $22, $22, $22, $22, $33, $55, $66, $66, $44, $33
	db $55, $77, $66, $55, $66, $55, $33, $22, $33, $22, $33, $44, $22, $00, $11, $22
	db $33, $44, $44, $22, $33, $44, $44, $33, $44, $44, $44, $33, $22, $22, $22, $33
	db $33, $33, $33, $44, $66, $66, $55, $22, $33, $77, $77, $55, $55, $55, $33, $33
	db $44, $22, $22, $55, $33, $11, $11, $33, $33, $44, $44, $33, $22, $33, $44, $33
	db $22, $22, $44, $33, $33, $22, $22, $11, $33, $33, $44, $55, $66, $66, $66, $33
	db $33, $55, $77, $66, $44, $55, $33, $22, $33, $44, $11, $22, $44, $22, $00, $22
	db $33, $44, $55, $44, $22, $33, $44, $44, $44, $44, $33, $33, $33, $22, $22, $22
	db $22, $22, $33, $33, $44, $55, $66, $66, $55, $33, $33, $77, $77, $55, $55, $55
	db $22, $22, $44, $44, $22, $33, $33, $00, $00, $33, $44, $44, $44, $22, $11, $33
	db $55, $55, $44, $33, $33, $33, $33, $22, $22, $22, $33, $44, $33, $44, $66, $77
	db $55, $22, $33, $77, $66, $55, $55, $55, $22, $33, $44, $33, $22, $44, $33, $11
	db $11, $33, $33, $44, $44, $33, $11, $22, $44, $44, $33, $33, $33, $33, $33, $22
	db $22, $22, $33, $44, $44, $44, $55, $66, $77, $33, $22, $44, $77, $66, $44, $55
	db $33, $11, $33, $44, $22, $22, $44, $22, $00, $22, $33, $44, $55, $44, $11, $22
	db $44, $55, $44, $33, $22, $33, $33, $44, $33, $11, $11, $33, $44, $33, $44, $66
	db $66, $66, $33, $22, $44, $77, $77, $44, $44, $33, $11, $44, $55, $22, $22, $33
	db $22, $00, $22, $44, $44, $44, $33, $11, $11, $33, $55, $55, $22, $22, $33, $33
	db $33, $33, $22, $22, $33, $44, $44, $44, $66, $77, $55, $22, $33, $77, $77, $66
	db $55, $44, $11, $33, $55, $44, $22, $33, $22, $11, $11, $44, $44, $33, $44, $33
	db $11, $22, $55, $55, $33, $33, $33, $33, $33, $44, $22, $11, $22, $33, $44, $44
	db $55, $55, $66, $66, $33, $22, $77, $77, $66, $44, $44, $33, $22, $55, $55, $22
	db $22, $33, $22, $11, $44, $44, $33, $33, $22, $11, $22, $44, $55, $33, $22, $22
	db $33, $44, $44, $22, $11, $22, $44, $55, $55, $55, $66, $66, $44, $33, $33, $77
	db $77, $55, $44, $44, $22, $44, $66, $44, $11, $22, $33, $22, $22, $44, $33, $22
	db $33, $33, $11, $22, $55, $44, $22, $22, $33, $33, $44, $33, $22, $11, $33, $44
	db $44, $44, $55, $55, $55, $66, $44, $33, $55, $77, $66, $44, $55, $33, $22, $55
	db $66, $22, $11, $33, $22, $11, $33, $44, $22, $22, $33, $11, $11, $44, $55, $22
	db $22, $33, $33, $33, $44, $33, $22, $22, $44, $44, $44, $66, $55, $55, $66, $44
	db $33, $55, $77, $66, $44, $55, $44, $22, $44, $66, $22, $22, $44, $22, $11, $44
	db $44, $11, $22, $33, $22, $11, $33, $44, $22, $22, $33, $22, $22, $44, $44, $22
	db $22, $44, $33, $44, $55, $55, $55, $66, $66, $44, $33, $55, $77, $66, $55, $55
	db $33, $22, $55, $77, $33, $11, $33, $22, $11, $44, $44, $11, $11, $44, $22, $11
	db $33, $44, $22, $22, $33, $22, $22, $55, $44, $22, $22, $44, $33, $44, $55, $55
	db $44, $66, $66, $33, $33, $66, $77, $66, $55, $55, $22, $22, $77, $77, $22, $22
	db $33, $22, $22, $55, $33, $00, $22, $33, $11, $11, $33, $33, $22, $22, $22, $11
	db $33, $55, $33, $22, $33, $33, $44, $55, $55, $33, $44, $66, $66, $55, $44, $44
	db $77, $77, $55, $44, $44, $33, $55, $77, $55, $11, $22, $44, $33, $33, $44, $11
	db $00, $33, $22, $11, $22, $33, $22, $22, $22, $22, $22, $44, $44, $22, $33, $44
	db $44, $44, $44, $33, $33, $55, $55, $44, $55, $44, $44, $55, $77, $55, $33, $55
	db $55, $44, $55, $66, $33, $22, $44, $44, $33, $33, $33, $11, $11, $33, $22, $11
	db $22, $33, $22, $22, $33, $22, $22, $44, $33, $33, $33, $44, $44, $44, $33, $33
	db $33, $44, $44, $44, $44, $44, $44, $44, $55, $55, $55, $44, $44, $44, $55, $44
	db $55, $44, $33, $33, $44, $44, $33, $33, $33, $22, $33, $44, $33, $22, $22, $22
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $55, $55, $44, $44, $44
	db $55, $55, $55, $44, $44, $44, $44, $44, $44, $33, $33, $44, $44, $44, $44, $33
	db $33, $33, $44, $44, $33, $33, $33, $33, $33, $33, $33, $22, $22, $22, $33, $33
	db $22, $22, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $55, $55, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $22, $22, $22
	db $22, $22, $22, $22, $22, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $44, $33, $44, $44, $44, $44, $44, $44, $44, $44, $55, $55, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $22, $33, $33, $33, $22, $33, $22, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $22, $33, $33, $22, $33, $33, $22, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $44, $44, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $22, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $33, $33, $44, $44, $44, $44, $44, $33, $33, $44, $44
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $33
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $44, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $33, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $33, $44, $33, $33
	db $33, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $33, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33
	db $33, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $33, $33
	db $33, $33, $33, $44, $33, $44, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $44, $44, $33, $44
	db $33, $33, $33, $33, $33, $33, $44, $44, $33, $44, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $33, $44, $44, $44, $33, $33, $33, $33, $33, $44, $44, $44, $33, $33, $33, $33
	db $44, $44, $44, $44, $44, $33, $33, $44, $44, $44, $44, $33, $44, $33, $44, $44
	db $33, $33, $33, $33, $44, $44, $44, $33, $33, $33, $33, $44, $44, $44, $33, $33
	db $33, $44, $44, $44, $44, $33, $33, $33, $44, $44, $44, $44, $33, $33, $44, $44
	db $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $44, $33, $44
	db $33, $33, $44, $33, $44, $44, $44, $33, $33, $44, $33, $44, $44, $44, $33, $44
	db $44, $44, $44, $44, $44, $33, $33, $44, $33, $44, $44, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $44, $44, $44, $44, $44, $33, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33
	db $44, $44, $33, $33, $22, $22, $22, $33, $33, $33, $22, $22, $22, $22, $33, $33
	db $33, $22, $22, $33, $33, $33, $33, $33, $33, $33, $44, $44, $55, $44, $44, $44
	db $44, $55, $55, $66, $66, $66, $55, $44, $44, $55, $66, $66, $55, $44, $33, $33
	db $33, $44, $55, $44, $33, $11, $11, $22, $33, $44, $33, $22, $11, $11, $22, $33
	db $44, $44, $33, $22, $22, $33, $44, $44, $44, $33, $22, $33, $33, $44, $44, $33
	db $22, $22, $33, $33, $33, $33, $33, $22, $22, $33, $33, $44, $44, $44, $44, $44
	db $44, $55, $66, $66, $66, $66, $66, $66, $66, $55, $44, $55, $66, $77, $55, $44
	db $33, $22, $11, $33, $44, $55, $33, $00, $00, $11, $33, $33, $33, $33, $22, $22
	db $22, $33, $44, $44, $33, $33, $44, $55, $44, $44, $33, $33, $44, $44, $44, $44
	db $22, $11, $11, $22, $33, $22, $22, $22, $11, $11, $22, $33, $44, $44, $44, $55
	db $66, $66, $66, $77, $77, $77, $77, $66, $55, $44, $77, $77, $77, $66, $44, $22
	db $00, $00, $33, $44, $22, $00, $00, $00, $11, $11, $22, $33, $33, $22, $33, $44
	db $55, $44, $33, $44, $66, $66, $55, $44, $44, $33, $33, $33, $44, $33, $11, $00
	db $11, $11, $11, $11, $22, $22, $22, $33, $33, $44, $44, $55, $77, $77, $77, $77
	db $77, $77, $55, $55, $66, $77, $77, $55, $33, $33, $22, $00, $00, $11, $22, $00
	db $00, $11, $11, $11, $11, $22, $33, $44, $44, $55, $66, $55, $44, $44, $55, $66
	db $44, $33, $33, $22, $11, $00, $11, $11, $00, $00, $11, $11, $11, $11, $22, $44
	db $55, $55, $66, $66, $77, $77, $77, $77, $77, $77, $66, $44, $22, $55, $66, $55
	db $11, $11, $11, $00, $00, $00, $11, $11, $00, $22, $66, $66, $22, $22, $66, $77
	db $77, $77, $77, $77, $55, $33, $44, $44, $11, $00, $00, $11, $00, $00, $00, $00
	db $00, $00, $11, $44, $44, $33, $44, $66, $77, $77, $77, $77, $77, $77, $77, $77
	db $77, $66, $22, $00, $11, $33, $22, $00, $00, $00, $00, $00, $00, $11, $22, $33
	db $55, $77, $77, $77, $66, $77, $77, $77, $77, $77, $77, $66, $33, $11, $11, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $11, $33, $66, $77, $77, $77, $77, $77
	db $77, $77, $77, $77, $77, $77, $77, $77, $11, $00, $00, $00, $00, $00, $00, $00
	db $11, $00, $00, $11, $33, $33, $66, $77, $77, $77, $77, $77, $77, $77, $55, $66
	db $77, $66, $11, $00, $00, $00, $00, $00, $00, $00, $00, $00, $11, $33, $22, $44
	db $77, $77, $66, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, $33, $00, $00
	db $11, $00, $00, $00, $00, $22, $00, $00, $00, $33, $33, $44, $77, $77, $77, $77
	db $77, $77, $77, $33, $55, $77, $66, $11, $00, $11, $00, $00, $00, $00, $00, $00
	db $00, $22, $33, $22, $44, $77, $77, $44, $33, $77, $77, $77, $77, $77, $77, $77
	db $77, $55, $00, $00, $00, $11, $00, $00, $00, $44, $11, $00, $00, $22, $33, $22
	db $55, $77, $77, $77, $77, $77, $77, $33, $22, $66, $55, $00, $00, $22, $44, $00
	db $00, $00, $00, $00, $00, $22, $55, $66, $66, $66, $55, $44, $33, $55, $77, $77
	db $77, $77, $77, $77, $55, $00, $00, $00, $00, $00, $00, $33, $77, $33, $00, $00
	db $11, $11, $11, $33, $77, $77, $77, $77, $77, $77, $44, $33, $22, $00, $00, $00
	db $22, $22, $00, $00, $00, $00, $00, $00, $11, $66, $77, $77, $66, $55, $55, $33
	db $33, $33, $77, $77, $77, $77, $55, $22, $00, $11, $00, $00, $00, $55, $77, $33
	db $22, $55, $55, $22, $11, $33, $55, $77, $77, $77, $77, $55, $55, $55, $00, $00
	db $00, $00, $11, $00, $00, $11, $44, $33, $11, $22, $55, $77, $77, $77, $66, $55
	db $55, $55, $44, $55, $66, $77, $77, $11, $00, $11, $11, $00, $00, $22, $77, $33
	db $33, $77, $77, $44, $44, $66, $77, $44, $77, $77, $77, $33, $44, $55, $11, $00
	db $00, $00, $00, $00, $00, $00, $22, $55, $44, $44, $66, $77, $77, $77, $77, $77
	db $77, $66, $77, $77, $77, $77, $22, $00, $00, $00, $00, $00, $00, $44, $33, $11
	db $77, $77, $66, $33, $77, $77, $66, $77, $77, $77, $44, $44, $66, $11, $00, $00
	db $00, $00, $00, $00, $00, $00, $22, $44, $44, $55, $77, $77, $77, $77, $77, $77
	db $77, $77, $77, $77, $66, $11, $00, $00, $00, $00, $00, $22, $33, $11, $66, $77
	db $66, $33, $66, $77, $55, $55, $77, $77, $55, $44, $77, $33, $00, $00, $00, $00
	db $00, $00, $22, $33, $22, $44, $55, $55, $66, $77, $66, $66, $77, $77, $77, $77
	db $77, $77, $33, $11, $00, $00, $00, $00, $00, $22, $11, $55, $77, $77, $66, $77
	db $77, $66, $33, $77, $77, $55, $44, $55, $22, $00, $00, $00, $00, $00, $00, $00
	db $00, $44, $77, $77, $77, $77, $77, $55, $55, $77, $77, $77, $77, $77, $77, $00
	db $11, $11, $00, $00, $00, $11, $00, $00, $77, $77, $77, $77, $77, $77, $66, $77
	db $77, $77, $44, $77, $77, $00, $00, $00, $00, $00, $00, $00, $00, $00, $44, $77
	db $44, $66, $77, $77, $55, $77, $77, $77, $77, $77, $77, $22, $11, $33, $00, $00
	db $00, $11, $00, $00, $77, $77, $66, $77, $77, $66, $55, $77, $77, $33, $55, $77
	db $66, $00, $11, $11, $00, $00, $00, $00, $00, $00, $66, $55, $33, $66, $77, $55
	db $44, $77, $77, $77, $77, $77, $66, $11, $33, $00, $00, $00, $00, $00, $00, $66
	db $77, $77, $77, $77, $55, $55, $77, $77, $33, $66, $77, $66, $00, $11, $11, $00
	db $00, $00, $00, $00, $22, $55, $44, $33, $55, $55, $33, $55, $77, $77, $77, $77
	db $77, $66, $44, $00, $00, $00, $00, $00, $00, $44, $77, $55, $77, $77, $33, $44
	db $77, $77, $33, $55, $77, $55, $11, $22, $00, $00, $00, $00, $00, $00, $66, $66
	db $22, $33, $66, $22, $00, $33, $77, $77, $77, $77, $77, $66, $55, $00, $00, $00
	db $00, $00, $11, $77, $77, $66, $77, $66, $11, $55, $77, $44, $22, $77, $77, $44
	db $22, $22, $00, $00, $00, $00, $00, $33, $77, $66, $33, $44, $44, $22, $00, $55
	db $77, $77, $77, $77, $77, $66, $00, $00, $00, $11, $00, $22, $77, $77, $55, $77
	db $66, $11, $22, $55, $22, $22, $55, $55, $33, $44, $22, $00, $00, $00, $00, $00
	db $44, $77, $77, $55, $55, $55, $22, $00, $55, $77, $77, $66, $77, $77, $44, $00
	db $00, $00, $00, $00, $77, $77, $77, $77, $77, $55, $44, $66, $11, $00, $44, $55
	db $11, $22, $44, $00, $00, $00, $00, $00, $11, $66, $77, $66, $66, $66, $55, $33
	db $33, $77, $77, $77, $22, $77, $66, $00, $00, $22, $11, $00, $44, $77, $77, $77
	db $77, $55, $33, $77, $55, $00, $22, $55, $11, $00, $11, $11, $00, $00, $00, $00
	db $11, $55, $77, $77, $66, $66, $55, $55, $66, $77, $77, $77, $33, $55, $55, $00
	db $00, $00, $00, $00, $55, $77, $77, $77, $77, $66, $33, $77, $55, $00, $22, $66
	db $33, $22, $33, $22, $00, $00, $00, $00, $00, $33, $55, $66, $77, $66, $55, $55
	db $77, $77, $77, $55, $66, $77, $55, $00, $00, $11, $00, $00, $55, $66, $77, $77
	db $77, $33, $55, $77, $44, $00, $44, $55, $22, $22, $22, $00, $00, $00, $00, $00
	db $22, $44, $66, $66, $55, $44, $55, $55, $77, $77, $77, $33, $77, $77, $00, $00
	db $00, $00, $00, $11, $77, $77, $77, $77, $55, $22, $66, $55, $00, $11, $44, $55
	db $44, $22, $22, $00, $11, $00, $00, $00, $33, $44, $66, $77, $55, $33, $55, $77
	db $77, $77, $11, $77, $66, $22, $00, $00, $11, $11, $11, $77, $77, $77, $77, $55
	db $22, $66, $55, $22, $11, $22, $44, $33, $11, $11, $00, $00, $00, $00, $00, $33
	db $33, $55, $77, $77, $55, $66, $77, $77, $77, $00, $55, $66, $00, $00, $00, $00
	db $11, $55, $77, $66, $77, $77, $22, $00, $44, $33, $22, $22, $33, $66, $55, $22
	db $22, $11, $00, $00, $00, $00, $33, $44, $44, $55, $66, $66, $66, $77, $77, $77
	db $00, $44, $55, $00, $00, $00, $00, $00, $77, $77, $77, $77, $77, $11, $22, $33
	db $11, $11, $22, $33, $55, $55, $11, $11, $11, $00, $00, $00, $11, $33, $66, $44
	db $44, $66, $77, $77, $77, $77, $00, $33, $44, $00, $00, $00, $00, $00, $55, $77
	db $77, $77, $77, $33, $00, $22, $00, $00, $11, $22, $77, $66, $44, $33, $11, $00
	db $00, $00, $11, $33, $44, $66, $44, $44, $66, $77, $77, $77, $55, $22, $33, $33
	db $00, $00, $00, $00, $22, $77, $77, $77, $77, $77, $00, $00, $00, $00, $00, $11
	db $66, $66, $66, $55, $22, $11, $11, $00, $00, $33, $44, $77, $44, $44, $55, $77
	db $77, $77, $55, $22, $22, $33, $00, $00, $11, $00, $22, $77, $77, $77, $77, $77
	db $22, $00, $00, $00, $00, $00, $55, $55, $44, $55, $44, $22, $11, $11, $11, $33
	db $44, $77, $66, $55, $66, $77, $77, $77, $33, $22, $11, $00, $00, $00, $00, $11
	db $55, $77, $77, $77, $77, $77, $33, $11, $00, $00, $00, $00, $33, $33, $33, $44
	db $33, $33, $22, $22, $22, $44, $44, $77, $77, $66, $77, $77, $77, $77, $00, $22
	db $00, $00, $00, $00, $00, $44, $77, $77, $77, $77, $77, $77, $33, $00, $00, $00
	db $00, $00, $33, $22, $33, $44, $11, $44, $22, $22, $33, $55, $77, $77, $77, $77
	db $77, $77, $77, $00, $33, $11, $00, $00, $00, $00, $22, $77, $77, $77, $77, $77
	db $77, $55, $11, $00, $00, $00, $00, $22, $00, $22, $44, $00, $11, $33, $44, $22
	db $55, $66, $77, $77, $77, $77, $77, $77, $00, $22, $00, $00, $00, $00, $00, $00
	db $66, $77, $77, $77, $77, $77, $44, $22, $00, $00, $00, $00, $11, $11, $11, $44
	db $11, $11, $22, $33, $11, $55, $44, $77, $77, $77, $77, $77, $77, $00, $22, $00
	db $00, $00, $00, $00, $00, $77, $77, $77, $77, $77, $77, $55, $22, $00, $00, $00
	db $00, $22, $11, $22, $55, $22, $11, $22, $33, $22, $44, $66, $77, $77, $77, $77
	db $77, $77, $00, $22, $00, $00, $00, $00, $00, $00, $77, $77, $77, $77, $77, $77
	db $44, $00, $00, $00, $00, $11, $11, $22, $44, $66, $11, $11, $22, $33, $44, $55
	db $77, $77, $77, $77, $77, $44, $33, $00, $00, $00, $00, $00, $00, $22, $77, $77
	db $77, $77, $77, $66, $33, $00, $00, $00, $00, $22, $00, $22, $44, $44, $33, $22
	db $33, $33, $44, $44, $66, $77, $77, $77, $77, $77, $00, $33, $22, $00, $00, $00
	db $00, $11, $77, $77, $77, $77, $77, $77, $44, $11, $11, $00, $00, $11, $00, $00
	db $33, $55, $33, $44, $55, $44, $55, $55, $55, $66, $77, $77, $77, $77, $00, $44
	db $22, $00, $00, $00, $00, $00, $77, $77, $77, $77, $77, $77, $55, $11, $22, $00
	db $00, $00, $00, $00, $11, $33, $22, $44, $44, $55, $66, $66, $66, $77, $77, $77
	db $77, $77, $00, $22, $11, $00, $00, $00, $00, $00, $44, $77, $77, $77, $77, $77
	db $66, $22, $22, $00, $00, $00, $11, $00, $00, $22, $22, $22, $44, $55, $55, $77
	db $66, $77, $77, $77, $77, $77, $00, $33, $22, $00, $00, $00, $00, $00, $66, $77
	db $77, $77, $77, $77, $66, $22, $22, $00, $00, $00, $22, $00, $00, $22, $11, $22
	db $44, $66, $66, $77, $77, $77, $77, $77, $77, $77, $00, $11, $11, $00, $00, $00
	db $00, $00, $77, $77, $77, $77, $77, $77, $66, $11, $11, $00, $00, $00, $11, $00
	db $00, $22, $11, $33, $33, $55, $55, $77, $77, $77, $77, $77, $77, $77, $00, $22
	db $11, $00, $00, $00, $00, $00, $77, $77, $77, $77, $77, $77, $66, $00, $11, $00
	db $00, $11, $11, $00, $11, $22, $11, $33, $33, $66, $77, $77, $77, $77, $77, $77
	db $77, $44, $00, $11, $00, $00, $00, $00, $00, $22, $77, $77, $77, $77, $77, $66
	db $55, $00, $00, $00, $00, $22, $00, $00, $22, $33, $22, $44, $44, $55, $77, $77
	db $77, $77, $77, $77, $77, $00, $22, $11, $00, $00, $00, $00, $00, $77, $77, $77
	db $77, $77, $77, $66, $11, $00, $00, $00, $00, $00, $00, $00, $33, $33, $44, $44
	db $66, $55, $77, $77, $77, $77, $77, $77, $66, $00, $11, $00, $00, $00, $00, $00
	db $00, $77, $77, $77, $77, $77, $77, $55, $00, $00, $00, $00, $00, $00, $11, $22
	db $33, $55, $55, $55, $55, $77, $77, $77, $77, $77, $77, $77, $00, $33, $11, $00
	db $00, $00, $00, $00, $77, $77, $77, $77, $77, $77, $66, $11, $00, $00, $00, $00
	db $00, $00, $11, $44, $44, $66, $55, $66, $77, $77, $77, $77, $77, $77, $77, $55
	db $00, $22, $00, $00, $00, $00, $00, $00, $77, $77, $77, $77, $77, $77, $66, $00
	db $00, $00, $00, $00, $00, $00, $33, $33, $66, $66, $66, $77, $77, $66, $77, $77
	db $77, $77, $77, $00, $44, $33, $00, $00, $00, $00, $00, $77, $77, $77, $77, $77
	db $77, $77, $22, $00, $00, $00, $00, $00, $00, $11, $33, $55, $77, $66, $77, $77
	db $77, $77, $77, $77, $77, $77, $11, $44, $33, $00, $00, $00, $00, $00, $33, $77
	db $77, $77, $77, $77, $77, $55, $11, $00, $00, $00, $00, $00, $00, $33, $44, $77
	db $77, $77, $77, $77, $66, $77, $77, $77, $77, $55, $11, $44, $11, $00, $00, $00
	db $00, $00, $77, $77, $77, $77, $77, $77, $77, $22, $00, $00, $00, $00, $00, $00
	db $11, $33, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, $00, $44, $33
	db $00, $00, $00, $00, $00, $77, $77, $77, $77, $77, $77, $77, $44, $00, $00, $00
	db $00, $00, $00, $00, $33, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77
	db $00, $44, $55, $00, $00, $00, $00, $00, $66, $77, $77, $77, $77, $77, $77, $66
	db $22, $00, $00, $00, $00, $00, $00, $22, $55, $77, $77, $77, $77, $77, $77, $77
	db $77, $77, $77, $11, $33, $55, $00, $00, $00, $00, $00, $22, $77, $77, $77, $77
	db $77, $77, $77, $33, $00, $00, $00, $00, $00, $00, $00, $44, $77, $77, $77, $77
	db $77, $77, $77, $77, $77, $77, $33, $22, $44, $00, $00, $00, $00, $00, $00, $77
	db $77, $77, $77, $77, $77, $77, $55, $00, $00, $00, $00, $00, $00, $00, $22, $77
	db $77, $77, $77, $77, $77, $77, $77, $77, $77, $66, $00, $44, $22, $00, $00, $00
	db $00, $00, $77, $77, $77, $77, $77, $77, $77, $66, $00, $00, $00, $00, $00, $00
	db $00, $11, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, $00, $44, $44
	db $00, $00, $00, $00, $00, $77, $77, $77, $77, $77, $77, $77, $77, $11, $00, $00
	db $00, $00, $00, $00, $00, $66, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77
	db $00, $44, $55, $00, $00, $00, $00, $00, $44, $77, $77, $77, $77, $77, $77, $77
	db $44, $00, $00, $00, $00, $00, $00, $00, $55, $77, $77, $77, $77, $77, $77, $77
	db $77, $77, $77, $00, $44, $55, $00, $00, $00, $00, $00, $11, $66, $77, $77, $77
	db $77, $77, $77, $77, $00, $00, $00, $00, $00, $00, $00, $33, $77, $77, $77, $77
	db $77, $77, $77, $77, $77, $77, $33, $22, $55, $00, $00, $00, $00, $00, $00, $66
	db $77, $77, $77, $77, $77, $77, $77, $00, $00, $00, $00, $00, $00, $00, $22, $66
	db $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, $00, $44, $11, $00, $00, $00
	db $00, $00, $66, $77, $77, $77, $77, $77, $77, $77, $22, $00, $00, $00, $00, $00
	db $00, $00, $66, $66, $77, $77, $77, $77, $77, $77, $77, $77, $77, $00, $44, $33
	db $00, $00, $00, $00, $00, $44, $66, $77, $77, $77, $77, $77, $77, $55, $00, $00
	db $00, $00, $00, $00, $00, $55, $66, $77, $77, $77, $77, $77, $77, $77, $77, $77
	db $11, $33, $44, $00, $00, $00, $00, $00, $00, $55, $77, $77, $77, $77, $77, $77
	db $77, $00, $00, $00, $00, $00, $00, $00, $33, $66, $77, $77, $77, $77, $77, $77
	db $77, $77, $77, $66, $00, $33, $00, $00, $00, $00, $00, $00, $33, $77, $77, $77
	db $77, $77, $77, $77, $33, $00, $00, $00, $00, $00, $00, $00, $55, $66, $77, $77
	db $77, $77, $77, $77, $77, $77, $77, $00, $33, $33, $00, $00, $00, $00, $00, $00
	db $33, $77, $77, $77, $77, $77, $77, $77, $00, $00, $00, $00, $00, $00, $00, $44
	db $66, $77, $77, $77, $77, $77, $77, $77, $77, $77, $33, $22, $33, $00, $00, $00
	db $00, $00, $00, $22, $77, $77, $77, $77, $77, $77, $77, $33, $00, $00, $00, $00
	db $00, $00, $11, $55, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, $00, $44
	db $33, $00, $00, $00, $00, $00, $00, $44, $77, $77, $77, $77, $77, $77, $77, $00
	db $00, $00, $00, $00, $00, $00, $33, $55, $77, $77, $77, $77, $77, $77, $77, $77
	db $77, $44, $33, $33, $00, $00, $00, $00, $00, $00, $11, $77, $77, $77, $77, $77
	db $77, $77, $44, $00, $00, $00, $00, $00, $00, $00, $55, $66, $77, $77, $77, $77
	db $77, $77, $77, $77, $77, $11, $33, $22, $00, $00, $00, $00, $00, $00, $33, $77
	db $77, $77, $77, $77, $77, $77, $11, $00, $00, $00, $00, $00, $00, $22, $55, $55
	db $77, $77, $77, $77, $77, $77, $77, $77, $44, $33, $33, $00, $00, $00, $00, $00
	db $00, $00, $66, $77, $77, $77, $77, $77, $77, $66, $00, $00, $00, $00, $00, $00
	db $00, $44, $44, $66, $77, $77, $77, $77, $77, $77, $77, $77, $22, $33, $33, $00
	db $00, $00, $00, $00, $00, $11, $77, $77, $77, $77, $77, $77, $77, $33, $00, $00
	db $00, $00, $00, $00, $11, $33, $44, $77, $77, $77, $77, $77, $77, $77, $77, $44
	db $44, $44, $00, $00, $00, $00, $00, $00, $00, $44, $77, $77, $77, $77, $77, $77
	db $77, $00, $00, $00, $00, $00, $00, $00, $22, $22, $55, $77, $77, $77, $77, $77
	db $77, $77, $44, $44, $44, $00, $00, $00, $00, $00, $00, $00, $22, $77, $77, $77
	db $77, $77, $77, $77, $22, $00, $00, $00, $00, $00, $00, $00, $00, $33, $77, $77
	db $77, $77, $77, $77, $77, $66, $55, $33, $00, $00, $00, $00, $00, $00, $00, $22
	db $66, $77, $77, $77, $77, $77, $77, $44, $22, $00, $00, $00, $00, $00, $00, $00
	db $33, $77, $77, $77, $77, $77, $77, $77, $77, $55, $22, $00, $00, $00, $00, $00
	db $00, $00, $22, $66, $77, $77, $77, $77, $77, $77, $55, $44, $00, $00, $00, $00
	db $00, $00, $00, $33, $77, $77, $77, $77, $77, $77, $77, $55, $00, $00, $00, $00
	db $00, $00, $00, $11, $33, $44, $66, $77, $77, $77, $77, $77, $77, $55, $33, $11
	db $00, $00, $00, $00, $00, $00, $22, $66, $77, $77, $77, $77, $77, $77, $77, $22
	db $00, $00, $00, $00, $00, $00, $00, $44, $55, $77, $77, $77, $77, $77, $77, $66
	db $66, $33, $11, $00, $00, $00, $00, $00, $00, $11, $44, $77, $77, $77, $77, $77
	db $77, $77, $77, $00, $00, $00, $00, $00, $00, $00, $22, $66, $77, $77, $77, $77
	db $77, $77, $55, $55, $44, $11, $00, $00, $00, $00, $00, $00, $11, $44, $77, $77
	db $77, $77, $77, $77, $77, $77, $11, $00, $00, $00, $00, $00, $00, $11, $44, $66
	db $77, $77, $77, $77, $77, $66, $66, $44, $22, $00, $00, $00, $00, $00, $00, $00
	db $22, $55, $77, $77, $77, $77, $77, $77, $77, $66, $00, $00, $00, $00, $00, $00
	db $00, $11, $55, $66, $77, $77, $77, $77, $77, $66, $55, $44, $22, $00, $00, $00
	db $00, $00, $00, $00, $22, $55, $77, $77, $77, $77, $77, $77, $77, $55, $22, $00
	db $00, $00, $00, $00, $00, $22, $55, $66, $77, $77, $77, $77, $77, $55, $44, $44
	db $22, $11, $00, $00, $00, $00, $00, $00, $22, $44, $66, $77, $77, $77, $77, $77
	db $77, $55, $22, $00, $00, $00, $00, $00, $00, $22, $55, $66, $66, $77, $77, $77
	db $66, $44, $44, $33, $22, $11, $11, $11, $00, $00, $11, $11, $33, $44, $55, $77
	db $77, $77, $77, $77, $77, $55, $33, $00, $00, $00, $00, $00, $11, $22, $55, $66
	db $66, $66, $66, $55, $55, $44, $33, $33, $33, $22, $22, $22, $22, $11, $11, $11
	db $22, $33, $44, $66, $77, $77, $77, $77, $66, $55, $44, $11, $00, $00, $00, $00
	db $11, $22, $44, $55, $55, $55, $55, $44, $44, $33, $33, $33, $44, $44, $44, $33
	db $33, $33, $22, $11, $11, $11, $22, $22, $44, $44, $66, $77, $77, $77, $55, $66
	db $66, $33, $00, $22, $11, $11, $11, $33, $33, $44, $33, $33, $33, $22, $33, $44
	db $33, $44, $66, $66, $55, $44, $55, $33, $22, $11, $11, $11, $11, $22, $33, $44
	db $55, $77, $77, $66, $77, $77, $55, $33, $33, $33, $22, $11, $22, $22, $22, $22
	db $22, $22, $22, $22, $33, $44, $44, $66, $77, $66, $55, $66, $44, $33, $11, $00
	db $00, $00, $00, $11, $22, $44, $66, $77, $77, $77, $77, $77, $66, $22, $22, $22
	db $00, $00, $11, $11, $22, $22, $33, $33, $44, $33, $55, $44, $55, $66, $77, $66
	db $66, $55, $44, $22, $00, $00, $00, $00, $00, $00, $22, $55, $77, $77, $77, $77
	db $77, $77, $66, $22, $00, $00, $00, $00, $00, $22, $33, $44, $44, $44, $44, $33
	db $33, $33, $44, $44, $66, $66, $66, $55, $55, $44, $11, $00, $00, $00, $00, $00
	db $11, $44, $55, $66, $77, $77, $77, $77, $55, $55, $44, $33, $11, $22, $33, $44
	db $44, $44, $44, $44, $44, $22, $11, $22, $22, $22, $33, $33, $55, $66, $55, $55
	db $55, $44, $33, $11, $11, $22, $11, $11, $22, $22, $33, $44, $55, $44, $55, $66
	db $44, $55, $66, $55, $44, $55, $55, $66, $44, $44, $44, $33, $22, $11, $11, $11
	db $11, $11, $22, $33, $44, $55, $55, $55, $55, $55, $44, $22, $22, $22, $11, $11
	db $11, $11, $22, $22, $33, $44, $55, $77, $66, $66, $66, $77, $55, $44, $55, $55
	db $44, $33, $33, $33, $33, $22, $11, $22, $00, $11, $22, $33, $33, $55, $55, $55
	db $55, $55, $55, $44, $22, $22, $11, $11, $00, $00, $11, $22, $33, $44, $44, $66
	db $77, $77, $66, $77, $66, $66, $44, $55, $55, $44, $33, $33, $33, $33, $22, $22
	db $11, $11, $11, $11, $22, $22, $33, $55, $55, $55, $55, $66, $55, $44, $33, $33
	db $22, $11, $00, $00, $11, $11, $22, $33, $44, $55, $66, $77, $66, $77, $77, $77
	db $55, $55, $55, $55, $33, $33, $22, $22, $11, $11, $00, $00, $00, $11, $11, $22
	db $33, $55, $66, $66, $66, $77, $66, $55, $33, $33, $22, $00, $00, $00, $00, $00
	db $11, $22, $44, $66, $77, $77, $77, $77, $77, $77, $66, $44, $44, $44, $44, $22
	db $22, $22, $22, $11, $11, $11, $11, $11, $11, $22, $22, $33, $55, $55, $55, $55
	db $66, $55, $44, $33, $33, $22, $11, $11, $11, $11, $22, $22, $33, $33, $44, $55
	db $55, $66, $55, $66, $66, $66, $55, $55, $66, $55, $44, $44, $44, $33, $22, $22
	db $11, $11, $11, $11, $11, $11, $22, $33, $44, $44, $55, $66, $66, $55, $55, $55
	db $44, $22, $22, $11, $11, $00, $11, $11, $11, $22, $44, $44, $55, $77, $77, $66
	db $66, $77, $66, $55, $55, $55, $55, $44, $44, $33, $33, $33, $22, $11, $11, $00
	db $00, $00, $00, $11, $22, $33, $44, $55, $66, $66, $66, $66, $55, $44, $33, $22
	db $11, $11, $11, $11, $11, $11, $22, $33, $33, $44, $55, $66, $66, $77, $77, $77
	db $77, $77, $77, $66, $55, $55, $33, $22, $11, $00, $00, $00, $00, $00, $00, $11
	db $22, $33, $55, $66, $77, $77, $77, $77, $66, $55, $44, $22, $11, $11, $00, $00
	db $00, $11, $11, $22, $22, $44, $44, $55, $66, $77, $77, $77, $77, $77, $66, $66
	db $66, $55, $33, $33, $22, $22, $00, $00, $00, $00, $11, $00, $22, $22, $22, $44
	db $44, $55, $55, $66, $66, $66, $55, $55, $55, $33, $22, $22, $11, $11, $00, $00
	db $11, $11, $11, $22, $33, $33, $44, $55, $77, $77, $77, $77, $77, $77, $66, $55
	db $55, $44, $22, $22, $11, $11, $11, $11, $11, $11, $22, $22, $22, $22, $33, $44
	db $44, $44, $55, $55, $55, $55, $44, $44, $33, $33, $33, $22, $11, $11, $11, $11
	db $11, $22, $22, $33, $33, $44, $44, $55, $55, $66, $77, $77, $77, $77, $66, $55
	db $44, $55, $44, $22, $22, $22, $22, $22, $11, $22, $22, $33, $33, $33, $33, $33
	db $44, $44, $44, $33, $44, $33, $44, $33, $33, $33, $33, $33, $33, $22, $33, $22
	db $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $55, $55, $55, $55
	db $55, $44, $55, $55, $55, $44, $44, $44, $44, $33, $44, $33, $33, $33, $22, $22
	db $22, $22, $22, $22, $22, $22, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $33, $33, $33, $22, $22, $33, $22, $22, $22, $22, $33, $33, $33, $44
	db $55, $55, $55, $66, $66, $66, $55, $55, $55, $55, $44, $44, $33, $44, $33, $33
	db $22, $22, $22, $22, $22, $22, $22, $22, $22, $33, $33, $33, $33, $44, $44, $44
	db $44, $44, $55, $44, $44, $44, $44, $33, $33, $22, $22, $22, $22, $22, $22, $22
	db $33, $33, $33, $33, $44, $44, $55, $55, $55, $66, $66, $55, $55, $55, $55, $55
	db $44, $44, $44, $44, $33, $44, $33, $33, $33, $33, $33, $22, $22, $22, $22, $22
	db $22, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33
	db $33, $22, $22, $22, $22, $22, $33, $33, $33, $33, $33, $33, $44, $44, $44, $55
	db $55, $55, $66, $66, $66, $55, $55, $55, $44, $44, $44, $33, $44, $33, $44, $33
	db $33, $33, $33, $33, $22, $22, $22, $22, $33, $22, $33, $33, $33, $44, $44, $44
	db $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $55, $55, $55, $55, $55, $55
	db $44, $55, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $44, $33
	db $33, $22, $22, $22, $22, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $44, $44, $33, $44, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $44, $44, $44, $44, $44, $55, $44, $55, $55, $55, $44, $44
	db $55, $44, $55, $55, $55, $55, $55, $55, $55, $44, $44, $33, $33, $33, $33, $33
	db $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $33, $33
	db $44, $44, $44, $55, $55, $55, $55, $44, $44, $44, $33, $33, $33, $33, $33, $33
	db $33, $22, $33, $33, $33, $33, $33, $33, $44, $44, $55, $55, $55, $66, $66, $66
	db $66, $66, $55, $55, $55, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $22
	db $22, $22, $22, $11, $11, $11, $11, $22, $22, $22, $33, $33, $33, $44, $44, $44
	db $44, $44, $55, $55, $55, $55, $44, $44, $44, $44, $44, $33, $33, $33, $22, $22
	db $22, $22, $22, $22, $33, $33, $33, $33, $44, $44, $44, $55, $55, $55, $55, $55
	db $66, $55, $55, $55, $55, $55, $44, $55, $44, $44, $44, $33, $33, $33, $33, $33
	db $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $33, $33, $33, $33
	db $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $44, $44, $55, $55, $55, $66, $66, $55, $55, $55, $55, $55, $55, $55, $44, $44
	db $44, $44, $44, $44, $33, $33, $33, $22, $22, $22, $22, $22, $22, $22, $22, $22
	db $22, $22, $22, $22, $22, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $55
	db $55, $55, $55, $55, $44, $44, $44, $33, $33, $33, $33, $33, $33, $22, $33, $33
	db $22, $33, $33, $33, $33, $33, $33, $33, $44, $44, $55, $55, $55, $55, $55, $55
	db $55, $55, $55, $55, $55, $55, $44, $44, $44, $44, $44, $44, $44, $33, $33, $22
	db $22, $22, $11, $11, $11, $11, $11, $22, $22, $22, $22, $22, $33, $33, $33, $33
	db $33, $33, $44, $44, $44, $55, $55, $55, $55, $55, $55, $55, $44, $44, $44, $33
	db $33, $33, $33, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $33, $33, $33
	db $33, $44, $44, $44, $55, $55, $55, $55, $55, $55, $55, $55, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $22, $22, $22, $22, $22, $22
	db $22, $22, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $33, $33, $33, $33, $33, $22, $22, $22, $22, $33, $33, $33, $33, $33
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $55, $44, $55, $55, $55
	db $55, $44, $55, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $22
	db $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $33, $33, $33, $33, $33, $44
	db $44, $44, $44, $44, $44, $44, $44, $55, $55, $55, $55, $55, $44, $44, $44, $44
	db $33, $33, $33, $33, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22
	db $33, $33, $33, $44, $44, $44, $55, $55, $55, $66, $55, $66, $66, $66, $55, $55
	db $55, $55, $55, $55, $55, $55, $44, $44, $44, $33, $33, $33, $22, $22, $22, $22
	db $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $33, $33, $33
	db $44, $44, $44, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $44, $44, $44
	db $44, $44, $33, $33, $33, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22
	db $22, $22, $33, $33, $33, $33, $44, $44, $44, $55, $55, $55, $66, $66, $66, $66
	db $66, $66, $66, $66, $55, $55, $55, $55, $44, $44, $44, $44, $33, $33, $33, $22
	db $22, $22, $22, $22, $11, $11, $22, $11, $22, $22, $22, $22, $22, $22, $22, $22
	db $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $55, $55, $55, $55, $55, $55
	db $55, $55, $55, $44, $44, $44, $44, $44, $33, $33, $33, $22, $22, $22, $22, $22
	db $22, $22, $22, $22, $22, $22, $22, $22, $22, $33, $33, $33, $33, $44, $44, $44
	db $44, $55, $55, $55, $55, $66, $66, $66, $66, $55, $55, $55, $55, $55, $55, $55
	db $44, $44, $44, $44, $33, $33, $33, $33, $22, $22, $22, $22, $22, $22, $22, $22
	db $22, $22, $22, $22, $22, $22, $22, $22, $33, $33, $33, $33, $33, $44, $44, $44
	db $44, $44, $55, $55, $55, $55, $55, $55, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $33, $33, $33, $33, $33, $33, $22, $22, $22, $22, $22, $22, $22, $22, $22
	db $22, $22, $22, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $55, $55
	db $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $44, $44, $44
	db $44, $33, $33, $33, $33, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22
	db $22, $22, $22, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $55, $55, $55, $55, $55, $55, $55, $55, $55, $44, $44
	db $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $22, $22, $22, $22, $22
	db $22, $22, $22, $22, $22, $22, $22, $33, $33, $33, $33, $33, $33, $33, $33, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $33, $33, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33

SECTION "ROM Bank $004", ROMX[$4000], BANK[$4]

	db                                         $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $33, $33, $33, $33, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44, $44
	db $44, $44, $44, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33
	db $33, $33, $33, $33, $44, $33, $22, $11
