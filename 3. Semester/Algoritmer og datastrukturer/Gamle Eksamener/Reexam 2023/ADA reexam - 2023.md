## Opgave 1
### A
Der bliver udskrevet et træ som ser ud som således
```cout
  *
 ***
*****
```

### b
Funktionen består af 3 while løkker. Den yderste kører $h$ gange, hvor $h$ er input højden. Den første indre kører $h-l$ gange, hvor $l$ er mængden af linjer, hvilket skalerer med $h$. Den anden indre while-løkke kører $2l - 1$ gange. Samlet set bliver dette 
$$
h \cdot (2l-1 + h - l) = h \cdot (l - 1 + h) = hl - h + h^{2}
$$
Det kan her ses, at $h^{2}$ leddet vil dominere. Selvom $l$ går mod $h$ ville det ende med $2h^{2}$, hvilket alligevel svarer til den samme tidskompleksitet på $\mathcal{O}(h^{2})$.

### c
Der vil altid kun allokeres plads til de 4 variable: height, line, star og spaces. Da dette er uafhængig af input parameteren vil pladskompleksiteten være konstant eller $\mathcal{O}(1)$.

## Opgave 2
```c++
void changePriority(Comparable fromP, Comparable toP)
{
	vector<Comparable> tempList;
	
	for (; currentSize > 0; )
	{
		if (findMin() == fromP)
		{
			break;
		}

		Comparable minVal;
		deleteMin(minVal);
		tempList.push_back(minVal);
	}
	
	while (findMin() == fromP)
	{
		deleteMin();
		insert(toP);
	}
	
	for (auto val : tempList)
	{
		insert(val);
	}
}
```

## Opgave 3
### A
Ved brug at std::vector og std::pair samt Dictionary datastrukturen fra uge 4 i undervisningen er denne algoritme blevet udviklet
```c++
std::string mostUsedWord(std::string sentence)
{
    Dictionary<std::string, int> tracker;
    std::vector<char> word;
    std::pair<std::string, int> mostUsed = {"empty", 0};

    for (auto c : sentence)
    {
        if (!word.empty() && (c == '.' || c == ',' || c == ' '))
        {
            int count = 0;
            std::string newWord(word.begin(), word.end());
            
            if (tracker.contains(newWord))
            {
                count = tracker.get(newWord);
                tracker.remove(newWord);
            }
            
            count++;
            tracker.insert(newWord, count);
  
            if (count > mostUsed.second)
            {
                mostUsed.first = newWord;
                mostUsed.second = count;
            }
            
            word.clear();
        }
        else
        {
            word.push_back(c);
        }
    }
    return mostUsed.first;
}
```

### B
Antaget at alle de kaldte funktioner fra standardbiblioteket samt Dictionary klassen kører i konstant tid har algoritmen kun en for-løkke. Denne løkke går gennem hele string inputtet, hvilket svarer til en tidskompleksitet på $\mathcal{O}(n)$, hvor $n$ er længden af stringen.

## Opgave 4
Antaget at hashing funktionen er $H(x) = x\%11$, hvor $\%$ betegner modulo funktionen vil følgende ske:
* Der er kollision på indeks 1 så quadratic probing bruges
* Den skal i stedet indsættes i index $(1 + 1^{2})\%11 = 2$, men her er der også kollision, så quadratic probing bruges igen
* Den skal i stedet indsættes i index $(1 + 2^{2}) \% 11 = 5$, men her er der også kollision, så quadratic probing bruges igen
* Den skal i stedet indsættes i index $(1 + 3^{2}) \% 11 = 10$, da der ikke er kollision indsættes den.

Hvis elementet betegnes "element", vil hash-tabellen se ud som forneden efter indsættelsen

| index | værdi   |
| ----- | ------- |
| 0     | D       |
| 1     | H       |
| 2     | V       |
| 3     |         |
| 4     |         |
| 5     | P       |
| 6     |         |
| 7     | X       |
| 8     | E       |
| 9     |         |
| 10    | element |

## Opgave 5
### A
I et minimum spanning tree for den givne graf vil der være 7 knuder og 6 kanter.

### B
Rækkefølgen af kanternes inklusion er angivet i tegningerne (der er ikke angivet vægt).
#### a)
Starter algoritmen i knude b vil det se ud som således
![[ADA reexam - 2023 opg 5.B.a]]

Her kunne kanten mellem f og g også blive valgt før kanten mellem b og c, men det ville ende med samme træ.

#### b)
Bruges Kruskals algoritme istedet vil det se ud som således
![[ADA reexam - 2023 opg 5.B.b]]

Her kunne kanten mellem a og c også blive valgt før kanten mellem e og f, men det ville ende med samme træ. Ligeledes kunne kanten mellem f og g være blevet valgt før kanten mellem b og c.