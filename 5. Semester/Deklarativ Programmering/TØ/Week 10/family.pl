/* FACTS */
mother(sally, billy).
mother(sally, jean).
mother(trude, sally).
father(tom, sally).
father(tom, erica).
father(mike, tom).


/* RULES */
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
parent(X, Y)  :- father(X, Y).
parent(X, Y)  :- mother(X, Y).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
ancestor(X, Y) :- parent(X, Y); parent(Z, Y), ancestor(X, Z).