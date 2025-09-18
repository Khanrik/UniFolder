let string_of_int_list xs =
  let rec follow xs =
    if xs = []
    then ""
    else "; " ^ string_of_int (List.hd xs) ^ follow (List.tl xs) in
  let first xs =
    if xs = []
    then ""
    else string_of_int (List.hd xs) ^ follow (List.tl xs) in
  "[" ^ first xs ^ "]"

  

(* a. *)
let mappm xs y z =
let rec opm xs =
  if xs = []
  then []
  else
    let sum = List.hd xs - z in
      sum + y :: opm (List.tl xs) in
opm xs

(*$= mappm & ~printer:string_of_int_list
  [] (mappm [] 0 0)
  [0] (mappm [0] 0 0)
  [1] (mappm [1] 1 1)
  [2; 3] (mappm [1; 2] 1 0)
  [0; 1] (mappm [1; 2] 0 1)
*)



(* b. *)
let sum a b = 
  a + b

let rec opm xs y z =
  if xs = []
  then []
  else
  sum (sum (List.hd xs) (-z)) (y) :: opm (List.tl xs) y z

let mappm_plain xs y z =
  opm xs y z

(*$= mappm_plain & ~printer:string_of_int_list
  [] (mappm_plain [] 0 0)
  [0] (mappm_plain [0] 0 0)
  [1] (mappm_plain [1] 1 1)
  [2; 3] (mappm_plain [1; 2] 1 0)
  [0; 1] (mappm_plain [1; 2] 0 1)
*)