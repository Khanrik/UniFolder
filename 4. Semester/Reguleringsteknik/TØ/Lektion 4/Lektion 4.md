## Opgave 4.1
### $G_{\text{ås},1}$
$$
G_{\text{ås},1} = \frac{100(s + 2)}{s(s + 1)(s + 4)} = \frac{100(s + 2)}{s (s^{2} + 5s + 4)}
$$
![[Pasted image 20250225104549.png]]
**Fasemargen og krydsfrekvens**
$\gamma_{M,1} \approx 15 \deg$
$\omega_{c,2} \approx 10$

**Egenfrekvens og dæmpningsforhold**
kryds og egen kan antages at være det samme
$\omega_{n,1} = 10$

dæmpning kan aflæses herfra udfra fasemargen
$\zeta_{1} = 0.16$
![[Pasted image 20250225112338.png]]

**Oversving og stigtid**
$M_{p,1} \approxeq \frac{1.8}{\omega_{n,1}} = \frac{1.8}{10} = 0.18$
$t_{r,1} \approxeq e^{ \frac{-\pi \zeta_{1}}{\sqrt{ 1 - \zeta_{1}^{2} }} } = e^{ \frac{-\pi \cdot 0.16}{\sqrt{ 1 - 0.16^{2} }} } = 0.600967$

Det passer fint med både oversving og stigtid
![[Pasted image 20250225112237.png]]

### $G_{\text{ås},2}$
$$
G_{\text{ås},2} = \frac{50(s + 3)(s + 5)}{s(s + 2)(s + 4)(s + 6)} = \frac{50 (s^{2} + 8 s + 15)}{s (s^{3} + 12 s^{2} + 44 s + 48)}
$$
![[Pasted image 20250225105322.png]]

**Fasemargen og krydsfrekvens**
$\gamma_{M,2} \approx 30$
$\omega_{c,2} \approx 6$

**Egenfrekvens og dæmpningsforhold**
kryds og egen kan antages at være det samme
$\omega_{n,2} = 6$

dæmpning kan aflæses herfra udfra fasemargen
$\zeta_{2} = 0.28$
![[Pasted image 20250225112338.png]]

**Oversving og stigtid**
$M_{p,2} \approxeq \frac{1.8}{\omega_{n,2}} = \frac{1.8}{6} = 0.3$
$t_{r,1} \approxeq e^{ \frac{-\pi \zeta_{2}}{\sqrt{ 1 - \zeta_{2}^{2} }} } = e^{ \frac{-\pi \cdot 0.28}{\sqrt{ 1 - 0.28^{2} }} } = 0.399997$

Det passer fint med både oversving og stigtid
![[Pasted image 20250225114354.png]]

## Opgave 4.2
**Fasemargen og krydsfrekvens**
$\gamma_{M} \approx 70 \deg$
$\omega_{c} \approx 4.5$

**Egenfrekvens og dæmpningsforhold**
kryds og egen kan antages at være det samme
$\omega_{n} = 4.5$

dæmpning kan aflæses herfra udfra fasemargen
$\zeta = 0.85$
![[Pasted image 20250225112338.png]]

$G(s) = \frac{\omega_{n}^{2}}{s^{2} + 2 \zeta \omega_{n} s + \omega_{n}^{2}} = \frac{20.25}{s^{2} + 7.65 s + 20.25}$
