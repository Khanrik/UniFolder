## Afsnit 13.3
### Opgave 85
![[Pasted image 20231117104820.png]]
Show that this satisfies a Laplace equation:
$$
f(x, y) = e^{-2 \cdot y} \cdot \cos(2 \cdot x)
$$
De to dobbelt afledede funktioner med hensyn til hhv. x og y af funktionen f findes og sættes lig 0. Hvis dette passer må funktionen være en todimensionel Laplace ligning.
$$
\frac{\partial f}{\partial x} = - 2 e^{-2y} \sin(2x)
$$
$$
\frac{\partial^{2} f}{\partial x^{2}} = \frac{\partial }{\partial x} - 2 e^{-2y} \sin(2x) = - 4 e^{-2y} \cos(2x)
$$

$$
\frac{\partial f}{\partial y} = - 2 e^{-2y} \cos(2x)
$$
$$
\frac{\partial^{2} f}{\partial y^{2}} = \frac{\partial }{\partial y} - 2 e^{-2y} \cos(2x) = 4 e^{-2y} \cos(2x)
$$

$$
\frac{\partial^{2} f}{\partial x^{2}} + \frac{\partial^{2} f}{\partial y^{2}} = - 4 e^{-2y} \cos(2x) + 4 e^{-2y} \cos(2x) = 0
$$
Da udtrykket går op, må det betyde at funktionen passer med Laplace ligningen.

### Opgave 94
![[Pasted image 20231117164015.png]]
$$
w = \ln(2 \cdot x + 2 \cdot c \cdot t)
$$
De to dobbelt afledede funktioner med hensyn til hhv. t og x af funktionen w findes. Det vides, at hvis den dobbelt afledte mht. t er lig produktet af $c^{2}$ og den dobbelt afledte mht. x, må det betyde, at funktionen er en løsning til bølgeligningen.
$$
\frac{\partial w}{\partial t} = \frac{2 c}{2 x + 2 c t}
$$
$$
\frac{\partial^{2} w}{\partial t^{2}} = \frac{\partial }{\partial t} \frac{2 c}{2 x + 2 c t} = -\frac{4 c^{2}}{(2 x + 2 c t)^{2}}
$$

$$
\frac{\partial w}{\partial x} = \frac{2}{2 x + 2 c t}
$$
$$
\frac{\partial^{2} w}{\partial x^{2}} = \frac{\partial }{\partial x} + \frac{2}{2 x + 2 c t} = - \frac{4}{(2 x + 2 c t)^{2}}
$$

$$
\begin{align}
- \frac{4 c^{2}}{(2 x + 2 c t)^{2}} &= c^{2} \cdot \left(- \frac{4}{(2 x + 2 c t)^{2}}\right) \\
- \frac{4 c^{2}}{(2 x + 2 c t)^{2}} &= - \frac{4 c^{2}}{(2 x + 2 c t)^{2}}
\end{align}
$$
Da udtrykket går op, må det betyde at funktionen er en Laplace ligning.