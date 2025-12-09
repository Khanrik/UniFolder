open List
(* open Patricia *)

(* Lists *)

let rec (--) = fun m n -> if m > n then [] else m::((m + 1) -- n);;

let rec zip l1 l2 =
  match (l1,l2) with
        ([],[]) -> []
      | (h1::t1,h2::t2) -> (h1,h2)::(zip t1 t2)
      | _ -> failwith "zip"

let rec end_itlist f l =
  match l with
        []     -> failwith "end_itlist"
      | [x]    -> x
      | (h::t) -> f h (end_itlist f t);;
          
let rec tryfind f l =
  match l with
      [] -> failwith "tryfind"
    | (h::t) -> try f h with Failure _ -> tryfind f t;;

let partition p l =
    List.fold_right (fun a (yes,no) -> if p a then a::yes,no else yes,a::no) l ([],[]);;

let rec allpairs f l1 l2 =
  match l1 with
   h1::t1 ->  List.fold_right (fun x a -> f h1 x :: a) l2 (allpairs f t1 l2)
  | [] -> [];;

let rec mapfilter f l =
  match l with
    [] -> []
  | (h::t) -> let rest = mapfilter f t in
              try (f h)::rest with Failure _ -> rest;;

(* Strings *)

let explode s =
  let rec exap n l =
     if n < 0 then l else
      exap (n - 1) ((String.sub s n 1)::l) in
  exap (String.length s - 1) []

let implode l = fold_right (^) l ""

(* Syntax *)

let rec variant x vars = if mem x vars then variant (x^"'") vars else x

let matches s = let chars = explode s in fun c -> mem c chars

let space = matches " \t\n\r"
and punctuation = matches "()[]{},"
and symbolic = matches "~`!@#$%^&*-+=|\\:;<>.?/"
and numeric = matches "0123456789"
and alphanumeric = matches
  "abcdefghijklmnopqrstuvwxyz_'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

let rec lexwhile prop inp =
  match inp with
    c::cs when prop c -> let tok,rest = lexwhile prop cs in c^tok,rest
  | _ -> "",inp

let rec lex inp =
  match snd(lexwhile space inp) with
    [] -> []
  | c::cs -> let prop = if alphanumeric(c) then alphanumeric
                        else if symbolic(c) then symbolic
                        else fun _ -> false in
             let toktl,rest = lexwhile prop cs in
             (c^toktl)::lex rest
