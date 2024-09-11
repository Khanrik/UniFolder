## 1. Reduce the following Boolean expressions with minimum number of literals:
### a.
$$
\begin{align}
(y \bar{z} + \bar{x} w) (x \bar{y} + z w) &= y \bar{z} x \bar{y} + y \bar{z} z w + \bar{x} w x \bar{y} + \bar{x} w z w \\
&= 0 + 0 + 0 + \bar{x} w z \\
&= \bar{x} w z
\end{align}
$$

### b.
$$
\begin{align}
w x \bar{y} \bar{z} + w \bar{y} + w \bar{x} \bar{y} \bar{z} & = w \bar{y} (x \bar{z} + 1 + \bar{x} \bar{z}) \\
& = w \bar{y}
\end{align}
$$

## 2. Write the following Boolean expression in sum of products form and simplify it afterwards using Karnaugh-Map.
Written as SOP:
$$
\begin{align}
(w + x + \bar{y}) (\bar{x} + \bar{y} + \bar{z}) & = w \bar{x} + w \bar{y} + w \bar{z} + x \bar{x} + x \bar{y} + x \bar{z} + \bar{y} \bar{x} + \bar{y} \bar{y} + \bar{y} \bar{z}  \\
& = w \bar{x} + w \bar{y} + w \bar{z} + x \bar{y} + x \bar{z} + \bar{y} \bar{x} + \bar{y} + \bar{y} \bar{z} \\
& = w \bar{x} + w \bar{z} + x \bar{z} + \bar{y} (w + x + \bar{x} + 1 + \bar{z}) \\
& = w \bar{x} + w \bar{z} + x \bar{z} + \bar{y}
\end{align}
$$

K-Map:
![[Digital Kredsløb Eksamen 2020 2]]

## 3. Construct a 16×1 multiplexer using two 8×1 and one 2×1 multiplexers.
![[Digital Kredsløb Eksamen 2020 3]]

## 4. Implement the Boolean function
### a.
![[Digital Kredsløb Eksamen 2020 4.a]]

### b.
![[Digital Kredsløb Eksamen 2020 4.b]]

## 5. A sequential circuit has two JK flip-flops A and B, two inputs x and y, and one output of z.

### a. Draw the sequential circuits
![[Digital Kredsløb Eksamen 2020 5.a]]

### b.
$$
\begin{align}
A(t + 1) & = J_{A} \bar{A} + \overline{K_{A}} A  \\
& = (\bar{A} x + \bar{B} y) \bar{A} + \overline{(B \bar{x} \bar{y})} A \\
& = \bar{A} x + \bar{A} \bar{B} y + (\bar{B} + x + y) A \\
 & = \bar{A} x + \bar{A} \bar{B} y + A \bar{B} + A x + A y \\
 & = x (\bar{A} + A) + \bar{B} (\bar{A} y + A) + Ay \\
 & = x + \bar{B} (A + y) + Ay \\
 & = x + A \bar{B} + \bar{B} y + Ay
\end{align}
$$
$$
\begin{align}
B(t + 1) & = J_{B} \bar{B} + \overline{K_{B}} B \\
 & = (\bar{A} x y) \bar{B} + \overline{(\bar{A} + \bar{B} x)} B \\
 & = \bar{A} \bar{B} x y + (\bar{\bar{A}} \overline{\bar{B} x}) B \\
 & = \bar{A} \bar{B} x y + A B (\bar{\bar{B}} + \bar{x}) \\
 & = \bar{A} \bar{B} x y + A B + A B \bar{x} \\
 & = \bar{A} \bar{B} x y + A B (1 + \bar{x}) \\
 & = \bar{A} \bar{B} x y + A B
\end{align}
$$

### c.
![[Digital Kredsløb Eksamen 2020 5.c]]

### d.
![[Digital Kredsløb Eksamen 2020 5.d]]

### e.
![[Digital Kredsløb Eksamen 2020 5.e]]