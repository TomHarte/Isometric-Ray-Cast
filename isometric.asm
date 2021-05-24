	org $8000

;
;	Various tiles. All are 8x8.
;
;	Indexed as:
;
;		(flipped << 6) | (bottom << 4) | (top << 2) | middle
;

;
;	i.e. 1024 bytes of graphics lie here.
;
;	Must be on a 512-byte boundary.
;

tiles:
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	db 0x80, 0x40, 0xa8, 0x54, 0xaa, 0x50, 0xa0, 0x00
	db 0x80, 0x20, 0xc8, 0x32, 0xcc, 0x30, 0xc0, 0x00
	db 0x80, 0xe0, 0xf8, 0xfe, 0xfe, 0xf8, 0xe0, 0x80
	db 0x2a, 0x15, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00
	db 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x50, 0xa0, 0x00
	db 0xaa, 0x35, 0xca, 0x33, 0xcc, 0x30, 0xc0, 0x00
	db 0xaa, 0xf5, 0xfa, 0xff, 0xfe, 0xf8, 0xe0, 0x80
	db 0x4c, 0x13, 0x04, 0x01, 0x00, 0x00, 0x00, 0x00
	db 0xcc, 0x53, 0xac, 0x55, 0xaa, 0x50, 0xa0, 0x00
	db 0xcc, 0x33, 0xcc, 0x33, 0xcc, 0x30, 0xc0, 0x00
	db 0xcc, 0xf3, 0xfc, 0xff, 0xfe, 0xf8, 0xe0, 0x80
	db 0x7f, 0x1f, 0x07, 0x01, 0x00, 0x00, 0x00, 0x00
	db 0xff, 0x5f, 0xaf, 0x55, 0xaa, 0x50, 0xa0, 0x00
	db 0xff, 0x3f, 0xcf, 0x33, 0xcc, 0x30, 0xc0, 0x00
	db 0xff, 0xff, 0xff, 0xff, 0xfe, 0xf8, 0xe0, 0x80
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x0a, 0x55
	db 0x80, 0x40, 0xa8, 0x54, 0xaa, 0x55, 0xaa, 0x55
	db 0x80, 0x20, 0xc8, 0x32, 0xcc, 0x35, 0xca, 0x55
	db 0x80, 0xe0, 0xf8, 0xfe, 0xfe, 0xfd, 0xea, 0xd5
	db 0x2a, 0x15, 0x02, 0x01, 0x00, 0x05, 0x0a, 0x55
	db 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55
	db 0xaa, 0x35, 0xca, 0x33, 0xcc, 0x35, 0xca, 0x55
	db 0xaa, 0xf5, 0xfa, 0xff, 0xfe, 0xfd, 0xea, 0xd5
	db 0x4c, 0x13, 0x04, 0x01, 0x00, 0x05, 0x0a, 0x55
	db 0xcc, 0x53, 0xac, 0x55, 0xaa, 0x55, 0xaa, 0x55
	db 0xcc, 0x33, 0xcc, 0x33, 0xcc, 0x35, 0xca, 0x55
	db 0xcc, 0xf3, 0xfc, 0xff, 0xfe, 0xfd, 0xea, 0xd5
	db 0x7f, 0x1f, 0x07, 0x01, 0x00, 0x05, 0x0a, 0x55
	db 0xff, 0x5f, 0xaf, 0x55, 0xaa, 0x55, 0xaa, 0x55
	db 0xff, 0x3f, 0xcf, 0x33, 0xcc, 0x35, 0xca, 0x55
	db 0xff, 0xff, 0xff, 0xff, 0xfe, 0xfd, 0xea, 0xd5
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x0c, 0x33
	db 0x80, 0x40, 0xa8, 0x54, 0xaa, 0x53, 0xac, 0x33
	db 0x80, 0x20, 0xc8, 0x32, 0xcc, 0x33, 0xcc, 0x33
	db 0x80, 0xe0, 0xf8, 0xfe, 0xfe, 0xfb, 0xec, 0xb3
	db 0x2a, 0x15, 0x02, 0x01, 0x00, 0x03, 0x0c, 0x33
	db 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x53, 0xac, 0x33
	db 0xaa, 0x35, 0xca, 0x33, 0xcc, 0x33, 0xcc, 0x33
	db 0xaa, 0xf5, 0xfa, 0xff, 0xfe, 0xfb, 0xec, 0xb3
	db 0x4c, 0x13, 0x04, 0x01, 0x00, 0x03, 0x0c, 0x33
	db 0xcc, 0x53, 0xac, 0x55, 0xaa, 0x53, 0xac, 0x33
	db 0xcc, 0x33, 0xcc, 0x33, 0xcc, 0x33, 0xcc, 0x33
	db 0xcc, 0xf3, 0xfc, 0xff, 0xfe, 0xfb, 0xec, 0xb3
	db 0x7f, 0x1f, 0x07, 0x01, 0x00, 0x03, 0x0c, 0x33
	db 0xff, 0x5f, 0xaf, 0x55, 0xaa, 0x53, 0xac, 0x33
	db 0xff, 0x3f, 0xcf, 0x33, 0xcc, 0x33, 0xcc, 0x33
	db 0xff, 0xff, 0xff, 0xff, 0xfe, 0xfb, 0xec, 0xb3
	db 0x00, 0x00, 0x00, 0x00, 0x01, 0x07, 0x1f, 0x7f
	db 0x80, 0x40, 0xa8, 0x54, 0xab, 0x57, 0xbf, 0x7f
	db 0x80, 0x20, 0xc8, 0x32, 0xcd, 0x37, 0xdf, 0x7f
	db 0x80, 0xe0, 0xf8, 0xfe, 0xff, 0xff, 0xff, 0xff
	db 0x2a, 0x15, 0x02, 0x01, 0x01, 0x07, 0x1f, 0x7f
	db 0xaa, 0x55, 0xaa, 0x55, 0xab, 0x57, 0xbf, 0x7f
	db 0xaa, 0x35, 0xca, 0x33, 0xcd, 0x37, 0xdf, 0x7f
	db 0xaa, 0xf5, 0xfa, 0xff, 0xff, 0xff, 0xff, 0xff
	db 0x4c, 0x13, 0x04, 0x01, 0x01, 0x07, 0x1f, 0x7f
	db 0xcc, 0x53, 0xac, 0x55, 0xab, 0x57, 0xbf, 0x7f
	db 0xcc, 0x33, 0xcc, 0x33, 0xcd, 0x37, 0xdf, 0x7f
	db 0xcc, 0xf3, 0xfc, 0xff, 0xff, 0xff, 0xff, 0xff
	db 0x7f, 0x1f, 0x07, 0x01, 0x01, 0x07, 0x1f, 0x7f
	db 0xff, 0x5f, 0xaf, 0x55, 0xab, 0x57, 0xbf, 0x7f
	db 0xff, 0x3f, 0xcf, 0x33, 0xcd, 0x37, 0xdf, 0x7f
	db 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	db 0x00, 0x05, 0x0a, 0x55, 0x2a, 0x15, 0x02, 0x01
	db 0x00, 0x03, 0x0c, 0x33, 0x4c, 0x13, 0x04, 0x01
	db 0x01, 0x07, 0x1f, 0x7f, 0x7f, 0x1f, 0x07, 0x01
	db 0xaa, 0x50, 0xa0, 0x00, 0x00, 0x00, 0x00, 0x00
	db 0xaa, 0x55, 0xaa, 0x55, 0x2a, 0x15, 0x02, 0x01
	db 0xaa, 0x53, 0xac, 0x33, 0x4c, 0x13, 0x04, 0x01
	db 0xab, 0x57, 0xbf, 0x7f, 0x7f, 0x1f, 0x07, 0x01
	db 0xcc, 0x30, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00
	db 0xcc, 0x35, 0xca, 0x55, 0x2a, 0x15, 0x02, 0x01
	db 0xcc, 0x33, 0xcc, 0x33, 0x4c, 0x13, 0x04, 0x01
	db 0xcd, 0x37, 0xdf, 0x7f, 0x7f, 0x1f, 0x07, 0x01
	db 0xfe, 0xf8, 0xe0, 0x80, 0x00, 0x00, 0x00, 0x00
	db 0xfe, 0xfd, 0xea, 0xd5, 0x2a, 0x15, 0x02, 0x01
	db 0xfe, 0xfb, 0xec, 0xb3, 0x4c, 0x13, 0x04, 0x01
	db 0xff, 0xff, 0xff, 0xff, 0x7f, 0x1f, 0x07, 0x01
	db 0x00, 0x00, 0x00, 0x00, 0x80, 0x40, 0xa8, 0x54
	db 0x00, 0x05, 0x0a, 0x55, 0xaa, 0x55, 0xaa, 0x55
	db 0x00, 0x03, 0x0c, 0x33, 0xcc, 0x53, 0xac, 0x55
	db 0x01, 0x07, 0x1f, 0x7f, 0xff, 0x5f, 0xaf, 0x55
	db 0xaa, 0x50, 0xa0, 0x00, 0x80, 0x40, 0xa8, 0x54
	db 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55
	db 0xaa, 0x53, 0xac, 0x33, 0xcc, 0x53, 0xac, 0x55
	db 0xab, 0x57, 0xbf, 0x7f, 0xff, 0x5f, 0xaf, 0x55
	db 0xcc, 0x30, 0xc0, 0x00, 0x80, 0x40, 0xa8, 0x54
	db 0xcc, 0x35, 0xca, 0x55, 0xaa, 0x55, 0xaa, 0x55
	db 0xcc, 0x33, 0xcc, 0x33, 0xcc, 0x53, 0xac, 0x55
	db 0xcd, 0x37, 0xdf, 0x7f, 0xff, 0x5f, 0xaf, 0x55
	db 0xfe, 0xf8, 0xe0, 0x80, 0x80, 0x40, 0xa8, 0x54
	db 0xfe, 0xfd, 0xea, 0xd5, 0xaa, 0x55, 0xaa, 0x55
	db 0xfe, 0xfb, 0xec, 0xb3, 0xcc, 0x53, 0xac, 0x55
	db 0xff, 0xff, 0xff, 0xff, 0xff, 0x5f, 0xaf, 0x55
	db 0x00, 0x00, 0x00, 0x00, 0x80, 0x20, 0xc8, 0x32
	db 0x00, 0x05, 0x0a, 0x55, 0xaa, 0x35, 0xca, 0x33
	db 0x00, 0x03, 0x0c, 0x33, 0xcc, 0x33, 0xcc, 0x33
	db 0x01, 0x07, 0x1f, 0x7f, 0xff, 0x3f, 0xcf, 0x33
	db 0xaa, 0x50, 0xa0, 0x00, 0x80, 0x20, 0xc8, 0x32
	db 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x35, 0xca, 0x33
	db 0xaa, 0x53, 0xac, 0x33, 0xcc, 0x33, 0xcc, 0x33
	db 0xab, 0x57, 0xbf, 0x7f, 0xff, 0x3f, 0xcf, 0x33
	db 0xcc, 0x30, 0xc0, 0x00, 0x80, 0x20, 0xc8, 0x32
	db 0xcc, 0x35, 0xca, 0x55, 0xaa, 0x35, 0xca, 0x33
	db 0xcc, 0x33, 0xcc, 0x33, 0xcc, 0x33, 0xcc, 0x33
	db 0xcd, 0x37, 0xdf, 0x7f, 0xff, 0x3f, 0xcf, 0x33
	db 0xfe, 0xf8, 0xe0, 0x80, 0x80, 0x20, 0xc8, 0x32
	db 0xfe, 0xfd, 0xea, 0xd5, 0xaa, 0x35, 0xca, 0x33
	db 0xfe, 0xfb, 0xec, 0xb3, 0xcc, 0x33, 0xcc, 0x33
	db 0xff, 0xff, 0xff, 0xff, 0xff, 0x3f, 0xcf, 0x33
	db 0x00, 0x00, 0x00, 0x00, 0x80, 0xe0, 0xf8, 0xfe
	db 0x00, 0x05, 0x0a, 0x55, 0xaa, 0xf5, 0xfa, 0xff
	db 0x00, 0x03, 0x0c, 0x33, 0xcc, 0xf3, 0xfc, 0xff
	db 0x01, 0x07, 0x1f, 0x7f, 0xff, 0xff, 0xff, 0xff
	db 0xaa, 0x50, 0xa0, 0x00, 0x80, 0xe0, 0xf8, 0xfe
	db 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0xf5, 0xfa, 0xff
	db 0xaa, 0x53, 0xac, 0x33, 0xcc, 0xf3, 0xfc, 0xff
	db 0xab, 0x57, 0xbf, 0x7f, 0xff, 0xff, 0xff, 0xff
	db 0xcc, 0x30, 0xc0, 0x00, 0x80, 0xe0, 0xf8, 0xfe
	db 0xcc, 0x35, 0xca, 0x55, 0xaa, 0xf5, 0xfa, 0xff
	db 0xcc, 0x33, 0xcc, 0x33, 0xcc, 0xf3, 0xfc, 0xff
	db 0xcd, 0x37, 0xdf, 0x7f, 0xff, 0xff, 0xff, 0xff
	db 0xfe, 0xf8, 0xe0, 0x80, 0x80, 0xe0, 0xf8, 0xfe
	db 0xfe, 0xfd, 0xea, 0xd5, 0xaa, 0xf5, 0xfa, 0xff
	db 0xfe, 0xfb, 0xec, 0xb3, 0xcc, 0xf3, 0xfc, 0xff
	db 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff

