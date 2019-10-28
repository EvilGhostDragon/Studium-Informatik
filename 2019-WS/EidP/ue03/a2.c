#include <stdio.h>

int main() {
	int sum = 0;
	int n = 3;

	for (int i = 1; i <= n; i++) {
		sum = sum + i;
	}
	printf("%d", sum);

	return 0;
}