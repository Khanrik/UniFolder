#include <stdio.h> // For console output
#include <stdlib.h> // For parsing program argument strings
#include <time.h> // For time measurements


// Size of the array (per dimension) to sum 
unsigned long N = 20;

// TODO add implementation of sumarraycols
int sumarrayrows(int **a){
	int i, j, sum = 0;
	for (i = 0; i < N; i++)
		for (j = 0; j < N; j++)
			sum += a[i][j];
	return sum;
}

// TODO add implementation of sumarraycols
int sumarraycols(int **a){
	int i, j, sum = 0;
	for (j = 0; j < N; j++)
		for (i = 0; i < N; i++)
			sum += a[i][j];
	return sum;
}

// Compile with the following command:
// gcc -O0 -o sum sum.c 
// Run it with the following command:
// ./sum 100
int main(int argc, char** argv){

    // Parse the array size from program arguments (if present)
    if(argc > 1){
        // The first argument (argv[0]) is always the file 
        // path of the program. Any additional arguments are 
        // in argv[1], argv[2], ...
        // 'argc' (argument count) tells us how many arguments were given
        N = (unsigned long) atol(argv[1]);
    }
    printf("Array size: %lu\n", N*N);

    // TODO Allocate a 2D array and fill it

    int **a = malloc(N * sizeof(int*));
    for (int i = 0; i < N; i++) {
        a[i] = malloc(N * sizeof(int));
    }
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            a[i][j] = i*j;
        }
    }

    // Run both sum functions and measure their time 
    clock_t start = clock();
    int sum_rows = sumarrayrows(a);
    clock_t mid = clock();
    int sum_cols = sumarraycols(a);
    clock_t end = clock();
    
    // Calculate time duration and print
    float rows_ms = 1000 * (float)(mid - start) / CLOCKS_PER_SEC;
    float cols_ms = 1000 * (float)(end - mid) / CLOCKS_PER_SEC;
    printf("\nRows: %.3f ms\nCols: %.3f ms\n", rows_ms, cols_ms);

    return 0;
}