;
;	A lookup table for the start addresses of character lines, in reverse order.
;
;	Needs to be 256-byte aligned and off by one. Entry 0 will never be used.
;	So I've reused it for triangle_address.
;

video_pointers:
triangle_address: dw 0
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
;	Should be 32-byte aligned.
;

org $8440
triangle_map:	ds 32*49

;
;	The following is a pre-generated map, which I am temporarily using to test the pixel plotting in isolation.
;
;	Expected next step: generate this live.
;
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 192, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 12, 12, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 192, 192, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 12, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 192, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 64, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 128, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 8, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 128, 128, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, 64, 192, 64, 192, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 12, 12, 12, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 192, 192, 192, 192, 192, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 8, 12, 8, 12, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, 64, 192, 0, 0, 128, 192, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 12, 12, 0, 0, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 64, 64, 192, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, 64
db 0, 0, 0, 0, 0, 0, 0, 0, 8, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4
db 0, 0, 0, 0, 0, 0, 64, 64, 128, 192, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 64, 64
db 0, 0, 0, 0, 0, 4, 4, 12, 8, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 12
db 0, 0, 0, 0, 64, 64, 192, 192, 128, 192, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 128, 192
db 0, 0, 0, 4, 4, 12, 12, 12, 8, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 4
db 64, 64, 64, 64, 192, 192, 192, 192, 128, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 128, 128
db 4, 4, 4, 12, 12, 12, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 4
db 192, 128, 64, 64, 128, 192, 192, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, 64
db 4, 4, 4, 4, 4, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 12
db 64, 64, 192, 128, 64, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 192
db 8, 4, 4, 4, 4, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 12
db 64, 64, 64, 64, 192, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 192, 192
db 4, 4, 4, 12, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 12, 0
db 64, 64, 192, 192, 128, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 8, 12, 12, 0, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 128, 192, 0, 0, 128, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 128, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 8, 12, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 128, 192, 0, 0, 0, 0, 0, 128, 192, 0, 0, 0, 64, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 4, 4, 0, 0, 8, 12, 0, 0, 4, 4, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 64, 64, 64, 64, 0, 0, 64, 64, 64, 64, 192, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 4, 4, 4, 4, 4, 4, 4, 4, 12, 4, 12, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 64, 64, 64, 64, 64, 64, 192, 64, 192, 192, 192, 192, 192, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 4, 4, 4, 4, 4, 12, 12, 12, 12, 12, 12, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 64, 64, 64, 64, 192, 192, 192, 192, 128, 192, 192, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 4, 4, 4, 12, 12, 12, 12, 0, 8, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 64, 64, 192, 192, 192, 192, 192, 0, 128, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

