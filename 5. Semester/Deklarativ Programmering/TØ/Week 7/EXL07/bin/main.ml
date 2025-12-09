open Format
open Buffer
open Formula
let f = fparser "X ==> Y"
let _ = fprinter str_formatter f
let _ = print_string (contents stdbuf)