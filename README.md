
# OCaml Options Pricer

An options pricing engine, written in pure OCaml with no external dependencies.



## Features

- Pricing of both Put and Call european options using Black Scholes.
- Secondary pricing using Monte Carlo simulations to validate the analytical price independently.
- Calculation of the 5 greeks (delta, gamma, vega, theta, rho).
- Implied Volatility solver using Newton-Raphson.



## Run Locally

Clone the project

```bash
  git clone https://github.com/Ilaieri/OCaml-options-pricer
```

Go to the project directory

```bash
  cd OCaml-options-pricer
```
Build using dune

```bash
  dune build
```

Run using dune

```bash
  dune exec bin/main.exe
```


## Example output

```bash
=== Black-Scholes Pricing ===       
Call price: 10.450584
Put price:  5.573526

=== Greeks (S=100, K=100, T=1, r=0.05, vol=0.2) ===
Delta: 0.636831
Gamma: 0.018762
Vega:  37.524035
Theta: -0.156123 (per day)
Rho:   0.532325 (per 1% move in rates)

=== Implied Volatility ===
IV from market price 10.450584: 0.200005

=== Monte Carlo Validation ===
MC price (100,000 simulations): 10.434521
```

