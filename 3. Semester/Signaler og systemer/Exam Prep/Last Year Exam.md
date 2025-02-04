## Question 1 (CH 1)
### (a) 
$g_{1}(t) = g\left( \frac{t}{4} \right)$
$g_{2}(t) = g\left( \frac{t}{3} \right)$
$g_{3}(t) = g(t)$
$x(t) = g_{1}(t) + g_{2}(t) + g_{3}(t)$

![[Signal System Last Exam Question 1.a]]

### (b)
#### (i)
Since it is a continuous sinusoid function, it is periodic. The fundamental period can be calculated with the fundamental frequency of $2\pi$ in this case
$$
T_{0} = \frac{2\pi}{2\pi} = 1
$$

#### (ii)
$$
\begin{align*}
\frac{7}{15} \pi N &= 2\pi m, \quad m \in \mathbb{Z}\\
\frac{7}{15}N &= 2m\\
N &= \frac{30}{7} m, \quad m = 7\\
N &= 30
\end{align*}
$$
#### (iii)
no


### (c)
It is **not memoryless** since it depends on the future value at time $t^{2}$. 

It is **not causal** since it depends on the future value at time $t^{2}$. 

To check time invariance the time invariance property is checked, so looking at an input
$$
y_{1}(t) = x_{1}(t^{2})
$$
The corresponding input shifted in time would be
$$
\begin{align*}
x_{2}(t^{2}) &= x_{1}(t^{2}-t_{0})
\end{align*}
$$
Shifting the output would result in
$$
y_{2}(t) = y_{1}(t-t_{0}) = x_{1}((t-t_{0})^{2})
$$
Since 
$$
x_{1}(t^{2} - t_{0}) \neq x_{1}((t-t_{0})^{2})
$$
**the system is not time invariant**.

To check linearity we look at two inputs $x_{1}(t)$ and $x_{2}(t)$, where a linear combination combination $x_{3}(t) = ax_{1}(t) + bx_{2}(t)$ must give a similarly weighted linear combination of the corresponding outputs.
$$
\begin{align*}
y_{3}(t) &= x_{3}(t^{2})\\
&= ax_{1}(t^{2}) + bx_{2}(t^{2})\\
&= ay_{1}(t) + by_{2}(t)
\end{align*}
$$
Since the linear combinations match up **it is a linear system**.

## Question 2 (CH 2)
### (a)
#### (i)
![[Signals System Last Exam Question 2.a.i]]

#### (ii)
$$
\begin{align*}
y(t) &= \int_{-\infty}^{\infty} \tau u(\tau) u(t - \tau) \, d\tau \\
&= \int_{0}^{t} \tau \, d\tau\\
&= \frac{1}{2} \left[ \tau^{2} \right]_{0}^{t}\\
&= \frac{1}{2} (t^{2} - 0^{2})\\
&= \frac{t^{2}}{2} 
\end{align*}
$$

#### (iii)
![[Signal System Last Exam Question 2.a.iii]]

### (b)
#### (i)
![[Signal System Last Exam Question 2.b.i]]

#### (ii)
$$
\begin{align*}
y[n] &= \sum_{k = -\infty}^{\infty} u[k] 2u[n-k]\\
&= \sum_{k = 0}^{n} 2\\
&= \begin{cases}
2n + 2, & n \geq 0 \\
0, & n < 0
\end{cases}
\end{align*}
$$

#### (iii)
![[Signal System Last Exam Question 2.b.iii]]

## Question 3 (CH 3 + 4)
#### (i)
![[Signal System Last Exam Question 3.i]]

