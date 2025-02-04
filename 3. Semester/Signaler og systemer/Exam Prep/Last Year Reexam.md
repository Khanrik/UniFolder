## Question 1
### (a)
$g_{1}(t)  = g(t-1)$ and $g_{2}(t) = g(t-2)$ results in the requested signal
$$
x(t) = g(t-1) + g(t-2)
$$
![[Signal System Last Year Reexam Question 1.a]]

### (b)
#### (i)
Since it is a continuous sinusoid it is periodic with a fundamental frequency of
$$
\omega_{0} = 10
$$
This makes the fundamental period
$$
T_{0} = \frac{2\pi}{\omega_{0}} = \frac{2\pi}{10} = 0.2\pi
$$

#### (ii)
Whether it is periodic depends on if there exists and integer $m$ that makes the term inside the cosine be equal to a multiple . This can be found as follows
$$
\begin{align*}
10 N &= 2 \pi m, \quad m \in \mathbb{Z}\\
N &= \frac{2 \pi}{10} m
\end{align*}
$$
Since there are no integers $m$ that can make $N$ be an integer. This signal is not periodic.

#### (iii)
Since $e^{ -2t }$ is an exponentially decreasing function. The signal will approach 0 as $t$ approaches infinity. This means that the signal is not periodic.

### (c)
**Memoryless**
The system is not memoryless since it depends on the past value at time $\frac{t}{2}$.

**Causal**
The system is also not causal since it depends on the same past value.

**Time-invariant**
Shifting the input leads to
$$
x\left( \frac{t}{2} - t_{0} \right)
$$
However shifting the output signal leads to the following input signal
$$
y\left( t - t_{0} \right) = x\left( \frac{t - t_{0}}{2} \right) \neq x\left( \frac{t}{2} - t_{0} \right)
$$
Since it does not lead to the same the system is not time-invariant.

**Linear**
A linear combination of the input would be
$$
x_{3}(t) = ax_{1}\left( t \right) + bx_{2}\left( t \right)
$$
Using this in the output would result in
$$
\begin{align*}
y_{3}(t) &= x_{3}\left( t \right)\\
&= ax_{1}\left( \frac{t}{2} \right) + bx_{2}\left( \frac{t}{2} \right)
\end{align*}
$$
This would be the same as having a linear combination of the two outputs
$$
ay_{1}(t) + by_{2}(t) = ax_{1}\left( \frac{t}{2} \right) + bx_{2}\left( \frac{t}{2} \right)
$$
The system is therefore linear.

## Question 2
### (a)
#### (i)
![[Signal System Last Year Reexam Question 2.a.i]]

#### (ii)
$$
\begin{align*}
y(t) &= \int_{-\infty}^{\infty} x(\tau) h(t - \tau) \, d\tau\\
&= \int_{-\infty}^{\infty} 2 \tau u(t) \tau u(t-\tau) \, d\tau\\
&= \int_{0}^{t} 2 \tau \tau \, d\tau\\
&= \frac{2}{3} [\tau^{3}]_{0}^{t}\\
&= \frac{2}{3} (t^{3} - t^{0})\\
&= \frac{2t^{3} - 2}{3}
\end{align*}
$$

#### (iii)
This is hard to draw so it was made in python using the following code
```python
t = np.linspace(-5, 5, 1000)
x = (2*t**3 - 2) / 3
plt.plot(t, x)
plt.grid()
```
![[Pasted image 20250113181848.png]]

### (b)
#### (i)
![[Signal System Last Year Reexam Question 2.b.i]]

#### (ii)
$$
\begin{align*}
y[n] &= \sum_{k = -\infty}^{\infty} ku[k] u[n-k]\\
&= \sum_{k = 0}^{n} k\\
&= \frac{n(n+1)}{2}
\end{align*}
$$

#### (iii)
The datapoint at n = 4 and n = 5 go to far up, so their top is not drawn.
![[Signal System Last Year Reexam Question 2.b.iii]]

## Question 3
#### (i)
![[Signal System Last Year Reexam Question 3.i]]

#### (ii)
$$
\begin{align*}
X(j\omega) &= \int_{-\infty}^{\infty} x(t) e^{ -j\omega t } \, dt \\
&= \int_{0}^{2} e^{ -j\omega t } \, dt\\
&= -\frac{1}{j\omega} [e^{ -j\omega t }]_{0}^{2}\\
&= -\frac{1}{j\omega} [e^{ -2j\omega } - 1]\\
&= -\frac{e^{ -2j\omega } - 1}{j\omega}\\
&= \frac{1 - e^{ -2j\omega }}{j\omega}\\
&= \frac{1 - \cos(2\omega) + j\sin(2\omega)}{j\omega}\\
&= \frac{2\sin^{2}(\omega) + j\sin(2\omega)}{j\omega}\\
&= \frac{2j\sin ^{2}(\omega) - \sin(2\omega)}{-\omega}\\
&= \frac{\sin(2\omega) - 2j\sin ^{2}(\omega)}{\omega}
\end{align*}
$$

#### (iii)
$$
\begin{align*}
|X(j\omega)| &= \sqrt{ \left( \frac{\sin(2\omega)}{\omega} \right)^{2} + \left( -\frac{2\sin ^{2}(\omega)}{\omega} \right)^{2} }\\
&= \sqrt{ \frac{\sin ^{2}(2\omega) + 4\sin ^{4}(\omega)}{\omega^{2}} }
\end{align*}
$$

