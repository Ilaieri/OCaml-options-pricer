open Core 
(* Random normally distributed number, using Box-Muller method *)
let randn = sqrt (-.2.0 *. log (Random.float 1.0)) *. cos (2.0 *. Float.pi *. (Random.float 1.0))