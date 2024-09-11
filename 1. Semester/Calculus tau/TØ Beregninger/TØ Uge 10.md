## Afsnit 16.2
### Opgave 5
Løs ligningen:
$x \cdot \frac{dy}{dx} + 2 \cdot y = 1 - \frac{1}{x}$,    $x > 0$

Sæt på standard form:
$$
\frac{dy}{dx} + \frac{2}{x} \cdot y = \frac{1}{x} - \frac{1}{x^{2}}
$$
hvor $P(x) = \frac{2}{x}$ og $Q(x) = \frac{1}{x} - \frac{1}{x^{2}}$

>[!NOTE]- Finder ud af at $v(x) = x^{2}$
>$v(x) = e^{\int \frac{2}{x} \, dx}$
>$v(x) = e^{2 \cdot \int \frac{1}{x} \, dx}$
>$v(x) = e^{2 \cdot \ln(x)}$
>$v(x) = \left( e^{\ln(x)} \right)^{2}$
>$v(x) = x^{2}$

$$
\begin{align}
y &= \frac{1}{x^{2}} \cdot \int (x^{2}) \cdot \left( \frac{1}{x} - \frac{1}{x^{2}} \right) \, dx  \\
y &= \frac{1}{x^{2}} \cdot \int x - 1 \, dx \\
y &= \frac{1}{x^{2}} \cdot \int x \, dx - \int 1 \, dx  \\
y &= \frac{1}{x^{2}} \cdot \left(  \frac{1}{2} \cdot x^{2} - x + c \right) \\
y &= \underline{\underline{\frac{1}{2} - \frac{1}{x} + \frac{c}{x^{2}}}}
\end{align}
$$

### Opgave 8
Løs ligningen:
$e^{2 \cdot x} \cdot y' + 2 \cdot e^{2 \cdot x} \cdot y = 2 \cdot x$

Sæt på standard form:
$$
\frac{dy}{dx} + 2 \cdot y = \frac{2 \cdot x}{e^{2 \cdot x}}
$$
hvor $P(x) = 2$ og $Q(x) = \frac{2 \cdot x}{e^{2 \cdot x}}$

>[!NOTE]- Finder ud af at $v(x) = e^{2 \cdot x}$
>$v(x) = e^{\int 2 \, dx}$
>$v(x) = e^{2 \cdot x}$

$$
\begin{align}
y &= \frac{1}{e^{2 \cdot x}} \cdot \int e^{2 \cdot x} \cdot \frac{2 \cdot x}{e^{2 \cdot x}} \, dx \\
y &= \frac{1}{e^{2 \cdot x}} \cdot \int 2 \cdot x \, dx  \\
y &= \frac{1}{e^{2 \cdot x}} \cdot (x^{2} + c)  \\
y &= \underline{\underline{\frac{x^{2} + c}{e^{2 \cdot x}}}}
\end{align}
$$

### Opgave 15
Løs begyndelsesværdisproblemet:
$\frac{dy}{dt} + 2 \cdot y = 3$,    $y(0) = 1$

>[!NOTE]- Finder ud af at $v(x) = e^{2 \cdot x}$
>$v(x) = e^{\int 2 \, dx}$
>$v(x) = e^{2 \cdot x}$

$$
\begin{align}
y &= \frac{1}{e^{2 \cdot x}} \cdot \int e^{2 \cdot x} \cdot 3 \, dx  \\
y &= \frac{1}{e^{2 \cdot x}} \cdot 3 \cdot \int e^{2 \cdot x} \, dx  \\
y &= \frac{3}{e^{2 \cdot x}} \cdot \left( \frac{e^{2 \cdot x}}{2} + c \right) \\
y &= \frac{3}{2} \cdot \frac{3 \cdot c}{e^{2 \cdot x}}
\end{align}
$$

Indsæt begyndelsesværdi:
$$
\begin{align}
1 &= \frac{3}{2} \cdot \frac{3 \cdot c}{e^{2 \cdot 0}} \\
1 &= \frac{9}{2} \cdot c \\
c &= \frac{2}{9}
\end{align}
$$

c-værdi indsættes:
$$
y = \frac{3}{2} \cdot \frac{3 \cdot \frac{9}{2}}{e^{2 \cdot x}} = \underline{\underline{\frac{81}{4} \cdot e^{-2 \cdot x}}}
$$
### Opgave 17
$\theta \cdot \frac{dy}{d\theta} + y = \sin(\theta)$,    $\theta > 0$,    $y\left( \frac{\pi}{2} \right) = 1$

## Afsnit 16.2
### Opgave 26
Current in an open RL circuit. If the switch is thrown open after the current in an RL circuit has built up to its steady-state value $I = \frac{V}{R}$, the decaying current (see accompanying figure) obeys the equation
$$
L \cdot \frac{di}{dt} + R \cdot i = 0
$$

#### a. Solve the equation to express $i$ as a function of $t$
Rewrite to standard form:
$$
\frac{di}{dt} + \frac{R}{L} \cdot i = \frac{0}{L}
$$

>[!NOTE]- Finder ud af at $v(t) = \frac{R}{L} \cdot t$
>$v(t) = e^{\int \frac{R}{L} \, dt}$
>$v(t) = e^{\frac{R}{L} \cdot t}$

$$
\begin{align}
i(t) &= \frac{1}{\frac{R}{L} \cdot t} \cdot \int \frac{R}{L} \cdot 0 \, dt \\
i(t) &= \frac{1}{\frac{R}{L} \cdot t} \cdot c \\
i(t) &= \underline{\underline{\frac{L \cdot c}{R \cdot t}}}
\end{align}
$$

#### b. How long after the switch is thrown will it take the current to fall to half its original value
Begyndelsesværdi sættes til:
$$
i(t_{0}) = \frac{L \cdot c}{R \cdot t_{0}}
$$
Den halve strøm findes så som:
$$
\begin{align}
i(t_{1}) &= \frac{i(t_{0})}{2} \\
\frac{L \cdot c}{R \cdot t_{1}} &= \frac{1}{2} \cdot \frac{L \cdot c}{R \cdot t_{0}} \\
\frac{1}{t_{1}} &= \frac{1}{2} \cdot \frac{1}{t_{0}} \\
t_{1} &= \underline{\underline{2 \cdot t_{0}}}
\end{align}
$$


### Opgave 28


## Afsnit 16.3
### Opgave 13 (se eksempel 3 s. 1041–1043, og brug gerne lommeregner)
#### a.
```math-tex
flow_in = 20 L/mi
density_in = 0.2 kg/L
rate_in = flow_in * density_in
```

## Afsnit 16.4
### Opgave 21


### Opgave 22 (se eksempel 2 s. 1050–1051)
