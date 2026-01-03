#import "imports.typ":*

= Limit Cycles

Consider the system:
$ (d x_1) / (d t) = x_1 - x_2 - x_1 (x_1^2 + x_2^2) $
$ (d x_2) / (d t) = x_1 + x_2 - x_2 (x_1^2 + x_2^2) $

== Linear Stability Analysis
At the fixed point $(overline(x)_1, overline(x)_2) = (0, 0)$:
The Jacobian is:
$ J|_(0,0) = mat(1, -1; 1, 1) $
The eigenvalues are $lambda = 1 plus.minus i$.
Since the real part is positive ($1 > 0$), the origin is an *Unstable Spiral*.

== Lyapunov Direct Method
Consider the Lyapunov function candidate:
$ V(x_1, x_2) = x_1^2 + x_2^2 $
Taking the time derivative along trajectories:
$ (d V) / (d t) = (partial V) / (partial x_1) dot(x)_1 + (partial V) / (partial x_2) dot(x)_2 $
$ (d V) / (d t) = 2(x_1^2 + x_2^2) [1 - (x_1^2 + x_2^2)] $

Analysis:
+ If $x_1^2 + x_2^2 < 1$: $(d V) / (d t) > 0$. Trajectories move away from the origin (Unstable).
+ If $x_1^2 + x_2^2 = 1$: $(d V) / (d t) = 0$. This implies a periodic orbit (Limit Cycle).
+ If $x_1^2 + x_2^2 > 1$: $(d V) / (d t) < 0$. Trajectories move inwards (Stable).

Thus, we obtain a stable *Limit Cycle* at $r = 1$.

---

= Poincaré-Bendixson Theorem

Let $R$ be a closed, bounded region in the plane for a 2D autonomous system.
+ If all vector fields on the boundary of $R$ point inwards (making $R$ a *trapping region*).
+ And if there are no fixed points in $R$.
+ Then, any trajectory starting in $R$ must eventually approach a periodic orbit inside $R$.

== Example: Perturbed System
Consider the system in polar coordinates:
$ dot(r) = r(1 - r^2) + mu r cos(theta) $
$ dot(theta) = 1 $

We want to find a trapping region (an annulus $r_(min) < r < r_(max)$).
We look for $r_(min)$ such that $dot(r) > 0$:
$ r(1 - r^2) + mu r cos(theta) > 0 $
$ 1 - r^2 > -mu cos(theta) $
Since $-mu cos(theta) <= mu$, it suffices to have $1 - r^2 > mu$.
$ r_(min) < sqrt(1 - mu) $

Similarly, for $r_(max)$ such that $dot(r) < 0$:
$ r_(max) > sqrt(1 + mu) $
For $0 <= mu < 1$, no fixed points exist in the annulus, so a limit cycle exists.

---

= Lotka-Volterra Systems (Predator-Prey)

Equations:
$ (d x) / (d t) = alpha x - beta x y $
$ (d y) / (d t) = -gamma y + delta x y $
where parameters $alpha, beta, gamma, delta > 0$.

== Fixed Points
+ $(0, 0)$: Saddle point.
+ $(gamma/delta, alpha/beta)$: Non-trivial fixed point.

== Jacobian Analysis
At the non-trivial fixed point:
$ J = mat(0, -beta(gamma/delta); delta(alpha/beta), 0) $
Trace $tau = 0$, Determinant $Delta = alpha gamma > 0$.
Linear stability predicts a *Center* (neutral stability with purely imaginary eigenvalues).

== Conserved Quantity
We can separate variables:
$ (d y) / (d x) = (-y(gamma - delta x)) / (x(alpha - beta y)) $
$ (alpha - beta y) / y d y + (gamma - delta x) / x d x = 0 $
Integrating gives the conserved quantity (Lyapunov function):
$ V(x, y) = delta x - gamma ln(x) + beta y - alpha ln(y) = C $
The level sets of $V$ are closed orbits (periodic solutions).

This system can be written as a Hamiltonian system using the transformation $x = e^p, y = e^q$.

---

= Selkov Model (Glycolysis)

Equations:
$ (d x_1) / (d t) = -x_1 + a x_2 + x_1^2 x_2 $
$ (d x_2) / (d t) = b - a x_2 - x_1^2 x_2 $

== Nullclines
+ $dot(x)_1 = 0 implies x_2 = x_1 / (a + x_1^2)$
+ $dot(x)_2 = 0 implies x_2 = b / (a + x_1^2)$

== Fixed Point
Intersection occurs at:
$ x_1 = b $
$ x_2 = b / (a + b^2) $
Fixed point: $(b, b / (a + b^2))$.

== Stability
Jacobian $J$ at the fixed point determines stability.
+ $Delta = a + b^2 > 0$ (Always positive).
+ Trace $tau$ determines Hopf bifurcation.
If $tau = 0$, a *Hopf Bifurcation* occurs, leading to the creation of limit cycles.

---

= Josephson Junction

In the overdamped limit, the equation for the phase difference $phi$ is:
$ dot(phi) + alpha dot(phi) + sin(phi) = I $
This can be written as a system ($phi = y$):
$ dot(phi) = y $
$ dot(y) = I - sin(phi) - alpha y $

== Fixed Points
Fixed points satisfy $y=0$ and $sin(phi) = I$.
+ If $I < 1$: Two fixed points exist (Stable Node/Spiral and Saddle).
+ If $I > 1$: No fixed points exist.

== Dynamics on a Cylinder
The phase space is a cylinder (since $phi$ is periodic mod $2pi$).
For $I > 1$, there are no fixed points. The flow goes around the cylinder.
We can define a *Poincaré Map* $P(y)$ from $phi = 0$ to $phi = 2pi$.
+ If $P(y^*) = y^*$, we have a periodic orbit (limit cycle of the second kind, corresponding to continuous rotation).

---

= Coupled Oscillators

Equations for two coupled phase oscillators:
$ dot(theta)_1 = omega_1 + k_1 sin(theta_2 - theta_1) $
$ dot(theta)_2 = omega_2 + k_2 sin(theta_1 - theta_2) $

Define phase difference $phi = theta_1 - theta_2$.
$ dot(phi) = (omega_1 - omega_2) - (k_1 + k_2) sin(phi) $

== Synchronization
+ If $|omega_1 - omega_2| < k_1 + k_2$: Fixed points exist for $phi$. The oscillators *synchronize* (phase lock).
+ If $|omega_1 - omega_2| > k_1 + k_2$: No fixed points. $phi$ drifts indefinitely (*Phase Drift* / Beats).