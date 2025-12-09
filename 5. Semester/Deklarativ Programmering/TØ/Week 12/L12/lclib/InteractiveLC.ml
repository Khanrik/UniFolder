(* Header - not for interactive use *)

open LamTerm
open DeBruijn
open Convert

(* End of header *)

(* De Buijn Terms *)

let _ = dbparser "fun x. x";;

let _ = dbparser "fun x y. y @ x";;

let _ = dbparser "fun x y. c @ (fun z. x @ z) @ y";;

let y = "(fun g. (fun y. g @ (y @ y)) @ (fun z. g @ (z @ z)))";;
let fac = "(fun f x. ? @ (= @ x @ 0) @ 1 @ (* @ x @ (f @ (- @ x @ 1))))";;
let yfac = y ^ " @ " ^ fac;;
let _ = dbparser yfac;;

let yfac3 = (yfac ^ " @ " ^ "3");;
let _ = dbparser yfac3;;

let _ = db_eval_int_lazy yfac3;;

let num = "(fun f x. ? @ (= @ x @ 0) @ Z @ (S @ (f @ (- @ x @ 1))))";;
let ynum3 = y ^ " @ " ^ num ^ " @ 3";;
let _ = db_eval_int_lazy ynum3;;

(* Convert *)

let _ = lam_to_deb (lparser "fun x x. x");;
let _ = deb_to_lam (dbparser "fun x x. x");;

let dbt = DBAbs ("x", DBAbs ("x", DBApp (DBVar 1, DBVar 0)));;
let _ = deb_to_lam dbt;;