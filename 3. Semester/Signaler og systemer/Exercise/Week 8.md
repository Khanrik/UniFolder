![[Pasted image 20241023144221.png]]

## Problem 4.6
Given that $x(t)$ has the Fourier transform $X(j\omega)$, express the Fourier transforms of the signals listed below in terms of $X(j\omega)$. You may find useful the Fourier transform properties listed in Table 4.1.
**(a)** $x_{1}(t) = x(1 - t) + x(- 1 - t)$
**(b)** $x_{2} (t) = x(3t - 6)$

### (a)
$$
x(-t) \to X(-j\omega)
$$
$$
x(1 - t) = x(-t - (-1)) \to e^{-j\omega (-1)} X(-j\omega) = e^{j\omega} X(-j\omega)
$$

$$
\begin{align*}
X_{1}(j\omega) &= e^{j\omega} X(-j\omega) + e^{-j\omega} X(-j\omega)\\
&= X(-j\omega) (e^{j\omega} + e^{-j\omega})\\
&= X(-j\omega) (2\cos(\omega))\\
&= 2X(-j\omega) \cos(\omega)
\end{align*}
$$

### (b)
$$
\begin{align*}
X_{2}(j\omega) &= \frac{1}{3} e^{-6 \frac{j\omega}{3}} X\left( \frac{j\omega}{3} \right)\\
&= \frac{1}{3} e^{-2j\omega} X\left( \frac{j\omega}{3} \right)
\end{align*}
$$

## Problem 4.7
For each of the following Fourier transforms, use Fourier transform properties (Table 4.1) to determine whether the corresponding time-domain signal is (i) real, imaginary, or neither and (ii) even, odd, or neither. Do this without evaluating the inverse of any of the given transforms. 
**(a)** $X_{1}(j\omega) = u(\omega) - u(\omega - 2)$

### (a)
Because it is shifted the duality property 