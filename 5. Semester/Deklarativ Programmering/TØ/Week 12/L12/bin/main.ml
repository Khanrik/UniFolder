open Prolog ;;
open Format ;;
open Formula ;;

let emit rules query =
  let _ = printf "?- %s.\n" query in
  try (
    let result = prolog rules query in
    let _ = List.map (fprinter std_formatter) result in
    [printf "true.\n\n"]
  ) with _ -> [printf "false.\n\n"] ;;

let appendrules =
  ["append(nil,L,L)"; "append(H::T,L,H::A) :- append(T,L,A)"] ;;

let sortrules =
  ["sort(X,Y) :- perm(X,Y),sorted(Y)";
  "sorted(nil)";
  "sorted(X::nil)";
  "sorted(X::Y::Z) :- X <= Y, sorted(Y::Z)";
  "perm(nil,nil)";
  "perm(X::Y,U::V) :- delete(U,X::Y,Z), perm(Z,V)";
  "delete(X,X::Y,Y)";
  "delete(X,Y::Z,Y::W) :- delete(X,Z,W)";
  "0 <= X";
  "S(X) <= S(Y) :- X <= Y"] ;;

(* 1 *)
(* a *)
emit appendrules "append(1::2::nil,3::4::nil,1::2::3::4::nil)" ;;


(* b *)
emit appendrules "append(X,3::4::nil,Y)" ;;


(* c *)
emit sortrules "sort(S(S(0))::0::S(0)::nil,X)" ;;




(* 2 *)
(* a *)
let familyrules = 
  ["mother(sally(), billy())";
  "mother(sally(), jean())";
  "mother(trude(), sally())";
  "father(tom(), sally())";
  "father(tom(), erica())";
  "father(mike(), tom())";
  "~(sally() = erica())";
  "~(erica() = sally())";
  "sibling(X, Y) :- parent(Z, X), parent(Z, Y), ~(X = Y)";
  "parent(X, Y)  :- father(X, Y)";
  "parent(X, Y)  :- mother(X, Y)";
  "grandparent(X, Y) :- parent(X, Z), parent(Z, Y)";
  "ancestor(X, Y) :- parent(X, Y)";
  "ancestor(X, Y) :- parent(Z, Y), ancestor(X, Z)"] ;;
  

(* b *)
(* i *)
emit familyrules "mother(trude(), sally())" ;;

(* ii *)
emit familyrules "father(Who, erica())" ;;

(* iii *)
emit familyrules "father(tom(), Who)" ;;

(* iv *)
emit familyrules "sibling(Who, sally())" ;;

(* v *)
emit familyrules "father(X, sally()), father(mike(), X)" ;;

(* vi *)
emit familyrules "parent(X, sally()), parent(Who, X)" ;;

(* vii *)
emit familyrules "grandparent(trude(), billy())" ;;
emit familyrules "ancestor(Who, billy())" ;;


(* c *)
emit sortrules "sort(S(S(0))::0::S(0)::nil,X)" ;;




(* 3 *)
(* a *)
