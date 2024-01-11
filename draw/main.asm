include "../inc/jumpblock.inc"
include "cmds.asm"

org $8000

entry:
	ret

fill_buffer_address: DEFS 64, 0
fill_buffer_len: EQU 64

include "screen.asm"
include "draw.asm"

