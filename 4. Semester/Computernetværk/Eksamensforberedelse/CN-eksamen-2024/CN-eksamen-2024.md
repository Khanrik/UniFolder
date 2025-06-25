## Opgave 1
Det er en unicast-adresse
Det er en internetadresse, som bruges til kommunikation på et lokalt subnet.
Adressen tilhører et /10 præfix.

## Opgave 2

| Netværksadressen (network address)   | `180.2.4.128` |
| ------------------------------------ | ------------- |
| Broadcastadresse (broadcast address) | `180.2.4.255` |

| Maximale antal hosts i netværket | 126 |
| -------------------------------- | --- |
## Opgave 3
DHCP Discover
DHCP Offer
DHCP Request
DHCP Acknowledgement

Hvis hosten bliver fjernet fra netværket vil IP-adressen stadig være reserveret, så andre hosts ikke kan få adressen. Når leasingperioden på IP-adressen udløber vil det være muligt for hosten eller andre hosts at få adressen igen.

## Opgave 4
Linus kommandoen for at konfigurere en IP-adresse til eth0 er 
```sh
ip addr add <ip adresse> dev eth0
```

| Id    | Netværk i CIDR notation |
| ----- | ----------------------- |
| Net 1 | 194.68.0.0/27           |
| Net 2 | 194.68.0.32/27          |
| Net 3 | 194.68.0.64/27          |
| Net 4 | 194.68.0.96/27          |
| Net 5 | 194.68.0.128/27         |
| Net 6 | 194.68.0.160/27         |

## Opgave 5
Pakken forwardes på eth1

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

## Opgave 11
Hvis Alice vælger den private nøgle 2
$$
6^{2} \text{ mod } 17 = 2
$$
Hvis Bob vælger den private nøgle 3
$$
6^{3} \text{ mod } 17 = 12
$$
Deres fælles nøgle ville da være
$$
12^{2} \text{ mod } 17 = 8
$$
eller
$$
2^{3} \text{ mod } 17 = 8
$$

| Alice’s private nøgle         | 2   |
| ----------------------------- | --- |
| Bob’s private nøgle           | 3   |
| Alice’s og Bob's fælles nøgle | 8   |

En symmetrisk krypteringsalgoritme som AES kan bruges. Alice kan kryptere en besked med nøglen 8 og Bob kan derefter dekryptere den med samme nøgle.

## Opgave 12
`100110001`

CRC-checksum bruges til at detektere om en datapakke er blevet korrupt.

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