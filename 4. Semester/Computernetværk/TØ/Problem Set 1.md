## Problem 1 | Manchester code

### a)
![[Computer Network Problem 1.1.a]]

### b)
Since both the NRZ and NRZI encodings only have at most one transition per bit, which means that the baud or number of signals/symbols you send with these encodings is the same as the number of input bits. The bit to baud ratio would then be 100%.

The Manchester encoding will always represent 0 bits as a transition to high then low and vice versa for 1 bits. This means that each bit leads to two transitions or two baud per bit, which makes the ratio 50%.

The 4b/5b encoding sections input bits into groups of 4. These are then converted to five bits, which each correspond to a transition or lack thereof. This means that each 4 bits lead to 5 baud, which makes the ratio $\frac{4}{5} = 80\%$.

## Problem 2 | Propagation delay
### a)
In the worst case scenario the maximal length of cable and amount of each component will be used. Since there are two stations and a maximal of two repeaters, there will be 

## Problem 3 | Cyclic Redundancy check
### a)
