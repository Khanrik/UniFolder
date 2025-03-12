## Opgave 7.1
De lukketsløjfekrav oversættes til åbensløjfekrav. Ud fra nedentående tegning, kan det ses at et oversving på max 20% svarer til et fasemargin på mindst 50 grader.
![[Pasted image 20250311110409.png]]

Når man plotter og aflæser fasemarginet kan det ses at frekvensen ved 26.1 rad/s skal være 0 dB. Dette betyder at proportionalitetsregulatoren skal give en forstærkning på 105 dB ved 26.1 rad/s. Dermed skal den være
$$
K_{p} = 10^{\frac{105}{20}}
$$
![[Pasted image 20250311110721.png]]

Efter regulering får man bodediagrammet forneden, hvor det kan ses at fasemargen er ca. 50 grader, hvilket betyder at oversvingsprocenten kommer til at ligge på ca. 20%.
![[Pasted image 20250311112337.png]]

Når man får matlab til at regne lukketsløjfesystemet med et step kan man se at oversvinget ligger på 17% hvilket er under kravet på 20%.
![[Pasted image 20250311112840.png]]

## Opgave 7.2

De lukketsløjfekrav oversættes til åbensløjfekrav. Da der ikke må være stationære fejl skal vi mindst bruge et type 1 system, men den givne proces er af type 0. Der skal derfor bruges en integraldel i regulatoren. Ud fra nedentående tegning, kan det ses at et oversving på max 15% svarer til et fasemargin på mindst 55 grader.
![[Pasted image 20250311113412.png]]

Stigtiden på max 3 sekunder kan omregnes til en krydsfrekvens på mindst
$$
\omega_{c} = \frac{1.8}{T_{r}} = \frac{1.8}{3} = 0.6 \frac{rad}{s}
$$
Åbensløjfekravene er da:
* Skal være mindst type 1 system
* Fasemargin skal være mindst 55 grader
* Krydsfrekvens skal være mindst 0.6 $\frac{rad}{s}$

Aflæses det på bodeplottet kan det ses, at man skal sænke forstærkningen med 44.2 dB for at få en krydsfrekvens på ca. $0.6 \frac{rad}{s}$.
![[Pasted image 20250311114657.png]]

Sættes et $K_{p} = 10^{\frac{-44.2}{20}}$ led på fås følgende
![[Pasted image 20250312183204.png]]

Da fasemargin nu er 15 grader skal der bruges et differentialdel for at løfte fasemarginet til mindst 55 grader. Fasemarginet skal løftes med 40 grader, men da der senere skal inkluderes en integrationsdel som sænker fasemarginet, løftes den med 50 grader istedet. Da differentialledet løftes med 45 grader i nulpunktet vil den flyttes længere ned end de 0.6 $\frac{rad}{s}$ .
![[Pasted image 20250312220715.png]]

Det kan nu ses at fasemarginet passer med kravet, dog med overdimensionering da fasemarginet nu er på 66. Krydsfrekvensen passer dog ikke længere. Dette kan fikses ved at sænke $K_{p}$ med 5 dB.
![[Pasted image 20250312232329.png]]

Da der er så meget overdimensionering i fasemarginet, kan et filter bruges. Den skal dog ligges et stykke over krydsfrekvensen for ikke at påvirke fasemarginet eller krydsfrekvensen for meget. En filterfrekvens på 10 $\frac{\text{rad}}{\text{s}}$ er valgt hvilket giver $T_{f} = 0.1 \text{s}$.
![[Pasted image 20250312232409.png]]

Den stationære fejl fjernes til sidst med integrationsdelen. For ikke at påvirke fasemarginet for meget lægges integralnulpunktet på en frekvens 6 gange langsommere end krydsfrekvensen, hvilket svarer til en værdi på $T_{i} = \frac{1}{0.1} = 10 \text{s}$
![[Pasted image 20250312232441.png]]

Det kan ses at reguleringen nogenlunde passer med åbensløjfekravene. For at tjekke om det også passer med lukketsløjfekravene plottes den også.
![[Pasted image 20250312233344.png]]

Det kan ses, at der er
* Ingen stationær fejl
* Et oversving på 6%
* En stigtid på $2.87-0.638 = 2.232 \text{s}$
Dette betyder at den overholder alle lukketsløjfekravene.