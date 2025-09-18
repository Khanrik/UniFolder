let sum_it lst =
  let sum = ref 0 in
  let lst_cpy = ref lst in

  while !lst_cpy != [] do
    sum := !sum + List.hd !lst_cpy;
    lst_cpy := List.tl !lst_cpy;
  done;
  !sum

let rec sum_rec lst =
  if lst = [] then 0 else List.hd lst + sum_rec (List.tl lst)

(*$= sum_rec & ~printer:string_of_int
  (sum_rec []) (sum_it [])
  (sum_rec [0]) (sum_it [0])
  (sum_rec [0;0]) (sum_it [0;0])
  (sum_rec [1]) (sum_it [1])
  (sum_rec [1;1]) (sum_it [1;1])
  (sum_rec[1;2]) (sum_it[1;2])
*)