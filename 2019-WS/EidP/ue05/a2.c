#include <float.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
	float f = 1;
	double d = 1;
	long double ld = 1;

	for (;;) {
		if (1 != f + 1)
			f = f / 2;

		if (1 != d + 1)
			d = d / 2;

		if (1 != ld + 1)
			ld = ld / 2;

		else
			break;
	}
	printf("\t\tFloat\t\tDouble\t\tLong Double\n");
	printf("Program:\t");
	printf("%e\t%e\t%Le\n", f, d, ld);
	printf("Float.h:\t");
	printf("%e\t%e\t%Le\n", FLT_EPSILON, DBL_EPSILON, LDBL_EPSILON);
}