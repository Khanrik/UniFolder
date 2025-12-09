open List
open Partial
open Utility
open Format

type 'a formula = False
                | True
                | Atom of 'a
                | Not of 'a formula
                | And of 'a formula * 'a formula
                | Or of 'a formula * 'a formula
                | Imp of 'a formula * 'a formula
                | Iff of 'a formula * 'a formula
                | Forall of string * 'a formula
                | Exists of string * 'a formula
                 
type term = Var of string
          | Fun of string * term list

let rec termval (_,func,_ as m) v tm =
  match tm with
    Var(x) -> v @@ x
  | Fun(f,args) -> func f (map (termval m v) args)
  
type fol = R of string * term list

let rec holds (domain,_,pred as m) v fm =
  match fm with
    False -> false
  | True -> true
  | Atom(R(r,args)) -> pred r (map (termval m v) args)
  | Not(p) -> not(holds m v p)
  | And(p,q) -> (holds m v p) && (holds m v q)
  | Or(p,q) -> (holds m v p) || (holds m v q)
  | Imp(p,q) -> not(holds m v p) || (holds m v q)
  | Iff(p,q) -> (holds m v p = holds m v q)
  | Forall(x,p) -> for_all (fun a -> holds m ((x |-> a) v) p) domain
  | Exists(x,p) -> exists (fun a -> holds m ((x |-> a) v) p) domain

let bool_interp = 
  let func f args =
    match (f,args) with
      ("0",[]) -> false
    | ("1",[]) -> true
    | ("+",[x;y]) -> not(x = y)
    | ("*",[x;y]) -> x && y
    | _ -> failwith "uninterpreted function"
  and pred p args =
    match (p,args) with
      ("=",[x;y]) -> x = y
    | _ -> failwith "uninterpreted predicate" in
  ([false; true],func,pred)

let mod_interp n = 
  let func f args =
    match (f,args) with
      ("0",[]) -> 0
    | ("1",[]) -> 1 mod n
    | ("+",[x;y]) -> (x + y) mod n
    | ("*",[x;y]) -> (x * y) mod n
    | _ -> failwith "uninterpreted function"
  and pred p args =
    match (p,args) with
      ("=",[x;y]) -> x = y
    | _ -> failwith "uninterpreted predicate" in
  (0--(n-1),func,pred)

(* Formula Parsing *)

let rec parse_ginfix opsym opupdate sof subparser inp = 
  let e1,inp1 = subparser inp in
  if inp1 <> [] && hd inp1 = opsym 
  then parse_ginfix opsym opupdate (opupdate sof e1) subparser (tl inp1) 
  else sof e1,inp1

let parse_left_infix opsym opcon =
  parse_ginfix opsym (fun f e1 e2 -> opcon(f e1,e2)) (fun x -> x)

let parse_right_infix opsym opcon =
  parse_ginfix opsym (fun f e1 e2 -> f(opcon(e1,e2))) (fun x -> x)

let parse_list opsym =
  parse_ginfix opsym (fun f e1 e2 -> (f e1)@[e2]) (fun x -> [x])

let papply f (ast,rest) = (f ast,rest)

let nextin inp tok = inp <> [] && hd inp = tok

let parse_bracketed subparser cbra inp =
  let ast,rest = subparser inp in
  if nextin rest cbra 
  then ast,tl rest
  else failwith "Closing bracket expected"

let rec parse_atomic_formula (ifn,afn) vs inp = 
  match inp with
    [] -> failwith "formula expected"
  | "false"::rest -> False,rest
  | "true"::rest -> True,rest
  | "("::rest -> (try ifn vs inp with Failure _ -> 
    parse_bracketed (parse_formula (ifn,afn) vs) ")" rest)
  | "~"::rest -> 
    papply (fun p -> Not p) (parse_atomic_formula (ifn,afn) vs rest)
  | "forall"::x::rest -> 
    parse_quant (ifn,afn) (x::vs) (fun (x,p) -> Forall(x,p)) x rest
  | "exists"::x::rest -> 
    parse_quant (ifn,afn) (x::vs) (fun (x,p) -> Exists(x,p)) x rest
  | _ -> afn vs inp
