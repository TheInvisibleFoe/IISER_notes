#import "imports.typ":*

= Hamilton's Variational Principles

The action $S$ is defined as the integral of the Lagrangian $L$ over time:
$ S = integral_(t_1)^(t_2) L dif t $

The principle of least action states that the variation of the action is zero ($delta S = 0$) along the true path:
$ (partial L) / (partial q_i) - (d) / (d t) ((partial L) / (partial dot(q)_i)) = 0 $
This is the Euler-Lagrange equation.

Define the Hamiltonian $H$ via the Legendre transform:
$ H(q_k, p_k, t) = sum p_k dot(q)_k - L(q_k, dot(q)_k, t) $

Taking the differential $d H$:
$ d H = d (sum p_k dot(q)_k - L) $
$ d H = sum (dot(q)_k d p_k + p_k d dot(q)_k) - sum ((partial L) / (partial q_k) d q_k + (partial L) / (partial dot(q)_k) d dot(q)_k) - (partial L) / (partial t) d t $

Using the definition of canonical momentum $p_k = (partial L) / (partial dot(q)_k)$, the terms involving $d dot(q)_k$ cancel out:
$ d H = sum dot(q)_k d p_k - sum (partial L) / (partial q_k) d q_k - (partial L) / (partial t) d t $

Comparing this to the total differential of $H(q, p, t)$:
$ d H = sum (partial H) / (partial q_k) d q_k + sum (partial H) / (partial p_k) d p_k + (partial H) / (partial t) d t $

We obtain Hamilton's Canonical Equations:
$ dot(q)_i = (partial H) / (partial p_i) $
$ dot(p)_i = - (partial H) / (partial q_i) $
$ (partial H) / (partial t) = - (partial L) / (partial t) $

