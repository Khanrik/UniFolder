## 2. Discuss and solve Practice Problem 6.2 on page 628
What is the capacity of a disk with 3 platters, 15,000 cylinders, an average of 500 sectors per track, and 1,024 bytes per sector?

$$
\begin{align}
\text{Capacity} & = (\frac{\text{\# bytes}}{\text{sector}}) \cdot (\frac{\text{avg. \# sectors}}{\text{track}}) \cdot (\frac{\text{\# tracks}}{\text{surface}}) \cdot (\frac{\text{\# surfaces}}{\text{platter}}) \cdot (\frac{\text{\# platters}}{\text{disk}}) \\
 & = 1024 \cdot 500 \cdot 15000 \cdot 2 \cdot 3 \\
 & = 46.08 \cdot 10^{9} \text{ B} = 46.08 \text{ GB} 
\end{align}
$$

### a. Optional homework: 6.3 and 6.4

## 3. Discuss and solve Practice Problem 6.5
As we have seen, a potential drawback of SSDs is that the underlying flash memory can wear out. For example, for the SSD in Figure 6.14, Intel guarantees about 128 petabytes ($128 \cdot 10^{15}$ bytes) of writes before the drive wears out. Given this assumption, estimate the lifetime (in years) of this SSD for the following workloads:
#### A. Worst case for sequential writes: The SSD is written to continuously at a rate of 470 MB/s (the average sequential write throughput of the device).
$$
\begin{align}
n & = \frac{128 \text{ PB}}{470 \text{ MB/s}} \\
 & = \frac{128 \cdot 10^{9} \text{ MB}}{470 \text{ MB/s}} \\
 & = 2.723 \cdot 10^{8} \text{ s} \\
 & = 8.635 \text{ years}
\end{align}
$$

### B. Worst case for random writes: The SSD is written to continuously at a rate of 303 MB/s (the average random write throughput of the device).
$$
\begin{align}
n & = \frac{128 \cdot 10^{9} \text{ MB}}{303 \text{ MB/s}} \\
 & = 4.224 \cdot 10^{8} \text{ s} \\
 & = 13.39 \text{ years}
\end{align}
$$

### C. Average case: The SSD is written to at a rate of 20 GB/day (the average daily write rate assumed by some computer manufacturers in their mobile computer workload simulations)
$$
\begin{align}
n & = \frac{128 \cdot 10^{6} \text{ GB}}{20 \text{ GB/day}} \\
 & = 5.53 \cdot 10^{11} \text{ s} \\
 & = 17536 \text{ years}
\end{align}
$$

## 4. Solve the Programming Exercise below
Write a simple C program that measures runtime of the functions sumarrayrows and sumarraycols, shown in Figures 6.18 and 6.19 (p.642). Use the source code below to start. 

Your program should run both functions on a square matrix (2D array), measure and print the execution times in milliseconds for comparison. It should take the size of one dimension of the array as a program argument (e.g. if 100 is given, calculate the sum of elements of a 100x100 array). 

(Don’t forget to set the -O0 compiler flag, to disable optimizations which may result in reorganizing the lines in the functions) 

Test the program with the following sizes: 
* 10, 50, 100, 500, 1000
* 2000, 5000, 10.000, 20.000

### 1. What are the runtimes of the two sum functions for each array size? Which one is faster? Why?
| Array Dimension | Rows \[ms] | Columns \[ms] |
| --------------- | ---------- | ------------- |
| 10              | 0          | 0             |
| 50              | 0          | 0             |
| 100             | 0          | 0             |
| 1000            | 3          | 3             |
| 2000            | 5          | 18            |
| 5000            | 34         | 156           |
| 10000           | 191        | 667           |
| 20000           | 751        | 10553         |

Everything from 10-500 are the same, so neither are faster. At 1000 there are some differences, where either could be faster, since the arrays are too small to make randomness negligible. From 2000 and up rows are far superior. This makes sense since it has better locality.

### 2. Why do the 2000+ runs fail? Could you recommend a solution?
Because there is not enough memory to store that many elements in cache. A fix could be to use dynamic memory allocation.

### 3. What happens to the runtime when compiler optimization is turned on? Why?
It improves every bit of code, so all the bad locality is fixed and everything else it rewritten so its not stupid. The runtime is therefore a lot faster.

## 5. Discuss and solve Practice Problems 6.7
Permute the loops in the following function so that it scans the three-dimensional array $a$ with a stride-1 reference pattern.
```c
int productarray3d(int a[N][N][N]) 
{
	int i, j, k, product = 1;
	
	for (i = N-1; i >= 0; i--) {
		for (j = N-1; j >= 0; j--) {
			for (k = N-1; k >= 0; k--) {
				product *= a[j][k][i];
			}
		}
	}
	return product;
}
```

Solution:
```c
int productarray3d(int a[N][N][N]) 
{
	int i, j, k, product = 1;
	
	for (j = N-1; j >= 0; j--) {
		for (k = N-1; k >= 0; k--) {
			for (i = N-1; i >= 0; i--) {
				product *= a[j][k][i];
			}
		}
	}
	return product;
}
```

### a. Optional homework: 6.8
