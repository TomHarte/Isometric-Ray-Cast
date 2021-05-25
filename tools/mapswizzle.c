#include <stdio.h>
#include <stdint.h>

/*!
	Reads 16kb from stdin, representing a map in Ant Attack format,
	rearranges it into the format used by my code and writes it
	to stdout.

	i.e. expected usage is mapswizzle << map.dat >> swizzled_map.dat
*/
int main(int argc, char *argv[]) {
	uint8_t map[16384];
	uint8_t dest[16384];
	fread(map, 1, 16384, stdin);

	for(int ix = 0; ix < 128; ix++) {
		for(int iy = 0; iy < 128; iy++) {
			uint8_t mask = 0x80;
			uint8_t result = 0;
			int x = ix, y = iy;

			while(mask) {
				const int address = ((x & 127) * 128) + ((y & 127) ^ 127);
				result |= map[address] & mask;
				mask >>= 1;
				--x;
				--y;
			}

			const int address = ((ix & 127) * 128) + (iy & 127);
			dest[address] = result;
		}
	}

	fwrite(dest, 1, 16384, stdout);

	return 0;
}