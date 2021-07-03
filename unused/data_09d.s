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

    jr_09d_5d5a:
    nop                                              ; $5d5a: $00
    nop                                              ; $5d5b: $00
    nop                                              ; $5d5c: $00
    nop                                              ; $5d5d: $00
    nop                                              ; $5d5e: $00
    nop                                              ; $5d5f: $00
    ld   [$3870], sp                                 ; $5d60: $08 $70 $38
    ld   [hl], b                                     ; $5d63: $70
    jr   c, jr_09d_5dd6                              ; $5d64: $38 $70

    jr   c, jr_09d_5dd8                              ; $5d66: $38 $70

    jr   c, jr_09d_5dda                              ; $5d68: $38 $70

    jr   c, jr_09d_5ddc                              ; $5d6a: $38 $70

    ld   a, b                                        ; $5d6c: $78
    nop                                              ; $5d6d: $00
    nop                                              ; $5d6e: $00
    nop                                              ; $5d6f: $00
    ld   [$3870], sp                                 ; $5d70: $08 $70 $38
    ld   [hl], b                                     ; $5d73: $70
    jr   c, jr_09d_5de6                              ; $5d74: $38 $70

    jr   c, jr_09d_5de8                              ; $5d76: $38 $70

    jr   c, @+$72                                    ; $5d78: $38 $70

    jr   c, jr_09d_5dec                              ; $5d7a: $38 $70

    ld   a, b                                        ; $5d7c: $78
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
    inc  e                                           ; $5d8a: $1c
    ld   [$070f], sp                                 ; $5d8b: $08 $0f $07
    ld   b, $02                                      ; $5d8e: $06 $02
    dec  de                                          ; $5d90: $1b
    dec  de                                          ; $5d91: $1b
    rlca                                             ; $5d92: $07
    inc  bc                                          ; $5d93: $03
    ld   b, $02                                      ; $5d94: $06 $02
    rrca                                             ; $5d96: $0f
    inc  b                                           ; $5d97: $04
    dec  e                                           ; $5d98: $1d
    dec  c                                           ; $5d99: $0d
    inc  e                                           ; $5d9a: $1c
    inc  d                                           ; $5d9b: $14
    dec  b                                           ; $5d9c: $05
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
    jr   z, @+$2a                                    ; $5da8: $28 $28

    jr   z, jr_09d_5dcc                              ; $5daa: $28 $20

    ld   hl, sp-$08                                  ; $5dac: $f8 $f8
    nop                                              ; $5dae: $00
    jr   nz, jr_09d_5d5a                             ; $5daf: $20 $a9

    xor  c                                           ; $5db1: $a9
    cp   c                                           ; $5db2: $b9
    xor  c                                           ; $5db3: $a9
    add  hl, sp                                      ; $5db4: $39
    ld   sp, $b1b1                                   ; $5db5: $31 $b1 $b1
    ld   [hl], b                                     ; $5db8: $70
    jr   nz, @-$03                                   ; $5db9: $20 $fb

    ld   d, c                                        ; $5dbb: $51
    db   $db                                         ; $5dbc: $db
    adc  d                                           ; $5dbd: $8a
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
    jr   nz, @+$22                                   ; $5dc8: $20 $20

    jr   nz, jr_09d_5dec                             ; $5dca: $20 $20

    jr_09d_5dcc:
    inc  a                                           ; $5dcc: $3c
    ld   a, $20                                      ; $5dcd: $3e $20

    jr_09d_5dcf:
    jr   nz, jr_09d_5dcf                             ; $5dcf: $20 $fe

    cp   $02                                         ; $5dd1: $fe $02
    ld   [bc], a                                     ; $5dd3: $02
    ld   [bc], a                                     ; $5dd4: $02
    ld   [bc], a                                     ; $5dd5: $02

    jr_09d_5dd6:
    cp   $fe                                         ; $5dd6: $fe $fe

    jr_09d_5dd8:
    inc  b                                           ; $5dd8: $04
    ld   [bc], a                                     ; $5dd9: $02

    jr_09d_5dda:
    ld   c, e                                        ; $5dda: $4b
    ld   c, d                                        ; $5ddb: $4a

    jr_09d_5ddc:
    ld   c, e                                        ; $5ddc: $4b
    ld   c, c                                        ; $5ddd: $49
    nop                                              ; $5dde: $00
    nop                                              ; $5ddf: $00
    nop                                              ; $5de0: $00
    nop                                              ; $5de1: $00
    nop                                              ; $5de2: $00
    nop                                              ; $5de3: $00
    nop                                              ; $5de4: $00
    nop                                              ; $5de5: $00

    jr_09d_5de6:
    nop                                              ; $5de6: $00
    nop                                              ; $5de7: $00

    jr_09d_5de8:
    ld   bc, $0700                                   ; $5de8: $01 $00 $07
    rlca                                             ; $5deb: $07

    jr_09d_5dec:
    ld   [bc], a                                     ; $5dec: $02
    ld   [bc], a                                     ; $5ded: $02
    rlca                                             ; $5dee: $07
    rlca                                             ; $5def: $07
    inc  bc                                          ; $5df0: $03
    ld   [bc], a                                     ; $5df1: $02
    rlca                                             ; $5df2: $07
    inc  bc                                          ; $5df3: $03
    rlca                                             ; $5df4: $07
    ld   b, $06                                      ; $5df5: $06 $06
    ld   b, $02                                      ; $5df7: $06 $02
    ld   [bc], a                                     ; $5df9: $02
    ld   [bc], a                                     ; $5dfa: $02
    ld   [bc], a                                     ; $5dfb: $02
    ld   [bc], a                                     ; $5dfc: $02
    ld   [bc], a                                     ; $5dfd: $02
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
    sub  b                                           ; $5e08: $90
    sub  b                                           ; $5e09: $90
    sub  b                                           ; $5e0a: $90
    db   $10                                         ; $5e0b: $10
    inc  d                                           ; $5e0c: $14
    db   $10                                         ; $5e0d: $10
    sub  [hl]                                        ; $5e0e: $96
    sub  h                                           ; $5e0f: $94
    ld   d, [hl]                                     ; $5e10: $56
    ld   d, d                                        ; $5e11: $52
    ld   d, [hl]                                     ; $5e12: $56
    ld   d, d                                        ; $5e13: $52
    ld   d, [hl]                                     ; $5e14: $56
    inc  d                                           ; $5e15: $14
    inc  e                                           ; $5e16: $1c
    inc  d                                           ; $5e17: $14
    inc  e                                           ; $5e18: $1c
    ld   [$1038], sp                                 ; $5e19: $08 $38 $10
    ld   [hl], b                                     ; $5e1c: $70
    ld   h, b                                        ; $5e1d: $60
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
    ld   [$0800], sp                                 ; $5e28: $08 $00 $08
    ld   [$0e1e], sp                                 ; $5e2b: $08 $1e $0e
    inc  a                                           ; $5e2e: $3c
    jr   c, jr_09d_5e49                              ; $5e2f: $38 $18

    db   $10                                         ; $5e31: $10
    ld   sp, $3110                                   ; $5e32: $31 $10 $31
    jr   nz, jr_09d_5e66                             ; $5e35: $20 $2f

    daa                                              ; $5e37: $27
    inc  l                                           ; $5e38: $2c
    ld   [$0809], sp                                 ; $5e39: $08 $09 $08
    rrca                                             ; $5e3c: $0f
    rlca                                             ; $5e3d: $07
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

    jr_09d_5e49:
    nop                                              ; $5e49: $00
    nop                                              ; $5e4a: $00
    nop                                              ; $5e4b: $00
    ldh  [$c0], a                                    ; $5e4c: $e0 $c0
    ld   h, b                                        ; $5e4e: $60
    jr   nz, jr_09d_5e51                             ; $5e4f: $20 $00

    jr_09d_5e51:
    nop                                              ; $5e51: $00
    add  b                                           ; $5e52: $80
    add  b                                           ; $5e53: $80
    add  b                                           ; $5e54: $80
    add  b                                           ; $5e55: $80
    ret  nz                                          ; $5e56: $c0

    add  b                                           ; $5e57: $80
    ldh  [$c0], a                                    ; $5e58: $e0 $c0
    and  b                                           ; $5e5a: $a0
    and  b                                           ; $5e5b: $a0
    add  b                                           ; $5e5c: $80
    nop                                              ; $5e5d: $00
    nop                                              ; $5e5e: $00
    nop                                              ; $5e5f: $00
    nop                                              ; $5e60: $00
    nop                                              ; $5e61: $00
    nop                                              ; $5e62: $00
    nop                                              ; $5e63: $00
    nop                                              ; $5e64: $00
    nop                                              ; $5e65: $00

    jr_09d_5e66:
    nop                                              ; $5e66: $00
    nop                                              ; $5e67: $00
    nop                                              ; $5e68: $00
    nop                                              ; $5e69: $00
    add  b                                           ; $5e6a: $80
    add  b                                           ; $5e6b: $80
    add  b                                           ; $5e6c: $80
    add  b                                           ; $5e6d: $80
    add  b                                           ; $5e6e: $80
    add  b                                           ; $5e6f: $80
    add  b                                           ; $5e70: $80
    add  b                                           ; $5e71: $80
    add  b                                           ; $5e72: $80
    add  b                                           ; $5e73: $80
    add  b                                           ; $5e74: $80
    add  b                                           ; $5e75: $80
    add  d                                           ; $5e76: $82
    add  d                                           ; $5e77: $82
    add  [hl]                                        ; $5e78: $86
    add  d                                           ; $5e79: $82
    adc  $84                                         ; $5e7a: $ce $84
    db   $fc                                         ; $5e7c: $fc
    ld   a, b                                        ; $5e7d: $78
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
    rrca                                             ; $5e8a: $0f
    ld   b, $1f                                      ; $5e8b: $06 $1f
    add  hl, bc                                      ; $5e8d: $09
    add  hl, sp                                      ; $5e8e: $39
    db   $10                                         ; $5e8f: $10
    ld   a, a                                        ; $5e90: $7f
    ld   l, a                                        ; $5e91: $6f
    nop                                              ; $5e92: $00
    nop                                              ; $5e93: $00
    ccf                                              ; $5e94: $3f
    ccf                                              ; $5e95: $3f
    jr   nz, jr_09d_5eb8                             ; $5e96: $20 $20

    jr   nz, jr_09d_5eba                             ; $5e98: $20 $20

    jr   nz, jr_09d_5ebc                             ; $5e9a: $20 $20

    ccf                                              ; $5e9c: $3f
    ccf                                              ; $5e9d: $3f
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
    ld   [bc], a                                     ; $5ea8: $02
    ld   [bc], a                                     ; $5ea9: $02
    ld   [bc], a                                     ; $5eaa: $02
    ld   [bc], a                                     ; $5eab: $02
    adc  [hl]                                        ; $5eac: $8e
    ld   c, $c2                                      ; $5ead: $0e $c2
    add  d                                           ; $5eaf: $82
    rst  $20                                         ; $5eb0: $e7
    ld   h, a                                        ; $5eb1: $67
    ld   c, $06                                      ; $5eb2: $0e $06
    adc  $ca                                         ; $5eb4: $ce $ca
    ld   c, d                                        ; $5eb6: $4a
    ld   c, d                                        ; $5eb7: $4a

    jr_09d_5eb8:
    ld   b, d                                        ; $5eb8: $42
    ld   b, d                                        ; $5eb9: $42

    jr_09d_5eba:
    ld   b, d                                        ; $5eba: $42
    ld   b, d                                        ; $5ebb: $42

    jr_09d_5ebc:
    jp   nz, $00c2                                   ; $5ebc: $c2 $c2 $00

    nop                                              ; $5ebf: $00
    nop                                              ; $5ec0: $00

    jr_09d_5ec1:
    nop                                              ; $5ec1: $00
    nop                                              ; $5ec2: $00
    nop                                              ; $5ec3: $00
    nop                                              ; $5ec4: $00
    nop                                              ; $5ec5: $00
    nop                                              ; $5ec6: $00
    nop                                              ; $5ec7: $00
    jr   nz, jr_09d_5eea                             ; $5ec8: $20 $20

    ld   a, h                                        ; $5eca: $7c
    inc  a                                           ; $5ecb: $3c
    call z, $2cc4                                    ; $5ecc: $cc $c4 $2c
    jr   z, @+$7e                                    ; $5ecf: $28 $7c

    jr   c, jr_09d_5ec1                              ; $5ed1: $38 $ee

    ld   b, h                                        ; $5ed3: $44
    add  $82                                         ; $5ed4: $c6 $82
    ld   a, h                                        ; $5ed6: $7c
    ld   a, h                                        ; $5ed7: $7c
    ld   b, h                                        ; $5ed8: $44
    ld   b, h                                        ; $5ed9: $44
    ld   b, h                                        ; $5eda: $44
    ld   b, h                                        ; $5edb: $44
    ld   a, h                                        ; $5edc: $7c
    ld   a, h                                        ; $5edd: $7c
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

    jr_09d_5eea:
    nop                                              ; $5eea: $00
    nop                                              ; $5eeb: $00
    nop                                              ; $5eec: $00
    nop                                              ; $5eed: $00
    nop                                              ; $5eee: $00
    nop                                              ; $5eef: $00
    ld   [$3870], sp                                 ; $5ef0: $08 $70 $38
    ld   [hl], b                                     ; $5ef3: $70
    jr   c, @+$72                                    ; $5ef4: $38 $70

    jr   c, @+$72                                    ; $5ef6: $38 $70

    jr   c, @+$72                                    ; $5ef8: $38 $70

    jr   c, @+$72                                    ; $5efa: $38 $70

    ld   a, b                                        ; $5efc: $78
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
    ld   a, a                                        ; $5f40: $7f
    nop                                              ; $5f41: $00
    ld   e, e                                        ; $5f42: $5b
    inc  a                                           ; $5f43: $3c
    dec  a                                           ; $5f44: $3d
    ld   a, [hl]                                     ; $5f45: $7e
    ld   h, [hl]                                     ; $5f46: $66
    ld   h, [hl]                                     ; $5f47: $66
    ld   l, [hl]                                     ; $5f48: $6e
    ld   h, [hl]                                     ; $5f49: $66
    ld   l, [hl]                                     ; $5f4a: $6e
    ld   h, [hl]                                     ; $5f4b: $66
    ld   [$4c66], sp                                 ; $5f4c: $08 $66 $4c
    nop                                              ; $5f4f: $00
    ld   [$6e66], sp                                 ; $5f50: $08 $66 $6e
    ld   h, [hl]                                     ; $5f53: $66
    ld   l, [hl]                                     ; $5f54: $6e
    ld   h, [hl]                                     ; $5f55: $66
    ld   l, [hl]                                     ; $5f56: $6e
    ld   h, [hl]                                     ; $5f57: $66
    inc  a                                           ; $5f58: $3c
    ld   a, [hl]                                     ; $5f59: $7e
    ld   e, c                                        ; $5f5a: $59
    inc  a                                           ; $5f5b: $3c
    ld   b, e                                        ; $5f5c: $43
    nop                                              ; $5f5d: $00
    nop                                              ; $5f5e: $00
    nop                                              ; $5f5f: $00
    ld   a, a                                        ; $5f60: $7f
    nop                                              ; $5f61: $00
    ld   a, a                                        ; $5f62: $7f
    ld   c, $7e                                      ; $5f63: $0e $7e
    ld   c, $76                                      ; $5f65: $0e $76
    ld   b, $7e                                      ; $5f67: $06 $7e
    ld   b, $7e                                      ; $5f69: $06 $7e
    ld   b, $78                                      ; $5f6b: $06 $78
    ld   b, $7c                                      ; $5f6d: $06 $7c
    nop                                              ; $5f6f: $00
    ld   a, b                                        ; $5f70: $78
    ld   b, $7e                                      ; $5f71: $06 $7e
    ld   b, $7e                                      ; $5f73: $06 $7e
    ld   b, $7e                                      ; $5f75: $06 $7e
    ld   b, $7e                                      ; $5f77: $06 $7e
    ld   b, $7e                                      ; $5f79: $06 $7e
    ld   b, $79                                      ; $5f7b: $06 $79
    nop                                              ; $5f7d: $00
    nop                                              ; $5f7e: $00
    nop                                              ; $5f7f: $00
    ld   a, a                                        ; $5f80: $7f
    nop                                              ; $5f81: $00
    ld   a, e                                        ; $5f82: $7b
    ld   a, h                                        ; $5f83: $7c
    ld   a, l                                        ; $5f84: $7d
    ld   a, [hl]                                     ; $5f85: $7e
    ld   b, [hl]                                     ; $5f86: $46
    ld   b, $7e                                      ; $5f87: $06 $7e
    ld   b, $7e                                      ; $5f89: $06 $7e
    ld   b, $78                                      ; $5f8b: $06 $78
    ld   b, $7c                                      ; $5f8d: $06 $7c
    nop                                              ; $5f8f: $00
    ld   b, c                                        ; $5f90: $41
    inc  a                                           ; $5f91: $3c
    inc  sp                                          ; $5f92: $33
    ld   h, b                                        ; $5f93: $60
    ld   l, a                                        ; $5f94: $6f
    ld   h, b                                        ; $5f95: $60
    ld   l, a                                        ; $5f96: $6f
    ld   h, b                                        ; $5f97: $60
    ld   a, a                                        ; $5f98: $7f
    ld   a, [hl]                                     ; $5f99: $7e
    ld   a, [hl]                                     ; $5f9a: $7e
    ld   a, [hl]                                     ; $5f9b: $7e
    ld   b, b                                        ; $5f9c: $40
    nop                                              ; $5f9d: $00
    nop                                              ; $5f9e: $00
    nop                                              ; $5f9f: $00
    ld   a, a                                        ; $5fa0: $7f
    nop                                              ; $5fa1: $00
    ld   a, e                                        ; $5fa2: $7b
    ld   a, h                                        ; $5fa3: $7c
    ld   a, l                                        ; $5fa4: $7d
    ld   a, [hl]                                     ; $5fa5: $7e
    ld   b, [hl]                                     ; $5fa6: $46
    ld   b, $7e                                      ; $5fa7: $06 $7e
    ld   b, $7e                                      ; $5fa9: $06 $7e
    ld   b, $41                                      ; $5fab: $06 $41
    inc  a                                           ; $5fad: $3c
    ld   h, e                                        ; $5fae: $63
    nop                                              ; $5faf: $00
    ld   b, e                                        ; $5fb0: $43
    inc  a                                           ; $5fb1: $3c
    ld   a, [hl]                                     ; $5fb2: $7e
    ld   b, $7e                                      ; $5fb3: $06 $7e
    ld   b, $7e                                      ; $5fb5: $06 $7e
    ld   b, $7c                                      ; $5fb7: $06 $7c
    ld   a, [hl]                                     ; $5fb9: $7e
    ld   a, c                                        ; $5fba: $79
    ld   a, h                                        ; $5fbb: $7c
    ld   b, e                                        ; $5fbc: $43
    nop                                              ; $5fbd: $00
    nop                                              ; $5fbe: $00
    nop                                              ; $5fbf: $00
    rst  $38                                         ; $5fc0: $ff
    nop                                              ; $5fc1: $00
    rst  $38                                         ; $5fc2: $ff
    ld   h, [hl]                                     ; $5fc3: $66
    xor  $66                                         ; $5fc4: $ee $66
    xor  $66                                         ; $5fc6: $ee $66
    xor  $66                                         ; $5fc8: $ee $66
    xor  $66                                         ; $5fca: $ee $66
    add  b                                           ; $5fcc: $80
    ld   a, [hl]                                     ; $5fcd: $7e
    ret  nz                                          ; $5fce: $c0

    nop                                              ; $5fcf: $00
    add  b                                           ; $5fd0: $80
    ld   a, [hl]                                     ; $5fd1: $7e
    add  $06                                         ; $5fd2: $c6 $06
    cp   $06                                         ; $5fd4: $fe $06
    cp   $06                                         ; $5fd6: $fe $06
    cp   $06                                         ; $5fd8: $fe $06
    cp   $06                                         ; $5fda: $fe $06
    db   $fc                                         ; $5fdc: $fc
    nop                                              ; $5fdd: $00
    nop                                              ; $5fde: $00
    nop                                              ; $5fdf: $00
    rst  $38                                         ; $5fe0: $ff
    nop                                              ; $5fe1: $00
    rst  $38                                         ; $5fe2: $ff
    ld   a, $fe                                      ; $5fe3: $3e $fe
    ld   a, [hl]                                     ; $5fe5: $7e
    ldh  [$60], a                                    ; $5fe6: $e0 $60
    rst  $28                                         ; $5fe8: $ef
    ld   h, b                                        ; $5fe9: $60
    rst  $28                                         ; $5fea: $ef
    ld   h, b                                        ; $5feb: $60
    add  e                                           ; $5fec: $83
    ld   a, h                                        ; $5fed: $7c
    pop  bc                                          ; $5fee: $c1
    nop                                              ; $5fef: $00
    add  b                                           ; $5ff0: $80
    ld   a, [hl]                                     ; $5ff1: $7e
    adc  $06                                         ; $5ff2: $ce $06
    cp   $06                                         ; $5ff4: $fe $06
    cp   $06                                         ; $5ff6: $fe $06
    db   $fc                                         ; $5ff8: $fc
    ld   a, [hl]                                     ; $5ff9: $7e
    ld   sp, hl                                      ; $5ffa: $f9
    ld   a, h                                        ; $5ffb: $7c
    jp   $0000                                      ; $5ffc: $c3 $00 $00


    nop                                              ; $5fff: $00
    rst  $38                                         ; $6000: $ff
    nop                                              ; $6001: $00
    rst  $18                                         ; $6002: $df
    ld   a, $be                                      ; $6003: $3e $be
    ld   a, [hl]                                     ; $6005: $7e
    ldh  a, [$60]                                    ; $6006: $f0 $60
    rst  $28                                         ; $6008: $ef
    ld   h, b                                        ; $6009: $60
    rst  $28                                         ; $600a: $ef
    ld   h, b                                        ; $600b: $60
    add  e                                           ; $600c: $83
    ld   a, h                                        ; $600d: $7c
    pop  bc                                          ; $600e: $c1
    nop                                              ; $600f: $00
    add  b                                           ; $6010: $80
    ld   a, [hl]                                     ; $6011: $7e
    xor  $66                                         ; $6012: $ee $66
    xor  $66                                         ; $6014: $ee $66
    xor  $66                                         ; $6016: $ee $66
    cp   h                                           ; $6018: $bc
    ld   a, [hl]                                     ; $6019: $7e
    reti                                             ; $601a: $d9


    inc  a                                           ; $601b: $3c
    db   $e3                                         ; $601c: $e3
    nop                                              ; $601d: $00
    nop                                              ; $601e: $00
    nop                                              ; $601f: $00
    rst  $38                                         ; $6020: $ff
    nop                                              ; $6021: $00
    rst  $38                                         ; $6022: $ff
    ld   a, [hl]                                     ; $6023: $7e
    cp   $7e                                         ; $6024: $fe $7e
    add  $06                                         ; $6026: $c6 $06
    cp   $06                                         ; $6028: $fe $06
    cp   $06                                         ; $602a: $fe $06
    ld   hl, sp+$06                                  ; $602c: $f8 $06
    db   $fc                                         ; $602e: $fc
    nop                                              ; $602f: $00
    ld   sp, hl                                      ; $6030: $f9
    ld   b, $fe                                      ; $6031: $06 $fe
    ld   b, $fe                                      ; $6033: $06 $fe
    ld   b, $fe                                      ; $6035: $06 $fe
    ld   b, $fe                                      ; $6037: $06 $fe
    ld   b, $fe                                      ; $6039: $06 $fe
    ld   b, $fc                                      ; $603b: $06 $fc
    nop                                              ; $603d: $00
    nop                                              ; $603e: $00
    nop                                              ; $603f: $00
    rst  $38                                         ; $6040: $ff
    nop                                              ; $6041: $00
    db   $db                                         ; $6042: $db
    inc  a                                           ; $6043: $3c
    cp   l                                           ; $6044: $bd
    ld   a, [hl]                                     ; $6045: $7e
    and  $66                                         ; $6046: $e6 $66
    xor  $66                                         ; $6048: $ee $66
    xor  [hl]                                        ; $604a: $ae
    ld   h, [hl]                                     ; $604b: $66
    jp   nz, $e13c                                   ; $604c: $c2 $3c $e1

    nop                                              ; $604f: $00
    jp   $a53c                                       ; $6050: $c3 $3c $a5


    ld   h, [hl]                                     ; $6053: $66
    xor  $66                                         ; $6054: $ee $66
    xor  $66                                         ; $6056: $ee $66
    cp   h                                           ; $6058: $bc
    ld   a, [hl]                                     ; $6059: $7e
    reti                                             ; $605a: $d9


    inc  a                                           ; $605b: $3c
    db   $e3                                         ; $605c: $e3
    nop                                              ; $605d: $00
    nop                                              ; $605e: $00
    nop                                              ; $605f: $00
    rst  $38                                         ; $6060: $ff
    nop                                              ; $6061: $00
    db   $db                                         ; $6062: $db
    inc  a                                           ; $6063: $3c
    cp   l                                           ; $6064: $bd
    ld   a, [hl]                                     ; $6065: $7e
    and  $66                                         ; $6066: $e6 $66
    xor  $66                                         ; $6068: $ee $66
    xor  $66                                         ; $606a: $ee $66
    add  b                                           ; $606c: $80
    ld   a, [hl]                                     ; $606d: $7e
    ret  nz                                          ; $606e: $c0

    nop                                              ; $606f: $00
    pop  bc                                          ; $6070: $c1
    ld   a, $e6                                      ; $6071: $3e $e6
    ld   b, $fe                                      ; $6073: $06 $fe
    ld   b, $fe                                      ; $6075: $06 $fe
    ld   b, $fc                                      ; $6077: $06 $fc
    ld   a, [hl]                                     ; $6079: $7e
    ld   sp, hl                                      ; $607a: $f9
    ld   a, h                                        ; $607b: $7c
    jp   $0000                                      ; $607c: $c3 $00 $00


    nop                                              ; $607f: $00
    ld   a, a                                        ; $6080: $7f
    nop                                              ; $6081: $00
    ld   a, a                                        ; $6082: $7f
    nop                                              ; $6083: $00
    ld   a, a                                        ; $6084: $7f
    inc  b                                           ; $6085: $04
    ld   a, l                                        ; $6086: $7d

    jr_09d_6087:
    ld   [$385b], sp                                 ; $6087: $08 $5b $38
    ld   l, e                                        ; $608a: $6b
    ld   [$3e7d], sp                                 ; $608b: $08 $7d $3e
    ld   l, h                                        ; $608e: $6c
    ld   [$1d6e], sp                                 ; $608f: $08 $6e $1d
    ld   e, l                                        ; $6092: $5d
    inc  a                                           ; $6093: $3c
    ld   l, c                                        ; $6094: $69
    jr   z, jr_09d_60f2                              ; $6095: $28 $5b

    ld   [$087b], sp                                 ; $6097: $08 $7b $08
    ld   a, e                                        ; $609a: $7b
    nop                                              ; $609b: $00
    ld   a, a                                        ; $609c: $7f

    jr_09d_609d:
    nop                                              ; $609d: $00

    Jump_09d_609e:
    nop                                              ; $609e: $00
    nop                                              ; $609f: $00
    cp   $00                                         ; $60a0: $fe $00
    cp   $00                                         ; $60a2: $fe $00
    sbc  $20                                         ; $60a4: $de $20
    xor  $20                                         ; $60a6: $ee $20
    xor  $20                                         ; $60a8: $ee $20
    xor  $a8                                         ; $60aa: $ee $a8
    and  h                                           ; $60ac: $a4
    xor  h                                           ; $60ad: $ac
    xor  h                                           ; $60ae: $ac
    and  h                                           ; $60af: $a4
    and  h                                           ; $60b0: $a4
    xor  b                                           ; $60b1: $a8
    ld   e, d                                        ; $60b2: $5a
    jr   z, jr_09d_6087                              ; $60b3: $28 $d2

    jr   c, jr_09d_609d                              ; $60b5: $38 $e6

    jr   nc, jr_09d_6107                             ; $60b7: $30 $4e

    ldh  [$9e], a                                    ; $60b9: $e0 $9e
    nop                                              ; $60bb: $00
    cp   $00                                         ; $60bc: $fe $00
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
    jr   nz, jr_09d_60f4                             ; $60d2: $20 $20

    ld   a, $34                                      ; $60d4: $3e $34
    ld   a, [hl+]                                    ; $60d6: $2a
    ld   a, [hl+]                                    ; $60d7: $2a
    ld   a, [hl+]                                    ; $60d8: $2a
    ld   a, [hl+]                                    ; $60d9: $2a
    ld   a, [hl+]                                    ; $60da: $2a
    ld   a, [hl+]                                    ; $60db: $2a
    ld   a, [hl+]                                    ; $60dc: $2a
    ld   a, [hl+]                                    ; $60dd: $2a
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

    jr_09d_60f2:
    nop                                              ; $60f2: $00
    nop                                              ; $60f3: $00

    jr_09d_60f4:
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

    jr_09d_6107:
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
    jr   jr_09d_6186                                 ; $6148: $18 $3c

    inc  h                                           ; $614a: $24
    ld   h, [hl]                                     ; $614b: $66
    ld   h, [hl]                                     ; $614c: $66
    ld   h, [hl]                                     ; $614d: $66
    ld   h, [hl]                                     ; $614e: $66
    ld   h, [hl]                                     ; $614f: $66
    ld   h, [hl]                                     ; $6150: $66
    ld   h, [hl]                                     ; $6151: $66
    ld   h, [hl]                                     ; $6152: $66
    ld   h, [hl]                                     ; $6153: $66
    ld   h, [hl]                                     ; $6154: $66
    ld   h, [hl]                                     ; $6155: $66
    ld   h, [hl]                                     ; $6156: $66
    ld   h, [hl]                                     ; $6157: $66
    ld   h, [hl]                                     ; $6158: $66
    ld   h, [hl]                                     ; $6159: $66
    inc  h                                           ; $615a: $24
    ld   h, [hl]                                     ; $615b: $66
    jr   jr_09d_619a                                 ; $615c: $18 $3c

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
    ld   [bc], a                                     ; $6169: $02
    ld   b, $0e                                      ; $616a: $06 $0e
    ld   b, $06                                      ; $616c: $06 $06
    ld   b, $06                                      ; $616e: $06 $06
    ld   b, $06                                      ; $6170: $06 $06
    ld   b, $06                                      ; $6172: $06 $06
    ld   b, $06                                      ; $6174: $06 $06
    ld   b, $06                                      ; $6176: $06 $06
    ld   b, $06                                      ; $6178: $06 $06
    ld   b, $06                                      ; $617a: $06 $06
    ld   b, $06                                      ; $617c: $06 $06
    nop                                              ; $617e: $00
    nop                                              ; $617f: $00
    nop                                              ; $6180: $00
    nop                                              ; $6181: $00
    nop                                              ; $6182: $00
    nop                                              ; $6183: $00
    nop                                              ; $6184: $00
    nop                                              ; $6185: $00

    jr_09d_6186:
    nop                                              ; $6186: $00
    nop                                              ; $6187: $00
    jr   jr_09d_61c6                                 ; $6188: $18 $3c

    inc  h                                           ; $618a: $24
    ld   h, [hl]                                     ; $618b: $66
    ld   h, [hl]                                     ; $618c: $66
    ld   h, [hl]                                     ; $618d: $66
    ld   b, $06                                      ; $618e: $06 $06
    inc  b                                           ; $6190: $04
    ld   b, $0c                                      ; $6191: $06 $0c
    inc  c                                           ; $6193: $0c
    jr   jr_09d_61ae                                 ; $6194: $18 $18

    jr   nc, jr_09d_61c8                             ; $6196: $30 $30

    jr   nz, jr_09d_61fa                             ; $6198: $20 $60

    jr_09d_619a:
    ld   h, b                                        ; $619a: $60
    ld   h, b                                        ; $619b: $60
    ld   a, [hl]                                     ; $619c: $7e
    ld   a, [hl]                                     ; $619d: $7e
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
    jr   jr_09d_61e6                                 ; $61a8: $18 $3c

    inc  h                                           ; $61aa: $24
    ld   h, [hl]                                     ; $61ab: $66
    ld   h, [hl]                                     ; $61ac: $66
    ld   h, [hl]                                     ; $61ad: $66

    jr_09d_61ae:
    ld   b, $06                                      ; $61ae: $06 $06
    inc  b                                           ; $61b0: $04
    ld   b, $38                                      ; $61b1: $06 $38
    inc  a                                           ; $61b3: $3c
    inc  b                                           ; $61b4: $04
    ld   b, $06                                      ; $61b5: $06 $06
    ld   b, $66                                      ; $61b7: $06 $66
    ld   h, [hl]                                     ; $61b9: $66
    inc  h                                           ; $61ba: $24
    ld   h, [hl]                                     ; $61bb: $66
    jr   jr_09d_61fa                                 ; $61bc: $18 $3c

    nop                                              ; $61be: $00
    nop                                              ; $61bf: $00
    nop                                              ; $61c0: $00
    nop                                              ; $61c1: $00
    nop                                              ; $61c2: $00
    nop                                              ; $61c3: $00
    nop                                              ; $61c4: $00
    nop                                              ; $61c5: $00

    jr_09d_61c6:
    nop                                              ; $61c6: $00
    nop                                              ; $61c7: $00

    jr_09d_61c8:
    inc  c                                           ; $61c8: $0c
    inc  c                                           ; $61c9: $0c
    inc  c                                           ; $61ca: $0c
    inc  e                                           ; $61cb: $1c
    inc  e                                           ; $61cc: $1c
    inc  e                                           ; $61cd: $1c
    inc  e                                           ; $61ce: $1c
    inc  a                                           ; $61cf: $3c
    inc  l                                           ; $61d0: $2c
    inc  l                                           ; $61d1: $2c
    inc  l                                           ; $61d2: $2c
    ld   l, h                                        ; $61d3: $6c
    ld   l, h                                        ; $61d4: $6c
    ld   l, h                                        ; $61d5: $6c
    ld   l, h                                        ; $61d6: $6c
    ld   l, h                                        ; $61d7: $6c
    ld   a, [hl]                                     ; $61d8: $7e
    ld   a, [hl]                                     ; $61d9: $7e
    inc  c                                           ; $61da: $0c
    inc  c                                           ; $61db: $0c
    inc  c                                           ; $61dc: $0c
    inc  c                                           ; $61dd: $0c
    nop                                              ; $61de: $00
    nop                                              ; $61df: $00
    nop                                              ; $61e0: $00
    nop                                              ; $61e1: $00
    nop                                              ; $61e2: $00
    nop                                              ; $61e3: $00
    nop                                              ; $61e4: $00
    nop                                              ; $61e5: $00

    jr_09d_61e6:
    nop                                              ; $61e6: $00
    nop                                              ; $61e7: $00
    ld   a, [hl]                                     ; $61e8: $7e
    ld   a, [hl]                                     ; $61e9: $7e
    ld   h, b                                        ; $61ea: $60
    ld   h, b                                        ; $61eb: $60
    ld   h, b                                        ; $61ec: $60
    ld   h, b                                        ; $61ed: $60
    ld   h, b                                        ; $61ee: $60
    ld   h, b                                        ; $61ef: $60
    ld   h, b                                        ; $61f0: $60
    ld   h, b                                        ; $61f1: $60
    ld   a, b                                        ; $61f2: $78
    ld   a, h                                        ; $61f3: $7c
    inc  b                                           ; $61f4: $04
    ld   b, $06                                      ; $61f5: $06 $06
    ld   b, $66                                      ; $61f7: $06 $66
    ld   h, [hl]                                     ; $61f9: $66

    jr_09d_61fa:
    inc  h                                           ; $61fa: $24
    ld   h, [hl]                                     ; $61fb: $66
    jr   @+$3e                                       ; $61fc: $18 $3c

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
    jr   jr_09d_6246                                 ; $6208: $18 $3c

    inc  h                                           ; $620a: $24
    ld   h, [hl]                                     ; $620b: $66
    ld   h, [hl]                                     ; $620c: $66
    ld   h, [hl]                                     ; $620d: $66
    ld   h, b                                        ; $620e: $60
    ld   h, b                                        ; $620f: $60
    ld   h, b                                        ; $6210: $60
    ld   h, b                                        ; $6211: $60
    ld   a, b                                        ; $6212: $78
    ld   a, h                                        ; $6213: $7c
    ld   h, h                                        ; $6214: $64
    ld   h, [hl]                                     ; $6215: $66
    ld   h, [hl]                                     ; $6216: $66
    ld   h, [hl]                                     ; $6217: $66
    ld   h, [hl]                                     ; $6218: $66
    ld   h, [hl]                                     ; $6219: $66
    inc  h                                           ; $621a: $24
    ld   h, [hl]                                     ; $621b: $66
    jr   jr_09d_625a                                 ; $621c: $18 $3c

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
    ld   a, [hl]                                     ; $6228: $7e
    ld   a, [hl]                                     ; $6229: $7e
    ld   [bc], a                                     ; $622a: $02
    ld   b, $04                                      ; $622b: $06 $04
    ld   b, $04                                      ; $622d: $06 $04
    inc  c                                           ; $622f: $0c
    ld   [$080c], sp                                 ; $6230: $08 $0c $08
    jr   jr_09d_624d                                 ; $6233: $18 $18

    jr   jr_09d_624f                                 ; $6235: $18 $18

    jr   jr_09d_6251                                 ; $6237: $18 $18

    jr   @+$1a                                       ; $6239: $18 $18

    jr   jr_09d_6255                                 ; $623b: $18 $18

    jr   jr_09d_623f                                 ; $623d: $18 $00

    jr_09d_623f:
    nop                                              ; $623f: $00
    nop                                              ; $6240: $00
    nop                                              ; $6241: $00
    nop                                              ; $6242: $00
    nop                                              ; $6243: $00
    nop                                              ; $6244: $00
    nop                                              ; $6245: $00

    jr_09d_6246:
    nop                                              ; $6246: $00
    nop                                              ; $6247: $00
    jr   jr_09d_6286                                 ; $6248: $18 $3c

    inc  h                                           ; $624a: $24
    ld   h, [hl]                                     ; $624b: $66
    ld   h, [hl]                                     ; $624c: $66

    jr_09d_624d:
    ld   h, [hl]                                     ; $624d: $66
    ld   h, [hl]                                     ; $624e: $66

    jr_09d_624f:
    ld   h, [hl]                                     ; $624f: $66
    inc  h                                           ; $6250: $24

    jr_09d_6251:
    ld   h, [hl]                                     ; $6251: $66
    jr   jr_09d_6290                                 ; $6252: $18 $3c

    inc  h                                           ; $6254: $24

    jr_09d_6255:
    ld   h, [hl]                                     ; $6255: $66
    ld   h, [hl]                                     ; $6256: $66
    ld   h, [hl]                                     ; $6257: $66
    ld   h, [hl]                                     ; $6258: $66
    ld   h, [hl]                                     ; $6259: $66

    jr_09d_625a:
    inc  h                                           ; $625a: $24
    ld   h, [hl]                                     ; $625b: $66
    jr   jr_09d_629a                                 ; $625c: $18 $3c

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
    jr   jr_09d_62a6                                 ; $6268: $18 $3c

    inc  h                                           ; $626a: $24
    ld   h, [hl]                                     ; $626b: $66
    ld   h, [hl]                                     ; $626c: $66
    ld   h, [hl]                                     ; $626d: $66
    ld   h, [hl]                                     ; $626e: $66
    ld   h, [hl]                                     ; $626f: $66
    ld   h, $66                                      ; $6270: $26 $66
    ld   e, $3e                                      ; $6272: $1e $3e
    ld   b, $06                                      ; $6274: $06 $06
    ld   b, $06                                      ; $6276: $06 $06
    ld   h, [hl]                                     ; $6278: $66
    ld   h, [hl]                                     ; $6279: $66
    inc  h                                           ; $627a: $24
    ld   h, [hl]                                     ; $627b: $66
    jr   jr_09d_62ba                                 ; $627c: $18 $3c

    nop                                              ; $627e: $00
    nop                                              ; $627f: $00
    nop                                              ; $6280: $00
    nop                                              ; $6281: $00
    nop                                              ; $6282: $00
    nop                                              ; $6283: $00
    nop                                              ; $6284: $00
    nop                                              ; $6285: $00

    jr_09d_6286:
    nop                                              ; $6286: $00
    nop                                              ; $6287: $00
    nop                                              ; $6288: $00
    nop                                              ; $6289: $00
    nop                                              ; $628a: $00
    nop                                              ; $628b: $00
    nop                                              ; $628c: $00
    nop                                              ; $628d: $00
    ld   l, h                                        ; $628e: $6c
    ld   b, h                                        ; $628f: $44

    jr_09d_6290:
    ld   a, h                                        ; $6290: $7c
    jr   z, jr_09d_62cb                              ; $6291: $28 $38

    db   $10                                         ; $6293: $10
    ld   a, h                                        ; $6294: $7c
    jr   z, jr_09d_6303                              ; $6295: $28 $6c

    ld   b, h                                        ; $6297: $44
    nop                                              ; $6298: $00
    nop                                              ; $6299: $00

    jr_09d_629a:
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

    jr_09d_62a6:
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

    jr_09d_62ba:
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

    jr_09d_62cb:
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

    jr_09d_6303:
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
