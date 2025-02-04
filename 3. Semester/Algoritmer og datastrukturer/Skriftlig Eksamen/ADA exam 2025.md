## Question 1
### 1.
**alg1** determines whether there are duplicates in the input array.
**alg2** gives an array containing the cumulative sum of all elements in the input array.
**alg3** sorts the input array in ascending order.

### 2.
**alg1:**
The outer for loop always runs $n$ iterations where $n$ is the size of the input array. The inner for loop changes for each iteration depending on the current iteration of the outer for loop. Tabulating it leads to the following pattern.

| Outer loop | Inner loop |
| ---------- | ---------- |
| 0          | n-1        |
| 1          | n-2        |
| 2          | n-3        |
| $\cdots$   | $\cdots$   |
| n-1        | n-n        |
The total worst case number of steps is then
$$
\sum^{n-1}_{i=0} n-i = \frac{1}{2} n (n + 1) = \frac{n^{2} + n}{2}
$$
Since there is no early exits, it will always take this many steps no matter what array of size $n$ is used as input.

<div style="page-break-after: always;"></div>

**alg2:**
There is a single for loop going through all $n$ elements of the array. The worst case number of steps would then be
$$
n
$$
There are again no early exits in the function, meaning that any array of size $n$, would trigger the worst case.

**alg3:**
Like in alg1, the outer loop in the worst case scenario iterates $n$ times, where $n$ is the size of the input array. The inner loop again depends on the outer loop, so it is again tabulated as follows

| Outer loop | Inner loop |
| ---------- | ---------- |
| 0          | n-1        |
| 1          | n-2        |
| 2          | n-3        |
| $\cdots$   | $\cdots$   |
| n-1        | n-n        |
This is the same table meaning that the worst case number of steps is also
$$
\frac{n^{2} + n}{2}
$$
There is an early exit in this function which is triggered if the array has been sorted. Since the algorithm sorts in ascending order, an input array of size $n$ sorted in descending order would therefore trigger the worst case number of steps ($\text{arr} = \{n, n-1, n-2, \dots, 2, 1\}$).

### 3.
**alg1** has a worst case time complexity of $\mathcal{O}(n^{2})$
**alg2** has a worst case time complexity of $\mathcal{O}(n)$
**alg3** has a worst case time complexity of $\mathcal{O}(n^{2})$

<div style="page-break-after: always;"></div>

## Question 2
### 1.
```c++
int countLonelyChildren(Node *root)
{
    int count = 0;
    if (root->left != nullptr) // recursive case 1
    {
        if (root->right == nullptr)
        {
            count++;
        }
        count += countLonelyChildren(root->left);
    }
    if (root->right != nullptr) // recursive case 2
    {
        if (root->left == nullptr)
        {
            count++;
        }
        count += countLonelyChildren(root->right);
    }
    return count; // base case
}
```

### 2.
This solution has 2 recursive cases, which are if it has a left child that has not been looked at, and if it has a right child that has not been looked at. 
The base case is then when all children have been explored. 
The counting works by incrementing the counter every time a parent has a child without a sibling, which is summed with the returned value when calling the function recursively with the children.

### 3.
Every time a root has children, the function will always be called recursively with the child as input. This leads to the function being called $n$ times where $n$ is the amount of nodes in the tree. The worst case time complexity will then be $\mathcal{O}(n)$.

<div style="page-break-after: always;"></div>

## Question 3
### 1.
Inserting 10 gives 
$h(10) = 10 \cdot 31 = 310$

Since the size of the table is 7, it leads to the index
$310 \% 7 = 2$

Index 2 is empty, so the element is inserted. The state of the table then becomes

| Index | 0   | 1   | 2   | 3   | 4   | 5   | 6   |
| ----- | --- | --- | --- | --- | --- | --- | --- |
| State | E   | O   | O   | E   | D   | O   | E   |

### 2.
Inserting 5 leads to the index
$h(5) \% 7 = 155 \% 7 = 1$
This index is occupied so linear probing is used
$(h(5) + 1) \% 7 = 2$
This index is also occupied so linear probing is used
$(h(5) + 2) \% 7 = 3$
Index 3 is empty, so the element is inserted. The state of the table then becomes

| Index | 0   | 1   | 2   | 3   | 4   | 5   | 6   |
| ----- | --- | --- | --- | --- | --- | --- | --- |
| State | E   | O   | O   | O   | D   | O   | E   |
### 3.
It is possible. If an element with $c=31$ is inserted into table, it would fit into the following index
$h(31) \% 7 = 403 \% 7 = 4$
It can be seen that the element in index 4 has been deleted, but if the element with $c=31$ was hypothetically inserted before the deletion, it would have to do linear probing, leading to index.
$(h(31) + 1) \% 7 = 5$
Index 5 is indeed occupied, so it could be where the element with $c=31$ is stored. 

