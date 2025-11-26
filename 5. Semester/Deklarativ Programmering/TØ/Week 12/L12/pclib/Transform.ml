open Formula
open Utility
open Patricia
open Substitution

let negative = function (Not _) -> true | _ -> false

let positive lit = not(negative lit)

let negate = function (Not p) -> p | p -> Not p

let generalize fm = List.fold_right mk_forall (fv fm) fm

let psimplify_cases fm =
  match fm with
    Not False -> True
  | Not True -> False
  | Not (Not p) -> p
  | And (_ ,False) | And (False, _) -> False
  | And (p, True) | And (True, p) -> p
  | Or (p, False) | Or (False, p) -> p
  | Or (_ ,True) | Or(True, _) -> True
  | Imp (False, _) | Imp(_ ,True) -> True
  | Imp (True, p) -> p
  | Imp (p,False) -> Not p
  | Iff (p, True) | Iff (True, p) -> p
  | Iff (p, False) | Iff (False, p) -> Not p
  | _ -> fm;;

let rec psimplify fm =
  match fm with
  | Not p -> psimplify_cases (Not (psimplify p))
  | And (p, q) -> psimplify_cases (And (psimplify p, psimplify q))
  | Or (p, q) -> psimplify_cases (Or (psimplify p, psimplify q))
  | Imp (p, q) -> psimplify_cases (Imp (psimplify p, psimplify q))
  | Iff (p, q) -> psimplify_cases (Iff (psimplify p, psimplify q))
  | _ -> fm;;

let simplify_cases fm =
  match fm with
    Forall (x, p) -> if List.mem x (fv p) then fm else p
  | Exists (x, p) -> if List.mem x (fv p) then fm else p
  | _ -> psimplify_cases fm;;

let rec simplify fm =
  match fm with
    Not p -> simplify_cases (Not (simplify p))
  | And (p, q) -> simplify_cases (And (simplify p, simplify q))
  | Or (p, q) -> simplify_cases (Or (simplify p, simplify q))
  | Imp (p, q) -> simplify_cases (Imp (simplify p, simplify q))
  | Iff (p, q) -> simplify_cases (Iff (simplify p, simplify q))
  | Forall (x, p) -> simplify_cases (Forall (x, simplify p))
  | Exists (x, p) -> simplify_cases (Exists (x, simplify p))
  | _ -> fm;;

let rec unfold = function
  Imp (p, q) -> Or (Not (unfold p), unfold q)
| Iff (p, q) -> And (Or (Not (unfold p), unfold q), 
                     Or (unfold p, Not (unfold q)))
| And (p, q) -> And (unfold p, unfold q)
| Or (p, q) -> Or (unfold p, unfold q)
| Not p -> Not (unfold p)
| Forall (x, p) -> Forall (x, unfold p)
| Exists (x, p) -> Exists (x, unfold p)
| p -> p

let rec nnf = function
  Not (Or (p, q)) -> And (nnf (Not p), nnf (Not q))
| Not (And (p, q)) -> Or (nnf (Not p), nnf (Not q))
| Not (Not p) -> nnf p
| Not (Forall (x, p)) -> Exists (x, nnf (Not p))
| Not (Exists (x, p)) -> Forall (x, nnf (Not p))
| Or (p, q) -> Or (nnf p, nnf q)
| And (p, q) -> And (nnf p, nnf q)
| Forall (x, p) -> Forall (x, nnf p)
| Exists (x, p) -> Exists (x, nnf p)
| p -> p

let rec assoc = function
  Imp (p, q) -> Imp (assoc p, assoc q)
| Iff (p, q) -> Iff (assoc p, assoc q)
| And (And (p, q), r) -> assoc (And (p, assoc (And (q, assoc r))))
| Or (Or (p, q), r) -> assoc (Or (p, assoc (Or (q, assoc r))))
| Not p -> Not (assoc p)
| Forall (x, p) -> Forall (x, assoc p)
| Exists (x, p) -> Exists (x, assoc p)
| p -> p

let rec cnf s = 
  let rec distr s = match s with
    Or (p, And (q, r)) -> And (distr (Or (p, q)), distr (Or (p, r))) 
  | Or (And (p, q), r) -> And (distr (Or (p, r)), distr (Or (q, r)))
  | _ -> s in
  match s with 
    Or (p, q) -> distr (Or (cnf p, cnf q)) 
  | And (p, q) -> And (cnf p, cnf q)
  | _ -> s

