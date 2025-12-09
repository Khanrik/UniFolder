type nat = Z | Suc of nat

(*$inject
let rec string_of_nat x =
  match x with
    Z -> "Z"
  | Suc Z -> "Suc Z"
  | Suc y -> "Suc (" ^ string_of_nat y ^ ")"

let rec num = function
  0 -> Z
| n -> Suc (num (n - 1))
*)

(* val monus : nat -> nat -> nat *)
let rec monus (x: nat) (y: nat): nat = 
  match x,y with
  Z, _ -> Z
  | x, Z -> x
  | Suc x', Suc y' -> monus x' y';;
  
(*$= monus & ~printer:string_of_nat
  (num 0) (monus (num 0) (num 0))
  (num 0) (monus (num 0) (num 1))
  (num 1) (monus (num 1) (num 0))
  (num 3) (monus (num 7) (num 4))
  (num 0) (monus (num 4) (num 7))
*)

(* val div_rem : nat -> nat -> nat * nat *)
let div_rem (x: nat) (y: nat): nat * nat = 
  match y with
  Z -> (Z, x)
  | _ when x = y -> (Suc Z, Z)
  | _ -> let rec aux (num: nat) (den: nat) (count: nat): nat * nat =
    match monus num den with
    Z when num = den -> (Suc count, Z)
    | Z -> (count, num)
    | _ -> aux (monus num den) den (Suc count)
  in aux x y Z;;


(*$inject
let string_of_natpair (x, y) = "(" ^ string_of_nat x ^ ", " ^ string_of_nat y ^ ")"
*)

(* It does not matter what rem_nat returns for y = Z 
   The resulting pair shoud give "x = x / y + x rem y"
*)
(*$= div_rem & ~printer:string_of_natpair
  (num 0, num 0) (div_rem (num 0) (num 1))
  (num 0, num 0) (div_rem (num 0) (num 3))
  (num 1, num 0) (div_rem (num 1) (num 1))
  (num 2, num 0) (div_rem (num 2) (num 1))
  (num 2, num 0) (div_rem (num 4) (num 2))
  (num 0, num 4) (div_rem (num 4) (num 7))
  (num 1, num 3) (div_rem (num 7) (num 4))
*)

(*$inject
let string_of_intoption = function
  None -> "None"
| Some i -> "(Some " ^ string_of_int i ^ ")"
*)

(* val can : ('a -> 'b option) -> 'a -> bool *)
let can (f: 'a -> 'b option) (x: 'a): (bool) = 
  match f x with
  None -> false
  | Some _ -> true

(*$= can & ~printer:string_of_bool
  false (can (fun _ -> None) 1)
  true  (can (fun _ -> Some 1) 0)
*)

(* val ( |-> ) : 'a -> 'b -> ('a -> 'b option) -> 'a -> 'b option *)
let ( |-> ) (x: 'a) (y: 'b) (f: 'a -> 'b option) (z: 'a): 'b option = 
  match x = z with
  true -> Some y
  | false -> f z

(*$= ( |-> ) & ~printer:string_of_intoption
  None     ((0 |-> 0) (fun _ -> None) 1)
  (Some 0) ((0 |-> 0) (fun _ -> None) 0)
  (Some 2) ((0 |-> 0) (fun _ -> Some 2) 1)
  (Some 0) ((0 |-> 0) (fun _ -> Some 2) 0)
  (Some 1) ((0 |-> 1) ((0 |-> 0) (fun _ -> None)) 0)
*)

(* val undef : 'a -> 'b option *)
let undef _ = None

(*$= undef & ~printer:string_of_intoption
  None     (undef 0)
  None     ((0 |-> 0) undef 1)
  (Some 0) ((0 |-> 0) undef 0)
*)

(* val repeat : ('a -> 'a option) -> 'a -> 'a option *)
let rec repeat (f: 'a -> 'a option) (x: 'a): 'a option = 
  match f x with
  None -> Some x
  | Some y -> repeat f y

(*$= undef & ~printer:string_of_intoption
  (Some 0)     (repeat undef 0)
  (Some 0)     (repeat ((1 |-> 2) undef) 0)
  (Some 2) (repeat ((0 |-> 1) ((1 |-> 2) undef)) 0)
*)

type color = Red | Black

type 'a rbtree = RBNode of color * 'a * 'a rbtree * 'a rbtree
               | RBLeaf

(*$inject
let rt1 = RBLeaf
let rt2 = RBNode (Black, 3, RBLeaf, RBLeaf)
let rt6 = RBNode (Black, 2, RBNode (Black, 1, RBLeaf, RBLeaf),
                            RBNode (Red, 4, RBNode (Black, 3, RBLeaf, RBLeaf),
                                            RBNode (Black, 5, RBLeaf, RBLeaf)))
*)

(* val rbvisit_rev : ('a -> 'b -> 'b) -> 'b -> 'a rbtree -> 'b *)
let rbvisit_rev f r t = 
  let rec visit_acc m = function
  RBNode (_, y, a, b) -> visit_acc (f y (visit_acc m a)) b
  | RBLeaf -> m in
  visit_acc r t

(*$inject
let string_of_int_list xs =
  let rec follow = function
    [] -> ""
  | x::xs -> "; " ^ string_of_int x ^ follow xs in
  let first = function
    [] -> ""
  | x::xs -> string_of_int x ^ follow xs in
  "[" ^ first xs ^ "]"
*)
(*$= rbvisit_rev & ~printer:string_of_int_list
  []              (rbvisit_rev (fun x xs -> x::xs) [] rt1)
  [3]             (rbvisit_rev (fun x xs -> x::xs) [] rt2)
  [5; 4; 3; 2; 1] (rbvisit_rev (fun x xs -> x::xs) [] rt6)
*)