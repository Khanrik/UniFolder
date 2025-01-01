#include <iostream>
#include <vector>

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

int main()
{
    std::vector<int> test;
    test.push_back(1);
    test.push_back(2);
    test.push_back(3);
    test.push_back(4);
    test.push_back(5);
    test.push_back(6);
    test.push_back(7);

    for (int i = 0; i < test.size(); i++)
    {
        std::cout << test[i] << std::endl;
    }

    std::cout << std::endl << "WHITESPACE" << std::endl << std::endl;

    test = partitionEvenOdd(test);
    for (int i = 0; i < test.size(); i++)
    {
        std::cout << test[i] << std::endl;
    }
    return 0;
}