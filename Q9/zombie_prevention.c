#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid;

    for (int i = 0; i < 3; i++) {
        pid = fork();

        if (pid == 0) {
            // Child process
            printf("Child process created. PID: %d\n", getpid());
            return 0;
        }
    }

    // Parent process cleans children
    int status;
    pid_t child_pid;

    while ((child_pid = wait(&status)) > 0) {
        printf("Parent cleaned child process with PID: %d\n", child_pid);
    }

    return 0;
}
