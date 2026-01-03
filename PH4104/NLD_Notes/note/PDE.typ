#import "imports.typ":*
#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
)
#set text(
  font: "New Computer Modern",
  size: 11pt,
)

= Non-linear systems with Partial Differential Equations (PDEs)

Consider a density $rho(vec(x), t)$ and flux $vec(q)(vec(x), t)$.
The conservation law is given by:
$ integral [(partial rho) / (partial t) + "div" vec(q)] dif V = 0 $
$ (partial rho) / (partial t) + "div" vec(q) = 0 $

In 1-D systems:
$ (partial rho) / (partial t) + (partial q) / (partial x) = 0 $

Assuming $q = Q(rho)$:
$ (partial rho) / (partial t) + c(rho) (partial rho) / (partial x) = 0 $
where $c(rho) = Q'(rho)$. This is the Kinematic Wave Equation.

If $c$ is constant, we get the *Linear Transport Equation*:
$ u_t + c u_x = 0 $

== Method of Characteristics

For the equation $u_t + c u_x = 0$, we consider curves $x(t)$ such that:
$ (d u) / (d t) = (partial u) / (partial t) + (d x) / (d t) (partial u) / (partial x) $
Comparing with the PDE, if we choose curves where $(d x) / (d t) = c$, then $(d u) / (d t) = 0$.

*Characteristic Curves:* $x - c t = "const" = xi$
*Solution:* $u(x, t) = f(xi) = f(x - c t)$
where $f(x)$ is determined by the initial condition $u(x, 0) = f(x)$.

The solution represents a traveling wave with velocity $c$.

=== Non-uniform Linear Transport
Equation: $u_t + c(x) u_x = 0$
Characteristics are defined by:
$ (d x) / (d t) = c(x) $
$ integral (d x) / (c(x)) = integral d t = t + "const" $

Define $b(x) = integral^x (d s) / (c(s))$. Then $b(x) - t = xi$.
The general solution is:
$ u(x, t) = f(b^(-1)(b(x) - t)) $

*Example:* $u_t - x u_x = 0$ with $u(x, 0) = 1 / (1 + x^2)$
Here $c(x) = -x$.
$ (d x) / (d t) = -x arrow ln|x| = -t + C arrow x e^t = "const" = xi $
Solution:
$ u(x, t) = f(x e^t) = 1 / (1 + (x e^t)^2) $

---

= General Method of Characteristics (Quasilinear PDE)

Consider the PDE:
$ a(x, y, u) (partial u) / (partial x) + b(x, y, u) (partial u) / (partial y) = c(x, y, u) $

This can be viewed as the dot product of a vector field $(a, b, c)$ with the surface normal vector $((partial u)/(partial x), (partial u)/(partial y), -1)$ being zero. Thus, the vector field is tangent to the solution surface.

Parameterize the characteristics by $s$:
$ (d x) / (d s) = a, quad (d y) / (d s) = b, quad (d u) / (d s) = c $

== Non-linear Transport Equation (Riemann Equation)
Equation:
$ u_t + u u_x = 0 $

Characteristic equations:
$ (d t) / (d s) = 1, quad (d x) / (d s) = u, quad (d u) / (d s) = 0 $

From $(d u) / (d s) = 0$, $u$ is constant along characteristics.
Since $u$ is constant, $(d x) / (d t) = u$ implies characteristic lines are straight lines with slope $1/u$.
$ x = u t + xi arrow xi = x - u t $
Implicit solution:
$ u(x, t) = f(x - u t) $

If $f$ is increasing ($alpha > 0$), characteristics spread out (*Rarefaction Wave*).
If $f$ is decreasing ($alpha < 0$), characteristics intersect.

=== Shock Waves
When characteristics intersect, the solution becomes multi-valued, leading to a shock (discontinuity).
The time of shock formation $t^*$ occurs when $(partial u) / (partial x) arrow infinity$.
$ (partial u) / (partial x) = (f'(xi)) / (1 + t f'(xi)) $
Blow up occurs when $1 + t f'(xi) = 0$.

