#include <stdio.h>

/*!
	Prints a table of start addresses for each line of the ZX Spectrum's display.
*/
int main(int argc, char *argv[]) {
	printf("dw ");
	for(int y = 0; y < 24; y++) {
		const int screen_y = 23 - y;
		const int address = 0x4000 + ((screen_y & 7) << 5) + ((screen_y & 24) << 8);
		printf("0x%02x", address);
		if(y != 23) printf(", ");
	}
	
	return 0;
}
