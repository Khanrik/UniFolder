## Book Exercises
### 1.3
**Suppose that we have three coloured boxes $r$ (red), $b$ (blue), and $g$ (green). Box $r$ contains 3 apples, 4 oranges, and 3 limes, box $b$ contains 1 apple, 1 orange, and 0 limes, and box $g$ contains 3 apples, 3 oranges, and 4 limes. If a box is chosen at random with probabilities $p(r) = 0.2$, $p(b) = 0.2$, $p(g) = 0.6$, and a piece of fruit is removed from the box (with equal probability of selecting any of the items in the box), then what is the probability of selecting an apple? If we observe that the selected fruit is in fact an orange, what is the probability that it came from the green box?**

---

I define $a$ as apples, $o$ as oranges, and $l$ as limes.
Probability of selecting an apple:
$$
\begin{align*}
p(a) &= p(a|r) \cdot p(r) + p(a|b) \cdot p(b) + p(a|g) \cdot p(g)\\
&= \frac{3}{10} \cdot 0.2 + \frac{1}{2} \cdot 0.2 + \frac{3}{10} \cdot 0.6\\
&= 0.34
\end{align*}
$$

Probability of the orange coming from the green box:
$$
\begin{align*}
p(g|o) &= \frac{p(o|g) \cdot p(g)}{p(o)}\\
&= \frac{\frac{3}{10} \cdot 0.6}{p(o|r) \cdot p(r) + p(o|b) \cdot p(b) + p(o|g) \cdot p(g)}\\
&= \frac{\frac{3}{10} \cdot 0.6}{\frac{4}{10} \cdot 0.2 + \frac{1}{2} \cdot 0.2 + \frac{3}{10} \cdot 0.6}\\
&= 0.5
\end{align*}
$$

### 1.7
In this exercise, we prove the normalization condition (1.48) for the univariate Gaussian. To do this consider, the integral
$$
\tag{1.124}
I = \int_{-\infty}^{\infty} \exp\left( - \frac{1}{2\sigma^{2}} x^{2} \right) \, dx 
$$
which we can evaluate by first writing its square in the form
$$
\tag{1.125}
I^{2} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \exp\left( - \frac{1}{2 \sigma^{2}} x^{2} - \frac{1}{2 \sigma^{2}} y^{2} \right) \, dx  \, dy 
$$
Now make the transformation from Cartesian coordinates $(x, y)$ to polar coordinates $(r, θ)$ and then substitute $u = r^{2}$. Show that, by performing the integrals over $\theta$ and $u$, and then taking the square root of both sides, we obtain
$$
\tag{1.126}

I = (2\pi \sigma^{2})^{\frac{1}{2}}
$$
Finally, use this result to show that the Gaussian distribution $N(x|μ, σ^{2})$ is normalized.

---

$$
\begin{align*}
I^{2} &= \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \exp\left( - \frac{1}{2 \sigma^{2}} x^{2} - \frac{1}{2 \sigma^{2}} y^{2} \right) \, dx  \, dy\\
&= \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \exp\left( - \frac{1}{2 \sigma^{2}} (r\cos(\theta))^{2} - \frac{1}{2 \sigma^{2}} (r\sin(\theta))^{2} \right) \, dr  \, d\theta\\
&= \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \exp\left( - \frac{1}{2 \sigma^{2}} r^{2}\cos(\theta)^{2} - \frac{1}{2 \sigma^{2}} r^{2}\sin(\theta)^{2} \right) \, dr  \, d\theta
\end{align*}
$$
$$
\begin{align*}
u &= r^{2}\\
\frac{du}{dr} &= 2r\\
du &= 2r \frac{1}{}
\end{align*}
$$

### 1.10
Suppose that the two variables $x$ and $z$ are statistically independent. Show that the mean and variance of their sum satisfies
$$
\tag{1.128}
\mathbb{E}[x + z] = \mathbb{E}[x] + \mathbb{E}[z]
$$
$$
\tag{1.129}
var[x + z] = var [x] + var[z]
$$

---

$$
\begin{align*}
E[x + z] &= \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} (x+z) \cdot p(x,z) \, dx  \, dz\\
&= \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} x \cdot p(x,z) \, dx  \, dz + \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} z \cdot p(x,z) \, dx  \, dz\\
&= \int_{-\infty}^{\infty} x \cdot \int_{-\infty}^{\infty} p(x,z) \, dz  \, dx + \int_{-\infty}^{\infty} z \cdot \int_{-\infty}^{\infty} p(x,z) \, dx  \, dz\\
&= \int_{-\infty}^{\infty} x \cdot p(x)  \, dx + \int_{-\infty}^{\infty} z \cdot p(z)  \, dz\\
&= E[x] + E[z]
\end{align*}
$$

