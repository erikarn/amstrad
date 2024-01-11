

; pixel layout
; mode 2
; 01234567
; mode 1
; 01230123
; mode 0
; 00221133

; default mode 0 colours
; 0 - blue (0000)
; 1 - yellow (0001)
; 2 - cyan (0010)
; 3 - red (0011)
; 4 - white (0100)
; 5 - black (0101)
; 6 - blue 2 (0110)
; 7 - magenta (0111)
; 8 - grey? (1000)
; 9 - dark yellow (1001)
; 10 - blue/red ? (1010)
; 11 - pink (1011)
; 12 - green (1100)
; 13 - light green (1101)
; 14 - blinking (1110)
; 15 - blinking (1111)

; Display a tile at the given character screen location.
;
; This is designed to be similar to normal character output, but
; the tiles are multi-coloured, not monochrome.
;
; Each tile is 2 bytes wide * 8 bytes high. This is regardless of
; mode, making it a bit trickier to pass in an X and Y value.
;
; Using 2 bytes wide * 8 bytes high tiles means we're a MODE 1
; character wide.  so for MODE 0 we're only filling half the
; character space, and MODE 2 we'd be filling two characters.
; So we can't "just" use this for MODE 0, we need to add our own
; start offset based on how wide our tiles are.
;
; For now this is optimised for clarity and not speed.
;

; tile_display:
;
; DE - source buffer = 16 bytes
; L = screen row character (0..24)
; H = screen column (0..39)
;
tile_display:
  LD HL, &0000 ; For now, we're going to display at character 0, 0.
  LD C, 8 ; How many rows we're going to display
  LD DE, tile1; Source address of tile

  LD A, H ; keep a copy of the column in A

  PUSH BC
  PUSH AF
  PUSH DE
  LD H, 0 ; Get start of line position  
  CALL SCR_CHAR_POSITION
  POP DE
  POP AF ; A now has start column
  ADD A, A ; shift left by one - 2 bytes per column
  LD B, 0
  LD C, A
  ADC HL, BC ; HL is now start of line, right row + (column * 2, 2 byte wide tile)
  POP BC

line_loop:
  PUSH HL
  ; Render the two bytes for the given position.
  ; If we were a general sprite routine then this'd be our
  ; inner loop, but we don't have an inner loop!
  LD A, (DE)
  LD (HL), A
  INC DE
  INC HL
  LD A, (DE)
  LD (HL), A
  ; Note - dont need INC HL here as we will be
  ; immediately jumping to the next line.
  INC DE
  INC HL

  ; Jump to next line
  POP HL
  ; .. just use the firmware, why not
  CALL SCR_NEXT_LINE

  ; Yes I'm not using B for the loop, in case I wanted to support
  ; different tile widths besides "2"
  DEC C
  JR NZ, line_loop
  RET

tile1:
defb %11100001, %11011000
defb %01110011, %11110011
defb %11110011, %01110011
defb %01110011, %11110011
defb %11110011, %01110011
defb %01110011, %11110011
defb %11110011, %01110011
defb %01110011, %11110011

 
