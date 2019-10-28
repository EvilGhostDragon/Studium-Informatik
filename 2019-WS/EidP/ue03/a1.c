#include <stdio.h>

int main() {
	int n;
	printf("Geben Sie eine ganze Zahl ein: ");
	scanf("%d", &n);
	if (n % 7 == 0) {
		printf("Die Zahl %d ist durch 7 teilbar", n);
	} else {
		printf("Die Zahl %d ist nicht durch 7 teilbar", n);
	}
	return 0;
}