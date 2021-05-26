	org $8000

	;
	; Defines the number of rows calculated and drawn.
	;
	num_rows equ 24

	INCLUDE "src/tiles.inc"
	INCLUDE "src/drawtiles.asm"
	INCLUDE "src/addressmanipulation.asm"
	INCLUDE "src/cast.asm"

;
;	Main entry point. Just a test loop for now.
;

start:
	di
	ld sp, highest_bit_table

display:
	call cast_map
	call draw_tiles

	; Read keyboard to scroll.
	ld hl, (map_location)

	ld bc, 0xfbfe
	in a, (c)
	rra
	jr c, _no_q
	dec_y

_no_q:
	ld bc, 0xfdfe
	in a, (c)
	rra
	jr c, _no_a
	inc_y
	
_no_a:
	ld bc, 0xdffe
	in a, (c)
	rra
	jr c, _no_p
	inc_x
	
_no_p:
	ld bc, 0xdffe
	in a, (c)
	rra
	rra
	jr c, _no_o
	dec_x

_no_o:

	ld (map_location), hl	
	jr display

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
