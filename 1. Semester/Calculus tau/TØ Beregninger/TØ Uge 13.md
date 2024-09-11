## Afsnit 13.5
### Opgave 3
$$
g(x,y)=xy^{2}
$$
$$
(2,-1)
$$
$$
\frac{ \partial g }{ \partial x } =y^{2} = (-1)^{2}
$$
$$
\frac{ \partial g }{ \partial y } =2xy=2(2)\cdot-1=-4
$$
$$
\nabla g=1i-4j
$$
gradient curve
$$
2=xy^{2} \Leftrightarrow y = -\sqrt{ \frac{2}{x} }
$$
Minus kvadratrod fordi vi ved det skal være negativ y-koordinat jvf. gradienten

### Opgave 12
$$
f(x,y)=2x^{2}+y^{2}, P_{0}(-1,1), v=3\mathbf{i}-4\mathbf{j}
$$
$$
|v|=\sqrt{ 3^{2}+4^{2} }=5
$$
$$
\vec{u}=\frac{v}{|v|}=\frac{3\mathbf{i}}{5}-\frac{4}{5}\mathbf{j}
$$

$$
\frac{ \partial f }{ \partial x } =4x=-4
$$
$$
\frac{ \partial f }{ \partial y } =2y=2
$$
$$
\vec{u}\bullet \nabla f
$$
$$
\begin{pmatrix}
\frac{3}{5} \\
-\frac{4}{5}
\end{pmatrix}\bullet \begin{pmatrix}
-4 \\
2
\end{pmatrix}
$$
$$
=\frac{3\cdot(-4)}{5}+ -\frac{4\cdot2}{5}=-4
$$

### Opgave 29
$$
f(x,y)=x^{2}-xy+y^{2}-y
$$
#### a)
Find the directions $\mathbf{u}$ and the values of $d_{u}f(1,-1)$ for which it is largest
$$
\frac{ \partial f }{ \partial x } =2x-y=2+1=3
$$
$$
\frac{ \partial f }{ \partial y } =-x+2y=-1+2\cdot(-1)-1=-4
$$
$$
\nabla f=3i-4j
$$
$$
|\nabla f|=\sqrt{ 3^{2}+(-4)^{2} }=5
$$
$$
\mathbf{u}=\frac{3}{5}\mathbf{i}-\frac{4}{5}\mathbf{j}
$$
#### b)
for which the value is smallest
$$
\mathbf{u}=-\frac{3}{5}\mathbf{i}+\frac{4}{5}\mathbf{j}
$$
#### c)
for which it is 0 aka $\perp$ 

$$
\mathbf{u}=\begin{cases}
-\frac{4}{5}\mathbf{i}-\frac{3}{5}\mathbf{j} \\
\frac{4}{5}\mathbf{i}+\frac{3}{5}\mathbf{j}
\end{cases}
$$

#### d)
for which it is 4
$$
d_{u}f=\nabla f\bullet u
$$
$$
\vec{v}f(1,-1)\bullet \vec{u}=4
$$
$$
(3\mathbf{i}-4\mathbf{j})(u_{1}\mathbf{i}_{0}u_{2}\mathbf{j})=4
$$
$$
3u_{1}-4u_{2}=4 \implies u_{1}=\frac{4+4u_{2}}{3}
$$
$$
\sqrt{ u_{1}^{2}+u_{2}^{2} }=1 \implies u_{1}^{2}+u_{2}^{2}=1 \implies
$$
$$
\left(\frac{4+4u_{2}}{3}\right)^{2}+u_{2}^{2}=1 
$$
$$
\frac{(4+4 u_{2})^{2}}{9}+u_{2}^{2}=1
$$
$$
\frac{16+16u_{2}^{2}+32u_{2}}{9}+u_{2}^{2}=1
$$
$$
\frac{25}{9}u_{2}^{2}+\frac{32}{9}u_{2}+\frac{7}{9}=0
$$
$$
\frac{-b\pm \sqrt{d }}{2a}
$$
$$
d=\left( \frac{32}{9} \right)^{2}-4\cdot \frac{25}{9}\cdot \frac{7}{9}
$$
$$
d=\frac{32^{2}}{9^{2}}-\frac{700}{9^{2}}=\frac{1024}{81}-\frac{700}{81}=4??
$$
$$
\frac{-\frac{32}{9}\pm 2}{2\cdot \frac{25}{9}}=
$$
(1)
$$
\frac{\frac{-32+18}{2\cdot \frac{25}{9}}}{\frac{50}{9}} 
$$
$$
u_{2}=-\frac{14\cdot9}{9\cdot50}=-\frac{7}{25}
$$
(2)
$$
\frac{\frac{-50}{9}}{\frac{50}{9}}
$$
$$
u_{2}=-1
$$


