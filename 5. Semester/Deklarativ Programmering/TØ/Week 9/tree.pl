

tree(leaf).
tree(node(_, Left, Right)) :- tree(Left), tree(Right).

mem(X, node(X,_,_)).
mem(X, node(Y,L,_)) :- X @< Y, mem(X,L).
mem(X, node(Y,_,R)) :- (not(ground(X)) ; X @> Y), mem(X,R).

insert(X, leaf, node(X, leaf, leaf)).
insert(X, node(X, L, R), node(X, L,    R)).
insert(X, node(Y, L, R), node(Y, NewL, R))    :- X @< Y, insert(X, L, NewL).
insert(X, node(Y, L, R), node(Y, L,    NewR)) :- X @> Y, insert(X, R, NewR).

