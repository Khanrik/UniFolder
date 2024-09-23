## Exercise 1.1
$$
\begin{align*}
\frac{1}{2} e^{j\pi} &= \frac{1}{2} \cos(\pi) + j \frac{1}{2} \sin(\pi)\\
&= \frac{1}{2} \cdot -1 + j \frac{1}{2} \cdot 0\\
&= -\frac{1}{2}
\end{align*}
$$

$$
\begin{align*}
\frac{1}{2} e^{-j\pi} &= \frac{1}{2} \cos(-\pi) + j \frac{1}{2} \sin(-\pi)\\
&= \frac{1}{2} \cdot -1 - j \frac{1}{2} \cdot 0\\
&= -\frac{1}{2}
\end{align*}
$$

$$
\begin{align*}
e^{j \frac{\pi}{2}} &= \cos\left( \frac{\pi}{2} \right) + j \sin\left( \frac{\pi}{2} \right)\\
&= 0 + j \cdot 1\\
&= j
\end{align*}
$$

$$
\begin{align*}
e^{-j \frac{\pi}{2}} &= \cos\left( - \frac{\pi}{2} \right) + j \sin\left( - \frac{\pi}{2} \right)\\
&= 0 - j \cdot 1\\
&= -j
\end{align*}
$$

$$
\begin{align*}
e^{j 5 \frac{\pi}{2}} &= \cos\left( 5 \frac{\pi}{2} \right) + j \sin\left( 5 \frac{\pi}{2} \right)\\
&= 0 + j \cdot 1\\
&= j
\end{align*}
$$

$$
\begin{align*}
\sqrt{ 2 } e^{j \frac{\pi}{4}} &= \sqrt{ 2 } \cos\left( \frac{\pi}{4} \right) + \sqrt{ 2 } j \sin\left( \frac{\pi}{4} \right)\\
&= \sqrt{ 2 } \cdot \frac{\sqrt{ 2 }}{2} + \sqrt{ 2 } j \cdot \frac{\sqrt{ 2 }}{2}\\
&= 1 + j
\end{align*}
$$

$$
\begin{align*}
\sqrt{ 2 } e^{j 9 \frac{\pi}{4}} &= \sqrt{ 2 } \cos\left( 9 \frac{\pi}{4} \right) + \sqrt{ 2 } j \sin\left( 9 \frac{\pi}{4} \right)\\
&= \sqrt{ 2 } \cdot \frac{\sqrt{ 2 }}{2} + \sqrt{ 2 } j \cdot \frac{\sqrt{ 2 }}{2}\\
&= 1 + j
\end{align*}
$$

$$
\begin{align*}
\sqrt{ 2 } e^{-j 9 \frac{\pi}{4}} &= \sqrt{ 2 } \cos\left( - 9 \frac{\pi}{4} \right) + \sqrt{ 2 } j \sin\left( - 9 \frac{\pi}{4} \right)\\
&= \sqrt{ 2 } \cdot \frac{\sqrt{ 2 }}{2} - \sqrt{ 2 } j \cdot \frac{\sqrt{ 2 }}{2}\\
&= 1 - j
\end{align*}
$$

$$
\begin{align*}
\sqrt{ 2 } e^{-j \frac{\pi}{4}} &= \sqrt{ 2 } \cos\left( - \frac{\pi}{4} \right) + \sqrt{ 2 } j \sin\left( - \frac{\pi}{4} \right)\\
&= \sqrt{ 2 } \cdot \frac{\sqrt{ 2 }}{2} - \sqrt{ 2 } j \cdot \frac{\sqrt{ 2 }}{2}\\
&= 1 - j
\end{align*}
$$

## Exercise 1.2
$$
z = 5 + 0j
$$
$$
r = \sqrt{ 5^{2} + 0^{2} } = 5
$$
$$
\theta = \arccos\left( \frac{5}{5} \right) = 0
$$
$$
z = 5 \cdot e^{j \cdot 0} = 5
$$

$$
z = -2 + 0j
$$
$$
r = \sqrt{ (-2)^{2} + 0^{2} } = 2
$$
$$
\theta = \arccos\left( \frac{-2}{2} \right) = \pi
$$
$$
z = 2 \cdot e^{j \cdot \pi}
$$

$$
z = 0 - 3j
$$
$$
r = \sqrt{ 0^{2} + (-3)^{2} } = 3
$$
$$
\theta = \sin\left( \frac{-3}{3} \right) = -\frac{\pi}{2}
$$
$$
z = 3 \cdot e^{-j \cdot \frac{\pi}{2}}
$$

$$
z = \frac{1}{2} - \frac{\sqrt{ 3 }}{2}j
$$
$$
r = \sqrt{ \left( \frac{1}{2} \right)^{2} + \left( -\frac{\sqrt{ 3 }}{2} \right)^{2} } = \sqrt{ \frac{1}{4} + \frac{3}{4} } = 1
$$
$$
\theta = \arcsin\left( \frac{-\frac{\sqrt{ 3 }}{2}}{1} \right) = -\frac{\pi}{3}
$$
$$
z = 1 \cdot e^{-j \cdot \frac{\pi}{3}} = e^{-j \cdot \frac{\pi}{3}}
$$

etc...

## Exercise 1.3
### (b)
$x_{2}(t) = e^{j(2t + \frac{\pi}{4})}$

Energy:
$$
\begin{align*}
E &= \int^{\infty}_{-\infty} |x_{2}(t)|^{2} \, dt \\
&= \int^{\infty}_{-\infty} |e^{j\left( 2t + \frac{\pi}{4} \right)}|^{2} \, dt \\
&= \int^{\infty}_{-\infty} 1 \, dt \\
&= [t]_{t_{1}}^{t_{2}}\\
&= t_{2}-t_{1}
\end{align*}
$$

Power:
$$
\begin{align*}
P &= \frac{1}{t_{2} - t_{1}} \int^{t_{2}}_{t_{1}} |x(t)|^{2} \, dt \\
&= \frac{1}{t_{2} - t_{1}} \cdot t_{2}-t_{1}\\
&= 1
\end{align*}
$$

### (c)
$x_{3}(t) = \cos(t)$

Energy:
$$
\begin{align*}
E &= \int^{t_{2}}_{t_{1}} |x(t)|^{2} \, dt \\
&= \int^{t_{2}}_{t_{1}} |e^{j\left( 2t + \frac{\pi}{4} \right)}|^{2} \, dt \\
&= \int^{t_{2}}_{t_{1}} 1 \, dt \\
&= [t]_{t_{1}}^{t_{2}}\\
&= t_{2}-t_{1}
\end{align*}
$$

Power:
$$
\begin{align*}
P &= \frac{1}{t_{2} - t_{1}} \int^{t_{2}}_{t_{1}} |x(t)|^{2} \, dt \\
&= \frac{1}{t_{2} - t_{1}} \cdot t_{2}-t_{1}\\
&= 1
\end{align*}
$$



### (e)
$x_{2}[n] = e^{j(\frac{\pi}{2n} + \frac{\pi}{8})}$
