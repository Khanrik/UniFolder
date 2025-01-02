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