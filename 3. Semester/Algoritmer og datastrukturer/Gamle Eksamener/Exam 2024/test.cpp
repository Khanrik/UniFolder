#include <vector>
#include <iostream>

bool isCyclicRec(int v, std::vector<std::vector<int>> &graph, std::vector<bool> &visited, std::vector<bool> &recStack, const int N)
{
    if (visited[v] == false)
    {
        visited[v] = true;
        recStack[v] = true;
    }
    for (int i = 0; i < N; i++)
    {
        if (graph[v][i] != 0)
        {
            if (recStack[i])
            {
                return true;
            }
            if (!visited[i] && isCyclicRec(i, graph, visited, recStack, N))
            {
                return true;
            }
        }
    }
    // Remove the vertex from recursion stack
    recStack[v] = false;
    return false;
}

// Returns true if the graph contains a cycle, else false
bool isCyclic(std::vector<std::vector<int>> &graph, const int N)
{
    // Mark all the vertices as not visited
    // and not part of recursion stack
    std::vector<bool> visited(N, false);
    std::vector<bool> recStack(N, false);
    for (int v = 0; v < N; v++)
    {
        if (!visited[v] && isCyclicRec(v, graph, visited, recStack, N))
        {
            return true;
        }
    }
    return false;
}

int main()
{
    std::vector<std::vector<int>> graph = { {0,1,2,0,0}, 
                                            {0,0,2,0,0}, 
                                            {0,0,0,0,0}, 
                                            {0,0,0,0,4}, 
                                            {0,0,0,3,0}};
    std::cout << isCyclic(graph, graph.size()) << std::endl;

    return 0;
}