open Core
let delta opt s k t r vol = 
  match opt with
  |Call->stdnorm (d1 s k t r vol)
  |Put->stdnorm (d1 s k t r vol) -. 1.0
let gamma s k t r vol = (stdnormpdf (d1 s k t r vol)) /. (s *. vol *. sqrt t)
let vega s k t r vol = s *. (stdnormpdf (d1 s k t r vol)) *. sqrt t
let theta opt s k t r vol = 
  match opt with
  |Call-> -.(s*.(stdnormpdf (d1 s k t r vol)) *. (vol/.(2.0 *. sqrt t))) -. (k *. exp (-. r *. t) *. stdnorm (d2 s k t r vol))
  |Put-> -.(s*.(stdnormpdf (d1 s k t r vol)) *. (vol/.(2.0 *. sqrt t))) +. (k *. exp (-. r *. t) *. stdnorm (-.(d2 s k t r vol)))
let rho opt s k t r vol =
  match opt with
  |Call->k *. t *. exp (-. r *. t) *. stdnorm (d2 s k t r vol)
  |Put-> k *. t *. exp (-. r *. t) *. stdnorm (-.(d2 s k t r vol))
  