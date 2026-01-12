#import "imports.typ": *

== Phase Coexistence Curves
The Helmholtz free energy and the Gibbs free energy are related by a Legendre transform. Given any potential, we can obtain other potentials by Legendre transforms. Let's see an example with the Helmholtz and Gibbs free energies.

The Gibbs free energy is defined as,
$
  G &= F + P V = U - T S + P V \
  dd(G) &= - S dd(T) + V dd(P) + mu dd(N) \
$
The natural variables of $G$ are $(T,P,N)$. Thus, we have,
$
  S &= - (pdv(G,T))_(P,N) \
  V &= (pdv(G,P))_(T,N) \
$
#figure(
  image("assets/gibbshelm.jpg", width: 50%),
  caption: [Relations between Helmholtz free energy, Gibbs free energy, Volume and Pressure. The plots are done for a temperature above the critical temperature. These are example curves which look similar to ideal gas curves. In this convention, $F$ would be convex if $G$ is concave. Also note that $A$ here is helmholtz free energy, which is denoted by $F$ in the notes. Source: @Seth.]
)<gibbhelm>
Consider the Gibbs free energy vs pressure plot at constant temperature shown in @gibbhelm. We see that for each temperature, there is a unique Gibbs free energy value for each pressure. This is true for temperatures above the critical temperature. The volume can be obtained from the slope of these curves. The stability conditions for Gibbs free energy dictate that $G$ should be concave in pressure $P$. Since the function is concave everywhere, the volume is an injective function of pressure. We can then invert the function to obtain $P = P(T,V)$. We can also obtain the Helmholtz free energy from the Gibbs free energy by calculating $F(V_0) = G(P_0) - P_0 V_0$. As a result of these, we establish similar diagrams for Gibbs free energy $G(P)$, Helmholtz free energy $F(V)$, $V(P)$ and $P(V)$.


#figure(
  image("assets/gibbsphasetransition.jpg", width : 50%),
  caption: [ Relations between Helmholtz free energy, Gibbs free energy, Volume and Pressure. The plots are done for a temperature below the critical temperature. Since the Gibbs free energy becomes multivalued, the Volume as a function of temperature(when calculated pointwise from the Gibbs Free energy) fails the vertical line test for a function.

    Source: @Seth.]
)<gibbhelm2>
#figure(
  image("assets/vanderwallmath.png", width: 50%),
  caption: [The graphical solution of the van der Waals equation of state.  Note that when $T>>1$ , we obtain the ideal gas limit and similar isotherms. Note that under the isotherm $T < T_c$, there are three possible volumes for a given pressure. This cubic form of the equation also indicates that there must be a critical point where the three roots merge into one. Later, on as we shall observe that Maxwell construction also imposes a constraint relation between $P$ and $T$. A very nice discussion regarding the properties and how the maxwell construction gives rise to phases from a purely mathematical perspective is given in @Prodanov2022.]
)<vdwgraph>

For temperatures below the critical temperature, the Gibbs free energy vs pressure plot looks like @gibbhelm2. We see that the $P$ versus $V$ plot looks like the van der Waals isotherm with the unphysical region between points $M$ and $N$ in @vdwgraph. The multivaluedness of the Gibbs free energy manifests itself as an instability in the Helmholtz free energy vs volume plot. The Helmholtz free energy becomes concave in a certain region, violating the stability conditions. We can again use the concave envelope construction to obtain the stable Helmholtz free energy curve. However, instead of constructing the concave envelope, we shall create a convex envelope for the Helmholtz free energy. This is because the Helmholtz free energy is convex in volume for stable systems. Since the pressure is given by $P = - (pdv(F,V))_(T,N)$, the slope of the Helmholtz free energy vs volume plot for the convex envelope construction would give us the flatline in the $P$ versus $V$ plot, which is the Maxwell construction, in the region between points $M$ and $N$ in @vdwgraph. This can be seen as the isobar passing through the points $A$ and $C$.

Another constraint that the Maxwell construction imposes is that the areas of the two regions,
$A M B$ and $B N C$ in @vdwgraph must be equal. Consider the cycle $A M B N C A$. The work done in this cycle is given by,
$
  oint P d V = oint T d S - oint d U = 0
$
where the last equality follows from the fact that $U$ and $S$ are state functions. Thus, the work done in the cycle must be zero. Thus the areas of the two regions must be equal.

