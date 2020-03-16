#include <stdio.h>
#include <stdlib.h>

int main(void) {

	float input = 0;
	float sum = 0;
	int count = 0;
	float min = 0;
	float max = 0;
	float average = 0;
	printf("Enter a number, 0 or negative numbers end the programm: \n");

	while (1) {
		scanf("%f", &input);
		if (input <= 0)
			break;
		count++;
		sum += input;
		average = sum / count;
		if (min >= input || min == 0)
			min = input;
		if (max <= input || max == 0)
			max = input;
	}

	printf("\n Sum: %.2f\n Count: %d\n Min: %.2f\n Max: %.2f\n Average: %.2f\n\n", sum, count, min,
	       max, average);

	return EXIT_SUCCESS;
}
