## Afsnit 13.3
### Opgave 2
![[Pasted image 20231120185945.png]]

Ligning:
$$
f(x,y) = x^{2} - xy + y^{2}
$$

Find $\frac{\partial f}{\partial x}$:
$$
\frac{\partial f}{\partial x} = 2x - y
$$

Find $\frac{\partial f}{\partial y}$:
$$
\frac{\partial f}{\partial y} = 2y - x
$$

### Opgave 15
Ligning:
$$
f(x,y) = \ln(x + y)
$$

Find $\frac{\partial f}{\partial x}$:
$$
\frac{\partial f}{\partial x} = \frac{1}{x + y}
$$

Find $\frac{\partial f}{\partial y}$:
$$
\frac{\partial f}{\partial y} = \frac{1}{x + y}
$$

### Opgave 43
![[Pasted image 20231120193346.png]]

Ligning:
$$
g(x,y) = x^{2} y + \cos(y) + y \sin(x)
$$

Find $g_{xx}$:
>[!NOTE]- $\frac{\partial g}{\partial x} = 2xy + y\cos(x)$

$$
\frac{\partial^{2} g}{\partial x^{2}} = 2y - y\sin(x)
$$

Find $g_{yy}$:
>[!NOTE]- $\frac{\partial g}{\partial y} = x^{2} - \sin(y) + \sin(x)$

$$
\frac{\partial^{2} g}{\partial y^{2}} = - \cos(y)
$$

Find $g_{xy}$:
>[!NOTE]- $\frac{\partial g}{\partial x} = 2xy + y\cos(x)$

$$
\frac{\partial^{2} g}{\partial x \partial y} = 2x + \cos(x)
$$

Find $g_{yx}$:
>[!NOTE]- $\frac{\partial g}{\partial y} = x^{2} - \sin(y) + \sin(x)$

$$
\frac{\partial^{2} g}{\partial y \partial x} = 2x + \cos(x)
$$

### Opgave 83
![[Pasted image 20231120223748.png]]
![[Pasted image 20231120223757.png]]

Ligning:
$$
f(x,y,z) = x^{2} + y^{2} - 2z^{2}
$$

Find $\frac{\partial^{2} f}{\partial x^{2}}$:
$$
\frac{\partial^{2} f}{\partial x^{2}} = 2
$$

Find $\frac{\partial^{2} f}{\partial y^{2}}$:
$$
\frac{\partial^{2} f}{\partial y^{2}} = 2
$$

Find $\frac{\partial^{2} f}{\partial z^{2}}$:
$$
\frac{\partial^{2} f}{\partial z^{2}} = -4
$$

Indsæt:
$$
\frac{\partial^{2} f}{\partial x^{2}} + \frac{\partial^{2} f}{\partial y^{2}} + \frac{\partial^{2} f}{\partial z^{2}} = 2 + 2 + (-4) = 0
$$

## Afsnit 13.4
### Opgave 24
![[Pasted image 20231120230446.png]]

Ligning:
$$
\frac{\partial w}{\partial s} \ \ \text{for} \ \ w = g(x,y), x = h(r,s,t), y = k(r,s,t)
$$

Diagram:
![[Calculus TØ Afsnit 13.4 Opgave 24.excalidraw]]

Kæderegel:
$$
\frac{\partial w}{\partial s} = \frac{\partial w}{\partial x} \frac{\partial x}{\partial s} + \frac{\partial w}{\partial y} \frac{\partial y}{\partial s}
$$

### Opgave 25
![[Pasted image 20231120231936.png]]

Ligning:
$$
x^{3} - 2y^{2} + xy = 0, \ \ (1,1)
$$

Indsæt i sætning 8:
>[!NOTE] $F_{x} = 3x^{2} + y$

>[!note] $F_{y} = - 4y + x$ 

$$
\begin{align}
\frac{dy}{dx} &= - \frac{F_{x}}{F_{y}}  \\
&= - \frac{3x^{2} + y}{- 4y + x}  \\
&= - \frac{3 \cdot 1^{2} + 1}{-4 \cdot 1 + 1} \\
&= - \frac{4}{-3} \\
&= \frac{4}{3}
\end{align}
$$

