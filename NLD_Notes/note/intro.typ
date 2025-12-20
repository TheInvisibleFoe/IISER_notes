#import "imports.typ":*
// #set page(
//   paper: "a4",
//   margin: (x: 2cm, y: 2cm),
// )
// #set text(
//   font: "New Computer Modern",
//   size: 11pt,
// )

= Introduction

We divide the whole notes into six main sections:
1. Continuous flows: 1D flows, 2D flows, chaotic systems.
2. Discrete maps: fixed points, stability, bifurcations, chaos in maps, coupled maps and synchronization.
3. Fractals.(very brief)
4. Hamiltonian Dynamics and KAM theory.
5. Nonlinear PDEs : Method of characteristics, shocks and Solitons.
6. Misc Topics: Hopf and turing bifurcations, pattern formation.

These notes cover the fundamentals of one-dimensional flows in nonlinear dynamics, including fixed points, linear stability analysis, bifurcations, and applications such as the logistic model for population growth. Then we move on to 2D flows and their unique bifurcations. Then we explore chaotic systems, strange attractors, and fractals, only for the Lorenz system. Then we move onto discrete dynamical systems, covering fixed points, stability, bifurcations, and chaos in maps like the logistic map and Henon map.

The references are: \
*Reference Book:* Nonlinear Dynamics and Chaos by Steven Strogatz @strogatz2015(for 1,2,3).\
*Reference Book:* Lecture notes on Nonlinear Dynamics by Daniel Arovas @Arovas (for parts of 5 and 6).
\






= Introduction to 1-D Flows

The general form of a first-order differential equation is:
$ (d x) / (d t) = f(t, x(t)) $

For *autonomous systems*, generally there is no explicit time dependence:
$ (d x) / (d t) = f(x(t)) $

== Existence and Uniqueness
These differential equations, along with initial conditions, have a unique solution provided that the function $f$ is continuous.
*Picard-Lindeloef Theorem* guarantees this existence and uniqueness.
#theorem("Picard-Lindeloef Theorem")[

  Let $D subset RR times RR^n$. Let $f: D -> RR^n$ be a function continuous in $t$ and Lipschitz continuous in $x$, with Lipschitz constant independent of $t$. Then for any initial condition $(t_0, x_0) in D$, there exists $epsilon>0$, such that the initial value problem
  $
    y'(t) = f(t, y(t)), y(t_0) = x_0
  $
  has a unique solution on the interval $|t - t_0| < epsilon$.
]


== Example: Finite Escape Time
Consider the system:
$ (d x) / (d t) = 1 + x^2 $
With initial condition $x(t=0) = x_0$.

The solution is:
$ x(t) = tan(t + arctan(x_0)) $

For times $t = pi/2 - arctan(x_0) + k pi$, the solution goes to infinity ($x(t) -> infinity$). This phenomenon is called *finite escape time*.

Vector fields (quiver plots) can be used to visualize the flow, where arrows indicate the slope $dv(x,t)$.

---

== Fixed Points and Stability

Fixed points $x^*$ are points such that the flow stops:
$ dot(x) = 0 implies f(x^*) = 0 $
where $x in RR^n$. These represent the real solutions (equilibrium states) of the system.

#definition("Stability")[

- *Stable Fixed Point:* Flows tend to approach this point.
- *Unstable Fixed Point:* Flows move away from this point.
- The *basin of attraction* is the set of initial conditions that eventually flow toward a specific stable fixed point.
]
== Linear Stability Analysis
Nonlinear systems are hard to solve exactly. However, we can analyze the stability of fixed points using *linear stability analysis*. We linearize the system around the fixed points.

To determine stability mathematically, we consider a small perturbation $epsilon(t)$ away from a fixed point $x^*$:
$ x(t) = x^* + epsilon(t) $

Substituting this into the differential equation:
$ (d x) / (d t) = (d x^*) / (d t) + (d epsilon) / (d t) = f(x^* + epsilon(t)) $

Using Taylor expansion around $x^*$:
$ f(x^* + epsilon) approx f(x^*) + f'(x^*) epsilon + cal(O)(epsilon^2) $

Since $f(x^*) = 0$ (it is a fixed point) and $dv(x^*,t) = 0$, we get the linearized equation:
$ (d epsilon) / (d t) approx f'(x^*) epsilon $

The solution behaves as $ epsilon(t) = epsilon(0) exp[integral f'(x^*) d t] $

- If $f'(x^*) > 0$: The perturbation grows $arrow$ *Unstable*.
- If $f'(x^*) < 0$: The perturbation decays $arrow$ *Stable*.

_Note: Linear stability analysis only analyzes local behavior near fixed points._

---

== Bifurcations

We study how the qualitative behavior of a system changes as parameters vary.

#definition("Bifurcation")[
A bifurcation occurs when a change in a parameter causes a change in the qualitative behavior of the system (e.g., number or stability of fixed points).
]

=== Saddle-Node Bifurcation
*Normal Form:* $ dot(x) = mu - x^2 $

Fixed points occur where $f(x) = 0$:
$ x_(plus.minus) = plus.minus sqrt(mu) $

- If *$mu < 0$:* No real fixed points.
- If *$mu = 0$:* One semi-stable fixed point at $x=0$.
- If *$mu > 0$:* Two fixed points created, $x = +sqrt(mu)$ (stable) and $x = -sqrt(mu)$ (unstable).

The bifurcation diagram shows a parabolic curve $x^2 = mu$ representing the creation of fixed points as $mu$ increases.

#definition("Saddle-Node Bifurcation")[

  A saddle-node bifurcation occurs when two fixed points (one stable and one unstable) collide and annihilate each other as a parameter is varied, or vice versa.
]

=== Transcritical Bifurcation
*Normal Form:* $ dot(x) = mu x - x^2 $

Fixed points:
$ & f(x) = x(mu - x) = 0 \
  implies & x^* = 0 " or " x^* = mu $

Stability depends on $f'(x) = mu - 2x$:
+  For $x^* = 0$: $f'(0) = mu$.
  + * Stable* if $mu < 0$.
  + * Unstable* if $mu > 0$.
+  For $x^* = mu$: $f'(mu) = -mu$.
    + * Stable* if $mu > 0$.
    + * Unstable* if $mu < 0$.

There is an exchange of stability between the two fixed points at $mu = 0$.

#definition("Transcritical Bifurcation")[

  A transcritical bifurcation occurs when two fixed points exchange their stability as a parameter is varied.
]

=== Pitchfork Bifurcation
_(This section appears as a heading in the notes without further details.)_

---


== Logistic Model (Population Growth)
Let $N$ be the population and $K$ be the carrying capacity.
$ (d N) / (d t) = r N (1 - N / K) $

Population does not grow indefinitely; it saturates. To simplify, we nondimensionalize by letting $x = N/K$:
$ (d x) / (d t) = r x (1 - x) $

*Analysis of fixed points:*
- $x^* = 0$: Unstable (growth starts here, $f'(0) > 0$).
- $x^* = 1$: Stable (population reaches carrying capacity, $f'(1) < 0$).

Phase flow is from $0 -> 1$.
