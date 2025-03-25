## Opgave 8.1
Antag en proces givet ved
$$
G_{p}(s) = \frac{1}{s(s + 50)(s + 120)}
$$
Systemet indgår I et reguleringssystem med enhedstilbagekobling. 
Antag, at du allerede har designet en proportionalregulator med Kp=177830.
Design en lag kompensator som gør den stationære fejl mindre end 0.0236 når lukketsløjfesystemet udsættes for et rampereferance med hældning på 7. Oversvinget ved et stepsvar skal holdes under 25%. Stigtiden ønskes fastholdt.

Den original proces ser ud som vist forneden.
![[Pasted image 20250318100355.png]]

Og det tilsvarende bodediagram er
![[Pasted image 20250318105657.png]]

Da vi har med et type 1 system at gøre kan den nuværende stationære fejl bestemmes som:
$$
\begin{align*}
K_{0} &= \lim_{ s \to 0 } sG_{p}(s) K_{p} \\
&= \frac{177830}{50 \cdot 120}\\
&= \frac{177830}{6000}\\
&\approx 29.64
\end{align*}
$$

Da vi har en rampe med hældning $A=7$ at gøre med kan den nuværende stationære fejl udregnes til at være
$$
\begin{align*}
e(\infty) &= \frac{A}{K_{0}}\\
&= \frac{7}{29.64}\\
&\approx 0.236
\end{align*}
$$
Dette er alt for højt, så en forstærkning $\beta$ skal tilføjes for at denne ulighed går op
$$
\begin{align*}
\frac{A}{K_{0} \cdot 29.64} &\leq 0.0236\\
7 &\leq 0.0236 \cdot (29.64 \cdot \beta)\\
\beta &\geq \frac{7}{0.0236 \cdot 29.64}\\
\beta &\geq 10.007
\end{align*}
$$

Ud fra bodediagrammet kan det ses at krydsfrekvensen lige nu ligger på $\omega_{c}=25.8$. Nulpunktet ligges derfor på
$$
T = \frac{20}{25.8} = 0.775
$$
Overføringsfunktionen bliver da
$$
G_{lag}(s) = \frac{s + \frac{1}{0.775}}{s + \frac{1}{11 \cdot 0.775}} = \frac{s + \frac{1}{0.775}}{s + \frac{1}{8.525}}
$$
Plottes bodediagrammet, kan man se at den stationære magnitude er større, men at fasemarginet er faldet med ca. 3 grad.
![[Pasted image 20250318115000.png]]

Når det nye system får et step kan det ses at oversvinget ligger på 22%, hvilket stadig er under kravet på 25%.
![[Pasted image 20250318115041.png]]

Når der gives en rampe kan det ses at der er klar forberedning ift. stationær fejl.
![[Pasted image 20250318114903.png]]

Zoomes der ind på 100 sekunder ses det 