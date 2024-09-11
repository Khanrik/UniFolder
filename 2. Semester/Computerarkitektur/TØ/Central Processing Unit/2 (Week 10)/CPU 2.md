## SEQ Stages
### 1. Solve practice problem 4.8 (Page 407)
The following assembly-code function lets us determine the behavior of the in- struction popq %rsp for x86-64:
```asm
.text 
.globl poptest 
poptest: 
	movq  %rsp, %rdi   Save stack pointer 
	pushq $0xabcd      Push test value 
	popq  %rsp         Pop to stack pointer 
	movq  %rsp, %rax   Set popped value as return value
	movq  %rdi, %rsp   Restore stack pointer
	ret
```
We find this function always returns 0xabcd. What does this imply about the behavior of popq %rsp? What other Y86-64 instruction would have the exact same behavior?

That the function always returns the same value, it implies that popq takes the top of the stack without changing it and stores that in %rsp. 


Since it simply moves to stack value into the return value without doing anything it is the same as moving the memory value of the stack into the stack pointer register:
```asm
mrmov (%rsp) %rsp
```

### 2. Read the blue Aside box on page 424 to see how to substitute actual values.
### 3. Discuss and solve Practice Problem 4.13 (Page 423). Use the figures above to find the correct instruction codes and register numbers

| Stage      | Generic - irmovq V, rB               | Specific - irmovq $128, %rsp                      |
| ---------- | ------------------------------------ | ------------------------------------------------- |
| Fetch      | icode:ifun $\leftarrow$ M$_{1}$\[PC] | icode:ifun $\leftarrow$ M$_{1}$\[0x016] = 3:0     |
|            | rA:rB $\leftarrow$ M$_{1}$\[PC + 1]  | rA:rB $\leftarrow$ M$_{1}$\[0x017] = F:4 = F:%rsp |
|            | valC $\leftarrow$M$_{8}$\[PC + 2]    | valC $\leftarrow$M$_{8}$\[0x018] = 0x80 = 128     |
|            | valP $\leftarrow$ PC + 10            | valP $\leftarrow$PC + 10 = 0x020                  |
| Decode     |                                      |                                                   |
| Execute    | valE $\leftarrow$ 0 + valC           | valE $\leftarrow$ 0 + valC = 128                  |
| Memory     |                                      |                                                   |
| Write back | R\[rB] $\leftarrow$ valE             | R\[%rsp] $\leftarrow$ valC = 128                  |
| PC update  | PC $\leftarrow$ valP                 | PC $\leftarrow$ valP = 0x020                      |



### 4. Using the same technique, discuss and solve Practice Problems 4.14 and 4.18


## Hardware Structure Of SEQ
### 5. Check the names in Table 4.26 (page 440). You will use these labels when writing HCL


### 6. Read chapter 4.3.4 as a reminder to how SEQ stages work, and discuss how the example HCLs are constructed. 


### 7. Discuss and solve Practice Problems 4.19, 4.20 and 4.21 together in your group
#### Practice Problem 4.20
The register signal srcB indicates which register should be read to generate the signal valB. The desired value is shown as the second step in the decode stage in Figures 4.18 to 4.21. Write HCL code for srcB.

```hcl
word srcB = [
	icode in { IOPQ, IRMMOVQ, IMRMOVQ } : rB;
	icode in { IPUSHQ, IPOPQ, ICALL, IRET } : RRSP;
	1 : RNONE;
];
```

### 8. Solve problems 4.23, 4.24, 4.25 and 4.26 alone. 


### 9. Compare your solutions within the group