Løs den her differentialligning:
$$ (1 + x) y' + y = \sqrt{x} $$


$$
\begin{aligned}
(1 + x) \cdot \frac{dy}{dx} + y &= \sqrt{x} \\
\frac{dy}{dx} + \frac{1}{1 + x} \cdot y &= \frac{\sqrt{x}}{1 + x}
\end{aligned}
$$
Dette er standard formen af en linear differentialligning hvor:
$P(x) = \frac{1}{1 + x}$ og $Q(x) = \frac{\sqrt{x}}{1 + x}$

Hvilket medfører at integrationsfaktoren v(x) bliver:
$v(x) = \exp\left(\int \frac{1}{1 + x} \, dx\right)$

Hvor $u = 1 + x$ kan substitueres ind for at løse integralet:
$$
\begin{aligned}
\frac{du}{dx} &= \frac{d}{dx} (1 + x) = 1 \\
&\Updownarrow \\
du &= 1 dx = dx
\end{aligned}
$$

$$
\begin{aligned}
\int{\frac{1}{|u|} \, du} &= \ln(u) + c \\
&= ln(|1 + x|) + c
\end{aligned}
$$

Integralet substituereres ind i v(x), hvor c sættes til at være 0 da enhver løsning virker.
Da v(x) er en positiv funktion, behøver man ikke numerisk værdi omkring ln:
$$
\begin{aligned}
v(x) &= \exp(\ln(1 + x)) \\
&= e^{\ln(1 + x)} \\
&= (1 + x)
\end{aligned}
$$

Indsæt i ligning 4 fra afsnit 16.2:
$$
\begin{aligned}
y &= \frac{1}{v(x)} \int{v(x) \cdot Q(x) \, dx} \\
y &= \frac{1}{1 + x} \cdot \int{(1 + x) \cdot \frac{\sqrt{x}}{1 + x} \, dx} \\
y &= \frac{1}{1 + x} \cdot \int{(1 + x) \cdot \frac{x^{\frac{1}{2}}}{1 + x} \, dx} \\
y &= \frac{1}{1 + x} \cdot \int{x^{\frac{1}{2}} \, dx} \\
y &= \frac{1}{1 + x} \cdot \left( \frac{2}{3} \cdot x^{\frac{3}{2}} + c_1 \right) \\
y &= \frac{2 \cdot x^{\frac{3}{2}}}{3 \cdot (1 + x)} + \frac{c_1}{1 + x} \\
y &= \frac{2 \cdot x^{\frac{3}{2}}}{3 \cdot (1 + x)} + \frac{3 \cdot c_1}{3 \cdot (1 + x)} \\
y &= \frac{2 \cdot x^{\frac{3}{2}} + c}{3 + 3 \cdot x}
\end{aligned}
$$
