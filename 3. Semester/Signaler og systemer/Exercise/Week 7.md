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

### (a)
$$
\begin{align*}
X(j\omega) &= \int^{+\infty}_{-\infty} (\delta(t+1) + \delta(t-1)) e^{-j\omega t} \, dt\\
&= \int^{+\infty}_{-\infty} \delta(t+1) e^{-j\omega t} + \delta(t-1) e^{-j\omega t} \, dt\\
&= \int^{+\infty}_{-\infty} \delta(t+1) e^{-j\omega t} \, dt + \int^{+\infty}_{-\infty} \delta(t-1) e^{-j\omega t} \, dt\\
&= e^{j\omega} + e^{-j\omega}\\
&= \cos(\omega) + j\sin(\omega) + \cos(\omega) - j\sin(\omega)\\
&= 2 \cos(\omega)
\end{align*}
$$

The magnitude of the Fourier Transform is calculated as
$$
|X(j\omega)| = \left| 2\cos(\omega) \right| = \sqrt{ (2\cos(\omega))^{2} } = |2\cos(\omega)|
$$
![[SS Problem 4.2.a.excalidraw]]

### (b)
$$
\begin{align*}
X(j\omega) &= \int^{+\infty}_{-\infty} \left( \frac{d}{dt} \{u(-2-t) + u(t-2)\} \right) e^{-j\omega t} \, dt\\
&= j\omega \int^{+\infty}_{-\infty} (u(-2-t) + u(t-2)) e^{-j\omega t} \, dt\\
&= j\omega \left( \int^{-2}_{-\infty} e^{-j\omega t} \, dt + \int^{\infty}_{2} e^{-j\omega t} \, dx  \right)\\
&= j\omega \left( \left[  \frac{1}{-j\omega} e^{-j\omega t} \right]^{-2}_{-\infty} + \left[ \frac{1}{-j\omega} e^{-j\omega t} \right]^{\infty}_{2} \right)\\
&= \frac{j\omega}{-j\omega} \left( \left[ e^{-j\omega t} \right]^{-2}_{-\infty} + \left[ e^{-j\omega t} \right]^{\infty}_{2} \right)\\
&= -1 (e^{2j\omega} - (e^{-j\omega})^{-\infty} + e^{-\infty j\omega} - e^{-2j\omega})\\
&= -1 (e^{2j\omega} - 0 + 0 - e^{-2j\omega})\\
&= - (\cos(2\omega) + j \sin(2\omega) - \cos(2\omega) + j\sin(2\omega))\\
&= - 2j\sin(2\omega)
\end{align*}
$$

The magnitude of the Fourier Transform is calculated as
$$
|X(j\omega)| = \left| -2j\sin(2\omega) \right| = \sqrt{ (-2\sin(2\omega))^{2} } = |2\sin(2\omega)|
$$

![[SS Problem 4.2.b.excalidraw]]

## Problem 4.3
Determine the Fourier transform of each of the following periodic signals:
**(a)** $\sin\left( 2\pi t + \frac{\pi}{4} \right) \qquad$ **(b)** $1 + \cos\left( 6\pi t + \frac{\pi}{8} \right)$

### (a)
$$
\begin{align*}
X(j\omega) &= \int^{\infty}_{-\infty} \sin\left( 2\pi t + \frac{\pi}{4} \right) e^{-j\omega t} \, dt\\
&= \int^{\infty}_{-\infty} \frac{1}{2j} \left( e^{j\left(2\pi t + \frac{\pi}{4}\right)} - e^{-j\left( 2\pi t + \frac{\pi}{4} \right)} \right) e^{-j\omega t} \, dt\\
&= \frac{1}{2j} \int^{\infty}_{-\infty} e^{j\left(2\pi t + \frac{\pi}{4}\right)} e^{-j\omega t} - e^{-j\left( 2\pi t + \frac{\pi}{4} \right)} e^{-j\omega t} \, dt\\
&= \frac{1}{2j} \int^{\infty}_{-\infty} e^{j2\pi t + j\frac{\pi}{4}} e^{-j\omega t} - e^{-j 2\pi t - j\frac{\pi}{4}} e^{-j\omega t} \, dt\\
&= \frac{1}{2j} \left( \int^{\infty}_{-\infty} e^{j2\pi t + j\frac{\pi}{4}} e^{-j\omega t} \, dt - \int^{\infty}_{-\infty} e^{-j 2\pi t - j\frac{\pi}{4}} e^{-j\omega t} \, dt \right)\\
&= \frac{1}{2j} \left(e^{j\frac{\pi}{4}} \int^{\infty}_{-\infty} e^{j2\pi t} e^{-j\omega t} \, dt - e^{- j\frac{\pi}{4}} \int^{\infty}_{-\infty} e^{-j 2\pi t} e^{-j\omega t} \, dt \right)\\
&= \frac{1}{2j} \left(e^{j\frac{\pi}{4}} 2\pi \delta(\omega - 2\pi) - e^{- j\frac{\pi}{4}} 2\pi \delta(\omega + 2\pi) \right)\\
&= \frac{\pi}{j} \left(e^{j\frac{\pi}{4}} \delta(\omega - 2\pi) - e^{- j\frac{\pi}{4}} \delta(\omega + 2\pi) \right)
\end{align*}
$$

