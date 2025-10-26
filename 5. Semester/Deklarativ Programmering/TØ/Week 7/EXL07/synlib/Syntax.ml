open List

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
