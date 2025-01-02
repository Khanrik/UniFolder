Time was at ??:??:?? when i was done

## Opgave 1
### 1.
Antaget, at det er den naturlige logaritme funktion der er tale om vil den ydre for-løkke blive kørt n (8) gange, og den indre for-løkke vil blive kørt $\ln(8) \approx 3$ gange. Det betyder at den adderer 0, 1 og 2 til x, hvilket svarer til at addere 3. Resultatet vil da blive $8 \cdot 3 = 24$.

### 2.
#### a)
Ja, Lars har ret. Den ydre løkke kører $n$ gange, logaritme funktionen i sig selv tæller for $n$ tidskompleksitet, og den indre kører $\log(n)$ gange. Dette giver samlet $N \cdot N \cdot \log(N) = N^{2} \cdot \log(N)$ som Lars sagde.

#### b)
Peter ser at logaritme funktionen bliver kaldt en unødvendig mængde af gange, da den har så dårlig tidskompleksitet. I stedet kunne man sætte den udenfor løkkerne, så den kun blev kaldt en enkelt gang, hvilket ville ændre tidskompleksiteten til $\mathcal{O}(N + N \log(N)) = \mathcal{O}(N \log(N))$. Implementationen af dette ville se ud som således
```c++
int func1(int n)
{
    int x = 0;
    double logN = log(n);
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < logN; j++)
        {
            x = x + j;
        }
    }
    return x;
}
```

## Opgave 2
