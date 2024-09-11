## 1. Discuss and solve Practice Problem 6.9 (page 652)
The following table gives the parameters for a number of different caches. For each cache, determine the number of cache sets (S), tag bits (t), set index bits (s), and block offset bits (b).

| Cache | m   | C    | B   | E   | S                           | t                  | s                 | b                 |
| ----- | --- | ---- | --- | --- | --------------------------- | ------------------ | ----------------- | ----------------- |
| 1.    | 32  | 1024 | 4   | 1   | $\frac{C}{B \cdot E} = 256$ | $m - (b + s) = 22$ | $\log_{2}(S) = 8$ | $\log_{2}(B) = 2$ |
| 2.    | 32  | 1024 | 8   | 4   | $\frac{C}{B \cdot E} = 128$ | $m - (b + s) = 22$ | $\log_{2}(S) = 7$ | $\log_{2}(B) = 3$ |
| 3.    | 32  | 1024 | 32  | 32  | $\frac{C}{B \cdot E} = 32$  | $m - (b + s) = 22$ | $\log_{2}(S) = 5$ | $\log_{2}(B) = 5$ |

### Note to self
![[Pasted image 20240515112817.png]]

## 2. Read the blue Aside box “Why index with the middle bits?” on page 659

## 3. Discuss and solve Practice Problems 6.10
In the previous dotprod example, what fraction of the total references to x and y will be hits once we have padded array x?

Both x and y will have a cache miss when first accessing a memory block as well as when loading into the next set block. This leads to a total of 2 misses out of 8 calls. The fraction of total hits for both will then be $\frac{6}{8}$ or $\frac{3}{4}$.

## 4. Discuss and solve any two of Practice Problems 6.12, 6.13, 6.14 or 6.15
### Practice Problem 6.12
![[Pasted image 20240514225043.png]]

s=3, b=2, m=13, t=8

| CT  | CT  | CT  | CT  | CT  | CT  | CT  | CT  | CI  | CI  | CI  | CO  | CO  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |


### Practice Problem 6.13
Suppose a program running on the machine in Problem 6.12 references the 1-byte word at address 0x0D53. Indicate the cache entry accessed and the cache byte
![[Pasted image 20240514225229.png]]

### A. Address format (1 bit per box):

| 0   | 1   | 1   | 0   | 1   | 0   | 1   | 0   | 1   | 0   | 0   | 1   | 1   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |

### B. Memory reference:
| Parameter               | Value  |
| ----------------------- | ------ |
| Cache block offset (CO) | 0x03   |
| Cache set index (CI)    | 0x04   |
| Cache tag (CT)          | 0x6A   |
| Cache hit? (Y/N)        | N      |
| Cache byte returned     | \_____ |

### Practice problem 6.14
![[Pasted image 20240514225254.png]]

### A. Address format (1 bit per box):

| 0   | 1   | 1   | 0   | 0   | 1   | 0   | 1   | 1   | 0   | 1   | 0   | 0   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |

### B. Memory reference:
| Parameter               | Value  |
| ----------------------- | ------ |
| Cache block offset (CO) | 0x00   |
| Cache set index (CI)    | 0x05   |
| Cache tag (CT)          | 0x65   |
| Cache hit? (Y/N)        | N      |
| Cache byte returned     | \_____ |


### Practice Problem 6.15
![[Pasted image 20240514225322.png]]
![[Pasted image 20240514225336.png]]

### A. Address format (1 bit per box):

| 0   | 1   | 0   | 1   | 0   | 0   | 0   | 1   | 1   | 0   | 0   | 0   | 1   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |

### B. Memory reference:
| Parameter               | Value  |
| ----------------------- | ------ |
| Cache block offset (CO) | 0x01   |
| Cache set index (CI)    | 0x04   |
| Cache tag (CT)          | 0x51   |
| Cache hit? (Y/N)        | N      |
| Cache byte returned     | \_____ |

## 5. Discuss and solve Practice Problem 6.17 (and expect this kind of problem at the exam!) 
![[Pasted image 20240514225442.png]]
![[Pasted image 20240514225454.png]]

### A. For each row and col, indicate whether the access to src\[row]\[col] and dst\[row]\[col] is a hit (h) or a miss (m). For example, reading src\[0]\[0] is a miss and writing dst\[0]\[0] is also a miss.

|       | dst array |        |       | src array |        |
| ----- | --------- | ------ | ----- | --------- | ------ |
|       | Col. 0    | Col. 1 |       | Col. 0    | Col. 1 |
| Row 0 | m         |        | Row 0 | m         |        |
| Row 1 |           |        | Row 1 |           |        |

## 6. Discuss and solve Practice Problem 6.18, and one of 6.19 or 6.20
### Practice Problem 6.18
![[Pasted image 20240514225608.png]]
![[Pasted image 20240514225619.png]]

### Practice Problem 6.19
![[Pasted image 20240514225636.png]]

### Practice Problem 6.20
![[Pasted image 20240514225649.png]]
![[Pasted image 20240514225657.png]]
