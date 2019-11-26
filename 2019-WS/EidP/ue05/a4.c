#include <stdio.h>
#include <stdlib.h>
int main(void) {
	double b, c;       // random x and y coordinates
	long long sum = 0; // number of points in the 1st quadrant of the unit circle
	long long a = 1;   // iteration variable
	double d;          // radius squared
	long long e = 0;   // number of iterations that are to ba made
	double result;     // approximation of pi
	printf(" Enter the number of iterations used to estimate pi: ");
	scanf("%lld", &e);
	srand(1); // initialize random numbers generator
	while (a < e) {
		b = (double)rand() / (double)RAND_MAX; // normalize coordinate to [0 ,1]
		c = (double)rand() / (double)RAND_MAX; // normalize coordinate to [0 ,1]
		d = b * b + c * c;                     // general form of the equation of a circle
		if (d <= 1) {
			++sum; // increment the number of points that are located in the circle
		}
		a++;
	}
	result = (long double)sum / (long double)e *
	         4.0; // multiplication by four to get estimation for the fullcircle
	printf(" Number of iterations = %lld \t estimate of pi is %.10f\n", e, result);
}