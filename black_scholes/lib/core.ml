type option_kind = Call | Put
let d1 s k t r vol = (log (s /. k) +. (r +. (vol ** 2.0 /. 2.0)  *. t) ) /. (vol *. sqrt t)
let d2 s k t r vol = d1 s k t r vol -. (vol *. sqrt t)
let stdnorm x = 0.5 *. (Float.erfc ( -.x /. sqrt 2.0))
let stdnormpdf x = ((2.0 *. Float.pi)** -.0.5) *. (exp (-.(x**2.0)/.2.0))