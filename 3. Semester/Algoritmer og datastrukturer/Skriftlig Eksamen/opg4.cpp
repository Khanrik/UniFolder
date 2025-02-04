#include <vector>
#include <iostream>
using namespace std;

void alg3(vector<int> &arr, int N)
{
    size_t n = arr.size();
    for (size_t i = 0; i < n; i++)
    {
        bool swapped = false;
        for (size_t j = 0; j < n - i - 1; j++)
        {
            if (arr[j] > arr[j + 1])
            {
                swap(arr[j], arr[j + 1]);
                swapped = true;
            }
            if (!swapped && j >= N-1)
            {
                break;
            }
        }
        if (!swapped)
            break;
    }

    for (int i = 0; i < N; i++)
    {
        cout << i << ", ";
    }
    cout << endl;
}

int main()
{
    vector<int> test = {0, 1, 4, 5, 2, 1, 6, 7, 1, 7, 8};
    for (auto i : test)
    {
        cout << i << ", ";
    }
    cout << endl;
    alg3(test, 3);
    for (auto i : test)
    {
        cout << i << ", ";
    }
    return 0;
}