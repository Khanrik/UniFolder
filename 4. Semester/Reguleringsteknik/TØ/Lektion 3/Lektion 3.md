![[Pasted image 20250211102652.png]]
## Opgave 3.1
Systemet er type 1, da der er et enkeltstående $s$ i nævneren af overføringsfunktionen. 
Ud fra tabel fra slide 21 uge 3, kan man se at fejlen ved steps vil være 0. Altså $e(\infty) = 0$ for $r(t)=25u(t)$.
For rampe bliver får man
$$
K_{0} = \lim_{ s \to 0 } sG(s) = \frac{500 \cdot 8 \cdot 10 \cdot 15}{38 \cdot 25} \approx 632
$$
Med en hældning på 37 bliver fejlen dermed
$$
e(\infty) = \frac{37}{632} = 0.0585
$$
for $r(t) = 37 t u(t)$

## Opgave 3.2
### (a)
Først reduceres blockdiagrammet med denne regel
![[Pasted image 20250211102326.png]]
for at få
![[Pasted image 20250211102340.png]]

Dette er et type 0 system da der ikke er nogen enkelstående $s$.

### (b)
$K_{0}$ findes ved
$$
K_{0} = \lim_{ s \to 0 } G(s) = \frac{5}{2} = 2.5 
$$

### (c)
Ved rampen vil det for et type 0 system altid være $\infty$. Derfor vil fejlen være $e(\infty) = \infty$ for $r(t) = 50 t u(t)$

For et step givet ved $r(t) = 50 u(t)$ vil fejlen være
$$
e(\infty) = \frac{50}{1+2.5} = 14.29
$$

## Opgave 3.3
Den stationære fejl ved parabelinputtet $r(t) = 10 t^{2} u(t)$ kan da findes som
$$
\begin{align*}
e(\infty) &= \lim_{ s \to 0 } s \frac{1}{1 + G(s)} R(s)\\
&= \lim_{ s \to 0 } s \frac{1}{1 + \frac{1000(s^{2} + 4s + 20)(s^{2} + 20s + 15)}{s^{2}(s + 2)(s + 10)}} \frac{2 A}{s^{3}}\\
&= \lim_{ s \to 0 } s \frac{1}{\frac{s^{2}(s + 2)(s + 10) + 1000(s^{2} + 4s + 20)(s^{2} + 20s + 15)}{s^{2}(s + 2)(s + 10)}} \frac{2 \cdot 10}{s^{3}}\\
&= \lim_{ s \to 0 } s \frac{s^{2}(s + 2)(s + 10)}{s^{2}(s + 2)(s + 10) + 1000(s^{2} + 4s + 20)(s^{2} + 20s + 15)} \cdot \frac{20}{s^{3}}\\
&= \lim_{ s \to 0 } \frac{(s + 2)(s + 10)2A}{s^{2}(s + 2)(s + 10) + 1000(s^{2} + 4s + 20)(s^{2} + 20s + 15)}\\
&= \frac{2 \cdot 10 \cdot 20}{1000 \cdot 20 \cdot 15}\\
&= \frac{1}{750}\\
&= 0.00133\dots
\end{align*}
$$

## Opgave 3.4
Superpositionsprincippet gælder, hvilket betyder at R og D kan betragtes hver for sig og derefter summeres.

**Kig på R og antag D=0**
Når D fjernes bliver overføringsfunktionen
$$
G(s) = \frac{100}{s^{2} + 7s + 10}
$$
Det er da et type 0 system, hvilket betyder at $K_{0}$ kan findes som
$$
K_{0} = \lim_{ s \to 0 } \frac{100}{s^{2} + 7s + 10} = 10
$$
Fejlen kan da findes for step signalet givet ved $r(t)  = u(t)$ som
$$
e(\infty) = \frac{1}{1 + 10} = \frac{1}{11}
$$

**Kig på D og antag R=0**
Når R fjernes, vil der være en tilbagekobling, hvilket betyder at overføringsfunktionen kan findes ved at samle det som vist i denne regel
![[Pasted image 20250211112414.png]]

$$
\begin{align*}
G(s) &= \frac{\frac{100}{s+2}}{1 - \frac{100}{s+2} \frac{1}{s+5}}\\
&= \frac{\frac{100}{s+2}}{1 - \frac{100}{s^{2} + 7s + 10}}\\
&= \frac{\frac{100}{s+2}}{\frac{s^{2} + 7s - 90}{s^{2} + 7s + 10}}\\
&= \frac{100s^{2} + 700s + 1000}{s^{3} + 7s^{2} - 90s + 2s^{2} + 14s - 180}\\
&= \frac{100s^{2} + 700s + 1000}{s^{3} + 9s^{2} - 76s - 180}
\end{align*}
$$

Det er stadig et type 0 system, hvilket betyder at $K_{0}$ kan findes som
$$
K_{0} = \lim_{ s \to 0 } \frac{100s^{2} + 700s + 1000}{s^{3} + 9s^{2} - 76s - 180} = \frac{1000}{-180} = - \frac{50}{9}
$$
Fejlen kan da findes for step signalet givet ved $r(t)  = u(t)$ som
$$
e(\infty) = \frac{1}{1 - \frac{50}{9}} = -\frac{9}{41}
$$
Den totale stationære fejl bliver dermed
$$
e(\infty) = \frac{1}{11} - \frac{9}{41} = - \frac{58}{451}
$$
