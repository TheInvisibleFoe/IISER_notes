#import "imports.typ":*
#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
)
#set text(
  font: "New Computer Modern",
  size: 11pt,
)

= Conservative Systems

Consider the second-order system:
$ (d^2 x) / (d t^2) = F(t, x, dot(x)) $

Let $x_1 = x$ and $x_2 = dot(x)$.
We define some kind of *Energy functional*:
$ cal(E)(x_1, x_2) = x_2^2 / 2 + V(x_1) $

The time derivative is:
$ dot(x)_2 = F(t, x_1, x_2) $
$ (d cal(E)) / (d t) = (partial cal(E)) / (partial x_1) (d x_1) / (d t) + (partial cal(E)) / (partial x_2) (d x_2) / (d t) $

If the system is conservative, $(d cal(E)) / (d t) = 0$.

== Theorem
A conservative system cannot have a stable fixed point (attractor).
This can be shown by contradiction using a Hamiltonian $H$.

Consider a system described by:
$ dot(x)_1 = (partial H) / (partial x_2) = f_1(x_1, x_2) $
$ dot(x)_2 = -(partial H) / (partial x_1) = f_2(x_1, x_2) $

The equations of motion satisfy the divergence-free condition (Liouville's Theorem):
$ (partial f_1) / (partial x_1) + (partial f_2) / (partial x_2) = (partial^2 H) / (partial x_1 partial x_2) - (partial^2 H) / (partial x_2 partial x_1) = 0 $

=== Example
Consider the system derived from the Hamiltonian:
$ H(x_1, x_2) = -x_1^3 / 3 + x_1 x_2 - x_2^2 / 2 $

The equations of motion are:
$ dot(x)_1 = (partial H) / (partial x_2) = x_1 - x_2 $
$ dot(x)_2 = -(partial H) / (partial x_1) = -( -x_1^2 + x_2 ) = x_1^2 - x_2 $

*Fixed Points:*
Solving $dot(x)_1 = 0$ and $dot(x)_2 = 0$:
1.  $(0,0)$: Saddle point.
2.  $(1,1)$: Center.

*Level Curves:*
The trajectories lie on curves of constant energy:
$ -x_1^3 / 3 + x_1 x_2 - x_2^2 / 2 = "const" $

We can analyze the curvature using the Hessian matrix of $H$:
$ hat(H) = mat(-2x_1, 1; 1, -1) $

* At $(0,0)$: $hat(H) = mat(0, 1; 1, -1)$. Determinant is $-1 < 0 -->$ Saddle.
* At $(1,1)$: $hat(H) = mat(-2, 1; 1, -1)$. Determinant is $2 - 1 = 1 > 0$ and Trace is $-3 -->$ Local Maximum.
Near $(1,1)$, the level curves form closed loops (Centres).

= Gradient Systems

A gradient system is defined by a potential function $V(x)$:
$ dot(vec(x)) = - nabla V $

Properties:
1.  The potential $V$ decreases along trajectories:
    $ (d V) / (d t) = (nabla V) dot dot(vec(x)) = (nabla V) dot (-nabla V) = - ||nabla V||^2 leq 0 $
2.  Fixed points occur at extrema of $V$.
3.  No periodic orbits are possible (since $V$ must strictly decrease).

= Reversible Systems

A system is reversible if it is invariant under the transformation $t --> -t$ and $y --> -y$ (time reversal and reflection in phase space).
If a fixed point $(x^*, 0)$ is a linear center in the reversible system, then it is a nonlinear center (surrounded by closed orbits).

=== Example
$ dot(x) = y - y^3 $
$ dot(y) = -x - y^2 $

Fixed points:
1.  $(0,0)$: Linear center.
2.  $(-1, 1)$ and $(-1, -1)$: Saddle points.

The system exhibits a *Heteroclinic Orbit* connecting the saddle points.

#figure(
  rect(width: 80%, height: 100pt, stroke: none)[
    // Placeholder for diagram showing heteroclinic orbit
      ],
  caption: "Phase portrait showing heteroclinic orbits connecting saddle points."
)

= Stability Definitions

Consider the system $dot(vec(x)) = f(vec(x))$ with a fixed point $vec(x)^* = 0$.

1.  *Stable (Lyapunov Stable):*
    The fixed point is stable if for every $epsilon > 0$, there exists a $delta > 0$ such that:
    $ ||vec(x)(t_0)|| < delta implies ||vec(x)(t)|| < epsilon, quad forall t > t_0 $

2.  *Asymptotically Stable:*
    The fixed point is stable AND attractive:
    $ ||vec(x)(t_0)|| < delta implies lim_(t --> infty) ||vec(x)(t)|| = 0 $

= Lyapunov's Direct Method

Let $V(x_1, x_2)$ be a scalar function (Lyapunov function) in a region $U$.
* $V(vec(x)) = 0$ at the fixed point.
* $V(vec(x)) > 0$ for all $vec(x) neq 0$ (Positive Definite).

We examine the derivative of $V$ along trajectories:
$ dot(V)(vec(x)) = nabla V cdot f(vec(x)) $

- If $dot(V) leq 0$: The fixed point is *Stable*.
- If $dot(V) < 0$ (for $x neq 0$): The fixed point is *Asymptotically Stable*.
- If $dot(V) > 0$: The fixed point is *Unstable*.

=== Example 1
$ V(x_1, x_2) = x_1^2 + x_2^2 $
$ dot(V) = -2x_1^4 - 2x_2^4 < 0 $
This implies asymptotic stability for the associated system.

=== Example 2: Duffing-like Oscillator
$ dot(x) = y $
$ dot(y) = x - x^3 $
Construct Energy/Lyapunov function:
$ V(x, y) = (1)/(2)y^2 - int (x - x^3) d x = (1)/(2)y^2 - (1)/(2)x^2 + (1)/(4)x^4 $
To make it positive definite around equilibrium, we can adjust constants.
$ H(pm 1, 0) = -1/4 $. This represents a conservative system with periodic orbits around the centers.

= Van der Pol Oscillator

Equation:
$ dot.double(x) + mu(x^2 - 1)dot(x) + x = 0 $

Liénard form:
$ dot(x) = y $
$ dot(y) = -mu(x^2 - 1)y - x $

Using Energy function $alpha(x,y) = (1)/(2)(x^2 + y^2)$:
$ (d alpha) / (d t) = x dot(x) + y dot(y) = -mu y^2 (x^2 - 1) $

* If $|x| < 1$: $x^2 - 1 < 0 implies dot(alpha) > 0$ (Energy grows, damping is negative).
* If $|x| > 1$: $x^2 - 1 > 0 implies dot(alpha) < 0$ (Energy decays, damping is positive).

This balance leads to a stable *Limit Cycle*.

#figure(
  rect(width: 80%, height: 100pt, stroke: none)[
    // Placeholder for limit cycle diagram
      ],
  caption: "Limit cycle for the Van der Pol oscillator."
)

=== Example: Positive System Stability
$ dot(x)_1 = 1 - 2x_1 + x_2 $
$ dot(x)_2 = x_1 - x_2 $

Jacobian $J$:
$ J = mat(-2, 1; 1, -1) $
Trace $= -3$, Determinant $= 1$.
Since $Delta > 0$ and $tau < 0$, the fixed point is a *Stable Node*.

Using a logarithmic Lyapunov function candidate:
$ dot(alpha) = (1 - 2x_1 + x_2) ln(x_1) + (x_1 - x_2) ln(x_2) $
This relates to the property $-(alpha - beta)(ln alpha - ln beta) < 0$.