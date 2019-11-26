#include <stdio.h>
#include <stdlib.h>
int count = 0;

void print_n(int n) {

	printf("%d ", n);
	if (n == 1)
		count++;
	if (count >= 3)
		return;
	if (n % 2 == 0)
		print_n(n / 2);
	else
		print_n(3 * n + 1);
}

int main() {

	print_n(19);
	return EXIT_SUCCESS;
}