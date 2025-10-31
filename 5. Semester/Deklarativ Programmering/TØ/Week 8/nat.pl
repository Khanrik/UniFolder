nat(z).
nat(suc(X)) :- nat(X).

add(X, z, X).
add(X, suc(W), suc(N)) :- add(X, W, N).

numc(0, z).
numc(X, suc(N)) :- X > 0, X0 is X - 1, numc(X0, N).

leq(z, Y).
leq(suc(X), suc(Y)) :- leq(X, Y).

mul(X, z, z).
mul(X, suc(Y), Z) :- mul(X, Y, W), add(X, W, Z).