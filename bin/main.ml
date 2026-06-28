open Black_scholes
let () =
  (* Printf.printf "Call payoff: %f\n" (Core.payoff 110.0 100.0 Call);
  Printf.printf "Put payoff: %f\n" (Core.payoff 90.0 100.0 Put); *)
  (* Printf.printf "d1: %f\n" (d1 100.0 100.0 1.0 0.05 0.2);
  Printf.printf "d2: %f\n" (d2 100.0 100.0 1.0 0.05 0.2); *)
  Printf.printf "Price of a Call with params s=100 k=100 t=1 r=0.05 vol=0.2: %f\n" (price Call 100.0 100.0 1.0 0.05 0.2);
  Printf.printf "Price of a Put with params s=100 k=100 t=1 r=0.05 vol=0.2: %f\n" (price Put 100.0 100.0 1.0 0.05 0.2);
  Printf.printf "Delta: %f\n" (Greeks.delta Call 100.0 100.0 1.0 0.05 0.2);
  Printf.printf "Gamma: %f\n" (Greeks.gamma 100.0 100.0 1.0 0.05 0.2);
  Printf.printf "Vega: %f\n" (Greeks.vega 100.0 100.0 1.0 0.05 0.2);
  Printf.printf "Theta: %f\n" ((Greeks.theta Call 100.0 100.0 1.0 0.05 0.2)/.365.0);
  Printf.printf "Rho: %f\n" ((Greeks.rho Call 100.0 100.0 1.0 0.05 0.2)/.100.0);
  Printf.printf "IV %f\n" (impliedVol Call 100.0 100.0 1.0 0.05 0.1 10.450584);
  Printf.printf "Monte Carlo Simulated price for one instance %f\n" (Monte_carlo.simul_expiry_price 100.0 1.0 0.05 0.2);
  Printf.printf "Monte Carlo Simulated total %f\n" (Monte_carlo.mc_total_payoff 100.0 100.0 (Monte_carlo.mc_list 100.0 1.0 0.05 0.2 10000) Call);
  Printf.printf "Monte Carlo Simulated price  %f\n" (Monte_carlo.mc_price 100.0 100.0 1.0 0.05 0.2 Call 100000)



