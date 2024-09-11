## Arrays
Discuss and solve Practice Problem 3.36, and optionally 3.38
### Problem 3.36
Consider the following declarations:
```c
int P[5];
short Q[2]; 
int **R[9]; 
double *S[10]; 
short *T[2];
```
Fill in the following table describing the element size, the total size, and the address of element i for each of these arrays.


| Array | Element size | Total size | Start address | Element *i*  |
| ----- | ------------ | ---------- | ------------- | ------------ |
| P     | 4            | 20         | $x_{p}$       | $x_{p} + 4i$ |
| Q     | 2            | 4          | $x_{Q}$       | $x_{Q} + 2i$ |
| R     | 8            | 72         | $x_{R}$       | $x_{R} + 8i$ |
| S     | 8            | 80         | $x_{S}$       | $x_{S} + 8i$ |
| T     | 8            | 16         | $x_{T}$       | $x_{T} + 8i$ |

## Structs
### Problem 3.41
Consider the following structure declaration:
```c
struct test {
	short *p; 
	struct { 
		short x; 
		short y; } 
		s; 
	struct test *next; 
};
```

This declaration illustrates that one structure can be embedded within another, just as arrays can be embedded within structures and arrays can be embedded within arrays. The following procedure (with some expressions omitted) operates on this structure:
```c
void st_init(struct test *st) { 
	st->s.y = __________; 
	st->p = __________;  
	st->next = __________;  
}
```

#### A. What are the offsets (in bytes) of the following fields?
```
p:     0
s.x:   8
s.y:  10
next: 12
```

#### B. How many total bytes does the structure require?
20 bytes.

#### C. The compiler generates the following assembly code for st_init
```asm
void st_init(struct test *st) 
st in %rdi 
st_init: 
	movl 8(%rdi), %eax 
	movl %eax, 10(%rdi) 
	leaq 10(%rdi), %rax 
	movq %rax, (%rdi) 
	movq %rdi, 12(%rdi) 
	ret
```
On the basis of this information, fill in the missing expressions in the code for st_init.

```c
void st_init(struct test *st) { 
	st->s.y = st->s.x; 
	st->p = &st->s.y;  
	st->next = &st;  
}
```

### Problem 3.42
The following code shows the declaration of a structure of type ACE and the prototype for a function test:
```c
struct ACE { 
	short v; 
	struct ACE *p; 
};

short test(struct ACE *ptr);
```

When the code for fun is compiled, gcc generates the following assembly code:
```asm
short test(struct ACE *ptr) 
ptr in %rdi 
test: 
	movl $1, %eax 
	jmp .L2 
.L3: 
	imulq (%rdi), %rax
	movq 2(%rdi), %rdi
.L2: 
	testq %rdi, %rdi 
	jne .L3 
	rep; ret
```

#### A. Use your reverse engineering skills to write C code for test
```c
short test(struct ACE *ptr) {
	short result = 1;
	
	while (ptr != NULL) {
		result *= ptr->v;
		ptr = ptr->p;
	}
	
	return result;
}
```

#### B. Describe the data structure that this structure implements and the operation performed by test
The data structure implements a singly linked list, where test() takes the products of all shorts in the list.
### Practice Problem 3.45
Answer the following for the structure declarations
```c
struct { 
	int    *a; 
	float  b; 
	char   c; 
	short  d; 
	long   e; 
	double f;
	int    g; 
	char   *h; 
} rec;
```

#### A. What are the byte offsets of all the fields in the structure? 
Assuming it is a system requiring data chunks with size of 8 bytes:

| Element  | Size \[bytes] | Offset \[byes] |
| -------- | ------------- | -------------- |
| int \*a  | 8             | 0              |
| float b  | 4             | 8              |
| char c   | 1             | 12             |
| short d  | 2             | 13             |
| long e   | 8             | 16             |
| double f | 8             | 24             |
| int g    | 4             | 32             |
| char \*h | 8             | 40             |

#### B. What is the total size of the structure? 
48 bytes.

#### C. Rearrange the fields of the structure to minimize wasted space, and then show the byte offsets and total size for the rearranged structure
```c
struct { 
	int    *a;
	char   *h;
	long   e;
	double f;
	float  b;
	int    g;
	short  d;
	char   c;
} rec;
```

| Element  | Size \[bytes] | Offset \[byes] |
| -------- | ------------- | -------------- |
| int \*a  | 8             | 0              |
| char \*h | 8             | 8              |
| long e   | 8             | 16             |
| double f | 8             | 24             |
| float b  | 4             | 32             |
| int g    | 4             | 36             |
| short d  | 2             | 40             |
| char c   | 1             | 42             |
Which makes the total size 48 bytes.