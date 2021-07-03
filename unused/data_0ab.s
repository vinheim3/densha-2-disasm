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
    inc  a                                           ; $4020: $3c
    inc  a                                           ; $4021: $3c
    ld   a, [hl]                                     ; $4022: $7e
    ld   a, [hl]                                     ; $4023: $7e
    ld   h, b                                        ; $4024: $60
    db   $f4                                         ; $4025: $f4
    add  b                                           ; $4026: $80
    ret  z                                           ; $4027: $c8

    nop                                              ; $4028: $00
    nop                                              ; $4029: $00
    nop                                              ; $402a: $00
    jr   nz, jr_0ab_402d                             ; $402b: $20 $00

    jr_0ab_402d:
    nop                                              ; $402d: $00
    nop                                              ; $402e: $00
    nop                                              ; $402f: $00
    nop                                              ; $4030: $00
    nop                                              ; $4031: $00
    nop                                              ; $4032: $00
    stop                                             ; $4033: $10 $00
    nop                                              ; $4035: $00
    nop                                              ; $4036: $00
    nop                                              ; $4037: $00
    nop                                              ; $4038: $00
    nop                                              ; $4039: $00
    nop                                              ; $403a: $00
    nop                                              ; $403b: $00
    ld   [$0008], sp                                 ; $403c: $08 $08 $00
    jr   jr_0ab_4041                                 ; $403f: $18 $00

    jr_0ab_4041:
    nop                                              ; $4041: $00
    nop                                              ; $4042: $00
    nop                                              ; $4043: $00
    nop                                              ; $4044: $00
    nop                                              ; $4045: $00
    nop                                              ; $4046: $00
    nop                                              ; $4047: $00
    dec  de                                          ; $4048: $1b
    dec  de                                          ; $4049: $1b
    nop                                              ; $404a: $00
    ld   bc, $0c0c                                   ; $404b: $01 $0c $0c
    inc  b                                           ; $404e: $04
    ld   b, $00                                      ; $404f: $06 $00
    ld   [bc], a                                     ; $4051: $02
    nop                                              ; $4052: $00
    nop                                              ; $4053: $00
    nop                                              ; $4054: $00
    nop                                              ; $4055: $00
    nop                                              ; $4056: $00
    nop                                              ; $4057: $00
    nop                                              ; $4058: $00
    nop                                              ; $4059: $00
    nop                                              ; $405a: $00
    nop                                              ; $405b: $00
    nop                                              ; $405c: $00
    nop                                              ; $405d: $00
    nop                                              ; $405e: $00
    nop                                              ; $405f: $00
    inc  b                                           ; $4060: $04
    inc  b                                           ; $4061: $04
    inc  b                                           ; $4062: $04
    ld   [$0804], sp                                 ; $4063: $08 $04 $08
    jr   nc, @+$72                                   ; $4066: $30 $70

    ldh  a, [$f0]                                    ; $4068: $f0 $f0
    ldh  a, [c]                                      ; $406a: $f2
    di                                               ; $406b: $f3
    ld   [hl], e                                     ; $406c: $73
    ld   [hl], e                                     ; $406d: $73
    ld   [hl], e                                     ; $406e: $73
    ld   [hl], e                                     ; $406f: $73
    ld   [hl], e                                     ; $4070: $73
    di                                               ; $4071: $f3
    or   e                                           ; $4072: $b3
    di                                               ; $4073: $f3
    inc  bc                                          ; $4074: $03
    ld   [hl], e                                     ; $4075: $73
    rlca                                             ; $4076: $07
    ld   h, a                                        ; $4077: $67
    inc  b                                           ; $4078: $04
    inc  h                                           ; $4079: $24
    nop                                              ; $407a: $00
    jr   nz, jr_0ab_407d                             ; $407b: $20 $00

    jr_0ab_407d:
    nop                                              ; $407d: $00
    nop                                              ; $407e: $00
    nop                                              ; $407f: $00
    nop                                              ; $4080: $00
    nop                                              ; $4081: $00
    nop                                              ; $4082: $00
    nop                                              ; $4083: $00
    nop                                              ; $4084: $00
    nop                                              ; $4085: $00
    nop                                              ; $4086: $00
    nop                                              ; $4087: $00
    nop                                              ; $4088: $00
    nop                                              ; $4089: $00
    nop                                              ; $408a: $00
    add  b                                           ; $408b: $80
    ret  nz                                          ; $408c: $c0

    ldh  [$e0], a                                    ; $408d: $e0 $e0
    ldh  a, [$f0]                                    ; $408f: $f0 $f0
    ld   hl, sp-$20                                  ; $4091: $f8 $e0
    ld   hl, sp-$20                                  ; $4093: $f8 $e0
    ldh  a, [$e0]                                    ; $4095: $f0 $e0
    ldh  [rLCDC], a                                  ; $4097: $e0 $40
    ld   e, b                                        ; $4099: $58
    db   $10                                         ; $409a: $10
    jr   c, jr_0ab_40cd                              ; $409b: $38 $30

    jr   c, jr_0ab_40bf                              ; $409d: $38 $20

    jr   c, jr_0ab_40a1                              ; $409f: $38 $00

    jr_0ab_40a1:
    nop                                              ; $40a1: $00
    nop                                              ; $40a2: $00
    nop                                              ; $40a3: $00
    nop                                              ; $40a4: $00
    nop                                              ; $40a5: $00
    nop                                              ; $40a6: $00
    nop                                              ; $40a7: $00
    ld   bc, $0005                                   ; $40a8: $01 $05 $00
    nop                                              ; $40ab: $00
    inc  b                                           ; $40ac: $04
    ld   b, $02                                      ; $40ad: $06 $02
    ld   b, $00                                      ; $40af: $06 $00
    ld   [bc], a                                     ; $40b1: $02
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

    jr_0ab_40bf:
    nop                                              ; $40bf: $00
    ld   [bc], a                                     ; $40c0: $02
    ld   [bc], a                                     ; $40c1: $02
    ld   [bc], a                                     ; $40c2: $02
    inc  b                                           ; $40c3: $04
    ld   [bc], a                                     ; $40c4: $02
    inc  b                                           ; $40c5: $04
    ld   [bc], a                                     ; $40c6: $02
    ld   [bc], a                                     ; $40c7: $02
    ld   hl, sp-$08                                  ; $40c8: $f8 $f8
    ld   sp, hl                                      ; $40ca: $f9
    ld   sp, hl                                      ; $40cb: $f9
    add  hl, sp                                      ; $40cc: $39

    jr_0ab_40cd:
    ld   a, c                                        ; $40cd: $79
    add  hl, sp                                      ; $40ce: $39
    ld   a, c                                        ; $40cf: $79
    add  hl, sp                                      ; $40d0: $39
    add  hl, sp                                      ; $40d1: $39
    add  hl, sp                                      ; $40d2: $39
    add  hl, sp                                      ; $40d3: $39
    add  hl, de                                      ; $40d4: $19
    add  hl, sp                                      ; $40d5: $39
    ld   bc, $0033                                   ; $40d6: $01 $33 $00
    inc  sp                                          ; $40d9: $33
    nop                                              ; $40da: $00
    ld   [de], a                                     ; $40db: $12
    nop                                              ; $40dc: $00
    nop                                              ; $40dd: $00
    nop                                              ; $40de: $00
    nop                                              ; $40df: $00
    nop                                              ; $40e0: $00
    nop                                              ; $40e1: $00
    nop                                              ; $40e2: $00
    nop                                              ; $40e3: $00
    nop                                              ; $40e4: $00
    nop                                              ; $40e5: $00
    nop                                              ; $40e6: $00
    nop                                              ; $40e7: $00
    nop                                              ; $40e8: $00
    nop                                              ; $40e9: $00
    nop                                              ; $40ea: $00
    add  b                                           ; $40eb: $80
    ret  nz                                          ; $40ec: $c0

    ldh  [$f0], a                                    ; $40ed: $e0 $f0
    ldh  a, [$f8]                                    ; $40ef: $f0 $f8
    ld   hl, sp-$10                                  ; $40f1: $f8 $f0
    db   $fc                                         ; $40f3: $fc
    ldh  a, [$f8]                                    ; $40f4: $f0 $f8
    ldh  a, [$f0]                                    ; $40f6: $f0 $f0
    jr   nz, jr_0ab_4132                             ; $40f8: $20 $38

    nop                                              ; $40fa: $00
    inc  a                                           ; $40fb: $3c
    ld   [$101c], sp                                 ; $40fc: $08 $1c $10
    inc  e                                           ; $40ff: $1c
    nop                                              ; $4100: $00
    nop                                              ; $4101: $00
    ld   bc, $0301                                   ; $4102: $01 $01 $03
    ld   bc, $0103                                   ; $4105: $01 $03 $01
    inc  bc                                          ; $4108: $03
    ld   bc, $0103                                   ; $4109: $01 $03 $01
    inc  bc                                          ; $410c: $03
    ld   bc, $0103                                   ; $410d: $01 $03 $01
    ld   bc, $0101                                   ; $4110: $01 $01 $01
    ld   bc, $0001                                   ; $4113: $01 $01 $00
    nop                                              ; $4116: $00
    nop                                              ; $4117: $00
    ld   c, $06                                      ; $4118: $0e $06
    ld   a, c                                        ; $411a: $79
    add  hl, bc                                      ; $411b: $09
    inc  b                                           ; $411c: $04
    nop                                              ; $411d: $00
    nop                                              ; $411e: $00
    nop                                              ; $411f: $00
    nop                                              ; $4120: $00
    nop                                              ; $4121: $00
    sub  b                                           ; $4122: $90
    ldh  [$80], a                                    ; $4123: $e0 $80
    rst  $38                                         ; $4125: $ff
    nop                                              ; $4126: $00
    ldh  [rP1], a                                    ; $4127: $e0 $00
    ret  nz                                          ; $4129: $c0

    nop                                              ; $412a: $00
    ret  nz                                          ; $412b: $c0

    nop                                              ; $412c: $00
    ret  nz                                          ; $412d: $c0

    add  b                                           ; $412e: $80
    ret  nz                                          ; $412f: $c0

    add  b                                           ; $4130: $80
    ret  nz                                          ; $4131: $c0

    jr_0ab_4132:
    add  b                                           ; $4132: $80
    add  b                                           ; $4133: $80
    add  c                                           ; $4134: $81
    ret  nz                                          ; $4135: $c0

    nop                                              ; $4136: $00
    ld   bc, $607c                                   ; $4137: $01 $7c $60
    ldh  a, [rIE]                                    ; $413a: $f0 $ff
    daa                                              ; $413c: $27
    jr   jr_0ab_4140                                 ; $413d: $18 $01

    nop                                              ; $413f: $00

    Jump_0ab_4140:
    jr_0ab_4140:
    nop                                              ; $4140: $00
    nop                                              ; $4141: $00
    nop                                              ; $4142: $00
    nop                                              ; $4143: $00
    add  b                                           ; $4144: $80
    nop                                              ; $4145: $00
    inc  b                                           ; $4146: $04
    ld   a, b                                        ; $4147: $78

    jr_0ab_4148:
    nop                                              ; $4148: $00
    rra                                              ; $4149: $1f

    jr_0ab_414a:
    nop                                              ; $414a: $00
    rra                                              ; $414b: $1f
    nop                                              ; $414c: $00
    rra                                              ; $414d: $1f
    jr   nz, jr_0ab_416f                             ; $414e: $20 $1f

    jr   nz, jr_0ab_4171                             ; $4150: $20 $1f

    nop                                              ; $4152: $00
    rra                                              ; $4153: $1f
    add  b                                           ; $4154: $80
    rra                                              ; $4155: $1f
    ld   [bc], a                                     ; $4156: $02
    pop  bc                                          ; $4157: $c1
    ld   [bc], a                                     ; $4158: $02
    inc  e                                           ; $4159: $1c
    jp   nz, $f801                                   ; $415a: $c2 $01 $f8

    nop                                              ; $415d: $00
    cp   $00                                         ; $415e: $fe $00
    add  b                                           ; $4160: $80
    nop                                              ; $4161: $00
    nop                                              ; $4162: $00
    ldh  [$08], a                                    ; $4163: $e0 $08
    ldh  a, [rSC]                                    ; $4165: $f0 $02
    db   $fc                                         ; $4167: $fc
    nop                                              ; $4168: $00
    rst  $38                                         ; $4169: $ff
    nop                                              ; $416a: $00
    rst  $38                                         ; $416b: $ff
    nop                                              ; $416c: $00
    rst  $38                                         ; $416d: $ff
    nop                                              ; $416e: $00

    jr_0ab_416f:
    rst  $38                                         ; $416f: $ff
    nop                                              ; $4170: $00

    jr_0ab_4171:
    ld   a, a                                        ; $4171: $7f
    nop                                              ; $4172: $00
    sbc  a                                           ; $4173: $9f
    and  b                                           ; $4174: $a0
    ld   b, a                                        ; $4175: $47
    nop                                              ; $4176: $00
    inc  hl                                          ; $4177: $23
    nop                                              ; $4178: $00
    nop                                              ; $4179: $00
    nop                                              ; $417a: $00
    ld   [bc], a                                     ; $417b: $02
    dec  b                                           ; $417c: $05
    ld   [bc], a                                     ; $417d: $02
    nop                                              ; $417e: $00
    nop                                              ; $417f: $00
    nop                                              ; $4180: $00
    nop                                              ; $4181: $00
    nop                                              ; $4182: $00
    nop                                              ; $4183: $00
    nop                                              ; $4184: $00
    add  b                                           ; $4185: $80
    jr   nz, jr_0ab_4148                             ; $4186: $20 $c0

    jr   c, jr_0ab_414a                              ; $4188: $38 $c0

    ld   a, $c0                                      ; $418a: $3e $c0
    ld   a, $c0                                      ; $418c: $3e $c0
    ld   a, [hl]                                     ; $418e: $7e
    add  b                                           ; $418f: $80
    cp   $00                                         ; $4190: $fe $00
    db   $fc                                         ; $4192: $fc
    nop                                              ; $4193: $00
    inc  a                                           ; $4194: $3c
    nop                                              ; $4195: $00
    adc  b                                           ; $4196: $88
    nop                                              ; $4197: $00
    ldh  [rP1], a                                    ; $4198: $e0 $00
    ld   [hl], b                                     ; $419a: $70
    nop                                              ; $419b: $00
    stop                                             ; $419c: $10 $00
    nop                                              ; $419e: $00
    nop                                              ; $419f: $00
    nop                                              ; $41a0: $00
    nop                                              ; $41a1: $00
    nop                                              ; $41a2: $00
    nop                                              ; $41a3: $00
    nop                                              ; $41a4: $00
    nop                                              ; $41a5: $00
    nop                                              ; $41a6: $00
    nop                                              ; $41a7: $00
    nop                                              ; $41a8: $00
    nop                                              ; $41a9: $00
    nop                                              ; $41aa: $00
    nop                                              ; $41ab: $00
    nop                                              ; $41ac: $00
    nop                                              ; $41ad: $00
    nop                                              ; $41ae: $00
    nop                                              ; $41af: $00
    nop                                              ; $41b0: $00
    nop                                              ; $41b1: $00
    nop                                              ; $41b2: $00
    nop                                              ; $41b3: $00
    nop                                              ; $41b4: $00
    nop                                              ; $41b5: $00
    nop                                              ; $41b6: $00
    nop                                              ; $41b7: $00
    nop                                              ; $41b8: $00
    nop                                              ; $41b9: $00
    nop                                              ; $41ba: $00
    nop                                              ; $41bb: $00
    nop                                              ; $41bc: $00
    nop                                              ; $41bd: $00
    nop                                              ; $41be: $00
    nop                                              ; $41bf: $00
    nop                                              ; $41c0: $00
    nop                                              ; $41c1: $00
    nop                                              ; $41c2: $00
    nop                                              ; $41c3: $00
    nop                                              ; $41c4: $00
    nop                                              ; $41c5: $00
    nop                                              ; $41c6: $00
    nop                                              ; $41c7: $00
    nop                                              ; $41c8: $00
    nop                                              ; $41c9: $00
    nop                                              ; $41ca: $00
    nop                                              ; $41cb: $00
    nop                                              ; $41cc: $00
    nop                                              ; $41cd: $00
    nop                                              ; $41ce: $00
    nop                                              ; $41cf: $00
    nop                                              ; $41d0: $00
    nop                                              ; $41d1: $00
    nop                                              ; $41d2: $00
    nop                                              ; $41d3: $00
    nop                                              ; $41d4: $00
    nop                                              ; $41d5: $00
    nop                                              ; $41d6: $00
    nop                                              ; $41d7: $00
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
    nop                                              ; $41ee: $00
    nop                                              ; $41ef: $00
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
    ld   [$0c00], sp                                 ; $4200: $08 $00 $0c
    jr   jr_0ab_421d                                 ; $4203: $18 $18

    inc  d                                           ; $4205: $14
    jr   nc, jr_0ab_4234                             ; $4206: $30 $2c

    inc  l                                           ; $4208: $2c
    jr   nz, jr_0ab_423b                             ; $4209: $20 $30

    ld   [$1800], sp                                 ; $420b: $08 $00 $18
    jr   nz, jr_0ab_4240                             ; $420e: $20 $30

    nop                                              ; $4210: $00
    nop                                              ; $4211: $00
    nop                                              ; $4212: $00
    nop                                              ; $4213: $00
    nop                                              ; $4214: $00
    nop                                              ; $4215: $00
    nop                                              ; $4216: $00
    nop                                              ; $4217: $00
    nop                                              ; $4218: $00
    nop                                              ; $4219: $00
    nop                                              ; $421a: $00
    nop                                              ; $421b: $00
    nop                                              ; $421c: $00

    jr_0ab_421d:
    nop                                              ; $421d: $00
    nop                                              ; $421e: $00
    nop                                              ; $421f: $00
    db   $10                                         ; $4220: $10
    jr   jr_0ab_4223                                 ; $4221: $18 $00

    jr_0ab_4223:
    stop                                             ; $4223: $10 $00
    nop                                              ; $4225: $00
    nop                                              ; $4226: $00
    ld   [$1000], sp                                 ; $4227: $08 $00 $10
    nop                                              ; $422a: $00
    stop                                             ; $422b: $10 $00
    nop                                              ; $422d: $00
    nop                                              ; $422e: $00
    nop                                              ; $422f: $00
    nop                                              ; $4230: $00
    nop                                              ; $4231: $00
    nop                                              ; $4232: $00
    nop                                              ; $4233: $00

    jr_0ab_4234:
    nop                                              ; $4234: $00
    nop                                              ; $4235: $00
    nop                                              ; $4236: $00
    nop                                              ; $4237: $00
    nop                                              ; $4238: $00
    nop                                              ; $4239: $00
    nop                                              ; $423a: $00

    jr_0ab_423b:
    nop                                              ; $423b: $00
    nop                                              ; $423c: $00
    nop                                              ; $423d: $00
    nop                                              ; $423e: $00
    nop                                              ; $423f: $00

    jr_0ab_4240:
    nop                                              ; $4240: $00
    nop                                              ; $4241: $00
    nop                                              ; $4242: $00
    nop                                              ; $4243: $00
    ld   h, b                                        ; $4244: $60
    jr   nc, jr_0ab_427f                             ; $4245: $30 $38

    ld   [hl], b                                     ; $4247: $70
    jr   nz, jr_0ab_4262                             ; $4248: $20 $18

    nop                                              ; $424a: $00
    nop                                              ; $424b: $00
    nop                                              ; $424c: $00
    nop                                              ; $424d: $00
    nop                                              ; $424e: $00
    nop                                              ; $424f: $00
    nop                                              ; $4250: $00
    nop                                              ; $4251: $00
    nop                                              ; $4252: $00
    nop                                              ; $4253: $00
    nop                                              ; $4254: $00
    nop                                              ; $4255: $00
    nop                                              ; $4256: $00
    nop                                              ; $4257: $00
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

    jr_0ab_4262:
    nop                                              ; $4262: $00
    nop                                              ; $4263: $00
    nop                                              ; $4264: $00
    nop                                              ; $4265: $00
    nop                                              ; $4266: $00
    ld   bc, $0500                                   ; $4267: $01 $00 $05
    nop                                              ; $426a: $00
    rlca                                             ; $426b: $07
    nop                                              ; $426c: $00
    rlca                                             ; $426d: $07
    nop                                              ; $426e: $00
    rlca                                             ; $426f: $07
    nop                                              ; $4270: $00
    ld   b, $00                                      ; $4271: $06 $00
    ld   c, $00                                      ; $4273: $0e $00
    dec  c                                           ; $4275: $0d
    nop                                              ; $4276: $00
    add  hl, de                                      ; $4277: $19
    nop                                              ; $4278: $00
    dec  d                                           ; $4279: $15
    ld   bc, $0101                                   ; $427a: $01 $01 $01
    inc  bc                                          ; $427d: $03
    nop                                              ; $427e: $00

    jr_0ab_427f:
    nop                                              ; $427f: $00
    ld   [$5878], sp                                 ; $4280: $08 $78 $58
    ld   a, b                                        ; $4283: $78
    ld   [hl], b                                     ; $4284: $70
    ldh  a, [rSVBK]                                  ; $4285: $f0 $70
    ldh  a, [$60]                                    ; $4287: $f0 $60
    ldh  a, [$60]                                    ; $4289: $f0 $60
    ldh  [$60], a                                    ; $428b: $e0 $60
    ldh  [$60], a                                    ; $428d: $e0 $60
    ldh  [$60], a                                    ; $428f: $e0 $60
    ldh  [$c0], a                                    ; $4291: $e0 $c0
    ret  nc                                          ; $4293: $d0

    ret  nz                                          ; $4294: $c0

    ret  nc                                          ; $4295: $d0

    ret  nc                                          ; $4296: $d0

    ret  nc                                          ; $4297: $d0

    sub  b                                           ; $4298: $90
    sub  b                                           ; $4299: $90
    add  b                                           ; $429a: $80
    sub  b                                           ; $429b: $90
    nop                                              ; $429c: $00
    nop                                              ; $429d: $00
    nop                                              ; $429e: $00
    nop                                              ; $429f: $00
    nop                                              ; $42a0: $00
    nop                                              ; $42a1: $00
    nop                                              ; $42a2: $00
    nop                                              ; $42a3: $00
    nop                                              ; $42a4: $00
    ret  nz                                          ; $42a5: $c0

    ret  nc                                          ; $42a6: $d0

    ldh  [$90], a                                    ; $42a7: $e0 $90
    ld   h, b                                        ; $42a9: $60
    ld   e, b                                        ; $42aa: $58
    nop                                              ; $42ab: $00
    jr   jr_0ab_42ca                                 ; $42ac: $18 $1c

    inc  b                                           ; $42ae: $04
    ld   [$0000], sp                                 ; $42af: $08 $00 $00
    nop                                              ; $42b2: $00
    nop                                              ; $42b3: $00
    nop                                              ; $42b4: $00
    nop                                              ; $42b5: $00
    nop                                              ; $42b6: $00
    nop                                              ; $42b7: $00
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
    nop                                              ; $42c4: $00
    nop                                              ; $42c5: $00
    nop                                              ; $42c6: $00
    nop                                              ; $42c7: $00
    nop                                              ; $42c8: $00
    nop                                              ; $42c9: $00

    jr_0ab_42ca:
    nop                                              ; $42ca: $00
    nop                                              ; $42cb: $00
    nop                                              ; $42cc: $00
    nop                                              ; $42cd: $00
    nop                                              ; $42ce: $00
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
    ld   [bc], a                                     ; $42e0: $02
    inc  bc                                          ; $42e1: $03
    inc  b                                           ; $42e2: $04
    ld   b, $04                                      ; $42e3: $06 $04
    inc  b                                           ; $42e5: $04
    nop                                              ; $42e6: $00
    inc  c                                           ; $42e7: $0c
    nop                                              ; $42e8: $00
    jr   jr_0ab_42eb                                 ; $42e9: $18 $00

    jr_0ab_42eb:
    ld   d, b                                        ; $42eb: $50
    nop                                              ; $42ec: $00
    ld   [hl], b                                     ; $42ed: $70
    nop                                              ; $42ee: $00
    ld   [hl], b                                     ; $42ef: $70
    nop                                              ; $42f0: $00
    ld   l, b                                        ; $42f1: $68
    nop                                              ; $42f2: $00
    db   $ec                                         ; $42f3: $ec
    inc  c                                           ; $42f4: $0c
    db   $ec                                         ; $42f5: $ec
    inc  c                                           ; $42f6: $0c
    sbc  l                                           ; $42f7: $9d
    add  hl, bc                                      ; $42f8: $09
    db   $dd                                         ; $42f9: $dd
    add  hl, de                                      ; $42fa: $19
    ld   e, c                                        ; $42fb: $59
    jr   jr_0ab_4337                                 ; $42fc: $18 $39

    nop                                              ; $42fe: $00
    stop                                             ; $42ff: $10 $00
    nop                                              ; $4301: $00
    nop                                              ; $4302: $00
    nop                                              ; $4303: $00
    nop                                              ; $4304: $00
    nop                                              ; $4305: $00
    inc  bc                                          ; $4306: $03
    nop                                              ; $4307: $00
    ld   a, l                                        ; $4308: $7d
    inc  bc                                          ; $4309: $03
    ld   c, a                                        ; $430a: $4f
    ccf                                              ; $430b: $3f
    dec  bc                                          ; $430c: $0b
    rlca                                             ; $430d: $07
    ld   [bc], a                                     ; $430e: $02
    ld   bc, $0000                                   ; $430f: $01 $00 $00
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
    jr   nc, jr_0ab_4332                             ; $4320: $30 $10

    jr   c, jr_0ab_4334                              ; $4322: $38 $10

    jr   jr_0ab_433e                                 ; $4324: $18 $18

    call c, $f4ec                                    ; $4326: $dc $ec $f4
    adc  [hl]                                        ; $4329: $8e
    ld   hl, sp+$76                                  ; $432a: $f8 $76
    ld   hl, sp-$02                                  ; $432c: $f8 $fe
    nop                                              ; $432e: $00
    db   $fc                                         ; $432f: $fc
    ld   a, b                                        ; $4330: $78
    nop                                              ; $4331: $00

    jr_0ab_4332:
    nop                                              ; $4332: $00
    nop                                              ; $4333: $00

    jr_0ab_4334:
    nop                                              ; $4334: $00
    nop                                              ; $4335: $00
    nop                                              ; $4336: $00

    jr_0ab_4337:
    nop                                              ; $4337: $00
    nop                                              ; $4338: $00
    nop                                              ; $4339: $00
    nop                                              ; $433a: $00
    nop                                              ; $433b: $00
    nop                                              ; $433c: $00
    nop                                              ; $433d: $00

    jr_0ab_433e:
    nop                                              ; $433e: $00
    nop                                              ; $433f: $00
    rra                                              ; $4340: $1f
    nop                                              ; $4341: $00
    jr   nz, jr_0ab_4344                             ; $4342: $20 $00

    jr_0ab_4344:
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
    inc  c                                           ; $4360: $0c
    ld   [$081c], sp                                 ; $4361: $08 $1c $08
    jr   jr_0ab_437e                                 ; $4364: $18 $18

    dec  sp                                          ; $4366: $3b
    scf                                              ; $4367: $37
    cpl                                              ; $4368: $2f
    ld   [hl], c                                     ; $4369: $71
    rra                                              ; $436a: $1f
    ld   l, [hl]                                     ; $436b: $6e
    rra                                              ; $436c: $1f
    ld   a, a                                        ; $436d: $7f
    nop                                              ; $436e: $00
    ccf                                              ; $436f: $3f
    ld   e, $00                                      ; $4370: $1e $00
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

    jr_0ab_437e:
    nop                                              ; $437e: $00
    nop                                              ; $437f: $00
    nop                                              ; $4380: $00
    nop                                              ; $4381: $00
    nop                                              ; $4382: $00
    nop                                              ; $4383: $00
    nop                                              ; $4384: $00
    nop                                              ; $4385: $00
    ret  nz                                          ; $4386: $c0

    nop                                              ; $4387: $00
    cp   [hl]                                        ; $4388: $be
    ret  nz                                          ; $4389: $c0

    ldh  a, [c]                                      ; $438a: $f2
    db   $fc                                         ; $438b: $fc
    ret  nc                                          ; $438c: $d0

    ldh  [rLCDC], a                                  ; $438d: $e0 $40
    add  b                                           ; $438f: $80
    nop                                              ; $4390: $00
    nop                                              ; $4391: $00
    nop                                              ; $4392: $00
    nop                                              ; $4393: $00
    nop                                              ; $4394: $00
    nop                                              ; $4395: $00
    nop                                              ; $4396: $00
    nop                                              ; $4397: $00
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
    nop                                              ; $43aa: $00
    nop                                              ; $43ab: $00
    nop                                              ; $43ac: $00
    nop                                              ; $43ad: $00
    nop                                              ; $43ae: $00
    nop                                              ; $43af: $00
    nop                                              ; $43b0: $00
    nop                                              ; $43b1: $00
    nop                                              ; $43b2: $00
    nop                                              ; $43b3: $00
    nop                                              ; $43b4: $00
    nop                                              ; $43b5: $00
    nop                                              ; $43b6: $00
    nop                                              ; $43b7: $00
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
    nop                                              ; $43c2: $00
    nop                                              ; $43c3: $00
    nop                                              ; $43c4: $00
    nop                                              ; $43c5: $00
    nop                                              ; $43c6: $00
    nop                                              ; $43c7: $00
    nop                                              ; $43c8: $00
    nop                                              ; $43c9: $00
    nop                                              ; $43ca: $00
    nop                                              ; $43cb: $00
    nop                                              ; $43cc: $00
    nop                                              ; $43cd: $00
    nop                                              ; $43ce: $00
    nop                                              ; $43cf: $00
    nop                                              ; $43d0: $00
    nop                                              ; $43d1: $00
    nop                                              ; $43d2: $00
    nop                                              ; $43d3: $00
    nop                                              ; $43d4: $00
    nop                                              ; $43d5: $00
    nop                                              ; $43d6: $00
    nop                                              ; $43d7: $00
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
    ld   bc, $0100                                   ; $4402: $01 $00 $01
    nop                                              ; $4405: $00
    ld   a, [bc]                                     ; $4406: $0a
    inc  c                                           ; $4407: $0c
    dec  b                                           ; $4408: $05
    ld   c, $06                                      ; $4409: $0e $06
    rlca                                             ; $440b: $07
    inc  bc                                          ; $440c: $03
    inc  bc                                          ; $440d: $03
    inc  bc                                          ; $440e: $03
    ld   bc, $0102                                   ; $440f: $01 $02 $01
    rlca                                             ; $4412: $07
    inc  bc                                          ; $4413: $03
    dec  bc                                          ; $4414: $0b
    rlca                                             ; $4415: $07
    ld   c, $07                                      ; $4416: $0e $07
    ld   b, $00                                      ; $4418: $06 $00
    ld   bc, $0000                                   ; $441a: $01 $00 $00
    nop                                              ; $441d: $00
    nop                                              ; $441e: $00
    nop                                              ; $441f: $00
    add  b                                           ; $4420: $80
    nop                                              ; $4421: $00
    ld   b, b                                        ; $4422: $40
    add  b                                           ; $4423: $80
    ret  nz                                          ; $4424: $c0

    ret  nz                                          ; $4425: $c0

    ld   h, b                                        ; $4426: $60
    ret  nz                                          ; $4427: $c0

    ret  nz                                          ; $4428: $c0

    ld   h, b                                        ; $4429: $60
    ldh  [$60], a                                    ; $442a: $e0 $60
    ldh  a, [$60]                                    ; $442c: $f0 $60
    xor  b                                           ; $442e: $a8
    ret  nz                                          ; $442f: $c0

    sbc  b                                           ; $4430: $98
    cp   h                                           ; $4431: $bc
    cp   h                                           ; $4432: $bc
    cp   [hl]                                        ; $4433: $be
    ld   c, $86                                      ; $4434: $0e $86
    ld   d, h                                        ; $4436: $54
    ld   h, $9a                                      ; $4437: $26 $9a
    ld   a, h                                        ; $4439: $7c
    db   $f4                                         ; $443a: $f4
    ld   hl, sp-$70                                  ; $443b: $f8 $90
    ld   h, b                                        ; $443d: $60
    nop                                              ; $443e: $00
    nop                                              ; $443f: $00
    ld   b, $0f                                      ; $4440: $06 $0f
    rrca                                             ; $4442: $0f
    rra                                              ; $4443: $1f
    ld   de, $203f                                   ; $4444: $11 $3f $20
    ld   [hl], c                                     ; $4447: $71
    rst  $28                                         ; $4448: $ef
    ld   h, a                                        ; $4449: $67
    rst  $28                                         ; $444a: $ef
    ld   a, a                                        ; $444b: $7f
    rst  $38                                         ; $444c: $ff
    ld   a, a                                        ; $444d: $7f
    db   $e3                                         ; $444e: $e3
    ld   [hl], c                                     ; $444f: $71
    ld   [hl], b                                     ; $4450: $70
    ld   h, b                                        ; $4451: $60
    ld   b, b                                        ; $4452: $40
    ld   h, b                                        ; $4453: $60
    ld   [hl], b                                     ; $4454: $70
    jr   nc, jr_0ab_4467                             ; $4455: $30 $10

    jr   nc, jr_0ab_4489                             ; $4457: $30 $30

    db   $10                                         ; $4459: $10
    db   $10                                         ; $445a: $10
    db   $10                                         ; $445b: $10
    db   $10                                         ; $445c: $10
    jr   jr_0ab_447b                                 ; $445d: $18 $1c

    db   $10                                         ; $445f: $10
    ret  nz                                          ; $4460: $c0

    nop                                              ; $4461: $00
    ld   hl, sp-$40                                  ; $4462: $f8 $c0
    ld   a, [$fbd2]                                  ; $4464: $fa $d2 $fb

    jr_0ab_4467:
    jp   nc, $d2fa                                   ; $4467: $d2 $fa $d2

    db   $ed                                         ; $446a: $ed
    pop  de                                          ; $446b: $d1
    xor  $d8                                         ; $446c: $ee $d8
    db   $fc                                         ; $446e: $fc
    rst  $28                                         ; $446f: $ef
    rst  $30                                         ; $4470: $f7
    cp   $7e                                         ; $4471: $fe $7e
    rst  $38                                         ; $4473: $ff
    rst  $38                                         ; $4474: $ff
    ld   a, a                                        ; $4475: $7f
    ld   a, a                                        ; $4476: $7f
    ld   a, a                                        ; $4477: $7f
    ld   a, a                                        ; $4478: $7f
    ld   a, a                                        ; $4479: $7f
    ld   a, a                                        ; $447a: $7f

    jr_0ab_447b:
    ld   a, a                                        ; $447b: $7f
    adc  [hl]                                        ; $447c: $8e
    ld   a, a                                        ; $447d: $7f
    add  c                                           ; $447e: $81
    ccf                                              ; $447f: $3f
    nop                                              ; $4480: $00
    nop                                              ; $4481: $00
    nop                                              ; $4482: $00
    nop                                              ; $4483: $00
    nop                                              ; $4484: $00
    nop                                              ; $4485: $00
    nop                                              ; $4486: $00
    nop                                              ; $4487: $00
    nop                                              ; $4488: $00

    jr_0ab_4489:
    nop                                              ; $4489: $00
    nop                                              ; $448a: $00
    nop                                              ; $448b: $00
    nop                                              ; $448c: $00
    add  b                                           ; $448d: $80
    ret  nz                                          ; $448e: $c0

    nop                                              ; $448f: $00
    nop                                              ; $4490: $00
    nop                                              ; $4491: $00
    nop                                              ; $4492: $00
    nop                                              ; $4493: $00
    nop                                              ; $4494: $00
    nop                                              ; $4495: $00
    inc  b                                           ; $4496: $04
    nop                                              ; $4497: $00
    inc  b                                           ; $4498: $04
    ld   b, $04                                      ; $4499: $06 $04
    rlca                                             ; $449b: $07
    inc  b                                           ; $449c: $04
    rlca                                             ; $449d: $07
    ret  z                                           ; $449e: $c8

    add  a                                           ; $449f: $87
    ld   b, $0f                                      ; $44a0: $06 $0f
    rrca                                             ; $44a2: $0f
    rra                                              ; $44a3: $1f
    rra                                              ; $44a4: $1f
    ccf                                              ; $44a5: $3f
    ld   sp, $e07f                                   ; $44a6: $31 $7f $e0
    ld   [hl], c                                     ; $44a9: $71
    rst  $28                                         ; $44aa: $ef
    ld   h, a                                        ; $44ab: $67
    rst  $28                                         ; $44ac: $ef
    ld   a, a                                        ; $44ad: $7f
    rst  $38                                         ; $44ae: $ff
    ld   a, a                                        ; $44af: $7f
    ld   h, b                                        ; $44b0: $60
    ld   [hl], c                                     ; $44b1: $71
    ld   b, b                                        ; $44b2: $40
    ld   h, b                                        ; $44b3: $60
    ld   [hl], b                                     ; $44b4: $70
    jr   nz, jr_0ab_44c7                             ; $44b5: $20 $10

    jr   nc, jr_0ab_44e9                             ; $44b7: $30 $30

    db   $10                                         ; $44b9: $10
    db   $10                                         ; $44ba: $10
    db   $10                                         ; $44bb: $10
    db   $10                                         ; $44bc: $10
    jr   jr_0ab_44d7                                 ; $44bd: $18 $18

    inc  d                                           ; $44bf: $14
    ret  nz                                          ; $44c0: $c0

    nop                                              ; $44c1: $00
    ld   hl, sp-$40                                  ; $44c2: $f8 $c0
    ld   a, [$fbd2]                                  ; $44c4: $fa $d2 $fb

    jr_0ab_44c7:
    jp   nc, $d2fb                                   ; $44c7: $d2 $fb $d2

    db   $ed                                         ; $44ca: $ed
    ret  nc                                          ; $44cb: $d0

    rst  $28                                         ; $44cc: $ef
    ret  c                                           ; $44cd: $d8

    db   $fc                                         ; $44ce: $fc
    rst  $28                                         ; $44cf: $ef
    rst  $30                                         ; $44d0: $f7
    cp   $fe                                         ; $44d1: $fe $fe
    rst  $38                                         ; $44d3: $ff
    rst  $38                                         ; $44d4: $ff
    ld   a, a                                        ; $44d5: $7f
    ld   a, a                                        ; $44d6: $7f

    jr_0ab_44d7:
    ld   a, a                                        ; $44d7: $7f
    ld   a, a                                        ; $44d8: $7f
    ld   a, a                                        ; $44d9: $7f
    ld   a, a                                        ; $44da: $7f
    ld   a, a                                        ; $44db: $7f
    adc  [hl]                                        ; $44dc: $8e
    ld   a, a                                        ; $44dd: $7f
    add  c                                           ; $44de: $81
    ccf                                              ; $44df: $3f
    nop                                              ; $44e0: $00
    nop                                              ; $44e1: $00
    nop                                              ; $44e2: $00
    nop                                              ; $44e3: $00
    nop                                              ; $44e4: $00
    nop                                              ; $44e5: $00
    nop                                              ; $44e6: $00
    nop                                              ; $44e7: $00
    nop                                              ; $44e8: $00

    jr_0ab_44e9:
    nop                                              ; $44e9: $00
    ret  nz                                          ; $44ea: $c0

    nop                                              ; $44eb: $00
    nop                                              ; $44ec: $00
    add  b                                           ; $44ed: $80
    ret  nz                                          ; $44ee: $c0

    nop                                              ; $44ef: $00
    nop                                              ; $44f0: $00
    nop                                              ; $44f1: $00
    nop                                              ; $44f2: $00
    nop                                              ; $44f3: $00
    nop                                              ; $44f4: $00
    nop                                              ; $44f5: $00
    inc  b                                           ; $44f6: $04
    nop                                              ; $44f7: $00
    inc  b                                           ; $44f8: $04
    ld   b, $04                                      ; $44f9: $06 $04
    rlca                                             ; $44fb: $07
    inc  b                                           ; $44fc: $04
    rlca                                             ; $44fd: $07
    ret  nz                                          ; $44fe: $c0

    adc  a                                           ; $44ff: $8f
    ld   b, $0f                                      ; $4500: $06 $0f
    rrca                                             ; $4502: $0f
    rra                                              ; $4503: $1f
    rra                                              ; $4504: $1f
    ccf                                              ; $4505: $3f
    jr   nc, jr_0ab_4581                             ; $4506: $30 $79

    db   $e3                                         ; $4508: $e3
    ld   [hl], a                                     ; $4509: $77
    rst  $08                                         ; $450a: $cf
    ld   l, a                                        ; $450b: $6f
    rst  $38                                         ; $450c: $ff
    ld   a, a                                        ; $450d: $7f
    rst  $38                                         ; $450e: $ff
    ld   a, a                                        ; $450f: $7f
    ld   h, e                                        ; $4510: $63
    ld   [hl], c                                     ; $4511: $71
    ld   [hl], b                                     ; $4512: $70
    ld   h, b                                        ; $4513: $60
    ld   b, b                                        ; $4514: $40
    jr   nz, jr_0ab_4547                             ; $4515: $20 $30

    jr   nc, jr_0ab_4549                             ; $4517: $30 $30

    db   $10                                         ; $4519: $10
    jr   nc, jr_0ab_452c                             ; $451a: $30 $10

    db   $10                                         ; $451c: $10
    db   $10                                         ; $451d: $10
    jr   @+$12                                       ; $451e: $18 $10

    ret  nz                                          ; $4520: $c0

    nop                                              ; $4521: $00
    ld   hl, sp-$40                                  ; $4522: $f8 $c0
    ld   [$fad0], a                                  ; $4524: $ea $d0 $fa
    ret  nc                                          ; $4527: $d0

    ld   a, [$f8d0]                                  ; $4528: $fa $d0 $f8
    db   $d3                                         ; $452b: $d3

    jr_0ab_452c:
    db   $f4                                         ; $452c: $f4
    reti                                             ; $452d: $d9


    jp   z, $e7fc                                    ; $452e: $ca $fc $e7

    cp   $ff                                         ; $4531: $fe $ff
    cp   $7f                                         ; $4533: $fe $7f
    cp   $ff                                         ; $4535: $fe $ff
    ld   a, [hl]                                     ; $4537: $7e
    ld   a, a                                        ; $4538: $7f
    ld   a, [hl]                                     ; $4539: $7e
    ld   a, a                                        ; $453a: $7f
    ld   a, [hl]                                     ; $453b: $7e
    ld   a, [hl]                                     ; $453c: $7e
    ld   a, a                                        ; $453d: $7f
    ld   b, $ff                                      ; $453e: $06 $ff
    nop                                              ; $4540: $00
    nop                                              ; $4541: $00
    nop                                              ; $4542: $00
    nop                                              ; $4543: $00
    nop                                              ; $4544: $00
    nop                                              ; $4545: $00
    nop                                              ; $4546: $00

    jr_0ab_4547:
    nop                                              ; $4547: $00
    nop                                              ; $4548: $00

    jr_0ab_4549:
    nop                                              ; $4549: $00
    nop                                              ; $454a: $00
    nop                                              ; $454b: $00
    add  b                                           ; $454c: $80
    nop                                              ; $454d: $00
    add  b                                           ; $454e: $80
    nop                                              ; $454f: $00
    ld   b, b                                        ; $4550: $40
    nop                                              ; $4551: $00
    nop                                              ; $4552: $00
    nop                                              ; $4553: $00
    nop                                              ; $4554: $00
    nop                                              ; $4555: $00
    nop                                              ; $4556: $00
    nop                                              ; $4557: $00
    nop                                              ; $4558: $00
    inc  b                                           ; $4559: $04
    inc  b                                           ; $455a: $04
    rlca                                             ; $455b: $07
    inc  b                                           ; $455c: $04
    rlca                                             ; $455d: $07
    adc  b                                           ; $455e: $88
    rrca                                             ; $455f: $0f
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

    jr_0ab_4581:
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
    ld   e, $3c                                      ; $4601: $1e $3c
    ld   a, $3c                                      ; $4603: $3e $3c
    ld   a, [hl]                                     ; $4605: $7e
    ld   a, b                                        ; $4606: $78
    ld   a, h                                        ; $4607: $7c
    jr   nc, jr_0ab_4642                             ; $4608: $30 $38

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
    db   $10                                         ; $4624: $10
    stop                                             ; $4625: $10 $00
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
    ld   b, $1f                                      ; $4640: $06 $1f

    jr_0ab_4642:
    rra                                              ; $4642: $1f
    rra                                              ; $4643: $1f
    ccf                                              ; $4644: $3f
    rra                                              ; $4645: $1f
    cpl                                              ; $4646: $2f
    rra                                              ; $4647: $1f
    rrca                                             ; $4648: $0f
    rra                                              ; $4649: $1f
    rrca                                             ; $464a: $0f
    rrca                                             ; $464b: $0f
    rlca                                             ; $464c: $07
    rlca                                             ; $464d: $07
    ld   bc, $0103                                   ; $464e: $01 $03 $01
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
    cp   a                                           ; $4661: $bf
    rst  $38                                         ; $4662: $ff
    rst  $38                                         ; $4663: $ff
    ld   a, l                                        ; $4664: $7d
    add  e                                           ; $4665: $83
    ld   bc, $0101                                   ; $4666: $01 $01 $01
    ld   bc, $0183                                   ; $4669: $01 $83 $01
    add  a                                           ; $466c: $87
    add  e                                           ; $466d: $83
    adc  e                                           ; $466e: $8b
    rst  JumpTableTrashDE                                         ; $466f: $c7
    jr   c, @+$01                                    ; $4670: $38 $ff

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
    ld   sp, hl                                      ; $4680: $f9
    cp   $f8                                         ; $4681: $fe $f8
    cp   $fc                                         ; $4683: $fe $fc
    cp   $fe                                         ; $4685: $fe $fe
    db   $fc                                         ; $4687: $fc
    ld   hl, sp-$04                                  ; $4688: $f8 $fc
    db   $f4                                         ; $468a: $f4
    ld   hl, sp-$38                                  ; $468b: $f8 $c8
    ldh  a, [$30]                                    ; $468d: $f0 $30
    ret  nz                                          ; $468f: $c0

    ret  nz                                          ; $4690: $c0

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
    ld   b, $1f                                      ; $46a0: $06 $1f
    rra                                              ; $46a2: $1f
    rra                                              ; $46a3: $1f
    ccf                                              ; $46a4: $3f
    rra                                              ; $46a5: $1f
    cpl                                              ; $46a6: $2f
    rra                                              ; $46a7: $1f
    rrca                                             ; $46a8: $0f
    rra                                              ; $46a9: $1f
    rrca                                             ; $46aa: $0f
    rrca                                             ; $46ab: $0f
    rlca                                             ; $46ac: $07
    rlca                                             ; $46ad: $07
    ld   bc, $0103                                   ; $46ae: $01 $03 $01
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

    jr_0ab_46c1:
    cp   a                                           ; $46c1: $bf
    rst  $38                                         ; $46c2: $ff
    rst  $38                                         ; $46c3: $ff
    rst  $38                                         ; $46c4: $ff
    rst  $38                                         ; $46c5: $ff
    ccf                                              ; $46c6: $3f
    sbc  a                                           ; $46c7: $9f
    ccf                                              ; $46c8: $3f
    sbc  a                                           ; $46c9: $9f
    sbc  a                                           ; $46ca: $9f
    rst  $38                                         ; $46cb: $ff
    rst  $38                                         ; $46cc: $ff
    rst  $38                                         ; $46cd: $ff
    rst  $38                                         ; $46ce: $ff
    rst  $38                                         ; $46cf: $ff
    jr   c, @+$01                                    ; $46d0: $38 $ff

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
    ld   sp, hl                                      ; $46e0: $f9
    cp   $f8                                         ; $46e1: $fe $f8
    cp   $f8                                         ; $46e3: $fe $f8
    cp   $fa                                         ; $46e5: $fe $fa
    db   $fc                                         ; $46e7: $fc
    ldh  a, [$fc]                                    ; $46e8: $f0 $fc
    db   $f4                                         ; $46ea: $f4
    ld   hl, sp-$38                                  ; $46eb: $f8 $c8
    ldh  a, [$30]                                    ; $46ed: $f0 $30
    ret  nz                                          ; $46ef: $c0

    ret  nz                                          ; $46f0: $c0

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
    rra                                              ; $4701: $1f
    rlca                                             ; $4702: $07
    rra                                              ; $4703: $1f
    ld   a, $1f                                      ; $4704: $3e $1f
    inc  a                                           ; $4706: $3c
    ld   e, $0c                                      ; $4707: $1e $0c
    inc  e                                           ; $4709: $1c
    inc  c                                           ; $470a: $0c
    inc  e                                           ; $470b: $1c
    inc  b                                           ; $470c: $04
    ld   c, $03                                      ; $470d: $0e $03
    rlca                                             ; $470f: $07
    ld   [bc], a                                     ; $4710: $02
    ld   bc, $0000                                   ; $4711: $01 $00 $00
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
    jr   nz, jr_0ab_46c1                             ; $4720: $20 $9f

    cp   a                                           ; $4722: $bf
    rst  $38                                         ; $4723: $ff
    db   $fd                                         ; $4724: $fd
    inc  bc                                          ; $4725: $03
    nop                                              ; $4726: $00
    nop                                              ; $4727: $00
    ld   bc, $0000                                   ; $4728: $01 $00 $00
    nop                                              ; $472b: $00
    jr   nc, jr_0ab_47a6                             ; $472c: $30 $78

    rst  $38                                         ; $472e: $ff
    rst  $38                                         ; $472f: $ff
    db   $fc                                         ; $4730: $fc
    rst  $38                                         ; $4731: $ff
    ld   a, [hl]                                     ; $4732: $7e
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
    pop  bc                                          ; $4740: $c1
    cp   $f9                                         ; $4741: $fe $f9
    cp   $fc                                         ; $4743: $fe $fc
    cp   $7e                                         ; $4745: $fe $7e
    db   $fc                                         ; $4747: $fc
    ld   hl, sp+$7c                                  ; $4748: $f8 $7c
    db   $fc                                         ; $474a: $fc
    ld   a, b                                        ; $474b: $78
    ld   a, b                                        ; $474c: $78
    ldh  a, [$d0]                                    ; $474d: $f0 $d0
    ldh  [rLCDC], a                                  ; $474f: $e0 $40
    add  b                                           ; $4751: $80
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

    jr_0ab_47a6:
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

    jr_0ab_47f1:
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
    rst  $38                                         ; $4800: $ff
    rst  $38                                         ; $4801: $ff
    rst  $38                                         ; $4802: $ff
    rst  $38                                         ; $4803: $ff
    rst  $38                                         ; $4804: $ff
    rst  $38                                         ; $4805: $ff
    rst  $38                                         ; $4806: $ff
    rst  $38                                         ; $4807: $ff
    rst  $38                                         ; $4808: $ff
    cp   $fc                                         ; $4809: $fe $fc
    cp   $fd                                         ; $480b: $fe $fd
    db   $fc                                         ; $480d: $fc
    pop  hl                                          ; $480e: $e1
    ldh  a, [rIE]                                    ; $480f: $f0 $ff
    cp   $ff                                         ; $4811: $fe $ff
    rst  $38                                         ; $4813: $ff
    rst  $38                                         ; $4814: $ff
    rst  $38                                         ; $4815: $ff
    cp   $ff                                         ; $4816: $fe $ff
    cp   [hl]                                        ; $4818: $be
    ld   a, a                                        ; $4819: $7f
    cp   a                                           ; $481a: $bf
    ld   a, $5e                                      ; $481b: $3e $5e
    cp   [hl]                                        ; $481d: $be
    ld   e, $de                                      ; $481e: $1e $de
    sub  l                                           ; $4820: $95
    ld   h, b                                        ; $4821: $60
    ld   [$486c], sp                                 ; $4822: $08 $6c $48
    ld   a, $0a                                      ; $4825: $3e $0a
    inc  a                                           ; $4827: $3c
    ld   l, l                                        ; $4828: $6d
    inc  e                                           ; $4829: $1c
    xor  c                                           ; $482a: $a9
    ld   e, l                                        ; $482b: $5d
    ret  nz                                          ; $482c: $c0

    dec  e                                           ; $482d: $1d
    ld   b, e                                        ; $482e: $43
    sbc  h                                           ; $482f: $9c
    ld   bc, $00fe                                   ; $4830: $01 $fe $00
    rst  $38                                         ; $4833: $ff
    add  b                                           ; $4834: $80
    ld   a, a                                        ; $4835: $7f
    add  b                                           ; $4836: $80
    ld   a, a                                        ; $4837: $7f
    nop                                              ; $4838: $00
    ld   a, a                                        ; $4839: $7f
    nop                                              ; $483a: $00
    ld   a, a                                        ; $483b: $7f
    add  b                                           ; $483c: $80
    ld   a, a                                        ; $483d: $7f
    ret  nz                                          ; $483e: $c0

    ccf                                              ; $483f: $3f

    jr_0ab_4840:
    sbc  d                                           ; $4840: $9a
    dec  b                                           ; $4841: $05
    adc  a                                           ; $4842: $8f
    nop                                              ; $4843: $00
    cpl                                              ; $4844: $2f
    ret  nz                                          ; $4845: $c0

    rst  $28                                         ; $4846: $ef
    ret  nz                                          ; $4847: $c0

    sub  c                                           ; $4848: $91
    add  [hl]                                        ; $4849: $86
    sub  b                                           ; $484a: $90
    or   a                                           ; $484b: $b7
    ld   [$70b7], sp                                 ; $484c: $08 $b7 $70
    adc  a                                           ; $484f: $8f
    jr   nz, jr_0ab_47f1                             ; $4850: $20 $9f

    and  b                                           ; $4852: $a0
    rra                                              ; $4853: $1f
    add  b                                           ; $4854: $80
    ccf                                              ; $4855: $3f
    cp   l                                           ; $4856: $bd
    ld   [bc], a                                     ; $4857: $02
    and  a                                           ; $4858: $a7
    jr   jr_0ab_4865                                 ; $4859: $18 $0a

    dec  d                                           ; $485b: $15
    ld   [de], a                                     ; $485c: $12
    dec  l                                           ; $485d: $2d
    rra                                              ; $485e: $1f
    jr   nz, jr_0ab_4840                             ; $485f: $20 $df

    rra                                              ; $4861: $1f
    rst  $18                                         ; $4862: $df
    rra                                              ; $4863: $1f
    sbc  a                                           ; $4864: $9f

    jr_0ab_4865:
    rra                                              ; $4865: $1f
    rst  $18                                         ; $4866: $df
    rra                                              ; $4867: $1f
    ld   e, a                                        ; $4868: $5f
    sbc  a                                           ; $4869: $9f
    ld   e, a                                        ; $486a: $5f
    sbc  a                                           ; $486b: $9f
    rst  $18                                         ; $486c: $df
    rra                                              ; $486d: $1f
    sbc  a                                           ; $486e: $9f
    ld   e, a                                        ; $486f: $5f
    rst  $38                                         ; $4870: $ff
    rst  $38                                         ; $4871: $ff
    rst  $38                                         ; $4872: $ff
    rst  $38                                         ; $4873: $ff
    rst  $38                                         ; $4874: $ff
    rst  $38                                         ; $4875: $ff
    rst  $38                                         ; $4876: $ff
    rst  $38                                         ; $4877: $ff
    rst  $38                                         ; $4878: $ff
    rst  $38                                         ; $4879: $ff
    rst  $38                                         ; $487a: $ff
    rst  $38                                         ; $487b: $ff
    rst  $38                                         ; $487c: $ff
    rst  $38                                         ; $487d: $ff
    rst  $38                                         ; $487e: $ff
    rst  $38                                         ; $487f: $ff
    rst  $38                                         ; $4880: $ff
    rst  $38                                         ; $4881: $ff
    rst  $38                                         ; $4882: $ff
    rst  $38                                         ; $4883: $ff

    jr_0ab_4884:
    rst  $38                                         ; $4884: $ff
    rst  $38                                         ; $4885: $ff
    rst  $38                                         ; $4886: $ff
    rst  $38                                         ; $4887: $ff
    rst  $38                                         ; $4888: $ff
    rst  $38                                         ; $4889: $ff
    rst  $38                                         ; $488a: $ff
    rst  $38                                         ; $488b: $ff
    rst  $38                                         ; $488c: $ff
    rst  $38                                         ; $488d: $ff
    rst  $38                                         ; $488e: $ff
    rst  $38                                         ; $488f: $ff
    ld   hl, sp-$10                                  ; $4890: $f8 $f0
    rst  $30                                         ; $4892: $f7
    ldh  a, [$f7]                                    ; $4893: $f0 $f7
    ldh  a, [$f7]                                    ; $4895: $f0 $f7
    ldh  a, [$f7]                                    ; $4897: $f0 $f7
    ldh  a, [$f7]                                    ; $4899: $f0 $f7
    ldh  a, [$f7]                                    ; $489b: $f0 $f7
    ldh  a, [$f7]                                    ; $489d: $f0 $f7
    ldh  a, [$9f]                                    ; $489f: $f0 $9f
    ld   a, a                                        ; $48a1: $7f
    add  h                                           ; $48a2: $84
    inc  bc                                          ; $48a3: $03
    db   $fc                                         ; $48a4: $fc
    nop                                              ; $48a5: $00
    sbc  a                                           ; $48a6: $9f
    jr   nz, jr_0ab_4884                             ; $48a7: $20 $db

    inc  b                                           ; $48a9: $04
    or   h                                           ; $48aa: $b4
    ld   l, a                                        ; $48ab: $6f
    dec  c                                           ; $48ac: $0d
    ld   [hl+], a                                    ; $48ad: $22
    jp   c, $ff27                                    ; $48ae: $da $27 $ff

    rst  $38                                         ; $48b1: $ff
    rst  $38                                         ; $48b2: $ff
    rst  $38                                         ; $48b3: $ff
    cpl                                              ; $48b4: $2f
    rra                                              ; $48b5: $1f
    push hl                                          ; $48b6: $e5
    inc  bc                                          ; $48b7: $03
    ld   a, h                                        ; $48b8: $7c
    nop                                              ; $48b9: $00
    ld   a, a                                        ; $48ba: $7f
    nop                                              ; $48bb: $00
    ld   a, a                                        ; $48bc: $7f
    nop                                              ; $48bd: $00
    ld   a, a                                        ; $48be: $7f
    nop                                              ; $48bf: $00
    rst  $38                                         ; $48c0: $ff
    rst  $38                                         ; $48c1: $ff
    rst  $38                                         ; $48c2: $ff
    rst  $38                                         ; $48c3: $ff
    rst  $38                                         ; $48c4: $ff
    rst  $38                                         ; $48c5: $ff
    rst  $38                                         ; $48c6: $ff
    rst  $38                                         ; $48c7: $ff
    cp   a                                           ; $48c8: $bf
    ld   a, a                                        ; $48c9: $7f
    xor  a                                           ; $48ca: $af
    rra                                              ; $48cb: $1f
    rlc  a                                           ; $48cc: $cb $07
    di                                               ; $48ce: $f3
    ld   bc, $ffff                                   ; $48cf: $01 $ff $ff
    rst  $38                                         ; $48d2: $ff
    rst  $38                                         ; $48d3: $ff
    rst  $38                                         ; $48d4: $ff
    rst  $38                                         ; $48d5: $ff
    rst  $38                                         ; $48d6: $ff
    rst  $38                                         ; $48d7: $ff
    rst  $38                                         ; $48d8: $ff
    rst  $38                                         ; $48d9: $ff
    rst  $38                                         ; $48da: $ff
    rst  $38                                         ; $48db: $ff
    rst  $38                                         ; $48dc: $ff
    rst  $38                                         ; $48dd: $ff
    rst  $38                                         ; $48de: $ff
    rst  $38                                         ; $48df: $ff
    inc  bc                                          ; $48e0: $03
    nop                                              ; $48e1: $00
    nop                                              ; $48e2: $00
    rlca                                             ; $48e3: $07
    ld   a, [bc]                                     ; $48e4: $0a
    rlca                                             ; $48e5: $07
    inc  bc                                          ; $48e6: $03
    rlca                                             ; $48e7: $07
    ld   bc, $0503                                   ; $48e8: $01 $03 $05
    inc  bc                                          ; $48eb: $03
    dec  bc                                          ; $48ec: $0b
    rlca                                             ; $48ed: $07
    ld   e, $07                                      ; $48ee: $1e $07
    nop                                              ; $48f0: $00
    nop                                              ; $48f1: $00
    add  b                                           ; $48f2: $80
    nop                                              ; $48f3: $00
    add  b                                           ; $48f4: $80
    nop                                              ; $48f5: $00
    add  b                                           ; $48f6: $80
    nop                                              ; $48f7: $00
    ld   b, b                                        ; $48f8: $40
    add  b                                           ; $48f9: $80
    ret  nz                                          ; $48fa: $c0

    add  b                                           ; $48fb: $80
    nop                                              ; $48fc: $00
    add  b                                           ; $48fd: $80
    add  b                                           ; $48fe: $80
    nop                                              ; $48ff: $00
    ret  nz                                          ; $4900: $c0

    db   $ec                                         ; $4901: $ec
    ret  nz                                          ; $4902: $c0

    xor  $f8                                         ; $4903: $ee $f8
    rst  $20                                         ; $4905: $e7
    db   $f4                                         ; $4906: $f4
    di                                               ; $4907: $f3
    ld   a, [$faf9]                                  ; $4908: $fa $f9 $fa
    ld   sp, hl                                      ; $490b: $f9
    db   $e4                                         ; $490c: $e4
    di                                               ; $490d: $f3
    ldh  a, [$e7]                                    ; $490e: $f0 $e7
    ld   l, $ce                                      ; $4910: $2e $ce
    add  [hl]                                        ; $4912: $86
    ld   l, [hl]                                     ; $4913: $6e
    sbc  [hl]                                        ; $4914: $9e
    ld   h, [hl]                                     ; $4915: $66
    sub  h                                           ; $4916: $94
    ld   h, d                                        ; $4917: $62
    inc  a                                           ; $4918: $3c
    ret  nz                                          ; $4919: $c0

    ld   b, d                                        ; $491a: $42
    cp   h                                           ; $491b: $bc
    ld   b, b                                        ; $491c: $40
    cp   [hl]                                        ; $491d: $be
    ld   a, b                                        ; $491e: $78
    add  [hl]                                        ; $491f: $86
    ret  nz                                          ; $4920: $c0

    rra                                              ; $4921: $1f
    and  b                                           ; $4922: $a0
    rra                                              ; $4923: $1f
    ldh  [$1f], a                                    ; $4924: $e0 $1f
    ldh  [$1f], a                                    ; $4926: $e0 $1f
    add  b                                           ; $4928: $80
    rra                                              ; $4929: $1f
    sub  b                                           ; $492a: $90
    rrca                                             ; $492b: $0f
    jr   z, jr_0ab_4995                              ; $492c: $28 $67

    ld   l, h                                        ; $492e: $6c
    db   $e3                                         ; $492f: $e3
    ld   b, b                                        ; $4930: $40
    cp   a                                           ; $4931: $bf
    nop                                              ; $4932: $00
    rst  $38                                         ; $4933: $ff
    ld   b, b                                        ; $4934: $40
    add  e                                           ; $4935: $83
    nop                                              ; $4936: $00
    rra                                              ; $4937: $1f
    nop                                              ; $4938: $00

    jr_0ab_4939:
    ccf                                              ; $4939: $3f
    nop                                              ; $493a: $00
    ld   a, a                                        ; $493b: $7f
    nop                                              ; $493c: $00
    rst  $38                                         ; $493d: $ff
    nop                                              ; $493e: $00
    rst  $38                                         ; $493f: $ff
    ld   bc, $00fe                                   ; $4940: $01 $fe $00
    cp   $00                                         ; $4943: $fe $00
    cp   $02                                         ; $4945: $fe $02
    db   $fc                                         ; $4947: $fc
    ld   bc, $04fc                                   ; $4948: $01 $fc $04
    ld   hl, sp+$08                                  ; $494b: $f8 $08
    ldh  a, [$30]                                    ; $494d: $f0 $30
    ret  nz                                          ; $494f: $c0

    ld   [hl], l                                     ; $4950: $75
    ld   a, [bc]                                     ; $4951: $0a
    ld   h, h                                        ; $4952: $64
    dec  de                                          ; $4953: $1b
    call nz, $fc33                                   ; $4954: $c4 $33 $fc
    inc  bc                                          ; $4957: $03
    db   $fc                                         ; $4958: $fc
    inc  bc                                          ; $4959: $03
    db   $fc                                         ; $495a: $fc
    inc  bc                                          ; $495b: $03
    db   $fc                                         ; $495c: $fc
    inc  bc                                          ; $495d: $03
    db   $fc                                         ; $495e: $fc
    inc  bc                                          ; $495f: $03
    rra                                              ; $4960: $1f
    rst  $18                                         ; $4961: $df
    ld   e, a                                        ; $4962: $5f
    sbc  a                                           ; $4963: $9f
    ld   a, a                                        ; $4964: $7f
    sbc  a                                           ; $4965: $9f
    sbc  a                                           ; $4966: $9f
    ccf                                              ; $4967: $3f
    sbc  a                                           ; $4968: $9f
    ccf                                              ; $4969: $3f
    cp   a                                           ; $496a: $bf
    ccf                                              ; $496b: $3f
    cp   a                                           ; $496c: $bf
    ccf                                              ; $496d: $3f
    cp   a                                           ; $496e: $bf
    ccf                                              ; $496f: $3f
    rst  $38                                         ; $4970: $ff
    rst  $38                                         ; $4971: $ff
    rst  $38                                         ; $4972: $ff
    rst  $38                                         ; $4973: $ff
    rst  $38                                         ; $4974: $ff
    rst  $38                                         ; $4975: $ff
    rst  $38                                         ; $4976: $ff
    rst  $38                                         ; $4977: $ff
    rst  $38                                         ; $4978: $ff
    rst  $38                                         ; $4979: $ff
    rst  $38                                         ; $497a: $ff
    rst  $38                                         ; $497b: $ff
    rst  $38                                         ; $497c: $ff
    rst  $38                                         ; $497d: $ff
    rst  $38                                         ; $497e: $ff
    rst  $38                                         ; $497f: $ff

    jr_0ab_4980:
    rst  $38                                         ; $4980: $ff
    rst  $38                                         ; $4981: $ff
    rst  $38                                         ; $4982: $ff
    rst  $38                                         ; $4983: $ff
    rst  $38                                         ; $4984: $ff
    rst  $38                                         ; $4985: $ff
    rst  $38                                         ; $4986: $ff
    rst  $38                                         ; $4987: $ff
    rst  $38                                         ; $4988: $ff
    rst  $38                                         ; $4989: $ff
    rst  $38                                         ; $498a: $ff
    rst  $38                                         ; $498b: $ff
    ld   a, [$f2fc]                                  ; $498c: $fa $fc $f2
    ld   sp, hl                                      ; $498f: $f9
    rst  $30                                         ; $4990: $f7
    ldh  a, [$f6]                                    ; $4991: $f0 $f6
    ldh  a, [$f3]                                    ; $4993: $f0 $f3

    jr_0ab_4995:
    ldh  a, [$a0]                                    ; $4995: $f0 $a0
    ret  nz                                          ; $4997: $c0

    db   $dd                                         ; $4998: $dd
    add  [hl]                                        ; $4999: $86
    daa                                              ; $499a: $27
    sbc  b                                           ; $499b: $98
    nop                                              ; $499c: $00
    nop                                              ; $499d: $00
    jr   jr_0ab_4980                                 ; $499e: $18 $e0

    ld   [hl], a                                     ; $49a0: $77
    jr   nz, jr_0ab_4939                             ; $49a1: $20 $96

    ld   l, c                                        ; $49a3: $69
    ret  z                                           ; $49a4: $c8

    nop                                              ; $49a5: $00
    rlca                                             ; $49a6: $07
    nop                                              ; $49a7: $00
    add  b                                           ; $49a8: $80
    nop                                              ; $49a9: $00
    db   $fc                                         ; $49aa: $fc
    nop                                              ; $49ab: $00
    ld   h, b                                        ; $49ac: $60
    nop                                              ; $49ad: $00
    nop                                              ; $49ae: $00
    nop                                              ; $49af: $00
    ld   a, a                                        ; $49b0: $7f
    nop                                              ; $49b1: $00
    ld   a, a                                        ; $49b2: $7f
    nop                                              ; $49b3: $00
    ld   a, a                                        ; $49b4: $7f
    nop                                              ; $49b5: $00
    rlca                                             ; $49b6: $07
    nop                                              ; $49b7: $00
    ld   [hl], c                                     ; $49b8: $71
    nop                                              ; $49b9: $00
    ld   b, $00                                      ; $49ba: $06 $00
    ld   bc, $0000                                   ; $49bc: $01 $00 $00
    nop                                              ; $49bf: $00
    db   $fc                                         ; $49c0: $fc
    nop                                              ; $49c1: $00
    cp   $00                                         ; $49c2: $fe $00
    rst  $38                                         ; $49c4: $ff
    nop                                              ; $49c5: $00
    rst  $38                                         ; $49c6: $ff
    nop                                              ; $49c7: $00
    rst  $38                                         ; $49c8: $ff
    nop                                              ; $49c9: $00
    ld   a, a                                        ; $49ca: $7f
    nop                                              ; $49cb: $00
    ld   e, $00                                      ; $49cc: $1e $00
    call z, $7f20                            ; $49ce: $cc $20 $7f
    rst  $38                                         ; $49d1: $ff
    ld   a, a                                        ; $49d2: $7f
    ccf                                              ; $49d3: $3f
    ccf                                              ; $49d4: $3f
    rra                                              ; $49d5: $1f
    rra                                              ; $49d6: $1f
    rrca                                             ; $49d7: $0f
    rrca                                             ; $49d8: $0f
    rlca                                             ; $49d9: $07
    rlca                                             ; $49da: $07
    inc  bc                                          ; $49db: $03
    inc  bc                                          ; $49dc: $03
    inc  bc                                          ; $49dd: $03
    rlca                                             ; $49de: $07
    inc  bc                                          ; $49df: $03
    ld   d, $03                                      ; $49e0: $16 $03
    ld   de, $2503                                   ; $49e2: $11 $03 $25
    inc  bc                                          ; $49e5: $03
    cpl                                              ; $49e6: $2f
    rlca                                             ; $49e7: $07
    ld   l, $07                                      ; $49e8: $2e $07
    daa                                              ; $49ea: $27
    inc  bc                                          ; $49eb: $03
    ld   b, e                                        ; $49ec: $43
    ld   bc, $0143                           ; $49ed: $01 $43 $01
    add  b                                           ; $49f0: $80
    nop                                              ; $49f1: $00
    ld   b, b                                        ; $49f2: $40
    add  b                                           ; $49f3: $80
    add  b                                           ; $49f4: $80
    ret  nz                                          ; $49f5: $c0

    nop                                              ; $49f6: $00
    add  b                                           ; $49f7: $80
    nop                                              ; $49f8: $00
    nop                                              ; $49f9: $00
    nop                                              ; $49fa: $00
    nop                                              ; $49fb: $00
    ret  nz                                          ; $49fc: $c0

    add  b                                           ; $49fd: $80
    and  b                                           ; $49fe: $a0
    ret  nz                                          ; $49ff: $c0

    add  sp, -$19                                    ; $4a00: $e8 $e7
    pop  af                                          ; $4a02: $f1
    and  $ea                                         ; $4a03: $e6 $ea
    pop  af                                          ; $4a05: $f1
    db   $fd                                         ; $4a06: $fd
    db   $fc                                         ; $4a07: $fc
    db   $fc                                         ; $4a08: $fc
    cp   $ff                                         ; $4a09: $fe $ff
    rst  $38                                         ; $4a0b: $ff
    rst  $38                                         ; $4a0c: $ff
    rst  $38                                         ; $4a0d: $ff
    rst  $38                                         ; $4a0e: $ff
    rst  $38                                         ; $4a0f: $ff
    sbc  b                                           ; $4a10: $98
    ld   h, [hl]                                     ; $4a11: $66
    ld   bc, $00fe                                   ; $4a12: $01 $fe $00
    db   $fd                                         ; $4a15: $fd
    adc  c                                           ; $4a16: $89
    ld   [hl], e                                     ; $4a17: $73
    dec  bc                                          ; $4a18: $0b
    rlca                                             ; $4a19: $07
    rst  $38                                         ; $4a1a: $ff
    rst  $38                                         ; $4a1b: $ff
    rst  $38                                         ; $4a1c: $ff
    rst  $38                                         ; $4a1d: $ff
    rst  $38                                         ; $4a1e: $ff
    rst  $38                                         ; $4a1f: $ff
    jp   hl                                          ; $4a20: $e9


    ldh  [$f8], a                                    ; $4a21: $e0 $f8
    ldh  [c], a                                      ; $4a23: $e2
    rst  $20                                         ; $4a24: $e7
    di                                               ; $4a25: $f3
    rst  $38                                         ; $4a26: $ff
    rst  $30                                         ; $4a27: $f7
    rst  $30                                         ; $4a28: $f7
    rst  $38                                         ; $4a29: $ff
    rst  $38                                         ; $4a2a: $ff
    rst  $38                                         ; $4a2b: $ff
    rst  $38                                         ; $4a2c: $ff
    rst  $38                                         ; $4a2d: $ff
    rst  $38                                         ; $4a2e: $ff
    rst  $38                                         ; $4a2f: $ff
    nop                                              ; $4a30: $00
    rst  $38                                         ; $4a31: $ff
    nop                                              ; $4a32: $00
    nop                                              ; $4a33: $00
    rst  $38                                         ; $4a34: $ff
    rst  $38                                         ; $4a35: $ff
    rst  $38                                         ; $4a36: $ff
    rst  $38                                         ; $4a37: $ff
    rst  $38                                         ; $4a38: $ff
    rst  $38                                         ; $4a39: $ff
    rst  $38                                         ; $4a3a: $ff
    rst  $38                                         ; $4a3b: $ff
    rst  $38                                         ; $4a3c: $ff
    rst  $38                                         ; $4a3d: $ff
    rst  $38                                         ; $4a3e: $ff
    rst  $38                                         ; $4a3f: $ff
    ret  nz                                          ; $4a40: $c0

    nop                                              ; $4a41: $00
    ld   c, l                                        ; $4a42: $4d
    inc  a                                           ; $4a43: $3c
    db   $fd                                         ; $4a44: $fd
    db   $fc                                         ; $4a45: $fc
    db   $fd                                         ; $4a46: $fd
    db   $fc                                         ; $4a47: $fc

    jr_0ab_4a48:
    db   $fc                                         ; $4a48: $fc
    cp   $ff                                         ; $4a49: $fe $ff
    rst  $38                                         ; $4a4b: $ff
    rst  $38                                         ; $4a4c: $ff
    rst  $38                                         ; $4a4d: $ff
    rst  $38                                         ; $4a4e: $ff
    rst  $38                                         ; $4a4f: $ff
    ld   sp, hl                                      ; $4a50: $f9
    ld   b, $79                                      ; $4a51: $06 $79
    ld   b, $f9                                      ; $4a53: $06 $f9
    ld   b, $fa                                      ; $4a55: $06 $fa
    inc  b                                           ; $4a57: $04
    ld   [hl-], a                                    ; $4a58: $32
    inc  c                                           ; $4a59: $0c
    sub  h                                           ; $4a5a: $94
    ret  z                                           ; $4a5b: $c8

    pop  hl                                          ; $4a5c: $e1
    ret  nz                                          ; $4a5d: $c0

    ld   hl, sp-$04                                  ; $4a5e: $f8 $fc
    cp   a                                           ; $4a60: $bf
    ccf                                              ; $4a61: $3f
    cp   a                                           ; $4a62: $bf
    ccf                                              ; $4a63: $3f
    cp   a                                           ; $4a64: $bf
    ccf                                              ; $4a65: $3f
    cp   a                                           ; $4a66: $bf
    ccf                                              ; $4a67: $3f
    cp   a                                           ; $4a68: $bf
    ccf                                              ; $4a69: $3f
    rst  $38                                         ; $4a6a: $ff
    ccf                                              ; $4a6b: $3f
    ccf                                              ; $4a6c: $3f

    jr_0ab_4a6d:
    ld   a, a                                        ; $4a6d: $7f
    ld   a, a                                        ; $4a6e: $7f

    jr_0ab_4a6f:
    rst  $38                                         ; $4a6f: $ff
    rst  $38                                         ; $4a70: $ff
    rst  $38                                         ; $4a71: $ff
    rst  $38                                         ; $4a72: $ff
    rst  $38                                         ; $4a73: $ff
    rst  $38                                         ; $4a74: $ff
    rst  $38                                         ; $4a75: $ff
    rst  $38                                         ; $4a76: $ff
    rst  $38                                         ; $4a77: $ff
    rst  $38                                         ; $4a78: $ff
    rst  $38                                         ; $4a79: $ff
    rst  $38                                         ; $4a7a: $ff
    rst  $38                                         ; $4a7b: $ff
    rst  $38                                         ; $4a7c: $ff
    rst  $38                                         ; $4a7d: $ff
    rst  $38                                         ; $4a7e: $ff
    rst  $38                                         ; $4a7f: $ff
    db   $fc                                         ; $4a80: $fc
    di                                               ; $4a81: $f3
    db   $e4                                         ; $4a82: $e4
    di                                               ; $4a83: $f3
    db   $e3                                         ; $4a84: $e3
    db   $f4                                         ; $4a85: $f4
    and  $f0                                         ; $4a86: $e6 $f0
    db   $e3                                         ; $4a88: $e3
    ldh  a, [rIE]                                    ; $4a89: $f0 $ff
    ldh  a, [$f3]                                    ; $4a8b: $f0 $f3
    ld   hl, sp-$07                                  ; $4a8d: $f8 $f9
    db   $fc                                         ; $4a8f: $fc
    nop                                              ; $4a90: $00
    rst  $38                                         ; $4a91: $ff
    ldh  [$1f], a                                    ; $4a92: $e0 $1f
    ld   b, b                                        ; $4a94: $40
    ccf                                              ; $4a95: $3f
    ld   [$9071], sp                                 ; $4a96: $08 $71 $90
    ld   l, a                                        ; $4a99: $6f
    add  b                                           ; $4a9a: $80
    ld   a, a                                        ; $4a9b: $7f
    add  b                                           ; $4a9c: $80
    ld   a, a                                        ; $4a9d: $7f
    adc  d                                           ; $4a9e: $8a
    ld   [hl], c                                     ; $4a9f: $71
    ret  nz                                          ; $4aa0: $c0

    nop                                              ; $4aa1: $00
    inc  a                                           ; $4aa2: $3c
    ret  nz                                          ; $4aa3: $c0

    dec  l                                           ; $4aa4: $2d
    jp   nc, $d22d                                   ; $4aa5: $d2 $2d $d2

    dec  l                                           ; $4aa8: $2d
    jp   nc, wCounterToPressSirenBeforeBeingPenalized                                   ; $4aa9: $d2 $2e $d1

    daa                                              ; $4aac: $27
    ret  c                                           ; $4aad: $d8

    db   $10                                         ; $4aae: $10
    rst  $28                                         ; $4aaf: $ef
    nop                                              ; $4ab0: $00
    nop                                              ; $4ab1: $00
    nop                                              ; $4ab2: $00
    nop                                              ; $4ab3: $00
    cp   $01                                         ; $4ab4: $fe $01
    jr   nz, @-$1f                                   ; $4ab6: $20 $df

    add  b                                           ; $4ab8: $80
    rlca                                             ; $4ab9: $07
    sbc  h                                           ; $4aba: $9c
    ld   h, e                                        ; $4abb: $63
    ld   e, h                                        ; $4abc: $5c
    and  e                                           ; $4abd: $a3
    db   $fc                                         ; $4abe: $fc
    inc  bc                                          ; $4abf: $03
    ld   h, b                                        ; $4ac0: $60
    jr   nz, jr_0ab_4b2b                             ; $4ac1: $20 $68

    jr   nz, jr_0ab_4aed                             ; $4ac3: $20 $28

    add  b                                           ; $4ac5: $80
    jr   c, jr_0ab_4a48                              ; $4ac6: $38 $80

    inc  h                                           ; $4ac8: $24
    sbc  b                                           ; $4ac9: $98
    inc  hl                                          ; $4aca: $23
    sbc  h                                           ; $4acb: $9c
    jr   nz, jr_0ab_4a6d                             ; $4acc: $20 $9f

    jr   nz, jr_0ab_4a6f                             ; $4ace: $20 $9f

    dec  bc                                          ; $4ad0: $0b
    rlca                                             ; $4ad1: $07
    rla                                              ; $4ad2: $17
    rrca                                             ; $4ad3: $0f
    cpl                                              ; $4ad4: $2f
    rra                                              ; $4ad5: $1f
    ld   e, a                                        ; $4ad6: $5f
    ccf                                              ; $4ad7: $3f
    ccf                                              ; $4ad8: $3f
    ld   a, a                                        ; $4ad9: $7f
    ccf                                              ; $4ada: $3f
    ld   a, a                                        ; $4adb: $7f
    rst  $18                                         ; $4adc: $df
    ccf                                              ; $4add: $3f
    ccf                                              ; $4ade: $3f
    sbc  a                                           ; $4adf: $9f
    ld   b, c                                        ; $4ae0: $41
    rrca                                             ; $4ae1: $0f
    ld   b, [hl]                                     ; $4ae2: $46
    rrca                                             ; $4ae3: $0f
    ld   b, d                                        ; $4ae4: $42
    rlca                                             ; $4ae5: $07
    add  e                                           ; $4ae6: $83
    ld   bc, $0180                                   ; $4ae7: $01 $80 $01
    adc  h                                           ; $4aea: $8c
    inc  bc                                          ; $4aeb: $03
    sub  [hl]                                        ; $4aec: $96

    jr_0ab_4aed:
    rrca                                             ; $4aed: $0f
    ld   a, [bc]                                     ; $4aee: $0a
    rlca                                             ; $4aef: $07
    ld   b, b                                        ; $4af0: $40
    add  b                                           ; $4af1: $80
    add  b                                           ; $4af2: $80
    nop                                              ; $4af3: $00
    add  b                                           ; $4af4: $80
    nop                                              ; $4af5: $00
    ld   b, b                                        ; $4af6: $40
    add  b                                           ; $4af7: $80
    and  b                                           ; $4af8: $a0
    ret  nz                                          ; $4af9: $c0

    ret  nz                                          ; $4afa: $c0

    ldh  [rLCDC], a                                  ; $4afb: $e0 $40
    add  b                                           ; $4afd: $80
    nop                                              ; $4afe: $00
    nop                                              ; $4aff: $00
    nop                                              ; $4b00: $00
    nop                                              ; $4b01: $00
    nop                                              ; $4b02: $00
    nop                                              ; $4b03: $00
    nop                                              ; $4b04: $00
    nop                                              ; $4b05: $00
    nop                                              ; $4b06: $00
    nop                                              ; $4b07: $00
    nop                                              ; $4b08: $00
    nop                                              ; $4b09: $00
    nop                                              ; $4b0a: $00
    nop                                              ; $4b0b: $00
    rrca                                             ; $4b0c: $0f
    nop                                              ; $4b0d: $00
    rra                                              ; $4b0e: $1f
    rrca                                             ; $4b0f: $0f
    nop                                              ; $4b10: $00
    nop                                              ; $4b11: $00
    nop                                              ; $4b12: $00
    nop                                              ; $4b13: $00
    nop                                              ; $4b14: $00
    nop                                              ; $4b15: $00
    nop                                              ; $4b16: $00
    nop                                              ; $4b17: $00
    nop                                              ; $4b18: $00
    nop                                              ; $4b19: $00
    nop                                              ; $4b1a: $00
    nop                                              ; $4b1b: $00
    add  sp, $10                                     ; $4b1c: $e8 $10
    db   $fc                                         ; $4b1e: $fc
    ld   hl, sp+$00                                  ; $4b1f: $f8 $00
    nop                                              ; $4b21: $00
    nop                                              ; $4b22: $00
    nop                                              ; $4b23: $00
    nop                                              ; $4b24: $00
    nop                                              ; $4b25: $00
    nop                                              ; $4b26: $00
    nop                                              ; $4b27: $00
    nop                                              ; $4b28: $00
    nop                                              ; $4b29: $00
    nop                                              ; $4b2a: $00

    jr_0ab_4b2b:
    nop                                              ; $4b2b: $00
    dec  b                                           ; $4b2c: $05
    ld   [bc], a                                     ; $4b2d: $02
    inc  bc                                          ; $4b2e: $03
    rlca                                             ; $4b2f: $07
    nop                                              ; $4b30: $00
    nop                                              ; $4b31: $00
    nop                                              ; $4b32: $00
    nop                                              ; $4b33: $00
    nop                                              ; $4b34: $00
    nop                                              ; $4b35: $00
    nop                                              ; $4b36: $00
    nop                                              ; $4b37: $00
    nop                                              ; $4b38: $00
    nop                                              ; $4b39: $00
    nop                                              ; $4b3a: $00
    nop                                              ; $4b3b: $00
    nop                                              ; $4b3c: $00
    nop                                              ; $4b3d: $00
    nop                                              ; $4b3e: $00
    nop                                              ; $4b3f: $00
    nop                                              ; $4b40: $00
    nop                                              ; $4b41: $00
    nop                                              ; $4b42: $00
    nop                                              ; $4b43: $00
    nop                                              ; $4b44: $00
    nop                                              ; $4b45: $00
    nop                                              ; $4b46: $00
    nop                                              ; $4b47: $00
    nop                                              ; $4b48: $00
    nop                                              ; $4b49: $00
    nop                                              ; $4b4a: $00
    nop                                              ; $4b4b: $00
    nop                                              ; $4b4c: $00
    nop                                              ; $4b4d: $00
    ret  nz                                          ; $4b4e: $c0

    ld   h, b                                        ; $4b4f: $60
    nop                                              ; $4b50: $00
    nop                                              ; $4b51: $00
    nop                                              ; $4b52: $00
    nop                                              ; $4b53: $00
    nop                                              ; $4b54: $00
    nop                                              ; $4b55: $00
    nop                                              ; $4b56: $00
    nop                                              ; $4b57: $00
    nop                                              ; $4b58: $00
    nop                                              ; $4b59: $00
    nop                                              ; $4b5a: $00
    nop                                              ; $4b5b: $00
    nop                                              ; $4b5c: $00
    nop                                              ; $4b5d: $00
    ld   bc, $0003                                   ; $4b5e: $01 $03 $00
    nop                                              ; $4b61: $00
    nop                                              ; $4b62: $00
    nop                                              ; $4b63: $00
    nop                                              ; $4b64: $00
    nop                                              ; $4b65: $00
    nop                                              ; $4b66: $00
    nop                                              ; $4b67: $00
    nop                                              ; $4b68: $00
    nop                                              ; $4b69: $00
    nop                                              ; $4b6a: $00
    nop                                              ; $4b6b: $00
    nop                                              ; $4b6c: $00
    nop                                              ; $4b6d: $00
    rst  $38                                         ; $4b6e: $ff
    rst  $38                                         ; $4b6f: $ff
    nop                                              ; $4b70: $00
    nop                                              ; $4b71: $00
    nop                                              ; $4b72: $00
    nop                                              ; $4b73: $00
    nop                                              ; $4b74: $00
    nop                                              ; $4b75: $00
    nop                                              ; $4b76: $00
    nop                                              ; $4b77: $00
    nop                                              ; $4b78: $00
    nop                                              ; $4b79: $00
    and  d                                           ; $4b7a: $a2
    ld   b, b                                        ; $4b7b: $40
    and  [hl]                                        ; $4b7c: $a6
    db   $e3                                         ; $4b7d: $e3
    and  [hl]                                        ; $4b7e: $a6
    db   $e3                                         ; $4b7f: $e3
    nop                                              ; $4b80: $00
    nop                                              ; $4b81: $00
    nop                                              ; $4b82: $00
    nop                                              ; $4b83: $00
    nop                                              ; $4b84: $00
    nop                                              ; $4b85: $00
    nop                                              ; $4b86: $00
    nop                                              ; $4b87: $00
    nop                                              ; $4b88: $00
    nop                                              ; $4b89: $00
    nop                                              ; $4b8a: $00
    nop                                              ; $4b8b: $00
    ld   b, b                                        ; $4b8c: $40
    ccf                                              ; $4b8d: $3f
    ld   a, a                                        ; $4b8e: $7f
    ccf                                              ; $4b8f: $3f
    nop                                              ; $4b90: $00
    nop                                              ; $4b91: $00
    nop                                              ; $4b92: $00
    nop                                              ; $4b93: $00
    nop                                              ; $4b94: $00
    nop                                              ; $4b95: $00
    nop                                              ; $4b96: $00
    nop                                              ; $4b97: $00
    nop                                              ; $4b98: $00
    nop                                              ; $4b99: $00
    nop                                              ; $4b9a: $00
    nop                                              ; $4b9b: $00
    ld   [bc], a                                     ; $4b9c: $02
    add  c                                           ; $4b9d: $81
    inc  bc                                          ; $4b9e: $03
    add  c                                           ; $4b9f: $81
    nop                                              ; $4ba0: $00
    nop                                              ; $4ba1: $00
    nop                                              ; $4ba2: $00
    nop                                              ; $4ba3: $00
    nop                                              ; $4ba4: $00
    nop                                              ; $4ba5: $00
    nop                                              ; $4ba6: $00
    nop                                              ; $4ba7: $00
    nop                                              ; $4ba8: $00
    nop                                              ; $4ba9: $00
    nop                                              ; $4baa: $00
    nop                                              ; $4bab: $00
    add  [hl]                                        ; $4bac: $86
    ld   c, $9b                                      ; $4bad: $0e $9b
    adc  [hl]                                        ; $4baf: $8e
    nop                                              ; $4bb0: $00
    nop                                              ; $4bb1: $00
    nop                                              ; $4bb2: $00
    nop                                              ; $4bb3: $00
    nop                                              ; $4bb4: $00
    nop                                              ; $4bb5: $00
    nop                                              ; $4bb6: $00
    nop                                              ; $4bb7: $00
    nop                                              ; $4bb8: $00
    nop                                              ; $4bb9: $00
    nop                                              ; $4bba: $00
    nop                                              ; $4bbb: $00
    nop                                              ; $4bbc: $00
    nop                                              ; $4bbd: $00
    nop                                              ; $4bbe: $00
    nop                                              ; $4bbf: $00
    nop                                              ; $4bc0: $00
    nop                                              ; $4bc1: $00
    nop                                              ; $4bc2: $00
    nop                                              ; $4bc3: $00
    nop                                              ; $4bc4: $00
    nop                                              ; $4bc5: $00
    nop                                              ; $4bc6: $00
    nop                                              ; $4bc7: $00
    nop                                              ; $4bc8: $00
    nop                                              ; $4bc9: $00
    nop                                              ; $4bca: $00
    nop                                              ; $4bcb: $00
    nop                                              ; $4bcc: $00
    nop                                              ; $4bcd: $00
    nop                                              ; $4bce: $00
    nop                                              ; $4bcf: $00
    ld   bc, $0100                                   ; $4bd0: $01 $00 $01
    nop                                              ; $4bd3: $00
    ld   bc, $0100                                   ; $4bd4: $01 $00 $01
    nop                                              ; $4bd7: $00
    ld   [bc], a                                     ; $4bd8: $02
    nop                                              ; $4bd9: $00
    ld   [bc], a                                     ; $4bda: $02
    nop                                              ; $4bdb: $00
    ld   [bc], a                                     ; $4bdc: $02
    nop                                              ; $4bdd: $00
    ld   [bc], a                                     ; $4bde: $02
    nop                                              ; $4bdf: $00
    dec  b                                           ; $4be0: $05
    inc  bc                                          ; $4be1: $03
    ld   [bc], a                                     ; $4be2: $02
    ld   bc, $0001                                   ; $4be3: $01 $01 $00
    jr   jr_0ab_4bef                                 ; $4be6: $18 $07

    ld   d, $0f                                      ; $4be8: $16 $0f
    ld   c, $07                                      ; $4bea: $0e $07
    inc  b                                           ; $4bec: $04
    inc  bc                                          ; $4bed: $03
    ld   [bc], a                                     ; $4bee: $02

    jr_0ab_4bef:
    ld   bc, $0080                                   ; $4bef: $01 $80 $00
    ret  nz                                          ; $4bf2: $c0

    add  b                                           ; $4bf3: $80
    ldh  [$c0], a                                    ; $4bf4: $e0 $c0
    ret  nc                                          ; $4bf6: $d0

    ldh  [$f0], a                                    ; $4bf7: $e0 $f0
    nop                                              ; $4bf9: $00
    nop                                              ; $4bfa: $00
    nop                                              ; $4bfb: $00
    add  b                                           ; $4bfc: $80
    nop                                              ; $4bfd: $00
    ld   b, b                                        ; $4bfe: $40
    add  b                                           ; $4bff: $80
    rra                                              ; $4c00: $1f
    rrca                                             ; $4c01: $0f
    nop                                              ; $4c02: $00
    nop                                              ; $4c03: $00
    nop                                              ; $4c04: $00
    nop                                              ; $4c05: $00
    nop                                              ; $4c06: $00
    nop                                              ; $4c07: $00
    ld   bc, $0300                                   ; $4c08: $01 $00 $03
    ld   bc, $0703                                   ; $4c0b: $01 $03 $07
    rra                                              ; $4c0e: $1f
    rrca                                             ; $4c0f: $0f
    ld   hl, sp-$08                                  ; $4c10: $f8 $f8
    ld   [hl], b                                     ; $4c12: $70
    jr   c, jr_0ab_4c45                              ; $4c13: $38 $30

    ld   [hl], b                                     ; $4c15: $70
    ldh  [rSVBK], a                                  ; $4c16: $e0 $70
    ldh  a, [$e0]                                    ; $4c18: $f0 $e0
    ld   hl, sp-$10                                  ; $4c1a: $f8 $f0
    cp   h                                           ; $4c1c: $bc
    ld   hl, sp+$3c                                  ; $4c1d: $f8 $3c
    sbc  [hl]                                        ; $4c1f: $9e
    rrca                                             ; $4c20: $0f
    rlca                                             ; $4c21: $07
    rrca                                             ; $4c22: $0f
    rrca                                             ; $4c23: $0f
    inc  e                                           ; $4c24: $1c
    rra                                              ; $4c25: $1f
    ld   a, h                                        ; $4c26: $7c
    ld   a, [hl-]                                    ; $4c27: $3a
    ld   a, e                                        ; $4c28: $7b
    scf                                              ; $4c29: $37
    rla                                              ; $4c2a: $17
    inc  hl                                          ; $4c2b: $23
    inc  bc                                          ; $4c2c: $03
    ld   bc, $0703                                   ; $4c2d: $01 $03 $07
    nop                                              ; $4c30: $00
    ldh  a, [$f0]                                    ; $4c31: $f0 $f0
    ld   hl, sp+$70                                  ; $4c33: $f8 $70
    ldh  a, [$60]                                    ; $4c35: $f0 $60
    ld   [hl], b                                     ; $4c37: $70
    ld   h, b                                        ; $4c38: $60
    ldh  [$c0], a                                    ; $4c39: $e0 $c0
    ldh  [$e0], a                                    ; $4c3b: $e0 $e0
    ldh  [$f0], a                                    ; $4c3d: $e0 $f0
    ldh  [$f0], a                                    ; $4c3f: $e0 $f0
    ldh  a, [$f0]                                    ; $4c41: $f0 $f0
    ld   a, b                                        ; $4c43: $78
    nop                                              ; $4c44: $00

    jr_0ab_4c45:
    jr   nc, jr_0ab_4c47                             ; $4c45: $30 $00

    jr_0ab_4c47:
    nop                                              ; $4c47: $00
    ld   bc, $0100                                   ; $4c48: $01 $00 $01
    inc  bc                                          ; $4c4b: $03
    rrca                                             ; $4c4c: $0f
    rlca                                             ; $4c4d: $07
    ld   a, $1f                                      ; $4c4e: $3e $1f
    ld   bc, $0303                                   ; $4c50: $01 $03 $03
    jr   nz, jr_0ab_4c75                             ; $4c53: $20 $20

    ld   [hl], b                                     ; $4c55: $70
    ldh  a, [rSVBK]                                  ; $4c56: $f0 $70
    ldh  [$e0], a                                    ; $4c58: $e0 $e0
    ldh  [$c0], a                                    ; $4c5a: $e0 $c0
    ret  nz                                          ; $4c5c: $c0

    add  b                                           ; $4c5d: $80
    nop                                              ; $4c5e: $00
    nop                                              ; $4c5f: $00
    rst  $38                                         ; $4c60: $ff
    rst  $38                                         ; $4c61: $ff
    rst  $38                                         ; $4c62: $ff
    ld   bc, $0301                                   ; $4c63: $01 $01 $03
    inc  bc                                          ; $4c66: $03
    inc  bc                                          ; $4c67: $03
    inc  bc                                          ; $4c68: $03
    rlca                                             ; $4c69: $07
    ld   c, $07                                      ; $4c6a: $0e $07
    ld   c, $1e                                      ; $4c6c: $0e $1e
    ld   e, $3c                                      ; $4c6e: $1e $3c
    rst  $08                                         ; $4c70: $cf
    rst  $08                                         ; $4c71: $cf
    adc  a                                           ; $4c72: $8f
    rst  $08                                         ; $4c73: $cf
    adc  e                                           ; $4c74: $8b

    jr_0ab_4c75:
    adc  a                                           ; $4c75: $8f
    ld   a, [bc]                                     ; $4c76: $0a
    adc  a                                           ; $4c77: $8f
    adc  d                                           ; $4c78: $8a
    rrca                                             ; $4c79: $0f
    ld   a, [bc]                                     ; $4c7a: $0a
    rrca                                             ; $4c7b: $0f
    dec  bc                                          ; $4c7c: $0b
    rrca                                             ; $4c7d: $0f
    dec  bc                                          ; $4c7e: $0b
    rrca                                             ; $4c7f: $0f
    or   b                                           ; $4c80: $b0
    rst  $38                                         ; $4c81: $ff
    cp   a                                           ; $4c82: $bf
    rst  $38                                         ; $4c83: $ff
    or   b                                           ; $4c84: $b0
    rst  $38                                         ; $4c85: $ff
    cp   a                                           ; $4c86: $bf
    rst  $38                                         ; $4c87: $ff
    ldh  a, [rIE]                                    ; $4c88: $f0 $ff
    rst  $38                                         ; $4c8a: $ff
    rst  $38                                         ; $4c8b: $ff
    xor  l                                           ; $4c8c: $ad
    rst  $38                                         ; $4c8d: $ff
    and  a                                           ; $4c8e: $a7
    rst  $38                                         ; $4c8f: $ff
    add  c                                           ; $4c90: $81
    inc  bc                                          ; $4c91: $03
    adc  a                                           ; $4c92: $8f
    inc  bc                                          ; $4c93: $03
    cp   a                                           ; $4c94: $bf
    rra                                              ; $4c95: $1f
    sbc  a                                           ; $4c96: $9f
    rra                                              ; $4c97: $1f
    ld   b, d                                        ; $4c98: $42
    add  a                                           ; $4c99: $87
    rst  JumpTableTrashDE                                         ; $4c9a: $c7
    add  [hl]                                        ; $4c9b: $86
    ld   b, $8e                                      ; $4c9c: $06 $8e
    inc  c                                           ; $4c9e: $0c
    adc  [hl]                                        ; $4c9f: $8e
    add  b                                           ; $4ca0: $80
    adc  h                                           ; $4ca1: $8c
    call c, $ecec                                    ; $4ca2: $dc $ec $ec
    cp   $b6                                         ; $4ca5: $fe $b6
    ld   a, [hl]                                     ; $4ca7: $7e
    halt                                             ; $4ca8: $76
    scf                                              ; $4ca9: $37
    ld   [hl], d                                     ; $4caa: $72
    scf                                              ; $4cab: $37
    inc  h                                           ; $4cac: $24
    ld   [hl], d                                     ; $4cad: $72
    ld   h, b                                        ; $4cae: $60
    ld   [hl], b                                     ; $4caf: $70
    nop                                              ; $4cb0: $00
    nop                                              ; $4cb1: $00
    nop                                              ; $4cb2: $00
    nop                                              ; $4cb3: $00
    nop                                              ; $4cb4: $00
    nop                                              ; $4cb5: $00
    nop                                              ; $4cb6: $00
    nop                                              ; $4cb7: $00
    nop                                              ; $4cb8: $00
    nop                                              ; $4cb9: $00
    nop                                              ; $4cba: $00
    nop                                              ; $4cbb: $00
    nop                                              ; $4cbc: $00
    nop                                              ; $4cbd: $00
    nop                                              ; $4cbe: $00
    nop                                              ; $4cbf: $00
    nop                                              ; $4cc0: $00
    nop                                              ; $4cc1: $00
    nop                                              ; $4cc2: $00
    nop                                              ; $4cc3: $00
    nop                                              ; $4cc4: $00
    nop                                              ; $4cc5: $00
    nop                                              ; $4cc6: $00
    nop                                              ; $4cc7: $00
    nop                                              ; $4cc8: $00
    nop                                              ; $4cc9: $00
    nop                                              ; $4cca: $00
    nop                                              ; $4ccb: $00
    nop                                              ; $4ccc: $00
    nop                                              ; $4ccd: $00
    nop                                              ; $4cce: $00
    nop                                              ; $4ccf: $00
    inc  b                                           ; $4cd0: $04
    nop                                              ; $4cd1: $00
    inc  b                                           ; $4cd2: $04
    nop                                              ; $4cd3: $00
    inc  b                                           ; $4cd4: $04
    nop                                              ; $4cd5: $00
    inc  b                                           ; $4cd6: $04
    nop                                              ; $4cd7: $00
    inc  b                                           ; $4cd8: $04
    nop                                              ; $4cd9: $00
    ld   [$0800], sp                                 ; $4cda: $08 $00 $08
    nop                                              ; $4cdd: $00
    ld   [$0100], sp                                 ; $4cde: $08 $00 $01
    nop                                              ; $4ce1: $00
    ld   c, $01                                      ; $4ce2: $0e $01
    rla                                              ; $4ce4: $17
    rrca                                             ; $4ce5: $0f
    rla                                              ; $4ce6: $17
    ld   c, $00                                      ; $4ce7: $0e $00
    rlca                                             ; $4ce9: $07
    ld   [bc], a                                     ; $4cea: $02
    ld   bc, $0001                                   ; $4ceb: $01 $01 $00
    nop                                              ; $4cee: $00
    nop                                              ; $4cef: $00
    ld   h, b                                        ; $4cf0: $60
    ret  nz                                          ; $4cf1: $c0

    ld   [hl], b                                     ; $4cf2: $70
    ldh  [$a8], a                                    ; $4cf3: $e0 $a8
    ldh  a, [$e0]                                    ; $4cf5: $f0 $e0
    nop                                              ; $4cf7: $00
    nop                                              ; $4cf8: $00
    nop                                              ; $4cf9: $00
    add  b                                           ; $4cfa: $80
    nop                                              ; $4cfb: $00
    ret  nz                                          ; $4cfc: $c0

    add  b                                           ; $4cfd: $80
    and  b                                           ; $4cfe: $a0
    ld   b, b                                        ; $4cff: $40
    ccf                                              ; $4d00: $3f
    ld   e, $18                                      ; $4d01: $1e $18
    inc  e                                           ; $4d03: $1c
    jr   jr_0ab_4d06                                 ; $4d04: $18 $00

    jr_0ab_4d06:
    nop                                              ; $4d06: $00
    nop                                              ; $4d07: $00
    nop                                              ; $4d08: $00
    nop                                              ; $4d09: $00
    nop                                              ; $4d0a: $00
    nop                                              ; $4d0b: $00
    nop                                              ; $4d0c: $00
    nop                                              ; $4d0d: $00
    nop                                              ; $4d0e: $00
    nop                                              ; $4d0f: $00
    ld   e, $0e                                      ; $4d10: $1e $0e
    ld   c, $04                                      ; $4d12: $0e $04
    nop                                              ; $4d14: $00
    nop                                              ; $4d15: $00
    nop                                              ; $4d16: $00
    nop                                              ; $4d17: $00
    nop                                              ; $4d18: $00
    nop                                              ; $4d19: $00
    nop                                              ; $4d1a: $00
    nop                                              ; $4d1b: $00
    nop                                              ; $4d1c: $00
    nop                                              ; $4d1d: $00
    nop                                              ; $4d1e: $00
    nop                                              ; $4d1f: $00
    rrca                                             ; $4d20: $0f
    rra                                              ; $4d21: $1f
    inc  e                                           ; $4d22: $1c
    ld   a, $1c                                      ; $4d23: $3e $1c
    jr   jr_0ab_4d27                                 ; $4d25: $18 $00

    jr_0ab_4d27:
    nop                                              ; $4d27: $00
    nop                                              ; $4d28: $00
    nop                                              ; $4d29: $00
    nop                                              ; $4d2a: $00
    nop                                              ; $4d2b: $00
    nop                                              ; $4d2c: $00
    nop                                              ; $4d2d: $00
    nop                                              ; $4d2e: $00
    nop                                              ; $4d2f: $00
    ld   h, b                                        ; $4d30: $60
    nop                                              ; $4d31: $00
    nop                                              ; $4d32: $00
    nop                                              ; $4d33: $00
    nop                                              ; $4d34: $00
    nop                                              ; $4d35: $00
    nop                                              ; $4d36: $00
    nop                                              ; $4d37: $00
    nop                                              ; $4d38: $00
    nop                                              ; $4d39: $00
    nop                                              ; $4d3a: $00
    nop                                              ; $4d3b: $00
    nop                                              ; $4d3c: $00
    nop                                              ; $4d3d: $00
    nop                                              ; $4d3e: $00
    nop                                              ; $4d3f: $00
    ld   a, [hl]                                     ; $4d40: $7e
    db   $fc                                         ; $4d41: $fc
    ld   [hl], b                                     ; $4d42: $70
    ld   hl, sp-$60                                  ; $4d43: $f8 $a0
    ld   b, b                                        ; $4d45: $40
    nop                                              ; $4d46: $00
    nop                                              ; $4d47: $00
    nop                                              ; $4d48: $00
    nop                                              ; $4d49: $00
    nop                                              ; $4d4a: $00
    nop                                              ; $4d4b: $00
    nop                                              ; $4d4c: $00
    nop                                              ; $4d4d: $00
    nop                                              ; $4d4e: $00
    nop                                              ; $4d4f: $00
    nop                                              ; $4d50: $00
    nop                                              ; $4d51: $00
    nop                                              ; $4d52: $00
    nop                                              ; $4d53: $00
    nop                                              ; $4d54: $00
    nop                                              ; $4d55: $00
    nop                                              ; $4d56: $00
    nop                                              ; $4d57: $00
    nop                                              ; $4d58: $00
    nop                                              ; $4d59: $00
    nop                                              ; $4d5a: $00
    nop                                              ; $4d5b: $00
    nop                                              ; $4d5c: $00
    nop                                              ; $4d5d: $00
    nop                                              ; $4d5e: $00
    nop                                              ; $4d5f: $00
    ld   a, h                                        ; $4d60: $7c
    ld   hl, sp-$20                                  ; $4d61: $f8 $e0
    ldh  a, [rAUD4LEN]                               ; $4d63: $f0 $20
    ld   b, b                                        ; $4d65: $40
    nop                                              ; $4d66: $00
    nop                                              ; $4d67: $00
    nop                                              ; $4d68: $00
    nop                                              ; $4d69: $00
    nop                                              ; $4d6a: $00
    nop                                              ; $4d6b: $00
    nop                                              ; $4d6c: $00
    nop                                              ; $4d6d: $00
    nop                                              ; $4d6e: $00
    nop                                              ; $4d6f: $00
    ld   a, [bc]                                     ; $4d70: $0a
    rlca                                             ; $4d71: $07
    ld   b, $03                                      ; $4d72: $06 $03
    ld   b, $03                                      ; $4d74: $06 $03
    dec  b                                           ; $4d76: $05
    ld   [bc], a                                     ; $4d77: $02
    nop                                              ; $4d78: $00
    nop                                              ; $4d79: $00
    nop                                              ; $4d7a: $00
    nop                                              ; $4d7b: $00
    nop                                              ; $4d7c: $00
    nop                                              ; $4d7d: $00
    nop                                              ; $4d7e: $00
    nop                                              ; $4d7f: $00
    rst  $28                                         ; $4d80: $ef
    scf                                              ; $4d81: $37
    cp   e                                           ; $4d82: $bb
    ld   a, a                                        ; $4d83: $7f
    ld   a, a                                        ; $4d84: $7f
    ld   sp, hl                                      ; $4d85: $f9
    and  c                                           ; $4d86: $a1
    ld   b, b                                        ; $4d87: $40
    nop                                              ; $4d88: $00
    nop                                              ; $4d89: $00
    nop                                              ; $4d8a: $00
    nop                                              ; $4d8b: $00
    nop                                              ; $4d8c: $00
    nop                                              ; $4d8d: $00
    nop                                              ; $4d8e: $00
    nop                                              ; $4d8f: $00
    dec  c                                           ; $4d90: $0d
    inc  e                                           ; $4d91: $1c
    db   $fd                                         ; $4d92: $fd
    sbc  c                                           ; $4d93: $99
    pop  bc                                          ; $4d94: $c1
    sbc  c                                           ; $4d95: $99
    nop                                              ; $4d96: $00
    add  b                                           ; $4d97: $80
    nop                                              ; $4d98: $00
    nop                                              ; $4d99: $00
    nop                                              ; $4d9a: $00
    nop                                              ; $4d9b: $00
    nop                                              ; $4d9c: $00
    nop                                              ; $4d9d: $00
    nop                                              ; $4d9e: $00
    nop                                              ; $4d9f: $00
    ld   [hl], b                                     ; $4da0: $70
    ldh  [$e0], a                                    ; $4da1: $e0 $e0
    ldh  [$e0], a                                    ; $4da3: $e0 $e0
    ret  nz                                          ; $4da5: $c0

    nop                                              ; $4da6: $00
    nop                                              ; $4da7: $00
    nop                                              ; $4da8: $00
    nop                                              ; $4da9: $00
    nop                                              ; $4daa: $00
    nop                                              ; $4dab: $00
    nop                                              ; $4dac: $00
    nop                                              ; $4dad: $00
    nop                                              ; $4dae: $00
    nop                                              ; $4daf: $00
    nop                                              ; $4db0: $00
    nop                                              ; $4db1: $00
    nop                                              ; $4db2: $00
    nop                                              ; $4db3: $00
    nop                                              ; $4db4: $00
    nop                                              ; $4db5: $00
    nop                                              ; $4db6: $00
    nop                                              ; $4db7: $00
    nop                                              ; $4db8: $00
    nop                                              ; $4db9: $00
    nop                                              ; $4dba: $00
    nop                                              ; $4dbb: $00
    nop                                              ; $4dbc: $00
    nop                                              ; $4dbd: $00
    nop                                              ; $4dbe: $00
    nop                                              ; $4dbf: $00
    nop                                              ; $4dc0: $00
    nop                                              ; $4dc1: $00
    nop                                              ; $4dc2: $00
    nop                                              ; $4dc3: $00
    nop                                              ; $4dc4: $00
    nop                                              ; $4dc5: $00
    nop                                              ; $4dc6: $00
    nop                                              ; $4dc7: $00
    nop                                              ; $4dc8: $00
    nop                                              ; $4dc9: $00
    nop                                              ; $4dca: $00
    nop                                              ; $4dcb: $00
    nop                                              ; $4dcc: $00
    nop                                              ; $4dcd: $00
    nop                                              ; $4dce: $00
    nop                                              ; $4dcf: $00
    ld   [$1000], sp                                 ; $4dd0: $08 $00 $10
    nop                                              ; $4dd3: $00
    stop                                             ; $4dd4: $10 $00
    stop                                             ; $4dd6: $10 $00
    stop                                             ; $4dd8: $10 $00
    stop                                             ; $4dda: $10 $00
    jr   nz, jr_0ab_4dde                             ; $4ddc: $20 $00

    jr_0ab_4dde:
    jr   nz, jr_0ab_4de0                             ; $4dde: $20 $00

    jr_0ab_4de0:
    ld   bc, $3000                                   ; $4de0: $01 $00 $30
    rrca                                             ; $4de3: $0f
    ld   e, $0f                                      ; $4de4: $1e $0f
    dec  b                                           ; $4de6: $05
    ld   c, $07                                      ; $4de7: $0e $07
    ld   [bc], a                                     ; $4de9: $02
    inc  bc                                          ; $4dea: $03
    ld   bc, $0001                                   ; $4deb: $01 $01 $00
    nop                                              ; $4dee: $00
    nop                                              ; $4def: $00
    ret  nc                                          ; $4df0: $d0

    ld   h, b                                        ; $4df1: $60
    ld   l, b                                        ; $4df2: $68
    ldh  a, [$30]                                    ; $4df3: $f0 $30
    ld   hl, sp+$38                                  ; $4df5: $f8 $38
    nop                                              ; $4df7: $00
    nop                                              ; $4df8: $00
    nop                                              ; $4df9: $00
    add  b                                           ; $4dfa: $80
    nop                                              ; $4dfb: $00
    ret  nz                                          ; $4dfc: $c0

    nop                                              ; $4dfd: $00
    ld   b, b                                        ; $4dfe: $40
    add  b                                           ; $4dff: $80
    nop                                              ; $4e00: $00
    nop                                              ; $4e01: $00
    nop                                              ; $4e02: $00
    nop                                              ; $4e03: $00
    ld   a, $01                                      ; $4e04: $3e $01
    ccf                                              ; $4e06: $3f
    ccf                                              ; $4e07: $3f
    ccf                                              ; $4e08: $3f
    ccf                                              ; $4e09: $3f
    jr   nc, jr_0ab_4e4b                             ; $4e0a: $30 $3f

    scf                                              ; $4e0c: $37
    ccf                                              ; $4e0d: $3f
    jr   z, @+$19                                    ; $4e0e: $28 $17

    nop                                              ; $4e10: $00
    nop                                              ; $4e11: $00
    ret  nz                                          ; $4e12: $c0

    nop                                              ; $4e13: $00
    cp   $c0                                         ; $4e14: $fe $c0
    rst  $38                                         ; $4e16: $ff
    cp   $ff                                         ; $4e17: $fe $ff
    cp   $07                                         ; $4e19: $fe $07
    cp   $ff                                         ; $4e1b: $fe $ff
    cp   $05                                         ; $4e1d: $fe $05
    ld   a, [$0000]                                  ; $4e1f: $fa $00 $00
    ld   bc, $0100                                   ; $4e22: $01 $00 $01
    ld   bc, $017f                                   ; $4e25: $01 $7f $01
    ccf                                              ; $4e28: $3f
    ld   a, a                                        ; $4e29: $7f
    ccf                                              ; $4e2a: $3f
    ld   a, a                                        ; $4e2b: $7f
    ld   l, $71                                      ; $4e2c: $2e $71
    ld   a, $7f                                      ; $4e2e: $3e $7f
    nop                                              ; $4e30: $00
    nop                                              ; $4e31: $00
    sub  b                                           ; $4e32: $90
    nop                                              ; $4e33: $00
    ld   hl, sp-$50                                  ; $4e34: $f8 $b0
    sub  h                                           ; $4e36: $94
    ld   hl, sp-$08                                  ; $4e37: $f8 $f8
    db   $fc                                         ; $4e39: $fc
    ld   hl, sp-$04                                  ; $4e3a: $f8 $fc
    adc  b                                           ; $4e3c: $88
    ret  nc                                          ; $4e3d: $d0

    sbc  b                                           ; $4e3e: $98
    ld   hl, sp+$00                                  ; $4e3f: $f8 $00
    nop                                              ; $4e41: $00
    nop                                              ; $4e42: $00
    nop                                              ; $4e43: $00
    jr   nc, jr_0ab_4ea6                             ; $4e44: $30 $60

    ld   h, b                                        ; $4e46: $60
    ld   [hl], b                                     ; $4e47: $70
    ld   [hl], b                                     ; $4e48: $70
    ld   h, b                                        ; $4e49: $60
    ld   [hl], b                                     ; $4e4a: $70

    jr_0ab_4e4b:
    ld   h, b                                        ; $4e4b: $60
    ld   [hl], b                                     ; $4e4c: $70
    ld   h, b                                        ; $4e4d: $60
    ld   [hl], b                                     ; $4e4e: $70
    ld   h, b                                        ; $4e4f: $60
    nop                                              ; $4e50: $00
    nop                                              ; $4e51: $00
    nop                                              ; $4e52: $00
    nop                                              ; $4e53: $00
    nop                                              ; $4e54: $00
    nop                                              ; $4e55: $00
    nop                                              ; $4e56: $00
    nop                                              ; $4e57: $00
    ld   bc, $0103                                   ; $4e58: $01 $03 $01
    inc  bc                                          ; $4e5b: $03
    nop                                              ; $4e5c: $00
    ld   bc, $0101                                   ; $4e5d: $01 $01 $01
    nop                                              ; $4e60: $00
    nop                                              ; $4e61: $00
    nop                                              ; $4e62: $00
    nop                                              ; $4e63: $00
    inc  c                                           ; $4e64: $0c
    jr   jr_0ab_4e82                                 ; $4e65: $18 $1b

    inc  e                                           ; $4e67: $1c
    rst  $38                                         ; $4e68: $ff
    rst  $38                                         ; $4e69: $ff
    rst  $38                                         ; $4e6a: $ff
    rst  $38                                         ; $4e6b: $ff
    ld   e, h                                        ; $4e6c: $5c
    sbc  b                                           ; $4e6d: $98
    ld   sp, hl                                      ; $4e6e: $f9
    rst  $18                                         ; $4e6f: $df
    nop                                              ; $4e70: $00
    nop                                              ; $4e71: $00
    nop                                              ; $4e72: $00
    nop                                              ; $4e73: $00
    ld   bc, $8303                                   ; $4e74: $01 $03 $83
    inc  bc                                          ; $4e77: $03
    jp   $c383                                       ; $4e78: $c3 $83 $c3


    add  e                                           ; $4e7b: $83
    inc  bc                                          ; $4e7c: $03
    inc  bc                                          ; $4e7d: $03
    add  e                                           ; $4e7e: $83
    add  e                                           ; $4e7f: $83
    nop                                              ; $4e80: $00
    nop                                              ; $4e81: $00

    jr_0ab_4e82:
    nop                                              ; $4e82: $00
    nop                                              ; $4e83: $00
    add  b                                           ; $4e84: $80
    nop                                              ; $4e85: $00
    nop                                              ; $4e86: $00
    add  b                                           ; $4e87: $80
    add  b                                           ; $4e88: $80
    nop                                              ; $4e89: $00
    add  b                                           ; $4e8a: $80
    nop                                              ; $4e8b: $00
    add  b                                           ; $4e8c: $80
    nop                                              ; $4e8d: $00
    add  b                                           ; $4e8e: $80
    nop                                              ; $4e8f: $00
    nop                                              ; $4e90: $00
    nop                                              ; $4e91: $00
    nop                                              ; $4e92: $00
    nop                                              ; $4e93: $00
    nop                                              ; $4e94: $00
    ld   bc, $0103                                   ; $4e95: $01 $03 $01
    ld   bc, $0f03                                   ; $4e98: $01 $03 $0f
    rra                                              ; $4e9b: $1f
    rrca                                             ; $4e9c: $0f
    rra                                              ; $4e9d: $1f
    rra                                              ; $4e9e: $1f
    inc  bc                                          ; $4e9f: $03
    nop                                              ; $4ea0: $00
    nop                                              ; $4ea1: $00
    nop                                              ; $4ea2: $00
    nop                                              ; $4ea3: $00
    ld   b, b                                        ; $4ea4: $40
    add  b                                           ; $4ea5: $80

    jr_0ab_4ea6:
    ret  nz                                          ; $4ea6: $c0

    add  b                                           ; $4ea7: $80
    sub  b                                           ; $4ea8: $90
    ldh  [$e0], a                                    ; $4ea9: $e0 $e0
    ldh  a, [$d0]                                    ; $4eab: $f0 $d0
    ldh  [$84], a                                    ; $4ead: $e0 $84
    ld   a, $00                                      ; $4eaf: $3e $00
    nop                                              ; $4eb1: $00
    nop                                              ; $4eb2: $00
    nop                                              ; $4eb3: $00
    ld   [bc], a                                     ; $4eb4: $02
    ld   bc, $0301                                   ; $4eb5: $01 $01 $03
    ld   bc, $0103                                   ; $4eb8: $01 $03 $01
    inc  bc                                          ; $4ebb: $03
    inc  bc                                          ; $4ebc: $03
    ld   bc, $0103                                   ; $4ebd: $01 $03 $01
    nop                                              ; $4ec0: $00
    nop                                              ; $4ec1: $00
    nop                                              ; $4ec2: $00
    nop                                              ; $4ec3: $00
    ld   b, b                                        ; $4ec4: $40
    add  b                                           ; $4ec5: $80
    ret  nz                                          ; $4ec6: $c0

    add  b                                           ; $4ec7: $80
    ret  nz                                          ; $4ec8: $c0

    add  b                                           ; $4ec9: $80
    ret  nz                                          ; $4eca: $c0

    add  b                                           ; $4ecb: $80
    ret  nz                                          ; $4ecc: $c0

    add  b                                           ; $4ecd: $80
    add  b                                           ; $4ece: $80
    add  b                                           ; $4ecf: $80
    jr   nz, jr_0ab_4ed2                             ; $4ed0: $20 $00

    jr_0ab_4ed2:
    jr   nz, jr_0ab_4ed4                             ; $4ed2: $20 $00

    jr_0ab_4ed4:
    ld   b, b                                        ; $4ed4: $40
    nop                                              ; $4ed5: $00
    ld   b, b                                        ; $4ed6: $40
    nop                                              ; $4ed7: $00
    ld   b, b                                        ; $4ed8: $40
    nop                                              ; $4ed9: $00
    nop                                              ; $4eda: $00
    nop                                              ; $4edb: $00
    nop                                              ; $4edc: $00
    nop                                              ; $4edd: $00
    nop                                              ; $4ede: $00
    nop                                              ; $4edf: $00
    nop                                              ; $4ee0: $00
    nop                                              ; $4ee1: $00
    inc  a                                           ; $4ee2: $3c
    nop                                              ; $4ee3: $00
    inc  h                                           ; $4ee4: $24
    rra                                              ; $4ee5: $1f
    rrca                                             ; $4ee6: $0f
    rra                                              ; $4ee7: $1f
    inc  d                                           ; $4ee8: $14
    rrca                                             ; $4ee9: $0f
    dec  c                                           ; $4eea: $0d
    ld   b, $0d                                      ; $4eeb: $06 $0d
    ld   [bc], a                                     ; $4eed: $02
    rlca                                             ; $4eee: $07
    ld   [bc], a                                     ; $4eef: $02
    add  b                                           ; $4ef0: $80
    ld   h, b                                        ; $4ef1: $60
    jr   nz, jr_0ab_4f54                             ; $4ef2: $20 $60

    or   b                                           ; $4ef4: $b0
    ld   h, b                                        ; $4ef5: $60
    ld   hl, sp-$10                                  ; $4ef6: $f8 $f0
    ld   hl, sp-$10                                  ; $4ef8: $f8 $f0
    or   b                                           ; $4efa: $b0
    ld   a, b                                        ; $4efb: $78
    ld   d, h                                        ; $4efc: $54
    jr   c, jr_0ab_4f2b                              ; $4efd: $38 $2c

    jr   jr_0ab_4f20                                 ; $4eff: $18 $1f

    ccf                                              ; $4f01: $3f
    ccf                                              ; $4f02: $3f
    ccf                                              ; $4f03: $3f
    ccf                                              ; $4f04: $3f
    inc  bc                                          ; $4f05: $03
    inc  bc                                          ; $4f06: $03
    rlca                                             ; $4f07: $07
    ld   b, $0f                                      ; $4f08: $06 $0f
    ld   e, $3e                                      ; $4f0a: $1e $3e
    ld   e, $3c                                      ; $4f0c: $1e $3c
    ld   [$fe10], sp                                 ; $4f0e: $08 $10 $fe
    rst  $38                                         ; $4f11: $ff
    cp   $ff                                         ; $4f12: $fe $ff
    cp   $60                                         ; $4f14: $fe $60
    db   $e4                                         ; $4f16: $e4
    ld   h, d                                        ; $4f17: $62
    ldh  [c], a                                      ; $4f18: $e2
    ld   h, a                                        ; $4f19: $67
    or   $7f                                         ; $4f1a: $f6 $7f
    ld   a, a                                        ; $4f1c: $7f
    ld   a, [hl]                                     ; $4f1d: $7e
    ld   a, $00                                      ; $4f1e: $3e $00

    jr_0ab_4f20:
    ld   a, $7f                                      ; $4f20: $3e $7f
    ld   l, a                                        ; $4f22: $6f
    halt                                             ; $4f23: $76
    ld   a, [hl]                                     ; $4f24: $7e
    ld   h, [hl]                                     ; $4f25: $66
    ld   l, [hl]                                     ; $4f26: $6e
    ld   a, [hl]                                     ; $4f27: $7e
    ld   l, l                                        ; $4f28: $6d
    rst  $38                                         ; $4f29: $ff
    db   $d3                                         ; $4f2a: $d3

    jr_0ab_4f2b:
    rst  $28                                         ; $4f2b: $ef
    db   $e3                                         ; $4f2c: $e3
    ld   b, a                                        ; $4f2d: $47
    ld   b, c                                        ; $4f2e: $41
    ld   [bc], a                                     ; $4f2f: $02
    ldh  a, [$f8]                                    ; $4f30: $f0 $f8
    ld   hl, sp-$10                                  ; $4f32: $f8 $f0
    ldh  [$f0], a                                    ; $4f34: $e0 $f0
    ldh  [$e8], a                                    ; $4f36: $e0 $e8
    ld   hl, sp-$14                                  ; $4f38: $f8 $ec
    ld   hl, sp-$04                                  ; $4f3a: $f8 $fc
    inc  a                                           ; $4f3c: $3c
    ld   hl, sp+$28                                  ; $4f3d: $f8 $28
    db   $10                                         ; $4f3f: $10
    ld   [hl], b                                     ; $4f40: $70
    ld   h, b                                        ; $4f41: $60
    ld   [hl], b                                     ; $4f42: $70
    ld   h, b                                        ; $4f43: $60
    ld   [hl], b                                     ; $4f44: $70
    ld   h, b                                        ; $4f45: $60
    ld   [hl], b                                     ; $4f46: $70
    ld   h, c                                        ; $4f47: $61
    ld   a, e                                        ; $4f48: $7b
    ld   [hl], a                                     ; $4f49: $77
    ld   a, a                                        ; $4f4a: $7f
    ld   a, a                                        ; $4f4b: $7f
    ld   e, h                                        ; $4f4c: $5c
    ld   a, $00                                      ; $4f4d: $3e $00
    nop                                              ; $4f4f: $00
    ld   b, c                                        ; $4f50: $41
    ld   bc, $6061                                   ; $4f51: $01 $61 $60

    jr_0ab_4f54:
    ld   h, b                                        ; $4f54: $60
    ldh  [$e1], a                                    ; $4f55: $e0 $e1
    pop  bc                                          ; $4f57: $c1
    add  e                                           ; $4f58: $83
    pop  bc                                          ; $4f59: $c1
    add  e                                           ; $4f5a: $83
    ld   bc, $0100                                   ; $4f5b: $01 $00 $01
    nop                                              ; $4f5e: $00
    nop                                              ; $4f5f: $00
    rst  $38                                         ; $4f60: $ff
    rst  $38                                         ; $4f61: $ff
    dec  e                                           ; $4f62: $1d
    cp   $1a                                         ; $4f63: $fe $1a
    db   $fc                                         ; $4f65: $fc
    rst  $38                                         ; $4f66: $ff
    rst  $38                                         ; $4f67: $ff
    rst  $18                                         ; $4f68: $df
    sbc  a                                           ; $4f69: $9f
    ld   hl, sp-$03                                  ; $4f6a: $f8 $fd
    ldh  a, [$f8]                                    ; $4f6c: $f0 $f8
    nop                                              ; $4f6e: $00
    nop                                              ; $4f6f: $00
    add  e                                           ; $4f70: $83
    add  e                                           ; $4f71: $83
    add  e                                           ; $4f72: $83
    inc  bc                                          ; $4f73: $03
    inc  bc                                          ; $4f74: $03
    inc  bc                                          ; $4f75: $03
    inc  bc                                          ; $4f76: $03
    add  e                                           ; $4f77: $83
    add  e                                           ; $4f78: $83
    jp   $83c3                                       ; $4f79: $c3 $c3 $83


    ld   [bc], a                                     ; $4f7c: $02
    ld   bc, $0000                                   ; $4f7d: $01 $00 $00
    add  d                                           ; $4f80: $82
    nop                                              ; $4f81: $00
    add  e                                           ; $4f82: $83
    inc  bc                                          ; $4f83: $03
    add  e                                           ; $4f84: $83
    rlca                                             ; $4f85: $07
    add  a                                           ; $4f86: $87
    ld   c, $dc                                      ; $4f87: $0e $dc
    cp   [hl]                                        ; $4f89: $be
    db   $fc                                         ; $4f8a: $fc
    ld   hl, sp-$20                                  ; $4f8b: $f8 $e0
    ldh  a, [rP1]                                    ; $4f8d: $f0 $00
    nop                                              ; $4f8f: $00
    inc  bc                                          ; $4f90: $03
    rlca                                             ; $4f91: $07
    ld   b, $07                                      ; $4f92: $06 $07
    rrca                                             ; $4f94: $0f
    ld   b, $0e                                      ; $4f95: $06 $0e
    ld   c, $1e                                      ; $4f97: $0e $1e
    inc  c                                           ; $4f99: $0c
    inc  e                                           ; $4f9a: $1c
    inc  e                                           ; $4f9b: $1c
    inc  e                                           ; $4f9c: $1c
    ld   [$0000], sp                                 ; $4f9d: $08 $00 $00
    ld   a, $3e                                      ; $4fa0: $3e $3e
    ld   a, $00                                      ; $4fa2: $3e $00
    ret  nz                                          ; $4fa4: $c0

    nop                                              ; $4fa5: $00
    ldh  [$c0], a                                    ; $4fa6: $e0 $c0
    db   $e3                                         ; $4fa8: $e3
    cp   $7f                                         ; $4fa9: $fe $7f
    cp   $42                                         ; $4fab: $fe $42
    inc  a                                           ; $4fad: $3c
    nop                                              ; $4fae: $00
    nop                                              ; $4faf: $00
    inc  bc                                          ; $4fb0: $03
    ld   bc, $0101                                   ; $4fb1: $01 $01 $01
    ld   bc, $0001                                   ; $4fb4: $01 $01 $00
    ld   bc, $0102                                   ; $4fb7: $01 $02 $01
    ld   bc, $0303                                   ; $4fba: $01 $03 $03
    ld   bc, $0000                                   ; $4fbd: $01 $00 $00
    add  b                                           ; $4fc0: $80
    add  b                                           ; $4fc1: $80
    add  b                                           ; $4fc2: $80
    add  b                                           ; $4fc3: $80
    add  b                                           ; $4fc4: $80
    add  b                                           ; $4fc5: $80
    nop                                              ; $4fc6: $00
    add  b                                           ; $4fc7: $80
    nop                                              ; $4fc8: $00
    add  b                                           ; $4fc9: $80
    ret  nz                                          ; $4fca: $c0

    add  b                                           ; $4fcb: $80
    add  b                                           ; $4fcc: $80
    add  b                                           ; $4fcd: $80
    nop                                              ; $4fce: $00
    nop                                              ; $4fcf: $00
    nop                                              ; $4fd0: $00
    nop                                              ; $4fd1: $00
    nop                                              ; $4fd2: $00
    nop                                              ; $4fd3: $00
    nop                                              ; $4fd4: $00
    nop                                              ; $4fd5: $00
    nop                                              ; $4fd6: $00
    nop                                              ; $4fd7: $00
    nop                                              ; $4fd8: $00
    nop                                              ; $4fd9: $00
    nop                                              ; $4fda: $00
    nop                                              ; $4fdb: $00
    nop                                              ; $4fdc: $00
    nop                                              ; $4fdd: $00
    nop                                              ; $4fde: $00
    nop                                              ; $4fdf: $00
    rlca                                             ; $4fe0: $07
    ld   [bc], a                                     ; $4fe1: $02
    dec  b                                           ; $4fe2: $05
    ld   [bc], a                                     ; $4fe3: $02
    inc  bc                                          ; $4fe4: $03
    nop                                              ; $4fe5: $00
    ld   bc, $0300                                   ; $4fe6: $01 $00 $03
    nop                                              ; $4fe9: $00
    ld   bc, $0300                                   ; $4fea: $01 $00 $03
    nop                                              ; $4fed: $00
    ld   bc, $0402                                   ; $4fee: $01 $02 $04
    jr   jr_0ab_5007                                 ; $4ff1: $18 $14

    ld   [$009c], sp                                 ; $4ff3: $08 $9c $00
    adc  h                                           ; $4ff6: $8c
    nop                                              ; $4ff7: $00
    sbc  h                                           ; $4ff8: $9c
    nop                                              ; $4ff9: $00
    adc  h                                           ; $4ffa: $8c
    nop                                              ; $4ffb: $00
    sbc  h                                           ; $4ffc: $9c
    nop                                              ; $4ffd: $00
    inc  d                                           ; $4ffe: $14
    ld   [$0000], sp                                 ; $4fff: $08 $00 $00
    nop                                              ; $5002: $00
    nop                                              ; $5003: $00
    nop                                              ; $5004: $00
    nop                                              ; $5005: $00
    nop                                              ; $5006: $00

    jr_0ab_5007:
    nop                                              ; $5007: $00
    nop                                              ; $5008: $00
    nop                                              ; $5009: $00
    nop                                              ; $500a: $00
    nop                                              ; $500b: $00
    nop                                              ; $500c: $00
    nop                                              ; $500d: $00
    nop                                              ; $500e: $00
    nop                                              ; $500f: $00
    nop                                              ; $5010: $00
    nop                                              ; $5011: $00
    nop                                              ; $5012: $00
    nop                                              ; $5013: $00
    nop                                              ; $5014: $00
    nop                                              ; $5015: $00
    nop                                              ; $5016: $00
    nop                                              ; $5017: $00
    nop                                              ; $5018: $00
    nop                                              ; $5019: $00
    nop                                              ; $501a: $00
    nop                                              ; $501b: $00
    nop                                              ; $501c: $00
    nop                                              ; $501d: $00
    nop                                              ; $501e: $00
    nop                                              ; $501f: $00
    nop                                              ; $5020: $00
    nop                                              ; $5021: $00
    nop                                              ; $5022: $00
    nop                                              ; $5023: $00
    nop                                              ; $5024: $00
    nop                                              ; $5025: $00
    nop                                              ; $5026: $00
    nop                                              ; $5027: $00
    nop                                              ; $5028: $00
    nop                                              ; $5029: $00
    nop                                              ; $502a: $00
    nop                                              ; $502b: $00
    nop                                              ; $502c: $00
    nop                                              ; $502d: $00
    nop                                              ; $502e: $00
    nop                                              ; $502f: $00
    nop                                              ; $5030: $00
    nop                                              ; $5031: $00
    nop                                              ; $5032: $00
    nop                                              ; $5033: $00
    nop                                              ; $5034: $00
    nop                                              ; $5035: $00
    nop                                              ; $5036: $00
    nop                                              ; $5037: $00
    nop                                              ; $5038: $00
    nop                                              ; $5039: $00
    nop                                              ; $503a: $00
    nop                                              ; $503b: $00
    nop                                              ; $503c: $00
    nop                                              ; $503d: $00
    nop                                              ; $503e: $00
    nop                                              ; $503f: $00
    nop                                              ; $5040: $00
    nop                                              ; $5041: $00
    nop                                              ; $5042: $00
    nop                                              ; $5043: $00
    nop                                              ; $5044: $00
    nop                                              ; $5045: $00
    nop                                              ; $5046: $00
    nop                                              ; $5047: $00
    nop                                              ; $5048: $00
    nop                                              ; $5049: $00
    nop                                              ; $504a: $00
    nop                                              ; $504b: $00
    nop                                              ; $504c: $00
    nop                                              ; $504d: $00
    nop                                              ; $504e: $00
    nop                                              ; $504f: $00
    nop                                              ; $5050: $00
    nop                                              ; $5051: $00
    nop                                              ; $5052: $00
    nop                                              ; $5053: $00
    nop                                              ; $5054: $00
    nop                                              ; $5055: $00
    nop                                              ; $5056: $00
    nop                                              ; $5057: $00
    nop                                              ; $5058: $00
    nop                                              ; $5059: $00
    nop                                              ; $505a: $00
    nop                                              ; $505b: $00
    nop                                              ; $505c: $00
    nop                                              ; $505d: $00
    nop                                              ; $505e: $00
    nop                                              ; $505f: $00
    nop                                              ; $5060: $00
    nop                                              ; $5061: $00
    nop                                              ; $5062: $00
    nop                                              ; $5063: $00
    nop                                              ; $5064: $00
    nop                                              ; $5065: $00
    nop                                              ; $5066: $00
    nop                                              ; $5067: $00
    nop                                              ; $5068: $00
    nop                                              ; $5069: $00
    nop                                              ; $506a: $00
    nop                                              ; $506b: $00
    nop                                              ; $506c: $00
    nop                                              ; $506d: $00
    nop                                              ; $506e: $00
    nop                                              ; $506f: $00
    nop                                              ; $5070: $00
    nop                                              ; $5071: $00
    nop                                              ; $5072: $00
    nop                                              ; $5073: $00
    nop                                              ; $5074: $00
    nop                                              ; $5075: $00
    nop                                              ; $5076: $00
    nop                                              ; $5077: $00
    nop                                              ; $5078: $00
    nop                                              ; $5079: $00
    nop                                              ; $507a: $00
    nop                                              ; $507b: $00
    nop                                              ; $507c: $00
    nop                                              ; $507d: $00
    nop                                              ; $507e: $00
    nop                                              ; $507f: $00
    nop                                              ; $5080: $00
    nop                                              ; $5081: $00
    nop                                              ; $5082: $00
    nop                                              ; $5083: $00
    nop                                              ; $5084: $00
    nop                                              ; $5085: $00
    nop                                              ; $5086: $00
    nop                                              ; $5087: $00
    nop                                              ; $5088: $00
    nop                                              ; $5089: $00
    nop                                              ; $508a: $00
    nop                                              ; $508b: $00
    nop                                              ; $508c: $00
    nop                                              ; $508d: $00
    nop                                              ; $508e: $00
    nop                                              ; $508f: $00
    nop                                              ; $5090: $00
    nop                                              ; $5091: $00
    nop                                              ; $5092: $00
    nop                                              ; $5093: $00
    nop                                              ; $5094: $00
    nop                                              ; $5095: $00
    nop                                              ; $5096: $00
    nop                                              ; $5097: $00
    nop                                              ; $5098: $00
    nop                                              ; $5099: $00
    nop                                              ; $509a: $00
    nop                                              ; $509b: $00
    nop                                              ; $509c: $00
    nop                                              ; $509d: $00
    nop                                              ; $509e: $00
    nop                                              ; $509f: $00
    nop                                              ; $50a0: $00
    nop                                              ; $50a1: $00
    nop                                              ; $50a2: $00
    nop                                              ; $50a3: $00
    nop                                              ; $50a4: $00
    nop                                              ; $50a5: $00
    nop                                              ; $50a6: $00
    nop                                              ; $50a7: $00
    nop                                              ; $50a8: $00
    nop                                              ; $50a9: $00
    nop                                              ; $50aa: $00

    jr_0ab_50ab:
    nop                                              ; $50ab: $00
    nop                                              ; $50ac: $00
    nop                                              ; $50ad: $00
    nop                                              ; $50ae: $00
    nop                                              ; $50af: $00
    nop                                              ; $50b0: $00
    nop                                              ; $50b1: $00
    nop                                              ; $50b2: $00
    nop                                              ; $50b3: $00
    nop                                              ; $50b4: $00
    nop                                              ; $50b5: $00
    nop                                              ; $50b6: $00
    nop                                              ; $50b7: $00
    nop                                              ; $50b8: $00
    nop                                              ; $50b9: $00
    nop                                              ; $50ba: $00
    nop                                              ; $50bb: $00
    nop                                              ; $50bc: $00
    nop                                              ; $50bd: $00
    nop                                              ; $50be: $00
    nop                                              ; $50bf: $00
    nop                                              ; $50c0: $00
    nop                                              ; $50c1: $00
    nop                                              ; $50c2: $00
    nop                                              ; $50c3: $00
    nop                                              ; $50c4: $00
    nop                                              ; $50c5: $00
    nop                                              ; $50c6: $00
    nop                                              ; $50c7: $00
    nop                                              ; $50c8: $00
    nop                                              ; $50c9: $00
    nop                                              ; $50ca: $00
    nop                                              ; $50cb: $00
    nop                                              ; $50cc: $00
    nop                                              ; $50cd: $00
    nop                                              ; $50ce: $00
    nop                                              ; $50cf: $00
    nop                                              ; $50d0: $00
    nop                                              ; $50d1: $00
    nop                                              ; $50d2: $00
    nop                                              ; $50d3: $00
    nop                                              ; $50d4: $00
    nop                                              ; $50d5: $00
    nop                                              ; $50d6: $00
    nop                                              ; $50d7: $00
    nop                                              ; $50d8: $00
    nop                                              ; $50d9: $00
    nop                                              ; $50da: $00
    nop                                              ; $50db: $00
    nop                                              ; $50dc: $00
    nop                                              ; $50dd: $00
    nop                                              ; $50de: $00
    nop                                              ; $50df: $00
    rlca                                             ; $50e0: $07
    ld   [bc], a                                     ; $50e1: $02
    rlca                                             ; $50e2: $07
    ld   [bc], a                                     ; $50e3: $02
    rlca                                             ; $50e4: $07
    ld   [bc], a                                     ; $50e5: $02
    dec  c                                           ; $50e6: $0d
    ld   b, $04                                      ; $50e7: $06 $04
    rrca                                             ; $50e9: $0f
    rlca                                             ; $50ea: $07
    rra                                              ; $50eb: $1f
    inc  l                                           ; $50ec: $2c
    rra                                              ; $50ed: $1f
    dec  h                                           ; $50ee: $25
    jr   jr_0ab_50f1                                 ; $50ef: $18 $00

    jr_0ab_50f1:
    inc  e                                           ; $50f1: $1c
    inc  l                                           ; $50f2: $2c
    jr   jr_0ab_5149                                 ; $50f3: $18 $54

    jr   c, jr_0ab_50ab                              ; $50f5: $38 $b4

    ld   a, b                                        ; $50f7: $78
    ld   hl, sp-$10                                  ; $50f8: $f8 $f0
    cp   b                                           ; $50fa: $b8
    ldh  a, [$30]                                    ; $50fb: $f0 $30
    ldh  [$60], a                                    ; $50fd: $e0 $60
    jr   nz, jr_0ab_5101                             ; $50ff: $20 $00

    jr_0ab_5101:
    nop                                              ; $5101: $00
    nop                                              ; $5102: $00
    nop                                              ; $5103: $00
    nop                                              ; $5104: $00
    nop                                              ; $5105: $00
    nop                                              ; $5106: $00
    nop                                              ; $5107: $00
    nop                                              ; $5108: $00
    nop                                              ; $5109: $00
    nop                                              ; $510a: $00
    nop                                              ; $510b: $00
    nop                                              ; $510c: $00
    nop                                              ; $510d: $00
    nop                                              ; $510e: $00
    nop                                              ; $510f: $00
    nop                                              ; $5110: $00
    nop                                              ; $5111: $00
    nop                                              ; $5112: $00
    nop                                              ; $5113: $00
    nop                                              ; $5114: $00
    nop                                              ; $5115: $00
    nop                                              ; $5116: $00
    nop                                              ; $5117: $00
    rlca                                             ; $5118: $07
    nop                                              ; $5119: $00
    rlca                                             ; $511a: $07
    rrca                                             ; $511b: $0f
    nop                                              ; $511c: $00
    rrca                                             ; $511d: $0f
    rrca                                             ; $511e: $0f
    rrca                                             ; $511f: $0f
    nop                                              ; $5120: $00
    nop                                              ; $5121: $00
    nop                                              ; $5122: $00
    nop                                              ; $5123: $00
    nop                                              ; $5124: $00
    nop                                              ; $5125: $00
    nop                                              ; $5126: $00
    nop                                              ; $5127: $00
    inc  d                                           ; $5128: $14
    ld   [$980c], sp                                 ; $5129: $08 $0c $98
    inc  c                                           ; $512c: $0c
    sbc  b                                           ; $512d: $98
    adc  h                                           ; $512e: $8c
    sbc  b                                           ; $512f: $98
    nop                                              ; $5130: $00
    nop                                              ; $5131: $00
    nop                                              ; $5132: $00
    nop                                              ; $5133: $00
    nop                                              ; $5134: $00
    nop                                              ; $5135: $00
    nop                                              ; $5136: $00
    nop                                              ; $5137: $00
    nop                                              ; $5138: $00
    nop                                              ; $5139: $00
    ld   b, $03                                      ; $513a: $06 $03
    ld   d, $0f                                      ; $513c: $16 $0f
    ld   e, $1f                                      ; $513e: $1e $1f
    nop                                              ; $5140: $00
    nop                                              ; $5141: $00
    nop                                              ; $5142: $00
    nop                                              ; $5143: $00
    nop                                              ; $5144: $00
    nop                                              ; $5145: $00
    nop                                              ; $5146: $00
    nop                                              ; $5147: $00
    nop                                              ; $5148: $00

    jr_0ab_5149:
    nop                                              ; $5149: $00
    nop                                              ; $514a: $00
    nop                                              ; $514b: $00
    ld   bc, $0100                                   ; $514c: $01 $00 $01
    ld   bc, $0000                                   ; $514f: $01 $00 $00
    nop                                              ; $5152: $00
    nop                                              ; $5153: $00
    nop                                              ; $5154: $00
    nop                                              ; $5155: $00
    nop                                              ; $5156: $00
    nop                                              ; $5157: $00
    nop                                              ; $5158: $00
    nop                                              ; $5159: $00
    db   $fc                                         ; $515a: $fc
    ld   a, b                                        ; $515b: $78
    call z, $cefc                                    ; $515c: $cc $fc $ce
    adc  h                                           ; $515f: $8c
    nop                                              ; $5160: $00
    nop                                              ; $5161: $00
    nop                                              ; $5162: $00
    nop                                              ; $5163: $00
    nop                                              ; $5164: $00
    nop                                              ; $5165: $00
    nop                                              ; $5166: $00
    nop                                              ; $5167: $00
    ld   bc, $0300                                   ; $5168: $01 $00 $03
    rlca                                             ; $516b: $07
    ld   c, $0f                                      ; $516c: $0e $0f
    inc  e                                           ; $516e: $1c
    inc  c                                           ; $516f: $0c
    nop                                              ; $5170: $00
    nop                                              ; $5171: $00
    nop                                              ; $5172: $00
    nop                                              ; $5173: $00
    nop                                              ; $5174: $00
    nop                                              ; $5175: $00
    nop                                              ; $5176: $00
    nop                                              ; $5177: $00
    ld   bc, $8000                                   ; $5178: $01 $00 $80
    pop  bc                                          ; $517b: $c1
    ldh  [c], a                                      ; $517c: $e2
    pop  bc                                          ; $517d: $c1
    rst  $20                                         ; $517e: $e7
    ld   h, e                                        ; $517f: $63
    nop                                              ; $5180: $00
    nop                                              ; $5181: $00
    nop                                              ; $5182: $00
    nop                                              ; $5183: $00
    nop                                              ; $5184: $00
    nop                                              ; $5185: $00
    nop                                              ; $5186: $00
    nop                                              ; $5187: $00
    nop                                              ; $5188: $00
    adc  h                                           ; $5189: $8c
    call z, $bf8c                                    ; $518a: $cc $8c $bf
    call z, $ffcf                                    ; $518d: $cc $cf $ff
    nop                                              ; $5190: $00
    nop                                              ; $5191: $00
    nop                                              ; $5192: $00
    nop                                              ; $5193: $00
    nop                                              ; $5194: $00
    nop                                              ; $5195: $00
    nop                                              ; $5196: $00
    nop                                              ; $5197: $00
    nop                                              ; $5198: $00
    nop                                              ; $5199: $00
    nop                                              ; $519a: $00
    nop                                              ; $519b: $00
    add  b                                           ; $519c: $80
    nop                                              ; $519d: $00
    ret  nz                                          ; $519e: $c0

    add  b                                           ; $519f: $80
    nop                                              ; $51a0: $00
    nop                                              ; $51a1: $00
    nop                                              ; $51a2: $00
    nop                                              ; $51a3: $00
    nop                                              ; $51a4: $00
    nop                                              ; $51a5: $00
    nop                                              ; $51a6: $00
    nop                                              ; $51a7: $00
    nop                                              ; $51a8: $00
    nop                                              ; $51a9: $00
    nop                                              ; $51aa: $00
    nop                                              ; $51ab: $00
    nop                                              ; $51ac: $00
    nop                                              ; $51ad: $00
    nop                                              ; $51ae: $00
    nop                                              ; $51af: $00
    nop                                              ; $51b0: $00
    nop                                              ; $51b1: $00
    nop                                              ; $51b2: $00
    nop                                              ; $51b3: $00

    jr_0ab_51b4:
    nop                                              ; $51b4: $00

    jr_0ab_51b5:
    nop                                              ; $51b5: $00
    nop                                              ; $51b6: $00
    nop                                              ; $51b7: $00
    nop                                              ; $51b8: $00
    nop                                              ; $51b9: $00
    nop                                              ; $51ba: $00
    nop                                              ; $51bb: $00
    nop                                              ; $51bc: $00
    nop                                              ; $51bd: $00
    nop                                              ; $51be: $00
    nop                                              ; $51bf: $00
    nop                                              ; $51c0: $00
    nop                                              ; $51c1: $00
    nop                                              ; $51c2: $00
    nop                                              ; $51c3: $00
    nop                                              ; $51c4: $00
    nop                                              ; $51c5: $00
    nop                                              ; $51c6: $00
    nop                                              ; $51c7: $00
    nop                                              ; $51c8: $00
    nop                                              ; $51c9: $00
    nop                                              ; $51ca: $00
    nop                                              ; $51cb: $00
    nop                                              ; $51cc: $00
    nop                                              ; $51cd: $00
    nop                                              ; $51ce: $00
    nop                                              ; $51cf: $00
    nop                                              ; $51d0: $00
    nop                                              ; $51d1: $00
    nop                                              ; $51d2: $00
    nop                                              ; $51d3: $00
    nop                                              ; $51d4: $00
    nop                                              ; $51d5: $00
    nop                                              ; $51d6: $00
    nop                                              ; $51d7: $00
    nop                                              ; $51d8: $00
    nop                                              ; $51d9: $00
    nop                                              ; $51da: $00
    nop                                              ; $51db: $00
    nop                                              ; $51dc: $00
    nop                                              ; $51dd: $00
    nop                                              ; $51de: $00
    nop                                              ; $51df: $00
    nop                                              ; $51e0: $00
    nop                                              ; $51e1: $00
    nop                                              ; $51e2: $00
    nop                                              ; $51e3: $00
    ld   bc, $0300                                   ; $51e4: $01 $00 $03
    ld   bc, $0306                                   ; $51e7: $01 $06 $03
    ld   bc, $1e0e                                   ; $51ea: $01 $0e $1e
    rrca                                             ; $51ed: $0f
    jr   nz, jr_0ab_520f                             ; $51ee: $20 $1f

    add  b                                           ; $51f0: $80
    ld   h, b                                        ; $51f1: $60
    jr   nz, jr_0ab_51b4                             ; $51f2: $20 $c0

    ld   b, b                                        ; $51f4: $40
    add  b                                           ; $51f5: $80
    add  b                                           ; $51f6: $80
    nop                                              ; $51f7: $00
    add  b                                           ; $51f8: $80
    nop                                              ; $51f9: $00
    jr   jr_0ab_51fc                                 ; $51fa: $18 $00

    jr_0ab_51fc:
    nop                                              ; $51fc: $00
    ld   hl, sp+$68                                  ; $51fd: $f8 $68
    ldh  a, [rP1]                                    ; $51ff: $f0 $00
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
    nop                                              ; $520c: $00
    nop                                              ; $520d: $00
    nop                                              ; $520e: $00

    jr_0ab_520f:
    nop                                              ; $520f: $00
    ld   [$0707], sp                                 ; $5210: $08 $07 $07
    rrca                                             ; $5213: $0f
    ld   [$0807], sp                                 ; $5214: $08 $07 $08
    rlca                                             ; $5217: $07
    rlca                                             ; $5218: $07
    rrca                                             ; $5219: $0f
    dec  b                                           ; $521a: $05
    rrca                                             ; $521b: $0f
    rlca                                             ; $521c: $07
    rrca                                             ; $521d: $0f
    dec  b                                           ; $521e: $05
    ld   c, $3e                                      ; $521f: $0e $3e
    rst  $38                                         ; $5221: $ff
    inc  e                                           ; $5222: $1c
    rst  $38                                         ; $5223: $ff
    inc  c                                           ; $5224: $0c
    sbc  b                                           ; $5225: $98
    adc  h                                           ; $5226: $8c
    jr   jr_0ab_51b5                                 ; $5227: $18 $8c

    sbc  b                                           ; $5229: $98
    adc  h                                           ; $522a: $8c
    sbc  b                                           ; $522b: $98
    adc  h                                           ; $522c: $8c
    sbc  b                                           ; $522d: $98
    adc  h                                           ; $522e: $8c
    jr   @+$08                                       ; $522f: $18 $06

    inc  bc                                          ; $5231: $03
    ld   b, $03                                      ; $5232: $06 $03
    ld   b, $03                                      ; $5234: $06 $03
    ld   b, $03                                      ; $5236: $06 $03
    ld   b, $03                                      ; $5238: $06 $03
    ld   b, $03                                      ; $523a: $06 $03
    ld   b, $03                                      ; $523c: $06 $03
    dec  b                                           ; $523e: $05
    ld   [bc], a                                     ; $523f: $02
    nop                                              ; $5240: $00
    ld   bc, $0000                                   ; $5241: $01 $00 $00
    nop                                              ; $5244: $00
    nop                                              ; $5245: $00
    nop                                              ; $5246: $00
    nop                                              ; $5247: $00
    nop                                              ; $5248: $00
    nop                                              ; $5249: $00
    nop                                              ; $524a: $00
    ld   bc, $0101                                   ; $524b: $01 $01 $01
    nop                                              ; $524e: $00
    ld   bc, $8e04                                   ; $524f: $01 $04 $8e
    ld   e, $0c                                      ; $5252: $1e $0c
    jr   c, jr_0ab_5272                              ; $5254: $38 $1c

    jr   nc, jr_0ab_52d0                             ; $5256: $30 $78

    ldh  a, [$e0]                                    ; $5258: $f0 $e0
    cp   $c0                                         ; $525a: $fe $c0
    db   $fc                                         ; $525c: $fc
    cp   $02                                         ; $525d: $fe $02
    db   $fc                                         ; $525f: $fc
    inc  d                                           ; $5260: $14
    ld   [$0000], sp                                 ; $5261: $08 $00 $00
    nop                                              ; $5264: $00
    ld   bc, $0307                                   ; $5265: $01 $07 $03
    ld   c, $07                                      ; $5268: $0e $07
    dec  c                                           ; $526a: $0d
    ld   c, $1f                                      ; $526b: $0e $1f
    rrca                                             ; $526d: $0f
    db   $10                                         ; $526e: $10
    rrca                                             ; $526f: $0f
    db   $e3                                         ; $5270: $e3
    ld   h, c                                        ; $5271: $61

    jr_0ab_5272:
    ld   b, e                                        ; $5272: $43
    pop  hl                                          ; $5273: $e1
    pop  hl                                          ; $5274: $e1
    jp   $83c7                                       ; $5275: $c3 $c7 $83


    rlca                                             ; $5278: $07
    inc  bc                                          ; $5279: $03
    ldh  [$03], a                                    ; $527a: $e0 $03
    ldh  a, [$e1]                                    ; $527c: $f0 $e1
    nop                                              ; $527e: $00
    pop  hl                                          ; $527f: $e1
    cp   l                                           ; $5280: $bd
    db   $db                                         ; $5281: $db
    reti                                             ; $5282: $d9


    ei                                               ; $5283: $fb
    db   $ed                                         ; $5284: $ed
    ei                                               ; $5285: $fb
    rst  $08                                         ; $5286: $cf
    rst  $28                                         ; $5287: $ef
    rst  $20                                         ; $5288: $e7
    adc  [hl]                                        ; $5289: $8e
    adc  $8f                                         ; $528a: $ce $8f
    rst  $18                                         ; $528c: $df
    cp   a                                           ; $528d: $bf
    ret  nc                                          ; $528e: $d0

    cp   c                                           ; $528f: $b9
    nop                                              ; $5290: $00
    add  b                                           ; $5291: $80
    add  b                                           ; $5292: $80
    nop                                              ; $5293: $00
    nop                                              ; $5294: $00
    nop                                              ; $5295: $00
    nop                                              ; $5296: $00
    nop                                              ; $5297: $00
    nop                                              ; $5298: $00
    nop                                              ; $5299: $00
    nop                                              ; $529a: $00
    nop                                              ; $529b: $00
    ret  nz                                          ; $529c: $c0

    add  b                                           ; $529d: $80
    add  b                                           ; $529e: $80
    add  b                                           ; $529f: $80
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

    jr_0ab_52d0:
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
    rlca                                             ; $52e0: $07
    nop                                              ; $52e1: $00
    nop                                              ; $52e2: $00
    nop                                              ; $52e3: $00
    ld   bc, $0100                                   ; $52e4: $01 $00 $01
    inc  bc                                          ; $52e7: $03
    ld   bc, $1406                                   ; $52e8: $01 $06 $14
    rrca                                             ; $52eb: $0f
    rla                                              ; $52ec: $17
    rrca                                             ; $52ed: $0f
    ld   [$f007], sp                                 ; $52ee: $08 $07 $f0
    ld   h, b                                        ; $52f1: $60
    and  b                                           ; $52f2: $a0
    ld   b, b                                        ; $52f3: $40
    add  b                                           ; $52f4: $80
    ret  nz                                          ; $52f5: $c0

    nop                                              ; $52f6: $00
    add  b                                           ; $52f7: $80
    nop                                              ; $52f8: $00
    nop                                              ; $52f9: $00
    add  b                                           ; $52fa: $80
    nop                                              ; $52fb: $00
    ld   [$60f0], sp                                 ; $52fc: $08 $f0 $60
    ldh  a, [rP1]                                    ; $52ff: $f0 $00
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
    ld   [$0000], sp                                 ; $5320: $08 $00 $00
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
    add  b                                           ; $5380: $80
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
    ld   bc, $0100                                   ; $53e0: $01 $00 $01
    nop                                              ; $53e3: $00
    inc  b                                           ; $53e4: $04
    inc  bc                                          ; $53e5: $03
    ld   a, [bc]                                     ; $53e6: $0a
    rlca                                             ; $53e7: $07
    ld   d, $0f                                      ; $53e8: $16 $0f
    ld   de, $030f                                   ; $53ea: $11 $0f $03
    nop                                              ; $53ed: $00
    nop                                              ; $53ee: $00
    ld   bc, $e040                                   ; $53ef: $01 $40 $e0
    ld   b, b                                        ; $53f2: $40
    add  b                                           ; $53f3: $80
    add  b                                           ; $53f4: $80
    nop                                              ; $53f5: $00
    nop                                              ; $53f6: $00
    nop                                              ; $53f7: $00
    ldh  [rP1], a                                    ; $53f8: $e0 $00
    ret  nc                                          ; $53fa: $d0

    ldh  [$c0], a                                    ; $53fb: $e0 $c0
    ldh  [$c0], a                                    ; $53fd: $e0 $c0
    add  b                                           ; $53ff: $80
    nop                                              ; $5400: $00
    nop                                              ; $5401: $00
    nop                                              ; $5402: $00
    nop                                              ; $5403: $00
    nop                                              ; $5404: $00
    nop                                              ; $5405: $00
    nop                                              ; $5406: $00
    nop                                              ; $5407: $00
    ld   bc, $0100                                   ; $5408: $01 $00 $01
    nop                                              ; $540b: $00
    nop                                              ; $540c: $00
    ld   bc, $0100                                   ; $540d: $01 $00 $01
    nop                                              ; $5410: $00
    nop                                              ; $5411: $00
    nop                                              ; $5412: $00
    nop                                              ; $5413: $00
    nop                                              ; $5414: $00
    nop                                              ; $5415: $00
    nop                                              ; $5416: $00
    nop                                              ; $5417: $00
    nop                                              ; $5418: $00
    ldh  [$c0], a                                    ; $5419: $e0 $c0
    ldh  [$c0], a                                    ; $541b: $e0 $c0
    ldh  [$c0], a                                    ; $541d: $e0 $c0
    ldh  [rP1], a                                    ; $541f: $e0 $00
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
    ld   h, b                                        ; $542e: $60
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
    ld   b, $0c                                      ; $543c: $06 $0c
    ld   e, $1c                                      ; $543e: $1e $1c
    nop                                              ; $5440: $00
    nop                                              ; $5441: $00
    nop                                              ; $5442: $00
    nop                                              ; $5443: $00
    nop                                              ; $5444: $00
    nop                                              ; $5445: $00
    nop                                              ; $5446: $00
    nop                                              ; $5447: $00
    ld   b, $18                                      ; $5448: $06 $18
    inc  c                                           ; $544a: $0c
    ld   e, $0c                                      ; $544b: $1e $0c
    ld   e, $0e                                      ; $544d: $1e $0e
    inc  e                                           ; $544f: $1c
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
    ld   a, b                                        ; $546c: $78
    rlca                                             ; $546d: $07
    rst  $38                                         ; $546e: $ff
    ld   a, a                                        ; $546f: $7f
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
    ld   c, $01                                      ; $547a: $0e $01
    ld   a, a                                        ; $547c: $7f
    rst  $38                                         ; $547d: $ff
    rst  $38                                         ; $547e: $ff
    rst  $38                                         ; $547f: $ff
    nop                                              ; $5480: $00
    nop                                              ; $5481: $00
    nop                                              ; $5482: $00
    nop                                              ; $5483: $00
    nop                                              ; $5484: $00
    nop                                              ; $5485: $00
    nop                                              ; $5486: $00
    nop                                              ; $5487: $00
    jr   nc, jr_0ab_548a                             ; $5488: $30 $00

    jr_0ab_548a:
    ld   h, b                                        ; $548a: $60
    ldh  a, [$f0]                                    ; $548b: $f0 $f0
    ldh  a, [$f8]                                    ; $548d: $f0 $f8
    ldh  a, [rP1]                                    ; $548f: $f0 $00
    nop                                              ; $5491: $00
    nop                                              ; $5492: $00
    nop                                              ; $5493: $00
    nop                                              ; $5494: $00
    nop                                              ; $5495: $00
    nop                                              ; $5496: $00
    nop                                              ; $5497: $00
    dec  c                                           ; $5498: $0d
    ld   [bc], a                                     ; $5499: $02
    rra                                              ; $549a: $1f
    ld   c, $0f                                      ; $549b: $0e $0f
    ld   c, $0e                                      ; $549d: $0e $0e
    rrca                                             ; $549f: $0f
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
    rla                                              ; $54c8: $17
    ld   [$1f0f], sp                                 ; $54c9: $08 $0f $1f
    rra                                              ; $54cc: $1f
    rra                                              ; $54cd: $1f
    inc  de                                          ; $54ce: $13
    rrca                                             ; $54cf: $0f
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
    ret  nc                                          ; $54da: $d0

    ldh  [$e0], a                                    ; $54db: $e0 $e0
    ldh  a, [$f0]                                    ; $54dd: $f0 $f0
    ldh  [rTIMA], a                                  ; $54df: $e0 $05
    inc  bc                                          ; $54e1: $03
    ld   a, [bc]                                     ; $54e2: $0a
    rlca                                             ; $54e3: $07
    ld   d, $0f                                      ; $54e4: $16 $0f
    dec  c                                           ; $54e6: $0d
    inc  bc                                          ; $54e7: $03
    ld   [bc], a                                     ; $54e8: $02
    ld   bc, $0102                                   ; $54e9: $01 $02 $01
    ld   [bc], a                                     ; $54ec: $02
    rlca                                             ; $54ed: $07
    rlca                                             ; $54ee: $07
    ld   c, $80                                      ; $54ef: $0e $80
    nop                                              ; $54f1: $00
    nop                                              ; $54f2: $00
    nop                                              ; $54f3: $00
    ret  nz                                          ; $54f4: $c0

    nop                                              ; $54f5: $00
    add  b                                           ; $54f6: $80
    ldh  [$e0], a                                    ; $54f7: $e0 $e0
    ret  nz                                          ; $54f9: $c0

    ld   b, b                                        ; $54fa: $40
    add  b                                           ; $54fb: $80
    add  b                                           ; $54fc: $80
    nop                                              ; $54fd: $00
    add  b                                           ; $54fe: $80
    nop                                              ; $54ff: $00
    inc  e                                           ; $5500: $1c
    inc  bc                                          ; $5501: $03
    rrca                                             ; $5502: $0f
    rra                                              ; $5503: $1f
    rrca                                             ; $5504: $0f
    rra                                              ; $5505: $1f
    ld   bc, $001f                                   ; $5506: $01 $1f $00
    ld   bc, $0100                                   ; $5509: $01 $00 $01
    ld   bc, $0f03                                   ; $550c: $01 $03 $0f
    rlca                                             ; $550f: $07
    db   $ec                                         ; $5510: $ec
    cp   $fc                                         ; $5511: $fe $fc

    jr_0ab_5513:
    cp   $fc                                         ; $5513: $fe $fc
    cp   $dc                                         ; $5515: $fe $dc

    jr_0ab_5517:
    ldh  [$cd], a                                    ; $5517: $e0 $cd
    ldh  [c], a                                      ; $5519: $e2
    rst  $38                                         ; $551a: $ff
    rst  $38                                         ; $551b: $ff
    rst  $38                                         ; $551c: $ff
    rst  $38                                         ; $551d: $ff
    ldh  a, [rIE]                                    ; $551e: $f0 $ff
    ldh  [rSVBK], a                                  ; $5520: $e0 $70
    ldh  a, [$f8]                                    ; $5522: $f0 $f8
    cp   $7c                                         ; $5524: $fe $7c
    ld   e, $3c                                      ; $5526: $1e $3c
    adc  h                                           ; $5528: $8c
    jr   jr_0ab_5513                                 ; $5529: $18 $e8

    ret  nz                                          ; $552b: $c0

    ldh  [$f0], a                                    ; $552c: $e0 $f0
    ld   hl, sp-$10                                  ; $552e: $f8 $f0
    inc  c                                           ; $5530: $0c
    ld   e, $1e                                      ; $5531: $1e $1e
    rrca                                             ; $5533: $0f
    rrca                                             ; $5534: $0f
    rrca                                             ; $5535: $0f
    rlca                                             ; $5536: $07
    rrca                                             ; $5537: $0f
    rrca                                             ; $5538: $0f
    rra                                              ; $5539: $1f
    ccf                                              ; $553a: $3f
    rra                                              ; $553b: $1f
    rra                                              ; $553c: $1f
    ccf                                              ; $553d: $3f
    ld   a, a                                        ; $553e: $7f
    dec  sp                                          ; $553f: $3b
    sbc  [hl]                                        ; $5540: $9e
    ld   a, a                                        ; $5541: $7f
    rst  $38                                         ; $5542: $ff
    rst  $38                                         ; $5543: $ff
    rst  $38                                         ; $5544: $ff
    rst  $38                                         ; $5545: $ff
    sbc  d                                           ; $5546: $9a
    db   $fd                                         ; $5547: $fd
    sbc  b                                           ; $5548: $98
    inc  a                                           ; $5549: $3c
    inc  a                                           ; $554a: $3c
    cp   b                                           ; $554b: $b8
    cp   b                                           ; $554c: $b8
    ld   hl, sp-$08                                  ; $554d: $f8 $f8
    ldh  a, [rP1]                                    ; $554f: $f0 $00
    add  b                                           ; $5551: $80
    ret  nz                                          ; $5552: $c0

    ldh  [$e0], a                                    ; $5553: $e0 $e0
    ldh  a, [$f8]                                    ; $5555: $f0 $f8
    ldh  a, [$f0]                                    ; $5557: $f0 $f0
    ld   a, b                                        ; $5559: $78
    jr   c, @+$7a                                    ; $555a: $38 $78

    ld   a, b                                        ; $555c: $78
    jr   c, jr_0ab_55d7                              ; $555d: $38 $78

    jr   c, @+$01                                    ; $555f: $38 $ff

    ld   a, a                                        ; $5561: $7f
    ld   a, b                                        ; $5562: $78
    ld   a, a                                        ; $5563: $7f
    nop                                              ; $5564: $00
    nop                                              ; $5565: $00
    nop                                              ; $5566: $00
    nop                                              ; $5567: $00
    nop                                              ; $5568: $00
    nop                                              ; $5569: $00
    nop                                              ; $556a: $00
    ld   bc, $0101                                   ; $556b: $01 $01 $01
    inc  bc                                          ; $556e: $03
    ld   bc, $ffff                                   ; $556f: $01 $ff $ff
    db   $dd                                         ; $5572: $dd
    ld   a, $78                                      ; $5573: $3e $78
    inc  a                                           ; $5575: $3c
    pop  af                                          ; $5576: $f1
    ld   a, b                                        ; $5577: $78
    pop  hl                                          ; $5578: $e1
    ldh  a, [$e0]                                    ; $5579: $f0 $e0
    ldh  [$c0], a                                    ; $557b: $e0 $c0
    ldh  [$e0], a                                    ; $557d: $e0 $e0
    ret  nz                                          ; $557f: $c0

    ld   h, b                                        ; $5580: $60
    add  b                                           ; $5581: $80
    stop                                             ; $5582: $10 $00
    ld   a, b                                        ; $5584: $78
    jr   nc, jr_0ab_5517                             ; $5585: $30 $90

    ld   hl, sp-$18                                  ; $5587: $f8 $e8
    ret  nc                                          ; $5589: $d0

    nop                                              ; $558a: $00
    ret  nz                                          ; $558b: $c0

    nop                                              ; $558c: $00
    nop                                              ; $558d: $00
    nop                                              ; $558e: $00
    nop                                              ; $558f: $00
    ld   b, $0f                                      ; $5590: $06 $0f
    rrca                                             ; $5592: $0f
    rlca                                             ; $5593: $07
    rlca                                             ; $5594: $07
    rlca                                             ; $5595: $07
    inc  bc                                          ; $5596: $03
    rlca                                             ; $5597: $07
    rlca                                             ; $5598: $07
    inc  bc                                          ; $5599: $03
    dec  bc                                          ; $559a: $0b
    rlca                                             ; $559b: $07
    rra                                              ; $559c: $1f
    rrca                                             ; $559d: $0f
    ld   a, $1f                                      ; $559e: $3e $1f
    ld   bc, $0b00                                   ; $55a0: $01 $00 $0b
    rlca                                             ; $55a3: $07
    cp   a                                           ; $55a4: $bf
    rra                                              ; $55a5: $1f
    rst  $38                                         ; $55a6: $ff
    rst  $38                                         ; $55a7: $ff
    ld   a, [$f0fc]                                  ; $55a8: $fa $fc $f0
    ldh  [$c0], a                                    ; $55ab: $e0 $c0
    add  b                                           ; $55ad: $80
    nop                                              ; $55ae: $00
    nop                                              ; $55af: $00
    add  b                                           ; $55b0: $80
    nop                                              ; $55b1: $00
    nop                                              ; $55b2: $00
    add  b                                           ; $55b3: $80
    add  b                                           ; $55b4: $80
    add  b                                           ; $55b5: $80
    ld   bc, $0380                                   ; $55b6: $01 $80 $03
    ld   bc, $0101                                   ; $55b9: $01 $01 $01
    nop                                              ; $55bc: $00
    ld   bc, $0000                                   ; $55bd: $01 $00 $00
    nop                                              ; $55c0: $00
    nop                                              ; $55c1: $00
    inc  b                                           ; $55c2: $04
    inc  bc                                          ; $55c3: $03
    ld   c, a                                        ; $55c4: $4f
    ccf                                              ; $55c5: $3f
    ld   a, a                                        ; $55c6: $7f
    rst  $38                                         ; $55c7: $ff
    db   $fd                                         ; $55c8: $fd
    cp   $e8                                         ; $55c9: $fe $e8
    ldh  a, [$c0]                                    ; $55cb: $f0 $c0
    add  b                                           ; $55cd: $80
    nop                                              ; $55ce: $00
    nop                                              ; $55cf: $00
    ld   h, b                                        ; $55d0: $60
    nop                                              ; $55d1: $00
    db   $10                                         ; $55d2: $10
    ldh  [$fc], a                                    ; $55d3: $e0 $fc
    ld   hl, sp-$02                                  ; $55d5: $f8 $fe

    jr_0ab_55d7:
    db   $fc                                         ; $55d7: $fc
    call c, $1f3e                                    ; $55d8: $dc $3e $1f
    ld   c, $0f                                      ; $55db: $0e $0f
    ld   c, $0f                                      ; $55dd: $0e $0f
    ld   c, $0f                                      ; $55df: $0e $0f
    rlca                                             ; $55e1: $07
    rlca                                             ; $55e2: $07
    ld   bc, $0103                                   ; $55e3: $01 $03 $01
    rlca                                             ; $55e6: $07
    inc  bc                                          ; $55e7: $03
    inc  c                                           ; $55e8: $0c
    rlca                                             ; $55e9: $07
    rrca                                             ; $55ea: $0f
    rlca                                             ; $55eb: $07
    dec  b                                           ; $55ec: $05
    inc  bc                                          ; $55ed: $03
    inc  bc                                          ; $55ee: $03
    ld   bc, $8040                                   ; $55ef: $01 $40 $80
    and  b                                           ; $55f2: $a0
    ret  nz                                          ; $55f3: $c0

    ret  nz                                          ; $55f4: $c0

    add  b                                           ; $55f5: $80
    add  b                                           ; $55f6: $80
    nop                                              ; $55f7: $00
    nop                                              ; $55f8: $00
    nop                                              ; $55f9: $00
    ret  nz                                          ; $55fa: $c0

    nop                                              ; $55fb: $00
    add  b                                           ; $55fc: $80
    ret  nz                                          ; $55fd: $c0

    ret  nz                                          ; $55fe: $c0

    add  b                                           ; $55ff: $80
    rra                                              ; $5600: $1f
    rrca                                             ; $5601: $0f
    ld   e, $1f                                      ; $5602: $1e $1f
    inc  a                                           ; $5604: $3c
    dec  e                                           ; $5605: $1d
    jr   @+$3f                                       ; $5606: $18 $3d

    ld   a, [de]                                     ; $5608: $1a
    dec  a                                           ; $5609: $3d
    ccf                                              ; $560a: $3f
    rra                                              ; $560b: $1f
    rrca                                             ; $560c: $0f
    rra                                              ; $560d: $1f
    rlca                                             ; $560e: $07
    rrca                                             ; $560f: $0f
    ret  nz                                          ; $5610: $c0

    ldh  [$c0], a                                    ; $5611: $e0 $c0
    ldh  [$c0], a                                    ; $5613: $e0 $c0
    ldh  [$c8], a                                    ; $5615: $e0 $c8
    and  $de                                         ; $5617: $e6 $de
    rst  $28                                         ; $5619: $ef
    rst  $08                                         ; $561a: $cf
    rst  $28                                         ; $561b: $ef
    rst  $28                                         ; $561c: $ef
    rst  JumpTableTrashDE                                         ; $561d: $c7
    add  l                                           ; $561e: $85
    jp   $78f8                               ; $561f: $c3 $f8 $78


    ld   a, h                                        ; $5622: $7c
    jr   c, @+$3e                                    ; $5623: $38 $3c

    jr   c, jr_0ab_56a3                              ; $5625: $38 $7c

    jr   c, jr_0ab_56a1                              ; $5627: $38 $78

    ld   hl, sp-$10                                  ; $5629: $f8 $f0
    ld   hl, sp-$20                                  ; $562b: $f8 $e0
    ldh  a, [$a0]                                    ; $562d: $f0 $a0
    ret  nz                                          ; $562f: $c0

    ld   sp, $397b                                   ; $5630: $31 $7b $39
    ld   [hl], c                                     ; $5633: $71
    dec  sp                                          ; $5634: $3b
    ld   [hl], c                                     ; $5635: $71
    dec  sp                                          ; $5636: $3b
    ld   a, a                                        ; $5637: $7f
    ccf                                              ; $5638: $3f
    ld   a, a                                        ; $5639: $7f
    ccf                                              ; $563a: $3f
    ld   a, $14                                      ; $563b: $3e $14
    ld   [$0000], sp                                 ; $563d: $08 $00 $00
    ldh  a, [$f0]                                    ; $5640: $f0 $f0
    ldh  a, [$e0]                                    ; $5642: $f0 $e0
    ldh  [$f0], a                                    ; $5644: $e0 $f0
    pop  af                                          ; $5646: $f1
    ldh  a, [rLYC]                                   ; $5647: $f0 $45
    db   $e3                                         ; $5649: $e3
    ld   e, a                                        ; $564a: $5f
    rrca                                             ; $564b: $0f
    rrca                                             ; $564c: $0f
    rrca                                             ; $564d: $0f
    dec  b                                           ; $564e: $05
    ld   c, $78                                      ; $564f: $0e $78
    jr   c, jr_0ab_5683                              ; $5651: $38 $30

    ld   a, b                                        ; $5653: $78
    ld   hl, sp+$70                                  ; $5654: $f8 $70
    ldh  a, [$f0]                                    ; $5656: $f0 $f0
    ldh  a, [$e0]                                    ; $5658: $f0 $e0
    ldh  [$c0], a                                    ; $565a: $e0 $c0
    ld   b, b                                        ; $565c: $40
    add  b                                           ; $565d: $80
    nop                                              ; $565e: $00
    nop                                              ; $565f: $00
    ld   bc, $0103                                   ; $5660: $01 $03 $01
    inc  bc                                          ; $5663: $03
    ld   bc, $0303                                   ; $5664: $01 $03 $03
    ld   bc, $0100                                   ; $5667: $01 $00 $01
    nop                                              ; $566a: $00
    nop                                              ; $566b: $00
    nop                                              ; $566c: $00
    nop                                              ; $566d: $00
    nop                                              ; $566e: $00
    nop                                              ; $566f: $00
    ret  nz                                          ; $5670: $c0

    ret  nz                                          ; $5671: $c0

    ret  nz                                          ; $5672: $c0

    ret  nz                                          ; $5673: $c0

    ldh  [$c0], a                                    ; $5674: $e0 $c0
    ldh  a, [$e0]                                    ; $5676: $f0 $e0
    or   $f8                                         ; $5678: $f6 $f8
    ld   a, a                                        ; $567a: $7f
    rst  $38                                         ; $567b: $ff
    ccf                                              ; $567c: $3f
    ld   a, a                                        ; $567d: $7f
    rla                                              ; $567e: $17
    rrca                                             ; $567f: $0f
    nop                                              ; $5680: $00
    nop                                              ; $5681: $00
    nop                                              ; $5682: $00

    jr_0ab_5683:
    nop                                              ; $5683: $00
    nop                                              ; $5684: $00
    nop                                              ; $5685: $00
    nop                                              ; $5686: $00
    nop                                              ; $5687: $00
    nop                                              ; $5688: $00
    nop                                              ; $5689: $00
    add  b                                           ; $568a: $80
    nop                                              ; $568b: $00
    add  b                                           ; $568c: $80
    nop                                              ; $568d: $00
    nop                                              ; $568e: $00
    nop                                              ; $568f: $00
    ld   a, $3c                                      ; $5690: $3e $3c
    inc  a                                           ; $5692: $3c
    ld   a, b                                        ; $5693: $78
    jr   c, jr_0ab_570e                              ; $5694: $38 $78

    ld   a, b                                        ; $5696: $78
    ld   a, b                                        ; $5697: $78
    jr   c, jr_0ab_5716                              ; $5698: $38 $7c

    ld   a, a                                        ; $569a: $7f
    ccf                                              ; $569b: $3f
    rra                                              ; $569c: $1f
    ccf                                              ; $569d: $3f
    rla                                              ; $569e: $17
    rrca                                             ; $569f: $0f
    nop                                              ; $56a0: $00

    jr_0ab_56a1:
    nop                                              ; $56a1: $00
    nop                                              ; $56a2: $00

    jr_0ab_56a3:
    nop                                              ; $56a3: $00
    nop                                              ; $56a4: $00
    nop                                              ; $56a5: $00
    nop                                              ; $56a6: $00
    nop                                              ; $56a7: $00
    ld   b, $01                                      ; $56a8: $06 $01
    ccf                                              ; $56aa: $3f
    rst  $38                                         ; $56ab: $ff
    rst  $38                                         ; $56ac: $ff
    rst  $38                                         ; $56ad: $ff
    cp   $ff                                         ; $56ae: $fe $ff
    nop                                              ; $56b0: $00
    nop                                              ; $56b1: $00
    nop                                              ; $56b2: $00
    nop                                              ; $56b3: $00
    nop                                              ; $56b4: $00
    nop                                              ; $56b5: $00
    nop                                              ; $56b6: $00
    nop                                              ; $56b7: $00
    add  b                                           ; $56b8: $80
    ret  nz                                          ; $56b9: $c0

    ret  nz                                          ; $56ba: $c0

    ret  nz                                          ; $56bb: $c0

    ret  nz                                          ; $56bc: $c0

    ret  nz                                          ; $56bd: $c0

    ld   b, b                                        ; $56be: $40
    add  b                                           ; $56bf: $80
    nop                                              ; $56c0: $00
    nop                                              ; $56c1: $00
    nop                                              ; $56c2: $00
    nop                                              ; $56c3: $00
    nop                                              ; $56c4: $00
    nop                                              ; $56c5: $00
    nop                                              ; $56c6: $00
    nop                                              ; $56c7: $00
    ld   bc, $1b00                                   ; $56c8: $01 $00 $1b
    rlca                                             ; $56cb: $07
    rrca                                             ; $56cc: $0f
    rra                                              ; $56cd: $1f
    rrca                                             ; $56ce: $0f
    rrca                                             ; $56cf: $0f
    rra                                              ; $56d0: $1f
    ld   c, $0e                                      ; $56d1: $0e $0e
    ld   e, $3c                                      ; $56d3: $1e $3c
    ld   e, $3c                                      ; $56d5: $1e $3c
    ld   a, h                                        ; $56d7: $7c
    db   $fc                                         ; $56d8: $fc
    ld   hl, sp-$08                                  ; $56d9: $f8 $f8
    ldh  a, [$c0]                                    ; $56db: $f0 $c0
    ldh  [rLCDC], a                                  ; $56dd: $e0 $40
    add  b                                           ; $56df: $80
    rlca                                             ; $56e0: $07
    inc  bc                                          ; $56e1: $03
    ld   c, $07                                      ; $56e2: $0e $07
    ld   a, [bc]                                     ; $56e4: $0a
    rlca                                             ; $56e5: $07
    dec  b                                           ; $56e6: $05
    inc  bc                                          ; $56e7: $03
    ld   bc, $0703                                   ; $56e8: $01 $03 $07
    inc  bc                                          ; $56eb: $03
    ld   a, [bc]                                     ; $56ec: $0a
    rlca                                             ; $56ed: $07
    dec  bc                                          ; $56ee: $0b
    rlca                                             ; $56ef: $07
    add  b                                           ; $56f0: $80
    nop                                              ; $56f1: $00
    nop                                              ; $56f2: $00
    nop                                              ; $56f3: $00
    add  b                                           ; $56f4: $80
    nop                                              ; $56f5: $00
    ret  nz                                          ; $56f6: $c0

    add  b                                           ; $56f7: $80
    ld   b, b                                        ; $56f8: $40
    add  b                                           ; $56f9: $80
    add  b                                           ; $56fa: $80
    nop                                              ; $56fb: $00
    add  b                                           ; $56fc: $80
    nop                                              ; $56fd: $00
    add  b                                           ; $56fe: $80
    nop                                              ; $56ff: $00
    rlca                                             ; $5700: $07
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

    jr_0ab_570e:
    nop                                              ; $570e: $00
    nop                                              ; $570f: $00
    add  b                                           ; $5710: $80
    nop                                              ; $5711: $00
    nop                                              ; $5712: $00
    nop                                              ; $5713: $00
    nop                                              ; $5714: $00
    nop                                              ; $5715: $00

    jr_0ab_5716:
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
    inc  b                                           ; $5740: $04
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
    inc  bc                                          ; $5770: $03
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
    inc  bc                                          ; $5790: $03
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
    ld   hl, sp+$00                                  ; $57a0: $f8 $00
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
    ld   a, [bc]                                     ; $57c0: $0a
    inc  b                                           ; $57c1: $04
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
    rlca                                             ; $57e0: $07
    inc  bc                                          ; $57e1: $03
    ld   bc, $0703                                   ; $57e2: $01 $03 $07
    inc  bc                                          ; $57e5: $03
    inc  bc                                          ; $57e6: $03
    rlca                                             ; $57e7: $07
    inc  bc                                          ; $57e8: $03
    rlca                                             ; $57e9: $07
    rlca                                             ; $57ea: $07
    inc  bc                                          ; $57eb: $03
    inc  bc                                          ; $57ec: $03
    inc  bc                                          ; $57ed: $03
    inc  bc                                          ; $57ee: $03
    nop                                              ; $57ef: $00
    ld   b, b                                        ; $57f0: $40
    add  b                                           ; $57f1: $80
    ld   b, b                                        ; $57f2: $40
    add  b                                           ; $57f3: $80
    add  b                                           ; $57f4: $80
    nop                                              ; $57f5: $00
    add  b                                           ; $57f6: $80
    nop                                              ; $57f7: $00
    nop                                              ; $57f8: $00
    add  b                                           ; $57f9: $80
    nop                                              ; $57fa: $00
    add  b                                           ; $57fb: $80
    nop                                              ; $57fc: $00
    add  b                                           ; $57fd: $80
    add  b                                           ; $57fe: $80
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
    adc  a                                           ; $5814: $8f
    adc  [hl]                                        ; $5815: $8e
    nop                                              ; $5816: $00
    ld   b, b                                        ; $5817: $40
    ld   b, c                                        ; $5818: $41
    ld   b, d                                        ; $5819: $42
    ld   b, e                                        ; $581a: $43
    ld   b, h                                        ; $581b: $44
    ld   b, l                                        ; $581c: $45
    ld   b, [hl]                                     ; $581d: $46
    ld   b, a                                        ; $581e: $47
    ld   c, b                                        ; $581f: $48
    ld   c, c                                        ; $5820: $49
    ld   c, d                                        ; $5821: $4a
    ld   c, e                                        ; $5822: $4b
    ld   c, h                                        ; $5823: $4c
    ld   c, l                                        ; $5824: $4d
    nop                                              ; $5825: $00
    adc  [hl]                                        ; $5826: $8e
    adc  a                                           ; $5827: $8f
    sbc  a                                           ; $5828: $9f
    sbc  [hl]                                        ; $5829: $9e
    nop                                              ; $582a: $00
    ld   d, b                                        ; $582b: $50
    ld   d, c                                        ; $582c: $51
    ld   d, d                                        ; $582d: $52
    ld   d, e                                        ; $582e: $53
    ld   d, h                                        ; $582f: $54
    ld   d, l                                        ; $5830: $55
    ld   d, [hl]                                     ; $5831: $56
    ld   d, a                                        ; $5832: $57
    ld   e, b                                        ; $5833: $58
    ld   e, c                                        ; $5834: $59
    ld   e, d                                        ; $5835: $5a
    ld   e, e                                        ; $5836: $5b
    ld   e, h                                        ; $5837: $5c
    ld   e, l                                        ; $5838: $5d
    nop                                              ; $5839: $00
    sbc  [hl]                                        ; $583a: $9e
    sbc  a                                           ; $583b: $9f
    xor  a                                           ; $583c: $af
    xor  [hl]                                        ; $583d: $ae
    nop                                              ; $583e: $00
    ld   h, b                                        ; $583f: $60
    ld   h, c                                        ; $5840: $61
    ld   h, d                                        ; $5841: $62
    ld   h, e                                        ; $5842: $63
    ld   h, h                                        ; $5843: $64
    ld   h, l                                        ; $5844: $65
    ld   h, [hl]                                     ; $5845: $66
    ld   h, a                                        ; $5846: $67
    ld   l, b                                        ; $5847: $68
    ld   l, c                                        ; $5848: $69
    ld   l, d                                        ; $5849: $6a
    ld   l, e                                        ; $584a: $6b
    ld   l, h                                        ; $584b: $6c
    ld   l, l                                        ; $584c: $6d
    nop                                              ; $584d: $00
    xor  [hl]                                        ; $584e: $ae
    xor  a                                           ; $584f: $af
    cp   a                                           ; $5850: $bf
    cp   [hl]                                        ; $5851: $be
    nop                                              ; $5852: $00
    ld   [hl], b                                     ; $5853: $70
    ld   [hl], c                                     ; $5854: $71
    ld   [hl], d                                     ; $5855: $72
    ld   [hl], e                                     ; $5856: $73
    ld   [hl], h                                     ; $5857: $74
    ld   [hl], l                                     ; $5858: $75
    halt                                             ; $5859: $76
    ld   [hl], a                                     ; $585a: $77
    ld   a, b                                        ; $585b: $78
    ld   a, c                                        ; $585c: $79
    ld   a, d                                        ; $585d: $7a
    ld   a, e                                        ; $585e: $7b
    ld   a, h                                        ; $585f: $7c
    ld   a, l                                        ; $5860: $7d
    nop                                              ; $5861: $00
    cp   [hl]                                        ; $5862: $be
    cp   a                                           ; $5863: $bf
    rst  $08                                         ; $5864: $cf
    adc  $00                                         ; $5865: $ce $00
    or   b                                           ; $5867: $b0
    or   c                                           ; $5868: $b1
    or   d                                           ; $5869: $b2
    or   e                                           ; $586a: $b3
    or   h                                           ; $586b: $b4
    or   l                                           ; $586c: $b5
    or   [hl]                                        ; $586d: $b6
    or   a                                           ; $586e: $b7
    cp   b                                           ; $586f: $b8
    cp   c                                           ; $5870: $b9
    cp   d                                           ; $5871: $ba
    cp   e                                           ; $5872: $bb
    cp   h                                           ; $5873: $bc
    nop                                              ; $5874: $00
    nop                                              ; $5875: $00
    adc  $cf                                         ; $5876: $ce $cf
    rst  $18                                         ; $5878: $df
    sbc  $00                                         ; $5879: $de $00
    ret  nz                                          ; $587b: $c0

    pop  bc                                          ; $587c: $c1
    jp   nz, $c4c3                                   ; $587d: $c2 $c3 $c4

    push bc                                          ; $5880: $c5
    add  $c7                                         ; $5881: $c6 $c7
    ret  z                                           ; $5883: $c8

    ret                                              ; $5884: $c9


    jp   z, $cccb                                    ; $5885: $ca $cb $cc

    nop                                              ; $5888: $00
    nop                                              ; $5889: $00
    sbc  $df                                         ; $588a: $de $df
    rst  $28                                         ; $588c: $ef
    xor  $00                                         ; $588d: $ee $00
    ret  nc                                          ; $588f: $d0

    pop  de                                          ; $5890: $d1
    jp   nc, $d4d3                                   ; $5891: $d2 $d3 $d4

    push de                                          ; $5894: $d5
    sub  $d7                                         ; $5895: $d6 $d7
    ret  c                                           ; $5897: $d8

    reti                                             ; $5898: $d9


    jp   c, $dcdb                                    ; $5899: $da $db $dc

    nop                                              ; $589c: $00
    nop                                              ; $589d: $00
    xor  $ef                                         ; $589e: $ee $ef
    rst  $38                                         ; $58a0: $ff
    cp   $00                                         ; $58a1: $fe $00
    ldh  [$e1], a                                    ; $58a3: $e0 $e1
    ldh  [c], a                                      ; $58a5: $e2
    db   $e3                                         ; $58a6: $e3
    db   $e4                                         ; $58a7: $e4
    push hl                                          ; $58a8: $e5
    and  $e7                                         ; $58a9: $e6 $e7
    add  sp, -$17                                    ; $58ab: $e8 $e9
    ld   [$eceb], a                                  ; $58ad: $ea $eb $ec
    nop                                              ; $58b0: $00
    nop                                              ; $58b1: $00
    cp   $ff                                         ; $58b2: $fe $ff
    rrca                                             ; $58b4: $0f
    ld   c, $00                                      ; $58b5: $0e $00
    ldh  a, [$f1]                                    ; $58b7: $f0 $f1
    ldh  a, [c]                                      ; $58b9: $f2
    di                                               ; $58ba: $f3
    db   $f4                                         ; $58bb: $f4
    push af                                          ; $58bc: $f5
    or   $f7                                         ; $58bd: $f6 $f7
    ld   hl, sp-$07                                  ; $58bf: $f8 $f9
    ld   a, [$fcfb]                                  ; $58c1: $fa $fb $fc
    nop                                              ; $58c4: $00
    nop                                              ; $58c5: $00
    ld   c, $0f                                      ; $58c6: $0e $0f
    rra                                              ; $58c8: $1f
    ld   e, $00                                      ; $58c9: $1e $00
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
    ld   e, $1f                                      ; $58da: $1e $1f
    cpl                                              ; $58dc: $2f
    ld   l, $00                                      ; $58dd: $2e $00
    nop                                              ; $58df: $00
    nop                                              ; $58e0: $00
    nop                                              ; $58e1: $00
    nop                                              ; $58e2: $00
    nop                                              ; $58e3: $00
    nop                                              ; $58e4: $00
    nop                                              ; $58e5: $00
    nop                                              ; $58e6: $00
    nop                                              ; $58e7: $00
    adc  b                                           ; $58e8: $88
    adc  c                                           ; $58e9: $89
    adc  d                                           ; $58ea: $8a
    adc  e                                           ; $58eb: $8b
    adc  h                                           ; $58ec: $8c
    adc  l                                           ; $58ed: $8d
    ld   l, $2f                                      ; $58ee: $2e $2f
    ccf                                              ; $58f0: $3f
    ld   a, $00                                      ; $58f1: $3e $00
    nop                                              ; $58f3: $00
    nop                                              ; $58f4: $00
    nop                                              ; $58f5: $00
    nop                                              ; $58f6: $00
    nop                                              ; $58f7: $00
    nop                                              ; $58f8: $00
    nop                                              ; $58f9: $00
    nop                                              ; $58fa: $00
    nop                                              ; $58fb: $00
    sbc  b                                           ; $58fc: $98
    sbc  c                                           ; $58fd: $99
    sbc  d                                           ; $58fe: $9a
    sbc  e                                           ; $58ff: $9b
    sbc  h                                           ; $5900: $9c
    sbc  l                                           ; $5901: $9d
    ld   a, $3f                                      ; $5902: $3e $3f
    ld   c, a                                        ; $5904: $4f
    ld   c, [hl]                                     ; $5905: $4e
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
    xor  b                                           ; $5910: $a8
    xor  c                                           ; $5911: $a9
    xor  d                                           ; $5912: $aa
    xor  e                                           ; $5913: $ab
    xor  h                                           ; $5914: $ac
    xor  l                                           ; $5915: $ad
    ld   c, [hl]                                     ; $5916: $4e
    ld   c, a                                        ; $5917: $4f
    ld   e, a                                        ; $5918: $5f
    ld   e, [hl]                                     ; $5919: $5e
    ld   de, $1312                                   ; $591a: $11 $12 $13
    inc  d                                           ; $591d: $14
    dec  d                                           ; $591e: $15
    ld   d, $17                                      ; $591f: $16 $17
    jr   jr_0ab_593c                                 ; $5921: $18 $19

    add  b                                           ; $5923: $80
    add  c                                           ; $5924: $81
    add  d                                           ; $5925: $82
    add  e                                           ; $5926: $83
    add  h                                           ; $5927: $84
    add  l                                           ; $5928: $85
    add  [hl]                                        ; $5929: $86
    ld   e, [hl]                                     ; $592a: $5e
    ld   e, a                                        ; $592b: $5f
    ld   l, a                                        ; $592c: $6f
    ld   l, [hl]                                     ; $592d: $6e
    ld   hl, $2322                                   ; $592e: $21 $22 $23
    inc  h                                           ; $5931: $24
    dec  h                                           ; $5932: $25
    ld   h, $27                                      ; $5933: $26 $27
    jr   z, jr_0ab_5960                              ; $5935: $28 $29

    sub  b                                           ; $5937: $90
    sub  c                                           ; $5938: $91
    sub  d                                           ; $5939: $92
    sub  e                                           ; $593a: $93
    sub  h                                           ; $593b: $94

    jr_0ab_593c:
    sub  l                                           ; $593c: $95
    sub  [hl]                                        ; $593d: $96
    ld   l, [hl]                                     ; $593e: $6e
    ld   l, a                                        ; $593f: $6f
    ld   a, a                                        ; $5940: $7f
    ld   a, [hl]                                     ; $5941: $7e
    nop                                              ; $5942: $00
    nop                                              ; $5943: $00
    nop                                              ; $5944: $00
    nop                                              ; $5945: $00
    nop                                              ; $5946: $00
    nop                                              ; $5947: $00
    nop                                              ; $5948: $00
    nop                                              ; $5949: $00
    nop                                              ; $594a: $00
    and  b                                           ; $594b: $a0
    and  c                                           ; $594c: $a1
    and  d                                           ; $594d: $a2
    and  e                                           ; $594e: $a3
    and  h                                           ; $594f: $a4
    and  l                                           ; $5950: $a5
    and  [hl]                                        ; $5951: $a6
    ld   a, [hl]                                     ; $5952: $7e
    ld   a, a                                        ; $5953: $7f
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

    jr_0ab_5960:
    nop                                              ; $5960: $00
    nop                                              ; $5961: $00
    nop                                              ; $5962: $00
    nop                                              ; $5963: $00
    nop                                              ; $5964: $00
    nop                                              ; $5965: $00
    nop                                              ; $5966: $00
    nop                                              ; $5967: $00
    nop                                              ; $5968: $00
    db   $10                                         ; $5969: $10
    db   $10                                         ; $596a: $10
    db   $10                                         ; $596b: $10
    db   $10                                         ; $596c: $10
    db   $10                                         ; $596d: $10
    db   $10                                         ; $596e: $10
    db   $10                                         ; $596f: $10
    db   $10                                         ; $5970: $10
    db   $10                                         ; $5971: $10
    db   $10                                         ; $5972: $10
    db   $10                                         ; $5973: $10
    db   $10                                         ; $5974: $10
    db   $10                                         ; $5975: $10
    db   $10                                         ; $5976: $10
    db   $10                                         ; $5977: $10
    db   $10                                         ; $5978: $10
    db   $10                                         ; $5979: $10
    db   $10                                         ; $597a: $10
    db   $10                                         ; $597b: $10
    ld   [hl+], a                                    ; $597c: $22
    ld   [hl+], a                                    ; $597d: $22
    db   $10                                         ; $597e: $10
    ld   bc, $0101                                   ; $597f: $01 $01 $01
    ld   bc, $0101                                   ; $5982: $01 $01 $01
    ld   bc, $0101                                   ; $5985: $01 $01 $01
    ld   bc, $0101                                   ; $5988: $01 $01 $01
    ld   bc, $1001                                   ; $598b: $01 $01 $10
    ld   [bc], a                                     ; $598e: $02
    ld   [bc], a                                     ; $598f: $02
    ld   [hl+], a                                    ; $5990: $22
    ld   [hl+], a                                    ; $5991: $22
    db   $10                                         ; $5992: $10
    ld   bc, $0101                                   ; $5993: $01 $01 $01
    ld   bc, $0101                                   ; $5996: $01 $01 $01
    ld   bc, $0101                                   ; $5999: $01 $01 $01
    ld   bc, $0101                                   ; $599c: $01 $01 $01
    ld   bc, $1001                                   ; $599f: $01 $01 $10
    ld   [bc], a                                     ; $59a2: $02
    ld   [bc], a                                     ; $59a3: $02
    ld   [hl+], a                                    ; $59a4: $22
    ld   [hl+], a                                    ; $59a5: $22
    db   $10                                         ; $59a6: $10
    ld   bc, $0101                                   ; $59a7: $01 $01 $01
    ld   bc, $0101                                   ; $59aa: $01 $01 $01
    ld   bc, $0101                                   ; $59ad: $01 $01 $01
    ld   bc, $0101                                   ; $59b0: $01 $01 $01
    ld   bc, $1001                                   ; $59b3: $01 $01 $10
    ld   [bc], a                                     ; $59b6: $02
    ld   [bc], a                                     ; $59b7: $02
    ld   [hl+], a                                    ; $59b8: $22
    ld   [hl+], a                                    ; $59b9: $22
    db   $10                                         ; $59ba: $10
    ld   bc, $0101                                   ; $59bb: $01 $01 $01
    ld   bc, $0101                                   ; $59be: $01 $01 $01
    ld   bc, $0101                                   ; $59c1: $01 $01 $01
    ld   bc, $0101                                   ; $59c4: $01 $01 $01
    ld   bc, $1001                                   ; $59c7: $01 $01 $10
    ld   [bc], a                                     ; $59ca: $02
    ld   [bc], a                                     ; $59cb: $02
    ld   [hl+], a                                    ; $59cc: $22
    ld   [hl+], a                                    ; $59cd: $22
    stop                                             ; $59ce: $10 $00
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
    db   $10                                         ; $59dc: $10
    db   $10                                         ; $59dd: $10
    ld   [bc], a                                     ; $59de: $02
    ld   [bc], a                                     ; $59df: $02
    ld   [hl+], a                                    ; $59e0: $22
    ld   [hl+], a                                    ; $59e1: $22
    stop                                             ; $59e2: $10 $00
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
    db   $10                                         ; $59f0: $10
    db   $10                                         ; $59f1: $10
    ld   [bc], a                                     ; $59f2: $02
    ld   [bc], a                                     ; $59f3: $02
    ld   [hl+], a                                    ; $59f4: $22
    ld   [hl+], a                                    ; $59f5: $22
    stop                                             ; $59f6: $10 $00
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
    db   $10                                         ; $5a04: $10
    db   $10                                         ; $5a05: $10
    ld   [bc], a                                     ; $5a06: $02
    ld   [bc], a                                     ; $5a07: $02
    ld   [hl+], a                                    ; $5a08: $22
    ld   [hl+], a                                    ; $5a09: $22
    stop                                             ; $5a0a: $10 $00
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
    db   $10                                         ; $5a18: $10
    db   $10                                         ; $5a19: $10
    ld   [bc], a                                     ; $5a1a: $02
    ld   [bc], a                                     ; $5a1b: $02
    ld   [hl+], a                                    ; $5a1c: $22
    ld   [hl+], a                                    ; $5a1d: $22
    stop                                             ; $5a1e: $10 $00
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
    db   $10                                         ; $5a2c: $10
    db   $10                                         ; $5a2d: $10
    ld   [bc], a                                     ; $5a2e: $02
    ld   [bc], a                                     ; $5a2f: $02
    ld   [hl+], a                                    ; $5a30: $22
    ld   [hl+], a                                    ; $5a31: $22
    db   $10                                         ; $5a32: $10
    db   $10                                         ; $5a33: $10
    db   $10                                         ; $5a34: $10
    db   $10                                         ; $5a35: $10
    db   $10                                         ; $5a36: $10
    db   $10                                         ; $5a37: $10
    db   $10                                         ; $5a38: $10
    db   $10                                         ; $5a39: $10
    db   $10                                         ; $5a3a: $10
    db   $10                                         ; $5a3b: $10
    db   $10                                         ; $5a3c: $10
    db   $10                                         ; $5a3d: $10
    db   $10                                         ; $5a3e: $10
    db   $10                                         ; $5a3f: $10
    db   $10                                         ; $5a40: $10
    db   $10                                         ; $5a41: $10
    ld   [bc], a                                     ; $5a42: $02
    ld   [bc], a                                     ; $5a43: $02
    ld   [hl+], a                                    ; $5a44: $22
    ld   [hl+], a                                    ; $5a45: $22
    db   $10                                         ; $5a46: $10
    db   $10                                         ; $5a47: $10
    db   $10                                         ; $5a48: $10
    db   $10                                         ; $5a49: $10
    db   $10                                         ; $5a4a: $10
    db   $10                                         ; $5a4b: $10
    db   $10                                         ; $5a4c: $10
    db   $10                                         ; $5a4d: $10
    db   $10                                         ; $5a4e: $10
    db   $10                                         ; $5a4f: $10
    inc  bc                                          ; $5a50: $03
    inc  bc                                          ; $5a51: $03
    inc  bc                                          ; $5a52: $03
    inc  bc                                          ; $5a53: $03
    inc  bc                                          ; $5a54: $03
    inc  bc                                          ; $5a55: $03
    ld   [bc], a                                     ; $5a56: $02
    ld   [bc], a                                     ; $5a57: $02
    ld   [hl+], a                                    ; $5a58: $22
    ld   [hl+], a                                    ; $5a59: $22
    db   $10                                         ; $5a5a: $10
    db   $10                                         ; $5a5b: $10
    db   $10                                         ; $5a5c: $10
    db   $10                                         ; $5a5d: $10
    db   $10                                         ; $5a5e: $10
    db   $10                                         ; $5a5f: $10
    db   $10                                         ; $5a60: $10
    db   $10                                         ; $5a61: $10
    db   $10                                         ; $5a62: $10
    db   $10                                         ; $5a63: $10
    inc  bc                                          ; $5a64: $03
    inc  bc                                          ; $5a65: $03
    inc  bc                                          ; $5a66: $03
    inc  bc                                          ; $5a67: $03
    inc  bc                                          ; $5a68: $03
    inc  bc                                          ; $5a69: $03
    ld   [bc], a                                     ; $5a6a: $02
    ld   [bc], a                                     ; $5a6b: $02
    ld   [hl+], a                                    ; $5a6c: $22
    ld   [hl+], a                                    ; $5a6d: $22
    db   $10                                         ; $5a6e: $10
    db   $10                                         ; $5a6f: $10
    db   $10                                         ; $5a70: $10
    db   $10                                         ; $5a71: $10
    db   $10                                         ; $5a72: $10
    db   $10                                         ; $5a73: $10
    db   $10                                         ; $5a74: $10
    db   $10                                         ; $5a75: $10
    db   $10                                         ; $5a76: $10
    db   $10                                         ; $5a77: $10
    inc  bc                                          ; $5a78: $03
    inc  bc                                          ; $5a79: $03
    inc  bc                                          ; $5a7a: $03
    inc  bc                                          ; $5a7b: $03
    inc  bc                                          ; $5a7c: $03
    inc  bc                                          ; $5a7d: $03
    ld   [bc], a                                     ; $5a7e: $02
    ld   [bc], a                                     ; $5a7f: $02
    ld   [hl+], a                                    ; $5a80: $22
    ld   [hl+], a                                    ; $5a81: $22
    nop                                              ; $5a82: $00
    nop                                              ; $5a83: $00
    nop                                              ; $5a84: $00
    nop                                              ; $5a85: $00
    nop                                              ; $5a86: $00
    nop                                              ; $5a87: $00
    nop                                              ; $5a88: $00
    nop                                              ; $5a89: $00
    nop                                              ; $5a8a: $00
    inc  bc                                          ; $5a8b: $03
    inc  bc                                          ; $5a8c: $03
    inc  bc                                          ; $5a8d: $03
    inc  bc                                          ; $5a8e: $03
    inc  bc                                          ; $5a8f: $03
    inc  bc                                          ; $5a90: $03
    inc  bc                                          ; $5a91: $03
    ld   [bc], a                                     ; $5a92: $02
    ld   [bc], a                                     ; $5a93: $02
    ld   [hl+], a                                    ; $5a94: $22
    ld   [hl+], a                                    ; $5a95: $22
    nop                                              ; $5a96: $00
    nop                                              ; $5a97: $00
    nop                                              ; $5a98: $00
    nop                                              ; $5a99: $00
    nop                                              ; $5a9a: $00
    nop                                              ; $5a9b: $00
    nop                                              ; $5a9c: $00
    nop                                              ; $5a9d: $00
    nop                                              ; $5a9e: $00
    inc  bc                                          ; $5a9f: $03
    inc  bc                                          ; $5aa0: $03
    inc  bc                                          ; $5aa1: $03
    inc  bc                                          ; $5aa2: $03
    inc  bc                                          ; $5aa3: $03
    inc  bc                                          ; $5aa4: $03
    inc  bc                                          ; $5aa5: $03
    ld   [bc], a                                     ; $5aa6: $02
    ld   [bc], a                                     ; $5aa7: $02
    ld   [hl+], a                                    ; $5aa8: $22
    ld   [hl+], a                                    ; $5aa9: $22
    db   $10                                         ; $5aaa: $10
    db   $10                                         ; $5aab: $10
    db   $10                                         ; $5aac: $10
    db   $10                                         ; $5aad: $10
    db   $10                                         ; $5aae: $10
    db   $10                                         ; $5aaf: $10
    db   $10                                         ; $5ab0: $10
    db   $10                                         ; $5ab1: $10
    db   $10                                         ; $5ab2: $10
    inc  bc                                          ; $5ab3: $03
    inc  bc                                          ; $5ab4: $03
    inc  bc                                          ; $5ab5: $03
    inc  bc                                          ; $5ab6: $03
    inc  bc                                          ; $5ab7: $03
    inc  bc                                          ; $5ab8: $03
    inc  bc                                          ; $5ab9: $03
    ld   [bc], a                                     ; $5aba: $02
    ld   [bc], a                                     ; $5abb: $02
    db   $10                                         ; $5abc: $10
    db   $10                                         ; $5abd: $10
    db   $10                                         ; $5abe: $10
    db   $10                                         ; $5abf: $10
    db   $10                                         ; $5ac0: $10
    db   $10                                         ; $5ac1: $10
    db   $10                                         ; $5ac2: $10
    db   $10                                         ; $5ac3: $10
    db   $10                                         ; $5ac4: $10
    db   $10                                         ; $5ac5: $10
    db   $10                                         ; $5ac6: $10
    db   $10                                         ; $5ac7: $10
    db   $10                                         ; $5ac8: $10
    db   $10                                         ; $5ac9: $10
    db   $10                                         ; $5aca: $10
    db   $10                                         ; $5acb: $10
    db   $10                                         ; $5acc: $10
    db   $10                                         ; $5acd: $10
    db   $10                                         ; $5ace: $10
    db   $10                                         ; $5acf: $10
    rst  $38                                         ; $5ad0: $ff
    ld   a, a                                        ; $5ad1: $7f
    ld   e, d                                        ; $5ad2: $5a
    ld   l, e                                        ; $5ad3: $6b
    ld   d, d                                        ; $5ad4: $52
    ld   c, d                                        ; $5ad5: $4a
    ld   h, e                                        ; $5ad6: $63
    inc  c                                           ; $5ad7: $0c
    rst  $38                                         ; $5ad8: $ff
    ld   a, a                                        ; $5ad9: $7f
    rst  $18                                         ; $5ada: $df
    ld   e, d                                        ; $5adb: $5a
    ccf                                              ; $5adc: $3f
    dec  h                                           ; $5add: $25
    rra                                              ; $5ade: $1f
    nop                                              ; $5adf: $00
    rst  $38                                         ; $5ae0: $ff
    ld   a, a                                        ; $5ae1: $7f
    rst  $38                                         ; $5ae2: $ff
    inc  bc                                          ; $5ae3: $03
    rst  $18                                         ; $5ae4: $df
    ld   [bc], a                                     ; $5ae5: $02
    ccf                                              ; $5ae6: $3f
    ld   [bc], a                                     ; $5ae7: $02
    nop                                              ; $5ae8: $00
    nop                                              ; $5ae9: $00
    ld   [$3121], sp                                 ; $5aea: $08 $21 $31
    ld   b, [hl]                                     ; $5aed: $46
    rst  $38                                         ; $5aee: $ff
    ld   a, a                                        ; $5aef: $7f
    nop                                              ; $5af0: $00
    nop                                              ; $5af1: $00
    ld   a, [bc]                                     ; $5af2: $0a
    nop                                              ; $5af3: $00
    ld   sp, $1f00                                   ; $5af4: $31 $00 $1f
    nop                                              ; $5af7: $00
    nop                                              ; $5af8: $00
    nop                                              ; $5af9: $00
    ld   d, b                                        ; $5afa: $50
    add  hl, de                                      ; $5afb: $19
    ld   a, d                                        ; $5afc: $7a
    ld   [hl], $3e                                   ; $5afd: $36 $3e
    ld   c, a                                        ; $5aff: $4f
    nop                                              ; $5b00: $00
    nop                                              ; $5b01: $00
    nop                                              ; $5b02: $00
    db $38, $40

    ld   e, b                                        ; $5b05: $58
    ret  nz                                          ; $5b06: $c0

    ld   l, b                                        ; $5b07: $68
    nop                                              ; $5b08: $00
    nop                                              ; $5b09: $00
    rst  $38                                         ; $5b0a: $ff
    inc  bc                                          ; $5b0b: $03
    ld   d, d                                        ; $5b0c: $52
    ld   bc, $01f7                                   ; $5b0d: $01 $f7 $01
