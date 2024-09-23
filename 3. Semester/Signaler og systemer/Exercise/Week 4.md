## Section 1.3
Determine the values of $P_{x}$ and $E_{x}$ for each of the following signals
### (a) $x_{1}(t) = e^{-2 t} u(t)$
$$
e^{-2 t} \cdot u(t) = 
\begin{cases}
0, \qquad t < 0 \\
e^{-2t}, \; \; \, t \geq 0
\end{cases}
$$
$$
\begin{align*}
E_{1} &= \int^{\infty}_{-\infty} |x_{1}(t)|^{2} \, dt\\
&= \int^{\infty}_{0} x_{1}(t)^{2} \, dt \qquad \text{(always positive cus u(t))}\\
&= \int^{\infty}_{0} (e^{-2t})^{2} \, dt\\
&= \int^{\infty}_{0} e^{-4t} \, dt\\
&= \left[ -\frac{1}{4}e^{-4t} \right]_{0}^{\infty}\\
&= -\frac{1}{4} \cdot (\lim_{ t \to \infty } e^{-4t} - e^{-4\cdot_{0}})\\
&= -\frac{1}{4} \cdot (0 - 1)\\
&= \frac{1}{4}
\end{align*}
$$

$$
\begin{align*}
P_{1} &= \lim_{ T \to \infty }  \frac{1}{2T} \int^{T}_{0} |x_{1}(t)|^{2} \, dt\\
&= \lim_{ T \to \infty }  \frac{1}{2T} -\frac{1}{4} \cdot (\lim_{ t \to T } e^{-4t} - e^{-4\cdot_{0}})\\
&= \lim_{ T \to \infty }  \frac{1}{2T} -\frac{1}{4} \cdot (e^{-4T} - e^{-4\cdot_{0}})\\
&= \lim_{ T \to \infty }  \frac{1}{2T} -\frac{1}{4} \cdot (e^{-4T} - e^{-4\cdot_{0}})\\
\end{align*}
$$

### (b) $x_{1}[n] = \left( \frac{1}{2} \right)^{n} u[n]$
$$
\begin{align*}
E_{1} &= \sum^{\infty}_{-\infty} |x_{1}[n]|^{2}\\
&= \sum^{\infty}_{0} x_{1}[n]^{2} \qquad \text{(always positive cus u[n])}\\
&= \sum^{\infty}_{0} \left( \left( \frac{1}{2} \right)^{n} \right)^{2}\\
&= \sum^{\infty}_{0} \left( \frac{1}{2} \right)^{2n}\\
&= 1 + \frac{1}{2} + \frac{1}{4} + \dots + \frac{1}{2^{2n}} \qquad \text{(geometric series)}\\
&= \frac{1}{1 - \frac{1}{4}}\\
&= \frac{1}{\frac{3}{4}}\\
&= \frac{4}{3}
\end{align*}
$$

$$
\begin{align*}
P_{1}[n] &= \lim_{ N \to \infty } \frac{1}{2N + 1} \cdot \sum^{N}_{-N} |x[n]|^{2}\\
&= \lim_{ N \to \infty } \frac{1}{2N + 1} \cdot \sum^{N}_{-N} x_{1}[n]^{2} \qquad \text{(always positive cus u[n])}\\
&= \lim_{ N \to \infty } \frac{1}{2N + 1} \cdot \left( 1 + \frac{1}{4} + \frac{1}{} \right)\\
&= 
\end{align*}
$$

## Section 1.6
Determine whether or not each of the following signals is periodic
### (a) $x_{1}(t) = e^{j (t + \frac{\pi}{4})} u(t)$
Not periodic, since it is multiplied by $u(t)$, meaning that it is 0 in negative t.

### (b) $x_{2}[n] = u[n] + u[-n]$
It is constant.

### (c) $x_{3}[n] = \sum^{\infty}_{k=-\infty} \delta[n-4k] - \delta[n-1-4k]$
Periodic with a period of N=4.

## Section 1.7
For each signal given below, determine all the values of the independent variable at which the even part of the signal is guaranteed to be zero:
### (a) $x_{1}[n] = u[n] - u[n - 4]$
$$
\begin{align*}
x_{e}[n] &= \frac{(u[n] - u[n - 4]) + (u[-n] - u[-n-4])}{2}\\
&= \frac{(u[n] - u[n - 4]) + (u[-n] - u[-n-4])}{2}
\end{align*}
$$
