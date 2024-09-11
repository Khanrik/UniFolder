## Boolean Algebra
### 1. 
Using the bit vector table in problem 2.9, find the colors that we get by the following Boolean operations (~: not, &: and, |: or, ^: xor).
![[Pasted image 20240209103109.png]]
#### a. Cyan ^ Magenta


#### b. Cyan ^ Cyan


#### c. Red & Green & Blue


#### d. Green ^ Green ^ Green


#### e. Cyan & Red | Blue


#### f. Blue | Cyan & Red

## Bit Manipulations
### 1.
Calculate the decimal result of the following operations (hint: use binary representation). Try to resist the temptation of using a calculator and embrace the only time in your life when you do it on paper.
#### a. 55 & 30


#### b. 323 | 432


#### c. 745 ^ 560


#### d. ~ 43 (assuming 8 bit length)


### 2.
Discuss and solve Practice Problem 2.12
#### Exercise 2.12
Write C expressions, in terms of variable x, for the following values. Your code should work for any word size w ≥ 8. For reference, we show the result of evaluating the expressions for x = 0x87654321, with w = 32.

##### A. The least significant byte of x, with all other bits set to 0 \[0x00000021]


##### B. All but the least significant byte of x complemented, with the least significant byte left unchanged \[0x789ABC21]


##### C. The least significant byte set to all ones, and all other bytes of x left unchanged \[0x876543FF]


#### a. Extra task: Invert the second byte from the right, set all other bytes to zero \[0x0000BC00]


### 3.
Discuss and solve Practice Problem 2.14

#### Exercise 2.14
Suppose that a and b have byte values 0x55 and 0x46, respectively. Fill in the following table indicating the byte values of the different C expressions:



| Expression | Value | Expression | Value |
| ---------- | ----- | ---------- | ----- |
| a & b      |       | a && b     |       |
| a \| b     |       | a \|\| b   |       |
| ~a \| ~b   |       | !a \|\| !b |       |
| a & !b     |       | a && ~b    |       |

### 4.
Discuss and solve Practice Problem 2.16

#### Exercise 2.16
Fill in the table below showing the effects of the different shift operations on single-byte quantities. The best way to think about shift operations is to work with binary representations. Convert the initial values to binary, perform the shifts, and then convert back to hexadecimal. Each of the answers should be 8 binary digits or 2 hexadecimal digits.

| a    | a      | a<<2   | a<<2 | a>>3 (Logical) | a>>3 (Logical) | a>>3 (Arithmetic) | a>>3 (Arithmetic) |
| ---- | ------ | ------ | ---- | -------------- | -------------- | ----------------- | ----------------- |
| Hex  | Binary | Binary | Hex  | Binary         | Hex            | Binary            | Hex               |
| 0xD4 |        |        |      |                |                |                   |                   |
| 0x64 |        |        |      |                |                |                   |                   |
| 0x72 |        |        |      |                |                |                   |                   |
| 0x44 |        |        |      |                |                |                   |                   |

## Integers
### 1. For two’s complement, write the following integers in binary:
#### a. 1


#### b. -1


#### c. 1337


#### d. -1337


#### e. 42


#### f. -42


### 2.
Convert the following two’s complement to their unsigned counterpart:
#### a. - 1337


#### b. 42


#### c. 3007


#### d. -8008


### 3. 
Analyse the following C program

```c
#include <stdio.h> 
#include <limits.h> 
int main(void) 
{ 
	int highest = INT_MAX; 
	printf("%d\n", highest);
	
	highest += 1; 
	printf("%d\n", highest);
	
	return 0; 
}
```

#### a. What do you think the first print statement will print?


#### b. What do you think the second print statement will print?


#### c. Discuss: what you think will happen and why?


## Programming
### 1.
Write a C program for Problem 2.8 and test the results. Define “a” and “b” as integers in binary form. This example helps you start up the program and define “a” and “b”:

```c
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
```