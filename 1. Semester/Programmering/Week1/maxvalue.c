/*
 * Computes the maximum of two values.
 */

#include <stdio.h>

int main(void) {
	int x;   /* first value */
	int y;   /* second value */
	int max; /* maximum of the two values */

	scanf("%d", &x);
	scanf("%d", &y);

	if (x <= y)
		max = y;
	else
		max = x;

	printf("The maximum is %d.\n", max);

	return 0;
}