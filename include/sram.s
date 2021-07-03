INCLUDE "includes.s"

SECTION "SRAM", SRAM[$a000], BANK[$0]

sa000:
    ds 4

; $38, $12
sSpecialBytes:: ; $a004
    dw

sChecksum:: ; $a006
    dw

sSaveDataStart:: ; $a008
    ds $310
.end::