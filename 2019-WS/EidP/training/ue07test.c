
#include <stdio.h>
#include <stdlib.h>
int i;
void z(int a, int n) {
	printf("z(): ");
	for (i = 1; i < n && a * i > 0; ++i) {
		int i = n / 2;
		printf("%d ", i);
	}
	printf("\n");
}
int b(int x, int y) {
	return i++ + x + y;
}
int main(void) {
	int x = 1, y = 3;
	printf("i = %d, f = %d, y = %d \n", i, b(x, y), y);
	{
		z(x, y);
		int x = 10;
		long double z = 20.5;
		printf("i = %d, f = %d, z = %.1Lf \n", i, b(x, (int)z), z);
	}
	z(x, y);
	return EXIT_SUCCESS;
}