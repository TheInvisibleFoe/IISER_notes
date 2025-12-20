
#import "imports.typ": *

= Peierls's proof for Phase transition

Ising showed using spin-spin correlations that the 1D Ising model does not exhibit a phase transition, and incorrectly assumed that the same holds for higher dimensions. However, in a very short paper Rudolf Peierls @Peierls1936 showed that the 2D Ising model does exhibit a phase transition, using shorelines. We shall outline the proof here. This proof and subsequent explanations are taken from @Wolstat. 

The way Peierls's proof works is by showing that if we take a lattice and fix all spins on the boundary to be up, if the phase transition occurs then the probability of a site having spin antiparallel to the boundary inside the lattice should diverge to go to zero. Define $nu$ as a configuration of spins in our system. We consider three sets of spins configurations,

#figure(
  image("assets/heidelsets.png", width: 80%),
  caption: [
    The three sets of configurations considered in Peierls's proof. $Omega$ is the set of all configurations with up boundary conditions, $Omega_0$ is the set of configurations with one spin inside to be antiparallel to the boundary and $Omega_S$ is the set of configurations with a shoreline, which seperates islands of down spins in seas on up spins. (Source: @Wolstat)
  ]
)<peierlsfig>

We want to show that the probability of a configuration in $Omega_0$ goes to zero. To do this directly is hard, so we will instead find the probability of configurations in $Omega_S$. In $Omega_S$, we have shorelines which separate unlike spins from each other. Thus, if two spins $sigma_i$ and $sigma_j$ are separated by a shoreline, then their product is $sigma_i sigma_j = -1$. Then $Omega_S$ separates a configuration into islands of down spins and seas of up spins with length $s$. Then, the probability of a configuration in $Omega_0$ is given by the sum over all possible shorelines $S$. The probability of $nu in Omega_S$,
$
  P(nu in Omega_S) &= 1/Z_Omega sum_(nu in Omega_S) exp(beta H_nu) \ 
  &= 1/Z_Omega sum_(nu in Omega_S) exp(beta J sum_(i,j)  sigma_i sigma_j) \
$
We can separate the sum over the shorelines and the spin-spin contribution not over the shorelines,
$
  P(nu in Omega_S) &= 1/Z_Omega sum_(nu in Omega_S) exp(beta J n(S)) exp(beta J sum_(i,j in.not S )  sigma_i sigma_j) 
$
Consider a spin configuration $nu$ in $Omega_S$ and flip all the spins in the shoreline $S$, surrounding the center spin. Let this system be denoted as $Omega'_S$.
#figure(
  image("assets/fliping_peierls.png", width: 50%),
  caption: [
    The configuration $Omega'_S$ obtained by flipping all spins in the shoreline $S$ of the configuration $Omega_S$. (Source: @Wolstat)
  ]
)<peierlsfig2>
For all $nu'$ $in$ $Omega'_S$,
$
  sum_(i,j) sigma'_i sigma'_j = sum_(i,j in.not S) sigma'_i sigma'_j + sum_(i,j in S) sigma'_i sigma'_j = sum_(i,j in.not S) sigma'_i sigma'_j + n(S)
$ 
Note that flipping inside spins means $sigma'_i = - sigma_i$. Using this we obtain,
$
  sum_(i,j in.not S) sigma'_i sigma'_j = sum_(i,j in.not S) sigma_i sigma_j  
$
Thus, we can also say that,
$
  sum_(i,j in.not S) sigma_i sigma_j = sum_(i,j in.not S) sigma'_i sigma'_j - n(S) < sum_(i,j in.not S) sigma'_i sigma'_j
$
Following the calculations in @Wolstat, we can then write,
$
  P(nu in Omega_S) < e^(- beta J n(S))
$
Let $eta$ be the set of all shorelines. Then the probability of $nu in Omega_0$ is obtained by summing over all shorelines $S$,
$
  P(nu in Omega_0) = sum_(S in eta) P(nu in Omega_S)
  < sum_(n=1)^oo aleph(n) e^(- beta J n(S))
$
where $aleph(n)$ is the number of shorelines of length $n$. A very crude estimate can be found as,
$
  aleph(n) < 4^n
$
Using this we can write,
$
  P(nu in Omega_0) &< sum_(n=1)^oo aleph(n) ^(- beta J n(S)) < sum_(n=1)^oo (4 e^(- beta J))^n  -->_(lim beta --> oo) 0
$

Thus, for sufficiently low temperatures the probability of a configuration in $Omega_0$ goes to zero, which means that the probability of a spin being antiparallel to the boundary condition goes to zero. This shows that the 2D Ising model does exhibit a phase transition. For more details refer to @Peierls1936 and @Wolstat.

// Spellcheck done