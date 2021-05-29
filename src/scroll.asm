MACRO fix_even
	REPT 32
		srl (hl)
		inc hl		; TODO: increment l only and fix h outside of the loop?
	ENDM
ENDM

MACRO fix_odd
	REPT 32
		sla (hl)
		inc hl
	ENDM
ENDM

fix_up:
	ld b, num_rows
	ld hl, triangle_map

	line:
		fix_even
		fix_odd

		dec b
		jp nz, line

	fix_even

	ret

triangle_map_size equ 32*49
triangle_map_end equ triangle_map + triangle_map_size - 1

;
;	Moves the view left one position and down one position
;	in isometric space, which means straight leftward in 2d terms.
;
move_view_left_down:
	ld hl, triangle_map_end - 2
	ld de, triangle_map_end
	ld bc, triangle_map_size - 2
	lddr

	; Update the map location.
	ld hl, (map_location)
	dec_x
	inc_y
	ld (map_location), hl

	; Recast the left column.
	ld ix, triangle_map
	inc_x
	push hl
	call cast_even_column

	; Recast the one-from-left column.
	ld ix, triangle_map+1
	pop hl
	jp cast_odd_column

;
;	Moves the view left one position in isometric space,
;	which means diagonally to the left and upward in 2d terms.
;
move_view_left:
	ld hl, triangle_map_end - 33
	ld de, triangle_map_end
	ld bc, triangle_map_size - 33
	lddr
	call fix_up

	; Update the map location.
	ld hl, (map_location)
	dec_x
	ld (map_location), hl

	; Cast top row.
	ld ix, triangle_map
	inc_x
	push hl
	call cast_even_row

	; Cast left column.
	ld ix, triangle_map
	pop hl
	jp cast_even_column

;
;	Moves the view left one position and up one position in isometric space,
;	which means straight upward in 2d terms.
;
move_view_left_up:
	ld hl, triangle_map_end - 64
	ld de, triangle_map_end
	ld bc, triangle_map_size - 64
	lddr

	; Update the map location.
	ld hl, (map_location)
	dec_x
	dec_y
	ld (map_location), hl

	; Set the triangle destination pointer.
	ld ix, triangle_map

	; Seed the current casting location.
	inc_x
	push hl
	call cast_even_row

	pop hl
	inc_y
	jp cast_odd_row

;
;	Moves the view down one position in isometric space,
;	which means diagonally to the left and downward in 2d terms.
;
move_view_down:
	ld hl, triangle_map + 32
	ld de, triangle_map + 1
	ld bc, triangle_map_size - 33
	ldir
	call fix_up

	; Update the map location.
	ld hl, (map_location)
	inc_y
	ld (map_location), hl

	; Cast left column.
	ld ix, triangle_map
	inc_x
	push hl
	call cast_even_column

	; Cast bottom row.
	pop hl
	add_xy num_rows, num_rows
	ld ix, triangle_map + num_rows * 32 * 2
	jp cast_even_row

;
;	Moves the view right one position and up one position
;	in isometric space, which means straight downward in 2d terms.
;
move_view_right_down:
	ld hl, triangle_map + 64
	ld de, triangle_map
	ld bc, triangle_map_size - 32*2
	ldir

	; Update the map location.
	ld hl, (map_location)
	inc_x
	inc_y
	ld (map_location), hl

	; Set the triangle destination pointer.
	ld ix, triangle_map + (num_rows-1)*64 + 32

	; Seed the current casting location.
	add_xy num_rows, num_rows
	push hl
	call cast_odd_row

	pop hl
	inc_x
	jp cast_even_row

;
;	Moves the view right one position in isometric space,
;	which means diagonally to the right and downward in 2d terms.
;
move_view_right:
	ld hl, triangle_map + 33
	ld de, triangle_map
	ld bc, triangle_map_size - 33
	ldir
	call fix_up

	; Update the map location.
	ld hl, (map_location)
	inc_x
	ld (map_location), hl

	; Cast bottom row.
	ld ix, triangle_map + num_rows*64
	add_xy num_rows+1, num_rows
	call cast_even_row

	; Cast right column.
	ld ix, triangle_map+31
	ld hl, (map_location)
	add_xy 16, -15
	jp cast_odd_column

;
;	Moves the view right one position and up one position in isometric space,
;	which means straight right in 2d terms.
;
move_view_right_up:
	ld hl, triangle_map + 2
	ld de, triangle_map
	ld bc, triangle_map_size - 2
	ldir

	; Update the map location.
	ld hl, (map_location)
	inc_x
	dec_y
	ld (map_location), hl

	; Cast one-from-right column.
	ld ix, triangle_map+30
	add_xy 16, -15
	push hl
	call cast_even_column

	; Cast right column.
	ld ix, triangle_map+31
	pop hl
	jp cast_odd_column

;
;	Moves the view up one position in isometric space,
;	which means diagonally to the right and upward in 2d terms.
;
move_view_up:
	ld hl, triangle_map_end - 32
	ld de, triangle_map_end - 1
	ld bc, triangle_map_size - 33
	lddr
	call fix_up

	; Update the map location.
	ld hl, (map_location)
	dec_y
	ld (map_location), hl

	; Cast right column.
	ld ix, triangle_map+31
	add_xy 16, -15
	call cast_odd_column

	; Cast top row.
	ld hl, (map_location)
	inc_x
	ld ix, triangle_map
	jp cast_even_row

;
;	Scrolls according to the direction flags in a,
;	which has the same form as the Sinclair Interface 2
;	keyboard row, i.e.
;
;	b0 = unused;
;	b1 = scroll up [if reset];
;	b2 = scroll down [if reset];
;	b3 = scroll right [if reset];
;	b4 = scroll left [if reset].
;
scroll:
	and 0x1e

	ld b, 0
	ld c, a

	ld hl, _scroll_table
	add hl, bc

	ld e, (hl)
	inc hl
	ld d, (hl)

	ex de, hl
	jp (hl)

_no_scroll:
	ret

_scroll_table:
	dw _no_scroll				; 0000 : left, right, down and up.
	dw move_view_down			; 0001 : left, right and down
	dw move_view_up				; 0010 : left, right and up.
	dw _no_scroll				; 0011 : left and right.
	dw move_view_left			; 0100 : left, up and down.
	dw move_view_left_down		; 0101 : left and down.
	dw move_view_left_up		; 0110 : left and up
	dw move_view_left			; 0111 : left.
	dw move_view_right			; 1000 : right, up and down.
	dw move_view_right_down		; 1001 : right and down.
	dw move_view_right_up		; 1010 : right and up.
	dw move_view_right			; 1011 : right.
	dw _no_scroll				; 1100 : up and down.
	dw move_view_down			; 1101 : down.
	dw move_view_up				; 1110 : up.
	dw _no_scroll				; 1111 : nothing.
	