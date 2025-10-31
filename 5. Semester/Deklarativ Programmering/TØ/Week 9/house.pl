adjacent(a,b).
adjacent(b,c).
adjacent(b,e).
adjacent(c,d).
adjacent(d,e).
adjacent(e,d).
adjacent(e,f).
adjacent(e,g).
has_phone(g).

can_reach_phone(Room, Visited) :-
    has_phone(Room),
    format("Ring ring from room ~w~n", [Room]).

can_reach_phone(Room, Visited) :-
    format("Visiting room ~w~n", [Room]),
    (adjacent(Room, Next) ; adjacent(Next, Room) ),
    not(member(Next, Visited)),
    append(Visited, [Next], NewVisited),
    can_reach_phone(Next, NewVisited).