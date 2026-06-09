type option_kind = Call | Put

let payoff s k opt = 
  match opt with
  | Call -> max (s -. k) 0.0  
  | Put -> max (k -. s) 0.0
let d1 s k t r vol = (log (s /. k) +. (r +. (vol ** 2.0 /. 2.0)  *. t) ) /. (vol *. sqrt t)
let d2 s k t r vol = d1 s k t r vol -. (vol *. sqrt t)
let () =
  Printf.printf "Call payoff: %f\n" (payoff 110.0 100.0 Call);
  Printf.printf "Put payoff: %f\n" (payoff 90.0 100.0 Put);
  Printf.printf "d1: %f\n" (d1 100.0 100.0 1.0 0.05 0.2);
  Printf.printf "d2: %f\n" (d2 100.0 100.0 1.0 0.05 0.2)

