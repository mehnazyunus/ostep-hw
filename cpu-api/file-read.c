#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h> // For open() and O_* constants

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
    int fd = open("test.txt", O_WRONLY | O_CREAT | O_TRUNC, 0644    );
    int ret = fork_or_die();
    const char *data = "Hello, world!\n";
    ssize_t bytes_written = write(fd, data, sizeof(data));
    if (bytes_written == -1)
    {
        perror("Error writing to file");
        close(fd);
        return 1;
    }

    // Close the file
    if (close(fd) == -1)
    {
        perror("Error closing file");
        return 1;
    }

    x++;
    printf("pid %d - x - %d\n", ret, x);

    return 0;
}