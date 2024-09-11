#include <stdio.h>
#include <math.h>

void bin(unsigned n) {
    unsigned i;

    for (i = 1 << 7; i > 0; i = i / 2)
        (n & i) ? printf("1") : printf("0");
    
    printf("\n");
}

int arithmetic_shift(unsigned x, int n) {
    if (x < 128) {
        return x >> n;
    }
    else {
        int extra_bits = 0;

        for (int i = 8-n; i < 8; i++) {
            extra_bits += pow(2, i);
        }
        return (x >> n) + extra_bits;
    }
}

void problem214() {
    int a = 0x55;
    int b = 0x46;

    bin(a);
    bin(b);

    bin(a & b);
    bin(a | b);
    bin(~a & ~b);
    bin(a & !b);
    bin(a && b);
    bin(a || b);
    bin(!a || !b);
    bin(a && ~b);
}

void problem216() {
    int a[4] = {0xD4, 0x64, 0x72, 0x44};

    for (int i = 0; i < 4; i++) {
        bin(a[i]);

        printf("a << 2\n");
        printf("hex: %X \nbinary: ", a[i] << 2);
        bin(a[i] << 2);
        printf("\n");
    }

    for (int i = 0; i < 4; i++) {
        bin(a[i]);

        printf("a >> 3 (logical)\n");
        printf("hex: %X \nbinary: ", (unsigned) a[i] >> 3);
        bin((unsigned) a[i] >> 3);
        printf("\n");
    }

    // Couldnt get arithmatic shift to work so i made my own that works with 8 bits only
    for (int i = 0; i < 4; i++) {
        bin(a[i]);

        printf("a >> 3 (arithmetic)\n");
        printf("hex: %X \nbinary: ", arithmetic_shift(a[i], 3));
        bin(arithmetic_shift(a[i], 3));
        printf("\n");
    }
}

int main(void) {
    problem216();

    return 0;
}