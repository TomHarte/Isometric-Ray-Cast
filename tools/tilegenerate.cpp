#include <cstdio>
#include <cstdint>

/*!
	Outputs the tile data necessary to perform the strictly
	2d portion of plotting.
*/
int main(int argc, char *argv[]) {
	const uint8_t patterns[][4] = {
		{0b0000'0000, 0b0000'0000, 0b0000'0000, 0b0000'0000},
		{0b1010'1010, 0b0101'0101, 0b1010'1010, 0b0101'0101},
		{0b1000'1000, 0b0001'0001, 0b1000'1000, 0b0001'0001},
		{0b1111'1111, 0b1111'1111, 0b1111'1111, 0b1111'1111},
	};

	const uint8_t masks[4] = {
		0b1000'0000, 0b1110'0000, 0b1111'1000, 0b1111'1110
	};

	// Addressing is: [flip]	[b1][m1][t1][b0]	[m0][t0]

	for(int n = 0; n < 4*4*4*2; n++) {
		
		const int flip 		= n >> 6;
		const int bottom	= ((n >> 4) & 2) | ((n >> 2) & 1);
		const int middle	= ((n >> 3) & 2) | ((n >> 1) & 1);
		const int top		= ((n >> 2) & 2) | ((n >> 0) & 1);

		printf("db ");

		if(flip) {
			for(int c = 0; c < 8; c++) {
				const uint8_t left_pattern = patterns[middle][c&3];
				const uint8_t right_pattern = (c < 4) ? patterns[top][c&3] : patterns[bottom][c&3];
				const int mask_c = ((c&4) ? 0 : 3) ^ (c & 3);
				const uint8_t mask = masks[mask_c];
				
				printf("0x%02x", (right_pattern & mask) | (left_pattern & ~mask));
				if(c != 7) printf(", ");
			}			
		} else {
			for(int c = 0; c < 8; c++) {
				const uint8_t left_pattern = patterns[middle][c&3];
				const uint8_t right_pattern = (c < 4) ? patterns[top][c&3] : patterns[bottom][c&3];
				const int mask_c = ((c&4) ? 0 : 3) ^ (c & 3);

				const uint8_t mask = 
					((masks[mask_c] & 0x80) ? 0x01 : 0x00) |
					((masks[mask_c] & 0x40) ? 0x02 : 0x00) |
					((masks[mask_c] & 0x20) ? 0x04 : 0x00) |
					((masks[mask_c] & 0x10) ? 0x08 : 0x00) |
					((masks[mask_c] & 0x08) ? 0x10 : 0x00) |
					((masks[mask_c] & 0x04) ? 0x20 : 0x00) |
					((masks[mask_c] & 0x02) ? 0x40 : 0x00) |
					((masks[mask_c] & 0x01) ? 0x80 : 0x00);
				
				printf("0x%02x", (right_pattern & mask) | (left_pattern & ~mask));
				if(c != 7) printf(", ");
			}
		}

		printf("\n");
	}

	return 0;
}
