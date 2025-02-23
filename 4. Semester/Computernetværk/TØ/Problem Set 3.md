## Problem 1
### a)
192.1.2.0/25
R1: 192.1.2.0/25
R2: 192.1.2.128/25

### b)
It is R1 (192.1.2.0/25) since it is connected directly to the internet.

### c)
Replacing the R2 router with a bridge brings it to the physical layer instead of network layer. This means that the configuration does not change, but R2 no longer has an address.

### d)


## Problem 2
### a)
![[Computernetworks Week 3 Problem 2.a]]

### b)
The entire ethernet frame is
$$
1514 \text{ octets} = 12112 \text{ bits}
$$
The minimum interframe gap is
$$
20 \text{ Bytes} = 160 \text{ bits}
$$
The entire payload then requires
$$
1534 \frac{\text{Bytes}}{\text{packet}} = 12272 \frac{\text{bits}}{\text{packet}}
$$

The total throughput would be
$$
\frac{100\frac{\text{Mb}}{\text{s}}}{12272 \frac{\text{bits}}{\text{packet}}} = 8148.63 \frac{\text{packets}}{\text{s}}
$$


The 
