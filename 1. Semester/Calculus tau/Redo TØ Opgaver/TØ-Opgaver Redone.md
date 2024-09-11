# Indholdsfortegnelse
```table-of-contents
```

# Uge 1 - Differentialregning (gym)
![[Pasted image 20240118120608.png]]

# Uge 2 - Differentialregning (uni)
![[Pasted image 20240118121305.png]]
## Afsnit 3.7 - Implicit Differentiation

### Opgave 33
*In Exercises 33-42, verify that the given point is on the curve and find the lines that are (a) tangent and (b) normal to the curve at the given point.*
$$
x^{2} + x \cdot y - y^{2} = 1 \ \ \ \ (2,3)
$$
**Bekræft punktet er på kurven:**
$$
\begin{align}
2^{2} + 2 \cdot 3 - 3^{2} & = 1 \\
4 + 6 - 9 & = 1 \\
1 = 1
\end{align}
$$
Punktet er på kurven

**(a) Tangent**
$$
\begin{align}
2 \cdot x + y + x \cdot \frac{dy}{dx} - 2 \cdot y \cdot \frac{dy}{dx} & = 0 \\
x \cdot \frac{dy}{dx} - 2 \cdot y \cdot \frac{dy}{dx} & = - 2 \cdot x - y \\
\frac{dy}{dx} \cdot (x - 2 \cdot y) & = - 2 \cdot x - y \\
\frac{dy}{dx} & = \frac{- 2 \cdot x - y}{x - 2 \cdot y} \\
\frac{dy}{dx} & = \frac{- 2 \cdot 2 - 3}{2 - 2 \cdot 3} \\
\frac{dy}{dx} & = \frac{-7}{-4} = \frac{7}{4}
\end{align}
$$
$$
\begin{align}
y & = \frac{7}{4} \cdot (x - 2) + 3 \\
 & = \frac{7}{4} \cdot x - \frac{7}{2} + \frac{6}{2} \\
 & = \frac{7}{4} \cdot x - \frac{1}{2}
\end{align}
$$

**(b) Normal**
$$
\alpha = \frac{-1}{\frac{7}{4}} = - \frac{4}{7}
$$
$$
\begin{align}
y & = -\frac{4}{7} \cdot (x - 2) + 3 \\
 & = -\frac{4}{7} \cdot x + \frac{8}{7} + \frac{21}{7} \\
 & = -\frac{4}{7} \cdot x + \frac{29}{7}
\end{align}
$$

## Afsnit 4.5 - L'Hôpital's Regel
### Opgave 87
*Show that*
$$
\lim_{ k \to \infty } \left( 1 + \frac{r}{k} \right)^{k} = e^{r}
$$

**Proof**
$$
\begin{align}
\left( 1 + \frac{r}{k} \right)^{k} & = e^{\ln\left( (1 + \frac{r}{k})^{k} \right)} \\
 & = e^{k \cdot \ln(1 + \frac{r}{k})}
\end{align}
$$
$$
\begin{align}
\lim_{ k \to \infty } e^{k \cdot \ln\left( 1 + \frac{r}{k} \right)} & = e^{r} \\
\exp\left( {\lim_{ k \to \infty } \frac{\ln\left( 1 + \frac{r}{k} \right)}{\frac{1}{k}}} \right) & = e^{r} \\
\exp\left( \lim_{ k \to \infty } \frac{\frac{-\frac{r}{k^{2}}}{1 + \frac{r}{k}}}{-\frac{1}{k^{2}}} \right) & = e^{r} \\
\exp\left( \lim_{ k \to \infty } \frac{-\frac{r}{k^{2}} \cdot k^{2}}{\left(1 + \frac{r}{k}\right) \cdot (-1)} \right) & = e^{r} \\
\exp\left( \lim_{ k \to \infty } \frac{r}{1 + \frac{r}{k}} \right) & = e^{r} \\
\exp\left( \frac{r}{1 + 0} \right)  & = e^{r} \\
e^{\frac{r}{1}} & = e^{r} \\
e^{r} & = e^{r}
\end{align}
$$

