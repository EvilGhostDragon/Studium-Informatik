#include <stdio.h>
#include <stdlib.h>

int main() {
	int n = 14;

	if (n % 7 == 0) {
		printf("The given value %d is divisable by seven!\n", n);

	} else {
		printf("The given value %d is not divisable by seven!\n", n);
	}
	return EXIT_SUCCESS;
}