#### (ii)
$$
\begin{align*}
X(j\omega) &= \int_{-\infty}^{\infty} x(t)e^{-j\omega t} \, dt\\
&= \int_{-1}^{0} -1 e^{ -j\omega t } \, dt + \int_{0}^{1} 1 e^{ -j\omega t } \, dt \\
&= \frac{1}{j\omega} [e^{ -j\omega t }]_{-1}^{0} - \frac{1}{j\omega} [e^{ -j\omega t }]_{0}^{1}, \qquad \omega \neq 0\\
&= \frac{1}{j\omega} (e^{ 0 } - e^{ j\omega }) - \frac{1}{j\omega} (e^{ -j\omega } - e^{ 0 })\\
&= \frac{(1 - e^{ j\omega }) - (e^{ -j\omega } - 1)}{j\omega}\\
&= \frac{1 - e^{ j\omega } - e^{ -j\omega } + 1}{j\omega}\\
&= \frac{2 - \cos(\omega) - j\sin(\omega) - \cos(\omega) + j\sin(\omega)}{j\omega}\\
&= \frac{2 - 2\cos(\omega)}{j\omega}\\
&= \frac{4}{j\omega} \frac{1 - \cos(\omega)}{2}\\
&= \frac{4 \sin^{2}\left( \frac{\omega}{2} \right)}{j\omega}
\end{align*}
$$
Here $\omega$ can't be 0, so the final transform would be
$$
X(j\omega) = \begin{cases}
\frac{4 \sin^{2}\left( \frac{\omega}{2} \right)}{j\omega}, & \omega \neq 0 \\
0, & \omega = 0
\end{cases}
$$

#### (iii)
$$
\begin{align*}
|X(j\omega)| &= \left| \frac{4 \sin^{2}\left( \frac{\omega}{2} \right)}{j\omega} \right|\\
&= \frac{|4 \sin^{2}\left( \frac{\omega}{2} \right)|}{|j\omega|}\\
&= \frac{\sqrt{ (4\sin ^{2} \left( \frac{\omega}{2} \right))^{2} }}{\sqrt{ \omega^{2} }}\\
&= \frac{|4 \sin^{2}\left( \frac{\omega}{2} \right)|}{|\omega|}\\
&= 4 \left| \frac{\sin^{2}\left( \frac{\omega}{2} \right)}{\omega} \right|
\end{align*}
$$

#### (iv)
This function is too hard to sketch by hand so it is done in python
```python
omega = np.linspace(-4*np.pi, 4*np.pi, 1000)
x = 4 * np.abs((np.sin(omega/2)**2) / omega)
plt.plot(omega, x)
```
![[Pasted image 20250110121255.png]]

## Question 4 (CH 4 + 5 + 6)
### (a)
#### (i)
Using equation 4.76 from page 331 (example 4.25).
$$
H(j\omega) = \frac{1}{5j\omega + 10}
$$

#### (ii)
Log magnitude is found
$$
\begin{align*}
20 \log(|H(j\omega)|) &= 20 \log\left( \left| \frac{1}{5j\omega + 10} \right| \right)\\
&= 20 \log\left( \frac{|1|}{|5j\omega + 10|} \right)\\
&= 20 \log\left( \frac{1}{\sqrt{ 100 + 25\omega^{2} }} \right)
\end{align*}
$$

The bode plot is made in python
```python
omega = np.logspace(-2, 3)
H = 20 * np.log10(1/np.sqrt(100 + 25 * omega**2))
plt.plot(omega, H)
plt.semilogx()
```

![[Pasted image 20250110130435.png]]

### (b)
#### (i)
Using equation 5.80 from page 397 (look at example 5.19)
$$
\begin{align*}
H(e^{j\Omega}) &= \frac{1 + \frac{1}{2} e^{ -j\Omega }}{1 - \frac{1}{2} e^{ -j\Omega }}\\
&= \frac{2 + e^{ -j\Omega }}{2 - e^{ -j\Omega }}
\end{align*}
$$

