#include <stdio.h>
#include <limits.h>

int main() {
    printf("INT_MIN + INT_MIN = %d\n", INT_MIN + INT_MIN);
    printf("INT_MIN + INT_MAX = %d\n", INT_MIN + INT_MAX);
    printf("INT_MAX + INT_MAX = %d\n", INT_MAX + INT_MAX);

    return 0;
}