let rec dnf s = 
  let rec distr s = match s with
    And (p, Or (q, r)) -> Or (distr (And (p, q)), distr (And (p, r))) 
  | And (Or (p, q), r) -> Or (distr (And (p, r)), distr (And (q, r)))
  | _ -> s in
  match s with 
    And (p, q) -> distr (And (dnf p, dnf q)) 
  | Or (p, q) -> Or (dnf p, dnf q)
  | _ -> s

let rec pullquants fm =
  match fm with
    And (Forall (x, p), Forall (y, q)) ->
                              pullq (true, true) fm mk_forall mk_and x y p q
  | Or (Exists(x, p), Exists(y, q)) ->
                              pullq (true, true) fm mk_exists mk_or x y p q
  | And (Forall (x, p), q) -> pullq (true, false) fm mk_forall mk_and x x p q
  | And (p, Forall (y, q)) -> pullq (false, true) fm mk_forall mk_and y y p q
  | Or (Forall (x, p), q) ->  pullq (true, false) fm mk_forall mk_or x x p q
  | Or (p, Forall (y, q)) ->  pullq (false, true) fm mk_forall mk_or y y p q
  | And (Exists (x, p), q) -> pullq (true, false) fm mk_exists mk_and x x p q
  | And (p, Exists (y, q)) -> pullq (false, true) fm mk_exists mk_and y y p q
  | Or (Exists (x, p), q) ->  pullq (true, false) fm mk_exists mk_or x x p q
  | Or (p, Exists (y, q)) ->  pullq (false, true) fm mk_exists mk_or y y p q
  | _ -> fm
and pullq (l, r) fm quant op x y p q =
  let z = variant x (fv fm) in
  let p' = if l then subst (x |=> Var z) p else p
  and q' = if r then subst (y |=> Var z) q else q in
  quant z (pullquants (op p' q'))

let rec prenex = function
  Forall (x, p) -> Forall (x, prenex p)
| Exists (x, p) -> Exists (x, prenex p)
| And (p, q) -> pullquants (And (prenex p, prenex q))
| Or (p, q) -> pullquants (Or (prenex p, prenex q))
| fm -> fm

let pnf fm = prenex @@ nnf @@ unfold @@ simplify @@ fm

let rec funcs tm =
  match tm with
    Var _ -> []
  | Fun (f, args) -> List.fold_right (fun y -> ListSet.union (funcs y)) args [f,List.length args]

let functions fm =
  atom_union (fun (R(_, a)) -> List.fold_right (fun y -> ListSet.union (funcs y)) a []) fm

let rec skolem fm fns =
  match fm with
    Exists(y,p) ->
        let xs = fv(fm) in
        let f = variant (if xs = [] then "c_"^y else "f_"^y) fns in
        let fx = Fun (f, List.map (fun x -> Var x) xs) in
        skolem (subst (y |=> fx) p) (f::fns)
  | Forall (x,p) -> let p',fns' = skolem p fns in Forall (x,p'),fns'
  | And (p,q) -> skolem2 (fun (p,q) -> And (p,q)) (p,q) fns
  | Or (p,q) -> skolem2 (fun (p,q) -> Or (p,q)) (p,q) fns
  | _ -> fm,fns
and skolem2 cons (p,q) fns =
  let p',fns' = skolem p fns in
  let q',fns'' = skolem q fns' in
  cons(p',q'),fns''

let askolemize fm =
  fst(skolem (nnf(simplify fm)) (List.map fst (functions fm)))

let rec specialize fm =
  match fm with
    Forall(_, p) -> specialize p
  | _ -> fm

let skolemize fm = specialize(pnf(askolemize fm))

let distrib s1 s2 = ListSet.setify (allpairs ListSet.union s1 s2);;

let rec purecnf fm =
  match fm with
    Or(p,q) -> distrib (purecnf p) (purecnf q)
  | And(p,q) -> ListSet.union (purecnf p) (purecnf q)
  | _ -> [[fm]];;

let trivial lits =
  let pos,neg = partition positive lits in
  ListSet.intersect pos (ListSet.image negate neg) <> [];;

let simpcnf fm =
  if fm = False then [[]] else if fm = True then [] else
  let cjs = List.filter (fun x -> not (trivial x)) (purecnf fm) in
  List.filter (fun c -> not(List.exists (fun c' -> ListSet.psubset c' c) cjs)) cjs;;
