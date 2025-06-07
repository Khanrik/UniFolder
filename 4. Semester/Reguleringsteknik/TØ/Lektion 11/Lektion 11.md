## Opgave 11.1
Design regulator for systemet
$$
G(s) = \frac{300}{(s + 2)(s + 5)(s + 20)}
$$

Åbensløjfekrav:
- Mindst 60° fasemargin (OS% ~10)
- Fasemarginsfrekvens på 8 rad/s
Uendelig forstærkning ved lave frekvenser (opnå mindst type 1)

Undersøg effekten af at sample med samplefrekvens 2 gange hurtigere end fasemarginfrekvensen

Undersøg effekten af at sample med samplefrekvens 10 gange hurtigere end fasemarginfrekvensen

Undersøg effekten af at sample med samplefrekvens 20 gange hurtigere end fasemarginfrekvensen

---

Fra lektion 11 slide 15 vides det at regulatoren består af
$$
K_{p} = 5.56
$$
$$
G_{lead}(s) = \frac{2.194s + 8}{s + 17.55}
$$
$$
G_{lag}(s) = \frac{s + 0.8}{s}
$$
Systemet før sampling
![[Pasted image 20250408100704.png]]
![[Pasted image 20250408100648.png]]

Ved sampling med $2\cdot \omega_{c}$
![[Pasted image 20250408101441.png]]
![[Pasted image 20250408101806.png]]

Ved sampling med $10\cdot \omega_{c}$
![[Pasted image 20250408102619.png]]
![[Pasted image 20250408102602.png]]

Ved sampling med $20\cdot \omega_{c}$
![[Pasted image 20250408102636.png]]
![[Pasted image 20250408102547.png]]


## Opgave 11.2
Design regulator for systemet
$$
G(s) = \frac{300}{(s + 2)(s + 5)(s + 20)}
$$
Åbensløjfekrav:
- samplingsfrekvens 20 gange over fasemarginsfrekvens
- Mindst 60° fasemargin (OS% ~10)
- Fasemarginsfrekvens på 8 rad/s
Uendelig forstærkning ved lave frekvenser (mindst type 1)
NB: Fasemargin skal være 60 grader INCL. S&H

---

Da vi har at gøre med det samme system som i forrige opgave vides det at 
$$
T_{s} = \frac{2\pi}{20 \cdot \omega_{c}} = \frac{2\pi}{20 \cdot 8} = \frac{\pi}{80}
$$

Fasemargintabet bliver da ca.
$$
\varphi_{SH\_{loss}} = \frac{\omega_{c} T_{s}}{2} = \frac{8 \cdot \frac{\pi}{80}}{2} = \frac{\pi}{20} \approx 9°
$$

Det uregulerede system ser ud som således
![[Pasted image 20250408114900.png]]

Det kan ses at fasemarginfrekvensen skal løftes med 14.9 rad/s for at nå kravet for krydsfrekvensen. Der tilføjes derfor en $K_{p} = 14.9 \text{ dB}$, hvilket giver dette.
![[Pasted image 20250408115331.png]]