# Uge 3 - Integralregning (1 variabel)
![[Pasted image 20240118121738.png]]
## Afsnit 6.3 - Kurvelængder
### Opgave 9
Find the lengths of the curves in Exercises 1-16. If you have graphing software, you may want to graph these curves to see what they look like.
$$
y = \ln(x) - \frac{x^{2}}{8} \ \ \text{ from } x = 1 \text{ to } x = 2
$$

$$
\frac{dy}{dx} = \frac{1}{x} - \frac{2 \cdot x}{8} = \frac{1}{x} - \frac{x}{4}
$$

$$
\begin{align}
L & = \int^{2}_{1} \sqrt{ 1 + \left(\frac{1}{x} - \frac{x}{4} \right)^{2} } \, dx  \\
 & = \int^{2}_{1} \sqrt{ 1 + \frac{1}{x^{2}} + \frac{x^{2}}{16} - \frac{2 \cdot x}{4 \cdot x} } \, dx \\ \\
 & = \int^{2}_{1} \sqrt{ 1 + \frac{1}{x^{2}} + \frac{x^{2}}{16} - \frac{1}{2} } \, dx \\
 & = \int^{2}_{1} \sqrt{ \frac{1}{2} + \frac{1}{x^{2}} + \frac{x^{2}}{16} } \, dx \\
 & = \int^{2}_{1} \sqrt{ \left( \frac{1}{x} + \frac{x}{4} \right)^{2} } \, dx \\
 & = \int^{2}_{1} \frac{1}{x} + \frac{x}{4} \, dx \\
 & = \left[ \ln(x) + \frac{x^{2}}{8} \right]_{1}^{2} \\
 & = \ln(2) + \frac{2^{2}}{8} - (\ln(1) + \frac{1^{2}}{8}) \\
 & = \ln(2) + \frac{4}{8} - 0 - \frac{1}{8} \\
 & = \ln(2) + \frac{3}{8}
\end{align}
$$

### Opgave 19
In Exercises 17-24, do the following. 
a. Set up an integral for the length of the curve. 
b. Graph the curve to see what it looks like. 
c. Use your grapher’s or computer’s integral evaluator to find the curve’s length numerically.
$$
x = \sin(y), \ \ \ \ 0 \leq y \leq \pi
$$
**a.**
$$
x'(y) = \cos(y)
$$
$$
\begin{align}
L & = \int^{\pi}_{0} \sqrt{ 1 + \cos(y)^{2} } \, dy \\
\end{align}
$$


## Afsnit 8.2 - Delvis Integration
### Opgave 24
Evaluate the integrals in Exercises 1-24 using integration by parts.
$$
\int e^{-2x} \cdot \sin(2x) \, dx 
$$

$u(x) = e^{-2x}$, $v'(x) = \sin(2x)$, $u'(x) = -2 \cdot e^{-2x}$, $v(x) = - \frac{1}{2} \cdot \cos(2x)$
$$
\begin{align}
 & \int e^{-2x} \cdot \sin(2x) \, dx  \\
 & = e^{-2x} \cdot \left( - \frac{1}{2} \cdot \cos(2x) \right) - \int (- 2 \cdot e^{-2x}) \cdot \left( -\frac{1}{2} \cdot \cos(2x) \right) \, dx  \\
 & = - \frac{1}{2} \cdot e^{-2x} \cdot \cos(2x) - \int e^{-2x} \cdot \cos(2x) \, dx  \\
\end{align}
$$

$u(x) = e^{-2x}$, $v'(x) = \cos(2x)$, $u'(x) = -2 \cdot e^{-2x}$, $v(x) = \frac{1}{2} \cdot \sin(2x)$
$$
\begin{align}
 & - \frac{1}{2} \cdot e^{-2x} \cdot \cos(2x) - \int e^{-2x} \cdot \cos(2x) \, dx  \\
 & = - \frac{1}{2} \cdot e^{-2x} \cdot \cos(2x) - \left( e^{-2x} \cdot \frac{1}{2} \cdot \sin(2x) - \int -2 \cdot e^{-2x} \cdot \frac{1}{2} \sin(2x) \, dx  \right) \\
 & = - \frac{1}{2} \cdot e^{-2x} \cdot \cos(2x) - \left( e^{-2x} \cdot \frac{1}{2} \cdot \sin(2x) + \int e^{-2x} \cdot \sin(2x) \, dx  \right) \\
 & = - \frac{1}{2} \cdot e^{-2x} \cdot \cos(2x) - \frac{1}{2} \cdot e^{-2x} \cdot \sin(2x) - \int e^{-2x} \cdot \sin(2x) \, dx
