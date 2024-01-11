
org $2000

entry:
	call screen_setup
	ret

ink_table:
	; border (red), then system defaults, mostly
	defb 3, 0, 24, 20, 6, 26, 0, 2, 8, 10, 12, 14, 16, 18, 22, 24, 11

tile_table:
	defs (16*256), 0

include "../inc/jumpblock.inc"

include "../lib/set_ink_list.asm"

screen_setup:
				; Set mode 0
	LD A, 0
	CALL SCR_SET_MODE

				; Populate default ink table
	LD HL, ink_table
	LD B, 17
	CALL populate_ink_list

	RET
