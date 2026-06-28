open Black_scholes
let () =
  Printf.printf "=== Black-Scholes Pricing ===\n";
  Printf.printf "Call price: %f\n" (price Call 100.0 100.0 1.0 0.05 0.2);
  Printf.printf "Put price:  %f\n" (price Put 100.0 100.0 1.0 0.05 0.2);
  Printf.printf "\n=== Greeks (S=100, K=100, T=1, r=0.05, vol=0.2) ===\n";
  Printf.printf "Delta: %f\n" (Greeks.delta Call 100.0 100.0 1.0 0.05 0.2);
  Printf.printf "Gamma: %f\n" (Greeks.gamma 100.0 100.0 1.0 0.05 0.2);
  Printf.printf "Vega:  %f\n" (Greeks.vega 100.0 100.0 1.0 0.05 0.2);
  Printf.printf "Theta: %f (per day)\n" ((Greeks.theta Call 100.0 100.0 1.0 0.05 0.2) /. 365.0);
  Printf.printf "Rho:   %f (per 1%% move in rates)\n" ((Greeks.rho Call 100.0 100.0 1.0 0.05 0.2) /. 100.0);
  Printf.printf "\n=== Implied Volatility ===\n";
  Printf.printf "IV from market price 10.450584: %f\n" (impliedVol Call 100.0 100.0 1.0 0.05 0.1 10.450584);
  Printf.printf "\n=== Monte Carlo Validation ===\n";
  Printf.printf "MC price (100,000 simulations): %f\n" (Monte_carlo.mc_price 100.0 100.0 1.0 0.05 0.2 Call 100000)