### Opgave 43
Assume that $z = f(x,y)$, $x = g(t)$, $y = h(t)$, $f_{x}(2, -1) = 3$, and $f_{y}(2,-1) = -2$. If $g(0) = 2$, $h(0) = -1$, $g'(0) = 5$, and $h'(0) = -4$, find $\frac{dz}{dt} \bigg|_{t=0}$.

For at finde $\frac{dz}{dt} = \frac{\partial z}{\partial t}$ opstilles kædereglen:
$$
\frac{\partial z}{\partial t} = \frac{\partial z}{\partial x} \frac{\partial x}{\partial t} + \frac{\partial z}{\partial y} \frac{\partial y}{\partial t}
$$
>[!note] For t=0 er $g'(0) = \frac{\partial x}{\partial t} = 5$ og $h'(0) = \frac{\partial y}{\partial t} = -4$

>[!note]- For t=0 er $g(0) = x = 2$ og $h(0) = y = -1$
>Dette betyder at t=0 svarer til f(2,-1)

>[!note] Forrige medfører $f(2,-1)_{x} = \frac{\partial z}{\partial x} = 3$ og $f(2,-1)_{y} = \frac{\partial z}{\partial y} = -2$

Indsæt i kædereglen:
$$
\begin{align}
\frac{dz}{dt} \bigg|_{t=0} = \frac{\partial z}{\partial t} \bigg|_{t=0} & = 3 \cdot 5 + (-2) \cdot (-4) \\
 & = 15 + 8 \\
 & = 23
\end{align}
$$

### Opgave 44 Forkert husk differentier f^2
Assume that $z = f(x,y)^{2}$, $x = g(t)$, $y = h(t)$, $f_{x}(1, 0) = -1$, $f_{y}(1,0) = 1$, and $f(1,0)=2$. If $g(3) = 1$, $h(3) = 0$, $g'(3) = -3$, and $h'(3) = 4$, find $\frac{dz}{dt} \bigg|_{t=3}$.

For at finde $\frac{dz}{dt}$ opstilles kædereglen for $f$ først (hvorefter $z$ er kvadratet af svaret):
$$
\frac{\partial f}{\partial t} = \frac{\partial f}{\partial x} \frac{\partial x}{\partial t} + \frac{\partial f}{\partial y} \frac{\partial y}{\partial t}
$$
>[!note] For t=3 er $g'(3) = \frac{\partial x}{\partial t} = -3$ og $h'(3) = \frac{\partial y}{\partial t} = 4$

>[!note]- For t=3 er $g(3) = x = 1$ og $h(3) = y = 0$
>Dette betyder at t=3 svarer til f(1, 0)

>[!note] Forrige medfører $f(1,0)_{x} = \frac{\partial f}{\partial x} = -1$ og $f(1,0)_{y} = \frac{\partial f}{\partial y} = 1$

Indsæt i kædereglen:
$$
\begin{align}
\frac{\partial f}{\partial t} \bigg|_{t=0} & = (-1) \cdot (-3) + 1 \cdot 4 \\
 & = 3 + 4 \\
 & = 7
\end{align}
$$

Kvadrer:
$$
z = 7^{2} = 49
$$

### Opgave 51
![[Pasted image 20231121081249.png]]

$$
\begin{align}
\frac{\partial w}{\partial x} & = \frac{\partial w}{\partial u} \frac{\partial u}{\partial x} + \frac{\partial w}{\partial v} \frac{\partial v}{\partial x}  \\

\frac{\partial}{\partial x} \left(  \frac{\partial w}{\partial x}  \right) & = \frac{\partial}{\partial x} \left(  \frac{\partial w}{\partial u} \frac{\partial u}{\partial x} + \frac{\partial w}{\partial v} \frac{\partial v}{\partial x}  \right) \\

\frac{\partial^{2} w}{\partial x^{2}} & = \frac{\partial}{\partial x}\left( \frac{\partial w}{\partial u} \frac{\partial u}{\partial x} \right) + \frac{\partial}{\partial x}\left( \frac{\partial w}{\partial v} \frac{\partial v}{\partial x} \right) \\

