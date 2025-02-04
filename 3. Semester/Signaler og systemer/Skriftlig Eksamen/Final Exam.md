## Question 1
### (a)
With the definitions $g_{1}(t) = g\left( \frac{t}{3} - \frac{3}{2} \right)$ and $g_{2}(t) = g\left( \frac{t}{3} - \frac{5}{2} \right)$, the signal can be constructed as
$$
x(t) = g_{1}(t) + g_{2}(t) = g\left( \frac{t}{3} - \frac{3}{2} \right) + g\left( \frac{t}{3} - \frac{5}{2} \right) 
$$
![[Signal System Exam Question 1.a 1]]
![[Signal System Exam Question 1.a 2]]
![[Signal System Exam Question 1.a 3]]
<div style="page-break-after: always;"></div>

### (b)
#### (i)
Due to the $u(t)$ factor, it will not be able to repeat the sinusoidal pattern below $t=0$. It is therefore not periodic.

#### (ii)
Whether it is periodic depends on if there exists and integer $m$ that makes the term inside the cosine be equal to an integer multiple of $2\pi$ which will be equal to the fundamental period (denoted $N$ in this case). This can be found as follows
$$
\begin{align*}
\frac{5\pi N}{2} &= 2 \pi m, \quad m \in \mathbb{Z}\\
N &= \frac{4 \pi}{5 \pi} m\\
N &= \frac{4}{5} m\\
N &= 4, \quad m = 5 
\end{align*}
$$

Since both $m$ and $N$ can make the equation be true while staying as integers the signal is periodic with a period of $N=4$. 

#### (iii)
Even though it is a continuous time signal, the signal does not depend on the time $t$, which makes it a constant signal, meaning that it always repeats itself. It must therefore be a periodic signal, but with no tangible fundamental period or a fundamental period of 0.
<div style="page-break-after: always;"></div>

## (c)
**Memoryless**
Since the system depends on a past value at time $t-1$, it is not memoryless.

**Causal**
Since it still depends on the same past value, it is not causal.

**Time-invariant**
Shifting the input leads to
$$
x\left( (t - 1) - t_{0} \right) = x(t - t_{0} - 1)
$$
Inserting this into the output signal gives
$$
y(t) = t x(t - t_{0} - 1)
$$
However shifting the output signal leads to the following expression
$$
\begin{align*}
y\left( t - t_{0} \right) &= (t - t_{0}) x((t - t_{0}) - 1)\\
&= t x (t - t_{0} - 1) - t_{0} x (t - t_{0} - 1)\\
&\neq tx(t - t_{0} - 1)
\end{align*}
$$
Since they do not lead to the same expressions, the system is not time-invariant.

**Linear**
A linear combination of the input would be
$$
x_{3}(t) = ax_{1}\left( t \right) + bx_{2}\left( t \right)
$$
Using this in the output would result in
$$
\begin{align*}
y_{3}(t) &= tx_{3}\left( t \right)\\
&= t (ax_{1}(t - 1) + bx_{2}(t - 1))\\
&= tax_{1}( t - 1 ) + tbx_{2}( t - 1 )
\end{align*}
$$
A linear combination of the output would lead to the following expression
$$
\begin{align*}
y_{3}(t) &= ay_{1}(t) + by_{2}(t)\\
&= tax_{1}\left( \frac{t}{2} \right) + tbx_{2}\left( \frac{t}{2} \right)
\end{align*}
$$
Since they do lead to the same expression the system is linear.
<div style="page-break-after: always;"></div>

## Question 2
### (a)
#### (i)
![[Signal System Exam Question 2.a.i 1]]
![[Signal System Exam Question 2.a.i 2]]
#### (ii)
$$
\begin{align*}
y(t) &= \int_{-\infty}^{\infty} x(\tau) h(t - \tau) \, d\tau\\
&= \int_{-\infty}^{\infty} u(\tau) 5^{t - \tau} u(t-\tau) \, d\tau\\
&= \int_{0}^{t} 5^{t - \tau} \, d\tau\\
&= -\frac{1}{\log(5)} [5^{t - \tau}]_{0}^{t}\\
&= -\frac{1}{\log(5)} [5^{t - t} - 5^{t - 0}]\\
&= \frac{5^{t} - 1}{\log(5)}
\end{align*}
$$
<div style="page-break-after: always;"></div>

