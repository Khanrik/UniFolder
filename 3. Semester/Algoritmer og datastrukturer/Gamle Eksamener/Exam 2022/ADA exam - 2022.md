Time was at 01:11:17 when i was done

## Opgave 1
func1 har et for loop, som iterer n gange. I selve funktionen kaldes func2, som også iterer n gange. Tidskompleksiteten bliver da $\mathcal{O}(n \cdot n) = \mathcal{O}(n^{2})$

## Opgave 2
```c++
int sumDivisibleBy3(int N)
{
    int sum = 0;
    
    if (N < 3)  // base case 1
    {
	    return sum;
    }
    else if (N == 3) // base case 2
    {
        return sum + 3;
    }
    else if (N%3 == 0) // rekursiv case 1
    {
        sum += N;
        return sum + sumDivisibleBy3(N-3);
    }
    else // rekursiv case 2
    {
	    return sum + sumDivisibleBy3(N-1);
    }
}
```

## Opgave 3
**Postorder traversering:**
1-8-5-15-12-10-22-20-28-30-38-45-50-48-40-36-25

**Preorder taversering:**
25-20-10-5-1-8-12-15-22-36-30-28-40-38-48-45-50

**Internal path length:**
41

**Er det et AVL-træ?**
Nej, det er ikke et AVL-træk da 20 ikke er balanceret. Denne node har en balance faktor på -2, hvilket er numerisk større end 1.

**Indsæt min alder**
Min alder er 20, så jeg skal indsætte tallet 40. Træet vil da se ud som således
![[Pasted image 20250101131041.png]]

## Opgave 4
```c++
int findMedian(MaxHeap heap)
{
	int median;
	int n = heap.size();
	int middle = n/2 + 1
	
	for (int n; i <= middle; n--)
	{
		heap.deleteMax();
	}
	
	median += heap.findMax();

	if (n%2 == 0)
	{
		heap.deleteMax();
		median = (median + heap.findMax()) / 2;
	}
	
	return median;
}
```

Da der kun er et enkelt for loops i funktionen vil den bestemme tidskompleksiteten. Da den kører fra heap størrelsen $n$ ned til medianen vil det svare til at iterere $\frac{n}{2} - 1$ gange. Her vil $n$ dog dominere båden $\frac{1}{2}$ og $-1$. Den endelige tidskompleksitet bliver da $\mathcal{O}(n)$.

## Opgave 5
```c++
template <typename T>
std::vector<T> partitionEvenOdd(std::vector<T> &arg) // returnerer en vektor hvor alle lige elementer er før alle ulige elementer
{
    int oddIndex = -1;

    for (int i = 0; i < arg.size(); i++)
    {
        if (oddIndex == -1 && arg[i] % 2 == 1)
        {
            oddIndex = i;
        }
        else if (oddIndex != -1 && arg[i] % 2 == 0)
        {
            std::swap(arg[i], arg[oddIndex]);
            oddIndex++;
        }
    }
    return arg;
}
```

Det kan ses, at algoritmen kun har en enkelt for loop og ikke laver nogen rekursive kald. For loopet itererer fra $i=0$ til $i=N$, hvor $N$ er størrelsen af arg. Den vil da have en tidskompleksitet på $\mathcal{O}(N)$.

<div style="page-break-after: always;"></div>

## Opgave 6
Det givne array kan godt repræsentere en prioritetskø. Hvert element i arrayet (udover det første) er identificeret af et index fra 1 til 20 så det kan tilgås, og har en tilhørende prioritet, hvis elementets værdi ses som prioriteten. Når elementet med højst prioritet skal slettes skal et for loop bruges for at gennemgå alle elementerne. Hvis man ønsker, at beholde mere information i prioritetskøen skal man bruge et array af par i stedet for heltal.

## Opgave 7
**Verificer hashtabellen:**
Hashtabellen er lavet rigtigt. Det følges således, hvor % anvendes som modulo operatoren.
$22\%11 = 0$, da 0 er ledig indsættes 22 på index 0.
$5\%11 = 5$, da 5 er ledig indsættes 5 på index 5.
$15\%11 = 5$, da 5 ikke er ledig bruges quadratic probing
$(15 + 1^{2}) \% 11 = 6$, da 6 er ledig indsættes 16 på index 6.
$27\%11 = 5$, da 5 ikke er ledig bruges quadratic probing
$(27 + 1^{2}) \%11 = 6$, da 6 ikke er ledig bruges quadratic probing
$(27 + 2^{2}) \%11 = 9$, da 9 er ledig indsættes 27 på index 9.

**Indsæt 1:**
$1\%11 = 1$, da 1 er ledig indsættes 1 på index 1.

**Indsæt 12:**
$12\%11 = 1$, da 1 ikke er ledig bruges quadratic probing
$(12 + 1^{2}) \% 11 = 2$, da 2 er ledig indsættes 12 på index 2.

**Indsæt alder:**
Min alder er 20 år.
$20\%11 = 9$, da 9 ikke er ledig bruges quadratic probing
$(20 + 1^{2}) \% 11 = 10$, da 10 er ledig indsættes 20 på index 10.

**Indsæt studienummer:**
Mit studienummer er 202307381
$202307381\%11 = 1$, da 1 ikke er ledig bruges quadratic probing
$(202307381 + 1^{2}) \% 11 = 2$, da 2 ikke er ledig bruges quadratic probing
$(202307381 + 2^{2}) \% 11 = 5$, da 5 ikke er ledig bruges quadratic probing
$(202307381 + 3^{2}) \% 11 = 10$, da 10 ikke er ledig bruges quadratic probing
$(202307381 + 4^{2}) \% 11 = 6$, da 6 ikke er ledig bruges quadratic probing
$(202307381 + 5^{2}) \% 11 = 4$, da 4 er ledig indsættes 202307381 på index 4.

Til slut kommer hashtabellen da til at være

| Index | Value     |
| ----- | --------- |
| 0     | 22        |
| 1     | 1         |
| 2     | 12        |
| 3     |           |
| 4     | 202307381 |
| 5     | 5         |
| 6     | 16        |
| 7     |           |
| 8     |           |
| 9     | 27        |
| 10    | 20        |
