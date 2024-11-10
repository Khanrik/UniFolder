## Problem 5.1
$$
\begin{equation}
\tag{5.9}
X(e^{ j\omega }) = \sum^{+\infty}_{n = -\infty} x[n] e^{ -j\omega n }
\end{equation}
$$

Use the Fourier transform analysis equation (5.9) to calculate the Fourier transforms of:
**(a)** $\left( \frac{1}{2} \right)^{n - 1} u[n - 1] \qquad$ **(b)** $\left( \frac{1}{2} \right)^{|n - 1|}$
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
$$
\begin{align*}
|X(j\omega)| &= \left| \frac{e^{-j\omega}}{1 - \frac{1}{2} e^{-j\omega}} \right|\\
&= \frac{|e^{-j\omega}|}{|1 - \frac{1}{2} e^{-j\omega}|}\\
&= \frac{1}{|1 - \frac{1}{2} e^{-j\omega}|}
\end{align*}
$$
This function is too hard to sketch by hand so it is done in python
```python
fig, ax = plt.subplots()
omega = np.linspace(-4*np.pi, 4*np.pi, 1000)
x = 1/(np.abs(1 - 1/2 * np.exp(- 1j * omega)))
ax.plot(omega, x)
```
![[Pasted image 20241110144334.png]]

### (b)
$$
\begin{align*}
X(e^{j\omega}) &= \sum^{\infty}_{n = -\infty} \left( \frac{1}{2} \right)^{|n - 1|} e^{ -j\omega n }\\
&= \sum_{n = -\infty}^{0} \left( \frac{1}{2} \right)^{1 - n} e^{ -j\omega n } + \sum_{n = 1}^{\infty} \left( \frac{1}{2} \right)^{n - 1} e^{ -j\omega n }\\
&= \sum_{n = -\infty}^{0} \left( \frac{1}{2} \right)^{1 - n} e^{ -j\omega n } + \sum_{n = 0}^{\infty} \left( \frac{1}{2} \right)^{n} e^{ -j\omega (n+1) }\\
&= \sum_{n = -\infty}^{0} \left( \frac{1}{2} \right)^{1 - n} e^{ -j\omega n } + e^{ -j\omega } \sum_{n = 0}^{\infty} \left( \frac{e^{ -j\omega }}{2} \right)^{n}\\
&= \sum_{n = -\infty}^{0} \left( \frac{1}{2} \right)^{1 - n} e^{ -j\omega n } + \frac{e^{-j\omega}}{1 - \frac{1}{2} e^{-j\omega}}\\
&= \sum_{n = 0}^{-\infty} \left( \frac{1}{2} \right)^{1 - n} e^{ -j\omega n } + \frac{e^{-j\omega}}{1 - \frac{1}{2} e^{-j\omega}}\\
&= \sum_{n = 0}^{\infty} \left( \frac{1}{2} \right)^{1 + n} e^{ j\omega n } + \frac{e^{-j\omega}}{1 - \frac{1}{2} e^{-j\omega}}\\
&= \frac{1}{2} \sum_{n = 0}^{\infty} \left( \frac{e^{ j\omega}}{2} \right)^{n} + \frac{e^{-j\omega}}{1 - \frac{1}{2} e^{-j\omega}}\\
&= \frac{1}{2 - e^{ j\omega }} + \frac{e^{-j\omega}}{1 - \frac{1}{2} e^{-j\omega}}\\
&= \frac{1 - \frac{1}{2} e^{-j\omega}}{(2 - e^{ j\omega }) 1 - \frac{1}{2} e^{-j\omega}} + \frac{(2 - e^{ j\omega }) e^{-j\omega}}{(2 - e^{ j\omega }) 1 - \frac{1}{2} e^{-j\omega}}\\
&= \frac{1 - \frac{1}{2} e^{-j\omega} + (2 - e^{ j\omega }) e^{-j\omega}}{2 - e^{ j\omega } - e^{-j\omega} + \frac{1}{2}}\\
&= \frac{1 - \frac{1}{2} e^{-j\omega} + 2e^{-j\omega} - 1}{\frac{5}{2} - \cos(\omega) - j\sin(\omega) - \cos(\omega) + j\sin(\omega)}\\
&= \frac{\frac{3}{2} e^{-j\omega}}{\frac{5}{2} - 2\cos(\omega)}\\
&= \frac{\frac{3}{4} e^{-j\omega}}{\frac{5}{4} - \cos(\omega)}
\end{align*}
$$

The magnitude of the Fourier Transform is calculated as
$$
\begin{align*}
|X(j\omega)| &= \left| \frac{\frac{3}{4} e^{-j\omega}}{\frac{5}{4} - \cos(\omega)} \right|\\
&= \frac{| \frac{3}{4} e^{-j\omega} |}{| \frac{5}{4} - \cos(\omega) |}\\
&= \frac{\frac{3}{4}}{\sqrt{ (\frac{5}{4} - \cos(\omega))^{2} + 0^{2} }}\\
&= \frac{\frac{3}{4}}{\frac{5}{4} - \cos(\omega)}
\end{align*}
$$
This function is too hard to sketch by hand so it is done in python
```python
fig, ax = plt.subplots()
omega = np.linspace(-4*np.pi, 4*np.pi, 1000)
x = (3/4) / (5/4 - np.cos(omega))
ax.plot(omega, x)
```
![[Pasted image 20241110144344.png]]

## Problem 5.2
Use the Fourier transform analysis equation (5.9) to calculate the Fourier transforms of:
**(a)** $\delta[n - 1] + \delta[n + 1] \qquad$ **(b)** $\delta[n + 2] - \delta[n - 2]$
Sketch and label one period of the magnitude of each Fourier transform.