\frac{\partial^{2} w}{\partial x^{2}} & = \left( \frac{\partial^{2} w}{\partial u \partial x} \frac{\partial u}{\partial x} + \frac{\partial w}{\partial u} \frac{\partial^{2} u}{\partial x^{2}} \right) + \left( \frac{\partial^{2} w}{\partial v \partial x} \frac{\partial v}{\partial x} + \frac{\partial w}{\partial v} \frac{\partial^{2} v}{\partial x^{2}} \right)
\end{align}
$$

$$
\begin{align}
\frac{\partial w}{\partial y} & = \frac{\partial w}{\partial u} \frac{\partial u}{\partial y} + \frac{\partial w}{\partial v} \frac{\partial v}{\partial y}  \\

\frac{\partial}{\partial y} \left(  \frac{\partial w}{\partial y}  \right) & = \frac{\partial}{\partial y} \left(  \frac{\partial w}{\partial u} \frac{\partial u}{\partial y} + \frac{\partial w}{\partial v} \frac{\partial v}{\partial y}  \right) \\

\frac{\partial^{2} w}{\partial y^{2}} & = \frac{\partial}{\partial y}\left( \frac{\partial w}{\partial u} \frac{\partial u}{\partial y} \right) + \frac{\partial}{\partial y}\left( \frac{\partial w}{\partial v} \frac{\partial v}{\partial y} \right) \\

\frac{\partial^{2} w}{\partial y^{2}} & = \left( \frac{\partial^{2} w}{\partial u \partial y} \frac{\partial u}{\partial y} + \frac{\partial w}{\partial u} \frac{\partial^{2} u}{\partial y^{2}} \right) + \left( \frac{\partial^{2} w}{\partial v \partial y} \frac{\partial v}{\partial y} + \frac{\partial w}{\partial v} \frac{\partial^{2} v}{\partial y^{2}} \right)
\end{align}
$$

$$
\frac{\partial u}{\partial x} = x
$$
$$
\frac{\partial^{2} u}{\partial x^{2}} = 1
$$
$$
\frac{\partial u}{\partial y} = -y
$$
$$
\frac{\partial^{2} u}{\partial y^{2}} = -1
$$
$$
\frac{\partial v}{\partial x} = y
$$
$$
\frac{\partial^{2} v}{\partial x^{2}} = 0
$$
$$
\frac{\partial v}{\partial y} = x
$$
$$
\frac{\partial^{2} v}{\partial y^{2}} = 0
$$

$$
\begin{align}
w_{xx} + w_{yy} & = 0 \\
\frac{\partial^{2} w}{\partial u \partial x} \frac{\partial u}{\partial x} + \frac{\partial w}{\partial u} \frac{\partial^{2} u}{\partial x^{2}} + \frac{\partial^{2} w}{\partial v \partial x} \frac{\partial v}{\partial x} + \frac{\partial w}{\partial v} \frac{\partial^{2} v}{\partial x^{2}} + \frac{\partial^{2} w}{\partial u \partial y} \frac{\partial u}{\partial y} + \frac{\partial w}{\partial u} \frac{\partial^{2} u}{\partial y^{2}} + \frac{\partial^{2} w}{\partial v \partial y} \frac{\partial v}{\partial y} + \frac{\partial w}{\partial v} \frac{\partial^{2} v}{\partial y^{2}} & = 0 \\
\frac{\partial^{2} w}{\partial u \partial x} \cdot x + \frac{\partial w}{\partial u} \cdot 1 + \frac{\partial^{2} w}{\partial v \partial x} \cdot y + \frac{\partial w}{\partial v} \cdot 0 + \frac{\partial^{2} w}{\partial u \partial y} \cdot (-y) + \frac{\partial w}{\partial u} \cdot (-1) + \frac{\partial^{2} w}{\partial v \partial y} \cdot x + \frac{\partial w}{\partial v} \cdot 0 & = 0 \\
\frac{\partial^{2} w}{\partial u \partial x} \cdot x + \frac{\partial w}{\partial u} + \frac{\partial^{2} w}{\partial v \partial x} \cdot y - \frac{\partial^{2} w}{\partial u \partial y} \cdot y - \frac{\partial w}{\partial u} + \frac{\partial^{2} w}{\partial v \partial y} \cdot x & = 0 \\
\frac{\partial^{2} w}{\partial u \partial x} \cdot x + \frac{\partial^{2} w}{\partial v \partial y} \cdot x & = 0
\end{align}
$$

