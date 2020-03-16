#include <stdio.h>
#include <stdlib.h>

int main(void) {

	for (int n = 100; n >= 0; n--) {
		if (n % 11 == 0) {
			printf("%d\n", n);
		}
	}

	return EXIT_SUCCESS;
}
