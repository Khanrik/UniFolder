let rec sum_rec lst =
  if lst = [] then 0 else List.hd lst + sum_rec (List.tl lst)

(*$= sum_rec & ~printer:string_of_int
  0 (sum_rec [])
  0 (sum_rec [0])
  0 (sum_rec [0;0])
  1 (sum_rec [1])
  2 (sum_rec [1;1])
  3 (sum_rec[1;2])
*)