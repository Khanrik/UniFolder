## Opgave 1 (1 point)
En host computer med MAC-adressen `80-CE-62-78-B6-E2` anvender stateless autokonfiguration for at tilegne sig en global IPv6-adresse. Fra den lokale router får host'en annonceret det globale netværkspræfiks: `2021:0:0:2403::/64`.

### a) Hvilken adresse konfigurerer hosten?
Svaret er [C] Hosten konfigurerer 2021::2403:82CE:62FF:FE78:B6E2

### b) Forklar kort hvorledes stateless autokonfiguration virker for IPv6?
Den tager computerens MAC adresse, tilføjer de 2 bytes FFFE i midten og sætter den syvende bit til dens komplementære værdi. Dette vil give et suffix, som i forrige opgave svarer til "82CE:62FF:FE78:B6E2", hvilket bliver sat bag på netværkspræfix'et.

## Opgave 2 (2 point)
Virksomheden har fået tildelt netværket `130.225.16.0/24`. Router R1’s adresse mod internettet er `130.225.0.5`. LAN A og LAN B er forbundet af Router R2. S1 er en switch som kobler Host H2 til LAN B.

### a) Lav en IP adresseplan for virksomheden i skemaet nedenfor ved at angive IP adresser for router og host interfaces. Anvend CIDR notation til at angive adresserne.
![[Pasted image 20250403000307.png]]

| Navn på element | Interface | IP-adresse (CIDR notation) |
| --------------- | --------- | -------------------------- |
| Router R1       | eth0      |                            |
| Router R2       | eth0      |                            |
| Router R2       | eth1      |                            |
| Host H1         | eth0      |                            |
| Host H2         | eth0      |                            |
| Host H3         | eth0      |                            |
| Host H4         | eth0      |                            |

### b) Angiv en velvalgt default gateway-adresse for host H3.


## Opgave 3 (1 point)
Antag at vi ønsker at transmittere den binære besked `11001001` og at vi ønsker at beskytte den mod fejl ved hjælp af CRC-polynomiet $x^3 + x + 1$.

### a) Hvilken af følgende beskeder skal sendes, når der tages højde for CRC-tjek?


## Opgave 4 (1 point)
Figuren nedenfor viser en lag-2 infrastruktur bestående af 7 bridges $B10, \dots, B90$, som samlet forbinder 6 LAN-segmenter $A, B, \dots, F$. Bridges er nummereret med deres Bridge ID, så f.eks. $B90$ har $ID=90$. Alle bridges kører Spanning Tree-protokollen, og vi antager, at protokollen har konvergeret.
![[Pasted image 20250403000328.png]]

### a) Angiv eller illustrer det spanning tree, som forbinder alle bridges.


## Opgave 5 (1 point)
Betragt et udsnit af Internettet som vist nedenfor.
![[Pasted image 20250403000347.png]]

### a) Konstruér en forwarding-table for router R2 med informationer fra figuren ved at udfylde tabellen nedenfor. Bemærk at netværkene er angivet i CIDR-notation på figuren, mens forwarding-tabellen adskiller netværk og subnetmaske og anvender dotted-decimal notation (a.b.c.d).

| Netværk | Subnetmask | Next hop |
| ------- | ---------- | -------- |
|         |            |          |
|         |            |          |
|         |            |          |
|         |            |          |
|         |            |          |

## Opgave 6 (1 point)

### a) Hvilke/hvilken af følgende mekanismer bruges til at finde MAC-adressen, når modtagerens IP-adresse er kendt?


## Opgave 7 (1 point)

### a) Hvilke/hvilken af følgende er CODE BITS (også kaldet Flags) i TCP-protokollen?


### b) Giv sekvensen af kontrolkommandoer, som TCP anvender, for at sætte en forbindelse op mellem en initiativtagende afsender og en destination.


## Opgave 8 (1 point)
Antag at en TCP-forbindelse kører over en `1-Gbps` Ethernet link og udnytter den fulde båndbredde kontinuerligt.

### a) Hvor lang tid vil der gå, før TCP's sequence number har gennemløbet hele den tilgængelige nummerserie (wrap around)?


## Opgave 9 (1 point)
En datapakke sendes ved hjælp af UDP over IPv4.

### a) Hvilke af følgende protokolfelter er medtaget i beregningen af UDP-pakkens checksum?
