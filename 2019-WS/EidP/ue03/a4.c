#include <stdio.h>

int main() {
	int x = 234;
	int y = 948;
	int temp = 0;

	printf("Vor dem Tausch: %d, %d\n", x, y);

	temp = x;
	x = y;
	y = temp;

	printf("Nach dem Tausch: %d, %d\n", x, y);
	return 0;
}