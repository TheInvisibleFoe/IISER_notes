
#import "imports.typ": *

= Yang Lee Zeros
In a seminal work in 1952 @Yang1952 @Lee1952, C.N. Yang and T.D. Lee developed a theory to understand phase transitions in terms of the zeros of the partition function in the complex plane.

Let us again consider the grand canonical partition function for a system of particles, with a bath at temperature $T$ and fugacity $z = exp(beta mu)$.
$
  cal(Z)(T, V, mu) = sum_(N=0)^infty z^N cal(Z)(T, V, N)
$
Similar to the case of van der Waals gas, if we impose the constraint that the particles have a finite size, then there is a maximum number of particles $N_max$ that can be accommodated in the volume $V$. This means that the sum above is finite, and hence $cal(Z)$ is a polynomial in $z$ of degree $N_max$. Thus this polynomial shall, in general, have $N_max$ complex roots $z_1, z_2, ..., z_(N_max)$. The phase transitions can be observed in the non-analyticity of the grand partition function, of the form $ln(cal(Z))$. This non-analyticity can arise when one (or more) of the roots $z_i$ approaches the positive real axis in the thermodynamic limit. Then, we get a singularity in $ln(cal(Z))$ for a physically realizable value of $z$, leading to a phase transition. Let's formalize this idea following @Yang1952.

== Theorems
We shall define the system over which we will state the theorems. A proof of these theorems can be found in the appendices of the original paper @Yang1952. The second paper @Lee1952 extends these theorems to the case of discrete systems and also provides examples of systems that satisfy the theorems.

Let us first define the system on which we will prove the theorems.
#amp("System")[

  We consider a monatomic gas with the interaction
  $ U= sum u(r_"ij") $,
  where $r_"ij"$ is the distance between the $i^"th"$ and $j^"th"$ atoms.\
  The following assumptions are made about the nature
  of these interactions':
  1. The atoms have a finite impenetrable core of
  diameter $a$, so that
  $ u(r) = oo  "for" r<=a $
  2.  The interaction has a finite range $b$ so that
  $ u(r) = 0  "for" r>=b $
  3. $u(r)$ is nowhere minus infinity.
  4. Assume that the shape of the container is not pathological, such that its surface area increases slower than $V^(2/3)$.

  Condition 2 can be relaxed to include interactions that decay sufficiently fast, such as the Lennard-Jones potential, or the Van der Waals interaction.
]
Consider a box of volume $V$ containing $N$ indistinguishable atoms of the gas defined above, in contact with a heat and particle reservoir at temperature $T$ and chemical potential $mu$. The grand partition function of this system is given by
$
  cal(Z)(T, V, mu) = sum_(N=0)^(N_max) (z^N)/(N!) Z(T, V, N) = sum_(N=0)^(M) (y^N)/(N!) Q(T,V,N)
$
where $z = exp(beta mu)$ is the fugacity, $y = z/lambda^3$, $M = N_"max"$ and $lambda$ is the thermal wavelength. $Z(T,V,N)$ is the canonical partition function, and $Q(T,V,N)$ is the configuration integral defined as
$
  Q(T,V,N) = int ... int_v d tau_1 ... tau_N exp(-beta U(vb(tau)))
$
The pressure and densities can be calculated from the grand partition function in the thermodynamic limit,
$
  beta P &= lim_(V --> infty) (1/V) ln cal(Z)(T,V,mu) \
  rho &= lim_(V --> infty) (1/V) (z partial_(z) ln cal(Z)(T,V,mu))\
  &= lim_(V --> infty) (1/V) z pdv(y,z) pdv(ln(y),y) pdv(,ln(y)) ln cal(Z)(T,V,mu)\
  &= lim_(V --> infty) 1/V pdv(,ln(y)) ln cal(Z)(T,V,mu)
$
Generally, we exchange the limit $V --> infty$ and the derivative $pdv(,ln(y))$, to obtain the equation of state. However, this exchange is only valid if $ln cal(Z)$ is analytic in $y$.

#theorem("Yang-Lee Theorem 1")[

  For all positive real values of $y$, $V^(-1)ln cal(Z)$ approaches, in the limit $V --> infty$, a well-defined limit independent of the shape of the volume $V$. Furthermore, this limit is a continuous and monotonically increasing function of $y$.
]
The independence from the shape of the volume $V$ does not imply that this theorem is only valid or fluid phases. One might think that the pressure would change if, say a shearing force is applied to the boundaries of the volume $V$, changing its shape. As, a result, for solids, this limit should depend on the shape of $V$. However, the subtlely lies in the fact that the theorem applies in the infinite volume limit. In this limit, the surface effects become negligible compared to the bulk effects, and hence the shape dependence vanishes.
#result("Partition function zeros")[

  Since the grand partition function $cal(Z)$ is a polynomial in $y$ of degree $M$, it can be factorized as
  $
    cal(Z)(T,V,mu) = product_(i=1)^(M) (1 - y/y_i)
  $
  Note that the zeros $y_i$ cannot be both real and positive, since all the coefficients of the polynomial are positive (as $Q(T,V,N) > 0$ for all $N$). Thus, all the zeros lie either in the negative real axis or in the complex plane.
]
The number of roots increases with the volume $V$, and in the thermodynamic limit, the distribution of these roots give us complete behavior about the analyticity of $ln cal(Z)$.

