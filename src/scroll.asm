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
;	Moves the view left one position and up one position
;	in isometric space, which means straight upward in 2d terms.
;
move_view_left_up:
	;
	; This is easy because it's just a scroll upward in 2d terms.
	; So shift the triangle map right by a rows and recast the two leftmost column.
	;
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
	call cast_odd_column

	ret

;
;	Moves the view left one position in isometric space,
;	which means diagonally to the left and upward in 2d terms.
;
move_view_left:
	;
	; Copy each triangle to the position one row down and one column across,
	; shifting appropriately because they'll have swapped rows.
	;
	; Then recast the top row and the leftmost column.
	;

	; Use an LDDR to do the initial relocation, then fix up.
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
	call cast_even_column

	ret

;
;	Moves the view left one position and down one position in isometric space,
;	which means straight to the left in 2d terms.
;
move_view_left_down:
	;
	; This is easy because it's just a scroll upward in 2d terms.
	; So shift the triangle map down by two rows and recast the top.
	;
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
	call cast_odd_row

	ret

;
;	Moves the view down one position in isometric space,
;	which means diagonally to the left and downward in 2d terms.
;
move_view_down:
	;
	; Copy each triangle to the position one row down and one column across,
	; shifting appropriately because they'll have swapped rows.
	;
	; Then recast the top row and the leftmost column.
	;

	; Use an LDDR to do the initial relocation, then fix up.
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
	push hl
	call cast_even_column

	; Cast bottom row.
	pop hl
	add_xy num_rows, num_rows
	ld ix, triangle_map + num_rows * 32 * 2
	call cast_even_row

	ret
