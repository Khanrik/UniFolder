## Question 1: Algorithm Analysis
### 1.
In the first iteration of the while loop, each iteration of the for loop does the following
Iteration 1:
- Check 2 > 4
- Check 7 > 1
	- swap 7 and 1
Iteration 2:
- Check 4 > 3
	- Swap 4 and 3
- Check 4 > 1
	- Swap 4 and 1
Iteration 3:
* Check 1 > 4
* Check 3 > 1
	* Swap 3 and 1
Iteration 4:
* Check 4 > 7
* Check 2 > 1
	* Swap 1 and 2

The second iteration of the while loop then does the following in the for loop
Iteration 1:
- Check 1 > 2
- Check 4 > 7
Iteration 2:
- Check 2 > 3
- Check 3 > 4
Iteration 3:
* Check 3 > 4
* Check 2 > 3
Iteration 4:
* Check 4 > 7
* Check 1 > 2

Since no swap happens, the algorithm breaks out of the while loop.

### 2.
The algorithm orders the elements of A in ascending order.

### 3.
The algorithm works by ordering the smallest and largest unordered elements in each iteration of the while loop. In the case of question 1.1 ordering the element 1 also orders 7, so the largest unordered element becomes 4. Each iteration of the while loop takes $n-1$ steps because of the for loop and since it orders the elements in pairs, it would have to do it $\frac{n}{2}$ times. The maximal times a given $A$ of size $n$ would then be
$$
(n-1) \cdot \frac{n}{2} = \frac{n^{2} - n}{2}
$$

### 4.
Since it orders them in ascending order, the array triggering the maximum number of steps would be an array ordered in descending order.

### 5.
Since the mathematical worst case expression was found in question 1.3, it can be used to find the worst case time complexity. In the expression the $\frac{n^{2}}{2}$ term would dominate the $\frac{n}{2}$ term, and the $n^{2}$ factor would dominate $\frac{1}{2}$. This results in a worst case time complexity of $\mathcal{O}(n^{2})$, where $n$ is the size of the input array $A$.

### 6.
```pseudocode
procedure MyAlgorithm(A : list of integers)
	n := length(A)
	assert n>1
	swapped := true
	while swapped do
		swapped := false
		for i := 1 to n-1 inclusive do
			if A[i-1] > A[i] then
				swap(A[i-1], A[i]) 
				swapped := true 
			end if 
			if A[n-i-1] > A[n-i] then
				swap(A[n-i-1], A[n-i]) 
				swapped := true 
			end if 
		end for 
	end while 
end procedure
```

## Question 2: Recursion
### 1.
The algorithm would do the following
Iteration 1:
* Visit node 0, and add to recstack
	* Visit node 1, and add to recstack
		* Visit node 2, and add to recstack
			* Visit node 4, and add to recstack
				* Visit node 1
				* See it is already in the recstack
				* Return true
			* Return true
		* Return true
	* Return true
* Return true

Since there is a cycle that can be accessed from node 0 in the way described above, it will never visit node 3.

### 2.
The base case is when the algorithm visits a new node, which is connected to a node that is already in the recursive stack. This can be seen implemented in the helper function as
```c++
if (recStack[i])
{
	return true;
}
```

### 3.
The recursive case is when the algorithm visits a new node which is connected to a node that has not yet been visited. This can be seen implemented in both the main and helper function as
```c++
if (!visited[i] && isCyclicRec(i, graph, visited, recStack, N))
{
	return true;
}
```

### 4.
It should work fine for disconnected graphs. This is due to the main function calling the helper function for every node of the graph, no matter if it is disconnected or not. 

## Question 4: Binary tree-based data structure
### 1.
An AVL tree would be best, since it can be used to order the users in a way, where it is easy to retrieve any number of the top influential users. Since it is an AVL tree it would also be computationally easy to retrieve the users after having inserted them with their respective influential.

### 2.
![[ADA exam 2024 question 4.2]]

### 3.
Since it is an AVL tree, it has been taught in class that the worst-case time complexity of any operation would be $\mathcal{O}(\log(N))$.

## Question 5: Graph
### 1.
Each node could be represented with a vector containing all user who follow the user represented by the node. The users would then be represented as enumerated types, so their username can correspond to an index. For instance the vector representing Alice would be
```c++
enum user {Alice, Bob, Charlie, David, Eve, Frank};
vector<user> alice = {Bob, Eve};
```

### 2.
A cycle means that a user, for instance Alice, follows a person, in this case David, who follows people creating a chain back to one of the original users followers, in this case Bob being a follower of Alice. If a user in a cycle posts something, their follower can repost it in a chain that leads to the original user seeing their own post being reposted by another user.

### 3.

The adjacency matrix would look like the one below.

|         | Alice | Bob | Charlie | David | Eve | Frank |
| ------- | ----- | --- | ------- | ----- | --- | ----- |
| Alice   | 0     | 1   | 0       | 0     | 1   | 0     |
| Bob     | 0     | 0   | 1       | 0     | 0   | 0     |
| Charlie | 0     | 0   | 0       | 1     | 0   | 0     |
| David   | 1     | 0   | 0       | 0     | 0   | 0     |
| Eve     | 0     | 0   | 0       | 0     | 0   | 1     |
| Frank   | 0     | 0   | 0       | 0     | 1   | 0     |

### 4.
Since the user represented by number 1 has most outgoing arrows, meaning that the user has the most followers who will see when the user posts something. The company will then get the most amount of people who has seen their product if they approach user 1. Assuming that the nodes are stored as described in question 5.1, the algorithm will be a simple for loop such the one below

```pseudocode
findBestUser(userList : list of all users stored in the vector<user> format):
	bestUser := userList[0]
	for user in userList:
		if length of user > length of bestUser
			bestUser = user
			
	return bestUser
```

### 5.
The user who has the highest chance of reaching the most people can be calculated as the sum of all percentage chances of reaching the next user in the following chain. For instance user 1 would have a 100% chance of reaching user 2, 10, and 14, giving a sum of 300%. These percentages do not make statistical sense, but is used as a heuristic. User 2 then has a 50% chance of reposting to user 18, who subsequently has a 25% chance of reposting to users 12 and 14. The pseudo code for this algorithm will be as follows
```pseudo code
// helper function
getPercentage(user, userList):
	percentage := 0
	if !user.hasFollower:
		

// main function
findBestUserPercentage(userList : list of all users stored in the vector<user> format):
	bestUser := userList[0]
	bestPercentage := 0
	
	for user in userList:
		percentage = getPercentage(user, userList)
		if percentage > bestPercentage
			bestUser = user
			bestPercentage = percentage
			
	return bestUser
```


$$
\sum_{i=0}^{n/2} (2*(n-i)/2 + 1*(n+i)/2)
$$