\end{align}
$$

$$
\begin{align}
\int e^{-2x} \cdot \sin(2x) \, dx & = - \frac{1}{2} \cdot e^{-2x} \cdot \cos(2x) - \frac{1}{2} \cdot e^{-2x} \cdot \sin(2x) - \int e^{-2x} \cdot \sin(2x) \, dx \\
2 \cdot \int e^{-2x} \cdot \sin(2x) \, dx & = - \frac{1}{2} \cdot e^{-2x} \cdot \cos(2x) - \frac{1}{2} \cdot e^{-2x} \cdot \sin(2x) \\
\int e^{-2x} \cdot \sin(2x) \, dx & = - \frac{1}{4} \cdot e^{-2x} \cdot \cos(2x) - \frac{1}{4} \cdot e^{-2x} \cdot \sin(2x) \\
\int e^{-2x} \cdot \sin(2x) \, dx & = - \frac{1}{4} \cdot e^{-2x} \cdot (\cos(2x) + \sin(2x))
\end{align}
$$

## Afsnit 8.8 - Uegentlige Integraler
### Opgave 26
The integrals in Exercises 1-34 converge. Evaluate the integrals without using tables.
$$
\int^{1}_{0} (-\ln(x)) \, dx
$$

$$
\begin{align}
\lim_{ a \to 0 } - \int^{1}_{a} \ln(x) \, dx & = \lim_{ a \to 0 } -[x \cdot \ln(x) - x]_{a}^{1} \\
 & = \lim_{ a \to 0 } -((1 \cdot \ln(1) - 1) - (a \cdot \ln(a) - a)) \\
 & = \lim_{ a \to 0 } (a \cdot \ln(a) - a) - (1 \cdot 0 - 1) \\
 & = \lim_{ a \to 0 } a \cdot \ln(a) - a - 0 + 1 \\
 & = 0 \cdot \ln(0) - 0 + 1 \\
 & = 1
\end{align}
$$

# Uge 4 - Komplekse Tal
![[Pasted image 20240118121923.png]]
## Afsnit 18.1
### Opgave 3 (s. 1103)
![[Pasted image 20240118131749.png]]

Tror $\frac{1}{z}$ svarer til $\frac{x}{x^{2} + y^{2}} - i \cdot \frac{y}{x^{2} + y^{2}}$
Gider ikke tegne det

# Uge 5 - Rækker og Følger
![[Pasted image 20240118122026.png]]
## Afsnit 9.1 - Følger
### Opgave 127
In Exercises 125-134, determine whether the sequence is monotonic, whether it is bounded, and whether it converges.
$$
a_{n} = \frac{2^{n} - 1}{2^{n}}
$$

$$
a_{n} = \frac{2^{n}}{2^{n}} - \frac{1}{2^{n}}
$$
$$
\lim_{ n \to \infty } a_{n} = 1 - 0 = 1
$$
Rækken går mod 1.
Rækken er ikke-aftagende, så den er monotonisk.
Den har en øvre grænse på 1, men ingen nedre grænse da det første led i omskrivningen giver 1 i alle tilfælde og det andet led går mod 0 for positiv n og mod uendelig for negativ n. Den er dermed unbounded.

## Afsnit 9.2 - Uendelige Rækker
### Opgave 78 ???
In each of the geometric series in Exercises 77-80, write out the first
few terms of the series to find a and r, and find the sum of the series.
Then express the inequality |r| < 1 in terms of x and find the values of
x for which the inequality holds and the series converges. 
$$
\sum^{\infty}_{n = 0} (-1)^{n} \cdot x^{2n}
$$

