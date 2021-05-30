	
;
;	Casts for a single triangle pair, returning the left result in L, the right in H;
;	in both cases the result generated will be the relevant colour, ANDed with the mask.
;
;	Upon entry:
;
;		HL = the map address to cast for.
;
;	In this diagram:
;
;		      /\
;		     /  \
;		    / B  \
;		   /\    /\			B = back
;		  /  \  /  \		L = left
;		 / L  \/  R \		R = right
;		|\    /\    /|		F = front
;		| \  /  \  / |
;		|  \/ F  \/  |
;		\  |\    /|  /
;		 \ | \  / | /
;		  \|  \/  |/
;		   \  |   /
;		    \ |  /
;		     \| /
;		      \/
;
;	The objective is to pick the proper colour for the left and right
;	halves of the front cube.
;
;	The test is then pretty simple: if the F cube is present, both colours
;	will be that of the top of the cube.
;
;	If F is absent but L is present, the rightward face colour is visible
;	on the left half. If R is present, the rightward face colour is visible
;	in the right half.
;
;	If F and L are both absent but B is present then the leftward face colour
;	is visible on the left half. And similarly on the right.
;
;	If F, L, R and B are all absent, the search proceeds to the four cubes one
;	level down and one spot backward.
;
;	Due to the way that the map has been swizzled, one byte will contain
;	all the Ls, another all the Rs, a third the Bs and a fourth the Fs. So all
;	levels can be tested at once with a single CP, at least after a run through
;	the log2 table.
;
;	----
;
;	Note on axes in use here:
;
;	If B were at the origin then:
;
;		- R would be at (1, 0);
;		- L would be at (0, 1); and
;		- F would be at (1, 1).
;

floorcolour	equ	0x00	; i.e. colour 0
cubetop		equ 0x1c	; i.e. colour 1
leftwall	equ 0xe0	; i.e. colour 2
rightwall	equ	0xfc	; i.e. colour 3

cast_diamond MACRO mask
	; Read from (x, y).
	ld b, (hl)		; i.e. b = 'front'.
	
	; Read from (x, y-1)
	dec_y
	ld e, (hl)		; i.e. e = 'right'.

	; Read from (x-1, y-1).
	dec_x
	ld d, (hl)		; i.e. d = 'back'.

	; Read from (x-1, y).
	inc_y
	ld c, (hl)		; i.e. c = 'left'.

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
		ld l, floorcolour & mask
		jp _pick_right

_not_floor_left:
	ld a, b
	cp c					; Compare front sub left.
	jr nc, _front_ge_left

	; If here: front < left, so compare left and back.
	ld a, c
	cp d					; Compare left sub back.
	jr nc, _front_lt_left_ge_back

		; front < left, left < back.
		ld l, leftwall & mask
		jp _pick_right

_front_lt_left_ge_back:

		; front < left, left >= back.
		ld l, rightwall & mask
		jp _pick_right

_front_ge_left:
	ld a, b
	cp d					; Compare front sub back.
	jr nc, _front_ge_left_and_back
	
		; front >= left, front < back.
		ld l, leftwall & mask
		jp _pick_right
	
_front_ge_left_and_back:

		; front >= left, front >= back.
		ld l, cubetop & mask

_pick_right:
	; Test for floor.
	ld a, b
	or d
	or e
	jr nz, _not_floor_right
	
		; If here: front = right = back = 0, i.e. the floor plane was hit
		ld h, floorcolour & mask
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
		ld h, rightwall & mask
		ret
		
_front_lt_right_ge_back:

		; front < right, right >= back.
		ld h, leftwall & mask
		ret
		
_front_ge_right:
	ld a, b
	cp d					; Compare front sub back.
	jr nc, _front_ge_right_and_back
	
		; front >= right, front < back.
		ld h, rightwall & mask
		ret
		
_front_ge_right_and_back:

		; front >= right, front >= back.
		ld h, cubetop & mask
		ret

ENDM

;
;	I've kept two labels for cast_diamond, one for even rows and one for odds
;	because in a previous implementation different bit patters were used for
;	for even rows and for odds in order to reduce costs in tile output.
;
;	This maintains the capacity to move back to that.
;
cast_odd_diamond:
cast_even_diamond:	cast_diamond 0x90


