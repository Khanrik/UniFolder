##### (5 points) Prove that $(X+Y)(\bar{X}+Z) = XZ + \bar{X}Y$
$$
\begin{align}
(X+Y) (\bar{X}+Z) &= X (\bar{X} + Z) + Y (\bar{X} + Z) \\
 & = X\bar{X} + XZ + Y\bar{X} + YZ \\
 & = XZ + Y\bar{X} + YZ(X + \bar{X}) \\
 & = XZ + Y\bar{X} + YZX + YZ\bar{X} \\
 & = XZ(1+Y) + Y\bar{X}(1 + Z) \\
 & = XZ(1) + Y\bar{X}(1) \\
 & = XZ + Y\bar{X}
\end{align}
$$

##### (45 points) Simplify the function $f(a,b,c,d) = \bar{a}\bar{b}\bar{c}\bar{d}+\bar{a}b\bar{c}+a\bar{c}\bar{d}+\bar{a}c+\bar{a}\bar{b}c$

###### Using the Boolean expressions
$$
\begin{align}
\bar{a}\bar{b}\bar{c}\bar{d} + \bar{a}b\bar{c} + a\bar{c}\bar{d} + \bar{a}c + \bar{a}\bar{b}c & =  \\
\bar{a}\bar{c}(\bar{b}\bar{d} + b) + a\bar{c}\bar{d} + \bar{a}c(1 + \bar{b}) & =  \\
\bar{a}\bar{c}b + \bar{a}\bar{c}\bar{d} + a\bar{c}\bar{d} + \bar{a}c & = \\
\bar{a}\bar{c}b + \bar{c}\bar{d}(\bar{a} + a) + \bar{a}c & = \\
\bar{a}\bar{c}b + \bar{c}\bar{d} + \bar{a}c & = \\
\bar{a}(\bar{c}b + c) + \bar{c}\bar{d} & = \\
\bar{a}(c + b) + \bar{c}\bar{d} & = \\
\bar{a}c + \bar{a}b + \bar{c}\bar{d}
\end{align}
$$

###### Using Karnaugh map
![[Digital Kredsløb Eksamen 2021 opg 2 kmap]]

###### Implement the simplified function using NAND and Inverter gates
![[Digitale Kredsløb Eksamen 2021 Opg 2 NAND og INV]]

###### Implement the simplified function with a four-to-one multiplexer and external gates
![[Digitale Kredsløb Eksamen 2021 4-to-1 mux]]
