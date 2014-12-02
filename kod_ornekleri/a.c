/* -*- compile-command: "gcc a.c -o a && ./a"; -*- */

#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[])
{
        for (int i = 0; i < 3; ++i)
        {
                printf("i: %d, i * i : %d\n", i, i * i);
        }
        printf("Hello test %s. Length of first argument is %lu\n", argv[1], strlen(argv[1]));
        return 0;
}