and parse_quant (ifn,afn) vs qcon x inp = 
  match inp with
    [] -> failwith "Body of quantified term expected" | y::rest -> 
      papply (fun fm -> qcon(x,fm))
             (if y = "." 
              then parse_formula (ifn,afn) vs rest
              else parse_quant (ifn,afn) (y::vs) qcon y rest)
and parse_formula (ifn,afn) vs inp = 
  parse_right_infix "<=>" (fun (p,q) -> Iff(p,q))
    (parse_right_infix "==>" (fun (p,q) -> Imp(p,q)) 
      (parse_right_infix "\\/" (fun (p,q) -> Or(p,q))
        (parse_right_infix "/\\" (fun (p,q) -> And(p,q)) 
          (parse_atomic_formula (ifn,afn) vs)))) inp

(* Formula Printing *)

let bracket formatter p n f x y =
  (if p then pp_print_string formatter "(" else ()); 
  pp_open_box formatter n; f x y; pp_close_box formatter ();
  (if p then pp_print_string formatter ")" else ())

let rec strip_quant fm = 
  match fm with
    Forall(x,(Forall(_,_) as yp)) 
  | Exists(x,(Exists(_,_) as yp)) -> let xs,q = strip_quant yp in x::xs,q
  | Forall(x,p) 
  | Exists(x,p) -> [x],p 
  | _ -> [],fm

let print_formula formatter pfn =
  let rec print_formula pr fm =
    match fm with
      False -> pp_print_string formatter "false"
    | True -> pp_print_string formatter "true"
    | Atom(pargs) -> pfn formatter pr pargs
    | Not(p) -> bracket formatter (pr > 10) 1 (print_prefix 10) "~" p
    | And(p,q) -> bracket formatter (pr > 8) 0 (print_infix 8 "/\\") p q
    | Or(p,q) -> bracket formatter (pr > 6) 0 (print_infix 6 "\\/") p q
    | Imp(p,q) -> bracket formatter (pr > 4) 0 (print_infix 4 "==>") p q
    | Iff(p,q) -> bracket formatter (pr > 2) 0 (print_infix 2 "<=>") p q
    | Forall(_,_) -> bracket formatter (pr > 0) 2 print_qnt "forall" (strip_quant fm)
    | Exists(_,_) -> bracket formatter (pr > 0) 2 print_qnt "exists" (strip_quant fm)
  and print_qnt qname (bvs,bod) =
    pp_print_string formatter qname;
    iter (fun v -> pp_print_string formatter " "; pp_print_string formatter v) bvs; 
    pp_print_string formatter "."; pp_print_space formatter (); 
    pp_open_box formatter 0; print_formula 0 bod; close_box()
  and print_prefix newpr sym p =
    pp_print_string formatter sym; print_formula (newpr+1) p
  and print_infix newpr sym p q = 
    print_formula (newpr+1) p; pp_print_string formatter (" "^sym); 
    pp_print_space formatter (); print_formula newpr q in
  print_formula 0

let print_qformula formatter pfn fm =
  pp_open_box formatter 0; pp_print_string formatter "<<";
  pp_open_box formatter 0; print_formula formatter pfn fm; pp_close_box formatter (); 
  pp_print_string formatter ">>"; pp_close_box formatter (); pp_print_newline formatter ()

(* FOL Formula Parsing *)

let is_const_name s = for_all numeric (explode s) || s = "nil"

let rec parse_atomic_term vs inp = 
  match inp with
    [] -> failwith "term expected"
  | "("::rest -> parse_bracketed (parse_term vs) ")" rest
  | "-"::rest -> papply (fun t -> Fun("-",[t])) (parse_atomic_term vs rest)
  | f::"("::")"::rest -> Fun(f,[]),rest
  | f::"("::rest ->
    papply (fun args -> Fun(f,args))
           (parse_bracketed (parse_list "," (parse_term vs)) ")" rest)
  | a::rest ->
    (if is_const_name a && not(mem a vs) then Fun(a,[]) else Var a),rest
