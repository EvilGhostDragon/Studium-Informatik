#include <stdio.h>

int main() {
	int n = 27;

	for (int i = n; i >= 0; i--) {
		if (i % 13 == 0)
			printf("%d\n", i);
	}

	return 0;
}