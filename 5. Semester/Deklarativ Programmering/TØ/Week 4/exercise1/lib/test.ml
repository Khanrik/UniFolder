let rec factorial_rec i =
  if i = 0 then 1 else i * factorial_rec (i - 1)

  
let factorial i =
let j = ref 1 in
for k = 2 to i do
  j := !j * k
done ;
!j;;

(*$= factorial_rec & ~printer:string_of_int
  (factorial_rec 0) (factorial 0)
  (factorial_rec 1) (factorial 1)
  (factorial_rec 2) (factorial 2)
  (factorial_rec 5) (factorial 5)
  (factorial_rec 20) (factorial 20)
*)