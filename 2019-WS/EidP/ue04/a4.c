#include <stdio.h>
#include <stdlib.h>

int main(void) {
	int n = 100, i, count = 0, c;

	for (i = 1; i <= n; i++) {
		for (c = 2; c < i; c++) {
			if (i % c == 0)
				break;
		}
		if (c == i) {
			printf("%d\t", i);
			count++;
			if (count >= 15) {
				printf("\n");
				count = 0;
			}
		}
	}
	printf("\n");
	return EXIT_SUCCESS;
}