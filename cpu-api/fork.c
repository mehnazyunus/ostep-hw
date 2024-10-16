#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <unistd.h>

void wait_or_die()
{
    int rc = wait(NULL);
    assert(rc > 0);
}

int fork_or_die()
{
    int rc = fork();
    assert(rc >= 0);
    return rc;
}

int main(int argc, char *argv[])
{
    int x = 100;
    // process a
    int ret = fork_or_die();
    if (ret == 0)
    {
        int ret = close(STDOUT_FILENO);
        printf("child ret - %d\n", ret);
    }
    else
    {
        //     int status;
        //     int w = wait(&status);
        printf("goodbye - parent - w - %d\n", x);
        x++;
    }

    x++;
    printf("pid %d - x - %d\n", ret, x);

    return 0;
}