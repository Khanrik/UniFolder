
n = 15
p = 0.65

# a P(X = 11)
dbinom(11, n, p)

# b P(X >= 10)
1 - pbinom(9, n, p)

# c 
pbinom(11, n, p) - pbinom(7, n, p)