;
;	Current map location in the top left of the display.
;

map_location:	dw 0xc0ff

;
;	Casts an even row of tiles, i.e. one containing 16 complete diamonds.
;	So, an even row looks like:
;
;	<><><><><><><><><><><><><><><><>
;

cast_even_row:
	; Fill the first diamond.
	push hl
	call cast_even_diamond
	ld (ix+0), l
	ld (ix+1), h

	; Fill all the other diamonds.
	REPT 15, offset
		; Advance to the right.
		pop hl
		inc_x_dec_y

		IF offset != 14
			push hl
		ENDIF

		; Cast and store.
		call cast_even_diamond
		ld (ix+(offset*2)+2), l
		ld (ix+(offset*2)+3), h
	ENDM

	; Advance IX and return.
	ld de, 32
	add ix, de

	ret

;
;	Casts an odd row of tiles, i.e. one containing 15 complete diamonds
;	and two halves. So, an odd row looks like:
;
;	><><><><><><><><><><><><><><><><
;

cast_odd_row:
	; Fill the single triangle on the left.
	push hl
	call cast_odd_diamond
	ld (ix+0), h

	; Fill all the intermediate diamonds.
	REPT 15, offset
		; Advance to the right.
		pop hl
		inc_x_dec_y
		push hl

		; Cast and store.
		call cast_odd_diamond
		ld (ix+(offset*2)+1), l
		ld (ix+(offset*2)+2), h
	ENDM

	; Advance once more, and populate the single
	; triangle on the right.
	pop hl
	inc_x_dec_y
	
	call cast_odd_diamond
	ld (ix+31), l

	; Advance IX and return.
	ld de, 32
	add ix, de
	ret

;
;	Casts an even column of tiles, i.e. one containing 49 triangles
;	triangles in which the top, truncated one is facing left.
;	i.e.
;
;	____
;	|\ |
;	| \|
;	| /|
;	|/ |
;	|\ |
;	| \|
;	| /|
;	|/ |
;	... etc ...
;

cast_even_column:
	exx
		ld de, 128		; Not 256 (yet) because I'd need to be more careful about offset being signed
						; in the loop below.
	exx

	push hl

	REPT num_rows, row
		_offset equ (row & 1)*64

		IF row
			pop hl
			inc_x
			push hl
		ENDIF
		call cast_even_diamond
		ld (ix + _offset), l

		pop hl
		inc_y
		push hl
		call cast_odd_diamond
		ld (ix + _offset + 32), h

		IF _offset = 64
			exx
			add ix, de
			exx
		ENDIF
	ENDM

	pop hl
	inc_x
	call cast_even_diamond
	_here equ 23
	ld (ix + (num_rows & 1)*64), l

	ret

;
;	Casts an odd column of tiles, i.e. one containing 49 triangles
;	triangles in which the top, truncated one is facing right.
;	i.e.
;
;	____
;	| /|
;	|/ |
;	|\ |
;	| \|
;	| /|
;	|/ |
;	|\ |
;	| \|
;	... etc ...
;

cast_odd_column:
	exx
		ld de, 128
	exx

	push hl

	REPT num_rows, row
		_offset equ (row & 1)*64

		IF row
			pop hl
			inc_y
			push hl
		ENDIF
		call cast_even_diamond
		ld (ix + _offset), h

		pop hl
		inc_x
		push hl
		call cast_odd_diamond
		ld (ix + _offset + 32), l

		IF _offset = 64
			exx
			add ix, de
			exx
		ENDIF
	ENDM

	pop hl
	inc_y
	call cast_even_diamond
	ld (ix + (num_rows & 1)*64), h

	ret

;
;	Repopulates the entirety of triangle_map based on the current `map_location`.
;

cast_map:
	; Set the triangle destination pointer.
	ld ix, triangle_map

	; Seed the current casting location.
	ld hl, (map_location)

	; Cast the first 2n rows.
	REPT num_rows, index
		IF index != 0
			pop hl
		ENDIF
		inc_x
		push hl
		call cast_even_row

		pop hl
		inc_y
		push hl
		call cast_odd_row
	ENDM

	; Cast an additional row; an odd number is required.
	pop hl
	inc_x
	jp cast_even_row			; i.e. call cast_even_row; ret