(1)
$$
u_{1}=\frac{4+4u_{2}}{3}
$$$$
=\frac{4+4\frac{-7}{25}}{3}
$$
$$
=\frac{\frac{100}{25}-\frac{28}{25}}{3}
$$
$$
=\frac{\frac{72}{25}}{3}
$$
$$
\frac{24}{25}
$$
(2)

$$
u_{1}=\frac{4+4(-1)}{3}
$$
$$
u_{1}=0
$$

#### e)
for which it is -3
$$
d_{u}f=\nabla f\bullet u
$$
$$
\vec{v}f(1,-1)\bullet \vec{u}=-3
$$
$$
(3\mathbf{i}-4\mathbf{j})(u_{1}\mathbf{i}_{0}u_{2}\mathbf{j})=-3
$$
$$
3u_{1}-4u_{2}=-3 \implies u_{1}=\frac{-3+4u_{2}}{3}
$$
$$
\sqrt{ u_{1}^{2}+u_{2}^{2} }=1 \implies u_{1}^{2}+u_{2}^{2}=1 \implies
$$
$$
\left(\frac{-3+4u_{2}}{3}\right)^{2}+u_{2}^{2}=1 
$$
$$
\frac{(-3+4 u_{2})^{2}}{9}+u_{2}^{2}=1
$$
$$
\frac{9+16u_{2}^{2}-24u_{2}}{9}+u_{2}^{2}=1
$$
$$
\frac{25}{9}u_{2}^{2}-\frac{24}{9}u_{2}=0
$$
$$
\frac{-b\pm \sqrt{d }}{2a}
$$
$$
d=\left( \frac{-24}{9} \right)^{2}
$$

$$
\frac{\frac{24}{9}\pm \frac{24}{9}}{2\cdot \frac{25}{9}}=
$$
(1)
$$
=\frac{\frac{24}{9}+\frac{24}{9}}{\frac{50}{9}}
$$
$$
\frac{\frac{48}{9}}{\frac{50}{9}}
$$
$$
u_{2}=\frac{24}{25}
$$
(2)
$$
=\frac{\frac{24}{9}-\frac{24}{9}}{\frac{50}{9}}
$$
$$
u_{2}=0
$$

(1)
$$
u_{1}=\frac{-3+4u_{2}}{3}
$$$$
=\frac{-3+4\frac{24}{25}}{3}
$$
$$
=\frac{\frac{-75}{25}+\frac{96}{25}}{3}
$$
$$
=\frac{\frac{21}{25}}{3}
$$
$$
\frac{7}{25}
$$
(2)

$$
u_{1}=\frac{-3+4(0)}{3}
$$
$$
u_{1}=-1
$$

## Afsnit 13.7
### Opgave 2
![[Pasted image 20231127080722.png]]
Ligning:
$$
f(x,y) = 2xy - 5x^{2} - 2y^{2} + 4x + 4y - 4
$$

Derivatives with respect to x:
$$
f_{x} = 2y - 10x + 4
$$
$$
f_{xx} = - 10
$$
$$
f_{xy} = 2
$$

Derivatives with respect to y:
$$
f_{y} = 2x - 4y 
$$
$$
f_{yy} = - 4
$$

Find discriminant:
$$
f_{xx} \cdot f_{yy} - f_{xy}^{2} = (- 10) \cdot (- 4) - 2^{2} = 36
$$

Ifølge theorem 11 er der et lokalt maksimum:
$$
\begin{cases}
f_{x} = 2y - 10x + 4 = 0 \Leftrightarrow x - 10x + 4 = 0 \Leftrightarrow x = - \frac{4}{9} \\
f_{y} = 2x - 4y = 0 \Leftrightarrow 2y = x \Leftrightarrow y = -\frac{4}{9} \cdot \frac{1}{2} = - \frac{2}{9}
\end{cases}
$$

