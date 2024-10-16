#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <sched.h>

#define PAGESIZE 4096
// #define NLOOPS 1000000

int main(int argc, char *argv[])
{
    if (argc < 3)
    {
        printf("Please provide arguments\n");
        exit(0);
    }

    cpu_set_t mask;
    CPU_ZERO(&mask);
    CPU_SET(0, &mask);
    int result = sched_setaffinity(0, sizeof(mask), &mask);

    if (result < 0)
    {
        printf("could not pin to core");
        exit(0);
    }

    int NUMPAGES = atoi(argv[1]);
    int NLOOPS = atoi(argv[2]);
    struct timespec ts_start;
    struct timespec ts_end;
    int jump = PAGESIZE / sizeof(int); // to jump into the next page
    int a[NUMPAGES * jump];

    for (int i = 0; i < NUMPAGES * jump; i += jump)
    {
        a[i] = 0;
    }

    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    for (int j = 0; j < NLOOPS; ++j)
    {
        for (int i = 0; i < NUMPAGES * jump; i += jump)
        {
            a[i] += 1;
        }
    }

    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    unsigned long time_taken = (ts_end.tv_nsec - ts_start.tv_nsec);// * 10 / (NLOOPS * NUMPAGES);
    printf("%lu \n", time_taken);
}
// PRIu64