During the maxwell construction, the lowest Gibbs free energy branch is chosen as the stable branch. This is so because in the legendre transform convention we follow, the maximum entropy principle translates to the minimum Gibbs free energy principle. Thus, during the phase transition, the system jumps from one branch of the Gibbs free energy curve to another branch with lower Gibbs free energy. This also relates to superheating and supercooling phenomena, which is related to the phenomenon of nucleation in first order phase transitions. We shall discuss this later.

Let's discuss what happens physically during this phase transition, from the graphs. Note that the van der Waals equation of state is a cubic equation in $V$ for given values of $P$ and $T$.  Thus given an isobar and an isotherm, we can solve for the roots of this cubic equation to get the possible volumes of the system. For temperatures below the critical temperature, there are three roots for a given pressure in the region between points $M$ and $N$ in @vdwgraph. We should also note that fixing an isobar also fixes the isotherm, since the two are related by equal areas in the Maxwell construction. Thus, given $P$ and $T$, we obtain phase transitions due to the cubic nature of the equation of state. Basically if we follow the gibbs free energy vs pressure plot. As we decrease pressure, we transition from one branch to another branch of lower gibbs free energy, which corresponds to a jump in volume. This jump in volume is the phase transition from liquid to gas. The reverse happens when we increase pressure, leading to gas to liquid phase transition.

If we use the Gibbs Free energy graph vs $T$, we shall also obtain a discontinuity in entropy. This can be related to the latent heat of vaporization during the liquid to gas phase transition. In modern notation a first order phase transition is called an _abrupt_ phase transition, since the first derivatives of the Gibbs free energy are discontinuous during the phase transition and abruptly change. In higher order phase transitions, higher derivatives of the Gibbs free energy are discontinuous.  During abrupt phase, one needs to provide extra latent heat $T delta S$ to change the phase of the system at constant temperature and pressure. This is exactly the jump in entropy seen in @gibbentropy. Higher order phase transitions do not involve latent heat, since entropy remains continuous during such phase transitions. However, higher derivatives are discontinuous.

Another signature of first order phase transitions is nucleation and metastability. We shall discuss these phenomena in the next section.

#figure(
  image("assets/entropydisc.jpg", width: 50%),
  caption: [Gibbs free energy vs Temperature plot showing discontinuity in entropy during phase transition. Source: @Seth.]
)<gibbentropy>

== Metastable States and Nucleation
During the concave envelope construction, we also obtain metastable states. These are states which are locally stable but globally unstable. We shall understand metastable states and nucleation in the context of liquid to gas phase transition.

#figure(
  image("assets/stabilitybrick.png", width: 50%),
  caption: [A schematic representation of stable, metastable and unstable states. The ball represents the state of the system. The valleys represent stable and metastable states, while the hill represents unstable states. Source: @Mer1952.]
)<brick>
Consider a brick like in @brick. The brick can be in multiple states. A is a locally stable state, B is an unstable state and C is a globally stable state. Suppose we flatten out a corner of the brick in configuration B. We obtain the brick in configuration D. This is a metastable state. The difference between unstable and metastable states is that in unstable states, any small perturbation would drive the system away from that state. However, in metastable states, small perturbations would not drive the system away from that state. A finite perturbation is required to drive the system away from a metastable state. In this context, the strength of the perturbations decide the stability between metastable and locally stable states. We can consider them to be similar.

Continuing in a similar vein, in @vdwgraph, $A M$ and $N C$ are locally stable regions, which represent supercooled and superheated states respectively. This can bee seen from a plot of Gibbs free energy vs volume.
#figure(
  image("assets/gibbsvolume.jpg", width: 30%),
  caption: [The gibbs free energy gives us two minimas near the phase transition point. There will be one minima of the liquid phase(the red point) over a certain range of temperatures we still get two mimimas and at higher temperatures depth of the minimas changes. Source: @Seth.]
)<gibbmeta>
In @gibbmeta, we see that there are two minimas in the Gibbs free energy vs volume plot. The left minima corresponds to the liquid phase and the right minima corresponds to the gas phase. As we decrease temperature, the depth of the left minima increases, making it the globally stable state. However, the right minima still exists as a locally stable or a metastable state. This metastable state corresponds to supercooled gas. The system might still exist in this supercooled gas state, until a finite perturbation or fluctuations in the system drive it to the globally stable liquid state. This process of nucleation is often observed in first order phase transitions. A nice discussion regarding nucleation is given in @Mer1952.

