open Core
module Greeks = Greeks
let payoff s k opt = 
  match opt with
  | Core.Call -> max (s -. k) 0.0  
  | Core.Put -> max (k -. s) 0.0
let c s k t r vol = s *. stdnorm (d1 s k t r vol) -. (k *. exp (-. r *. t) *. stdnorm (d2 s k t r vol))
let p s k t r vol = (k *. exp (-. r *. t) *. stdnorm(-. d2 s k t r vol)) -. (s *. stdnorm(-. d1 s k t r vol))

let price opt s k t r vol = 
  match opt with
  |Call -> c s k t r vol
  |Put -> p s k t r vol