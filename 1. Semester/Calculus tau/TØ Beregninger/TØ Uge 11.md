## Afsnit 17.1
### Opgave 12
Løs det her:
$$
y'' + 4y' + 5y = 0
$$

Rødder:
$$
r^{2} + 4r + 5 = 0
$$
$$
\begin{align}
r &= \frac{-4 \pm \sqrt{ 4^{2} - 4 \cdot 1 \cdot 5 }}{2 \cdot 1} \\
r &= \frac{-4 \pm \sqrt{ 16 - 20 }}{2} \\
r &= \frac{-4 \pm \sqrt{ -4 }}{2} \\
r &= \frac{-4 \pm 2i}{2}
\end{align}
$$
$$
r_{1} = -2 + i \ \ \ \ \text{og} \ \ \ \ r_{2} = -2 - 1
$$

Generel løsning:
$$
y = e^{-2 x} (c_{1} \cos(x) + c_{2} \sin (-x))
$$

### Opgave 31
Løs det her:
$$
y'' + 6y' + 5y = 0, \ \ \ \ y(0) = 0, \ \ \ \ y'(0) = 3
$$

Rødder:
$$
r^{2} + 6r + 5 = 0
$$
$$
\begin{align}
r &= \frac{-6 \pm \sqrt{ 6^{2} - 4 \cdot 1 \cdot 5 }}{2 \cdot 1} \\
r &= \frac{-6 \pm \sqrt{ 36 - 20 }}{2} \\
r &= \frac{-6 \pm \sqrt{ 16 }}{2} \\
r &= \frac{-6 \pm 4}{2} \\
r &= -3 \pm 2
\end{align}
$$
$$
r_{1} = -1 \ \ \ \ \text{og} \ \ \ \ r_{2} = -5
$$

Generel løsning:
$$
y = c_{1}e^{-x} + c_{2}e^{-5 x}
$$
$$
y' = -c_{1}e^{-x} - 5 c_{2} e^{-5x}
$$

Indsæt begyndelsesværdi:
$$
\begin{align}
c_{1}e^{-0} + c_{2}e^{-5 \cdot 0} &= 0 \\
c_{1} + c_{2} &= 0 \\
c_{1} = -c_{2}
\end{align}
$$

$$
\begin{align}
-c_{1}e^{-0} - 5c_{2}e^{-5 \cdot 0} &= 3 \\
-c_{1} - 5c_{2} &= 3 \\
-(-c_{2}) - 5c_{2} &= 3 \\
c_{2} &= -\frac{3}{4}
\end{align}
$$

$$
c_{1} = -\left( -\frac{3}{4} \right) = \frac{3}{4}
$$

Partikulær løsning:
$$
y = \frac{3}{4} e^{-x} - \frac{3}{4} e^{-5 x}
$$

## Afsnit 17.2
### Opgave 7
Løs det her:
$$
y'' - y' - 2y = 20 \cos(x)
$$

Rødder:
$$
r^{2} - r - 2 = 0
$$
$$
(r - 2) \cdot (r + 1) = 0
$$
$$
r_{1} = 2 \ \ \ \ \text{og} \ \ \ \ r_{2} = -1
$$

Homogen løsning:
$$
y_{c} = c_{1}e^{2x} + c_{2}e^{-x}
$$

Partikulær løsning:
$$
y_{p} = B \cos(x) + C \sin(x)
$$
$$
y_{p}' = - B \sin(x) + C \cos(x)
$$
$$
y_{p}'' = - B \cos(x) - C \sin(x)
$$

$$
\begin{align}
- B \cos(x) - C \sin(x) - (- B \sin(x) + C \cos(x)) - 2 (B \cos(x) + C \sin(x)) &= 20 \cos(x) \\
(-3B - C) \cdot \cos(x) + (B - 3C) \cdot \sin(x) &= 20 \cos(x)
\end{align}
$$

$$
\begin{align}
B - 3C &= 0 \\
B &= 3C
\end{align}
$$

$$
\begin{align}
-3 \cdot (3C) - C &= 20 \\
-9C - C &= 20 \\
C &= -2
\end{align}
$$

$$
B = 3 \cdot (-2) = -6
$$

$$
y_{p} = - 6 \cos(x) - 2 \sin(x)
$$

Generel løsning:
$$
y = c_{1}e^{2x} + c_{2}e^{-x} - 6 \cos(x) - 2 \sin(x)
$$

### Opgave 9
Løs det her:
$$
y'' - y = e^{x} + x^{2}
$$

Rødder:
$$
r^{2} - 1 = 0
$$
$$
(r - 1) \cdot (r + 1) = 0
$$
$$
r_{1} = 1 \ \ \ \ \text{og} \ \ \ \ r_{2} = -1
$$

Homogen løsning:
$$
y_{c} = c_{1}e^{x} + c_{2}e^{-x}
$$

Partikulær løsning:
$$
y_{p} = Axe^{x} + Dx^{2} + Ex + F
$$
$$
y_{p}' = A(xe^{x} + e^{x}) + 2Dx + E
$$
$$
y_{p}'' = A(xe^{x} + 2e^{x}) + 2D
$$

$$
\begin{align}
A(xe^{x} + 2e^{x}) + 2D - (Axe^{x} + Dx^{2} + Ex + F) &= e^{x} + x^{2} \\
2Ae^{x} - Dx^{2} - Ex + 2D - F &= e^{x} + x^{2}
\end{align}
$$

$$
\begin{align}
2A &= 1 \\
A &= \frac{1}{2}
\end{align}
$$

$$
\begin{align}
-D &= 1 \\
D &= -1
\end{align}
$$

$$
-E = E = 0
$$


$$
\begin{align}
2D - F &= 0 \\
2 \cdot (-1) - F &= 0 \\
- F &= 2 \\
F &= -2
\end{align}
$$

$$
y_{p} = \frac{1}{2}xe^{x} - x^{2} - 2
$$

Generel løsning:
$$
y = c_{1}e^{x} + c_{2}e^{-x} \frac{1}{2}xe^{x} - x^{2} - 2
$$

## Afsnit 17.3
### Opgave 1
```math-tex
weight = 70N
g = 9.8 m/s^2
mass = weight/g
```

Ligning:
$$
7 y'' + 15 y' + 15 y = 0, \ \ \ \ y(0) = 0.6, \ \ \ \ y'(0) = 0.6
$$
