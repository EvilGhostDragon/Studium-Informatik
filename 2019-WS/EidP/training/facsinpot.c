#include <stdio.h>
#include <stdlib.h>

#define RAND_MAX 99

int fac(int a) {

	if (a == 0)
		return 1;
	return (a * fac(a >= 0 ? a - 1 : a + 1));
}

int main() {
	int input = 0;
	// printf("%d \n", fac(-4));
	for (;;) {
		scanf("%d", &input);
		printf("%d\n", rand());
		printf("%d\n", 0 ^ 1);
		printf("%d\n", ~(0101 >> 1));
		printf("%d\n", (0b110 >> 1));
		printf("%i\n\n", 3 & 1);

		for (int i = 1; i <= input; i++) {
			for (int ii = i; ii <= input; ii++) {
				printf("0%d ", ii);
			}
			printf("\n");
		}
	}
	return 0;
}

/*
1100
010

1100
1100

1100

1100
1000
1000


*/