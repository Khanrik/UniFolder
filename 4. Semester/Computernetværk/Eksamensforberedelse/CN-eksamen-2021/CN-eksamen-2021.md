## Opgave 1
R1 -> R2 -> R3 -> R6

## Opgave 2
B5 og B46
B5 og B30
B17 og B30
B17 og B45
B18 og B46

Eliminere loops for at optimere ruten af pakker.

## Opgave 3

| Host H1s IP adresse | 2805:123::1 |
| ------------------- | ----------- |
| Host H2s IP adresse | 2806:145::2 |

| Ydre protokol-header source addresse:      | 187.16.0.5  |
| ------------------------------------------ | ----------- |
| Ydre protokol-header destination addresse: | 146.28.2.6  |
| Indre protokol-header source address:      | 2805:123::1 |
| Indre protokol-header destination address: | 2806:145::2 |

## Opgave 4
Source MAC adressen ændres af ruteren
Destination MAC adressen ændres af ruteren

## Opgave 5
95.7 Mbps

prompt til wolfram
\frac{1500 - 20}{7 + 2 \cdot 6 + 2 + 1 + 1500 + 4 + 12 + 8} \cdot 100

\frac{1500 - 20 }{7 (preamble) + 2 \cdot 6 + 2 + 1 (start frame delimiter) + 1500 + 4 + 12 (IFG) + 8} \cdot 100 (Mbps)

## Opgave 6
R1 -> R2 -> R5 -> R6

## Opgave 7 rune siger skip

## Opgave 8
`2021::805:42BD:40FF:FE67:94D1`

Den tager hostens MAC adresse, tilføjer de 2 bytes FFFE i midten og sætter den syvende bit til dens komplementære værdi.

## Opgave 9
| Navn på element | IP adresse      |
| --------------- | --------------- |
| Router R1, eth0 | 22.16.13.1/25   |
| Router R2, eth0 | 22.16.13.3/25   |
| Router R2, eth1 | 22.16.13.129/25 |
| Host H1         | 22.16.13.4/25   |
| Host H2         | 22.16.13.5/25   |
| Host H3         | 22.16.13.130/25 |
| Host H4         | 22.16.13.131/25 |

| Default gateway for H3 | 22.16.13.129 |
| ---------------------- | ------------ |

## Opgave 10
$$
C 5^{19} \text{ mod } (11 \cdot 19) = 119
$$
Svaret er C = 119.

Det kan bruges til enkryptering af datapakker f.eks. til TLS.

## Opgave 11
| Symbol for interface | IP adresse  |
| -------------------- | ----------- |
| Blå                  | 160.8.192.1 |
| Rød                  | 182.32.0.1  |
| Grøn                 | 136.1.64.1  |

| Netværk (CIDR notation) | Next hop    | Metrik |
| ----------------------- | ----------- | ------ |
| 160.8.192.0/18          | dir.        | 0      |
| 9.224.0.0/12            | 160.8.192.1 | 1      |
| 136.1.64.0/20           | 160.8.192.1 | 1      |
| 182.32.0.0/20           | dir.        | 0      |
| 8.128.0.0/12            | 182.32.0.1  | 1      |

## Opgave 12
| AS nummer | Netværk        | BGP ruter interface | IP adresse    |
| --------- | -------------- | ------------------- | ------------- |
| AS 52     | 137.6.0.0/16   | R1, eth1            | 190.252.255.5 |
| AS 640    | 190.252.0.0/16 | R2, eth0            | 190.252.255.6 |
| AS 118    | 3.125.0.0/9    | R3, eth1            | 3.128.0.1     |
|           |                | R4, eth0            | 3.128.0.2     |
`137.6.0.0/16, 3.128.0.1, 20, [640 502]`
`190.252.0.0/16 , 3.128.0.1, 20, [640]`

Hvis en ruter ser sit eget AS nummer i path vil der være en løkke.