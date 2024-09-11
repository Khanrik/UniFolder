## 1. Discuss and solve Practice Problem 3.1
Assume the following values are stored at the indicated memory addresses and registers:

| Address | Value |     | Register | Value |
| ------- | ----- | --- | -------- | ----- |
| 0x100   | 0xFF  |     | %rax     | 0x100 |
| 0x104   | 0xAB  |     | %rcx     | 0x1   |
| 0x108   | 0x13  |     | %rdx     | 0x3   |
| 0x10C   | 0x11  |     |          |       |
Fill in the following table showing the values for the indicated operands:

| Operand        | Value | What operation does                           |
| -------------- | ----- | --------------------------------------------- |
| %rax           | 0x100 | address of %rax                               |
| 0x104          | 0xAB  | memory value of 0x104                         |
| $0x108         | 0x108 | immediate value 0x108                         |
| (%rax)         | 0xFF  | memory value of %rax                          |
| 4(%rax)        | 0xAB  | memory value of (%rax + 0x4 = 0x104)          |
| 9(%rax,%rdx)   | 0x11  | memory value of (%rax + %rdx + 0x9 = 0x10C)   |
| 260(%rcx,%rdx) | 0x13  | memory value of (%rcx + %rdx + 0x104 = 0x108) |
| 0xFC(,%rcx,4)  | 0xFF  | memory value of (4 * %rcx + 0xFC = 0x100)     |
| (%rax,%rdx,4)  | 0x11  | memory value of (%rax + 4 * %rdx = 0x10C)     |

## 2. (Optional) Discuss and solve Practice Problems 3.2 and 3.3


## 3. Discuss and solve Practice Problem 3.5, 3.6, 3.8 and 3.10 (expect similar problems at the exam!)
### Problem 3.5
You are given the following information. A function with prototype
```c
void decode1(long *xp, long *yp, long *zp);
```
is compiled into assembly code, yielding the following:
```asm
void decode1(long *xp, long *yp, long *zp)
xp in %rdi, yp in %rsi, zp in %rdx

decode1: 
	movq (%rdi), %r8 
	movq (%rsi), %rcx 
	movq (%rdx), %rax 
	movq %r8, (%rsi) 
	movq %rcx, (%rdx) 
	movq %rax, (%rdi) 
	ret
```
Parameters xp, yp, and zp are stored in registers %rdi, %rsi, and %rdx, respec- tively. Write C code for decode1 that will have an effect equivalent to the assembly code shown.


```c
void decode1(long *xp, long *yp, long *zp) {
	long t0 = *xp;
	long t1 = *yp;
	long t2 = *zp;
	
	*yp = t0;
	*zp = t1;
	*xp = t2;
}
```

### Problem 3.6
Suppose register %rbx holds value p and %rdx holds value q. Fill in the table below with formulas indicating the value that will be stored in register %rax for each of the given assembly-code instructions:

| Instruction                | Result     |
| -------------------------- | ---------- |
| leaq 9(%rdx) , %rax        | q + 9      |
| leaq (%rdx,%rbx) , %rax    | q + p      |
| leaq (%rdx,%rbx,3) , %rax  | q + 3p     |
| leaq 2(%rbx,%rbx,7) , %rax | 8p + 2     |
| leaq 0xE(,%rdx,3) , %rax   | 3q + 14    |
| leaq 6(%rbx,%rdx,7) , %rax | p + 7q + 6 |

### Problem 3.8
Assume the following values are stored at the indicated memory addresses and registers:

| Address | Value |     | Register | Value |
| ------- | ----- | --- | -------- | ----- |
| 0x100   | 0xFF  |     | %rax     | 0x100 |
| 0x108   | 0xAB  |     | %rcx     | 0x1   |
| 0x110   | 0x13  |     | %rdx     | 0x3   |
| 0x118   | 0x11  |     |          |       |

Fill in the following table showing the effects of the following instructions, in terms of both the register or memory location that will be updated and the resulting value:

| Instruction               | Destination | Value |
| ------------------------- | ----------- | ----- |
| addq %rcx , (%rax)        | 0xFF        | 0x100 |
| subq %rdx , 8(%rax)       | 0x108       | 0x105 |
| imulq $16 , (%rax,%rdx,8) | 0x118       | 0x110 |
| incq 16(%rax)             | 0x110       | 0x14  |
| decq %rcx                 | %rcx        | 0x0   |
| subq %rdx,%rax            | %rax        | 0xFD  |

### Problem 3.10
Consider the following code, in which we have omitted the expression being computed:
```c
short arith3(short x, short y, short z) 
{
	short p1 = _________;
	short p2 = _________;
	short p3 = _________;
	short p4 = _________;
	return p4;
}
```

The portion of the generated assembly code implementing these expressions is as follows:
```asm
short arith3(short x, short y, short z) 
x in %rdi, y in %rsi, z in %rdx 
arith3: 
	orq %rsi, %rdx 
	sarq $9, %rdx 
	notq %rdx 
	movq %rdx, %bax 
	subq %rsi, %rbx 
	ret
```
Based on this assembly code, fill in the missing portions of the C code.

```c
short arith3(short x, short y, short z) 
{
	short p1 = z | y; // Apparently opposite order
	short p2 = p1 >> 9;
	short p3 = ~p2;
	short p4 = p3 - y; // Apparently opposite order
	return p4;
}
```

Daniel says book solution is 

## 4. Discuss and solve Practice Problems 3.16 and one of 3.17 or 3.18 (expect similar problems at the exam!)
### Problem 3.16
When given the C code
```c
void cond(short a, short *p) 
{ 
	if (a && *p < a) 
		*p = a; 
}
```

