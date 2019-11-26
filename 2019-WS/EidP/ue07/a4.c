#include <stdio.h>
#include <stdlib.h>
void printArray(int array[], int length) {
	for (int i = 0; i < length; i++)
		printf("%d ", array[i]);
	printf("\n");
}

void swap(int array[], int pos) {
	int temp = array[pos];
	array[pos] = array[pos + 1];
	array[pos + 1] = temp;
}

void bubbleSort(int array[], int n) {
	for (int i = 0; i < n - 1; i++)
		for (int ii = 0; ii < n - i - 1; ii++)
			if (array[ii] > array[ii + 1]) {
				printArray(array, 5);
				swap(array, ii);
			}
}

int main() {
	int unsorted[] = { 3, 6, 1, 2, 4 };
	printf("Unsorted array: \n");
	bubbleSort(unsorted, 5);
	printf("Sorted array: \n");
	printArray(unsorted, 5);
	return EXIT_SUCCESS;
}