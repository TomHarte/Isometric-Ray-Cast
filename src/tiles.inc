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
	db 0x80, 0x00, 0x88, 0x10, 0x88, 0x10, 0x80, 0x00
	db 0x80, 0xe0, 0xf8, 0xfe, 0xfe, 0xf8, 0xe0, 0x80
	db 0x2a, 0x15, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00
	db 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x50, 0xa0, 0x00
	db 0xaa, 0x15, 0x8a, 0x11, 0x88, 0x10, 0x80, 0x00
	db 0xaa, 0xf5, 0xfa, 0xff, 0xfe, 0xf8, 0xe0, 0x80
	db 0x08, 0x11, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
	db 0x88, 0x51, 0xa8, 0x55, 0xaa, 0x50, 0xa0, 0x00
	db 0x88, 0x11, 0x88, 0x11, 0x88, 0x10, 0x80, 0x00
	db 0x88, 0xf1, 0xf8, 0xff, 0xfe, 0xf8, 0xe0, 0x80
	db 0x7f, 0x1f, 0x07, 0x01, 0x00, 0x00, 0x00, 0x00
	db 0xff, 0x5f, 0xaf, 0x55, 0xaa, 0x50, 0xa0, 0x00
	db 0xff, 0x1f, 0x8f, 0x11, 0x88, 0x10, 0x80, 0x00
	db 0xff, 0xff, 0xff, 0xff, 0xfe, 0xf8, 0xe0, 0x80
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x0a, 0x55
	db 0x80, 0x40, 0xa8, 0x54, 0xaa, 0x55, 0xaa, 0x55
	db 0x80, 0x00, 0x88, 0x10, 0x88, 0x15, 0x8a, 0x55
	db 0x80, 0xe0, 0xf8, 0xfe, 0xfe, 0xfd, 0xea, 0xd5
	db 0x2a, 0x15, 0x02, 0x01, 0x00, 0x05, 0x0a, 0x55
	db 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55
	db 0xaa, 0x15, 0x8a, 0x11, 0x88, 0x15, 0x8a, 0x55
	db 0xaa, 0xf5, 0xfa, 0xff, 0xfe, 0xfd, 0xea, 0xd5
	db 0x08, 0x11, 0x00, 0x01, 0x00, 0x05, 0x0a, 0x55
	db 0x88, 0x51, 0xa8, 0x55, 0xaa, 0x55, 0xaa, 0x55
	db 0x88, 0x11, 0x88, 0x11, 0x88, 0x15, 0x8a, 0x55
	db 0x88, 0xf1, 0xf8, 0xff, 0xfe, 0xfd, 0xea, 0xd5
	db 0x7f, 0x1f, 0x07, 0x01, 0x00, 0x05, 0x0a, 0x55
	db 0xff, 0x5f, 0xaf, 0x55, 0xaa, 0x55, 0xaa, 0x55
	db 0xff, 0x1f, 0x8f, 0x11, 0x88, 0x15, 0x8a, 0x55
	db 0xff, 0xff, 0xff, 0xff, 0xfe, 0xfd, 0xea, 0xd5
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x08, 0x11
	db 0x80, 0x40, 0xa8, 0x54, 0xaa, 0x51, 0xa8, 0x11
	db 0x80, 0x00, 0x88, 0x10, 0x88, 0x11, 0x88, 0x11
	db 0x80, 0xe0, 0xf8, 0xfe, 0xfe, 0xf9, 0xe8, 0x91
	db 0x2a, 0x15, 0x02, 0x01, 0x00, 0x01, 0x08, 0x11
	db 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x51, 0xa8, 0x11
	db 0xaa, 0x15, 0x8a, 0x11, 0x88, 0x11, 0x88, 0x11
	db 0xaa, 0xf5, 0xfa, 0xff, 0xfe, 0xf9, 0xe8, 0x91
	db 0x08, 0x11, 0x00, 0x01, 0x00, 0x01, 0x08, 0x11
	db 0x88, 0x51, 0xa8, 0x55, 0xaa, 0x51, 0xa8, 0x11
	db 0x88, 0x11, 0x88, 0x11, 0x88, 0x11, 0x88, 0x11
	db 0x88, 0xf1, 0xf8, 0xff, 0xfe, 0xf9, 0xe8, 0x91
	db 0x7f, 0x1f, 0x07, 0x01, 0x00, 0x01, 0x08, 0x11
	db 0xff, 0x5f, 0xaf, 0x55, 0xaa, 0x51, 0xa8, 0x11
	db 0xff, 0x1f, 0x8f, 0x11, 0x88, 0x11, 0x88, 0x11
	db 0xff, 0xff, 0xff, 0xff, 0xfe, 0xf9, 0xe8, 0x91
	db 0x00, 0x00, 0x00, 0x00, 0x01, 0x07, 0x1f, 0x7f
	db 0x80, 0x40, 0xa8, 0x54, 0xab, 0x57, 0xbf, 0x7f
	db 0x80, 0x00, 0x88, 0x10, 0x89, 0x17, 0x9f, 0x7f
	db 0x80, 0xe0, 0xf8, 0xfe, 0xff, 0xff, 0xff, 0xff
	db 0x2a, 0x15, 0x02, 0x01, 0x01, 0x07, 0x1f, 0x7f
	db 0xaa, 0x55, 0xaa, 0x55, 0xab, 0x57, 0xbf, 0x7f
	db 0xaa, 0x15, 0x8a, 0x11, 0x89, 0x17, 0x9f, 0x7f
	db 0xaa, 0xf5, 0xfa, 0xff, 0xff, 0xff, 0xff, 0xff
	db 0x08, 0x11, 0x00, 0x01, 0x01, 0x07, 0x1f, 0x7f
	db 0x88, 0x51, 0xa8, 0x55, 0xab, 0x57, 0xbf, 0x7f
	db 0x88, 0x11, 0x88, 0x11, 0x89, 0x17, 0x9f, 0x7f
	db 0x88, 0xf1, 0xf8, 0xff, 0xff, 0xff, 0xff, 0xff
	db 0x7f, 0x1f, 0x07, 0x01, 0x01, 0x07, 0x1f, 0x7f
	db 0xff, 0x5f, 0xaf, 0x55, 0xab, 0x57, 0xbf, 0x7f
	db 0xff, 0x1f, 0x8f, 0x11, 0x89, 0x17, 0x9f, 0x7f
	db 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	db 0x00, 0x05, 0x0a, 0x55, 0x2a, 0x15, 0x02, 0x01
	db 0x00, 0x01, 0x08, 0x11, 0x08, 0x11, 0x00, 0x01
	db 0x01, 0x07, 0x1f, 0x7f, 0x7f, 0x1f, 0x07, 0x01
	db 0xaa, 0x50, 0xa0, 0x00, 0x00, 0x00, 0x00, 0x00
	db 0xaa, 0x55, 0xaa, 0x55, 0x2a, 0x15, 0x02, 0x01
	db 0xaa, 0x51, 0xa8, 0x11, 0x08, 0x11, 0x00, 0x01
	db 0xab, 0x57, 0xbf, 0x7f, 0x7f, 0x1f, 0x07, 0x01
	db 0x88, 0x10, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
	db 0x88, 0x15, 0x8a, 0x55, 0x2a, 0x15, 0x02, 0x01
	db 0x88, 0x11, 0x88, 0x11, 0x08, 0x11, 0x00, 0x01
	db 0x89, 0x17, 0x9f, 0x7f, 0x7f, 0x1f, 0x07, 0x01
	db 0xfe, 0xf8, 0xe0, 0x80, 0x00, 0x00, 0x00, 0x00
	db 0xfe, 0xfd, 0xea, 0xd5, 0x2a, 0x15, 0x02, 0x01
	db 0xfe, 0xf9, 0xe8, 0x91, 0x08, 0x11, 0x00, 0x01
	db 0xff, 0xff, 0xff, 0xff, 0x7f, 0x1f, 0x07, 0x01
	db 0x00, 0x00, 0x00, 0x00, 0x80, 0x40, 0xa8, 0x54
	db 0x00, 0x05, 0x0a, 0x55, 0xaa, 0x55, 0xaa, 0x55
	db 0x00, 0x01, 0x08, 0x11, 0x88, 0x51, 0xa8, 0x55
	db 0x01, 0x07, 0x1f, 0x7f, 0xff, 0x5f, 0xaf, 0x55
	db 0xaa, 0x50, 0xa0, 0x00, 0x80, 0x40, 0xa8, 0x54
	db 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55
	db 0xaa, 0x51, 0xa8, 0x11, 0x88, 0x51, 0xa8, 0x55
	db 0xab, 0x57, 0xbf, 0x7f, 0xff, 0x5f, 0xaf, 0x55
	db 0x88, 0x10, 0x80, 0x00, 0x80, 0x40, 0xa8, 0x54
	db 0x88, 0x15, 0x8a, 0x55, 0xaa, 0x55, 0xaa, 0x55
	db 0x88, 0x11, 0x88, 0x11, 0x88, 0x51, 0xa8, 0x55
	db 0x89, 0x17, 0x9f, 0x7f, 0xff, 0x5f, 0xaf, 0x55
	db 0xfe, 0xf8, 0xe0, 0x80, 0x80, 0x40, 0xa8, 0x54
	db 0xfe, 0xfd, 0xea, 0xd5, 0xaa, 0x55, 0xaa, 0x55
	db 0xfe, 0xf9, 0xe8, 0x91, 0x88, 0x51, 0xa8, 0x55
	db 0xff, 0xff, 0xff, 0xff, 0xff, 0x5f, 0xaf, 0x55
	db 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x88, 0x10
	db 0x00, 0x05, 0x0a, 0x55, 0xaa, 0x15, 0x8a, 0x11
	db 0x00, 0x01, 0x08, 0x11, 0x88, 0x11, 0x88, 0x11
	db 0x01, 0x07, 0x1f, 0x7f, 0xff, 0x1f, 0x8f, 0x11
	db 0xaa, 0x50, 0xa0, 0x00, 0x80, 0x00, 0x88, 0x10
	db 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x15, 0x8a, 0x11
	db 0xaa, 0x51, 0xa8, 0x11, 0x88, 0x11, 0x88, 0x11
	db 0xab, 0x57, 0xbf, 0x7f, 0xff, 0x1f, 0x8f, 0x11
	db 0x88, 0x10, 0x80, 0x00, 0x80, 0x00, 0x88, 0x10
	db 0x88, 0x15, 0x8a, 0x55, 0xaa, 0x15, 0x8a, 0x11
	db 0x88, 0x11, 0x88, 0x11, 0x88, 0x11, 0x88, 0x11
	db 0x89, 0x17, 0x9f, 0x7f, 0xff, 0x1f, 0x8f, 0x11
	db 0xfe, 0xf8, 0xe0, 0x80, 0x80, 0x00, 0x88, 0x10
	db 0xfe, 0xfd, 0xea, 0xd5, 0xaa, 0x15, 0x8a, 0x11
	db 0xfe, 0xf9, 0xe8, 0x91, 0x88, 0x11, 0x88, 0x11
	db 0xff, 0xff, 0xff, 0xff, 0xff, 0x1f, 0x8f, 0x11
	db 0x00, 0x00, 0x00, 0x00, 0x80, 0xe0, 0xf8, 0xfe
	db 0x00, 0x05, 0x0a, 0x55, 0xaa, 0xf5, 0xfa, 0xff
	db 0x00, 0x01, 0x08, 0x11, 0x88, 0xf1, 0xf8, 0xff
	db 0x01, 0x07, 0x1f, 0x7f, 0xff, 0xff, 0xff, 0xff
	db 0xaa, 0x50, 0xa0, 0x00, 0x80, 0xe0, 0xf8, 0xfe
	db 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0xf5, 0xfa, 0xff
	db 0xaa, 0x51, 0xa8, 0x11, 0x88, 0xf1, 0xf8, 0xff
	db 0xab, 0x57, 0xbf, 0x7f, 0xff, 0xff, 0xff, 0xff
	db 0x88, 0x10, 0x80, 0x00, 0x80, 0xe0, 0xf8, 0xfe
	db 0x88, 0x15, 0x8a, 0x55, 0xaa, 0xf5, 0xfa, 0xff
	db 0x88, 0x11, 0x88, 0x11, 0x88, 0xf1, 0xf8, 0xff
	db 0x89, 0x17, 0x9f, 0x7f, 0xff, 0xff, 0xff, 0xff
	db 0xfe, 0xf8, 0xe0, 0x80, 0x80, 0xe0, 0xf8, 0xfe
	db 0xfe, 0xfd, 0xea, 0xd5, 0xaa, 0xf5, 0xfa, 0xff
	db 0xfe, 0xf9, 0xe8, 0x91, 0x88, 0xf1, 0xf8, 0xff
	db 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff