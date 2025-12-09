open Formula

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

(*let rec assoc s = 
  let shift r  = match r with
  | And (And (p, q), r) -> (And (p, And (q, r)))
  | Or (Or (p, q), r) -> (Or (p, Or (q, r)))
  | _ -> s in
  match s with 
    And (p, q) -> shift (And (assoc p, assoc q))
  | Or (p, q) -> shift (Or (assoc p, assoc q))
  | Imp (p, q) -> Imp (assoc p, assoc q)
  | Iff (p, q) -> Imp (assoc p, assoc q)
  | Not p -> Not (assoc p)
  | Forall (x, p) -> Forall (x, assoc p)
  | Exists (x, p) -> Exists (x, assoc p)
  | _ -> s*)

let rec assoc = function
  Imp (p, q) -> Imp (assoc p, assoc q)
| Iff (p, q) -> Imp (assoc p, assoc q)
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