*Rankine-Hugoniot Condition:*
The speed of the shock $s'(t)$ is related to the jump in $u$:
$ (d s) / (d t) = (J) / ([u]) = ([u^2/2]) / ([u]) = ((u_-^2 / 2) - (u_+^2 / 2)) / (u_- - u_+) = 1/2 (u_- + u_+) $
where $u_-$ is the value behind the shock and $u_+$ is ahead.

This is derived from the integral form of the conservation law:
$ (d) / (d t) integral_a^b u dif x = - [u^2/2]_a^b $

---

= Viscous Burgers' Equation

Equation:
$ u_t + u u_x = nu u_(x x) $

This combines non-linear transport (steepening) with diffusion (smoothing).
Using the Hopf-Cole transformation, this can be linearized to the Heat Equation.
$ u = -2 nu (phi_x) / phi $
Then $phi_t = nu phi_(x x)$.

Solution involves convolution with the heat kernel:
$ u(x, t) = (integral (- (x-y)/t) e^(-(x-y)^2 / (4 nu t)) e^(-1/(2 nu) integral_0^y f(eta) dif eta) dif y) / (integral e^(-(x-y)^2 / (4 nu t)) e^(-1/(2 nu) integral_0^y f(eta) dif eta) dif y) $

For traveling wave solutions $u(x, t) = v(x - c t)$, we get a profile connecting two states (e.g., $u_-$ to $u_+$), representing a smooth shock structure.

= KdV Equation and Solitons

The Korteweg-de Vries (KdV) equation is given by:
$ u_t + u_{x x x} + u u_x = 0 $

We apply the *Travelling Wave ansatz*:
$ xi = x - c t $
$ u(x, t) = v(xi) $

This leads to the *Soliton* solution, which has a $sech^2$ profile. This is useful in equilibration problems.

== FPUT Paradox and Hamiltonian Systems

The Fermi-Pasta-Ulam-Tsingou (FPUT) paradox involves a lattice with a nonlinear potential:
$ V(delta) = 1/2 k delta^2 + beta delta^3 $

Kruskal proposed that a continuous limit can be invoked.
The system has conserved quantities (Integrals of Motion), often denoted as $T_n$ or $I_n$.

- *Mass / Momentum:* $T_1 = u$
- *Energy:* $T_2 = u^2 / 2 + u_{x x}$ (Note: Standard form is usually $u^2/2$)
- *Hamiltonian:* $T_3 = u^3 / 3 - u_x^2 / 2$

== Derivation of Travelling Wave ODE

Substituting $u(x, t) = v(x - c t)$ into the KdV equation:
$ -c v' + v''' + v v' = 0 $

Integrating once with respect to $xi$:
$ -c v + v'' + v^2 / 2 = A $
where $A$ is an integration constant. Assuming boundary conditions where $v, v', v'' -> 0$ as $xi -> infinity$, we set $A = 0$.

This reduces to a second-order ordinary differential equation (ODE):
$ v'' = c v - v^2 / 2 $
This can be analyzed as a particle in a potential well.

---

= Fisher's Equation

The Fisher equation describes a reaction-diffusion system. We start with the reaction term (Logistic growth):
$ u_t = mu u (1 - u) $

This has fixed points at $u=0$ and $u=1$.
 For $mu > 0$, the growth curve is a parabola starting at 0, peaking, and returning to 0 at 1.

Adding the diffusion term:
$ u_t = mu u (1 - u) + D u_{x x} $

== Steady State Analysis
For steady states ($u_t = 0$):
$ D u_{x x} + mu u (1 - u) = 0 $
$ u_{x x} = - mu / D u (1 - u) $

We convert this to a system of first-order equations:
$ u_x = v $
$ v_x = - mu / D u (1 - u) $

*Fixed Points:*
Solving $v = 0$ and $-mu/D u(1-u) = 0$ gives two fixed points in phase space:
1.  $(u, v) = (0, 0)$
2.  $(u, v) = (1, 0)$