#### (iii)
The plot was made in python using the following code
```python
t = np.linspace(-5, 5, 1000)
x = (5**t - 1) / np.log(5) # Assuming natural logarithm
plt.plot(t, x)
plt.grid()
```
![[Pasted image 20250114094420.png]]

### (b)
#### (i)
The top of some of the datapoints of each function are not drawn since they go too far up (these do not have a dot at the top of the line)
![[Signal System Exam Question 2.b.i 1]]
![[Signal System Exam Question 2.b.i 2]]

#### (ii)
$$
\begin{align*}
y[n] &= \sum_{k = -\infty}^{\infty} x[k]h[n - k]\\
&= \sum_{k = -\infty}^{\infty} 3^{k}u[k]2^{k}u[n - k]\\
&= \sum_{k = 0}^{n} 3^{k}2^{k}\\
&= \frac{1}{5} (6^{n + 1} - 1)
\end{align*}
$$

#### (iii)
The plot was made in python using the following code:
```python
n = np.linspace(-5, 5, 11)
y = np.piecewise(n, [n < 0, n >= n], [0, 1/5 * (6**(n + 1) - 1)])
plt.plot(n, y, "bo")
for i in n:
    plt.vlines(i, 0, int(y[int(i+5)]), colors="b")
plt.xlabel("n")
plt.ylabel("y[n]")
plt.grid()
```
![[Pasted image 20250114100714.png]]
<div style="page-break-after: always;"></div>

## Question 3
#### (i)
![[Signal System Exam Question 3.i]]

#### (ii)
$$
\begin{align*}
X(j\omega) &= \int_{-\infty}^{\infty} x(t) e^{ -j\omega t } \, dt \\
&= \int_{-1}^{3} e^{ -j\omega t } \, dt\\
&= -\frac{1}{j\omega} [e^{ -j\omega t }]_{-1}^{3}\\
&= -\frac{1}{j\omega} [e^{ -3j\omega } - e^{ j\omega }]\\
&= -\frac{e^{ -3j\omega } - e^{ j\omega }}{j\omega}\\
&= \frac{e^{ j\omega } - e^{ -3j\omega }}{j\omega}\\
&= \frac{\cos(\omega) + j\sin(\omega) - \cos(3\omega) + j\sin(3\omega)}{j\omega}
\end{align*}
$$
<div style="page-break-after: always;"></div>

#### (iii)
$$
\begin{align*}
|X(j\omega)| &= \left| \frac{\cos(\omega) + j\sin(\omega) - \cos(3\omega) + j\sin(3\omega)}{j\omega} \right|\\
&= \frac{| \cos(\omega) - \cos(3\omega) + j\sin(\omega) + j\sin(3\omega) |}{| j\omega |}\\
&= \frac{\sqrt{ (\cos(\omega) - \cos(3\omega))^{2} + (\sin(\omega) + \sin(3\omega))^{2} }}{\sqrt{ \omega^{2} }}\\
&= \frac{\sqrt{ \cos ^{2}(\omega) + \cos ^{2}(3\omega) - 2\cos(\omega)\cos(3\omega) + \sin ^{2}(\omega) + \sin ^{2}(3\omega) + 2\sin(\omega)\sin(3\omega) }}{|\omega|}
\end{align*}
$$

#### (iv)
The sketch is done in python using the following code:
```python
omega = np.linspace(-4*np.pi, 4*np.pi, 1000)
X = np.sqrt((np.cos(omega) - np.cos(3*omega))**2 + (np.sin(omega) + np.sin(3*omega))**2) / np.abs(omega)
plt.xlabel("$\omega$")
plt.ylabel("y($j\omega$)")
plt.plot(omega, X)
```
![[Pasted image 20250114102645.png]]

## Question 4
### (a)
#### (i)
The frequency response is found using equation 4.76.
$$
H(j\omega) = \frac{j\omega + 1}{2j\omega + 5}
$$

