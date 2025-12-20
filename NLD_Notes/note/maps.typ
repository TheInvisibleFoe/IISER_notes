#import "imports.typ":*
// #set page(
//   paper: "a4",
//   margin: (x: 2cm, y: 2cm),
// )
// #set text(
//   font: "New Computer Modern",
//   size: 11pt,
// )

= Maps

We consider discrete time dynamical systems:
$ y_(n+1) = g(y_n) $

*Fixed Points:*
A fixed point $overline(y)$ satisfies:
$ overline(y) = g(overline(y)) $

== Stability Analysis
Consider a small perturbation $epsilon_n$ around the fixed point:
$ y_n = overline(y) + epsilon_n $

Expanding $g(y_n)$ using Taylor series:
$ g(y_n) = g(overline(y) + epsilon_n) = g(overline(y)) + g'(overline(y)) epsilon_n + dots $
Since $y_(n+1) = overline(y) + epsilon_(n+1)$, and $g(overline(y)) = overline(y)$:
$ overline(y) + epsilon_(n+1) approx overline(y) + g'(overline(y)) epsilon_n $
$ epsilon_(n+1) approx g'(overline(y)) epsilon_n $

Let $lambda = g'(overline(y))$ be the multiplier.
* If $|g'| > 1$: The perturbation grows $arrow$ *Unstable*.
* If $|g'| < 1$: The perturbation decays $arrow$ *Stable*.

== Higher Dimensions
For $y in RR^n$, the derivative $g'$ becomes the *Jacobian Matrix* $D g|_(overline(y))$.
Stability is determined by the eigenvalues $mu_i$ of the Jacobian:
* Stable if $|mu_i| < 1$ for all $i = 1, dots, n$.
* Unstable if at least one $|mu_i| > 1$.

#figure(
  rect(width: 60%, height: 150pt, stroke: 1pt)[
      ],
  caption: "Cobweb plot illustrating stability."
)

---

= Bifurcations in Maps

Bifurcations occur when eigenvalues cross the unit circle in the Argand Plane (complex plane).

1.  *Flip Bifurcation (Period Doubling):* An eigenvalue crosses at $lambda = -1$.
2.  *Fold / Saddle-Node Bifurcation:* An eigenvalue crosses at $lambda = +1$.
3.  *Neimark-Sacker Bifurcation:* Complex conjugate eigenvalues cross the unit circle ($|lambda| = 1$) away from the real axis. This is the discrete-time analog of the Hopf bifurcation.

== Example: Logistic Map
$ x_(n+1) = a x_n (1 - x_n) $

*Fixed Points:*
Solve $f(x) = x$:
$ x = a x (1 - x) $
$ x - a x (1 - x) = 0 implies x (1 - a(1 - x)) = 0 $
Two fixed points:
1.  $overline(x)_1 = 0$
2.  $overline(x)_2 = 1 - 1/a$

*Stability:*
$ f'(x) = a (1 - 2x) $

1.  For $overline(x)_1 = 0$:
    $ f'(0) = a $.
    * Stable if $|a| < 1$.
    * Unstable if $a > 1$.

2.  For $overline(x)_2 = 1 - 1/a$:
    $ f'(1 - 1/a) = a (1 - 2(1 - 1/a)) = a (1 - 2 + 2/a) = a(-1 + 2/a) = 2 - a $.
    * Stable if $|2 - a| < 1 implies -1 < 2 - a < 1 implies 1 < a < 3$.
    * At $a = 3$, $f'(overline(x)) = -1$, leading to a *Flip Bifurcation* (Period Doubling).

#figure(
  rect(width: 80%, height: 150pt, stroke: 1pt)[
      ],
  caption: "Bifurcation diagram of the Logistic Map."
)

== Period Doubling to Chaos
As $a$ increases beyond 3, the stable fixed point becomes unstable and gives birth to a stable period-2 orbit.
$ f(x_1) = x_2, quad f(x_2) = x_1 $
This corresponds to fixed points of the second iterate map $f^((2))(x) = f(f(x))$.

The stability of the 2-cycle is determined by the chain rule:
$ (d) / (d x) f^((2))(x) = f'(x_2) f'(x_1) $

*Sharkovsky's Theorem implies:*
Period 3 $implies$ Chaos.
If a continuous map on an interval has a period-3 orbit, it has orbits of all other periods.
For the logistic map, the period-3 window appears near $a approx 1 + sqrt(8) approx 3.83$ (approx).
(Note: Notes mention $3 < a < 1 + sqrt(6)$ in context of pitchfork/flip analysis).

---

= Lyapunov Exponent

The Lyapunov exponent $lambda$ measures the average exponential rate of divergence of nearby trajectories.
Consider a small perturbation $delta_0$. After $n$ iterations:
$ |delta_n| approx |delta_0| e^(n lambda) $
$ lambda = lim_(n arrow infinity) 1/n ln | delta_n / delta_0 | $

