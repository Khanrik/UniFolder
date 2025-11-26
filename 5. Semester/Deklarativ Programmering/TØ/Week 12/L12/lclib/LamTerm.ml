open List
open Syntax
open Utility
open Format

type lambda = Var of string
            | Con of string * lambda list
            | Abs of string * lambda
            | App of lambda * lambda

let rec subst x t = function
  Var y as t' -> if y = x then t else t'
| Con (c, p) -> Con (c, map (subst x t) p)
| Abs (y, b) as t' -> if x = y then t' else Abs (y, subst x t b)
| App (a, b) -> App (subst x t a, subst x t b)

(* Lambda Term Parsing *) 

let rec parse_atomic_lambda vs inp = 
  match inp with
    [] -> failwith "Term expected"
  | "("::rest -> (parse_bracketed (parse_lambda vs) ")" rest)
  | "fun"::x::rest -> 
    parse_quant (x::vs) (fun (x,b) -> Abs(x,b)) x rest
  | a::rest ->
    (if not(mem a vs) then Con (a, []) else Var a),rest
and parse_quant vs qcon x inp = 
  match inp with
    [] -> failwith "Body of abstraction expected" 
  | y::rest -> 
      papply (fun fm -> qcon(x,fm))
             (if y = "." 
              then parse_lambda vs rest
              else parse_quant (y::vs) qcon y rest)
and parse_lambda vs inp = 
  parse_left_infix "@" (fun (f,g) -> App(f,g))
    (parse_right_infix "," (fun (f,s) -> Con (",", [f; s]))
      (parse_atomic_lambda vs)) inp

let make_parser pfn s =
  let expr,rest = pfn (lex(explode s)) in
    if rest = [] then expr else failwith "Unparsed input"

let lparser = make_parser (parse_lambda [])

(* Lambda Term Evaluation *)

let rec eval func fm = 
  match fm with
  | Con (x, f) -> func x f
  | App (Con (x, f), g) -> func x (f @ [(eval func g)])
  | App (Abs (x, b), f) -> eval func (subst x f b)
  | App (f, g) -> eval func (App (eval func f, g)) 
  | a -> a

let mod_func n f args =
  match (f,args) with
    ("0",[]) -> Con ("0", [])
  | ("1",[]) -> Con (string_of_int (1 mod n), [])
  | ("+",[Con (x, []);Con (y, [])]) -> Con (string_of_int ((int_of_string x + int_of_string y) mod n), [])
  | ("*",[Con (x, []);Con (y, [])]) -> Con (string_of_int ((int_of_string x * int_of_string y) mod n), [])
  | _ -> Con (f, args)
                
let rec evalazy func fm =
  match fm with
  | Con (x, f) -> func (evalazy func) x f
  | App (Con (x, f), g) -> func (evalazy func) x (f @ [g])
  | App (Abs (x, b), f) -> evalazy func (subst x f b)
  | App (f, g) -> evalazy func (App (evalazy func f, g)) 
  | a -> a

let int_list_func f args = 
  let rec coneq x y =
    let rec coneql a b =
      match a, b with
        ([], []) -> true
      | (x::xs, y::ys) -> coneq x y && coneql xs ys
      | _ -> false in
    match x, y with
      Con (x, a), Con (y, b) -> if x = y then coneql a b else false
    | _ -> false in
  match (f,args) with
    ("+",[Con (x, []);Con (y, [])]) -> Con (string_of_int (int_of_string x + int_of_string y), [])
  | ("*",[Con (x, []);Con (y, [])]) -> Con (string_of_int (int_of_string x * int_of_string y), [])
  | ("-",[Con (x, []);Con (y, [])]) -> Con (string_of_int (int_of_string x - int_of_string y), [])
  | ("=",[x; y]) -> Con ((if coneq x y then "1" else "0"), [])
  | ("fst", [Con (",", [x; _])]) -> x
  | ("snd", [Con (",", [_; y])]) -> y
  | _ -> Con (f, args)

let func_lazy e f args =
  match (f, args) with
    "+", _ | "*", _ | "-", _ | "=", _ | ",", _ | "fst", _ | "snd", _ -> int_list_func f (map e args)
  | "?", [x;y;z] -> (
    match e x with 
      Con (c, []) -> if c = "1" then e y else e z
    | _ -> Con (f, args))
  | "?", _ -> Con (f, args)
  | _ -> Con (f, map e args)

let eval_any s = eval (fun f args -> Con (f, args)) (lparser s)

let eval_mod n s = eval (mod_func n) (lparser s)

let eval_int s = eval int_list_func (lparser s)

let eval_lazy s = evalazy func_lazy (lparser s)

(* Lambda Term Printing *)

let bracket formatter p n f x y =
  (if p then pp_print_string formatter "(" else ()); 
  pp_open_box formatter n; f x y; pp_close_box formatter ();
  (if p then pp_print_string formatter ")" else ())

let rec strip_quant fm = 
  match fm with
    Abs(x,(Abs(_,_) as yp)) -> let xs,q = strip_quant yp in x::xs,q
  | Abs(x,b) -> [x],b 
  | _ -> [],fm

let rec expand_con c xs =
  match xs with
    [] -> Con (c, [])
  | x::xs' -> App (expand_con c xs', x)

let print_lambda formatter =
  let rec print_lambda pr fm =
    match fm with
      Var x 
    | Con (x, []) -> pp_print_string formatter x;
    | Con (",", [f; s]) -> bracket formatter (pr > 2) 0 (print_infix false 2 ",") f s
    | Con (x, ys) -> print_lambda pr (expand_con x (rev ys))
    | App (p,q) -> bracket formatter (pr > 1) 0 (print_infix true 1 "@") p q
    | Abs (_,_) -> bracket formatter (pr > 0) 0 print_qnt "fun" (strip_quant fm)
  and print_qnt qname (bvs,bod) =
    pp_print_string formatter qname;
    iter (fun v -> pp_print_string formatter " "; pp_print_string formatter v) bvs; 
    pp_print_string formatter "."; pp_print_space formatter (); 
    pp_open_box formatter 0; print_lambda 0 bod; close_box()
  and print_infix isleft newpr sym p q = 
    let lpr, rpr = if isleft then newpr, newpr+1 else newpr+1, newpr in
      print_lambda lpr p; pp_print_string formatter (" "^sym); 
      pp_print_space formatter (); print_lambda rpr q in
  print_lambda 0

let print_qlambda formatter fm =
  pp_open_box formatter 0; pp_print_string formatter "<<";
  pp_open_box formatter 0; print_lambda formatter fm; pp_close_box formatter (); 
  pp_print_string formatter ">>"; pp_close_box formatter (); pp_print_newline formatter ()

let lprinter formatter = print_qlambda formatter