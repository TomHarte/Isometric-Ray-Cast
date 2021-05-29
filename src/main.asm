	org $8000

	;
	; Defines the number of rows calculated and drawn.
	;
	num_rows equ 14

	INCLUDE "src/tiles.inc"
	INCLUDE "src/drawtiles.asm"
	INCLUDE "src/addressmanipulation.asm"
	INCLUDE "src/cast.asm"
	INCLUDE "src/scroll.asm"


;
;	Main entry point. Just a test loop for now.
;

start:
	di
	ld sp, highest_bit_table

	; Establish initial map state
	call cast_map

display:
	call draw_tiles

	;
	; Check for a scroll...
	;

	; Copy P and O to left and right.
	ld bc, 0xdffe
	in a, (c)
	and #3
	ld d, a

	; Check for down.
	ld bc, 0xfdfe
	in a, (c)
	rra
	rl d

	; Check for up.
	ld bc, 0xfbfe
	in a, (c)
	rra
	rl d

	; Shift once more, include joystick controls and scroll
	rl d
	ld bc, 0xeffe
	in a, (c)
	and d
	call scroll

	;
	; ... and repeat
	;
	jp display

;
;	A table that maps from x to the value of the highest bit in x.
;

	org $bf00
highest_bit_table:
	db 0, 1, 2, 2, 4, 4, 4, 4, 8, 8, 8, 8, 8, 8, 8, 8, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128

;
;	The original Ant Attack map data. 16kb of it.
;	It's a 128x128 grid of bytes, each has a bit set or
;	clear to indicate presence or absence of a block,
;	with the lsb being closest to the ground.
;

	org $c000
	
map:
	INCBIN "res/mapswizzle.dat"

end start	; stop generating code, use 'start' as the entry-point
