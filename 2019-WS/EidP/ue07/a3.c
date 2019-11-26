#include <stdio.h>
#include <stdlib.h>

void dump(int array[], int length) {

	printf("ARRAY: %d", array[0]);
	for (int i = 1; i < length && i < 10; i++)
		printf(", %d", array[i]);

	printf("\n");
}

int fill(int array[], int length) {

	for (int i = 1; i <= length; i++) {
		array[i - 1] = i;
	}
	return *array;
}

void reverse(int array[], int length) {
	int revArray[length];
	dump(array, length);

	for (int i = 0; i < length; i++) {
		revArray[i] = array[length - i - 1];
	}
	dump(revArray, length);
}

int main() {

	int arrayLength = 5;
	int array[arrayLength];

	*array = fill(array, arrayLength);

	dump(array, arrayLength);
	fill(array, arrayLength);
	printf("\n");
	reverse(array, arrayLength);

	printf("\n\n");

	return EXIT_SUCCESS;
}