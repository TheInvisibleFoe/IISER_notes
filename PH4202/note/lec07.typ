#import "imports.typ":*
= Magnetism


The properties of magnetic systems can be studied using statistical mechanics. The simplest model for magnetism is the Ising Model. Before we embark on a mean-field study of the Ising model, let us first draw an analogy between the thermodynamics of fluids and that of magnetic systems. We will try to draw heuristic analogies, between them.

Fluids are characterized by $U,V,T,P,N$. Suppose our fundamental equation is $U(S,V,N)$. Then,
$ dU = T dS - P dV + mu d N $. The extensive variables are $S,V,N$, and their conjugate intensive variables are $T,-P,mu$. Now since $S$ can be defined similarly for magnetic systems, as we can use the same statistical definition of entropy. As a result, $T$ can then be defined as the conjugate variable to $S$. $P$ is the conjugate variable to $V$. In magnetic systems, we have the additional variables of magnetization $M$, and applied magnetic field $H$. Note that magnetic field $M$ scales with the volume of the system, and is thus an extensive variable. The applied magnetic field $H$ is an intensive variable, which is a conjugate variable to $M$. Thus, we can draw the following analogies:

- Volume $V -> -M$ Average Magnetization.
- Pressure $P -> H$ Applied magnetic field.
- Helmholtz Free Energy $F(T, V, N) -> F(T, M, N)$
- Gibbs Free Energy $G(T, P, N) -> G(T, H, N)$

The negative in the analogy of $V$ and $M$ arises from the fact that increasing the pressure $P$ decreases the volume $V$, while increasing the applied field $H$ increases the magnetization $M$.

== Ising Model

The Ising Model was proposed by Wilhelm Lenz in 1920, and was given to his then PhD student, Ernst Ising. His PhD thesis solved the model in 1 dimension, which he showed does not exhibit a phase transition.

The Ising model Hamiltonian is modeled by simple nearest neighbour interactions. One considers discretizations in both space and in spin space. The discretization in space places the spin on a lattice(classically a square lattice).
The Hamiltonian is given by:
$ H{ss} = -J sum_(angle.l i, j angle.r) sigma_i sigma_j - h sum_i sigma_i $

- The spins can take the values $sigma_i in {+1, -1}$.
- The summation $angle.l i, j angle.r$ runs over nearest neighbors.
- In 1D, there are no phase transitions. This can be shown perfectly analytically, using two-point spin correlations.

== Mean Field Solution of the Ising Model

The mean field solution is found by considering $0$ fluctuations in equilibrium.
We approximate the interaction term by noting:
$ (ss_i - angle.l ss_i angle.r)(ss_j - angle.l ss_j angle.r) = 0 $
$ ss_i ss_j - angle.l ss_i angle.r ss_j - angle.l ss_j angle.r ss_i + angle.l ss_i angle.r angle.l ss_j angle.r = 0 $
Using this, one can write,
$
  -J sum_expval(i","j) ss_i ss_j approx - J expval(ss_i) sum_expval(i","j) ss_j  - J expval(ss_j) sum_expval(i","j) ss_i  + J expval(ss_i) expval(ss_j) sum_expval(i","j)
$
Since the model is translation invariant $expval(ss_i) = expval(ss_j) = expval(ss)$.

Suppose the nearest neighbour summation, can be re-written as,
$
  sum_expval(i","j) approx gamma/2 sum_(i=1)^N
$
This is the second part of the mean-field approximation. This basically states, that the interactions due to the neighbours can be throught of as a mean field over all spins. One can use weaker mean-field approximations like the Bethe-Peierls Approximation.

Using this one can write,
$
  H_"MF" &=  - J expval(ss) gamma/2 sum_(i=1)^N ss_j  - J expval(ss) gamma/2 sum_(i=1)^N ss_i  + J expval(ss) expval(ss) gamma/2 sum_(i=1)^N - h sum_(i=1)^N ss_i \
  &= -h_"eff" expval(ss) + J gamma/2 N expval(ss)^2
$<mf_mag>
where we denote the effective field as $h_("eff") = h + J gamma angle.l sigma angle.r$.

The two approximations, used to solve the model are,
1. There are zero fluctuations.
2. The nearest neighbour interaction can be replaced by a mean field.

One can also solve the mean field model without using the first approximation. See the solution in @mfsoln

