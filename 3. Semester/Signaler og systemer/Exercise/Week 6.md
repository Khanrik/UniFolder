## Problem 3.1
A continuous-time periodic signal $x(t)$ is real valued an has a fundamental period $T=8$. The nonzero Fourier series coefficients for $x(t)$ are
$$
a_{1} = a_{-1} = 2, a_{3} = a_{-3}^{*} = 4j
$$
Express $x(t)$ in the form
$$
x(t) = \sum^{\infty}_{k = 0} A_{k} \cos(\omega_{k}t + \phi_{k})
$$

The fundamental frequency can be calculated to
$$
\omega_{0} = \frac{2\pi}{T} = \frac{2\pi}{8} = \frac{\pi}{4}
$$

The given terms of $x(t)$ can now be written on the form $a_{k}e^{j\omega_{0}kt}$
$$
x(t) = 2 \cdot e^{j \frac{\pi}{4} t} + 2 \cdot e^{-j \frac{\pi}{4} t} + 4j \cdot e^{j 3 \frac{\pi}{4} t} - 4j \cdot e^{-j 3 \frac{\pi}{4} t}
$$
It can be seen that the terms of the signal is divided in two parts. One part where $k=1$
$$
2 \cdot \left(e^{j \frac{\pi}{4} t} + e^{-j \frac{\pi}{4} t}\right)
$$
And one part where $k=3$
$$
4j \cdot (e^{j 3 \frac{\pi}{4} t} - e^{-j 3 \frac{\pi}{4} t})
$$
These can be rewritten using the Euler's formulas ($e^{jt} = \cos(t) + j \sin(t)$ and $e^{-jt} = \cos(t) - j \sin(t)$):
$$
\begin{align*}
x(t) &= 2 \cdot \left( \cos\left( \frac{\pi}{4} t \right) + j \sin\left( \frac{\pi}{4} t \right) + cos\left( \frac{\pi}{4} t \right) - j \sin\left( \frac{\pi}{4} t \right) \right) + 4j \cdot \left( \cos\left( 3\frac{\pi}{4} t \right) + j \sin\left( 3 \frac{\pi}{4} t \right) - \left( \cos\left( 3 \frac{\pi}{4} t \right) - j \sin\left( 3 \frac{\pi}{4} \right) \right) \right)\\
x(t) &= 2 \cdot \left(2 \cos\left( \frac{\pi}{4} t \right) \right) + 4j \cdot \left( 2j \sin\left( 3 \frac{\pi}{4} t \right) \right)\\
x(t) &= 4 \cos\left( \frac{\pi}{4} t \right) - 8 \sin\left( 3 \frac{\pi}{4} t \right)
\end{align*}
$$

Utilizing the relation between sine and cosine ($-\sin(t) = \cos\left( t + \frac{\pi}{2} \right)$) we get:
$$
x(t) = 4 \cos\left( \frac{\pi}{4} t \right) + 8 \cos\left( 3 \frac{\pi}{4} t + \frac{\pi}{2} \right)
$$

In the form $\sum^{\infty}_{k = 0} A_{k} \cos(\omega_{k}t + \phi_{k})$, every value of $A_{k}$ would be 0 except for $k=1$ and $k=3$, where
$$
A_{1} = 4, \; A_{3} = 8
$$
and
$$
\phi_{1} = 0, \; \phi_{3} = \frac{\pi}{2}
$$

## Problem 3.3
For the continuous-time periodic signal
$$
x(t) = 2 + \cos\left( \frac{2\pi}{2} t \right) + 4 \sin\left( \frac{5\pi}{3} t \right)
$$
determine the fundamental frequency $w_{0}$ and the Fourier series coefficients $a_{k}$ such that

## Problem 3.4
