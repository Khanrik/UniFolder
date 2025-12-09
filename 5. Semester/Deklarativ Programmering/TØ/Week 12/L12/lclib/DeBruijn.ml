open List
open Syntax
open Utility
open Format

type debruijn = DBVar of int
              | DBCon of string * debruijn list
              | DBAbs of string * debruijn
              | DBApp of debruijn * debruijn

let dbsubst t fm =
  let rec subst k = function
    DBVar y as t' -> if y = k then t else t'
  | DBCon (c, p) -> DBCon (c, map (subst k) p)
  | DBAbs (s, b) -> DBAbs (s, subst (k+1) b)
  | DBApp (a, b) -> DBApp (subst k a, subst k b) in
  subst 0 fm

(* Lambda Term Parsing *)

let dbindex v vs =
  let rec geti k = function
    [] -> -1
  | w::vs' -> if v = w then k else geti (k+1) vs' in
  geti 0 vs

let rec parse_atomic_debruijn vs inp = 
  match inp with
    [] -> failwith "Term expected"
  | "("::rest -> (parse_bracketed (parse_debruijn vs) ")" rest)
  | "fun"::x::rest -> 
    db_parse_quant (x::vs) (fun (x,b) -> DBAbs(x,b)) x rest
  | a::rest -> 
    let k = dbindex a vs in 
      (if k = -1 then DBCon (a, []) else DBVar k),rest
and db_parse_quant vs qcon x inp = 
  match inp with
    [] -> failwith "Body of abstraction expected" | y::rest -> 
      papply (fun fm -> qcon(x,fm))
             (if y = "." 
              then parse_debruijn vs rest
              else db_parse_quant (y::vs) qcon y rest)
and parse_debruijn vs inp = 
  parse_left_infix "@" (fun (f,g) -> DBApp(f,g))
    (parse_atomic_debruijn vs) inp

let db_make_parser pfn s =
  let expr,rest = pfn (lex(explode s)) in
    if rest = [] then expr else failwith "Unparsed input"

let dbparser = db_make_parser (parse_debruijn [])

(* Lambda Term Evaluation *)

let rec dbeval func fm = 
  match fm with
  | DBCon (x, f) -> func x f
  | DBApp (DBCon (x, f), g) -> func x (f @ [(dbeval func g)])
  | DBApp (DBAbs (_, b), f) -> dbeval func (dbsubst f b)
  | DBApp (f, g) -> dbeval func (DBApp (dbeval func f, g)) 
  | a -> a

let db_mod_func n f args =
  match (f,args) with
    ("0",[]) -> DBCon ("0", [])
  | ("1",[]) -> DBCon (string_of_int (1 mod n), [])
  | ("+",[DBCon (x, []);DBCon (y, [])]) -> DBCon (string_of_int ((int_of_string x + int_of_string y) mod n), [])
  | ("*",[DBCon (x, []);DBCon (y, [])]) -> DBCon (string_of_int ((int_of_string x * int_of_string y) mod n), [])
  | _ -> DBCon (f, args)
                
let rec dbevalazy func fm =
  match fm with
  | DBCon (x, f) -> func (dbevalazy func) x f
  | DBApp (DBCon (x, f), g) -> func (dbevalazy func) x (f @ [g])
  | DBApp (DBAbs (_, b), f) -> dbevalazy func (dbsubst f b)
  | DBApp (f, g) -> dbevalazy func (DBApp (dbevalazy func f, g)) 
  | a -> a

let db_int_func f args = 
  match (f,args) with
    ("+",[DBCon (x, []);DBCon (y, [])]) -> DBCon (string_of_int (int_of_string x + int_of_string y), [])
  | ("*",[DBCon (x, []);DBCon (y, [])]) -> DBCon (string_of_int (int_of_string x * int_of_string y), [])
  | ("-",[DBCon (x, []);DBCon (y, [])]) -> DBCon (string_of_int (int_of_string x - int_of_string y), [])
  | ("=",[DBCon (x, []);DBCon (y, [])]) -> DBCon ((if x = y then "1" else "0"), [])
  | ("?",[DBCon (x, []);y;z]) -> if x = "1" then y else z
  | _ -> DBCon (f, args)

let db_int_func_lazy e f args = 
  match f with
    "+" | "*" | "-" | "=" -> db_int_func f (map e args)
  | "?" -> (
    match args with 
      [x;y;z] -> (
        match e x with 
          DBCon (c, []) -> if c = "1" then e y else e z
        | _ -> DBCon (f, args))
    | _ -> DBCon (f, args))
  | _ -> DBCon (f, map e args)

let db_eval_any s = dbeval (fun f args -> DBCon (f, args)) (dbparser s)

let db_eval_mod n s = dbeval (db_mod_func n) (dbparser s)

let db_eval_int s = dbeval db_int_func (dbparser s)

let db_eval_int_lazy s = dbevalazy db_int_func_lazy (dbparser s)

(* Lambda Term Printing *)

let db_bracket formatter p n f x y =
  (if p then pp_print_string formatter "(" else ()); 
  pp_open_box formatter n; f x y; pp_close_box formatter ();
  (if p then pp_print_string formatter ")" else ())

let rec db_strip_quant fm = 
  match fm with
    DBAbs(x,(DBAbs(_,_) as yp)) -> let xs,q = db_strip_quant yp in x::xs,q
  | DBAbs(x,b) -> [x],b 
  | _ -> [],fm

let rec db_expand_con c xs =
  match xs with
    [] -> DBCon (c, [])
  | x::xs' -> DBApp (db_expand_con c xs', x)

let print_debruijn formatter =
  let rec print_lambda pr fm =
    match fm with
      DBVar x -> pp_print_char formatter '`'; pp_print_int formatter x
    | DBCon (x, []) -> pp_print_string formatter x
    | DBCon (x, ys) -> print_lambda pr (db_expand_con x (rev ys))
    | DBApp(p,q) -> db_bracket formatter (pr > 1) 1 (print_infix 1 "@") p q
    | DBAbs(_,_) -> db_bracket formatter (pr > 0) 0 print_qnt "fun" (db_strip_quant fm)
  and print_qnt qname (bvs,bod) =
    pp_print_string formatter qname;
    iter (fun v -> pp_print_string formatter " "; pp_print_string formatter v) bvs; 
    pp_print_string formatter "."; pp_print_space formatter (); 
    pp_open_box formatter 0; print_lambda 0 bod; close_box()
  and print_infix newpr sym p q = 
    print_lambda newpr p; pp_print_string formatter (" "^sym); 
    pp_print_space formatter (); print_lambda (newpr+1) q in
  print_lambda 0

let db_print_qlambda formatter fm =
  pp_open_box formatter 0; pp_print_string formatter "<<";
  pp_open_box formatter 0; print_debruijn formatter fm; pp_close_box formatter (); 
  pp_print_string formatter ">>"; pp_close_box formatter (); pp_print_newline formatter ()

let dbprinter formatter = db_print_qlambda formatter