and parse_term vs inp =
  parse_right_infix "::" (fun (e1,e2) -> Fun("::",[e1;e2]))
    (parse_right_infix "+" (fun (e1,e2) -> Fun("+",[e1;e2])) 
      (parse_left_infix "-" (fun (e1,e2) -> Fun("-",[e1;e2]))
        (parse_right_infix "*" (fun (e1,e2) -> Fun("*",[e1;e2])) 
          (parse_left_infix "/" (fun (e1,e2) -> Fun("/",[e1;e2]))
            (parse_left_infix "^" (fun (e1,e2) -> Fun("^",[e1;e2])) 
              (parse_atomic_term vs)))))) inp

let make_parser pfn s =
  let expr,rest = pfn (lex(explode s)) in
    if rest = [] then expr else failwith "Unparsed input"

let tparser = make_parser (parse_term [])

let parse_infix_atom vs inp =
  let tm,rest = parse_term vs inp in
  if exists (nextin rest) ["="; "<"; "<="; ">"; ">="] 
  then papply (fun tm' -> Atom(R(hd rest,[tm;tm']))) (parse_term vs (tl rest))
  else failwith ""

let parse_atom vs inp =
  try parse_infix_atom vs inp with Failure _ -> 
    match inp with
      p::"("::")"::rest -> Atom(R(p,[])),rest
    | p::"("::rest ->
      papply (fun args -> Atom(R(p,args)))
             (parse_bracketed (parse_list "," (parse_term vs)) ")" rest)
    | p::rest when p <> "(" -> Atom(R(p,[])),rest 
    | _ -> failwith "parse_atom"

let fparser = make_parser (parse_formula (parse_infix_atom,parse_atom) [])

(* FOL Formula Printing *)

let rec print_term formatter prec fm = 
  match fm with
    Var x -> pp_print_string formatter x
  | Fun("^",[tm1;tm2]) -> print_infix_term formatter true prec 24 "^" tm1 tm2
  | Fun("/",[tm1;tm2]) -> print_infix_term formatter true prec 22 " /" tm1 tm2
  | Fun("*",[tm1;tm2]) -> print_infix_term formatter false prec 20 " *" tm1 tm2
  | Fun("-",[tm1;tm2]) -> print_infix_term formatter true prec 18 " -" tm1 tm2
  | Fun("+",[tm1;tm2]) -> print_infix_term formatter false prec 16 " +" tm1 tm2
  | Fun("::",[tm1;tm2]) -> print_infix_term formatter false prec 14 "::" tm1 tm2
  | Fun(f,args) -> print_fargs formatter f args
and print_fargs formatter f args = 
  pp_print_string formatter f;
  if args = [] then () else
    (pp_print_string formatter "(";
  pp_open_box formatter 0;
  print_term formatter 0 (hd args); pp_print_break formatter 0 0;
  iter (fun t -> pp_print_string formatter ","; pp_print_break formatter 0 0; print_term formatter 0 t)
  (tl args); 
  pp_close_box formatter ();
  pp_print_string formatter ")")
and print_infix_term formatter isleft oldprec newprec sym p q =
  if oldprec > newprec then (pp_print_string formatter "("; pp_open_box formatter 0) else (); 
  print_term formatter (if isleft then newprec else newprec+1) p;
  pp_print_string formatter sym;
  pp_print_break formatter (if String.sub sym 0 1 = " " then 1 else 0) 0; 
  print_term formatter (if isleft then newprec+1 else newprec) q;
  if oldprec > newprec then (pp_close_box formatter (); pp_print_string formatter ")") else ()

let tprinter formatter tm =
  pp_open_box formatter 0; pp_print_string formatter "<<";
  pp_open_box formatter 0; print_term formatter 0 tm; pp_close_box formatter (); 
  pp_print_string formatter ">>"; pp_close_box formatter (); pp_print_newline formatter ()

let print_atom formatter _ (R(p,args)) =
  if mem p ["="; "<"; "<="; ">"; ">="] && length args = 2
  then print_infix_term formatter false 12 12 (" "^p) (nth args 0) (nth args 1) 
  else print_fargs formatter p args

let fprinter formatter = print_qformula formatter print_atom