#### (ii)
The log magnitude is first found
$$
\begin{align*}
20\log(|H(j\omega)|) &= 20 \log\left( \left| \frac{j\omega + 1}{2j\omega + 5}  \right| \right)\\
&= 20 \log\left( \frac{|j\omega + 1|}{|2j\omega + 5|}  \right)\\
&= 20 \log\left( \frac{\sqrt{ 1^{2} + \omega^{2} }}{\sqrt{ 5^{2} + (2\omega)^{2} }} \right)\\
&= 20 \log\left( \frac{\sqrt{ 1 + \omega^{2} }}{\sqrt{ 25 + 4\omega^{2} }} \right)
\end{align*}
$$
<div style="page-break-after: always;"></div>

The bode plot is then made in python using the following code:
```python
omega = np.logspace(-2, 3, 1000)
H = 20 * np.log10(np.sqrt(1 + omega**2) / np.sqrt(25 + 4*omega**2))
plt.plot(omega, H)
plt.xlabel("$\omega$")
plt.ylabel("$20 \log H(j\omega)$")
plt.grid()
plt.semilogx()
```
![[Pasted image 20250114103415.png]]
<div style="page-break-after: always;"></div>

### (b)
#### (i)
Applying the Laplace transform to both sides using table 9.1 yields
$$
2sY(s) + 5Y(s) = sX(s) + X(s)
$$
The transfer function can then be found by isolating $\frac{Y(s)}{X(s)}$ resulting in
$$
H(s) = \frac{s + 1}{2s + 5}
$$

#### (ii)
**Zeros**
The numerator will be zero if $s = -1$ since inserting this would yield $-1+1 = 0$.

**Poles**
The denominator will be zero if $s=-\frac{5}{2}$ since inserting this would yield $2 \cdot -\frac{5}{2} + 5 = -5 + 5 = 0$

**Pole-zero plot**
![[Signal System Exam Question 4.b.ii]]
<div style="page-break-after: always;"></div>

## Question 5
### (a)
The Nyquist rate is defined to be $2\omega_{m}$ where $\omega_{m}=2\pi f_{m}$ is the highest angular frequency a given system works with. In this case the given system is a dogs hearing, which goes up to $f_{m} = 65 \text{kHz}$ equating to a Nyquist rate of
$$
\omega_{s} = 2 \cdot \omega_{m} = 2 \cdot 2 \pi 65000 = 260000\pi
$$
This makes the maximum sampling interval
$$
T_{s} = \frac{2\pi}{\omega_{s}} = \frac{1}{130000}
$$

### (b)
#### (i)
For this signal, the frequency reached is $\omega_{m} = 4000\pi$, which makes the Nyquist rate $\omega_{s} = 8000\pi$ and the sampling period
$$
T = T_{s} = \frac{1}{4000}
$$
Now using table 4.2 we know
$$
X(j\omega) = \pi (\delta(\omega - 4000\pi) - \delta(\omega + 4000\pi))
$$
$$
P(j\omega) = 8000\pi \cdot \sum_{k = -\infty}^{\infty} \delta(\omega - 8000\pi k)
$$
$$
\begin{align*}
X_{p}(j\omega) &= \frac{1}{2\pi} (X(j\omega) * P(j\omega))\\
&= 4000 \sum^{\infty}_{k = -\infty} (\delta((\omega - 8000\pi k) - 4000\pi) - \delta((\omega - 8000\pi k) + 4000\pi))
\end{align*}
$$

The sketches of each signal would then be as follows
![[Signal System Exam Question 5.b.i 1]]
![[Signal System Exam Question 5.b.i 2]]
![[Signal System Exam Question 5.b.i 3]]

#### (ii)
As can be seen in the the sketch or mathematical equation of $X_{p}(j\omega)$, the Fourier transform does not contain any information in the interval $-3000\pi \leq \omega \leq 3000\pi$. This means that applying the low pass filter would lead to an outputted Fourier transform of
$$
X_{p} (j\omega) = 0
$$
This would give a corresponding sampled signal of
$$
x_{p}(t) = 0
$$
meaning that it does not contain any sinusoids. 