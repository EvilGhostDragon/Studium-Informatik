#include <stdio.h>
#include <stdlib.h>

void print_watch(char watch[][4]) {
	for (int i = 3; i >= 0; i--) {

		for (int ii = 0; ii < 6; ii++) {
			printf("%c ", watch[ii][i]);
		}
		printf("\n");
	}
}

void calculate_watch(int digit[], char watch[][4]) {

	int temp = 0;

	for (int i = 0; i < 6; i++) {

		temp = digit[i];
		for (int ii = 0; ii < 4; ii++) {
			(temp % 2) ? (watch[i][ii] = 'X') : (watch[i][ii] = '-');
			temp = temp / 2;
		}
	}
}

void print_digits(int digit[]) {
	for (int i = 0; i < 6; i++) {
		printf("%d ", digit[i]);
	}
}

void calculate_digits(int digit[], int h, int min, int sec) {

	int temp = 0;

	for (int i = 0; i < 6; i++) {
		if (i == 0)
			temp = h;
		else if (i == 2)
			temp = min;
		else if (i == 4)
			temp = sec;

		(i % 2 == 0) ? (digit[i] = temp / 10) : (digit[i] = temp % 10);
	}
}

int main(void) {
	int hours = 10;
	int minutes = 37;
	int seconds = 49;
	char watch[6][4] = { { 0 } };
	int digit[6] = { 0 };
	calculate_digits(digit, hours, minutes, seconds);
	print_digits(digit);
	printf("\n");
	calculate_watch(digit, watch);
	print_watch(watch);
	return EXIT_SUCCESS;
}