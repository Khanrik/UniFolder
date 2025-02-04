#include <vector>
using namespace std;

bool alg1(const vector<int> &arr)
{
    int count = 0;
    for (size_t i = 0; i < arr.size(); i++)
    {
        for (size_t j = i + 1; j < arr.size(); j++)
        {
            if (arr[i] == arr[j])
            {
                count++;
            }
        }
    }
    return count > 0;
}
vector<int> alg2(const vector<int> &arr)
{
    vector<int> prefixSums;
    int total = 0;
    for (int num : arr)
    {
        total += num;
        prefixSums.push_back(total);
    }
    return prefixSums;
}
void alg3(vector<int> &arr)
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
        }
        if (!swapped)
            break;
    }
}