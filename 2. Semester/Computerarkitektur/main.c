#include <stdlib.h> // For malloc
#include <stdio.h> // For printf
#include <time.h> // For time

int main(){
    printf("Integers are %d bytes in this computer\n", (int) sizeof(int));
    unsigned long long i=0;
    double time1, timedif;
    time1 = ((double) clock());
    time1 = time1 / CLOCKS_PER_SEC;

    void *memory = NULL;

    while(1){
    // Try to allocate 'i' million ints
    
    memory = realloc(memory, i * 1E6 * sizeof(int));

    if(memory == NULL){
        // malloc failed to allocate the memory we asked for
        timedif = ( ((double) clock()) / CLOCKS_PER_SEC) - time1;
        printf("The elapsed time is %lf ms\n", timedif*1000);
        return -1;
    }

    // 'llu' is for 'long long unsigned'
    printf("Successfully allocated %llu million integers\n", i);
    ++i;
    }
    return 0;
}