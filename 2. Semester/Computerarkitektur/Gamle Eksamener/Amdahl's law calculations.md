$$
S = \frac{1}{(1 - \alpha) + \frac{\alpha}{k}}
$$
where $\alpha$ is the fraction of the systems execution time that the single component requires to execute, and $k$ is the factor by which the performance of that component has been improved.

$$
S = \frac{1}{0.33 + \frac{0.67}{8}} = 2.42
$$

$$
S = \frac{1}{0.33 + \frac{0.67}{16}} = 2.69
$$


$$
k = \frac{\alpha}{\frac{1}{S} + (\alpha - 1)}
$$
$$
k = \frac{0.67}{\frac{1}{1.5} - 0.33} = 1.99 \approx 2 \text{ cores} 
$$