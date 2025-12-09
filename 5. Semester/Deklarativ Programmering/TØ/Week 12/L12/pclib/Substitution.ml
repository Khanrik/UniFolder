open List
open ListSet
open Utility
open Patricia
open Formula

let rec fvt tm =
  match tm with
    Var x -> [x]
  | Fun (_,args) -> unions (map fvt args)

let rec var fm =
   match fm with
    False | True -> []
  | Atom (R (_,args)) -> unions (map fvt args)
  | Not (p) -> var p
  | And (p,q) | Or (p,q) | Imp (p,q) | Iff (p,q) -> union (var p) (var q)
  | Forall (x,p) | Exists (x,p) -> insert x (var p)

let rec fv fm =
  match fm with
    False | True -> []
  | Atom (R (_,args)) -> unions (map fvt args)
  | Not (p) -> fv p
  | And (p,q) | Or (p,q) | Imp (p,q) | Iff (p,q) -> union (fv p) (fv q)
  | Forall (x,p) | Exists (x,p) -> subtract (fv p) [x]

let rec tsubst sfn tm =
  match tm with
    Var x -> tryapplyd sfn x tm
  | Fun (f,args) -> Fun (f,map (tsubst sfn) args)

let rec subst subfn = function
  False -> False
| True -> True
| Atom (R(p,args)) -> Atom (R (p, map (tsubst subfn) args))
| Not (p) -> Not (subst subfn p)
| And (p,q) -> And (subst subfn p, subst subfn q)
| Or (p,q) -> Or (subst subfn p, subst subfn q)
| Imp (p,q) -> Imp (subst subfn p, subst subfn q)
| Iff (p,q) -> Iff (subst subfn p, subst subfn q)
| Forall (x,p) -> substq subfn (fun x b -> Forall (x, b)) x p
| Exists (x,p) -> substq subfn (fun x b -> Exists (x, b)) x p
and substq subfn quant x p =  
  let x' = if exists (fun y -> mem x (fvt (tryapplyd subfn y (Var y)))) (subtract (fv p) [x])
           then variant x (fv (subst (undefine x subfn) p))
           else x in
  quant x' (subst ((x |-> Var x') subfn) p)