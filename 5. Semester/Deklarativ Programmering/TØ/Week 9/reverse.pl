reverse(Xs, Ys) :- reverse_acc(Xs, [], Ys).
reverse_acc([], Acc, Acc).
reverse_acc([X|Xs], Acc, Ys) :- reverse_acc(Xs, [X|Acc], Ys).