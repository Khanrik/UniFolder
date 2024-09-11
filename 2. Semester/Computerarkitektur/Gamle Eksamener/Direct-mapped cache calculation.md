$M=64 \text{ memory bytes}$
$S=2 \text{ sets}$
$E=2 \text{ blocks per set}$
$B=4 \text{ bytes per block}$
$C=S \cdot E \cdot B=16 \text{ cache bytes}$

$s=\log_{2}(S)=1 \text{ set bits}$
$b=\log_{2}(B)=2 \text{ block bits}$
$m=\log_{2}(M)=6 \text{ bits per block}$
$t=m-(s+b)=3 \text{ tag bits}$

Reading 0 results in a cold miss, 
leading to the following cache:

| Set 1          |          |         |
| -------------- | -------- | ------- |
| Validation bit | Tag bits | Block   |
| 1              | 00       | M\[0-3] |
| 0              |          |         |

| Set 2          |          |       |
| -------------- | -------- | ----- |
| Validation bit | Tag bits | Block |
| 0              |          |       |
| 0              |          |       |

Reading 4 results in a cold miss, 
leading to the following cache:

| Set 1          |          |         |
| -------------- | -------- | ------- |
| Validation bit | Tag bits | Block   |
| 1              | 00       | M\[0-3] |
| 0              |          |         |

| Set 2          |          |         |
| -------------- | -------- | ------- |
| Validation bit | Tag bits | Block   |
| 1              | 00       | M\[4-7] |
| 0              |          |         |

Reading 6 results in a hit, 
leading to the following cache:

| Set 1          |          |         |
| -------------- | -------- | ------- |
| Validation bit | Tag bits | Block   |
| 1              | 00       | M\[0-3] |
| 0              |          |         |

| Set 2          |          |         |
| -------------- | -------- | ------- |
| Validation bit | Tag bits | Block   |
| 1              | 00       | M\[4-7] |
| 0              |          |         |

Reading 2 results in a hit, 
leading to the following cache:

| Set 1          |          |         |
| -------------- | -------- | ------- |
| Validation bit | Tag bits | Block   |
| 1              | 00       | M\[0-3] |
| 0              |          |         |

| Set 2          |          |         |
| -------------- | -------- | ------- |
| Validation bit | Tag bits | Block   |
| 1              | 00       | M\[4-7] |
| 0              |          |         |

Reading 10 results in a cold miss, 
leading to the following cache:

| Set 1          |          |          |
| -------------- | -------- | -------- |
| Validation bit | Tag bits | Block    |
| 1              | 00       | M\[0-3]  |
| 1              | 01       | M\[8-11] |

| Set 2          |          |         |
| -------------- | -------- | ------- |
| Validation bit | Tag bits | Block   |
| 1              | 00       | M\[4-7] |
| 0              |          |         |

Reading 17 results in a conflict miss, 
leading to the following cache:

| Set 1          |          |           |
| -------------- | -------- | --------- |
| Validation bit | Tag bits | Block     |
| 1              | 10       | M\[16-19] |
| 1              | 01       | M\[8-11]  |

| Set 2          |          |         |
| -------------- | -------- | ------- |
| Validation bit | Tag bits | Block   |
| 1              | 00       | M\[4-7] |
| 0              |          |         |

Reading 1 results in a conflict miss, 
leading to the following cache:

| Set 1          |          |          |
| -------------- | -------- | -------- |
| Validation bit | Tag bits | Block    |
| 1              | 00       | M\[0-3]  |
| 1              | 01       | M\[8-11] |

| Set 2          |          |         |
| -------------- | -------- | ------- |
| Validation bit | Tag bits | Block   |
| 1              | 00       | M\[4-7] |
| 0              |          |         |

Reading 7 results in a hit, 
leading to the following cache:

| Set 1          |          |          |
| -------------- | -------- | -------- |
| Validation bit | Tag bits | Block    |
| 1              | 00       | M\[0-3]  |
| 1              | 01       | M\[8-11] |

| Set 2          |          |         |
| -------------- | -------- | ------- |
| Validation bit | Tag bits | Block   |
| 1              | 00       | M\[4-7] |
| 0              |          |         |