#### (ii)
The magnitude for a complex number of the form $z = a + be^{j\theta}$ can be found as
$$
|z| = \sqrt{ a^{2} + b^{2} + 2 a b \cos(\theta) }
$$
The magnitude for the frequency response can then be found as
$$
\begin{align*}
|H(e^{ j\Omega })| &= \left| \frac{2 + e^{ -j\Omega }}{2 - e^{ -j\Omega }} \right|\\
&= \frac{|2 + e^{ -j\Omega }|}{|2 - e^{ -j\Omega }|}\\
&= \frac{\sqrt{ 2^{2} + 1^{2} + 2 \cdot 2 \cdot 1 \cdot \cos(-\Omega)}}{\sqrt{ 2^{2} + (-1)^{2} + 2 \cdot 2 \cdot (-1) \cdot \cos(-\Omega)}}\\
&= \frac{\sqrt{ 5 + 4\cos(\Omega) }}{\sqrt{ 5 - 4 \cos(\Omega) }}
\end{align*}
$$

To find the phase of the frequency response the numerator and denominator first has to be split up into real and imaginary parts.
$$
\begin{align*}
H(e^{ j\Omega }) &= \frac{2 + e^{ -j\Omega }}{2 - e^{ -j\Omega }}\\
&= \frac{2 + \cos(\Omega) - j\sin(\Omega)}{2 - \cos(\Omega) + j\sin(\Omega)}
\end{align*}
$$

The phase of the numerator and denominator can then be found with the definition of phase for a complex number of the form $z = x + jy$
$$
\theta = \arctan\left( \frac{y}{x} \right)
$$
Whereafter the phase for the frequency response can be found as the difference of the two phases following the definition division with polar form complex numbers
$$
\begin{align*}
\angle H(e^{ j\Omega }) &= \angle (2 + \cos(\Omega) - j\sin(\Omega)) - \angle (2 - \cos(\Omega) + j\sin(\Omega))\\
&= \arctan\left( \frac{-\sin(\Omega)}{2 + \cos(\Omega)} \right) - \arctan\left( \frac{\sin(\Omega)}{2 - \cos(\Omega)} \right)
\end{align*}
$$

## Question 5 (CH 7)
### (a)
The highest frequency signal between the two sinusoids is $\cos(5000\pi t)$. From this the Nyquist rate can be determined to be $\omega_{s} \geq 2 \cdot 5000 \pi = 10000 \pi$ rad/s. The sampling period is then $T_{s} \geq \frac{2\pi}{\omega_{s}} = \frac{1}{5000}$ s.
The Nyquist rate and period are greater than or equal to the values and not strictly greater than since the signal is not band limited.

### (b)
#### (i)
Using table 4.2 we know
$$
X(j\omega) = \pi (\delta(\omega - 5000\pi) - \delta(\omega + 5000\pi))
$$
$$
P(j\omega) = 5000\pi \cdot \sum_{k = -\infty}^{\infty} \delta(\omega - 5000\pi k)
$$
$$
\begin{align*}
X_{p}(j\omega) &= \frac{1}{2\pi} (X(j\omega) * P(j\omega))\\
&= 2500\pi \sum^{\infty}_{k = -\infty} (\delta((\omega - 5000\pi k) - 5000\pi) - \delta((\omega - 5000\pi k) + 5000\pi))
\end{align*}
$$
![[Signal System Last Exam Question 5.b.i]]

#### (ii)
The low pass filter will filter all values in the $X_{p}(j\omega)$ graph out except the one at $\omega = 0$
$$
X_{out}(j\omega) = 5000\pi \delta(\omega)
$$
$$
\begin{align*}
x_{out} (t) &= \frac{1}{2\pi} \int_{-\infty}^{\infty} 5000\pi \delta(\omega) e^{ j\omega t } \, d\omega\\
&= 2500 \int_{-\infty}^{\infty} \delta(\omega) e^{ j\omega t } \, d\omega \\
&= 2500 e^{ 0 j t }\\
&= 2500
\end{align*}
$$
Since $x_{out}(t)$ is a constant function after applying the lowpass filter, it does not have any sinusoids.