In one phase, nearby phase transitions, an embryo of the other phase can form due to fluctuations. For example, in gas, small droplets of liquid can form due to fluctuations. Formation of these droplets causes lower gibbs free energy as we observe from the graphs. However, this incurs another energetic cost due to surface tension. The theory of nucleation answers a really important question. When does water boil?
Consider a spherical droplet of radius $r$ of liquid forming in the gas phase. The change in energy due to the formation of this droplet is given by,
$
  Delta E = - (4/3) pi r^3 Delta g + 4 pi r^2 gamma \
$
where $Delta g$ is the difference in Gibbs free energy density between the two phases and $gamma$ is the surface tension. The first term is the volume term, which favours droplet formation, while the second term is the surface term, which discourages it. So fluctuations can create droplets, which die down due to energetic cost of surface tension. However larger and larger droplets can form due to fluctuations. There is a critical radius $r_c$ beyond which the droplets grow spontaneously, leading to phase transition. This is how fluctuations drive nucleation and cause a phase transition. This is why supercooled liquid, on received a finite perturbation, can transition to the globally stable phase.
#figure(
  image("assets/gibbschangephase.png", width: 40%),
  caption: [Change in Gibbs free energy due to formation of a droplet of radius $r$ in the metastable phase. There is a critical radius $r_c$ beyond which the droplet grows spontaneously, leading to phase transition. Considering the brick analogy, the green line is a zoomed out version of D state of the brick. Source: @ETH]
)
We can also see that the nucleation process is related to the concave envelope construction. The concave envelope construction gives us the globally stable states. However, during the construction, we also obtain metastable states. These metastable states correspond to supercooled and superheated states in liquid to gas phase transitions. The nucleation process drives the system from these metastable states to the globally stable states. The supercooling and superheating phenomena result in interesting hysteresis curves.
#figure(
  image("assets/hysteresis.jpg", width:30%),
  caption : [Hysteresis curve during liquid to gas phase transition. The blue curve corresponds to heating while the red curve corresponds to cooling. The hysteresis is due to superheating and supercooling phenomena. Source: Modified from @Seth.]
)
One can also observe these phase transitions from the probability interpretation of partition functions. We follow Kardar @Kardar2007 in this regard.

== Transitions observed from Probability Distributions
The free energy is related to the partition function by,
$
  F = - k_B T ln Z
$
To this note let us observe something. Consider $Omega(E)$ to be the number of microstates with energy $E$. Then let us define the Laplace transform of $Omega(E) = int d Gamma delta(H -E)$ where $H$ is the hamiltonian, as,
$
  Z(beta) = int d E " " Omega(E) exp(- beta E) = int d Gamma exp(- beta H)
$
where $beta = 1/(k_B T)$. This is the canonical partition function. This completes a transformation from the microcanonical ensemble to the canonical ensemble. Note that the relation to thermodynamics is given by the Boltzmann relation,
$
  S(E) = k_B ln Omega(E)
$
The connection to thermodynamics in the canonical ensemble is given by,
$
  scr(F)(beta) = beta E(beta) - scr(S)(E(beta))
$
where $scr(F)(beta) = beta F(beta)$ and $scr(S)(E) = S(E)/k_B$, which is a legendre transform pair.