$$
(-1)^{0} \cdot x^{2 \cdot 0} = 1
$$
$$
(-1)^{1} \cdot x^{2 \cdot 1} = -x^{2}
$$
$$
(-1)^{2} \cdot x^{2 \cdot 2} = x^{4}
$$

$a = 1$ og $r = -x^{2}$
$$
\sum^{\infty}_{n = 0} 1 \cdot (-x^{2})^{n}
$$

$$
\begin{align}
|-x^{2}| & < 1
\end{align}
$$


## Afsnit 9.3 - Integralkriteriet
### Opgave 55
Estimate the value of $\sum^{\infty}_{n = 2} \left( \frac{1}{n^{2} + 4} \right)$ to within 0.01 of its exact value.

$$
f(x) = \frac{1}{x^{2} + 4}
$$
$$
\int^{\infty}_{2} \frac{1}{x^{2} + 4} \, dx 
$$
$$
u = x^{2} + 4
$$
$$
\begin{align}
\frac{du}{dx} & = 2x \\
dx & = \frac{1}{2x} du
\end{align}
$$
$$
\int \frac{1}{u} \, dx 
$$

## Afsnit 9.4 - Sammenligningskriteriet
### Opgave 3


## Afsnit 9.5 - Absolut Konvergens
### Opgave 4


# Uge 6 - Rækker
![[Pasted image 20240118122213.png]]
## Afsnit 9.6 - Alternerende Rækker
### Opgave 36


## Afsnit 9.7 - Potensrækker
### Opgave 19


## Afsnit 9.8 - Taylorrækker
### Opgave 29


## Afsnit 9.9 - Restled af Taylorrækker
### Opgave 6

# Uge 7 - Sandsynlighed
![[Pasted image 20240118122233.png]]

# Uge 8 - Sandsynlighed
Opgaver på brightspace

# Uge 9 - Sandsynlighed
Opgaver på brightspace

# Uge 10 - Differentialligninger
![[Pasted image 20240118122350.png]]
## Afsnit 16.2 - Første Ordens Diff. ligninger
### Opgave 5


## Afsnit 16.3
### Opgave 13


## Afsnit 16.4
### Opgave 21


# Uge 11 - Differentialligninger
![[Pasted image 20240118122430.png]]
## Afsnit 17.1 - Anden Ordens Diff. ligninger
### Opgave 31
In Exercises 31—40, find the unique solution of the second-order initial value problem.
$$
y'' + 6y' + 5y = 0, \ \ \ \ y(0) = 0, \ \ \ \ y'(0) = 3
$$
$$
D = 36 - 4 \cdot 1 \cdot 5 = 16
$$
$$
r = \frac{-6 \pm 4}{2} = -3 \pm 4 = -7 \wedge 1
$$
$$
y = c_{1} \cdot e^{-7x} + c_{2} \cdot e^{x}
$$
$$
y' = -7 \cdot c_{1} \cdot e^{-7x} + c_{2} \cdot e^{x}
$$

$$
c_{1} + c_{2} = 0
$$
$$
\begin{align}
-7 \cdot c_{1} \cdot 1 + c_{2} & = 3 \\
-7 \cdot c_{1} - c_{1}  & = 3 \\
-8 c_{1} & = 3 \\
c_{1} = - \frac{3}{8}
\end{align}
$$
$$
c_{2} = \frac{3}{8}
$$
$$
y = -\frac{3}{8} \cdot e^{-7x} + \frac{3}{8} \cdot e^{x}
$$

## Afsnit 17.2 - Inhomogene Ligninger
### Opgave 7


## Afsnit 17.3
### Opgave 1


## Afsnit 17.5 - Potensrækker 
### Opgave 5


# Uge 12 - Partielle Afledede
![[Pasted image 20240118122455.png]]
## Afsnit 13.3 - Grundlæggende
### Opgave 2


## Afsnit 13.4 - Kædereglen
### Opgave 24


# Uge 13 - Partielle Afledede
![[Pasted image 20240118122544.png]]
## Afsnit 13.5 - Retningsafledte og Gradient
### Opgave 3


## Afsnit 13.7 - Ekstremværdier
### Opgave 2