;
;	Outputs the current state of the triangle map, in full.
;

draw_tiles:
	ld hl, triangle_map-1
	ld (triangle_address), hl	; Seed pointer into triangle map.

	ld bc, 32					; Offset of next triangle line from current;
								; possibly a waste of registers (?)

	ld d, 24					; Line counter: there'll be 24 of them.

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
	exx

		ld e, 16
		draw_tile:

		REPT 2, flip
			; Get and increment the base triangle address.
			ld hl, (triangle_address)
			inc hl
			ld (triangle_address), hl

			; Assemble tile index in a.
			ld a, (hl)

			; or a	; Reset carry.
			rra
			rra

			add hl, bc
			or (hl)

			add hl, bc
			or (hl)
			
			; TODO: some sort of comparison with the last thing plotted to the display here?
			
			exx

				; Map that to a tile address and copy a tile.
				ld h, (tiles + flip*512) >> 9					; TODO: could use BC' to store the two top pointers and save three cycles here?
																; (unless BC' is too tempting a target for a don't-redraw-if-same test as per TODO above)
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

			exx
		ENDM

		; Continue column loop. E is valid from 32 to 1.
		dec e
		jr nz, draw_tile

	;
	;	Add 32 to triangle_address; it gained 32 in the loop above,
	;	so this additional 32 means that the next line drawn will start
	;	two lines further down in the triangle buffer.
	;
	ld hl, (triangle_address)
	add hl, bc
	ld (triangle_address), hl

	; Continue row loop. D is valid from 24 to 1.
	dec d
	jp nz, draw_row

	ret

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
	cp d
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
		jr _done
		
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
		jr _done
		