If $H$ does not explicitly depend on time, $H$ (energy) is conserved.
If $q_i$ is cyclic (doesn't appear in $L$), then $p_i$ is conserved.

---

= Canonical Transformations

A transformation from coordinates $(q, p)$ to $(Q, P)$ is canonical if it preserves the form of Hamilton's equations.
$ dot(Q)_i = (partial K) / (partial P_i), quad dot(P)_i = - (partial K) / (partial Q_i) $
where $K(Q, P, t)$ is the new Hamiltonian.

This implies that the phase space volume is conserved (Liouville's Theorem).
$ V(t + d t) - V(t) = 0 $

The transformation satisfies the principle of least action in both coordinate systems:
$ delta integral (sum p_i dot(q)_i - H) dif t = 0 $
$ delta integral (sum P_i dot(Q)_i - K) dif t = 0 $

The integrands can differ by the total time derivative of a generating function $F$:
$ sum p_i dot(q)_i - H = sum P_i dot(Q)_i - K + (d F) / (d t) $

== Generating Functions
There are four basic types of generating functions depending on the variables they depend on.

+ *Type 1:* $F_1(q, Q, t)$
  $ p_i = (partial F_1) / (partial q_i), quad P_i = - (partial F_1) / (partial Q_i) $
  $ K = H + (partial F_1) / (partial t) $

+ *Type 2:* $F_2(q, P, t)$
  Using Legendre transform: $F_2 = F_1 + sum P_i Q_i$
  $ p_i = (partial F_2) / (partial q_i), quad Q_i = (partial F_2) / (partial P_i) $
  $ K = H + (partial F_2) / (partial t) $
  *Identity Transformation:* $F_2 = sum q_i P_i$ leads to $Q_i = q_i, P_i = p_i$.

+ *Type 3:* $F_3(p, Q, t)$
  $ F_3 = F_1 - sum p_i q_i $
  $ q_i = - (partial F_3) / (partial p_i), quad P_i = - (partial F_3) / (partial Q_i) $

+ *Type 4:* $F_4(p, P, t)$
  $ F_4 = F_2 - sum p_i q_i $
  $ q_i = - (partial F_4) / (partial p_i), quad Q_i = (partial F_4) / (partial P_i) $

=== Example: Harmonic Oscillator
Hamiltonian: $H = p^2 / (2m) + (m omega^2 q^2) / 2$
Generating function of Type 1:
$ F_1(q, Q) = (m omega q^2) / 2 cot Q $
This transformation leads to:
$ p = (partial F_1) / (partial q) = m omega q cot Q $
$ P = - (partial F_1) / (partial Q) = (m omega q^2) / (2 sin^2 Q) $

Solving for $q$ and $p$:
$ q = sqrt((2P) / (m omega)) sin Q $
$ p = sqrt(2 m omega P) cos Q $

The new Hamiltonian $K$ becomes:
$ K(Q, P) = omega P $
Equations of motion:
$ dot(Q) = (partial K) / (partial P) = omega arrow Q(t) = omega t + alpha $
$ dot(P) = - (partial K) / (partial Q) = 0 arrow P(t) = "constant" $

---

= Hamilton-Jacobi Theory

We seek a canonical transformation to variables $(Q, P)$ such that the new Hamiltonian $K = 0$.
This requires:
$ K = H + (partial F_2) / (partial t) = 0 $

Let the generating function be $S(q, P, t) = F_2(q, P, t)$, called Hamilton's Principal Function.
The Hamilton-Jacobi Equation (HJE) is:
$ H(q, (partial S) / (partial q), t) + (partial S) / (partial t) = 0 $

If $H$ is conserved (independent of time), we use the ansatz:
$ S(q, P, t) = W(q, P) - E t $
where $W$ is Hamilton's Characteristic Function. The HJE becomes:
$ H(q, (partial W) / (partial q)) = E $

=== Application to Harmonic Oscillator
$ 1 / (2m) ((partial S) / (partial q))^2 + 1 / 2 m omega^2 q^2 + (partial S) / (partial t) = 0 $
Using $S(q, t) = W(q) - E t$:
$ 1 / (2m) (W')^2 + 1 / 2 m omega^2 q^2 = E $
$ W(q) = integral sqrt(2m E - m^2 omega^2 q^2) dif q $

Integration leads to the solution for motion $q(t)$.

---

= Action-Angle Variables and Perturbation Theory

For integrable systems with conserved quantities $I_i$, we can transform to Action-Angle variables $(I, theta)$.
$ H(q, p) arrow H_0(I) $
$ dot(I)_i = - (partial H_0) / (partial theta_i) = 0 arrow I_i = "const" $
$ dot(theta)_i = (partial H_0) / (partial I_i) = omega_i(I) arrow theta_i = omega_i t + delta_i $

Consider a perturbed Hamiltonian:
$ H(J, theta) = H_0(J) + epsilon H_1(J, theta) $
We seek a canonical transformation $(J, theta) arrow (I, phi)$ using a generating function $S(I, theta)$:
$ S(I, theta) = I dot theta + epsilon S_1(I, theta) $

The new Hamiltonian $K(I)$ should depend only on $I$.
Expanding to first order in $epsilon$:
$ H_0(I) + epsilon (partial H_0) / (partial I) (partial S_1) / (partial theta) + epsilon H_1(I, theta) = K(I) $

To eliminate angle dependence, we choose $S_1$ such that it cancels the oscillating part of $H_1$.
Expanding $H_1$ and $S_1$ in Fourier series:
$ H_1 = sum_k H_1^((k))(I) e^(i k dot theta) $
$ S_1 = sum_k S_1^((k))(I) e^(i k dot theta) $

The condition becomes:
$ i (k dot omega) S_1^((k)) = - H_1^((k)) $
$ S_1^((k)) = (i H_1^((k))) / (k dot omega) $

*Small Divisor Problem:* If the frequencies are commensurate ($k dot omega approx 0$), the denominator vanishes, causing the series to diverge. This is a central problem in KAM theory.

= Action-Angle Variables

Consider a Hamiltonian system in action-angle variables $H_0(J_1, J_2)$.
The equations of motion are:
$ (d J_i) / (d t) = - (partial H_0) / (partial theta_i) = 0 implies J_i = "const" $
$ (d theta_i) / (d t) = (partial H_0) / (partial J_i) = omega_i(vec(J)) $

The non-degeneracy condition is required:
$ det( (partial omega_i) / (partial J_j) ) != 0 $

If the frequency ratio $omega_1 / omega_2$ is irrational, the trajectory covers the torus densely. If rational, the orbits are closed.

= KAM Theorem (Kolmogorov-Arnold-Moser)

The theorem addresses the stability of quasi-periodic motions (tori) under small perturbations.
Books on classical mechanics often refer to this.

+ *Statement:* If the frequencies are sufficiently irrational, the invariant tori are stable under small perturbations ($epsilon << 1$).
+ *Diophantine Condition:* A torus with frequency ratio $omega_1 / omega_2$ survives if there exist constants $k, tau$ such that for all integers $m, s$:
  $ | omega_1 / omega_2 - m / s | > (k(epsilon)) / s^(tau) $
  (Notes mention $s^(5/2)$).

As perturbation $epsilon$ increases, the resonant regions (where ratios are rational like $1/3, 1/2, 2/3$) grow, destroying the nearby tori.

= Mechanism of Tori-Breaking (Poincaré-Birkhoff Theorem)

Consider a rational torus where resonant condition holds:
$ a(r) = omega_1 / omega_2 = n / s $
The unperturbed map $T$ is a twist map:
$ r_(i+1) = r_i $
$ theta_(i+1) = theta_i + 2 pi a(r_i) $

For the $s$-th iterate of the map $T^s$:
$ T^s mat(r_0; theta_0) = mat(r_0; theta_0 + 2 pi (n/s) s) = mat(r_0; theta_0 + 2 pi n) equiv mat(r_0; theta_0) $
Thus, every point on the rational torus is a fixed point of the $s$-th iterate.

== Perturbation
Now add a perturbation $epsilon$:
$ r_(i+1) = r_i + epsilon f(r_i, theta_i) $
$ theta_(i+1) = theta_i + 2 pi a(r_i) + epsilon g(r_i, theta_i) $
The map must remain area-preserving (conservative).

According to the *Poincaré-Birkhoff Theorem*:
+ Not all fixed points survive the perturbation.
+ An even number of fixed points survive for the $s$-th iterate.
+ They alternate between *Elliptic* (stable) and *Hyperbolic/Saddle* (unstable) fixed points.
+ This creates a chain of islands (stable regions around elliptic points) separated by saddle points.

= Homoclinic Bifurcations and Tangles

Consider the saddle fixed point $P$ formed from the broken torus.
+ $W^s(P)$: Stable manifold (set of points approaching $P$ as $n -> infinity$).
+ $W^u(P)$: Unstable manifold (set of points approaching $P$ as $n -> -infinity$).

== Homoclinic Point
If the stable and unstable manifolds intersect at a point $P'$ (transversal intersection), this point is called a *Homoclinic Point*.
+ Since $P'$ is on $W^s$, $f^n(P') -> P$ as $n -> infinity$.
+ Since $P'$ is on $W^u$, $f^n(P') -> P$ as $n -> -infinity$.

Because the map is continuous and invertible, the existence of one homoclinic point implies the existence of infinitely many. The manifolds must oscillate wildly to accommodate this, creating a structure known as the *Homoclinic Tangle*.

This complex geometry is a signature of *Chaos*.

= Smale Horseshoe Map

This map provides a geometric model for chaos, involving stretching and folding dynamics.

+ *Process:*
  1.  Start with a unit square region.
  2.  Stretch it into a long thin strip.
  3.  Fold it into a horseshoe shape.
  4.  Map it back onto the original square.

+ *Invariant Set:*
  The set of points that remain in the square for all forward and backward iterations constitutes a fractal set (Cantor set cross Cantor set).

+ *Symbolic Dynamics:*
  The dynamics on this invariant set are topologically conjugate to a shift map on a space of symbol sequences, demonstrating sensitivity to initial conditions and dense periodic orbits.