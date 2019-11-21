#include <stdio.h>
#include <stdlib.h>

int main()
{

    int input;
    printf("Steps? [2-16]\n");
    scanf("%d", &input);

    if (input < 2 || input > 16)
    {
        printf("Error: The given number of stepp %d is not between 2 and 16!", input);
        return EXIT_FAILURE;
    }
    for (int i = 1; i < input + 2; i++)
    {
        for (int ii = 1; ii < i; ii++)
        {
            printf("%02d ", ii);
        }

        printf("\n");
    }

    return EXIT_SUCCESS;
}