## Added Questions
Given constants $a, b, \in R$ and random variables $X$ and $Y$, show that
### 1. $E[a + bX] = a + b E[X]$
$$
\begin{align*}
E[a + bX] &= \int_{-\infty}^{\infty} (a + b \cdot X) \cdot p(X) \, dX\\
&= a \int_{-\infty}^{\infty} p(X) \, dX + b \cdot \int_{-\infty}^{\infty} X p(X) \, dX\\
&= a + b \cdot E[X]
\end{align*}
$$

### 2. $E[X + Y] = E[X] + E[Y]$
$$
\begin{align*}
E[X + Y] &= \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} (X+Y) \cdot p(X,Y) \, dX  \, dY\\
&= \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} X \cdot p(X,Y) \, dX  \, dY + \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} Y \cdot p(X,Y) \, dX  \, dY\\
&= \int_{-\infty}^{\infty} X \cdot \int_{-\infty}^{\infty} p(X,Y) \, dY  \, dX + \int_{-\infty}^{\infty} Y \cdot \int_{-\infty}^{\infty} p(X,Y) \, dX  \, dY\\
&= \int_{-\infty}^{\infty} X \cdot p(X)  \, dX + \int_{-\infty}^{\infty} Y \cdot p(Y)  \, dY\\
&= E[X] + E[Y]
\end{align*}
$$

### 3. $Var[X] = E[X^{2}] - E[X]^{2}$
$$
\begin{align*}
Var[X] &= E[(X - E[X])^{2}]\\
&= E[X^{2} + E[X]^{2} -2XE[X]]\\
&= E[X^{2}] + E[X]^{2} - 2E[X]E[X]\\
&= E[X^{2}] - E[X]^{2}
\end{align*}
$$

### 4. $Var[a + bX]  = b^{2}E[X]$
$$
\begin{align*}
Var[a + bX] &= E[(a + bX)^{2}] - E[a + bX]^{2}\\
&= E[a^{2} + b^{2}X^{2} + 2abX] - (a + bE[X])^{2}\\
&= a^{2} + b^{2} E[X^{2}] + 2abE[X] - a^{2} - b^{2}E[X]^{2} - 2abE[X]\\
&= b^{2}E[X^{2}] - b^{2}E[X]^{2}\\
&= b^{2}E[X]
\end{align*}
$$

### 5. $Var[X+Y] = Var[X] + Var[Y] + 2Cov[X,Y]$
$$
\begin{align*}
Var[X + Y] &= E[(X + Y)^{2}] - E[X + Y]^{2}\\
&= E[X^{2} + Y^{2} + 2XY] - (E[X] + E[Y])^{2}\\
&= E[X^{2}] + E[Y^{2}] + 2E[XY] - (E[X]^{2} + E[Y]^{2} + 2E[X]E[Y])\\
&= E[X^{2}] - E[X]^{2} + E[Y^{2}] - E[Y]^{2} + 2E[XY] - 2E[X]E[Y]\\
&= Var[X] + Var[Y] + 2 Cov[X,Y]
\end{align*}
$$

### 6. $Cov[X, Y] = E[XY] - E[X]E[Y]$
$$
\begin{align*}
Cov[X,Y] &= E_{X,Y}[(X - E[X])(Y - E[Y])]\\
&= E[XY - XE[Y] - E[X]Y + E[X]E[Y]]\\
&= E[XY] - E[X]E[Y] - E[X]E[Y] + E[X]E[Y]\\
&= E[XY] - E[X]E[Y]
\end{align*}
$$

Assuming that $X$ and $Y$ are both independent, show that
### 7. $Cov[X,Y] = Corr[X,Y] = 0$
$$
\begin{align*}
Cov[X,Y] &= E[XY] - E[X]E[Y]\\
&= \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} XY \cdot p(X,Y) \, dY  \, dX - E[X]E[Y]\\
&= \int_{-\infty}^{\infty} X \int_{-\infty}^{\infty} Y \cdot p(X,Y) \, dY  \, dX - E[X]E[Y]\\
&= \int_{-\infty}^{\infty} X p(X) E[Y]  \, dX - E[X]E[Y]\\
&= E[X]E[Y] - E[X]E[Y]\\
&= 0
\end{align*}
$$

### 8. $Var[X + Y] = Var[X] + Var[Y]$
Brug opg 5 og 7.