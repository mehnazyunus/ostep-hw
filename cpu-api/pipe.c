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
    int p[2];
    if (pipe(p) == -1)
    {
        perror("pipe");
        exit(EXIT_FAILURE);
    }

    int child1 = fork_or_die();
    if (child1 == 0)
    {
        close(p[0]);

        // stdout to write end of pipe
        if (dup2(p[1], STDOUT_FILENO) == -1)
        {
            perror("dup2");
            exit(EXIT_FAILURE);
        }
        close(p[1]);
        printf("hello from child1\n");
        exit(0);
    }

    int child2 = fork_or_die();
    if (child2 == 0)
    {
        close(p[1]);

        // stdin to read end of pipe
        if (dup2(p[0], STDIN_FILENO) == -1)
        {
            perror("dup2");
            exit(EXIT_FAILURE);
        }

        close(p[0]);

        char buffer[512];
        int nbytes = read(0, buffer, sizeof(buffer));
        if (nbytes > 0)
        {
            printf("reading from stdin %d\n", nbytes);
            write(1, buffer, nbytes);
        }

        exit(0);
    }

    close(p[0]);
    close(p[1]);

    return 0;
}