$x = -\frac{4}{9}$ og $y = -\frac{2}{9}$ indsættes i funktionen:
$$
\begin{align}
f\left( -\frac{4}{9},-\frac{2}{9} \right) & = 2 \cdot \left( -\frac{4}{9} \right) \cdot \left( -\frac{2}{9} \right) - 5 \cdot \left( -\frac{4}{9} \right)^{2} - 2 \cdot \left( -\frac{2}{9} \right)^{2} + 4 \cdot \left( -\frac{4}{9} \right) + 4 \cdot \left( -\frac{2}{9} \right) - 4 \\
 & = \frac{16}{81} - \frac{80}{81} - \frac{8}{81} - \frac{16}{9} - \frac{8}{9} - 4 \\
 & = - \frac{72}{81} - \frac{144}{81} - \frac{72}{81} - \frac{324}{81} \\
 & = - \frac{288}{81} - \frac{324}{81} \\
 & = - \frac{612}{81} \\
 & = - \frac{68}{9}
\end{align}
$$

### Opgave 33
![[Pasted image 20231127080755.png]]
![[Pasted image 20231127081241.png]]
Ligning:
$$
f(x,y) = x^{2} + y^{2}, \text{ bounded by } x = 0, y = 0, y + 2x = 2 \Leftrightarrow y = 2 - 2x
$$

Tegning:
![[Calculus TØ Uge 13 Opg 33]]

Interior:
$$
f_{x} = 2x = 0 \Leftrightarrow x = 0
$$
$$
f_{y} = 2y \Leftrightarrow y = 0
$$
$$
f(0,0) = 0^{2} + 0^{2} = 0
$$

Boundary:
OA
$$
g(y) = f(0,y) = 0^{2} + y^{2} = y^{2}
$$
$$
g(2) = 2^{2} = 4
$$
$$
g'(y) = 2y = 0 \Leftrightarrow y = 0 \ \ \ \ \text{ allerede løst }
$$

OB
$$
h(x) = f(x,0) = x^{2} + 0^{2} = x^{2}
$$
$$
h(1) = 1^{2} = 1
$$
$$
h'(x) = 2x = 0 \Leftrightarrow x = 0 \ \ \ \ \text{allerede løst}
$$

AB
$$
k(x) = f(x,2-2x) = x^{2} + (2-2x)^{2} = 5x^{2} - 8x + 4
$$
$$
k'(x) = 10x - 8 = 0 \Leftrightarrow x = \frac{8}{10}
$$
$$
f\left( \frac{8}{10},2-2 \cdot \frac{8}{10} \right) = \frac{8}{10}^{2} + \left( 2 - \frac{16}{10} \right)^{2} = \frac{64}{100} + \left( -\frac{4}{10} \right)^{2} = \frac{8}{10}
$$
Minimum: $f(0,0) = 0$ 
Maksimum: $f(0,2) = 4$

### Opgave 41
Ligning:
$$
T(x,y) = x^{2} + 2y^{2} - x \text{ bounded by } x^{2} + y^{2} \leq 1
$$

Tegning:


Interior:
$$
T_{x} = 2x - 1 = 0 \Leftrightarrow x = \frac{1}{2}
$$
$$
T_{y} = 4y = 0 \Leftrightarrow y = 0
$$
$$
T\left( \frac{1}{2},0 \right) = \frac{1}{2}^{2} + 2 \cdot 0^{2} - \frac{1}{2} = - \frac{1}{4}
$$

Boundary:
$$
x^{2} + y^{2} = 1 \Leftrightarrow y = \sqrt{ 1 - x^{2} }
$$
$$
\begin{align}
f(x) = T(x,\sqrt{ 1 - x^{2} }) & = x^{2} + 2 \cdot \sqrt{ 1 - x^{2} }^{2} - x \\
 & = x^{2} + 2 - 2x^{2} - x \\
 & = -x^{2} - x + 2
\end{align}
$$
$$
f'(x) = - 2x - 1 = 0 \Leftrightarrow x = - \frac{1}{2}
$$
$$
f\left( -\frac{1}{2} \right) = - \left( -\frac{1}{2} \right)^{2} - \left( -\frac{1}{2} \right) + 2 = \frac{11}{4}
$$
