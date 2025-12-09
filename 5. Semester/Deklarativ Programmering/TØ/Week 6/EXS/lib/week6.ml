open Formula
(*$inject
  open Formula
*)

(* You can use these functions if you like *)
let rec unfold = function
| Imp (p, q) -> Or (Not (unfold p), unfold q)
| Iff (p, q) -> And (Or (Not (unfold p), unfold q), 
                     Or (unfold p, Not (unfold q)))
| And (p, q) -> And (unfold p, unfold q)
| Or (p, q) -> Or (unfold p, unfold q)
| Not p -> Not (unfold p)
| Forall (x, p) -> Forall (x, unfold p)
| Exists (x, p) -> Exists (x, unfold p)
| p -> p

let rec nnf = function
  Not True -> False
| Not False -> True
| Not (Or (p, q)) -> And (nnf (Not p), nnf (Not q))
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
| Iff (p, q) -> Imp (assoc p, assoc q)
| And (And (p, q), r) -> assoc (And (p, assoc (And (q, assoc r))))
| Or (Or (p, q), r) -> assoc (Or (p, assoc (Or (q, assoc r))))
| Not p -> Not (assoc p)
| Forall (x, p) -> Forall (x, assoc p)
| Exists (x, p) -> Exists (x, assoc p)
| p -> p

let rec cnf_helper s = 
  let rec distr s = match s with
    Or (p, And (q, r)) -> And (distr (Or (p, q)), distr (Or (p, r))) 
  | Or (And (p, q), r) -> And (distr (Or (p, r)), distr (Or (q, r)))
  | _ -> s in
  match s with 
    Or (p, q) -> distr (Or (cnf_helper p, cnf_helper q)) 
  | And (p, q) -> And (cnf_helper p, cnf_helper q)
  | _ -> s


(*$inject
  let parser = fparser
  let fmPrinter x = fprinter Format.str_formatter x; Format.flush_str_formatter ()
*)

(* Q1. Write a function simple that yields true if a formula only contains conjunctions, disjunctions, negations and relation symbols *)

let rec simple = function
  And (p, q) -> simple(p) && simple(q)
| Or (p, q) -> simple(p) && simple(q)
| Not p -> simple(p)
| Imp (_, _) -> false
| Iff (_, _) -> false
| Forall (_, _) -> false
| Exists (_, _) -> false
| True -> false
| False -> false
| Atom (R(_, args)) -> args = []

(*  Here fmPrinter has been rewritten to string_of_bool,
    because it makes more sense with the test and function requiring bools*)
(*$= simple & ~printer:string_of_bool
  false (simple (fparser "p(X,Y) /\\ p(Y,Z) ==> p(X,Z)")) 
  false (simple (fparser "~(forall x. P(x)) <=> exists y. ~P(y)"))
  true (simple (fparser "A"))
  true (simple (fparser "A /\\ B"))
  true (simple (fparser "A \\/ ~B"))
  true (simple (fparser "~(A \\/ B) /\\ C"))
  false (simple (fparser "A ==> B"))
*)

(* Q2. Write a function cnf that takes a quantifier-free formula and transforms it into CNF *)

let cnf s =
  match s |> unfold |> simple with
    true -> s |> unfold |> nnf |> cnf_helper
  | false -> failwith "The formula is not quantifier-free"

(*$= cnf & ~printer:fmPrinter
  (fparser "((A \\/ B) /\\ (C \\/ B)) /\\ ((A \\/ C) /\\ (C \\/ C))") (cnf (fparser "(A /\\ C) \\/ (B /\\ C)"))
  (fparser "(A \\/ B) /\\ (A \\/ C \\/ D) /\\ (A \\/ C \\/ E)") (cnf (fparser "A \\/ (B /\\ (C \\/ (D /\\ E)))"))
  (fparser "(A \\/ B) /\\ (A \\/ ~C)") (cnf (fparser "A \\/ (B /\\ ~C)"))
  (fparser "~A \\/ B") (cnf (fparser "A ==> B"))
*)

(* Q3. Write a function dnf based on you function CNF *)

let dnf s = assoc(nnf(Not(cnf(Not(s)))))

(*$= dnf & ~printer:fmPrinter
  (fparser "(A /\\ B) \\/ ((C /\\ B) \\/ ((A /\\ C) \\/ (C /\\ C)))") (dnf (fparser "(A \\/ C) /\\ (B \\/ C)"))
  (fparser "(A /\\ B) \\/ ((A /\\ (C /\\ D)) \\/ (A /\\ (C /\\ E)))") (dnf (fparser "A /\\ (B \\/ (C /\\ (D \\/ E)))"))
  (fparser "(A /\\ B) \\/ (A /\\ ~C)") (dnf (fparser "A /\\ (B \\/ ~C)"))
  (fparser "((A /\\ B) /\\ ~C) \\/ (((A /\\ B) /\\ ~D) \\/ ((~A /\\ (C /\\ D)) \\/ (~B /\\ (C /\\ D))))") (dnf (fparser "~((A /\\ B) <=> (C /\\ D))"))
*)