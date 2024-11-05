## Problem 5.1
Use the Fourier transform analysis equation (5.9) to calculate the Fourier transforms of:
**(a)** $\left( \frac{1}{2} \right)^{n - 1} u[n - 1] \qquad$ **(b)** $\left( \frac{1}{2}^{|n - 1|} \right)$
Sketch and label one period of the magnitude of each Fourier transform.

### (a)
$$
\begin{align*}
X(e^{j\omega}) &= \sum^{+\infty}_{n = -\infty} \left( \frac{1}{2} \right)^{n - 1} u[n - 1] e^{-j\omega n}\\
&= \sum^{+\infty}_{n = 1} \left( \frac{1}{2} \right)^{n - 1} e^{-j\omega n}\\
&= \sum^{+\infty}_{n = 0} \left( \frac{1}{2} \right)^{n} e^{-j\omega (n+1)}\\
&= \sum^{+\infty}_{n = 0} \frac{1^{n}}{2^{n}} e^{-j\omega n} e^{-j\omega}\\
&= e^{-j\omega} \sum^{+\infty}_{n = 0} \left( \frac{e^{-j\omega}}{2} \right)^{n}\\
&= e^{-j\omega} \sum^{+\infty}_{n = 0} \left( \frac{e^{-j\omega}}{2} \right)^{n}\\
&= e^{-j\omega} \frac{1}{1 - \frac{e^{-j\omega}}{2}}\\
&= \frac{e^{-j\omega}}{1 - \frac{1}{2} e^{-j\omega}}
\end{align*}
$$

The magnitude of the Fourier Transform is calculated as


### (b)
$$
\begin{align*}
X(e^{j\omega}) &= \sum^{+\infty}_{n = -\infty} \left( \frac{1}{2} \right)^{n - 1} u[n - 1] e^{-j\omega n}\\
\end{align*}
$$

## Problem 5.2

## Problem 5.4