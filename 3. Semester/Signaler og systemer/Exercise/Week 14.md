## Problem 9.21
Determine the Laplace transform and the associated region of convergence and pole-
zero plot for each of the following functions of time:
### (a) $x(t) = e^{ -2t } u(t) + e^{ -3t } u(t)$
Since there is the transform has the linearity property the transforms can be done individually for each term and then summed to find the transform of the entire signal. The transforms are determined based on table 9.2
$$
\begin{align*}
X(s) &= \int_{-\infty}^{\infty} e^{ -2t }u(t) e^{ -st } \, dt + \int_{-\infty}^{\infty} e^{ -3t }u(t) e^{ -st } \, dt\\
&= \frac{1}{s + 2} + \frac{1}{s + 3}
\end{align*}
$$

The ROC will be the region where both terms converge. From table 9.2 the ROC will therefore be
$$
\text{Re}(s) > -2
$$

The pole-zero plot will be as follows
![[SS Problem 9.21.a]]

### (b) $x(t) = e^{ -4t } u(t) + e^{ -5t } \sin(5t) u(t)$
Laplace transform:
$$
\begin{align*}
X(s) &= \frac{1}{s + 4} + \frac{5}{(s + 5)^{2} + 5^{2}}\\
&= \frac{1}{s + 4} + \frac{5}{s^{2} + 25 + 10s + 25}\\
&= \frac{1}{s + 4} + \frac{5}{s^{2} + 50 + 10s}
\end{align*}
$$

ROC:
$$
\text{Re}(s) > -4
$$
Pole-zero plot:
![[SS Problem 9.21.b]]

### (c) $x(t) = e^{ 2t } u(-t) + e^{ 3t } u(-t)$
Laplace transform:
using the rule for lefthanded signals $x(-t) \stackrel{\text{L.T.}} {\longleftrightarrow} X(-s)$
$$
\begin{align*}
X(s) &= \frac{1}{-s-2} + \frac{1}{-s-3}\\
&= -\frac{1}{s+2} - \frac{1}{s+3}
\end{align*}
$$

ROC:
$$
\text{Re}(s) < -3
$$
Pole-zero plot:
![[SS Problem 9.21.c]]

### (d) $x(t) = t e^{ -2|t| }$
Laplace transform:
$$
\begin{align*}
X(s) &= 
\end{align*}
$$

ROC:
$$
\text{Re}(s) < -3
$$
Pole-zero plot:

## Problem 9.31
Consider a continuous-time LTI system for which the input x(t) and output y(t) are related by the differential equation
$$
\frac{d^{2}y(t)}{dt^{2}} - \frac{dy(t)}{dt} - 2y(t) = x(t)
$$
Let X(s) and Y(s) denote Laplace transforms of x(t) and y(t), respectively, and let H(s) denote the Laplace transform of h(t), the system impulse response.
### (a)
Determine H(s) as a ratio of two polynomials in $s$. Sketch the pole-zero pattern of H(s).
$$
\begin{align*}
H(s) &= \frac{1}{s^{2}-s-2}\\
&= \frac{1}{(s+1)(s-2)}
\end{align*}
$$
![[SS Problem 9.31.a]]
