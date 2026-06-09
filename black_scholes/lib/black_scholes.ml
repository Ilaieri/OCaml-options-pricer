open Core
module Greeks = Greeks
(* Simple calculation of option payoff *)
let payoff s k opt = 
  match opt with
  | Core.Call -> max (s -. k) 0.0  
  | Core.Put -> max (k -. s) 0.0
(* Black Scholes pricing for calls and puts *)
let c s k t r vol = s *. stdnorm (d1 s k t r vol) -. (k *. exp (-. r *. t) *. stdnorm (d2 s k t r vol))
let p s k t r vol = (k *. exp (-. r *. t) *. stdnorm(-. d2 s k t r vol)) -. (s *. stdnorm(-. d1 s k t r vol))

let price opt s k t r vol = 
  match opt with
  |Call -> c s k t r vol
  |Put -> p s k t r vol
(* Implied volatility solver using the previously calculated vega (derivative of price w.r.t. volatiltity) and the newton raphson method *)
let rec impliedVol opt s k t r volGuess trueMarketPrice = 
  if (Float.abs ((price opt s k t r volGuess) -. trueMarketPrice) < 0.001) then
    volGuess
  else
    impliedVol opt s k t r (volGuess -. ((price opt s k t r volGuess) -. trueMarketPrice) /. (Greeks.vega s k t r volGuess)) trueMarketPrice