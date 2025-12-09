even(X) :-
    X = 0;
    X > 0,
    X0 is X - 1,
    odd(X0);
    X < 0,
    X0 is X + 1,
    odd(X0).
odd(X) :-
    X > 0,
    X0 is X - 1,
    even(X0);
    X < 0,
    X0 is X + 1,
    even(X0).

