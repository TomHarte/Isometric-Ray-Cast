#include <stdio.h>

/*!
	Outputs the log2 table used by this project for ray casting.
*/
int main(int argc, char *argv[]) {
	printf("db ");
	for(int c = 0; c < 256; c++) {
		int mask = 0x80;
		while(mask && !(c&mask)) mask >>= 1;
		printf("%d", mask);
		if(c != 255) printf(", ");
	}
	
	return 0;
}
