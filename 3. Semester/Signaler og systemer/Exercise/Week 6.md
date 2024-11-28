## Problem 3.1
A continuous-time periodic signal $x(t)$ is real valued an has a fundamental period $T=8$. The nonzero Fourier series coefficients for $x(t)$ are
$$
a_{1} = a_{-1} = 2, a_{3} = a_{-3}^{*} = 4j
$$
Express $x(t)$ in the form
$$
x(t) = \sum^{\infty}_{k = 0} A_{k} \cos(\omega_{k}t + \phi_{k})
$$

### Solution
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

## Problem 3.2
A discrete-time periodic signal $x[n]$ is real valued and has a fundamental period $N = 5$. The nonzero Fourier series coefficients for $x[n]$ are
$$
a_{0} = 1, a_{2} = a^{*}_{-2} = e^{ j \frac{\pi}{4} }, a_{4} = a^{*}_{-4} = 2e^{ j \frac{\pi}{3} }
$$
Express $x[n]$ in the form
$$
x[n] = A_{0} + \sum^{\infty}_{k = 1} A_{k} \sin(\omega_{k} n + \phi_{k})
$$

### Solution
The fundamental frequency can be calculated to
$$
\Omega_{0} = \frac{2\pi}{N} = \frac{2\pi}{5} = \frac{2\pi}{5}
$$

The given terms of $x[n]$ can now be written on the form $a_{k}e^{j\Omega_{0}kn}$
$$
\begin{align*}
x[n] &= 1 \cdot e^{ 0 j \frac{2\pi}{5} n } + e^{ j \frac{\pi}{4} } e^{ 2 j \frac{2\pi}{5} n } + e^{ - j \frac{\pi}{4} } e^{ -2 j \frac{2\pi}{5} n} + 2e^{ j \frac{\pi}{3} } e^{ 4 j \frac{2\pi}{5} n } + 2e^{ -j \frac{\pi}{3} } e^{ - 4j \frac{2\pi}{5} n }\\
&= 1 + e^{ j \frac{\pi}{4} + 2 j \frac{2\pi}{5} n } + e^{ - j \frac{\pi}{4} - 2 j \frac{2\pi}{5} n } + 2 \left( e^{ j \frac{\pi}{3} + 4 j \frac{2\pi}{5} n } + e^{ -j \frac{\pi}{3} - 4j \frac{2\pi}{5} n } \right)\\
&= 1 + 2\cos\left( \frac{\pi}{4} + \frac{4\pi}{5} n \right) + 4 \cos\left( \frac{\pi}{3} + \frac{8\pi}{5} n \right)\\
&= 1 + 2\sin\left( \frac{3\pi}{4} + \frac{4\pi}{5} n \right) + 4 \sin\left( \frac{5\pi}{6} + \frac{8\pi}{5} n \right)
\end{align*}
$$



## Problem 3.3
For the continuous-time periodic signal
$$
x(t) = 2 + \cos\left( \frac{2\pi}{3} t \right) + 4 \sin\left( \frac{5\pi}{3} t \right)
$$
determine the fundamental frequency $w_{0}$ and the Fourier series coefficients $a_{k}$ such that
$$
x(t) = \sum^{\infty}_{k = -\infty} a_{k} e^{jk\omega_{0}t}
$$

### Solution
The cosine and sine terms can be rewritten using Euler's relations resulting in
$$
\begin{align*}
x(t) &= 2 + \frac{e^{j \frac{2\pi}{3} t} + e^{-j \frac{2\pi}{3} t}}{2} + 4 \frac{e^{j \frac{5\pi}{3} t} - e^{-j \frac{5\pi}{3} t}}{2j}\\
&= 2 + \frac{1}{2} \left( e^{j \frac{2\pi}{3} t} + e^{-j \frac{2\pi}{3} t} \right) + \frac{2}{j} \left( e^{j \frac{5\pi}{3} t} - e^{-j \frac{5\pi}{3} t} \right)\\\\
&= 2 + \frac{1}{2} \left( e^{j \frac{2\pi}{3} t} + e^{-j \frac{2\pi}{3} t} \right) + \frac{2j}{j \cdot j} \left( e^{j \frac{5\pi}{3} t} - e^{-j \frac{5\pi}{3} t} \right)\\
&= 2 + \frac{1}{2} \left( e^{j \frac{2\pi}{3} t} + e^{-j \frac{2\pi}{3} t} \right) - 2j \left( e^{j \frac{5\pi}{3} t} - e^{-j \frac{5\pi}{3} t} \right)
\end{align*}
$$
It can be seen that the angular frequency of the exponential terms are $\frac{2\pi}{3}$ and $\frac{5\pi}{3}$. The greatest common divisor between these two terms is $\frac{\pi}{3}$, which must mean that the fundamental frequency is
$$
\omega_{0} = \frac{\pi}{3}
$$

Writing $x(t)$ in terms of exponentials then gives
$$
x(t) = 2 + \frac{1}{2} e^{j 2 \frac{\pi}{3} t} + \frac{1}{2} e^{-j 2 \frac{\pi}{3} t} + 2j e^{j 5 \frac{\pi}{3} t} - 2j e^{-j 5 \frac{\pi}{3} t}
$$