#### (iv)
The magnitude is sketched in python using the following code
```python
omega = np.linspace(-4*np.pi, 4*np.pi, 1000)
x = np.sqrt((np.sin(2*omega)**2 + 4*np.sin(omega)**4) / omega**2)
plt.plot(omega, x)
```
![[Pasted image 20250113184606.png]]

## Question 4
### (a)
#### (i)
The Fourier transform of the equation is found using table 4.1
$$
2j\omega Y(j\omega) + 5 Y(j\omega) = X(j\omega) + e^{ -j\omega } X(j\omega)
$$

The frequency response is found using equation 4.76.
$$
H(j\omega) = \frac{1 + e^{ -j\omega }}{2j\omega + 5}
$$

#### (ii)
The log magnitude is first found
$$
\begin{align*}
20\log(|H(j\omega)|) &= 20 \log\left( \left| \frac{1 + e^{ -j\omega }}{2j\omega + 5}  \right| \right)\\
&= 20 \log\left( \frac{|1 + \cos(\omega) - j\sin(\omega)|}{|2j\omega + 5|}  \right)\\
&= 20 \log\left( \frac{\sqrt{ (1+\cos \omega)^{2} + (-\sin(\omega))^{2} }}{\sqrt{ 5^{2} + (2\omega)^{2} }} \right)\\
&= 20 \log\left( \frac{\sqrt{ 2 + \cos ^{2}(\omega) + 2\cos(\omega) + \sin ^{2}(\omega) }}{\sqrt{ 25 + 4\omega^{2} }} \right)
\end{align*}
$$

The bode plot is made using this python code
```python
omega = np.logspace(-2, 3)
H = 20 * np.log10(np.sqrt(2 + np.cos(omega)**2 + 2*np.cos(omega) + np.sin(omega)**2) / np.sqrt(25 + 4*omega**2))
plt.plot(omega, H)
plt.semilogx()
```

![[Pasted image 20250113193408.png]]

### (b)
#### (i)
The Fourier transform is found using table 5.1
$$
Y(e^{ j\omega }) = X(e^{ j\Omega }) - \frac{1}{2} e^{ -j\Omega } X(e^{ j\Omega })
$$
The frequency response is then found using equation 5.80.
$$
\begin{align*}
H(e^{ j\Omega }) &= \frac{1 - \frac{1}{2}e^{ -j\Omega }}{1}\\
&= 1 - \frac{1}{2} \cos(\Omega) + \frac{1}{2} j \sin(\Omega)
\end{align*}
$$

#### (ii)
The magnitude for the frequency response can then be found as
$$
\begin{align*}
|H(e^{ j\Omega })| &= \sqrt{ \left( 1 - \frac{1}{2} \cos(\Omega) \right)^{2} + \left( \frac{1}{2} \sin(\Omega) \right)^{2} }\\
&= \sqrt{ 1 + \frac{1}{4} \cos ^{2}(\Omega) - \cos(\Omega) + \frac{1}{4} \sin ^{2}(\Omega) }
\end{align*}
$$

The phase can be found as
$$
\begin{align*}
\angle H(e^{ j\Omega }) &= \angle \left( 1 - \frac{1}{2} \cos(\Omega) + \frac{1}{2} j \sin(\Omega) \right)\\
&= \arctan\left( \frac{ \frac{1}{2} \sin(\Omega)}{1 - \frac{1}{2} \cos(\Omega)} \right)\\
&= \arctan\left( \frac{\sin(\Omega)}{2 - \cos(\Omega)} \right)
\end{align*}
$$

## Question 5
### (a)
The highest frequency signal between the two sinusoids is $\cos(2000\pi t)$. From this the Nyquist rate can be determined to be $\omega_{s} = 2 \cdot 2000 \pi = 4000 \pi$ rad/s. The sampling period is then $T_{s} = \frac{2\pi}{\omega_{s}} = \frac{1}{4000}$ s.

### (b)
#### (i)
Using table 4.2 we know
$$
X(j\omega) = \pi (\delta(\omega - 2000\pi) - \delta(\omega + 2000\pi))
$$
$$
P(j\omega) = 8000\pi \cdot \sum_{k = -\infty}^{\infty} \delta(\omega - 8000\pi k)
$$
$$
\begin{align*}
X_{p}(j\omega) &= \frac{1}{2\pi} (X(j\omega) * P(j\omega))\\
&= 4000\pi \sum^{\infty}_{k = -\infty} (\delta((\omega - 8000\pi k) - 2000\pi) - \delta((\omega - 8000\pi k) + 2000\pi))
\end{align*}
$$
![[Signal System Last Reexam Question 5.b.i]]

#### (ii)
The cutoff interval is
$$
\pm \frac{\omega_{s}}{2} = \pm \frac{4000\pi}{2} = \pm 2000\pi
$$
This would only include the signal
$$
X_{out}(j\omega) = 4000\pi (\delta(\omega - 2000\pi) + \delta(\omega + 2000\pi))
$$
Using table 4.2 the inverse Fourier transform of this can be found as
$$
x_{out}(t) = 4000 \cos(2000\pi t)
$$
This means that after passing the low pass filter, there will be exactly one sinusoid in the sampled signal.
