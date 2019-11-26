#include <stdio.h>
#include <stdlib.h>

int main(void) {
	enum { black_ops, top_secret, secret, non_secret };

	for (int i = black_ops; i <= non_secret; i++) {
		switch (i) {
		case 0: printf("Welcome Mister Bond! \n"); break;
		case 1: printf("Welcome Q. \n"); break;
		case 2: printf("Please leave now!\n"); break;
		default: printf("Warning, The Police have been Called.\n"); break;
		}
	}
	return EXIT_SUCCESS;
}