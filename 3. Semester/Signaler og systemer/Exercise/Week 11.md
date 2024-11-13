![[Pasted image 20241113125927.png]]

## Problem 5.6
Given that $x[n]$ has Fourier transform $X(e^{ j\omega })$, express the Fourier transforms of the following signals in terms of $X(e^{ j\omega })$. You may use the Fourier transform properties listed in Table 5.1.
**(a)** $x_{1}[n] = x[1 - n] + x[-1 - n]$
**(b)** $x_{2}[n] = \frac{x^{*}[-n] + x[n]}{2}$
**(c)** $x_{3}[n] = (n - 1)^{2} x[n]$

### (a)
$$
\begin{align*}
X_{1}(e^{ j\omega }) &= \sum_{n = -\infty}^{\infty} (x[1 - n] + x[-1 - n]) e^{ j\omega n }\\
&= \sum_{n = -\infty}^{\infty} x[1 - n] e^{ j\omega n } + \sum_{n = -\infty}^{\infty} x[-1-n] e^{ j\omega n }\\
&= e^{ -j\omega } \cdot X(e^{ -j\omega }) + e^{ j\omega } \cdot X(e^{ -j\omega })\\
&= 2\cos(\omega) X(e^{ -j\omega })
\end{align*}
$$

### (b)
$$
\begin{align*}
X_{2}(e^{ j\omega }) &= \sum_{n = -\infty}^{\infty} \frac{x^{*}[-n] + x[n]}{2} e^{ j\omega }\\
&= \frac{1}{2} \left( \sum_{n = -\infty}^{\infty} x^{*}[-n] e^{ j\omega } + \sum_{n = -\infty}^{\infty} x[n] e^{ j\omega } \right)\\
&= \frac{X^{*}(e^{ j\omega }) + X(e^{ j\omega })}{2}\\
&= \mathcal{Re}(X(e^{ j\omega }))
\end{align*}
$$

### (c)
$$
\begin{align*}
X_{3}(e^{ j\omega }) &=  \sum_{n = -\infty}^{\infty} (n - 1)^{2} x[n] e^{ j\omega n }\\
&= \sum_{n = -\infty}^{\infty} n^{2} x[n] e^{ j\omega n } + \sum_{n = -\infty}^{\infty} x[n] e^{ j\omega n } - \sum_{n = -\infty}^{\infty} 2n x[n] e^{ j\omega n }\\
&= \left( j \frac{dX(e^{ j\omega })}{d\omega} \right)^{2} + X(e^{ j\omega }) - 2j \frac{dX(e^{ j\omega })}{d\omega}\\
&= - \frac{d^{2} X(e^{ j\omega })}{d\omega^{2}} + X(e^{ j\omega }) - 2j \frac{dX(e^{ j\omega })}{d\omega}
\end{align*}
$$