#import "imports.typ": *

The van-der-waals equation of state is given by
$
  (P + (a N^2)/V^2)(V - N b) = N k_B T
$
where $a$ and $b$ are constants specific to the fluid under consideration. This a cubic equation in $V$ for given values of $P$ and $T$.
$
  p V^3 - (N k_B T + b P) V^2 + a N^2 V - a b N^3 = 0
$
Given $P$ and $T$, basically given an isotherm and an isobar, we can solve for the roots of this cubic equation to get the possible volumes of the system.

In the high temperature limit, the van der Waals equation reduces to the ideal gas law. However, at lower temperatures, we observe a glaring issue. For temperatures below a critical temperature $T_c$, the isotherms show an unstable behaviour. There is a region where the pressure increases with increase in volume, which is unphysical. Consider the pink line in @vdwgraph. The section of graph between points $M$ and $N$ is unphysical since $pdv(P,V)>0$ there. Let us see why this is unphysical.

The isothermal compressibility $kappa_T$ is defined as
$
  kappa_T = - (1/V)(pdv(V,P))_T
$
This is a response function that measures how much the volume changes with pressure at constant temperature. For a stable system, we must have $kappa_T > 0 ==> (pdv(V,P))_T <0$. This means that when we increase the pressure, the volume should decrease. Another way of observing this fact is to consider, particle number fluctuations in the grand canonical ensemble. The particle number fluctuations equal the isothermal compressibility times some positive factors. Thus, for a stable system, the particle number fluctuations must be positive, which again implies that $kappa_T > 0$.
$
  (Delta N)^2/expval(N)^2 = k_B T (N/V) kappa_T
$
The uninterested reader can refer to @Pathria2011 for a detailed discussion on this topic. Thus, the region between $M$ and $N$ in @vdwgraph is unphysical. Before we try to fix this issue, let us obtain the instability picture from the entropy perspective.

== Concavity of Entropy
A stable equilibrium state must be a state of maximum entropy. If we can convince ourselves that the entropy is concave in its natural variables, we can use this property to identify unstable regions. Let us follow the approach by @Callen1985 to show, at least heuristically, that entropy is concave in its natural variables.
#figure(
  image("assets/entropyinst.jpg", width: 40%),
  caption: [Callen illustration of entropy exchange between two subsystems. Source: @Seth.]

)
Consider an isolated system made up of two identical subsystems $1$ and $2$, seperated by a rigid adiabatic wall. The total energy, volume and particle number of the combined system are fixed. Then the fundamental equation of the subsystems is $S = S(U,V,N)$. Consider removing energy $Delta U$ from subsystem $2$ and giving it to subsystem $1$. The initial entropies of the two subsystems are $S(U_1, V, N)$ and $S(U_2, V, N)$. After the energy exchange, the entropies become $S(U_1 + Delta U, V, N)$ and $S(U_2 - Delta U, V, N)$. Let us now allow the adiabatic wall to be transformed to a diathermal wall, allowing heat exchange between the two subsystems. Suppose now that the entropy varies with energy as shown in @callenentropy. One can see that $S(U_1 + Delta U, V, N)+S(U_2 - Delta U, V, N) >= 2 S(U,V,N)$. One would see that the energy flows from one subsystem to another spontaneously. One would also see this happening in regions within the subsystem. Thus, the system would remain in an inhomogenous state, which is the hallmark of a phase transition. However, if the entropy is concave in energy, we have $S(U_1 + Delta U, V, N)+S(U_2 - Delta U, V, N) <= 2 S(U,V,N)$. Thus, the system would evolve to a homogenous state with equal energies in both subsystems. 

Thus for stable systems, the entropy must be concave in its natural variables, which leads us to the stability criteria(a property of concave functions).
$
  (pdv(S,U,2))_(V,N) <= 0
$
#figure(
  image("assets/concentro.png", width: 50%),
  caption: [Convex intruder in entropy. "Convex Intruders" are places of convexity often signalling phase transitions. These are used to study phase transitions in mesoscopic systems. Image Source: @Callen1985.]
)<callenentropy>

This stability criteria can be further generalized to other variables like $(V,N)$. Now consider a similar scenario but with moving the rigid wall to one of the sides. Then, allow the wall to move. Then a similar argument would lead us to the conclusion that
$
  (pdv(S,V,2))_(U,N) <= 0
$
#figure(
  image("assets/conintru.png", width: 60%),
  caption: [Convex Intruder in fundamental equation plot. Here, the entropy has a convex region between points $A$ and $B$. This convex region is unphysical since it violates the concavity condition of entropy. Source: @Seth ]
)<concentro>

How do we resolve this issue of intruders in entropy? The stable thermodynamic fundamental equation is then obtained from this "underlying fundamental equation" by the constructing tangents. This construction is called the concave envelope construction. The concave envelope is the smallest concave function that lies above the underlying function. The family of tangents that lie above the underlying function are drawn(called the _superior tangents_). The concave envelope is then the envelope of these superior tangents. It is of note that we also obtain metastable states, whenever a convex intruder is present. We shall discuss this later in the context of nucleation in first order phase transitions. The lines $B C$ and $C D$ are locally stable but globally unstable. $B C D$ is an unstable region. 

We can translate these stability conditions to other free energies as well. We can use the Legendre transforms to obtain other free energies. For example, the Helmholtz free energy is given by $F = U - T S$. The natural variables of $F$ are $(T,V,N)$. We can then see that,
$
  F &= U - T S \
  dd(F) &= - S dd(T) - P dd(V) + mu dd(N)\
$
Then we have, 
$
  pdv(S,T) = - (pdv(F,T,2))_(T,N) = C_v/T >= 0
$
Similarly, we get,
$
  pdv(F,V,2) = - (pdv(P,V))_(T,N) = kappa_T/V >= 0
$
Thus, the stability conditions in terms of Helmholtz free energy are,
$
  (pdv(F,T,2))_(V,N) <= 0 quad quad quad quad  (pdv(F,V,2))_(T,N) >= 0
$
The stability for other free energies can be obtained in a similar manner @Callen1985 @Stanley1971. 
$
  (pdv(G,T,2))_(P,N) <=0 quad quad &quad quad (pdv(G,P,2))_(T,N) >=0 \
  (pdv(H,S,2))_(P,N) <=0 quad quad &quad quad (pdv(H,P,2))_(S,N) >=0 \  
$
Since all of these functions are related by Legendre transforms, without using the thermodynamic relations, we can obtain these from the properties of Legendre transforms.
In general for constant $N$, the legendre transforms of Energy are concave in their extensive variables and convex in their intensive variables. We can now observe typical phase transition behaviour in different free energy functional curves.

These stability conditions along with construction of concave envelopes can be used to resolve the van der Waals instability. From the graph of the Van der waals equation of state, we can find the graphs of the free energies. Then we could apply the same principles to obtain the stable free energy curves.

One also needs to discuss about the Legendre transform of energy or entropy. The Legendre transforms give us the free energy functionals along with ensemble equivalence. Legendre transforms in thermodynamics translate to laplace transforms in statistical mechanics. A detailed discussion on this topic can be found later.



