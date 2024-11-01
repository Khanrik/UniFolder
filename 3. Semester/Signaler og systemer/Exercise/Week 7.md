## Problem 4.1
$$
\begin{equation}
\tag{4.9}
X(j\omega) = \int^{+\infty}_{-\infty} x(t) e^{-j\omega t} \, dt 
\end{equation}
$$
Use the Fourier transform analysis equation (4.9) to calculate the Fourier transforms of:
**(a)** $e^{-2(t-1)} u(t-1) \qquad$ **(b)** $e^{-2|t-1|}$
Sketch and label the magnitude of each Fourier transform.

### (a)
$$
\begin{align*}
X(j\omega) &= \int^{\infty}_{-\infty} e^{-2(t-1)}u(t-1) e^{-j\omega t} \, dt \\
&= \int^{\infty}_{1} e^{-2t + 2} e^{-j\omega t} \, dt\\
&= e^{2} \cdot \int^{\infty}_{1} e^{-2t - j\omega t} \, dt\\
&= e^{2} \cdot \int^{\infty}_{1} e^{(-2 - j\omega) t} \, dt\\
&= e^{2} \cdot \left[  \frac{1}{-2-j\omega} e^{(-2 - j\omega) t} \right]^{\infty}_{1}\\
&= \frac{e^{2}}{-2 - j\omega} \cdot (0 - e^{-2 - j\omega})\\
&= - \frac{e^{2} \cdot e^{-2 - j\omega}}{-2 - j\omega}\\
&= - \frac{e^{- j\omega}}{-2 - j\omega}\\
&= \frac{e^{- j\omega}}{2 + j\omega}
\end{align*}
$$

The magnitude of the Fourier Transform is calculated as
$$
|X(j\omega)| = \left| \frac{e^{-j\omega}}{2 + j\omega} \right| = \frac{|e^{-j\omega}|}{|2 + j\omega|} = \frac{1}{\sqrt{ 4 + \omega^{2} }}
$$

It approaches 0 as $\omega$ approaches $\infty$ or $-\infty$, and it starts at $\frac{1}{2}$ at $\omega=0$.
![[SS Problem 4.1.a.excalidraw]]

### (b)
$$
\begin{align*}
X(j\omega) &= \int^{\infty}_{-\infty} e^{-2|t-1|} e^{-j\omega t} \, dt\\
&= \int^{1}_{-\infty} e^{-2(1-t)} e^{-j\omega t} \, dt + \int^{\infty}_{1} e^{-2(t-1)} e^{-j\omega t} \, dt\\
&= \int^{1}_{-\infty} e^{-2+2t} e^{-j\omega t} \, dt + \frac{e^{- j\omega}}{2 + j\omega}\\
&= \int^{1}_{-\infty} e^{-2 + 2t - j\omega t} \, dt + \frac{e^{- j\omega}}{2 + j\omega}\\
&= e^{-2} \cdot \int^{1}_{-\infty} e^{(2 - j\omega) t} \, dt + \frac{e^{- j\omega}}{2 + j\omega}\\
&= e^{-2} \cdot \left[ \frac{1}{2 - j\omega} \cdot e^{(2 - j\omega) t} \right]^{1}_{-\infty} + \frac{e^{- j\omega}}{2 + j\omega}\\
&= \frac{e^{-2}}{2 - j\omega} \cdot (e^{2 - j\omega} - 0) + \frac{e^{- j\omega}}{2 + j\omega}\\
&= \frac{e^{-2 + 2 - j\omega}}{2 - j\omega} + \frac{e^{- j\omega}}{2 + j\omega}\\
&= \frac{e^{- j\omega}}{2 - j\omega} + \frac{e^{- j\omega}}{2 + j\omega}\\
&= \frac{2e^{- j\omega} + j\omega e^{- j\omega} + 2e^{- j\omega} - j\omega e^{- j\omega}}{4 - j^{2}\omega^{2}}\\
&= \frac{2e^{- j\omega} + 2e^{- j\omega}}{4 + \omega^{2}}\\
&= \frac{4e^{- j\omega}}{4 + \omega^{2}}
\end{align*}
$$
The magnitude of the Fourier Transform is calculated as
$$
|X(j\omega)| = \left| \frac{4e^{- j\omega}}{4 + \omega^{2}} \right| = \frac{|4e^{-j\omega}|}{|4 + \omega^{2}|} = \frac{4}{\sqrt{ (4 + \omega^{2})^{2} + 0^{2} }} = \frac{4}{4 + \omega^{2}}
$$

It approaches 0 as $\omega$ approaches $\infty$ or $-\infty$, and it starts at $1$ at $\omega=0$.
![[SS Problem 4.1.b.excalidraw]]

## Problem 4.2
$$
\begin{equation}
\tag{4.9}
X(j\omega) = \int^{+\infty}_{-\infty} x(t) e^{-j\omega t} \, dt 
\end{equation}
$$
Use the Fourier transform analysis equation (4.9) to calculate the Fourier transforms of:
**(a)** $\delta(t+1) + \delta(t-1) \qquad$ **(b)** $\frac{d}{dt} \{u(-2-t) + u(t-2)\}$
Sketch and label the magnitude of each Fourier transform.

## Problem 4.3
Determine the Fourier transform of each of the following periodic signals:
**(a)** $\sin\left( 2\pi t + \frac{\pi}{4} \right) \qquad$ **(b)** $1 + \cos\left( 6\pi t + \frac{\pi}{8} \right)$

## Problem 4.4
$$
\begin{equation}
\tag{4.8}
X(t) = \frac{1}{2\pi} \int^{+\infty}_{-\infty} X(j\omega) e^{j\omega t} \, d\omega 
\end{equation}
$$
Use the Fourier transform synthesis equation (4.8) to determine the inverse Fourier transforms of:
**(a)** $X_{1}(j\omega) = 2\pi \delta(\omega) + \pi \delta(\omega - 4\pi) + \pi \delta(\omega + 4\pi)$ 
**(b)** $X_{2}(j\omega) = \begin{cases}2, & 0 \leq \omega \leq 2 \\-2, & -2 \leq \omega < 0 \\0, & |\omega| > 2\end{cases}$
