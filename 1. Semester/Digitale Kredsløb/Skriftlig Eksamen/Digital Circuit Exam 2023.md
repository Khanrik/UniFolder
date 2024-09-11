Exam Number: 221341
## 1. Complete the following table (unsigned)
| Binary | Octal | Hexadecimal | Decimal | 2's complement | 1's complement |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 10110111 |  |  |  |  |  |
|  |  | 3F1 |  |  |  |
### Calculations
![[Digitale Kredsløb Eksamen 2023 1]]

### Finished table
| Binary | Octal | Hexadecimal | Decimal | 2's complement | 1's complement |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 10110111 | 267 | B7 | 183 | 01001001 | 01001000 |
| 1111110001 | 1761 | 3F1 | 1009 | 0000001111 | 0000001110 |

## 2. For the logic circuit shown in Fig. 1,
![[Pasted image 20240112090951.png]]

### a) Implement it using NAND gate only
![[Digitale Kredsløb Eksamen 2023 2.a]]

### b) Find the Boolean expression for the circuit as f(A,B,C)
![[Digitale Kredsløb Eksamen 2023 2.b]]

The Boolean expression will be $f(A, B, C) = C (\overline{\bar{A} + B}) \oplus ( \bar{A} + B + C)$ 

### c) Simplify the expression using Boolean Algebra
$$
\begin{align}
C(\overline{\bar{A} + B}) \oplus (\bar{A} + B + C) & = C (A \bar{B}) \oplus (\bar{A} + B + C) \\
 & = (A \bar{B} C) (\overline{\bar{A} + B + C}) + (\overline{A \bar{B} C}) (\bar{A} + B + C) \\
 & = (A \bar{B} C) (A \bar{B} \bar{C}) + (\bar{A} + B + \bar{C}) (\bar{A} + B + C) \\
 & = 0 + \bar{A} + \bar{A} B + \bar{A} C + B \bar{A} + B + B C + \bar{C} \bar{A} + \bar{C} B + \bar{C} C \\
 & = \bar{A} (1 + B + C + \bar{C}) + B (1 + C + \bar{C}) + 0 \\
 & = \underline{\underline{\bar{A} + B}}
\end{align}
$$

### d) Re-draw the circuit using simplified expressions
![[Digitale Kredsløb Eksamen 2023 2.d]]

## 3. Given a digital circuit with four input variable A, B, C, and D, consider the following minterms:
$$
f(A, B, C, D) = \sum m(3, 5, 7, 8, 10, 11, 12, 14)
$$
### a) Show the Boolean expression and the corresponding logic gate diagram
#### Boolean Expression
$$
\begin{align}
f(A, B, C, D) & = \bar{A} \bar{B} C D + \bar{A} B \bar{C} D + \bar{A} B C D + A \bar{B} \bar{C} \bar{D} + A \bar{B} C \bar{D} + A \bar{B} C D + A B \bar{C} \bar{D} + A B C \bar{D} \\
 & = \bar{A} (\bar{B} C D + B \bar{C} D + B C D) + A (\bar{B} \bar{C} \bar{D} + \bar{B} C \bar{D} + \bar{B} C D + B \bar{C} \bar{D} + B C \bar{D}) \\
 & = \bar{A} (\bar{B} C D + BD (\bar{C} + C)) + A (\bar{B} \bar{C} \bar{D} + \bar{B} C (\bar{D} + D) + B \bar{D} (C + \bar{C})) \\
 & = \bar{A} (D (\bar{B} C + B)) + A (\bar{B} (\bar{C} \bar{D} + C) + B \bar{D}) \\
 & = \bar{A} (DC + DB) + A (\bar{B} \bar{D} + \bar{B} C + B \bar{D}) \\
 & = \bar{A} D C + \bar{A} D B + A \bar{B} C + A (\bar{D} (\bar{B} + B)) \\
 & = \bar{A} D C + \bar{A} D B + A \bar{B} C + A \bar{D}
\end{align}
$$

#### Logic Gate Diagram
![[Digitale Kredsløb Eksamen 2023 3.a]]

### b) Simplify it using K-MAP if possible and re-draw the logic diagram
It can be reduced to the same expression calculated beforehand, so refer to previous figure for logic diagram.

![[Digitale Kredsløb Eksamen 2023 3.b]]

### c) Redesign the circuit using a decoder and OR gates. Provide a detailed diagram
![[Digitale Kredsløb Eksamen 2023 3.c]]

### d) Implement the same function using a 4-to-1 multiplexer. Specify the inputs to the multiplexer and illustrate the setup.
A 4x1 multiplexer has 2 inputs, which are set as A and B. The design will then look as follows:
![[Digitale Kredsløb Eksamen 2023 3.d]]

## 4. Create a state diagram for a sequence detector that **outputs a 1** when it detects the final bit in the serial data stream 1101
![[Digitale Kredsløb Eksamen 2023 4]]

## 5. Implement the following state diagram (Fig. 2) using two Flip-Flops (One JK and one T Flip Flop)
![[Pasted image 20240112103852.png]]

### State Table
As can be seen below, S0 and S2 have the exact same properties, so the state table can be reduced by eliminating S2 entirely (since nothing goes to that state either). 
![[Digitale Kredsløb Eksamen 2023 5 State Table]]

### Binary State Table
Here the state table is written out in binary with the flip flop inputs. Since it isn't stated where the state machine starts, it could start in S2 in which case it would have to be able to escape, so it is included anyway.
![[Digitale Kredsløb Eksamen 2023 5 Binary State Table]]

### K-Maps
![[Digitale Kredsløb Eksamen 2023 5 Kmap]]



## 6. For the following clocked sequential circuit with one input (X) and one output (Z), derive the Boolean expression for A (t+1), B (t+1), C (t+1), and Z (Fig. 3). QA, QB, and QC are equivalent to A, B, and C, respectively
![[Pasted image 20240112103910.png]]