gcc generates the following assembly code:
```asm
void cond(short a, short *p) 
a in %rdi, p in %rsi 
cond: 
	testq %rdi, %rdi 
	je .L1 
	cmpq %rsi, (%rdi) 
	jle .L1 
	movq %rdi, (%rsi) 
.L1: 
	rep; ret
```

#### A.
Write a goto version in C that performs the same computation and mimics the control flow of the assembly code, in the style shown in Figure 3.16(b). You might find it helpful to first annotate the assembly code as we have done in our examples.

```c
void cond(short a, short *p) 
{
	if (a == 0) goto Done;
	if (a <= *p) goto Done;
	*p = a;
	goto Done;
Done:
	return;
}
```

#### B.
Explain why the assembly code contains two conditional branches, even though the C code has only one if statement.

The conditional statement contains two substatements divided by a logical AND operation. If the first condition is false, the program can shortcircuit (by jumping), therefore it compares twice.

### Problem 3.17
An alternate rule for translating if statements into goto code is as follows:
```c
	t = test-expr; 
	if (t) 
		goto true; 
	else-statement 
		goto done; 
true: 
	then-statement 
done:
```

#### A. 
(This is the absdiff_se)
```c
long lt_cnt = 0; 
long ge_cnt = 0; 
long absdiff_se(long x, long y) { 
	long result; 
	if (x < y) { 
		lt_cnt++; 
		result = y - x; 
	} 
	else { 
		ge_cnt++; 
		result = x - y; 
	} 
	return result; 
} 
```

Rewrite the goto version of absdiff_se based on this alternate rule.
```c
long absdiff_se(long x, long y) {
	long result;
	if (x < y)
		goto true;
	ge_cnt++;
	result = x - y;
	goto done;

true:
	lt_cnt++;
	result = y - x;
	
done:
	return result;
}
```

#### B.
Can you think of any reasons for choosing one rule over the other?

The original goto version only has one goto statement and follows the general structure of the original code more closely. The alternative version has more goto statements and has the if-statement under the else-statement but ends in the same done section, which can be more readable.

### Problem 3.18
Starting with C code of the form
```c
short test(short x, short y, short z) { 
	short val = _________; 
	if (_________) { 
		if (_________) 
			val = _________;
		else 
			val = _________;
	} else if (_________) 
		val = _________;
	return val;
}
```

gcc generates the following assembly code:
```asm
short test(short x, short y, short z) 
x in %rdi, y in %rsi, z in %rdx 
test: 
	leaq (%rdx,%rsi), %rax 
	subq %rdi, %rax 
	cmpq $5, %rdx 
	jle .L2 
	cmpq $2, %rsi 
	jle .L3 
	movq %rdi, %rax 
	idivq %rdx, %rax 
	ret 
.L3: 
	movq %rdi, %rax 
	idivq %rsi, %rax 
	ret 
.L2:
	cmpq $3, %rdx 
	jge .L4 
	movq %rdx, %rax 
	idivq %rsi, %rax 
.L4: 
	rep; ret
```

Fill in the missing expressions in the C code.

```c
short test(short x, short y, short z) { 
	short val = z + y - x; 
	if (z > 5) { 
		if (y > 2) 
			val = x / z;
		else
			val = x / y;
	} else if (z < 3)
		val = z / y;
	return val;
}
```

## 5. Discuss and solve any two of Practice Problems 3.22, 3.23, 3.24 and 3.25
### Problem 3.22
#### A.
Try to calculate 14! with a 32-bit int. Verify whether the computation of 14! overflows.

The following program
```cpp
#include <iostream>
#include <math.h>

int main()
{
    uint16_t a = tgamma(15); // 14!
    std::cout << a << std::endl;
    return 0;
}
```

prints out
```
0
```

While a signed int16_t would print:
```
-32768
```

It is therefore overflowing no matter what encoding you use.

#### B.
What if the computation is done with a 64-bit long int?

With a 64 bit integer it prints out:
```
87178291200
```
no matter if the integer is signed or unsigned, which means it did not overflow, and you most likely got the right answer.

### Problem 3.23
For the C code
```c
short dw_loop(short x) { 
	short y = x/9; 
	short *p = &x; 
	short n = 4*x; 
	do { 
		x += y; 
		(*p) += 5; 
		n -= 2; 
	} while (n > 0); 
	return x; 
}
```
gcc generates the following assembly code:
```asm
short dw_loop(short x) 
x initially in %rdi
dw_loop: 
	movq %rdi, %rbx 
	movq %rdi, %rcx 
	idivq $9, %rcx 
	leaq (,%rdi,4), %rdx 
.L2: 
	leaq 5(%rbx,%rcx), %rcx 
	subq $1, %rdx 
	testq %rdx, %rdx 
	jg .L2 
	rep; ret
```

#### A.
Which registers are used to hold program values x, y, and n?
x = %rbx
y = %rcx
n = %rdx

#### B.
How has the compiler eliminated the need for pointer variable p and the pointer dereferencing implied by the expression (\*p)+=5?

Since p is always dereferenced to x, it simply takes p out of the equation and changes x's value directly.

#### C.
Add annotations to the assembly code describing the operation of the program, similar to those shown in Figure 3.19(c).

```asm
short dw_loop(short x) 
x initially in %rdi
dw_loop: 
	movq %rdi, %rbx               Decalres %rbx as x
	movq %rdi, %rcx               Declares %rcx as y
	idivq $9, %rcx                Compute y *= 1/9
	leaq (,%rdi,4), %rdx          Set n = 4x
.L2: 
	leaq 5(%rbx,%rcx), %rcx       Set y = 
	subq $1, %rdx                 Decrement n
	testq %rdx, %rdx              Test n:0
	jg .L2                        If >, goto loop
	rep; ret                      Return
```