## Opgave 1
### a)
Shannon's Teorem bruges
$$
C = 22 \cdot 10^{6} \cdot \log_{2}(1 + 10^{\frac{6}{10}}) = 51.0 \frac{Mb}{s}
$$

### b)
Der kan være interference i signalet fra elektronamgnetiske kilder som baggrundsstråling.

## Opgave 2

### a)
Dette er falsk. ARP arbejder ikke mellem lag 3 og 4, men lag 2 og 3, da den IP til MAC adresser.

### b)
Dette er sandt. RSVP reserverer blot båndbredde og ændrer ikke ved routerens tilstand.

### c)
Dette er sandt. Netværksdiagnostik værktøjer som ping bruger ICMP.

### d)
Dette er falsk. PIM bruges til routing af multicast besleder ikke direkte transport.

<div style="page-break-after: always;"></div>

## Opgave 3
### a)
Man tilføjer `00000000` bag på den binære information, hvorefter man laver polynomisk division mellem daten og generatorpolynomiet, som er `100000111`. Checksummen vil da være resten af divisionen.

### b)
`0010010111111011`

## Opgave 4
### a)
`205:60:27:805:42BD:40FF:FE67:94D1`

### b)
Det er simpelt effektivt og kræver ikke nogen DHCP server, så det er decentraliseret. Simpliciteten giver anledning til bekymringer omkring sikkerhed, da det da ville være nemt at kopiere en anden enheds IP og forfalske sig selv som den.

## Opgave 5
### a)
$$
n = 11 \cdot 19 = 209
$$
$$
\Phi = (1 - 11) (1 - 19) = 180
$$
$$
GCD(\Phi,e) = 1 \implies e \in \{1,7\}
$$
En offentlig nøgle kunne være $PU = \{7,209\}$

### b)
$$
C = 65^{7} \text{ mod } 209 = 65
$$

### c)
Værdien af beskeden $M$ skal være mindre end $n$ hvilket i dette tilfælde er 209.

<div style="page-break-after: always;"></div>

## Opgave 6
### a)

| Id    | Netværk i CIDR notation |
| ----- | ----------------------- |
| Net 1 | 202.4.7.0/30            |
| Net 2 | 202.4.7.4/30            |
| Net 3 | 202.4.7.8/30            |
| Net 4 | 202.4.7.12/30           |
| Net 5 | 202.4.7.16/30           |
| Net 6 | 202.4.7.20/30           |

### b)
Da det er punkt-til-punkt forbindeler er der ikke brug for mere end 2 ledige adresser. `255:255:255:252` masken vil give præcist dette.

### c)
`202.4.7.21`

### d)
`ip addr add 202.4.7.21/30 dev eth0`

<div style="page-break-after: always;"></div>

## Opgave 7
### a)
| Fragmentnummer | Datastørrelse \[bytes] | M-bit | Fragment Offset \[octets] |
| -------------- | ---------------------- | ----- | ------------------------- |
| 1              | 512                    | 1     | 0                         |
| 2              | 512                    | 1     | 64                        |
| 3              | 476                    | 1     | 128                       |

### b)
Med IPv4 er det typisk routeren som udfører fragmenteringen. Med IPv6 er det altid afsenderen som udfører fragmenteringen.

## Opgave 8
### a)
$RTT = 2 \cdot \frac{650000 m}{3 \cdot 10^{8} \frac{m}{s}} = 4.3 ms$

### b)
Tidsforsinkelsen kan afhænge af throughputtet af afsenderen, lysets hastighed i mediet dataen sendes igennem, og afstanden mellem afsender og modtager.

## Opgave 9
### a)
De er nødt til at kryptere dataen som de sender for at undgå folk i at kunne læse det, hvis nogen på en eller anden måde får fat i det. For at gøre dette kunne de bruge en symmetrisk krypteringsalgoritme, hvilket kræver at de har en fælles mellem afdelingerne.

### b)
For at få finde en fælles nøgle kan de benytte Diffie–Hellman key exchange. Dette er dog ikke lige så nødvendigt, hvis der bare er pålidelige repræsentanter fra hver afdeling der fysisk kan gå sammen et sted uden overvågning, hvor de kan blive enig om en fælles nøgle. 
Derefter kan de bruge en krypteringsalgoritme såsom AES.

<div style="page-break-after: always;"></div>

## Opgave 10
### a)
Sekvensnummeret bruges til at identificere data (størrelse på $2^{32} B$), men hvis der kommer mere data ind end der kan nå at blive udtømt i sekvensen vil gammel data begyndt at blive overskrevet.

### b)
$$
\frac{2^{32} B}{12.5 \frac{MB}{s}} = 671.1 ms
$$

## Opgave 11
### a)

| Netværk/netværkspræfiks | Nexthop-adresse | Hop count |
| ----------------------- | --------------- | --------- |
| 17.29.18.0/24           | direct          | 0         |
| 12.12.21.192/28         | 17.29.18.1      | 1         |
| 17.329.12.0/24          | 12.12.1.141     | 1         |
| 12.12.1.140/28          | direct          | 0         |
| 17.29.1.0/24            | direct          | 0         |
| 167.29.22.0/24          | 12.12.1.141     | 1         |

<div style="page-break-after: always;"></div>

## Opgave 12
### a)
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
\frac{10 \cdot 10^{6}}{1500} = 6666.6 \implies 6667
$$

Chance for at mindst en pakke indeholder en bitfejl
$$
1 - (0.99976)^{6667} = 0.798
$$

Der er 79.8% sandsynlighed for mindst en bitfejl.

### b)
CRC eller parity check.

## Opgave 13
### a)
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

<div style="page-break-after: always;"></div>

## Opgave 14
### a)
![[Pasted image 20250625113148.png]]

### b)
Der er forskellige algoritmer som Prim's og Kruskal's, men for at finde den korteste rute kan man også bruge Bellman Ford.

## Opgave 15
### a)
Den ændrer på source MAC-adressen til dens egen og destination MAC-adressen til det næste hop.

<div style="page-break-after: always;"></div>

## Opgave 16
### a)
Man kan følge RFC 868 tidsprotokollen, hvor devices sender deres tider i unix tidsformatet for at synkronisere.

### b)
Med socketprogrammering kan man åbne en socket på en server som holder styr på tiden. En klient kan da conenct til IP og port, hvor serveren lytter på. Serveren kan da give en tid som klienten kan synkronisere med. Indenfor socket programmering skal man så normalvis lukke forbindelsen igen.