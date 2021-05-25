	org $8000

	;
	; Defines the number of rows calculated and drawn.
	;
	num_rows equ 24

	INCLUDE "src/tiles.inc"
	INCLUDE "src/drawtiles.asm"


;
;	Map address manipulation macros.
;
;	Map addresses are in the form:
;
;		11 yyyyyyy xxxxxxx
;
;	[inc_dec]_[x/y] then increment or decrement the x or y fields,
;	without altering the others.
;
dec_y MACRO
	rl l
	dec l
	dec l
	rr l		; = 24
ENDM

inc_y MACRO
	rl l
	inc l
	inc l
	rr l		; = 24
ENDM

inc_x MACRO
	ld a, 0x80	; 7
	add a, l	; 4
	ld l, a		; 4
	ld a, 0x00	; 7
	adc a, h	; 4
	or 0xc0		; 7
	ld h, a		; 4	= 37
ENDM

dec_x MACRO
	ld a, 0x80	; 7
	add a, l	; 4
	ld l, a		; 4
	ld a, 0xff	; 7
	adc a, h	; 4
	or 0xc0		; 7
	ld h, a		; 4	= 37
ENDM

;
;	Casts for a single triangle pair, returning the left result in L, the right in H;
;	in both cases the result generated will be the relevant colour, ANDed with the mask.
;
;	Upon entry:
;
;		L = x coordinate to cast for.
;		H = y coordinate to cast for.
;
;	Both are in the range [0, 127]
;

cast MACRO mask
	; Read from (x, y).
	ld b, (hl)		; i.e. b = 'front'.
	
	; Read from (x-1, y).
	dec_x
	ld c, (hl)		; i.e. c = 'left'.

	; Read from (x-1, y-1).
	dec_y
	ld d, (hl)		; i.e. d = 'back'.

	; Read from (x, y-1)
	inc_x
	ld e, (hl)		; i.e. e = 'right'.

	; Reduce all to highest bis.
	ld h, highest_bit_table >> 8
	ld l, b
	ld b, (hl)
	ld l, c
	ld c, (hl)
	ld l, e
	ld e, (hl)
	ld l, d
	ld d, (hl)

	; Test for floor.
	ld a, b
	or d
	or c
	jr nz, _not_floor_left

		; If here: front = left = back = 0, i.e. the floor plane was hit
		ld l, 0x00 & mask
		jr _pick_right

_not_floor_left:
	ld a, b
	cp c					; Compare front sub left.
	jr nc, _front_ge_left

	; If here: front < left, so compare left and back.
	ld a, c
	cp d					; Compare left sub back.
	jr nc, _front_lt_left_ge_back

		; front < left, left < back.
		ld l, 0xaa & mask
		jr _pick_right

_front_lt_left_ge_back:

		; front < left, left >= back.
		ld l, 0xff & mask
		jr _pick_right

_front_ge_left:
	ld a, b
	cp d					; Compare front sub back.
	jr nc, _front_ge_left_and_back
	
		; front >= left, front < back.
		ld l, 0xaa & mask
		jr _pick_right
	
_front_ge_left_and_back:

		; front >= left, front >= back.
		ld l, 0x55 & mask

_pick_right:
	; Test for floor.
	ld a, b
	or d
	or e
	jr nz, _not_floor_right
	
		; If here: front = right = back = 0, i.e. the floor plane was hit
		ld h, 0x00 & mask
		ret
		
_not_floor_right:
	ld a, b
	cp e					; Compare front sub right.
	jr nc, _front_ge_right
	
	; If here: front < right, so compare right and back.
	ld a, e
	cp d					; Compare right sub back.
	jr nc, _front_lt_right_ge_back
	
		; front < right, right < back.
		ld h, 0xff & mask
		ret
		
_front_lt_right_ge_back:

		; front < right, right >= back.
		ld h, 0xaa & mask
		ret
		
_front_ge_right:
	ld a, b
	cp d					; Compare front sub back.
	jr nc, _front_ge_right_and_back
	
		; front >= right, front < back.
		ld h, 0xff & mask
		ret
		
_front_ge_right_and_back:

		; front >= right, front >= back.
		ld h, 0x55 & mask
		ret

ENDM


cast_even:
	cast 0xc0
	
cast_odd:
	cast 0x0c

;
;	Current map location in the top left of the display.
;

map_location:	dw 0xc0ff

;
;	Repopulates the entierty of triangle_map based on the current `map_location`.
;

cast_even_row:
	ld bc, (triangle_destination)
	push bc
	call cast_even

	ex de, hl
	pop hl
	ld (hl), e
	inc l
	ld (hl), d
	inc l
	push hl

	; TODO: would it actually be faster to use an index register here, rather
	; than all this push/pop/inc hl stuff?

	REPT 15, offset
		ld hl, (cast_location)
		inc_x
		dec_y
		ld (cast_location), hl

		call cast_even

		ex de, hl
		pop hl
		ld (hl), e
		inc l
		ld (hl), d
		inc l
		push hl
	ENDM

	pop hl
	ld (triangle_destination), hl

	ret

cast_odd_row:
	ld bc, (triangle_destination)
	push bc
	call cast_odd
	
	ex de, hl
	pop hl
	ld (hl), d
	inc l
	push hl
	
	REPT 15, offset
		ld hl, (cast_location)
		inc_x
		dec_y
		ld (cast_location), hl
		
		call cast_odd
		
		ex de, hl
		pop hl
		ld (hl), e
		inc l
		ld (hl), d
		inc l
		push hl
	ENDM
	
	ld hl, (cast_location)
	inc_x
	dec_y
	ld (cast_location), hl
	
	call cast_odd
	ex de, hl
	pop hl
	ld (hl), e
	inc l
	ld (triangle_destination), hl

	ret


cast_map:
	; Set the triangle destination pointer.
	ld hl, triangle_map
	ld (triangle_destination), hl

	; Seed the current casting location.
	ld hl, (map_location)
	ld (start_of_row), hl

	; Cast rows
	REPT num_rows, index
	_l1:
		IF index && !(index & 3)
			ld a, (triangle_destination+1)
			inc a
			ld (triangle_destination+1), a
		ENDIF

		ld hl, (start_of_row)
		inc_x
		ld (start_of_row), hl
		ld (cast_location), hl
		call cast_even_row

		ld hl, (start_of_row)
		inc_y
		ld (start_of_row), hl
		ld (cast_location), hl
		call cast_odd_row

	ENDM

	IF !(num_rows & 3)
		ld a, (triangle_destination+1)
		inc a
		ld (triangle_destination+1), a
	ENDIF

	ld hl, (start_of_row)
	inc_x
	ld (start_of_row), hl
	ld (cast_location), hl
	call cast_even_row

	ret

cast_location:			dw 0
start_of_row:			dw 0
triangle_destination:	dw 0

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
