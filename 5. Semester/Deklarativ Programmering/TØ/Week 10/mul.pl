
:- use_module(library(clpfd)).

mul(X,0,0) :- X #>= 0.
mul(X,Y,P) :- X #>= 0, Y #> 0, P #>= 0,
              X #=< P, Y #=< P,
              Y0 #= Y - 1, P #= X + P0, mul(X,Y0,P0).