#remark("Legendre Transform")[

  There are two conventions for Legendre transforms cf @Deserno. One transforms convex functions to convex functions and the other transforms convex functions to concave functions. If we follow the first convention, we have,
  $
    scr(F)(beta) = beta E(beta) - scr(S)(E(beta)) quad quad [(scr(F), beta) <==> (scr(S), E)]
  $
  This converts convex functions to convex functions. This definition is contrary to what is used in thermodynamics. However, this convention has one very nice feature. The legendre transform is an involution in this convention. That is, applying the legendre transform twice gives us back the original function.  That is, the Legendre transform is its own inverse.

  If we follow the second convention, we have,
  $
    F(T) = E(S) - T S(E(T)) quad quad [(F, T) <==> (E, S)]
  $
  This converts convex functions to concave functions and vice versa. This convention is followed in Sagnik's lecture notes @Seth.


  One can refer to @Deserno for a detailed discussion regarding these two conventions. One can also refer to @Zia2008 for an excellent discussion regarding Legendre transforms, its geometric interpretation and its applications in thermodynamics. It also discusses the conversion of laplace transforms in statistical mechanics to legendre transforms in thermodynamics.

  The connections of Legendre transforms to statistical mechanics is quite important. It determines what free energy functional should we use to determine our thermodynamic properties. For example, in the canonical ensemble, we use the Helmholtz free energy since the natural variables are $(T,V,N)$. In the grand canonical ensemble, we use the grand potential since the natural variables are $(T,V,mu)$. This is done, because we cannot control energy in the canonical ensemble, but we can control temperature. Similarly, in the grand canonical ensemble, we cannot control particle number, but we can control chemical potential. So we legendre transform out the energy to get the correct free energy functional for the canonical ensemble and also legendre transform out the particle number to get the correct free energy functional for the grand canonical ensemble.

  We should also note that in the involutive convention, the natural variables come out to be $beta$. When we go to grand canonical ensemble, the natural variables come out to be $beta$ and $eta = - beta mu$, as we shall see later. These are infact the Lagrange multipliers that appear during the maximization of entropy with constraints on average energy and average particle number.
]
Again we can go from the canonical ensemble to the grand canonical ensemble by taking a discrete Laplace transform with respect to particle number $N$. The grand canonical partition function is given by,
$
  cal(Z)(T,V,N) = sum_(N=0)^infty exp(beta mu N) Z(T,V,N)
$
Similarly, the connection to thermodynamics is given by,
$
  Phi = U - T S - mu N
$
where $Phi = - k_B T ln cal(Z)$ is the grand potential.
#remark("Grand potential")[
  Just for the fun of it, we can find the legendre transform relation between grand potential and entropy in the involutive form. We have,
  $
    scr(Phi)(beta, eta) = beta E(beta, eta) + eta N(beta, eta) - scr(S)(E(beta, eta), N(beta, eta))
  $
  where $eta = - beta mu, scr(Phi) = beta Phi$ and $scr(S) = S/k_B$. This is again a legendre transform pair $(scr(Phi), beta, eta) <==> (scr(S),E,N)$. Note that this convention also corrects the sign of the exponent in the discrete laplace transform.
  $
    cal(Z)(T,V,N) = sum_(N=0)^infty exp(- eta N) Z(T,V,N)
  $
  We can also see the Laplace transform from canonical to the grand canonical ensemble by legendre transforming $scr(F)$
  $
    scr(Phi)(beta, eta) = eta N(beta, eta) - scr(F)(beta, N(beta, eta))
  $
]<grandpot>
The equation of state for the grand canonical ensemble is given by,
$
  beta P V = ln cal(Z)(T,V,mu) = ln(sum_(N=0)^infty exp(V psi(n)))
$
where $psi(n) = n ln(V- Omega/2) + beta a n^2 + Delta n$ and $n = N/V$ is the number density and $Delta = 1 + beta mu - ln(lambda^3)$, where $lambda$ is the thermal wavelength. Here, $a$ is a constant from the van der Waals equation of state. Since in the thermodynamic limit, $V --> infty$, we can use the saddle point approximation to evaluate the sum. The saddle point approximation states that for large $V$,
$
  P V = k_B T V psi(n^*)
$
where $n^*$ is the value of $n$ which maximizes $psi(n)$. Suppose we have two peaks near the phase transition point. The two densities $n_"liq"$ and $n_"gas"$ correspond to the two phases. The phase transition occurs when the two peaks have the same height. As we vary temperature and pressure, the heights of the two peaks change. At the phase transition point, the two peaks have the same height. Since we take the thermodynamic limit, the system jumps from one peak to another peak as we cross the phase transition point. This jump corresponds to the phase transition from liquid to gas. This is how phase transitions can be observed from the probability distributions in statistical mechanics. This complete derivation is given in @Kardar2007.



As an end to this lecture on phase coexistence curves and Maxwell construction, we arrive at a rather remarkable conclusion.
#theorem("Phase transitions")[
  Phase transitions can only take place for infinite systems.
]
We observed a specific case here. The general heuristic argument is as follows. In finite systems, the partition functions are sums of individual microstate probabilities, which are analytic in their parameters. As a result, the free energies are also analytic in their parameters. However, phase transitions are marked by non-analyticities in free energies. Thus, phase transitions can only take place in infinite systems, where taking some sort of limit can lead to non-analyticities in free energies.
