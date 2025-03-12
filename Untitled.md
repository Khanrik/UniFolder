$$
\begin{align*}
|H(e^{ j\omega })| &= 1\\
\frac{|b|}{|1 + 0.81 e^{ -2j\omega }|} &= 1\\
|b| &= |1 + 0.81e^{ -2j\omega }|\\
|b| &= \sqrt{ (1 + 0.81 \cos(2\omega))^{2} + (0.81 \sin(2\omega))^{2} }\\
|b| &= \sqrt{ 1 + 2 \cdot 0.81 \cos(2\omega) + 0.81^{2} \cos(2\omega)^{2} + 0.81^{2} \sin(2\omega)^{2} }\\
|b| &= \sqrt{ 1 + 1.62 \cos(2\omega) + 0.81^{2} }
\end{align*}
$$
Since the right hand side corresponds to the denominator of the frequency response the magnitude will be at its maximum when the right hand side is minimized. It is minimized when $\cos(2\omega) = -1$ or $\omega=\frac{\pi}{2}$. Plotting this into the equation gives a b-value of
$$
b = \sqrt{ 1 + 1.62 \cos\left( 2 \frac{\pi}{2} \right) + 0.81^{2} } = 0.19
$$
