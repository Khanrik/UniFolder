
:- use_module(library(clpfd)).

nat(z).
nat(suc(X)) :- nat(X).

add(X, z, X).
add(X, suc(W), suc(N)) :- add(X, W, N).

numc(0, z).
numc(X, suc(N)) :- X #> 0, X0 #= X - 1, numc(X0,N).



