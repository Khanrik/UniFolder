(* Header - not for interactive use *)

open Patricia
open Formula
open Substitution
open Transform
open Rewrite

(* End of header *)

(* Substitution *)

let _ = subst ("y" |=> Var "x") (fparser "forall x. x = y");;

let _ = subst ("y" |=> Var "x") (fparser "forall x x'. x = y ==> x = x'");;

let _ = subst (("z" |-> (Var "x'")) ("y" |=> Var "x")) (fparser "forall x x'. x = y ==> z = x'");;

(* Prenex Normal Form *)

let f1 = fparser "(forall x. P(x) \\/ R(y)) ==> exists y z. Q(y) \\/ ~(exists z. P(z) /\\ Q(z))";;
let f2 = simplify f1;;
let f3 = unfold f2;;
let f4 = nnf f3;;
let _ = prenex f4;;
let _ = pnf f1;;

let g1 = fparser "(forall x. P(x) /\\ ~(exists y. Q(y)) <=> ~(forall u. (exists v. Q(v)) ==> R(u)))";;
let _ = pnf g1;;

(* Rewrite: Arithmetic *)

let ra1 = fparser "0 + x = x";;
let ra2 = fparser "S(x) + y = S(x + y)";;
let rm1 = fparser "0 * x = 0";;
let rm2 = fparser "S(x) * y = y + x * y";;

let t1 = tparser "S(S(S(0))) * S(S(0)) + S(S(S(S(0))))";;

(* Rewrite: Lists *)

let _ = rewrite [ra1; ra2; rm1; rm2] t1;;

let cc1 = fparser "nil + y = y";;
let cc2 = fparser "cons(x,xs) + y = cons(x,xs + y)";;

let t2 = tparser "cons(0, cons(1, nil)) + cons(2, cons(3, nil))";;

(* Rewrite: Propositional Logic *)

let u1 = fparser "x + 0 = x";;
let u2 = fparser "x + 1 = 1";;
let u3 = fparser "x * 0 = 0";;
let u4 = fparser "x * 1 = x";;
let u5 = fparser "0 + x = x";;
let u6 = fparser "1 + x = 1";;
let u7 = fparser "0 * x = 0";;
let u8 = fparser "1 * x = x";;

let ff = tparser "(1 + (y + x) * 0) * (1 + z + 1 * (x + 0)) + (y * (0 + 1) * (z + 1 + 0))";;
let _ = rewrite [u1; u2; u3; u4; u5; u6; u7; u8] ff;;