Using the chain rule $delta_n = product_(i=0)^(n-1) f'(x_i) delta_0$:
$ lambda = lim_(n arrow infinity) 1/n ln | product_(i=0)^(n-1) f'(x_i) | = lim_(n arrow infinity) 1/n sum_(i=0)^(n-1) ln | f'(x_i) | $

* Interpretation:
    * $lambda < 0$: Stable fixed point or periodic orbit.
    * $lambda > 0$: *Chaotic*.
    * $lambda = 0$: Marginally stable (bifurcation point).

To calculate this, we need the distribution of $x$ (Invariant measure / PDF). We use the Ergodic Hypothesis to replace the time average with an ensemble average.

---

= Tent Map

$ x_(n+1) = f(x_n) = cases(
  r x_n & "if " 0 <= x_n < 1/2,
  r (1 - x_n) & "if " 1/2 <= x_n <= 1
) $

For $r=2$:
$ f'(x_n) = cases(2 & "if " 0 <= x_n < 1/2, -2 & "if " 1/2 <= x_n <= 1) $

*Lyapunov Exponent for Tent Map ($r=2$):*
$ |f'(x)| = 2 $ everywhere (except at $1/2$).
$ lambda = integral_0^1 rho(x) ln |f'(x)| dif x = integral_0^1 rho(x) ln(2) dif x = ln(2) $
Since $ln(2) > 0$, the map is chaotic.

== Relation to Logistic Map ($a=4$)
There is a coordinate transformation between the Logistic Map ($a=4$) and the Tent Map ($r=2$).
Let $y_n$ be the Logistic variable and $x_n$ be the Tent variable.
$ x_n = 2/pi arcsin(sqrt(y_n)) $
This homeomorphism proves they are topologically conjugate.

*Invariant Density (PDF) for Logistic Map:*
The Tent map has a uniform density $rho(x) = 1$.
Using the transformation:
$ rho(y) = rho(x) | (d x) / (d y) | $
$ rho(y) = 1 dot (d) / (d y) (2/pi arcsin(sqrt(y))) = 1 / (pi sqrt(y(1-y))) $
This is the invariant measure for the fully chaotic logistic map ($a=4$).

---

= Synchronization of Coupled Maps

Consider two coupled chaotic maps:
$ x_(n+1) = f(x_n) $
$ y_(n+1) = f(y_n) $
With symmetric coupling ($epsilon$):
$ x_(n+1) = (1 - epsilon) f(x_n) + epsilon f(y_n) $
$ y_(n+1) = epsilon f(x_n) + (1 - epsilon) f(y_n) $

Change of variables to average ($u$) and difference ($v$):
$ u_n = (x_n + y_n) / 2 $
$ v_n = (x_n - y_n) / 2 $

For synchronization, we need $v_n arrow 0$.
Linearizing the difference dynamics for small $v_n$:
$ v_(n+1) approx (1 - 2 epsilon) f'(u_n) v_n $

The *Transverse Lyapunov Exponent* $lambda_v$ governs stability:
$ lambda_v = lim_(n arrow infinity) 1/n sum ln | (1 - 2 epsilon) f'(x_i) | $
$ lambda_v = ln | 1 - 2 epsilon | + lambda_f $
where $lambda_f$ is the Lyapunov exponent of the single uncoupled map.
Synchronization occurs if $lambda_v < 0$.

---

= Other Maps

== Bernoulli Shift Map
$ x_(n+1) = 2 x_n mod 1 $
$ x_(n+1) = cases(
  2 x_n & "if " 0 <= x_n < 1/2,
  2 x_n - 1 & "if " 1/2 <= x_n <= 1
) $
This is related to bit-shifting operations on the binary representation of $x$.
$ x_n = 0.a_1 a_2 a_3 dots = sum a_i / 2^i $
Multiplying by 2 shifts the bits to the left and drops the integer part. It exemplifies sensitivity to initial conditions.

== Baker's Map (2D)
A generalization of the Bernoulli shift to 2D, involving stretching and folding.
$ x_(n+1) = 2 x_n mod 1 $
$ y_(n+1) = cases(
  a y_n & "if " 0 <= x_n < 1/2,
  1/2 + a y_n & "if " 1/2 <= x_n <= 1
) $
Jacobian:
$ J = mat(2, 0; 0, a) $
Determinant $det(J) = 2a$.
* If $a = 1/2$: Area preserving (Conservative).
* If $a < 1/2$: Dissipative (Fractal attractor).

== Hénon Map
Inspired by the stretching and folding of the Baker's map but using polynomial functions.
$ x_(n+1) = 1 - a x_n^2 + y_n $
$ y_(n+1) = b x_n $

*Jacobian:*
$ J = mat(-2 a x_n, 1; b, 0) $
Determinant $det(J) = -b$.
Since the determinant is constant ($b$), area contracts at a constant rate if $|b| < 1$.
Typical parameters for chaos: $a = 1.4, b = 0.3$.
This map exhibits a *Strange Attractor*.