## 1. Discuss and solve Practice Problem 4.9 (Page 410)
### Problem 4.9
Write an HCL expression for a signal xor, equal to the exclusive-or of inputs a and b. What is the relation between the signals xor and eq defined above?
```hcl
bool eq = (a && b) || (!a && !b);
```

```hcl
bool xor = (a && !b) || (!a && b);
```

The relation between the two functions is that xor is the inverted version of eq.

### Extra
Based on the HCL expression, design the combinational circuit for XOR
![[CPU 1 Opg 1]]

## 2. Design a combinational circuit with AND, OR and NOT gates that take two bits and produces the bool value for “not equal“ (Consider using the previous problem)
![[CPU 1 Opg 2]]

## 3. Discuss and solve Practice Problem 4.10
Suppose you want to implement a word-level equality circuit using the exclusive-or circuits from Problem 4.9 rather than from bit-level equality circuits. Design such a circuit for a 64-bit word consisting of 64 bit-level exclusive-or circuits and two additional logic gates.

![[CPU 1 Opg 3]]


## 4. Discuss and solve Practice Problem 4.11
The HCL code given for computing the minimum of three words contains four comparison expressions of the form X <= Y . Rewrite the code to compute the same result, but using only three comparisons.
```hcl
word Min3 = [ 
	A <= B && A <= C : A; 
	B <= A && B <= C : B; 
	1                : C; 
];
```

When A is larger than B it doesn't need to be computed again. If A is larger than C and B is less than C, B must be less than A too.
```hcl
word Min3 = [ 
	A <= B && A <= C : A; 
	B <= C           : B; 
	1                : C; 
];
```

## 5. Discuss and solve Practice Problem 4.12
Write HCL code describing a circuit that for word inputs A, B, and C selects the median of the three values. That is, the output equals the word lying between the minimum and maximum of the three inputs.

```hcl
word Mean3 = [ 
	(A <= B && C <= A) || (A <= C && B <= A) : A; 
	(B <= A && C <= B) || (B <= C && A <= B) : B; 
	1                                        : C; 
];
```
