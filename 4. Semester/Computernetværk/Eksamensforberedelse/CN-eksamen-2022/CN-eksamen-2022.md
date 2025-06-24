## Opgave 1
192.24.14.0/25 on eth3.

Longest prefix matching.

## Opgave 2
Antal bits i en pakke
$$
1500 \cdot 8 = 12000
$$

Sandsynligheden for ingen bitfejl i en pakke
$$
(1 - 2.0 \cdot 10^{-8})^{12000} = 0.99976
$$

Antal pakker
$$
\frac{3.2 \cdot 10^{6}}{1500} = 2133.33 \implies 2134
$$

Chance for at mindst en pakke indeholder en bitfejl
$$
1 - (0.99976)^{2134} = 0.400837
$$

Svaret er $p = 0.40$

Beregningen antager at bitfejlene er uafhængige hændelser.

## Opgave 3
Ruten fra R1 til R6 via R2 og R3 er kortest.

## Opgave 4

| Router | Interface | IP adresse (CIDR notation) |
| ------ | --------- | -------------------------- |
| R1     | eth0      | 130.1.0.1/19               |
| R1     | eth1      | 130.1.32.1/19              |
| R2     | eth0      | 130.1.32.2/19              |
| R2     | eth1      | 130.1.64.1/19              |
| R3     | eth0      | 130.1.0.2/19               |
| R3     | eth1      | 130.1.96.1/19              |
| R3     | eth2      | 130.1.128.1/19             |
| R4     | eth0      | 130.1.64.2/19              |
| R4     | eth1      | 130.1.96.2/19              |
| R4     | eth2      | 130.1.160.1/19             |
| R5     | eth0      | 130.1.128.2/19             |
| R5     | eth1      | 130.1.160.2/19             |

`ip route add 130.1.96.1/19 via 130.1.0.2`

## Opgave 5
Forbindelsen mellem B17 og B30 er aktiv.
Forbindelsen mellem B17 og B58 er aktiv.
Forbindelsen mellem B17 og B45 er aktiv.
Forbindelsen mellem B30 og B50 er aktiv.
Forbindelsen mellem B46 og B58 er aktiv.

Roden af træet er i bridgen med laveste ID. Den vil finde vejen til de andre bridges med færrest skridt og undgå løkker.

## Opgave 6
| Router | Interface | IP adresse (CIDR notation) |
| ------ | --------- | -------------------------- |
| R4     | sl0       | 10.0.0.1/30                |
| R5     | sl0       | 10.0.0.2/30                |
Det er en seriel forbindelse, så et privat netværk kan opstilles (10.0.0.0/30). Da der kun er to routere er der kun brug for 2 adresser, hvilket betyder at masken 255.255.255.252 kan bruges.

`164.0.64.0/18, 10.0.0.1, 20, [AS64]`
`150.1.192.0/18, 10.0.0.1, 20, [AS64 AS50]`
`144.43.0.0/16, 10.0.0.1, 20, [AS64 AS50 AS44]`

## Opgave 7
BGP
TLS

Den bruger en three-way handshake, hvilket består af SYN, SYN-ACK, og ACK kommandoerne.

## Opgave 8
`fe80::27d7:93ff:fe41:29bd`

Den tager hostens MAC adresse, tilføjer de 2 bytes FFFE i midten og sætter den syvende bit til dens komplementære værdi.

## Opgave 9
DV protokollers konvergenstid er lang.
DV protokoller kan anvende hop count metrikken.
DV protokoller sender periodisk information om kendte netværkspræfikser.

## Opgave 10
| Netværk     | Nexthop  | Hop count |
| ----------- | -------- | --------- |
| 13.1.0.0/16 | dir.     | 0         |
| 13.2.0.0/16 | dir.     | 0         |
| 13.3.0.0/16 | 13.2.0.4 | 1         |
| 13.4.0.0/16 | 13.2.0.4 | 2         |
| 13.5.0.0/16 | 13.2.0.4 | 1         |

De bliver multicastet til 224.0.0.9.

## Opgave 11
24.0.0.0/14, da de maksimalt maksimalt bruger 2 bits.

## Opgave 12
connect()
socket()

## Opgave 13 Rune siger skip

## Opgave 14
`00110110101`
https://www.rndtool.info/CRC-step-by-step-calculator/

Hvis der er en fejl skal den droppe pakken.

## Opgave 15
| Addressefelt              | IP adresse        |
| ------------------------- | ----------------- |
| Ydre source adresse       | 128.10.2.3        |
| Ydre destination adresse  | 142.146.234.48    |
| Indre source adresse      | 2002:800a:0203::1 |
| Indre destination adresse | 2002:8e92:ea30::2 |
https://www.whatsmydns.net/ipv6-to-ipv4

## Opgave 16
$$
n = 17 \cdot 11 = 187
$$
$$
\Phi = (1 - 17) (1 - 11) = 160
$$
$$
GCD(\Phi,e) = 1 \implies e \in \{1,3,5,7,9\}
$$
https://www.alcula.com/calculators/math/gcd/#gsc.tab=0
$$
65^{3} \text{ mod } 187 = 109
$$
$$
65^{5} \text{ mod } 187 = 131
$$
$$
65^{7} \text{ mod } 187 = 142
$$
Svaret er 142

Den offentlige nøgle er $\{ 7,187 \}$
