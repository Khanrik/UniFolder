let ( ** ) = fun f g x -> f(g x)
let can f x = try f x; true with Failure _ -> false
let rec repeat f x = try repeat f (f x) with Failure _ -> x
let undef _ = failwith "undefined function"
let valmod x y f z = if z = x then y else f z
let ( |-> ) = fun x y -> valmod x y
let rec collect xs f = match xs with
  (x,y)::xs' -> collect xs' ((x|->y) f)
| [] -> f