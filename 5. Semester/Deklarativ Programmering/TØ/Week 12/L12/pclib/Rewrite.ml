open Utility
open Patricia
open Formula
open Substitution

let rec term_match env = function
  [] -> env
| (Fun (f, fa), Fun (g, ga))::oth when f = g && List.length fa = List.length ga ->
  term_match env (zip fa ga @ oth)
| (Var x, t)::oth ->
  if not (defined env x) then term_match ((x |-> t) env) oth
  else if apply env x = t then term_match env oth
  else failwith "term_match"
| _ -> failwith "term_match"

let rec rewrite_step eqs t =
  match eqs with
    Atom (R ("=", [l; r]))::oeqs ->
     (try tsubst (term_match undefined [l, t]) r
      with Failure _ -> rewrite_step oeqs t)
  | _ -> failwith "rewrite1"

let rec rewrite eqs tm =
  try rewrite eqs (rewrite_step eqs tm) with Failure _ ->
  match tm with
    Var _ -> tm
  | Fun (f, args) -> let tm' = Fun (f, List.map (rewrite eqs) args) in
                  if tm' = tm then tm else rewrite eqs tm'
