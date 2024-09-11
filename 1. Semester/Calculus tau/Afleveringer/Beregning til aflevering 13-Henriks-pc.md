# Afsnit 13.7
## Opgave 32
![[Pasted image 20231124204614.png]]

Grænserne for funktionen er tegnet op i nedenstående koordinatsystem. Først findes ekstrema indenfor grænserne som beskrevet i sætning 10 fra afsnit 13.7:
![[Calculus aflevering 13]]

$$
D_{x} = 2x - y = 0 \ \ \ \ D_{y} = - x + 2y = 0
$$
Substitution bruges her til at løse ligningssystemet:
$$
\begin{cases}
2x - y = 0 \Leftrightarrow y = 2x \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \Rightarrow \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ y = 2 \cdot 0 = 0 \\
- x + 2y = 0 \ \ \ \ \ \ \Leftrightarrow \ \ \ \ \ \ - x + 2 (2x) = 3x = x = 0
\end{cases}
$$

Indsættes koordinaterne til dette ekstremum, $(x,y) = (0,0)$, i funktionen får man:
$$
D(0,0) = 0^{2} - 0 \cdot 0 + 0^{2} + 1 = 1
$$

Derefter findes de potentielle ekstrema i grænsepunkterne og på linjestykkerne mellem punkterne:
For linjestykke OA er $x=0$, hvilket betyder at en ny funktion kan defineres således
$$
g(y) = f(0,y) = 0^{2} - 0 \cdot y + y^{2} + 1 = y^{2} + 1
$$

Potentielle ekstrema findes ved at sætte grænsepunkternes (O og A) y-koordinater i $g(y)$.
$$
y = 0 \ \ \ \ g(0) = D(0,0) = 1 \ \ \ \ \text{(dette er fundet tidliere)}
$$
$$
y = 4 \ \ \ \ g(4) = 4^{2} + 1 = 17
$$

Ekstrema på linjestykke findes ved at finde minimum y-værdi
$$
g'(y) = 2y = 0 \Leftrightarrow y = 0
$$
Husk at $g(y)$ er defineret ved $x=0$, men $D(0,0)$ er allerede medtaget fra før.

Samme trin gøres for de andre linjestykker. Først for AB
$$
h(x) = f(x,4) = x^{2} - x \cdot 4 + 4^{2} + 1 = x^{2} - 4x + 17
$$
$$
x = 0 \ \ \ \ h(0) = g(4) = 17 \ \ \ \ \text{(dette er fundet fra tidligere)}
$$
$$
x = 4 \ \ \ \ h(4) = 4^{2} - 4 \cdot 4 + 17 = 17
$$
$$
h'(x) = 2x - 4 = 0 \Leftrightarrow x = 8
$$
$x=8$ er dog udenfor grænserne af $D(x,y)$ og tælles derfor ikke med.

Til sidst for OB (her er alle punkter fundet, så kun grænse på linjestykket regnes)
$$
k(x) = f(x,x) = x^{2} - xx + x^{2} + 1 = x^{2} + 1
$$
$$
k'(x) = 2x = 0 \Leftrightarrow x = 0 \ \ \ \ \text{(dette er fundet fra tidligere)}
$$

Alle ekstrema bliver dermed:
$D(0,0) = 1$, $g(4) = 17$ og $h(4) = 17$

Den absolutte minimum er dermed 1 og findes i origo.
De absolutte maxima er 17 og findes i punkterne $(0,4)$ og $(4,4)$.