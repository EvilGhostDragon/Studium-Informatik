#include <stdio.h>
#include <stdlib.h>
double my_pow(double a, unsigned n)
{

    if (n == 0)
        return 1;
    return (a * my_pow(a, n - 1));
}

double my_abs(double a)
{
    return (a >= 0 ? a : a * -1);
}
double my_avg(double a, double b)
{
    return ((a + b) / 2);
}

double my_sqrt(double x, double max_error)
{
    double low = 0;
    double high = x;
    double y = 1;
    for (;;)
    {

        y = my_avg(low, high);
        if (my_pow(y, 2) > x)
            high = y;
        else
            low = y;

        if ((max_error < my_abs(my_pow(y, 2) - x)) < max_error)
            break;
    }
    return y;
}

void print_table(double x)
{
}
int main()
{

    return EXIT_SUCCESS;
}