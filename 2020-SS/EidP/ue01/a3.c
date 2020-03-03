#include <stdio.h>
#include <stdlib.h>

int main(void) {

	int sum = 0;
	int n = 3;
	int i = 1;

	while (i <= n) {
		sum = sum + i;
		i++;
	}

	printf("sum: %d\n", sum);
	return EXIT_SUCCESS;
}