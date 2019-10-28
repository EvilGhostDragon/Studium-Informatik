#include <stdio.h>
#include <stdlib.h>

int main(void) {

	int f0 = 0;
	int f1 = 1;
	int f2 = 1;
	int n = 0;
	printf("Input n: ");
	scanf("%d", &n);
	printf("%d\n", f0);
	while (f2 <= n) {
		printf("%d\n", f2);
		f1 = f0;
		f0 = f2;
		f2 = f0 + f1;
	}

	return EXIT_SUCCESS;
}