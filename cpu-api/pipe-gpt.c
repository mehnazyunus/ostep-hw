#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#define BUFFER_SIZE 1024

int main()
{
    int pipefd[2];
    pid_t cpid1, cpid2;

    // Create the pipe
    if (pipe(pipefd) == -1)
    {
        perror("pipe");
        exit(EXIT_FAILURE);
    }

    // Create the first child process
    cpid1 = fork();
    if (cpid1 == -1)
    {
        perror("fork");
        exit(EXIT_FAILURE);
    }

    if (cpid1 == 0)
    { // Child 1
        // Close the unused read end of the pipe
        close(pipefd[0]);

        // Redirect stdout to the write end of the pipe
        if (dup2(pipefd[1], STDOUT_FILENO) == -1)
        {
            perror("dup2");
            exit(EXIT_FAILURE);
        }

        // Close the write end of the pipe (it's already duplicated)
        close(pipefd[1]);

        // Execute a command (e.g., "ls" to list directory contents)
        printf("hello from child1");

        exit(EXIT_FAILURE);
    }

    // Create the second child process
    cpid2 = fork();
    if (cpid2 == -1)
    {
        perror("fork");
        exit(EXIT_FAILURE);
    }

    if (cpid2 == 0)
    { // Child 2
        // Close the unused write end of the pipe
        close(pipefd[1]);

        // Redirect stdin to the read end of the pipe
        if (dup2(pipefd[0], STDIN_FILENO) == -1)
        {
            perror("dup2");
            exit(EXIT_FAILURE);
        }

        // Close the read end of the pipe (it's already duplicated)
        close(pipefd[0]);

        // Read from stdin and print to stdout
        char buffer[BUFFER_SIZE];
        ssize_t bytes_read;
        while ((bytes_read = read(STDIN_FILENO, buffer, BUFFER_SIZE)) > 0)
        {
            printf("reading from stdin %ld", bytes_read);

            if (write(STDOUT_FILENO, buffer, bytes_read) != bytes_read)
            {
                perror("write");
                exit(EXIT_FAILURE);
            }
        }

        if (bytes_read == -1)
        {
            perror("read");
            exit(EXIT_FAILURE);
        }

        exit(EXIT_SUCCESS);
    }

    // Parent process closes both ends of the pipe
    close(pipefd[0]);
    close(pipefd[1]);

    // Wait for both children to finish
    waitpid(cpid1, NULL, 0);
    waitpid(cpid2, NULL, 0);

    return 0;
}
