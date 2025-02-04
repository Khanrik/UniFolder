#include <stack>
#include <queue>
#include <iostream>

using namespace std;

bool trySort(queue<int> &q, queue<int> &result)
{
    stack<int> s;
    int value;
    while (!q.empty())
    {
        value = q.front();
        q.pop();

        if (!result.empty() && value > result.front() && value > s.top())
        {
            return false;
        }

        if (q.size() > 1 && value < q.front())
        {
            result.push(value);
        }
        else
        {
            s.push(value);
        }
    }
    while (!s.empty())
    {
        result.push(s.top());
        s.pop();
    }
    return true;
}

int main()
{
    queue<int> q;
    queue<int> result;
    q.push(5);
    q.push(1);
    q.push(2);
    q.push(6);
    q.push(3);
    q.push(4);

    cout << trySort(q, result) << endl;
    
    return 0;
}