### (a)
$$
\begin{align*}
X(e^{j\omega}) &= \sum^{+\infty}_{n = -\infty} (\delta[n - 1] + \delta[n + 1]) e^{-j\omega n}\\
&= e^{j\omega} + e^{-j\omega}\\
&= \cos(\omega) + j\sin(\omega) + \cos(\omega) - j\sin(\sin(\omega))\\
&= 2\cos(\omega)
\end{align*}
$$

### (b)
$$
\begin{align*}
X(e^{j\omega}) &= \sum^{+\infty}_{n = -\infty} (\delta[n + 2] - \delta[n - 2]) e^{-j\omega n}\\
&= e^{2j\omega} + e^{-2j\omega}\\
&= \cos(2\omega) + j\sin(2\omega) + \cos(2\omega) - j\sin(\sin(2\omega))\\
&= 2\cos(2\omega)
\end{align*}
$$


## Problem 5.4
$$
\begin{equation}
\tag{5.8}
x[n] = \frac{1}{2\pi} \int_{2\pi} X(e^{ j\omega })e^{ j\omega n } \, d\omega 
\end{equation}
$$
Use the Fourier transform synthesis equation (5.8) to determine the inverse Fourier transforms of:
**(a)** $X_{1}(e^{ j\omega }) = \sum_{k = -\infty}^{\infty} \left\{  2\pi \delta(\omega - 2\pi k) + \pi \delta\left( \omega - \frac{\pi}{2} - 2\pi k\right) + \pi \delta\left( \omega + \frac{\pi}{2} - 2\pi k \right) \right\}$
**(b)** $X_{2}(e^{ j\omega }) = \begin{cases} 2j, & 0 < \omega \leq \pi \\ -2j, & -\pi < \omega \leq 0 \end{cases}$

### (a)
$$
\begin{align*}
x_{1}[n] &= \frac{1}{2\pi} \int_{2\pi} \left(\sum_{k = -\infty}^{\infty} \left\{  2\pi \delta(\omega - 2\pi k) + \pi \delta\left( \omega - \frac{\pi}{2} - 2\pi k\right) + \pi \delta\left( \omega + \frac{\pi}{2} - 2\pi k \right) \right\}\right) e^{ j\omega n } \, d\omega\\
&= \frac{1}{2\pi} \int^{\pi}_{-\pi} \left( 2\pi \delta(\omega) + \pi \delta\left( \omega - \frac{\pi}{2} \right) + \pi \delta\left( \omega + \frac{\pi}{2} \right) \right) e^{ j\omega n } \, d\omega\\
&= \frac{1}{2} \int^{\pi}_{-\pi} \left( 2 \delta(\omega) + \delta\left( \omega - \frac{\pi}{2} \right) + \delta\left( \omega + \frac{\pi}{2} \right) \right) e^{ j\omega n } \, d\omega\\
&= \frac{1}{2} \left( \int^{\pi}_{-\pi} 2 \delta(\omega) e^{ j\omega n } \, d\omega + \int^{\pi}_{-\pi} \delta\left( \omega - \frac{\pi}{2} \right) e^{ j\omega n } \, d\omega + \int^{\pi}_{-\pi} \delta\left( \omega + \frac{\pi}{2} \right) e^{ j\omega n } \, d\omega \right)\\
&= \frac{1}{2} \left( 2e^{ j 0 n } + e^{ j \frac{\pi}{2} n } + e^{ -j \frac{\pi}{2} n } \right)\\
&= 1 + \frac{e^{ j \frac{\pi}{2} n } + e^{ -j \frac{\pi}{2} n }}{2}\\
&= 1 + \cos\left( \frac{\pi}{2} n \right)
\end{align*}
$$

### (a)
$$
\begin{align*}
x_{2}[n] &= \frac{1}{2\pi} \int_{2\pi} \left(\begin{cases} 2j, & 0 < \omega \leq \pi \\ -2j, & -\pi < \omega \leq 0 \end{cases}\right) e^{ j\omega n } \, d\omega\\
&= \frac{1}{2\pi} \left( \int^{0}_{-\pi} -2j e^{ j\omega n } \, d\omega + \int^{\pi}_{0} 2j e^{ j\omega n } \, d\omega  \right)\\
&= \frac{j}{\pi} \left( \int^{\pi}_{0} e^{ j\omega n } \, d\omega - \int^{0}_{-\pi} e^{ j\omega n }  \, d\omega  \right)\\
&= \frac{j}{\pi} \left( \left[ \frac{1}{jn} e^{ j\omega n } \right]_{0}^{\pi} - \left[ \frac{1}{jn} e^{ j\omega n } \right]_{-\pi}^{0} \right)\\
&= \frac{1}{\pi n} (e^{ j \pi n } - e^{ j 0 n } - e^{ j 0 n } + e^{ - j \pi n })\\
&= \frac{1}{\pi n} (e^{ j \pi n } + e^{ - j \pi n } - 2)\\
&= \frac{2\cos(\pi n) - 2}{\pi n}
\end{align*}
$$

To get the books answer
$$
\begin{align*}
x_{2}[n] &= \frac{2\cos(\pi n) - 2}{\pi n}\\
&= -2 \frac{1 - \cos(\pi n)}{\pi n}\\
&= -4 \frac{1 - \cos(\pi n)}{2\pi n}\\
&= -4 \frac{1 - \cos\left( 2 \frac{\pi}{2} n \right)}{2\pi n}\\
&= -4 \frac{\sin^{2}\left( \frac{\pi}{2} n \right)}{\pi n}
\end{align*}
$$
