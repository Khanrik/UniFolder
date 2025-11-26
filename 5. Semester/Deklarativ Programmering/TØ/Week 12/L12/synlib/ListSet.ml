
let setify =
  let rec canonical = function
    x::(y::_ as rest) -> compare x y < 0 && canonical rest
  | _ -> true in
  fun l -> if canonical l then l else List.sort_uniq compare l

let union =
  let rec union l1 l2 =
    match (l1, l2) with
        ([], l2) -> l2
      | (l1, []) -> l1
      | ((h1::t1 as l1), (h2::t2 as l2)) ->
          if h1 = h2 then h1::(union t1 t2)
          else if h1 < h2 then h1::(union t1 l2)
          else h2::(union l1 t2) in
  fun s1 s2 -> union (setify s1) (setify s2)

let intersect =
  let rec intersect l1 l2 =
    match (l1, l2) with
        ([], _) -> []
      | (_, []) -> []
      | ((h1::t1 as l1), (h2::t2 as l2)) ->
          if h1 = h2 then h1::(intersect t1 t2)
          else if h1 < h2 then intersect t1 l2
          else intersect l1 t2 in
  fun s1 s2 -> intersect (setify s1) (setify s2)

let subtract =
  let rec subtract l1 l2 =
    match (l1, l2) with
        ([], _) -> []
      | (l1, []) -> l1
      | ((h1::t1 as l1),(h2::t2 as l2)) ->
          if h1 = h2 then subtract t1 t2
          else if h1 < h2 then h1::(subtract t1 l2)
          else subtract l1 t2 in
  fun s1 s2 -> subtract (setify s1) (setify s2)

let subset,psubset =
  let rec subset l1 l2 =
    match (l1, l2) with
        ([], _) -> true
      | (_, []) -> false
      | (h1::t1, h2::t2) ->
          if h1 = h2 then subset t1 t2
          else if h1 < h2 then false
          else subset l1 t2
  and psubset l1 l2 =
    match (l1, l2) with
        (_, []) -> false
      | ([], _) -> true
      | (h1::t1, h2::t2) ->
          if h1 = h2 then psubset t1 t2
          else if h1 < h2 then false
          else subset l1 t2 in
  (fun s1 s2 -> subset (setify s1) (setify s2)),
  (fun s1 s2 -> psubset (setify s1) (setify s2))

let set_eq s1 s2 = (setify s1 = setify s2)

let insert x s = union [x] s

let image f s = setify (List.map f s)

let unions s = setify (List.flatten s)

let rec mem x lis =
  match lis with
    [] -> false
  | h::t -> compare x h = 0 || mem x t

let rec allsets m l =
  if m = 0 then [[]] else
  match l with
    [] -> []
  | h::t -> union (image (fun g -> h::g) (allsets (m - 1) t)) (allsets m t)

let rec allsubsets s =
  match s with
    [] -> [[]]
  | a::t -> let res = allsubsets t in
              union (image (fun b -> a::b) res) res

let allnonemptysubsets s = subtract (allsubsets s) [[]]

let image f s = setify (List.map f s)
