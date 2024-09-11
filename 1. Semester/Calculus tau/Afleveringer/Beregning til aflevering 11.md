## Opgave 11 (Afsnit 17.2)
Solve equation by the method of undetermined coefficients:
$$
y'' - y' - 6y = e^{-x} - 7\cos(x)
$$
Først løses den homogene ligning, med den karakteristiske ligning (opstillet jvf. ligning 4 fra afsnit 17.1):
$$
1r^{2} - 1r - 6 = 0
$$
Dette kan faktoriseres således for at løse andengradsligningen:
$$
(r + 2) \cdot (r - 3) = 0
$$
Dette medfører at de to rødder er $r_{1} = -2$ og $r_{2} = 3$, hvilket betyder, at den homogene løsning er:
$$
y_{c} = c_{1} e^{-2x} + c_{2} e^{3x}
$$

Derefter kan der ses på formen af højresiden af den inhomogene differentialligning, som kan deles op i en sum af to termer:
$$
G(x) = e^{-x} + (-7\cos(x))
$$
Ud fra tabel 17.1 kan det da aflæses, at en partikulær løsning og dens afledede udtryk skal være af disse former:
$$
y_{p} = A e^{-x} + B \cos(x) + C \sin(x)
$$
$$
y_{p}' = -A e^{-x} - B \sin(x) + C \cos(x)
$$
$$
y_{p}'' = Ae^{-x} - B \cos(x) - C \sin(x)
$$
Substitueres det ind i differentialligningen giver det:
$$
\begin{align}
(Ae^{-x} - B \cos(x) - C \sin(x)) - (-A e^{-x} - B \sin(x) + C \cos(x)) - 6 (Ae^{-x} + B \cos(x) + C \sin(x)) &= e^{-x} - 7\cos(x) \\
-4 A e^{-x} + (-7B - C) \cdot \cos(x) + (B - 7C) \cdot \sin(x) &= e^{-x} - 7\cos(x)
\end{align}
$$
$A$ kan let findes som løsningen af denne ligning:
$-4A = 1 \Leftrightarrow A = \frac{1}{-4} = - \frac{1}{4}$
B og C findes som løsningen af to ligninger med to ubekendte (løses med substitution):
$$
\overset{ -7B - C = -7 }{\underset{ B - 7C = 0 }{}}\Big\} \underset{ B = 7C }{} \overset{ -7 (7 C) - C = -7 \Leftrightarrow C = \frac{7}{50}}{} \underset{ B = 7 \cdot \left( \frac{7}{50} \right) = \frac{49}{50} }{}
$$
Indsættes $A = -\frac{1}{4}$, $B = \frac{49}{50}$ og $C = \frac{7}{50}$ tilbage i $y_{p}$ fås den partikulære løsning:
$$
y_{p} = -\frac{1}{4} e^{-x} + \frac{49}{50} \cos(x) + \frac{7}{50} \sin(x)
$$
Den fuldstændige løsning kan da, ifølge sætning 7 i afsnit 17.2, findes som summen af den homogene og partikulære løsning:
$$
y = \underline{\underline{c_{1} e^{-2x} + c_{2} e^{3x} - \frac{1}{4} e^{-x} + \frac{49}{50} \cos(x) + \frac{7}{50} \sin(x)}}
$$
