## Opgave 1
eth2

longest-prefix matching.

## Opgave 2
R1 -> R2 -> R6

## Opgave 3
Med unicast ville det koste
NY -> Washington -> Atlanta -> Houston (3)
NY -> Washington -> Atlanta -> Houston -> LA (4)
NY -> Chicago -> Indianapolis -> KC -> Denver -> Seattle (5)
hvilket giver 12 i alt.

Med multicast ville det koste
NY -> Washington -> Atlanta -> Houston -> LA -> Sunnyvale -> Seattle (6)

Besparelsen bliver
$$
\frac{12 - 6}{12} = 50%
$$

## Opgave 4
000
001
010
011
100
101
110
111

| Router | Interface | IP adresse (CIDR notation) |
| ------ | --------- | -------------------------- |
| R1     | eth0      | 136.2.0.1/24               |
| R1     | eth1      | 136.2.1.1/24               |
| R2     | eth0      | 136.2.1.2/24               |
| R2     | eth1      | 136.2.2.1/24               |
| R3     | eth0      | 136.2.0.2/24               |
| R3     | eth1      | 136.2.3.1/24               |
| R3     | eth2      | 136.2.4.1/24               |
| R4     | eth0      | 136.2.2.2/24               |
| R4     | eth1      | 136.2.3.2/24               |
| R4     | eth2      | 136.2.5.1/24               |
| R5     | eth0      | 136.2.4.2/24               |
| R5     | eth1      | 136.2.5.2/24               |

## Opgave 5
ARP og NDP

## Opgave 6
| Router | Interface | IP adresse | Subnet-maske    |
| ------ | --------- | ---------- | --------------- |
| R1     | sl0       | 10.0.0.1   | 255.255.255.252 |
| R2     | sl0       | 10.0.0.2   | 255.255.255.252 |
Det er en seriel forbindelse, så et privat netværk kan opstilles (10.0.0.0/30). Da der kun er to routere er der kun brug for 2 adresser, hvilket betyder at masken 255.255.255.252 kan bruges.

`15.1.192.0/18, 10.0.0.2, 20, [AS50]`
`14.0.64.0/18, 10.0.0.2, 20, [AS50 AS64]`
`18.1.0.0/18, 10.0.0.2, 20, [AS50 AS64 AS18]`

## Opgave 7
RIP og RTSP

Pseudo-headeren holder på source og destination adressen for payload, samt størrelsen/længden af payloaden. For en IPv4 besked holder den også på protokollen (17).

## Opgave 8
`2001:db8:fffe:7::27d0:93ff:fe41:29ff`

## Opgave 9
De gør brug af Dijekstra’s algorithm for at beregne den korteste vej i netværket.
De kan anvende båndbredde (bandwidth) metrikken.
De opbygger en database med information om forbindelserne i netværket.

## Opgave 10
| Netværk         | Nexthop    | Hop count |
| --------------- | ---------- | --------- |
| 8.0.0.0/8       | dir.       | 0         |
| 145.67.0.0/16   | dir.       | 0         |
| 190.14.0.0/16   | 145.67.0.4 | 1         |
| 126.0.0.0/8     | 145.67.0.4 | 2         |
| 190.112.37.0/24 | 145.67.0.4 | 1         |

## Opgave 11

| PHY frame header | Data Link header | IP header | ESP header | TCP header | DATA | ESP trailer |
| ---------------- | ---------------- | --------- | ---------- | ---------- | ---- | ----------- |

## Opgave 12
socket()
bind()
listen()
accept()

## Opgave 13
| Fragmentnummer | M-bit | Fragment Offset |
| -------------- | ----- | --------------- |
| 1              | 1     | 0               |
| 2              | 1     | 1280 bytes      |
| 3              | 1     | 2560 bytes      |

## Opgave 14
`110010011000`
https://www.rndtool.info/CRC-step-by-step-calculator/

Hvis der er en fejl skal den droppe pakken.

## Opgave 15
Antaget ingen tab af pakker, kan littles law bruges. Tiden ville svare til tidsforsinkelsen fra køen og transmissionstiden for en pakke.
$$
\frac{10 p}{0.01 s + \frac{1 p}{100 pps}} = 500
$$

Svaret er da 500 pps.

## Opgave 16

$$
n = 19 \cdot 9 = 171
$$
$$
\Phi = (1 - 19) (1 - 9) = 144
$$
$$
GCD(\Phi,e) = 1 \implies e \in \{1,5,7,11,13\}
$$
https://www.alcula.com/calculators/math/gcd/#gsc.tab=0
$$
67^{5} \text{ mod } 171 = 79
$$
$$
67^{7} \text{ mod } 171 = 148
$$

Svaret er 148

Den offentlige nøgle er $\{ 7,171 \}$

![[Pasted image 20250623230100.png]]
Den private nøgle er $\{ 103,171 \}$