*Jacobian Analysis:*
The Jacobian matrix is:
$ J = mat(
  0, 1;
  -mu/D (1 - 2u), 0
) $

1.  *At (0,0):*
    $ J(0,0) = mat(0, 1; -mu/D, 0) $
    $ Delta = mu / D > 0 $, $ "Tr" = 0 $.
    Since the trace is zero and determinant is positive, this is a *Center* (Linear stability). However, due to nonlinear terms, it might differ, but locally trajectories circle the origin.

2.  *At (1,0):*
    $ J(1,0) = mat(0, 1; mu/D, 0) $
    $ Delta = -mu / D < 0 $.
    Since the determinant is negative, this is a *Saddle Point*.

== Boundary Conditions
* *Dirichlet Boundary Conditions (DBC):* $u(0) = u(L) = 0$.
* *Neumann Boundary Conditions (NBC):* $u'(0) = u'(L) = 0$.

Due to reversibility considerations in the steady state equation, NBC might not be feasible for non-trivial solutions connecting states. For DBC, solutions like $u approx C sin(sqrt(mu/D) x)$ exist for small amplitudes.

This leads to a *Critical Length* $L^*$ below which no non-trivial solution can exist (population goes extinct):
$ L^* = pi sqrt(D / mu) $

---

= Travelling Waves in Fisher's Equation

We look for solutions of the form $u(x, t) = phi(x - c t) = phi(xi)$.
Boundary conditions:
$ phi(-infinity) = 1 $ (Populated past)
$ phi(+infinity) = 0 $ (Empty future)

Substituting into the PDE:
$ -c phi' = D phi'' + mu phi (1 - phi) $
$ phi'' + c/D phi' + mu/D phi (1 - phi) = 0 $

Let $phi' = psi$. The system becomes:
$ phi' = psi $
$ psi' = -c/D psi - mu/D phi (1 - phi) $

*Fixed Points Analysis:*
1.  *At (0,0) (The "Empty" state ahead):*
    $ J(0,0) = mat(0, 1; -mu/D, -c/D) $
    Eigenvalues are determined by $lambda^2 - "Tr" lambda + Delta = 0$.
    $ "Tr" = -c/D $, $ Delta = mu/D $.
    $ lambda = (-c/D plus.minus sqrt((c/D)^2 - 4 mu/D)) / 2 $

    For the solution to be physically stable (non-oscillatory approach to 0, since population $u$ cannot be negative), we require real eigenvalues:
    $ (c/D)^2 - 4 mu/D >= 0 $
    $ c^2 >= 4 D mu $
    $ c >= 2 sqrt(D mu) $

2.  *At (1,0) (The "Populated" state behind):*
    $ J(1,0) = mat(0, 1; mu/D, -c/D) $
    $ Delta = -mu/D < 0 $. This is a *Saddle Point*.

== Critical Velocity
The minimum velocity for a stable travelling wave front is:
$ c^* = 2 sqrt(D mu) $

* If $c < 2 sqrt(D mu)$: The fixed point at $(0,0)$ is a stable spiral. This implies $phi$ would oscillate around 0, leading to negative population values (unphysical).
* If $c >= 2 sqrt(D mu)$: The fixed point is a stable node. The wavefront decays monotonically to zero.

Thus, the travelling wave solution exists only for speeds $c >= c^*$.

= KdV Equation

The Korteweg-de Vries (KdV) equation is given by:
$ u_t + u_{x x} + u u_x = 0 $

We look for *Solitonic solutions* using the travelling wave ansatz:
$ xi = x - c t $
$ u(x, t) = v(xi) $

== Hamiltonian Formulation (FPUT Context)
Related to the Fermi-Pasta-Ulam-Tsingou (FPUT) problem with potential:
$ V(s) = 1/2 k s^2 + beta s^3 $
Hamiltonian:
$ H = sum 1/2 m dot(u)_n^2 + sum phi(u_{n+1} - u_n) $