From this it can be seen that the different Fourier series coefficients should be
$$
a_{0} = 2, \; a_{2} = a_{-2} = \frac{1}{2}, \; a_{5} = a_{-5}^{*} = -2j
$$

## Problem 3.4
$$
\begin{equation}
\tag{3.39}
a_{k} = \frac{1}{T} \int_{T} x(t) e^{-jk\omega_{0} t} \, dt = \frac{1}{T} \int_{T} x(t) e^{-jk(2\pi/T)t} \, dt  
\end{equation}
$$
Use the Fourier series analysis equation (3.39) to calculate the coefficients $a_{k}$ for the continuous-time periodic signal
$$
x(t) =
\begin{cases}
1.5, & 0 \leq t < 1 \\
-1.5, & 1 \leq t < 2
\end{cases}
$$
with a fundamental frequency of $\omega_{0} = \pi$

### Solution
First the fundamental period is found from the fundamental frequency
$$
T = \frac{2\pi}{\omega_{0}} = \frac{2\pi}{\pi} = 2
$$

The Period can now be inserted into the equation
$$
a_{k} = \frac{1}{2} \int^{2}_{0} x(t) \cdot e^{-jk \frac{2\pi}{2} t} \, dt = \frac{1}{2} \int^{2}_{0} x(t) \cdot e^{-jk \pi t} \, dt
$$

Inserting the two different intervals from the signals piece-wise function gives
$$
\begin{align*}
a_{k} &= \frac{1}{2} \left( \int^{1}_{0} 1.5 \cdot e^{- j k \pi t} \, dt + \int^{2}_{1} (-1.5) \cdot e^{- j k \pi t} \, dt  \right)\\
&= \frac{1}{2} \left( \frac{3}{2} \int^{1}_{0} e^{-jk \pi t} \, dt - \frac{3}{2} \int^{2}_{1} e^{-jk \pi t} \, dt \right)\\
&= \frac{3}{4} \left[ -\frac{1}{jk\pi}e^{-jk\pi t} \right]^{1}_{0} - \frac{3}{4} \left[ -\frac{1}{jk\pi}e^{-jk\pi t} \right]^{2}_{1}\\
&= -\frac{3}{4jk\pi} \left[ e^{-jk\pi t} \right]^{1}_{0} + \frac{3}{4jk\pi} \left[ e^{-jk\pi t} \right]^{2}_{1}\\
&= \frac{3}{4jk\pi} \left[ e^{-jk\pi t} \right]^{2}_{1} - \frac{3}{4jk\pi} \left[ e^{-jk\pi t} \right]^{1}_{0}\\
&= \frac{3}{4jk\pi} ( [e^{-jk\pi t}]^{2}_{1} - [e^{-jk\pi t}]^{1}_{0} )\\
&= \frac{3}{4jk\pi} ( e^{-2jk\pi} - e^{-jk\pi} - e^{-jk\pi} + e^{-0jk\pi} )\\
&= \frac{3}{4jk\pi} ( e^{-2jk\pi} - 2e^{-jk\pi} + 1 )\\
&= \frac{3}{4jk\pi} ( (e^{-2j\pi})^{k} - 2(e^{-j\pi})^{k} + 1 )\\
&= \frac{3}{4jk\pi} ( (1)^{k} - 2(-1)^{k} + 1 )\\
&= \frac{3}{4jk\pi} ( 2 - 2(-1)^{k} )\\
&= \frac{6}{4jk\pi} - \frac{6}{4jk\pi} \cdot (-1)^{k}\\
&= \frac{3}{2jk\pi} - \frac{3}{2jk\pi} \cdot (-1)^{k}\\
\end{align*}
$$

From here it can be seen that the coefficient will be 0 for every even value of $k$ and $2 \cdot \frac{3}{2jk\pi}$ for every odd value of $k$. This solution does however not work for $a_{0}$, since the fractions denominator would be 0. The special case is then accounted for as follows
$$
\begin{align*}
a_{0} &= \frac{1}{2} \left( \int^{1}_{0} 1.5 \cdot e^{- j 0 \pi t} \, dt + \int^{2}_{1} (-1.5) \cdot e^{- j 0 \pi t} \, dt  \right)\\
&= \frac{1}{2} \left( \int^{1}_{0} 1.5 \, dt + \int^{2}_{1} -1.5 \, dt  \right)\\
&= \frac{3}{4} ([t]^{1}_{0} - [t]^{2}_{1})\\
&= \frac{3}{4} (1 - 0 - 2 + 1)\\
&= 0
\end{align*}
$$

This result goes hand-in-hand in the previous conclusion. All the coefficients $a_{k}$ for the continuous-time periodic signal will then be
$$
a_{k} =
\begin{cases}
0, & k = 2c, \; c \in \mathbb{Z} \\
\frac{6}{2jk\pi}. & k = 2c+1, \; c \in \mathbb{Z}
\end{cases}
$$