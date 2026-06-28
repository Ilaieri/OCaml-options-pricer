open Core 
(* Random normally distributed number, using Box-Muller method *)
let randn () = sqrt (-.2.0 *. log (Random.float 1.0)) *. cos (2.0 *. Float.pi *. (Random.float 1.0))
let simul_expiry_price s t r vol = s *. (exp ((r -. ((vol ** 2.0)/. 2.0 ))*.t +. (vol *. (sqrt t) *. (randn ()))))
let mc_list s t r vol n = List.init n (fun _ -> simul_expiry_price s t r vol)
let mc_total_payoff s k xs opt= List.fold_left (fun acc s_t -> acc +. payoff s_t k opt) 0.0 xs 
let mc_price s k t r vol opt n = exp (-.r *. t) *. ((mc_total_payoff s k (mc_list s t r vol n) opt) /. (Float.of_int n))
