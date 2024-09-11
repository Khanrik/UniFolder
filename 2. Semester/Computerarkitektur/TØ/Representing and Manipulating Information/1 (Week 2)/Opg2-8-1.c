#include <stdio.h>

void bin(unsigned n) {
    unsigned i;

    for (i = 1 << 7; i > 0; i = i / 2)
        (n & i) ? printf("1") : printf("0");
    
    printf("\n");
}

int main() { 
    int a = 0b01001110;
    int b = 0b11100001;

    bin(~a);
    bin(~b);
    bin(a & b);
    bin(a | b);
    bin(a ^ b);

    return 0;
}