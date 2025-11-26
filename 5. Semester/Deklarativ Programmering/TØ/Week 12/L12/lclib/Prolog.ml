open Patricia
open Utility
open Syntax
open Formula
open Unification
open Substitution
open Transform

let renamerule k (asm, c) =
  let fvs = fv (list_conj (c::asm)) in
  let n = List.length fvs in
  let vvs = List.map (fun i -> "_" ^ string_of_int i) (k -- (k+n-1)) in
  let inst = subst (fpf fvs (List.map (fun x -> Var x) vvs)) in
  (List.map inst asm, inst c),k+n

let rec deepen f n =
  try print_string "Searching with depth limit ";
      print_int n; print_newline(); f n
  with Failure _ -> deepen f (n + 1);;

let rec backchain rules n k env goals =
  match goals with
    [] -> env
  | g::gs ->
     if n = 0 then failwith "Too deep" else
     tryfind (fun rule ->
        let (a,c),k' = renamerule k rule in
        backchain rules (n - 1) k' (unify_literals env (c,g)) (a @ gs))
     rules;;

let hornify cls =
  let pos,neg = partition positive cls in
  if List.length pos > 1 then failwith "non-Horn clause"
  else (List.map negate neg,if pos = [] then False else List.hd pos);;

let hornprove fm =
  let rules = List.map hornify (simpcnf (skolemize (Not(generalize fm)))) in
  deepen (fun n -> backchain rules n 0 undefined [False],n) 0;;

let parserule s =
  let c,rest =
    parse_formula (parse_infix_atom,parse_atom) [] (lex(explode s)) in
  let asm,rest1 =
    if rest <> [] && List.hd rest = ":-"
    then parse_list ","
          (parse_formula (parse_infix_atom,parse_atom) []) (List.tl rest)
    else [],rest in
  if rest1 = [] then (asm,c) else failwith "Extra material after rule";;

let simpleprolog rules gl =
  backchain (List.map parserule rules) (-1) 0 undefined [fparser gl];;

let prolog rules gl =
  let i = solve (simpleprolog rules gl) in
  mapfilter (fun x -> Atom(R("=",[Var x; apply i x]))) (fv(fparser gl));;