#theorem("Yang-Lee Theorem 2")[

  If in the complex $y$ plane, there exists a region $R$ containing a segment of the positive real axis always free of zeros of $cal(Z)$, then in this region, in the limit $V --> infty$,
  $
    V^(-1) ln cal(Z), pdv(,ln(y)) V^(-1) ln cal(Z), (pdv(,ln(y)))^2 V^(-1) ln cal(Z), ...
  $
  approach limits that are analytic functions of $y$. Futhermore, the operators $pdv(,ln(y))$ and $lim_(V --> infty)$ commute in this region,
  $
    lim_(V --> infty) pdv(,ln(y)) V^(-1) ln cal(Z) = pdv(,ln(y)) lim_(V --> infty) V^(-1) ln cal(Z)
  $
]
We now discuss these theorems in the context of phase transitions. The derivatives defined in Theorem 2 do not always approach a limit for all values of $y$. One can consider the first derivative, relating to density. If the quantity $V^(-1) pdv(,ln(y)) ln cal(Z)$ does not approach a well defined limit, physically this means that the density is not uniquely defined for that value of $y$. This is the hallmark of a first order phase transition, where two phases coexist at the same pressure and chemical potential, but have different densities. Thus we need to take a further look at the form of the regions in the complex $y$ plane that are free of zeros. They can be divided into two categories.

=== No Phase Transition
The roots of $cal(Z) = 0$ do not approach the positive real axis in the thermodynamic limit. Thus there exists a region $R$ containing the positive real axis that is free of zeros. Hence, by Theorem 2, all derivatives of $V^(-1) ln cal(Z)$ approach analytic limits, and there are no phase transitions. As a result, they are valid to exchange the limit and the derivative, and we can obtain the equation of state. This, the system in consideration is a single phase system for all values of $y$.
#figure(
      image("assets/yanglee1.png", width: 50%),
      caption: [Source: @Yang1952]

)
=== Phase Transition
The roots of $cal(Z) = 0$ approach the positive real axis at some points, say $y = t_1,t_2$ and the regions $R_1,R_2,R_3$ enclose three root free regions of the positive real axis. Thus, by Theorem 2, all derivatives of $V^(-1) ln cal(Z)$ approach analytic limits in these regions, and we can exchange the limit and the derivative. However, there is no reason to consider that the limits approached from different regions are the same. In general, they will be different. If they are derivative, we shall observe a jump in the value of the derivative at the boundary between two regions. Physically, this means that the density is not uniquely defined at these points, and we have a first order phase transition. Thus, the system exists in different phases in different regions of $y$, seperated by first order phase transitions at the boundaries.

One can also have a situation where the limits of the first derivatives are the same, but the limits of the second derivatives are different. This would correspond to a second order phase transition.

As different parameters of the system, are varied, the location of the roots in the complex plane also change. As temperature is varied, one might observe that at the roots cease to close in to one of the points on the real line. This temperature would correspond to the critical temperature $T_c$ of the transition $1 <-> 2$. One might also observe that at certain values of these parameters, the roots coalesce at a point on the positive real axis. This would correspond to a triple point, where three phases coexist.
#figure(
      image("assets/yanglee2.png", width: 40%),
      caption: [Source: @Yang1952]

)
In the context of the Ising model and lattice gases, Yang and Lee proved the following theorem @Lee1952.

Let us consider a system with Ising spins $sigma_i = pm 1$ on a lattice, with the applied external magnetic field $H$. Define the variable $z = exp(-2 beta H)$.
The polynomial $scr(P)$ is defined as
$
  scr(P) = sum_(n=0)^(N) P_n z^n
$
where $N$ is the total number of spins. The coefficients $P_n$ are contributions to the partition function from all configurations with $n$ spins down. This polynomial is similar to the grand partition function of a lattice gas, with $z$ playing the role of fugacity.
#theorem("Yang-Lee Theorem 3")[
  If an interaction $u$ between two gas atoms is such that $u(r) = oo$ if they both occupy the same lattice site, and $u(r) <= 0$ otherwise, then all the zeros of the polynomial $scr(P)$ in the complex $z$ plane lie on the unit circle $|z| = 1$.
]
Note that the condition on the interaction makes no comment about the range of the interaction $u$, the dimensionality of the lattice, and the size and structure of the lattice. In fact, even the periodicity property of the lattice plays no part at all in the proof. Thus, this theorem is extremely general, and applies to a wide variety of systems.
