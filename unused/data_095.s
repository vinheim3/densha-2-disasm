SECTION "ROM Bank $095", ROMX[$4000], BANK[$95]

	nop                                              ; $4000: $00
	nop                                              ; $4001: $00
	nop                                              ; $4002: $00
	nop                                              ; $4003: $00
	nop                                              ; $4004: $00
	nop                                              ; $4005: $00
	nop                                              ; $4006: $00
	nop                                              ; $4007: $00
	nop                                              ; $4008: $00
	nop                                              ; $4009: $00
	nop                                              ; $400a: $00
	nop                                              ; $400b: $00
	nop                                              ; $400c: $00
	nop                                              ; $400d: $00
	nop                                              ; $400e: $00
	nop                                              ; $400f: $00
	nop                                              ; $4010: $00
	nop                                              ; $4011: $00
	nop                                              ; $4012: $00
	nop                                              ; $4013: $00
	nop                                              ; $4014: $00
	nop                                              ; $4015: $00
	nop                                              ; $4016: $00
	nop                                              ; $4017: $00
	nop                                              ; $4018: $00
	nop                                              ; $4019: $00
	nop                                              ; $401a: $00
	nop                                              ; $401b: $00
	nop                                              ; $401c: $00
	nop                                              ; $401d: $00
	nop                                              ; $401e: $00
	nop                                              ; $401f: $00
	nop                                              ; $4020: $00
	nop                                              ; $4021: $00
	nop                                              ; $4022: $00
	nop                                              ; $4023: $00
	inc  bc                                          ; $4024: $03
	inc  bc                                          ; $4025: $03
	dec  b                                           ; $4026: $05
	rlca                                             ; $4027: $07
	add  hl, bc                                      ; $4028: $09
	rrca                                             ; $4029: $0f
	dec  d                                           ; $402a: $15
	dec  de                                          ; $402b: $1b
	dec  l                                           ; $402c: $2d
	inc  sp                                          ; $402d: $33
	ld   e, l                                        ; $402e: $5d
	ld   h, e                                        ; $402f: $63
	nop                                              ; $4030: $00
	nop                                              ; $4031: $00
	nop                                              ; $4032: $00
	nop                                              ; $4033: $00
	nop                                              ; $4034: $00
	nop                                              ; $4035: $00
	nop                                              ; $4036: $00
	nop                                              ; $4037: $00
	nop                                              ; $4038: $00
	nop                                              ; $4039: $00
	nop                                              ; $403a: $00
	nop                                              ; $403b: $00
	nop                                              ; $403c: $00
	nop                                              ; $403d: $00
	nop                                              ; $403e: $00
	nop                                              ; $403f: $00
	nop                                              ; $4040: $00
	nop                                              ; $4041: $00
	nop                                              ; $4042: $00
	nop                                              ; $4043: $00
	nop                                              ; $4044: $00
	nop                                              ; $4045: $00
	nop                                              ; $4046: $00
	nop                                              ; $4047: $00
	nop                                              ; $4048: $00
	nop                                              ; $4049: $00
	nop                                              ; $404a: $00
	nop                                              ; $404b: $00
	nop                                              ; $404c: $00
	nop                                              ; $404d: $00
	nop                                              ; $404e: $00
	nop                                              ; $404f: $00
	nop                                              ; $4050: $00
	nop                                              ; $4051: $00
	ld   bc, $0201                                   ; $4052: $01 $01 $02
	inc  bc                                          ; $4055: $03
	dec  b                                           ; $4056: $05
	ld   b, $0b                                      ; $4057: $06 $0b
	inc  c                                           ; $4059: $0c
	rla                                              ; $405a: $17
	jr   jr_095_407d                                 ; $405b: $18 $20

	ccf                                              ; $405d: $3f
	ccf                                              ; $405e: $3f
	ccf                                              ; $405f: $3f
	nop                                              ; $4060: $00
	nop                                              ; $4061: $00
	ld   bc, $0201                                   ; $4062: $01 $01 $02
	inc  bc                                          ; $4065: $03
	dec  b                                           ; $4066: $05
	ld   b, $0b                                      ; $4067: $06 $0b
	inc  c                                           ; $4069: $0c
	rla                                              ; $406a: $17
	jr   jr_095_409c                                 ; $406b: $18 $2f

	jr   nc, jr_095_40ce                             ; $406d: $30 $5f

	ld   h, b                                        ; $406f: $60
	cp   a                                           ; $4070: $bf
	ret  nz                                          ; $4071: $c0

	ld   a, a                                        ; $4072: $7f
	add  b                                           ; $4073: $80
	rst  $38                                         ; $4074: $ff
	nop                                              ; $4075: $00
	rst  $38                                         ; $4076: $ff
	nop                                              ; $4077: $00
	rst  $38                                         ; $4078: $ff
	nop                                              ; $4079: $00
	rst  $38                                         ; $407a: $ff
	nop                                              ; $407b: $00
	nop                                              ; $407c: $00

jr_095_407d:
	rst  $38                                         ; $407d: $ff
	rst  $38                                         ; $407e: $ff
	rst  $38                                         ; $407f: $ff
	cp   l                                           ; $4080: $bd
	jp   $837d                                       ; $4081: $c3 $7d $83


	db   $fd                                         ; $4084: $fd
	inc  bc                                          ; $4085: $03
	db   $fd                                         ; $4086: $fd
	inc  bc                                          ; $4087: $03
	db   $fd                                         ; $4088: $fd
	inc  bc                                          ; $4089: $03
	db   $fd                                         ; $408a: $fd
	inc  bc                                          ; $408b: $03
	db   $fd                                         ; $408c: $fd
	inc  bc                                          ; $408d: $03
	db   $fd                                         ; $408e: $fd
	inc  bc                                          ; $408f: $03
	db   $fd                                         ; $4090: $fd
	inc  bc                                          ; $4091: $03
	db   $fd                                         ; $4092: $fd
	inc  bc                                          ; $4093: $03
	db   $fd                                         ; $4094: $fd
	inc  bc                                          ; $4095: $03
	db   $fd                                         ; $4096: $fd
	inc  bc                                          ; $4097: $03
	db   $fd                                         ; $4098: $fd
	inc  bc                                          ; $4099: $03
	db   $fd                                         ; $409a: $fd
	inc  bc                                          ; $409b: $03

jr_095_409c:
	ld   bc, $ffff                                   ; $409c: $01 $ff $ff
	rst  $38                                         ; $409f: $ff
	nop                                              ; $40a0: $00
	nop                                              ; $40a1: $00
	nop                                              ; $40a2: $00
	nop                                              ; $40a3: $00
	nop                                              ; $40a4: $00
	nop                                              ; $40a5: $00
	nop                                              ; $40a6: $00
	nop                                              ; $40a7: $00
	nop                                              ; $40a8: $00
	nop                                              ; $40a9: $00
	nop                                              ; $40aa: $00
	nop                                              ; $40ab: $00
	nop                                              ; $40ac: $00
	nop                                              ; $40ad: $00
	nop                                              ; $40ae: $00
	nop                                              ; $40af: $00
	nop                                              ; $40b0: $00
	nop                                              ; $40b1: $00
	nop                                              ; $40b2: $00
	nop                                              ; $40b3: $00
	nop                                              ; $40b4: $00
	nop                                              ; $40b5: $00
	nop                                              ; $40b6: $00
	nop                                              ; $40b7: $00
	nop                                              ; $40b8: $00
	nop                                              ; $40b9: $00
	nop                                              ; $40ba: $00
	nop                                              ; $40bb: $00
	nop                                              ; $40bc: $00
	nop                                              ; $40bd: $00
	nop                                              ; $40be: $00
	nop                                              ; $40bf: $00
	ld   [bc], a                                     ; $40c0: $02
	ld   [bc], a                                     ; $40c1: $02
	dec  b                                           ; $40c2: $05
	dec  b                                           ; $40c3: $05
	ld   [$0508], sp                                 ; $40c4: $08 $08 $05
	dec  b                                           ; $40c7: $05
	rra                                              ; $40c8: $1f
	stop                                             ; $40c9: $10 $00
	rra                                              ; $40cb: $1f
	nop                                              ; $40cc: $00
	ld   [bc], a                                     ; $40cd: $02

jr_095_40ce:
	nop                                              ; $40ce: $00
	ld   [bc], a                                     ; $40cf: $02
	nop                                              ; $40d0: $00
	rra                                              ; $40d1: $1f
	rra                                              ; $40d2: $1f
	nop                                              ; $40d3: $00
	rra                                              ; $40d4: $1f
	nop                                              ; $40d5: $00
	rra                                              ; $40d6: $1f
	rra                                              ; $40d7: $1f
	nop                                              ; $40d8: $00
	nop                                              ; $40d9: $00
	nop                                              ; $40da: $00
	nop                                              ; $40db: $00
	nop                                              ; $40dc: $00
	nop                                              ; $40dd: $00
	nop                                              ; $40de: $00
	nop                                              ; $40df: $00
	nop                                              ; $40e0: $00
	nop                                              ; $40e1: $00
	nop                                              ; $40e2: $00
	nop                                              ; $40e3: $00
	add  c                                           ; $40e4: $81
	add  c                                           ; $40e5: $81
	nop                                              ; $40e6: $00
	nop                                              ; $40e7: $00
	rst  $38                                         ; $40e8: $ff
	nop                                              ; $40e9: $00
	nop                                              ; $40ea: $00
	rst  $38                                         ; $40eb: $ff
	nop                                              ; $40ec: $00
	ld   c, c                                        ; $40ed: $49
	nop                                              ; $40ee: $00
	ld   c, c                                        ; $40ef: $49
	nop                                              ; $40f0: $00
	rst  $38                                         ; $40f1: $ff
	rst  $38                                         ; $40f2: $ff
	nop                                              ; $40f3: $00
	rst  $38                                         ; $40f4: $ff
	nop                                              ; $40f5: $00
	rst  $38                                         ; $40f6: $ff
	rst  $38                                         ; $40f7: $ff
	nop                                              ; $40f8: $00
	nop                                              ; $40f9: $00
	nop                                              ; $40fa: $00
	nop                                              ; $40fb: $00
	nop                                              ; $40fc: $00
	nop                                              ; $40fd: $00
	nop                                              ; $40fe: $00
	nop                                              ; $40ff: $00
	ld   b, b                                        ; $4100: $40
	ld   b, b                                        ; $4101: $40
	and  b                                           ; $4102: $a0
	and  b                                           ; $4103: $a0
	db   $10                                         ; $4104: $10
	db   $10                                         ; $4105: $10
	and  b                                           ; $4106: $a0
	and  b                                           ; $4107: $a0
	ld   hl, sp+$08                                  ; $4108: $f8 $08
	nop                                              ; $410a: $00
	ld   hl, sp+$00                                  ; $410b: $f8 $00
	jr   nz, jr_095_410f                             ; $410d: $20 $00

jr_095_410f:
	jr   nz, jr_095_4111                             ; $410f: $20 $00

jr_095_4111:
	ld   hl, sp-$08                                  ; $4111: $f8 $f8
	nop                                              ; $4113: $00
	ld   hl, sp+$00                                  ; $4114: $f8 $00
	ld   hl, sp-$08                                  ; $4116: $f8 $f8
	nop                                              ; $4118: $00
	nop                                              ; $4119: $00
	nop                                              ; $411a: $00
	nop                                              ; $411b: $00
	nop                                              ; $411c: $00
	nop                                              ; $411d: $00
	nop                                              ; $411e: $00
	nop                                              ; $411f: $00
	nop                                              ; $4120: $00
	nop                                              ; $4121: $00
	nop                                              ; $4122: $00
	nop                                              ; $4123: $00
	nop                                              ; $4124: $00
	nop                                              ; $4125: $00
	dec  b                                           ; $4126: $05
	dec  b                                           ; $4127: $05
	inc  e                                           ; $4128: $1c
	stop                                             ; $4129: $10 $00
	stop                                             ; $412b: $10 $00
	nop                                              ; $412d: $00
	dec  c                                           ; $412e: $0d
	dec  c                                           ; $412f: $0d
	nop                                              ; $4130: $00
	db   $10                                         ; $4131: $10
	stop                                             ; $4132: $10 $00
	rra                                              ; $4134: $1f
	nop                                              ; $4135: $00
	rra                                              ; $4136: $1f
	rra                                              ; $4137: $1f
	nop                                              ; $4138: $00
	nop                                              ; $4139: $00
	nop                                              ; $413a: $00
	nop                                              ; $413b: $00
	nop                                              ; $413c: $00
	nop                                              ; $413d: $00
	nop                                              ; $413e: $00
	nop                                              ; $413f: $00
	nop                                              ; $4140: $00
	nop                                              ; $4141: $00
	nop                                              ; $4142: $00
	nop                                              ; $4143: $00
	nop                                              ; $4144: $00
	nop                                              ; $4145: $00
	nop                                              ; $4146: $00
	nop                                              ; $4147: $00
	nop                                              ; $4148: $00
	nop                                              ; $4149: $00
	nop                                              ; $414a: $00
	nop                                              ; $414b: $00
	nop                                              ; $414c: $00
	nop                                              ; $414d: $00
	or   [hl]                                        ; $414e: $b6
	or   [hl]                                        ; $414f: $b6
	nop                                              ; $4150: $00
	nop                                              ; $4151: $00
	nop                                              ; $4152: $00
	nop                                              ; $4153: $00
	rst  $38                                         ; $4154: $ff
	nop                                              ; $4155: $00
	rst  $38                                         ; $4156: $ff
	rst  $38                                         ; $4157: $ff
	nop                                              ; $4158: $00
	nop                                              ; $4159: $00
	nop                                              ; $415a: $00
	nop                                              ; $415b: $00
	nop                                              ; $415c: $00
	nop                                              ; $415d: $00
	nop                                              ; $415e: $00
	nop                                              ; $415f: $00
	nop                                              ; $4160: $00
	nop                                              ; $4161: $00
	jr   nz, jr_095_4184                             ; $4162: $20 $20

	nop                                              ; $4164: $00
	nop                                              ; $4165: $00
	and  b                                           ; $4166: $a0
	and  b                                           ; $4167: $a0
	jr   c, @+$0a                                    ; $4168: $38 $08

	nop                                              ; $416a: $00
	ld   [$0000], sp                                 ; $416b: $08 $00 $00
	ret  nc                                          ; $416e: $d0

	ret  nc                                          ; $416f: $d0

	nop                                              ; $4170: $00
	ld   [$0008], sp                                 ; $4171: $08 $08 $00
	ld   hl, sp+$00                                  ; $4174: $f8 $00
	ld   hl, sp-$08                                  ; $4176: $f8 $f8
	nop                                              ; $4178: $00
	nop                                              ; $4179: $00
	nop                                              ; $417a: $00
	nop                                              ; $417b: $00
	nop                                              ; $417c: $00
	nop                                              ; $417d: $00
	nop                                              ; $417e: $00
	nop                                              ; $417f: $00
	ld   [bc], a                                     ; $4180: $02
	ld   [bc], a                                     ; $4181: $02
	dec  b                                           ; $4182: $05
	dec  b                                           ; $4183: $05

jr_095_4184:
	ld   [$0508], sp                                 ; $4184: $08 $08 $05
	dec  b                                           ; $4187: $05
	rra                                              ; $4188: $1f
	db   $10                                         ; $4189: $10
	ld   [bc], a                                     ; $418a: $02
	nop                                              ; $418b: $00
	ld   [bc], a                                     ; $418c: $02
	ld   [bc], a                                     ; $418d: $02
	ld   [bc], a                                     ; $418e: $02
	ld   [bc], a                                     ; $418f: $02
	rra                                              ; $4190: $1f
	nop                                              ; $4191: $00
	nop                                              ; $4192: $00
	rra                                              ; $4193: $1f
	rra                                              ; $4194: $1f
	nop                                              ; $4195: $00
	rra                                              ; $4196: $1f
	rra                                              ; $4197: $1f
	nop                                              ; $4198: $00
	nop                                              ; $4199: $00
	nop                                              ; $419a: $00
	nop                                              ; $419b: $00
	nop                                              ; $419c: $00
	nop                                              ; $419d: $00
	nop                                              ; $419e: $00
	nop                                              ; $419f: $00
	nop                                              ; $41a0: $00
	nop                                              ; $41a1: $00
	nop                                              ; $41a2: $00
	nop                                              ; $41a3: $00
	add  c                                           ; $41a4: $81
	add  c                                           ; $41a5: $81
	nop                                              ; $41a6: $00
	nop                                              ; $41a7: $00
	rst  $38                                         ; $41a8: $ff
	nop                                              ; $41a9: $00
	ld   c, c                                        ; $41aa: $49
	nop                                              ; $41ab: $00
	ld   c, c                                        ; $41ac: $49
	ld   c, c                                        ; $41ad: $49
	ld   c, c                                        ; $41ae: $49
	ld   c, c                                        ; $41af: $49
	rst  $38                                         ; $41b0: $ff
	nop                                              ; $41b1: $00
	nop                                              ; $41b2: $00
	rst  $38                                         ; $41b3: $ff
	rst  $38                                         ; $41b4: $ff
	nop                                              ; $41b5: $00
	rst  $38                                         ; $41b6: $ff
	rst  $38                                         ; $41b7: $ff
	nop                                              ; $41b8: $00
	nop                                              ; $41b9: $00
	nop                                              ; $41ba: $00
	nop                                              ; $41bb: $00
	nop                                              ; $41bc: $00
	nop                                              ; $41bd: $00
	nop                                              ; $41be: $00
	nop                                              ; $41bf: $00
	ld   b, b                                        ; $41c0: $40
	ld   b, b                                        ; $41c1: $40
	and  b                                           ; $41c2: $a0
	and  b                                           ; $41c3: $a0
	db   $10                                         ; $41c4: $10
	db   $10                                         ; $41c5: $10
	and  b                                           ; $41c6: $a0
	and  b                                           ; $41c7: $a0
	ld   hl, sp+$08                                  ; $41c8: $f8 $08
	jr   nz, jr_095_41cc                             ; $41ca: $20 $00

jr_095_41cc:
	jr   nz, jr_095_41ee                             ; $41cc: $20 $20

	jr   nz, jr_095_41f0                             ; $41ce: $20 $20

	ld   hl, sp+$00                                  ; $41d0: $f8 $00
	nop                                              ; $41d2: $00
	ld   hl, sp-$08                                  ; $41d3: $f8 $f8
	nop                                              ; $41d5: $00
	ld   hl, sp-$08                                  ; $41d6: $f8 $f8
	nop                                              ; $41d8: $00
	nop                                              ; $41d9: $00
	nop                                              ; $41da: $00
	nop                                              ; $41db: $00
	nop                                              ; $41dc: $00
	nop                                              ; $41dd: $00
	nop                                              ; $41de: $00
	nop                                              ; $41df: $00
	nop                                              ; $41e0: $00
	nop                                              ; $41e1: $00
	nop                                              ; $41e2: $00
	nop                                              ; $41e3: $00
	nop                                              ; $41e4: $00
	nop                                              ; $41e5: $00
	nop                                              ; $41e6: $00
	nop                                              ; $41e7: $00
	nop                                              ; $41e8: $00
	nop                                              ; $41e9: $00
	nop                                              ; $41ea: $00
	nop                                              ; $41eb: $00
	nop                                              ; $41ec: $00
	nop                                              ; $41ed: $00

jr_095_41ee:
	nop                                              ; $41ee: $00
	nop                                              ; $41ef: $00

jr_095_41f0:
	nop                                              ; $41f0: $00
	nop                                              ; $41f1: $00
	nop                                              ; $41f2: $00
	nop                                              ; $41f3: $00
	nop                                              ; $41f4: $00
	nop                                              ; $41f5: $00
	nop                                              ; $41f6: $00
	nop                                              ; $41f7: $00
	nop                                              ; $41f8: $00
	nop                                              ; $41f9: $00
	nop                                              ; $41fa: $00
	nop                                              ; $41fb: $00
	nop                                              ; $41fc: $00
	nop                                              ; $41fd: $00
	nop                                              ; $41fe: $00
	nop                                              ; $41ff: $00
	ld   [bc], a                                     ; $4200: $02
	ld   [bc], a                                     ; $4201: $02
	dec  b                                           ; $4202: $05
	dec  b                                           ; $4203: $05
	ld   [$0508], sp                                 ; $4204: $08 $08 $05
	dec  b                                           ; $4207: $05
	rra                                              ; $4208: $1f
	db   $10                                         ; $4209: $10
	ld   [bc], a                                     ; $420a: $02
	nop                                              ; $420b: $00
	ld   [bc], a                                     ; $420c: $02
	nop                                              ; $420d: $00
	ld   [bc], a                                     ; $420e: $02
	nop                                              ; $420f: $00
	nop                                              ; $4210: $00
	rra                                              ; $4211: $1f
	nop                                              ; $4212: $00
	rra                                              ; $4213: $1f
	rra                                              ; $4214: $1f
	nop                                              ; $4215: $00
	rra                                              ; $4216: $1f
	rra                                              ; $4217: $1f
	nop                                              ; $4218: $00
	nop                                              ; $4219: $00
	nop                                              ; $421a: $00
	nop                                              ; $421b: $00
	nop                                              ; $421c: $00
	nop                                              ; $421d: $00
	nop                                              ; $421e: $00
	nop                                              ; $421f: $00
	nop                                              ; $4220: $00
	nop                                              ; $4221: $00
	nop                                              ; $4222: $00
	nop                                              ; $4223: $00
	add  c                                           ; $4224: $81
	add  c                                           ; $4225: $81
	nop                                              ; $4226: $00
	nop                                              ; $4227: $00
	rst  $38                                         ; $4228: $ff
	nop                                              ; $4229: $00
	ld   c, c                                        ; $422a: $49
	nop                                              ; $422b: $00
	ld   c, c                                        ; $422c: $49
	nop                                              ; $422d: $00
	ld   c, c                                        ; $422e: $49
	nop                                              ; $422f: $00
	nop                                              ; $4230: $00
	rst  $38                                         ; $4231: $ff
	nop                                              ; $4232: $00
	rst  $38                                         ; $4233: $ff
	rst  $38                                         ; $4234: $ff
	nop                                              ; $4235: $00
	rst  $38                                         ; $4236: $ff
	rst  $38                                         ; $4237: $ff
	nop                                              ; $4238: $00
	nop                                              ; $4239: $00
	nop                                              ; $423a: $00
	nop                                              ; $423b: $00
	nop                                              ; $423c: $00
	nop                                              ; $423d: $00
	nop                                              ; $423e: $00
	nop                                              ; $423f: $00
	ld   b, b                                        ; $4240: $40
	ld   b, b                                        ; $4241: $40
	and  b                                           ; $4242: $a0
	and  b                                           ; $4243: $a0
	db   $10                                         ; $4244: $10
	db   $10                                         ; $4245: $10
	and  b                                           ; $4246: $a0
	and  b                                           ; $4247: $a0
	ldh  a, [rAUD1SWEEP]                             ; $4248: $f0 $10
	jr   nz, jr_095_424c                             ; $424a: $20 $00

jr_095_424c:
	jr   nz, jr_095_424e                             ; $424c: $20 $00

jr_095_424e:
	jr   nz, jr_095_4250                             ; $424e: $20 $00

jr_095_4250:
	nop                                              ; $4250: $00
	ld   hl, sp+$04                                  ; $4251: $f8 $04
	db   $fc                                         ; $4253: $fc
	db   $fc                                         ; $4254: $fc
	inc  b                                           ; $4255: $04
	db   $fc                                         ; $4256: $fc
	db   $fc                                         ; $4257: $fc
	nop                                              ; $4258: $00
	nop                                              ; $4259: $00
	nop                                              ; $425a: $00
	nop                                              ; $425b: $00
	nop                                              ; $425c: $00
	nop                                              ; $425d: $00
	nop                                              ; $425e: $00
	nop                                              ; $425f: $00
	nop                                              ; $4260: $00
	nop                                              ; $4261: $00
	nop                                              ; $4262: $00
	nop                                              ; $4263: $00
	nop                                              ; $4264: $00
	nop                                              ; $4265: $00
	dec  b                                           ; $4266: $05
	dec  b                                           ; $4267: $05
	inc  e                                           ; $4268: $1c
	stop                                             ; $4269: $10 $00
	stop                                             ; $426b: $10 $00
	db   $10                                         ; $426d: $10
	dec  c                                           ; $426e: $0d
	dec  e                                           ; $426f: $1d
	nop                                              ; $4270: $00
	stop                                             ; $4271: $10 $00
	db   $10                                         ; $4273: $10
	rrca                                             ; $4274: $0f
	db   $10                                         ; $4275: $10
	rra                                              ; $4276: $1f
	rra                                              ; $4277: $1f
	nop                                              ; $4278: $00
	nop                                              ; $4279: $00
	nop                                              ; $427a: $00
	nop                                              ; $427b: $00
	nop                                              ; $427c: $00
	nop                                              ; $427d: $00
	nop                                              ; $427e: $00
	nop                                              ; $427f: $00
	nop                                              ; $4280: $00
	nop                                              ; $4281: $00
	nop                                              ; $4282: $00
	nop                                              ; $4283: $00
	nop                                              ; $4284: $00
	nop                                              ; $4285: $00
	nop                                              ; $4286: $00
	nop                                              ; $4287: $00
	nop                                              ; $4288: $00
	nop                                              ; $4289: $00
	nop                                              ; $428a: $00
	nop                                              ; $428b: $00
	nop                                              ; $428c: $00
	nop                                              ; $428d: $00
	or   [hl]                                        ; $428e: $b6
	or   [hl]                                        ; $428f: $b6
	nop                                              ; $4290: $00
	nop                                              ; $4291: $00
	nop                                              ; $4292: $00
	nop                                              ; $4293: $00
	rst  $38                                         ; $4294: $ff
	nop                                              ; $4295: $00
	rst  $38                                         ; $4296: $ff
	rst  $38                                         ; $4297: $ff
	nop                                              ; $4298: $00
	nop                                              ; $4299: $00
	nop                                              ; $429a: $00
	nop                                              ; $429b: $00
	nop                                              ; $429c: $00
	nop                                              ; $429d: $00
	nop                                              ; $429e: $00
	nop                                              ; $429f: $00
	nop                                              ; $42a0: $00
	nop                                              ; $42a1: $00
	jr   nz, jr_095_42c4                             ; $42a2: $20 $20

	nop                                              ; $42a4: $00
	nop                                              ; $42a5: $00
	and  b                                           ; $42a6: $a0
	and  b                                           ; $42a7: $a0
	nop                                              ; $42a8: $00
	nop                                              ; $42a9: $00
	ld   [$0808], sp                                 ; $42aa: $08 $08 $08
	ld   [$c4c4], sp                                 ; $42ad: $08 $c4 $c4
	inc  b                                           ; $42b0: $04
	inc  b                                           ; $42b1: $04
	nop                                              ; $42b2: $00
	nop                                              ; $42b3: $00
	ld   hl, sp+$00                                  ; $42b4: $f8 $00
	db   $fc                                         ; $42b6: $fc
	db   $fc                                         ; $42b7: $fc
	nop                                              ; $42b8: $00
	nop                                              ; $42b9: $00
	nop                                              ; $42ba: $00
	nop                                              ; $42bb: $00
	nop                                              ; $42bc: $00
	nop                                              ; $42bd: $00
	nop                                              ; $42be: $00
	nop                                              ; $42bf: $00
	nop                                              ; $42c0: $00
	nop                                              ; $42c1: $00
	nop                                              ; $42c2: $00
	nop                                              ; $42c3: $00

jr_095_42c4:
	nop                                              ; $42c4: $00
	nop                                              ; $42c5: $00
	nop                                              ; $42c6: $00
	jr   jr_095_42e1                                 ; $42c7: $18 $18

	inc  h                                           ; $42c9: $24
	jr   jr_095_42f0                                 ; $42ca: $18 $24

	nop                                              ; $42cc: $00
	jr   jr_095_42cf                                 ; $42cd: $18 $00

jr_095_42cf:
	nop                                              ; $42cf: $00
	nop                                              ; $42d0: $00
	nop                                              ; $42d1: $00
	nop                                              ; $42d2: $00
	nop                                              ; $42d3: $00
	nop                                              ; $42d4: $00
	nop                                              ; $42d5: $00
	nop                                              ; $42d6: $00
	nop                                              ; $42d7: $00
	nop                                              ; $42d8: $00
	nop                                              ; $42d9: $00
	nop                                              ; $42da: $00
	nop                                              ; $42db: $00
	nop                                              ; $42dc: $00
	nop                                              ; $42dd: $00
	nop                                              ; $42de: $00
	nop                                              ; $42df: $00
	nop                                              ; $42e0: $00

jr_095_42e1:
	nop                                              ; $42e1: $00
	nop                                              ; $42e2: $00
	nop                                              ; $42e3: $00
	nop                                              ; $42e4: $00
	nop                                              ; $42e5: $00
	nop                                              ; $42e6: $00
	nop                                              ; $42e7: $00
	jr   jr_095_4302                                 ; $42e8: $18 $18

	jr   jr_095_4304                                 ; $42ea: $18 $18

	nop                                              ; $42ec: $00
	nop                                              ; $42ed: $00
	nop                                              ; $42ee: $00
	nop                                              ; $42ef: $00

jr_095_42f0:
	nop                                              ; $42f0: $00
	nop                                              ; $42f1: $00
	nop                                              ; $42f2: $00
	nop                                              ; $42f3: $00
	nop                                              ; $42f4: $00
	nop                                              ; $42f5: $00
	nop                                              ; $42f6: $00
	nop                                              ; $42f7: $00
	nop                                              ; $42f8: $00
	nop                                              ; $42f9: $00
	nop                                              ; $42fa: $00
	nop                                              ; $42fb: $00
	nop                                              ; $42fc: $00
	nop                                              ; $42fd: $00
	nop                                              ; $42fe: $00
	nop                                              ; $42ff: $00
	nop                                              ; $4300: $00
	nop                                              ; $4301: $00

jr_095_4302:
	nop                                              ; $4302: $00
	nop                                              ; $4303: $00

jr_095_4304:
	nop                                              ; $4304: $00
	nop                                              ; $4305: $00
	jr   jr_095_4320                                 ; $4306: $18 $18

	inc  h                                           ; $4308: $24
	inc  h                                           ; $4309: $24
	inc  h                                           ; $430a: $24
	inc  h                                           ; $430b: $24
	jr   jr_095_4326                                 ; $430c: $18 $18

	nop                                              ; $430e: $00
	nop                                              ; $430f: $00
	nop                                              ; $4310: $00
	nop                                              ; $4311: $00
	nop                                              ; $4312: $00
	nop                                              ; $4313: $00
	nop                                              ; $4314: $00
	nop                                              ; $4315: $00
	nop                                              ; $4316: $00
	nop                                              ; $4317: $00
	nop                                              ; $4318: $00
	nop                                              ; $4319: $00
	nop                                              ; $431a: $00
	nop                                              ; $431b: $00
	nop                                              ; $431c: $00
	nop                                              ; $431d: $00
	nop                                              ; $431e: $00
	nop                                              ; $431f: $00

jr_095_4320:
	nop                                              ; $4320: $00
	nop                                              ; $4321: $00
	nop                                              ; $4322: $00
	nop                                              ; $4323: $00
	nop                                              ; $4324: $00
	nop                                              ; $4325: $00

jr_095_4326:
	nop                                              ; $4326: $00
	nop                                              ; $4327: $00
	nop                                              ; $4328: $00
	nop                                              ; $4329: $00
	nop                                              ; $432a: $00
	nop                                              ; $432b: $00
	nop                                              ; $432c: $00
	nop                                              ; $432d: $00
	nop                                              ; $432e: $00
	nop                                              ; $432f: $00
	nop                                              ; $4330: $00
	nop                                              ; $4331: $00
	nop                                              ; $4332: $00
	nop                                              ; $4333: $00
	nop                                              ; $4334: $00
	nop                                              ; $4335: $00
	nop                                              ; $4336: $00
	nop                                              ; $4337: $00
	nop                                              ; $4338: $00
	nop                                              ; $4339: $00
	nop                                              ; $433a: $00
	nop                                              ; $433b: $00
	nop                                              ; $433c: $00
	nop                                              ; $433d: $00
	nop                                              ; $433e: $00
	nop                                              ; $433f: $00
	nop                                              ; $4340: $00
	nop                                              ; $4341: $00
	nop                                              ; $4342: $00
	nop                                              ; $4343: $00
	nop                                              ; $4344: $00
	nop                                              ; $4345: $00
	nop                                              ; $4346: $00
	nop                                              ; $4347: $00
	nop                                              ; $4348: $00
	nop                                              ; $4349: $00
	nop                                              ; $434a: $00
	nop                                              ; $434b: $00
	nop                                              ; $434c: $00
	nop                                              ; $434d: $00
	nop                                              ; $434e: $00
	nop                                              ; $434f: $00
	nop                                              ; $4350: $00
	nop                                              ; $4351: $00
	nop                                              ; $4352: $00
	nop                                              ; $4353: $00
	nop                                              ; $4354: $00
	nop                                              ; $4355: $00
	nop                                              ; $4356: $00
	nop                                              ; $4357: $00
	nop                                              ; $4358: $00
	nop                                              ; $4359: $00
	nop                                              ; $435a: $00
	nop                                              ; $435b: $00
	nop                                              ; $435c: $00
	nop                                              ; $435d: $00
	nop                                              ; $435e: $00
	nop                                              ; $435f: $00
	nop                                              ; $4360: $00
	nop                                              ; $4361: $00
	nop                                              ; $4362: $00
	nop                                              ; $4363: $00
	nop                                              ; $4364: $00
	nop                                              ; $4365: $00
	nop                                              ; $4366: $00
	nop                                              ; $4367: $00
	nop                                              ; $4368: $00
	nop                                              ; $4369: $00
	nop                                              ; $436a: $00
	nop                                              ; $436b: $00
	nop                                              ; $436c: $00
	nop                                              ; $436d: $00
	nop                                              ; $436e: $00
	nop                                              ; $436f: $00
	nop                                              ; $4370: $00
	nop                                              ; $4371: $00
	nop                                              ; $4372: $00
	nop                                              ; $4373: $00
	nop                                              ; $4374: $00
	nop                                              ; $4375: $00
	nop                                              ; $4376: $00
	nop                                              ; $4377: $00
	nop                                              ; $4378: $00
	nop                                              ; $4379: $00
	nop                                              ; $437a: $00
	nop                                              ; $437b: $00
	nop                                              ; $437c: $00
	nop                                              ; $437d: $00
	nop                                              ; $437e: $00
	nop                                              ; $437f: $00
	nop                                              ; $4380: $00
	nop                                              ; $4381: $00
	nop                                              ; $4382: $00
	nop                                              ; $4383: $00
	nop                                              ; $4384: $00
	nop                                              ; $4385: $00
	dec  b                                           ; $4386: $05
	dec  b                                           ; $4387: $05
	inc  e                                           ; $4388: $1c
	db   $10                                         ; $4389: $10
	dec  c                                           ; $438a: $0d
	dec  c                                           ; $438b: $0d
	nop                                              ; $438c: $00
	nop                                              ; $438d: $00
	dec  c                                           ; $438e: $0d
	dec  c                                           ; $438f: $0d
	stop                                             ; $4390: $10 $00
	nop                                              ; $4392: $00
	db   $10                                         ; $4393: $10
	rra                                              ; $4394: $1f
	nop                                              ; $4395: $00
	rra                                              ; $4396: $1f
	rra                                              ; $4397: $1f
	nop                                              ; $4398: $00
	nop                                              ; $4399: $00
	nop                                              ; $439a: $00
	nop                                              ; $439b: $00
	nop                                              ; $439c: $00
	nop                                              ; $439d: $00
	nop                                              ; $439e: $00
	nop                                              ; $439f: $00
	nop                                              ; $43a0: $00
	nop                                              ; $43a1: $00
	nop                                              ; $43a2: $00
	nop                                              ; $43a3: $00
	nop                                              ; $43a4: $00
	nop                                              ; $43a5: $00
	nop                                              ; $43a6: $00
	nop                                              ; $43a7: $00
	nop                                              ; $43a8: $00
	nop                                              ; $43a9: $00
	or   [hl]                                        ; $43aa: $b6
	or   [hl]                                        ; $43ab: $b6
	nop                                              ; $43ac: $00
	nop                                              ; $43ad: $00
	or   [hl]                                        ; $43ae: $b6
	or   [hl]                                        ; $43af: $b6
	nop                                              ; $43b0: $00
	nop                                              ; $43b1: $00
	nop                                              ; $43b2: $00
	nop                                              ; $43b3: $00
	rst  $38                                         ; $43b4: $ff
	nop                                              ; $43b5: $00
	rst  $38                                         ; $43b6: $ff
	rst  $38                                         ; $43b7: $ff
	nop                                              ; $43b8: $00
	nop                                              ; $43b9: $00
	nop                                              ; $43ba: $00
	nop                                              ; $43bb: $00
	nop                                              ; $43bc: $00
	nop                                              ; $43bd: $00
	nop                                              ; $43be: $00
	nop                                              ; $43bf: $00
	nop                                              ; $43c0: $00
	nop                                              ; $43c1: $00
	jr   nz, jr_095_43e4                             ; $43c2: $20 $20

	nop                                              ; $43c4: $00
	nop                                              ; $43c5: $00
	and  b                                           ; $43c6: $a0
	and  b                                           ; $43c7: $a0
	jr   c, @+$0a                                    ; $43c8: $38 $08

	ret  nc                                          ; $43ca: $d0

	ret  nc                                          ; $43cb: $d0

	nop                                              ; $43cc: $00
	nop                                              ; $43cd: $00
	ret  nc                                          ; $43ce: $d0

	ret  nc                                          ; $43cf: $d0

	ld   [$0000], sp                                 ; $43d0: $08 $00 $00
	ld   [$00f8], sp                                 ; $43d3: $08 $f8 $00
	ld   hl, sp-$08                                  ; $43d6: $f8 $f8
	nop                                              ; $43d8: $00
	nop                                              ; $43d9: $00
	nop                                              ; $43da: $00
	nop                                              ; $43db: $00
	nop                                              ; $43dc: $00
	nop                                              ; $43dd: $00
	nop                                              ; $43de: $00
	nop                                              ; $43df: $00
	nop                                              ; $43e0: $00
	nop                                              ; $43e1: $00
	nop                                              ; $43e2: $00
	nop                                              ; $43e3: $00

jr_095_43e4:
	nop                                              ; $43e4: $00
	nop                                              ; $43e5: $00
	nop                                              ; $43e6: $00
	nop                                              ; $43e7: $00
	nop                                              ; $43e8: $00
	nop                                              ; $43e9: $00
	nop                                              ; $43ea: $00
	nop                                              ; $43eb: $00
	nop                                              ; $43ec: $00
	nop                                              ; $43ed: $00
	nop                                              ; $43ee: $00
	nop                                              ; $43ef: $00
	nop                                              ; $43f0: $00
	nop                                              ; $43f1: $00
	nop                                              ; $43f2: $00
	nop                                              ; $43f3: $00
	nop                                              ; $43f4: $00
	nop                                              ; $43f5: $00
	nop                                              ; $43f6: $00
	nop                                              ; $43f7: $00
	nop                                              ; $43f8: $00
	nop                                              ; $43f9: $00
	nop                                              ; $43fa: $00
	nop                                              ; $43fb: $00
	nop                                              ; $43fc: $00
	nop                                              ; $43fd: $00
	nop                                              ; $43fe: $00
	nop                                              ; $43ff: $00
	nop                                              ; $4400: $00
	nop                                              ; $4401: $00
	nop                                              ; $4402: $00
	nop                                              ; $4403: $00
	nop                                              ; $4404: $00
	nop                                              ; $4405: $00
	nop                                              ; $4406: $00
	nop                                              ; $4407: $00
	nop                                              ; $4408: $00
	nop                                              ; $4409: $00
	nop                                              ; $440a: $00
	nop                                              ; $440b: $00
	nop                                              ; $440c: $00
	nop                                              ; $440d: $00
	nop                                              ; $440e: $00
	nop                                              ; $440f: $00
	nop                                              ; $4410: $00
	nop                                              ; $4411: $00
	nop                                              ; $4412: $00
	nop                                              ; $4413: $00
	nop                                              ; $4414: $00
	nop                                              ; $4415: $00
	nop                                              ; $4416: $00
	nop                                              ; $4417: $00
	nop                                              ; $4418: $00
	nop                                              ; $4419: $00
	inc  de                                          ; $441a: $13
	rra                                              ; $441b: $1f
	nop                                              ; $441c: $00
	nop                                              ; $441d: $00
	nop                                              ; $441e: $00
	nop                                              ; $441f: $00
	nop                                              ; $4420: $00
	nop                                              ; $4421: $00
	nop                                              ; $4422: $00
	nop                                              ; $4423: $00
	nop                                              ; $4424: $00
	nop                                              ; $4425: $00
	nop                                              ; $4426: $00
	nop                                              ; $4427: $00
	nop                                              ; $4428: $00
	nop                                              ; $4429: $00
	nop                                              ; $442a: $00
	nop                                              ; $442b: $00
	nop                                              ; $442c: $00
	nop                                              ; $442d: $00
	nop                                              ; $442e: $00
	nop                                              ; $442f: $00
	nop                                              ; $4430: $00
	nop                                              ; $4431: $00
	nop                                              ; $4432: $00
	nop                                              ; $4433: $00
	nop                                              ; $4434: $00
	nop                                              ; $4435: $00
	nop                                              ; $4436: $00
	nop                                              ; $4437: $00
	nop                                              ; $4438: $00
	nop                                              ; $4439: $00
	jr   @+$01                                       ; $443a: $18 $ff

	nop                                              ; $443c: $00
	nop                                              ; $443d: $00
	nop                                              ; $443e: $00
	nop                                              ; $443f: $00
	nop                                              ; $4440: $00
	nop                                              ; $4441: $00
	nop                                              ; $4442: $00
	nop                                              ; $4443: $00
	nop                                              ; $4444: $00
	nop                                              ; $4445: $00
	nop                                              ; $4446: $00
	nop                                              ; $4447: $00
	nop                                              ; $4448: $00
	nop                                              ; $4449: $00
	nop                                              ; $444a: $00
	nop                                              ; $444b: $00
	nop                                              ; $444c: $00
	nop                                              ; $444d: $00
	nop                                              ; $444e: $00
	nop                                              ; $444f: $00
	nop                                              ; $4450: $00
	nop                                              ; $4451: $00
	nop                                              ; $4452: $00
	nop                                              ; $4453: $00
	nop                                              ; $4454: $00
	nop                                              ; $4455: $00
	nop                                              ; $4456: $00
	nop                                              ; $4457: $00
	nop                                              ; $4458: $00
	nop                                              ; $4459: $00
	ret  z                                           ; $445a: $c8

	ld   hl, sp+$00                                  ; $445b: $f8 $00
	nop                                              ; $445d: $00
	nop                                              ; $445e: $00
	nop                                              ; $445f: $00
	nop                                              ; $4460: $00
	nop                                              ; $4461: $00
	nop                                              ; $4462: $00
	nop                                              ; $4463: $00
	nop                                              ; $4464: $00
	nop                                              ; $4465: $00
	nop                                              ; $4466: $00
	nop                                              ; $4467: $00
	nop                                              ; $4468: $00
	nop                                              ; $4469: $00
	nop                                              ; $446a: $00
	nop                                              ; $446b: $00
	nop                                              ; $446c: $00
	nop                                              ; $446d: $00
	nop                                              ; $446e: $00
	nop                                              ; $446f: $00
	nop                                              ; $4470: $00
	nop                                              ; $4471: $00
	nop                                              ; $4472: $00
	nop                                              ; $4473: $00
	nop                                              ; $4474: $00
	nop                                              ; $4475: $00
	nop                                              ; $4476: $00
	nop                                              ; $4477: $00
	nop                                              ; $4478: $00
	nop                                              ; $4479: $00
	nop                                              ; $447a: $00
	nop                                              ; $447b: $00
	nop                                              ; $447c: $00
	nop                                              ; $447d: $00
	nop                                              ; $447e: $00
	nop                                              ; $447f: $00
	nop                                              ; $4480: $00
	nop                                              ; $4481: $00
	nop                                              ; $4482: $00
	nop                                              ; $4483: $00
	nop                                              ; $4484: $00
	nop                                              ; $4485: $00
	nop                                              ; $4486: $00
	nop                                              ; $4487: $00
	nop                                              ; $4488: $00
	nop                                              ; $4489: $00
	nop                                              ; $448a: $00
	nop                                              ; $448b: $00
	nop                                              ; $448c: $00
	nop                                              ; $448d: $00
	nop                                              ; $448e: $00
	nop                                              ; $448f: $00
	nop                                              ; $4490: $00
	nop                                              ; $4491: $00
	nop                                              ; $4492: $00
	nop                                              ; $4493: $00
	nop                                              ; $4494: $00
	nop                                              ; $4495: $00
	nop                                              ; $4496: $00
	nop                                              ; $4497: $00
	nop                                              ; $4498: $00
	nop                                              ; $4499: $00
	nop                                              ; $449a: $00
	nop                                              ; $449b: $00
	nop                                              ; $449c: $00
	nop                                              ; $449d: $00
	nop                                              ; $449e: $00
	nop                                              ; $449f: $00
	nop                                              ; $44a0: $00
	nop                                              ; $44a1: $00
	nop                                              ; $44a2: $00
	nop                                              ; $44a3: $00
	nop                                              ; $44a4: $00
	nop                                              ; $44a5: $00
	nop                                              ; $44a6: $00
	nop                                              ; $44a7: $00
	nop                                              ; $44a8: $00
	nop                                              ; $44a9: $00
	nop                                              ; $44aa: $00
	nop                                              ; $44ab: $00
	nop                                              ; $44ac: $00
	nop                                              ; $44ad: $00
	nop                                              ; $44ae: $00
	nop                                              ; $44af: $00
	nop                                              ; $44b0: $00
	nop                                              ; $44b1: $00
	nop                                              ; $44b2: $00
	nop                                              ; $44b3: $00
	nop                                              ; $44b4: $00
	nop                                              ; $44b5: $00
	nop                                              ; $44b6: $00
	nop                                              ; $44b7: $00
	nop                                              ; $44b8: $00
	nop                                              ; $44b9: $00
	nop                                              ; $44ba: $00
	nop                                              ; $44bb: $00
	nop                                              ; $44bc: $00
	nop                                              ; $44bd: $00
	nop                                              ; $44be: $00
	nop                                              ; $44bf: $00
	nop                                              ; $44c0: $00
	nop                                              ; $44c1: $00
	nop                                              ; $44c2: $00
	nop                                              ; $44c3: $00
	nop                                              ; $44c4: $00
	nop                                              ; $44c5: $00
	nop                                              ; $44c6: $00
	nop                                              ; $44c7: $00
	nop                                              ; $44c8: $00
	nop                                              ; $44c9: $00
	nop                                              ; $44ca: $00
	nop                                              ; $44cb: $00
	nop                                              ; $44cc: $00
	nop                                              ; $44cd: $00
	nop                                              ; $44ce: $00

Jump_095_44cf:
	nop                                              ; $44cf: $00
	nop                                              ; $44d0: $00
	nop                                              ; $44d1: $00
	nop                                              ; $44d2: $00
	nop                                              ; $44d3: $00
	nop                                              ; $44d4: $00
	nop                                              ; $44d5: $00
	nop                                              ; $44d6: $00
	nop                                              ; $44d7: $00
	nop                                              ; $44d8: $00
	nop                                              ; $44d9: $00
	nop                                              ; $44da: $00
	nop                                              ; $44db: $00
	nop                                              ; $44dc: $00
	nop                                              ; $44dd: $00
	nop                                              ; $44de: $00
	nop                                              ; $44df: $00
	nop                                              ; $44e0: $00
	nop                                              ; $44e1: $00
	nop                                              ; $44e2: $00
	nop                                              ; $44e3: $00
	nop                                              ; $44e4: $00
	nop                                              ; $44e5: $00
	nop                                              ; $44e6: $00
	nop                                              ; $44e7: $00
	nop                                              ; $44e8: $00
	nop                                              ; $44e9: $00
	nop                                              ; $44ea: $00
	nop                                              ; $44eb: $00
	nop                                              ; $44ec: $00
	nop                                              ; $44ed: $00
	nop                                              ; $44ee: $00
	nop                                              ; $44ef: $00
	nop                                              ; $44f0: $00
	nop                                              ; $44f1: $00
	nop                                              ; $44f2: $00
	nop                                              ; $44f3: $00
	nop                                              ; $44f4: $00
	nop                                              ; $44f5: $00
	nop                                              ; $44f6: $00
	nop                                              ; $44f7: $00
	nop                                              ; $44f8: $00
	nop                                              ; $44f9: $00
	nop                                              ; $44fa: $00
	nop                                              ; $44fb: $00
	nop                                              ; $44fc: $00
	nop                                              ; $44fd: $00
	nop                                              ; $44fe: $00
	nop                                              ; $44ff: $00
	nop                                              ; $4500: $00
	nop                                              ; $4501: $00
	nop                                              ; $4502: $00
	nop                                              ; $4503: $00
	nop                                              ; $4504: $00
	nop                                              ; $4505: $00
	nop                                              ; $4506: $00
	nop                                              ; $4507: $00
	nop                                              ; $4508: $00
	nop                                              ; $4509: $00
	nop                                              ; $450a: $00
	nop                                              ; $450b: $00
	nop                                              ; $450c: $00
	nop                                              ; $450d: $00
	nop                                              ; $450e: $00
	nop                                              ; $450f: $00
	nop                                              ; $4510: $00
	nop                                              ; $4511: $00
	nop                                              ; $4512: $00
	nop                                              ; $4513: $00
	nop                                              ; $4514: $00
	nop                                              ; $4515: $00
	nop                                              ; $4516: $00
	nop                                              ; $4517: $00
	nop                                              ; $4518: $00
	nop                                              ; $4519: $00
	nop                                              ; $451a: $00
	nop                                              ; $451b: $00
	nop                                              ; $451c: $00
	nop                                              ; $451d: $00
	nop                                              ; $451e: $00
	nop                                              ; $451f: $00
	nop                                              ; $4520: $00
	nop                                              ; $4521: $00
	nop                                              ; $4522: $00
	nop                                              ; $4523: $00
	nop                                              ; $4524: $00
	nop                                              ; $4525: $00
	nop                                              ; $4526: $00
	nop                                              ; $4527: $00
	nop                                              ; $4528: $00
	nop                                              ; $4529: $00
	nop                                              ; $452a: $00
	nop                                              ; $452b: $00
	nop                                              ; $452c: $00
	nop                                              ; $452d: $00
	nop                                              ; $452e: $00
	nop                                              ; $452f: $00
	nop                                              ; $4530: $00
	nop                                              ; $4531: $00
	nop                                              ; $4532: $00
	nop                                              ; $4533: $00
	nop                                              ; $4534: $00
	nop                                              ; $4535: $00
	nop                                              ; $4536: $00
	nop                                              ; $4537: $00
	nop                                              ; $4538: $00
	nop                                              ; $4539: $00
	nop                                              ; $453a: $00
	nop                                              ; $453b: $00
	nop                                              ; $453c: $00
	nop                                              ; $453d: $00
	nop                                              ; $453e: $00
	nop                                              ; $453f: $00
	nop                                              ; $4540: $00
	nop                                              ; $4541: $00
	nop                                              ; $4542: $00
	nop                                              ; $4543: $00
	nop                                              ; $4544: $00
	nop                                              ; $4545: $00
	nop                                              ; $4546: $00
	nop                                              ; $4547: $00
	nop                                              ; $4548: $00
	nop                                              ; $4549: $00
	nop                                              ; $454a: $00
	nop                                              ; $454b: $00
	nop                                              ; $454c: $00
	nop                                              ; $454d: $00
	nop                                              ; $454e: $00
	nop                                              ; $454f: $00
	nop                                              ; $4550: $00
	nop                                              ; $4551: $00
	nop                                              ; $4552: $00
	nop                                              ; $4553: $00
	nop                                              ; $4554: $00
	nop                                              ; $4555: $00
	nop                                              ; $4556: $00
	nop                                              ; $4557: $00
	nop                                              ; $4558: $00
	nop                                              ; $4559: $00
	nop                                              ; $455a: $00
	nop                                              ; $455b: $00
	nop                                              ; $455c: $00
	nop                                              ; $455d: $00
	nop                                              ; $455e: $00
	nop                                              ; $455f: $00
	nop                                              ; $4560: $00
	nop                                              ; $4561: $00
	nop                                              ; $4562: $00
	nop                                              ; $4563: $00
	nop                                              ; $4564: $00
	nop                                              ; $4565: $00
	nop                                              ; $4566: $00
	nop                                              ; $4567: $00
	nop                                              ; $4568: $00
	nop                                              ; $4569: $00
	nop                                              ; $456a: $00
	nop                                              ; $456b: $00
	nop                                              ; $456c: $00
	nop                                              ; $456d: $00
	nop                                              ; $456e: $00
	nop                                              ; $456f: $00
	nop                                              ; $4570: $00
	nop                                              ; $4571: $00
	nop                                              ; $4572: $00
	nop                                              ; $4573: $00
	nop                                              ; $4574: $00
	nop                                              ; $4575: $00
	nop                                              ; $4576: $00
	nop                                              ; $4577: $00
	nop                                              ; $4578: $00
	nop                                              ; $4579: $00
	nop                                              ; $457a: $00
	nop                                              ; $457b: $00
	nop                                              ; $457c: $00
	nop                                              ; $457d: $00
	nop                                              ; $457e: $00
	nop                                              ; $457f: $00
	nop                                              ; $4580: $00
	nop                                              ; $4581: $00
	nop                                              ; $4582: $00
	nop                                              ; $4583: $00
	nop                                              ; $4584: $00
	nop                                              ; $4585: $00
	nop                                              ; $4586: $00
	nop                                              ; $4587: $00
	nop                                              ; $4588: $00
	nop                                              ; $4589: $00
	nop                                              ; $458a: $00
	nop                                              ; $458b: $00
	nop                                              ; $458c: $00
	nop                                              ; $458d: $00
	nop                                              ; $458e: $00
	nop                                              ; $458f: $00
	nop                                              ; $4590: $00
	nop                                              ; $4591: $00
	nop                                              ; $4592: $00
	nop                                              ; $4593: $00
	nop                                              ; $4594: $00
	nop                                              ; $4595: $00
	nop                                              ; $4596: $00
	nop                                              ; $4597: $00
	nop                                              ; $4598: $00
	nop                                              ; $4599: $00
	nop                                              ; $459a: $00
	nop                                              ; $459b: $00
	nop                                              ; $459c: $00
	nop                                              ; $459d: $00
	nop                                              ; $459e: $00
	nop                                              ; $459f: $00
	nop                                              ; $45a0: $00
	nop                                              ; $45a1: $00
	nop                                              ; $45a2: $00
	nop                                              ; $45a3: $00
	nop                                              ; $45a4: $00
	nop                                              ; $45a5: $00
	nop                                              ; $45a6: $00
	nop                                              ; $45a7: $00
	nop                                              ; $45a8: $00
	nop                                              ; $45a9: $00
	nop                                              ; $45aa: $00
	nop                                              ; $45ab: $00
	nop                                              ; $45ac: $00
	nop                                              ; $45ad: $00
	nop                                              ; $45ae: $00
	nop                                              ; $45af: $00
	nop                                              ; $45b0: $00
	nop                                              ; $45b1: $00
	nop                                              ; $45b2: $00
	nop                                              ; $45b3: $00
	nop                                              ; $45b4: $00
	nop                                              ; $45b5: $00
	nop                                              ; $45b6: $00
	nop                                              ; $45b7: $00
	nop                                              ; $45b8: $00
	nop                                              ; $45b9: $00
	nop                                              ; $45ba: $00
	nop                                              ; $45bb: $00
	nop                                              ; $45bc: $00
	nop                                              ; $45bd: $00
	nop                                              ; $45be: $00
	nop                                              ; $45bf: $00
	nop                                              ; $45c0: $00
	nop                                              ; $45c1: $00
	nop                                              ; $45c2: $00
	nop                                              ; $45c3: $00
	nop                                              ; $45c4: $00
	nop                                              ; $45c5: $00
	nop                                              ; $45c6: $00
	nop                                              ; $45c7: $00
	nop                                              ; $45c8: $00
	nop                                              ; $45c9: $00
	nop                                              ; $45ca: $00
	nop                                              ; $45cb: $00
	nop                                              ; $45cc: $00
	nop                                              ; $45cd: $00
	nop                                              ; $45ce: $00
	nop                                              ; $45cf: $00
	nop                                              ; $45d0: $00
	nop                                              ; $45d1: $00
	nop                                              ; $45d2: $00
	nop                                              ; $45d3: $00
	nop                                              ; $45d4: $00
	nop                                              ; $45d5: $00
	nop                                              ; $45d6: $00
	nop                                              ; $45d7: $00
	nop                                              ; $45d8: $00
	nop                                              ; $45d9: $00
	nop                                              ; $45da: $00
	nop                                              ; $45db: $00
	nop                                              ; $45dc: $00
	nop                                              ; $45dd: $00
	nop                                              ; $45de: $00
	nop                                              ; $45df: $00
	nop                                              ; $45e0: $00
	nop                                              ; $45e1: $00
	nop                                              ; $45e2: $00
	nop                                              ; $45e3: $00
	nop                                              ; $45e4: $00
	nop                                              ; $45e5: $00
	nop                                              ; $45e6: $00
	nop                                              ; $45e7: $00
	nop                                              ; $45e8: $00
	nop                                              ; $45e9: $00
	nop                                              ; $45ea: $00
	nop                                              ; $45eb: $00
	nop                                              ; $45ec: $00
	nop                                              ; $45ed: $00
	nop                                              ; $45ee: $00
	nop                                              ; $45ef: $00
	nop                                              ; $45f0: $00
	nop                                              ; $45f1: $00
	nop                                              ; $45f2: $00
	nop                                              ; $45f3: $00
	nop                                              ; $45f4: $00
	nop                                              ; $45f5: $00
	nop                                              ; $45f6: $00
	nop                                              ; $45f7: $00
	nop                                              ; $45f8: $00
	nop                                              ; $45f9: $00
	nop                                              ; $45fa: $00
	nop                                              ; $45fb: $00
	nop                                              ; $45fc: $00
	nop                                              ; $45fd: $00
	nop                                              ; $45fe: $00
	nop                                              ; $45ff: $00
	nop                                              ; $4600: $00
	nop                                              ; $4601: $00
	nop                                              ; $4602: $00
	nop                                              ; $4603: $00
	nop                                              ; $4604: $00
	nop                                              ; $4605: $00
	nop                                              ; $4606: $00
	nop                                              ; $4607: $00
	nop                                              ; $4608: $00
	nop                                              ; $4609: $00
	nop                                              ; $460a: $00
	nop                                              ; $460b: $00
	nop                                              ; $460c: $00
	nop                                              ; $460d: $00
	nop                                              ; $460e: $00
	nop                                              ; $460f: $00
	nop                                              ; $4610: $00
	nop                                              ; $4611: $00
	nop                                              ; $4612: $00
	nop                                              ; $4613: $00
	nop                                              ; $4614: $00
	nop                                              ; $4615: $00
	nop                                              ; $4616: $00
	nop                                              ; $4617: $00
	nop                                              ; $4618: $00
	nop                                              ; $4619: $00
	nop                                              ; $461a: $00
	nop                                              ; $461b: $00
	nop                                              ; $461c: $00
	nop                                              ; $461d: $00
	nop                                              ; $461e: $00
	nop                                              ; $461f: $00
	nop                                              ; $4620: $00
	nop                                              ; $4621: $00
	nop                                              ; $4622: $00
	nop                                              ; $4623: $00
	nop                                              ; $4624: $00
	nop                                              ; $4625: $00
	nop                                              ; $4626: $00
	nop                                              ; $4627: $00
	nop                                              ; $4628: $00
	nop                                              ; $4629: $00
	nop                                              ; $462a: $00
	nop                                              ; $462b: $00
	nop                                              ; $462c: $00
	nop                                              ; $462d: $00
	nop                                              ; $462e: $00
	nop                                              ; $462f: $00
	nop                                              ; $4630: $00
	nop                                              ; $4631: $00
	nop                                              ; $4632: $00
	nop                                              ; $4633: $00
	nop                                              ; $4634: $00
	nop                                              ; $4635: $00
	nop                                              ; $4636: $00
	nop                                              ; $4637: $00
	nop                                              ; $4638: $00
	nop                                              ; $4639: $00
	nop                                              ; $463a: $00
	nop                                              ; $463b: $00
	nop                                              ; $463c: $00
	nop                                              ; $463d: $00
	nop                                              ; $463e: $00
	nop                                              ; $463f: $00
	nop                                              ; $4640: $00
	nop                                              ; $4641: $00
	nop                                              ; $4642: $00
	nop                                              ; $4643: $00
	nop                                              ; $4644: $00
	nop                                              ; $4645: $00
	nop                                              ; $4646: $00
	nop                                              ; $4647: $00
	nop                                              ; $4648: $00
	nop                                              ; $4649: $00
	nop                                              ; $464a: $00
	nop                                              ; $464b: $00
	nop                                              ; $464c: $00
	nop                                              ; $464d: $00
	nop                                              ; $464e: $00
	nop                                              ; $464f: $00
	nop                                              ; $4650: $00
	nop                                              ; $4651: $00
	nop                                              ; $4652: $00
	nop                                              ; $4653: $00
	nop                                              ; $4654: $00
	nop                                              ; $4655: $00
	nop                                              ; $4656: $00
	nop                                              ; $4657: $00
	nop                                              ; $4658: $00
	nop                                              ; $4659: $00
	nop                                              ; $465a: $00
	nop                                              ; $465b: $00
	nop                                              ; $465c: $00
	nop                                              ; $465d: $00
	nop                                              ; $465e: $00
	nop                                              ; $465f: $00
	nop                                              ; $4660: $00
	nop                                              ; $4661: $00
	nop                                              ; $4662: $00
	nop                                              ; $4663: $00
	nop                                              ; $4664: $00
	nop                                              ; $4665: $00
	nop                                              ; $4666: $00
	nop                                              ; $4667: $00
	nop                                              ; $4668: $00
	nop                                              ; $4669: $00
	nop                                              ; $466a: $00
	nop                                              ; $466b: $00
	nop                                              ; $466c: $00
	nop                                              ; $466d: $00
	nop                                              ; $466e: $00
	nop                                              ; $466f: $00
	nop                                              ; $4670: $00
	nop                                              ; $4671: $00
	nop                                              ; $4672: $00
	nop                                              ; $4673: $00
	nop                                              ; $4674: $00
	nop                                              ; $4675: $00
	nop                                              ; $4676: $00
	nop                                              ; $4677: $00
	nop                                              ; $4678: $00
	nop                                              ; $4679: $00
	nop                                              ; $467a: $00
	nop                                              ; $467b: $00
	nop                                              ; $467c: $00
	nop                                              ; $467d: $00
	nop                                              ; $467e: $00
	nop                                              ; $467f: $00
	nop                                              ; $4680: $00
	nop                                              ; $4681: $00
	nop                                              ; $4682: $00
	nop                                              ; $4683: $00
	nop                                              ; $4684: $00
	nop                                              ; $4685: $00
	nop                                              ; $4686: $00
	nop                                              ; $4687: $00
	nop                                              ; $4688: $00
	nop                                              ; $4689: $00
	nop                                              ; $468a: $00
	nop                                              ; $468b: $00
	nop                                              ; $468c: $00
	nop                                              ; $468d: $00
	nop                                              ; $468e: $00
	nop                                              ; $468f: $00
	nop                                              ; $4690: $00
	nop                                              ; $4691: $00
	nop                                              ; $4692: $00
	nop                                              ; $4693: $00
	nop                                              ; $4694: $00
	nop                                              ; $4695: $00
	nop                                              ; $4696: $00
	nop                                              ; $4697: $00
	nop                                              ; $4698: $00
	nop                                              ; $4699: $00
	nop                                              ; $469a: $00
	nop                                              ; $469b: $00
	nop                                              ; $469c: $00
	nop                                              ; $469d: $00
	nop                                              ; $469e: $00
	nop                                              ; $469f: $00
	nop                                              ; $46a0: $00
	nop                                              ; $46a1: $00
	nop                                              ; $46a2: $00
	nop                                              ; $46a3: $00
	nop                                              ; $46a4: $00
	nop                                              ; $46a5: $00
	nop                                              ; $46a6: $00
	nop                                              ; $46a7: $00
	nop                                              ; $46a8: $00
	nop                                              ; $46a9: $00
	nop                                              ; $46aa: $00
	nop                                              ; $46ab: $00
	nop                                              ; $46ac: $00
	nop                                              ; $46ad: $00
	nop                                              ; $46ae: $00
	nop                                              ; $46af: $00
	nop                                              ; $46b0: $00
	nop                                              ; $46b1: $00
	nop                                              ; $46b2: $00
	nop                                              ; $46b3: $00
	nop                                              ; $46b4: $00
	nop                                              ; $46b5: $00
	nop                                              ; $46b6: $00
	nop                                              ; $46b7: $00
	nop                                              ; $46b8: $00
	nop                                              ; $46b9: $00
	nop                                              ; $46ba: $00
	nop                                              ; $46bb: $00
	nop                                              ; $46bc: $00
	nop                                              ; $46bd: $00
	nop                                              ; $46be: $00
	nop                                              ; $46bf: $00
	nop                                              ; $46c0: $00
	nop                                              ; $46c1: $00
	nop                                              ; $46c2: $00
	nop                                              ; $46c3: $00
	nop                                              ; $46c4: $00
	nop                                              ; $46c5: $00
	nop                                              ; $46c6: $00
	nop                                              ; $46c7: $00
	nop                                              ; $46c8: $00
	nop                                              ; $46c9: $00
	nop                                              ; $46ca: $00
	nop                                              ; $46cb: $00
	nop                                              ; $46cc: $00
	nop                                              ; $46cd: $00
	nop                                              ; $46ce: $00
	nop                                              ; $46cf: $00
	nop                                              ; $46d0: $00
	nop                                              ; $46d1: $00
	nop                                              ; $46d2: $00
	nop                                              ; $46d3: $00
	nop                                              ; $46d4: $00
	nop                                              ; $46d5: $00
	nop                                              ; $46d6: $00
	nop                                              ; $46d7: $00
	nop                                              ; $46d8: $00
	nop                                              ; $46d9: $00
	nop                                              ; $46da: $00
	nop                                              ; $46db: $00
	nop                                              ; $46dc: $00
	nop                                              ; $46dd: $00
	nop                                              ; $46de: $00
	nop                                              ; $46df: $00
	nop                                              ; $46e0: $00
	nop                                              ; $46e1: $00
	nop                                              ; $46e2: $00
	nop                                              ; $46e3: $00
	nop                                              ; $46e4: $00
	nop                                              ; $46e5: $00
	nop                                              ; $46e6: $00
	nop                                              ; $46e7: $00
	nop                                              ; $46e8: $00
	nop                                              ; $46e9: $00
	nop                                              ; $46ea: $00
	nop                                              ; $46eb: $00
	nop                                              ; $46ec: $00
	nop                                              ; $46ed: $00
	nop                                              ; $46ee: $00
	nop                                              ; $46ef: $00
	nop                                              ; $46f0: $00
	nop                                              ; $46f1: $00
	nop                                              ; $46f2: $00
	nop                                              ; $46f3: $00
	nop                                              ; $46f4: $00
	nop                                              ; $46f5: $00
	nop                                              ; $46f6: $00
	nop                                              ; $46f7: $00
	nop                                              ; $46f8: $00
	nop                                              ; $46f9: $00
	nop                                              ; $46fa: $00
	nop                                              ; $46fb: $00
	nop                                              ; $46fc: $00
	nop                                              ; $46fd: $00
	nop                                              ; $46fe: $00
	nop                                              ; $46ff: $00
	nop                                              ; $4700: $00
	nop                                              ; $4701: $00
	nop                                              ; $4702: $00
	nop                                              ; $4703: $00
	nop                                              ; $4704: $00
	nop                                              ; $4705: $00
	nop                                              ; $4706: $00
	nop                                              ; $4707: $00
	nop                                              ; $4708: $00
	nop                                              ; $4709: $00
	nop                                              ; $470a: $00
	nop                                              ; $470b: $00
	nop                                              ; $470c: $00
	nop                                              ; $470d: $00
	nop                                              ; $470e: $00
	nop                                              ; $470f: $00
	nop                                              ; $4710: $00
	nop                                              ; $4711: $00
	nop                                              ; $4712: $00
	nop                                              ; $4713: $00
	nop                                              ; $4714: $00
	nop                                              ; $4715: $00
	nop                                              ; $4716: $00
	nop                                              ; $4717: $00
	nop                                              ; $4718: $00
	nop                                              ; $4719: $00
	nop                                              ; $471a: $00
	nop                                              ; $471b: $00
	nop                                              ; $471c: $00
	nop                                              ; $471d: $00
	nop                                              ; $471e: $00
	nop                                              ; $471f: $00
	nop                                              ; $4720: $00
	nop                                              ; $4721: $00
	nop                                              ; $4722: $00
	nop                                              ; $4723: $00
	nop                                              ; $4724: $00
	nop                                              ; $4725: $00
	nop                                              ; $4726: $00
	nop                                              ; $4727: $00
	nop                                              ; $4728: $00
	nop                                              ; $4729: $00
	nop                                              ; $472a: $00
	nop                                              ; $472b: $00
	nop                                              ; $472c: $00
	nop                                              ; $472d: $00
	nop                                              ; $472e: $00
	nop                                              ; $472f: $00
	nop                                              ; $4730: $00
	nop                                              ; $4731: $00
	nop                                              ; $4732: $00
	nop                                              ; $4733: $00
	nop                                              ; $4734: $00
	nop                                              ; $4735: $00
	nop                                              ; $4736: $00
	nop                                              ; $4737: $00
	nop                                              ; $4738: $00
	nop                                              ; $4739: $00
	nop                                              ; $473a: $00
	nop                                              ; $473b: $00
	nop                                              ; $473c: $00
	nop                                              ; $473d: $00
	nop                                              ; $473e: $00
	nop                                              ; $473f: $00
	nop                                              ; $4740: $00
	nop                                              ; $4741: $00
	nop                                              ; $4742: $00
	nop                                              ; $4743: $00
	nop                                              ; $4744: $00
	nop                                              ; $4745: $00
	nop                                              ; $4746: $00
	nop                                              ; $4747: $00
	nop                                              ; $4748: $00
	nop                                              ; $4749: $00
	nop                                              ; $474a: $00
	nop                                              ; $474b: $00
	nop                                              ; $474c: $00
	nop                                              ; $474d: $00
	nop                                              ; $474e: $00
	nop                                              ; $474f: $00
	nop                                              ; $4750: $00
	nop                                              ; $4751: $00
	nop                                              ; $4752: $00
	nop                                              ; $4753: $00
	nop                                              ; $4754: $00
	nop                                              ; $4755: $00
	nop                                              ; $4756: $00
	nop                                              ; $4757: $00
	nop                                              ; $4758: $00
	nop                                              ; $4759: $00
	nop                                              ; $475a: $00
	nop                                              ; $475b: $00
	nop                                              ; $475c: $00
	nop                                              ; $475d: $00
	nop                                              ; $475e: $00
	nop                                              ; $475f: $00
	nop                                              ; $4760: $00
	nop                                              ; $4761: $00
	nop                                              ; $4762: $00
	nop                                              ; $4763: $00
	nop                                              ; $4764: $00
	nop                                              ; $4765: $00
	nop                                              ; $4766: $00
	nop                                              ; $4767: $00
	nop                                              ; $4768: $00
	nop                                              ; $4769: $00
	nop                                              ; $476a: $00
	nop                                              ; $476b: $00
	nop                                              ; $476c: $00
	nop                                              ; $476d: $00
	nop                                              ; $476e: $00
	nop                                              ; $476f: $00
	nop                                              ; $4770: $00
	nop                                              ; $4771: $00
	nop                                              ; $4772: $00
	nop                                              ; $4773: $00
	nop                                              ; $4774: $00
	nop                                              ; $4775: $00
	nop                                              ; $4776: $00
	nop                                              ; $4777: $00
	nop                                              ; $4778: $00
	nop                                              ; $4779: $00
	nop                                              ; $477a: $00
	nop                                              ; $477b: $00
	nop                                              ; $477c: $00
	nop                                              ; $477d: $00
	nop                                              ; $477e: $00
	nop                                              ; $477f: $00
	nop                                              ; $4780: $00
	nop                                              ; $4781: $00
	nop                                              ; $4782: $00
	nop                                              ; $4783: $00
	nop                                              ; $4784: $00

Jump_095_4785:
	nop                                              ; $4785: $00
	nop                                              ; $4786: $00
	nop                                              ; $4787: $00
	nop                                              ; $4788: $00
	nop                                              ; $4789: $00
	nop                                              ; $478a: $00
	nop                                              ; $478b: $00
	nop                                              ; $478c: $00
	nop                                              ; $478d: $00
	nop                                              ; $478e: $00
	nop                                              ; $478f: $00
	nop                                              ; $4790: $00
	nop                                              ; $4791: $00
	nop                                              ; $4792: $00
	nop                                              ; $4793: $00
	nop                                              ; $4794: $00
	nop                                              ; $4795: $00
	nop                                              ; $4796: $00
	nop                                              ; $4797: $00
	nop                                              ; $4798: $00
	nop                                              ; $4799: $00
	nop                                              ; $479a: $00
	nop                                              ; $479b: $00
	nop                                              ; $479c: $00
	nop                                              ; $479d: $00
	nop                                              ; $479e: $00
	nop                                              ; $479f: $00
	nop                                              ; $47a0: $00
	nop                                              ; $47a1: $00
	nop                                              ; $47a2: $00
	nop                                              ; $47a3: $00
	nop                                              ; $47a4: $00
	nop                                              ; $47a5: $00
	nop                                              ; $47a6: $00
	nop                                              ; $47a7: $00
	nop                                              ; $47a8: $00
	nop                                              ; $47a9: $00
	nop                                              ; $47aa: $00
	nop                                              ; $47ab: $00
	nop                                              ; $47ac: $00
	nop                                              ; $47ad: $00
	nop                                              ; $47ae: $00
	nop                                              ; $47af: $00
	nop                                              ; $47b0: $00
	nop                                              ; $47b1: $00
	nop                                              ; $47b2: $00
	nop                                              ; $47b3: $00
	nop                                              ; $47b4: $00
	nop                                              ; $47b5: $00
	nop                                              ; $47b6: $00
	nop                                              ; $47b7: $00
	nop                                              ; $47b8: $00
	nop                                              ; $47b9: $00
	nop                                              ; $47ba: $00
	nop                                              ; $47bb: $00
	nop                                              ; $47bc: $00
	nop                                              ; $47bd: $00
	nop                                              ; $47be: $00
	nop                                              ; $47bf: $00
	nop                                              ; $47c0: $00
	nop                                              ; $47c1: $00
	nop                                              ; $47c2: $00
	nop                                              ; $47c3: $00
	nop                                              ; $47c4: $00
	nop                                              ; $47c5: $00
	nop                                              ; $47c6: $00
	nop                                              ; $47c7: $00
	nop                                              ; $47c8: $00
	nop                                              ; $47c9: $00
	nop                                              ; $47ca: $00
	nop                                              ; $47cb: $00
	nop                                              ; $47cc: $00
	nop                                              ; $47cd: $00
	nop                                              ; $47ce: $00
	nop                                              ; $47cf: $00
	nop                                              ; $47d0: $00
	nop                                              ; $47d1: $00
	nop                                              ; $47d2: $00
	nop                                              ; $47d3: $00
	nop                                              ; $47d4: $00
	nop                                              ; $47d5: $00
	nop                                              ; $47d6: $00
	nop                                              ; $47d7: $00
	nop                                              ; $47d8: $00
	nop                                              ; $47d9: $00
	nop                                              ; $47da: $00
	nop                                              ; $47db: $00
	nop                                              ; $47dc: $00
	nop                                              ; $47dd: $00
	nop                                              ; $47de: $00
	nop                                              ; $47df: $00
	nop                                              ; $47e0: $00
	nop                                              ; $47e1: $00
	nop                                              ; $47e2: $00
	nop                                              ; $47e3: $00
	nop                                              ; $47e4: $00
	nop                                              ; $47e5: $00
	nop                                              ; $47e6: $00
	nop                                              ; $47e7: $00
	nop                                              ; $47e8: $00
	nop                                              ; $47e9: $00
	nop                                              ; $47ea: $00
	nop                                              ; $47eb: $00
	nop                                              ; $47ec: $00
	nop                                              ; $47ed: $00
	nop                                              ; $47ee: $00
	nop                                              ; $47ef: $00
	nop                                              ; $47f0: $00
	nop                                              ; $47f1: $00
	nop                                              ; $47f2: $00
	nop                                              ; $47f3: $00
	nop                                              ; $47f4: $00
	nop                                              ; $47f5: $00
	nop                                              ; $47f6: $00
	nop                                              ; $47f7: $00
	nop                                              ; $47f8: $00
	nop                                              ; $47f9: $00
	nop                                              ; $47fa: $00
	nop                                              ; $47fb: $00
	nop                                              ; $47fc: $00
	nop                                              ; $47fd: $00
	nop                                              ; $47fe: $00
	nop                                              ; $47ff: $00
	nop                                              ; $4800: $00
	nop                                              ; $4801: $00
	nop                                              ; $4802: $00
	nop                                              ; $4803: $00
	nop                                              ; $4804: $00
	nop                                              ; $4805: $00
	nop                                              ; $4806: $00
	nop                                              ; $4807: $00
	nop                                              ; $4808: $00
	nop                                              ; $4809: $00
	nop                                              ; $480a: $00
	nop                                              ; $480b: $00
	nop                                              ; $480c: $00
	nop                                              ; $480d: $00
	nop                                              ; $480e: $00
	nop                                              ; $480f: $00
	nop                                              ; $4810: $00
	nop                                              ; $4811: $00
	nop                                              ; $4812: $00
	nop                                              ; $4813: $00
	nop                                              ; $4814: $00
	nop                                              ; $4815: $00
	nop                                              ; $4816: $00
	nop                                              ; $4817: $00
	add  b                                           ; $4818: $80
	nop                                              ; $4819: $00
	ld   bc, $8400                                   ; $481a: $01 $00 $84
	inc  bc                                          ; $481d: $03
	ld   b, d                                        ; $481e: $42
	rrca                                             ; $481f: $0f
	nop                                              ; $4820: $00
	nop                                              ; $4821: $00
	nop                                              ; $4822: $00
	nop                                              ; $4823: $00
	nop                                              ; $4824: $00
	nop                                              ; $4825: $00
	inc  b                                           ; $4826: $04
	inc  bc                                          ; $4827: $03
	daa                                              ; $4828: $27
	rra                                              ; $4829: $1f
	jr   nc, @+$01                                   ; $482a: $30 $ff

	rst  $20                                         ; $482c: $e7
	ld   hl, sp+$33                                  ; $482d: $f8 $33
	adc  $00                                         ; $482f: $ce $00
	nop                                              ; $4831: $00
	ld   c, $00                                      ; $4832: $0e $00
	add  [hl]                                        ; $4834: $86
	ld   a, a                                        ; $4835: $7f
	and  $f9                                         ; $4836: $e6 $f9
	ld   a, e                                        ; $4838: $7b
	add  b                                           ; $4839: $80
	ld   d, e                                        ; $483a: $53
	add  b                                           ; $483b: $80
	rra                                              ; $483c: $1f
	add  b                                           ; $483d: $80
	ld   a, b                                        ; $483e: $78
	add  a                                           ; $483f: $87
	nop                                              ; $4840: $00
	nop                                              ; $4841: $00
	nop                                              ; $4842: $00
	nop                                              ; $4843: $00
	add  b                                           ; $4844: $80
	nop                                              ; $4845: $00
	and  b                                           ; $4846: $a0
	ret  nz                                          ; $4847: $c0

	add  sp, $70                                     ; $4848: $e8 $70
	cp   d                                           ; $484a: $ba
	ld   a, h                                        ; $484b: $7c
	ld   e, $ff                                      ; $484c: $1e $ff
	rst  $20                                         ; $484e: $e7
	rst  $38                                         ; $484f: $ff
	ld   h, b                                        ; $4850: $60
	nop                                              ; $4851: $00
	ld   h, b                                        ; $4852: $60
	nop                                              ; $4853: $00
	ld   h, b                                        ; $4854: $60
	nop                                              ; $4855: $00
	ld   h, b                                        ; $4856: $60
	nop                                              ; $4857: $00
	ld   h, b                                        ; $4858: $60
	nop                                              ; $4859: $00

jr_095_485a:
	inc  e                                           ; $485a: $1c
	ld   h, b                                        ; $485b: $60
	ldh  [rP1], a                                    ; $485c: $e0 $00
	ldh  [$c0], a                                    ; $485e: $e0 $c0
	nop                                              ; $4860: $00
	nop                                              ; $4861: $00
	nop                                              ; $4862: $00
	nop                                              ; $4863: $00
	nop                                              ; $4864: $00
	nop                                              ; $4865: $00
	nop                                              ; $4866: $00
	nop                                              ; $4867: $00
	nop                                              ; $4868: $00
	nop                                              ; $4869: $00
	nop                                              ; $486a: $00
	nop                                              ; $486b: $00
	nop                                              ; $486c: $00
	nop                                              ; $486d: $00
	nop                                              ; $486e: $00
	nop                                              ; $486f: $00
	ld   b, b                                        ; $4870: $40
	nop                                              ; $4871: $00
	ld   b, c                                        ; $4872: $41

jr_095_4873:
	nop                                              ; $4873: $00
	ld   b, c                                        ; $4874: $41
	nop                                              ; $4875: $00
	ld   l, d                                        ; $4876: $6a
	nop                                              ; $4877: $00
	ld   d, [hl]                                     ; $4878: $56
	nop                                              ; $4879: $00
	ld   l, h                                        ; $487a: $6c
	nop                                              ; $487b: $00
	ld   e, b                                        ; $487c: $58
	nop                                              ; $487d: $00
	jr   nc, jr_095_48c0                             ; $487e: $30 $40

	xor  l                                           ; $4880: $ad
	ld   e, $d7                                      ; $4881: $1e $d7
	jr   c, jr_095_4873                              ; $4883: $38 $ee

	jr   nc, jr_095_485a                             ; $4885: $30 $d3

	ld   h, b                                        ; $4887: $60
	xor  $41                                         ; $4888: $ee $41
	ei                                               ; $488a: $fb
	rst  JumpTableTrashDE                                         ; $488b: $c7
	rst  $18                                         ; $488c: $df
	rst  $38                                         ; $488d: $ff
	rst  $38                                         ; $488e: $ff
	rst  $38                                         ; $488f: $ff
	ld   e, $ff                                      ; $4890: $1e $ff
	or   b                                           ; $4892: $b0
	ld   a, a                                        ; $4893: $7f
	dec  b                                           ; $4894: $05
	rst  $38                                         ; $4895: $ff
	rra                                              ; $4896: $1f
	rst  $38                                         ; $4897: $ff
	rst  $38                                         ; $4898: $ff
	rst  $38                                         ; $4899: $ff
	rst  $38                                         ; $489a: $ff
	rst  $38                                         ; $489b: $ff
	rst  $38                                         ; $489c: $ff
	rst  $38                                         ; $489d: $ff
	rst  $38                                         ; $489e: $ff
	rst  $38                                         ; $489f: $ff
	xor  a                                           ; $48a0: $af
	rst  $18                                         ; $48a1: $df
	rst  $38                                         ; $48a2: $ff
	rst  $38                                         ; $48a3: $ff
	rst  $38                                         ; $48a4: $ff
	rst  $38                                         ; $48a5: $ff
	rst  $38                                         ; $48a6: $ff
	rst  $38                                         ; $48a7: $ff
	rst  $38                                         ; $48a8: $ff
	rst  $38                                         ; $48a9: $ff
	cp   $ff                                         ; $48aa: $fe $ff
	cp   $ff                                         ; $48ac: $fe $ff
	rst  $38                                         ; $48ae: $ff
	rst  $38                                         ; $48af: $ff
	ld   hl, sp-$01                                  ; $48b0: $f8 $ff
	ld   sp, hl                                      ; $48b2: $f9
	cp   $f9                                         ; $48b3: $fe $f9
	cp   $f9                                         ; $48b5: $fe $f9
	rst  $38                                         ; $48b7: $ff
	ld   sp, hl                                      ; $48b8: $f9
	rst  $38                                         ; $48b9: $ff
	ld   sp, hl                                      ; $48ba: $f9
	rst  $38                                         ; $48bb: $ff
	db   $fd                                         ; $48bc: $fd
	rst  $38                                         ; $48bd: $ff
	db   $fd                                         ; $48be: $fd
	rst  $38                                         ; $48bf: $ff

jr_095_48c0:
	add  sp, -$10                                    ; $48c0: $e8 $f0
	cp   d                                           ; $48c2: $ba
	ld   a, h                                        ; $48c3: $7c
	rst  $28                                         ; $48c4: $ef
	rra                                              ; $48c5: $1f
	ld   a, c                                        ; $48c6: $79
	add  a                                           ; $48c7: $87
	sbc  a                                           ; $48c8: $9f
	ldh  [$87], a                                    ; $48c9: $e0 $87
	ld   hl, sp-$43                                  ; $48cb: $f8 $bd
	cp   $9e                                         ; $48cd: $fe $9e
	rst  $38                                         ; $48cf: $ff
	nop                                              ; $48d0: $00
	nop                                              ; $48d1: $00
	nop                                              ; $48d2: $00
	nop                                              ; $48d3: $00
	add  b                                           ; $48d4: $80
	nop                                              ; $48d5: $00
	and  b                                           ; $48d6: $a0
	ret  nz                                          ; $48d7: $c0

	ld   [hl], b                                     ; $48d8: $70
	ld   hl, sp-$31                                  ; $48d9: $f8 $cf
	inc  a                                           ; $48db: $3c
	dec  sp                                          ; $48dc: $3b
	rlca                                             ; $48dd: $07
	db   $e4                                         ; $48de: $e4
	inc  bc                                          ; $48df: $03
	ld   h, b                                        ; $48e0: $60
	nop                                              ; $48e1: $00
	ld   b, b                                        ; $48e2: $40
	nop                                              ; $48e3: $00
	ld   b, b                                        ; $48e4: $40
	nop                                              ; $48e5: $00
	ld   b, c                                        ; $48e6: $41
	nop                                              ; $48e7: $00
	ld   b, b                                        ; $48e8: $40
	nop                                              ; $48e9: $00
	ld   b, c                                        ; $48ea: $41
	nop                                              ; $48eb: $00
	ld   b, c                                        ; $48ec: $41
	add  b                                           ; $48ed: $80
	db   $e3                                         ; $48ee: $e3
	ret  nz                                          ; $48ef: $c0

	rst  $38                                         ; $48f0: $ff
	rst  $38                                         ; $48f1: $ff
	rst  $38                                         ; $48f2: $ff
	rst  $38                                         ; $48f3: $ff
	rst  $38                                         ; $48f4: $ff
	rst  $38                                         ; $48f5: $ff
	rst  $38                                         ; $48f6: $ff
	rst  $38                                         ; $48f7: $ff
	rst  $38                                         ; $48f8: $ff
	rst  $38                                         ; $48f9: $ff
	rst  $38                                         ; $48fa: $ff
	rst  $38                                         ; $48fb: $ff
	rst  $38                                         ; $48fc: $ff
	rst  $38                                         ; $48fd: $ff
	ld   hl, sp-$01                                  ; $48fe: $f8 $ff
	rst  $38                                         ; $4900: $ff
	rst  $38                                         ; $4901: $ff
	rst  $38                                         ; $4902: $ff
	rst  $38                                         ; $4903: $ff
	rst  $38                                         ; $4904: $ff
	rst  $38                                         ; $4905: $ff
	rst  $38                                         ; $4906: $ff
	rst  $38                                         ; $4907: $ff
	rst  $38                                         ; $4908: $ff
	rst  $38                                         ; $4909: $ff
	ld   sp, hl                                      ; $490a: $f9
	rst  $38                                         ; $490b: $ff
	ld   l, c                                        ; $490c: $69
	rst  $30                                         ; $490d: $f7
	ld   [hl], l                                     ; $490e: $75
	db   $eb                                         ; $490f: $eb
	cp   $ff                                         ; $4910: $fe $ff
	ei                                               ; $4912: $fb
	rst  $38                                         ; $4913: $ff
	cp   $ff                                         ; $4914: $fe $ff
	di                                               ; $4916: $f3
	db   $fc                                         ; $4917: $fc
	sbc  a                                           ; $4918: $9f
	ldh  [$af], a                                    ; $4919: $e0 $af
	ret  nc                                          ; $491b: $d0

	rst  $18                                         ; $491c: $df
	and  b                                           ; $491d: $a0
	xor  a                                           ; $491e: $af
	ret  nc                                          ; $491f: $d0

	db   $fd                                         ; $4920: $fd
	rst  $38                                         ; $4921: $ff
	db   $fd                                         ; $4922: $fd
	rst  $38                                         ; $4923: $ff
	dec  b                                           ; $4924: $05
	rst  $38                                         ; $4925: $ff
	add  sp, $17                                     ; $4926: $e8 $17
	ldh  a, [rIF]                                    ; $4928: $f0 $0f
	ld   hl, sp+$07                                  ; $492a: $f8 $07
	ldh  a, [rIF]                                    ; $492c: $f0 $0f
	ei                                               ; $492e: $fb
	inc  b                                           ; $492f: $04
	sbc  a                                           ; $4930: $9f
	rst  $38                                         ; $4931: $ff
	sbc  a                                           ; $4932: $9f
	rst  $38                                         ; $4933: $ff
	sbc  a                                           ; $4934: $9f
	rst  $38                                         ; $4935: $ff
	rra                                              ; $4936: $1f
	rst  $38                                         ; $4937: $ff
	rra                                              ; $4938: $1f
	rst  $38                                         ; $4939: $ff
	rra                                              ; $493a: $1f
	rst  $38                                         ; $493b: $ff
	rra                                              ; $493c: $1f
	rst  $38                                         ; $493d: $ff
	nop                                              ; $493e: $00
	rst  $38                                         ; $493f: $ff
	ld   d, c                                        ; $4940: $51
	ldh  [$e4], a                                    ; $4941: $e0 $e4
	ld   hl, sp+$3a                                  ; $4943: $f8 $3a
	rst  $38                                         ; $4945: $ff
	or   e                                           ; $4946: $b3
	rst  $38                                         ; $4947: $ff
	cp   c                                           ; $4948: $b9
	rst  $38                                         ; $4949: $ff
	cp   c                                           ; $494a: $b9
	rst  $38                                         ; $494b: $ff
	cp   c                                           ; $494c: $b9
	rst  $38                                         ; $494d: $ff
	ld   bc, $b5ff                                   ; $494e: $01 $ff $b5
	ld   a, b                                        ; $4951: $78
	ld   l, a                                        ; $4952: $6f
	inc  e                                           ; $4953: $1c
	call $9103                                       ; $4954: $cd $03 $91
	ldh  [$96], a                                    ; $4957: $e0 $96
	ld   hl, sp-$24                                  ; $4959: $f8 $dc
	rst  $38                                         ; $495b: $ff
	sbc  c                                           ; $495c: $99
	rst  $38                                         ; $495d: $ff
	call $d4ff                                       ; $495e: $cd $ff $d4
	db   $eb                                         ; $4961: $eb
	add  sp, -$29                                    ; $4962: $e8 $d7
	ld   [hl], h                                     ; $4964: $74
	set  5, b                                        ; $4965: $cb $e8
	rst  $10                                         ; $4967: $d7
	db   $f4                                         ; $4968: $f4
	set  5, b                                        ; $4969: $cb $e8
	rst  $10                                         ; $496b: $d7
	ldh  a, [$cf]                                    ; $496c: $f0 $cf
	ld   l, b                                        ; $496e: $68
	rst  $10                                         ; $496f: $d7
	ld   l, c                                        ; $4970: $69
	rst  $30                                         ; $4971: $f7
	ld   h, h                                        ; $4972: $64
	ei                                               ; $4973: $fb
	add  hl, hl                                      ; $4974: $29
	rst  $30                                         ; $4975: $f7
	ld   h, l                                        ; $4976: $65
	ei                                               ; $4977: $fb
	jr   nz, @+$01                                   ; $4978: $20 $ff

	ld   h, l                                        ; $497a: $65
	ei                                               ; $497b: $fb
	ld   sp, $62ff                                   ; $497c: $31 $ff $62
	rst  $38                                         ; $497f: $ff
	rst  $10                                         ; $4980: $d7
	xor  b                                           ; $4981: $a8
	xor  [hl]                                        ; $4982: $ae
	pop  de                                          ; $4983: $d1
	call $bbba                                       ; $4984: $cd $ba $bb
	db   $dd                                         ; $4987: $dd
	call c, $bfbf                                    ; $4988: $dc $bf $bf
	rst  $18                                         ; $498b: $df
	sbc  [hl]                                        ; $498c: $9e
	rst  $38                                         ; $498d: $ff
	jp   c, $fbff                                    ; $498e: $da $ff $fb

	inc  b                                           ; $4991: $04
	ei                                               ; $4992: $fb
	inc  b                                           ; $4993: $04
	ei                                               ; $4994: $fb
	add  h                                           ; $4995: $84
	ld   sp, hl                                      ; $4996: $f9
	add  [hl]                                        ; $4997: $86
	ei                                               ; $4998: $fb
	add  h                                           ; $4999: $84
	ld   a, l                                        ; $499a: $7d
	add  [hl]                                        ; $499b: $86
	ld   a, l                                        ; $499c: $7d
	add  [hl]                                        ; $499d: $86
	cp   l                                           ; $499e: $bd
	ld   b, [hl]                                     ; $499f: $46
	ld   a, [$ff05]                                  ; $49a0: $fa $05 $ff
	nop                                              ; $49a3: $00
	rst  $38                                         ; $49a4: $ff
	nop                                              ; $49a5: $00
	rst  $38                                         ; $49a6: $ff
	nop                                              ; $49a7: $00
	rst  $38                                         ; $49a8: $ff
	nop                                              ; $49a9: $00
	rst  $38                                         ; $49aa: $ff
	nop                                              ; $49ab: $00
	rst  $38                                         ; $49ac: $ff
	nop                                              ; $49ad: $00
	rst  $38                                         ; $49ae: $ff
	nop                                              ; $49af: $00
	add  b                                           ; $49b0: $80
	ld   a, a                                        ; $49b1: $7f
	push af                                          ; $49b2: $f5
	ld   a, [bc]                                     ; $49b3: $0a
	ld   a, [$fd00]                                  ; $49b4: $fa $00 $fd
	nop                                              ; $49b7: $00
	rst  $38                                         ; $49b8: $ff
	nop                                              ; $49b9: $00
	rst  $38                                         ; $49ba: $ff
	nop                                              ; $49bb: $00
	rst  $38                                         ; $49bc: $ff
	nop                                              ; $49bd: $00
	rst  $38                                         ; $49be: $ff
	nop                                              ; $49bf: $00
	ld   l, l                                        ; $49c0: $6d
	rst  $38                                         ; $49c1: $ff
	nop                                              ; $49c2: $00
	rst  $38                                         ; $49c3: $ff
	or   h                                           ; $49c4: $b4
	dec  bc                                          ; $49c5: $0b
	ld   d, c                                        ; $49c6: $51
	nop                                              ; $49c7: $00
	xor  b                                           ; $49c8: $a8
	nop                                              ; $49c9: $00
	push af                                          ; $49ca: $f5
	nop                                              ; $49cb: $00
	cp   $00                                         ; $49cc: $fe $00
	rst  $38                                         ; $49ce: $ff
	nop                                              ; $49cf: $00
	or   $4f                                         ; $49d0: $f6 $4f
	and  $5f                                         ; $49d2: $e6 $5f
	ld   a, h                                        ; $49d4: $7c
	ld   e, a                                        ; $49d5: $5f
	db   $db                                         ; $49d6: $db
	ld   a, a                                        ; $49d7: $7f
	ccf                                              ; $49d8: $3f
	ld   a, a                                        ; $49d9: $7f
	cp   a                                           ; $49da: $bf
	ld   a, a                                        ; $49db: $7f
	rst  $38                                         ; $49dc: $ff
	ccf                                              ; $49dd: $3f
	rst  $28                                         ; $49de: $ef
	rra                                              ; $49df: $1f
	dec  [hl]                                        ; $49e0: $35
	rst  $38                                         ; $49e1: $ff
	ld   a, a                                        ; $49e2: $7f
	rst  $38                                         ; $49e3: $ff
	cp   a                                           ; $49e4: $bf
	rst  $38                                         ; $49e5: $ff
	rst  $38                                         ; $49e6: $ff
	rst  $38                                         ; $49e7: $ff
	rst  $38                                         ; $49e8: $ff
	rst  $38                                         ; $49e9: $ff
	cp   a                                           ; $49ea: $bf
	rst  $38                                         ; $49eb: $ff
	ld   e, a                                        ; $49ec: $5f
	rst  $38                                         ; $49ed: $ff
	cp   a                                           ; $49ee: $bf
	rst  $38                                         ; $49ef: $ff
	sbc  $ff                                         ; $49f0: $de $ff
	rst  $18                                         ; $49f2: $df
	rst  $38                                         ; $49f3: $ff
	rst  $38                                         ; $49f4: $ff
	rst  $38                                         ; $49f5: $ff
	rst  $38                                         ; $49f6: $ff
	rst  $38                                         ; $49f7: $ff
	ld   a, [$ffff]                                  ; $49f8: $fa $ff $ff
	rst  $38                                         ; $49fb: $ff
	rst  $38                                         ; $49fc: $ff
	rst  $38                                         ; $49fd: $ff
	rst  $38                                         ; $49fe: $ff
	rst  $38                                         ; $49ff: $ff
	ld   [hl], l                                     ; $4a00: $75
	adc  a                                           ; $4a01: $8f
	rst  $38                                         ; $4a02: $ff
	rst  $38                                         ; $4a03: $ff
	rst  $38                                         ; $4a04: $ff
	rst  $38                                         ; $4a05: $ff
	rst  $38                                         ; $4a06: $ff
	rst  $38                                         ; $4a07: $ff
	sbc  a                                           ; $4a08: $9f
	rst  $38                                         ; $4a09: $ff
	ld   c, a                                        ; $4a0a: $4f
	rst  $38                                         ; $4a0b: $ff
	sbc  a                                           ; $4a0c: $9f
	rst  $38                                         ; $4a0d: $ff
	rst  $08                                         ; $4a0e: $cf
	rst  $38                                         ; $4a0f: $ff
	pop  bc                                          ; $4a10: $c1
	rst  $38                                         ; $4a11: $ff
	rst  $38                                         ; $4a12: $ff
	rst  $38                                         ; $4a13: $ff
	rst  $38                                         ; $4a14: $ff
	rst  $38                                         ; $4a15: $ff
	rst  $38                                         ; $4a16: $ff
	rst  $38                                         ; $4a17: $ff
	db   $f4                                         ; $4a18: $f4
	rst  $38                                         ; $4a19: $ff
	ld   a, [$ffff]                                  ; $4a1a: $fa $ff $ff
	rst  $38                                         ; $4a1d: $ff
	rst  $38                                         ; $4a1e: $ff
	rst  $38                                         ; $4a1f: $ff
	nop                                              ; $4a20: $00
	rst  $38                                         ; $4a21: $ff
	rst  $38                                         ; $4a22: $ff
	rst  $38                                         ; $4a23: $ff
	rst  $38                                         ; $4a24: $ff
	rst  $38                                         ; $4a25: $ff
	rst  $38                                         ; $4a26: $ff
	rst  $38                                         ; $4a27: $ff
	ld   e, a                                        ; $4a28: $5f
	rst  $38                                         ; $4a29: $ff
	cp   a                                           ; $4a2a: $bf
	rst  $38                                         ; $4a2b: $ff
	ld   a, a                                        ; $4a2c: $7f
	rst  $38                                         ; $4a2d: $ff
	cp   a                                           ; $4a2e: $bf
	rst  $38                                         ; $4a2f: $ff
	nop                                              ; $4a30: $00
	rst  $38                                         ; $4a31: $ff
	rst  $38                                         ; $4a32: $ff
	rst  $38                                         ; $4a33: $ff
	rst  $38                                         ; $4a34: $ff
	rst  $38                                         ; $4a35: $ff
	rst  $38                                         ; $4a36: $ff
	rst  $38                                         ; $4a37: $ff
	cp   a                                           ; $4a38: $bf
	rst  $38                                         ; $4a39: $ff
	ld   a, a                                        ; $4a3a: $7f
	rst  $38                                         ; $4a3b: $ff
	cp   a                                           ; $4a3c: $bf
	rst  $38                                         ; $4a3d: $ff
	rst  $38                                         ; $4a3e: $ff
	rst  $38                                         ; $4a3f: $ff
	xor  a                                           ; $4a40: $af
	rra                                              ; $4a41: $1f
	ld   d, d                                        ; $4a42: $52
	rrca                                             ; $4a43: $0f
	and  a                                           ; $4a44: $a7
	rrca                                             ; $4a45: $0f
	ld   d, l                                        ; $4a46: $55
	inc  bc                                          ; $4a47: $03
	xor  b                                           ; $4a48: $a8
	rlca                                             ; $4a49: $07
	rlca                                             ; $4a4a: $07
	rst  $38                                         ; $4a4b: $ff
	rst  $38                                         ; $4a4c: $ff
	rst  $38                                         ; $4a4d: $ff
	rst  $38                                         ; $4a4e: $ff

jr_095_4a4f:
	rst  $38                                         ; $4a4f: $ff
	db   $dd                                         ; $4a50: $dd
	rst  $38                                         ; $4a51: $ff
	rst  $38                                         ; $4a52: $ff
	rst  $38                                         ; $4a53: $ff
	rst  $38                                         ; $4a54: $ff
	rst  $38                                         ; $4a55: $ff
	rst  $38                                         ; $4a56: $ff
	rst  $38                                         ; $4a57: $ff
	rst  $38                                         ; $4a58: $ff
	rst  $38                                         ; $4a59: $ff
	rst  $38                                         ; $4a5a: $ff
	rst  $38                                         ; $4a5b: $ff
	cp   $ff                                         ; $4a5c: $fe $ff
	rst  $38                                         ; $4a5e: $ff
	rst  $38                                         ; $4a5f: $ff
	rst  $38                                         ; $4a60: $ff
	rst  $38                                         ; $4a61: $ff
	rst  $38                                         ; $4a62: $ff
	rst  $38                                         ; $4a63: $ff
	rst  $38                                         ; $4a64: $ff
	rst  $38                                         ; $4a65: $ff
	rst  $38                                         ; $4a66: $ff
	rst  $38                                         ; $4a67: $ff
	rst  $38                                         ; $4a68: $ff
	rst  $38                                         ; $4a69: $ff
	rst  $38                                         ; $4a6a: $ff
	rst  $38                                         ; $4a6b: $ff
	rst  $38                                         ; $4a6c: $ff
	rst  $38                                         ; $4a6d: $ff
	rst  $38                                         ; $4a6e: $ff
	rst  $38                                         ; $4a6f: $ff

jr_095_4a70:
	rst  $38                                         ; $4a70: $ff
	rst  $38                                         ; $4a71: $ff
	rst  $28                                         ; $4a72: $ef
	rst  $38                                         ; $4a73: $ff
	rst  $38                                         ; $4a74: $ff
	rst  $38                                         ; $4a75: $ff
	rst  $38                                         ; $4a76: $ff
	rst  $38                                         ; $4a77: $ff
	rst  $38                                         ; $4a78: $ff
	rst  $38                                         ; $4a79: $ff
	rst  $38                                         ; $4a7a: $ff
	rst  $38                                         ; $4a7b: $ff
	db   $fc                                         ; $4a7c: $fc
	rst  $38                                         ; $4a7d: $ff
	ret  nc                                          ; $4a7e: $d0

	rst  $38                                         ; $4a7f: $ff
	rst  $38                                         ; $4a80: $ff
	rst  $38                                         ; $4a81: $ff
	rst  $38                                         ; $4a82: $ff
	rst  $38                                         ; $4a83: $ff
	rst  $38                                         ; $4a84: $ff
	rst  $38                                         ; $4a85: $ff
	rst  $38                                         ; $4a86: $ff
	rst  $38                                         ; $4a87: $ff
	rst  $38                                         ; $4a88: $ff
	rst  $38                                         ; $4a89: $ff
	ldh  [rIE], a                                    ; $4a8a: $e0 $ff
	dec  d                                           ; $4a8c: $15
	ld   [$f50a], a                                  ; $4a8d: $ea $0a $f5
	rst  $38                                         ; $4a90: $ff
	rst  $38                                         ; $4a91: $ff
	rst  $38                                         ; $4a92: $ff
	rst  $38                                         ; $4a93: $ff
	rst  $38                                         ; $4a94: $ff
	rst  $38                                         ; $4a95: $ff
	ldh  a, [c]                                      ; $4a96: $f2
	db   $fd                                         ; $4a97: $fd
	sub  l                                           ; $4a98: $95
	ld   [$55aa], a                                  ; $4a99: $ea $aa $55
	ld   d, l                                        ; $4a9c: $55
	xor  d                                           ; $4a9d: $aa
	xor  d                                           ; $4a9e: $aa
	ld   d, l                                        ; $4a9f: $55
	rst  $38                                         ; $4aa0: $ff
	rst  $38                                         ; $4aa1: $ff
	ld   hl, sp-$01                                  ; $4aa2: $f8 $ff
	add  b                                           ; $4aa4: $80
	rst  $38                                         ; $4aa5: $ff
	xor  d                                           ; $4aa6: $aa
	ld   d, l                                        ; $4aa7: $55
	ld   d, h                                        ; $4aa8: $54
	xor  e                                           ; $4aa9: $ab
	xor  d                                           ; $4aaa: $aa
	ld   d, l                                        ; $4aab: $55
	ld   d, l                                        ; $4aac: $55
	xor  d                                           ; $4aad: $aa
	xor  d                                           ; $4aae: $aa
	ld   d, l                                        ; $4aaf: $55
	ld   d, e                                        ; $4ab0: $53
	nop                                              ; $4ab1: $00
	ld   d, $00                                      ; $4ab2: $16 $00
	jr   jr_095_4ab6                                 ; $4ab4: $18 $00

jr_095_4ab6:
	ld   e, h                                        ; $4ab6: $5c
	jr   nz, jr_095_4aee                             ; $4ab7: $20 $35

	ld   [hl+], a                                    ; $4ab9: $22
	ccf                                              ; $4aba: $3f
	nop                                              ; $4abb: $00
	ld   a, b                                        ; $4abc: $78
	nop                                              ; $4abd: $00
	di                                               ; $4abe: $f3
	nop                                              ; $4abf: $00
	sbc  b                                           ; $4ac0: $98
	jr   nc, jr_095_4afd                             ; $4ac1: $30 $3a

	dec  e                                           ; $4ac3: $1d
	sbc  a                                           ; $4ac4: $9f
	jr   c, jr_095_4a4f                              ; $4ac5: $38 $88

	jr   nc, jr_095_4ad4                             ; $4ac7: $30 $0b

	jr   nc, jr_095_4a70                             ; $4ac9: $30 $a5

	ld   a, [de]                                     ; $4acb: $1a
	ld   hl, $f0fe                                   ; $4acc: $21 $fe $f0
	cp   $00                                         ; $4acf: $fe $00
	nop                                              ; $4ad1: $00
	adc  e                                           ; $4ad2: $8b
	inc  b                                           ; $4ad3: $04

jr_095_4ad4:
	cpl                                              ; $4ad4: $2f
	rra                                              ; $4ad5: $1f
	ccf                                              ; $4ad6: $3f
	ld   a, a                                        ; $4ad7: $7f
	rst  $38                                         ; $4ad8: $ff
	ld   a, a                                        ; $4ad9: $7f
	rst  $38                                         ; $4ada: $ff
	ld   a, a                                        ; $4adb: $7f
	rst  $38                                         ; $4adc: $ff
	ld   a, a                                        ; $4add: $7f
	rst  $38                                         ; $4ade: $ff
	ld   a, a                                        ; $4adf: $7f
	nop                                              ; $4ae0: $00
	nop                                              ; $4ae1: $00
	inc  b                                           ; $4ae2: $04
	rst  $38                                         ; $4ae3: $ff
	rst  $38                                         ; $4ae4: $ff
	rst  $38                                         ; $4ae5: $ff
	rst  $38                                         ; $4ae6: $ff
	rst  $38                                         ; $4ae7: $ff
	rst  $38                                         ; $4ae8: $ff
	rst  $38                                         ; $4ae9: $ff
	cp   $ff                                         ; $4aea: $fe $ff
	cp   $ff                                         ; $4aec: $fe $ff

jr_095_4aee:
	cp   $ff                                         ; $4aee: $fe $ff
	nop                                              ; $4af0: $00
	nop                                              ; $4af1: $00
	rlca                                             ; $4af2: $07
	ld   hl, sp-$01                                  ; $4af3: $f8 $ff
	rst  $38                                         ; $4af5: $ff
	rst  $38                                         ; $4af6: $ff
	rst  $38                                         ; $4af7: $ff
	rst  $38                                         ; $4af8: $ff
	rst  $38                                         ; $4af9: $ff
	ld   a, a                                        ; $4afa: $7f
	rst  $38                                         ; $4afb: $ff
	ld   [hl], e                                     ; $4afc: $73

jr_095_4afd:
	rst  $38                                         ; $4afd: $ff
	ld   a, a                                        ; $4afe: $7f
	rst  $38                                         ; $4aff: $ff
	nop                                              ; $4b00: $00
	nop                                              ; $4b01: $00
	pop  bc                                          ; $4b02: $c1
	nop                                              ; $4b03: $00
	call z, $fcf0                                    ; $4b04: $cc $f0 $fc
	rst  $38                                         ; $4b07: $ff
	rst  $38                                         ; $4b08: $ff
	rst  $38                                         ; $4b09: $ff
	rst  $38                                         ; $4b0a: $ff
	rst  $38                                         ; $4b0b: $ff
	pop  af                                          ; $4b0c: $f1
	rst  $38                                         ; $4b0d: $ff
	rst  $18                                         ; $4b0e: $df
	rst  $38                                         ; $4b0f: $ff
	nop                                              ; $4b10: $00
	nop                                              ; $4b11: $00
	call z, $3a33                                    ; $4b12: $cc $33 $3a
	rlca                                             ; $4b15: $07
	adc  d                                           ; $4b16: $8a
	nop                                              ; $4b17: $00
	sub  b                                           ; $4b18: $90
	ret  z                                           ; $4b19: $c8

	rst  JumpTableTrashDE                                         ; $4b1a: $c7
	add  sp, -$19                                    ; $4b1b: $e8 $e7
	add  sp, -$1f                                    ; $4b1d: $e8 $e1
	xor  $83                                         ; $4b1f: $ee $83
	nop                                              ; $4b21: $00
	jr   c, @-$37                                    ; $4b22: $38 $c7

	rst  $30                                         ; $4b24: $f7
	rst  $38                                         ; $4b25: $ff
	rst  $18                                         ; $4b26: $df
	rst  $38                                         ; $4b27: $ff
	or   $ff                                         ; $4b28: $f6 $ff
	db   $dd                                         ; $4b2a: $dd
	cp   $da                                         ; $4b2b: $fe $da
	db   $fd                                         ; $4b2d: $fd
	inc  sp                                          ; $4b2e: $33
	db   $fc                                         ; $4b2f: $fc
	db   $e4                                         ; $4b30: $e4
	cp   $81                                         ; $4b31: $fe $81
	cp   $e5                                         ; $4b33: $fe $e5
	sbc  d                                           ; $4b35: $9a
	ld   e, c                                        ; $4b36: $59
	and  [hl]                                        ; $4b37: $a6
	dec  l                                           ; $4b38: $2d
	add  $5d                                         ; $4b39: $c6 $5d
	add  [hl]                                        ; $4b3b: $86
	ret                                              ; $4b3c: $c9


	ld   [hl], $d9                                   ; $4b3d: $36 $d9
	ld   h, $ff                                      ; $4b3f: $26 $ff
	ld   a, a                                        ; $4b41: $7f
	rst  $38                                         ; $4b42: $ff
	ld   a, a                                        ; $4b43: $7f
	rst  $38                                         ; $4b44: $ff
	ld   a, a                                        ; $4b45: $7f
	rst  $38                                         ; $4b46: $ff
	ld   a, a                                        ; $4b47: $7f
	rst  $38                                         ; $4b48: $ff
	ld   a, a                                        ; $4b49: $7f
	rst  $38                                         ; $4b4a: $ff
	ld   a, a                                        ; $4b4b: $7f
	rst  $38                                         ; $4b4c: $ff
	ld   a, a                                        ; $4b4d: $7f
	rst  $38                                         ; $4b4e: $ff
	ld   a, a                                        ; $4b4f: $7f
	rst  $38                                         ; $4b50: $ff
	rst  $38                                         ; $4b51: $ff
	rst  $38                                         ; $4b52: $ff
	rst  $38                                         ; $4b53: $ff
	rst  $38                                         ; $4b54: $ff
	rst  $38                                         ; $4b55: $ff
	rst  $38                                         ; $4b56: $ff
	rst  $38                                         ; $4b57: $ff
	rst  $38                                         ; $4b58: $ff
	rst  $38                                         ; $4b59: $ff
	rst  $38                                         ; $4b5a: $ff
	rst  $38                                         ; $4b5b: $ff
	rst  $38                                         ; $4b5c: $ff
	rst  $38                                         ; $4b5d: $ff
	rst  $38                                         ; $4b5e: $ff
	rst  $38                                         ; $4b5f: $ff
	rst  $38                                         ; $4b60: $ff
	rst  $38                                         ; $4b61: $ff
	rst  $38                                         ; $4b62: $ff
	rst  $38                                         ; $4b63: $ff
	rst  $38                                         ; $4b64: $ff
	rst  $38                                         ; $4b65: $ff
	rst  $38                                         ; $4b66: $ff
	rst  $38                                         ; $4b67: $ff
	rst  $38                                         ; $4b68: $ff
	rst  $38                                         ; $4b69: $ff
	rst  $38                                         ; $4b6a: $ff
	rst  $38                                         ; $4b6b: $ff
	rst  $38                                         ; $4b6c: $ff
	rst  $38                                         ; $4b6d: $ff
	rst  $38                                         ; $4b6e: $ff
	rst  $38                                         ; $4b6f: $ff
	rst  $38                                         ; $4b70: $ff
	rst  $38                                         ; $4b71: $ff
	rst  $38                                         ; $4b72: $ff
	rst  $38                                         ; $4b73: $ff
	rst  $38                                         ; $4b74: $ff
	rst  $38                                         ; $4b75: $ff
	rst  $38                                         ; $4b76: $ff
	rst  $38                                         ; $4b77: $ff
	rst  $38                                         ; $4b78: $ff
	rst  $38                                         ; $4b79: $ff
	rst  $38                                         ; $4b7a: $ff
	rst  $38                                         ; $4b7b: $ff
	rst  $38                                         ; $4b7c: $ff
	rst  $38                                         ; $4b7d: $ff
	rst  $38                                         ; $4b7e: $ff
	rst  $38                                         ; $4b7f: $ff
	ld   [$c7e7], a                                  ; $4b80: $ea $e7 $c7
	rst  $28                                         ; $4b83: $ef
	rst  JumpTableTrashDE                                         ; $4b84: $c7
	rst  $28                                         ; $4b85: $ef
	rst  $30                                         ; $4b86: $f7
	rst  $28                                         ; $4b87: $ef
	or   $ef                                         ; $4b88: $f6 $ef
	rst  $30                                         ; $4b8a: $f7
	rst  $28                                         ; $4b8b: $ef
	rst  $30                                         ; $4b8c: $f7
	rst  $28                                         ; $4b8d: $ef
	rst  $30                                         ; $4b8e: $f7
	rst  $28                                         ; $4b8f: $ef
	pop  hl                                          ; $4b90: $e1
	db   $fc                                         ; $4b91: $fc
	jp   nc, $18ed                                   ; $4b92: $d2 $ed $18

	rst  $20                                         ; $4b95: $e7
	ldh  a, [rIF]                                    ; $4b96: $f0 $0f
	xor  b                                           ; $4b98: $a8
	ld   e, a                                        ; $4b99: $5f
	inc  c                                           ; $4b9a: $0c
	rst  $38                                         ; $4b9b: $ff
	dec  l                                           ; $4b9c: $2d
	rst  $38                                         ; $4b9d: $ff
	inc  a                                           ; $4b9e: $3c
	rst  $38                                         ; $4b9f: $ff
	ld   e, c                                        ; $4ba0: $59
	and  [hl]                                        ; $4ba1: $a6
	adc  c                                           ; $4ba2: $89
	or   $a9                                         ; $4ba3: $f6 $a9
	or   $a9                                         ; $4ba5: $f6 $a9
	or   $ad                                         ; $4ba7: $f6 $ad
	or   $a9                                         ; $4ba9: $f6 $a9
	or   $99                                         ; $4bab: $f6 $99
	and  $a9                                         ; $4bad: $e6 $a9
	or   $ff                                         ; $4baf: $f6 $ff
	ld   a, a                                        ; $4bb1: $7f
	rst  $38                                         ; $4bb2: $ff
	ld   a, a                                        ; $4bb3: $7f
	rst  $38                                         ; $4bb4: $ff
	ld   a, a                                        ; $4bb5: $7f
	rst  $38                                         ; $4bb6: $ff
	ld   a, a                                        ; $4bb7: $7f
	rst  $38                                         ; $4bb8: $ff
	ld   a, a                                        ; $4bb9: $7f
	rst  $38                                         ; $4bba: $ff
	ld   a, a                                        ; $4bbb: $7f
	rst  $38                                         ; $4bbc: $ff
	ld   a, a                                        ; $4bbd: $7f
	rst  $38                                         ; $4bbe: $ff
	ld   a, a                                        ; $4bbf: $7f
	rst  $38                                         ; $4bc0: $ff
	rst  $38                                         ; $4bc1: $ff
	rst  $38                                         ; $4bc2: $ff
	rst  $38                                         ; $4bc3: $ff
	rst  $38                                         ; $4bc4: $ff
	rst  $38                                         ; $4bc5: $ff
	rst  $38                                         ; $4bc6: $ff
	rst  $38                                         ; $4bc7: $ff
	rst  $38                                         ; $4bc8: $ff
	rst  $38                                         ; $4bc9: $ff
	rst  $38                                         ; $4bca: $ff
	rst  $38                                         ; $4bcb: $ff
	rst  $38                                         ; $4bcc: $ff
	rst  $38                                         ; $4bcd: $ff
	rst  $38                                         ; $4bce: $ff
	rst  $38                                         ; $4bcf: $ff
	rst  $38                                         ; $4bd0: $ff
	rst  $38                                         ; $4bd1: $ff
	rst  $38                                         ; $4bd2: $ff
	rst  $38                                         ; $4bd3: $ff
	rst  $38                                         ; $4bd4: $ff
	rst  $38                                         ; $4bd5: $ff
	rst  $38                                         ; $4bd6: $ff
	rst  $38                                         ; $4bd7: $ff
	rst  $38                                         ; $4bd8: $ff
	rst  $38                                         ; $4bd9: $ff
	rst  $38                                         ; $4bda: $ff
	rst  $38                                         ; $4bdb: $ff
	rst  $38                                         ; $4bdc: $ff
	rst  $38                                         ; $4bdd: $ff
	rst  $38                                         ; $4bde: $ff
	rst  $38                                         ; $4bdf: $ff
	rst  $38                                         ; $4be0: $ff
	rst  $38                                         ; $4be1: $ff
	rst  $38                                         ; $4be2: $ff
	rst  $38                                         ; $4be3: $ff
	rst  $38                                         ; $4be4: $ff
	rst  $38                                         ; $4be5: $ff
	rst  $38                                         ; $4be6: $ff
	rst  $38                                         ; $4be7: $ff
	rst  $38                                         ; $4be8: $ff
	rst  $38                                         ; $4be9: $ff
	rst  $38                                         ; $4bea: $ff
	rst  $38                                         ; $4beb: $ff
	rst  $38                                         ; $4bec: $ff
	rst  $38                                         ; $4bed: $ff
	rst  $38                                         ; $4bee: $ff
	rst  $38                                         ; $4bef: $ff
	rst  $30                                         ; $4bf0: $f7
	rst  $28                                         ; $4bf1: $ef
	rst  $30                                         ; $4bf2: $f7
	rst  $28                                         ; $4bf3: $ef
	or   $ef                                         ; $4bf4: $f6 $ef
	or   $ef                                         ; $4bf6: $f6 $ef
	xor  $e7                                         ; $4bf8: $ee $e7
	rst  $38                                         ; $4bfa: $ff
	rst  $20                                         ; $4bfb: $e7
	rst  $38                                         ; $4bfc: $ff
	rst  $20                                         ; $4bfd: $e7
	rst  $28                                         ; $4bfe: $ef
	rst  $20                                         ; $4bff: $e7
	ld   [hl], h                                     ; $4c00: $74
	rst  $38                                         ; $4c01: $ff
	jr   nz, @+$01                                   ; $4c02: $20 $ff

	nop                                              ; $4c04: $00
	rst  $38                                         ; $4c05: $ff
	nop                                              ; $4c06: $00
	rst  $38                                         ; $4c07: $ff
	add  c                                           ; $4c08: $81
	rst  $38                                         ; $4c09: $ff
	add  b                                           ; $4c0a: $80
	rst  $38                                         ; $4c0b: $ff
	ldh  [rIE], a                                    ; $4c0c: $e0 $ff
	ld   hl, sp-$01                                  ; $4c0e: $f8 $ff
	and  c                                           ; $4c10: $a1
	cp   $01                                         ; $4c11: $fe $01
	cp   $01                                         ; $4c13: $fe $01
	cp   $41                                         ; $4c15: $fe $41
	cp   $c3                                         ; $4c17: $fe $c3
	cp   $83                                         ; $4c19: $fe $83
	cp   $03                                         ; $4c1b: $fe $03
	cp   $03                                         ; $4c1d: $fe $03
	cp   $c0                                         ; $4c1f: $fe $c0
	ld   a, a                                        ; $4c21: $7f
	ret  nz                                          ; $4c22: $c0

	ld   a, a                                        ; $4c23: $7f
	ret  nz                                          ; $4c24: $c0

	ld   a, a                                        ; $4c25: $7f
	ret  nz                                          ; $4c26: $c0

	ld   a, a                                        ; $4c27: $7f
	ret  nz                                          ; $4c28: $c0

	ld   a, a                                        ; $4c29: $7f
	ld   sp, hl                                      ; $4c2a: $f9
	ld   a, [hl]                                     ; $4c2b: $7e
	ld   a, [$7a7c]                                  ; $4c2c: $fa $7c $7a
	ld   a, h                                        ; $4c2f: $7c
	nop                                              ; $4c30: $00
	rst  $38                                         ; $4c31: $ff
	nop                                              ; $4c32: $00
	rst  $38                                         ; $4c33: $ff
	nop                                              ; $4c34: $00
	rst  $38                                         ; $4c35: $ff
	nop                                              ; $4c36: $00
	rst  $38                                         ; $4c37: $ff
	nop                                              ; $4c38: $00
	rst  $38                                         ; $4c39: $ff
	adc  a                                           ; $4c3a: $8f
	ld   a, a                                        ; $4c3b: $7f
	ld   e, a                                        ; $4c3c: $5f
	ccf                                              ; $4c3d: $3f
	ld   e, a                                        ; $4c3e: $5f
	ccf                                              ; $4c3f: $3f
	nop                                              ; $4c40: $00
	rst  $38                                         ; $4c41: $ff
	nop                                              ; $4c42: $00
	rst  $38                                         ; $4c43: $ff
	nop                                              ; $4c44: $00
	rst  $38                                         ; $4c45: $ff
	nop                                              ; $4c46: $00
	rst  $38                                         ; $4c47: $ff
	nop                                              ; $4c48: $00
	rst  $38                                         ; $4c49: $ff
	rst  $38                                         ; $4c4a: $ff
	rst  $38                                         ; $4c4b: $ff
	rst  $38                                         ; $4c4c: $ff
	rst  $38                                         ; $4c4d: $ff
	rst  $38                                         ; $4c4e: $ff
	rst  $38                                         ; $4c4f: $ff
	nop                                              ; $4c50: $00

jr_095_4c51:
	rst  $38                                         ; $4c51: $ff
	ld   d, l                                        ; $4c52: $55
	xor  d                                           ; $4c53: $aa
	nop                                              ; $4c54: $00
	rst  $38                                         ; $4c55: $ff
	nop                                              ; $4c56: $00
	rst  $38                                         ; $4c57: $ff
	nop                                              ; $4c58: $00
	rst  $38                                         ; $4c59: $ff
	sbc  c                                           ; $4c5a: $99
	rst  $20                                         ; $4c5b: $e7
	and  a                                           ; $4c5c: $a7
	jp   $c3a7                                       ; $4c5d: $c3 $a7 $c3


	ld   a, $e7                                      ; $4c60: $3e $e7
	ccf                                              ; $4c62: $3f
	rst  $20                                         ; $4c63: $e7
	ccf                                              ; $4c64: $3f
	rst  $20                                         ; $4c65: $e7
	ccf                                              ; $4c66: $3f
	rst  $20                                         ; $4c67: $e7
	jr   c, jr_095_4c51                              ; $4c68: $38 $e7

	rst  $38                                         ; $4c6a: $ff
	rst  $20                                         ; $4c6b: $e7
	rst  $38                                         ; $4c6c: $ff
	rst  $20                                         ; $4c6d: $e7
	rst  $38                                         ; $4c6e: $ff
	rst  $20                                         ; $4c6f: $e7
	db   $fc                                         ; $4c70: $fc
	rst  $38                                         ; $4c71: $ff
	cp   $ff                                         ; $4c72: $fe $ff
	rst  $38                                         ; $4c74: $ff
	rst  $38                                         ; $4c75: $ff
	rst  $38                                         ; $4c76: $ff
	rst  $38                                         ; $4c77: $ff
	rst  $38                                         ; $4c78: $ff
	rst  $38                                         ; $4c79: $ff
	rst  $38                                         ; $4c7a: $ff
	rst  $38                                         ; $4c7b: $ff
	rst  $38                                         ; $4c7c: $ff
	rst  $38                                         ; $4c7d: $ff
	rst  $38                                         ; $4c7e: $ff
	rst  $38                                         ; $4c7f: $ff
	inc  bc                                          ; $4c80: $03
	cp   $21                                         ; $4c81: $fe $21
	cp   $83                                         ; $4c83: $fe $83
	cp   $e3                                         ; $4c85: $fe $e3
	cp   $f1                                         ; $4c87: $fe $f1
	cp   $f9                                         ; $4c89: $fe $f9
	cp   $fe                                         ; $4c8b: $fe $fe
	rst  $38                                         ; $4c8d: $ff
	rst  $38                                         ; $4c8e: $ff
	rst  $38                                         ; $4c8f: $ff
	ld   bc, $3f7e                                   ; $4c90: $01 $7e $3f
	nop                                              ; $4c93: $00
	ld   b, b                                        ; $4c94: $40
	nop                                              ; $4c95: $00
	ld   b, b                                        ; $4c96: $40
	nop                                              ; $4c97: $00
	cp   c                                           ; $4c98: $b9
	ld   b, a                                        ; $4c99: $47
	adc  a                                           ; $4c9a: $8f
	ld   a, a                                        ; $4c9b: $7f
	ret  nz                                          ; $4c9c: $c0

	ccf                                              ; $4c9d: $3f
	rst  $38                                         ; $4c9e: $ff
	rst  $38                                         ; $4c9f: $ff
	add  b                                           ; $4ca0: $80
	ld   a, a                                        ; $4ca1: $7f
	rst  $38                                         ; $4ca2: $ff
	nop                                              ; $4ca3: $00
	nop                                              ; $4ca4: $00
	nop                                              ; $4ca5: $00
	nop                                              ; $4ca6: $00
	nop                                              ; $4ca7: $00
	nop                                              ; $4ca8: $00

jr_095_4ca9:
	rst  $38                                         ; $4ca9: $ff
	rst  $38                                         ; $4caa: $ff
	rst  $38                                         ; $4cab: $ff
	ld   a, a                                        ; $4cac: $7f
	rst  $38                                         ; $4cad: $ff
	rst  $38                                         ; $4cae: $ff
	rst  $38                                         ; $4caf: $ff
	nop                                              ; $4cb0: $00
	rst  $38                                         ; $4cb1: $ff
	rst  $38                                         ; $4cb2: $ff
	nop                                              ; $4cb3: $00
	nop                                              ; $4cb4: $00
	nop                                              ; $4cb5: $00
	nop                                              ; $4cb6: $00
	nop                                              ; $4cb7: $00
	db   $10                                         ; $4cb8: $10
	rst  $38                                         ; $4cb9: $ff
	rst  $38                                         ; $4cba: $ff
	rst  $38                                         ; $4cbb: $ff
	rst  $38                                         ; $4cbc: $ff
	rst  $38                                         ; $4cbd: $ff
	ld   a, a                                        ; $4cbe: $7f
	rst  $38                                         ; $4cbf: $ff
	jr   jr_095_4ca9                                 ; $4cc0: $18 $e7

	rst  $38                                         ; $4cc2: $ff
	nop                                              ; $4cc3: $00
	ld   [bc], a                                     ; $4cc4: $02
	nop                                              ; $4cc5: $00
	ld   bc, $0000                                   ; $4cc6: $01 $00 $00
	rst  $38                                         ; $4cc9: $ff
	ld   hl, sp-$01                                  ; $4cca: $f8 $ff
	ld   sp, hl                                      ; $4ccc: $f9
	rst  $38                                         ; $4ccd: $ff
	rst  $38                                         ; $4cce: $ff
	rst  $38                                         ; $4ccf: $ff
	rla                                              ; $4cd0: $17
	rst  $28                                         ; $4cd1: $ef
	rst  $30                                         ; $4cd2: $f7
	rrca                                             ; $4cd3: $0f
	or   a                                           ; $4cd4: $b7
	rrca                                             ; $4cd5: $0f
	ld   [hl], a                                     ; $4cd6: $77
	rrca                                             ; $4cd7: $0f
	rla                                              ; $4cd8: $17
	rst  $28                                         ; $4cd9: $ef
	ld   [hl], a                                     ; $4cda: $77
	adc  a                                           ; $4cdb: $8f
	adc  a                                           ; $4cdc: $8f
	rst  $38                                         ; $4cdd: $ff
	db   $fd                                         ; $4cde: $fd
	rst  $38                                         ; $4cdf: $ff
	rst  $38                                         ; $4ce0: $ff
	rst  $38                                         ; $4ce1: $ff
	rst  $38                                         ; $4ce2: $ff
	rst  $38                                         ; $4ce3: $ff
	rst  $38                                         ; $4ce4: $ff
	rst  $38                                         ; $4ce5: $ff
	rst  $38                                         ; $4ce6: $ff
	rst  $38                                         ; $4ce7: $ff
	sbc  a                                           ; $4ce8: $9f
	rst  $38                                         ; $4ce9: $ff
	rst  $38                                         ; $4cea: $ff
	rrca                                             ; $4ceb: $0f
	rst  $20                                         ; $4cec: $e7
	rra                                              ; $4ced: $1f
	rrca                                             ; $4cee: $0f
	rst  $38                                         ; $4cef: $ff
	rst  $38                                         ; $4cf0: $ff
	rst  $38                                         ; $4cf1: $ff
	rst  $38                                         ; $4cf2: $ff
	rst  $38                                         ; $4cf3: $ff
	rst  $38                                         ; $4cf4: $ff
	rst  $38                                         ; $4cf5: $ff
	rst  $38                                         ; $4cf6: $ff
	rst  $38                                         ; $4cf7: $ff
	rst  $38                                         ; $4cf8: $ff
	rst  $38                                         ; $4cf9: $ff
	rst  $38                                         ; $4cfa: $ff
	rst  $38                                         ; $4cfb: $ff
	rst  $38                                         ; $4cfc: $ff
	rst  $38                                         ; $4cfd: $ff
	rst  $38                                         ; $4cfe: $ff
	rst  $38                                         ; $4cff: $ff
	rst  $38                                         ; $4d00: $ff
	rst  $38                                         ; $4d01: $ff
	rst  $38                                         ; $4d02: $ff
	rst  $38                                         ; $4d03: $ff
	sbc  a                                           ; $4d04: $9f
	rst  $38                                         ; $4d05: $ff
	rst  $18                                         ; $4d06: $df
	rst  $38                                         ; $4d07: $ff
	ldh  [rIE], a                                    ; $4d08: $e0 $ff
	or   h                                           ; $4d0a: $b4
	rst  $38                                         ; $4d0b: $ff
	ld   [$f4ff], a                                  ; $4d0c: $ea $ff $f4
	rst  $38                                         ; $4d0f: $ff
	rst  $38                                         ; $4d10: $ff
	rst  $38                                         ; $4d11: $ff
	sbc  a                                           ; $4d12: $9f
	rst  $38                                         ; $4d13: $ff
	rst  $38                                         ; $4d14: $ff
	rst  $38                                         ; $4d15: $ff
	ldh  a, [c]                                      ; $4d16: $f2
	rst  $38                                         ; $4d17: $ff
	nop                                              ; $4d18: $00
	rst  $38                                         ; $4d19: $ff
	xor  l                                           ; $4d1a: $ad
	rst  $38                                         ; $4d1b: $ff
	or   a                                           ; $4d1c: $b7
	rst  $38                                         ; $4d1d: $ff
	xor  l                                           ; $4d1e: $ad
	rst  $38                                         ; $4d1f: $ff
	rst  $38                                         ; $4d20: $ff
	rst  $38                                         ; $4d21: $ff
	rst  $38                                         ; $4d22: $ff
	rst  $38                                         ; $4d23: $ff
	rst  $38                                         ; $4d24: $ff
	rst  $38                                         ; $4d25: $ff
	ld   d, d                                        ; $4d26: $52
	rst  $38                                         ; $4d27: $ff
	nop                                              ; $4d28: $00
	rst  $38                                         ; $4d29: $ff
	ld   a, e                                        ; $4d2a: $7b
	rst  $38                                         ; $4d2b: $ff
	ld   d, l                                        ; $4d2c: $55
	rst  $38                                         ; $4d2d: $ff
	rst  $38                                         ; $4d2e: $ff
	rst  $38                                         ; $4d2f: $ff
	rst  $38                                         ; $4d30: $ff
	rst  $38                                         ; $4d31: $ff
	rst  $38                                         ; $4d32: $ff
	rst  $38                                         ; $4d33: $ff
	rst  $38                                         ; $4d34: $ff
	rst  $38                                         ; $4d35: $ff
	ld   b, b                                        ; $4d36: $40
	rst  $38                                         ; $4d37: $ff
	ld   hl, $4bff                                   ; $4d38: $21 $ff $4b
	rst  $38                                         ; $4d3b: $ff
	and  d                                           ; $4d3c: $a2
	rst  $38                                         ; $4d3d: $ff
	ld   l, e                                        ; $4d3e: $6b
	rst  $38                                         ; $4d3f: $ff
	rst  $38                                         ; $4d40: $ff
	rst  $38                                         ; $4d41: $ff
	db   $db                                         ; $4d42: $db
	rst  $38                                         ; $4d43: $ff
	rst  $38                                         ; $4d44: $ff
	rst  $38                                         ; $4d45: $ff
	cp   a                                           ; $4d46: $bf
	rst  $38                                         ; $4d47: $ff
	rst  $38                                         ; $4d48: $ff
	rst  $38                                         ; $4d49: $ff
	rst  $38                                         ; $4d4a: $ff
	rst  $38                                         ; $4d4b: $ff
	rst  $38                                         ; $4d4c: $ff
	rst  $38                                         ; $4d4d: $ff
	rst  $38                                         ; $4d4e: $ff
	rst  $38                                         ; $4d4f: $ff
	ld   b, b                                        ; $4d50: $40
	nop                                              ; $4d51: $00
	jr   nz, jr_095_4d54                             ; $4d52: $20 $00

jr_095_4d54:
	ld   a, [bc]                                     ; $4d54: $0a
	nop                                              ; $4d55: $00
	stop                                             ; $4d56: $10 $00
	ld   a, [bc]                                     ; $4d58: $0a
	nop                                              ; $4d59: $00
	nop                                              ; $4d5a: $00
	nop                                              ; $4d5b: $00
	nop                                              ; $4d5c: $00
	nop                                              ; $4d5d: $00
	and  c                                           ; $4d5e: $a1
	inc  bc                                          ; $4d5f: $03
	inc  b                                           ; $4d60: $04
	nop                                              ; $4d61: $00
	ld   [bc], a                                     ; $4d62: $02
	nop                                              ; $4d63: $00
	ld   e, b                                        ; $4d64: $58
	nop                                              ; $4d65: $00
	ret  c                                           ; $4d66: $d8

	nop                                              ; $4d67: $00
	rlca                                             ; $4d68: $07
	nop                                              ; $4d69: $00
	rlca                                             ; $4d6a: $07
	rra                                              ; $4d6b: $1f
	cp   a                                           ; $4d6c: $bf
	ld   a, a                                        ; $4d6d: $7f
	rst  $38                                         ; $4d6e: $ff
	rst  $38                                         ; $4d6f: $ff
	nop                                              ; $4d70: $00
	nop                                              ; $4d71: $00
	nop                                              ; $4d72: $00
	nop                                              ; $4d73: $00
	nop                                              ; $4d74: $00
	nop                                              ; $4d75: $00
	inc  b                                           ; $4d76: $04
	inc  bc                                          ; $4d77: $03
	sbc  a                                           ; $4d78: $9f
	ld   a, a                                        ; $4d79: $7f
	rst  $38                                         ; $4d7a: $ff
	rst  $38                                         ; $4d7b: $ff
	rst  $38                                         ; $4d7c: $ff
	rst  $38                                         ; $4d7d: $ff
	rst  $38                                         ; $4d7e: $ff
	rst  $38                                         ; $4d7f: $ff
	nop                                              ; $4d80: $00
	nop                                              ; $4d81: $00
	nop                                              ; $4d82: $00
	nop                                              ; $4d83: $00
	jr   nz, @+$21                                   ; $4d84: $20 $1f

	rst  $38                                         ; $4d86: $ff
	rst  $38                                         ; $4d87: $ff
	cp   $ff                                         ; $4d88: $fe $ff
	rst  $38                                         ; $4d8a: $ff
	rst  $38                                         ; $4d8b: $ff
	cp   $ff                                         ; $4d8c: $fe $ff
	rst  $38                                         ; $4d8e: $ff
	rst  $38                                         ; $4d8f: $ff
	nop                                              ; $4d90: $00
	nop                                              ; $4d91: $00
	nop                                              ; $4d92: $00
	nop                                              ; $4d93: $00
	ld   b, b                                        ; $4d94: $40
	add  b                                           ; $4d95: $80
	ldh  [$c0], a                                    ; $4d96: $e0 $c0
	ret  nz                                          ; $4d98: $c0

	ldh  [$50], a                                    ; $4d99: $e0 $50
	ldh  [$80], a                                    ; $4d9b: $e0 $80
	ldh  a, [$62]                                    ; $4d9d: $f0 $62
	ldh  a, [rP1]                                    ; $4d9f: $f0 $00
	nop                                              ; $4da1: $00
	nop                                              ; $4da2: $00
	nop                                              ; $4da3: $00
	ld   a, $00                                      ; $4da4: $3e $00
	ld   h, [hl]                                     ; $4da6: $66
	nop                                              ; $4da7: $00
	nop                                              ; $4da8: $00
	nop                                              ; $4da9: $00
	nop                                              ; $4daa: $00
	nop                                              ; $4dab: $00
	nop                                              ; $4dac: $00
	nop                                              ; $4dad: $00
	pop  bc                                          ; $4dae: $c1
	nop                                              ; $4daf: $00
	nop                                              ; $4db0: $00
	nop                                              ; $4db1: $00
	ld   b, b                                        ; $4db2: $40
	nop                                              ; $4db3: $00
	nop                                              ; $4db4: $00
	nop                                              ; $4db5: $00
	ld   b, b                                        ; $4db6: $40
	nop                                              ; $4db7: $00
	stop                                             ; $4db8: $10 $00
	inc  e                                           ; $4dba: $1c
	nop                                              ; $4dbb: $00
	ld   b, $00                                      ; $4dbc: $06 $00
	stop                                             ; $4dbe: $10 $00
	dec  bc                                          ; $4dc0: $0b
	rlca                                             ; $4dc1: $07
	ld   b, a                                        ; $4dc2: $47
	rrca                                             ; $4dc3: $0f
	dec  b                                           ; $4dc4: $05
	rrca                                             ; $4dc5: $0f
	add  a                                           ; $4dc6: $87
	rrca                                             ; $4dc7: $0f
	rrca                                             ; $4dc8: $0f
	rrca                                             ; $4dc9: $0f
	dec  e                                           ; $4dca: $1d
	rrca                                             ; $4dcb: $0f
	dec  e                                           ; $4dcc: $1d
	rrca                                             ; $4dcd: $0f
	sbc  [hl]                                        ; $4dce: $9e
	rrca                                             ; $4dcf: $0f
	rst  $38                                         ; $4dd0: $ff
	rst  $38                                         ; $4dd1: $ff
	rst  $38                                         ; $4dd2: $ff
	rst  $38                                         ; $4dd3: $ff
	rst  $38                                         ; $4dd4: $ff
	rst  $38                                         ; $4dd5: $ff
	rst  $38                                         ; $4dd6: $ff
	rst  $38                                         ; $4dd7: $ff
	rst  $38                                         ; $4dd8: $ff
	rst  $38                                         ; $4dd9: $ff
	rst  $38                                         ; $4dda: $ff
	rst  $38                                         ; $4ddb: $ff
	rst  $38                                         ; $4ddc: $ff
	rst  $38                                         ; $4ddd: $ff
	cp   a                                           ; $4dde: $bf
	rst  $38                                         ; $4ddf: $ff
	rst  $38                                         ; $4de0: $ff
	rst  $38                                         ; $4de1: $ff
	rst  $38                                         ; $4de2: $ff
	rst  $38                                         ; $4de3: $ff
	rst  $38                                         ; $4de4: $ff
	rst  $38                                         ; $4de5: $ff
	rst  $38                                         ; $4de6: $ff
	rst  $38                                         ; $4de7: $ff
	rst  $38                                         ; $4de8: $ff
	rst  $38                                         ; $4de9: $ff
	rst  $38                                         ; $4dea: $ff
	rst  $38                                         ; $4deb: $ff
	rst  $38                                         ; $4dec: $ff
	rst  $38                                         ; $4ded: $ff
	rst  $38                                         ; $4dee: $ff
	rst  $38                                         ; $4def: $ff
	rst  $38                                         ; $4df0: $ff
	rst  $38                                         ; $4df1: $ff
	rst  $38                                         ; $4df2: $ff
	rst  $38                                         ; $4df3: $ff
	rst  $38                                         ; $4df4: $ff
	rst  $38                                         ; $4df5: $ff
	rst  $38                                         ; $4df6: $ff
	rst  $38                                         ; $4df7: $ff
	rst  $38                                         ; $4df8: $ff
	rst  $38                                         ; $4df9: $ff
	cp   $ff                                         ; $4dfa: $fe $ff
	db   $fd                                         ; $4dfc: $fd
	rst  $38                                         ; $4dfd: $ff
	cp   $ff                                         ; $4dfe: $fe $ff
	cp   b                                           ; $4e00: $b8
	ldh  a, [rIE]                                    ; $4e01: $f0 $ff
	ldh  a, [$be]                                    ; $4e03: $f0 $be
	ldh  a, [$bf]                                    ; $4e05: $f0 $bf
	ldh  a, [rAUD3ENA]                               ; $4e07: $f0 $1a
	db   $f4                                         ; $4e09: $f4
	cp   b                                           ; $4e0a: $b8
	or   $10                                         ; $4e0b: $f6 $10
	cp   $30                                         ; $4e0d: $fe $30
	cp   $1f                                         ; $4e0f: $fe $1f
	nop                                              ; $4e11: $00
	nop                                              ; $4e12: $00
	nop                                              ; $4e13: $00
	nop                                              ; $4e14: $00
	nop                                              ; $4e15: $00
	nop                                              ; $4e16: $00
	nop                                              ; $4e17: $00
	nop                                              ; $4e18: $00
	nop                                              ; $4e19: $00
	ret  nz                                          ; $4e1a: $c0

	nop                                              ; $4e1b: $00
	ldh  [rLCDC], a                                  ; $4e1c: $e0 $40
	ret  nz                                          ; $4e1e: $c0

	ld   h, b                                        ; $4e1f: $60
	ld   b, e                                        ; $4e20: $43
	nop                                              ; $4e21: $00
	ld   b, $00                                      ; $4e22: $06 $00
	nop                                              ; $4e24: $00
	nop                                              ; $4e25: $00
	nop                                              ; $4e26: $00
	nop                                              ; $4e27: $00
	nop                                              ; $4e28: $00
	nop                                              ; $4e29: $00
	nop                                              ; $4e2a: $00
	nop                                              ; $4e2b: $00
	nop                                              ; $4e2c: $00
	nop                                              ; $4e2d: $00
	nop                                              ; $4e2e: $00
	nop                                              ; $4e2f: $00
	add  hl, de                                      ; $4e30: $19
	rrca                                             ; $4e31: $0f
	add  b                                           ; $4e32: $80
	rra                                              ; $4e33: $1f
	ld   bc, $821f                                   ; $4e34: $01 $1f $82
	rra                                              ; $4e37: $1f
	ld   d, c                                        ; $4e38: $51
	sbc  a                                           ; $4e39: $9f
	or   d                                           ; $4e3a: $b2
	rra                                              ; $4e3b: $1f
	ld   d, c                                        ; $4e3c: $51
	cp   a                                           ; $4e3d: $bf
	or   d                                           ; $4e3e: $b2
	ld   e, a                                        ; $4e3f: $5f
	ld   a, a                                        ; $4e40: $7f
	rst  $38                                         ; $4e41: $ff
	rst  $38                                         ; $4e42: $ff
	rst  $38                                         ; $4e43: $ff
	rst  $38                                         ; $4e44: $ff
	rst  $38                                         ; $4e45: $ff
	rst  $38                                         ; $4e46: $ff
	rst  $38                                         ; $4e47: $ff
	rst  $38                                         ; $4e48: $ff
	rst  $38                                         ; $4e49: $ff
	rst  $38                                         ; $4e4a: $ff
	rst  $38                                         ; $4e4b: $ff
	rst  $38                                         ; $4e4c: $ff
	rst  $38                                         ; $4e4d: $ff
	rst  $38                                         ; $4e4e: $ff
	rst  $38                                         ; $4e4f: $ff
	rst  $38                                         ; $4e50: $ff
	rst  $38                                         ; $4e51: $ff
	rst  $38                                         ; $4e52: $ff
	rst  $38                                         ; $4e53: $ff
	rst  $38                                         ; $4e54: $ff
	rst  $38                                         ; $4e55: $ff
	rst  $38                                         ; $4e56: $ff
	rst  $38                                         ; $4e57: $ff
	rst  $38                                         ; $4e58: $ff
	rst  $38                                         ; $4e59: $ff
	rst  $38                                         ; $4e5a: $ff
	rst  $38                                         ; $4e5b: $ff
	rst  $38                                         ; $4e5c: $ff
	rst  $38                                         ; $4e5d: $ff
	ld   d, c                                        ; $4e5e: $51
	cp   $fd                                         ; $4e5f: $fe $fd
	rst  $38                                         ; $4e61: $ff
	cp   $ff                                         ; $4e62: $fe $ff
	db   $fd                                         ; $4e64: $fd
	rst  $38                                         ; $4e65: $ff
	cp   $ff                                         ; $4e66: $fe $ff
	db   $fc                                         ; $4e68: $fc
	rst  $38                                         ; $4e69: $ff
	rst  $38                                         ; $4e6a: $ff
	rst  $38                                         ; $4e6b: $ff
	db   $fc                                         ; $4e6c: $fc
	rst  $38                                         ; $4e6d: $ff
	ld   b, b                                        ; $4e6e: $40
	add  b                                           ; $4e6f: $80
	db   $10                                         ; $4e70: $10
	cp   $33                                         ; $4e71: $fe $33
	cp   $13                                         ; $4e73: $fe $13
	cp   $17                                         ; $4e75: $fe $17
	ld   a, [$fe13]                                  ; $4e77: $fa $13 $fe
	and  $fb                                         ; $4e7a: $e6 $fb
	and  $1b                                         ; $4e7c: $e6 $1b
	ld   [bc], a                                     ; $4e7e: $02
	rra                                              ; $4e7f: $1f
	jr   nz, jr_095_4ee2                             ; $4e80: $20 $60

	jr   z, jr_095_4ef4                              ; $4e82: $28 $70

	inc  c                                           ; $4e84: $0c
	ld   a, b                                        ; $4e85: $78
	inc  c                                           ; $4e86: $0c
	ld   a, [hl]                                     ; $4e87: $7e
	ld   h, a                                        ; $4e88: $67
	ld   a, $67                                      ; $4e89: $3e $67
	ccf                                              ; $4e8b: $3f
	ld   a, e                                        ; $4e8c: $7b
	daa                                              ; $4e8d: $27
	ld   l, d                                        ; $4e8e: $6a
	scf                                              ; $4e8f: $37
	nop                                              ; $4e90: $00
	nop                                              ; $4e91: $00
	ld   [$0f00], sp                                 ; $4e92: $08 $00 $0f

jr_095_4e95:
	nop                                              ; $4e95: $00
	ld   bc, $0400                                   ; $4e96: $01 $00 $04
	nop                                              ; $4e99: $00
	adc  d                                           ; $4e9a: $8a
	nop                                              ; $4e9b: $00
	add  c                                           ; $4e9c: $81
	ret  nz                                          ; $4e9d: $c0

	ret  nz                                          ; $4e9e: $c0

	ldh  [$5b], a                                    ; $4e9f: $e0 $5b
	cp   a                                           ; $4ea1: $bf
	sbc  d                                           ; $4ea2: $9a
	ld   h, b                                        ; $4ea3: $60
	inc  [hl]                                        ; $4ea4: $34
	ret  nz                                          ; $4ea5: $c0

	and  c                                           ; $4ea6: $a1
	ld   e, a                                        ; $4ea7: $5f
	ld   c, [hl]                                     ; $4ea8: $4e
	rst  $38                                         ; $4ea9: $ff
	ld   c, [hl]                                     ; $4eaa: $4e
	rst  $38                                         ; $4eab: $ff
	ld   c, [hl]                                     ; $4eac: $4e
	rst  $38                                         ; $4ead: $ff
	or   $ef                                         ; $4eae: $f6 $ef
	ld   [bc], a                                     ; $4eb0: $02
	db   $fd                                         ; $4eb1: $fd
	ld   d, $00                                      ; $4eb2: $16 $00
	ld   a, [hl+]                                    ; $4eb4: $2a
	ld   bc, $ff93                                   ; $4eb5: $01 $93 $ff
	nop                                              ; $4eb8: $00
	rst  $38                                         ; $4eb9: $ff
	ld   h, b                                        ; $4eba: $60
	ccf                                              ; $4ebb: $3f
	db   $10                                         ; $4ebc: $10
	ccf                                              ; $4ebd: $3f
	add  e                                           ; $4ebe: $83
	inc  a                                           ; $4ebf: $3c
	cp   b                                           ; $4ec0: $b8
	ld   b, b                                        ; $4ec1: $40
	ldh  [rP1], a                                    ; $4ec2: $e0 $00
	jr   nc, jr_095_4e95                             ; $4ec4: $30 $cf

	and  b                                           ; $4ec6: $a0
	rst  $38                                         ; $4ec7: $ff
	nop                                              ; $4ec8: $00
	rst  $38                                         ; $4ec9: $ff
	nop                                              ; $4eca: $00
	rst  $38                                         ; $4ecb: $ff
	nop                                              ; $4ecc: $00
	rst  $38                                         ; $4ecd: $ff
	rst  $28                                         ; $4ece: $ef
	nop                                              ; $4ecf: $00
	nop                                              ; $4ed0: $00
	nop                                              ; $4ed1: $00
	ld   [hl], h                                     ; $4ed2: $74
	inc  bc                                          ; $4ed3: $03
	ld   a, c                                        ; $4ed4: $79
	rst  $38                                         ; $4ed5: $ff
	rla                                              ; $4ed6: $17
	rst  $28                                         ; $4ed7: $ef
	inc  bc                                          ; $4ed8: $03
	rst  JumpTableTrashDE                                         ; $4ed9: $c7
	inc  bc                                          ; $4eda: $03
	rst  JumpTableTrashDE                                         ; $4edb: $c7
	ld   a, [hl+]                                    ; $4edc: $2a
	rst  JumpTableTrashDE                                         ; $4edd: $c7
	ld   bc, $9800                                   ; $4ede: $01 $00 $98
	rlca                                             ; $4ee1: $07

jr_095_4ee2:
	nop                                              ; $4ee2: $00
	rst  $38                                         ; $4ee3: $ff
	call z, $83ff                                    ; $4ee4: $cc $ff $83
	rst  $38                                         ; $4ee7: $ff
	db   $e3                                         ; $4ee8: $e3
	rst  $18                                         ; $4ee9: $df
	pop  hl                                          ; $4eea: $e1
	rst  $18                                         ; $4eeb: $df
	ld   sp, $10cf                                   ; $4eec: $31 $cf $10
	rrca                                             ; $4eef: $0f
	and  a                                           ; $4ef0: $a7
	ccf                                              ; $4ef1: $3f
	xor  a                                           ; $4ef2: $af
	scf                                              ; $4ef3: $37

jr_095_4ef4:
	cpl                                              ; $4ef4: $2f
	rla                                              ; $4ef5: $17
	ld   a, e                                        ; $4ef6: $7b
	add  a                                           ; $4ef7: $87
	ld   [hl], c                                     ; $4ef8: $71
	db   $e3                                         ; $4ef9: $e3
	dec  [hl]                                        ; $4efa: $35
	ld   hl, sp+$11                                  ; $4efb: $f8 $11
	cp   $10                                         ; $4efd: $fe $10
	rst  $38                                         ; $4eff: $ff
	ld   h, h                                        ; $4f00: $64
	ldh  a, [$2c]                                    ; $4f01: $f0 $2c
	ldh  a, [$cc]                                    ; $4f03: $f0 $cc
	ld   hl, sp-$1b                                  ; $4f05: $f8 $e5
	cp   $e6                                         ; $4f07: $fe $e6
	rst  $38                                         ; $4f09: $ff
	db   $e4                                         ; $4f0a: $e4
	rst  $38                                         ; $4f0b: $ff
	rst  $08                                         ; $4f0c: $cf
	ld   a, $36                                      ; $4f0d: $3e $36
	rst  $08                                         ; $4f0f: $cf
	rrca                                             ; $4f10: $0f
	ldh  [rHDMA4], a                                 ; $4f11: $e0 $54
	and  b                                           ; $4f13: $a0
	inc  d                                           ; $4f14: $14
	db   $e3                                         ; $4f15: $e3
	ld   c, h                                        ; $4f16: $4c
	di                                               ; $4f17: $f3
	ld   sp, hl                                      ; $4f18: $f9
	rst  $38                                         ; $4f19: $ff
	rst  $38                                         ; $4f1a: $ff
	rst  $38                                         ; $4f1b: $ff
	ld   b, a                                        ; $4f1c: $47
	cp   a                                           ; $4f1d: $bf
	add  e                                           ; $4f1e: $83
	ld   a, a                                        ; $4f1f: $7f
	jr   nz, jr_095_4f22                             ; $4f20: $20 $00

jr_095_4f22:
	sbc  a                                           ; $4f22: $9f
	ld   h, b                                        ; $4f23: $60
	ld   bc, $5fff                                   ; $4f24: $01 $ff $5f
	rst  $38                                         ; $4f27: $ff
	rst  $38                                         ; $4f28: $ff
	rst  $38                                         ; $4f29: $ff
	rst  $38                                         ; $4f2a: $ff
	rst  $38                                         ; $4f2b: $ff
	rst  $38                                         ; $4f2c: $ff
	rst  $38                                         ; $4f2d: $ff
	ei                                               ; $4f2e: $fb
	rst  $38                                         ; $4f2f: $ff
	inc  e                                           ; $4f30: $1c
	nop                                              ; $4f31: $00
	ldh  a, [rIF]                                    ; $4f32: $f0 $0f
	push af                                          ; $4f34: $f5
	rst  $38                                         ; $4f35: $ff
	rst  $38                                         ; $4f36: $ff
	rst  $38                                         ; $4f37: $ff
	rst  $38                                         ; $4f38: $ff
	rst  $38                                         ; $4f39: $ff
	rst  $38                                         ; $4f3a: $ff
	rst  $38                                         ; $4f3b: $ff
	ei                                               ; $4f3c: $fb
	rst  $38                                         ; $4f3d: $ff
	rst  $30                                         ; $4f3e: $f7
	rst  $38                                         ; $4f3f: $ff
	nop                                              ; $4f40: $00
	nop                                              ; $4f41: $00
	nop                                              ; $4f42: $00
	rst  $38                                         ; $4f43: $ff
	ld   b, b                                        ; $4f44: $40
	rst  $38                                         ; $4f45: $ff
	rst  $38                                         ; $4f46: $ff
	rst  $38                                         ; $4f47: $ff
	rst  $38                                         ; $4f48: $ff
	rst  $38                                         ; $4f49: $ff
	rst  $38                                         ; $4f4a: $ff
	rst  $38                                         ; $4f4b: $ff
	rst  $28                                         ; $4f4c: $ef
	rst  $38                                         ; $4f4d: $ff
	rst  $10                                         ; $4f4e: $d7
	rst  $38                                         ; $4f4f: $ff
	ret  nc                                          ; $4f50: $d0

	rrca                                             ; $4f51: $0f
	ld   e, d                                        ; $4f52: $5a
	add  a                                           ; $4f53: $87
	ld   d, d                                        ; $4f54: $52
	adc  a                                           ; $4f55: $8f
	call c, $ffff                                    ; $4f56: $dc $ff $ff
	rst  $38                                         ; $4f59: $ff
	rst  $38                                         ; $4f5a: $ff
	rst  $38                                         ; $4f5b: $ff
	rst  $38                                         ; $4f5c: $ff
	rst  $38                                         ; $4f5d: $ff
	rst  $38                                         ; $4f5e: $ff
	rst  $38                                         ; $4f5f: $ff
	nop                                              ; $4f60: $00
	rst  $38                                         ; $4f61: $ff
	xor  b                                           ; $4f62: $a8
	ld   d, a                                        ; $4f63: $57
	ld   d, l                                        ; $4f64: $55
	xor  d                                           ; $4f65: $aa
	rlca                                             ; $4f66: $07
	ld   hl, sp-$04                                  ; $4f67: $f8 $fc
	rst  $38                                         ; $4f69: $ff
	rst  $38                                         ; $4f6a: $ff
	rst  $38                                         ; $4f6b: $ff
	rst  $38                                         ; $4f6c: $ff
	rst  $38                                         ; $4f6d: $ff
	rst  $38                                         ; $4f6e: $ff
	rst  $38                                         ; $4f6f: $ff
	inc  b                                           ; $4f70: $04
	ei                                               ; $4f71: $fb
	dec  bc                                          ; $4f72: $0b
	db   $fc                                         ; $4f73: $fc
	add  b                                           ; $4f74: $80
	ld   a, a                                        ; $4f75: $7f
	db   $ec                                         ; $4f76: $ec
	inc  de                                          ; $4f77: $13
	scf                                              ; $4f78: $37
	ret  z                                           ; $4f79: $c8

	ld   hl, sp-$01                                  ; $4f7a: $f8 $ff
	rst  $38                                         ; $4f7c: $ff
	rst  $38                                         ; $4f7d: $ff
	rst  $38                                         ; $4f7e: $ff
	rst  $38                                         ; $4f7f: $ff
	ld   b, $ff                                      ; $4f80: $06 $ff
	dec  bc                                          ; $4f82: $0b
	rst  $38                                         ; $4f83: $ff
	ld   b, $ff                                      ; $4f84: $06 $ff
	ld   a, [bc]                                     ; $4f86: $0a
	rst  $38                                         ; $4f87: $ff
	ld   e, $ff                                      ; $4f88: $1e $ff
	cp   $ff                                         ; $4f8a: $fe $ff
	rst  $38                                         ; $4f8c: $ff
	rst  $38                                         ; $4f8d: $ff
	rst  $38                                         ; $4f8e: $ff
	rst  $38                                         ; $4f8f: $ff
	sub  l                                           ; $4f90: $95
	rst  $38                                         ; $4f91: $ff
	ld   a, [bc]                                     ; $4f92: $0a
	rst  $38                                         ; $4f93: $ff
	nop                                              ; $4f94: $00
	rst  $38                                         ; $4f95: $ff
	ld   bc, $01ff                                   ; $4f96: $01 $ff $01
	rst  $38                                         ; $4f99: $ff
	rrca                                             ; $4f9a: $0f
	rst  $38                                         ; $4f9b: $ff
	rst  $38                                         ; $4f9c: $ff
	rst  $38                                         ; $4f9d: $ff
	rst  $38                                         ; $4f9e: $ff
	rst  $38                                         ; $4f9f: $ff
	db   $eb                                         ; $4fa0: $eb
	rst  $38                                         ; $4fa1: $ff
	jp   $c3ff                                       ; $4fa2: $c3 $ff $c3


	rst  $38                                         ; $4fa5: $ff
	ldh  a, [c]                                      ; $4fa6: $f2
	rst  $38                                         ; $4fa7: $ff
	rst  $38                                         ; $4fa8: $ff
	rst  $38                                         ; $4fa9: $ff
	rst  $38                                         ; $4faa: $ff
	rst  $38                                         ; $4fab: $ff
	rst  $38                                         ; $4fac: $ff
	rst  $38                                         ; $4fad: $ff
	rst  $38                                         ; $4fae: $ff
	rst  $38                                         ; $4faf: $ff
	ld   [$c5ff], a                                  ; $4fb0: $ea $ff $c5
	rst  $38                                         ; $4fb3: $ff
	and  b                                           ; $4fb4: $a0
	rst  $38                                         ; $4fb5: $ff
	add  b                                           ; $4fb6: $80
	rst  $38                                         ; $4fb7: $ff
	nop                                              ; $4fb8: $00
	rst  $38                                         ; $4fb9: $ff
	ret  nz                                          ; $4fba: $c0

	rst  $38                                         ; $4fbb: $ff
	ldh  a, [rIE]                                    ; $4fbc: $f0 $ff
	rst  $38                                         ; $4fbe: $ff
	rst  $38                                         ; $4fbf: $ff
	rst  $28                                         ; $4fc0: $ef
	rst  $38                                         ; $4fc1: $ff
	ld   e, a                                        ; $4fc2: $5f
	rst  $38                                         ; $4fc3: $ff
	xor  a                                           ; $4fc4: $af
	rst  $38                                         ; $4fc5: $ff
	dec  e                                           ; $4fc6: $1d
	rst  $38                                         ; $4fc7: $ff
	dec  bc                                          ; $4fc8: $0b
	rst  $38                                         ; $4fc9: $ff
	dec  c                                           ; $4fca: $0d
	rst  $38                                         ; $4fcb: $ff
	add  hl, de                                      ; $4fcc: $19
	rst  $38                                         ; $4fcd: $ff
	db   $fd                                         ; $4fce: $fd
	rst  $38                                         ; $4fcf: $ff
	rst  $38                                         ; $4fd0: $ff
	rst  $38                                         ; $4fd1: $ff
	rst  $38                                         ; $4fd2: $ff
	rst  $38                                         ; $4fd3: $ff
	rst  $38                                         ; $4fd4: $ff
	rst  $38                                         ; $4fd5: $ff
	db   $fc                                         ; $4fd6: $fc
	rst  $38                                         ; $4fd7: $ff
	ld   sp, hl                                      ; $4fd8: $f9
	rst  $38                                         ; $4fd9: $ff
	sbc  $ff                                         ; $4fda: $de $ff
	ld   a, [$c5fd]                                  ; $4fdc: $fa $fd $c5
	ld   a, [$ffff]                                  ; $4fdf: $fa $ff $ff
	rst  $38                                         ; $4fe2: $ff
	rst  $38                                         ; $4fe3: $ff
	call $89ff                                       ; $4fe4: $cd $ff $89
	ld   a, [hl]                                     ; $4fe7: $7e
	jp   z, Jump_095_55f5                            ; $4fe8: $ca $f5 $55

	xor  d                                           ; $4feb: $aa
	xor  d                                           ; $4fec: $aa
	ld   d, l                                        ; $4fed: $55
	ld   d, l                                        ; $4fee: $55
	xor  d                                           ; $4fef: $aa
	ld   a, [$e5f0]                                  ; $4ff0: $fa $f0 $e5
	ldh  a, [$e2]                                    ; $4ff3: $f0 $e2
	ldh  a, [h2IfGBC]                                    ; $4ff5: $f0 $f5
	ldh  [$e1], a                                    ; $4ff7: $e0 $e1
	ldh  [$f2], a                                    ; $4ff9: $e0 $f2
	ldh  [$f2], a                                    ; $4ffb: $e0 $f2
	ldh  [h2IfGBC], a                                    ; $4ffd: $e0 $f5
	ldh  [$b7], a                                    ; $4fff: $e0 $b7
	nop                                              ; $5001: $00
	ld   l, a                                        ; $5002: $6f
	nop                                              ; $5003: $00
	cp   a                                           ; $5004: $bf
	nop                                              ; $5005: $00
	rst  $18                                         ; $5006: $df
	nop                                              ; $5007: $00
	ccf                                              ; $5008: $3f
	ld   bc, $03bd                                   ; $5009: $01 $bd $03
	ei                                               ; $500c: $fb
	rlca                                             ; $500d: $07
	rst  $30                                         ; $500e: $f7
	rrca                                             ; $500f: $0f
	rst  $38                                         ; $5010: $ff
	nop                                              ; $5011: $00
	swap a                                           ; $5012: $cb $37
	or   a                                           ; $5014: $b7
	ld   l, a                                        ; $5015: $6f
	ld   e, [hl]                                     ; $5016: $5e
	rst  $28                                         ; $5017: $ef
	ldh  [rIE], a                                    ; $5018: $e0 $ff
	rst  $20                                         ; $501a: $e7
	ld   hl, sp-$3d                                  ; $501b: $f8 $c3
	db   $fc                                         ; $501d: $fc
	db   $e3                                         ; $501e: $e3
	db   $fc                                         ; $501f: $fc
	ldh  [$1f], a                                    ; $5020: $e0 $1f
	rst  $38                                         ; $5022: $ff
	rst  $38                                         ; $5023: $ff
	rst  $38                                         ; $5024: $ff
	rst  $38                                         ; $5025: $ff
	ld   bc, $20ff                                   ; $5026: $01 $ff $20
	rst  $18                                         ; $5029: $df
	ld   bc, $65ff                                   ; $502a: $01 $ff $65
	sbc  e                                           ; $502d: $9b
	ldh  [$1f], a                                    ; $502e: $e0 $1f
	rrca                                             ; $5030: $0f
	ldh  a, [rIE]                                    ; $5031: $f0 $ff
	rst  $38                                         ; $5033: $ff
	rst  $38                                         ; $5034: $ff
	rst  $38                                         ; $5035: $ff
	ld   b, a                                        ; $5036: $47
	rst  $38                                         ; $5037: $ff
	add  b                                           ; $5038: $80
	rst  $38                                         ; $5039: $ff
	add  b                                           ; $503a: $80
	rst  $38                                         ; $503b: $ff
	cp   a                                           ; $503c: $bf
	ret  nz                                          ; $503d: $c0

	xor  a                                           ; $503e: $af
	ret  nz                                          ; $503f: $c0

	add  b                                           ; $5040: $80
	ld   [hl], b                                     ; $5041: $70
	rst  $28                                         ; $5042: $ef
	ldh  a, [$fc]                                    ; $5043: $f0 $fc
	rst  $38                                         ; $5045: $ff
	rst  $38                                         ; $5046: $ff
	rst  $38                                         ; $5047: $ff
	rrca                                             ; $5048: $0f
	rst  $38                                         ; $5049: $ff
	ld   bc, $c0ff                                   ; $504a: $01 $ff $c0
	ccf                                              ; $504d: $3f
	db   $10                                         ; $504e: $10
	ccf                                              ; $504f: $3f
	ld   [hl], l                                     ; $5050: $75
	db   $e3                                         ; $5051: $e3
	ld   de, $e5e3                                   ; $5052: $11 $e3 $e5
	inc  bc                                          ; $5055: $03
	cp   l                                           ; $5056: $bd
	jp   $fff9                                       ; $5057: $c3 $f9 $ff


	rst  $38                                         ; $505a: $ff
	rst  $38                                         ; $505b: $ff
	ccf                                              ; $505c: $3f
	rst  $38                                         ; $505d: $ff
	rlca                                             ; $505e: $07
	rst  $38                                         ; $505f: $ff
	call $c3e0                                       ; $5060: $cd $e0 $c3
	ldh  [$ef], a                                    ; $5063: $e0 $ef
	ret  nz                                          ; $5065: $c0

	call z, $fde3                                    ; $5066: $cc $e3 $fd
	jp   $e7db                                       ; $5069: $c3 $db $e7


	rst  $18                                         ; $506c: $df
	rst  $20                                         ; $506d: $e7
	rst  $38                                         ; $506e: $ff
	rst  $08                                         ; $506f: $cf
	rst  $28                                         ; $5070: $ef
	rra                                              ; $5071: $1f
	rst  $18                                         ; $5072: $df
	ccf                                              ; $5073: $3f
	rst  $38                                         ; $5074: $ff
	ld   a, a                                        ; $5075: $7f
	rst  $38                                         ; $5076: $ff
	rst  $38                                         ; $5077: $ff
	rst  $38                                         ; $5078: $ff
	rst  $38                                         ; $5079: $ff
	rst  $38                                         ; $507a: $ff
	rst  $38                                         ; $507b: $ff
	rst  $38                                         ; $507c: $ff
	rst  $38                                         ; $507d: $ff
	rst  $38                                         ; $507e: $ff
	rst  $38                                         ; $507f: $ff
	call nz, $c0fb                                   ; $5080: $c4 $fb $c0
	rst  $38                                         ; $5083: $ff
	ret                                              ; $5084: $c9


	rst  $38                                         ; $5085: $ff
	jp   z, $c7ff                                    ; $5086: $ca $ff $c7

	cp   $cb                                         ; $5089: $fe $cb
	cp   $c6                                         ; $508b: $fe $c6
	rst  $38                                         ; $508d: $ff
	add  $ff                                         ; $508e: $c6 $ff
	ld   de, $01ef                                   ; $5090: $11 $ef $01
	rst  $38                                         ; $5093: $ff
	ld   bc, $09ff                                   ; $5094: $01 $ff $09
	rst  $38                                         ; $5097: $ff
	ld   h, c                                        ; $5098: $61
	rra                                              ; $5099: $1f
	dec  l                                           ; $509a: $2d
	rra                                              ; $509b: $1f
	rla                                              ; $509c: $17
	rst  $38                                         ; $509d: $ff
	rst  $28                                         ; $509e: $ef
	rst  $38                                         ; $509f: $ff
	cp   b                                           ; $50a0: $b8
	rst  JumpTableTrashDE                                         ; $50a1: $c7
	cp   [hl]                                        ; $50a2: $be
	pop  bc                                          ; $50a3: $c1
	add  b                                           ; $50a4: $80
	rst  $38                                         ; $50a5: $ff
	db   $f4                                         ; $50a6: $f4
	rst  $38                                         ; $50a7: $ff
	ld   d, l                                        ; $50a8: $55
	rst  $38                                         ; $50a9: $ff
	db   $eb                                         ; $50aa: $eb
	rst  $38                                         ; $50ab: $ff
	ld   c, l                                        ; $50ac: $4d
	rst  $38                                         ; $50ad: $ff
	push af                                          ; $50ae: $f5
	rst  $38                                         ; $50af: $ff
	ret  nz                                          ; $50b0: $c0

	ccf                                              ; $50b1: $3f
	ret  nz                                          ; $50b2: $c0

	ccf                                              ; $50b3: $3f
	ld   b, b                                        ; $50b4: $40
	cp   a                                           ; $50b5: $bf
	add  b                                           ; $50b6: $80
	rst  $38                                         ; $50b7: $ff
	ld   b, h                                        ; $50b8: $44
	rst  $38                                         ; $50b9: $ff
	ld   l, d                                        ; $50ba: $6a
	rst  $38                                         ; $50bb: $ff
	sub  d                                           ; $50bc: $92
	rst  $38                                         ; $50bd: $ff
	ld   [hl], b                                     ; $50be: $70
	rst  $38                                         ; $50bf: $ff
	inc  bc                                          ; $50c0: $03
	rst  $38                                         ; $50c1: $ff
	inc  bc                                          ; $50c2: $03
	rst  $38                                         ; $50c3: $ff
	inc  bc                                          ; $50c4: $03
	rst  $38                                         ; $50c5: $ff
	inc  bc                                          ; $50c6: $03
	rst  $38                                         ; $50c7: $ff
	inc  bc                                          ; $50c8: $03
	rst  $38                                         ; $50c9: $ff
	xor  a                                           ; $50ca: $af
	rst  $38                                         ; $50cb: $ff
	ccf                                              ; $50cc: $3f
	rst  $38                                         ; $50cd: $ff
	ld   a, a                                        ; $50ce: $7f
	rst  $38                                         ; $50cf: $ff
	rst  $08                                         ; $50d0: $cf
	rst  $38                                         ; $50d1: $ff
	rst  $38                                         ; $50d2: $ff
	rst  $38                                         ; $50d3: $ff
	rst  $38                                         ; $50d4: $ff
	rst  $38                                         ; $50d5: $ff
	rst  $38                                         ; $50d6: $ff
	rst  $38                                         ; $50d7: $ff
	rst  $38                                         ; $50d8: $ff
	rst  $38                                         ; $50d9: $ff
	cp   a                                           ; $50da: $bf
	rst  $38                                         ; $50db: $ff
	ld   a, a                                        ; $50dc: $7f
	rst  $38                                         ; $50dd: $ff
	ld   a, a                                        ; $50de: $7f
	rst  $38                                         ; $50df: $ff
	rst  $38                                         ; $50e0: $ff
	rst  $38                                         ; $50e1: $ff
	rst  $38                                         ; $50e2: $ff
	rst  $38                                         ; $50e3: $ff
	rst  $38                                         ; $50e4: $ff
	rst  $38                                         ; $50e5: $ff
	rst  $38                                         ; $50e6: $ff
	rst  $38                                         ; $50e7: $ff
	rst  $38                                         ; $50e8: $ff
	rst  $38                                         ; $50e9: $ff
	rst  $38                                         ; $50ea: $ff
	rst  $38                                         ; $50eb: $ff
	rst  $38                                         ; $50ec: $ff
	rst  $38                                         ; $50ed: $ff
	rst  $38                                         ; $50ee: $ff
	rst  $38                                         ; $50ef: $ff
	add  $ff                                         ; $50f0: $c6 $ff
	add  $ff                                         ; $50f2: $c6 $ff
	rst  JumpTableTrashDE                                         ; $50f4: $c7
	cp   $c4                                         ; $50f5: $fe $c4
	rst  $38                                         ; $50f7: $ff
	sbc  $ff                                         ; $50f8: $de $ff
	rst  $18                                         ; $50fa: $df
	rst  $38                                         ; $50fb: $ff
	rst  $18                                         ; $50fc: $df
	cp   $db                                         ; $50fd: $fe $db
	db   $fc                                         ; $50ff: $fc
	ld   a, e                                        ; $5100: $7b
	rst  $38                                         ; $5101: $ff
	ld   a, a                                        ; $5102: $7f
	rst  $38                                         ; $5103: $ff
	ld   h, c                                        ; $5104: $61
	rst  $38                                         ; $5105: $ff
	ld   l, e                                        ; $5106: $6b
	rst  $30                                         ; $5107: $f7
	rst  $20                                         ; $5108: $e7
	rst  $38                                         ; $5109: $ff
	rst  $38                                         ; $510a: $ff
	rst  $38                                         ; $510b: $ff
	ld   a, a                                        ; $510c: $7f
	ccf                                              ; $510d: $3f
	pop  bc                                          ; $510e: $c1
	ccf                                              ; $510f: $3f
	jp   c, $f6ff                                    ; $5110: $da $ff $f6

	rst  $38                                         ; $5113: $ff
	rst  $38                                         ; $5114: $ff
	rst  $38                                         ; $5115: $ff
	ld   a, [$f2f7]                                  ; $5116: $fa $f7 $f2
	rst  $38                                         ; $5119: $ff
	rst  $38                                         ; $511a: $ff
	rst  $38                                         ; $511b: $ff
	rst  $38                                         ; $511c: $ff
	rst  $38                                         ; $511d: $ff
	rst  $38                                         ; $511e: $ff
	rst  $38                                         ; $511f: $ff
	cp   a                                           ; $5120: $bf
	rst  $38                                         ; $5121: $ff
	rst  $38                                         ; $5122: $ff
	rst  $38                                         ; $5123: $ff
	ccf                                              ; $5124: $3f
	rst  $38                                         ; $5125: $ff
	rst  $38                                         ; $5126: $ff
	rst  $38                                         ; $5127: $ff
	rst  $38                                         ; $5128: $ff
	rst  $38                                         ; $5129: $ff
	rst  $38                                         ; $512a: $ff
	rst  $38                                         ; $512b: $ff
	rst  $38                                         ; $512c: $ff
	rst  $38                                         ; $512d: $ff
	rst  $38                                         ; $512e: $ff
	rst  $38                                         ; $512f: $ff
	ccf                                              ; $5130: $3f
	rst  $38                                         ; $5131: $ff
	ld   e, a                                        ; $5132: $5f
	cp   a                                           ; $5133: $bf
	rra                                              ; $5134: $1f
	rst  $38                                         ; $5135: $ff
	ld   e, a                                        ; $5136: $5f
	cp   a                                           ; $5137: $bf
	dec  de                                          ; $5138: $1b
	cp   a                                           ; $5139: $bf
	or   e                                           ; $513a: $b3
	rst  $38                                         ; $513b: $ff
	rst  $38                                         ; $513c: $ff
	rst  $38                                         ; $513d: $ff
	rst  $38                                         ; $513e: $ff
	rst  $38                                         ; $513f: $ff
	rst  $38                                         ; $5140: $ff
	rst  $38                                         ; $5141: $ff
	rst  $38                                         ; $5142: $ff
	rst  $38                                         ; $5143: $ff
	rst  $38                                         ; $5144: $ff
	rst  $38                                         ; $5145: $ff
	rst  $38                                         ; $5146: $ff
	rst  $38                                         ; $5147: $ff
	rst  $38                                         ; $5148: $ff
	rst  $38                                         ; $5149: $ff
	rst  $38                                         ; $514a: $ff
	rst  $38                                         ; $514b: $ff
	rst  $38                                         ; $514c: $ff
	rst  $38                                         ; $514d: $ff
	ld   a, a                                        ; $514e: $7f
	rst  $38                                         ; $514f: $ff
	rst  $38                                         ; $5150: $ff
	rst  $38                                         ; $5151: $ff
	rst  $38                                         ; $5152: $ff
	rst  $38                                         ; $5153: $ff
	rst  $38                                         ; $5154: $ff
	rst  $38                                         ; $5155: $ff
	rst  $38                                         ; $5156: $ff
	rst  $38                                         ; $5157: $ff
	rst  $38                                         ; $5158: $ff
	rst  $38                                         ; $5159: $ff
	rst  $38                                         ; $515a: $ff
	rst  $38                                         ; $515b: $ff
	rst  $38                                         ; $515c: $ff
	rst  $38                                         ; $515d: $ff
	rst  $38                                         ; $515e: $ff
	rst  $38                                         ; $515f: $ff
	db   $db                                         ; $5160: $db
	ld   sp, hl                                      ; $5161: $f9
	jp   nc, $daf9                                   ; $5162: $d2 $f9 $da

	db   $fc                                         ; $5165: $fc
	call c, $f2ff                                    ; $5166: $dc $ff $f2
	ret  nz                                          ; $5169: $c0

	ldh  [$c0], a                                    ; $516a: $e0 $c0
	ldh  a, [$c0]                                    ; $516c: $f0 $c0
	ret  nz                                          ; $516e: $c0

	ldh  [$db], a                                    ; $516f: $e0 $db
	add  c                                           ; $5171: $81
	ld   a, l                                        ; $5172: $7d
	add  e                                           ; $5173: $83
	cp   a                                           ; $5174: $bf
	ld   a, a                                        ; $5175: $7f
	rst  $38                                         ; $5176: $ff
	rst  $38                                         ; $5177: $ff
	or   l                                           ; $5178: $b5
	ld   a, [bc]                                     ; $5179: $0a
	nop                                              ; $517a: $00
	nop                                              ; $517b: $00
	nop                                              ; $517c: $00
	nop                                              ; $517d: $00
	nop                                              ; $517e: $00
	nop                                              ; $517f: $00
	rst  $38                                         ; $5180: $ff
	rst  $38                                         ; $5181: $ff
	rst  $38                                         ; $5182: $ff
	rst  $38                                         ; $5183: $ff
	rst  $38                                         ; $5184: $ff
	rst  $38                                         ; $5185: $ff
	rst  $38                                         ; $5186: $ff
	rst  $38                                         ; $5187: $ff
	ld   b, b                                        ; $5188: $40
	cp   a                                           ; $5189: $bf
	nop                                              ; $518a: $00
	nop                                              ; $518b: $00
	nop                                              ; $518c: $00
	nop                                              ; $518d: $00
	nop                                              ; $518e: $00
	nop                                              ; $518f: $00
	rst  $38                                         ; $5190: $ff
	rst  $38                                         ; $5191: $ff
	rst  $38                                         ; $5192: $ff
	rst  $38                                         ; $5193: $ff
	db   $fd                                         ; $5194: $fd
	cp   $ff                                         ; $5195: $fe $ff
	cp   $00                                         ; $5197: $fe $00
	rst  $38                                         ; $5199: $ff
	nop                                              ; $519a: $00
	nop                                              ; $519b: $00
	nop                                              ; $519c: $00
	nop                                              ; $519d: $00
	nop                                              ; $519e: $00
	nop                                              ; $519f: $00
	xor  a                                           ; $51a0: $af
	rra                                              ; $51a1: $1f
	sbc  a                                           ; $51a2: $9f
	rrca                                             ; $51a3: $0f
	rst  $08                                         ; $51a4: $cf
	rra                                              ; $51a5: $1f
	rst  $08                                         ; $51a6: $cf
	ld   a, a                                        ; $51a7: $7f
	inc  bc                                          ; $51a8: $03
	rst  $38                                         ; $51a9: $ff
	add  hl, bc                                      ; $51aa: $09
	inc  bc                                          ; $51ab: $03
	dec  b                                           ; $51ac: $05
	inc  bc                                          ; $51ad: $03
	add  hl, bc                                      ; $51ae: $09
	inc  bc                                          ; $51af: $03
	cp   a                                           ; $51b0: $bf
	rst  $38                                         ; $51b1: $ff
	ld   a, a                                        ; $51b2: $7f
	rst  $38                                         ; $51b3: $ff
	cp   a                                           ; $51b4: $bf
	rst  $38                                         ; $51b5: $ff
	ccf                                              ; $51b6: $3f
	rst  $38                                         ; $51b7: $ff
	ld   e, a                                        ; $51b8: $5f
	rst  $38                                         ; $51b9: $ff
	cp   a                                           ; $51ba: $bf
	rst  $38                                         ; $51bb: $ff
	ld   d, e                                        ; $51bc: $53
	rst  $38                                         ; $51bd: $ff
	or   l                                           ; $51be: $b5
	ei                                               ; $51bf: $fb
	rst  $38                                         ; $51c0: $ff
	rst  $38                                         ; $51c1: $ff
	rst  $38                                         ; $51c2: $ff
	rst  $38                                         ; $51c3: $ff
	rst  $38                                         ; $51c4: $ff
	rst  $38                                         ; $51c5: $ff
	rst  $38                                         ; $51c6: $ff
	rst  $38                                         ; $51c7: $ff
	rst  $38                                         ; $51c8: $ff
	rst  $38                                         ; $51c9: $ff
	rst  $38                                         ; $51ca: $ff
	rst  $38                                         ; $51cb: $ff
	rst  $38                                         ; $51cc: $ff
	rst  $38                                         ; $51cd: $ff
	rst  $38                                         ; $51ce: $ff
	rst  $38                                         ; $51cf: $ff
	or   b                                           ; $51d0: $b0
	ret  nz                                          ; $51d1: $c0

	and  e                                           ; $51d2: $a3
	ret  nz                                          ; $51d3: $c0

	or   l                                           ; $51d4: $b5
	jp   nz, $c6a0                                   ; $51d5: $c2 $a0 $c6

	or   l                                           ; $51d8: $b5
	jp   nz, $c3a0                                   ; $51d9: $c2 $a0 $c3

	adc  a                                           ; $51dc: $8f
	ldh  a, [$bf]                                    ; $51dd: $f0 $bf
	ret  nz                                          ; $51df: $c0

	nop                                              ; $51e0: $00
	nop                                              ; $51e1: $00
	ret  nz                                          ; $51e2: $c0

	nop                                              ; $51e3: $00
	nop                                              ; $51e4: $00
	ld   b, b                                        ; $51e5: $40
	nop                                              ; $51e6: $00
	ld   b, b                                        ; $51e7: $40
	ld   b, b                                        ; $51e8: $40
	nop                                              ; $51e9: $00
	add  b                                           ; $51ea: $80
	nop                                              ; $51eb: $00
	rst  $38                                         ; $51ec: $ff
	nop                                              ; $51ed: $00
	rst  $38                                         ; $51ee: $ff
	nop                                              ; $51ef: $00
	nop                                              ; $51f0: $00
	nop                                              ; $51f1: $00
	nop                                              ; $51f2: $00
	nop                                              ; $51f3: $00
	nop                                              ; $51f4: $00
	nop                                              ; $51f5: $00
	nop                                              ; $51f6: $00
	nop                                              ; $51f7: $00
	nop                                              ; $51f8: $00
	nop                                              ; $51f9: $00
	nop                                              ; $51fa: $00
	nop                                              ; $51fb: $00
	rst  $38                                         ; $51fc: $ff
	nop                                              ; $51fd: $00
	rst  $38                                         ; $51fe: $ff
	nop                                              ; $51ff: $00
	nop                                              ; $5200: $00
	nop                                              ; $5201: $00
	nop                                              ; $5202: $00
	nop                                              ; $5203: $00
	nop                                              ; $5204: $00
	nop                                              ; $5205: $00
	nop                                              ; $5206: $00
	nop                                              ; $5207: $00
	nop                                              ; $5208: $00
	nop                                              ; $5209: $00
	nop                                              ; $520a: $00
	nop                                              ; $520b: $00
	push de                                          ; $520c: $d5
	ld   a, [hl+]                                    ; $520d: $2a
	rst  $38                                         ; $520e: $ff
	nop                                              ; $520f: $00
	dec  b                                           ; $5210: $05
	inc  bc                                          ; $5211: $03
	inc  de                                          ; $5212: $13
	rrca                                             ; $5213: $0f
	add  hl, hl                                      ; $5214: $29
	inc  de                                          ; $5215: $13
	inc  sp                                          ; $5216: $33
	ld   bc, $0339                                   ; $5217: $01 $39 $03
	inc  bc                                          ; $521a: $03
	rra                                              ; $521b: $1f
	ld   b, c                                        ; $521c: $41
	cp   a                                           ; $521d: $bf
	sub  e                                           ; $521e: $93
	ld   a, a                                        ; $521f: $7f
	and  a                                           ; $5220: $a7
	ld   hl, sp+$7e                                  ; $5221: $f8 $7e
	ld   sp, hl                                      ; $5223: $f9
	dec  bc                                          ; $5224: $0b
	db   $fc                                         ; $5225: $fc
	dec  bc                                          ; $5226: $0b
	db   $fc                                         ; $5227: $fc
	dec  de                                          ; $5228: $1b
	db   $fc                                         ; $5229: $fc
	sub  c                                           ; $522a: $91
	cp   $a9                                         ; $522b: $fe $a9
	cp   $55                                         ; $522d: $fe $55
	cp   $7f                                         ; $522f: $fe $7f
	rst  $38                                         ; $5231: $ff
	rra                                              ; $5232: $1f
	rst  $38                                         ; $5233: $ff
	rst  $08                                         ; $5234: $cf
	ccf                                              ; $5235: $3f
	rst  $30                                         ; $5236: $f7
	rrca                                             ; $5237: $0f
	cp   e                                           ; $5238: $bb
	ld   b, a                                        ; $5239: $47
	jp   hl                                          ; $523a: $e9


	rla                                              ; $523b: $17
	call nc, $ff2b                                   ; $523c: $d4 $2b $ff
	nop                                              ; $523f: $00
	cp   l                                           ; $5240: $bd
	jp   $f78b                                       ; $5241: $c3 $8b $f7


	adc  d                                           ; $5244: $8a
	rst  $30                                         ; $5245: $f7
	cp   a                                           ; $5246: $bf
	ret  nz                                          ; $5247: $c0

	xor  d                                           ; $5248: $aa
	push de                                          ; $5249: $d5
	add  e                                           ; $524a: $83
	ret  nz                                          ; $524b: $c0

	add  a                                           ; $524c: $87
	ret  nz                                          ; $524d: $c0

	rst  $38                                         ; $524e: $ff
	rst  $38                                         ; $524f: $ff
	rst  $38                                         ; $5250: $ff
	add  b                                           ; $5251: $80
	ld   a, a                                        ; $5252: $7f
	add  b                                           ; $5253: $80
	rst  $38                                         ; $5254: $ff
	nop                                              ; $5255: $00
	rst  $38                                         ; $5256: $ff
	nop                                              ; $5257: $00
	rrca                                             ; $5258: $0f
	rst  $38                                         ; $5259: $ff
	ldh  [$1f], a                                    ; $525a: $e0 $1f
	add  b                                           ; $525c: $80
	ld   a, a                                        ; $525d: $7f
	rst  $38                                         ; $525e: $ff
	rst  $38                                         ; $525f: $ff
	rst  $38                                         ; $5260: $ff
	nop                                              ; $5261: $00
	rst  $38                                         ; $5262: $ff
	nop                                              ; $5263: $00
	rst  $38                                         ; $5264: $ff
	nop                                              ; $5265: $00
	rst  $38                                         ; $5266: $ff
	nop                                              ; $5267: $00
	rst  $38                                         ; $5268: $ff
	rst  $38                                         ; $5269: $ff
	rst  $38                                         ; $526a: $ff
	rst  $38                                         ; $526b: $ff
	rst  $38                                         ; $526c: $ff
	rst  $38                                         ; $526d: $ff
	rst  $38                                         ; $526e: $ff
	rst  $38                                         ; $526f: $ff
	rst  $38                                         ; $5270: $ff
	nop                                              ; $5271: $00
	rst  $38                                         ; $5272: $ff
	nop                                              ; $5273: $00
	rst  $38                                         ; $5274: $ff
	nop                                              ; $5275: $00
	add  b                                           ; $5276: $80
	ld   a, a                                        ; $5277: $7f
	ldh  [rIE], a                                    ; $5278: $e0 $ff
	rst  $20                                         ; $527a: $e7
	rst  $38                                         ; $527b: $ff
	rst  $38                                         ; $527c: $ff
	rst  $38                                         ; $527d: $ff
	di                                               ; $527e: $f3
	rst  $38                                         ; $527f: $ff
	and  e                                           ; $5280: $a3
	ld   a, a                                        ; $5281: $7f
	sbc  l                                           ; $5282: $9d
	ld   h, e                                        ; $5283: $63
	add  c                                           ; $5284: $81
	ld   a, a                                        ; $5285: $7f
	inc  bc                                          ; $5286: $03
	rst  $38                                         ; $5287: $ff
	inc  bc                                          ; $5288: $03
	rst  $38                                         ; $5289: $ff
	rst  $18                                         ; $528a: $df
	rst  $38                                         ; $528b: $ff
	xor  e                                           ; $528c: $ab
	rst  $38                                         ; $528d: $ff
	db   $d3                                         ; $528e: $d3
	rst  $38                                         ; $528f: $ff
	nop                                              ; $5290: $00
	nop                                              ; $5291: $00
	nop                                              ; $5292: $00
	nop                                              ; $5293: $00
	nop                                              ; $5294: $00
	nop                                              ; $5295: $00
	nop                                              ; $5296: $00
	nop                                              ; $5297: $00
	nop                                              ; $5298: $00
	nop                                              ; $5299: $00
	nop                                              ; $529a: $00
	nop                                              ; $529b: $00
	nop                                              ; $529c: $00
	nop                                              ; $529d: $00
	nop                                              ; $529e: $00
	nop                                              ; $529f: $00
	nop                                              ; $52a0: $00
	nop                                              ; $52a1: $00
	nop                                              ; $52a2: $00
	nop                                              ; $52a3: $00
	nop                                              ; $52a4: $00
	nop                                              ; $52a5: $00
	nop                                              ; $52a6: $00
	nop                                              ; $52a7: $00
	nop                                              ; $52a8: $00
	nop                                              ; $52a9: $00
	nop                                              ; $52aa: $00
	nop                                              ; $52ab: $00
	nop                                              ; $52ac: $00
	nop                                              ; $52ad: $00
	nop                                              ; $52ae: $00
	nop                                              ; $52af: $00
	nop                                              ; $52b0: $00
	nop                                              ; $52b1: $00
	nop                                              ; $52b2: $00
	nop                                              ; $52b3: $00
	nop                                              ; $52b4: $00
	nop                                              ; $52b5: $00
	nop                                              ; $52b6: $00
	nop                                              ; $52b7: $00
	nop                                              ; $52b8: $00
	nop                                              ; $52b9: $00
	nop                                              ; $52ba: $00
	nop                                              ; $52bb: $00
	nop                                              ; $52bc: $00
	nop                                              ; $52bd: $00
	nop                                              ; $52be: $00
	nop                                              ; $52bf: $00
	nop                                              ; $52c0: $00
	nop                                              ; $52c1: $00
	nop                                              ; $52c2: $00
	nop                                              ; $52c3: $00
	nop                                              ; $52c4: $00
	nop                                              ; $52c5: $00
	nop                                              ; $52c6: $00
	nop                                              ; $52c7: $00
	nop                                              ; $52c8: $00
	nop                                              ; $52c9: $00
	nop                                              ; $52ca: $00
	nop                                              ; $52cb: $00
	nop                                              ; $52cc: $00
	nop                                              ; $52cd: $00
	nop                                              ; $52ce: $00
	nop                                              ; $52cf: $00
	nop                                              ; $52d0: $00
	nop                                              ; $52d1: $00
	nop                                              ; $52d2: $00
	nop                                              ; $52d3: $00
	nop                                              ; $52d4: $00
	nop                                              ; $52d5: $00
	nop                                              ; $52d6: $00
	nop                                              ; $52d7: $00
	nop                                              ; $52d8: $00
	nop                                              ; $52d9: $00
	nop                                              ; $52da: $00
	nop                                              ; $52db: $00
	nop                                              ; $52dc: $00
	nop                                              ; $52dd: $00
	nop                                              ; $52de: $00
	nop                                              ; $52df: $00
	nop                                              ; $52e0: $00
	nop                                              ; $52e1: $00
	nop                                              ; $52e2: $00
	nop                                              ; $52e3: $00
	nop                                              ; $52e4: $00
	nop                                              ; $52e5: $00
	nop                                              ; $52e6: $00
	nop                                              ; $52e7: $00
	nop                                              ; $52e8: $00
	nop                                              ; $52e9: $00
	nop                                              ; $52ea: $00
	nop                                              ; $52eb: $00
	nop                                              ; $52ec: $00
	nop                                              ; $52ed: $00
	nop                                              ; $52ee: $00
	nop                                              ; $52ef: $00
	nop                                              ; $52f0: $00
	nop                                              ; $52f1: $00
	nop                                              ; $52f2: $00
	nop                                              ; $52f3: $00
	nop                                              ; $52f4: $00
	nop                                              ; $52f5: $00
	nop                                              ; $52f6: $00
	nop                                              ; $52f7: $00
	nop                                              ; $52f8: $00
	nop                                              ; $52f9: $00
	nop                                              ; $52fa: $00
	nop                                              ; $52fb: $00
	nop                                              ; $52fc: $00
	nop                                              ; $52fd: $00
	nop                                              ; $52fe: $00
	nop                                              ; $52ff: $00
	nop                                              ; $5300: $00
	nop                                              ; $5301: $00
	nop                                              ; $5302: $00
	nop                                              ; $5303: $00
	nop                                              ; $5304: $00
	nop                                              ; $5305: $00
	nop                                              ; $5306: $00
	nop                                              ; $5307: $00
	nop                                              ; $5308: $00
	nop                                              ; $5309: $00
	nop                                              ; $530a: $00
	nop                                              ; $530b: $00
	nop                                              ; $530c: $00
	nop                                              ; $530d: $00
	nop                                              ; $530e: $00
	nop                                              ; $530f: $00
	nop                                              ; $5310: $00
	nop                                              ; $5311: $00
	nop                                              ; $5312: $00
	nop                                              ; $5313: $00
	nop                                              ; $5314: $00
	nop                                              ; $5315: $00
	nop                                              ; $5316: $00
	nop                                              ; $5317: $00
	nop                                              ; $5318: $00
	nop                                              ; $5319: $00
	nop                                              ; $531a: $00
	nop                                              ; $531b: $00
	nop                                              ; $531c: $00
	nop                                              ; $531d: $00
	nop                                              ; $531e: $00
	nop                                              ; $531f: $00
	nop                                              ; $5320: $00
	nop                                              ; $5321: $00
	nop                                              ; $5322: $00
	nop                                              ; $5323: $00
	nop                                              ; $5324: $00
	nop                                              ; $5325: $00
	nop                                              ; $5326: $00
	nop                                              ; $5327: $00
	nop                                              ; $5328: $00
	nop                                              ; $5329: $00
	nop                                              ; $532a: $00
	nop                                              ; $532b: $00
	nop                                              ; $532c: $00
	nop                                              ; $532d: $00
	nop                                              ; $532e: $00
	nop                                              ; $532f: $00
	nop                                              ; $5330: $00
	nop                                              ; $5331: $00
	nop                                              ; $5332: $00
	nop                                              ; $5333: $00
	nop                                              ; $5334: $00
	nop                                              ; $5335: $00
	nop                                              ; $5336: $00
	nop                                              ; $5337: $00
	nop                                              ; $5338: $00
	nop                                              ; $5339: $00
	nop                                              ; $533a: $00
	nop                                              ; $533b: $00
	nop                                              ; $533c: $00
	nop                                              ; $533d: $00
	nop                                              ; $533e: $00
	nop                                              ; $533f: $00
	nop                                              ; $5340: $00
	nop                                              ; $5341: $00
	nop                                              ; $5342: $00
	nop                                              ; $5343: $00
	nop                                              ; $5344: $00
	nop                                              ; $5345: $00
	nop                                              ; $5346: $00
	nop                                              ; $5347: $00
	nop                                              ; $5348: $00
	nop                                              ; $5349: $00
	nop                                              ; $534a: $00
	nop                                              ; $534b: $00
	nop                                              ; $534c: $00
	nop                                              ; $534d: $00
	nop                                              ; $534e: $00
	nop                                              ; $534f: $00
	nop                                              ; $5350: $00
	nop                                              ; $5351: $00
	nop                                              ; $5352: $00
	nop                                              ; $5353: $00
	nop                                              ; $5354: $00
	nop                                              ; $5355: $00
	nop                                              ; $5356: $00
	nop                                              ; $5357: $00
	nop                                              ; $5358: $00
	nop                                              ; $5359: $00
	nop                                              ; $535a: $00
	nop                                              ; $535b: $00
	nop                                              ; $535c: $00
	nop                                              ; $535d: $00
	nop                                              ; $535e: $00
	nop                                              ; $535f: $00
	nop                                              ; $5360: $00
	nop                                              ; $5361: $00
	nop                                              ; $5362: $00
	nop                                              ; $5363: $00
	nop                                              ; $5364: $00
	nop                                              ; $5365: $00
	nop                                              ; $5366: $00
	nop                                              ; $5367: $00
	nop                                              ; $5368: $00
	nop                                              ; $5369: $00
	nop                                              ; $536a: $00
	nop                                              ; $536b: $00
	nop                                              ; $536c: $00
	nop                                              ; $536d: $00
	nop                                              ; $536e: $00
	nop                                              ; $536f: $00
	nop                                              ; $5370: $00
	nop                                              ; $5371: $00
	nop                                              ; $5372: $00
	nop                                              ; $5373: $00
	nop                                              ; $5374: $00
	nop                                              ; $5375: $00
	nop                                              ; $5376: $00
	nop                                              ; $5377: $00
	nop                                              ; $5378: $00
	nop                                              ; $5379: $00
	nop                                              ; $537a: $00
	nop                                              ; $537b: $00
	nop                                              ; $537c: $00
	nop                                              ; $537d: $00
	nop                                              ; $537e: $00
	nop                                              ; $537f: $00
	nop                                              ; $5380: $00
	nop                                              ; $5381: $00
	nop                                              ; $5382: $00
	nop                                              ; $5383: $00
	nop                                              ; $5384: $00
	nop                                              ; $5385: $00
	nop                                              ; $5386: $00
	nop                                              ; $5387: $00
	nop                                              ; $5388: $00
	nop                                              ; $5389: $00
	nop                                              ; $538a: $00
	nop                                              ; $538b: $00
	nop                                              ; $538c: $00
	nop                                              ; $538d: $00
	nop                                              ; $538e: $00
	nop                                              ; $538f: $00
	nop                                              ; $5390: $00
	nop                                              ; $5391: $00
	nop                                              ; $5392: $00
	nop                                              ; $5393: $00
	nop                                              ; $5394: $00
	nop                                              ; $5395: $00
	nop                                              ; $5396: $00
	nop                                              ; $5397: $00
	nop                                              ; $5398: $00
	nop                                              ; $5399: $00
	nop                                              ; $539a: $00
	nop                                              ; $539b: $00
	nop                                              ; $539c: $00
	nop                                              ; $539d: $00
	nop                                              ; $539e: $00
	nop                                              ; $539f: $00
	nop                                              ; $53a0: $00
	nop                                              ; $53a1: $00
	nop                                              ; $53a2: $00
	nop                                              ; $53a3: $00
	nop                                              ; $53a4: $00
	nop                                              ; $53a5: $00
	nop                                              ; $53a6: $00
	nop                                              ; $53a7: $00
	nop                                              ; $53a8: $00
	nop                                              ; $53a9: $00
	nop                                              ; $53aa: $00
	nop                                              ; $53ab: $00
	nop                                              ; $53ac: $00
	nop                                              ; $53ad: $00
	nop                                              ; $53ae: $00
	nop                                              ; $53af: $00
	nop                                              ; $53b0: $00
	nop                                              ; $53b1: $00
	nop                                              ; $53b2: $00
	nop                                              ; $53b3: $00
	nop                                              ; $53b4: $00
	nop                                              ; $53b5: $00
	nop                                              ; $53b6: $00
	nop                                              ; $53b7: $00
	nop                                              ; $53b8: $00
	nop                                              ; $53b9: $00
	nop                                              ; $53ba: $00
	nop                                              ; $53bb: $00
	nop                                              ; $53bc: $00
	nop                                              ; $53bd: $00
	nop                                              ; $53be: $00
	nop                                              ; $53bf: $00
	nop                                              ; $53c0: $00
	nop                                              ; $53c1: $00
	nop                                              ; $53c2: $00
	nop                                              ; $53c3: $00
	nop                                              ; $53c4: $00
	nop                                              ; $53c5: $00
	nop                                              ; $53c6: $00
	nop                                              ; $53c7: $00
	nop                                              ; $53c8: $00
	nop                                              ; $53c9: $00
	nop                                              ; $53ca: $00
	nop                                              ; $53cb: $00
	nop                                              ; $53cc: $00
	nop                                              ; $53cd: $00
	nop                                              ; $53ce: $00
	nop                                              ; $53cf: $00
	nop                                              ; $53d0: $00
	nop                                              ; $53d1: $00
	nop                                              ; $53d2: $00
	nop                                              ; $53d3: $00
	nop                                              ; $53d4: $00
	nop                                              ; $53d5: $00
	nop                                              ; $53d6: $00
	nop                                              ; $53d7: $00
	nop                                              ; $53d8: $00
	nop                                              ; $53d9: $00
	nop                                              ; $53da: $00
	nop                                              ; $53db: $00
	nop                                              ; $53dc: $00
	nop                                              ; $53dd: $00
	nop                                              ; $53de: $00
	nop                                              ; $53df: $00
	nop                                              ; $53e0: $00
	nop                                              ; $53e1: $00
	nop                                              ; $53e2: $00
	nop                                              ; $53e3: $00
	nop                                              ; $53e4: $00
	nop                                              ; $53e5: $00
	nop                                              ; $53e6: $00
	nop                                              ; $53e7: $00
	nop                                              ; $53e8: $00
	nop                                              ; $53e9: $00
	nop                                              ; $53ea: $00
	nop                                              ; $53eb: $00
	nop                                              ; $53ec: $00
	nop                                              ; $53ed: $00
	nop                                              ; $53ee: $00
	nop                                              ; $53ef: $00
	nop                                              ; $53f0: $00
	nop                                              ; $53f1: $00
	nop                                              ; $53f2: $00
	nop                                              ; $53f3: $00
	nop                                              ; $53f4: $00
	nop                                              ; $53f5: $00
	nop                                              ; $53f6: $00
	nop                                              ; $53f7: $00
	nop                                              ; $53f8: $00
	nop                                              ; $53f9: $00
	nop                                              ; $53fa: $00
	nop                                              ; $53fb: $00
	nop                                              ; $53fc: $00
	nop                                              ; $53fd: $00
	nop                                              ; $53fe: $00
	nop                                              ; $53ff: $00
	nop                                              ; $5400: $00
	nop                                              ; $5401: $00
	nop                                              ; $5402: $00
	nop                                              ; $5403: $00
	nop                                              ; $5404: $00
	nop                                              ; $5405: $00
	nop                                              ; $5406: $00
	nop                                              ; $5407: $00
	nop                                              ; $5408: $00
	nop                                              ; $5409: $00
	nop                                              ; $540a: $00
	nop                                              ; $540b: $00
	nop                                              ; $540c: $00
	nop                                              ; $540d: $00
	nop                                              ; $540e: $00
	nop                                              ; $540f: $00
	nop                                              ; $5410: $00
	nop                                              ; $5411: $00
	nop                                              ; $5412: $00
	nop                                              ; $5413: $00
	nop                                              ; $5414: $00
	nop                                              ; $5415: $00
	nop                                              ; $5416: $00
	nop                                              ; $5417: $00
	nop                                              ; $5418: $00
	nop                                              ; $5419: $00
	nop                                              ; $541a: $00
	nop                                              ; $541b: $00
	nop                                              ; $541c: $00
	nop                                              ; $541d: $00
	nop                                              ; $541e: $00
	nop                                              ; $541f: $00
	nop                                              ; $5420: $00
	nop                                              ; $5421: $00
	nop                                              ; $5422: $00
	nop                                              ; $5423: $00
	nop                                              ; $5424: $00
	nop                                              ; $5425: $00
	nop                                              ; $5426: $00
	nop                                              ; $5427: $00
	nop                                              ; $5428: $00
	nop                                              ; $5429: $00
	nop                                              ; $542a: $00
	nop                                              ; $542b: $00
	nop                                              ; $542c: $00
	nop                                              ; $542d: $00
	nop                                              ; $542e: $00
	nop                                              ; $542f: $00
	nop                                              ; $5430: $00
	nop                                              ; $5431: $00
	nop                                              ; $5432: $00
	nop                                              ; $5433: $00
	nop                                              ; $5434: $00
	nop                                              ; $5435: $00
	nop                                              ; $5436: $00
	nop                                              ; $5437: $00
	nop                                              ; $5438: $00
	nop                                              ; $5439: $00
	nop                                              ; $543a: $00
	nop                                              ; $543b: $00
	nop                                              ; $543c: $00
	nop                                              ; $543d: $00
	nop                                              ; $543e: $00
	nop                                              ; $543f: $00
	nop                                              ; $5440: $00
	nop                                              ; $5441: $00
	nop                                              ; $5442: $00
	nop                                              ; $5443: $00
	nop                                              ; $5444: $00
	nop                                              ; $5445: $00
	nop                                              ; $5446: $00
	nop                                              ; $5447: $00
	nop                                              ; $5448: $00
	nop                                              ; $5449: $00
	nop                                              ; $544a: $00
	nop                                              ; $544b: $00
	nop                                              ; $544c: $00
	nop                                              ; $544d: $00
	nop                                              ; $544e: $00
	nop                                              ; $544f: $00
	nop                                              ; $5450: $00
	nop                                              ; $5451: $00
	nop                                              ; $5452: $00
	nop                                              ; $5453: $00
	nop                                              ; $5454: $00
	nop                                              ; $5455: $00
	nop                                              ; $5456: $00
	nop                                              ; $5457: $00
	nop                                              ; $5458: $00
	nop                                              ; $5459: $00
	nop                                              ; $545a: $00
	nop                                              ; $545b: $00
	nop                                              ; $545c: $00
	nop                                              ; $545d: $00
	nop                                              ; $545e: $00
	nop                                              ; $545f: $00
	nop                                              ; $5460: $00
	nop                                              ; $5461: $00
	nop                                              ; $5462: $00
	nop                                              ; $5463: $00
	nop                                              ; $5464: $00
	nop                                              ; $5465: $00
	nop                                              ; $5466: $00
	nop                                              ; $5467: $00
	nop                                              ; $5468: $00
	nop                                              ; $5469: $00
	nop                                              ; $546a: $00
	nop                                              ; $546b: $00
	nop                                              ; $546c: $00
	nop                                              ; $546d: $00
	nop                                              ; $546e: $00
	nop                                              ; $546f: $00
	nop                                              ; $5470: $00
	nop                                              ; $5471: $00
	nop                                              ; $5472: $00
	nop                                              ; $5473: $00
	nop                                              ; $5474: $00
	nop                                              ; $5475: $00
	nop                                              ; $5476: $00
	nop                                              ; $5477: $00
	nop                                              ; $5478: $00
	nop                                              ; $5479: $00
	nop                                              ; $547a: $00
	nop                                              ; $547b: $00
	nop                                              ; $547c: $00
	nop                                              ; $547d: $00
	nop                                              ; $547e: $00
	nop                                              ; $547f: $00
	nop                                              ; $5480: $00
	nop                                              ; $5481: $00
	nop                                              ; $5482: $00
	nop                                              ; $5483: $00
	nop                                              ; $5484: $00
	nop                                              ; $5485: $00
	nop                                              ; $5486: $00
	nop                                              ; $5487: $00
	nop                                              ; $5488: $00
	nop                                              ; $5489: $00
	nop                                              ; $548a: $00
	nop                                              ; $548b: $00
	nop                                              ; $548c: $00
	nop                                              ; $548d: $00
	nop                                              ; $548e: $00
	nop                                              ; $548f: $00
	nop                                              ; $5490: $00
	nop                                              ; $5491: $00
	nop                                              ; $5492: $00
	nop                                              ; $5493: $00
	nop                                              ; $5494: $00
	nop                                              ; $5495: $00
	nop                                              ; $5496: $00
	nop                                              ; $5497: $00
	nop                                              ; $5498: $00
	nop                                              ; $5499: $00
	nop                                              ; $549a: $00
	nop                                              ; $549b: $00
	nop                                              ; $549c: $00
	nop                                              ; $549d: $00
	nop                                              ; $549e: $00
	nop                                              ; $549f: $00
	nop                                              ; $54a0: $00
	nop                                              ; $54a1: $00
	nop                                              ; $54a2: $00
	nop                                              ; $54a3: $00
	nop                                              ; $54a4: $00
	nop                                              ; $54a5: $00
	nop                                              ; $54a6: $00
	nop                                              ; $54a7: $00
	nop                                              ; $54a8: $00
	nop                                              ; $54a9: $00
	nop                                              ; $54aa: $00
	nop                                              ; $54ab: $00
	nop                                              ; $54ac: $00
	nop                                              ; $54ad: $00
	nop                                              ; $54ae: $00
	nop                                              ; $54af: $00
	nop                                              ; $54b0: $00
	nop                                              ; $54b1: $00
	nop                                              ; $54b2: $00
	nop                                              ; $54b3: $00
	nop                                              ; $54b4: $00
	nop                                              ; $54b5: $00
	nop                                              ; $54b6: $00
	nop                                              ; $54b7: $00
	nop                                              ; $54b8: $00
	nop                                              ; $54b9: $00
	nop                                              ; $54ba: $00
	nop                                              ; $54bb: $00
	nop                                              ; $54bc: $00
	nop                                              ; $54bd: $00
	nop                                              ; $54be: $00
	nop                                              ; $54bf: $00
	nop                                              ; $54c0: $00
	nop                                              ; $54c1: $00
	nop                                              ; $54c2: $00
	nop                                              ; $54c3: $00
	nop                                              ; $54c4: $00
	nop                                              ; $54c5: $00
	nop                                              ; $54c6: $00
	nop                                              ; $54c7: $00
	nop                                              ; $54c8: $00
	nop                                              ; $54c9: $00
	nop                                              ; $54ca: $00
	nop                                              ; $54cb: $00
	nop                                              ; $54cc: $00
	nop                                              ; $54cd: $00
	nop                                              ; $54ce: $00
	nop                                              ; $54cf: $00
	nop                                              ; $54d0: $00
	nop                                              ; $54d1: $00
	nop                                              ; $54d2: $00
	nop                                              ; $54d3: $00
	nop                                              ; $54d4: $00
	nop                                              ; $54d5: $00
	nop                                              ; $54d6: $00
	nop                                              ; $54d7: $00
	nop                                              ; $54d8: $00
	nop                                              ; $54d9: $00
	nop                                              ; $54da: $00
	nop                                              ; $54db: $00
	nop                                              ; $54dc: $00
	nop                                              ; $54dd: $00
	nop                                              ; $54de: $00
	nop                                              ; $54df: $00
	nop                                              ; $54e0: $00
	nop                                              ; $54e1: $00
	nop                                              ; $54e2: $00
	nop                                              ; $54e3: $00
	nop                                              ; $54e4: $00
	nop                                              ; $54e5: $00
	nop                                              ; $54e6: $00
	nop                                              ; $54e7: $00
	nop                                              ; $54e8: $00
	nop                                              ; $54e9: $00
	nop                                              ; $54ea: $00
	nop                                              ; $54eb: $00
	nop                                              ; $54ec: $00
	nop                                              ; $54ed: $00
	nop                                              ; $54ee: $00
	nop                                              ; $54ef: $00
	nop                                              ; $54f0: $00
	nop                                              ; $54f1: $00
	nop                                              ; $54f2: $00
	nop                                              ; $54f3: $00
	nop                                              ; $54f4: $00
	nop                                              ; $54f5: $00
	nop                                              ; $54f6: $00
	nop                                              ; $54f7: $00
	nop                                              ; $54f8: $00
	nop                                              ; $54f9: $00
	nop                                              ; $54fa: $00
	nop                                              ; $54fb: $00
	nop                                              ; $54fc: $00
	nop                                              ; $54fd: $00
	nop                                              ; $54fe: $00
	nop                                              ; $54ff: $00
	nop                                              ; $5500: $00
	nop                                              ; $5501: $00
	nop                                              ; $5502: $00
	nop                                              ; $5503: $00
	nop                                              ; $5504: $00
	nop                                              ; $5505: $00
	nop                                              ; $5506: $00
	nop                                              ; $5507: $00
	nop                                              ; $5508: $00
	nop                                              ; $5509: $00
	nop                                              ; $550a: $00
	nop                                              ; $550b: $00
	nop                                              ; $550c: $00
	nop                                              ; $550d: $00
	nop                                              ; $550e: $00
	nop                                              ; $550f: $00
	nop                                              ; $5510: $00
	nop                                              ; $5511: $00
	nop                                              ; $5512: $00
	nop                                              ; $5513: $00
	nop                                              ; $5514: $00
	nop                                              ; $5515: $00
	nop                                              ; $5516: $00
	nop                                              ; $5517: $00
	nop                                              ; $5518: $00
	nop                                              ; $5519: $00
	nop                                              ; $551a: $00
	nop                                              ; $551b: $00
	nop                                              ; $551c: $00
	nop                                              ; $551d: $00
	nop                                              ; $551e: $00
	nop                                              ; $551f: $00
	nop                                              ; $5520: $00
	nop                                              ; $5521: $00
	nop                                              ; $5522: $00
	nop                                              ; $5523: $00
	nop                                              ; $5524: $00
	nop                                              ; $5525: $00
	nop                                              ; $5526: $00
	nop                                              ; $5527: $00
	nop                                              ; $5528: $00
	nop                                              ; $5529: $00
	nop                                              ; $552a: $00
	nop                                              ; $552b: $00
	nop                                              ; $552c: $00
	nop                                              ; $552d: $00
	nop                                              ; $552e: $00
	nop                                              ; $552f: $00
	nop                                              ; $5530: $00
	nop                                              ; $5531: $00
	nop                                              ; $5532: $00
	nop                                              ; $5533: $00
	nop                                              ; $5534: $00
	nop                                              ; $5535: $00
	nop                                              ; $5536: $00
	nop                                              ; $5537: $00
	nop                                              ; $5538: $00
	nop                                              ; $5539: $00
	nop                                              ; $553a: $00
	nop                                              ; $553b: $00
	nop                                              ; $553c: $00
	nop                                              ; $553d: $00
	nop                                              ; $553e: $00
	nop                                              ; $553f: $00
	nop                                              ; $5540: $00
	nop                                              ; $5541: $00
	nop                                              ; $5542: $00
	nop                                              ; $5543: $00
	nop                                              ; $5544: $00
	nop                                              ; $5545: $00
	nop                                              ; $5546: $00
	nop                                              ; $5547: $00
	nop                                              ; $5548: $00
	nop                                              ; $5549: $00
	nop                                              ; $554a: $00
	nop                                              ; $554b: $00
	nop                                              ; $554c: $00
	nop                                              ; $554d: $00
	nop                                              ; $554e: $00
	nop                                              ; $554f: $00
	nop                                              ; $5550: $00
	nop                                              ; $5551: $00
	nop                                              ; $5552: $00
	nop                                              ; $5553: $00
	nop                                              ; $5554: $00
	nop                                              ; $5555: $00
	nop                                              ; $5556: $00
	nop                                              ; $5557: $00
	nop                                              ; $5558: $00
	nop                                              ; $5559: $00
	nop                                              ; $555a: $00
	nop                                              ; $555b: $00
	nop                                              ; $555c: $00
	nop                                              ; $555d: $00
	nop                                              ; $555e: $00
	nop                                              ; $555f: $00
	nop                                              ; $5560: $00
	nop                                              ; $5561: $00
	nop                                              ; $5562: $00
	nop                                              ; $5563: $00
	nop                                              ; $5564: $00
	nop                                              ; $5565: $00
	nop                                              ; $5566: $00
	nop                                              ; $5567: $00
	nop                                              ; $5568: $00
	nop                                              ; $5569: $00
	nop                                              ; $556a: $00
	nop                                              ; $556b: $00
	nop                                              ; $556c: $00
	nop                                              ; $556d: $00
	nop                                              ; $556e: $00
	nop                                              ; $556f: $00
	nop                                              ; $5570: $00
	nop                                              ; $5571: $00
	nop                                              ; $5572: $00
	nop                                              ; $5573: $00
	nop                                              ; $5574: $00
	nop                                              ; $5575: $00
	nop                                              ; $5576: $00
	nop                                              ; $5577: $00
	nop                                              ; $5578: $00
	nop                                              ; $5579: $00
	nop                                              ; $557a: $00
	nop                                              ; $557b: $00
	nop                                              ; $557c: $00
	nop                                              ; $557d: $00
	nop                                              ; $557e: $00
	nop                                              ; $557f: $00
	nop                                              ; $5580: $00
	nop                                              ; $5581: $00
	nop                                              ; $5582: $00
	nop                                              ; $5583: $00
	nop                                              ; $5584: $00
	nop                                              ; $5585: $00
	nop                                              ; $5586: $00
	nop                                              ; $5587: $00
	nop                                              ; $5588: $00
	nop                                              ; $5589: $00
	nop                                              ; $558a: $00
	nop                                              ; $558b: $00
	nop                                              ; $558c: $00
	nop                                              ; $558d: $00
	nop                                              ; $558e: $00
	nop                                              ; $558f: $00
	nop                                              ; $5590: $00
	nop                                              ; $5591: $00
	nop                                              ; $5592: $00
	nop                                              ; $5593: $00
	nop                                              ; $5594: $00
	nop                                              ; $5595: $00
	nop                                              ; $5596: $00
	nop                                              ; $5597: $00
	nop                                              ; $5598: $00
	nop                                              ; $5599: $00
	nop                                              ; $559a: $00
	nop                                              ; $559b: $00
	nop                                              ; $559c: $00
	nop                                              ; $559d: $00
	nop                                              ; $559e: $00
	nop                                              ; $559f: $00
	nop                                              ; $55a0: $00
	nop                                              ; $55a1: $00
	nop                                              ; $55a2: $00
	nop                                              ; $55a3: $00
	nop                                              ; $55a4: $00
	nop                                              ; $55a5: $00
	nop                                              ; $55a6: $00
	nop                                              ; $55a7: $00
	nop                                              ; $55a8: $00
	nop                                              ; $55a9: $00
	nop                                              ; $55aa: $00
	nop                                              ; $55ab: $00
	nop                                              ; $55ac: $00
	nop                                              ; $55ad: $00
	nop                                              ; $55ae: $00
	nop                                              ; $55af: $00
	nop                                              ; $55b0: $00
	nop                                              ; $55b1: $00
	nop                                              ; $55b2: $00
	nop                                              ; $55b3: $00
	nop                                              ; $55b4: $00
	nop                                              ; $55b5: $00
	nop                                              ; $55b6: $00
	nop                                              ; $55b7: $00
	nop                                              ; $55b8: $00
	nop                                              ; $55b9: $00
	nop                                              ; $55ba: $00
	nop                                              ; $55bb: $00
	nop                                              ; $55bc: $00
	nop                                              ; $55bd: $00
	nop                                              ; $55be: $00
	nop                                              ; $55bf: $00
	nop                                              ; $55c0: $00
	nop                                              ; $55c1: $00
	nop                                              ; $55c2: $00
	nop                                              ; $55c3: $00
	nop                                              ; $55c4: $00
	nop                                              ; $55c5: $00
	nop                                              ; $55c6: $00
	nop                                              ; $55c7: $00
	nop                                              ; $55c8: $00
	nop                                              ; $55c9: $00
	nop                                              ; $55ca: $00
	nop                                              ; $55cb: $00
	nop                                              ; $55cc: $00
	nop                                              ; $55cd: $00
	nop                                              ; $55ce: $00
	nop                                              ; $55cf: $00
	nop                                              ; $55d0: $00
	nop                                              ; $55d1: $00
	nop                                              ; $55d2: $00
	nop                                              ; $55d3: $00
	nop                                              ; $55d4: $00
	nop                                              ; $55d5: $00
	nop                                              ; $55d6: $00
	nop                                              ; $55d7: $00
	nop                                              ; $55d8: $00
	nop                                              ; $55d9: $00
	nop                                              ; $55da: $00
	nop                                              ; $55db: $00
	nop                                              ; $55dc: $00
	nop                                              ; $55dd: $00
	nop                                              ; $55de: $00
	nop                                              ; $55df: $00
	nop                                              ; $55e0: $00
	nop                                              ; $55e1: $00
	nop                                              ; $55e2: $00
	nop                                              ; $55e3: $00
	nop                                              ; $55e4: $00
	nop                                              ; $55e5: $00
	nop                                              ; $55e6: $00
	nop                                              ; $55e7: $00
	nop                                              ; $55e8: $00
	nop                                              ; $55e9: $00
	nop                                              ; $55ea: $00
	nop                                              ; $55eb: $00
	nop                                              ; $55ec: $00
	nop                                              ; $55ed: $00
	nop                                              ; $55ee: $00
	nop                                              ; $55ef: $00
	nop                                              ; $55f0: $00
	nop                                              ; $55f1: $00
	nop                                              ; $55f2: $00
	nop                                              ; $55f3: $00
	nop                                              ; $55f4: $00

Jump_095_55f5:
	nop                                              ; $55f5: $00
	nop                                              ; $55f6: $00
	nop                                              ; $55f7: $00
	nop                                              ; $55f8: $00
	nop                                              ; $55f9: $00
	nop                                              ; $55fa: $00
	nop                                              ; $55fb: $00
	nop                                              ; $55fc: $00
	nop                                              ; $55fd: $00
	nop                                              ; $55fe: $00
	nop                                              ; $55ff: $00
	nop                                              ; $5600: $00
	nop                                              ; $5601: $00
	nop                                              ; $5602: $00
	nop                                              ; $5603: $00
	nop                                              ; $5604: $00
	nop                                              ; $5605: $00
	nop                                              ; $5606: $00
	nop                                              ; $5607: $00
	nop                                              ; $5608: $00
	nop                                              ; $5609: $00
	nop                                              ; $560a: $00
	nop                                              ; $560b: $00
	nop                                              ; $560c: $00
	nop                                              ; $560d: $00
	nop                                              ; $560e: $00
	nop                                              ; $560f: $00
	nop                                              ; $5610: $00
	nop                                              ; $5611: $00
	nop                                              ; $5612: $00
	nop                                              ; $5613: $00
	nop                                              ; $5614: $00
	nop                                              ; $5615: $00
	nop                                              ; $5616: $00
	nop                                              ; $5617: $00
	nop                                              ; $5618: $00
	nop                                              ; $5619: $00
	nop                                              ; $561a: $00
	nop                                              ; $561b: $00
	nop                                              ; $561c: $00
	nop                                              ; $561d: $00
	nop                                              ; $561e: $00
	nop                                              ; $561f: $00
	nop                                              ; $5620: $00
	nop                                              ; $5621: $00
	nop                                              ; $5622: $00
	nop                                              ; $5623: $00
	nop                                              ; $5624: $00
	nop                                              ; $5625: $00
	nop                                              ; $5626: $00
	nop                                              ; $5627: $00
	nop                                              ; $5628: $00
	nop                                              ; $5629: $00
	nop                                              ; $562a: $00
	nop                                              ; $562b: $00
	nop                                              ; $562c: $00
	nop                                              ; $562d: $00
	nop                                              ; $562e: $00
	nop                                              ; $562f: $00
	nop                                              ; $5630: $00
	nop                                              ; $5631: $00
	nop                                              ; $5632: $00
	nop                                              ; $5633: $00
	nop                                              ; $5634: $00
	nop                                              ; $5635: $00
	nop                                              ; $5636: $00
	nop                                              ; $5637: $00
	nop                                              ; $5638: $00
	nop                                              ; $5639: $00
	nop                                              ; $563a: $00
	nop                                              ; $563b: $00
	nop                                              ; $563c: $00
	nop                                              ; $563d: $00
	nop                                              ; $563e: $00
	nop                                              ; $563f: $00
	nop                                              ; $5640: $00
	nop                                              ; $5641: $00
	nop                                              ; $5642: $00
	nop                                              ; $5643: $00
	nop                                              ; $5644: $00
	nop                                              ; $5645: $00
	nop                                              ; $5646: $00
	nop                                              ; $5647: $00
	nop                                              ; $5648: $00
	nop                                              ; $5649: $00
	nop                                              ; $564a: $00
	nop                                              ; $564b: $00
	nop                                              ; $564c: $00
	nop                                              ; $564d: $00
	nop                                              ; $564e: $00
	nop                                              ; $564f: $00
	nop                                              ; $5650: $00
	nop                                              ; $5651: $00
	nop                                              ; $5652: $00
	nop                                              ; $5653: $00
	nop                                              ; $5654: $00
	nop                                              ; $5655: $00
	nop                                              ; $5656: $00
	nop                                              ; $5657: $00
	nop                                              ; $5658: $00
	nop                                              ; $5659: $00
	nop                                              ; $565a: $00
	nop                                              ; $565b: $00
	nop                                              ; $565c: $00
	nop                                              ; $565d: $00
	nop                                              ; $565e: $00
	nop                                              ; $565f: $00
	nop                                              ; $5660: $00
	nop                                              ; $5661: $00
	nop                                              ; $5662: $00
	nop                                              ; $5663: $00
	nop                                              ; $5664: $00
	nop                                              ; $5665: $00
	nop                                              ; $5666: $00
	nop                                              ; $5667: $00
	nop                                              ; $5668: $00
	nop                                              ; $5669: $00
	nop                                              ; $566a: $00
	nop                                              ; $566b: $00
	nop                                              ; $566c: $00
	nop                                              ; $566d: $00
	nop                                              ; $566e: $00
	nop                                              ; $566f: $00
	nop                                              ; $5670: $00
	nop                                              ; $5671: $00
	nop                                              ; $5672: $00
	nop                                              ; $5673: $00
	nop                                              ; $5674: $00
	nop                                              ; $5675: $00
	nop                                              ; $5676: $00
	nop                                              ; $5677: $00
	nop                                              ; $5678: $00
	nop                                              ; $5679: $00
	nop                                              ; $567a: $00
	nop                                              ; $567b: $00
	nop                                              ; $567c: $00
	nop                                              ; $567d: $00
	nop                                              ; $567e: $00
	nop                                              ; $567f: $00
	nop                                              ; $5680: $00
	nop                                              ; $5681: $00
	nop                                              ; $5682: $00
	nop                                              ; $5683: $00
	nop                                              ; $5684: $00
	nop                                              ; $5685: $00
	nop                                              ; $5686: $00
	nop                                              ; $5687: $00
	nop                                              ; $5688: $00
	nop                                              ; $5689: $00
	nop                                              ; $568a: $00
	nop                                              ; $568b: $00
	nop                                              ; $568c: $00
	nop                                              ; $568d: $00
	nop                                              ; $568e: $00
	nop                                              ; $568f: $00
	nop                                              ; $5690: $00
	nop                                              ; $5691: $00
	nop                                              ; $5692: $00
	nop                                              ; $5693: $00
	nop                                              ; $5694: $00
	nop                                              ; $5695: $00
	nop                                              ; $5696: $00
	nop                                              ; $5697: $00
	nop                                              ; $5698: $00
	nop                                              ; $5699: $00
	nop                                              ; $569a: $00
	nop                                              ; $569b: $00
	nop                                              ; $569c: $00
	nop                                              ; $569d: $00
	nop                                              ; $569e: $00
	nop                                              ; $569f: $00
	nop                                              ; $56a0: $00
	nop                                              ; $56a1: $00
	nop                                              ; $56a2: $00
	nop                                              ; $56a3: $00
	nop                                              ; $56a4: $00
	nop                                              ; $56a5: $00
	nop                                              ; $56a6: $00
	nop                                              ; $56a7: $00
	nop                                              ; $56a8: $00
	nop                                              ; $56a9: $00
	nop                                              ; $56aa: $00
	nop                                              ; $56ab: $00
	nop                                              ; $56ac: $00
	nop                                              ; $56ad: $00
	nop                                              ; $56ae: $00
	nop                                              ; $56af: $00
	nop                                              ; $56b0: $00
	nop                                              ; $56b1: $00
	nop                                              ; $56b2: $00
	nop                                              ; $56b3: $00
	nop                                              ; $56b4: $00
	nop                                              ; $56b5: $00
	nop                                              ; $56b6: $00
	nop                                              ; $56b7: $00
	nop                                              ; $56b8: $00
	nop                                              ; $56b9: $00
	nop                                              ; $56ba: $00
	nop                                              ; $56bb: $00
	nop                                              ; $56bc: $00
	nop                                              ; $56bd: $00
	nop                                              ; $56be: $00
	nop                                              ; $56bf: $00
	nop                                              ; $56c0: $00
	nop                                              ; $56c1: $00
	nop                                              ; $56c2: $00
	nop                                              ; $56c3: $00
	nop                                              ; $56c4: $00
	nop                                              ; $56c5: $00
	nop                                              ; $56c6: $00
	nop                                              ; $56c7: $00
	nop                                              ; $56c8: $00
	nop                                              ; $56c9: $00
	nop                                              ; $56ca: $00
	nop                                              ; $56cb: $00
	nop                                              ; $56cc: $00
	nop                                              ; $56cd: $00
	nop                                              ; $56ce: $00
	nop                                              ; $56cf: $00
	nop                                              ; $56d0: $00
	nop                                              ; $56d1: $00
	nop                                              ; $56d2: $00
	nop                                              ; $56d3: $00
	nop                                              ; $56d4: $00
	nop                                              ; $56d5: $00
	nop                                              ; $56d6: $00
	nop                                              ; $56d7: $00
	nop                                              ; $56d8: $00
	nop                                              ; $56d9: $00
	nop                                              ; $56da: $00
	nop                                              ; $56db: $00
	nop                                              ; $56dc: $00
	nop                                              ; $56dd: $00
	nop                                              ; $56de: $00
	nop                                              ; $56df: $00
	nop                                              ; $56e0: $00
	nop                                              ; $56e1: $00
	nop                                              ; $56e2: $00
	nop                                              ; $56e3: $00
	nop                                              ; $56e4: $00
	nop                                              ; $56e5: $00
	nop                                              ; $56e6: $00
	nop                                              ; $56e7: $00
	nop                                              ; $56e8: $00
	nop                                              ; $56e9: $00
	nop                                              ; $56ea: $00
	nop                                              ; $56eb: $00
	nop                                              ; $56ec: $00
	nop                                              ; $56ed: $00
	nop                                              ; $56ee: $00
	nop                                              ; $56ef: $00
	nop                                              ; $56f0: $00
	nop                                              ; $56f1: $00
	nop                                              ; $56f2: $00
	nop                                              ; $56f3: $00
	nop                                              ; $56f4: $00
	nop                                              ; $56f5: $00
	nop                                              ; $56f6: $00
	nop                                              ; $56f7: $00
	nop                                              ; $56f8: $00
	nop                                              ; $56f9: $00
	nop                                              ; $56fa: $00
	nop                                              ; $56fb: $00
	nop                                              ; $56fc: $00
	nop                                              ; $56fd: $00
	nop                                              ; $56fe: $00
	nop                                              ; $56ff: $00
	nop                                              ; $5700: $00
	nop                                              ; $5701: $00
	nop                                              ; $5702: $00
	nop                                              ; $5703: $00
	nop                                              ; $5704: $00
	nop                                              ; $5705: $00
	nop                                              ; $5706: $00
	nop                                              ; $5707: $00
	nop                                              ; $5708: $00
	nop                                              ; $5709: $00
	nop                                              ; $570a: $00
	nop                                              ; $570b: $00
	nop                                              ; $570c: $00
	nop                                              ; $570d: $00
	nop                                              ; $570e: $00
	nop                                              ; $570f: $00
	nop                                              ; $5710: $00
	nop                                              ; $5711: $00
	nop                                              ; $5712: $00
	nop                                              ; $5713: $00
	nop                                              ; $5714: $00
	nop                                              ; $5715: $00
	nop                                              ; $5716: $00
	nop                                              ; $5717: $00
	nop                                              ; $5718: $00
	nop                                              ; $5719: $00
	nop                                              ; $571a: $00
	nop                                              ; $571b: $00
	nop                                              ; $571c: $00
	nop                                              ; $571d: $00
	nop                                              ; $571e: $00
	nop                                              ; $571f: $00
	nop                                              ; $5720: $00
	nop                                              ; $5721: $00
	nop                                              ; $5722: $00
	nop                                              ; $5723: $00
	nop                                              ; $5724: $00
	nop                                              ; $5725: $00
	nop                                              ; $5726: $00
	nop                                              ; $5727: $00
	nop                                              ; $5728: $00
	nop                                              ; $5729: $00
	nop                                              ; $572a: $00
	nop                                              ; $572b: $00
	nop                                              ; $572c: $00
	nop                                              ; $572d: $00
	nop                                              ; $572e: $00
	nop                                              ; $572f: $00
	nop                                              ; $5730: $00
	nop                                              ; $5731: $00
	nop                                              ; $5732: $00
	nop                                              ; $5733: $00
	nop                                              ; $5734: $00
	nop                                              ; $5735: $00
	nop                                              ; $5736: $00
	nop                                              ; $5737: $00
	nop                                              ; $5738: $00
	nop                                              ; $5739: $00
	nop                                              ; $573a: $00
	nop                                              ; $573b: $00
	nop                                              ; $573c: $00
	nop                                              ; $573d: $00
	nop                                              ; $573e: $00
	nop                                              ; $573f: $00
	nop                                              ; $5740: $00
	nop                                              ; $5741: $00
	nop                                              ; $5742: $00
	nop                                              ; $5743: $00
	nop                                              ; $5744: $00
	nop                                              ; $5745: $00
	nop                                              ; $5746: $00
	nop                                              ; $5747: $00
	nop                                              ; $5748: $00
	nop                                              ; $5749: $00
	nop                                              ; $574a: $00
	nop                                              ; $574b: $00
	nop                                              ; $574c: $00
	nop                                              ; $574d: $00
	nop                                              ; $574e: $00
	nop                                              ; $574f: $00
	nop                                              ; $5750: $00
	nop                                              ; $5751: $00
	nop                                              ; $5752: $00
	nop                                              ; $5753: $00
	nop                                              ; $5754: $00
	nop                                              ; $5755: $00
	nop                                              ; $5756: $00
	nop                                              ; $5757: $00
	nop                                              ; $5758: $00
	nop                                              ; $5759: $00
	nop                                              ; $575a: $00
	nop                                              ; $575b: $00
	nop                                              ; $575c: $00
	nop                                              ; $575d: $00
	nop                                              ; $575e: $00
	nop                                              ; $575f: $00
	nop                                              ; $5760: $00
	nop                                              ; $5761: $00
	nop                                              ; $5762: $00
	nop                                              ; $5763: $00
	nop                                              ; $5764: $00
	nop                                              ; $5765: $00
	nop                                              ; $5766: $00
	nop                                              ; $5767: $00
	nop                                              ; $5768: $00
	nop                                              ; $5769: $00
	nop                                              ; $576a: $00
	nop                                              ; $576b: $00
	nop                                              ; $576c: $00
	nop                                              ; $576d: $00
	nop                                              ; $576e: $00
	nop                                              ; $576f: $00
	nop                                              ; $5770: $00
	nop                                              ; $5771: $00
	nop                                              ; $5772: $00
	nop                                              ; $5773: $00
	nop                                              ; $5774: $00
	nop                                              ; $5775: $00
	nop                                              ; $5776: $00
	nop                                              ; $5777: $00
	nop                                              ; $5778: $00
	nop                                              ; $5779: $00
	nop                                              ; $577a: $00
	nop                                              ; $577b: $00
	nop                                              ; $577c: $00
	nop                                              ; $577d: $00
	nop                                              ; $577e: $00
	nop                                              ; $577f: $00
	nop                                              ; $5780: $00
	nop                                              ; $5781: $00
	nop                                              ; $5782: $00
	nop                                              ; $5783: $00
	nop                                              ; $5784: $00
	nop                                              ; $5785: $00
	nop                                              ; $5786: $00
	nop                                              ; $5787: $00
	nop                                              ; $5788: $00
	nop                                              ; $5789: $00
	nop                                              ; $578a: $00
	nop                                              ; $578b: $00
	nop                                              ; $578c: $00
	nop                                              ; $578d: $00
	nop                                              ; $578e: $00
	nop                                              ; $578f: $00
	nop                                              ; $5790: $00
	nop                                              ; $5791: $00
	nop                                              ; $5792: $00
	nop                                              ; $5793: $00
	nop                                              ; $5794: $00
	nop                                              ; $5795: $00
	nop                                              ; $5796: $00
	nop                                              ; $5797: $00
	nop                                              ; $5798: $00
	nop                                              ; $5799: $00
	nop                                              ; $579a: $00
	nop                                              ; $579b: $00
	nop                                              ; $579c: $00
	nop                                              ; $579d: $00
	nop                                              ; $579e: $00
	nop                                              ; $579f: $00
	nop                                              ; $57a0: $00
	nop                                              ; $57a1: $00
	nop                                              ; $57a2: $00
	nop                                              ; $57a3: $00
	nop                                              ; $57a4: $00
	nop                                              ; $57a5: $00
	nop                                              ; $57a6: $00
	nop                                              ; $57a7: $00
	nop                                              ; $57a8: $00
	nop                                              ; $57a9: $00
	nop                                              ; $57aa: $00
	nop                                              ; $57ab: $00
	nop                                              ; $57ac: $00
	nop                                              ; $57ad: $00
	nop                                              ; $57ae: $00
	nop                                              ; $57af: $00
	nop                                              ; $57b0: $00
	nop                                              ; $57b1: $00
	nop                                              ; $57b2: $00
	nop                                              ; $57b3: $00
	nop                                              ; $57b4: $00
	nop                                              ; $57b5: $00
	nop                                              ; $57b6: $00
	nop                                              ; $57b7: $00
	nop                                              ; $57b8: $00
	nop                                              ; $57b9: $00
	nop                                              ; $57ba: $00
	nop                                              ; $57bb: $00
	nop                                              ; $57bc: $00
	nop                                              ; $57bd: $00
	nop                                              ; $57be: $00
	nop                                              ; $57bf: $00
	nop                                              ; $57c0: $00
	nop                                              ; $57c1: $00
	nop                                              ; $57c2: $00
	nop                                              ; $57c3: $00
	nop                                              ; $57c4: $00
	nop                                              ; $57c5: $00
	nop                                              ; $57c6: $00
	nop                                              ; $57c7: $00
	nop                                              ; $57c8: $00
	nop                                              ; $57c9: $00
	nop                                              ; $57ca: $00
	nop                                              ; $57cb: $00
	nop                                              ; $57cc: $00
	nop                                              ; $57cd: $00
	nop                                              ; $57ce: $00
	nop                                              ; $57cf: $00
	nop                                              ; $57d0: $00
	nop                                              ; $57d1: $00
	nop                                              ; $57d2: $00
	nop                                              ; $57d3: $00
	nop                                              ; $57d4: $00
	nop                                              ; $57d5: $00
	nop                                              ; $57d6: $00
	nop                                              ; $57d7: $00
	nop                                              ; $57d8: $00
	nop                                              ; $57d9: $00
	nop                                              ; $57da: $00
	nop                                              ; $57db: $00
	nop                                              ; $57dc: $00
	nop                                              ; $57dd: $00
	nop                                              ; $57de: $00
	nop                                              ; $57df: $00
	nop                                              ; $57e0: $00
	nop                                              ; $57e1: $00
	nop                                              ; $57e2: $00
	nop                                              ; $57e3: $00
	nop                                              ; $57e4: $00
	nop                                              ; $57e5: $00
	nop                                              ; $57e6: $00
	nop                                              ; $57e7: $00
	nop                                              ; $57e8: $00
	nop                                              ; $57e9: $00
	nop                                              ; $57ea: $00
	nop                                              ; $57eb: $00
	nop                                              ; $57ec: $00
	nop                                              ; $57ed: $00
	nop                                              ; $57ee: $00
	nop                                              ; $57ef: $00
	nop                                              ; $57f0: $00
	nop                                              ; $57f1: $00
	nop                                              ; $57f2: $00
	nop                                              ; $57f3: $00
	nop                                              ; $57f4: $00
	nop                                              ; $57f5: $00
	nop                                              ; $57f6: $00
	nop                                              ; $57f7: $00
	nop                                              ; $57f8: $00
	nop                                              ; $57f9: $00
	nop                                              ; $57fa: $00
	nop                                              ; $57fb: $00
	nop                                              ; $57fc: $00
	nop                                              ; $57fd: $00
	nop                                              ; $57fe: $00
	nop                                              ; $57ff: $00
	nop                                              ; $5800: $00
	nop                                              ; $5801: $00
	nop                                              ; $5802: $00
	nop                                              ; $5803: $00
	nop                                              ; $5804: $00
	nop                                              ; $5805: $00
	nop                                              ; $5806: $00
	nop                                              ; $5807: $00
	nop                                              ; $5808: $00
	nop                                              ; $5809: $00
	nop                                              ; $580a: $00
	nop                                              ; $580b: $00
	nop                                              ; $580c: $00
	nop                                              ; $580d: $00
	nop                                              ; $580e: $00
	nop                                              ; $580f: $00
	nop                                              ; $5810: $00
	nop                                              ; $5811: $00
	nop                                              ; $5812: $00
	nop                                              ; $5813: $00
	nop                                              ; $5814: $00
	nop                                              ; $5815: $00
	nop                                              ; $5816: $00
	nop                                              ; $5817: $00
	nop                                              ; $5818: $00
	nop                                              ; $5819: $00
	nop                                              ; $581a: $00
	nop                                              ; $581b: $00
	nop                                              ; $581c: $00
	nop                                              ; $581d: $00
	nop                                              ; $581e: $00
	nop                                              ; $581f: $00
	nop                                              ; $5820: $00
	nop                                              ; $5821: $00
	nop                                              ; $5822: $00
	nop                                              ; $5823: $00
	nop                                              ; $5824: $00
	nop                                              ; $5825: $00
	nop                                              ; $5826: $00
	nop                                              ; $5827: $00
	nop                                              ; $5828: $00
	nop                                              ; $5829: $00
	nop                                              ; $582a: $00
	nop                                              ; $582b: $00
	nop                                              ; $582c: $00
	nop                                              ; $582d: $00
	nop                                              ; $582e: $00
	nop                                              ; $582f: $00
	nop                                              ; $5830: $00
	nop                                              ; $5831: $00
	nop                                              ; $5832: $00
	nop                                              ; $5833: $00
	nop                                              ; $5834: $00
	nop                                              ; $5835: $00
	nop                                              ; $5836: $00
	nop                                              ; $5837: $00
	nop                                              ; $5838: $00
	nop                                              ; $5839: $00
	nop                                              ; $583a: $00
	nop                                              ; $583b: $00
	nop                                              ; $583c: $00
	nop                                              ; $583d: $00
	nop                                              ; $583e: $00
	nop                                              ; $583f: $00
	nop                                              ; $5840: $00
	nop                                              ; $5841: $00
	nop                                              ; $5842: $00
	nop                                              ; $5843: $00
	nop                                              ; $5844: $00
	nop                                              ; $5845: $00
	nop                                              ; $5846: $00
	nop                                              ; $5847: $00
	nop                                              ; $5848: $00
	nop                                              ; $5849: $00
	nop                                              ; $584a: $00
	nop                                              ; $584b: $00
	nop                                              ; $584c: $00
	nop                                              ; $584d: $00
	nop                                              ; $584e: $00
	nop                                              ; $584f: $00
	nop                                              ; $5850: $00
	nop                                              ; $5851: $00
	nop                                              ; $5852: $00
	nop                                              ; $5853: $00
	nop                                              ; $5854: $00
	nop                                              ; $5855: $00
	nop                                              ; $5856: $00
	nop                                              ; $5857: $00
	nop                                              ; $5858: $00
	nop                                              ; $5859: $00
	nop                                              ; $585a: $00
	nop                                              ; $585b: $00
	nop                                              ; $585c: $00
	nop                                              ; $585d: $00
	nop                                              ; $585e: $00
	nop                                              ; $585f: $00
	nop                                              ; $5860: $00
	nop                                              ; $5861: $00
	nop                                              ; $5862: $00
	nop                                              ; $5863: $00
	nop                                              ; $5864: $00
	nop                                              ; $5865: $00
	nop                                              ; $5866: $00
	nop                                              ; $5867: $00
	nop                                              ; $5868: $00
	nop                                              ; $5869: $00
	nop                                              ; $586a: $00
	nop                                              ; $586b: $00
	nop                                              ; $586c: $00
	nop                                              ; $586d: $00
	nop                                              ; $586e: $00
	nop                                              ; $586f: $00
	nop                                              ; $5870: $00
	nop                                              ; $5871: $00
	nop                                              ; $5872: $00
	nop                                              ; $5873: $00
	nop                                              ; $5874: $00
	nop                                              ; $5875: $00
	nop                                              ; $5876: $00
	nop                                              ; $5877: $00
	nop                                              ; $5878: $00
	nop                                              ; $5879: $00
	nop                                              ; $587a: $00
	nop                                              ; $587b: $00
	nop                                              ; $587c: $00
	nop                                              ; $587d: $00
	nop                                              ; $587e: $00
	nop                                              ; $587f: $00
	nop                                              ; $5880: $00
	nop                                              ; $5881: $00
	nop                                              ; $5882: $00
	nop                                              ; $5883: $00
	nop                                              ; $5884: $00
	nop                                              ; $5885: $00
	nop                                              ; $5886: $00
	nop                                              ; $5887: $00
	nop                                              ; $5888: $00
	nop                                              ; $5889: $00
	nop                                              ; $588a: $00
	nop                                              ; $588b: $00
	nop                                              ; $588c: $00
	nop                                              ; $588d: $00
	nop                                              ; $588e: $00
	nop                                              ; $588f: $00
	nop                                              ; $5890: $00
	nop                                              ; $5891: $00
	nop                                              ; $5892: $00
	nop                                              ; $5893: $00
	nop                                              ; $5894: $00
	nop                                              ; $5895: $00
	nop                                              ; $5896: $00
	nop                                              ; $5897: $00
	nop                                              ; $5898: $00
	nop                                              ; $5899: $00
	nop                                              ; $589a: $00
	nop                                              ; $589b: $00
	nop                                              ; $589c: $00
	nop                                              ; $589d: $00
	nop                                              ; $589e: $00
	nop                                              ; $589f: $00
	nop                                              ; $58a0: $00
	nop                                              ; $58a1: $00
	nop                                              ; $58a2: $00
	nop                                              ; $58a3: $00
	nop                                              ; $58a4: $00
	nop                                              ; $58a5: $00
	nop                                              ; $58a6: $00
	nop                                              ; $58a7: $00
	nop                                              ; $58a8: $00
	nop                                              ; $58a9: $00
	nop                                              ; $58aa: $00
	nop                                              ; $58ab: $00
	nop                                              ; $58ac: $00
	nop                                              ; $58ad: $00
	nop                                              ; $58ae: $00
	nop                                              ; $58af: $00
	nop                                              ; $58b0: $00
	nop                                              ; $58b1: $00
	nop                                              ; $58b2: $00
	nop                                              ; $58b3: $00
	nop                                              ; $58b4: $00
	nop                                              ; $58b5: $00
	nop                                              ; $58b6: $00
	nop                                              ; $58b7: $00
	nop                                              ; $58b8: $00
	nop                                              ; $58b9: $00
	nop                                              ; $58ba: $00
	nop                                              ; $58bb: $00
	nop                                              ; $58bc: $00
	nop                                              ; $58bd: $00
	nop                                              ; $58be: $00
	nop                                              ; $58bf: $00
	nop                                              ; $58c0: $00
	nop                                              ; $58c1: $00
	nop                                              ; $58c2: $00
	nop                                              ; $58c3: $00
	nop                                              ; $58c4: $00
	nop                                              ; $58c5: $00
	nop                                              ; $58c6: $00
	nop                                              ; $58c7: $00
	nop                                              ; $58c8: $00
	nop                                              ; $58c9: $00
	nop                                              ; $58ca: $00
	nop                                              ; $58cb: $00
	nop                                              ; $58cc: $00
	nop                                              ; $58cd: $00
	nop                                              ; $58ce: $00
	nop                                              ; $58cf: $00
	nop                                              ; $58d0: $00
	nop                                              ; $58d1: $00
	nop                                              ; $58d2: $00
	nop                                              ; $58d3: $00
	nop                                              ; $58d4: $00
	nop                                              ; $58d5: $00
	nop                                              ; $58d6: $00
	nop                                              ; $58d7: $00
	nop                                              ; $58d8: $00
	nop                                              ; $58d9: $00
	nop                                              ; $58da: $00
	nop                                              ; $58db: $00
	nop                                              ; $58dc: $00
	nop                                              ; $58dd: $00
	nop                                              ; $58de: $00
	nop                                              ; $58df: $00
	nop                                              ; $58e0: $00
	nop                                              ; $58e1: $00
	nop                                              ; $58e2: $00
	nop                                              ; $58e3: $00
	nop                                              ; $58e4: $00
	nop                                              ; $58e5: $00
	nop                                              ; $58e6: $00
	nop                                              ; $58e7: $00
	nop                                              ; $58e8: $00
	nop                                              ; $58e9: $00
	nop                                              ; $58ea: $00
	nop                                              ; $58eb: $00
	nop                                              ; $58ec: $00
	nop                                              ; $58ed: $00
	nop                                              ; $58ee: $00
	nop                                              ; $58ef: $00
	nop                                              ; $58f0: $00
	nop                                              ; $58f1: $00
	nop                                              ; $58f2: $00
	nop                                              ; $58f3: $00
	nop                                              ; $58f4: $00
	nop                                              ; $58f5: $00
	nop                                              ; $58f6: $00
	nop                                              ; $58f7: $00
	nop                                              ; $58f8: $00
	nop                                              ; $58f9: $00
	nop                                              ; $58fa: $00
	nop                                              ; $58fb: $00
	nop                                              ; $58fc: $00
	nop                                              ; $58fd: $00
	nop                                              ; $58fe: $00
	nop                                              ; $58ff: $00
	nop                                              ; $5900: $00
	nop                                              ; $5901: $00
	nop                                              ; $5902: $00
	nop                                              ; $5903: $00
	nop                                              ; $5904: $00
	nop                                              ; $5905: $00
	nop                                              ; $5906: $00
	nop                                              ; $5907: $00
	nop                                              ; $5908: $00
	nop                                              ; $5909: $00
	nop                                              ; $590a: $00
	nop                                              ; $590b: $00
	nop                                              ; $590c: $00
	nop                                              ; $590d: $00
	nop                                              ; $590e: $00
	nop                                              ; $590f: $00
	nop                                              ; $5910: $00
	nop                                              ; $5911: $00
	nop                                              ; $5912: $00
	nop                                              ; $5913: $00
	nop                                              ; $5914: $00
	nop                                              ; $5915: $00
	nop                                              ; $5916: $00
	nop                                              ; $5917: $00
	nop                                              ; $5918: $00
	nop                                              ; $5919: $00
	nop                                              ; $591a: $00
	nop                                              ; $591b: $00
	nop                                              ; $591c: $00
	nop                                              ; $591d: $00
	nop                                              ; $591e: $00
	nop                                              ; $591f: $00
	nop                                              ; $5920: $00
	nop                                              ; $5921: $00
	nop                                              ; $5922: $00
	nop                                              ; $5923: $00
	nop                                              ; $5924: $00
	nop                                              ; $5925: $00
	nop                                              ; $5926: $00
	nop                                              ; $5927: $00
	nop                                              ; $5928: $00
	nop                                              ; $5929: $00
	nop                                              ; $592a: $00
	nop                                              ; $592b: $00
	nop                                              ; $592c: $00
	nop                                              ; $592d: $00
	nop                                              ; $592e: $00
	nop                                              ; $592f: $00
	nop                                              ; $5930: $00
	nop                                              ; $5931: $00
	nop                                              ; $5932: $00
	nop                                              ; $5933: $00
	nop                                              ; $5934: $00
	nop                                              ; $5935: $00
	nop                                              ; $5936: $00
	nop                                              ; $5937: $00
	nop                                              ; $5938: $00
	nop                                              ; $5939: $00
	nop                                              ; $593a: $00
	nop                                              ; $593b: $00
	nop                                              ; $593c: $00
	nop                                              ; $593d: $00
	nop                                              ; $593e: $00
	nop                                              ; $593f: $00
	nop                                              ; $5940: $00
	nop                                              ; $5941: $00
	nop                                              ; $5942: $00
	nop                                              ; $5943: $00
	nop                                              ; $5944: $00
	nop                                              ; $5945: $00
	nop                                              ; $5946: $00
	nop                                              ; $5947: $00
	nop                                              ; $5948: $00
	nop                                              ; $5949: $00
	nop                                              ; $594a: $00
	nop                                              ; $594b: $00
	nop                                              ; $594c: $00
	nop                                              ; $594d: $00
	nop                                              ; $594e: $00
	nop                                              ; $594f: $00
	nop                                              ; $5950: $00
	nop                                              ; $5951: $00
	nop                                              ; $5952: $00
	nop                                              ; $5953: $00
	nop                                              ; $5954: $00
	nop                                              ; $5955: $00
	nop                                              ; $5956: $00
	nop                                              ; $5957: $00
	nop                                              ; $5958: $00
	nop                                              ; $5959: $00
	nop                                              ; $595a: $00
	nop                                              ; $595b: $00
	nop                                              ; $595c: $00
	nop                                              ; $595d: $00
	nop                                              ; $595e: $00
	nop                                              ; $595f: $00
	nop                                              ; $5960: $00
	nop                                              ; $5961: $00
	nop                                              ; $5962: $00
	nop                                              ; $5963: $00
	nop                                              ; $5964: $00
	nop                                              ; $5965: $00
	nop                                              ; $5966: $00
	nop                                              ; $5967: $00
	nop                                              ; $5968: $00
	nop                                              ; $5969: $00
	nop                                              ; $596a: $00
	nop                                              ; $596b: $00
	nop                                              ; $596c: $00
	nop                                              ; $596d: $00
	nop                                              ; $596e: $00
	nop                                              ; $596f: $00
	nop                                              ; $5970: $00
	nop                                              ; $5971: $00
	nop                                              ; $5972: $00
	nop                                              ; $5973: $00
	nop                                              ; $5974: $00
	nop                                              ; $5975: $00
	nop                                              ; $5976: $00
	nop                                              ; $5977: $00
	nop                                              ; $5978: $00
	nop                                              ; $5979: $00
	nop                                              ; $597a: $00
	nop                                              ; $597b: $00
	nop                                              ; $597c: $00
	nop                                              ; $597d: $00
	nop                                              ; $597e: $00
	nop                                              ; $597f: $00
	nop                                              ; $5980: $00
	nop                                              ; $5981: $00
	nop                                              ; $5982: $00
	nop                                              ; $5983: $00
	nop                                              ; $5984: $00
	nop                                              ; $5985: $00
	nop                                              ; $5986: $00
	nop                                              ; $5987: $00
	nop                                              ; $5988: $00
	nop                                              ; $5989: $00
	nop                                              ; $598a: $00
	nop                                              ; $598b: $00
	nop                                              ; $598c: $00
	nop                                              ; $598d: $00
	nop                                              ; $598e: $00
	nop                                              ; $598f: $00
	nop                                              ; $5990: $00
	nop                                              ; $5991: $00
	nop                                              ; $5992: $00
	nop                                              ; $5993: $00
	nop                                              ; $5994: $00
	nop                                              ; $5995: $00
	nop                                              ; $5996: $00
	nop                                              ; $5997: $00
	nop                                              ; $5998: $00
	nop                                              ; $5999: $00
	nop                                              ; $599a: $00
	nop                                              ; $599b: $00
	nop                                              ; $599c: $00
	nop                                              ; $599d: $00
	nop                                              ; $599e: $00
	nop                                              ; $599f: $00
	nop                                              ; $59a0: $00
	nop                                              ; $59a1: $00
	nop                                              ; $59a2: $00
	nop                                              ; $59a3: $00
	nop                                              ; $59a4: $00
	nop                                              ; $59a5: $00
	nop                                              ; $59a6: $00
	nop                                              ; $59a7: $00
	nop                                              ; $59a8: $00
	nop                                              ; $59a9: $00
	nop                                              ; $59aa: $00
	nop                                              ; $59ab: $00
	nop                                              ; $59ac: $00
	nop                                              ; $59ad: $00
	nop                                              ; $59ae: $00
	nop                                              ; $59af: $00
	nop                                              ; $59b0: $00
	nop                                              ; $59b1: $00
	nop                                              ; $59b2: $00
	nop                                              ; $59b3: $00
	nop                                              ; $59b4: $00
	nop                                              ; $59b5: $00
	nop                                              ; $59b6: $00
	nop                                              ; $59b7: $00
	nop                                              ; $59b8: $00
	nop                                              ; $59b9: $00
	nop                                              ; $59ba: $00
	nop                                              ; $59bb: $00
	nop                                              ; $59bc: $00
	nop                                              ; $59bd: $00
	nop                                              ; $59be: $00
	nop                                              ; $59bf: $00
	nop                                              ; $59c0: $00
	nop                                              ; $59c1: $00
	nop                                              ; $59c2: $00
	nop                                              ; $59c3: $00
	nop                                              ; $59c4: $00
	nop                                              ; $59c5: $00
	nop                                              ; $59c6: $00
	nop                                              ; $59c7: $00
	nop                                              ; $59c8: $00
	nop                                              ; $59c9: $00
	nop                                              ; $59ca: $00
	nop                                              ; $59cb: $00
	nop                                              ; $59cc: $00
	nop                                              ; $59cd: $00
	nop                                              ; $59ce: $00
	nop                                              ; $59cf: $00
	nop                                              ; $59d0: $00
	nop                                              ; $59d1: $00
	nop                                              ; $59d2: $00
	nop                                              ; $59d3: $00
	nop                                              ; $59d4: $00
	nop                                              ; $59d5: $00
	nop                                              ; $59d6: $00
	nop                                              ; $59d7: $00
	nop                                              ; $59d8: $00
	nop                                              ; $59d9: $00
	nop                                              ; $59da: $00
	nop                                              ; $59db: $00
	nop                                              ; $59dc: $00
	nop                                              ; $59dd: $00
	nop                                              ; $59de: $00
	nop                                              ; $59df: $00
	nop                                              ; $59e0: $00
	nop                                              ; $59e1: $00
	nop                                              ; $59e2: $00
	nop                                              ; $59e3: $00
	nop                                              ; $59e4: $00
	nop                                              ; $59e5: $00
	nop                                              ; $59e6: $00
	nop                                              ; $59e7: $00
	nop                                              ; $59e8: $00
	nop                                              ; $59e9: $00
	nop                                              ; $59ea: $00
	nop                                              ; $59eb: $00
	nop                                              ; $59ec: $00
	nop                                              ; $59ed: $00
	nop                                              ; $59ee: $00
	nop                                              ; $59ef: $00
	nop                                              ; $59f0: $00
	nop                                              ; $59f1: $00
	nop                                              ; $59f2: $00
	nop                                              ; $59f3: $00
	nop                                              ; $59f4: $00
	nop                                              ; $59f5: $00
	nop                                              ; $59f6: $00
	nop                                              ; $59f7: $00
	nop                                              ; $59f8: $00
	nop                                              ; $59f9: $00
	nop                                              ; $59fa: $00
	nop                                              ; $59fb: $00
	nop                                              ; $59fc: $00
	nop                                              ; $59fd: $00
	nop                                              ; $59fe: $00
	nop                                              ; $59ff: $00
	nop                                              ; $5a00: $00
	nop                                              ; $5a01: $00
	nop                                              ; $5a02: $00
	nop                                              ; $5a03: $00
	nop                                              ; $5a04: $00
	nop                                              ; $5a05: $00
	nop                                              ; $5a06: $00
	nop                                              ; $5a07: $00
	nop                                              ; $5a08: $00
	nop                                              ; $5a09: $00
	nop                                              ; $5a0a: $00
	nop                                              ; $5a0b: $00
	nop                                              ; $5a0c: $00
	nop                                              ; $5a0d: $00
	nop                                              ; $5a0e: $00
	nop                                              ; $5a0f: $00
	nop                                              ; $5a10: $00
	nop                                              ; $5a11: $00
	nop                                              ; $5a12: $00
	nop                                              ; $5a13: $00
	nop                                              ; $5a14: $00
	nop                                              ; $5a15: $00
	nop                                              ; $5a16: $00
	nop                                              ; $5a17: $00
	nop                                              ; $5a18: $00
	nop                                              ; $5a19: $00
	nop                                              ; $5a1a: $00
	nop                                              ; $5a1b: $00
	nop                                              ; $5a1c: $00
	nop                                              ; $5a1d: $00
	nop                                              ; $5a1e: $00
	nop                                              ; $5a1f: $00
	nop                                              ; $5a20: $00
	nop                                              ; $5a21: $00
	nop                                              ; $5a22: $00
	nop                                              ; $5a23: $00
	nop                                              ; $5a24: $00
	nop                                              ; $5a25: $00
	nop                                              ; $5a26: $00
	nop                                              ; $5a27: $00
	nop                                              ; $5a28: $00
	nop                                              ; $5a29: $00
	nop                                              ; $5a2a: $00
	nop                                              ; $5a2b: $00
	nop                                              ; $5a2c: $00
	nop                                              ; $5a2d: $00
	nop                                              ; $5a2e: $00
	nop                                              ; $5a2f: $00
	nop                                              ; $5a30: $00
	nop                                              ; $5a31: $00
	nop                                              ; $5a32: $00
	nop                                              ; $5a33: $00
	nop                                              ; $5a34: $00
	nop                                              ; $5a35: $00
	nop                                              ; $5a36: $00
	nop                                              ; $5a37: $00
	nop                                              ; $5a38: $00
	nop                                              ; $5a39: $00
	nop                                              ; $5a3a: $00
	nop                                              ; $5a3b: $00
	nop                                              ; $5a3c: $00
	nop                                              ; $5a3d: $00
	nop                                              ; $5a3e: $00
	nop                                              ; $5a3f: $00
	nop                                              ; $5a40: $00
	nop                                              ; $5a41: $00
	nop                                              ; $5a42: $00
	nop                                              ; $5a43: $00
	nop                                              ; $5a44: $00
	nop                                              ; $5a45: $00
	nop                                              ; $5a46: $00
	nop                                              ; $5a47: $00
	nop                                              ; $5a48: $00
	nop                                              ; $5a49: $00
	nop                                              ; $5a4a: $00
	nop                                              ; $5a4b: $00
	nop                                              ; $5a4c: $00
	nop                                              ; $5a4d: $00
	nop                                              ; $5a4e: $00
	nop                                              ; $5a4f: $00
	nop                                              ; $5a50: $00
	nop                                              ; $5a51: $00
	nop                                              ; $5a52: $00
	nop                                              ; $5a53: $00
	nop                                              ; $5a54: $00
	nop                                              ; $5a55: $00
	nop                                              ; $5a56: $00
	nop                                              ; $5a57: $00
	nop                                              ; $5a58: $00
	nop                                              ; $5a59: $00
	nop                                              ; $5a5a: $00
	nop                                              ; $5a5b: $00
	nop                                              ; $5a5c: $00
	nop                                              ; $5a5d: $00
	nop                                              ; $5a5e: $00
	nop                                              ; $5a5f: $00
	nop                                              ; $5a60: $00
	nop                                              ; $5a61: $00
	nop                                              ; $5a62: $00
	nop                                              ; $5a63: $00
	nop                                              ; $5a64: $00
	nop                                              ; $5a65: $00
	nop                                              ; $5a66: $00
	nop                                              ; $5a67: $00
	nop                                              ; $5a68: $00
	nop                                              ; $5a69: $00
	nop                                              ; $5a6a: $00
	nop                                              ; $5a6b: $00
	nop                                              ; $5a6c: $00
	nop                                              ; $5a6d: $00
	nop                                              ; $5a6e: $00
	nop                                              ; $5a6f: $00
	nop                                              ; $5a70: $00
	nop                                              ; $5a71: $00
	nop                                              ; $5a72: $00
	nop                                              ; $5a73: $00
	nop                                              ; $5a74: $00
	nop                                              ; $5a75: $00
	nop                                              ; $5a76: $00
	nop                                              ; $5a77: $00
	nop                                              ; $5a78: $00
	nop                                              ; $5a79: $00
	nop                                              ; $5a7a: $00
	nop                                              ; $5a7b: $00
	nop                                              ; $5a7c: $00
	nop                                              ; $5a7d: $00
	nop                                              ; $5a7e: $00
	nop                                              ; $5a7f: $00
	nop                                              ; $5a80: $00
	nop                                              ; $5a81: $00
	nop                                              ; $5a82: $00
	nop                                              ; $5a83: $00
	nop                                              ; $5a84: $00
	nop                                              ; $5a85: $00
	nop                                              ; $5a86: $00
	nop                                              ; $5a87: $00
	nop                                              ; $5a88: $00
	nop                                              ; $5a89: $00
	nop                                              ; $5a8a: $00
	nop                                              ; $5a8b: $00
	nop                                              ; $5a8c: $00
	nop                                              ; $5a8d: $00
	nop                                              ; $5a8e: $00
	nop                                              ; $5a8f: $00
	nop                                              ; $5a90: $00
	nop                                              ; $5a91: $00
	nop                                              ; $5a92: $00
	nop                                              ; $5a93: $00
	nop                                              ; $5a94: $00
	nop                                              ; $5a95: $00
	nop                                              ; $5a96: $00
	nop                                              ; $5a97: $00
	nop                                              ; $5a98: $00
	nop                                              ; $5a99: $00
	nop                                              ; $5a9a: $00
	nop                                              ; $5a9b: $00
	nop                                              ; $5a9c: $00
	nop                                              ; $5a9d: $00
	nop                                              ; $5a9e: $00
	nop                                              ; $5a9f: $00
	nop                                              ; $5aa0: $00
	nop                                              ; $5aa1: $00
	nop                                              ; $5aa2: $00
	nop                                              ; $5aa3: $00
	nop                                              ; $5aa4: $00
	nop                                              ; $5aa5: $00
	nop                                              ; $5aa6: $00
	nop                                              ; $5aa7: $00
	nop                                              ; $5aa8: $00
	nop                                              ; $5aa9: $00
	nop                                              ; $5aaa: $00
	nop                                              ; $5aab: $00
	nop                                              ; $5aac: $00
	nop                                              ; $5aad: $00
	nop                                              ; $5aae: $00
	nop                                              ; $5aaf: $00
	nop                                              ; $5ab0: $00
	nop                                              ; $5ab1: $00
	nop                                              ; $5ab2: $00
	nop                                              ; $5ab3: $00
	nop                                              ; $5ab4: $00
	nop                                              ; $5ab5: $00
	nop                                              ; $5ab6: $00
	nop                                              ; $5ab7: $00
	nop                                              ; $5ab8: $00
	nop                                              ; $5ab9: $00
	nop                                              ; $5aba: $00
	nop                                              ; $5abb: $00
	nop                                              ; $5abc: $00
	nop                                              ; $5abd: $00
	nop                                              ; $5abe: $00
	nop                                              ; $5abf: $00
	nop                                              ; $5ac0: $00
	nop                                              ; $5ac1: $00
	nop                                              ; $5ac2: $00
	nop                                              ; $5ac3: $00
	nop                                              ; $5ac4: $00
	nop                                              ; $5ac5: $00
	nop                                              ; $5ac6: $00
	nop                                              ; $5ac7: $00
	nop                                              ; $5ac8: $00
	nop                                              ; $5ac9: $00
	nop                                              ; $5aca: $00
	nop                                              ; $5acb: $00
	nop                                              ; $5acc: $00
	nop                                              ; $5acd: $00
	nop                                              ; $5ace: $00
	nop                                              ; $5acf: $00
	nop                                              ; $5ad0: $00
	nop                                              ; $5ad1: $00
	nop                                              ; $5ad2: $00
	nop                                              ; $5ad3: $00
	nop                                              ; $5ad4: $00
	nop                                              ; $5ad5: $00
	nop                                              ; $5ad6: $00
	nop                                              ; $5ad7: $00
	nop                                              ; $5ad8: $00
	nop                                              ; $5ad9: $00
	nop                                              ; $5ada: $00
	nop                                              ; $5adb: $00
	nop                                              ; $5adc: $00
	nop                                              ; $5add: $00
	nop                                              ; $5ade: $00
	nop                                              ; $5adf: $00
	nop                                              ; $5ae0: $00
	nop                                              ; $5ae1: $00
	nop                                              ; $5ae2: $00
	nop                                              ; $5ae3: $00
	nop                                              ; $5ae4: $00
	nop                                              ; $5ae5: $00
	nop                                              ; $5ae6: $00
	nop                                              ; $5ae7: $00
	nop                                              ; $5ae8: $00
	nop                                              ; $5ae9: $00
	nop                                              ; $5aea: $00
	nop                                              ; $5aeb: $00
	nop                                              ; $5aec: $00
	nop                                              ; $5aed: $00
	nop                                              ; $5aee: $00
	nop                                              ; $5aef: $00
	nop                                              ; $5af0: $00
	nop                                              ; $5af1: $00
	nop                                              ; $5af2: $00
	nop                                              ; $5af3: $00
	nop                                              ; $5af4: $00
	nop                                              ; $5af5: $00
	nop                                              ; $5af6: $00
	nop                                              ; $5af7: $00
	nop                                              ; $5af8: $00
	nop                                              ; $5af9: $00
	nop                                              ; $5afa: $00
	nop                                              ; $5afb: $00
	nop                                              ; $5afc: $00
	nop                                              ; $5afd: $00
	nop                                              ; $5afe: $00
	nop                                              ; $5aff: $00
	nop                                              ; $5b00: $00
	nop                                              ; $5b01: $00
	nop                                              ; $5b02: $00
	nop                                              ; $5b03: $00
	nop                                              ; $5b04: $00
	nop                                              ; $5b05: $00
	nop                                              ; $5b06: $00
	nop                                              ; $5b07: $00
	nop                                              ; $5b08: $00
	nop                                              ; $5b09: $00
	nop                                              ; $5b0a: $00
	nop                                              ; $5b0b: $00
	nop                                              ; $5b0c: $00
	nop                                              ; $5b0d: $00
	nop                                              ; $5b0e: $00
	nop                                              ; $5b0f: $00
	nop                                              ; $5b10: $00
	nop                                              ; $5b11: $00
	nop                                              ; $5b12: $00
	nop                                              ; $5b13: $00
	nop                                              ; $5b14: $00
	nop                                              ; $5b15: $00
	nop                                              ; $5b16: $00
	nop                                              ; $5b17: $00
	nop                                              ; $5b18: $00
	nop                                              ; $5b19: $00
	nop                                              ; $5b1a: $00
	nop                                              ; $5b1b: $00
	nop                                              ; $5b1c: $00
	nop                                              ; $5b1d: $00
	nop                                              ; $5b1e: $00
	nop                                              ; $5b1f: $00
	nop                                              ; $5b20: $00
	nop                                              ; $5b21: $00
	nop                                              ; $5b22: $00
	nop                                              ; $5b23: $00
	nop                                              ; $5b24: $00
	nop                                              ; $5b25: $00
	nop                                              ; $5b26: $00
	nop                                              ; $5b27: $00
	nop                                              ; $5b28: $00
	nop                                              ; $5b29: $00
	nop                                              ; $5b2a: $00
	nop                                              ; $5b2b: $00
	nop                                              ; $5b2c: $00
	nop                                              ; $5b2d: $00
	nop                                              ; $5b2e: $00
	nop                                              ; $5b2f: $00
	nop                                              ; $5b30: $00
	nop                                              ; $5b31: $00
	nop                                              ; $5b32: $00
	nop                                              ; $5b33: $00
	nop                                              ; $5b34: $00
	nop                                              ; $5b35: $00
	nop                                              ; $5b36: $00
	nop                                              ; $5b37: $00
	nop                                              ; $5b38: $00
	nop                                              ; $5b39: $00
	nop                                              ; $5b3a: $00
	nop                                              ; $5b3b: $00
	nop                                              ; $5b3c: $00
	nop                                              ; $5b3d: $00
	nop                                              ; $5b3e: $00
	nop                                              ; $5b3f: $00
	nop                                              ; $5b40: $00
	nop                                              ; $5b41: $00
	nop                                              ; $5b42: $00
	nop                                              ; $5b43: $00
	nop                                              ; $5b44: $00
	nop                                              ; $5b45: $00
	nop                                              ; $5b46: $00
	nop                                              ; $5b47: $00
	nop                                              ; $5b48: $00
	nop                                              ; $5b49: $00
	nop                                              ; $5b4a: $00
	nop                                              ; $5b4b: $00
	nop                                              ; $5b4c: $00
	nop                                              ; $5b4d: $00
	nop                                              ; $5b4e: $00
	nop                                              ; $5b4f: $00
	nop                                              ; $5b50: $00
	nop                                              ; $5b51: $00
	nop                                              ; $5b52: $00
	nop                                              ; $5b53: $00
	nop                                              ; $5b54: $00
	nop                                              ; $5b55: $00
	nop                                              ; $5b56: $00
	nop                                              ; $5b57: $00
	nop                                              ; $5b58: $00
	nop                                              ; $5b59: $00
	nop                                              ; $5b5a: $00
	nop                                              ; $5b5b: $00
	nop                                              ; $5b5c: $00
	nop                                              ; $5b5d: $00
	nop                                              ; $5b5e: $00
	nop                                              ; $5b5f: $00
	nop                                              ; $5b60: $00
	nop                                              ; $5b61: $00
	nop                                              ; $5b62: $00
	nop                                              ; $5b63: $00
	nop                                              ; $5b64: $00
	nop                                              ; $5b65: $00
	nop                                              ; $5b66: $00
	nop                                              ; $5b67: $00
	nop                                              ; $5b68: $00
	nop                                              ; $5b69: $00
	nop                                              ; $5b6a: $00
	nop                                              ; $5b6b: $00
	nop                                              ; $5b6c: $00
	nop                                              ; $5b6d: $00
	nop                                              ; $5b6e: $00
	nop                                              ; $5b6f: $00
	nop                                              ; $5b70: $00
	nop                                              ; $5b71: $00
	nop                                              ; $5b72: $00
	nop                                              ; $5b73: $00
	nop                                              ; $5b74: $00
	nop                                              ; $5b75: $00
	nop                                              ; $5b76: $00
	nop                                              ; $5b77: $00
	nop                                              ; $5b78: $00
	nop                                              ; $5b79: $00
	nop                                              ; $5b7a: $00
	nop                                              ; $5b7b: $00
	nop                                              ; $5b7c: $00
	nop                                              ; $5b7d: $00
	nop                                              ; $5b7e: $00
	nop                                              ; $5b7f: $00
	nop                                              ; $5b80: $00
	nop                                              ; $5b81: $00
	nop                                              ; $5b82: $00
	nop                                              ; $5b83: $00
	nop                                              ; $5b84: $00
	nop                                              ; $5b85: $00
	nop                                              ; $5b86: $00
	nop                                              ; $5b87: $00
	nop                                              ; $5b88: $00
	nop                                              ; $5b89: $00
	nop                                              ; $5b8a: $00
	nop                                              ; $5b8b: $00
	nop                                              ; $5b8c: $00
	nop                                              ; $5b8d: $00
	nop                                              ; $5b8e: $00
	nop                                              ; $5b8f: $00
	nop                                              ; $5b90: $00
	nop                                              ; $5b91: $00
	nop                                              ; $5b92: $00
	nop                                              ; $5b93: $00
	nop                                              ; $5b94: $00
	nop                                              ; $5b95: $00
	nop                                              ; $5b96: $00
	nop                                              ; $5b97: $00
	nop                                              ; $5b98: $00
	nop                                              ; $5b99: $00
	nop                                              ; $5b9a: $00
	nop                                              ; $5b9b: $00
	nop                                              ; $5b9c: $00
	nop                                              ; $5b9d: $00
	nop                                              ; $5b9e: $00
	nop                                              ; $5b9f: $00
	nop                                              ; $5ba0: $00
	nop                                              ; $5ba1: $00
	nop                                              ; $5ba2: $00
	nop                                              ; $5ba3: $00
	nop                                              ; $5ba4: $00
	nop                                              ; $5ba5: $00
	nop                                              ; $5ba6: $00
	nop                                              ; $5ba7: $00
	nop                                              ; $5ba8: $00
	nop                                              ; $5ba9: $00
	nop                                              ; $5baa: $00
	nop                                              ; $5bab: $00
	nop                                              ; $5bac: $00
	nop                                              ; $5bad: $00
	nop                                              ; $5bae: $00
	nop                                              ; $5baf: $00
	nop                                              ; $5bb0: $00
	nop                                              ; $5bb1: $00
	nop                                              ; $5bb2: $00
	nop                                              ; $5bb3: $00
	nop                                              ; $5bb4: $00
	nop                                              ; $5bb5: $00
	nop                                              ; $5bb6: $00
	nop                                              ; $5bb7: $00
	nop                                              ; $5bb8: $00
	nop                                              ; $5bb9: $00
	nop                                              ; $5bba: $00
	nop                                              ; $5bbb: $00
	nop                                              ; $5bbc: $00
	nop                                              ; $5bbd: $00
	nop                                              ; $5bbe: $00
	nop                                              ; $5bbf: $00
	nop                                              ; $5bc0: $00
	nop                                              ; $5bc1: $00
	nop                                              ; $5bc2: $00
	nop                                              ; $5bc3: $00
	nop                                              ; $5bc4: $00
	nop                                              ; $5bc5: $00
	nop                                              ; $5bc6: $00
	nop                                              ; $5bc7: $00
	nop                                              ; $5bc8: $00
	nop                                              ; $5bc9: $00
	nop                                              ; $5bca: $00
	nop                                              ; $5bcb: $00
	nop                                              ; $5bcc: $00
	nop                                              ; $5bcd: $00
	nop                                              ; $5bce: $00
	nop                                              ; $5bcf: $00
	nop                                              ; $5bd0: $00
	nop                                              ; $5bd1: $00
	nop                                              ; $5bd2: $00
	nop                                              ; $5bd3: $00
	nop                                              ; $5bd4: $00
	nop                                              ; $5bd5: $00
	nop                                              ; $5bd6: $00
	nop                                              ; $5bd7: $00
	nop                                              ; $5bd8: $00
	nop                                              ; $5bd9: $00
	nop                                              ; $5bda: $00
	nop                                              ; $5bdb: $00
	nop                                              ; $5bdc: $00
	nop                                              ; $5bdd: $00
	nop                                              ; $5bde: $00
	nop                                              ; $5bdf: $00
	nop                                              ; $5be0: $00
	nop                                              ; $5be1: $00
	nop                                              ; $5be2: $00
	nop                                              ; $5be3: $00
	nop                                              ; $5be4: $00
	nop                                              ; $5be5: $00
	nop                                              ; $5be6: $00
	nop                                              ; $5be7: $00
	nop                                              ; $5be8: $00
	nop                                              ; $5be9: $00
	nop                                              ; $5bea: $00
	nop                                              ; $5beb: $00
	nop                                              ; $5bec: $00
	nop                                              ; $5bed: $00
	nop                                              ; $5bee: $00
	nop                                              ; $5bef: $00
	nop                                              ; $5bf0: $00
	nop                                              ; $5bf1: $00
	nop                                              ; $5bf2: $00
	nop                                              ; $5bf3: $00
	nop                                              ; $5bf4: $00
	nop                                              ; $5bf5: $00
	nop                                              ; $5bf6: $00
	nop                                              ; $5bf7: $00
	nop                                              ; $5bf8: $00
	nop                                              ; $5bf9: $00
	nop                                              ; $5bfa: $00
	nop                                              ; $5bfb: $00
	nop                                              ; $5bfc: $00
	nop                                              ; $5bfd: $00
	nop                                              ; $5bfe: $00
	nop                                              ; $5bff: $00
	nop                                              ; $5c00: $00
	nop                                              ; $5c01: $00
	nop                                              ; $5c02: $00
	nop                                              ; $5c03: $00
	nop                                              ; $5c04: $00
	nop                                              ; $5c05: $00
	nop                                              ; $5c06: $00
	nop                                              ; $5c07: $00
	nop                                              ; $5c08: $00
	nop                                              ; $5c09: $00
	nop                                              ; $5c0a: $00
	nop                                              ; $5c0b: $00
	nop                                              ; $5c0c: $00
	nop                                              ; $5c0d: $00
	nop                                              ; $5c0e: $00
	nop                                              ; $5c0f: $00
	nop                                              ; $5c10: $00
	nop                                              ; $5c11: $00
	nop                                              ; $5c12: $00
	nop                                              ; $5c13: $00
	nop                                              ; $5c14: $00
	nop                                              ; $5c15: $00
	nop                                              ; $5c16: $00
	nop                                              ; $5c17: $00
	nop                                              ; $5c18: $00
	nop                                              ; $5c19: $00
	nop                                              ; $5c1a: $00
	nop                                              ; $5c1b: $00
	nop                                              ; $5c1c: $00
	nop                                              ; $5c1d: $00
	nop                                              ; $5c1e: $00
	nop                                              ; $5c1f: $00
	nop                                              ; $5c20: $00
	nop                                              ; $5c21: $00
	nop                                              ; $5c22: $00
	nop                                              ; $5c23: $00
	nop                                              ; $5c24: $00
	nop                                              ; $5c25: $00
	nop                                              ; $5c26: $00
	nop                                              ; $5c27: $00
	nop                                              ; $5c28: $00
	nop                                              ; $5c29: $00
	nop                                              ; $5c2a: $00
	nop                                              ; $5c2b: $00
	nop                                              ; $5c2c: $00
	nop                                              ; $5c2d: $00
	nop                                              ; $5c2e: $00
	nop                                              ; $5c2f: $00
	nop                                              ; $5c30: $00
	nop                                              ; $5c31: $00
	nop                                              ; $5c32: $00
	nop                                              ; $5c33: $00
	nop                                              ; $5c34: $00
	nop                                              ; $5c35: $00
	nop                                              ; $5c36: $00
	nop                                              ; $5c37: $00
	nop                                              ; $5c38: $00
	nop                                              ; $5c39: $00
	nop                                              ; $5c3a: $00
	nop                                              ; $5c3b: $00
	nop                                              ; $5c3c: $00
	nop                                              ; $5c3d: $00
	nop                                              ; $5c3e: $00
	nop                                              ; $5c3f: $00
	nop                                              ; $5c40: $00
	nop                                              ; $5c41: $00
	nop                                              ; $5c42: $00
	nop                                              ; $5c43: $00
	nop                                              ; $5c44: $00
	nop                                              ; $5c45: $00
	nop                                              ; $5c46: $00
	nop                                              ; $5c47: $00
	nop                                              ; $5c48: $00
	nop                                              ; $5c49: $00
	nop                                              ; $5c4a: $00
	nop                                              ; $5c4b: $00
	nop                                              ; $5c4c: $00
	nop                                              ; $5c4d: $00
	nop                                              ; $5c4e: $00
	nop                                              ; $5c4f: $00
	nop                                              ; $5c50: $00
	nop                                              ; $5c51: $00
	nop                                              ; $5c52: $00
	nop                                              ; $5c53: $00
	nop                                              ; $5c54: $00
	nop                                              ; $5c55: $00
	nop                                              ; $5c56: $00
	nop                                              ; $5c57: $00
	nop                                              ; $5c58: $00
	nop                                              ; $5c59: $00
	nop                                              ; $5c5a: $00
	nop                                              ; $5c5b: $00
	nop                                              ; $5c5c: $00
	nop                                              ; $5c5d: $00
	nop                                              ; $5c5e: $00
	nop                                              ; $5c5f: $00
	nop                                              ; $5c60: $00
	nop                                              ; $5c61: $00
	nop                                              ; $5c62: $00
	nop                                              ; $5c63: $00
	nop                                              ; $5c64: $00
	nop                                              ; $5c65: $00
	nop                                              ; $5c66: $00
	nop                                              ; $5c67: $00
	nop                                              ; $5c68: $00
	nop                                              ; $5c69: $00
	nop                                              ; $5c6a: $00
	nop                                              ; $5c6b: $00
	nop                                              ; $5c6c: $00
	nop                                              ; $5c6d: $00
	nop                                              ; $5c6e: $00
	nop                                              ; $5c6f: $00
	nop                                              ; $5c70: $00
	nop                                              ; $5c71: $00
	nop                                              ; $5c72: $00
	nop                                              ; $5c73: $00
	nop                                              ; $5c74: $00
	nop                                              ; $5c75: $00
	nop                                              ; $5c76: $00
	nop                                              ; $5c77: $00
	nop                                              ; $5c78: $00
	nop                                              ; $5c79: $00
	nop                                              ; $5c7a: $00
	nop                                              ; $5c7b: $00
	nop                                              ; $5c7c: $00
	nop                                              ; $5c7d: $00
	nop                                              ; $5c7e: $00
	nop                                              ; $5c7f: $00
	nop                                              ; $5c80: $00
	nop                                              ; $5c81: $00
	nop                                              ; $5c82: $00
	nop                                              ; $5c83: $00
	nop                                              ; $5c84: $00
	nop                                              ; $5c85: $00
	nop                                              ; $5c86: $00
	nop                                              ; $5c87: $00
	nop                                              ; $5c88: $00
	nop                                              ; $5c89: $00
	nop                                              ; $5c8a: $00
	nop                                              ; $5c8b: $00
	nop                                              ; $5c8c: $00
	nop                                              ; $5c8d: $00
	nop                                              ; $5c8e: $00
	nop                                              ; $5c8f: $00
	nop                                              ; $5c90: $00
	nop                                              ; $5c91: $00
	nop                                              ; $5c92: $00
	nop                                              ; $5c93: $00
	nop                                              ; $5c94: $00
	nop                                              ; $5c95: $00
	nop                                              ; $5c96: $00
	nop                                              ; $5c97: $00
	nop                                              ; $5c98: $00
	nop                                              ; $5c99: $00
	nop                                              ; $5c9a: $00
	nop                                              ; $5c9b: $00
	nop                                              ; $5c9c: $00
	nop                                              ; $5c9d: $00
	nop                                              ; $5c9e: $00
	nop                                              ; $5c9f: $00
	nop                                              ; $5ca0: $00
	nop                                              ; $5ca1: $00
	nop                                              ; $5ca2: $00
	nop                                              ; $5ca3: $00
	nop                                              ; $5ca4: $00
	nop                                              ; $5ca5: $00
	nop                                              ; $5ca6: $00
	nop                                              ; $5ca7: $00
	nop                                              ; $5ca8: $00
	nop                                              ; $5ca9: $00
	nop                                              ; $5caa: $00
	nop                                              ; $5cab: $00
	nop                                              ; $5cac: $00
	nop                                              ; $5cad: $00
	nop                                              ; $5cae: $00
	nop                                              ; $5caf: $00
	nop                                              ; $5cb0: $00
	nop                                              ; $5cb1: $00
	nop                                              ; $5cb2: $00
	nop                                              ; $5cb3: $00
	nop                                              ; $5cb4: $00
	nop                                              ; $5cb5: $00
	nop                                              ; $5cb6: $00
	nop                                              ; $5cb7: $00
	nop                                              ; $5cb8: $00
	nop                                              ; $5cb9: $00
	nop                                              ; $5cba: $00
	nop                                              ; $5cbb: $00
	nop                                              ; $5cbc: $00
	nop                                              ; $5cbd: $00
	nop                                              ; $5cbe: $00
	nop                                              ; $5cbf: $00
	nop                                              ; $5cc0: $00
	nop                                              ; $5cc1: $00
	nop                                              ; $5cc2: $00
	nop                                              ; $5cc3: $00
	nop                                              ; $5cc4: $00
	nop                                              ; $5cc5: $00
	nop                                              ; $5cc6: $00
	nop                                              ; $5cc7: $00
	nop                                              ; $5cc8: $00
	nop                                              ; $5cc9: $00
	nop                                              ; $5cca: $00
	nop                                              ; $5ccb: $00
	nop                                              ; $5ccc: $00
	nop                                              ; $5ccd: $00
	nop                                              ; $5cce: $00
	nop                                              ; $5ccf: $00
	nop                                              ; $5cd0: $00
	nop                                              ; $5cd1: $00
	nop                                              ; $5cd2: $00
	nop                                              ; $5cd3: $00
	nop                                              ; $5cd4: $00
	nop                                              ; $5cd5: $00
	nop                                              ; $5cd6: $00
	nop                                              ; $5cd7: $00
	nop                                              ; $5cd8: $00
	nop                                              ; $5cd9: $00
	nop                                              ; $5cda: $00
	nop                                              ; $5cdb: $00
	nop                                              ; $5cdc: $00
	nop                                              ; $5cdd: $00
	nop                                              ; $5cde: $00
	nop                                              ; $5cdf: $00
	nop                                              ; $5ce0: $00
	nop                                              ; $5ce1: $00
	nop                                              ; $5ce2: $00
	nop                                              ; $5ce3: $00
	nop                                              ; $5ce4: $00
	nop                                              ; $5ce5: $00
	nop                                              ; $5ce6: $00
	nop                                              ; $5ce7: $00
	nop                                              ; $5ce8: $00
	nop                                              ; $5ce9: $00
	nop                                              ; $5cea: $00
	nop                                              ; $5ceb: $00
	nop                                              ; $5cec: $00
	nop                                              ; $5ced: $00
	nop                                              ; $5cee: $00
	nop                                              ; $5cef: $00
	nop                                              ; $5cf0: $00
	nop                                              ; $5cf1: $00
	nop                                              ; $5cf2: $00
	nop                                              ; $5cf3: $00
	nop                                              ; $5cf4: $00
	nop                                              ; $5cf5: $00
	nop                                              ; $5cf6: $00
	nop                                              ; $5cf7: $00
	nop                                              ; $5cf8: $00
	nop                                              ; $5cf9: $00
	nop                                              ; $5cfa: $00
	nop                                              ; $5cfb: $00
	nop                                              ; $5cfc: $00
	nop                                              ; $5cfd: $00
	nop                                              ; $5cfe: $00
	nop                                              ; $5cff: $00
	nop                                              ; $5d00: $00
	nop                                              ; $5d01: $00
	nop                                              ; $5d02: $00
	nop                                              ; $5d03: $00
	nop                                              ; $5d04: $00
	nop                                              ; $5d05: $00
	nop                                              ; $5d06: $00
	nop                                              ; $5d07: $00
	nop                                              ; $5d08: $00
	nop                                              ; $5d09: $00
	nop                                              ; $5d0a: $00
	nop                                              ; $5d0b: $00
	nop                                              ; $5d0c: $00
	nop                                              ; $5d0d: $00
	nop                                              ; $5d0e: $00
	nop                                              ; $5d0f: $00
	nop                                              ; $5d10: $00
	nop                                              ; $5d11: $00
	nop                                              ; $5d12: $00
	nop                                              ; $5d13: $00
	nop                                              ; $5d14: $00
	nop                                              ; $5d15: $00
	nop                                              ; $5d16: $00
	nop                                              ; $5d17: $00
	nop                                              ; $5d18: $00
	nop                                              ; $5d19: $00
	nop                                              ; $5d1a: $00
	nop                                              ; $5d1b: $00
	nop                                              ; $5d1c: $00
	nop                                              ; $5d1d: $00
	nop                                              ; $5d1e: $00
	nop                                              ; $5d1f: $00
	nop                                              ; $5d20: $00
	nop                                              ; $5d21: $00
	nop                                              ; $5d22: $00
	nop                                              ; $5d23: $00
	nop                                              ; $5d24: $00
	nop                                              ; $5d25: $00
	nop                                              ; $5d26: $00
	nop                                              ; $5d27: $00
	nop                                              ; $5d28: $00
	nop                                              ; $5d29: $00
	nop                                              ; $5d2a: $00
	nop                                              ; $5d2b: $00
	nop                                              ; $5d2c: $00
	nop                                              ; $5d2d: $00
	nop                                              ; $5d2e: $00
	nop                                              ; $5d2f: $00
	nop                                              ; $5d30: $00
	nop                                              ; $5d31: $00
	nop                                              ; $5d32: $00
	nop                                              ; $5d33: $00
	nop                                              ; $5d34: $00
	nop                                              ; $5d35: $00
	nop                                              ; $5d36: $00
	nop                                              ; $5d37: $00
	nop                                              ; $5d38: $00
	nop                                              ; $5d39: $00
	nop                                              ; $5d3a: $00
	nop                                              ; $5d3b: $00
	nop                                              ; $5d3c: $00
	nop                                              ; $5d3d: $00
	nop                                              ; $5d3e: $00
	nop                                              ; $5d3f: $00
	nop                                              ; $5d40: $00
	nop                                              ; $5d41: $00
	nop                                              ; $5d42: $00
	nop                                              ; $5d43: $00
	nop                                              ; $5d44: $00
	nop                                              ; $5d45: $00
	nop                                              ; $5d46: $00
	nop                                              ; $5d47: $00
	nop                                              ; $5d48: $00
	nop                                              ; $5d49: $00
	nop                                              ; $5d4a: $00
	nop                                              ; $5d4b: $00
	nop                                              ; $5d4c: $00
	nop                                              ; $5d4d: $00
	nop                                              ; $5d4e: $00
	nop                                              ; $5d4f: $00
	nop                                              ; $5d50: $00
	nop                                              ; $5d51: $00
	nop                                              ; $5d52: $00
	nop                                              ; $5d53: $00
	nop                                              ; $5d54: $00
	nop                                              ; $5d55: $00
	nop                                              ; $5d56: $00
	nop                                              ; $5d57: $00
	nop                                              ; $5d58: $00
	nop                                              ; $5d59: $00
	nop                                              ; $5d5a: $00
	nop                                              ; $5d5b: $00
	nop                                              ; $5d5c: $00
	nop                                              ; $5d5d: $00
	nop                                              ; $5d5e: $00
	nop                                              ; $5d5f: $00
	nop                                              ; $5d60: $00
	nop                                              ; $5d61: $00
	nop                                              ; $5d62: $00
	nop                                              ; $5d63: $00
	nop                                              ; $5d64: $00
	nop                                              ; $5d65: $00
	nop                                              ; $5d66: $00
	nop                                              ; $5d67: $00
	nop                                              ; $5d68: $00
	nop                                              ; $5d69: $00
	nop                                              ; $5d6a: $00
	nop                                              ; $5d6b: $00
	nop                                              ; $5d6c: $00
	nop                                              ; $5d6d: $00
	nop                                              ; $5d6e: $00
	nop                                              ; $5d6f: $00
	nop                                              ; $5d70: $00
	nop                                              ; $5d71: $00
	nop                                              ; $5d72: $00
	nop                                              ; $5d73: $00
	nop                                              ; $5d74: $00
	nop                                              ; $5d75: $00
	nop                                              ; $5d76: $00
	nop                                              ; $5d77: $00
	nop                                              ; $5d78: $00
	nop                                              ; $5d79: $00
	nop                                              ; $5d7a: $00
	nop                                              ; $5d7b: $00
	nop                                              ; $5d7c: $00
	nop                                              ; $5d7d: $00
	nop                                              ; $5d7e: $00
	nop                                              ; $5d7f: $00
	nop                                              ; $5d80: $00
	nop                                              ; $5d81: $00
	nop                                              ; $5d82: $00
	nop                                              ; $5d83: $00
	nop                                              ; $5d84: $00
	nop                                              ; $5d85: $00
	nop                                              ; $5d86: $00
	nop                                              ; $5d87: $00
	nop                                              ; $5d88: $00
	nop                                              ; $5d89: $00
	nop                                              ; $5d8a: $00
	nop                                              ; $5d8b: $00
	nop                                              ; $5d8c: $00
	nop                                              ; $5d8d: $00
	nop                                              ; $5d8e: $00
	nop                                              ; $5d8f: $00
	nop                                              ; $5d90: $00
	nop                                              ; $5d91: $00
	nop                                              ; $5d92: $00
	nop                                              ; $5d93: $00
	nop                                              ; $5d94: $00
	nop                                              ; $5d95: $00
	nop                                              ; $5d96: $00
	nop                                              ; $5d97: $00
	nop                                              ; $5d98: $00
	nop                                              ; $5d99: $00
	nop                                              ; $5d9a: $00
	nop                                              ; $5d9b: $00
	nop                                              ; $5d9c: $00
	nop                                              ; $5d9d: $00
	nop                                              ; $5d9e: $00
	nop                                              ; $5d9f: $00
	nop                                              ; $5da0: $00
	nop                                              ; $5da1: $00
	nop                                              ; $5da2: $00
	nop                                              ; $5da3: $00
	nop                                              ; $5da4: $00
	nop                                              ; $5da5: $00
	nop                                              ; $5da6: $00
	nop                                              ; $5da7: $00
	nop                                              ; $5da8: $00
	nop                                              ; $5da9: $00
	nop                                              ; $5daa: $00
	nop                                              ; $5dab: $00
	nop                                              ; $5dac: $00
	nop                                              ; $5dad: $00
	nop                                              ; $5dae: $00
	nop                                              ; $5daf: $00
	nop                                              ; $5db0: $00
	nop                                              ; $5db1: $00
	nop                                              ; $5db2: $00
	nop                                              ; $5db3: $00
	nop                                              ; $5db4: $00
	nop                                              ; $5db5: $00
	nop                                              ; $5db6: $00
	nop                                              ; $5db7: $00
	nop                                              ; $5db8: $00
	nop                                              ; $5db9: $00
	nop                                              ; $5dba: $00
	nop                                              ; $5dbb: $00
	nop                                              ; $5dbc: $00
	nop                                              ; $5dbd: $00
	nop                                              ; $5dbe: $00
	nop                                              ; $5dbf: $00
	nop                                              ; $5dc0: $00
	nop                                              ; $5dc1: $00
	nop                                              ; $5dc2: $00
	nop                                              ; $5dc3: $00
	nop                                              ; $5dc4: $00
	nop                                              ; $5dc5: $00
	nop                                              ; $5dc6: $00
	nop                                              ; $5dc7: $00
	nop                                              ; $5dc8: $00
	nop                                              ; $5dc9: $00
	nop                                              ; $5dca: $00
	nop                                              ; $5dcb: $00
	nop                                              ; $5dcc: $00
	nop                                              ; $5dcd: $00
	nop                                              ; $5dce: $00
	nop                                              ; $5dcf: $00
	nop                                              ; $5dd0: $00
	nop                                              ; $5dd1: $00
	nop                                              ; $5dd2: $00
	nop                                              ; $5dd3: $00
	nop                                              ; $5dd4: $00
	nop                                              ; $5dd5: $00
	nop                                              ; $5dd6: $00
	nop                                              ; $5dd7: $00
	nop                                              ; $5dd8: $00
	nop                                              ; $5dd9: $00
	nop                                              ; $5dda: $00
	nop                                              ; $5ddb: $00
	nop                                              ; $5ddc: $00
	nop                                              ; $5ddd: $00
	nop                                              ; $5dde: $00
	nop                                              ; $5ddf: $00
	nop                                              ; $5de0: $00
	nop                                              ; $5de1: $00
	nop                                              ; $5de2: $00
	nop                                              ; $5de3: $00
	nop                                              ; $5de4: $00
	nop                                              ; $5de5: $00
	nop                                              ; $5de6: $00
	nop                                              ; $5de7: $00
	nop                                              ; $5de8: $00
	nop                                              ; $5de9: $00
	nop                                              ; $5dea: $00
	nop                                              ; $5deb: $00
	nop                                              ; $5dec: $00
	nop                                              ; $5ded: $00
	nop                                              ; $5dee: $00
	nop                                              ; $5def: $00
	nop                                              ; $5df0: $00
	nop                                              ; $5df1: $00
	nop                                              ; $5df2: $00
	nop                                              ; $5df3: $00
	nop                                              ; $5df4: $00
	nop                                              ; $5df5: $00
	nop                                              ; $5df6: $00
	nop                                              ; $5df7: $00
	nop                                              ; $5df8: $00
	nop                                              ; $5df9: $00
	nop                                              ; $5dfa: $00
	nop                                              ; $5dfb: $00
	nop                                              ; $5dfc: $00
	nop                                              ; $5dfd: $00
	nop                                              ; $5dfe: $00
	nop                                              ; $5dff: $00
	nop                                              ; $5e00: $00
	nop                                              ; $5e01: $00
	nop                                              ; $5e02: $00
	nop                                              ; $5e03: $00
	nop                                              ; $5e04: $00
	nop                                              ; $5e05: $00
	nop                                              ; $5e06: $00
	nop                                              ; $5e07: $00
	nop                                              ; $5e08: $00
	nop                                              ; $5e09: $00
	nop                                              ; $5e0a: $00
	nop                                              ; $5e0b: $00
	nop                                              ; $5e0c: $00
	nop                                              ; $5e0d: $00
	nop                                              ; $5e0e: $00
	nop                                              ; $5e0f: $00
	nop                                              ; $5e10: $00
	nop                                              ; $5e11: $00
	nop                                              ; $5e12: $00
	nop                                              ; $5e13: $00
	nop                                              ; $5e14: $00
	nop                                              ; $5e15: $00
	nop                                              ; $5e16: $00
	nop                                              ; $5e17: $00
	nop                                              ; $5e18: $00
	nop                                              ; $5e19: $00
	nop                                              ; $5e1a: $00
	nop                                              ; $5e1b: $00
	nop                                              ; $5e1c: $00
	nop                                              ; $5e1d: $00
	nop                                              ; $5e1e: $00
	nop                                              ; $5e1f: $00
	nop                                              ; $5e20: $00
	nop                                              ; $5e21: $00
	nop                                              ; $5e22: $00
	nop                                              ; $5e23: $00
	nop                                              ; $5e24: $00
	nop                                              ; $5e25: $00
	nop                                              ; $5e26: $00
	nop                                              ; $5e27: $00
	nop                                              ; $5e28: $00
	nop                                              ; $5e29: $00
	nop                                              ; $5e2a: $00
	nop                                              ; $5e2b: $00
	nop                                              ; $5e2c: $00
	nop                                              ; $5e2d: $00
	nop                                              ; $5e2e: $00
	nop                                              ; $5e2f: $00
	nop                                              ; $5e30: $00
	nop                                              ; $5e31: $00
	nop                                              ; $5e32: $00
	nop                                              ; $5e33: $00
	nop                                              ; $5e34: $00
	nop                                              ; $5e35: $00
	nop                                              ; $5e36: $00
	nop                                              ; $5e37: $00
	nop                                              ; $5e38: $00
	nop                                              ; $5e39: $00
	nop                                              ; $5e3a: $00
	nop                                              ; $5e3b: $00
	nop                                              ; $5e3c: $00
	nop                                              ; $5e3d: $00
	nop                                              ; $5e3e: $00
	nop                                              ; $5e3f: $00
	nop                                              ; $5e40: $00
	nop                                              ; $5e41: $00
	nop                                              ; $5e42: $00
	nop                                              ; $5e43: $00
	nop                                              ; $5e44: $00
	nop                                              ; $5e45: $00
	nop                                              ; $5e46: $00
	nop                                              ; $5e47: $00
	nop                                              ; $5e48: $00
	nop                                              ; $5e49: $00
	nop                                              ; $5e4a: $00
	nop                                              ; $5e4b: $00
	nop                                              ; $5e4c: $00
	nop                                              ; $5e4d: $00
	nop                                              ; $5e4e: $00
	nop                                              ; $5e4f: $00
	nop                                              ; $5e50: $00
	nop                                              ; $5e51: $00
	nop                                              ; $5e52: $00
	nop                                              ; $5e53: $00
	nop                                              ; $5e54: $00
	nop                                              ; $5e55: $00
	nop                                              ; $5e56: $00
	nop                                              ; $5e57: $00
	nop                                              ; $5e58: $00
	nop                                              ; $5e59: $00
	nop                                              ; $5e5a: $00
	nop                                              ; $5e5b: $00
	nop                                              ; $5e5c: $00
	nop                                              ; $5e5d: $00
	nop                                              ; $5e5e: $00
	nop                                              ; $5e5f: $00
	nop                                              ; $5e60: $00
	nop                                              ; $5e61: $00
	nop                                              ; $5e62: $00
	nop                                              ; $5e63: $00
	nop                                              ; $5e64: $00
	nop                                              ; $5e65: $00
	nop                                              ; $5e66: $00
	nop                                              ; $5e67: $00
	nop                                              ; $5e68: $00
	nop                                              ; $5e69: $00
	nop                                              ; $5e6a: $00
	nop                                              ; $5e6b: $00
	nop                                              ; $5e6c: $00
	nop                                              ; $5e6d: $00
	nop                                              ; $5e6e: $00
	nop                                              ; $5e6f: $00
	nop                                              ; $5e70: $00
	nop                                              ; $5e71: $00
	nop                                              ; $5e72: $00
	nop                                              ; $5e73: $00
	nop                                              ; $5e74: $00
	nop                                              ; $5e75: $00
	nop                                              ; $5e76: $00
	nop                                              ; $5e77: $00
	nop                                              ; $5e78: $00
	nop                                              ; $5e79: $00
	nop                                              ; $5e7a: $00
	nop                                              ; $5e7b: $00
	nop                                              ; $5e7c: $00
	nop                                              ; $5e7d: $00
	nop                                              ; $5e7e: $00
	nop                                              ; $5e7f: $00
	nop                                              ; $5e80: $00
	nop                                              ; $5e81: $00
	nop                                              ; $5e82: $00
	nop                                              ; $5e83: $00
	nop                                              ; $5e84: $00
	nop                                              ; $5e85: $00
	nop                                              ; $5e86: $00
	nop                                              ; $5e87: $00
	nop                                              ; $5e88: $00
	nop                                              ; $5e89: $00
	nop                                              ; $5e8a: $00
	nop                                              ; $5e8b: $00
	nop                                              ; $5e8c: $00
	nop                                              ; $5e8d: $00
	nop                                              ; $5e8e: $00
	nop                                              ; $5e8f: $00
	nop                                              ; $5e90: $00
	nop                                              ; $5e91: $00
	nop                                              ; $5e92: $00
	nop                                              ; $5e93: $00
	nop                                              ; $5e94: $00
	nop                                              ; $5e95: $00
	nop                                              ; $5e96: $00
	nop                                              ; $5e97: $00
	nop                                              ; $5e98: $00
	nop                                              ; $5e99: $00
	nop                                              ; $5e9a: $00
	nop                                              ; $5e9b: $00
	nop                                              ; $5e9c: $00
	nop                                              ; $5e9d: $00
	nop                                              ; $5e9e: $00
	nop                                              ; $5e9f: $00
	nop                                              ; $5ea0: $00
	nop                                              ; $5ea1: $00
	nop                                              ; $5ea2: $00
	nop                                              ; $5ea3: $00
	nop                                              ; $5ea4: $00
	nop                                              ; $5ea5: $00
	nop                                              ; $5ea6: $00
	nop                                              ; $5ea7: $00
	nop                                              ; $5ea8: $00
	nop                                              ; $5ea9: $00
	nop                                              ; $5eaa: $00
	nop                                              ; $5eab: $00
	nop                                              ; $5eac: $00
	nop                                              ; $5ead: $00
	nop                                              ; $5eae: $00
	nop                                              ; $5eaf: $00
	nop                                              ; $5eb0: $00
	nop                                              ; $5eb1: $00
	nop                                              ; $5eb2: $00
	nop                                              ; $5eb3: $00
	nop                                              ; $5eb4: $00
	nop                                              ; $5eb5: $00
	nop                                              ; $5eb6: $00
	nop                                              ; $5eb7: $00
	nop                                              ; $5eb8: $00
	nop                                              ; $5eb9: $00
	nop                                              ; $5eba: $00
	nop                                              ; $5ebb: $00
	nop                                              ; $5ebc: $00
	nop                                              ; $5ebd: $00
	nop                                              ; $5ebe: $00
	nop                                              ; $5ebf: $00
	nop                                              ; $5ec0: $00
	nop                                              ; $5ec1: $00
	nop                                              ; $5ec2: $00
	nop                                              ; $5ec3: $00
	nop                                              ; $5ec4: $00
	nop                                              ; $5ec5: $00
	nop                                              ; $5ec6: $00
	nop                                              ; $5ec7: $00
	nop                                              ; $5ec8: $00
	nop                                              ; $5ec9: $00
	nop                                              ; $5eca: $00
	nop                                              ; $5ecb: $00
	nop                                              ; $5ecc: $00
	nop                                              ; $5ecd: $00
	nop                                              ; $5ece: $00
	nop                                              ; $5ecf: $00
	nop                                              ; $5ed0: $00
	nop                                              ; $5ed1: $00
	nop                                              ; $5ed2: $00
	nop                                              ; $5ed3: $00
	nop                                              ; $5ed4: $00
	nop                                              ; $5ed5: $00
	nop                                              ; $5ed6: $00
	nop                                              ; $5ed7: $00
	nop                                              ; $5ed8: $00
	nop                                              ; $5ed9: $00
	nop                                              ; $5eda: $00
	nop                                              ; $5edb: $00
	nop                                              ; $5edc: $00
	nop                                              ; $5edd: $00
	nop                                              ; $5ede: $00
	nop                                              ; $5edf: $00
	nop                                              ; $5ee0: $00
	nop                                              ; $5ee1: $00
	nop                                              ; $5ee2: $00
	nop                                              ; $5ee3: $00
	nop                                              ; $5ee4: $00
	nop                                              ; $5ee5: $00
	nop                                              ; $5ee6: $00
	nop                                              ; $5ee7: $00
	nop                                              ; $5ee8: $00
	nop                                              ; $5ee9: $00
	nop                                              ; $5eea: $00
	nop                                              ; $5eeb: $00
	nop                                              ; $5eec: $00
	nop                                              ; $5eed: $00
	nop                                              ; $5eee: $00
	nop                                              ; $5eef: $00
	nop                                              ; $5ef0: $00
	nop                                              ; $5ef1: $00
	nop                                              ; $5ef2: $00
	nop                                              ; $5ef3: $00
	nop                                              ; $5ef4: $00
	nop                                              ; $5ef5: $00
	nop                                              ; $5ef6: $00
	nop                                              ; $5ef7: $00
	nop                                              ; $5ef8: $00
	nop                                              ; $5ef9: $00
	nop                                              ; $5efa: $00
	nop                                              ; $5efb: $00
	nop                                              ; $5efc: $00
	nop                                              ; $5efd: $00
	nop                                              ; $5efe: $00
	nop                                              ; $5eff: $00
	nop                                              ; $5f00: $00
	nop                                              ; $5f01: $00
	nop                                              ; $5f02: $00
	nop                                              ; $5f03: $00
	nop                                              ; $5f04: $00
	nop                                              ; $5f05: $00
	nop                                              ; $5f06: $00
	nop                                              ; $5f07: $00
	nop                                              ; $5f08: $00
	nop                                              ; $5f09: $00
	nop                                              ; $5f0a: $00
	nop                                              ; $5f0b: $00
	nop                                              ; $5f0c: $00
	nop                                              ; $5f0d: $00
	nop                                              ; $5f0e: $00
	nop                                              ; $5f0f: $00
	nop                                              ; $5f10: $00
	nop                                              ; $5f11: $00
	nop                                              ; $5f12: $00
	nop                                              ; $5f13: $00
	nop                                              ; $5f14: $00
	nop                                              ; $5f15: $00
	nop                                              ; $5f16: $00
	nop                                              ; $5f17: $00
	nop                                              ; $5f18: $00
	nop                                              ; $5f19: $00
	nop                                              ; $5f1a: $00
	nop                                              ; $5f1b: $00
	nop                                              ; $5f1c: $00
	nop                                              ; $5f1d: $00
	nop                                              ; $5f1e: $00
	nop                                              ; $5f1f: $00
	nop                                              ; $5f20: $00
	nop                                              ; $5f21: $00
	nop                                              ; $5f22: $00
	nop                                              ; $5f23: $00
	nop                                              ; $5f24: $00
	nop                                              ; $5f25: $00
	nop                                              ; $5f26: $00
	nop                                              ; $5f27: $00
	nop                                              ; $5f28: $00
	nop                                              ; $5f29: $00
	nop                                              ; $5f2a: $00
	nop                                              ; $5f2b: $00
	nop                                              ; $5f2c: $00
	nop                                              ; $5f2d: $00
	nop                                              ; $5f2e: $00
	nop                                              ; $5f2f: $00
	nop                                              ; $5f30: $00
	nop                                              ; $5f31: $00
	nop                                              ; $5f32: $00
	nop                                              ; $5f33: $00
	nop                                              ; $5f34: $00
	nop                                              ; $5f35: $00
	nop                                              ; $5f36: $00
	nop                                              ; $5f37: $00
	nop                                              ; $5f38: $00
	nop                                              ; $5f39: $00
	nop                                              ; $5f3a: $00
	nop                                              ; $5f3b: $00
	nop                                              ; $5f3c: $00
	nop                                              ; $5f3d: $00
	nop                                              ; $5f3e: $00
	nop                                              ; $5f3f: $00
	nop                                              ; $5f40: $00
	nop                                              ; $5f41: $00
	nop                                              ; $5f42: $00
	nop                                              ; $5f43: $00
	nop                                              ; $5f44: $00
	nop                                              ; $5f45: $00
	nop                                              ; $5f46: $00
	nop                                              ; $5f47: $00
	nop                                              ; $5f48: $00
	nop                                              ; $5f49: $00
	nop                                              ; $5f4a: $00
	nop                                              ; $5f4b: $00
	nop                                              ; $5f4c: $00
	nop                                              ; $5f4d: $00
	nop                                              ; $5f4e: $00
	nop                                              ; $5f4f: $00
	nop                                              ; $5f50: $00
	nop                                              ; $5f51: $00
	nop                                              ; $5f52: $00
	nop                                              ; $5f53: $00
	nop                                              ; $5f54: $00
	nop                                              ; $5f55: $00
	nop                                              ; $5f56: $00
	nop                                              ; $5f57: $00
	nop                                              ; $5f58: $00
	nop                                              ; $5f59: $00
	nop                                              ; $5f5a: $00
	nop                                              ; $5f5b: $00
	nop                                              ; $5f5c: $00
	nop                                              ; $5f5d: $00
	nop                                              ; $5f5e: $00
	nop                                              ; $5f5f: $00
	nop                                              ; $5f60: $00
	nop                                              ; $5f61: $00
	nop                                              ; $5f62: $00
	nop                                              ; $5f63: $00
	nop                                              ; $5f64: $00
	nop                                              ; $5f65: $00
	nop                                              ; $5f66: $00
	nop                                              ; $5f67: $00
	nop                                              ; $5f68: $00
	nop                                              ; $5f69: $00
	nop                                              ; $5f6a: $00
	nop                                              ; $5f6b: $00
	nop                                              ; $5f6c: $00
	nop                                              ; $5f6d: $00
	nop                                              ; $5f6e: $00
	nop                                              ; $5f6f: $00
	nop                                              ; $5f70: $00
	nop                                              ; $5f71: $00
	nop                                              ; $5f72: $00
	nop                                              ; $5f73: $00
	nop                                              ; $5f74: $00
	nop                                              ; $5f75: $00
	nop                                              ; $5f76: $00
	nop                                              ; $5f77: $00
	nop                                              ; $5f78: $00
	nop                                              ; $5f79: $00
	nop                                              ; $5f7a: $00
	nop                                              ; $5f7b: $00
	nop                                              ; $5f7c: $00
	nop                                              ; $5f7d: $00
	nop                                              ; $5f7e: $00
	nop                                              ; $5f7f: $00
	nop                                              ; $5f80: $00
	nop                                              ; $5f81: $00
	nop                                              ; $5f82: $00
	nop                                              ; $5f83: $00
	nop                                              ; $5f84: $00
	nop                                              ; $5f85: $00
	nop                                              ; $5f86: $00
	nop                                              ; $5f87: $00
	nop                                              ; $5f88: $00
	nop                                              ; $5f89: $00
	nop                                              ; $5f8a: $00
	nop                                              ; $5f8b: $00
	nop                                              ; $5f8c: $00
	nop                                              ; $5f8d: $00
	nop                                              ; $5f8e: $00
	nop                                              ; $5f8f: $00
	nop                                              ; $5f90: $00
	nop                                              ; $5f91: $00
	nop                                              ; $5f92: $00
	nop                                              ; $5f93: $00
	nop                                              ; $5f94: $00
	nop                                              ; $5f95: $00
	nop                                              ; $5f96: $00
	nop                                              ; $5f97: $00
	nop                                              ; $5f98: $00
	nop                                              ; $5f99: $00
	nop                                              ; $5f9a: $00
	nop                                              ; $5f9b: $00
	nop                                              ; $5f9c: $00
	nop                                              ; $5f9d: $00
	nop                                              ; $5f9e: $00
	nop                                              ; $5f9f: $00
	nop                                              ; $5fa0: $00
	nop                                              ; $5fa1: $00
	nop                                              ; $5fa2: $00
	nop                                              ; $5fa3: $00
	nop                                              ; $5fa4: $00
	nop                                              ; $5fa5: $00
	nop                                              ; $5fa6: $00
	nop                                              ; $5fa7: $00
	nop                                              ; $5fa8: $00
	nop                                              ; $5fa9: $00
	nop                                              ; $5faa: $00
	nop                                              ; $5fab: $00
	nop                                              ; $5fac: $00
	nop                                              ; $5fad: $00
	nop                                              ; $5fae: $00
	nop                                              ; $5faf: $00
	nop                                              ; $5fb0: $00
	nop                                              ; $5fb1: $00
	nop                                              ; $5fb2: $00
	nop                                              ; $5fb3: $00
	nop                                              ; $5fb4: $00
	nop                                              ; $5fb5: $00
	nop                                              ; $5fb6: $00
	nop                                              ; $5fb7: $00
	nop                                              ; $5fb8: $00
	nop                                              ; $5fb9: $00
	nop                                              ; $5fba: $00
	nop                                              ; $5fbb: $00
	nop                                              ; $5fbc: $00
	nop                                              ; $5fbd: $00
	nop                                              ; $5fbe: $00
	nop                                              ; $5fbf: $00
	nop                                              ; $5fc0: $00
	nop                                              ; $5fc1: $00
	nop                                              ; $5fc2: $00
	nop                                              ; $5fc3: $00
	nop                                              ; $5fc4: $00
	nop                                              ; $5fc5: $00
	nop                                              ; $5fc6: $00
	nop                                              ; $5fc7: $00
	nop                                              ; $5fc8: $00
	nop                                              ; $5fc9: $00
	nop                                              ; $5fca: $00
	nop                                              ; $5fcb: $00
	nop                                              ; $5fcc: $00
	nop                                              ; $5fcd: $00
	nop                                              ; $5fce: $00
	nop                                              ; $5fcf: $00
	nop                                              ; $5fd0: $00
	nop                                              ; $5fd1: $00
	nop                                              ; $5fd2: $00
	nop                                              ; $5fd3: $00
	nop                                              ; $5fd4: $00
	nop                                              ; $5fd5: $00
	nop                                              ; $5fd6: $00
	nop                                              ; $5fd7: $00
	nop                                              ; $5fd8: $00
	nop                                              ; $5fd9: $00
	nop                                              ; $5fda: $00
	nop                                              ; $5fdb: $00
	nop                                              ; $5fdc: $00
	nop                                              ; $5fdd: $00
	nop                                              ; $5fde: $00
	nop                                              ; $5fdf: $00
	nop                                              ; $5fe0: $00
	nop                                              ; $5fe1: $00
	nop                                              ; $5fe2: $00
	nop                                              ; $5fe3: $00
	nop                                              ; $5fe4: $00
	nop                                              ; $5fe5: $00
	nop                                              ; $5fe6: $00
	nop                                              ; $5fe7: $00
	nop                                              ; $5fe8: $00
	nop                                              ; $5fe9: $00
	nop                                              ; $5fea: $00
	nop                                              ; $5feb: $00
	nop                                              ; $5fec: $00
	nop                                              ; $5fed: $00
	nop                                              ; $5fee: $00
	nop                                              ; $5fef: $00
	nop                                              ; $5ff0: $00
	nop                                              ; $5ff1: $00
	nop                                              ; $5ff2: $00
	nop                                              ; $5ff3: $00
	nop                                              ; $5ff4: $00
	nop                                              ; $5ff5: $00
	nop                                              ; $5ff6: $00
	nop                                              ; $5ff7: $00
	nop                                              ; $5ff8: $00
	nop                                              ; $5ff9: $00
	nop                                              ; $5ffa: $00
	nop                                              ; $5ffb: $00
	nop                                              ; $5ffc: $00
	nop                                              ; $5ffd: $00
	nop                                              ; $5ffe: $00
	nop                                              ; $5fff: $00
	nop                                              ; $6000: $00
	nop                                              ; $6001: $00
	nop                                              ; $6002: $00
	nop                                              ; $6003: $00
	nop                                              ; $6004: $00
	nop                                              ; $6005: $00
	nop                                              ; $6006: $00
	nop                                              ; $6007: $00
	nop                                              ; $6008: $00
	nop                                              ; $6009: $00
	nop                                              ; $600a: $00
	nop                                              ; $600b: $00
	nop                                              ; $600c: $00
	nop                                              ; $600d: $00
	nop                                              ; $600e: $00
	nop                                              ; $600f: $00

Jump_095_6010:
	nop                                              ; $6010: $00
	nop                                              ; $6011: $00
	nop                                              ; $6012: $00
	nop                                              ; $6013: $00
	nop                                              ; $6014: $00
	nop                                              ; $6015: $00
	nop                                              ; $6016: $00
	nop                                              ; $6017: $00
	nop                                              ; $6018: $00
	nop                                              ; $6019: $00
	nop                                              ; $601a: $00
	nop                                              ; $601b: $00
	nop                                              ; $601c: $00
	nop                                              ; $601d: $00
	nop                                              ; $601e: $00
	nop                                              ; $601f: $00
	nop                                              ; $6020: $00
	nop                                              ; $6021: $00
	nop                                              ; $6022: $00
	nop                                              ; $6023: $00
	nop                                              ; $6024: $00
	nop                                              ; $6025: $00
	nop                                              ; $6026: $00
	nop                                              ; $6027: $00
	nop                                              ; $6028: $00
	nop                                              ; $6029: $00
	nop                                              ; $602a: $00
	nop                                              ; $602b: $00
	nop                                              ; $602c: $00
	nop                                              ; $602d: $00
	nop                                              ; $602e: $00
	nop                                              ; $602f: $00
	nop                                              ; $6030: $00
	nop                                              ; $6031: $00
	nop                                              ; $6032: $00
	nop                                              ; $6033: $00
	nop                                              ; $6034: $00
	nop                                              ; $6035: $00
	nop                                              ; $6036: $00
	nop                                              ; $6037: $00
	nop                                              ; $6038: $00
	nop                                              ; $6039: $00
	nop                                              ; $603a: $00
	nop                                              ; $603b: $00
	nop                                              ; $603c: $00
	nop                                              ; $603d: $00
	nop                                              ; $603e: $00
	nop                                              ; $603f: $00
	nop                                              ; $6040: $00
	nop                                              ; $6041: $00
	nop                                              ; $6042: $00
	nop                                              ; $6043: $00
	nop                                              ; $6044: $00
	nop                                              ; $6045: $00
	nop                                              ; $6046: $00
	nop                                              ; $6047: $00
	nop                                              ; $6048: $00
	nop                                              ; $6049: $00
	nop                                              ; $604a: $00
	nop                                              ; $604b: $00
	nop                                              ; $604c: $00
	nop                                              ; $604d: $00
	nop                                              ; $604e: $00
	nop                                              ; $604f: $00
	nop                                              ; $6050: $00
	nop                                              ; $6051: $00
	nop                                              ; $6052: $00
	nop                                              ; $6053: $00
	nop                                              ; $6054: $00
	nop                                              ; $6055: $00
	nop                                              ; $6056: $00
	nop                                              ; $6057: $00
	nop                                              ; $6058: $00
	nop                                              ; $6059: $00
	nop                                              ; $605a: $00
	nop                                              ; $605b: $00
	nop                                              ; $605c: $00
	nop                                              ; $605d: $00
	nop                                              ; $605e: $00
	nop                                              ; $605f: $00
	nop                                              ; $6060: $00
	nop                                              ; $6061: $00
	nop                                              ; $6062: $00
	nop                                              ; $6063: $00
	nop                                              ; $6064: $00
	nop                                              ; $6065: $00
	nop                                              ; $6066: $00
	nop                                              ; $6067: $00
	nop                                              ; $6068: $00
	nop                                              ; $6069: $00
	nop                                              ; $606a: $00
	nop                                              ; $606b: $00
	nop                                              ; $606c: $00
	nop                                              ; $606d: $00
	nop                                              ; $606e: $00
	nop                                              ; $606f: $00
	nop                                              ; $6070: $00
	nop                                              ; $6071: $00
	nop                                              ; $6072: $00
	nop                                              ; $6073: $00
	nop                                              ; $6074: $00
	nop                                              ; $6075: $00
	nop                                              ; $6076: $00
	nop                                              ; $6077: $00
	nop                                              ; $6078: $00
	nop                                              ; $6079: $00
	nop                                              ; $607a: $00
	nop                                              ; $607b: $00
	nop                                              ; $607c: $00
	nop                                              ; $607d: $00
	nop                                              ; $607e: $00
	nop                                              ; $607f: $00
	nop                                              ; $6080: $00
	nop                                              ; $6081: $00
	nop                                              ; $6082: $00
	nop                                              ; $6083: $00
	nop                                              ; $6084: $00
	nop                                              ; $6085: $00
	nop                                              ; $6086: $00
	nop                                              ; $6087: $00
	nop                                              ; $6088: $00
	nop                                              ; $6089: $00
	nop                                              ; $608a: $00
	nop                                              ; $608b: $00
	nop                                              ; $608c: $00
	nop                                              ; $608d: $00
	nop                                              ; $608e: $00
	nop                                              ; $608f: $00
	nop                                              ; $6090: $00
	nop                                              ; $6091: $00
	nop                                              ; $6092: $00
	nop                                              ; $6093: $00
	nop                                              ; $6094: $00
	nop                                              ; $6095: $00
	nop                                              ; $6096: $00
	nop                                              ; $6097: $00
	nop                                              ; $6098: $00
	nop                                              ; $6099: $00
	nop                                              ; $609a: $00
	nop                                              ; $609b: $00
	nop                                              ; $609c: $00
	nop                                              ; $609d: $00
	nop                                              ; $609e: $00
	nop                                              ; $609f: $00
	nop                                              ; $60a0: $00
	nop                                              ; $60a1: $00
	nop                                              ; $60a2: $00
	nop                                              ; $60a3: $00
	nop                                              ; $60a4: $00
	nop                                              ; $60a5: $00
	nop                                              ; $60a6: $00
	nop                                              ; $60a7: $00
	nop                                              ; $60a8: $00
	nop                                              ; $60a9: $00
	nop                                              ; $60aa: $00
	nop                                              ; $60ab: $00
	nop                                              ; $60ac: $00
	nop                                              ; $60ad: $00
	nop                                              ; $60ae: $00
	nop                                              ; $60af: $00
	nop                                              ; $60b0: $00
	nop                                              ; $60b1: $00
	nop                                              ; $60b2: $00
	nop                                              ; $60b3: $00
	nop                                              ; $60b4: $00
	nop                                              ; $60b5: $00
	nop                                              ; $60b6: $00
	nop                                              ; $60b7: $00
	nop                                              ; $60b8: $00
	nop                                              ; $60b9: $00
	nop                                              ; $60ba: $00
	nop                                              ; $60bb: $00
	nop                                              ; $60bc: $00
	nop                                              ; $60bd: $00
	nop                                              ; $60be: $00
	nop                                              ; $60bf: $00
	nop                                              ; $60c0: $00
	nop                                              ; $60c1: $00
	nop                                              ; $60c2: $00
	nop                                              ; $60c3: $00
	nop                                              ; $60c4: $00
	nop                                              ; $60c5: $00
	nop                                              ; $60c6: $00
	nop                                              ; $60c7: $00
	nop                                              ; $60c8: $00
	nop                                              ; $60c9: $00
	nop                                              ; $60ca: $00
	nop                                              ; $60cb: $00
	nop                                              ; $60cc: $00
	nop                                              ; $60cd: $00
	nop                                              ; $60ce: $00
	nop                                              ; $60cf: $00
	nop                                              ; $60d0: $00
	nop                                              ; $60d1: $00
	nop                                              ; $60d2: $00
	nop                                              ; $60d3: $00
	nop                                              ; $60d4: $00
	nop                                              ; $60d5: $00
	nop                                              ; $60d6: $00
	nop                                              ; $60d7: $00
	nop                                              ; $60d8: $00
	nop                                              ; $60d9: $00
	nop                                              ; $60da: $00
	nop                                              ; $60db: $00
	nop                                              ; $60dc: $00
	nop                                              ; $60dd: $00
	nop                                              ; $60de: $00
	nop                                              ; $60df: $00
	nop                                              ; $60e0: $00
	nop                                              ; $60e1: $00
	nop                                              ; $60e2: $00
	nop                                              ; $60e3: $00
	nop                                              ; $60e4: $00
	nop                                              ; $60e5: $00
	nop                                              ; $60e6: $00
	nop                                              ; $60e7: $00
	nop                                              ; $60e8: $00
	nop                                              ; $60e9: $00
	nop                                              ; $60ea: $00
	nop                                              ; $60eb: $00
	nop                                              ; $60ec: $00
	nop                                              ; $60ed: $00
	nop                                              ; $60ee: $00
	nop                                              ; $60ef: $00
	nop                                              ; $60f0: $00
	nop                                              ; $60f1: $00
	nop                                              ; $60f2: $00
	nop                                              ; $60f3: $00
	nop                                              ; $60f4: $00
	nop                                              ; $60f5: $00
	nop                                              ; $60f6: $00
	nop                                              ; $60f7: $00
	nop                                              ; $60f8: $00
	nop                                              ; $60f9: $00
	nop                                              ; $60fa: $00
	nop                                              ; $60fb: $00
	nop                                              ; $60fc: $00
	nop                                              ; $60fd: $00
	nop                                              ; $60fe: $00
	nop                                              ; $60ff: $00
	nop                                              ; $6100: $00
	nop                                              ; $6101: $00
	nop                                              ; $6102: $00
	nop                                              ; $6103: $00
	nop                                              ; $6104: $00
	nop                                              ; $6105: $00
	nop                                              ; $6106: $00
	nop                                              ; $6107: $00
	nop                                              ; $6108: $00
	nop                                              ; $6109: $00
	nop                                              ; $610a: $00
	nop                                              ; $610b: $00
	nop                                              ; $610c: $00
	nop                                              ; $610d: $00
	nop                                              ; $610e: $00
	nop                                              ; $610f: $00
	nop                                              ; $6110: $00
	nop                                              ; $6111: $00
	nop                                              ; $6112: $00
	nop                                              ; $6113: $00
	nop                                              ; $6114: $00
	nop                                              ; $6115: $00
	nop                                              ; $6116: $00
	nop                                              ; $6117: $00
	nop                                              ; $6118: $00
	nop                                              ; $6119: $00
	nop                                              ; $611a: $00
	nop                                              ; $611b: $00
	nop                                              ; $611c: $00
	nop                                              ; $611d: $00
	nop                                              ; $611e: $00
	nop                                              ; $611f: $00
	nop                                              ; $6120: $00
	nop                                              ; $6121: $00
	nop                                              ; $6122: $00
	nop                                              ; $6123: $00
	nop                                              ; $6124: $00
	nop                                              ; $6125: $00
	nop                                              ; $6126: $00
	nop                                              ; $6127: $00
	nop                                              ; $6128: $00
	nop                                              ; $6129: $00
	nop                                              ; $612a: $00
	nop                                              ; $612b: $00
	nop                                              ; $612c: $00
	nop                                              ; $612d: $00
	nop                                              ; $612e: $00
	nop                                              ; $612f: $00
	nop                                              ; $6130: $00
	nop                                              ; $6131: $00
	nop                                              ; $6132: $00
	nop                                              ; $6133: $00
	nop                                              ; $6134: $00
	nop                                              ; $6135: $00
	nop                                              ; $6136: $00
	nop                                              ; $6137: $00
	nop                                              ; $6138: $00
	nop                                              ; $6139: $00
	nop                                              ; $613a: $00
	nop                                              ; $613b: $00
	nop                                              ; $613c: $00
	nop                                              ; $613d: $00
	nop                                              ; $613e: $00
	nop                                              ; $613f: $00
	nop                                              ; $6140: $00
	nop                                              ; $6141: $00
	nop                                              ; $6142: $00
	nop                                              ; $6143: $00
	nop                                              ; $6144: $00
	nop                                              ; $6145: $00
	nop                                              ; $6146: $00
	nop                                              ; $6147: $00
	nop                                              ; $6148: $00
	nop                                              ; $6149: $00
	nop                                              ; $614a: $00
	nop                                              ; $614b: $00
	nop                                              ; $614c: $00
	nop                                              ; $614d: $00
	nop                                              ; $614e: $00
	nop                                              ; $614f: $00
	nop                                              ; $6150: $00
	nop                                              ; $6151: $00
	nop                                              ; $6152: $00
	nop                                              ; $6153: $00
	nop                                              ; $6154: $00
	nop                                              ; $6155: $00
	nop                                              ; $6156: $00
	nop                                              ; $6157: $00
	nop                                              ; $6158: $00
	nop                                              ; $6159: $00
	nop                                              ; $615a: $00
	nop                                              ; $615b: $00
	nop                                              ; $615c: $00
	nop                                              ; $615d: $00
	nop                                              ; $615e: $00
	nop                                              ; $615f: $00
	nop                                              ; $6160: $00
	nop                                              ; $6161: $00
	nop                                              ; $6162: $00
	nop                                              ; $6163: $00
	nop                                              ; $6164: $00
	nop                                              ; $6165: $00
	nop                                              ; $6166: $00
	nop                                              ; $6167: $00
	nop                                              ; $6168: $00
	nop                                              ; $6169: $00
	nop                                              ; $616a: $00
	nop                                              ; $616b: $00
	nop                                              ; $616c: $00
	nop                                              ; $616d: $00
	nop                                              ; $616e: $00
	nop                                              ; $616f: $00
	nop                                              ; $6170: $00
	nop                                              ; $6171: $00
	nop                                              ; $6172: $00
	nop                                              ; $6173: $00
	nop                                              ; $6174: $00
	nop                                              ; $6175: $00
	nop                                              ; $6176: $00
	nop                                              ; $6177: $00
	nop                                              ; $6178: $00
	nop                                              ; $6179: $00
	nop                                              ; $617a: $00
	nop                                              ; $617b: $00
	nop                                              ; $617c: $00
	nop                                              ; $617d: $00
	nop                                              ; $617e: $00
	nop                                              ; $617f: $00
	nop                                              ; $6180: $00
	nop                                              ; $6181: $00
	nop                                              ; $6182: $00
	nop                                              ; $6183: $00
	nop                                              ; $6184: $00
	nop                                              ; $6185: $00
	nop                                              ; $6186: $00
	nop                                              ; $6187: $00
	nop                                              ; $6188: $00
	nop                                              ; $6189: $00
	nop                                              ; $618a: $00
	nop                                              ; $618b: $00
	nop                                              ; $618c: $00
	nop                                              ; $618d: $00
	nop                                              ; $618e: $00
	nop                                              ; $618f: $00
	nop                                              ; $6190: $00
	nop                                              ; $6191: $00
	nop                                              ; $6192: $00
	nop                                              ; $6193: $00
	nop                                              ; $6194: $00
	nop                                              ; $6195: $00
	nop                                              ; $6196: $00
	nop                                              ; $6197: $00
	nop                                              ; $6198: $00
	nop                                              ; $6199: $00
	nop                                              ; $619a: $00
	nop                                              ; $619b: $00
	nop                                              ; $619c: $00
	nop                                              ; $619d: $00
	nop                                              ; $619e: $00
	nop                                              ; $619f: $00
	nop                                              ; $61a0: $00
	nop                                              ; $61a1: $00
	nop                                              ; $61a2: $00
	nop                                              ; $61a3: $00
	nop                                              ; $61a4: $00
	nop                                              ; $61a5: $00
	nop                                              ; $61a6: $00
	nop                                              ; $61a7: $00
	nop                                              ; $61a8: $00
	nop                                              ; $61a9: $00
	nop                                              ; $61aa: $00
	nop                                              ; $61ab: $00
	nop                                              ; $61ac: $00
	nop                                              ; $61ad: $00
	nop                                              ; $61ae: $00
	nop                                              ; $61af: $00
	nop                                              ; $61b0: $00
	nop                                              ; $61b1: $00
	nop                                              ; $61b2: $00
	nop                                              ; $61b3: $00
	nop                                              ; $61b4: $00
	nop                                              ; $61b5: $00
	nop                                              ; $61b6: $00
	nop                                              ; $61b7: $00
	nop                                              ; $61b8: $00
	nop                                              ; $61b9: $00
	nop                                              ; $61ba: $00
	nop                                              ; $61bb: $00
	nop                                              ; $61bc: $00
	nop                                              ; $61bd: $00
	nop                                              ; $61be: $00
	nop                                              ; $61bf: $00
	nop                                              ; $61c0: $00
	nop                                              ; $61c1: $00
	nop                                              ; $61c2: $00
	nop                                              ; $61c3: $00
	nop                                              ; $61c4: $00
	nop                                              ; $61c5: $00
	nop                                              ; $61c6: $00
	nop                                              ; $61c7: $00
	nop                                              ; $61c8: $00
	nop                                              ; $61c9: $00
	nop                                              ; $61ca: $00
	nop                                              ; $61cb: $00
	nop                                              ; $61cc: $00
	nop                                              ; $61cd: $00
	nop                                              ; $61ce: $00
	nop                                              ; $61cf: $00
	nop                                              ; $61d0: $00
	nop                                              ; $61d1: $00
	nop                                              ; $61d2: $00
	nop                                              ; $61d3: $00
	nop                                              ; $61d4: $00
	nop                                              ; $61d5: $00
	nop                                              ; $61d6: $00
	nop                                              ; $61d7: $00
	nop                                              ; $61d8: $00
	nop                                              ; $61d9: $00
	nop                                              ; $61da: $00
	nop                                              ; $61db: $00
	nop                                              ; $61dc: $00
	nop                                              ; $61dd: $00
	nop                                              ; $61de: $00
	nop                                              ; $61df: $00
	nop                                              ; $61e0: $00
	nop                                              ; $61e1: $00
	nop                                              ; $61e2: $00
	nop                                              ; $61e3: $00
	nop                                              ; $61e4: $00
	nop                                              ; $61e5: $00
	nop                                              ; $61e6: $00
	nop                                              ; $61e7: $00
	nop                                              ; $61e8: $00
	nop                                              ; $61e9: $00
	nop                                              ; $61ea: $00
	nop                                              ; $61eb: $00
	nop                                              ; $61ec: $00
	nop                                              ; $61ed: $00
	nop                                              ; $61ee: $00
	nop                                              ; $61ef: $00
	nop                                              ; $61f0: $00
	nop                                              ; $61f1: $00
	nop                                              ; $61f2: $00
	nop                                              ; $61f3: $00
	nop                                              ; $61f4: $00
	nop                                              ; $61f5: $00
	nop                                              ; $61f6: $00
	nop                                              ; $61f7: $00
	nop                                              ; $61f8: $00
	nop                                              ; $61f9: $00
	nop                                              ; $61fa: $00
	nop                                              ; $61fb: $00
	nop                                              ; $61fc: $00
	nop                                              ; $61fd: $00
	nop                                              ; $61fe: $00
	nop                                              ; $61ff: $00
	nop                                              ; $6200: $00
	nop                                              ; $6201: $00
	nop                                              ; $6202: $00
	nop                                              ; $6203: $00
	nop                                              ; $6204: $00
	nop                                              ; $6205: $00
	nop                                              ; $6206: $00
	nop                                              ; $6207: $00
	nop                                              ; $6208: $00
	nop                                              ; $6209: $00
	nop                                              ; $620a: $00
	nop                                              ; $620b: $00
	nop                                              ; $620c: $00
	nop                                              ; $620d: $00
	nop                                              ; $620e: $00
	nop                                              ; $620f: $00
	nop                                              ; $6210: $00
	nop                                              ; $6211: $00
	nop                                              ; $6212: $00
	nop                                              ; $6213: $00
	nop                                              ; $6214: $00
	nop                                              ; $6215: $00
	nop                                              ; $6216: $00
	nop                                              ; $6217: $00
	nop                                              ; $6218: $00
	nop                                              ; $6219: $00
	nop                                              ; $621a: $00
	nop                                              ; $621b: $00
	nop                                              ; $621c: $00
	nop                                              ; $621d: $00
	nop                                              ; $621e: $00
	nop                                              ; $621f: $00
	nop                                              ; $6220: $00
	nop                                              ; $6221: $00
	nop                                              ; $6222: $00
	nop                                              ; $6223: $00
	nop                                              ; $6224: $00
	nop                                              ; $6225: $00
	nop                                              ; $6226: $00
	nop                                              ; $6227: $00
	nop                                              ; $6228: $00
	nop                                              ; $6229: $00
	nop                                              ; $622a: $00
	nop                                              ; $622b: $00
	nop                                              ; $622c: $00
	nop                                              ; $622d: $00
	nop                                              ; $622e: $00
	nop                                              ; $622f: $00
	nop                                              ; $6230: $00
	nop                                              ; $6231: $00
	nop                                              ; $6232: $00
	nop                                              ; $6233: $00
	nop                                              ; $6234: $00
	nop                                              ; $6235: $00
	nop                                              ; $6236: $00
	nop                                              ; $6237: $00
	nop                                              ; $6238: $00
	nop                                              ; $6239: $00
	nop                                              ; $623a: $00
	nop                                              ; $623b: $00
	nop                                              ; $623c: $00
	nop                                              ; $623d: $00
	nop                                              ; $623e: $00
	nop                                              ; $623f: $00
	nop                                              ; $6240: $00
	nop                                              ; $6241: $00
	nop                                              ; $6242: $00
	nop                                              ; $6243: $00
	nop                                              ; $6244: $00
	nop                                              ; $6245: $00
	nop                                              ; $6246: $00
	nop                                              ; $6247: $00
	nop                                              ; $6248: $00
	nop                                              ; $6249: $00
	nop                                              ; $624a: $00
	nop                                              ; $624b: $00
	nop                                              ; $624c: $00
	nop                                              ; $624d: $00
	nop                                              ; $624e: $00
	nop                                              ; $624f: $00
	nop                                              ; $6250: $00
	nop                                              ; $6251: $00
	nop                                              ; $6252: $00
	nop                                              ; $6253: $00
	nop                                              ; $6254: $00
	nop                                              ; $6255: $00
	nop                                              ; $6256: $00
	nop                                              ; $6257: $00
	nop                                              ; $6258: $00
	nop                                              ; $6259: $00
	nop                                              ; $625a: $00
	nop                                              ; $625b: $00
	nop                                              ; $625c: $00
	nop                                              ; $625d: $00
	nop                                              ; $625e: $00
	nop                                              ; $625f: $00
	nop                                              ; $6260: $00
	nop                                              ; $6261: $00
	nop                                              ; $6262: $00
	nop                                              ; $6263: $00
	nop                                              ; $6264: $00
	nop                                              ; $6265: $00
	nop                                              ; $6266: $00
	nop                                              ; $6267: $00
	nop                                              ; $6268: $00
	nop                                              ; $6269: $00
	nop                                              ; $626a: $00
	nop                                              ; $626b: $00
	nop                                              ; $626c: $00
	nop                                              ; $626d: $00
	nop                                              ; $626e: $00
	nop                                              ; $626f: $00
	nop                                              ; $6270: $00
	nop                                              ; $6271: $00
	nop                                              ; $6272: $00
	nop                                              ; $6273: $00
	nop                                              ; $6274: $00
	nop                                              ; $6275: $00
	nop                                              ; $6276: $00
	nop                                              ; $6277: $00
	nop                                              ; $6278: $00
	nop                                              ; $6279: $00
	nop                                              ; $627a: $00
	nop                                              ; $627b: $00
	nop                                              ; $627c: $00
	nop                                              ; $627d: $00
	nop                                              ; $627e: $00
	nop                                              ; $627f: $00
	nop                                              ; $6280: $00
	nop                                              ; $6281: $00
	nop                                              ; $6282: $00
	nop                                              ; $6283: $00
	nop                                              ; $6284: $00
	nop                                              ; $6285: $00
	nop                                              ; $6286: $00
	nop                                              ; $6287: $00
	nop                                              ; $6288: $00
	nop                                              ; $6289: $00
	nop                                              ; $628a: $00
	nop                                              ; $628b: $00
	nop                                              ; $628c: $00
	nop                                              ; $628d: $00
	nop                                              ; $628e: $00
	nop                                              ; $628f: $00
	nop                                              ; $6290: $00
	nop                                              ; $6291: $00
	nop                                              ; $6292: $00
	nop                                              ; $6293: $00
	nop                                              ; $6294: $00
	nop                                              ; $6295: $00
	nop                                              ; $6296: $00
	nop                                              ; $6297: $00
	nop                                              ; $6298: $00
	nop                                              ; $6299: $00
	nop                                              ; $629a: $00
	nop                                              ; $629b: $00
	nop                                              ; $629c: $00
	nop                                              ; $629d: $00
	nop                                              ; $629e: $00
	nop                                              ; $629f: $00
	nop                                              ; $62a0: $00
	nop                                              ; $62a1: $00
	nop                                              ; $62a2: $00
	nop                                              ; $62a3: $00
	nop                                              ; $62a4: $00
	nop                                              ; $62a5: $00
	nop                                              ; $62a6: $00
	nop                                              ; $62a7: $00
	nop                                              ; $62a8: $00
	nop                                              ; $62a9: $00
	nop                                              ; $62aa: $00
	nop                                              ; $62ab: $00
	nop                                              ; $62ac: $00
	nop                                              ; $62ad: $00
	nop                                              ; $62ae: $00
	nop                                              ; $62af: $00
	nop                                              ; $62b0: $00
	nop                                              ; $62b1: $00
	nop                                              ; $62b2: $00
	nop                                              ; $62b3: $00
	nop                                              ; $62b4: $00
	nop                                              ; $62b5: $00
	nop                                              ; $62b6: $00
	nop                                              ; $62b7: $00
	nop                                              ; $62b8: $00
	nop                                              ; $62b9: $00
	nop                                              ; $62ba: $00
	nop                                              ; $62bb: $00
	nop                                              ; $62bc: $00
	nop                                              ; $62bd: $00
	nop                                              ; $62be: $00
	nop                                              ; $62bf: $00
	nop                                              ; $62c0: $00
	nop                                              ; $62c1: $00
	nop                                              ; $62c2: $00
	nop                                              ; $62c3: $00
	nop                                              ; $62c4: $00
	nop                                              ; $62c5: $00
	nop                                              ; $62c6: $00
	nop                                              ; $62c7: $00
	nop                                              ; $62c8: $00
	nop                                              ; $62c9: $00
	nop                                              ; $62ca: $00
	nop                                              ; $62cb: $00
	nop                                              ; $62cc: $00
	nop                                              ; $62cd: $00
	nop                                              ; $62ce: $00
	nop                                              ; $62cf: $00
	nop                                              ; $62d0: $00
	nop                                              ; $62d1: $00
	nop                                              ; $62d2: $00
	nop                                              ; $62d3: $00
	nop                                              ; $62d4: $00
	nop                                              ; $62d5: $00
	nop                                              ; $62d6: $00
	nop                                              ; $62d7: $00
	nop                                              ; $62d8: $00
	nop                                              ; $62d9: $00
	nop                                              ; $62da: $00
	nop                                              ; $62db: $00
	nop                                              ; $62dc: $00
	nop                                              ; $62dd: $00
	nop                                              ; $62de: $00
	nop                                              ; $62df: $00
	nop                                              ; $62e0: $00
	nop                                              ; $62e1: $00
	nop                                              ; $62e2: $00
	nop                                              ; $62e3: $00
	nop                                              ; $62e4: $00
	nop                                              ; $62e5: $00
	nop                                              ; $62e6: $00
	nop                                              ; $62e7: $00
	nop                                              ; $62e8: $00
	nop                                              ; $62e9: $00
	nop                                              ; $62ea: $00
	nop                                              ; $62eb: $00
	nop                                              ; $62ec: $00
	nop                                              ; $62ed: $00
	nop                                              ; $62ee: $00
	nop                                              ; $62ef: $00
	nop                                              ; $62f0: $00
	nop                                              ; $62f1: $00
	nop                                              ; $62f2: $00
	nop                                              ; $62f3: $00
	nop                                              ; $62f4: $00
	nop                                              ; $62f5: $00
	nop                                              ; $62f6: $00
	nop                                              ; $62f7: $00
	nop                                              ; $62f8: $00
	nop                                              ; $62f9: $00
	nop                                              ; $62fa: $00
	nop                                              ; $62fb: $00
	nop                                              ; $62fc: $00
	nop                                              ; $62fd: $00
	nop                                              ; $62fe: $00
	nop                                              ; $62ff: $00
	nop                                              ; $6300: $00
	nop                                              ; $6301: $00
	nop                                              ; $6302: $00
	nop                                              ; $6303: $00
	nop                                              ; $6304: $00
	nop                                              ; $6305: $00
	nop                                              ; $6306: $00
	nop                                              ; $6307: $00
	nop                                              ; $6308: $00
	nop                                              ; $6309: $00
	nop                                              ; $630a: $00
	nop                                              ; $630b: $00
	nop                                              ; $630c: $00
	nop                                              ; $630d: $00
	nop                                              ; $630e: $00
	nop                                              ; $630f: $00
	nop                                              ; $6310: $00
	nop                                              ; $6311: $00
	nop                                              ; $6312: $00
	nop                                              ; $6313: $00
	nop                                              ; $6314: $00
	nop                                              ; $6315: $00
	nop                                              ; $6316: $00
	nop                                              ; $6317: $00
	nop                                              ; $6318: $00
	nop                                              ; $6319: $00
	nop                                              ; $631a: $00
	nop                                              ; $631b: $00
	nop                                              ; $631c: $00
	nop                                              ; $631d: $00
	nop                                              ; $631e: $00
	nop                                              ; $631f: $00
	nop                                              ; $6320: $00
	nop                                              ; $6321: $00
	nop                                              ; $6322: $00
	nop                                              ; $6323: $00
	nop                                              ; $6324: $00
	nop                                              ; $6325: $00
	nop                                              ; $6326: $00
	nop                                              ; $6327: $00
	nop                                              ; $6328: $00
	nop                                              ; $6329: $00
	nop                                              ; $632a: $00
	nop                                              ; $632b: $00
	nop                                              ; $632c: $00
	nop                                              ; $632d: $00
	nop                                              ; $632e: $00
	nop                                              ; $632f: $00
	nop                                              ; $6330: $00
	nop                                              ; $6331: $00
	nop                                              ; $6332: $00
	nop                                              ; $6333: $00
	nop                                              ; $6334: $00
	nop                                              ; $6335: $00
	nop                                              ; $6336: $00
	nop                                              ; $6337: $00
	nop                                              ; $6338: $00
	nop                                              ; $6339: $00
	nop                                              ; $633a: $00
	nop                                              ; $633b: $00
	nop                                              ; $633c: $00
	nop                                              ; $633d: $00
	nop                                              ; $633e: $00
	nop                                              ; $633f: $00
	nop                                              ; $6340: $00
	nop                                              ; $6341: $00
	nop                                              ; $6342: $00
	nop                                              ; $6343: $00
	nop                                              ; $6344: $00
	nop                                              ; $6345: $00
	nop                                              ; $6346: $00
	nop                                              ; $6347: $00
	nop                                              ; $6348: $00
	nop                                              ; $6349: $00
	nop                                              ; $634a: $00
	nop                                              ; $634b: $00
	nop                                              ; $634c: $00
	nop                                              ; $634d: $00
	nop                                              ; $634e: $00
	nop                                              ; $634f: $00
	nop                                              ; $6350: $00
	nop                                              ; $6351: $00
	nop                                              ; $6352: $00
	nop                                              ; $6353: $00
	nop                                              ; $6354: $00
	nop                                              ; $6355: $00
	nop                                              ; $6356: $00
	nop                                              ; $6357: $00
	nop                                              ; $6358: $00
	nop                                              ; $6359: $00
	nop                                              ; $635a: $00
	nop                                              ; $635b: $00
	nop                                              ; $635c: $00
	nop                                              ; $635d: $00
	nop                                              ; $635e: $00
	nop                                              ; $635f: $00
	nop                                              ; $6360: $00
	nop                                              ; $6361: $00
	nop                                              ; $6362: $00
	nop                                              ; $6363: $00
	nop                                              ; $6364: $00
	nop                                              ; $6365: $00
	nop                                              ; $6366: $00
	nop                                              ; $6367: $00
	nop                                              ; $6368: $00
	nop                                              ; $6369: $00
	nop                                              ; $636a: $00
	nop                                              ; $636b: $00
	nop                                              ; $636c: $00
	nop                                              ; $636d: $00
	nop                                              ; $636e: $00
	nop                                              ; $636f: $00
	nop                                              ; $6370: $00
	nop                                              ; $6371: $00
	nop                                              ; $6372: $00
	nop                                              ; $6373: $00
	nop                                              ; $6374: $00
	nop                                              ; $6375: $00
	nop                                              ; $6376: $00
	nop                                              ; $6377: $00
	nop                                              ; $6378: $00
	nop                                              ; $6379: $00
	nop                                              ; $637a: $00
	nop                                              ; $637b: $00
	nop                                              ; $637c: $00
	nop                                              ; $637d: $00
	nop                                              ; $637e: $00
	nop                                              ; $637f: $00
	nop                                              ; $6380: $00
	nop                                              ; $6381: $00
	nop                                              ; $6382: $00
	nop                                              ; $6383: $00
	nop                                              ; $6384: $00
	nop                                              ; $6385: $00
	nop                                              ; $6386: $00
	nop                                              ; $6387: $00
	nop                                              ; $6388: $00
	nop                                              ; $6389: $00
	nop                                              ; $638a: $00
	nop                                              ; $638b: $00
	nop                                              ; $638c: $00
	nop                                              ; $638d: $00
	nop                                              ; $638e: $00
	nop                                              ; $638f: $00
	nop                                              ; $6390: $00
	nop                                              ; $6391: $00
	nop                                              ; $6392: $00
	nop                                              ; $6393: $00
	nop                                              ; $6394: $00
	nop                                              ; $6395: $00
	nop                                              ; $6396: $00
	nop                                              ; $6397: $00
	nop                                              ; $6398: $00
	nop                                              ; $6399: $00
	nop                                              ; $639a: $00
	nop                                              ; $639b: $00
	nop                                              ; $639c: $00
	nop                                              ; $639d: $00
	nop                                              ; $639e: $00
	nop                                              ; $639f: $00
	nop                                              ; $63a0: $00
	nop                                              ; $63a1: $00
	nop                                              ; $63a2: $00
	nop                                              ; $63a3: $00
	nop                                              ; $63a4: $00
	nop                                              ; $63a5: $00
	nop                                              ; $63a6: $00
	nop                                              ; $63a7: $00
	nop                                              ; $63a8: $00
	nop                                              ; $63a9: $00
	nop                                              ; $63aa: $00
	nop                                              ; $63ab: $00
	nop                                              ; $63ac: $00
	nop                                              ; $63ad: $00
	nop                                              ; $63ae: $00
	nop                                              ; $63af: $00
	nop                                              ; $63b0: $00
	nop                                              ; $63b1: $00
	nop                                              ; $63b2: $00
	nop                                              ; $63b3: $00
	nop                                              ; $63b4: $00
	nop                                              ; $63b5: $00
	nop                                              ; $63b6: $00
	nop                                              ; $63b7: $00
	nop                                              ; $63b8: $00
	nop                                              ; $63b9: $00
	nop                                              ; $63ba: $00
	nop                                              ; $63bb: $00
	nop                                              ; $63bc: $00
	nop                                              ; $63bd: $00
	nop                                              ; $63be: $00
	nop                                              ; $63bf: $00
	nop                                              ; $63c0: $00
	nop                                              ; $63c1: $00
	nop                                              ; $63c2: $00
	nop                                              ; $63c3: $00
	nop                                              ; $63c4: $00
	nop                                              ; $63c5: $00
	nop                                              ; $63c6: $00
	nop                                              ; $63c7: $00
	nop                                              ; $63c8: $00
	nop                                              ; $63c9: $00
	nop                                              ; $63ca: $00
	nop                                              ; $63cb: $00
	nop                                              ; $63cc: $00
	nop                                              ; $63cd: $00
	nop                                              ; $63ce: $00
	nop                                              ; $63cf: $00
	nop                                              ; $63d0: $00
	nop                                              ; $63d1: $00
	nop                                              ; $63d2: $00
	nop                                              ; $63d3: $00
	nop                                              ; $63d4: $00
	nop                                              ; $63d5: $00
	nop                                              ; $63d6: $00
	nop                                              ; $63d7: $00
	nop                                              ; $63d8: $00
	nop                                              ; $63d9: $00
	nop                                              ; $63da: $00
	nop                                              ; $63db: $00
	nop                                              ; $63dc: $00
	nop                                              ; $63dd: $00
	nop                                              ; $63de: $00
	nop                                              ; $63df: $00
	nop                                              ; $63e0: $00
	nop                                              ; $63e1: $00
	nop                                              ; $63e2: $00
	nop                                              ; $63e3: $00
	nop                                              ; $63e4: $00
	nop                                              ; $63e5: $00
	nop                                              ; $63e6: $00
	nop                                              ; $63e7: $00
	nop                                              ; $63e8: $00
	nop                                              ; $63e9: $00
	nop                                              ; $63ea: $00
	nop                                              ; $63eb: $00
	nop                                              ; $63ec: $00
	nop                                              ; $63ed: $00
	nop                                              ; $63ee: $00
	nop                                              ; $63ef: $00
	nop                                              ; $63f0: $00
	nop                                              ; $63f1: $00
	nop                                              ; $63f2: $00
	nop                                              ; $63f3: $00
	nop                                              ; $63f4: $00
	nop                                              ; $63f5: $00
	nop                                              ; $63f6: $00
	nop                                              ; $63f7: $00
	nop                                              ; $63f8: $00
	nop                                              ; $63f9: $00
	nop                                              ; $63fa: $00
	nop                                              ; $63fb: $00
	nop                                              ; $63fc: $00
	nop                                              ; $63fd: $00
	nop                                              ; $63fe: $00
	nop                                              ; $63ff: $00
	nop                                              ; $6400: $00
	nop                                              ; $6401: $00
	nop                                              ; $6402: $00
	nop                                              ; $6403: $00
	nop                                              ; $6404: $00
	nop                                              ; $6405: $00
	nop                                              ; $6406: $00
	nop                                              ; $6407: $00
	nop                                              ; $6408: $00
	nop                                              ; $6409: $00
	nop                                              ; $640a: $00
	nop                                              ; $640b: $00
	nop                                              ; $640c: $00
	nop                                              ; $640d: $00
	nop                                              ; $640e: $00
	nop                                              ; $640f: $00
	nop                                              ; $6410: $00
	nop                                              ; $6411: $00
	nop                                              ; $6412: $00
	nop                                              ; $6413: $00
	nop                                              ; $6414: $00
	nop                                              ; $6415: $00
	nop                                              ; $6416: $00
	nop                                              ; $6417: $00
	nop                                              ; $6418: $00
	nop                                              ; $6419: $00
	nop                                              ; $641a: $00
	nop                                              ; $641b: $00
	nop                                              ; $641c: $00
	nop                                              ; $641d: $00
	nop                                              ; $641e: $00
	nop                                              ; $641f: $00
	nop                                              ; $6420: $00
	nop                                              ; $6421: $00
	nop                                              ; $6422: $00
	nop                                              ; $6423: $00
	nop                                              ; $6424: $00
	nop                                              ; $6425: $00
	nop                                              ; $6426: $00
	nop                                              ; $6427: $00
	nop                                              ; $6428: $00
	nop                                              ; $6429: $00
	nop                                              ; $642a: $00
	nop                                              ; $642b: $00
	nop                                              ; $642c: $00
	nop                                              ; $642d: $00
	nop                                              ; $642e: $00
	nop                                              ; $642f: $00
	nop                                              ; $6430: $00
	nop                                              ; $6431: $00
	nop                                              ; $6432: $00
	nop                                              ; $6433: $00
	nop                                              ; $6434: $00
	nop                                              ; $6435: $00
	nop                                              ; $6436: $00
	nop                                              ; $6437: $00
	nop                                              ; $6438: $00
	nop                                              ; $6439: $00
	nop                                              ; $643a: $00
	nop                                              ; $643b: $00
	nop                                              ; $643c: $00
	nop                                              ; $643d: $00
	nop                                              ; $643e: $00
	nop                                              ; $643f: $00
	nop                                              ; $6440: $00
	nop                                              ; $6441: $00
	nop                                              ; $6442: $00
	nop                                              ; $6443: $00
	nop                                              ; $6444: $00
	nop                                              ; $6445: $00
	nop                                              ; $6446: $00
	nop                                              ; $6447: $00
	nop                                              ; $6448: $00
	nop                                              ; $6449: $00
	nop                                              ; $644a: $00
	nop                                              ; $644b: $00
	nop                                              ; $644c: $00
	nop                                              ; $644d: $00
	nop                                              ; $644e: $00
	nop                                              ; $644f: $00
	nop                                              ; $6450: $00
	nop                                              ; $6451: $00
	nop                                              ; $6452: $00
	nop                                              ; $6453: $00
	nop                                              ; $6454: $00
	nop                                              ; $6455: $00
	nop                                              ; $6456: $00
	nop                                              ; $6457: $00
	nop                                              ; $6458: $00
	nop                                              ; $6459: $00
	nop                                              ; $645a: $00
	nop                                              ; $645b: $00
	nop                                              ; $645c: $00
	nop                                              ; $645d: $00
	nop                                              ; $645e: $00
	nop                                              ; $645f: $00
	nop                                              ; $6460: $00
	nop                                              ; $6461: $00
	nop                                              ; $6462: $00
	nop                                              ; $6463: $00
	nop                                              ; $6464: $00
	nop                                              ; $6465: $00
	nop                                              ; $6466: $00
	nop                                              ; $6467: $00
	nop                                              ; $6468: $00
	nop                                              ; $6469: $00
	nop                                              ; $646a: $00
	nop                                              ; $646b: $00
	nop                                              ; $646c: $00
	nop                                              ; $646d: $00
	nop                                              ; $646e: $00
	nop                                              ; $646f: $00
	nop                                              ; $6470: $00
	nop                                              ; $6471: $00
	nop                                              ; $6472: $00
	nop                                              ; $6473: $00
	nop                                              ; $6474: $00
	nop                                              ; $6475: $00
	nop                                              ; $6476: $00
	nop                                              ; $6477: $00
	nop                                              ; $6478: $00
	nop                                              ; $6479: $00
	nop                                              ; $647a: $00
	nop                                              ; $647b: $00
	nop                                              ; $647c: $00
	nop                                              ; $647d: $00
	nop                                              ; $647e: $00
	nop                                              ; $647f: $00
	nop                                              ; $6480: $00
	nop                                              ; $6481: $00
	nop                                              ; $6482: $00
	nop                                              ; $6483: $00
	nop                                              ; $6484: $00
	nop                                              ; $6485: $00
	nop                                              ; $6486: $00
	nop                                              ; $6487: $00
	nop                                              ; $6488: $00
	nop                                              ; $6489: $00
	nop                                              ; $648a: $00
	nop                                              ; $648b: $00
	nop                                              ; $648c: $00
	nop                                              ; $648d: $00
	nop                                              ; $648e: $00
	nop                                              ; $648f: $00
	nop                                              ; $6490: $00
	nop                                              ; $6491: $00
	nop                                              ; $6492: $00
	nop                                              ; $6493: $00
	nop                                              ; $6494: $00
	nop                                              ; $6495: $00
	nop                                              ; $6496: $00
	nop                                              ; $6497: $00
	nop                                              ; $6498: $00
	nop                                              ; $6499: $00
	nop                                              ; $649a: $00
	nop                                              ; $649b: $00
	nop                                              ; $649c: $00
	nop                                              ; $649d: $00
	nop                                              ; $649e: $00
	nop                                              ; $649f: $00
	nop                                              ; $64a0: $00
	nop                                              ; $64a1: $00
	nop                                              ; $64a2: $00
	nop                                              ; $64a3: $00
	nop                                              ; $64a4: $00
	nop                                              ; $64a5: $00
	nop                                              ; $64a6: $00
	nop                                              ; $64a7: $00
	nop                                              ; $64a8: $00
	nop                                              ; $64a9: $00
	nop                                              ; $64aa: $00
	nop                                              ; $64ab: $00
	nop                                              ; $64ac: $00
	nop                                              ; $64ad: $00
	nop                                              ; $64ae: $00
	nop                                              ; $64af: $00
	nop                                              ; $64b0: $00
	nop                                              ; $64b1: $00
	nop                                              ; $64b2: $00
	nop                                              ; $64b3: $00
	nop                                              ; $64b4: $00
	nop                                              ; $64b5: $00
	nop                                              ; $64b6: $00
	nop                                              ; $64b7: $00
	nop                                              ; $64b8: $00
	nop                                              ; $64b9: $00
	nop                                              ; $64ba: $00
	nop                                              ; $64bb: $00
	nop                                              ; $64bc: $00
	nop                                              ; $64bd: $00
	nop                                              ; $64be: $00
	nop                                              ; $64bf: $00
	nop                                              ; $64c0: $00
	nop                                              ; $64c1: $00
	nop                                              ; $64c2: $00
	nop                                              ; $64c3: $00
	nop                                              ; $64c4: $00
	nop                                              ; $64c5: $00
	nop                                              ; $64c6: $00
	nop                                              ; $64c7: $00
	nop                                              ; $64c8: $00
	nop                                              ; $64c9: $00
	nop                                              ; $64ca: $00
	nop                                              ; $64cb: $00
	nop                                              ; $64cc: $00
	nop                                              ; $64cd: $00
	nop                                              ; $64ce: $00
	nop                                              ; $64cf: $00
	nop                                              ; $64d0: $00
	nop                                              ; $64d1: $00
	nop                                              ; $64d2: $00
	nop                                              ; $64d3: $00
	nop                                              ; $64d4: $00
	nop                                              ; $64d5: $00
	nop                                              ; $64d6: $00
	nop                                              ; $64d7: $00
	nop                                              ; $64d8: $00
	nop                                              ; $64d9: $00
	nop                                              ; $64da: $00
	nop                                              ; $64db: $00
	nop                                              ; $64dc: $00
	nop                                              ; $64dd: $00
	nop                                              ; $64de: $00
	nop                                              ; $64df: $00
	nop                                              ; $64e0: $00
	nop                                              ; $64e1: $00
	nop                                              ; $64e2: $00
	nop                                              ; $64e3: $00
	nop                                              ; $64e4: $00
	nop                                              ; $64e5: $00
	nop                                              ; $64e6: $00
	nop                                              ; $64e7: $00
	nop                                              ; $64e8: $00
	nop                                              ; $64e9: $00
	nop                                              ; $64ea: $00
	nop                                              ; $64eb: $00
	nop                                              ; $64ec: $00
	nop                                              ; $64ed: $00
	nop                                              ; $64ee: $00
	nop                                              ; $64ef: $00
	nop                                              ; $64f0: $00
	nop                                              ; $64f1: $00
	nop                                              ; $64f2: $00
	nop                                              ; $64f3: $00
	nop                                              ; $64f4: $00
	nop                                              ; $64f5: $00
	nop                                              ; $64f6: $00
	nop                                              ; $64f7: $00
	nop                                              ; $64f8: $00
	nop                                              ; $64f9: $00
	nop                                              ; $64fa: $00
	nop                                              ; $64fb: $00
	nop                                              ; $64fc: $00
	nop                                              ; $64fd: $00
	nop                                              ; $64fe: $00
	nop                                              ; $64ff: $00
	nop                                              ; $6500: $00
	nop                                              ; $6501: $00
	nop                                              ; $6502: $00
	nop                                              ; $6503: $00
	nop                                              ; $6504: $00
	nop                                              ; $6505: $00
	nop                                              ; $6506: $00
	nop                                              ; $6507: $00
	nop                                              ; $6508: $00
	nop                                              ; $6509: $00
	nop                                              ; $650a: $00
	nop                                              ; $650b: $00
	nop                                              ; $650c: $00
	nop                                              ; $650d: $00
	nop                                              ; $650e: $00
	nop                                              ; $650f: $00
	nop                                              ; $6510: $00
	nop                                              ; $6511: $00
	nop                                              ; $6512: $00
	nop                                              ; $6513: $00
	nop                                              ; $6514: $00
	nop                                              ; $6515: $00
	nop                                              ; $6516: $00
	nop                                              ; $6517: $00
	nop                                              ; $6518: $00
	nop                                              ; $6519: $00
	nop                                              ; $651a: $00
	nop                                              ; $651b: $00
	nop                                              ; $651c: $00
	nop                                              ; $651d: $00
	nop                                              ; $651e: $00
	nop                                              ; $651f: $00
	nop                                              ; $6520: $00
	nop                                              ; $6521: $00
	nop                                              ; $6522: $00
	nop                                              ; $6523: $00
	nop                                              ; $6524: $00
	nop                                              ; $6525: $00
	nop                                              ; $6526: $00
	nop                                              ; $6527: $00
	nop                                              ; $6528: $00
	nop                                              ; $6529: $00
	nop                                              ; $652a: $00
	nop                                              ; $652b: $00
	nop                                              ; $652c: $00
	nop                                              ; $652d: $00
	nop                                              ; $652e: $00
	nop                                              ; $652f: $00
	nop                                              ; $6530: $00
	nop                                              ; $6531: $00
	nop                                              ; $6532: $00
	nop                                              ; $6533: $00
	nop                                              ; $6534: $00
	nop                                              ; $6535: $00
	nop                                              ; $6536: $00
	nop                                              ; $6537: $00
	nop                                              ; $6538: $00
	nop                                              ; $6539: $00
	nop                                              ; $653a: $00
	nop                                              ; $653b: $00
	nop                                              ; $653c: $00
	nop                                              ; $653d: $00
	nop                                              ; $653e: $00
	nop                                              ; $653f: $00
	nop                                              ; $6540: $00
	nop                                              ; $6541: $00
	nop                                              ; $6542: $00
	nop                                              ; $6543: $00
	nop                                              ; $6544: $00
	nop                                              ; $6545: $00
	nop                                              ; $6546: $00
	nop                                              ; $6547: $00
	nop                                              ; $6548: $00
	nop                                              ; $6549: $00
	nop                                              ; $654a: $00
	nop                                              ; $654b: $00
	nop                                              ; $654c: $00
	nop                                              ; $654d: $00
	nop                                              ; $654e: $00
	nop                                              ; $654f: $00
	nop                                              ; $6550: $00
	nop                                              ; $6551: $00
	nop                                              ; $6552: $00
	nop                                              ; $6553: $00
	nop                                              ; $6554: $00
	nop                                              ; $6555: $00
	nop                                              ; $6556: $00
	nop                                              ; $6557: $00
	nop                                              ; $6558: $00
	nop                                              ; $6559: $00
	nop                                              ; $655a: $00
	nop                                              ; $655b: $00
	nop                                              ; $655c: $00
	nop                                              ; $655d: $00
	nop                                              ; $655e: $00
	nop                                              ; $655f: $00
	nop                                              ; $6560: $00
	nop                                              ; $6561: $00
	nop                                              ; $6562: $00
	nop                                              ; $6563: $00
	nop                                              ; $6564: $00
	nop                                              ; $6565: $00
	nop                                              ; $6566: $00
	nop                                              ; $6567: $00
	nop                                              ; $6568: $00
	nop                                              ; $6569: $00
	nop                                              ; $656a: $00
	nop                                              ; $656b: $00
	nop                                              ; $656c: $00
	nop                                              ; $656d: $00
	nop                                              ; $656e: $00
	nop                                              ; $656f: $00
	nop                                              ; $6570: $00
	nop                                              ; $6571: $00
	nop                                              ; $6572: $00
	nop                                              ; $6573: $00
	nop                                              ; $6574: $00
	nop                                              ; $6575: $00
	nop                                              ; $6576: $00
	nop                                              ; $6577: $00
	nop                                              ; $6578: $00
	nop                                              ; $6579: $00
	nop                                              ; $657a: $00
	nop                                              ; $657b: $00
	nop                                              ; $657c: $00
	nop                                              ; $657d: $00
	nop                                              ; $657e: $00
	nop                                              ; $657f: $00
	nop                                              ; $6580: $00
	nop                                              ; $6581: $00
	nop                                              ; $6582: $00
	nop                                              ; $6583: $00
	nop                                              ; $6584: $00
	nop                                              ; $6585: $00
	nop                                              ; $6586: $00
	nop                                              ; $6587: $00
	nop                                              ; $6588: $00
	nop                                              ; $6589: $00
	nop                                              ; $658a: $00
	nop                                              ; $658b: $00
	nop                                              ; $658c: $00
	nop                                              ; $658d: $00
	nop                                              ; $658e: $00
	nop                                              ; $658f: $00
	nop                                              ; $6590: $00
	nop                                              ; $6591: $00
	nop                                              ; $6592: $00
	nop                                              ; $6593: $00
	nop                                              ; $6594: $00
	nop                                              ; $6595: $00
	nop                                              ; $6596: $00
	nop                                              ; $6597: $00
	nop                                              ; $6598: $00
	nop                                              ; $6599: $00
	nop                                              ; $659a: $00
	nop                                              ; $659b: $00
	nop                                              ; $659c: $00
	nop                                              ; $659d: $00
	nop                                              ; $659e: $00
	nop                                              ; $659f: $00
	nop                                              ; $65a0: $00
	nop                                              ; $65a1: $00
	nop                                              ; $65a2: $00
	nop                                              ; $65a3: $00
	nop                                              ; $65a4: $00
	nop                                              ; $65a5: $00
	nop                                              ; $65a6: $00
	nop                                              ; $65a7: $00
	nop                                              ; $65a8: $00
	nop                                              ; $65a9: $00
	nop                                              ; $65aa: $00
	nop                                              ; $65ab: $00
	nop                                              ; $65ac: $00
	nop                                              ; $65ad: $00
	nop                                              ; $65ae: $00
	nop                                              ; $65af: $00
	nop                                              ; $65b0: $00
	nop                                              ; $65b1: $00
	nop                                              ; $65b2: $00
	nop                                              ; $65b3: $00
	nop                                              ; $65b4: $00
	nop                                              ; $65b5: $00
	nop                                              ; $65b6: $00
	nop                                              ; $65b7: $00
	nop                                              ; $65b8: $00
	nop                                              ; $65b9: $00
	nop                                              ; $65ba: $00
	nop                                              ; $65bb: $00
	nop                                              ; $65bc: $00
	nop                                              ; $65bd: $00
	nop                                              ; $65be: $00
	nop                                              ; $65bf: $00
	nop                                              ; $65c0: $00
	nop                                              ; $65c1: $00
	nop                                              ; $65c2: $00
	nop                                              ; $65c3: $00
	nop                                              ; $65c4: $00
	nop                                              ; $65c5: $00
	nop                                              ; $65c6: $00
	nop                                              ; $65c7: $00
	nop                                              ; $65c8: $00
	nop                                              ; $65c9: $00
	nop                                              ; $65ca: $00
	nop                                              ; $65cb: $00
	nop                                              ; $65cc: $00
	nop                                              ; $65cd: $00
	nop                                              ; $65ce: $00
	nop                                              ; $65cf: $00
	nop                                              ; $65d0: $00
	nop                                              ; $65d1: $00
	nop                                              ; $65d2: $00
	nop                                              ; $65d3: $00
	nop                                              ; $65d4: $00
	nop                                              ; $65d5: $00
	nop                                              ; $65d6: $00
	nop                                              ; $65d7: $00
	nop                                              ; $65d8: $00
	nop                                              ; $65d9: $00
	nop                                              ; $65da: $00
	nop                                              ; $65db: $00
	nop                                              ; $65dc: $00
	nop                                              ; $65dd: $00
	nop                                              ; $65de: $00
	nop                                              ; $65df: $00
	nop                                              ; $65e0: $00
	nop                                              ; $65e1: $00
	nop                                              ; $65e2: $00
	nop                                              ; $65e3: $00
	nop                                              ; $65e4: $00
	nop                                              ; $65e5: $00
	nop                                              ; $65e6: $00
	nop                                              ; $65e7: $00
	nop                                              ; $65e8: $00
	nop                                              ; $65e9: $00
	nop                                              ; $65ea: $00
	nop                                              ; $65eb: $00
	nop                                              ; $65ec: $00
	nop                                              ; $65ed: $00
	nop                                              ; $65ee: $00
	nop                                              ; $65ef: $00
	nop                                              ; $65f0: $00
	nop                                              ; $65f1: $00
	nop                                              ; $65f2: $00
	nop                                              ; $65f3: $00
	nop                                              ; $65f4: $00
	nop                                              ; $65f5: $00
	nop                                              ; $65f6: $00
	nop                                              ; $65f7: $00
	nop                                              ; $65f8: $00
	nop                                              ; $65f9: $00
	nop                                              ; $65fa: $00
	nop                                              ; $65fb: $00
	nop                                              ; $65fc: $00
	nop                                              ; $65fd: $00
	nop                                              ; $65fe: $00
	nop                                              ; $65ff: $00
	nop                                              ; $6600: $00
	nop                                              ; $6601: $00
	nop                                              ; $6602: $00
	nop                                              ; $6603: $00
	nop                                              ; $6604: $00
	nop                                              ; $6605: $00
	nop                                              ; $6606: $00
	nop                                              ; $6607: $00
	nop                                              ; $6608: $00
	nop                                              ; $6609: $00
	nop                                              ; $660a: $00
	nop                                              ; $660b: $00
	nop                                              ; $660c: $00
	nop                                              ; $660d: $00
	nop                                              ; $660e: $00
	nop                                              ; $660f: $00
	nop                                              ; $6610: $00
	nop                                              ; $6611: $00
	nop                                              ; $6612: $00
	nop                                              ; $6613: $00
	nop                                              ; $6614: $00
	nop                                              ; $6615: $00
	nop                                              ; $6616: $00
	nop                                              ; $6617: $00
	nop                                              ; $6618: $00
	nop                                              ; $6619: $00
	nop                                              ; $661a: $00
	nop                                              ; $661b: $00
	nop                                              ; $661c: $00
	nop                                              ; $661d: $00
	nop                                              ; $661e: $00
	nop                                              ; $661f: $00
	nop                                              ; $6620: $00
	nop                                              ; $6621: $00
	nop                                              ; $6622: $00
	nop                                              ; $6623: $00
	nop                                              ; $6624: $00
	nop                                              ; $6625: $00
	nop                                              ; $6626: $00
	nop                                              ; $6627: $00
	nop                                              ; $6628: $00
	nop                                              ; $6629: $00
	nop                                              ; $662a: $00
	nop                                              ; $662b: $00
	nop                                              ; $662c: $00
	nop                                              ; $662d: $00
	nop                                              ; $662e: $00
	nop                                              ; $662f: $00
	nop                                              ; $6630: $00
	nop                                              ; $6631: $00
	nop                                              ; $6632: $00
	nop                                              ; $6633: $00
	nop                                              ; $6634: $00
	nop                                              ; $6635: $00
	nop                                              ; $6636: $00
	nop                                              ; $6637: $00
	nop                                              ; $6638: $00
	nop                                              ; $6639: $00
	nop                                              ; $663a: $00
	nop                                              ; $663b: $00
	nop                                              ; $663c: $00
	nop                                              ; $663d: $00
	nop                                              ; $663e: $00
	nop                                              ; $663f: $00
	nop                                              ; $6640: $00
	nop                                              ; $6641: $00
	nop                                              ; $6642: $00
	nop                                              ; $6643: $00
	nop                                              ; $6644: $00
	nop                                              ; $6645: $00
	nop                                              ; $6646: $00
	nop                                              ; $6647: $00
	nop                                              ; $6648: $00
	nop                                              ; $6649: $00
	nop                                              ; $664a: $00
	nop                                              ; $664b: $00
	nop                                              ; $664c: $00
	nop                                              ; $664d: $00
	nop                                              ; $664e: $00
	nop                                              ; $664f: $00
	nop                                              ; $6650: $00
	nop                                              ; $6651: $00
	nop                                              ; $6652: $00
	nop                                              ; $6653: $00
	nop                                              ; $6654: $00
	nop                                              ; $6655: $00
	nop                                              ; $6656: $00
	nop                                              ; $6657: $00
	nop                                              ; $6658: $00
	nop                                              ; $6659: $00
	nop                                              ; $665a: $00
	nop                                              ; $665b: $00
	nop                                              ; $665c: $00
	nop                                              ; $665d: $00
	nop                                              ; $665e: $00
	nop                                              ; $665f: $00
	nop                                              ; $6660: $00
	nop                                              ; $6661: $00
	nop                                              ; $6662: $00
	nop                                              ; $6663: $00
	nop                                              ; $6664: $00
	nop                                              ; $6665: $00
	nop                                              ; $6666: $00
	nop                                              ; $6667: $00
	nop                                              ; $6668: $00
	nop                                              ; $6669: $00
	nop                                              ; $666a: $00
	nop                                              ; $666b: $00
	nop                                              ; $666c: $00
	nop                                              ; $666d: $00
	nop                                              ; $666e: $00
	nop                                              ; $666f: $00
	nop                                              ; $6670: $00
	nop                                              ; $6671: $00
	nop                                              ; $6672: $00
	nop                                              ; $6673: $00
	nop                                              ; $6674: $00
	nop                                              ; $6675: $00
	nop                                              ; $6676: $00
	nop                                              ; $6677: $00
	nop                                              ; $6678: $00
	nop                                              ; $6679: $00
	nop                                              ; $667a: $00
	nop                                              ; $667b: $00
	nop                                              ; $667c: $00
	nop                                              ; $667d: $00
	nop                                              ; $667e: $00
	nop                                              ; $667f: $00
	nop                                              ; $6680: $00
	nop                                              ; $6681: $00
	nop                                              ; $6682: $00
	nop                                              ; $6683: $00
	nop                                              ; $6684: $00
	nop                                              ; $6685: $00
	nop                                              ; $6686: $00
	nop                                              ; $6687: $00
	nop                                              ; $6688: $00
	nop                                              ; $6689: $00
	nop                                              ; $668a: $00
	nop                                              ; $668b: $00
	nop                                              ; $668c: $00
	nop                                              ; $668d: $00
	nop                                              ; $668e: $00
	nop                                              ; $668f: $00
	nop                                              ; $6690: $00
	nop                                              ; $6691: $00
	nop                                              ; $6692: $00
	nop                                              ; $6693: $00
	nop                                              ; $6694: $00
	nop                                              ; $6695: $00
	nop                                              ; $6696: $00
	nop                                              ; $6697: $00
	nop                                              ; $6698: $00
	nop                                              ; $6699: $00
	nop                                              ; $669a: $00
	nop                                              ; $669b: $00
	nop                                              ; $669c: $00
	nop                                              ; $669d: $00
	nop                                              ; $669e: $00
	nop                                              ; $669f: $00
	nop                                              ; $66a0: $00
	nop                                              ; $66a1: $00
	nop                                              ; $66a2: $00
	nop                                              ; $66a3: $00
	nop                                              ; $66a4: $00
	nop                                              ; $66a5: $00
	nop                                              ; $66a6: $00
	nop                                              ; $66a7: $00
	nop                                              ; $66a8: $00
	nop                                              ; $66a9: $00
	nop                                              ; $66aa: $00
	nop                                              ; $66ab: $00
	nop                                              ; $66ac: $00
	nop                                              ; $66ad: $00
	nop                                              ; $66ae: $00
	nop                                              ; $66af: $00
	nop                                              ; $66b0: $00
	nop                                              ; $66b1: $00
	nop                                              ; $66b2: $00
	nop                                              ; $66b3: $00
	nop                                              ; $66b4: $00
	nop                                              ; $66b5: $00
	nop                                              ; $66b6: $00
	nop                                              ; $66b7: $00
	nop                                              ; $66b8: $00
	nop                                              ; $66b9: $00
	nop                                              ; $66ba: $00
	nop                                              ; $66bb: $00
	nop                                              ; $66bc: $00
	nop                                              ; $66bd: $00
	nop                                              ; $66be: $00
	nop                                              ; $66bf: $00
	nop                                              ; $66c0: $00
	nop                                              ; $66c1: $00
	nop                                              ; $66c2: $00
	nop                                              ; $66c3: $00
	nop                                              ; $66c4: $00
	nop                                              ; $66c5: $00
	nop                                              ; $66c6: $00
	nop                                              ; $66c7: $00
	nop                                              ; $66c8: $00
	nop                                              ; $66c9: $00
	nop                                              ; $66ca: $00
	nop                                              ; $66cb: $00
	nop                                              ; $66cc: $00
	nop                                              ; $66cd: $00
	nop                                              ; $66ce: $00
	nop                                              ; $66cf: $00
	nop                                              ; $66d0: $00
	nop                                              ; $66d1: $00
	nop                                              ; $66d2: $00
	nop                                              ; $66d3: $00
	nop                                              ; $66d4: $00
	nop                                              ; $66d5: $00
	nop                                              ; $66d6: $00
	nop                                              ; $66d7: $00
	nop                                              ; $66d8: $00
	nop                                              ; $66d9: $00
	nop                                              ; $66da: $00
	nop                                              ; $66db: $00
	nop                                              ; $66dc: $00
	nop                                              ; $66dd: $00
	nop                                              ; $66de: $00
	nop                                              ; $66df: $00
	nop                                              ; $66e0: $00
	nop                                              ; $66e1: $00
	nop                                              ; $66e2: $00
	nop                                              ; $66e3: $00
	nop                                              ; $66e4: $00
	nop                                              ; $66e5: $00
	nop                                              ; $66e6: $00
	nop                                              ; $66e7: $00
	nop                                              ; $66e8: $00
	nop                                              ; $66e9: $00
	nop                                              ; $66ea: $00
	nop                                              ; $66eb: $00
	nop                                              ; $66ec: $00
	nop                                              ; $66ed: $00
	nop                                              ; $66ee: $00
	nop                                              ; $66ef: $00
	nop                                              ; $66f0: $00
	nop                                              ; $66f1: $00
	nop                                              ; $66f2: $00
	nop                                              ; $66f3: $00
	nop                                              ; $66f4: $00
	nop                                              ; $66f5: $00
	nop                                              ; $66f6: $00
	nop                                              ; $66f7: $00
	nop                                              ; $66f8: $00
	nop                                              ; $66f9: $00
	nop                                              ; $66fa: $00
	nop                                              ; $66fb: $00
	nop                                              ; $66fc: $00
	nop                                              ; $66fd: $00
	nop                                              ; $66fe: $00
	nop                                              ; $66ff: $00
	nop                                              ; $6700: $00
	nop                                              ; $6701: $00
	nop                                              ; $6702: $00
	nop                                              ; $6703: $00
	nop                                              ; $6704: $00
	nop                                              ; $6705: $00
	nop                                              ; $6706: $00
	nop                                              ; $6707: $00
	nop                                              ; $6708: $00
	nop                                              ; $6709: $00
	nop                                              ; $670a: $00
	nop                                              ; $670b: $00
	nop                                              ; $670c: $00
	nop                                              ; $670d: $00
	nop                                              ; $670e: $00
	nop                                              ; $670f: $00
	nop                                              ; $6710: $00
	nop                                              ; $6711: $00
	nop                                              ; $6712: $00
	nop                                              ; $6713: $00
	nop                                              ; $6714: $00
	nop                                              ; $6715: $00
	nop                                              ; $6716: $00
	nop                                              ; $6717: $00
	nop                                              ; $6718: $00
	nop                                              ; $6719: $00
	nop                                              ; $671a: $00
	nop                                              ; $671b: $00
	nop                                              ; $671c: $00
	nop                                              ; $671d: $00
	nop                                              ; $671e: $00
	nop                                              ; $671f: $00
	nop                                              ; $6720: $00
	nop                                              ; $6721: $00
	nop                                              ; $6722: $00
	nop                                              ; $6723: $00
	nop                                              ; $6724: $00
	nop                                              ; $6725: $00
	nop                                              ; $6726: $00
	nop                                              ; $6727: $00
	nop                                              ; $6728: $00
	nop                                              ; $6729: $00
	nop                                              ; $672a: $00
	nop                                              ; $672b: $00
	nop                                              ; $672c: $00
	nop                                              ; $672d: $00
	nop                                              ; $672e: $00
	nop                                              ; $672f: $00
	nop                                              ; $6730: $00
	nop                                              ; $6731: $00
	nop                                              ; $6732: $00
	nop                                              ; $6733: $00
	nop                                              ; $6734: $00
	nop                                              ; $6735: $00
	nop                                              ; $6736: $00
	nop                                              ; $6737: $00
	nop                                              ; $6738: $00
	nop                                              ; $6739: $00
	nop                                              ; $673a: $00
	nop                                              ; $673b: $00
	nop                                              ; $673c: $00
	nop                                              ; $673d: $00
	nop                                              ; $673e: $00
	nop                                              ; $673f: $00
	nop                                              ; $6740: $00
	nop                                              ; $6741: $00
	nop                                              ; $6742: $00
	nop                                              ; $6743: $00
	nop                                              ; $6744: $00
	nop                                              ; $6745: $00
	nop                                              ; $6746: $00
	nop                                              ; $6747: $00
	nop                                              ; $6748: $00
	nop                                              ; $6749: $00
	nop                                              ; $674a: $00
	nop                                              ; $674b: $00
	nop                                              ; $674c: $00
	nop                                              ; $674d: $00
	nop                                              ; $674e: $00
	nop                                              ; $674f: $00
	nop                                              ; $6750: $00
	nop                                              ; $6751: $00
	nop                                              ; $6752: $00
	nop                                              ; $6753: $00
	nop                                              ; $6754: $00
	nop                                              ; $6755: $00
	nop                                              ; $6756: $00
	nop                                              ; $6757: $00
	nop                                              ; $6758: $00
	nop                                              ; $6759: $00
	nop                                              ; $675a: $00
	nop                                              ; $675b: $00
	nop                                              ; $675c: $00
	nop                                              ; $675d: $00
	nop                                              ; $675e: $00
	nop                                              ; $675f: $00
	nop                                              ; $6760: $00
	nop                                              ; $6761: $00
	nop                                              ; $6762: $00
	nop                                              ; $6763: $00
	nop                                              ; $6764: $00
	nop                                              ; $6765: $00
	nop                                              ; $6766: $00
	nop                                              ; $6767: $00
	nop                                              ; $6768: $00
	nop                                              ; $6769: $00
	nop                                              ; $676a: $00
	nop                                              ; $676b: $00
	nop                                              ; $676c: $00
	nop                                              ; $676d: $00
	nop                                              ; $676e: $00
	nop                                              ; $676f: $00
	nop                                              ; $6770: $00
	nop                                              ; $6771: $00
	nop                                              ; $6772: $00
	nop                                              ; $6773: $00
	nop                                              ; $6774: $00
	nop                                              ; $6775: $00
	nop                                              ; $6776: $00
	nop                                              ; $6777: $00
	nop                                              ; $6778: $00
	nop                                              ; $6779: $00
	nop                                              ; $677a: $00
	nop                                              ; $677b: $00
	nop                                              ; $677c: $00
	nop                                              ; $677d: $00
	nop                                              ; $677e: $00
	nop                                              ; $677f: $00
	nop                                              ; $6780: $00
	nop                                              ; $6781: $00
	nop                                              ; $6782: $00
	nop                                              ; $6783: $00
	nop                                              ; $6784: $00
	nop                                              ; $6785: $00
	nop                                              ; $6786: $00
	nop                                              ; $6787: $00
	nop                                              ; $6788: $00
	nop                                              ; $6789: $00
	nop                                              ; $678a: $00
	nop                                              ; $678b: $00
	nop                                              ; $678c: $00
	nop                                              ; $678d: $00
	nop                                              ; $678e: $00
	nop                                              ; $678f: $00
	nop                                              ; $6790: $00
	nop                                              ; $6791: $00
	nop                                              ; $6792: $00
	nop                                              ; $6793: $00
	nop                                              ; $6794: $00
	nop                                              ; $6795: $00
	nop                                              ; $6796: $00
	nop                                              ; $6797: $00
	nop                                              ; $6798: $00
	nop                                              ; $6799: $00
	nop                                              ; $679a: $00
	nop                                              ; $679b: $00
	nop                                              ; $679c: $00
	nop                                              ; $679d: $00
	nop                                              ; $679e: $00
	nop                                              ; $679f: $00
	nop                                              ; $67a0: $00
	nop                                              ; $67a1: $00
	nop                                              ; $67a2: $00
	nop                                              ; $67a3: $00
	nop                                              ; $67a4: $00
	nop                                              ; $67a5: $00
	nop                                              ; $67a6: $00
	nop                                              ; $67a7: $00
	nop                                              ; $67a8: $00
	nop                                              ; $67a9: $00
	nop                                              ; $67aa: $00
	nop                                              ; $67ab: $00
	nop                                              ; $67ac: $00
	nop                                              ; $67ad: $00
	nop                                              ; $67ae: $00
	nop                                              ; $67af: $00
	nop                                              ; $67b0: $00
	nop                                              ; $67b1: $00
	nop                                              ; $67b2: $00
	nop                                              ; $67b3: $00
	nop                                              ; $67b4: $00
	nop                                              ; $67b5: $00
	nop                                              ; $67b6: $00
	nop                                              ; $67b7: $00
	nop                                              ; $67b8: $00
	nop                                              ; $67b9: $00
	nop                                              ; $67ba: $00
	nop                                              ; $67bb: $00
	nop                                              ; $67bc: $00
	nop                                              ; $67bd: $00
	nop                                              ; $67be: $00
	nop                                              ; $67bf: $00
	nop                                              ; $67c0: $00
	nop                                              ; $67c1: $00
	nop                                              ; $67c2: $00
	nop                                              ; $67c3: $00
	nop                                              ; $67c4: $00
	nop                                              ; $67c5: $00
	nop                                              ; $67c6: $00
	nop                                              ; $67c7: $00
	nop                                              ; $67c8: $00
	nop                                              ; $67c9: $00
	nop                                              ; $67ca: $00
	nop                                              ; $67cb: $00
	nop                                              ; $67cc: $00
	nop                                              ; $67cd: $00
	nop                                              ; $67ce: $00
	nop                                              ; $67cf: $00
	nop                                              ; $67d0: $00
	nop                                              ; $67d1: $00
	nop                                              ; $67d2: $00
	nop                                              ; $67d3: $00
	nop                                              ; $67d4: $00
	nop                                              ; $67d5: $00
	nop                                              ; $67d6: $00
	nop                                              ; $67d7: $00
	nop                                              ; $67d8: $00
	nop                                              ; $67d9: $00
	nop                                              ; $67da: $00
	nop                                              ; $67db: $00
	nop                                              ; $67dc: $00
	nop                                              ; $67dd: $00
	nop                                              ; $67de: $00
	nop                                              ; $67df: $00
	nop                                              ; $67e0: $00
	nop                                              ; $67e1: $00
	nop                                              ; $67e2: $00
	nop                                              ; $67e3: $00
	nop                                              ; $67e4: $00
	nop                                              ; $67e5: $00
	nop                                              ; $67e6: $00
	nop                                              ; $67e7: $00
	nop                                              ; $67e8: $00
	nop                                              ; $67e9: $00
	nop                                              ; $67ea: $00
	nop                                              ; $67eb: $00
	nop                                              ; $67ec: $00
	nop                                              ; $67ed: $00
	nop                                              ; $67ee: $00
	nop                                              ; $67ef: $00
	nop                                              ; $67f0: $00
	nop                                              ; $67f1: $00
	nop                                              ; $67f2: $00
	nop                                              ; $67f3: $00
	nop                                              ; $67f4: $00
	nop                                              ; $67f5: $00
	nop                                              ; $67f6: $00
	nop                                              ; $67f7: $00
	nop                                              ; $67f8: $00
	nop                                              ; $67f9: $00
	nop                                              ; $67fa: $00
	nop                                              ; $67fb: $00
	nop                                              ; $67fc: $00
	nop                                              ; $67fd: $00
	nop                                              ; $67fe: $00
	nop                                              ; $67ff: $00
	nop                                              ; $6800: $00
	nop                                              ; $6801: $00
	nop                                              ; $6802: $00
	nop                                              ; $6803: $00
	nop                                              ; $6804: $00
	nop                                              ; $6805: $00
	nop                                              ; $6806: $00
	nop                                              ; $6807: $00
	nop                                              ; $6808: $00
	nop                                              ; $6809: $00
	nop                                              ; $680a: $00
	nop                                              ; $680b: $00
	nop                                              ; $680c: $00
	nop                                              ; $680d: $00
	nop                                              ; $680e: $00
	nop                                              ; $680f: $00
	cp   c                                           ; $6810: $b9
	rst  JumpTableTrashDE                                         ; $6811: $c7
	cp   c                                           ; $6812: $b9
	rst  JumpTableTrashDE                                         ; $6813: $c7
	cp   c                                           ; $6814: $b9
	rst  JumpTableTrashDE                                         ; $6815: $c7
	cp   c                                           ; $6816: $b9
	rst  JumpTableTrashDE                                         ; $6817: $c7
	cp   c                                           ; $6818: $b9
	rst  JumpTableTrashDE                                         ; $6819: $c7
	cp   c                                           ; $681a: $b9
	rst  JumpTableTrashDE                                         ; $681b: $c7
	cp   c                                           ; $681c: $b9
	rst  JumpTableTrashDE                                         ; $681d: $c7
	cp   c                                           ; $681e: $b9
	rst  JumpTableTrashDE                                         ; $681f: $c7
	cp   l                                           ; $6820: $bd
	rst  $38                                         ; $6821: $ff
	cp   l                                           ; $6822: $bd
	rst  $38                                         ; $6823: $ff
	cp   l                                           ; $6824: $bd
	rst  $38                                         ; $6825: $ff
	cp   l                                           ; $6826: $bd
	rst  $38                                         ; $6827: $ff
	cp   l                                           ; $6828: $bd
	rst  $38                                         ; $6829: $ff
	cp   l                                           ; $682a: $bd
	rst  $38                                         ; $682b: $ff
	cp   l                                           ; $682c: $bd
	rst  $38                                         ; $682d: $ff
	cp   l                                           ; $682e: $bd
	rst  $38                                         ; $682f: $ff
	rst  $38                                         ; $6830: $ff
	rst  $38                                         ; $6831: $ff
	rst  $38                                         ; $6832: $ff
	rst  $38                                         ; $6833: $ff
	rst  $38                                         ; $6834: $ff
	rst  $38                                         ; $6835: $ff
	rst  $38                                         ; $6836: $ff
	rst  $38                                         ; $6837: $ff
	rst  $38                                         ; $6838: $ff
	rst  $38                                         ; $6839: $ff
	rst  $38                                         ; $683a: $ff
	rst  $38                                         ; $683b: $ff
	rst  $38                                         ; $683c: $ff
	rst  $38                                         ; $683d: $ff
	rst  $38                                         ; $683e: $ff
	rst  $38                                         ; $683f: $ff
	ccf                                              ; $6840: $3f
	rst  $38                                         ; $6841: $ff
	ccf                                              ; $6842: $3f
	rst  $38                                         ; $6843: $ff
	ccf                                              ; $6844: $3f
	rst  $38                                         ; $6845: $ff
	ccf                                              ; $6846: $3f
	rst  $38                                         ; $6847: $ff
	ccf                                              ; $6848: $3f
	rst  $38                                         ; $6849: $ff
	jr   c, @+$01                                    ; $684a: $38 $ff

	dec  sp                                          ; $684c: $3b
	db   $fc                                         ; $684d: $fc
	dec  sp                                          ; $684e: $3b
	db   $fd                                         ; $684f: $fd
	rst  $38                                         ; $6850: $ff
	rst  $38                                         ; $6851: $ff
	rst  $38                                         ; $6852: $ff
	rst  $38                                         ; $6853: $ff
	rst  $38                                         ; $6854: $ff
	rst  $38                                         ; $6855: $ff
	rst  $38                                         ; $6856: $ff
	rst  $38                                         ; $6857: $ff
	rst  $38                                         ; $6858: $ff
	rst  $38                                         ; $6859: $ff
	nop                                              ; $685a: $00
	rst  $38                                         ; $685b: $ff
	rst  $38                                         ; $685c: $ff
	nop                                              ; $685d: $00
	rst  $38                                         ; $685e: $ff
	rst  $38                                         ; $685f: $ff
	dec  sp                                          ; $6860: $3b
	db   $fd                                         ; $6861: $fd
	dec  sp                                          ; $6862: $3b
	db   $fd                                         ; $6863: $fd
	dec  sp                                          ; $6864: $3b
	db   $fd                                         ; $6865: $fd
	dec  sp                                          ; $6866: $3b
	db   $fd                                         ; $6867: $fd
	dec  sp                                          ; $6868: $3b
	db   $fd                                         ; $6869: $fd
	dec  sp                                          ; $686a: $3b
	db   $fd                                         ; $686b: $fd
	dec  sp                                          ; $686c: $3b
	db   $fd                                         ; $686d: $fd
	dec  sp                                          ; $686e: $3b
	db   $fd                                         ; $686f: $fd
	dec  sp                                          ; $6870: $3b
	db   $fd                                         ; $6871: $fd
	dec  sp                                          ; $6872: $3b
	db   $fc                                         ; $6873: $fc
	jr   c, @+$01                                    ; $6874: $38 $ff

	ccf                                              ; $6876: $3f
	rst  $38                                         ; $6877: $ff
	ccf                                              ; $6878: $3f
	rst  $38                                         ; $6879: $ff
	jr   c, @+$01                                    ; $687a: $38 $ff

	dec  sp                                          ; $687c: $3b
	db   $fc                                         ; $687d: $fc
	dec  sp                                          ; $687e: $3b
	db   $fd                                         ; $687f: $fd
	rst  $38                                         ; $6880: $ff
	rst  $38                                         ; $6881: $ff
	rst  $38                                         ; $6882: $ff
	nop                                              ; $6883: $00
	nop                                              ; $6884: $00
	rst  $38                                         ; $6885: $ff
	rst  $38                                         ; $6886: $ff
	rst  $38                                         ; $6887: $ff
	rst  $38                                         ; $6888: $ff
	rst  $38                                         ; $6889: $ff
	nop                                              ; $688a: $00
	rst  $38                                         ; $688b: $ff
	rst  $38                                         ; $688c: $ff
	nop                                              ; $688d: $00
	rst  $38                                         ; $688e: $ff
	rst  $38                                         ; $688f: $ff
	ccf                                              ; $6890: $3f
	rst  $38                                         ; $6891: $ff
	ccf                                              ; $6892: $3f
	rst  $38                                         ; $6893: $ff
	ccf                                              ; $6894: $3f
	rst  $38                                         ; $6895: $ff
	ccf                                              ; $6896: $3f
	rst  $38                                         ; $6897: $ff
	ccf                                              ; $6898: $3f
	rst  $38                                         ; $6899: $ff
	ccf                                              ; $689a: $3f
	rst  $38                                         ; $689b: $ff
	ccf                                              ; $689c: $3f
	rst  $38                                         ; $689d: $ff
	ccf                                              ; $689e: $3f
	rst  $38                                         ; $689f: $ff
	rst  $38                                         ; $68a0: $ff
	rst  $38                                         ; $68a1: $ff
	rst  $38                                         ; $68a2: $ff
	rst  $38                                         ; $68a3: $ff
	rst  $38                                         ; $68a4: $ff
	rst  $38                                         ; $68a5: $ff
	rst  $38                                         ; $68a6: $ff
	rst  $38                                         ; $68a7: $ff
	rst  $38                                         ; $68a8: $ff
	rst  $38                                         ; $68a9: $ff
	ld   hl, sp-$01                                  ; $68aa: $f8 $ff
	ei                                               ; $68ac: $fb
	db   $fc                                         ; $68ad: $fc
	ei                                               ; $68ae: $fb
	db   $fd                                         ; $68af: $fd
	ei                                               ; $68b0: $fb
	db   $fd                                         ; $68b1: $fd
	ei                                               ; $68b2: $fb
	db   $fd                                         ; $68b3: $fd
	ei                                               ; $68b4: $fb
	db   $fd                                         ; $68b5: $fd
	ei                                               ; $68b6: $fb
	db   $fd                                         ; $68b7: $fd
	ei                                               ; $68b8: $fb
	db   $fd                                         ; $68b9: $fd
	ei                                               ; $68ba: $fb
	db   $fd                                         ; $68bb: $fd
	ei                                               ; $68bc: $fb
	db   $fd                                         ; $68bd: $fd
	ei                                               ; $68be: $fb
	db   $fd                                         ; $68bf: $fd
	ei                                               ; $68c0: $fb
	db   $fd                                         ; $68c1: $fd
	ei                                               ; $68c2: $fb
	db   $fc                                         ; $68c3: $fc
	ld   hl, sp-$01                                  ; $68c4: $f8 $ff
	rst  $38                                         ; $68c6: $ff
	rst  $38                                         ; $68c7: $ff
	rst  $38                                         ; $68c8: $ff
	rst  $38                                         ; $68c9: $ff
	ld   hl, sp-$01                                  ; $68ca: $f8 $ff
	ei                                               ; $68cc: $fb
	db   $fc                                         ; $68cd: $fc
	ei                                               ; $68ce: $fb
	db   $fd                                         ; $68cf: $fd
	jp   $99ff                                       ; $68d0: $c3 $ff $99


	rst  $38                                         ; $68d3: $ff
	ld   a, [hl]                                     ; $68d4: $7e
	cp   l                                           ; $68d5: $bd
	ld   a, [hl]                                     ; $68d6: $7e
	cp   l                                           ; $68d7: $bd
	ld   e, d                                        ; $68d8: $5a
	cp   l                                           ; $68d9: $bd
	ld   h, [hl]                                     ; $68da: $66
	sbc  c                                           ; $68db: $99
	ld   e, d                                        ; $68dc: $5a
	cp   l                                           ; $68dd: $bd
	ld   a, [hl]                                     ; $68de: $7e
	cp   l                                           ; $68df: $bd
	nop                                              ; $68e0: $00
	rst  $38                                         ; $68e1: $ff
	rst  $38                                         ; $68e2: $ff
	nop                                              ; $68e3: $00
	nop                                              ; $68e4: $00
	nop                                              ; $68e5: $00
	nop                                              ; $68e6: $00
	nop                                              ; $68e7: $00
	nop                                              ; $68e8: $00
	nop                                              ; $68e9: $00
	nop                                              ; $68ea: $00
	nop                                              ; $68eb: $00
	nop                                              ; $68ec: $00
	nop                                              ; $68ed: $00
	nop                                              ; $68ee: $00
	nop                                              ; $68ef: $00
	nop                                              ; $68f0: $00
	nop                                              ; $68f1: $00
	nop                                              ; $68f2: $00
	nop                                              ; $68f3: $00
	nop                                              ; $68f4: $00
	nop                                              ; $68f5: $00
	nop                                              ; $68f6: $00
	nop                                              ; $68f7: $00
	nop                                              ; $68f8: $00
	nop                                              ; $68f9: $00
	nop                                              ; $68fa: $00
	nop                                              ; $68fb: $00
	nop                                              ; $68fc: $00
	nop                                              ; $68fd: $00
	nop                                              ; $68fe: $00
	nop                                              ; $68ff: $00
	nop                                              ; $6900: $00
	nop                                              ; $6901: $00
	nop                                              ; $6902: $00
	nop                                              ; $6903: $00
	nop                                              ; $6904: $00
	nop                                              ; $6905: $00
	nop                                              ; $6906: $00
	nop                                              ; $6907: $00
	nop                                              ; $6908: $00
	nop                                              ; $6909: $00
	nop                                              ; $690a: $00
	nop                                              ; $690b: $00
	nop                                              ; $690c: $00
	nop                                              ; $690d: $00
	nop                                              ; $690e: $00
	nop                                              ; $690f: $00
	nop                                              ; $6910: $00
	nop                                              ; $6911: $00
	nop                                              ; $6912: $00
	nop                                              ; $6913: $00
	nop                                              ; $6914: $00
	nop                                              ; $6915: $00
	nop                                              ; $6916: $00
	nop                                              ; $6917: $00
	nop                                              ; $6918: $00
	nop                                              ; $6919: $00
	nop                                              ; $691a: $00
	nop                                              ; $691b: $00
	rst  $38                                         ; $691c: $ff
	nop                                              ; $691d: $00
	nop                                              ; $691e: $00
	rst  $38                                         ; $691f: $ff
	ld   [bc], a                                     ; $6920: $02
	ld   bc, $0102                                   ; $6921: $01 $02 $01
	ld   [bc], a                                     ; $6924: $02
	ld   bc, $0102                                   ; $6925: $01 $02 $01
	ld   [bc], a                                     ; $6928: $02
	ld   bc, $0102                                   ; $6929: $01 $02 $01
	ld   [bc], a                                     ; $692c: $02
	ld   bc, $0102                                   ; $692d: $01 $02 $01
	nop                                              ; $6930: $00
	rst  $38                                         ; $6931: $ff
	cp   $01                                         ; $6932: $fe $01
	ld   [bc], a                                     ; $6934: $02
	ld   bc, $0102                                   ; $6935: $01 $02 $01
	ld   [bc], a                                     ; $6938: $02
	ld   bc, $0102                                   ; $6939: $01 $02 $01
	ld   [bc], a                                     ; $693c: $02
	ld   bc, $0102                                   ; $693d: $01 $02 $01
	rst  $38                                         ; $6940: $ff
	rst  $38                                         ; $6941: $ff
	rst  $38                                         ; $6942: $ff
	rst  $38                                         ; $6943: $ff
	rst  $38                                         ; $6944: $ff
	rst  $38                                         ; $6945: $ff
	rst  $38                                         ; $6946: $ff
	rst  $38                                         ; $6947: $ff
	rst  $38                                         ; $6948: $ff
	rst  $38                                         ; $6949: $ff
	rst  $38                                         ; $694a: $ff
	rst  $38                                         ; $694b: $ff
	rst  $38                                         ; $694c: $ff
	rst  $38                                         ; $694d: $ff
	rst  $38                                         ; $694e: $ff
	rst  $38                                         ; $694f: $ff
	ld   b, c                                        ; $6950: $41
	ld   a, $41                                      ; $6951: $3e $41
	ld   a, $41                                      ; $6953: $3e $41
	ld   a, $41                                      ; $6955: $3e $41
	ld   a, $41                                      ; $6957: $3e $41
	ld   a, $41                                      ; $6959: $3e $41
	ld   a, $dd                                      ; $695b: $3e $dd
	ld   a, $1c                                      ; $695d: $3e $1c
	rst  $38                                         ; $695f: $ff
	ld   b, c                                        ; $6960: $41
	ld   a, $41                                      ; $6961: $3e $41
	ld   a, $41                                      ; $6963: $3e $41
	ld   a, $41                                      ; $6965: $3e $41
	ld   a, $41                                      ; $6967: $3e $41
	ld   a, $41                                      ; $6969: $3e $41
	ld   a, $41                                      ; $696b: $3e $41
	ld   a, $5d                                      ; $696d: $3e $5d
	ld   a, $00                                      ; $696f: $3e $00
	nop                                              ; $6971: $00
	nop                                              ; $6972: $00
	nop                                              ; $6973: $00
	nop                                              ; $6974: $00
	nop                                              ; $6975: $00
	nop                                              ; $6976: $00
	nop                                              ; $6977: $00
	nop                                              ; $6978: $00
	nop                                              ; $6979: $00
	nop                                              ; $697a: $00
	nop                                              ; $697b: $00
	nop                                              ; $697c: $00
	nop                                              ; $697d: $00
	nop                                              ; $697e: $00
	nop                                              ; $697f: $00
	nop                                              ; $6980: $00
	nop                                              ; $6981: $00
	nop                                              ; $6982: $00
	nop                                              ; $6983: $00
	nop                                              ; $6984: $00
	nop                                              ; $6985: $00
	nop                                              ; $6986: $00
	nop                                              ; $6987: $00
	nop                                              ; $6988: $00
	nop                                              ; $6989: $00
	nop                                              ; $698a: $00
	nop                                              ; $698b: $00
	nop                                              ; $698c: $00
	nop                                              ; $698d: $00
	nop                                              ; $698e: $00
	nop                                              ; $698f: $00
	nop                                              ; $6990: $00
	nop                                              ; $6991: $00
	nop                                              ; $6992: $00
	nop                                              ; $6993: $00
	nop                                              ; $6994: $00
	nop                                              ; $6995: $00
	nop                                              ; $6996: $00
	nop                                              ; $6997: $00
	nop                                              ; $6998: $00
	nop                                              ; $6999: $00
	nop                                              ; $699a: $00
	nop                                              ; $699b: $00
	nop                                              ; $699c: $00
	nop                                              ; $699d: $00
	nop                                              ; $699e: $00
	nop                                              ; $699f: $00
	nop                                              ; $69a0: $00
	nop                                              ; $69a1: $00
	nop                                              ; $69a2: $00
	nop                                              ; $69a3: $00
	nop                                              ; $69a4: $00
	nop                                              ; $69a5: $00
	nop                                              ; $69a6: $00
	nop                                              ; $69a7: $00
	nop                                              ; $69a8: $00
	nop                                              ; $69a9: $00
	nop                                              ; $69aa: $00
	nop                                              ; $69ab: $00
	nop                                              ; $69ac: $00
	nop                                              ; $69ad: $00
	nop                                              ; $69ae: $00
	nop                                              ; $69af: $00
	nop                                              ; $69b0: $00
	nop                                              ; $69b1: $00
	nop                                              ; $69b2: $00
	nop                                              ; $69b3: $00
	nop                                              ; $69b4: $00
	nop                                              ; $69b5: $00
	nop                                              ; $69b6: $00
	nop                                              ; $69b7: $00
	nop                                              ; $69b8: $00
	nop                                              ; $69b9: $00
	nop                                              ; $69ba: $00
	nop                                              ; $69bb: $00
	nop                                              ; $69bc: $00
	nop                                              ; $69bd: $00
	nop                                              ; $69be: $00
	nop                                              ; $69bf: $00
	nop                                              ; $69c0: $00
	nop                                              ; $69c1: $00
	nop                                              ; $69c2: $00
	nop                                              ; $69c3: $00
	nop                                              ; $69c4: $00
	nop                                              ; $69c5: $00
	nop                                              ; $69c6: $00
	nop                                              ; $69c7: $00
	nop                                              ; $69c8: $00
	nop                                              ; $69c9: $00
	nop                                              ; $69ca: $00
	nop                                              ; $69cb: $00
	nop                                              ; $69cc: $00
	nop                                              ; $69cd: $00
	nop                                              ; $69ce: $00
	nop                                              ; $69cf: $00
	ld   a, [hl]                                     ; $69d0: $7e
	cp   l                                           ; $69d1: $bd
	ld   e, d                                        ; $69d2: $5a
	cp   l                                           ; $69d3: $bd
	ld   h, [hl]                                     ; $69d4: $66
	sbc  c                                           ; $69d5: $99
	ld   e, d                                        ; $69d6: $5a
	cp   l                                           ; $69d7: $bd
	ld   a, [hl]                                     ; $69d8: $7e
	cp   l                                           ; $69d9: $bd
	ld   a, [hl]                                     ; $69da: $7e
	cp   l                                           ; $69db: $bd
	cp   l                                           ; $69dc: $bd
	db   $db                                         ; $69dd: $db
	jp   $00ff                                       ; $69de: $c3 $ff $00


	nop                                              ; $69e1: $00
	nop                                              ; $69e2: $00
	nop                                              ; $69e3: $00
	nop                                              ; $69e4: $00
	nop                                              ; $69e5: $00
	nop                                              ; $69e6: $00
	nop                                              ; $69e7: $00
	nop                                              ; $69e8: $00
	nop                                              ; $69e9: $00
	nop                                              ; $69ea: $00
	nop                                              ; $69eb: $00
	nop                                              ; $69ec: $00
	nop                                              ; $69ed: $00
	rst  $38                                         ; $69ee: $ff
	nop                                              ; $69ef: $00
	nop                                              ; $69f0: $00
	nop                                              ; $69f1: $00
	nop                                              ; $69f2: $00
	nop                                              ; $69f3: $00
	nop                                              ; $69f4: $00
	nop                                              ; $69f5: $00
	nop                                              ; $69f6: $00
	nop                                              ; $69f7: $00
	nop                                              ; $69f8: $00
	nop                                              ; $69f9: $00
	nop                                              ; $69fa: $00
	nop                                              ; $69fb: $00
	nop                                              ; $69fc: $00
	nop                                              ; $69fd: $00
	nop                                              ; $69fe: $00
	nop                                              ; $69ff: $00
	nop                                              ; $6a00: $00
	rst  $38                                         ; $6a01: $ff
	rst  $38                                         ; $6a02: $ff
	nop                                              ; $6a03: $00
	nop                                              ; $6a04: $00
	nop                                              ; $6a05: $00
	ld   bc, $0101                                   ; $6a06: $01 $01 $01
	ld   bc, $1121                                   ; $6a09: $01 $21 $11
	ld   de, $1131                                   ; $6a0c: $11 $31 $11
	ld   sp, $ff00                                   ; $6a0f: $31 $00 $ff
	rst  $38                                         ; $6a12: $ff
	nop                                              ; $6a13: $00
	nop                                              ; $6a14: $00
	nop                                              ; $6a15: $00
	nop                                              ; $6a16: $00
	add  b                                           ; $6a17: $80
	add  b                                           ; $6a18: $80
	add  b                                           ; $6a19: $80
	add  b                                           ; $6a1a: $80
	adc  h                                           ; $6a1b: $8c
	adc  b                                           ; $6a1c: $88
	adc  h                                           ; $6a1d: $8c
	adc  b                                           ; $6a1e: $88
	adc  h                                           ; $6a1f: $8c
	nop                                              ; $6a20: $00
	rst  $38                                         ; $6a21: $ff
	rst  $38                                         ; $6a22: $ff
	nop                                              ; $6a23: $00
	nop                                              ; $6a24: $00
	nop                                              ; $6a25: $00
	ld   e, $3c                                      ; $6a26: $1e $3c
	dec  c                                           ; $6a28: $0d
	inc  [hl]                                        ; $6a29: $34
	dec  b                                           ; $6a2a: $05
	ccf                                              ; $6a2b: $3f
	add  hl, bc                                      ; $6a2c: $09
	ld   a, $09                                      ; $6a2d: $3e $09
	add  hl, sp                                      ; $6a2f: $39
	nop                                              ; $6a30: $00
	rst  $38                                         ; $6a31: $ff
	rst  $38                                         ; $6a32: $ff
	nop                                              ; $6a33: $00
	jr   nz, jr_095_6a76                             ; $6a34: $20 $40

	ldh  [$60], a                                    ; $6a36: $e0 $60
	sbc  b                                           ; $6a38: $98
	ldh  a, [$fe]                                    ; $6a39: $f0 $fe
	db   $fc                                         ; $6a3b: $fc
	ldh  a, [c]                                      ; $6a3c: $f2
	inc  b                                           ; $6a3d: $04
	ldh  a, [$f8]                                    ; $6a3e: $f0 $f8
	nop                                              ; $6a40: $00
	rst  $38                                         ; $6a41: $ff
	rst  $38                                         ; $6a42: $ff
	nop                                              ; $6a43: $00
	nop                                              ; $6a44: $00
	nop                                              ; $6a45: $00
	ld   bc, $0100                                   ; $6a46: $01 $00 $01
	nop                                              ; $6a49: $00
	ccf                                              ; $6a4a: $3f
	rra                                              ; $6a4b: $1f
	ld   hl, $031f                                   ; $6a4c: $21 $1f $03
	ld   bc, $ff00                                   ; $6a4f: $01 $00 $ff
	rst  $38                                         ; $6a52: $ff
	nop                                              ; $6a53: $00
	add  b                                           ; $6a54: $80
	nop                                              ; $6a55: $00
	add  b                                           ; $6a56: $80
	add  b                                           ; $6a57: $80
	add  b                                           ; $6a58: $80
	add  b                                           ; $6a59: $80
	db   $fc                                         ; $6a5a: $fc
	db   $fc                                         ; $6a5b: $fc
	ret  nz                                          ; $6a5c: $c0

	db   $fc                                         ; $6a5d: $fc
	ret  nz                                          ; $6a5e: $c0

	ret  nz                                          ; $6a5f: $c0

	nop                                              ; $6a60: $00
	rst  $38                                         ; $6a61: $ff
	rst  $38                                         ; $6a62: $ff
	nop                                              ; $6a63: $00
	nop                                              ; $6a64: $00
	nop                                              ; $6a65: $00
	inc  c                                           ; $6a66: $0c
	ld   [$1a0d], sp                                 ; $6a67: $08 $0d $1a
	dec  e                                           ; $6a6a: $1d
	ld   [hl], $1d                                   ; $6a6b: $36 $1d
	inc  a                                           ; $6a6d: $3c
	rrca                                             ; $6a6e: $0f
	ld   a, [de]                                     ; $6a6f: $1a
	nop                                              ; $6a70: $00
	rst  $38                                         ; $6a71: $ff
	rst  $38                                         ; $6a72: $ff
	nop                                              ; $6a73: $00
	jr   nc, jr_095_6a76                             ; $6a74: $30 $00

jr_095_6a76:
	jr   nc, jr_095_6a98                             ; $6a76: $30 $20

	db   $fc                                         ; $6a78: $fc
	db   $fc                                         ; $6a79: $fc
	add  h                                           ; $6a7a: $84
	adc  h                                           ; $6a7b: $8c
	db   $fc                                         ; $6a7c: $fc
	db   $fc                                         ; $6a7d: $fc
	add  h                                           ; $6a7e: $84
	adc  h                                           ; $6a7f: $8c
	nop                                              ; $6a80: $00
	rst  $38                                         ; $6a81: $ff
	rst  $38                                         ; $6a82: $ff
	nop                                              ; $6a83: $00
	ld   bc, $0100                                   ; $6a84: $01 $00 $01
	ld   bc, $3f3f                                   ; $6a87: $01 $3f $3f
	nop                                              ; $6a8a: $00
	ccf                                              ; $6a8b: $3f
	rrca                                             ; $6a8c: $0f
	rrca                                             ; $6a8d: $0f
	jr   @+$11                                       ; $6a8e: $18 $0f

jr_095_6a90:
	nop                                              ; $6a90: $00
	rst  $38                                         ; $6a91: $ff
	rst  $38                                         ; $6a92: $ff
	nop                                              ; $6a93: $00
	add  b                                           ; $6a94: $80
	nop                                              ; $6a95: $00
	add  b                                           ; $6a96: $80
	add  b                                           ; $6a97: $80

jr_095_6a98:
	db   $fc                                         ; $6a98: $fc
	db   $fc                                         ; $6a99: $fc
	nop                                              ; $6a9a: $00
	db   $fc                                         ; $6a9b: $fc
	ld   hl, sp-$10                                  ; $6a9c: $f8 $f0
	jr   jr_095_6a90                                 ; $6a9e: $18 $f0

	nop                                              ; $6aa0: $00
	rst  $38                                         ; $6aa1: $ff
	rst  $38                                         ; $6aa2: $ff
	nop                                              ; $6aa3: $00
	nop                                              ; $6aa4: $00
	nop                                              ; $6aa5: $00
	add  hl, de                                      ; $6aa6: $19
	nop                                              ; $6aa7: $00
	dec  bc                                          ; $6aa8: $0b
	dec  e                                           ; $6aa9: $1d
	rrca                                             ; $6aaa: $0f
	ld   bc, $0113                                   ; $6aab: $01 $13 $01
	inc  sp                                          ; $6aae: $33
	add  hl, de                                      ; $6aaf: $19
	nop                                              ; $6ab0: $00
	rst  $38                                         ; $6ab1: $ff
	rst  $38                                         ; $6ab2: $ff
	nop                                              ; $6ab3: $00
	nop                                              ; $6ab4: $00
	nop                                              ; $6ab5: $00
	call z, $e438                                    ; $6ab6: $cc $38 $e4
	ld   hl, sp+$00                                  ; $6ab9: $f8 $00
	nop                                              ; $6abb: $00
	inc  b                                           ; $6abc: $04
	ld   hl, sp-$08                                  ; $6abd: $f8 $f8
	db   $fc                                         ; $6abf: $fc
	nop                                              ; $6ac0: $00
	rst  $38                                         ; $6ac1: $ff
	rst  $38                                         ; $6ac2: $ff
	nop                                              ; $6ac3: $00
	nop                                              ; $6ac4: $00
	nop                                              ; $6ac5: $00
	inc  bc                                          ; $6ac6: $03
	ld   [bc], a                                     ; $6ac7: $02
	inc  bc                                          ; $6ac8: $03
	ld   [bc], a                                     ; $6ac9: $02
	inc  bc                                          ; $6aca: $03
	ld   [bc], a                                     ; $6acb: $02
	rra                                              ; $6acc: $1f
	ld   a, $23                                      ; $6acd: $3e $23
	ld   e, $00                                      ; $6acf: $1e $00
	rst  $38                                         ; $6ad1: $ff
	rst  $38                                         ; $6ad2: $ff
	nop                                              ; $6ad3: $00
	nop                                              ; $6ad4: $00
	nop                                              ; $6ad5: $00
	ret  nz                                          ; $6ad6: $c0

	ld   b, b                                        ; $6ad7: $40
	ret  nz                                          ; $6ad8: $c0

	ld   b, b                                        ; $6ad9: $40
	call z, $fc48                                    ; $6ada: $cc $48 $fc
	ld   e, b                                        ; $6add: $58
	ldh  [rSVBK], a                                  ; $6ade: $e0 $70
	nop                                              ; $6ae0: $00
	rst  $38                                         ; $6ae1: $ff
	rst  $38                                         ; $6ae2: $ff
	nop                                              ; $6ae3: $00
	ld   bc, $0100                                   ; $6ae4: $01 $00 $01
	ld   bc, $3f3f                                   ; $6ae7: $01 $3f $3f
	ccf                                              ; $6aea: $3f
	ld   bc, $0f1f                                   ; $6aeb: $01 $1f $0f
	rra                                              ; $6aee: $1f
	add  hl, bc                                      ; $6aef: $09
	nop                                              ; $6af0: $00
	rst  $38                                         ; $6af1: $ff
	rst  $38                                         ; $6af2: $ff
	nop                                              ; $6af3: $00
	add  b                                           ; $6af4: $80
	nop                                              ; $6af5: $00
	nop                                              ; $6af6: $00
	add  b                                           ; $6af7: $80
	db   $fc                                         ; $6af8: $fc
	db   $fc                                         ; $6af9: $fc
	ld   a, h                                        ; $6afa: $7c
	add  b                                           ; $6afb: $80
	ld   hl, sp-$10                                  ; $6afc: $f8 $f0
	ld   a, b                                        ; $6afe: $78
	sub  b                                           ; $6aff: $90
	ld   de, $1131                                   ; $6b00: $11 $31 $11
	ld   sp, $3111                                   ; $6b03: $31 $11 $31
	ld   de, $1131                                   ; $6b06: $11 $31 $11
	ccf                                              ; $6b09: $3f
	rra                                              ; $6b0a: $1f
	ccf                                              ; $6b0b: $3f
	db   $10                                         ; $6b0c: $10
	jr   nc, jr_095_6b0f                             ; $6b0d: $30 $00

jr_095_6b0f:
	nop                                              ; $6b0f: $00
	adc  b                                           ; $6b10: $88
	adc  h                                           ; $6b11: $8c
	adc  b                                           ; $6b12: $88
	adc  h                                           ; $6b13: $8c
	adc  b                                           ; $6b14: $88
	adc  h                                           ; $6b15: $8c
	adc  b                                           ; $6b16: $88
	adc  h                                           ; $6b17: $8c
	adc  b                                           ; $6b18: $88
	db   $fc                                         ; $6b19: $fc
	ld   hl, sp-$04                                  ; $6b1a: $f8 $fc
	inc  b                                           ; $6b1c: $04
	ld   [$0000], sp                                 ; $6b1d: $08 $00 $00
	nop                                              ; $6b20: $00
	inc  a                                           ; $6b21: $3c
	dec  c                                           ; $6b22: $0d
	dec  [hl]                                        ; $6b23: $35
	dec  c                                           ; $6b24: $0d
	inc  [hl]                                        ; $6b25: $34
	dec  c                                           ; $6b26: $0d
	scf                                              ; $6b27: $37
	ld   [$033c], sp                                 ; $6b28: $08 $3c $03
	jr   nc, jr_095_6b30                             ; $6b2b: $30 $03

	inc  sp                                          ; $6b2d: $33
	jr   nc, jr_095_6b30                             ; $6b2e: $30 $00

jr_095_6b30:
	jr   jr_095_6b42                                 ; $6b30: $18 $10

	ld   hl, sp-$04                                  ; $6b32: $f8 $fc
	db   $fc                                         ; $6b34: $fc
	nop                                              ; $6b35: $00
	db   $fc                                         ; $6b36: $fc
	cp   $90                                         ; $6b37: $fe $90
	ret  z                                           ; $6b39: $c8

	call z, $8ebc                                    ; $6b3a: $cc $bc $8e
	db   $f4                                         ; $6b3d: $f4
	nop                                              ; $6b3e: $00
	nop                                              ; $6b3f: $00
	ld   [bc], a                                     ; $6b40: $02
	inc  bc                                          ; $6b41: $03

jr_095_6b42:
	inc  bc                                          ; $6b42: $03
	ld   b, $07                                      ; $6b43: $06 $07
	inc  c                                           ; $6b45: $0c
	dec  sp                                          ; $6b46: $3b
	rra                                              ; $6b47: $1f
	inc  a                                           ; $6b48: $3c
	inc  sp                                          ; $6b49: $33
	ld   hl, $0100                                   ; $6b4a: $21 $00 $01
	nop                                              ; $6b4d: $00
	nop                                              ; $6b4e: $00
	nop                                              ; $6b4f: $00
	ldh  [$e0], a                                    ; $6b50: $e0 $e0
	or   b                                           ; $6b52: $b0
	or   b                                           ; $6b53: $b0
	cp   b                                           ; $6b54: $b8
	sbc  b                                           ; $6b55: $98
	cp   $ec                                         ; $6b56: $fe $ec
	add  [hl]                                        ; $6b58: $86
	db   $e4                                         ; $6b59: $e4
	add  b                                           ; $6b5a: $80
	add  b                                           ; $6b5b: $80
	add  b                                           ; $6b5c: $80
	add  b                                           ; $6b5d: $80
	add  b                                           ; $6b5e: $80
	nop                                              ; $6b5f: $00
	ld   e, $3f                                      ; $6b60: $1e $3f
	add  hl, bc                                      ; $6b62: $09
	ld   a, $28                                      ; $6b63: $3e $28
	rra                                              ; $6b65: $1f
	ld   e, $3a                                      ; $6b66: $1e $3a
	rrca                                             ; $6b68: $0f
	ld   a, [hl-]                                    ; $6b69: $3a
	inc  l                                           ; $6b6a: $2c
	add  hl, sp                                      ; $6b6b: $39
	dec  c                                           ; $6b6c: $0d
	add  hl, bc                                      ; $6b6d: $09
	ld   [$f800], sp                                 ; $6b6e: $08 $00 $f8
	db   $fc                                         ; $6b71: $fc
	jr   nc, jr_095_6b98                             ; $6b72: $30 $24

	add  sp, -$04                                    ; $6b74: $e8 $fc
	ld   [hl], b                                     ; $6b76: $70
	ld   hl, sp-$54                                  ; $6b77: $f8 $ac
	ld   hl, sp-$4c                                  ; $6b79: $f8 $b4
	xor  [hl]                                        ; $6b7b: $ae
	or   [hl]                                        ; $6b7c: $b6
	ld   h, b                                        ; $6b7d: $60
	jr   nz, jr_095_6b80                             ; $6b7e: $20 $00

jr_095_6b80:
	jr   jr_095_6b8a                                 ; $6b80: $18 $08

	rra                                              ; $6b82: $1f
	rrca                                             ; $6b83: $0f
	ld   [$080f], sp                                 ; $6b84: $08 $0f $08
	dec  b                                           ; $6b87: $05
	inc  c                                           ; $6b88: $0c
	dec  e                                           ; $6b89: $1d

jr_095_6b8a:
	jr   nc, jr_095_6bc5                             ; $6b8a: $30 $39

	inc  de                                          ; $6b8c: $13
	inc  hl                                          ; $6b8d: $23
	inc  bc                                          ; $6b8e: $03
	nop                                              ; $6b8f: $00
	jr   jr_095_6ba2                                 ; $6b90: $18 $10

	ld   hl, sp-$10                                  ; $6b92: $f8 $f0
	adc  b                                           ; $6b94: $88
	ldh  a, [$b0]                                    ; $6b95: $f0 $b0
	and  b                                           ; $6b97: $a0

jr_095_6b98:
	or   b                                           ; $6b98: $b0
	cp   b                                           ; $6b99: $b8
	adc  h                                           ; $6b9a: $8c
	sbc  h                                           ; $6b9b: $9c
	adc  h                                           ; $6b9c: $8c
	add  b                                           ; $6b9d: $80
	nop                                              ; $6b9e: $00
	nop                                              ; $6b9f: $00
	inc  de                                          ; $6ba0: $13
	add  hl, bc                                      ; $6ba1: $09

jr_095_6ba2:
	inc  bc                                          ; $6ba2: $03
	ld   bc, $0b0d                                   ; $6ba3: $01 $0d $0b
	rrca                                             ; $6ba6: $0f
	dec  de                                          ; $6ba7: $1b
	db   $10                                         ; $6ba8: $10
	add  hl, de                                      ; $6ba9: $19
	inc  sp                                          ; $6baa: $33
	scf                                              ; $6bab: $37
	nop                                              ; $6bac: $00
	ld   [hl], $00                                   ; $6bad: $36 $00
	nop                                              ; $6baf: $00
	db   $10                                         ; $6bb0: $10
	jr   nc, jr_095_6bc3                             ; $6bb1: $30 $10

	jr   nc, jr_095_6be7                             ; $6bb3: $30 $32

	db   $fc                                         ; $6bb5: $fc
	cp   $fc                                         ; $6bb6: $fe $fc
	or   b                                           ; $6bb8: $b0
	sbc  b                                           ; $6bb9: $98
	adc  [hl]                                        ; $6bba: $8e
	inc  e                                           ; $6bbb: $1c
	ld   [$0004], sp                                 ; $6bbc: $08 $04 $00
	nop                                              ; $6bbf: $00
	inc  bc                                          ; $6bc0: $03
	ld   [bc], a                                     ; $6bc1: $02
	inc  bc                                          ; $6bc2: $03

jr_095_6bc3:
	ld   [bc], a                                     ; $6bc3: $02
	inc  bc                                          ; $6bc4: $03

jr_095_6bc5:
	ld   [bc], a                                     ; $6bc5: $02
	rla                                              ; $6bc6: $17
	ld   c, $3f                                      ; $6bc7: $0e $3f
	ld   a, [hl-]                                    ; $6bc9: $3a
	inc  de                                          ; $6bca: $13
	ld   [hl+], a                                    ; $6bcb: $22
	ld   [bc], a                                     ; $6bcc: $02
	ld   [bc], a                                     ; $6bcd: $02
	nop                                              ; $6bce: $00
	nop                                              ; $6bcf: $00
	ret  nz                                          ; $6bd0: $c0

	ld   b, b                                        ; $6bd1: $40
	ret  nz                                          ; $6bd2: $c0

	ld   b, b                                        ; $6bd3: $40
	ret  nz                                          ; $6bd4: $c0

	ld   b, b                                        ; $6bd5: $40
	call nz, $ce40                                   ; $6bd6: $c4 $40 $ce
	ld   b, h                                        ; $6bd9: $44
	db   $fc                                         ; $6bda: $fc
	ld   a, h                                        ; $6bdb: $7c
	jr   c, @+$7e                                    ; $6bdc: $38 $7c

	nop                                              ; $6bde: $00
	nop                                              ; $6bdf: $00
	rra                                              ; $6be0: $1f
	rrca                                             ; $6be1: $0f
	rra                                              ; $6be2: $1f
	add  hl, bc                                      ; $6be3: $09
	rra                                              ; $6be4: $1f
	rrca                                             ; $6be5: $0f
	add  hl, bc                                      ; $6be6: $09

jr_095_6be7:
	inc  bc                                          ; $6be7: $03
	rrca                                             ; $6be8: $0f
	rlca                                             ; $6be9: $07

jr_095_6bea:
	add  hl, de                                      ; $6bea: $19
	dec  a                                           ; $6beb: $3d
	add  hl, bc                                      ; $6bec: $09
	ld   sp, $0001                                   ; $6bed: $31 $01 $00
	ld   hl, sp-$10                                  ; $6bf0: $f8 $f0
	ld   a, b                                        ; $6bf2: $78
	sub  b                                           ; $6bf3: $90
	ld   hl, sp-$10                                  ; $6bf4: $f8 $f0
	ldh  a, [$c0]                                    ; $6bf6: $f0 $c0
	jr   z, jr_095_6bea                              ; $6bf8: $28 $f0

	inc  a                                           ; $6bfa: $3c
	sbc  h                                           ; $6bfb: $9c
	nop                                              ; $6bfc: $00
	adc  h                                           ; $6bfd: $8c
	add  b                                           ; $6bfe: $80
	nop                                              ; $6bff: $00
	nop                                              ; $6c00: $00
	rst  $38                                         ; $6c01: $ff
	rst  $38                                         ; $6c02: $ff
	nop                                              ; $6c03: $00
	ld   [bc], a                                     ; $6c04: $02
	nop                                              ; $6c05: $00
	inc  sp                                          ; $6c06: $33
	ld   [hl+], a                                    ; $6c07: $22
	dec  sp                                          ; $6c08: $3b
	scf                                              ; $6c09: $37
	dec  c                                           ; $6c0a: $0d
	ld   d, $6f                                      ; $6c0b: $16 $6f
	rrca                                             ; $6c0d: $0f
	ld   h, $7f                                      ; $6c0e: $26 $7f
	nop                                              ; $6c10: $00
	rst  $38                                         ; $6c11: $ff
	rst  $38                                         ; $6c12: $ff
	nop                                              ; $6c13: $00
	nop                                              ; $6c14: $00
	nop                                              ; $6c15: $00
	nop                                              ; $6c16: $00
	nop                                              ; $6c17: $00
	db   $fc                                         ; $6c18: $fc
	ld   hl, sp-$08                                  ; $6c19: $f8 $f8
	nop                                              ; $6c1b: $00
	ld   hl, sp-$10                                  ; $6c1c: $f8 $f0
	ret  c                                           ; $6c1e: $d8

	ldh  a, [rP1]                                    ; $6c1f: $f0 $00
	rst  $38                                         ; $6c21: $ff
	rst  $38                                         ; $6c22: $ff
	nop                                              ; $6c23: $00
	ld   bc, $0100                                   ; $6c24: $01 $00 $01
	ld   sp, $1b37                                   ; $6c27: $31 $37 $1b
	rla                                              ; $6c2a: $17
	ld   [$0103], sp                                 ; $6c2b: $08 $03 $01
	ld   bc, $0003                                   ; $6c2e: $01 $03 $00
	rst  $38                                         ; $6c31: $ff
	rst  $38                                         ; $6c32: $ff
	nop                                              ; $6c33: $00
	nop                                              ; $6c34: $00
	db   $10                                         ; $6c35: $10
	db   $10                                         ; $6c36: $10
	or   b                                           ; $6c37: $b0
	db   $fc                                         ; $6c38: $fc
	db   $fc                                         ; $6c39: $fc
	call c, $f860                                    ; $6c3a: $dc $60 $f8
	ld   hl, sp-$08                                  ; $6c3d: $f8 $f8
	ld   [$ff00], sp                                 ; $6c3f: $08 $00 $ff
	rst  $38                                         ; $6c42: $ff
	nop                                              ; $6c43: $00
	nop                                              ; $6c44: $00
	nop                                              ; $6c45: $00
	ld   bc, $1f00                                   ; $6c46: $01 $00 $1f
	rra                                              ; $6c49: $1f
	inc  e                                           ; $6c4a: $1c
	ld   bc, $011e                                   ; $6c4b: $01 $1e $01
	rra                                              ; $6c4e: $1f
	rra                                              ; $6c4f: $1f
	nop                                              ; $6c50: $00
	rst  $38                                         ; $6c51: $ff
	rst  $38                                         ; $6c52: $ff
	nop                                              ; $6c53: $00
	nop                                              ; $6c54: $00
	nop                                              ; $6c55: $00
	cp   b                                           ; $6c56: $b8
	ld   [hl], b                                     ; $6c57: $70
	ret  z                                           ; $6c58: $c8

	ldh  a, [$80]                                    ; $6c59: $f0 $80
	add  b                                           ; $6c5b: $80
	ld   hl, sp-$80                                  ; $6c5c: $f8 $80
	ld   hl, sp-$08                                  ; $6c5e: $f8 $f8
	nop                                              ; $6c60: $00
	nop                                              ; $6c61: $00
	ld   [bc], a                                     ; $6c62: $02
	ld   bc, $0102                                   ; $6c63: $01 $02 $01
	ld   [bc], a                                     ; $6c66: $02
	ld   bc, $0103                                   ; $6c67: $01 $03 $01
	ld   bc, $0100                                   ; $6c6a: $01 $00 $01
	nop                                              ; $6c6d: $00
	ld   [bc], a                                     ; $6c6e: $02
	ld   bc, $0004                                   ; $6c6f: $01 $04 $00
	rlca                                             ; $6c72: $07
	db   $e4                                         ; $6c73: $e4
	rst  $20                                         ; $6c74: $e7
	cpl                                              ; $6c75: $2f
	inc  l                                           ; $6c76: $2c
	inc  l                                           ; $6c77: $2c
	xor  c                                           ; $6c78: $a9
	ld   a, a                                        ; $6c79: $7f
	ld   [hl], e                                     ; $6c7a: $73
	jp   Jump_095_4785                               ; $6c7b: $c3 $85 $47


	db   $ec                                         ; $6c7e: $ec
	ld   e, b                                        ; $6c7f: $58
	nop                                              ; $6c80: $00
	nop                                              ; $6c81: $00
	add  c                                           ; $6c82: $81
	ld   bc, $c182                                   ; $6c83: $01 $82 $c1
	add  [hl]                                        ; $6c86: $86
	add  d                                           ; $6c87: $82
	add  [hl]                                        ; $6c88: $86
	inc  bc                                          ; $6c89: $03
	inc  bc                                          ; $6c8a: $03
	ld   bc, $83c7                                   ; $6c8b: $01 $c7 $83
	rst  JumpTableTrashDE                                         ; $6c8e: $c7
	ld   h, c                                        ; $6c8f: $61
	inc  b                                           ; $6c90: $04
	nop                                              ; $6c91: $00
	add  [hl]                                        ; $6c92: $86
	inc  b                                           ; $6c93: $04
	ld   e, a                                        ; $6c94: $5f
	rra                                              ; $6c95: $1f
	pop  de                                          ; $6c96: $d1
	sub  b                                           ; $6c97: $90
	rra                                              ; $6c98: $1f
	sbc  a                                           ; $6c99: $9f
	sub  c                                           ; $6c9a: $91
	ld   d, b                                        ; $6c9b: $50
	ld   a, a                                        ; $6c9c: $7f
	rst  $18                                         ; $6c9d: $df
	ldh  [c], a                                      ; $6c9e: $e2
	inc  b                                           ; $6c9f: $04
	nop                                              ; $6ca0: $00
	nop                                              ; $6ca1: $00
	nop                                              ; $6ca2: $00
	nop                                              ; $6ca3: $00
	nop                                              ; $6ca4: $00
	add  b                                           ; $6ca5: $80
	rlca                                             ; $6ca6: $07
	adc  a                                           ; $6ca7: $8f
	ld   bc, $0181                                   ; $6ca8: $01 $81 $01
	add  e                                           ; $6cab: $83
	ld   [bc], a                                     ; $6cac: $02
	add  a                                           ; $6cad: $87
	inc  b                                           ; $6cae: $04
	adc  h                                           ; $6caf: $8c
	nop                                              ; $6cb0: $00
	nop                                              ; $6cb1: $00
	nop                                              ; $6cb2: $00
	ret  nz                                          ; $6cb3: $c0

	ld   hl, sp-$80                                  ; $6cb4: $f8 $80
	ret  nz                                          ; $6cb6: $c0

	ld   hl, sp-$80                                  ; $6cb7: $f8 $80
	nop                                              ; $6cb9: $00
	ld   b, b                                        ; $6cba: $40
	add  b                                           ; $6cbb: $80
	or   $4c                                         ; $6cbc: $f6 $4c
	ld   [hl], h                                     ; $6cbe: $74
	ld   a, b                                        ; $6cbf: $78
	nop                                              ; $6cc0: $00
	nop                                              ; $6cc1: $00
	daa                                              ; $6cc2: $27
	inc  de                                          ; $6cc3: $13
	scf                                              ; $6cc4: $37
	jr   jr_095_6ce0                                 ; $6cc5: $18 $19

	ld   b, $02                                      ; $6cc7: $06 $02
	rlca                                             ; $6cc9: $07
	ld   [bc], a                                     ; $6cca: $02
	ld   bc, $330f                                   ; $6ccb: $01 $0f $33
	ld   hl, $0018                                   ; $6cce: $21 $18 $00
	nop                                              ; $6cd1: $00
	cp   h                                           ; $6cd2: $bc
	cp   b                                           ; $6cd3: $b8
	or   h                                           ; $6cd4: $b4
	adc  b                                           ; $6cd5: $88
	ld   a, h                                        ; $6cd6: $7c
	and  b                                           ; $6cd7: $a0
	and  h                                           ; $6cd8: $a4
	db   $fc                                         ; $6cd9: $fc
	ld   [$f8b0], sp                                 ; $6cda: $08 $b0 $f8
	ld   hl, sp-$50                                  ; $6cdd: $f8 $b0
	nop                                              ; $6cdf: $00

jr_095_6ce0:
	nop                                              ; $6ce0: $00
	nop                                              ; $6ce1: $00
	ld   bc, $0702                                   ; $6ce2: $01 $02 $07
	ld   [bc], a                                     ; $6ce5: $02
	inc  b                                           ; $6ce6: $04
	ld   b, $0c                                      ; $6ce7: $06 $0c
	inc  b                                           ; $6ce9: $04
	inc  c                                           ; $6cea: $0c
	ld   [$081e], sp                                 ; $6ceb: $08 $1e $08
	ld   a, [de]                                     ; $6cee: $1a
	rra                                              ; $6cef: $1f
	nop                                              ; $6cf0: $00
	nop                                              ; $6cf1: $00
	nop                                              ; $6cf2: $00
	nop                                              ; $6cf3: $00
	nop                                              ; $6cf4: $00
	nop                                              ; $6cf5: $00
	ld   bc, $0000                                   ; $6cf6: $01 $00 $00
	nop                                              ; $6cf9: $00
	nop                                              ; $6cfa: $00
	nop                                              ; $6cfb: $00
	nop                                              ; $6cfc: $00
	nop                                              ; $6cfd: $00
	jr   jr_095_6d08                                 ; $6cfe: $18 $08

	inc  d                                           ; $6d00: $14
	ld   h, $06                                      ; $6d01: $26 $06
	rrca                                             ; $6d03: $0f
	cpl                                              ; $6d04: $2f
	rra                                              ; $6d05: $1f
	ld   d, $34                                      ; $6d06: $16 $34

jr_095_6d08:
	inc  h                                           ; $6d08: $24
	scf                                              ; $6d09: $37
	cpl                                              ; $6d0a: $2f
	ld   h, a                                        ; $6d0b: $67
	ld   [$0064], sp                                 ; $6d0c: $08 $64 $00
	nop                                              ; $6d0f: $00
	ret  c                                           ; $6d10: $d8

	sub  b                                           ; $6d11: $90
	sub  h                                           ; $6d12: $94
	ld   hl, sp-$08                                  ; $6d13: $f8 $f8
	db   $fc                                         ; $6d15: $fc
	ret  c                                           ; $6d16: $d8

	sub  b                                           ; $6d17: $90
	sub  b                                           ; $6d18: $90
	ld   hl, sp-$04                                  ; $6d19: $f8 $fc
	ld   hl, sp+$30                                  ; $6d1b: $f8 $30
	ld   [hl], b                                     ; $6d1d: $70
	jr   nc, jr_095_6d20                             ; $6d1e: $30 $00

jr_095_6d20:
	add  hl, sp                                      ; $6d20: $39
	dec  sp                                          ; $6d21: $3b
	add  hl, hl                                      ; $6d22: $29
	dec  de                                          ; $6d23: $1b
	add  hl, de                                      ; $6d24: $19
	dec  bc                                          ; $6d25: $0b
	add  hl, de                                      ; $6d26: $19
	dec  bc                                          ; $6d27: $0b
	add  hl, de                                      ; $6d28: $19
	dec  bc                                          ; $6d29: $0b
	inc  e                                           ; $6d2a: $1c
	ccf                                              ; $6d2b: $3f
	inc  hl                                          ; $6d2c: $23
	scf                                              ; $6d2d: $37
	nop                                              ; $6d2e: $00
	nop                                              ; $6d2f: $00
	ld   hl, sp-$08                                  ; $6d30: $f8 $f8
	jr   jr_095_6d3c                                 ; $6d32: $18 $08

	ld   hl, sp-$08                                  ; $6d34: $f8 $f8
	ld   hl, sp+$08                                  ; $6d36: $f8 $08
	ld   hl, sp-$08                                  ; $6d38: $f8 $f8
	db   $fc                                         ; $6d3a: $fc
	nop                                              ; $6d3b: $00

jr_095_6d3c:
	db   $fc                                         ; $6d3c: $fc
	cp   $00                                         ; $6d3d: $fe $00
	nop                                              ; $6d3f: $00
	nop                                              ; $6d40: $00
	ld   bc, $3f00                                   ; $6d41: $01 $00 $3f
	ccf                                              ; $6d44: $3f
	ccf                                              ; $6d45: $3f
	nop                                              ; $6d46: $00
	ld   bc, $0100                                   ; $6d47: $01 $00 $01
	ld   [bc], a                                     ; $6d4a: $02
	ld   bc, $0303                                   ; $6d4b: $01 $03 $03
	nop                                              ; $6d4e: $00
	nop                                              ; $6d4f: $00
	add  b                                           ; $6d50: $80
	add  b                                           ; $6d51: $80
	add  b                                           ; $6d52: $80
	db   $fc                                         ; $6d53: $fc
	cp   $fc                                         ; $6d54: $fe $fc
	add  b                                           ; $6d56: $80
	add  b                                           ; $6d57: $80
	add  b                                           ; $6d58: $80
	add  b                                           ; $6d59: $80
	add  b                                           ; $6d5a: $80
	add  b                                           ; $6d5b: $80
	nop                                              ; $6d5c: $00
	add  b                                           ; $6d5d: $80
	nop                                              ; $6d5e: $00
	nop                                              ; $6d5f: $00
	ld   [bc], a                                     ; $6d60: $02
	ld   bc, $0102                                   ; $6d61: $01 $02 $01
	ld   [bc], a                                     ; $6d64: $02
	ld   bc, $0301                                   ; $6d65: $01 $01 $03
	nop                                              ; $6d68: $00
	inc  bc                                          ; $6d69: $03
	nop                                              ; $6d6a: $00
	nop                                              ; $6d6b: $00
	rst  $38                                         ; $6d6c: $ff
	nop                                              ; $6d6d: $00
	nop                                              ; $6d6e: $00
	rst  $38                                         ; $6d6f: $ff
	rst  $10                                         ; $6d70: $d7
	ld   l, a                                        ; $6d71: $6f
	adc  b                                           ; $6d72: $88
	ld   b, h                                        ; $6d73: $44
	cp   b                                           ; $6d74: $b8
	ld   b, h                                        ; $6d75: $44
	rst  $18                                         ; $6d76: $df
	db   $e4                                         ; $6d77: $e4
	adc  a                                           ; $6d78: $8f
	inc  b                                           ; $6d79: $04
	nop                                              ; $6d7a: $00
	nop                                              ; $6d7b: $00
	rst  $38                                         ; $6d7c: $ff
	nop                                              ; $6d7d: $00
	nop                                              ; $6d7e: $00
	rst  $38                                         ; $6d7f: $ff
	and  e                                           ; $6d80: $a3
	pop  bc                                          ; $6d81: $c1
	ld   b, l                                        ; $6d82: $45
	add  e                                           ; $6d83: $83
	ld   b, c                                        ; $6d84: $41
	add  a                                           ; $6d85: $87
	jp   $c185                                       ; $6d86: $c3 $85 $c1


	add  c                                           ; $6d89: $81
	ld   bc, $ff00                                   ; $6d8a: $01 $00 $ff
	nop                                              ; $6d8d: $00
	nop                                              ; $6d8e: $00
	rst  $38                                         ; $6d8f: $ff
	pop  de                                          ; $6d90: $d1
	ccf                                              ; $6d91: $3f
	jp   nc, $9b4f                                   ; $6d92: $d2 $4f $9b

	ld   d, l                                        ; $6d95: $55
	sub  e                                           ; $6d96: $93
	inc  [hl]                                        ; $6d97: $34
	adc  h                                           ; $6d98: $8c
	inc  h                                           ; $6d99: $24
	nop                                              ; $6d9a: $00
	nop                                              ; $6d9b: $00
	rst  $38                                         ; $6d9c: $ff
	nop                                              ; $6d9d: $00
	nop                                              ; $6d9e: $00
	rst  $38                                         ; $6d9f: $ff
	ld   bc, $0280                                   ; $6da0: $01 $80 $02
	inc  bc                                          ; $6da3: $03
	add  [hl]                                        ; $6da4: $86
	ld   [bc], a                                     ; $6da5: $02
	add  $82                                         ; $6da6: $c6 $82
	add  e                                           ; $6da8: $83
	inc  bc                                          ; $6da9: $03
	nop                                              ; $6daa: $00
	nop                                              ; $6dab: $00
	rst  $38                                         ; $6dac: $ff
	nop                                              ; $6dad: $00
	nop                                              ; $6dae: $00
	rst  $38                                         ; $6daf: $ff
	ret  nz                                          ; $6db0: $c0

	ldh  [rLCDC], a                                  ; $6db1: $e0 $40
	jr   nz, jr_095_6e15                             ; $6db3: $20 $60

	nop                                              ; $6db5: $00
	nop                                              ; $6db6: $00
	nop                                              ; $6db7: $00
	ld   hl, sp-$08                                  ; $6db8: $f8 $f8
	ld   hl, sp+$00                                  ; $6dba: $f8 $00
	rst  $38                                         ; $6dbc: $ff
	nop                                              ; $6dbd: $00
	nop                                              ; $6dbe: $00
	rst  $38                                         ; $6dbf: $ff
	ld   de, $100f                                   ; $6dc0: $11 $0f $10
	add  hl, bc                                      ; $6dc3: $09
	rla                                              ; $6dc4: $17
	dec  bc                                          ; $6dc5: $0b
	ld   a, [hl-]                                    ; $6dc6: $3a
	inc  e                                           ; $6dc7: $1c
	scf                                              ; $6dc8: $37
	daa                                              ; $6dc9: $27
	nop                                              ; $6dca: $00
	nop                                              ; $6dcb: $00
	rst  $38                                         ; $6dcc: $ff
	nop                                              ; $6dcd: $00
	nop                                              ; $6dce: $00
	rst  $38                                         ; $6dcf: $ff
	or   b                                           ; $6dd0: $b0
	db   $fc                                         ; $6dd1: $fc
	and  b                                           ; $6dd2: $a0
	db   $10                                         ; $6dd3: $10
	adc  h                                           ; $6dd4: $8c
	jr   jr_095_6dd7                                 ; $6dd5: $18 $00

jr_095_6dd7:
	nop                                              ; $6dd7: $00
	cp   $fc                                         ; $6dd8: $fe $fc
	nop                                              ; $6dda: $00
	nop                                              ; $6ddb: $00
	rst  $38                                         ; $6ddc: $ff
	nop                                              ; $6ddd: $00
	nop                                              ; $6dde: $00
	rst  $38                                         ; $6ddf: $ff
	inc  sp                                          ; $6de0: $33
	ld   de, $2131                                   ; $6de1: $11 $31 $21
	ld   hl, $6061                                   ; $6de4: $21 $61 $60

jr_095_6de7:
	ld   bc, $0000                                   ; $6de7: $01 $00 $00
	nop                                              ; $6dea: $00
	nop                                              ; $6deb: $00
	rst  $38                                         ; $6dec: $ff
	nop                                              ; $6ded: $00
	nop                                              ; $6dee: $00
	rst  $38                                         ; $6def: $ff
	ld   [$1818], sp                                 ; $6df0: $08 $18 $18
	db   $10                                         ; $6df3: $10
	db   $10                                         ; $6df4: $10
	jr   nc, jr_095_6de7                             ; $6df5: $30 $f0

	ldh  [$c0], a                                    ; $6df7: $e0 $c0
	nop                                              ; $6df9: $00
	nop                                              ; $6dfa: $00
	nop                                              ; $6dfb: $00
	rst  $38                                         ; $6dfc: $ff
	nop                                              ; $6dfd: $00
	nop                                              ; $6dfe: $00
	rst  $38                                         ; $6dff: $ff
	nop                                              ; $6e00: $00
	nop                                              ; $6e01: $00
	nop                                              ; $6e02: $00
	nop                                              ; $6e03: $00
	inc  bc                                          ; $6e04: $03
	nop                                              ; $6e05: $00
	ccf                                              ; $6e06: $3f
	rst  $38                                         ; $6e07: $ff
	ld   h, [hl]                                     ; $6e08: $66
	adc  h                                           ; $6e09: $8c
	jr   jr_095_6e14                                 ; $6e0a: $18 $08

	add  hl, de                                      ; $6e0c: $19
	db   $10                                         ; $6e0d: $10
	jr   jr_095_6e20                                 ; $6e0e: $18 $10

	nop                                              ; $6e10: $00
	nop                                              ; $6e11: $00
	nop                                              ; $6e12: $00
	nop                                              ; $6e13: $00

jr_095_6e14:
	inc  hl                                          ; $6e14: $23

jr_095_6e15:
	jp   $8043                                       ; $6e15: $c3 $43 $80


	ret  nz                                          ; $6e18: $c0

	nop                                              ; $6e19: $00
	ld   b, b                                        ; $6e1a: $40
	ld   h, b                                        ; $6e1b: $60
	add  b                                           ; $6e1c: $80
	add  b                                           ; $6e1d: $80
	ld   b, b                                        ; $6e1e: $40
	nop                                              ; $6e1f: $00

jr_095_6e20:
	nop                                              ; $6e20: $00
	nop                                              ; $6e21: $00
	nop                                              ; $6e22: $00
	nop                                              ; $6e23: $00
	rst  $38                                         ; $6e24: $ff
	rst  $38                                         ; $6e25: $ff
	rst  $38                                         ; $6e26: $ff
	db   $10                                         ; $6e27: $10
	jr   jr_095_6e3a                                 ; $6e28: $18 $10

	inc  d                                           ; $6e2a: $14
	inc  e                                           ; $6e2b: $1c
	dec  de                                          ; $6e2c: $1b
	ld   d, $1b                                      ; $6e2d: $16 $1b
	ld   de, $0000                                   ; $6e2f: $11 $00 $00
	nop                                              ; $6e32: $00
	nop                                              ; $6e33: $00
	add  b                                           ; $6e34: $80
	ret  nz                                          ; $6e35: $c0

	add  a                                           ; $6e36: $87
	nop                                              ; $6e37: $00
	rrca                                             ; $6e38: $0f
	rlca                                             ; $6e39: $07

jr_095_6e3a:
	nop                                              ; $6e3a: $00
	nop                                              ; $6e3b: $00
	nop                                              ; $6e3c: $00
	nop                                              ; $6e3d: $00
	ld   [bc], a                                     ; $6e3e: $02
	add  c                                           ; $6e3f: $81
	nop                                              ; $6e40: $00
	nop                                              ; $6e41: $00
	ret  nz                                          ; $6e42: $c0

	add  b                                           ; $6e43: $80
	nop                                              ; $6e44: $00
	ret  nz                                          ; $6e45: $c0

	db   $e4                                         ; $6e46: $e4
	ld   e, b                                        ; $6e47: $58
	ld   l, b                                        ; $6e48: $68
	ldh  a, [$60]                                    ; $6e49: $f0 $60
	jr   nz, jr_095_6e5d                             ; $6e4b: $20 $10

	jr   nc, @+$1a                                   ; $6e4d: $30 $18

	ld   hl, sp+$00                                  ; $6e4f: $f8 $00
	nop                                              ; $6e51: $00
	nop                                              ; $6e52: $00
	nop                                              ; $6e53: $00
	jr   nz, jr_095_6e96                             ; $6e54: $20 $40

	ld   h, b                                        ; $6e56: $60
	ld   b, b                                        ; $6e57: $40
	ld   h, b                                        ; $6e58: $60
	ld   b, b                                        ; $6e59: $40
	ld   h, b                                        ; $6e5a: $60
	ld   b, b                                        ; $6e5b: $40
	ld   h, b                                        ; $6e5c: $60

jr_095_6e5d:
	ld   b, b                                        ; $6e5d: $40
	ld   h, b                                        ; $6e5e: $60
	ld   b, b                                        ; $6e5f: $40
	ld   [bc], a                                     ; $6e60: $02
	ld   bc, $0102                                   ; $6e61: $01 $02 $01
	ld   [bc], a                                     ; $6e64: $02
	ld   bc, $c142                                   ; $6e65: $01 $42 $c1
	ld   b, d                                        ; $6e68: $42
	ld   h, c                                        ; $6e69: $61
	ld   h, d                                        ; $6e6a: $62
	ld   hl, $3122                                   ; $6e6b: $21 $22 $31
	ld   [de], a                                     ; $6e6e: $12
	ld   sp, $ff80                                   ; $6e6f: $31 $80 $ff
	cp   a                                           ; $6e72: $bf
	ret  nz                                          ; $6e73: $c0

	and  b                                           ; $6e74: $a0
	ret  nz                                          ; $6e75: $c0

	and  b                                           ; $6e76: $a0
	ret  nz                                          ; $6e77: $c0

	and  b                                           ; $6e78: $a0
	ret  nz                                          ; $6e79: $c0

	and  e                                           ; $6e7a: $a3
	pop  bc                                          ; $6e7b: $c1
	and  c                                           ; $6e7c: $a1
	ret  nz                                          ; $6e7d: $c0

	and  b                                           ; $6e7e: $a0
	ret  nz                                          ; $6e7f: $c0

	nop                                              ; $6e80: $00
	rst  $38                                         ; $6e81: $ff
	rst  $38                                         ; $6e82: $ff
	nop                                              ; $6e83: $00
	ret  nz                                          ; $6e84: $c0

	nop                                              ; $6e85: $00
	ld   b, b                                        ; $6e86: $40
	add  b                                           ; $6e87: $80
	ld   b, b                                        ; $6e88: $40
	adc  a                                           ; $6e89: $8f
	ei                                               ; $6e8a: $fb
	and  $a4                                         ; $6e8b: $e6 $a4
	ld   h, d                                        ; $6e8d: $62
	ld   h, h                                        ; $6e8e: $64
	ld   b, d                                        ; $6e8f: $42
	nop                                              ; $6e90: $00
	rst  $38                                         ; $6e91: $ff
	rst  $38                                         ; $6e92: $ff
	nop                                              ; $6e93: $00
	nop                                              ; $6e94: $00
	nop                                              ; $6e95: $00

jr_095_6e96:
	ld   bc, $0203                                   ; $6e96: $01 $03 $02
	jp   nz, Jump_095_44cf                           ; $6e99: $c2 $cf $44

	ld   b, e                                        ; $6e9c: $43
	ld   b, a                                        ; $6e9d: $47
	ld   b, e                                        ; $6e9e: $43
	ld   b, d                                        ; $6e9f: $42
	nop                                              ; $6ea0: $00
	rst  $38                                         ; $6ea1: $ff
	rst  $38                                         ; $6ea2: $ff
	nop                                              ; $6ea3: $00
	nop                                              ; $6ea4: $00
	nop                                              ; $6ea5: $00
	nop                                              ; $6ea6: $00
	ld   a, $98                                      ; $6ea7: $3e $98
	ld   [hl], $a6                                   ; $6ea9: $36 $a6
	sub  h                                           ; $6eab: $94
	inc  [hl]                                        ; $6eac: $34
	rla                                              ; $6ead: $17
	cp   a                                           ; $6eae: $bf
	sub  l                                           ; $6eaf: $95
	ld   bc, $fdff                                   ; $6eb0: $01 $ff $fd
	inc  bc                                          ; $6eb3: $03
	dec  b                                           ; $6eb4: $05
	inc  bc                                          ; $6eb5: $03
	dec  b                                           ; $6eb6: $05
	inc  bc                                          ; $6eb7: $03
	dec  b                                           ; $6eb8: $05
	inc  bc                                          ; $6eb9: $03
	dec  b                                           ; $6eba: $05
	inc  bc                                          ; $6ebb: $03
	dec  b                                           ; $6ebc: $05
	inc  bc                                          ; $6ebd: $03
	dec  b                                           ; $6ebe: $05
	inc  bc                                          ; $6ebf: $03
	add  b                                           ; $6ec0: $80
	rst  $38                                         ; $6ec1: $ff
	cp   a                                           ; $6ec2: $bf
	ret  nz                                          ; $6ec3: $c0

	and  b                                           ; $6ec4: $a0
	ret  nz                                          ; $6ec5: $c0

	and  b                                           ; $6ec6: $a0
	ret  nz                                          ; $6ec7: $c0

	and  b                                           ; $6ec8: $a0
	ret  nz                                          ; $6ec9: $c0

	and  b                                           ; $6eca: $a0
	ret  nz                                          ; $6ecb: $c0

	and  b                                           ; $6ecc: $a0
	ret  nz                                          ; $6ecd: $c0

	and  b                                           ; $6ece: $a0
	ret  nz                                          ; $6ecf: $c0

	nop                                              ; $6ed0: $00
	rst  $38                                         ; $6ed1: $ff
	rst  $38                                         ; $6ed2: $ff
	nop                                              ; $6ed3: $00
	nop                                              ; $6ed4: $00
	nop                                              ; $6ed5: $00
	jr   @+$12                                       ; $6ed6: $18 $10

	jr   jr_095_6eea                                 ; $6ed8: $18 $10

	jr   jr_095_6eec                                 ; $6eda: $18 $10

	rra                                              ; $6edc: $1f
	db   $10                                         ; $6edd: $10
	rra                                              ; $6ede: $1f
	rra                                              ; $6edf: $1f
	nop                                              ; $6ee0: $00
	rst  $38                                         ; $6ee1: $ff
	rst  $38                                         ; $6ee2: $ff
	nop                                              ; $6ee3: $00
	nop                                              ; $6ee4: $00
	nop                                              ; $6ee5: $00
	ld   bc, $0203                                   ; $6ee6: $01 $03 $02
	ld   [bc], a                                     ; $6ee9: $02

jr_095_6eea:
	rrca                                             ; $6eea: $0f
	inc  b                                           ; $6eeb: $04

jr_095_6eec:
	inc  bc                                          ; $6eec: $03
	rlca                                             ; $6eed: $07
	inc  bc                                          ; $6eee: $03
	add  d                                           ; $6eef: $82
	add  b                                           ; $6ef0: $80
	rst  $38                                         ; $6ef1: $ff
	cp   a                                           ; $6ef2: $bf
	ret  nz                                          ; $6ef3: $c0

	and  b                                           ; $6ef4: $a0
	ret  nz                                          ; $6ef5: $c0

	and  b                                           ; $6ef6: $a0
	ret  nz                                          ; $6ef7: $c0

	and  b                                           ; $6ef8: $a0
	ret  nz                                          ; $6ef9: $c0

	and  b                                           ; $6efa: $a0
	ret  nz                                          ; $6efb: $c0

	and  b                                           ; $6efc: $a0
	ret  nz                                          ; $6efd: $c0

	and  b                                           ; $6efe: $a0
	ret  nz                                          ; $6eff: $c0

	jr   jr_095_6f12                                 ; $6f00: $18 $10

	nop                                              ; $6f02: $00
	jr   jr_095_6f0d                                 ; $6f03: $18 $08

	inc  c                                           ; $6f05: $0c
	rrca                                             ; $6f06: $0f
	rlca                                             ; $6f07: $07
	ld   bc, $0000                                   ; $6f08: $01 $00 $00
	nop                                              ; $6f0b: $00
	rst  $38                                         ; $6f0c: $ff

jr_095_6f0d:
	nop                                              ; $6f0d: $00
	nop                                              ; $6f0e: $00
	rst  $38                                         ; $6f0f: $ff
	nop                                              ; $6f10: $00
	nop                                              ; $6f11: $00

jr_095_6f12:
	nop                                              ; $6f12: $00
	nop                                              ; $6f13: $00
	nop                                              ; $6f14: $00
	nop                                              ; $6f15: $00
	nop                                              ; $6f16: $00
	add  b                                           ; $6f17: $80
	add  b                                           ; $6f18: $80
	nop                                              ; $6f19: $00
	nop                                              ; $6f1a: $00
	nop                                              ; $6f1b: $00
	rst  $38                                         ; $6f1c: $ff
	nop                                              ; $6f1d: $00
	nop                                              ; $6f1e: $00
	rst  $38                                         ; $6f1f: $ff
	add  hl, de                                      ; $6f20: $19
	db   $10                                         ; $6f21: $10
	jr   jr_095_6f34                                 ; $6f22: $18 $10

	jr   jr_095_6f36                                 ; $6f24: $18 $10

	jr   jr_095_6f38                                 ; $6f26: $18 $10

	db   $10                                         ; $6f28: $10
	stop                                             ; $6f29: $10 $00
	nop                                              ; $6f2b: $00
	rst  $38                                         ; $6f2c: $ff
	nop                                              ; $6f2d: $00
	nop                                              ; $6f2e: $00
	rst  $38                                         ; $6f2f: $ff
	add  a                                           ; $6f30: $87
	ld   [bc], a                                     ; $6f31: $02
	ld   b, $04                                      ; $6f32: $06 $04

jr_095_6f34:
	ld   b, $04                                      ; $6f34: $06 $04

jr_095_6f36:
	ld   b, $03                                      ; $6f36: $06 $03

jr_095_6f38:
	ld   [bc], a                                     ; $6f38: $02
	ld   bc, $0000                                   ; $6f39: $01 $00 $00
	rst  $38                                         ; $6f3c: $ff
	nop                                              ; $6f3d: $00
	nop                                              ; $6f3e: $00
	rst  $38                                         ; $6f3f: $ff
	add  sp, $1c                                     ; $6f40: $e8 $1c
	nop                                              ; $6f42: $00
	nop                                              ; $6f43: $00
	nop                                              ; $6f44: $00
	nop                                              ; $6f45: $00
	ldh  a, [rP1]                                    ; $6f46: $f0 $00
	ldh  a, [$f0]                                    ; $6f48: $f0 $f0
	nop                                              ; $6f4a: $00
	nop                                              ; $6f4b: $00
	rst  $38                                         ; $6f4c: $ff
	nop                                              ; $6f4d: $00
	nop                                              ; $6f4e: $00
	rst  $38                                         ; $6f4f: $ff
	ld   h, b                                        ; $6f50: $60
	ld   b, b                                        ; $6f51: $40
	ld   l, h                                        ; $6f52: $6c
	ld   b, h                                        ; $6f53: $44
	inc  a                                           ; $6f54: $3c
	ld   l, b                                        ; $6f55: $68
	jr   nc, jr_095_6f90                             ; $6f56: $30 $38

	nop                                              ; $6f58: $00
	nop                                              ; $6f59: $00
	nop                                              ; $6f5a: $00
	nop                                              ; $6f5b: $00
	rst  $38                                         ; $6f5c: $ff
	nop                                              ; $6f5d: $00
	nop                                              ; $6f5e: $00
	rst  $38                                         ; $6f5f: $ff
	ld   [hl-], a                                    ; $6f60: $32
	ld   de, $0112                                   ; $6f61: $11 $12 $01
	ld   [bc], a                                     ; $6f64: $02
	ld   bc, $0102                                   ; $6f65: $01 $02 $01
	ld   [bc], a                                     ; $6f68: $02
	ld   bc, $0102                                   ; $6f69: $01 $02 $01
	cp   $01                                         ; $6f6c: $fe $01
	nop                                              ; $6f6e: $00
	rst  $38                                         ; $6f6f: $ff
	and  b                                           ; $6f70: $a0
	ret  nz                                          ; $6f71: $c0

	and  c                                           ; $6f72: $a1
	pop  bc                                          ; $6f73: $c1
	and  d                                           ; $6f74: $a2
	jp   $c0a0                                       ; $6f75: $c3 $a0 $c0


	and  b                                           ; $6f78: $a0
	ret  nz                                          ; $6f79: $c0

	and  b                                           ; $6f7a: $a0
	ret  nz                                          ; $6f7b: $c0

	and  b                                           ; $6f7c: $a0
	ret  nz                                          ; $6f7d: $c0

	cp   a                                           ; $6f7e: $bf
	ret  nz                                          ; $6f7f: $c0

	sub  h                                           ; $6f80: $94
	jp   nc, $e2f4                                   ; $6f81: $d2 $f4 $e2

	ld   [hl-], a                                    ; $6f84: $32
	db   $f4                                         ; $6f85: $f4
	ld   d, h                                        ; $6f86: $54
	add  h                                           ; $6f87: $84
	ld   c, b                                        ; $6f88: $48
	adc  h                                           ; $6f89: $8c
	ld   e, b                                        ; $6f8a: $58
	sbc  b                                           ; $6f8b: $98
	ld   h, c                                        ; $6f8c: $61
	sub  e                                           ; $6f8d: $93
	rst  $38                                         ; $6f8e: $ff
	nop                                              ; $6f8f: $00

jr_095_6f90:
	ld   c, e                                        ; $6f90: $4b
	ld   b, [hl]                                     ; $6f91: $46
	ld   b, e                                        ; $6f92: $43
	ld   c, a                                        ; $6f93: $4f
	ld   b, b                                        ; $6f94: $40
	ld   b, a                                        ; $6f95: $47
	ld   b, [hl]                                     ; $6f96: $46
	ld   b, l                                        ; $6f97: $45
	adc  $45                                         ; $6f98: $ce $45
	ld   [bc], a                                     ; $6f9a: $02
	call $8182                                       ; $6f9b: $cd $82 $81
	rst  $38                                         ; $6f9e: $ff
	nop                                              ; $6f9f: $00
	ld   sp, hl                                      ; $6fa0: $f9
	pop  de                                          ; $6fa1: $d1
	adc  d                                           ; $6fa2: $8a
	ld   a, c                                        ; $6fa3: $79
	rla                                              ; $6fa4: $17
	xor  d                                           ; $6fa5: $aa
	ld   h, [hl]                                     ; $6fa6: $66
	and  [hl]                                        ; $6fa7: $a6
	ld   l, [hl]                                     ; $6fa8: $6e
	and  $7d                                         ; $6fa9: $e6 $7d
	ld   c, e                                        ; $6fab: $4b
	ld   sp, hl                                      ; $6fac: $f9
	ld   d, b                                        ; $6fad: $50
	rst  $38                                         ; $6fae: $ff
	nop                                              ; $6faf: $00
	dec  b                                           ; $6fb0: $05
	inc  bc                                          ; $6fb1: $03
	dec  b                                           ; $6fb2: $05
	inc  bc                                          ; $6fb3: $03
	dec  b                                           ; $6fb4: $05
	inc  bc                                          ; $6fb5: $03
	dec  b                                           ; $6fb6: $05
	inc  bc                                          ; $6fb7: $03
	dec  b                                           ; $6fb8: $05
	inc  bc                                          ; $6fb9: $03
	add  l                                           ; $6fba: $85
	inc  bc                                          ; $6fbb: $03
	add  l                                           ; $6fbc: $85
	inc  bc                                          ; $6fbd: $03
	db   $fd                                         ; $6fbe: $fd
	inc  bc                                          ; $6fbf: $03
	and  b                                           ; $6fc0: $a0
	ret  nz                                          ; $6fc1: $c0

	and  b                                           ; $6fc2: $a0
	ret  nz                                          ; $6fc3: $c0

	and  b                                           ; $6fc4: $a0
	ret  nz                                          ; $6fc5: $c0

	and  b                                           ; $6fc6: $a0
	ret  nz                                          ; $6fc7: $c0

	and  b                                           ; $6fc8: $a0
	ret  nz                                          ; $6fc9: $c0

	and  e                                           ; $6fca: $a3
	jp   $c0a0                                       ; $6fcb: $c3 $a0 $c0


	cp   a                                           ; $6fce: $bf
	ret  nz                                          ; $6fcf: $c0

	jr   @+$12                                       ; $6fd0: $18 $10

	jr   jr_095_6fe4                                 ; $6fd2: $18 $10

	jr   jr_095_6fe6                                 ; $6fd4: $18 $10

	jr   jr_095_6fe8                                 ; $6fd6: $18 $10

	jr   c, jr_095_6fea                              ; $6fd8: $38 $10

	rst  $38                                         ; $6fda: $ff
	rst  $38                                         ; $6fdb: $ff
	nop                                              ; $6fdc: $00
	nop                                              ; $6fdd: $00
	rst  $38                                         ; $6fde: $ff
	nop                                              ; $6fdf: $00
	dec  bc                                          ; $6fe0: $0b
	ld   b, $03                                      ; $6fe1: $06 $03
	rrca                                             ; $6fe3: $0f

jr_095_6fe4:
	nop                                              ; $6fe4: $00
	rlca                                             ; $6fe5: $07

jr_095_6fe6:
	ld   b, $05                                      ; $6fe6: $06 $05

jr_095_6fe8:
	ld   c, $05                                      ; $6fe8: $0e $05

jr_095_6fea:
	jp   nz, $02cd                                   ; $6fea: $c2 $cd $02

	ld   bc, $00ff                                   ; $6fed: $01 $ff $00
	and  b                                           ; $6ff0: $a0
	ret  nz                                          ; $6ff1: $c0

	and  b                                           ; $6ff2: $a0
	ret  nz                                          ; $6ff3: $c0

	and  b                                           ; $6ff4: $a0
	ret  nz                                          ; $6ff5: $c0

	and  b                                           ; $6ff6: $a0
	ret  nz                                          ; $6ff7: $c0

	and  b                                           ; $6ff8: $a0
	ret  nz                                          ; $6ff9: $c0

	and  b                                           ; $6ffa: $a0
	ret  nz                                          ; $6ffb: $c0

	and  b                                           ; $6ffc: $a0
	ret  nz                                          ; $6ffd: $c0

	cp   a                                           ; $6ffe: $bf
	ret  nz                                          ; $6fff: $c0

	ld   b, [hl]                                     ; $7000: $46
	ld   b, a                                        ; $7001: $47
	ld   c, b                                        ; $7002: $48
	ld   c, c                                        ; $7003: $49
	ld   c, d                                        ; $7004: $4a
	ld   c, e                                        ; $7005: $4b
	ld   c, h                                        ; $7006: $4c
	ld   c, l                                        ; $7007: $4d
	ld   c, [hl]                                     ; $7008: $4e
	ld   c, a                                        ; $7009: $4f
	ld   h, b                                        ; $700a: $60
	ld   h, c                                        ; $700b: $61
	ld   h, d                                        ; $700c: $62
	ld   h, e                                        ; $700d: $63
	ld   h, h                                        ; $700e: $64
	ld   h, l                                        ; $700f: $65
	ld   h, [hl]                                     ; $7010: $66
	inc  d                                           ; $7011: $14
	inc  d                                           ; $7012: $14
	inc  d                                           ; $7013: $14
	inc  d                                           ; $7014: $14
	inc  d                                           ; $7015: $14
	inc  d                                           ; $7016: $14
	inc  d                                           ; $7017: $14
	inc  d                                           ; $7018: $14
	inc  d                                           ; $7019: $14
	inc  d                                           ; $701a: $14
	inc  d                                           ; $701b: $14
	inc  d                                           ; $701c: $14
	inc  d                                           ; $701d: $14
	inc  d                                           ; $701e: $14
	inc  d                                           ; $701f: $14
	ld   d, [hl]                                     ; $7020: $56
	ld   d, a                                        ; $7021: $57
	ld   e, b                                        ; $7022: $58
	ld   e, c                                        ; $7023: $59
	ld   e, d                                        ; $7024: $5a
	ld   e, e                                        ; $7025: $5b
	ld   e, h                                        ; $7026: $5c
	ld   e, l                                        ; $7027: $5d
	ld   e, [hl]                                     ; $7028: $5e
	ld   e, a                                        ; $7029: $5f
	ld   [hl], b                                     ; $702a: $70
	ld   [hl], c                                     ; $702b: $71
	ld   [hl], d                                     ; $702c: $72
	ld   [hl], e                                     ; $702d: $73
	ld   [hl], h                                     ; $702e: $74
	ld   [hl], l                                     ; $702f: $75
	halt                                             ; $7030: $76
	inc  d                                           ; $7031: $14
	inc  d                                           ; $7032: $14
	inc  d                                           ; $7033: $14
	inc  d                                           ; $7034: $14
	inc  d                                           ; $7035: $14
	inc  d                                           ; $7036: $14
	inc  d                                           ; $7037: $14
	inc  d                                           ; $7038: $14
	inc  d                                           ; $7039: $14
	inc  d                                           ; $703a: $14
	inc  d                                           ; $703b: $14
	inc  d                                           ; $703c: $14
	inc  d                                           ; $703d: $14
	inc  d                                           ; $703e: $14
	inc  d                                           ; $703f: $14
	ld   [bc], a                                     ; $7040: $02
	add  hl, bc                                      ; $7041: $09
	inc  d                                           ; $7042: $14
	inc  d                                           ; $7043: $14
	inc  d                                           ; $7044: $14
	inc  d                                           ; $7045: $14
	inc  d                                           ; $7046: $14
	inc  d                                           ; $7047: $14
	inc  d                                           ; $7048: $14
	inc  d                                           ; $7049: $14
	inc  d                                           ; $704a: $14
	inc  d                                           ; $704b: $14
	inc  d                                           ; $704c: $14
	inc  d                                           ; $704d: $14
	inc  d                                           ; $704e: $14
	inc  d                                           ; $704f: $14
	inc  d                                           ; $7050: $14
	inc  d                                           ; $7051: $14
	add  hl, bc                                      ; $7052: $09
	dec  c                                           ; $7053: $0d
	ld   a, a                                        ; $7054: $7f
	ld   a, a                                        ; $7055: $7f
	ld   a, a                                        ; $7056: $7f
	ld   a, a                                        ; $7057: $7f
	ld   a, a                                        ; $7058: $7f
	ld   a, a                                        ; $7059: $7f
	ld   a, a                                        ; $705a: $7f
	ld   a, a                                        ; $705b: $7f
	ld   a, a                                        ; $705c: $7f
	ld   a, a                                        ; $705d: $7f
	ld   a, a                                        ; $705e: $7f
	ld   a, a                                        ; $705f: $7f
	ld   bc, $1409                                   ; $7060: $01 $09 $14
	inc  d                                           ; $7063: $14
	inc  d                                           ; $7064: $14
	inc  d                                           ; $7065: $14
	inc  d                                           ; $7066: $14
	inc  d                                           ; $7067: $14
	inc  d                                           ; $7068: $14
	inc  d                                           ; $7069: $14
	inc  d                                           ; $706a: $14
	inc  d                                           ; $706b: $14
	inc  d                                           ; $706c: $14
	inc  d                                           ; $706d: $14
	inc  d                                           ; $706e: $14
	inc  d                                           ; $706f: $14
	inc  d                                           ; $7070: $14
	inc  d                                           ; $7071: $14
	add  hl, bc                                      ; $7072: $09
	dec  e                                           ; $7073: $1d
	ld   a, a                                        ; $7074: $7f
	ld   a, a                                        ; $7075: $7f
	ld   a, a                                        ; $7076: $7f
	ld   a, a                                        ; $7077: $7f
	ld   a, a                                        ; $7078: $7f
	ld   a, a                                        ; $7079: $7f
	ld   a, a                                        ; $707a: $7f
	ld   a, a                                        ; $707b: $7f
	ld   a, a                                        ; $707c: $7f
	ld   a, a                                        ; $707d: $7f
	ld   a, a                                        ; $707e: $7f
	ld   a, a                                        ; $707f: $7f
	ld   [bc], a                                     ; $7080: $02
	add  hl, bc                                      ; $7081: $09
	inc  d                                           ; $7082: $14
	inc  d                                           ; $7083: $14
	inc  d                                           ; $7084: $14
	inc  d                                           ; $7085: $14
	inc  d                                           ; $7086: $14
	inc  d                                           ; $7087: $14
	inc  d                                           ; $7088: $14
	inc  d                                           ; $7089: $14
	inc  d                                           ; $708a: $14
	inc  d                                           ; $708b: $14
	inc  d                                           ; $708c: $14
	inc  d                                           ; $708d: $14
	inc  d                                           ; $708e: $14
	inc  d                                           ; $708f: $14
	inc  d                                           ; $7090: $14
	inc  d                                           ; $7091: $14
	add  hl, bc                                      ; $7092: $09
	ld   [bc], a                                     ; $7093: $02
	ld   a, a                                        ; $7094: $7f
	ld   a, a                                        ; $7095: $7f
	ld   a, a                                        ; $7096: $7f
	ld   a, a                                        ; $7097: $7f
	ld   a, a                                        ; $7098: $7f
	ld   a, a                                        ; $7099: $7f
	ld   a, a                                        ; $709a: $7f
	ld   a, a                                        ; $709b: $7f
	ld   a, a                                        ; $709c: $7f
	ld   a, a                                        ; $709d: $7f
	ld   a, a                                        ; $709e: $7f
	ld   a, a                                        ; $709f: $7f
	ld   bc, $1409                                   ; $70a0: $01 $09 $14
	inc  d                                           ; $70a3: $14
	inc  d                                           ; $70a4: $14
	inc  d                                           ; $70a5: $14
	inc  d                                           ; $70a6: $14
	inc  d                                           ; $70a7: $14
	inc  d                                           ; $70a8: $14
	inc  d                                           ; $70a9: $14
	inc  d                                           ; $70aa: $14
	inc  d                                           ; $70ab: $14
	inc  d                                           ; $70ac: $14
	inc  d                                           ; $70ad: $14
	inc  d                                           ; $70ae: $14
	inc  d                                           ; $70af: $14
	inc  d                                           ; $70b0: $14
	inc  d                                           ; $70b1: $14
	add  hl, bc                                      ; $70b2: $09
	ld   bc, $7f7f                                   ; $70b3: $01 $7f $7f
	ld   a, a                                        ; $70b6: $7f
	ld   a, a                                        ; $70b7: $7f
	ld   a, a                                        ; $70b8: $7f
	ld   a, a                                        ; $70b9: $7f
	ld   a, a                                        ; $70ba: $7f
	ld   a, a                                        ; $70bb: $7f
	ld   a, a                                        ; $70bc: $7f
	ld   a, a                                        ; $70bd: $7f
	ld   a, a                                        ; $70be: $7f
	ld   a, a                                        ; $70bf: $7f
	ld   [bc], a                                     ; $70c0: $02
	add  hl, bc                                      ; $70c1: $09
	inc  d                                           ; $70c2: $14
	inc  d                                           ; $70c3: $14
	inc  d                                           ; $70c4: $14
	inc  d                                           ; $70c5: $14
	inc  d                                           ; $70c6: $14
	inc  d                                           ; $70c7: $14
	inc  d                                           ; $70c8: $14
	inc  d                                           ; $70c9: $14
	inc  d                                           ; $70ca: $14
	inc  d                                           ; $70cb: $14
	inc  d                                           ; $70cc: $14
	inc  d                                           ; $70cd: $14
	inc  d                                           ; $70ce: $14
	inc  d                                           ; $70cf: $14
	inc  d                                           ; $70d0: $14
	inc  d                                           ; $70d1: $14
	add  hl, bc                                      ; $70d2: $09
	ld   [bc], a                                     ; $70d3: $02
	ld   a, a                                        ; $70d4: $7f
	ld   a, a                                        ; $70d5: $7f
	ld   a, a                                        ; $70d6: $7f
	ld   a, a                                        ; $70d7: $7f
	ld   a, a                                        ; $70d8: $7f
	ld   a, a                                        ; $70d9: $7f
	ld   a, a                                        ; $70da: $7f
	ld   a, a                                        ; $70db: $7f
	ld   a, a                                        ; $70dc: $7f
	ld   a, a                                        ; $70dd: $7f
	ld   a, a                                        ; $70de: $7f
	ld   a, a                                        ; $70df: $7f
	ld   bc, $1409                                   ; $70e0: $01 $09 $14
	inc  d                                           ; $70e3: $14
	inc  d                                           ; $70e4: $14
	inc  d                                           ; $70e5: $14
	inc  d                                           ; $70e6: $14
	inc  d                                           ; $70e7: $14
	inc  d                                           ; $70e8: $14
	inc  d                                           ; $70e9: $14
	inc  d                                           ; $70ea: $14
	inc  d                                           ; $70eb: $14
	inc  d                                           ; $70ec: $14
	inc  d                                           ; $70ed: $14
	inc  d                                           ; $70ee: $14
	inc  d                                           ; $70ef: $14
	inc  d                                           ; $70f0: $14
	inc  d                                           ; $70f1: $14
	add  hl, bc                                      ; $70f2: $09
	ld   bc, $7f7f                                   ; $70f3: $01 $7f $7f
	ld   a, a                                        ; $70f6: $7f
	ld   a, a                                        ; $70f7: $7f
	ld   a, a                                        ; $70f8: $7f
	ld   a, a                                        ; $70f9: $7f
	ld   a, a                                        ; $70fa: $7f
	ld   a, a                                        ; $70fb: $7f
	ld   a, a                                        ; $70fc: $7f
	ld   a, a                                        ; $70fd: $7f
	ld   a, a                                        ; $70fe: $7f
	ld   a, a                                        ; $70ff: $7f
	ld   [bc], a                                     ; $7100: $02
	add  hl, bc                                      ; $7101: $09
	inc  d                                           ; $7102: $14
	inc  d                                           ; $7103: $14
	inc  d                                           ; $7104: $14
	inc  d                                           ; $7105: $14
	inc  d                                           ; $7106: $14
	inc  d                                           ; $7107: $14
	inc  d                                           ; $7108: $14
	inc  d                                           ; $7109: $14
	inc  d                                           ; $710a: $14
	inc  d                                           ; $710b: $14
	inc  d                                           ; $710c: $14
	inc  d                                           ; $710d: $14
	inc  d                                           ; $710e: $14
	inc  d                                           ; $710f: $14
	inc  d                                           ; $7110: $14
	inc  d                                           ; $7111: $14
	add  hl, bc                                      ; $7112: $09
	ld   [bc], a                                     ; $7113: $02
	ld   a, a                                        ; $7114: $7f
	ld   a, a                                        ; $7115: $7f
	ld   a, a                                        ; $7116: $7f
	ld   a, a                                        ; $7117: $7f
	ld   a, a                                        ; $7118: $7f
	ld   a, a                                        ; $7119: $7f
	ld   a, a                                        ; $711a: $7f
	ld   a, a                                        ; $711b: $7f
	ld   a, a                                        ; $711c: $7f
	ld   a, a                                        ; $711d: $7f
	ld   a, a                                        ; $711e: $7f
	ld   a, a                                        ; $711f: $7f
	ld   bc, $1409                                   ; $7120: $01 $09 $14
	inc  d                                           ; $7123: $14
	inc  d                                           ; $7124: $14
	inc  d                                           ; $7125: $14
	inc  d                                           ; $7126: $14
	inc  d                                           ; $7127: $14
	inc  d                                           ; $7128: $14
	inc  d                                           ; $7129: $14
	inc  d                                           ; $712a: $14
	inc  d                                           ; $712b: $14
	inc  d                                           ; $712c: $14
	inc  d                                           ; $712d: $14
	inc  d                                           ; $712e: $14
	inc  d                                           ; $712f: $14
	inc  d                                           ; $7130: $14
	inc  d                                           ; $7131: $14
	add  hl, bc                                      ; $7132: $09
	ld   bc, $7f7f                                   ; $7133: $01 $7f $7f
	ld   a, a                                        ; $7136: $7f
	ld   a, a                                        ; $7137: $7f
	ld   a, a                                        ; $7138: $7f
	ld   a, a                                        ; $7139: $7f
	ld   a, a                                        ; $713a: $7f
	ld   a, a                                        ; $713b: $7f
	ld   a, a                                        ; $713c: $7f
	ld   a, a                                        ; $713d: $7f
	ld   a, a                                        ; $713e: $7f
	ld   a, a                                        ; $713f: $7f
	ld   [bc], a                                     ; $7140: $02
	add  hl, bc                                      ; $7141: $09
	inc  d                                           ; $7142: $14
	inc  d                                           ; $7143: $14
	inc  d                                           ; $7144: $14
	inc  d                                           ; $7145: $14
	inc  d                                           ; $7146: $14
	inc  d                                           ; $7147: $14
	inc  d                                           ; $7148: $14
	inc  d                                           ; $7149: $14
	inc  d                                           ; $714a: $14
	inc  d                                           ; $714b: $14
	inc  d                                           ; $714c: $14
	inc  d                                           ; $714d: $14
	inc  d                                           ; $714e: $14
	inc  d                                           ; $714f: $14
	inc  d                                           ; $7150: $14
	inc  d                                           ; $7151: $14
	add  hl, bc                                      ; $7152: $09
	ld   [bc], a                                     ; $7153: $02
	ld   a, a                                        ; $7154: $7f
	ld   a, a                                        ; $7155: $7f
	ld   a, a                                        ; $7156: $7f
	ld   a, a                                        ; $7157: $7f
	ld   a, a                                        ; $7158: $7f
	ld   a, a                                        ; $7159: $7f
	ld   a, a                                        ; $715a: $7f
	ld   a, a                                        ; $715b: $7f
	ld   a, a                                        ; $715c: $7f
	ld   a, a                                        ; $715d: $7f
	ld   a, a                                        ; $715e: $7f
	ld   a, a                                        ; $715f: $7f
	ld   bc, $1409                                   ; $7160: $01 $09 $14
	inc  d                                           ; $7163: $14
	inc  d                                           ; $7164: $14
	inc  d                                           ; $7165: $14
	inc  d                                           ; $7166: $14
	inc  d                                           ; $7167: $14
	inc  d                                           ; $7168: $14
	inc  d                                           ; $7169: $14
	inc  d                                           ; $716a: $14
	inc  d                                           ; $716b: $14
	inc  d                                           ; $716c: $14
	inc  d                                           ; $716d: $14
	inc  d                                           ; $716e: $14
	inc  d                                           ; $716f: $14
	inc  d                                           ; $7170: $14
	inc  d                                           ; $7171: $14
	add  hl, bc                                      ; $7172: $09
	ld   bc, $7f7f                                   ; $7173: $01 $7f $7f
	ld   a, a                                        ; $7176: $7f
	ld   a, a                                        ; $7177: $7f
	ld   a, a                                        ; $7178: $7f
	ld   a, a                                        ; $7179: $7f
	ld   a, a                                        ; $717a: $7f
	ld   a, a                                        ; $717b: $7f
	ld   a, a                                        ; $717c: $7f
	ld   a, a                                        ; $717d: $7f
	ld   a, a                                        ; $717e: $7f
	ld   a, a                                        ; $717f: $7f
	ld   [bc], a                                     ; $7180: $02
	add  hl, bc                                      ; $7181: $09
	inc  d                                           ; $7182: $14
	inc  d                                           ; $7183: $14
	inc  d                                           ; $7184: $14
	inc  d                                           ; $7185: $14
	inc  d                                           ; $7186: $14
	inc  d                                           ; $7187: $14
	inc  d                                           ; $7188: $14
	inc  d                                           ; $7189: $14
	inc  d                                           ; $718a: $14
	inc  d                                           ; $718b: $14
	inc  d                                           ; $718c: $14
	inc  d                                           ; $718d: $14
	inc  d                                           ; $718e: $14
	inc  d                                           ; $718f: $14
	inc  d                                           ; $7190: $14
	inc  d                                           ; $7191: $14
	add  hl, bc                                      ; $7192: $09
	ld   [bc], a                                     ; $7193: $02
	ld   a, a                                        ; $7194: $7f
	ld   a, a                                        ; $7195: $7f
	ld   a, a                                        ; $7196: $7f
	ld   a, a                                        ; $7197: $7f
	ld   a, a                                        ; $7198: $7f
	ld   a, a                                        ; $7199: $7f
	ld   a, a                                        ; $719a: $7f
	ld   a, a                                        ; $719b: $7f
	ld   a, a                                        ; $719c: $7f
	ld   a, a                                        ; $719d: $7f
	ld   a, a                                        ; $719e: $7f
	ld   a, a                                        ; $719f: $7f
	ld   bc, $1409                                   ; $71a0: $01 $09 $14
	inc  d                                           ; $71a3: $14
	inc  d                                           ; $71a4: $14
	inc  d                                           ; $71a5: $14
	inc  d                                           ; $71a6: $14
	inc  d                                           ; $71a7: $14
	inc  d                                           ; $71a8: $14
	inc  d                                           ; $71a9: $14
	inc  d                                           ; $71aa: $14
	inc  d                                           ; $71ab: $14
	inc  d                                           ; $71ac: $14
	inc  d                                           ; $71ad: $14
	inc  d                                           ; $71ae: $14
	inc  d                                           ; $71af: $14
	inc  d                                           ; $71b0: $14
	inc  d                                           ; $71b1: $14
	add  hl, bc                                      ; $71b2: $09
	ld   bc, $7f7f                                   ; $71b3: $01 $7f $7f
	ld   a, a                                        ; $71b6: $7f
	ld   a, a                                        ; $71b7: $7f
	ld   a, a                                        ; $71b8: $7f
	ld   a, a                                        ; $71b9: $7f
	ld   a, a                                        ; $71ba: $7f
	ld   a, a                                        ; $71bb: $7f
	ld   a, a                                        ; $71bc: $7f
	ld   a, a                                        ; $71bd: $7f
	ld   a, a                                        ; $71be: $7f
	ld   a, a                                        ; $71bf: $7f
	dec  c                                           ; $71c0: $0d
	add  hl, bc                                      ; $71c1: $09
	inc  d                                           ; $71c2: $14
	inc  d                                           ; $71c3: $14
	inc  d                                           ; $71c4: $14
	inc  d                                           ; $71c5: $14
	inc  d                                           ; $71c6: $14
	inc  d                                           ; $71c7: $14
	inc  d                                           ; $71c8: $14
	inc  d                                           ; $71c9: $14
	inc  d                                           ; $71ca: $14
	inc  d                                           ; $71cb: $14
	inc  d                                           ; $71cc: $14
	inc  d                                           ; $71cd: $14
	inc  d                                           ; $71ce: $14
	inc  d                                           ; $71cf: $14
	inc  d                                           ; $71d0: $14
	inc  d                                           ; $71d1: $14
	add  hl, bc                                      ; $71d2: $09
	ld   [bc], a                                     ; $71d3: $02
	ld   a, a                                        ; $71d4: $7f
	ld   a, a                                        ; $71d5: $7f
	ld   a, a                                        ; $71d6: $7f
	ld   a, a                                        ; $71d7: $7f
	ld   a, a                                        ; $71d8: $7f
	ld   a, a                                        ; $71d9: $7f
	ld   a, a                                        ; $71da: $7f
	ld   a, a                                        ; $71db: $7f
	ld   a, a                                        ; $71dc: $7f
	ld   a, a                                        ; $71dd: $7f
	ld   a, a                                        ; $71de: $7f
	ld   a, a                                        ; $71df: $7f
	dec  e                                           ; $71e0: $1d
	add  hl, bc                                      ; $71e1: $09
	inc  d                                           ; $71e2: $14
	inc  d                                           ; $71e3: $14
	inc  d                                           ; $71e4: $14
	inc  d                                           ; $71e5: $14
	inc  d                                           ; $71e6: $14
	inc  d                                           ; $71e7: $14
	inc  d                                           ; $71e8: $14
	inc  d                                           ; $71e9: $14
	inc  d                                           ; $71ea: $14
	inc  d                                           ; $71eb: $14
	inc  d                                           ; $71ec: $14
	inc  d                                           ; $71ed: $14
	inc  d                                           ; $71ee: $14
	inc  d                                           ; $71ef: $14
	inc  d                                           ; $71f0: $14
	inc  d                                           ; $71f1: $14
	add  hl, bc                                      ; $71f2: $09
	ld   bc, $7f7f                                   ; $71f3: $01 $7f $7f
	ld   a, a                                        ; $71f6: $7f
	ld   a, a                                        ; $71f7: $7f
	ld   a, a                                        ; $71f8: $7f
	ld   a, a                                        ; $71f9: $7f
	ld   a, a                                        ; $71fa: $7f
	ld   a, a                                        ; $71fb: $7f
	ld   a, a                                        ; $71fc: $7f
	ld   a, a                                        ; $71fd: $7f
	ld   a, a                                        ; $71fe: $7f
	ld   a, a                                        ; $71ff: $7f
	inc  d                                           ; $7200: $14
	inc  d                                           ; $7201: $14
	inc  d                                           ; $7202: $14
	inc  d                                           ; $7203: $14
	inc  d                                           ; $7204: $14
	inc  d                                           ; $7205: $14
	inc  d                                           ; $7206: $14
	inc  d                                           ; $7207: $14
	inc  d                                           ; $7208: $14
	inc  d                                           ; $7209: $14
	inc  d                                           ; $720a: $14
	inc  d                                           ; $720b: $14
	inc  d                                           ; $720c: $14
	inc  d                                           ; $720d: $14
	inc  d                                           ; $720e: $14
	inc  de                                          ; $720f: $13
	ld   de, $1111                                   ; $7210: $11 $11 $11
	ld   de, $1111                                   ; $7213: $11 $11 $11
	ld   de, $1111                                   ; $7216: $11 $11 $11
	ld   de, $6f15                                   ; $7219: $11 $15 $6f
	ld   c, $0e                                      ; $721c: $0e $0e
	ld   c, $6f                                      ; $721e: $0e $6f
	inc  d                                           ; $7220: $14
	inc  d                                           ; $7221: $14
	inc  d                                           ; $7222: $14
	inc  d                                           ; $7223: $14
	inc  d                                           ; $7224: $14
	inc  d                                           ; $7225: $14
	inc  d                                           ; $7226: $14
	inc  d                                           ; $7227: $14
	inc  d                                           ; $7228: $14
	inc  d                                           ; $7229: $14
	inc  d                                           ; $722a: $14
	inc  d                                           ; $722b: $14
	inc  d                                           ; $722c: $14
	inc  d                                           ; $722d: $14
	inc  d                                           ; $722e: $14
	ld   [de], a                                     ; $722f: $12
	db   $10                                         ; $7230: $10
	db   $10                                         ; $7231: $10
	db   $10                                         ; $7232: $10
	db   $10                                         ; $7233: $10
	db   $10                                         ; $7234: $10
	db   $10                                         ; $7235: $10
	db   $10                                         ; $7236: $10
	db   $10                                         ; $7237: $10
	db   $10                                         ; $7238: $10
	db   $10                                         ; $7239: $10
	ld   d, $7f                                      ; $723a: $16 $7f
	ld   e, $1e                                      ; $723c: $1e $1e
	ld   e, $7f                                      ; $723e: $1e $7f
	rrca                                             ; $7240: $0f
	rrca                                             ; $7241: $0f
	rrca                                             ; $7242: $0f
	rrca                                             ; $7243: $0f
	rrca                                             ; $7244: $0f
	rrca                                             ; $7245: $0f
	rrca                                             ; $7246: $0f
	rrca                                             ; $7247: $0f
	rrca                                             ; $7248: $0f
	rrca                                             ; $7249: $0f
	rrca                                             ; $724a: $0f
	rrca                                             ; $724b: $0f
	rrca                                             ; $724c: $0f
	rrca                                             ; $724d: $0f
	rrca                                             ; $724e: $0f
	rrca                                             ; $724f: $0f
	rrca                                             ; $7250: $0f
	dec  c                                           ; $7251: $0d
	dec  c                                           ; $7252: $0d
	dec  c                                           ; $7253: $0d
	dec  c                                           ; $7254: $0d
	dec  c                                           ; $7255: $0d
	dec  c                                           ; $7256: $0d
	dec  c                                           ; $7257: $0d
	dec  c                                           ; $7258: $0d
	dec  c                                           ; $7259: $0d
	dec  c                                           ; $725a: $0d
	dec  c                                           ; $725b: $0d
	dec  c                                           ; $725c: $0d
	dec  c                                           ; $725d: $0d
	dec  c                                           ; $725e: $0d
	dec  c                                           ; $725f: $0d
	rrca                                             ; $7260: $0f
	rrca                                             ; $7261: $0f
	rrca                                             ; $7262: $0f
	rrca                                             ; $7263: $0f
	rrca                                             ; $7264: $0f
	rrca                                             ; $7265: $0f
	rrca                                             ; $7266: $0f
	rrca                                             ; $7267: $0f
	rrca                                             ; $7268: $0f
	rrca                                             ; $7269: $0f
	rrca                                             ; $726a: $0f
	rrca                                             ; $726b: $0f
	rrca                                             ; $726c: $0f
	rrca                                             ; $726d: $0f
	rrca                                             ; $726e: $0f
	rrca                                             ; $726f: $0f
	rrca                                             ; $7270: $0f
	dec  c                                           ; $7271: $0d
	dec  c                                           ; $7272: $0d
	dec  c                                           ; $7273: $0d
	dec  c                                           ; $7274: $0d
	dec  c                                           ; $7275: $0d
	dec  c                                           ; $7276: $0d
	dec  c                                           ; $7277: $0d
	dec  c                                           ; $7278: $0d
	dec  c                                           ; $7279: $0d
	dec  c                                           ; $727a: $0d
	dec  c                                           ; $727b: $0d
	dec  c                                           ; $727c: $0d
	dec  c                                           ; $727d: $0d
	dec  c                                           ; $727e: $0d
	dec  c                                           ; $727f: $0d
	dec  c                                           ; $7280: $0d
	dec  c                                           ; $7281: $0d
	dec  c                                           ; $7282: $0d
	dec  c                                           ; $7283: $0d
	dec  c                                           ; $7284: $0d
	dec  c                                           ; $7285: $0d
	dec  c                                           ; $7286: $0d
	dec  c                                           ; $7287: $0d
	dec  c                                           ; $7288: $0d
	dec  c                                           ; $7289: $0d
	dec  c                                           ; $728a: $0d
	dec  c                                           ; $728b: $0d
	dec  c                                           ; $728c: $0d
	dec  c                                           ; $728d: $0d
	dec  c                                           ; $728e: $0d
	dec  c                                           ; $728f: $0d
	dec  c                                           ; $7290: $0d
	dec  c                                           ; $7291: $0d
	dec  l                                           ; $7292: $2d
	dec  c                                           ; $7293: $0d
	db   $10                                         ; $7294: $10
	db   $10                                         ; $7295: $10
	db   $10                                         ; $7296: $10
	db   $10                                         ; $7297: $10
	db   $10                                         ; $7298: $10
	db   $10                                         ; $7299: $10
	db   $10                                         ; $729a: $10
	db   $10                                         ; $729b: $10
	db   $10                                         ; $729c: $10
	db   $10                                         ; $729d: $10
	db   $10                                         ; $729e: $10
	db   $10                                         ; $729f: $10
	inc  c                                           ; $72a0: $0c
	dec  c                                           ; $72a1: $0d
	dec  c                                           ; $72a2: $0d
	dec  c                                           ; $72a3: $0d
	dec  c                                           ; $72a4: $0d
	dec  c                                           ; $72a5: $0d
	dec  c                                           ; $72a6: $0d
	dec  c                                           ; $72a7: $0d
	dec  c                                           ; $72a8: $0d
	dec  c                                           ; $72a9: $0d
	dec  c                                           ; $72aa: $0d
	dec  c                                           ; $72ab: $0d
	dec  c                                           ; $72ac: $0d
	dec  c                                           ; $72ad: $0d
	dec  c                                           ; $72ae: $0d
	dec  c                                           ; $72af: $0d
	dec  c                                           ; $72b0: $0d
	dec  c                                           ; $72b1: $0d
	dec  l                                           ; $72b2: $2d
	dec  c                                           ; $72b3: $0d
	db   $10                                         ; $72b4: $10
	db   $10                                         ; $72b5: $10
	db   $10                                         ; $72b6: $10
	db   $10                                         ; $72b7: $10
	db   $10                                         ; $72b8: $10
	db   $10                                         ; $72b9: $10
	db   $10                                         ; $72ba: $10
	db   $10                                         ; $72bb: $10
	db   $10                                         ; $72bc: $10
	db   $10                                         ; $72bd: $10
	db   $10                                         ; $72be: $10
	db   $10                                         ; $72bf: $10
	dec  c                                           ; $72c0: $0d
	dec  c                                           ; $72c1: $0d
	dec  c                                           ; $72c2: $0d
	dec  c                                           ; $72c3: $0d
	dec  c                                           ; $72c4: $0d
	dec  c                                           ; $72c5: $0d
	dec  c                                           ; $72c6: $0d
	dec  c                                           ; $72c7: $0d
	dec  c                                           ; $72c8: $0d
	dec  c                                           ; $72c9: $0d
	dec  c                                           ; $72ca: $0d
	dec  c                                           ; $72cb: $0d
	dec  c                                           ; $72cc: $0d
	dec  c                                           ; $72cd: $0d
	dec  c                                           ; $72ce: $0d
	dec  c                                           ; $72cf: $0d
	dec  c                                           ; $72d0: $0d
	dec  c                                           ; $72d1: $0d
	dec  l                                           ; $72d2: $2d
	dec  l                                           ; $72d3: $2d
	db   $10                                         ; $72d4: $10
	db   $10                                         ; $72d5: $10
	db   $10                                         ; $72d6: $10
	db   $10                                         ; $72d7: $10
	db   $10                                         ; $72d8: $10
	db   $10                                         ; $72d9: $10
	db   $10                                         ; $72da: $10
	db   $10                                         ; $72db: $10
	db   $10                                         ; $72dc: $10
	db   $10                                         ; $72dd: $10
	db   $10                                         ; $72de: $10
	db   $10                                         ; $72df: $10
	inc  c                                           ; $72e0: $0c
	dec  c                                           ; $72e1: $0d
	dec  c                                           ; $72e2: $0d
	dec  c                                           ; $72e3: $0d
	dec  c                                           ; $72e4: $0d
	dec  c                                           ; $72e5: $0d
	dec  c                                           ; $72e6: $0d
	dec  c                                           ; $72e7: $0d
	dec  c                                           ; $72e8: $0d
	dec  c                                           ; $72e9: $0d
	dec  c                                           ; $72ea: $0d
	dec  c                                           ; $72eb: $0d
	dec  c                                           ; $72ec: $0d
	dec  c                                           ; $72ed: $0d
	dec  c                                           ; $72ee: $0d
	dec  c                                           ; $72ef: $0d
	dec  c                                           ; $72f0: $0d
	dec  c                                           ; $72f1: $0d
	dec  l                                           ; $72f2: $2d
	inc  l                                           ; $72f3: $2c
	db   $10                                         ; $72f4: $10
	db   $10                                         ; $72f5: $10
	db   $10                                         ; $72f6: $10
	db   $10                                         ; $72f7: $10
	db   $10                                         ; $72f8: $10
	db   $10                                         ; $72f9: $10
	db   $10                                         ; $72fa: $10
	db   $10                                         ; $72fb: $10
	db   $10                                         ; $72fc: $10
	db   $10                                         ; $72fd: $10
	db   $10                                         ; $72fe: $10
	db   $10                                         ; $72ff: $10
	dec  c                                           ; $7300: $0d
	dec  c                                           ; $7301: $0d
	dec  c                                           ; $7302: $0d
	dec  c                                           ; $7303: $0d
	dec  c                                           ; $7304: $0d
	dec  c                                           ; $7305: $0d
	dec  c                                           ; $7306: $0d
	dec  c                                           ; $7307: $0d
	dec  c                                           ; $7308: $0d
	dec  c                                           ; $7309: $0d
	dec  c                                           ; $730a: $0d
	dec  c                                           ; $730b: $0d
	dec  c                                           ; $730c: $0d
	dec  c                                           ; $730d: $0d
	dec  c                                           ; $730e: $0d
	dec  c                                           ; $730f: $0d
	dec  c                                           ; $7310: $0d
	dec  c                                           ; $7311: $0d
	dec  l                                           ; $7312: $2d
	dec  l                                           ; $7313: $2d
	db   $10                                         ; $7314: $10
	db   $10                                         ; $7315: $10
	db   $10                                         ; $7316: $10
	db   $10                                         ; $7317: $10
	db   $10                                         ; $7318: $10
	db   $10                                         ; $7319: $10
	db   $10                                         ; $731a: $10
	db   $10                                         ; $731b: $10
	db   $10                                         ; $731c: $10
	db   $10                                         ; $731d: $10
	db   $10                                         ; $731e: $10
	db   $10                                         ; $731f: $10
	inc  c                                           ; $7320: $0c
	dec  c                                           ; $7321: $0d
	dec  c                                           ; $7322: $0d
	dec  c                                           ; $7323: $0d
	dec  c                                           ; $7324: $0d
	dec  c                                           ; $7325: $0d
	dec  c                                           ; $7326: $0d
	dec  c                                           ; $7327: $0d
	dec  c                                           ; $7328: $0d
	dec  c                                           ; $7329: $0d
	dec  c                                           ; $732a: $0d
	dec  c                                           ; $732b: $0d
	dec  c                                           ; $732c: $0d
	dec  c                                           ; $732d: $0d
	dec  c                                           ; $732e: $0d
	dec  c                                           ; $732f: $0d
	dec  c                                           ; $7330: $0d
	dec  c                                           ; $7331: $0d
	dec  l                                           ; $7332: $2d
	inc  l                                           ; $7333: $2c
	db   $10                                         ; $7334: $10
	db   $10                                         ; $7335: $10
	db   $10                                         ; $7336: $10
	db   $10                                         ; $7337: $10
	db   $10                                         ; $7338: $10
	db   $10                                         ; $7339: $10
	db   $10                                         ; $733a: $10
	db   $10                                         ; $733b: $10
	db   $10                                         ; $733c: $10
	db   $10                                         ; $733d: $10
	db   $10                                         ; $733e: $10
	db   $10                                         ; $733f: $10
	dec  c                                           ; $7340: $0d
	dec  c                                           ; $7341: $0d
	dec  c                                           ; $7342: $0d
	dec  c                                           ; $7343: $0d
	dec  c                                           ; $7344: $0d
	dec  c                                           ; $7345: $0d
	dec  c                                           ; $7346: $0d
	dec  c                                           ; $7347: $0d
	dec  c                                           ; $7348: $0d
	dec  c                                           ; $7349: $0d
	dec  c                                           ; $734a: $0d
	dec  c                                           ; $734b: $0d
	dec  c                                           ; $734c: $0d
	dec  c                                           ; $734d: $0d
	dec  c                                           ; $734e: $0d
	dec  c                                           ; $734f: $0d
	dec  c                                           ; $7350: $0d
	dec  c                                           ; $7351: $0d
	dec  l                                           ; $7352: $2d
	dec  l                                           ; $7353: $2d
	db   $10                                         ; $7354: $10
	db   $10                                         ; $7355: $10
	db   $10                                         ; $7356: $10
	db   $10                                         ; $7357: $10
	db   $10                                         ; $7358: $10
	db   $10                                         ; $7359: $10
	db   $10                                         ; $735a: $10
	db   $10                                         ; $735b: $10
	db   $10                                         ; $735c: $10
	db   $10                                         ; $735d: $10
	db   $10                                         ; $735e: $10
	db   $10                                         ; $735f: $10
	inc  c                                           ; $7360: $0c
	dec  c                                           ; $7361: $0d
	dec  c                                           ; $7362: $0d
	dec  c                                           ; $7363: $0d
	dec  c                                           ; $7364: $0d
	dec  c                                           ; $7365: $0d
	dec  c                                           ; $7366: $0d
	dec  c                                           ; $7367: $0d
	dec  c                                           ; $7368: $0d
	dec  c                                           ; $7369: $0d
	dec  c                                           ; $736a: $0d
	dec  c                                           ; $736b: $0d
	dec  c                                           ; $736c: $0d
	dec  c                                           ; $736d: $0d
	dec  c                                           ; $736e: $0d
	dec  c                                           ; $736f: $0d
	dec  c                                           ; $7370: $0d
	dec  c                                           ; $7371: $0d
	dec  l                                           ; $7372: $2d
	inc  l                                           ; $7373: $2c
	db   $10                                         ; $7374: $10
	db   $10                                         ; $7375: $10
	db   $10                                         ; $7376: $10
	db   $10                                         ; $7377: $10
	db   $10                                         ; $7378: $10
	db   $10                                         ; $7379: $10
	db   $10                                         ; $737a: $10
	db   $10                                         ; $737b: $10
	db   $10                                         ; $737c: $10
	db   $10                                         ; $737d: $10
	db   $10                                         ; $737e: $10
	db   $10                                         ; $737f: $10
	dec  c                                           ; $7380: $0d
	dec  c                                           ; $7381: $0d
	dec  c                                           ; $7382: $0d
	dec  c                                           ; $7383: $0d
	dec  c                                           ; $7384: $0d
	dec  c                                           ; $7385: $0d
	dec  c                                           ; $7386: $0d
	dec  c                                           ; $7387: $0d
	dec  c                                           ; $7388: $0d
	dec  c                                           ; $7389: $0d
	dec  c                                           ; $738a: $0d
	dec  c                                           ; $738b: $0d
	dec  c                                           ; $738c: $0d
	dec  c                                           ; $738d: $0d
	dec  c                                           ; $738e: $0d
	dec  c                                           ; $738f: $0d
	dec  c                                           ; $7390: $0d
	dec  c                                           ; $7391: $0d
	dec  l                                           ; $7392: $2d
	dec  l                                           ; $7393: $2d
	db   $10                                         ; $7394: $10
	db   $10                                         ; $7395: $10
	db   $10                                         ; $7396: $10
	db   $10                                         ; $7397: $10
	db   $10                                         ; $7398: $10
	db   $10                                         ; $7399: $10
	db   $10                                         ; $739a: $10
	db   $10                                         ; $739b: $10
	db   $10                                         ; $739c: $10
	db   $10                                         ; $739d: $10
	db   $10                                         ; $739e: $10
	db   $10                                         ; $739f: $10
	inc  c                                           ; $73a0: $0c
	dec  c                                           ; $73a1: $0d
	dec  c                                           ; $73a2: $0d
	dec  c                                           ; $73a3: $0d
	dec  c                                           ; $73a4: $0d
	dec  c                                           ; $73a5: $0d
	dec  c                                           ; $73a6: $0d
	dec  c                                           ; $73a7: $0d
	dec  c                                           ; $73a8: $0d
	dec  c                                           ; $73a9: $0d
	dec  c                                           ; $73aa: $0d
	dec  c                                           ; $73ab: $0d
	dec  c                                           ; $73ac: $0d
	dec  c                                           ; $73ad: $0d
	dec  c                                           ; $73ae: $0d
	dec  c                                           ; $73af: $0d
	dec  c                                           ; $73b0: $0d
	dec  c                                           ; $73b1: $0d
	dec  l                                           ; $73b2: $2d
	inc  l                                           ; $73b3: $2c
	db   $10                                         ; $73b4: $10
	db   $10                                         ; $73b5: $10
	db   $10                                         ; $73b6: $10
	db   $10                                         ; $73b7: $10
	db   $10                                         ; $73b8: $10
	db   $10                                         ; $73b9: $10
	db   $10                                         ; $73ba: $10
	db   $10                                         ; $73bb: $10
	db   $10                                         ; $73bc: $10
	db   $10                                         ; $73bd: $10
	db   $10                                         ; $73be: $10
	db   $10                                         ; $73bf: $10
	dec  c                                           ; $73c0: $0d
	dec  c                                           ; $73c1: $0d
	dec  c                                           ; $73c2: $0d
	dec  c                                           ; $73c3: $0d
	dec  c                                           ; $73c4: $0d
	dec  c                                           ; $73c5: $0d
	dec  c                                           ; $73c6: $0d
	dec  c                                           ; $73c7: $0d
	dec  c                                           ; $73c8: $0d
	dec  c                                           ; $73c9: $0d
	dec  c                                           ; $73ca: $0d
	dec  c                                           ; $73cb: $0d
	dec  c                                           ; $73cc: $0d
	dec  c                                           ; $73cd: $0d
	dec  c                                           ; $73ce: $0d
	dec  c                                           ; $73cf: $0d
	dec  c                                           ; $73d0: $0d
	dec  c                                           ; $73d1: $0d
	dec  l                                           ; $73d2: $2d
	dec  l                                           ; $73d3: $2d
	db   $10                                         ; $73d4: $10
	db   $10                                         ; $73d5: $10
	db   $10                                         ; $73d6: $10
	db   $10                                         ; $73d7: $10
	db   $10                                         ; $73d8: $10
	db   $10                                         ; $73d9: $10
	db   $10                                         ; $73da: $10
	db   $10                                         ; $73db: $10
	db   $10                                         ; $73dc: $10
	db   $10                                         ; $73dd: $10
	db   $10                                         ; $73de: $10
	db   $10                                         ; $73df: $10
	inc  c                                           ; $73e0: $0c
	dec  c                                           ; $73e1: $0d
	dec  c                                           ; $73e2: $0d
	dec  c                                           ; $73e3: $0d
	dec  c                                           ; $73e4: $0d
	dec  c                                           ; $73e5: $0d
	dec  c                                           ; $73e6: $0d
	dec  c                                           ; $73e7: $0d
	dec  c                                           ; $73e8: $0d
	dec  c                                           ; $73e9: $0d
	dec  c                                           ; $73ea: $0d
	dec  c                                           ; $73eb: $0d
	dec  c                                           ; $73ec: $0d
	dec  c                                           ; $73ed: $0d
	dec  c                                           ; $73ee: $0d
	dec  c                                           ; $73ef: $0d
	dec  c                                           ; $73f0: $0d
	dec  c                                           ; $73f1: $0d
	dec  l                                           ; $73f2: $2d
	inc  l                                           ; $73f3: $2c
	db   $10                                         ; $73f4: $10
	db   $10                                         ; $73f5: $10
	db   $10                                         ; $73f6: $10
	db   $10                                         ; $73f7: $10
	db   $10                                         ; $73f8: $10
	db   $10                                         ; $73f9: $10
	db   $10                                         ; $73fa: $10
	db   $10                                         ; $73fb: $10
	db   $10                                         ; $73fc: $10
	db   $10                                         ; $73fd: $10
	db   $10                                         ; $73fe: $10
	db   $10                                         ; $73ff: $10
	dec  c                                           ; $7400: $0d
	dec  c                                           ; $7401: $0d
	dec  c                                           ; $7402: $0d
	dec  c                                           ; $7403: $0d
	dec  c                                           ; $7404: $0d
	dec  c                                           ; $7405: $0d
	dec  c                                           ; $7406: $0d
	dec  c                                           ; $7407: $0d
	dec  c                                           ; $7408: $0d
	dec  c                                           ; $7409: $0d
	dec  c                                           ; $740a: $0d
	dec  c                                           ; $740b: $0d
	dec  c                                           ; $740c: $0d
	dec  c                                           ; $740d: $0d
	dec  c                                           ; $740e: $0d
	dec  c                                           ; $740f: $0d
	dec  c                                           ; $7410: $0d
	dec  c                                           ; $7411: $0d
	dec  l                                           ; $7412: $2d
	dec  l                                           ; $7413: $2d
	db   $10                                         ; $7414: $10
	db   $10                                         ; $7415: $10
	db   $10                                         ; $7416: $10
	db   $10                                         ; $7417: $10
	db   $10                                         ; $7418: $10
	db   $10                                         ; $7419: $10
	db   $10                                         ; $741a: $10
	db   $10                                         ; $741b: $10
	db   $10                                         ; $741c: $10
	db   $10                                         ; $741d: $10
	db   $10                                         ; $741e: $10
	db   $10                                         ; $741f: $10
	dec  c                                           ; $7420: $0d
	dec  c                                           ; $7421: $0d
	dec  c                                           ; $7422: $0d
	dec  c                                           ; $7423: $0d
	dec  c                                           ; $7424: $0d
	dec  c                                           ; $7425: $0d
	dec  c                                           ; $7426: $0d
	dec  c                                           ; $7427: $0d
	dec  c                                           ; $7428: $0d
	dec  c                                           ; $7429: $0d
	dec  c                                           ; $742a: $0d
	dec  c                                           ; $742b: $0d
	dec  c                                           ; $742c: $0d
	dec  c                                           ; $742d: $0d
	dec  c                                           ; $742e: $0d
	dec  c                                           ; $742f: $0d
	dec  c                                           ; $7430: $0d
	dec  c                                           ; $7431: $0d
	dec  l                                           ; $7432: $2d
	inc  l                                           ; $7433: $2c
	db   $10                                         ; $7434: $10
	db   $10                                         ; $7435: $10
	db   $10                                         ; $7436: $10
	db   $10                                         ; $7437: $10
	db   $10                                         ; $7438: $10
	db   $10                                         ; $7439: $10
	db   $10                                         ; $743a: $10
	db   $10                                         ; $743b: $10
	db   $10                                         ; $743c: $10
	db   $10                                         ; $743d: $10
	db   $10                                         ; $743e: $10
	db   $10                                         ; $743f: $10
	dec  c                                           ; $7440: $0d
	dec  c                                           ; $7441: $0d
	dec  c                                           ; $7442: $0d
	dec  c                                           ; $7443: $0d
	dec  c                                           ; $7444: $0d
	dec  c                                           ; $7445: $0d
	dec  c                                           ; $7446: $0d
	dec  c                                           ; $7447: $0d
	dec  c                                           ; $7448: $0d
	dec  c                                           ; $7449: $0d
	dec  c                                           ; $744a: $0d
	dec  c                                           ; $744b: $0d
	dec  c                                           ; $744c: $0d
	dec  c                                           ; $744d: $0d
	dec  c                                           ; $744e: $0d
	cpl                                              ; $744f: $2f
	ld   c, a                                        ; $7450: $4f
	ld   c, a                                        ; $7451: $4f
	ld   c, a                                        ; $7452: $4f
	ld   c, a                                        ; $7453: $4f
	ld   c, a                                        ; $7454: $4f
	ld   c, a                                        ; $7455: $4f
	ld   c, a                                        ; $7456: $4f
	ld   c, a                                        ; $7457: $4f
	ld   c, a                                        ; $7458: $4f
	ld   c, a                                        ; $7459: $4f
	ld   c, a                                        ; $745a: $4f
	ld   c, $0e                                      ; $745b: $0e $0e
	ld   c, $0e                                      ; $745d: $0e $0e
	ld   l, $0d                                      ; $745f: $2e $0d
	dec  c                                           ; $7461: $0d
	dec  c                                           ; $7462: $0d
	dec  c                                           ; $7463: $0d
	dec  c                                           ; $7464: $0d
	dec  c                                           ; $7465: $0d
	dec  c                                           ; $7466: $0d
	dec  c                                           ; $7467: $0d
	dec  c                                           ; $7468: $0d
	dec  c                                           ; $7469: $0d
	dec  c                                           ; $746a: $0d
	dec  c                                           ; $746b: $0d
	dec  c                                           ; $746c: $0d
	dec  c                                           ; $746d: $0d
	dec  c                                           ; $746e: $0d
	cpl                                              ; $746f: $2f
	rrca                                             ; $7470: $0f
	rrca                                             ; $7471: $0f
	rrca                                             ; $7472: $0f
	rrca                                             ; $7473: $0f
	rrca                                             ; $7474: $0f
	rrca                                             ; $7475: $0f
	rrca                                             ; $7476: $0f
	rrca                                             ; $7477: $0f
	rrca                                             ; $7478: $0f
	rrca                                             ; $7479: $0f
	rrca                                             ; $747a: $0f
	ld   c, $0e                                      ; $747b: $0e $0e
	ld   c, $0e                                      ; $747d: $0e $0e
	ld   l, $d1                                      ; $747f: $2e $d1
	ld   e, d                                        ; $7481: $5a
	or   c                                           ; $7482: $b1
	ld   de, $04ae                                   ; $7483: $11 $ae $04
	ld   h, [hl]                                     ; $7486: $66
	nop                                              ; $7487: $00
	db   $f4                                         ; $7488: $f4
	ld   d, d                                        ; $7489: $52
	dec  c                                           ; $748a: $0d
	ld   a, [hl-]                                    ; $748b: $3a
	jp   $2028                                       ; $748c: $c3 $28 $20


	inc  b                                           ; $748f: $04
	di                                               ; $7490: $f3
	ld   d, [hl]                                     ; $7491: $56
	ld   c, l                                        ; $7492: $4d
	ld   a, $26                                      ; $7493: $3e $26
	ld   de, $0440                                   ; $7495: $11 $40 $04
	db   $eb                                         ; $7498: $eb
	rra                                              ; $7499: $1f
	dec  l                                           ; $749a: $2d
	ld   b, d                                        ; $749b: $42
	ld   b, a                                        ; $749c: $47
	dec  h                                           ; $749d: $25
	add  d                                           ; $749e: $82
	ld   [$0440], sp                                 ; $749f: $08 $40 $04
	rst  $38                                         ; $74a2: $ff
	inc  bc                                          ; $74a3: $03
	ld   d, $02                                      ; $74a4: $16 $02
	xor  b                                           ; $74a6: $a8
	nop                                              ; $74a7: $00
	rst  $38                                         ; $74a8: $ff
	ld   a, a                                        ; $74a9: $7f
	ld   [hl], e                                     ; $74aa: $73
	ld   c, [hl]                                     ; $74ab: $4e
	ld   [$0021], sp                                 ; $74ac: $08 $21 $00
	nop                                              ; $74af: $00
	rst  $38                                         ; $74b0: $ff
	ld   a, c                                        ; $74b1: $79
	inc  de                                          ; $74b2: $13
	ld   c, b                                        ; $74b3: $48
	dec  c                                           ; $74b4: $0d
	inc  l                                           ; $74b5: $2c
	inc  b                                           ; $74b6: $04
	ld   [$5fee], sp                                 ; $74b7: $08 $ee $5f
	ld   h, b                                        ; $74ba: $60
	ld   [hl-], a                                    ; $74bb: $32
	ld   b, b                                        ; $74bc: $40
	add  hl, de                                      ; $74bd: $19
	nop                                              ; $74be: $00
	nop                                              ; $74bf: $00
	add  a                                           ; $74c0: $87
	ld   sp, $00a9                                   ; $74c1: $31 $a9 $00
	ld   b, $00                                      ; $74c4: $06 $00
	ld   bc, $aa00                                   ; $74c6: $01 $00 $aa
	add  hl, hl                                      ; $74c9: $29
	dec  b                                           ; $74ca: $05
	add  hl, de                                      ; $74cb: $19
	jr   nz, jr_095_74e2                             ; $74cc: $20 $14

	nop                                              ; $74ce: $00
	nop                                              ; $74cf: $00
	ld   h, a                                        ; $74d0: $67
	dec  h                                           ; $74d1: $25
	jp   nz, Jump_095_6010                           ; $74d2: $c2 $10 $60

	nop                                              ; $74d5: $00
	nop                                              ; $74d6: $00
	nop                                              ; $74d7: $00
	add  h                                           ; $74d8: $84
	ld   [bc], a                                     ; $74d9: $02
	ld   l, b                                        ; $74da: $68
	add  hl, hl                                      ; $74db: $29
	jp   $0010                                      ; $74dc: $c3 $10 $00


	nop                                              ; $74df: $00
	ld   b, b                                        ; $74e0: $40

jr_095_74e1:
	inc  b                                           ; $74e1: $04

jr_095_74e2:
	rst  $38                                         ; $74e2: $ff
	inc  bc                                          ; $74e3: $03
	ld   d, $02                                      ; $74e4: $16 $02
	xor  b                                           ; $74e6: $a8
	nop                                              ; $74e7: $00
	rst  $38                                         ; $74e8: $ff
	ld   a, a                                        ; $74e9: $7f
	ld   [hl], e                                     ; $74ea: $73
	ld   c, [hl]                                     ; $74eb: $4e
	ld   [$0021], sp                                 ; $74ec: $08 $21 $00
	nop                                              ; $74ef: $00
	rst  $38                                         ; $74f0: $ff
	ld   a, c                                        ; $74f1: $79
	inc  de                                          ; $74f2: $13
	ld   c, b                                        ; $74f3: $48
	dec  c                                           ; $74f4: $0d
	inc  l                                           ; $74f5: $2c
	inc  b                                           ; $74f6: $04
	ld   [$5fee], sp                                 ; $74f7: $08 $ee $5f
	ld   h, b                                        ; $74fa: $60
	ld   [hl-], a                                    ; $74fb: $32
	ld   b, b                                        ; $74fc: $40
	add  hl, de                                      ; $74fd: $19
	nop                                              ; $74fe: $00
	nop                                              ; $74ff: $00
	nop                                              ; $7500: $00
	nop                                              ; $7501: $00
	rst  $38                                         ; $7502: $ff
	ld   a, a                                        ; $7503: $7f
	adc  $39                                         ; $7504: $ce $39
	and  l                                           ; $7506: $a5
	inc  d                                           ; $7507: $14
	nop                                              ; $7508: $00
	nop                                              ; $7509: $00
	rra                                              ; $750a: $1f
	inc  bc                                          ; $750b: $03
	ld   d, c                                        ; $750c: $51
	ld   bc, $00a9                                   ; $750d: $01 $a9 $00
	nop                                              ; $7510: $00
	nop                                              ; $7511: $00
	ccf                                              ; $7512: $3f
	ld   [bc], a                                     ; $7513: $02
	ld   de, $8700                                   ; $7514: $11 $00 $87
	nop                                              ; $7517: $00
	rla                                              ; $7518: $17
	ld   e, b                                        ; $7519: $58
	cp   e                                           ; $751a: $bb
	ld   [hl+], a                                    ; $751b: $22
	rra                                              ; $751c: $1f
	nop                                              ; $751d: $00
	xor  l                                           ; $751e: $ad
	dec  [hl]                                        ; $751f: $35
	rla                                              ; $7520: $17

jr_095_7521:
	ld   e, b                                        ; $7521: $58
	dec  d                                           ; $7522: $15
	ld   [bc], a                                     ; $7523: $02
	ld   [de], a                                     ; $7524: $12
	nop                                              ; $7525: $00
	rst  $20                                         ; $7526: $e7
	jr   jr_095_7529                                 ; $7527: $18 $00

jr_095_7529:
	nop                                              ; $7529: $00
	rra                                              ; $752a: $1f
	nop                                              ; $752b: $00
	ld   a, [bc]                                     ; $752c: $0a
	nop                                              ; $752d: $00
	rst  $38                                         ; $752e: $ff
	inc  bc                                          ; $752f: $03
	ret  nz                                          ; $7530: $c0

	ld   [bc], a                                     ; $7531: $02
	nop                                              ; $7532: $00
	ld   a, h                                        ; $7533: $7c
	nop                                              ; $7534: $00
	jr   z, jr_095_74e1                              ; $7535: $28 $aa

	nop                                              ; $7537: $00
	nop                                              ; $7538: $00
	nop                                              ; $7539: $00
	ld   c, d                                        ; $753a: $4a
	add  hl, hl                                      ; $753b: $29
	or   l                                           ; $753c: $b5
	ld   d, [hl]                                     ; $753d: $56
	rst  $38                                         ; $753e: $ff
	ld   a, a                                        ; $753f: $7f
	nop                                              ; $7540: $00
	nop                                              ; $7541: $00
	rst  $38                                         ; $7542: $ff
	ld   a, a                                        ; $7543: $7f
	adc  $39                                         ; $7544: $ce $39
	and  l                                           ; $7546: $a5
	inc  d                                           ; $7547: $14
	nop                                              ; $7548: $00
	nop                                              ; $7549: $00
	rra                                              ; $754a: $1f
	inc  bc                                          ; $754b: $03
	ld   d, c                                        ; $754c: $51
	ld   bc, $00a9                                   ; $754d: $01 $a9 $00
	nop                                              ; $7550: $00
	nop                                              ; $7551: $00
	ccf                                              ; $7552: $3f
	ld   [bc], a                                     ; $7553: $02
	ld   de, $8700                                   ; $7554: $11 $00 $87
	nop                                              ; $7557: $00
	rla                                              ; $7558: $17
	ld   e, b                                        ; $7559: $58
	sub  h                                           ; $755a: $94
	ld   d, d                                        ; $755b: $52
	ld   h, b                                        ; $755c: $60
	ld   l, l                                        ; $755d: $6d
	xor  l                                           ; $755e: $ad
	dec  [hl]                                        ; $755f: $35
	rla                                              ; $7560: $17

jr_095_7561:
	ld   e, b                                        ; $7561: $58
	adc  $39                                         ; $7562: $ce $39
	ret  nz                                          ; $7564: $c0

	ld   c, h                                        ; $7565: $4c
	rst  $20                                         ; $7566: $e7
	jr   jr_095_7569                                 ; $7567: $18 $00

jr_095_7569:
	nop                                              ; $7569: $00
	rra                                              ; $756a: $1f
	nop                                              ; $756b: $00
	ld   a, [bc]                                     ; $756c: $0a
	nop                                              ; $756d: $00
	rst  $38                                         ; $756e: $ff
	inc  bc                                          ; $756f: $03
	ret  nz                                          ; $7570: $c0

	ld   [bc], a                                     ; $7571: $02
	nop                                              ; $7572: $00
	ld   a, h                                        ; $7573: $7c
	nop                                              ; $7574: $00
	jr   z, jr_095_7521                              ; $7575: $28 $aa

	nop                                              ; $7577: $00
	nop                                              ; $7578: $00
	nop                                              ; $7579: $00
	ld   c, d                                        ; $757a: $4a
	add  hl, hl                                      ; $757b: $29
	or   l                                           ; $757c: $b5
	ld   d, [hl]                                     ; $757d: $56
	rst  $38                                         ; $757e: $ff
	ld   a, a                                        ; $757f: $7f
	nop                                              ; $7580: $00
	nop                                              ; $7581: $00
	rst  $38                                         ; $7582: $ff
	ld   a, a                                        ; $7583: $7f
	adc  $39                                         ; $7584: $ce $39
	and  l                                           ; $7586: $a5
	inc  d                                           ; $7587: $14
	nop                                              ; $7588: $00
	nop                                              ; $7589: $00
	rra                                              ; $758a: $1f
	inc  bc                                          ; $758b: $03
	ld   d, c                                        ; $758c: $51
	ld   bc, $00a9                                   ; $758d: $01 $a9 $00
	nop                                              ; $7590: $00
	nop                                              ; $7591: $00
	ccf                                              ; $7592: $3f
	ld   [bc], a                                     ; $7593: $02
	ld   de, $8700                                   ; $7594: $11 $00 $87
	nop                                              ; $7597: $00
	rla                                              ; $7598: $17
	ld   e, b                                        ; $7599: $58
	rst  $38                                         ; $759a: $ff
	ld   a, a                                        ; $759b: $7f
	or   l                                           ; $759c: $b5
	ld   hl, $35ad                                   ; $759d: $21 $ad $35
	rla                                              ; $75a0: $17

jr_095_75a1:
	ld   e, b                                        ; $75a1: $58
	sub  h                                           ; $75a2: $94
	ld   d, d                                        ; $75a3: $52
	db   $ec                                         ; $75a4: $ec
	inc  c                                           ; $75a5: $0c
	rst  $20                                         ; $75a6: $e7
	jr   jr_095_75a9                                 ; $75a7: $18 $00

jr_095_75a9:
	nop                                              ; $75a9: $00
	rra                                              ; $75aa: $1f
	nop                                              ; $75ab: $00
	ld   a, [bc]                                     ; $75ac: $0a
	nop                                              ; $75ad: $00
	rst  $38                                         ; $75ae: $ff
	inc  bc                                          ; $75af: $03
	ret  nz                                          ; $75b0: $c0

	ld   [bc], a                                     ; $75b1: $02
	nop                                              ; $75b2: $00
	ld   a, h                                        ; $75b3: $7c
	nop                                              ; $75b4: $00
	jr   z, jr_095_7561                              ; $75b5: $28 $aa

	nop                                              ; $75b7: $00
	nop                                              ; $75b8: $00
	nop                                              ; $75b9: $00
	ld   c, d                                        ; $75ba: $4a
	add  hl, hl                                      ; $75bb: $29
	or   l                                           ; $75bc: $b5
	ld   d, [hl]                                     ; $75bd: $56
	rst  $38                                         ; $75be: $ff
	ld   a, a                                        ; $75bf: $7f
	nop                                              ; $75c0: $00
	nop                                              ; $75c1: $00
	rst  $38                                         ; $75c2: $ff
	ld   a, a                                        ; $75c3: $7f
	adc  $39                                         ; $75c4: $ce $39
	and  l                                           ; $75c6: $a5
	inc  d                                           ; $75c7: $14
	nop                                              ; $75c8: $00
	nop                                              ; $75c9: $00
	rra                                              ; $75ca: $1f
	inc  bc                                          ; $75cb: $03
	ld   d, c                                        ; $75cc: $51
	ld   bc, $00a9                                   ; $75cd: $01 $a9 $00
	nop                                              ; $75d0: $00
	nop                                              ; $75d1: $00
	ccf                                              ; $75d2: $3f
	ld   [bc], a                                     ; $75d3: $02
	ld   de, $8700                                   ; $75d4: $11 $00 $87
	nop                                              ; $75d7: $00
	rla                                              ; $75d8: $17
	ld   e, b                                        ; $75d9: $58
	sub  h                                           ; $75da: $94
	ld   d, d                                        ; $75db: $52
	and  b                                           ; $75dc: $a0
	inc  bc                                          ; $75dd: $03
	xor  l                                           ; $75de: $ad
	dec  [hl]                                        ; $75df: $35
	rla                                              ; $75e0: $17
	ld   e, b                                        ; $75e1: $58
	adc  $39                                         ; $75e2: $ce $39
	ldh  [rSB], a                                    ; $75e4: $e0 $01
	rst  $20                                         ; $75e6: $e7
	jr   jr_095_75e9                                 ; $75e7: $18 $00

jr_095_75e9:
	nop                                              ; $75e9: $00
	rra                                              ; $75ea: $1f
	nop                                              ; $75eb: $00
	ld   a, [bc]                                     ; $75ec: $0a
	nop                                              ; $75ed: $00
	rst  $38                                         ; $75ee: $ff
	inc  bc                                          ; $75ef: $03
	ret  nz                                          ; $75f0: $c0

	ld   [bc], a                                     ; $75f1: $02
	nop                                              ; $75f2: $00
	ld   a, h                                        ; $75f3: $7c
	nop                                              ; $75f4: $00
	jr   z, jr_095_75a1                              ; $75f5: $28 $aa

	nop                                              ; $75f7: $00
	nop                                              ; $75f8: $00
	nop                                              ; $75f9: $00
	ld   c, d                                        ; $75fa: $4a
	add  hl, hl                                      ; $75fb: $29
	or   l                                           ; $75fc: $b5
	ld   d, [hl]                                     ; $75fd: $56
	rst  $38                                         ; $75fe: $ff
	ld   a, a                                        ; $75ff: $7f
	nop                                              ; $7600: $00
	nop                                              ; $7601: $00
	nop                                              ; $7602: $00
	nop                                              ; $7603: $00
	nop                                              ; $7604: $00
	nop                                              ; $7605: $00
	nop                                              ; $7606: $00
	nop                                              ; $7607: $00
	nop                                              ; $7608: $00
	nop                                              ; $7609: $00
	nop                                              ; $760a: $00
	nop                                              ; $760b: $00
	nop                                              ; $760c: $00
	nop                                              ; $760d: $00
	nop                                              ; $760e: $00
	nop                                              ; $760f: $00
	nop                                              ; $7610: $00
	nop                                              ; $7611: $00
	nop                                              ; $7612: $00
	nop                                              ; $7613: $00
	nop                                              ; $7614: $00
	nop                                              ; $7615: $00
	nop                                              ; $7616: $00
	nop                                              ; $7617: $00
	nop                                              ; $7618: $00
	nop                                              ; $7619: $00
	nop                                              ; $761a: $00
	nop                                              ; $761b: $00
	nop                                              ; $761c: $00
	nop                                              ; $761d: $00
	nop                                              ; $761e: $00
	nop                                              ; $761f: $00
	nop                                              ; $7620: $00
	nop                                              ; $7621: $00
	nop                                              ; $7622: $00
	nop                                              ; $7623: $00
	nop                                              ; $7624: $00
	nop                                              ; $7625: $00
	nop                                              ; $7626: $00
	nop                                              ; $7627: $00
	nop                                              ; $7628: $00
	nop                                              ; $7629: $00
	nop                                              ; $762a: $00
	nop                                              ; $762b: $00
	nop                                              ; $762c: $00
	nop                                              ; $762d: $00
	nop                                              ; $762e: $00
	nop                                              ; $762f: $00
	nop                                              ; $7630: $00
	nop                                              ; $7631: $00
	nop                                              ; $7632: $00
	nop                                              ; $7633: $00
	nop                                              ; $7634: $00
	nop                                              ; $7635: $00
	nop                                              ; $7636: $00
	nop                                              ; $7637: $00
	nop                                              ; $7638: $00
	nop                                              ; $7639: $00
	nop                                              ; $763a: $00
	nop                                              ; $763b: $00
	nop                                              ; $763c: $00
	nop                                              ; $763d: $00
	nop                                              ; $763e: $00
	nop                                              ; $763f: $00
	nop                                              ; $7640: $00
	nop                                              ; $7641: $00
	nop                                              ; $7642: $00
	nop                                              ; $7643: $00
	nop                                              ; $7644: $00
	nop                                              ; $7645: $00
	nop                                              ; $7646: $00
	nop                                              ; $7647: $00
	nop                                              ; $7648: $00
	nop                                              ; $7649: $00
	nop                                              ; $764a: $00
	nop                                              ; $764b: $00
	nop                                              ; $764c: $00
	nop                                              ; $764d: $00
	nop                                              ; $764e: $00
	nop                                              ; $764f: $00
	nop                                              ; $7650: $00
	nop                                              ; $7651: $00
	nop                                              ; $7652: $00
	nop                                              ; $7653: $00
	nop                                              ; $7654: $00
	nop                                              ; $7655: $00
	nop                                              ; $7656: $00
	nop                                              ; $7657: $00
	nop                                              ; $7658: $00
	nop                                              ; $7659: $00
	nop                                              ; $765a: $00
	nop                                              ; $765b: $00
	nop                                              ; $765c: $00
	nop                                              ; $765d: $00
	nop                                              ; $765e: $00
	nop                                              ; $765f: $00
	nop                                              ; $7660: $00
	nop                                              ; $7661: $00
	nop                                              ; $7662: $00
	nop                                              ; $7663: $00
	nop                                              ; $7664: $00
	nop                                              ; $7665: $00
	nop                                              ; $7666: $00
	nop                                              ; $7667: $00
	nop                                              ; $7668: $00
	nop                                              ; $7669: $00
	nop                                              ; $766a: $00
	nop                                              ; $766b: $00
	nop                                              ; $766c: $00
	nop                                              ; $766d: $00
	nop                                              ; $766e: $00
	nop                                              ; $766f: $00
	nop                                              ; $7670: $00
	nop                                              ; $7671: $00
	nop                                              ; $7672: $00
	nop                                              ; $7673: $00
	nop                                              ; $7674: $00
	nop                                              ; $7675: $00
	nop                                              ; $7676: $00
	nop                                              ; $7677: $00
	nop                                              ; $7678: $00
	nop                                              ; $7679: $00
	nop                                              ; $767a: $00
	nop                                              ; $767b: $00
	nop                                              ; $767c: $00
	nop                                              ; $767d: $00
	nop                                              ; $767e: $00
	nop                                              ; $767f: $00
	nop                                              ; $7680: $00
	nop                                              ; $7681: $00
	nop                                              ; $7682: $00
	nop                                              ; $7683: $00
	nop                                              ; $7684: $00
	nop                                              ; $7685: $00
	nop                                              ; $7686: $00
	nop                                              ; $7687: $00
	nop                                              ; $7688: $00
	nop                                              ; $7689: $00
	nop                                              ; $768a: $00
	nop                                              ; $768b: $00
	nop                                              ; $768c: $00
	nop                                              ; $768d: $00
	nop                                              ; $768e: $00
	nop                                              ; $768f: $00
	nop                                              ; $7690: $00
	nop                                              ; $7691: $00
	nop                                              ; $7692: $00
	nop                                              ; $7693: $00
	nop                                              ; $7694: $00
	nop                                              ; $7695: $00
	nop                                              ; $7696: $00
	nop                                              ; $7697: $00
	nop                                              ; $7698: $00
	nop                                              ; $7699: $00
	nop                                              ; $769a: $00
	nop                                              ; $769b: $00
	nop                                              ; $769c: $00
	nop                                              ; $769d: $00
	nop                                              ; $769e: $00
	nop                                              ; $769f: $00
	nop                                              ; $76a0: $00
	nop                                              ; $76a1: $00
	nop                                              ; $76a2: $00
	nop                                              ; $76a3: $00
	nop                                              ; $76a4: $00
	nop                                              ; $76a5: $00
	nop                                              ; $76a6: $00
	nop                                              ; $76a7: $00
	nop                                              ; $76a8: $00
	nop                                              ; $76a9: $00
	nop                                              ; $76aa: $00
	nop                                              ; $76ab: $00
	nop                                              ; $76ac: $00
	nop                                              ; $76ad: $00
	nop                                              ; $76ae: $00
	nop                                              ; $76af: $00
	nop                                              ; $76b0: $00
	nop                                              ; $76b1: $00
	nop                                              ; $76b2: $00
	nop                                              ; $76b3: $00
	nop                                              ; $76b4: $00
	nop                                              ; $76b5: $00
	nop                                              ; $76b6: $00
	nop                                              ; $76b7: $00
	nop                                              ; $76b8: $00
	nop                                              ; $76b9: $00
	nop                                              ; $76ba: $00
	nop                                              ; $76bb: $00
	nop                                              ; $76bc: $00
	nop                                              ; $76bd: $00
	nop                                              ; $76be: $00
	nop                                              ; $76bf: $00
	nop                                              ; $76c0: $00
	nop                                              ; $76c1: $00
	nop                                              ; $76c2: $00
	nop                                              ; $76c3: $00
	nop                                              ; $76c4: $00
	nop                                              ; $76c5: $00
	nop                                              ; $76c6: $00
	nop                                              ; $76c7: $00
	nop                                              ; $76c8: $00
	nop                                              ; $76c9: $00
	nop                                              ; $76ca: $00
	nop                                              ; $76cb: $00
	nop                                              ; $76cc: $00
	nop                                              ; $76cd: $00
	nop                                              ; $76ce: $00
	nop                                              ; $76cf: $00
	nop                                              ; $76d0: $00
	nop                                              ; $76d1: $00
	nop                                              ; $76d2: $00
	nop                                              ; $76d3: $00
	nop                                              ; $76d4: $00
	nop                                              ; $76d5: $00
	nop                                              ; $76d6: $00
	nop                                              ; $76d7: $00
	nop                                              ; $76d8: $00
	nop                                              ; $76d9: $00
	nop                                              ; $76da: $00
	nop                                              ; $76db: $00
	nop                                              ; $76dc: $00
	nop                                              ; $76dd: $00
	nop                                              ; $76de: $00
	nop                                              ; $76df: $00
	nop                                              ; $76e0: $00
	nop                                              ; $76e1: $00
	nop                                              ; $76e2: $00
	nop                                              ; $76e3: $00
	nop                                              ; $76e4: $00
	nop                                              ; $76e5: $00
	nop                                              ; $76e6: $00
	nop                                              ; $76e7: $00
	nop                                              ; $76e8: $00
	nop                                              ; $76e9: $00
	nop                                              ; $76ea: $00
	nop                                              ; $76eb: $00
	nop                                              ; $76ec: $00
	nop                                              ; $76ed: $00
	nop                                              ; $76ee: $00
	nop                                              ; $76ef: $00
	nop                                              ; $76f0: $00
	nop                                              ; $76f1: $00
	nop                                              ; $76f2: $00
	nop                                              ; $76f3: $00
	nop                                              ; $76f4: $00
	nop                                              ; $76f5: $00
	nop                                              ; $76f6: $00
	nop                                              ; $76f7: $00
	nop                                              ; $76f8: $00
	nop                                              ; $76f9: $00
	nop                                              ; $76fa: $00
	nop                                              ; $76fb: $00
	nop                                              ; $76fc: $00
	nop                                              ; $76fd: $00
	nop                                              ; $76fe: $00
	nop                                              ; $76ff: $00
	nop                                              ; $7700: $00
	nop                                              ; $7701: $00
	nop                                              ; $7702: $00
	nop                                              ; $7703: $00
	nop                                              ; $7704: $00
	nop                                              ; $7705: $00
	nop                                              ; $7706: $00
	nop                                              ; $7707: $00
	nop                                              ; $7708: $00
	nop                                              ; $7709: $00
	nop                                              ; $770a: $00
	nop                                              ; $770b: $00
	nop                                              ; $770c: $00
	nop                                              ; $770d: $00
	nop                                              ; $770e: $00
	nop                                              ; $770f: $00
	nop                                              ; $7710: $00
	nop                                              ; $7711: $00
	nop                                              ; $7712: $00
	nop                                              ; $7713: $00
	nop                                              ; $7714: $00
	nop                                              ; $7715: $00
	nop                                              ; $7716: $00
	nop                                              ; $7717: $00
	nop                                              ; $7718: $00
	nop                                              ; $7719: $00
	nop                                              ; $771a: $00
	nop                                              ; $771b: $00
	nop                                              ; $771c: $00
	nop                                              ; $771d: $00
	nop                                              ; $771e: $00
	nop                                              ; $771f: $00
	nop                                              ; $7720: $00
	nop                                              ; $7721: $00
	nop                                              ; $7722: $00
	nop                                              ; $7723: $00
	nop                                              ; $7724: $00
	nop                                              ; $7725: $00
	nop                                              ; $7726: $00
	nop                                              ; $7727: $00
	nop                                              ; $7728: $00
	nop                                              ; $7729: $00
	nop                                              ; $772a: $00
	nop                                              ; $772b: $00
	nop                                              ; $772c: $00
	nop                                              ; $772d: $00
	nop                                              ; $772e: $00
	nop                                              ; $772f: $00
	nop                                              ; $7730: $00
	nop                                              ; $7731: $00
	nop                                              ; $7732: $00
	nop                                              ; $7733: $00
	nop                                              ; $7734: $00
	nop                                              ; $7735: $00
	nop                                              ; $7736: $00
	nop                                              ; $7737: $00
	nop                                              ; $7738: $00
	nop                                              ; $7739: $00
	nop                                              ; $773a: $00
	nop                                              ; $773b: $00
	nop                                              ; $773c: $00
	nop                                              ; $773d: $00
	nop                                              ; $773e: $00
	nop                                              ; $773f: $00
	nop                                              ; $7740: $00
	nop                                              ; $7741: $00
	nop                                              ; $7742: $00
	nop                                              ; $7743: $00
	nop                                              ; $7744: $00
	nop                                              ; $7745: $00
	nop                                              ; $7746: $00
	nop                                              ; $7747: $00
	nop                                              ; $7748: $00
	nop                                              ; $7749: $00
	nop                                              ; $774a: $00
	nop                                              ; $774b: $00
	nop                                              ; $774c: $00
	nop                                              ; $774d: $00
	nop                                              ; $774e: $00
	nop                                              ; $774f: $00
	nop                                              ; $7750: $00
	nop                                              ; $7751: $00
	nop                                              ; $7752: $00
	nop                                              ; $7753: $00
	nop                                              ; $7754: $00
	nop                                              ; $7755: $00
	nop                                              ; $7756: $00
	nop                                              ; $7757: $00
	nop                                              ; $7758: $00
	nop                                              ; $7759: $00
	nop                                              ; $775a: $00
	nop                                              ; $775b: $00
	nop                                              ; $775c: $00
	nop                                              ; $775d: $00
	nop                                              ; $775e: $00
	nop                                              ; $775f: $00
	nop                                              ; $7760: $00
	nop                                              ; $7761: $00
	nop                                              ; $7762: $00
	nop                                              ; $7763: $00
	nop                                              ; $7764: $00
	nop                                              ; $7765: $00
	nop                                              ; $7766: $00
	nop                                              ; $7767: $00
	nop                                              ; $7768: $00
	nop                                              ; $7769: $00
	nop                                              ; $776a: $00
	nop                                              ; $776b: $00
	nop                                              ; $776c: $00
	nop                                              ; $776d: $00
	nop                                              ; $776e: $00
	nop                                              ; $776f: $00
	nop                                              ; $7770: $00
	nop                                              ; $7771: $00
	nop                                              ; $7772: $00
	nop                                              ; $7773: $00
	nop                                              ; $7774: $00
	nop                                              ; $7775: $00
	nop                                              ; $7776: $00
	nop                                              ; $7777: $00
	nop                                              ; $7778: $00
	nop                                              ; $7779: $00
	nop                                              ; $777a: $00
	nop                                              ; $777b: $00
	nop                                              ; $777c: $00
	nop                                              ; $777d: $00
	nop                                              ; $777e: $00
	nop                                              ; $777f: $00
	nop                                              ; $7780: $00
	nop                                              ; $7781: $00
	nop                                              ; $7782: $00
	nop                                              ; $7783: $00
	nop                                              ; $7784: $00
	nop                                              ; $7785: $00
	nop                                              ; $7786: $00
	nop                                              ; $7787: $00
	nop                                              ; $7788: $00
	nop                                              ; $7789: $00
	nop                                              ; $778a: $00
	nop                                              ; $778b: $00
	nop                                              ; $778c: $00
	nop                                              ; $778d: $00
	nop                                              ; $778e: $00
	nop                                              ; $778f: $00
	nop                                              ; $7790: $00
	nop                                              ; $7791: $00
	nop                                              ; $7792: $00
	nop                                              ; $7793: $00
	nop                                              ; $7794: $00
	nop                                              ; $7795: $00
	nop                                              ; $7796: $00
	nop                                              ; $7797: $00
	nop                                              ; $7798: $00
	nop                                              ; $7799: $00
	nop                                              ; $779a: $00
	nop                                              ; $779b: $00
	nop                                              ; $779c: $00
	nop                                              ; $779d: $00
	nop                                              ; $779e: $00
	nop                                              ; $779f: $00
	nop                                              ; $77a0: $00
	nop                                              ; $77a1: $00
	nop                                              ; $77a2: $00
	nop                                              ; $77a3: $00
	nop                                              ; $77a4: $00
	nop                                              ; $77a5: $00
	nop                                              ; $77a6: $00
	nop                                              ; $77a7: $00
	nop                                              ; $77a8: $00
	nop                                              ; $77a9: $00
	nop                                              ; $77aa: $00
	nop                                              ; $77ab: $00
	nop                                              ; $77ac: $00
	nop                                              ; $77ad: $00
	nop                                              ; $77ae: $00
	nop                                              ; $77af: $00
	nop                                              ; $77b0: $00
	nop                                              ; $77b1: $00
	nop                                              ; $77b2: $00
	nop                                              ; $77b3: $00
	nop                                              ; $77b4: $00
	nop                                              ; $77b5: $00
	nop                                              ; $77b6: $00
	nop                                              ; $77b7: $00
	nop                                              ; $77b8: $00
	nop                                              ; $77b9: $00
	nop                                              ; $77ba: $00
	nop                                              ; $77bb: $00
	nop                                              ; $77bc: $00
	nop                                              ; $77bd: $00
	nop                                              ; $77be: $00
	nop                                              ; $77bf: $00
	nop                                              ; $77c0: $00
	nop                                              ; $77c1: $00
	nop                                              ; $77c2: $00
	nop                                              ; $77c3: $00
	nop                                              ; $77c4: $00
	nop                                              ; $77c5: $00
	nop                                              ; $77c6: $00
	nop                                              ; $77c7: $00
	nop                                              ; $77c8: $00
	nop                                              ; $77c9: $00
	nop                                              ; $77ca: $00
	nop                                              ; $77cb: $00
	nop                                              ; $77cc: $00
	nop                                              ; $77cd: $00
	nop                                              ; $77ce: $00
	nop                                              ; $77cf: $00
	nop                                              ; $77d0: $00
	nop                                              ; $77d1: $00
	nop                                              ; $77d2: $00
	nop                                              ; $77d3: $00
	nop                                              ; $77d4: $00
	nop                                              ; $77d5: $00
	nop                                              ; $77d6: $00
	nop                                              ; $77d7: $00
	nop                                              ; $77d8: $00
	nop                                              ; $77d9: $00
	nop                                              ; $77da: $00
	nop                                              ; $77db: $00
	nop                                              ; $77dc: $00
	nop                                              ; $77dd: $00
	nop                                              ; $77de: $00
	nop                                              ; $77df: $00
	nop                                              ; $77e0: $00
	nop                                              ; $77e1: $00
	nop                                              ; $77e2: $00
	nop                                              ; $77e3: $00
	nop                                              ; $77e4: $00
	nop                                              ; $77e5: $00
	nop                                              ; $77e6: $00
	nop                                              ; $77e7: $00
	nop                                              ; $77e8: $00
	nop                                              ; $77e9: $00
	nop                                              ; $77ea: $00
	nop                                              ; $77eb: $00
	nop                                              ; $77ec: $00
	nop                                              ; $77ed: $00
	nop                                              ; $77ee: $00
	nop                                              ; $77ef: $00
	nop                                              ; $77f0: $00
	nop                                              ; $77f1: $00
	nop                                              ; $77f2: $00
	nop                                              ; $77f3: $00
	nop                                              ; $77f4: $00
	nop                                              ; $77f5: $00
	nop                                              ; $77f6: $00
	nop                                              ; $77f7: $00
	nop                                              ; $77f8: $00
	nop                                              ; $77f9: $00
	nop                                              ; $77fa: $00
	nop                                              ; $77fb: $00
	nop                                              ; $77fc: $00
	nop                                              ; $77fd: $00
	nop                                              ; $77fe: $00
	nop                                              ; $77ff: $00
	nop                                              ; $7800: $00
	nop                                              ; $7801: $00
	nop                                              ; $7802: $00
	nop                                              ; $7803: $00
	nop                                              ; $7804: $00
	nop                                              ; $7805: $00
	nop                                              ; $7806: $00
	nop                                              ; $7807: $00
	nop                                              ; $7808: $00
	nop                                              ; $7809: $00
	nop                                              ; $780a: $00
	nop                                              ; $780b: $00
	nop                                              ; $780c: $00
	nop                                              ; $780d: $00
	nop                                              ; $780e: $00
	nop                                              ; $780f: $00
	nop                                              ; $7810: $00
	nop                                              ; $7811: $00
	nop                                              ; $7812: $00
	nop                                              ; $7813: $00
	nop                                              ; $7814: $00
	nop                                              ; $7815: $00
	nop                                              ; $7816: $00
	nop                                              ; $7817: $00
	nop                                              ; $7818: $00
	nop                                              ; $7819: $00
	nop                                              ; $781a: $00
	nop                                              ; $781b: $00
	nop                                              ; $781c: $00
	nop                                              ; $781d: $00
	nop                                              ; $781e: $00
	nop                                              ; $781f: $00
	nop                                              ; $7820: $00
	nop                                              ; $7821: $00
	nop                                              ; $7822: $00
	nop                                              ; $7823: $00
	nop                                              ; $7824: $00
	nop                                              ; $7825: $00
	nop                                              ; $7826: $00
	nop                                              ; $7827: $00
	nop                                              ; $7828: $00
	nop                                              ; $7829: $00
	nop                                              ; $782a: $00
	nop                                              ; $782b: $00
	nop                                              ; $782c: $00
	nop                                              ; $782d: $00
	nop                                              ; $782e: $00
	nop                                              ; $782f: $00
	nop                                              ; $7830: $00
	nop                                              ; $7831: $00
	nop                                              ; $7832: $00
	nop                                              ; $7833: $00
	nop                                              ; $7834: $00
	nop                                              ; $7835: $00
	nop                                              ; $7836: $00
	nop                                              ; $7837: $00
	nop                                              ; $7838: $00
	nop                                              ; $7839: $00
	nop                                              ; $783a: $00
	nop                                              ; $783b: $00
	nop                                              ; $783c: $00
	nop                                              ; $783d: $00
	nop                                              ; $783e: $00
	nop                                              ; $783f: $00
	nop                                              ; $7840: $00
	nop                                              ; $7841: $00
	nop                                              ; $7842: $00
	nop                                              ; $7843: $00
	nop                                              ; $7844: $00
	nop                                              ; $7845: $00
	nop                                              ; $7846: $00
	nop                                              ; $7847: $00
	nop                                              ; $7848: $00
	nop                                              ; $7849: $00
	nop                                              ; $784a: $00
	nop                                              ; $784b: $00
	nop                                              ; $784c: $00
	nop                                              ; $784d: $00
	nop                                              ; $784e: $00
	nop                                              ; $784f: $00
	nop                                              ; $7850: $00
	nop                                              ; $7851: $00
	nop                                              ; $7852: $00
	nop                                              ; $7853: $00
	nop                                              ; $7854: $00
	nop                                              ; $7855: $00
	nop                                              ; $7856: $00
	nop                                              ; $7857: $00
	nop                                              ; $7858: $00
	nop                                              ; $7859: $00
	nop                                              ; $785a: $00
	nop                                              ; $785b: $00
	nop                                              ; $785c: $00
	nop                                              ; $785d: $00
	nop                                              ; $785e: $00
	nop                                              ; $785f: $00
	nop                                              ; $7860: $00
	nop                                              ; $7861: $00
	nop                                              ; $7862: $00
	nop                                              ; $7863: $00
	nop                                              ; $7864: $00
	nop                                              ; $7865: $00
	nop                                              ; $7866: $00
	nop                                              ; $7867: $00
	nop                                              ; $7868: $00
	nop                                              ; $7869: $00
	nop                                              ; $786a: $00
	nop                                              ; $786b: $00
	nop                                              ; $786c: $00
	nop                                              ; $786d: $00
	nop                                              ; $786e: $00
	nop                                              ; $786f: $00
	nop                                              ; $7870: $00
	nop                                              ; $7871: $00
	nop                                              ; $7872: $00
	nop                                              ; $7873: $00
	nop                                              ; $7874: $00
	nop                                              ; $7875: $00
	nop                                              ; $7876: $00
	nop                                              ; $7877: $00
	nop                                              ; $7878: $00
	nop                                              ; $7879: $00
	nop                                              ; $787a: $00
	nop                                              ; $787b: $00
	nop                                              ; $787c: $00
	nop                                              ; $787d: $00
	nop                                              ; $787e: $00
	nop                                              ; $787f: $00
	nop                                              ; $7880: $00
	nop                                              ; $7881: $00
	nop                                              ; $7882: $00
	nop                                              ; $7883: $00
	nop                                              ; $7884: $00
	nop                                              ; $7885: $00
	nop                                              ; $7886: $00
	nop                                              ; $7887: $00
	nop                                              ; $7888: $00
	nop                                              ; $7889: $00
	nop                                              ; $788a: $00
	nop                                              ; $788b: $00
	nop                                              ; $788c: $00
	nop                                              ; $788d: $00
	nop                                              ; $788e: $00
	nop                                              ; $788f: $00
	nop                                              ; $7890: $00
	nop                                              ; $7891: $00
	nop                                              ; $7892: $00
	nop                                              ; $7893: $00
	nop                                              ; $7894: $00
	nop                                              ; $7895: $00
	nop                                              ; $7896: $00
	nop                                              ; $7897: $00
	nop                                              ; $7898: $00
	nop                                              ; $7899: $00
	nop                                              ; $789a: $00
	nop                                              ; $789b: $00
	nop                                              ; $789c: $00
	nop                                              ; $789d: $00
	nop                                              ; $789e: $00
	nop                                              ; $789f: $00
	nop                                              ; $78a0: $00
	nop                                              ; $78a1: $00
	nop                                              ; $78a2: $00
	nop                                              ; $78a3: $00
	nop                                              ; $78a4: $00
	nop                                              ; $78a5: $00
	nop                                              ; $78a6: $00
	nop                                              ; $78a7: $00
	nop                                              ; $78a8: $00
	nop                                              ; $78a9: $00
	nop                                              ; $78aa: $00
	nop                                              ; $78ab: $00
	nop                                              ; $78ac: $00
	nop                                              ; $78ad: $00
	nop                                              ; $78ae: $00
	nop                                              ; $78af: $00
	nop                                              ; $78b0: $00
	nop                                              ; $78b1: $00
	nop                                              ; $78b2: $00
	nop                                              ; $78b3: $00
	nop                                              ; $78b4: $00
	nop                                              ; $78b5: $00
	nop                                              ; $78b6: $00
	nop                                              ; $78b7: $00
	nop                                              ; $78b8: $00
	nop                                              ; $78b9: $00
	nop                                              ; $78ba: $00
	nop                                              ; $78bb: $00
	nop                                              ; $78bc: $00
	nop                                              ; $78bd: $00
	nop                                              ; $78be: $00
	nop                                              ; $78bf: $00
	nop                                              ; $78c0: $00
	nop                                              ; $78c1: $00
	nop                                              ; $78c2: $00
	nop                                              ; $78c3: $00
	nop                                              ; $78c4: $00
	nop                                              ; $78c5: $00
	nop                                              ; $78c6: $00
	nop                                              ; $78c7: $00
	nop                                              ; $78c8: $00
	nop                                              ; $78c9: $00
	nop                                              ; $78ca: $00
	nop                                              ; $78cb: $00
	nop                                              ; $78cc: $00
	nop                                              ; $78cd: $00
	nop                                              ; $78ce: $00
	nop                                              ; $78cf: $00
	nop                                              ; $78d0: $00
	nop                                              ; $78d1: $00
	nop                                              ; $78d2: $00
	nop                                              ; $78d3: $00
	nop                                              ; $78d4: $00
	nop                                              ; $78d5: $00
	nop                                              ; $78d6: $00
	nop                                              ; $78d7: $00
	nop                                              ; $78d8: $00
	nop                                              ; $78d9: $00
	nop                                              ; $78da: $00
	nop                                              ; $78db: $00
	nop                                              ; $78dc: $00
	nop                                              ; $78dd: $00
	nop                                              ; $78de: $00
	nop                                              ; $78df: $00
	nop                                              ; $78e0: $00
	nop                                              ; $78e1: $00
	nop                                              ; $78e2: $00
	nop                                              ; $78e3: $00
	nop                                              ; $78e4: $00
	nop                                              ; $78e5: $00
	nop                                              ; $78e6: $00
	nop                                              ; $78e7: $00
	nop                                              ; $78e8: $00
	nop                                              ; $78e9: $00
	nop                                              ; $78ea: $00
	nop                                              ; $78eb: $00
	nop                                              ; $78ec: $00
	nop                                              ; $78ed: $00
	nop                                              ; $78ee: $00
	nop                                              ; $78ef: $00
	nop                                              ; $78f0: $00
	nop                                              ; $78f1: $00
	nop                                              ; $78f2: $00
	nop                                              ; $78f3: $00
	nop                                              ; $78f4: $00
	nop                                              ; $78f5: $00
	nop                                              ; $78f6: $00
	nop                                              ; $78f7: $00
	nop                                              ; $78f8: $00
	nop                                              ; $78f9: $00
	nop                                              ; $78fa: $00
	nop                                              ; $78fb: $00
	nop                                              ; $78fc: $00
	nop                                              ; $78fd: $00
	nop                                              ; $78fe: $00
	nop                                              ; $78ff: $00
	nop                                              ; $7900: $00
	nop                                              ; $7901: $00
	nop                                              ; $7902: $00
	nop                                              ; $7903: $00
	nop                                              ; $7904: $00
	nop                                              ; $7905: $00
	nop                                              ; $7906: $00
	nop                                              ; $7907: $00
	nop                                              ; $7908: $00
	nop                                              ; $7909: $00
	nop                                              ; $790a: $00
	nop                                              ; $790b: $00
	nop                                              ; $790c: $00
	nop                                              ; $790d: $00
	nop                                              ; $790e: $00
	nop                                              ; $790f: $00
	nop                                              ; $7910: $00
	nop                                              ; $7911: $00
	nop                                              ; $7912: $00
	nop                                              ; $7913: $00
	nop                                              ; $7914: $00
	nop                                              ; $7915: $00
	nop                                              ; $7916: $00
	nop                                              ; $7917: $00
	nop                                              ; $7918: $00
	nop                                              ; $7919: $00
	nop                                              ; $791a: $00
	nop                                              ; $791b: $00
	nop                                              ; $791c: $00
	nop                                              ; $791d: $00
	nop                                              ; $791e: $00
	nop                                              ; $791f: $00
	nop                                              ; $7920: $00
	nop                                              ; $7921: $00
	nop                                              ; $7922: $00
	nop                                              ; $7923: $00
	nop                                              ; $7924: $00
	nop                                              ; $7925: $00
	nop                                              ; $7926: $00
	nop                                              ; $7927: $00
	nop                                              ; $7928: $00
	nop                                              ; $7929: $00
	nop                                              ; $792a: $00
	nop                                              ; $792b: $00
	nop                                              ; $792c: $00
	nop                                              ; $792d: $00
	nop                                              ; $792e: $00
	nop                                              ; $792f: $00
	nop                                              ; $7930: $00
	nop                                              ; $7931: $00
	nop                                              ; $7932: $00
	nop                                              ; $7933: $00
	nop                                              ; $7934: $00
	nop                                              ; $7935: $00
	nop                                              ; $7936: $00
	nop                                              ; $7937: $00
	nop                                              ; $7938: $00
	nop                                              ; $7939: $00
	nop                                              ; $793a: $00
	nop                                              ; $793b: $00
	nop                                              ; $793c: $00
	nop                                              ; $793d: $00
	nop                                              ; $793e: $00
	nop                                              ; $793f: $00
	nop                                              ; $7940: $00
	nop                                              ; $7941: $00
	nop                                              ; $7942: $00
	nop                                              ; $7943: $00
	nop                                              ; $7944: $00
	nop                                              ; $7945: $00
	nop                                              ; $7946: $00
	nop                                              ; $7947: $00
	nop                                              ; $7948: $00
	nop                                              ; $7949: $00
	nop                                              ; $794a: $00
	nop                                              ; $794b: $00
	nop                                              ; $794c: $00
	nop                                              ; $794d: $00
	nop                                              ; $794e: $00
	nop                                              ; $794f: $00
	nop                                              ; $7950: $00
	nop                                              ; $7951: $00
	nop                                              ; $7952: $00
	nop                                              ; $7953: $00
	nop                                              ; $7954: $00
	nop                                              ; $7955: $00
	nop                                              ; $7956: $00
	nop                                              ; $7957: $00
	nop                                              ; $7958: $00
	nop                                              ; $7959: $00
	nop                                              ; $795a: $00
	nop                                              ; $795b: $00
	nop                                              ; $795c: $00
	nop                                              ; $795d: $00
	nop                                              ; $795e: $00
	nop                                              ; $795f: $00
	nop                                              ; $7960: $00
	nop                                              ; $7961: $00
	nop                                              ; $7962: $00
	nop                                              ; $7963: $00
	nop                                              ; $7964: $00
	nop                                              ; $7965: $00
	nop                                              ; $7966: $00
	nop                                              ; $7967: $00
	nop                                              ; $7968: $00
	nop                                              ; $7969: $00
	nop                                              ; $796a: $00
	nop                                              ; $796b: $00
	nop                                              ; $796c: $00
	nop                                              ; $796d: $00
	nop                                              ; $796e: $00
	nop                                              ; $796f: $00
	nop                                              ; $7970: $00
	nop                                              ; $7971: $00
	nop                                              ; $7972: $00
	nop                                              ; $7973: $00
	nop                                              ; $7974: $00
	nop                                              ; $7975: $00
	nop                                              ; $7976: $00
	nop                                              ; $7977: $00
	nop                                              ; $7978: $00
	nop                                              ; $7979: $00
	nop                                              ; $797a: $00
	nop                                              ; $797b: $00
	nop                                              ; $797c: $00
	nop                                              ; $797d: $00
	nop                                              ; $797e: $00
	nop                                              ; $797f: $00
	nop                                              ; $7980: $00
	nop                                              ; $7981: $00
	nop                                              ; $7982: $00
	nop                                              ; $7983: $00
	nop                                              ; $7984: $00
	nop                                              ; $7985: $00
	nop                                              ; $7986: $00
	nop                                              ; $7987: $00
	nop                                              ; $7988: $00
	nop                                              ; $7989: $00
	nop                                              ; $798a: $00
	nop                                              ; $798b: $00
	nop                                              ; $798c: $00
	nop                                              ; $798d: $00
	nop                                              ; $798e: $00
	nop                                              ; $798f: $00
	nop                                              ; $7990: $00
	nop                                              ; $7991: $00
	nop                                              ; $7992: $00
	nop                                              ; $7993: $00
	nop                                              ; $7994: $00
	nop                                              ; $7995: $00
	nop                                              ; $7996: $00
	nop                                              ; $7997: $00
	nop                                              ; $7998: $00
	nop                                              ; $7999: $00
	nop                                              ; $799a: $00
	nop                                              ; $799b: $00
	nop                                              ; $799c: $00
	nop                                              ; $799d: $00
	nop                                              ; $799e: $00
	nop                                              ; $799f: $00
	nop                                              ; $79a0: $00
	nop                                              ; $79a1: $00
	nop                                              ; $79a2: $00
	nop                                              ; $79a3: $00
	nop                                              ; $79a4: $00
	nop                                              ; $79a5: $00
	nop                                              ; $79a6: $00
	nop                                              ; $79a7: $00
	nop                                              ; $79a8: $00
	nop                                              ; $79a9: $00
	nop                                              ; $79aa: $00
	nop                                              ; $79ab: $00
	nop                                              ; $79ac: $00
	nop                                              ; $79ad: $00
	nop                                              ; $79ae: $00
	nop                                              ; $79af: $00
	nop                                              ; $79b0: $00
	nop                                              ; $79b1: $00
	nop                                              ; $79b2: $00
	nop                                              ; $79b3: $00
	nop                                              ; $79b4: $00
	nop                                              ; $79b5: $00
	nop                                              ; $79b6: $00
	nop                                              ; $79b7: $00
	nop                                              ; $79b8: $00
	nop                                              ; $79b9: $00
	nop                                              ; $79ba: $00
	nop                                              ; $79bb: $00
	nop                                              ; $79bc: $00
	nop                                              ; $79bd: $00
	nop                                              ; $79be: $00
	nop                                              ; $79bf: $00
	nop                                              ; $79c0: $00
	nop                                              ; $79c1: $00
	nop                                              ; $79c2: $00
	nop                                              ; $79c3: $00
	nop                                              ; $79c4: $00
	nop                                              ; $79c5: $00
	nop                                              ; $79c6: $00
	nop                                              ; $79c7: $00
	nop                                              ; $79c8: $00
	nop                                              ; $79c9: $00
	nop                                              ; $79ca: $00
	nop                                              ; $79cb: $00
	nop                                              ; $79cc: $00
	nop                                              ; $79cd: $00
	nop                                              ; $79ce: $00
	nop                                              ; $79cf: $00
	nop                                              ; $79d0: $00
	nop                                              ; $79d1: $00
	nop                                              ; $79d2: $00
	nop                                              ; $79d3: $00
	nop                                              ; $79d4: $00
	nop                                              ; $79d5: $00
	nop                                              ; $79d6: $00
	nop                                              ; $79d7: $00
	nop                                              ; $79d8: $00
	nop                                              ; $79d9: $00
	nop                                              ; $79da: $00
	nop                                              ; $79db: $00
	nop                                              ; $79dc: $00
	nop                                              ; $79dd: $00
	nop                                              ; $79de: $00
	nop                                              ; $79df: $00
	nop                                              ; $79e0: $00
	nop                                              ; $79e1: $00
	nop                                              ; $79e2: $00
	nop                                              ; $79e3: $00
	nop                                              ; $79e4: $00
	nop                                              ; $79e5: $00
	nop                                              ; $79e6: $00
	nop                                              ; $79e7: $00
	nop                                              ; $79e8: $00
	nop                                              ; $79e9: $00
	nop                                              ; $79ea: $00
	nop                                              ; $79eb: $00
	nop                                              ; $79ec: $00
	nop                                              ; $79ed: $00
	nop                                              ; $79ee: $00
	nop                                              ; $79ef: $00
	nop                                              ; $79f0: $00
	nop                                              ; $79f1: $00
	nop                                              ; $79f2: $00
	nop                                              ; $79f3: $00
	nop                                              ; $79f4: $00
	nop                                              ; $79f5: $00
	nop                                              ; $79f6: $00
	nop                                              ; $79f7: $00
	nop                                              ; $79f8: $00
	nop                                              ; $79f9: $00
	nop                                              ; $79fa: $00
	nop                                              ; $79fb: $00
	nop                                              ; $79fc: $00
	nop                                              ; $79fd: $00
	nop                                              ; $79fe: $00
	nop                                              ; $79ff: $00
	nop                                              ; $7a00: $00
	nop                                              ; $7a01: $00
	nop                                              ; $7a02: $00
	nop                                              ; $7a03: $00
	nop                                              ; $7a04: $00
	nop                                              ; $7a05: $00
	nop                                              ; $7a06: $00
	nop                                              ; $7a07: $00
	nop                                              ; $7a08: $00
	nop                                              ; $7a09: $00
	nop                                              ; $7a0a: $00
	nop                                              ; $7a0b: $00
	nop                                              ; $7a0c: $00
	nop                                              ; $7a0d: $00
	nop                                              ; $7a0e: $00
	nop                                              ; $7a0f: $00
	nop                                              ; $7a10: $00
	nop                                              ; $7a11: $00
	nop                                              ; $7a12: $00
	nop                                              ; $7a13: $00
	nop                                              ; $7a14: $00
	nop                                              ; $7a15: $00
	nop                                              ; $7a16: $00
	nop                                              ; $7a17: $00
	nop                                              ; $7a18: $00
	nop                                              ; $7a19: $00
	nop                                              ; $7a1a: $00
	nop                                              ; $7a1b: $00
	nop                                              ; $7a1c: $00
	nop                                              ; $7a1d: $00
	nop                                              ; $7a1e: $00
	nop                                              ; $7a1f: $00
	nop                                              ; $7a20: $00
	nop                                              ; $7a21: $00
	nop                                              ; $7a22: $00
	nop                                              ; $7a23: $00
	nop                                              ; $7a24: $00
	nop                                              ; $7a25: $00
	nop                                              ; $7a26: $00
	nop                                              ; $7a27: $00
	nop                                              ; $7a28: $00
	nop                                              ; $7a29: $00
	nop                                              ; $7a2a: $00
	nop                                              ; $7a2b: $00
	nop                                              ; $7a2c: $00
	nop                                              ; $7a2d: $00
	nop                                              ; $7a2e: $00
	nop                                              ; $7a2f: $00
	nop                                              ; $7a30: $00
	nop                                              ; $7a31: $00
	nop                                              ; $7a32: $00
	nop                                              ; $7a33: $00
	nop                                              ; $7a34: $00
	nop                                              ; $7a35: $00
	nop                                              ; $7a36: $00
	nop                                              ; $7a37: $00
	nop                                              ; $7a38: $00
	nop                                              ; $7a39: $00
	nop                                              ; $7a3a: $00
	nop                                              ; $7a3b: $00
	nop                                              ; $7a3c: $00
	nop                                              ; $7a3d: $00
	nop                                              ; $7a3e: $00
	nop                                              ; $7a3f: $00
	nop                                              ; $7a40: $00
	nop                                              ; $7a41: $00
	nop                                              ; $7a42: $00
	nop                                              ; $7a43: $00
	nop                                              ; $7a44: $00
	nop                                              ; $7a45: $00
	nop                                              ; $7a46: $00
	nop                                              ; $7a47: $00
	nop                                              ; $7a48: $00
	nop                                              ; $7a49: $00
	nop                                              ; $7a4a: $00
	nop                                              ; $7a4b: $00
	nop                                              ; $7a4c: $00
	nop                                              ; $7a4d: $00
	nop                                              ; $7a4e: $00
	nop                                              ; $7a4f: $00
	nop                                              ; $7a50: $00
	nop                                              ; $7a51: $00
	nop                                              ; $7a52: $00
	nop                                              ; $7a53: $00
	nop                                              ; $7a54: $00
	nop                                              ; $7a55: $00
	nop                                              ; $7a56: $00
	nop                                              ; $7a57: $00
	nop                                              ; $7a58: $00
	nop                                              ; $7a59: $00
	nop                                              ; $7a5a: $00
	nop                                              ; $7a5b: $00
	nop                                              ; $7a5c: $00
	nop                                              ; $7a5d: $00
	nop                                              ; $7a5e: $00
	nop                                              ; $7a5f: $00
	nop                                              ; $7a60: $00
	nop                                              ; $7a61: $00
	nop                                              ; $7a62: $00
	nop                                              ; $7a63: $00
	nop                                              ; $7a64: $00
	nop                                              ; $7a65: $00
	nop                                              ; $7a66: $00
	nop                                              ; $7a67: $00
	nop                                              ; $7a68: $00
	nop                                              ; $7a69: $00
	nop                                              ; $7a6a: $00
	nop                                              ; $7a6b: $00
	nop                                              ; $7a6c: $00
	nop                                              ; $7a6d: $00
	nop                                              ; $7a6e: $00
	nop                                              ; $7a6f: $00
	nop                                              ; $7a70: $00
	nop                                              ; $7a71: $00
	nop                                              ; $7a72: $00
	nop                                              ; $7a73: $00
	nop                                              ; $7a74: $00
	nop                                              ; $7a75: $00
	nop                                              ; $7a76: $00
	nop                                              ; $7a77: $00
	nop                                              ; $7a78: $00
	nop                                              ; $7a79: $00
	nop                                              ; $7a7a: $00
	nop                                              ; $7a7b: $00
	nop                                              ; $7a7c: $00
	nop                                              ; $7a7d: $00
	nop                                              ; $7a7e: $00
	nop                                              ; $7a7f: $00
	nop                                              ; $7a80: $00
	nop                                              ; $7a81: $00
	nop                                              ; $7a82: $00
	nop                                              ; $7a83: $00
	nop                                              ; $7a84: $00
	nop                                              ; $7a85: $00
	nop                                              ; $7a86: $00
	nop                                              ; $7a87: $00
	nop                                              ; $7a88: $00
	nop                                              ; $7a89: $00
	nop                                              ; $7a8a: $00
	nop                                              ; $7a8b: $00
	nop                                              ; $7a8c: $00
	nop                                              ; $7a8d: $00
	nop                                              ; $7a8e: $00
	nop                                              ; $7a8f: $00
	nop                                              ; $7a90: $00
	nop                                              ; $7a91: $00
	nop                                              ; $7a92: $00
	nop                                              ; $7a93: $00
	nop                                              ; $7a94: $00
	nop                                              ; $7a95: $00
	nop                                              ; $7a96: $00
	nop                                              ; $7a97: $00
	nop                                              ; $7a98: $00
	nop                                              ; $7a99: $00
	nop                                              ; $7a9a: $00
	nop                                              ; $7a9b: $00
	nop                                              ; $7a9c: $00
	nop                                              ; $7a9d: $00
	nop                                              ; $7a9e: $00
	nop                                              ; $7a9f: $00
	nop                                              ; $7aa0: $00
	nop                                              ; $7aa1: $00
	nop                                              ; $7aa2: $00
	nop                                              ; $7aa3: $00
	nop                                              ; $7aa4: $00
	nop                                              ; $7aa5: $00
	nop                                              ; $7aa6: $00
	nop                                              ; $7aa7: $00
	nop                                              ; $7aa8: $00
	nop                                              ; $7aa9: $00
	nop                                              ; $7aaa: $00
	nop                                              ; $7aab: $00
	nop                                              ; $7aac: $00
	nop                                              ; $7aad: $00
	nop                                              ; $7aae: $00
	nop                                              ; $7aaf: $00
	nop                                              ; $7ab0: $00
	nop                                              ; $7ab1: $00
	nop                                              ; $7ab2: $00
	nop                                              ; $7ab3: $00
	nop                                              ; $7ab4: $00
	nop                                              ; $7ab5: $00
	nop                                              ; $7ab6: $00
	nop                                              ; $7ab7: $00
	nop                                              ; $7ab8: $00
	nop                                              ; $7ab9: $00
	nop                                              ; $7aba: $00
	nop                                              ; $7abb: $00
	nop                                              ; $7abc: $00
	nop                                              ; $7abd: $00
	nop                                              ; $7abe: $00
	nop                                              ; $7abf: $00
	nop                                              ; $7ac0: $00
	nop                                              ; $7ac1: $00
	nop                                              ; $7ac2: $00
	nop                                              ; $7ac3: $00
	nop                                              ; $7ac4: $00
	nop                                              ; $7ac5: $00
	nop                                              ; $7ac6: $00
	nop                                              ; $7ac7: $00
	nop                                              ; $7ac8: $00
	nop                                              ; $7ac9: $00
	nop                                              ; $7aca: $00
	nop                                              ; $7acb: $00
	nop                                              ; $7acc: $00
	nop                                              ; $7acd: $00
	nop                                              ; $7ace: $00
	nop                                              ; $7acf: $00
	nop                                              ; $7ad0: $00
	nop                                              ; $7ad1: $00
	nop                                              ; $7ad2: $00
	nop                                              ; $7ad3: $00
	nop                                              ; $7ad4: $00
	nop                                              ; $7ad5: $00
	nop                                              ; $7ad6: $00
	nop                                              ; $7ad7: $00
	nop                                              ; $7ad8: $00
	nop                                              ; $7ad9: $00
	nop                                              ; $7ada: $00
	nop                                              ; $7adb: $00
	nop                                              ; $7adc: $00
	nop                                              ; $7add: $00
	nop                                              ; $7ade: $00
	nop                                              ; $7adf: $00
	nop                                              ; $7ae0: $00
	nop                                              ; $7ae1: $00
	nop                                              ; $7ae2: $00
	nop                                              ; $7ae3: $00
	nop                                              ; $7ae4: $00
	nop                                              ; $7ae5: $00
	nop                                              ; $7ae6: $00
	nop                                              ; $7ae7: $00
	nop                                              ; $7ae8: $00
	nop                                              ; $7ae9: $00
	nop                                              ; $7aea: $00
	nop                                              ; $7aeb: $00
	nop                                              ; $7aec: $00
	nop                                              ; $7aed: $00
	nop                                              ; $7aee: $00
	nop                                              ; $7aef: $00
	nop                                              ; $7af0: $00
	nop                                              ; $7af1: $00
	nop                                              ; $7af2: $00
	nop                                              ; $7af3: $00
	nop                                              ; $7af4: $00
	nop                                              ; $7af5: $00
	nop                                              ; $7af6: $00
	nop                                              ; $7af7: $00
	nop                                              ; $7af8: $00
	nop                                              ; $7af9: $00
	nop                                              ; $7afa: $00
	nop                                              ; $7afb: $00
	nop                                              ; $7afc: $00
	nop                                              ; $7afd: $00
	nop                                              ; $7afe: $00
	nop                                              ; $7aff: $00
	nop                                              ; $7b00: $00
	nop                                              ; $7b01: $00
	nop                                              ; $7b02: $00
	nop                                              ; $7b03: $00
	nop                                              ; $7b04: $00
	nop                                              ; $7b05: $00
	nop                                              ; $7b06: $00
	nop                                              ; $7b07: $00
	nop                                              ; $7b08: $00
	nop                                              ; $7b09: $00
	nop                                              ; $7b0a: $00
	nop                                              ; $7b0b: $00
	nop                                              ; $7b0c: $00
	nop                                              ; $7b0d: $00
	nop                                              ; $7b0e: $00
	nop                                              ; $7b0f: $00
	nop                                              ; $7b10: $00
	nop                                              ; $7b11: $00
	nop                                              ; $7b12: $00
	nop                                              ; $7b13: $00
	nop                                              ; $7b14: $00
	nop                                              ; $7b15: $00
	nop                                              ; $7b16: $00
	nop                                              ; $7b17: $00
	nop                                              ; $7b18: $00
	nop                                              ; $7b19: $00
	nop                                              ; $7b1a: $00
	nop                                              ; $7b1b: $00
	nop                                              ; $7b1c: $00
	nop                                              ; $7b1d: $00
	nop                                              ; $7b1e: $00
	nop                                              ; $7b1f: $00
	nop                                              ; $7b20: $00
	nop                                              ; $7b21: $00
	nop                                              ; $7b22: $00
	nop                                              ; $7b23: $00
	nop                                              ; $7b24: $00
	nop                                              ; $7b25: $00
	nop                                              ; $7b26: $00
	nop                                              ; $7b27: $00
	nop                                              ; $7b28: $00
	nop                                              ; $7b29: $00
	nop                                              ; $7b2a: $00
	nop                                              ; $7b2b: $00
	nop                                              ; $7b2c: $00
	nop                                              ; $7b2d: $00
	nop                                              ; $7b2e: $00
	nop                                              ; $7b2f: $00
	nop                                              ; $7b30: $00
	nop                                              ; $7b31: $00
	nop                                              ; $7b32: $00
	nop                                              ; $7b33: $00
	nop                                              ; $7b34: $00
	nop                                              ; $7b35: $00
	nop                                              ; $7b36: $00
	nop                                              ; $7b37: $00
	nop                                              ; $7b38: $00
	nop                                              ; $7b39: $00
	nop                                              ; $7b3a: $00
	nop                                              ; $7b3b: $00
	nop                                              ; $7b3c: $00
	nop                                              ; $7b3d: $00
	nop                                              ; $7b3e: $00
	nop                                              ; $7b3f: $00
	nop                                              ; $7b40: $00
	nop                                              ; $7b41: $00
	nop                                              ; $7b42: $00
	nop                                              ; $7b43: $00
	nop                                              ; $7b44: $00
	nop                                              ; $7b45: $00
	nop                                              ; $7b46: $00
	nop                                              ; $7b47: $00
	nop                                              ; $7b48: $00
	nop                                              ; $7b49: $00
	nop                                              ; $7b4a: $00
	nop                                              ; $7b4b: $00
	nop                                              ; $7b4c: $00
	nop                                              ; $7b4d: $00
	nop                                              ; $7b4e: $00
	nop                                              ; $7b4f: $00
	nop                                              ; $7b50: $00
	nop                                              ; $7b51: $00
	nop                                              ; $7b52: $00
	nop                                              ; $7b53: $00
	nop                                              ; $7b54: $00
	nop                                              ; $7b55: $00
	nop                                              ; $7b56: $00
	nop                                              ; $7b57: $00
	nop                                              ; $7b58: $00
	nop                                              ; $7b59: $00
	nop                                              ; $7b5a: $00
	nop                                              ; $7b5b: $00
	nop                                              ; $7b5c: $00
	nop                                              ; $7b5d: $00
	nop                                              ; $7b5e: $00
	nop                                              ; $7b5f: $00
	nop                                              ; $7b60: $00
	nop                                              ; $7b61: $00
	nop                                              ; $7b62: $00
	nop                                              ; $7b63: $00
	nop                                              ; $7b64: $00
	nop                                              ; $7b65: $00
	nop                                              ; $7b66: $00
	nop                                              ; $7b67: $00
	nop                                              ; $7b68: $00
	nop                                              ; $7b69: $00
	nop                                              ; $7b6a: $00
	nop                                              ; $7b6b: $00
	nop                                              ; $7b6c: $00
	nop                                              ; $7b6d: $00
	nop                                              ; $7b6e: $00
	nop                                              ; $7b6f: $00
	nop                                              ; $7b70: $00
	nop                                              ; $7b71: $00
	nop                                              ; $7b72: $00
	nop                                              ; $7b73: $00
	nop                                              ; $7b74: $00
	nop                                              ; $7b75: $00
	nop                                              ; $7b76: $00
	nop                                              ; $7b77: $00
	nop                                              ; $7b78: $00
	nop                                              ; $7b79: $00
	nop                                              ; $7b7a: $00
	nop                                              ; $7b7b: $00
	nop                                              ; $7b7c: $00
	nop                                              ; $7b7d: $00
	nop                                              ; $7b7e: $00
	nop                                              ; $7b7f: $00
	nop                                              ; $7b80: $00
	nop                                              ; $7b81: $00
	nop                                              ; $7b82: $00
	nop                                              ; $7b83: $00
	nop                                              ; $7b84: $00
	nop                                              ; $7b85: $00
	nop                                              ; $7b86: $00
	nop                                              ; $7b87: $00
	nop                                              ; $7b88: $00
	nop                                              ; $7b89: $00
	nop                                              ; $7b8a: $00
	nop                                              ; $7b8b: $00
	nop                                              ; $7b8c: $00
	nop                                              ; $7b8d: $00
	nop                                              ; $7b8e: $00
	nop                                              ; $7b8f: $00
	nop                                              ; $7b90: $00
	nop                                              ; $7b91: $00
	nop                                              ; $7b92: $00
	nop                                              ; $7b93: $00
	nop                                              ; $7b94: $00
	nop                                              ; $7b95: $00
	nop                                              ; $7b96: $00
	nop                                              ; $7b97: $00
	nop                                              ; $7b98: $00
	nop                                              ; $7b99: $00
	nop                                              ; $7b9a: $00
	nop                                              ; $7b9b: $00
	nop                                              ; $7b9c: $00
	nop                                              ; $7b9d: $00
	nop                                              ; $7b9e: $00
	nop                                              ; $7b9f: $00
	nop                                              ; $7ba0: $00
	nop                                              ; $7ba1: $00
	nop                                              ; $7ba2: $00
	nop                                              ; $7ba3: $00
	nop                                              ; $7ba4: $00
	nop                                              ; $7ba5: $00
	nop                                              ; $7ba6: $00
	nop                                              ; $7ba7: $00
	nop                                              ; $7ba8: $00
	nop                                              ; $7ba9: $00
	nop                                              ; $7baa: $00
	nop                                              ; $7bab: $00
	nop                                              ; $7bac: $00
	nop                                              ; $7bad: $00
	nop                                              ; $7bae: $00
	nop                                              ; $7baf: $00
	nop                                              ; $7bb0: $00
	nop                                              ; $7bb1: $00
	nop                                              ; $7bb2: $00
	nop                                              ; $7bb3: $00
	nop                                              ; $7bb4: $00
	nop                                              ; $7bb5: $00
	nop                                              ; $7bb6: $00
	nop                                              ; $7bb7: $00
	nop                                              ; $7bb8: $00
	nop                                              ; $7bb9: $00
	nop                                              ; $7bba: $00
	nop                                              ; $7bbb: $00
	nop                                              ; $7bbc: $00
	nop                                              ; $7bbd: $00
	nop                                              ; $7bbe: $00
	nop                                              ; $7bbf: $00
	nop                                              ; $7bc0: $00
	nop                                              ; $7bc1: $00
	nop                                              ; $7bc2: $00
	nop                                              ; $7bc3: $00
	nop                                              ; $7bc4: $00
	nop                                              ; $7bc5: $00
	nop                                              ; $7bc6: $00
	nop                                              ; $7bc7: $00
	nop                                              ; $7bc8: $00
	nop                                              ; $7bc9: $00
	nop                                              ; $7bca: $00
	nop                                              ; $7bcb: $00
	nop                                              ; $7bcc: $00
	nop                                              ; $7bcd: $00
	nop                                              ; $7bce: $00
	nop                                              ; $7bcf: $00
	nop                                              ; $7bd0: $00
	nop                                              ; $7bd1: $00
	nop                                              ; $7bd2: $00
	nop                                              ; $7bd3: $00
	nop                                              ; $7bd4: $00
	nop                                              ; $7bd5: $00
	nop                                              ; $7bd6: $00
	nop                                              ; $7bd7: $00
	nop                                              ; $7bd8: $00
	nop                                              ; $7bd9: $00
	nop                                              ; $7bda: $00
	nop                                              ; $7bdb: $00
	nop                                              ; $7bdc: $00
	nop                                              ; $7bdd: $00
	nop                                              ; $7bde: $00
	nop                                              ; $7bdf: $00
	nop                                              ; $7be0: $00
	nop                                              ; $7be1: $00
	nop                                              ; $7be2: $00
	nop                                              ; $7be3: $00
	nop                                              ; $7be4: $00
	nop                                              ; $7be5: $00
	nop                                              ; $7be6: $00
	nop                                              ; $7be7: $00
	nop                                              ; $7be8: $00
	nop                                              ; $7be9: $00
	nop                                              ; $7bea: $00
	nop                                              ; $7beb: $00
	nop                                              ; $7bec: $00
	nop                                              ; $7bed: $00
	nop                                              ; $7bee: $00
	nop                                              ; $7bef: $00
	nop                                              ; $7bf0: $00
	nop                                              ; $7bf1: $00
	nop                                              ; $7bf2: $00
	nop                                              ; $7bf3: $00
	nop                                              ; $7bf4: $00
	nop                                              ; $7bf5: $00
	nop                                              ; $7bf6: $00
	nop                                              ; $7bf7: $00
	nop                                              ; $7bf8: $00
	nop                                              ; $7bf9: $00
	nop                                              ; $7bfa: $00
	nop                                              ; $7bfb: $00
	nop                                              ; $7bfc: $00
	nop                                              ; $7bfd: $00
	nop                                              ; $7bfe: $00
	nop                                              ; $7bff: $00
	nop                                              ; $7c00: $00
	nop                                              ; $7c01: $00
	nop                                              ; $7c02: $00
	nop                                              ; $7c03: $00
	nop                                              ; $7c04: $00
	nop                                              ; $7c05: $00
	nop                                              ; $7c06: $00
	nop                                              ; $7c07: $00
	nop                                              ; $7c08: $00
	nop                                              ; $7c09: $00
	nop                                              ; $7c0a: $00
	nop                                              ; $7c0b: $00
	nop                                              ; $7c0c: $00
	nop                                              ; $7c0d: $00
	nop                                              ; $7c0e: $00
	nop                                              ; $7c0f: $00
	nop                                              ; $7c10: $00
	nop                                              ; $7c11: $00
	nop                                              ; $7c12: $00
	nop                                              ; $7c13: $00
	nop                                              ; $7c14: $00
	nop                                              ; $7c15: $00
	nop                                              ; $7c16: $00
	nop                                              ; $7c17: $00
	nop                                              ; $7c18: $00
	nop                                              ; $7c19: $00
	nop                                              ; $7c1a: $00
	nop                                              ; $7c1b: $00
	nop                                              ; $7c1c: $00
	nop                                              ; $7c1d: $00
	nop                                              ; $7c1e: $00
	nop                                              ; $7c1f: $00
	nop                                              ; $7c20: $00
	nop                                              ; $7c21: $00
	nop                                              ; $7c22: $00
	nop                                              ; $7c23: $00
	nop                                              ; $7c24: $00
	nop                                              ; $7c25: $00
	nop                                              ; $7c26: $00
	nop                                              ; $7c27: $00
	nop                                              ; $7c28: $00
	nop                                              ; $7c29: $00
	nop                                              ; $7c2a: $00
	nop                                              ; $7c2b: $00
	nop                                              ; $7c2c: $00
	nop                                              ; $7c2d: $00
	nop                                              ; $7c2e: $00
	nop                                              ; $7c2f: $00
	nop                                              ; $7c30: $00
	nop                                              ; $7c31: $00
	nop                                              ; $7c32: $00
	nop                                              ; $7c33: $00
	nop                                              ; $7c34: $00
	nop                                              ; $7c35: $00
	nop                                              ; $7c36: $00
	nop                                              ; $7c37: $00
	nop                                              ; $7c38: $00
	nop                                              ; $7c39: $00
	nop                                              ; $7c3a: $00
	nop                                              ; $7c3b: $00
	nop                                              ; $7c3c: $00
	nop                                              ; $7c3d: $00
	nop                                              ; $7c3e: $00
	nop                                              ; $7c3f: $00
	nop                                              ; $7c40: $00
	nop                                              ; $7c41: $00
	nop                                              ; $7c42: $00
	nop                                              ; $7c43: $00
	nop                                              ; $7c44: $00
	nop                                              ; $7c45: $00
	nop                                              ; $7c46: $00
	nop                                              ; $7c47: $00
	nop                                              ; $7c48: $00
	nop                                              ; $7c49: $00
	nop                                              ; $7c4a: $00
	nop                                              ; $7c4b: $00
	nop                                              ; $7c4c: $00
	nop                                              ; $7c4d: $00
	nop                                              ; $7c4e: $00
	nop                                              ; $7c4f: $00
	nop                                              ; $7c50: $00
	nop                                              ; $7c51: $00
	nop                                              ; $7c52: $00
	nop                                              ; $7c53: $00
	nop                                              ; $7c54: $00
	nop                                              ; $7c55: $00
	nop                                              ; $7c56: $00
	nop                                              ; $7c57: $00
	nop                                              ; $7c58: $00
	nop                                              ; $7c59: $00
	nop                                              ; $7c5a: $00
	nop                                              ; $7c5b: $00
	nop                                              ; $7c5c: $00
	nop                                              ; $7c5d: $00
	nop                                              ; $7c5e: $00
	nop                                              ; $7c5f: $00
	nop                                              ; $7c60: $00
	nop                                              ; $7c61: $00
	nop                                              ; $7c62: $00
	nop                                              ; $7c63: $00
	nop                                              ; $7c64: $00
	nop                                              ; $7c65: $00
	nop                                              ; $7c66: $00
	nop                                              ; $7c67: $00
	nop                                              ; $7c68: $00
	nop                                              ; $7c69: $00
	nop                                              ; $7c6a: $00
	nop                                              ; $7c6b: $00
	nop                                              ; $7c6c: $00
	nop                                              ; $7c6d: $00
	nop                                              ; $7c6e: $00
	nop                                              ; $7c6f: $00
	nop                                              ; $7c70: $00
	nop                                              ; $7c71: $00
	nop                                              ; $7c72: $00
	nop                                              ; $7c73: $00
	nop                                              ; $7c74: $00
	nop                                              ; $7c75: $00
	nop                                              ; $7c76: $00
	nop                                              ; $7c77: $00
	nop                                              ; $7c78: $00
	nop                                              ; $7c79: $00
	nop                                              ; $7c7a: $00
	nop                                              ; $7c7b: $00
	nop                                              ; $7c7c: $00
	nop                                              ; $7c7d: $00
	nop                                              ; $7c7e: $00
	nop                                              ; $7c7f: $00
	nop                                              ; $7c80: $00
	nop                                              ; $7c81: $00
	nop                                              ; $7c82: $00
	nop                                              ; $7c83: $00
	nop                                              ; $7c84: $00
	nop                                              ; $7c85: $00
	nop                                              ; $7c86: $00
	nop                                              ; $7c87: $00
	nop                                              ; $7c88: $00
	nop                                              ; $7c89: $00
	nop                                              ; $7c8a: $00
	nop                                              ; $7c8b: $00
	nop                                              ; $7c8c: $00
	nop                                              ; $7c8d: $00
	nop                                              ; $7c8e: $00
	nop                                              ; $7c8f: $00
	nop                                              ; $7c90: $00
	nop                                              ; $7c91: $00
	nop                                              ; $7c92: $00
	nop                                              ; $7c93: $00
	nop                                              ; $7c94: $00
	nop                                              ; $7c95: $00
	nop                                              ; $7c96: $00
	nop                                              ; $7c97: $00
	nop                                              ; $7c98: $00
	nop                                              ; $7c99: $00
	nop                                              ; $7c9a: $00
	nop                                              ; $7c9b: $00
	nop                                              ; $7c9c: $00
	nop                                              ; $7c9d: $00
	nop                                              ; $7c9e: $00
	nop                                              ; $7c9f: $00
	nop                                              ; $7ca0: $00
	nop                                              ; $7ca1: $00
	nop                                              ; $7ca2: $00
	nop                                              ; $7ca3: $00
	nop                                              ; $7ca4: $00
	nop                                              ; $7ca5: $00
	nop                                              ; $7ca6: $00
	nop                                              ; $7ca7: $00
	nop                                              ; $7ca8: $00
	nop                                              ; $7ca9: $00
	nop                                              ; $7caa: $00
	nop                                              ; $7cab: $00
	nop                                              ; $7cac: $00
	nop                                              ; $7cad: $00
	nop                                              ; $7cae: $00
	nop                                              ; $7caf: $00
	nop                                              ; $7cb0: $00
	nop                                              ; $7cb1: $00
	nop                                              ; $7cb2: $00
	nop                                              ; $7cb3: $00
	nop                                              ; $7cb4: $00
	nop                                              ; $7cb5: $00
	nop                                              ; $7cb6: $00
	nop                                              ; $7cb7: $00
	nop                                              ; $7cb8: $00
	nop                                              ; $7cb9: $00
	nop                                              ; $7cba: $00
	nop                                              ; $7cbb: $00
	nop                                              ; $7cbc: $00
	nop                                              ; $7cbd: $00
	nop                                              ; $7cbe: $00
	nop                                              ; $7cbf: $00
	nop                                              ; $7cc0: $00
	nop                                              ; $7cc1: $00
	nop                                              ; $7cc2: $00
	nop                                              ; $7cc3: $00
	nop                                              ; $7cc4: $00
	nop                                              ; $7cc5: $00
	nop                                              ; $7cc6: $00
	nop                                              ; $7cc7: $00
	nop                                              ; $7cc8: $00
	nop                                              ; $7cc9: $00
	nop                                              ; $7cca: $00
	nop                                              ; $7ccb: $00
	nop                                              ; $7ccc: $00
	nop                                              ; $7ccd: $00
	nop                                              ; $7cce: $00
	nop                                              ; $7ccf: $00
	nop                                              ; $7cd0: $00
	nop                                              ; $7cd1: $00
	nop                                              ; $7cd2: $00
	nop                                              ; $7cd3: $00
	nop                                              ; $7cd4: $00
	nop                                              ; $7cd5: $00
	nop                                              ; $7cd6: $00
	nop                                              ; $7cd7: $00
	nop                                              ; $7cd8: $00
	nop                                              ; $7cd9: $00
	nop                                              ; $7cda: $00
	nop                                              ; $7cdb: $00
	nop                                              ; $7cdc: $00
	nop                                              ; $7cdd: $00
	nop                                              ; $7cde: $00
	nop                                              ; $7cdf: $00
	nop                                              ; $7ce0: $00
	nop                                              ; $7ce1: $00
	nop                                              ; $7ce2: $00
	nop                                              ; $7ce3: $00
	nop                                              ; $7ce4: $00
	nop                                              ; $7ce5: $00
	nop                                              ; $7ce6: $00
	nop                                              ; $7ce7: $00
	nop                                              ; $7ce8: $00
	nop                                              ; $7ce9: $00
	nop                                              ; $7cea: $00
	nop                                              ; $7ceb: $00
	nop                                              ; $7cec: $00
	nop                                              ; $7ced: $00
	nop                                              ; $7cee: $00
	nop                                              ; $7cef: $00
	nop                                              ; $7cf0: $00
	nop                                              ; $7cf1: $00
	nop                                              ; $7cf2: $00
	nop                                              ; $7cf3: $00
	nop                                              ; $7cf4: $00
	nop                                              ; $7cf5: $00
	nop                                              ; $7cf6: $00
	nop                                              ; $7cf7: $00
	nop                                              ; $7cf8: $00
	nop                                              ; $7cf9: $00
	nop                                              ; $7cfa: $00
	nop                                              ; $7cfb: $00
	nop                                              ; $7cfc: $00
	nop                                              ; $7cfd: $00
	nop                                              ; $7cfe: $00
	nop                                              ; $7cff: $00
	nop                                              ; $7d00: $00
	nop                                              ; $7d01: $00
	nop                                              ; $7d02: $00
	nop                                              ; $7d03: $00
	nop                                              ; $7d04: $00
	nop                                              ; $7d05: $00
	nop                                              ; $7d06: $00
	nop                                              ; $7d07: $00
	nop                                              ; $7d08: $00
	nop                                              ; $7d09: $00
	nop                                              ; $7d0a: $00
	nop                                              ; $7d0b: $00
	nop                                              ; $7d0c: $00
	nop                                              ; $7d0d: $00
	nop                                              ; $7d0e: $00
	nop                                              ; $7d0f: $00
	nop                                              ; $7d10: $00
	nop                                              ; $7d11: $00
	nop                                              ; $7d12: $00
	nop                                              ; $7d13: $00
	nop                                              ; $7d14: $00
	nop                                              ; $7d15: $00
	nop                                              ; $7d16: $00
	nop                                              ; $7d17: $00
	nop                                              ; $7d18: $00
	nop                                              ; $7d19: $00
	nop                                              ; $7d1a: $00
	nop                                              ; $7d1b: $00
	nop                                              ; $7d1c: $00
	nop                                              ; $7d1d: $00
	nop                                              ; $7d1e: $00
	nop                                              ; $7d1f: $00
	nop                                              ; $7d20: $00
	nop                                              ; $7d21: $00
	nop                                              ; $7d22: $00
	nop                                              ; $7d23: $00
	nop                                              ; $7d24: $00
	nop                                              ; $7d25: $00
	nop                                              ; $7d26: $00
	nop                                              ; $7d27: $00
	nop                                              ; $7d28: $00
	nop                                              ; $7d29: $00
	nop                                              ; $7d2a: $00
	nop                                              ; $7d2b: $00
	nop                                              ; $7d2c: $00
	nop                                              ; $7d2d: $00
	nop                                              ; $7d2e: $00
	nop                                              ; $7d2f: $00
	nop                                              ; $7d30: $00
	nop                                              ; $7d31: $00
	nop                                              ; $7d32: $00
	nop                                              ; $7d33: $00
	nop                                              ; $7d34: $00
	nop                                              ; $7d35: $00
	nop                                              ; $7d36: $00
	nop                                              ; $7d37: $00
	nop                                              ; $7d38: $00
	nop                                              ; $7d39: $00
	nop                                              ; $7d3a: $00
	nop                                              ; $7d3b: $00
	nop                                              ; $7d3c: $00
	nop                                              ; $7d3d: $00
	nop                                              ; $7d3e: $00
	nop                                              ; $7d3f: $00
	nop                                              ; $7d40: $00
	nop                                              ; $7d41: $00
	nop                                              ; $7d42: $00
	nop                                              ; $7d43: $00
	nop                                              ; $7d44: $00
	nop                                              ; $7d45: $00
	nop                                              ; $7d46: $00
	nop                                              ; $7d47: $00
	nop                                              ; $7d48: $00
	nop                                              ; $7d49: $00
	nop                                              ; $7d4a: $00
	nop                                              ; $7d4b: $00
	nop                                              ; $7d4c: $00
	nop                                              ; $7d4d: $00
	nop                                              ; $7d4e: $00
	nop                                              ; $7d4f: $00
	nop                                              ; $7d50: $00
	nop                                              ; $7d51: $00
	nop                                              ; $7d52: $00
	nop                                              ; $7d53: $00
	nop                                              ; $7d54: $00
	nop                                              ; $7d55: $00
	nop                                              ; $7d56: $00
	nop                                              ; $7d57: $00
	nop                                              ; $7d58: $00
	nop                                              ; $7d59: $00
	nop                                              ; $7d5a: $00
	nop                                              ; $7d5b: $00
	nop                                              ; $7d5c: $00
	nop                                              ; $7d5d: $00
	nop                                              ; $7d5e: $00
	nop                                              ; $7d5f: $00
	nop                                              ; $7d60: $00
	nop                                              ; $7d61: $00
	nop                                              ; $7d62: $00
	nop                                              ; $7d63: $00
	nop                                              ; $7d64: $00
	nop                                              ; $7d65: $00
	nop                                              ; $7d66: $00
	nop                                              ; $7d67: $00
	nop                                              ; $7d68: $00
	nop                                              ; $7d69: $00
	nop                                              ; $7d6a: $00
	nop                                              ; $7d6b: $00
	nop                                              ; $7d6c: $00
	nop                                              ; $7d6d: $00
	nop                                              ; $7d6e: $00
	nop                                              ; $7d6f: $00
	nop                                              ; $7d70: $00
	nop                                              ; $7d71: $00
	nop                                              ; $7d72: $00
	nop                                              ; $7d73: $00
	nop                                              ; $7d74: $00
	nop                                              ; $7d75: $00
	nop                                              ; $7d76: $00
	nop                                              ; $7d77: $00
	nop                                              ; $7d78: $00
	nop                                              ; $7d79: $00
	nop                                              ; $7d7a: $00
	nop                                              ; $7d7b: $00
	nop                                              ; $7d7c: $00
	nop                                              ; $7d7d: $00
	nop                                              ; $7d7e: $00
	nop                                              ; $7d7f: $00
	nop                                              ; $7d80: $00
	nop                                              ; $7d81: $00
	nop                                              ; $7d82: $00
	nop                                              ; $7d83: $00
	nop                                              ; $7d84: $00
	nop                                              ; $7d85: $00
	nop                                              ; $7d86: $00
	nop                                              ; $7d87: $00
	nop                                              ; $7d88: $00
	nop                                              ; $7d89: $00
	nop                                              ; $7d8a: $00
	nop                                              ; $7d8b: $00
	nop                                              ; $7d8c: $00
	nop                                              ; $7d8d: $00
	nop                                              ; $7d8e: $00
	nop                                              ; $7d8f: $00
	nop                                              ; $7d90: $00
	nop                                              ; $7d91: $00
	nop                                              ; $7d92: $00
	nop                                              ; $7d93: $00
	nop                                              ; $7d94: $00
	nop                                              ; $7d95: $00
	nop                                              ; $7d96: $00
	nop                                              ; $7d97: $00
	nop                                              ; $7d98: $00
	nop                                              ; $7d99: $00
	nop                                              ; $7d9a: $00
	nop                                              ; $7d9b: $00
	nop                                              ; $7d9c: $00
	nop                                              ; $7d9d: $00
	nop                                              ; $7d9e: $00
	nop                                              ; $7d9f: $00
	nop                                              ; $7da0: $00
	nop                                              ; $7da1: $00
	nop                                              ; $7da2: $00
	nop                                              ; $7da3: $00
	nop                                              ; $7da4: $00
	nop                                              ; $7da5: $00
	nop                                              ; $7da6: $00
	nop                                              ; $7da7: $00
	nop                                              ; $7da8: $00
	nop                                              ; $7da9: $00
	nop                                              ; $7daa: $00
	nop                                              ; $7dab: $00
	nop                                              ; $7dac: $00
	nop                                              ; $7dad: $00
	nop                                              ; $7dae: $00
	nop                                              ; $7daf: $00
	nop                                              ; $7db0: $00
	nop                                              ; $7db1: $00
	nop                                              ; $7db2: $00
	nop                                              ; $7db3: $00
	nop                                              ; $7db4: $00
	nop                                              ; $7db5: $00
	nop                                              ; $7db6: $00
	nop                                              ; $7db7: $00
	nop                                              ; $7db8: $00
	nop                                              ; $7db9: $00
	nop                                              ; $7dba: $00
	nop                                              ; $7dbb: $00
	nop                                              ; $7dbc: $00
	nop                                              ; $7dbd: $00
	nop                                              ; $7dbe: $00
	nop                                              ; $7dbf: $00
	nop                                              ; $7dc0: $00
	nop                                              ; $7dc1: $00
	nop                                              ; $7dc2: $00
	nop                                              ; $7dc3: $00
	nop                                              ; $7dc4: $00
	nop                                              ; $7dc5: $00
	nop                                              ; $7dc6: $00
	nop                                              ; $7dc7: $00
	nop                                              ; $7dc8: $00
	nop                                              ; $7dc9: $00
	nop                                              ; $7dca: $00
	nop                                              ; $7dcb: $00
	nop                                              ; $7dcc: $00
	nop                                              ; $7dcd: $00
	nop                                              ; $7dce: $00
	nop                                              ; $7dcf: $00
	nop                                              ; $7dd0: $00
	nop                                              ; $7dd1: $00
	nop                                              ; $7dd2: $00
	nop                                              ; $7dd3: $00
	nop                                              ; $7dd4: $00
	nop                                              ; $7dd5: $00
	nop                                              ; $7dd6: $00
	nop                                              ; $7dd7: $00
	nop                                              ; $7dd8: $00
	nop                                              ; $7dd9: $00
	nop                                              ; $7dda: $00
	nop                                              ; $7ddb: $00
	nop                                              ; $7ddc: $00
	nop                                              ; $7ddd: $00
	nop                                              ; $7dde: $00
	nop                                              ; $7ddf: $00
	nop                                              ; $7de0: $00
	nop                                              ; $7de1: $00
	nop                                              ; $7de2: $00
	nop                                              ; $7de3: $00
	nop                                              ; $7de4: $00
	nop                                              ; $7de5: $00
	nop                                              ; $7de6: $00
	nop                                              ; $7de7: $00
	nop                                              ; $7de8: $00
	nop                                              ; $7de9: $00
	nop                                              ; $7dea: $00
	nop                                              ; $7deb: $00
	nop                                              ; $7dec: $00
	nop                                              ; $7ded: $00
	nop                                              ; $7dee: $00
	nop                                              ; $7def: $00
	nop                                              ; $7df0: $00
	nop                                              ; $7df1: $00
	nop                                              ; $7df2: $00
	nop                                              ; $7df3: $00
	nop                                              ; $7df4: $00
	nop                                              ; $7df5: $00
	nop                                              ; $7df6: $00
	nop                                              ; $7df7: $00
	nop                                              ; $7df8: $00
	nop                                              ; $7df9: $00
	nop                                              ; $7dfa: $00
	nop                                              ; $7dfb: $00
	nop                                              ; $7dfc: $00
	nop                                              ; $7dfd: $00
	nop                                              ; $7dfe: $00
	nop                                              ; $7dff: $00
	nop                                              ; $7e00: $00
	nop                                              ; $7e01: $00
	nop                                              ; $7e02: $00
	nop                                              ; $7e03: $00
	nop                                              ; $7e04: $00
	nop                                              ; $7e05: $00
	nop                                              ; $7e06: $00
	nop                                              ; $7e07: $00
	nop                                              ; $7e08: $00
	nop                                              ; $7e09: $00
	nop                                              ; $7e0a: $00
	nop                                              ; $7e0b: $00
	nop                                              ; $7e0c: $00
	nop                                              ; $7e0d: $00
	nop                                              ; $7e0e: $00
	nop                                              ; $7e0f: $00
	nop                                              ; $7e10: $00
	nop                                              ; $7e11: $00
	nop                                              ; $7e12: $00
	nop                                              ; $7e13: $00
	nop                                              ; $7e14: $00
	nop                                              ; $7e15: $00
	nop                                              ; $7e16: $00
	nop                                              ; $7e17: $00
	nop                                              ; $7e18: $00
	nop                                              ; $7e19: $00
	nop                                              ; $7e1a: $00
	nop                                              ; $7e1b: $00
	nop                                              ; $7e1c: $00
	nop                                              ; $7e1d: $00
	nop                                              ; $7e1e: $00
	nop                                              ; $7e1f: $00
	nop                                              ; $7e20: $00
	nop                                              ; $7e21: $00
	nop                                              ; $7e22: $00
	nop                                              ; $7e23: $00
	nop                                              ; $7e24: $00
	nop                                              ; $7e25: $00
	nop                                              ; $7e26: $00
	nop                                              ; $7e27: $00
	nop                                              ; $7e28: $00
	nop                                              ; $7e29: $00
	nop                                              ; $7e2a: $00
	nop                                              ; $7e2b: $00
	nop                                              ; $7e2c: $00
	nop                                              ; $7e2d: $00
	nop                                              ; $7e2e: $00
	nop                                              ; $7e2f: $00
	nop                                              ; $7e30: $00
	nop                                              ; $7e31: $00
	nop                                              ; $7e32: $00
	nop                                              ; $7e33: $00
	nop                                              ; $7e34: $00
	nop                                              ; $7e35: $00
	nop                                              ; $7e36: $00
	nop                                              ; $7e37: $00
	nop                                              ; $7e38: $00
	nop                                              ; $7e39: $00
	nop                                              ; $7e3a: $00
	nop                                              ; $7e3b: $00
	nop                                              ; $7e3c: $00
	nop                                              ; $7e3d: $00
	nop                                              ; $7e3e: $00
	nop                                              ; $7e3f: $00
	nop                                              ; $7e40: $00
	nop                                              ; $7e41: $00
	nop                                              ; $7e42: $00
	nop                                              ; $7e43: $00
	nop                                              ; $7e44: $00
	nop                                              ; $7e45: $00
	nop                                              ; $7e46: $00
	nop                                              ; $7e47: $00
	nop                                              ; $7e48: $00
	nop                                              ; $7e49: $00
	nop                                              ; $7e4a: $00
	nop                                              ; $7e4b: $00
	nop                                              ; $7e4c: $00
	nop                                              ; $7e4d: $00
	nop                                              ; $7e4e: $00
	nop                                              ; $7e4f: $00
	nop                                              ; $7e50: $00
	nop                                              ; $7e51: $00
	nop                                              ; $7e52: $00
	nop                                              ; $7e53: $00
	nop                                              ; $7e54: $00
	nop                                              ; $7e55: $00
	nop                                              ; $7e56: $00
	nop                                              ; $7e57: $00
	nop                                              ; $7e58: $00
	nop                                              ; $7e59: $00
	nop                                              ; $7e5a: $00
	nop                                              ; $7e5b: $00
	nop                                              ; $7e5c: $00
	nop                                              ; $7e5d: $00
	nop                                              ; $7e5e: $00
	nop                                              ; $7e5f: $00
	nop                                              ; $7e60: $00
	nop                                              ; $7e61: $00
	nop                                              ; $7e62: $00
	nop                                              ; $7e63: $00
	nop                                              ; $7e64: $00
	nop                                              ; $7e65: $00
	nop                                              ; $7e66: $00
	nop                                              ; $7e67: $00
	nop                                              ; $7e68: $00
	nop                                              ; $7e69: $00
	nop                                              ; $7e6a: $00
	nop                                              ; $7e6b: $00
	nop                                              ; $7e6c: $00
	nop                                              ; $7e6d: $00
	nop                                              ; $7e6e: $00
	nop                                              ; $7e6f: $00
	nop                                              ; $7e70: $00
	nop                                              ; $7e71: $00
	nop                                              ; $7e72: $00
	nop                                              ; $7e73: $00
	nop                                              ; $7e74: $00
	nop                                              ; $7e75: $00
	nop                                              ; $7e76: $00
	nop                                              ; $7e77: $00
	nop                                              ; $7e78: $00
	nop                                              ; $7e79: $00
	nop                                              ; $7e7a: $00
	nop                                              ; $7e7b: $00
	nop                                              ; $7e7c: $00
	nop                                              ; $7e7d: $00
	nop                                              ; $7e7e: $00
	nop                                              ; $7e7f: $00
	nop                                              ; $7e80: $00
	nop                                              ; $7e81: $00
	nop                                              ; $7e82: $00
	nop                                              ; $7e83: $00
	nop                                              ; $7e84: $00
	nop                                              ; $7e85: $00
	nop                                              ; $7e86: $00
	nop                                              ; $7e87: $00
	nop                                              ; $7e88: $00
	nop                                              ; $7e89: $00
	nop                                              ; $7e8a: $00
	nop                                              ; $7e8b: $00
	nop                                              ; $7e8c: $00
	nop                                              ; $7e8d: $00
	nop                                              ; $7e8e: $00
	nop                                              ; $7e8f: $00
	nop                                              ; $7e90: $00
	nop                                              ; $7e91: $00
	nop                                              ; $7e92: $00
	nop                                              ; $7e93: $00
	nop                                              ; $7e94: $00
	nop                                              ; $7e95: $00
	nop                                              ; $7e96: $00
	nop                                              ; $7e97: $00
	nop                                              ; $7e98: $00
	nop                                              ; $7e99: $00
	nop                                              ; $7e9a: $00
	nop                                              ; $7e9b: $00
	nop                                              ; $7e9c: $00
	nop                                              ; $7e9d: $00
	nop                                              ; $7e9e: $00
	nop                                              ; $7e9f: $00
	nop                                              ; $7ea0: $00
	nop                                              ; $7ea1: $00
	nop                                              ; $7ea2: $00
	nop                                              ; $7ea3: $00
	nop                                              ; $7ea4: $00
	nop                                              ; $7ea5: $00
	nop                                              ; $7ea6: $00
	nop                                              ; $7ea7: $00
	nop                                              ; $7ea8: $00
	nop                                              ; $7ea9: $00
	nop                                              ; $7eaa: $00
	nop                                              ; $7eab: $00
	nop                                              ; $7eac: $00
	nop                                              ; $7ead: $00
	nop                                              ; $7eae: $00
	nop                                              ; $7eaf: $00
	nop                                              ; $7eb0: $00
	nop                                              ; $7eb1: $00
	nop                                              ; $7eb2: $00
	nop                                              ; $7eb3: $00
	nop                                              ; $7eb4: $00
	nop                                              ; $7eb5: $00
	nop                                              ; $7eb6: $00
	nop                                              ; $7eb7: $00
	nop                                              ; $7eb8: $00
	nop                                              ; $7eb9: $00
	nop                                              ; $7eba: $00
	nop                                              ; $7ebb: $00
	nop                                              ; $7ebc: $00
	nop                                              ; $7ebd: $00
	nop                                              ; $7ebe: $00
	nop                                              ; $7ebf: $00
	nop                                              ; $7ec0: $00
	nop                                              ; $7ec1: $00
	nop                                              ; $7ec2: $00
	nop                                              ; $7ec3: $00
	nop                                              ; $7ec4: $00
	nop                                              ; $7ec5: $00
	nop                                              ; $7ec6: $00
	nop                                              ; $7ec7: $00
	nop                                              ; $7ec8: $00
	nop                                              ; $7ec9: $00
	nop                                              ; $7eca: $00
	nop                                              ; $7ecb: $00
	nop                                              ; $7ecc: $00
	nop                                              ; $7ecd: $00
	nop                                              ; $7ece: $00
	nop                                              ; $7ecf: $00
	nop                                              ; $7ed0: $00
	nop                                              ; $7ed1: $00
	nop                                              ; $7ed2: $00
	nop                                              ; $7ed3: $00
	nop                                              ; $7ed4: $00
	nop                                              ; $7ed5: $00
	nop                                              ; $7ed6: $00
	nop                                              ; $7ed7: $00
	nop                                              ; $7ed8: $00
	nop                                              ; $7ed9: $00
	nop                                              ; $7eda: $00
	nop                                              ; $7edb: $00
	nop                                              ; $7edc: $00
	nop                                              ; $7edd: $00
	nop                                              ; $7ede: $00
	nop                                              ; $7edf: $00
	nop                                              ; $7ee0: $00
	nop                                              ; $7ee1: $00
	nop                                              ; $7ee2: $00
	nop                                              ; $7ee3: $00
	nop                                              ; $7ee4: $00
	nop                                              ; $7ee5: $00
	nop                                              ; $7ee6: $00
	nop                                              ; $7ee7: $00
	nop                                              ; $7ee8: $00
	nop                                              ; $7ee9: $00
	nop                                              ; $7eea: $00
	nop                                              ; $7eeb: $00
	nop                                              ; $7eec: $00
	nop                                              ; $7eed: $00
	nop                                              ; $7eee: $00
	nop                                              ; $7eef: $00
	nop                                              ; $7ef0: $00
	nop                                              ; $7ef1: $00
	nop                                              ; $7ef2: $00
	nop                                              ; $7ef3: $00
	nop                                              ; $7ef4: $00
	nop                                              ; $7ef5: $00
	nop                                              ; $7ef6: $00
	nop                                              ; $7ef7: $00
	nop                                              ; $7ef8: $00
	nop                                              ; $7ef9: $00
	nop                                              ; $7efa: $00
	nop                                              ; $7efb: $00
	nop                                              ; $7efc: $00
	nop                                              ; $7efd: $00
	nop                                              ; $7efe: $00
	nop                                              ; $7eff: $00
	nop                                              ; $7f00: $00
	nop                                              ; $7f01: $00
	nop                                              ; $7f02: $00
	nop                                              ; $7f03: $00
	nop                                              ; $7f04: $00
	nop                                              ; $7f05: $00
	nop                                              ; $7f06: $00
	nop                                              ; $7f07: $00
	nop                                              ; $7f08: $00
	nop                                              ; $7f09: $00
	nop                                              ; $7f0a: $00
	nop                                              ; $7f0b: $00
	nop                                              ; $7f0c: $00
	nop                                              ; $7f0d: $00
	nop                                              ; $7f0e: $00
	nop                                              ; $7f0f: $00
	nop                                              ; $7f10: $00
	nop                                              ; $7f11: $00
	nop                                              ; $7f12: $00
	nop                                              ; $7f13: $00
	nop                                              ; $7f14: $00
	nop                                              ; $7f15: $00
	nop                                              ; $7f16: $00
	nop                                              ; $7f17: $00
	nop                                              ; $7f18: $00
	nop                                              ; $7f19: $00
	nop                                              ; $7f1a: $00
	nop                                              ; $7f1b: $00
	nop                                              ; $7f1c: $00
	nop                                              ; $7f1d: $00
	nop                                              ; $7f1e: $00
	nop                                              ; $7f1f: $00
	nop                                              ; $7f20: $00
	nop                                              ; $7f21: $00
	nop                                              ; $7f22: $00
	nop                                              ; $7f23: $00
	nop                                              ; $7f24: $00
	nop                                              ; $7f25: $00
	nop                                              ; $7f26: $00
	nop                                              ; $7f27: $00
	nop                                              ; $7f28: $00
	nop                                              ; $7f29: $00
	nop                                              ; $7f2a: $00
	nop                                              ; $7f2b: $00
	nop                                              ; $7f2c: $00
	nop                                              ; $7f2d: $00
	nop                                              ; $7f2e: $00
	nop                                              ; $7f2f: $00
	nop                                              ; $7f30: $00
	nop                                              ; $7f31: $00
	nop                                              ; $7f32: $00
	nop                                              ; $7f33: $00
	nop                                              ; $7f34: $00
	nop                                              ; $7f35: $00
	nop                                              ; $7f36: $00
	nop                                              ; $7f37: $00
	nop                                              ; $7f38: $00
	nop                                              ; $7f39: $00
	nop                                              ; $7f3a: $00
	nop                                              ; $7f3b: $00
	nop                                              ; $7f3c: $00
	nop                                              ; $7f3d: $00
	nop                                              ; $7f3e: $00
	nop                                              ; $7f3f: $00
	nop                                              ; $7f40: $00
	nop                                              ; $7f41: $00
	nop                                              ; $7f42: $00
	nop                                              ; $7f43: $00
	nop                                              ; $7f44: $00
	nop                                              ; $7f45: $00
	nop                                              ; $7f46: $00
	nop                                              ; $7f47: $00
	nop                                              ; $7f48: $00
	nop                                              ; $7f49: $00
	nop                                              ; $7f4a: $00
	nop                                              ; $7f4b: $00
	nop                                              ; $7f4c: $00
	nop                                              ; $7f4d: $00
	nop                                              ; $7f4e: $00
	nop                                              ; $7f4f: $00
	nop                                              ; $7f50: $00
	nop                                              ; $7f51: $00
	nop                                              ; $7f52: $00
	nop                                              ; $7f53: $00
	nop                                              ; $7f54: $00
	nop                                              ; $7f55: $00
	nop                                              ; $7f56: $00
	nop                                              ; $7f57: $00
	nop                                              ; $7f58: $00
	nop                                              ; $7f59: $00
	nop                                              ; $7f5a: $00
	nop                                              ; $7f5b: $00
	nop                                              ; $7f5c: $00
	nop                                              ; $7f5d: $00
	nop                                              ; $7f5e: $00
	nop                                              ; $7f5f: $00
	nop                                              ; $7f60: $00
	nop                                              ; $7f61: $00
	nop                                              ; $7f62: $00
	nop                                              ; $7f63: $00
	nop                                              ; $7f64: $00
	nop                                              ; $7f65: $00
	nop                                              ; $7f66: $00
	nop                                              ; $7f67: $00
	nop                                              ; $7f68: $00
	nop                                              ; $7f69: $00
	nop                                              ; $7f6a: $00
	nop                                              ; $7f6b: $00
	nop                                              ; $7f6c: $00
	nop                                              ; $7f6d: $00
	nop                                              ; $7f6e: $00
	nop                                              ; $7f6f: $00
	nop                                              ; $7f70: $00
	nop                                              ; $7f71: $00
	nop                                              ; $7f72: $00
	nop                                              ; $7f73: $00
	nop                                              ; $7f74: $00
	nop                                              ; $7f75: $00
	nop                                              ; $7f76: $00
	nop                                              ; $7f77: $00
	nop                                              ; $7f78: $00
	nop                                              ; $7f79: $00
	nop                                              ; $7f7a: $00
	nop                                              ; $7f7b: $00
	nop                                              ; $7f7c: $00
	nop                                              ; $7f7d: $00
	nop                                              ; $7f7e: $00
	nop                                              ; $7f7f: $00
	nop                                              ; $7f80: $00
	nop                                              ; $7f81: $00
	nop                                              ; $7f82: $00
	nop                                              ; $7f83: $00
	nop                                              ; $7f84: $00
	nop                                              ; $7f85: $00
	nop                                              ; $7f86: $00
	nop                                              ; $7f87: $00
	nop                                              ; $7f88: $00
	nop                                              ; $7f89: $00
	nop                                              ; $7f8a: $00
	nop                                              ; $7f8b: $00
	nop                                              ; $7f8c: $00
	nop                                              ; $7f8d: $00
	nop                                              ; $7f8e: $00
	nop                                              ; $7f8f: $00
	nop                                              ; $7f90: $00
	nop                                              ; $7f91: $00
	nop                                              ; $7f92: $00
	nop                                              ; $7f93: $00
	nop                                              ; $7f94: $00
	nop                                              ; $7f95: $00
	nop                                              ; $7f96: $00
	nop                                              ; $7f97: $00
	nop                                              ; $7f98: $00
	nop                                              ; $7f99: $00
	nop                                              ; $7f9a: $00
	nop                                              ; $7f9b: $00
	nop                                              ; $7f9c: $00
	nop                                              ; $7f9d: $00
	nop                                              ; $7f9e: $00
	nop                                              ; $7f9f: $00
	nop                                              ; $7fa0: $00
	nop                                              ; $7fa1: $00
	nop                                              ; $7fa2: $00
	nop                                              ; $7fa3: $00
	nop                                              ; $7fa4: $00
	nop                                              ; $7fa5: $00
	nop                                              ; $7fa6: $00
	nop                                              ; $7fa7: $00
	nop                                              ; $7fa8: $00
	nop                                              ; $7fa9: $00
	nop                                              ; $7faa: $00
	nop                                              ; $7fab: $00
	nop                                              ; $7fac: $00
	nop                                              ; $7fad: $00
	nop                                              ; $7fae: $00
	nop                                              ; $7faf: $00
	nop                                              ; $7fb0: $00
	nop                                              ; $7fb1: $00
	nop                                              ; $7fb2: $00
	nop                                              ; $7fb3: $00
	nop                                              ; $7fb4: $00
	nop                                              ; $7fb5: $00
	nop                                              ; $7fb6: $00
	nop                                              ; $7fb7: $00
	nop                                              ; $7fb8: $00
	nop                                              ; $7fb9: $00
	nop                                              ; $7fba: $00
	nop                                              ; $7fbb: $00
	nop                                              ; $7fbc: $00
	nop                                              ; $7fbd: $00
	nop                                              ; $7fbe: $00
	nop                                              ; $7fbf: $00
	nop                                              ; $7fc0: $00
	nop                                              ; $7fc1: $00
	nop                                              ; $7fc2: $00
	nop                                              ; $7fc3: $00
	nop                                              ; $7fc4: $00
	nop                                              ; $7fc5: $00
	nop                                              ; $7fc6: $00
	nop                                              ; $7fc7: $00
	nop                                              ; $7fc8: $00
	nop                                              ; $7fc9: $00
	nop                                              ; $7fca: $00
	nop                                              ; $7fcb: $00
	nop                                              ; $7fcc: $00
	nop                                              ; $7fcd: $00
	nop                                              ; $7fce: $00
	nop                                              ; $7fcf: $00
	nop                                              ; $7fd0: $00
	nop                                              ; $7fd1: $00
	nop                                              ; $7fd2: $00
	nop                                              ; $7fd3: $00
	nop                                              ; $7fd4: $00
	nop                                              ; $7fd5: $00
	nop                                              ; $7fd6: $00
	nop                                              ; $7fd7: $00
	nop                                              ; $7fd8: $00
	nop                                              ; $7fd9: $00
	nop                                              ; $7fda: $00
	nop                                              ; $7fdb: $00
	nop                                              ; $7fdc: $00
	nop                                              ; $7fdd: $00
	nop                                              ; $7fde: $00
	nop                                              ; $7fdf: $00
	nop                                              ; $7fe0: $00
	nop                                              ; $7fe1: $00
	nop                                              ; $7fe2: $00
	nop                                              ; $7fe3: $00
	nop                                              ; $7fe4: $00
	nop                                              ; $7fe5: $00
	nop                                              ; $7fe6: $00
	nop                                              ; $7fe7: $00
	nop                                              ; $7fe8: $00
	nop                                              ; $7fe9: $00
	nop                                              ; $7fea: $00
	nop                                              ; $7feb: $00
	nop                                              ; $7fec: $00
	nop                                              ; $7fed: $00
	nop                                              ; $7fee: $00
	nop                                              ; $7fef: $00
	nop                                              ; $7ff0: $00
	nop                                              ; $7ff1: $00
	nop                                              ; $7ff2: $00
	nop                                              ; $7ff3: $00
	nop                                              ; $7ff4: $00
	nop                                              ; $7ff5: $00
	nop                                              ; $7ff6: $00
	nop                                              ; $7ff7: $00
	nop                                              ; $7ff8: $00
	nop                                              ; $7ff9: $00
	nop                                              ; $7ffa: $00
	nop                                              ; $7ffb: $00
	nop                                              ; $7ffc: $00
	nop                                              ; $7ffd: $00
	nop                                              ; $7ffe: $00
	nop                                              ; $7fff: $00
