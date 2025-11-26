open List
open Utility
open LamTerm
open DeBruijn

let lam_to_deb fm =
  let rec ltd vs = function
    Var x -> DBVar (dbindex x vs)
  | Con (x, p) -> DBCon (x, map (ltd vs) p)
  | Abs (x, b) -> DBAbs (x, ltd (x::vs) b)
  | App (f, g) -> DBApp (ltd vs f, ltd vs g) in
  ltd [] fm

let deb_to_lam fm =
  let rec dtl vs = function
    DBVar x -> Var (nth vs x)
  | DBCon (x, p) -> Con (x, map (dtl vs) p)
  | DBAbs (x, b) -> let y = variant x vs in Abs (y, dtl (y::vs) b)
  | DBApp (f, g) -> App (dtl vs f, dtl vs g)
  in dtl [] fm