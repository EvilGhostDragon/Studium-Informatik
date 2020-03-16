#include <stdio.h>
#include <stdlib.h>

int main(void) {
	enum input { mon = 1, tue, wen, thu, fri, sat, sun };
	int input;
	printf("Input day [1-7]: ");
	scanf("%d", &input);

	switch (input) {
	case mon: printf("Monday \n"); break;
	case tue: printf("Tuesday \n"); break;
	case wen: printf("Wednesday \n"); break;
	case thu: printf("Thursday \n"); break;
	case fri: printf("Friday \n"); break;
	case sat: printf("Saturday \n"); break;
	case sun: printf("Sunday \n"); break;
	default:
		printf("ERROR: Wrong input! Expected a number between 1 and 7 (boundaries included). \n");
		break;
	}

	return EXIT_SUCCESS;
}
