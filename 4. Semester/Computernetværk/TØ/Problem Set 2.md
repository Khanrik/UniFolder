## Problem 1 | Ethernet channel utilization
### a)
Data transmission time is given as 5 time slots. The time used in total would then be the time it takes a station to sort out who transmits ($\frac{N}{2}$) added to the transmission time.
$$
U = \frac{\text{transmission time}}{\text{total time}} = \frac{5}{\frac{N}{2} + 5}
$$

### b)
The more stations there are the less efficient the communication through the channel will be. This makes sense since more stations would mean more contention taking up more time for contention in total.
![[Pasted image 20250214105710.png]]

## Problem 2
### a)
Since we can use the entire NIC address space, there are $m = 2^{24}$ unique addresses. This means that the first address assigned has a 100% chance of being unique or $\frac{m}{m}$ probability. The next $i$ addresses in line would then be
$$
P(\text{unique}) = \frac{m - i}{m}
$$
The probability of having 1024 unique addresses for each station would then be
$$
P_{\text{1024 unique}} = \prod^{1023}_{i=0} \frac{2^{24} - i}{2^{24}} = 0.9693
$$

The probability of having at least one duplicate would then be the complement probability
$$
P_{\text{at least 2 same}} = 1 - 0.9693 = 0.0307
$$

### b)
If there are $n$ stations with probability $p$ of transmitting at any moment. The product of the probability of one of them transmitting and the probability of none of the others transmitting. The probability of one transmission is $p$, while the probability of none of the others transmitting is $(1-p)^{n-1}$. To accommodate for every single station $n$ is multiplied to that product. The final probability of only one transmission will then be
$$
P_{\text{single transmission}} = n \cdot (p \cdot (1 - p)^{n-1})
$$

### c)
![[Pasted image 20250214113515.png]]

## Problem 3
### a)
There are 4 loops:
* B1 -> B3 -> B2 -> B7 -> B1
* B1 -> B3 -> B5 -> B2 -> B7 -> B1
* B2 -> B3 -> B5 -> B2
* B3 -> B4 -> B6 -> B3

### b)
The root bridge is assumed to be B3 since it is placed in the center of the network. To keep the clients connected the only ports which can be removed are A or E, D or F, G or H, and J. Every port not removed would be selected.

##
