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
;	All macros affect the flags. The x macros also clobber `a`.
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
