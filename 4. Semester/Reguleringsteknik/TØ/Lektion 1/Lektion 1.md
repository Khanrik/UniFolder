## Opgave 1.1
Alle inertimomenter, friktioner og fjedre til aksel 2, da den outputtet ligger her.

**Inertimoment**
Gearingen mellem aksel 2 og 3 er $N_{2,3} = \frac{16}{4} = 4$. Da aksel 2 er højhastighedssiden, kan inertimomentet fra aksel 3 til aksel 2 beregnes som:
$$
J_{3,2} = \frac{J_{2}}{N_{2,3}^{2}} = \frac{16}{4^{2}} = 1 \text{ kg m}^{2}
$$
Gearingen mellem aksel 1 og 2 er $N_{1,2} = \frac{12}{4} = 3$. Da aksel 1 er højhastighedssiden, kan inertimomentet fra aksel 1 til aksel 2 beregnes som:
$$
J_{1,2} = J_{1} \cdot N_{1,2}^{2} = 2 \cdot 3^{2} = 18 \text{ kg m}^{2}
$$

Disse to inertimomenter summeres med den på aksel 2 for at få den samlede inertimoment på aksel 2:
$$
J_{2, \text{tot}} = J_{1,2} + J_{2} + J_{3,2} = 18 + 1 + 1 = 20 \text{ kg m}^{2}
$$

**Fjederkraft**
Fjederkraft omregnes på samme måde som $J_{3,2}$ ved at bruge gearingen mellem aksel 2 og 3
$$
K_{2} = \frac{K}{n_{2,3}^{2}} = \frac{64}{4^{2}} = 4 \frac{\text{N m}}{\text{rad}}
$$

**Friktion**
Friktionerne omregnes også på samme måde med friktionskonstanterne for aksel 1 og 3 samt gearingerne
$$
b_{3,2} = \frac{b_{3}}{n_{2,3}^{2}} = \frac{32}{4^{2}} = 2 \frac{\text{N m s}}{\text{rad}}
$$
$$
b_{1,2} = b_{1} \cdot n_{1,2}^{2} = 1 \cdot 3^{2} = 9 \frac{\text{N m s}}{\text{rad}}
$$
$$
b_{2,\text{tot}} = b_{1,2} + b_{2} + b_{3,2} = 9 + 2 + 2 = 13 \frac{\text{N m s}}{\text{rad}}
$$
**Resulterende kraftmoment**
Med Newton's anden lov for rotation kan det resulterende kraftmoment for aksel 2 skrives som følgende i laplace domænet
$$
\tau_{2,\text{res}} = J_{2,\text{tot}} \cdot s^{2}\theta_{2}(s)
$$
Dette kan omskrives ud fra de forrige beregnede kræfter således
$$
\begin{align*}
T_{2,\text{ydre}}(s) - T_{2,\text{fjeder}}(s) - T_{2,\text{friktion}}(s) &= J_{2,\text{tot}} s^{2} \theta_{2}(s)\\
T_{2,\text{ydre}}(s) - K_{2} \theta_{2}(s) - b_{2,\text{tot}} s \theta_{2}(s) &= J_{2,\text{tot}} s^{2} \theta_{2}(s)\\
T_{2,\text{ydre}}(s) &= J_{2,\text{tot}} s^{2} \theta_{2}(s) + b_{2,\text{tot}} s \theta_{2}(s) + K_{2} \theta_{2}(s)\\
T_{2,\text{ydre}}(s) &= (J_{2,\text{tot}} s^{2} + b_{2,\text{tot}} s + K_{2}) \theta_{2}(s)\\
T_{2,\text{ydre}}(s) &= (20 s^{2} + 13s + 4) \theta_{2}(s)
\end{align*}
$$

Momentet kan omskrives til at relatere til aksel 1 ($T(s)$) ved at bruges gearingen mellem aksel 1 og 2. Relationen mellem $T(s)$ og $T_{2,\text{ydre}}(s)$ kan da opskrives som
$$
T_{2,\text{ydre}}(s) = T(s)n_{1,2} = 3T(s) = (20 s^{2} + 13s + 4) \theta_{2}(s)
$$

Da det er overføringsfunktionen mellem $T(s)$ og $\theta_{2}(s)$ som skal findes, omskrives ovenstående formel således
$$
\begin{align*}
3T(s) &= (20 s^{2} + 13s + 4) \theta_{2}(s)\\
\frac{\theta_{2}(s)}{T(s)} &= \frac{3}{20 s^{2} + 13s + 4}
\end{align*}
$$

## Opgave 1.2
	