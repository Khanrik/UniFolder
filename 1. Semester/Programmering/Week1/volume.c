/*
 * Computes the volume of a cuboid that has a cavity.
 */

#include <stdio.h>

#define CAVITY 98 /* cavity volume */

int height; /* height of the cuboid */
int length; /* length of the cuboid */
int width;  /* width of the cuboid  */

int volume; /* volume of the cuboid including the cavity */

int main(void)
{
    scanf("%d",&height);
    scanf("%d",&length);
    scanf("%d",&width);
    
    volume = height * length * width - CAVITY;
    
    printf("The volume is %d.\n", volume);
    
    return 0;
}