_front_lt_right_ge_back:

		; front < right, right >= back.
		ld h, 0xaa & mask
		jr _done
		
_front_ge_right:
	ld a, b
	cp d
	jr nc, _front_ge_right_and_back
	
		; front >= right, front < back.
		ld h, 0xaa & mask
		jr _done
		
_front_ge_right_and_back:

		; front >= right, front >= back.
		ld h, 0x55 & mask

_done:
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

cast_odd_row2:
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

cast_odd_row:
	ld hl, (triangle_destination)
	ld a, 32
	add a, l
	ld l, a
	ld a, 0
	adc a, h
	ld h, a
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
	REPT 24
		ld hl, (start_of_row)
		inc_x
		ld (start_of_row), hl
		ld (cast_location), hl
		call cast_even_row

		ld hl, (start_of_row)
		inc_y		
		ld (start_of_row), hl
		ld (cast_location), hl
		call cast_odd_row		; TODO: fix cast_odd_row
	ENDM

	ret

cast_location:			dw 0
start_of_row:			dw 0
triangle_destination:	dw 0

;
;	Main entry point. Just a test loop for now.
;

start:
	di

display:
	call cast_map
	call draw_tiles

	ld hl, (map_location)
;	inc_x
	dec_y
	ld (map_location), hl
	
;	ld a, (triangle_map+34)
;	add a, 0x04
;	and 0x0c
;	ld (triangle_map+34), a
	
	jr display
	
;	di
;	halt

	ret

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
	INCBIN "map.dat"

end start	; stop generating code, use 'start' as the entry-point
