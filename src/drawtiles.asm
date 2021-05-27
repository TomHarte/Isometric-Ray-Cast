;
;	A lookup table for the start addresses of character lines, in reverse order.
;
;	Needs to be 256-byte aligned.
;

video_pointers:
	dw 0x50e0, 0x50c0, 0x50a0, 0x5080, 0x5060, 0x5040, 0x5020, 0x5000
	dw 0x48e0, 0x48c0, 0x48a0, 0x4880, 0x4860, 0x4840, 0x4820, 0x4800
	dw 0x40e0, 0x40c0, 0x40a0, 0x4080, 0x4060, 0x4040, 0x4020, 0x4000

;
;	Ephemeral work buffer for current triangle colours, 32 columns by 49 rows,
;	indexed linearly from top left to bottom right.
;
;	Even lines contain the colour index of [0, 3] shifted up to bits 6 and 7;
;	odd lines use bits 3 and 2.
;
;	Currently no alignment requirement; cf. the use of (IX+n) in cast.asm.
;

triangle_map:	ds 32*49

;
;	Map of tiles currently on screen.
;
;	No particular alignment requirements right now.
;
output_map: 	ds 32*24, 1

;
;	Outputs the current state of the triangle map, in full.
;

draw_tiles:
	ld hl, triangle_map-1
	push hl						; Seed pointer into triangle map.

	ld bc, 32					; Offset of next triangle line from current;
								; possibly a waste of registers (?)

	ld d, num_rows-1			; Row counter: there'll be `num_rows` of them.

	ld ix, output_map			; Load a pointer to the buffer of tiles drawn last time.
								; TODO: can I do better than using IX?

draw_row:
	;
	; DE' = video address for start of line.
	;

	ld a, d
	exx
		add a, a
		ld l, a
		ld h, video_pointers >> 8
		ld e, (hl)
		inc l
		ld d, (hl)

		; Quick workaround for a limitation in Pasmo syntax:
		; the brackets around (tiles >> 1) can't be distinguished
		; from ordinary Z80 indirection brackets if used directly
		; in the ld below.
		_bcpair equ (tiles >> 1) + ((tiles >> 9) + 1)
		ld bc, _bcpair
	exx

	;
	; Cost of unrolling here is a bit more than 2kb;
	; reroll if space becomes tight.
	;

;		ld e, 16
;		draw_tile:
	REPT 16, column

		REPT 2, flip
			; Get and increment the base triangle address.
			pop hl
			inc hl
			push hl

			; Assemble tile index in a.
			ld a, (hl)

			; Carry is guaranteed reset here — either because of the
			; `add a, a` above, or the and ~7 below.
			rra
			rra

			add hl, bc
			or (hl)

			add hl, bc
			or (hl)

			; Compare with previously-output tile and skip if possible.
			_ixoffset equ (column * 2) + flip
			cp (ix + _ixoffset)
			jr nz, _draw

			exx
			inc e
			jp _next
	
		_draw:
			exx
				ld (ix + _ixoffset), a

				; Map that to a tile address and copy a tile.
				IF !(flip & 1)
					ld h, b
				ENDIF
				IF (flip & 1)
					ld h, c
				ENDIF

				ld l, a
				add hl, hl

				REPT 7
					ld a, (hl)
					ld (de), a
					inc d
					inc l
				ENDM

					ld a, (hl)
					ld (de), a

				; Advance output pointer to top of next
				; character square.
				ld a, d
				and ~7		; To undo the seven increments above, given screen line alignment.
				ld d, a
				inc e

		_next:
			exx
		ENDM

		; Continue column loop. E is valid from 16 to 1.
;		dec e
;		jp nz, draw_tile
	ENDM

	;
	;	Add 32 to triangle address; it gained 32 in the loop above,
	;	so this additional 32 means that the next line drawn will start
	;	two lines further down in the triangle buffer.
	;
	pop hl
	add hl, bc
	push hl
	add ix, bc

	; Continue row loop. D is valid from 23 to 0.
	dec d
	jp p, draw_row

	pop hl
	ret
