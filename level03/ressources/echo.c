#include <stdio.h>

int main() {
    execvp("/bin/sh", NULL);
}