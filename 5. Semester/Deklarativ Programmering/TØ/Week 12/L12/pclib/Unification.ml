open Utility
open Formula
open Patricia
open Substitution

let rec istriv env x t =
  match t with
    Var y -> y = x || defined env y && istriv env x (apply env y)
  | Fun (_, args) -> List.exists (istriv env x) args && failwith "cyclic";;

(* ------------------------------------------------------------------------- *)
(* Main unification procedure                                                *)
(* ------------------------------------------------------------------------- *)

let rec unify env eqs =
  match eqs with
    [] -> env
  | (Fun (f, fargs), Fun (g, gargs))::oth ->
        if f = g && List.length fargs = List.length gargs
        then unify env (zip fargs gargs @ oth)
        else failwith "impossible unification"
  | (Var x, t)::oth | (t, Var x)::oth ->
        if defined env x then unify env ((apply env x,t)::oth)
        else unify (if istriv env x t then env else (x|->t) env) oth;;


(* ------------------------------------------------------------------------- *)
(* Unify literals (just pretend the toplevel relation is a function).        *)
(* ------------------------------------------------------------------------- *)

let rec unify_literals env tmp =
  match tmp with
    Atom(R(p1,a1)),Atom(R(p2,a2)) -> unify env [Fun(p1,a1),Fun(p2,a2)]
  | Not(p),Not(q) -> unify_literals env (p,q)
  | False,False -> env
  | _ -> failwith "Can't unify literals";;

let rec solve env =
  let env' = mapf (tsubst env) env in
  if env' = env then env else solve env';;
