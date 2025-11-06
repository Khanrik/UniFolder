:- use_module(library(clpfd)).

factorial(0, 1).
factorial(N, F) :- N #> 0, N1 #= N-1, factorial(N1, F1), F #= N * F1.