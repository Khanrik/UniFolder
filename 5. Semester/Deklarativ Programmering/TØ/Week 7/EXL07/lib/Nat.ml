type nat = Z | S of nat

let rec numc x = if x = 0 then Z else S (numc (x - 1))

let rec numf = fun x -> if x = 0 then Z else S (numf (x - 1))

let rec nump = fun x -> if (=) x 0 then Z else S (nump ((-) x 1))
