## 1. Prove that $(X + Y) (\bar{X} + Z) = X Z + \bar{X} Y$
$$
\begin{align}
(X + Y) (\bar{X} + Z) & = X Z + \bar{X} Y \\
X \bar{X} + X Z + Y \bar{X} + Y Z & = X Z + \bar{X} Y \\
X Z + Y (\bar{X} + Z) & = X Z + \bar{X} Y \\
X Z + Y \bar{X} + Y Z & = X Z + \bar{X} Y \\
X Z + Y \bar{X} + Y Z (X + \bar{X}) & = X Z + \bar{X} Y \\
X Z + Y \bar{X} + X Z Y + Y \bar{X} Z & = X Z + \bar{X} Y \\
X Z (1 + Y) + Y \bar{X} (1 + Z) & = X Z + \bar{X} Y \\
X Z + Y \bar{X} & = X Z + \bar{X} Y
\end{align}
$$

## 2. Simplify the function $f(a, b, c, d) = \bar{a} \bar{b} \bar{c} \bar{d} + \bar{a} b \bar{c} + a \bar{c} \bar{d} + \bar{a} c + \bar{a} \bar{b} c$
### a. Using the Boolean expressions
$$
\begin{align}
\bar{a} \bar{b} \bar{c} \bar{d} + \bar{a} b \bar{c} + a \bar{c} \bar{d} + \bar{a} c + \bar{a} \bar{b} c & = \bar{a} \bar{c} (\bar{b} \bar{d} + b) + a \bar{c} \bar{d} + \bar{a} c (1 + \bar{b}) \\
 & = \bar{a} \bar{c} (b + \bar{d}) + a \bar{c} \bar{d} + \bar{a} c \\
 & = \bar{a} b \bar{c} + \bar{a} \bar{c} \bar{d} + a \bar{c} \bar{d} + \bar{a} c \\
 & = \bar{a} b \bar{c} + \bar{c} \bar{d} (a + \bar{a}) + \bar{a} c \\
 & = \bar{a} b \bar{c} + \bar{c} \bar{d} + \bar{a} c \\
 & = \bar{a} (b \bar{c} + c) + \bar{c} \bar{d}  \\
 & = \bar{a} (b + c) + \bar{c} \bar{d} \\
 & = \bar{a} \bar{b} + \bar{a} \bar{c} + \bar{c} \bar{d}
\end{align}
$$

### b. Using Karnaugh map
![[Digital Kredsløb Eksamen 2021 2.b]]

### c. Implement the simplified function using NAND and Inverter gates
![[Digital Kredsløb Eksamen 2021 2.c]]

### d. Implement the simplified function with a four-to-one multiplexer and external gates
![[Digital Kredsløb Eksamen 2021 2.d]]

### e. Implement the simplified function with a 4-to-16 decoder and external gates
![[Digital Kredsløb Eksamen 2021 2.e]]

## 3. A digital circuit has a clock generator that produces pulses at a frequency of 125 MHz. Design a circuit that generates a clock with a frequency of 12.5 MHz
It has to toggle every fifth time, because to toggles correspond to one period. Since it toggles every 5 counts, the T flip-flop outputs a signal ten times slower than the original clock, which makes it a 12.5 MHz clock signal.
![[Digital Kredsløb Eksamen 2021 3]]

## 4. Show the complete gate level design of a state machine with two-bit input.
![[Digital Kredsløb Eksamen 2021 4]]