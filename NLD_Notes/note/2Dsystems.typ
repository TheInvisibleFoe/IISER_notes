
#import "imports.typ":*
// #set page(
//   paper: "a4",
//   margin: (x: 2cm, y: 2cm),
// )
// #set text(
//   font: "New Computer Modern",
//   size: 11pt,
// )

= 2D Systems

The general form of a linear 2D system is:
$ (d x_1) / (d t) = a x_1 + b x_2 $
$ (d x_2) / (d t) = c x_1 + d x_2 $

In matrix notation:
$ (d vec(x)) / (d t) = M vec(x) $
The solution is given by:
$ vec(x)(t) = e^(A t) vec(x)(0) $

Let $eta_1$ and $eta_2$ be the eigenvectors of $A$ with eigenvalues $lambda_1$ and $lambda_2$.
$ e^(A t) eta_1 = e^(lambda_1 t) eta_1 $

The general solution is:
$ vec(x)(t) = C_1 e^(lambda_1 t) eta_1 + C_2 e^(lambda_2 t) eta_2 $

== Eigenvalues and Eigenvectors
The behavior depends on the nature of the eigenvalues $lambda$.

=== 1. Complex Eigenvalues
If $lambda = alpha plus.minus i beta$ and eigenvectors $vec(v) = vec(a) plus.minus i vec(b)$, the solution involves oscillations:
$ vec(x)(t) = C_1 e^(alpha t) [vec(a) cos(beta t) - vec(b) sin(beta t)] + C_2 e^(alpha t) [vec(a) sin(beta t) + vec(b) cos(beta t)] $

=== 2. Repeated Eigenvalues (Degenerate Case)
If the matrix $A$ is not diagonalizable, it can be brought to *Jordan Normal Form*:
$ J = mat(lambda, 1; 0, lambda) $
This occurs when there is a repeated eigenvalue and only one independent eigenvector.
The solution takes the form:
$ vec(x)(t) = C_1 e^(lambda t) vec(v_1) + C_2 e^(lambda t) (t vec(v_1) + vec(v_2)) $

---

= Linear Stability Analysis in 2D

Consider a nonlinear system:
$ dot(vec(x)) = f(vec(x)) $
Let $vec(x)^*$ be a fixed point such that $f(vec(x)^*) = 0$.
We consider a small perturbation $vec(epsilon)(t)$:
$ vec(x)(t) = vec(x)^* + vec(epsilon)(t) $

Linearizing around the fixed point using the Jacobian matrix $J$:
$ (d vec(epsilon)) / (d t) approx D f|_(x^*) vec(epsilon) $
where $D f$ is the Jacobian.

The stability is determined by the eigenvalues $lambda_1, lambda_2$ of the Jacobian.

== Classification of Fixed Points

1.  *Unstable Node:* $lambda_1 > lambda_2 > 0$. All trajectories move away.
2.  *Stable Node:* $lambda_1 < lambda_2 < 0$. All trajectories approach the fixed point.
3.  *Saddle Point:* $lambda_1 > 0 > lambda_2$. Unstable in one direction, stable in the other.
4.  *Spirals (Focus):* Eigenvalues are complex conjugate $lambda = alpha plus.minus i beta$.
    * *Unstable Spiral:* $alpha > 0$ (Real part positive).
    * *Stable Spiral:* $alpha < 0$ (Real part negative).
5.  *Center:* $lambda = plus.minus i beta$ (Purely imaginary, $alpha = 0$). Trajectories are periodic orbits (closed loops).
6.  *Star/Degenerate Node:* Repeated eigenvalues.


=== Trace-Determinant Classification
Let $tau = "Tr"(J)$ be the trace and $Delta = det(J)$ be the determinant. The characteristic equation is:
$ lambda^2 - tau lambda + Delta = 0 $
$ lambda_(1,2) = (tau plus.minus sqrt(tau^2 - 4 Delta)) / 2 $

- *Saddle Points:* $Delta < 0$.
- *Nodes:* $tau^2 > 4 Delta$ and $Delta > 0$.
    * Stable if $tau < 0$.
    * Unstable if $tau > 0$.
- *Spirals:* $tau^2 < 4 Delta$ and $Delta > 0$.
    * Stable if $tau < 0$.
    * Unstable if $tau > 0$.
- *Centers:* $tau = 0, Delta > 0$.
- *Degenerate/Star Nodes:* On the parabola $tau^2 = 4 Delta$.

---

