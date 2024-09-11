#include <stdio.h>

typedef unsigned char *pointer;

void show_bytes(pointer start, size_t len)
{
    size_t i;
    for (i = 0; i < len; i++)
        printf("%p\t0x%.2x\n",start+i, start[i]);
    
    printf("\n");
    return;
}

int main(void)
{
    int a = 0x12345678;
    pointer ap = &a;
    show_bytes(ap, 1); /* A. */
    show_bytes(ap, 2); /* B. */ 
    show_bytes(ap, 3); /* C. */
    return 0;
}