If the system is integrable, we have conserved quantities (Integrals of Motion) ${T_n, I_n}$ which are infinite in number.

== Derivation of Soliton ODE
Substituting $u(x, t) = v(x - c t)$ into the KdV equation:
$ -c v' + v''' + v v' = 0 $

Integrating once with respect to $xi$:
$ -c v + v'' + 1/2 v^2 = k $
Assuming boundary conditions where $v, v', v'' -> 0$ at infinity, we set the integration constant $k = 0$.

This reduces to a system of first-order ODEs:
$ (d v) / (d xi) = w $
$ (d w) / (d xi) = c v - v^2 / 2 $

*Fixed Points:*
Setting derivatives to zero:
1.  $w = 0$
2.  $c v - v^2 / 2 = 0 implies v(c - v/2) = 0$

Fixed points are $(0, 0)$ and $(2c, 0)$.

*Jacobian Analysis:*
$ J = mat(0, 1; c - v, 0) $

+   *At $(0,0)$:*
    $ J = mat(0, 1; c, 0) $
    Eigenvalues: $lambda^2 - c = 0 implies lambda = plus.minus sqrt(c)$.
    Since $c > 0$ (velocity), eigenvalues are real and opposite sign. This is a *Saddle Point*.

+   *At $(2c, 0)$:*
    $ J = mat(0, 1; c - 2c, 0) = mat(0, 1; -c, 0) $
    Eigenvalues: $lambda^2 + c = 0 implies lambda = plus.minus i sqrt(c)$.
    This is a *Center* (linear analysis).

The soliton solution corresponds to a *homoclinic orbit* connecting the saddle point at the origin to itself.

---

= Turing Patterns (Reaction-Diffusion Systems)

Consider a reaction-diffusion system:
$ u_t = f(u, v) + D_u nabla^2 u $
$ v_t = g(u, v) + D_v nabla^2 v $

We look for a Turing instability, where a stable homogeneous equilibrium becomes unstable due to diffusion, leading to spatial patterns.

== Linear Stability Analysis
Let $(u_0, v_0)$ be a stable fixed point of the reaction kinetics (without diffusion).
Perturbation:
$ vec(w) = vec(u - u_0, v - v_0) tilde e^(lambda t) e^(i k x) $

The Jacobian with diffusion included is:
$ J_k = J_"reaction" - k^2 D $
$ J_k = mat(f_u - D_u k^2, f_v; g_u, g_v - D_v k^2) $

For Turing instability, we need:
1.  Trace $Tr < 0$ (for stability at $k=0$).
2.  Determinant $Delta(k) < 0$ for some $k != 0$ (to induce instability).

== The Brusselator Model
Equations:
$ u_t = A - (B+1)u + u^2 v + D_u u_{x x} $
$ v_t = B u - u^2 v + D_v v_{x x} $

Fixed point: $(u_0, v_0) = (A, B/A)$.

*Jacobian Matrix:*
$ J = mat(B - 1, A^2; -B, -A^2) $
(Note: Standard Brusselator Jacobian usually involves these terms).

Applying the perturbation analysis to find the critical parameter $B_c$ for instability.
We solve for eigenvalues $lambda$ of the matrix:
$ M = mat(lambda + k^2 D_u - (B-1), -A^2; B, lambda + k^2 D_v + A^2) $

The characteristic equation is:
$ lambda^2 - Tr dot lambda + "Det" = 0 $

We analyze the determinant condition for instability. The threshold occurs when the minimum of the determinant curve touches zero.

*Hopf Bifurcation:*
Occurs when $Tr = 0$.
$ b^H = k^2 (1 + D) + 1 + a^2 $
Note: If $k=0$, the perturbation has no spatial dependence, effectively reducing to the ODE case.

*Turing Bifurcation:*
Occurs when $"Det" = 0$.
$ b^T (k) = k^2 + 1 + a^2 / (k^2 D) + dots $
We minimize this function with respect to $k^2$ to find the critical wavenumber $k_c$ and critical parameter $b_c$.