= Application Example: Competitive Species
Consider the system:
$ dot(x) = x(3-x) - 2x y $
$ dot(y) = y(2-y) - x y $
Here $x$ and $y$ represent populations (e.g., rabbits and sheep).

== Fixed Points
We solve $f(x,y) = 0$:
1.  $(0,0)$: Extinction of both.
2.  $(0,2)$: Sheep only.
3.  $(3,0)$: Rabbits only.
4.  Intersection of nullclines: $3-x-2y=0$ and $2-y-x=0$ (Check if valid in first quadrant).

== Stability Analysis
The Jacobian is:
$ J = mat(3 - 2x - 2y, -2x; -y, 2 - x - 2y) $

1.  *At (0,0):*
    $ J = mat(3, 0; 0, 2) $
    $lambda_1 = 3, lambda_2 = 2$. Both positive $arrow$ *Unstable Node*.

2.  *At (0,2):*
    $ J = mat(3 - 4, 0; -2, 2 - 2) = mat(-1, 0; -2, 0) $ (Recalculate Jacobian evaluation carefully based on notes)
    Actually, notes indicate saddle behavior or stable node depending on parameters.
    For $(0,2)$: $x=0, y=2$. $J_{11} = 3-4 = -1$. $J_{22} = 2-0-4 = -2$.
    $J = mat(-1, 0; -2, -2)$.
    Eigenvalues are $-1, -2$. Both negative $arrow$ *Stable Node*.

3.  *At (3,0):*
    $x=3, y=0$. $J_{11} = 3-6 = -3$. $J_{22} = 2-3 = -1$.
    $J = mat(-3, -6; 0, -1)$.
    Eigenvalues are $-3, -1$. Both negative $arrow$ *Stable Node*.

*Interpretation:* The system exhibits *bistability*. Depending on initial conditions, one species drives the other to extinction. They cannot coexist stably in this specific configuration (Competitive Exclusion).

---

= Bifurcations and Periodic Orbits

== Hopf Bifurcation
A Hopf bifurcation occurs when a stable fixed point changes stability and gives birth to a periodic orbit (limit cycle) as a pair of complex eigenvalues crosses the imaginary axis ($mu = 0$).

*Normal Form (in polar coordinates):*
$ dot(r) = mu r - r^3 $
$ dot(theta) = omega $

* If $mu < 0$: Stable spiral at origin.
* If $mu > 0$: Unstable spiral at origin, stable limit cycle at $r = sqrt(mu)$.

This is a *Supercritical Hopf Bifurcation*.

== SNIC / SNIPER Bifurcation
(Saddle-Node Infinite Period)
A bifurcation on a periodic orbit where a saddle-node collision occurs on the cycle. As the parameter approaches the bifurcation, the period of oscillation diverges:
$ T prop 1 / sqrt(mu - mu_c) $
Unlike Hopf, where the period is roughly constant close to bifurcation, here the period goes to infinity.

== Homoclinic Bifurcation
A periodic orbit collides with a saddle point, creating a homoclinic orbit (a trajectory connecting a saddle point to itself) effectively breaking the cycle.

---

= Topological Equivalence and Hartman-Grobman

Two systems defined on sets $A$ and $B$ are *topologically equivalent* if there exists a homeomorphism (continuous, invertible map) $H: A arrow B$ that maps trajectories of one system onto the other, preserving direction of time.

== Hartman-Grobman Theorem
If $x^*$ is a *hyperbolic fixed point* (no eigenvalues with zero real part) of a nonlinear system $dot(x) = f(x)$, then the system is locally topologically equivalent to its linearization $dot(x) = J x$ near $x^*$.
This means the local phase portrait of the nonlinear system looks like the linear system (distorted but qualitatively the same).

*Example:*
$ dot(y) = -y $
$ dot(z) = z + y^2 $
Linearization at $(0,0)$ gives $dot(y)=-y, dot(z)=z$, which is a saddle. The nonlinear term $y^2$ bends the trajectories, but the local saddle structure remains.

== Stable and Unstable Manifolds
For a fixed point $p$:
* *Stable Manifold ($W^s$):* Set of initial conditions that approach $p$ as $t arrow infinity$.
* *Unstable Manifold ($W^u$):* Set of initial conditions that approach $p$ as $t arrow -infinity$.

*Example: Nonlinear Pendulum*
$ (d^2 theta) / (d t^2) = -sin(theta) $
Fixed points at $(k pi, 0)$.
* Even $k$ (downward): Centers (marginally stable in conservative case).
* Odd $k$ (upward): Saddles.
With dissipation (friction), centers become stable spirals.
