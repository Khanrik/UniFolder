## Problem 2.18
Consider a causal LTI system whose input $x[n]$ and output $y[n]$ are related by the difference equation
$$
y[n] = \frac{1}{4} y[n - 1] + x[n]
$$
Determine $y[n]$ if $x[n] = \delta[n - 1]$

Since $y[n]$ doesn't depend on any future values it is causal. Since it is both causal and LTI, then $y[n] = 0, n < 0$. The different terms of $y[n]$ can now be written as follows
$$
\begin{align*}
y[n] &= \frac{1}{4} y[n-1] + x[n] = \frac{1}{4} y[n-1] + \delta[n-1]\\
y[0] &= \frac{1}{4} \cdot 0 + \delta[0-1] = 0 + 0\\
y[1] &= \frac{1}{4} \cdot 0 + \delta[1-1] = 0 + 1\\
y[2] &= \frac{1}{4} \cdot 1 + \delta[2-1] = \frac{1}{4} + 0\\
y[3] &= \frac{1}{4} \cdot \frac{1}{4} + \delta[3-1] = \frac{1}{16} + 0\\
y[4] &= \frac{1}{4} \cdot \frac{1}{16} + \delta[4-1] = \frac{1}{64} + 0
\end{align*}
$$
It can now be seen that the system can be expressed as
$$
y[n] =
\begin{cases}
0, & n \leq 0 \\
\frac{1}{4}^{n-1}, & n > 0
\end{cases}
$$
