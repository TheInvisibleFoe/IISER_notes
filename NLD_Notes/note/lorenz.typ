#import "imports.typ":*

= Lorenz Equations

The Lorenz system is given by the following set of differential equations:
$ dot(x) = sigma (y - x) $
$ dot(y) = r x - y - x z $
$ dot(z) = x y - b z $

Parameters: $sigma, r, b > 0$.

== Properties

1.  *Symmetry:*
    The system is invariant under the transformation $(x, y, z) arrow (-x, -y, z)$.
    This implies that if $(x(t), y(t), z(t))$ is a solution, then $(-x(t), -y(t), z(t))$ is also a solution.

2.  *Dissipativity (Volume Contraction):*
    Consider a volume $V$ in phase space. The rate of change of volume is given by the divergence of the flow field $vec(f)$:
    $ (d V) / (d t) = integral_V (nabla dot vec(f)) dif V $
    Calculating the divergence:
    $ nabla dot vec(f) = (partial dot(x)) / (partial x) + (partial dot(y)) / (partial y) + (partial dot(z)) / (partial z) $
    $ nabla dot vec(f) = -sigma - 1 - b $
    Since $sigma, b > 0$, the divergence is always negative:
    $ (d V) / (d t) = -(sigma + 1 + b) V < 0 $
    The system is *dissipative*, meaning phase space volumes contract exponentially fast.

== Fixed Points

Fixed points satisfy $dot(x) = dot(y) = dot(z) = 0$:
1.  From $dot(x) = 0 implies y = x$.
2.  Substitute into $dot(y) = 0$: $r x - x - x z = 0 implies x(r - 1 - z) = 0$.
    + * Case A :* $x = 0 implies y = 0$. From $dot(z) = 0$, $-b z = 0 implies z = 0$.
        + *Fixed Point 1:* $C_0 = (0, 0, 0)$ (Origin).
    + * Case B:* $z = r - 1$. Substitute into $dot(z) = 0$: $x^2 - b(r - 1) = 0$.
        + $x = plus.minus sqrt(b(r-1))$.
        + Fixed Points $C_+$ and $C_-$ exist only if $r > 1$:
            $ C_(plus.minus) = (plus.minus sqrt(b(r-1)), plus.minus sqrt(b(r-1)), r-1) $

== Linear Stability Analysis

The Jacobian matrix is:
$ J(x, y, z) = mat(
  -sigma, sigma, 0;
  r - z, -1, -x;
  y, x, -b
) $

=== Stability of the Origin $(0,0,0)$
Evaluating $J$ at $(0,0,0)$:
$ J_0 = mat(
  -sigma, sigma, 0;
  r, -1, 0;
  0, 0, -b
) $
The $z$-direction is decoupled with eigenvalue $lambda_3 = -b$ (Stable).
The $x y$-block $A_(x y) = mat(-sigma, sigma; r, -1)$ determines the other eigenvalues.
* Determinant $det(A_(x y)) = sigma - sigma r = sigma(1 - r)$.
* Trace $"Tr"(A_(x y)) = -(sigma + 1) < 0$.

Classification based on $r$:
1.  *If $r < 1$:*
    * $det > 0$ and $"Tr" < 0$.
    * The origin is a *Stable Node* (or Sink). It is globally attracting.
2.  *If $r > 1$:*
    * $det < 0$.
    * The origin is a *Saddle Point* (Unstable).

=== Stability of $C_+$ and $C_-$
For these fixed points, the characteristic equation is cubic.
* For $1 < r < r_H$ (where $r_H = (sigma(sigma + b + 3)) / (sigma - b - 1)$): $C_+$ and $C_-$ are stable.
* At $r = r_H$: A *Subcritical Hopf Bifurcation* occurs. The fixed points lose stability, and unstable periodic orbits (saddle cycles) exist for $r < r_H$.

== Global Stability of Origin (for $r < 1$)

Construct a Lyapunov function:
$ V(x, y, z) = 1/sigma x^2 + y^2 + z^2 $
$V > 0$ everywhere except at the origin.
Taking the time derivative:
$ (d V) / (d t) = 2/sigma x dot(x) + 2 y dot(y) + 2 z dot(z) $
$ (d V) / (d t) = 2/sigma x (sigma(y-x)) + 2 y (r x - y - x z) + 2 z (x y - b z) $
$ (d V) / (d t) = 2 x y - 2 x^2 + 2 r x y - 2 y^2 - 2 x y z + 2 x y z - 2 b z^2 $
The term $2 x y z$ cancels out.
For $r < 1$, it can be shown that $(d V) / (d t) < 0$ everywhere (except origin).
Thus, the origin is *Globally Stable* for $r < 1$.

== Trapping Region

Since the system is dissipative, solutions must eventually enter and remain in a bounded region (Trapping Region).
Consider the surface defined by:
$ r x^2 + sigma y^2 + sigma (z - 2r)^2 <= C $
We examine the derivative of this distance function along trajectories to show that for large enough $C$, the flow points inward on the boundary.
This proves that trajectories are bounded and do not escape to infinity.


== Chaos

When $r$ is large (standard value $r = 28$), the system exhibits *Chaos*.
Characteristics:
1.  *Aperiodic long-time behavior:* Trajectories do not settle to fixed points or limit cycles.
2.  *Deterministic:* The equations are not random.
3.  *Sensitive Dependence on Initial Conditions:* Nearby trajectories diverge exponentially (Butterfly Effect).
4.  *Strange Attractor:* The trajectories settle onto a fractal set (the Lorenz Attractor).

=== The Lorenz Map
Since analyzing the 3D trajectory is difficult, Lorenz analyzed the local maxima of the $z(t)$ variable.
Let $z_n$ be the $n$-th local maximum. He plotted $z_(n+1)$ vs $z_n$.
The resulting plot resembles a "Tent Map".

$ z_(n+1) = f(z_n) $


This reduction to a 1D map explains the chaotic behavior and sensitivity to initial conditions (slope $|f'| > 1$ leads to expansion/divergence).
