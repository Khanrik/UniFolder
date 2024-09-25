## Problem 2.1
$$
x[n] = \delta[n] + 2\delta[n-1] - \delta[n - 3] \qquad \text{and} \qquad h[n] = 2 \delta[n + 1] + 2 \delta[n - 1]
$$
Compute and plot each of the following convolution

![[SS Problem 2.1]]

## Problem 2.2
![[SS Problem 2.2.excalidraw]]

$h[n]$ only goes to 9 (included) since $u[n-10]$ is subtracted.

To mimic this the limits have to be $A = n - 9$ and $B = n + 3$.

This works since $n$ cancels out with itself, and the interval of the exponent then becomes $-3-1$ to $9-1$, like in the original signal.

## Problem 2.3
Since $1 + \frac{1}{2} + \frac{1}{4} + \dots = 2$, the output would be
$$
y[n] =
\begin{cases}
0, & n < 0 \\
\sum^{n}_{k=0} \frac{1}{2}^{k}, & n \geq 0
\end{cases}
$$
![[SS Problem 2.3.excalidraw]]

##  Problem 2.4
![[SS Problem 2.4.excalidraw]]

From above drawing we see that
$$
y[n] =
\begin{cases}
n-6, & 7 \leq n \leq 11 \\
6, & 11 < n < 19 \\
24 - n, & 19 \leq n \leq 23 \\
0, & \text{elsewhere}
\end{cases}
$$

## Problem 2.6
![[SS Problem 2.6.excalidraw]]

$$
y[n] =
\begin{cases}
\frac{1}{2}, & n \geq 0 \\
\frac{3^{n}}{2}, & n < 0
\end{cases}
$$