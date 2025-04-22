## Opgave 12.1
Find diskret overføringsfunktion (i ”z”) samt differensligningen (i ”k”) for følgende regulator:
$$
G_{c}(s) = \frac{s + 10}{s + 30}
$$
Udregn for samplingstider på 0.1 sek. og 0.01 sek.

Udregnes med bilineære (Tustin) transformation
$$
\begin{align*}
G_{c}(s) &= \frac{\frac{2}{T_{s}} \frac{z - 1}{z + 1} + 10}{\frac{2}{T_{s}} \frac{z - 1}{z + 1} + 30}\\
&= \frac{2 (z - 1) + 10 T_{s}(z + 1)}{2 (z - 1) + 30 T_{s} (z + 1)}\\
&= \frac{2z - 2 + 10T_{s}z + 10T_{s}}{2z - 2 + 30T_{s}z + 30T_{s}}\\
&= \frac{(2 + 10 T_{s})z + (10T_{s} - 2)}{(2 + 30 T_{s})z + (30T_{s} - 2)}
\end{align*}
$$

Sampling tid $T_{s} = 0.1$ indsættes
$$
\begin{align*}
G_{c}(s) &= \frac{(2 + 10 \cdot 0.1)z + (10 \cdot 0.1 - 2)}{(2 + 30 \cdot 0.1)z + (30 \cdot 0.1 - 2)}\\
&= \frac{3z - 1}{5z + 1}\\
&= \frac{3 - z^{-1}}{5 + z^{-1}}
\end{align*}
$$
Differensligningen bliver dermed
$$
\begin{align*}
Y(z) &= \frac{3 - z^{-1}}{5 + z^{-1}} X(z)\\
5Y(z) + Y(z) z^{-1} &= 3X(z) - X(z) z^{-1}\\
Y(z) &= - \frac{1}{5} Y(z) z^{-1} + \frac{3}{5} X(z) - \frac{1}{5} X(z) z^{-1}\\
y_{k} &= - 0.2 y_{k-1} + 0.6 x_{k} - 0.2 x_{k-1}
\end{align*}
$$

Sampling tid $T_{s} = 0.01$ indsættes
$$
\begin{align*}
G_{c}(s) &= \frac{(2 + 10 \cdot 0.01)z + (10 \cdot 0.01 - 2)}{(2 + 30 \cdot 0.01)z + (30 \cdot 0.01 - 2)}\\
&= \frac{2.1z - 1.9}{2.3z - 1.7}\\
&= \frac{2.1 - 1.9z^{-1}}{2.3 - 1.7z^{-1}}
\end{align*}
$$
Differensligningen bliver dermed
$$
\begin{align*}
Y(z) &= \frac{2.1 - 1.9z^{-1}}{2.3 - 1.7z^{-1}} X(z)\\
2.3Y(z) - 1.7Y(z) z^{-1} &= 2.1X(z) - 1.9 X(z) z^{-1}\\
Y(z) &= \frac{1.7}{2.3} Y(z) z^{-1} + \frac{2.1}{2.3} X(z) - \frac{1.9}{2.3} X(z) z^{-1}\\
y_{k} &= 0.739 y_{k-1} + 0.913 x_{k} - 0.826 x_{k-1}
\end{align*}
$$

## Opgave 12.2
Find differensligningen for nedenstående regulator, og skriv pseudokoden for implementering af differensligningen i en microprocessor.
$$
G_{c}(s) = \frac{s + 10}{s + 30}
$$
Udregn for samplingstider på 0.1 sek. og 0.01 sek.
NB: Hvis du har lavet opgave 12.1, har du allerede differensligningerne.

For sampling tid $T_{s} = 0.01$
```pseudo-code
a0 = 0.913
a1 = -0.826
b1 = 0.739

Error_old = 0
ControlSignal_old = 0

Every Ts do
	Cr = getReference(); //Read reference
	C = getMeasurement();//Read Measurement from sensor
	Error = Cr-C; //Calculate error

	//Calculate new control signal
	ControlSignal = b1 * ControlSignal_old + a0*Error + a1*Error_old;
	
	SetControlSignal(ControlSignal); //Set control signal to actuator
	
	Error_old = Error; //Update variables
	ControlSignal_old = ControlSignal;
end
```

## Opgave 12.3
Find diskret overføringsfunktion (i ”z”) samt koefficienterne til implementering i PSoC filteret for følgende
regulator:
$$
G_{c}(s) = \frac{s + 10}{s + 30}
$$
Udregn for samplingstider på 0.1 sek. og 0.01 sek.
NB: Hvis du har lavet opgave 12.1, har du allerede de digitale overføringsfunktioner.

## Opgave 12.4
Skill-Assessment Exercise 13.3
Find den z-transformerede overføringsfunktion $G_{c}(z)$ for processen
$$
G(c)(s) = \frac{s + 10}{s + 30}
$$
som er sammensat med et zero-order sample and hold kredsløb. Sampling perioden er 250 ms.

## Opgave 12.5
(fra Skill-Assessment Exercise 13.9, Nise side 746)

Problem. A lead/proportional compensator was designed for a unity feedback system whose plant was
$$
G(s) = \frac{100}{s(s + 36)(s + 100)}
$$
The design specifications were as follows: Percent overshoot: 20 %, peak time = 0.1 second, and $K_{0} = 40$. In order to meet the requirements, the design yielded
* A proportilnal gain of $K_{p} = 1440$, and
* A lead compensator given by $G_{lead}(s) = 2.38 \frac{s + 25.3}{s + 60.2}$
The system is to be computer controlled.
* Choose the sampling frequency,
* find the discrete transfer function $G_{z}$ for the controller
* Simulate the discrete step response