== Partition Function
First, we try to evaluate the partition function for the mean field Hamiltonian, in the Gibbs canonical ensemble. The free energy functional is given by,
$ A(T, h) = -k_B T ln Z(T, h) $
Where the partition function is given by:
$ & Z(T, h) = sum_({sigma_i}) e^(-beta H_("MF")) \
  ==>& Z(T, h) = sum_({sigma_i = pm 1}) e^( -1/2 beta N J gamma angle.l sigma angle.r^2 + beta h_("eff") sum_(i=1)^N sigma_i ) \
 ==>& Z(T, h) = e^(-1/2 beta N J gamma angle.l sigma angle.r^2) product_(i=1)^N (sum_(sigma_i = plus.minus 1) e^(beta h_("eff") sigma_i)) \
 ==>& Z(T, h) = e^(-1/2 beta N J gamma angle.l sigma angle.r^2) (2 cosh(beta h_("eff")))^N $

The Free Energy per spin is:
$ A(T, h) = -k_B T ln Z = 1/2 N J gamma angle.l sigma angle.r^2 - N k_B T ln(2 cosh beta h_("eff")) $

The magnetization $m = angle.l sigma angle.r$ is:
$ m = -1/N (diff A) / (diff h) = beta kb T sinh(beta(h + J gamma m))/cosh(beta(h + J gamma m)) = tanh(beta(h + J gamma m)) $
In the zero field limit $h -> 0$, we get the transcendental equation for magnetization:
$ m = tanh(beta J gamma m) $

Let $x = beta J gamma m$, then:
$ (k_B T) / (J gamma) x = tanh(x) => T / T_c x = tanh(x) $
Where the critical temperature is $ T_c = (J gamma) / k_B $.

== Critical Exponents and Behavior

Near the critical point $t = (T - T_c) / T_c -> 0$:

- Specific Heat: $C tilde t^(-alpha)$
- Magnetization: $m tilde (-t)^beta$
- Susceptibility: $chi tilde t^(-gamma)$
- Equation of State: $H tilde |M|^delta$ (at $T = T_c$)

In Mean Field Theory, $beta = 1/2$.
Experimental data (e.g., $M n F_2$) shows $beta approx 0.33$, and 2D Ising gives $beta = 1/8$ due to conformal symmetry.

== Phase Diagrams and Hysteresis

// #figure(
//   cetz.canvas({
//     import cetz.draw: *
//     // Axes
//     line((-0.5, 0), (4, 0), mark: (end: ">"), name: "T-axis")
//     content((4.2, 0), $T$)
//     line((0, -2), (0, 2), mark: (end: ">"), name: "m-axis")
//     content((0, 2.2), $m$)

//     // Tc point
//     circle((2, 0), radius: 0.05, fill: black)
//     content((2, -0.3), $T = T_c$)

//     // h = 0 curves (Blue)
//     bezier((0, 1.8), (2, 0), (0.5, 1.8), (1.5, 0.5), stroke: blue)
//     bezier((0, -1.8), (2, 0), (0.5, -1.8), (1.5, -0.5), stroke: blue)
//     content((0.8, 1.2), $h=0$, fill: white)

//     // h != 0 curves (Green)
//     bezier((0, 1.9), (3.5, 0.4), (1, 1.9), (2.5, 0.8), stroke: green)
//     bezier((0, -1.9), (3.5, -0.4), (1, -1.9), (2.5, -0.8), stroke: green)
//     content((3, 0.7), $h != 0$, fill: white)
//   }),
//   caption: [Magnetization vs Temperature for the Ising Model]
// )

At $h=0$, there is a second-order phase transition at $T_c$.
At $h != 0$, there is no transition, but a crossover.
Below $T_c$, changing $h$ from positive to negative leads to a first-order transition with hysteresis.

== Bragg-Williams Approximation

Using the canonical ensemble for a Lattice Gas ($N_+$ up, $N_-$ down):
$ m = (N_+ - N_-) / N => N_+ / N = 1/2(m+1) $

Entropy from Stirling's approximation:
$ S / (N k_B) approx ln 2 - [ (1+m)/2 ln(1+m) + (1-m)/2 ln(1-m) ] $

Energy (ignoring correlations):
$ U = - (N J m^2 gamma) / 2 - N h m $

Minimizing $F = U - T S$ with respect to $m$ yields the same self-consistency equation:
$ h = (diff F) / (diff M) => m = tanh(beta(h + J gamma m)) $
