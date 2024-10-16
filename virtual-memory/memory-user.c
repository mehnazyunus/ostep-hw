#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        exit(-1);
    }

    int total_memory = atoi(argv[1]);
    int size = sizeof(int) * total_memory * 1024 * 1024 / 4;
    int *bytes = (int *)malloc(size);

    for (int i = 0; i < size / 4; ++i)
    {
        // printf("%d", bytes[i]);
        int x = bytes[i];
    }

    free(bytes);
    exit(0);
}