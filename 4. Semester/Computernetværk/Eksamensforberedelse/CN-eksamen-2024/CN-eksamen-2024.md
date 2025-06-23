## Opgave 1
Det er
* en unicast-adresse
* en internetadresse, som bruges til kommunikation på et lokalt subnet
* adresse som tilhører et `/10` præfix

## Opgave 2
Netværksadressen: `180.2.4.128`
Broadcastadresse: `180.2.4.255`
Maximale antal hosts i netværket: 126

## Opgave 3
Den sidste DHCP besked er en DHCP-acknowledgement.
Hvis hosten bliver fjernet fra netværket vil IP-adressen stadig være reserveret, så andre hosts ikke kan få adressen. Når leasingperioden på IP-adressen udløber vil det være muligt for hosten eller andre hosts at få adressen igen.

## Opgave 4 magnler
Linus kommandoen for at konfigurere en IP-adresse til eth0 er 
```sh
ip addr add <ip adresse> dev eth0
```

| Id    | Netværk i CIDR notation |
| ----- | ----------------------- |
| Net 1 |                         |
| Net 2 |                         |
| Net 3 |                         |
| Net 4 |                         |
| Net 5 |                         |
| Net 6 |                         |


## Opgave 5 magnler


## Opgave 6
`2024:cafe:5123:424:3e4a:92ff:fe6e:b01f`

## Opgave 7
$2 \cdot \frac{850000 m}{3 \cdot 10^{8} \frac{m}{s}} = 5.667 ms$

Svaret er da 5.7 ms, antaget at data pakken kan bevæge sig med lysets hastighed i vakuum.

## Opgave 8
| Netværk/netværkspræfiks | Nexthop-adresse | Hop count |
| ----------------------- | --------------- | --------- |
| 7.9.17.0/24             | direct          | 0         |
| 7.9.13.0/24             | direct          | 0         |
| 7.9.19.0/24             | direct          | 0         |
| 2.1.1.192/28            | 7.9.17.4        | 1         |
| 7.9.23.0/24             | 7.9.17.4        | 1         |
| 2.2.1.240/28            | 7.9.19.13       | 1         |

## Opgave 9
$0.15 \cdot (1-0.15)^{11} = 0.0251015$
Svaret er da 0.025

## Opgave 10
R1 -> R2 -> R5 -> R7 -> R8
R8 -> R3 -> R2 -> R1

En algoritme til at bestemme den korteste vej kunne være dijkstra eller a*.

## Opgave 11 mangler


## Opgave 12 mangler


## Opgave 13

| Applikationslag (application layer) | HTTP, RFC 868 (Time Protocol) |
| ----------------------------------- | ----------------------------- |
| Transportlag (transport layer)      | TCP, UDP, RSVP                |
| Netværkslag (network layer)         | IP, ICMP, NDP, L2TP           |
| Datalinklag (data link layer)       | HDLC                          |
| Fysisk lag (physical layer)         |                               |

## Opgave 14
$64 \frac{kb}{s} \cdot 0.02 s = 1280 b = 160 B$
Svaret er da 160 bytes

## Opgave 15
IP source adressen af NAPT'en og source port ændres af NAPT'en.
Det antages at der er tale om at sende udegående data.

## Opgave 16
| Netværkspræfiks | Next Hop |
| --------------- | -------- |
| 18.0.0.0/16     | 11.1.4.2 |
| 12.56.5.0/24    | 11.1.1.1 |
| 28.34.0.0/16    | 11.1.3.2 |
| 28.69.16.0/16   | 11.1.1.1 |