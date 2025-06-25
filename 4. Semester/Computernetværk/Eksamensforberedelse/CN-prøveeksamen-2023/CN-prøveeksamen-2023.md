## Opgave 1

01000001 | 1

Antaget at "A" svarer til 95. Paritet kan benyttes til at opfange, hvis der sker en enkelt bit fejl.

## Opgave 2
| Symbol for interface | IP adresse |
| -------------------- | ---------- |
| Blå                  | 11.0.4.1   |
| Rød                  | 12.13.14.1 |
| Grøn                 | 11.1.4.1   |

| Netværk (CIDR notation) | Next hop   | Metrik |
| ----------------------- | ---------- | ------ |
| 11.0.4.0/22             | dir.       | 0      |
| 9.9.0.0/16              | 11.0.4.1   | 1      |
| 11.1.4.0/24             | 11.0.4.1   | 1      |
| 12.13.14.0/24           | dir.       | 0      |
| 9.8.0.0/16              | 12.13.14.1 | 1      |

## Opgave 3