### (b)
$$
\begin{align*}
X(j\omega) &= \int_{-\infty}^{\infty} \left( 1 + \cos\left( 6\pi t + \frac{\pi}{8} \right) \right) e^{-j\omega t} \, dt \\
&= \int_{-\infty}^{\infty} e^{-j\omega t} + \frac{1}{2} \left(e^{ j \left(6\pi t + \frac{\pi}{8}\right) } + e^{ -j\left(6\pi t + \frac{\pi}{8}\right) }\right) e^{ -j\omega t } \, dt\\
&= \int_{-\infty}^{\infty} e^{ -j\omega t } \, dt + \frac{1}{2} \left( \int_{-\infty}^{\infty} e^{ j 6\pi t + j\frac{\pi}{8} } e^{ -j\omega t } \, dt + \int_{-\infty}^{\infty} e^{ -j 6\pi t - j\frac{\pi}{8} } e^{ -j\omega t } \, dt  \right)\\
&= 2\pi \delta(\omega) + \frac{1}{2} (e^{ j \frac{\pi}{8} } 2\pi \delta(\omega - 6\pi) + e^{ -j \frac{\pi}{8} } 2\pi \delta(\omega + 6\pi))\\
&= 2\pi \delta(\omega) + e^{ j \frac{\pi}{8} } \pi \delta(\omega - 6\pi) + e^{ -j \frac{\pi}{8} } \pi \delta(\omega + 6\pi)
\end{align*}
$$

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

### (a)
$$
\begin{align*}
X(t) &= \frac{1}{2\pi} \int_{-\infty}^{\infty} (2\pi \delta(\omega) + \pi \delta(\omega - 4\pi) + \pi \delta(\omega + 4\pi)) e^{ j\omega t } \, d\omega\\
&= \frac{1}{2\pi} \left( \int_{-\infty}^{\infty} 2\pi \delta(\omega) e^{ j\omega t } \, d\omega + \int_{-\infty}^{\infty} \pi \delta(\omega - 4\pi) e^{ j\omega t } \, d\omega + \int_{-\infty}^{\infty} \pi \delta(\omega + 4\pi) e^{ j\omega t } \, d\omega \right)\\
&= \int_{-\infty}^{\infty} \delta(\omega) e^{ j\omega t } \, d\omega + \frac{1}{2} \left( \int_{-\infty}^{\infty} \delta(\omega - 4\pi) e^{ j\omega t } \, d\omega + \int_{-\infty}^{\infty} \delta(\omega + 4\pi) e^{ j\omega t } \, d\omega \right)\\
&= 1 + \frac{(e^{ j 4\pi t } + e^{ -j 4\pi t })}{2}\\
&= 1 + \cos(4\pi t)
\end{align*}
$$

### (b)
$$
\begin{align*}
X(t) &= \frac{1}{2\pi} \int^{\infty}_{-\infty} X_{2}(j\omega) e^{ j\omega t } \, d\omega\\
&= \frac{1}{2\pi} \left(  \int_{-\infty}^{-2} 0 e^{ j\omega t } \, d\omega + \int_{-2}^{0} -2 e^{j\omega t} \, d\omega + \int_{-2}^{2} 2 e^{ j\omega t } \, d\omega + \int_{2}^{\infty} 0 e^{ j\omega t } \, d\omega  \right)\\
&= \frac{1}{2\pi} \left(  - \frac{1}{jt} 2 [e^{ j\omega t }]_{-2}^{0} + \frac{1}{jt} 2 [e^{ j\omega t }]_{0}^{2} \right)\\
&= \frac{1}{\pi jt} (-e^{ 0jt } + e^{ -2jt } + e^{ 2jt } - e^{ 0jt })\\
&= \frac{1}{\pi jt} (-1 + 2\cos(2t) - 1)\\
&= \frac{2\cos(2t) - 2}{\pi jt}\\
&= -2 \frac{1 - \cos(2t)}{\pi jt}\\
&= -2 \frac{2 \sin^{2}(t)}{\pi jt}\\
&= \frac{-4\sin^{2}(t)}{\pi jt}\\
&= \frac{4j\sin^{2}(t)}{\pi t}
\end{align*}
$$