<div style="page-break-after: always;"></div>

## Question 4
### 1.
```
{ 3, 1, 4, 1, 5, 9, 2 } // Initial arr

// outer for loop iteration 1 (i = 0)
{ 1, 3, 4, 1, 5, 9, 2 } // 3 and 1 swap since 3 > 1
{ 1, 3, 1, 4, 5, 9, 2 } // 4 and 1 swap since 4 > 1
{ 1, 3, 1, 4, 5, 2, 9 } // 9 and 2 swap since 9 > 2

// outer for loop iteration 2 (i = 1)
{ 1, 1, 3, 4, 5, 2, 9 } // 3 and 1 swap since 3 > 1
{ 1, 1, 3, 4, 2, 5, 9 } // 5 and 2 swap since 5 > 2

// outer for loop iteration 3 (i = 2)
{ 1, 1, 3, 2, 4, 5, 9 } // 4 and 2 swap since 4 > 2

// outer for loop iteration 4 (i = 3)
{ 1, 1, 2, 3, 4, 5, 9 } // 3 and 2 swap since 3 > 2

// outer for loop iteration 5 (i = 4)
No swapping occured so the function breaks
```

<div style="page-break-after: always;"></div>

### 2.
```c++
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
    // print N elements
    for (int i = 0; i < N; i++)
    {
        cout << i << ", ";
    }
    cout << endl;
}
```

<div style="page-break-after: always;"></div>

## Question 5
### 1.
The given graph is a connected digraph consisting of 10 nodes or vertices and 20 edges. Each node in the graph is identified by a page number. The edges form cycles between the nodes, meaning that the graph is not acyclic. As shown in the image there are no weights, but it might be weighted based on the ranking algorithms of the search engine.

### 2.
I would pick the adjacency matrix over the list since the most important aspect of its use case is the speed when retrieving. The graph is also dense and has potential to become denser, which adjacency matrices are perfect for. Adjacency lists have better time complexity when storing new web pages in the form of nodes, but since this can be done independently from user queries it is not important. 

### 3.
The breadth first search algorithm would be very suitable. This algorithm is capable of traversing the entire unweighted graph just like dfs, but it can also tracks the distance to each node from the source. It is not necessary but could come in handy, if the distance between nodes/web pages were to be used as a heuristic for the search engine algorithm in the future.

### 4.
Since the adjacency matrix holds onto every page and their connections, a simple iteration through a row of the matrix while keeping count of connections will give the rank of a given page. The pseudo code for this function could look as follows:
```pseudo code
// function returns a rank given a page and the matrix it is in
int GetRank(page : index of page, matrix : adjacency matrix):
	int counter
	node = matrix[page]
	for each connection in node:
		if connection exists:
			counter++
	return counter
```

To build the table you then have to call every page in a loop giving you the rank, which you can then input in the table of pages.

### 5.
To enable fast searching, it would be beneficial to use maps or dictionaries. These allow for identifying each topic with a unique string, where the pages will then be the corresponding values. The pages themselves should be stored in a pair with their rank, which is then stored in a vector enabling a single topic to correspond to multiple pages. The pseudo code for this could look as follows:

```pseudo code
TopicDictionary = {
	topic = {{page, rank}, {page, rank}, ...}
}

// returns an ordered list of 
GetTopic(topic):
	vector rankedPages
	for each pagePair in TopicDictionary[topic]:
		add pagePair.page to rankedPages
	return rankedPages

// updates the rank of a specific page for a given topic
UpdateRank(topic : string containing query, page : page you want updated, rank : new rank):
	newPagePair = {page, rank}
	for each pagePair in TopicDictionary[topic]:
		if page == pagePair.page:
			deleted pagePair from vector
		if rank > pagePair.rank:
			add newPagePair before pagePair
```

To use this algorithm you do as follows:
```pseudo code
UpdateRank("Horse Breed", 9, 3) // adding/updating the page rank
pages = GetTopic("Horse Breed) // retrieving the pages again
```

The search time complexity of this algorithm would not depend on the amount of topics, since they are stored in a dictionary, but will depend on the amount of pages for each given topic. Since there is a single loop going through all pairs it would be a linear time algorithm with search time complexity $\mathcal{O}(n)$ where $n$ is the number of pages that the given topic corresponds to.
