#import "imports.typ": *

= Introduction
This course shall mainly focus on the statistical mechanics of equilibrium systems undergoing phase transitions. We shall only focus on classical systems in this course. So, without further ado, let us begin.
= Van der Waals Equation of State
The ideal gas equation of state is given by
$
  P V = N k_B T
$
where $P$ is the pressure, $V$ is the volume, $n$ is the number of moles of the gas, $R$ is the universal gas constant and $T$ is the temperature. This equation of state assumes that there are no interactions between the gas molecules and that the volume occupied by the gas molecules themselves is negligible compared to the volume of the container.
In contrast to this, Johannes Diederick van der Waals proposed a more realistic equation of state for real gases, that can qualitatively explain the phase transition between water and gas. The Van der Waals equation of state is given by
$
  (P + a (N^2) / V^2)(V - N b) = N k_B T
$
where $a$ and $b$ are constants that depend on the gas in question. Here, $a$ accounts for the weak attractive interactions between the gas molecules, while $b$ accounts for the finite size of the gas molecules. $N$ is the number of molecules and $k_B$ is the Boltzmann constant.

We shall be looking at how this equation of state is derived from a mean-field treatment of the system. Then we shall take a look at where this theory succeeds and where it fails. Before we proceed, let us first understand the nature of molecular interactions.


== Molecular Interactions
To understand the behaviour of the real gas, we need to see how particles interact with each other. The most extensively studied potential of the pair-type potentials is
the Lennard-Jones Potential(LJP). The form of the potential is given by,
$
  u(r) = u_0 [(sigma / r)^12 - (sigma / r)^6]
$<LJP>
where $u_0, sigma$ are constants that depend on the type of particles and $r = |r_i - r_j|$ is the inter-particle distance between two particles located at $r_i$ and $r_j$ respectively. The first term in the potential represents the repulsive interaction between the particles, while the second term represents the attractive interaction between the particles. The repulsive term dominates at short distances, while the attractive term dominates at long distances. The potential has a minimum at $r = r_m = 2^(1/6) sigma$, which represents the equilibrium distance between two particles.

The exponent $12$ is chosen for computational convenience,. The exponent $6$ arises from the fact that the attractive interaction is due to dipole-dipole interactions, which decay as $1/r^6$. This can be derived by considering a particle with dipole moments $p_1$ separated by a distance $r$ from another particle. There is an induced dipole moment $p_2$ in the second particle which can be assumed to be proportional to the field created by the first dipole moment at the location of the second particle. This gives us the $r^(-6)$ decay of the attractive interaction.

Another commonly used potential is the hard-sphere potential, which considers a infinite potential when the particles are closer than a certain distance and the same as the attractive part of the Lennard-Jones potential when the particles are farther apart. The hard-sphere potential is given by,
$
  u(r) = cases(infinity quad & r < r_0, -u_0(r_0/r)^6 quad &r >= r_0)
$<hard-sph-pot>
#figure(
  image("assets/LJ_and_HS_Potentials.png", width: 80%),
  caption: "Lennard-Jones Potential and Hard-Sphere Potential",
)

Generally, for systems in $d$ dimensions, the repulsive part of the potential is taken to be $r^(-n)$ where $n > d$ to ensure that the potential is short-ranged. If $n <= d$, the potential is said to be long-ranged and special techniques are required to handle such systems.

== Mean Field Treatment of Van der Waals Equation of State
One way of dealing with interactions added to a known Hamiltonian is to use perturbation theory. However, perturbations are defined continuously from a known system. This in general, cannot describe non-analytic changes in the system, such as phase transitions. Thus, we use an effective field approach, known as the mean-field theory. In this approach, we replace the effect of all other particles on a given particle with an average effect. This reduces the many-body problem to a single-body problem in an effective field. To illustrate this, let us derive the Van der Waals equation of state using mean-field theory.


The general Hamiltonian for a system of $N$ particles interacting with each other,
$
  H = sum_(i=1)^N (p_i^2) / (2m) + U(r_1, r_2, ..., r_N)
$
where $p_i$ is the momentum of the $i^(t h)$ particle, $m$ is the mass of the particles and $U(r_1, r_2, ..., r_N)$ is the total potential energy of the system. For our case we shall use a pairwise potential, which means that the total potential energy can be written as,
$
  U(r_1, r_2, ..., r_N) = 1 / 2 sum_(i != j) u(|r_i - r_j|)
$
Let us now consider the canonical partition function for this system,
$
  Z = (1 / N! h^(3N)) int d^(3N)r int d^(3N)p exp(-beta H)
$
where $beta = 1/(k_B T)$, $h$ is some constant with the dimension of action and the factor $1/N!$ is included to account for the indistinguishability of the particles. The integral over the momenta can be performed easily, giving us,
$
  Z = (1 / N! lambda^(-3N)) int d^(3N)r exp(-beta U(r_1, r_2, ..., r_N))
$
where $lambda = h/sqrt(2 pi m k_B T)$ is the thermal wavelength. Now, the integral over the positions is difficult to perform due to the presence of the potential energy term. Firstly, we can rewrite the potential energy term as an integral over the inter-particle distances, rather than a summation. To do this, define the density function as,
$
  n(r) = sum_(i=1)^N delta(r - r_i)
$
The potential energy term can be written as,
$
  U({|q_i - q_j|}) &= 1 / 2 sum_(i != j) u(|r_i - r_j|) \
  &= 1 / 2 int d^3r_1 int d^3r_2 n(r_1) n(r_2) u(|r_1 - r_2|)\
$
Here is where we make the mean-field approximation. We replace the density function $n(r)$ with its average value $n = N/V$, where $V$ is the volume of the system. This approximation assumes that the density of particles is uniform throughout the system. With this approximation, the potential energy term becomes,
$
  U &approx 1 / 2 int d^3r_1 int d^3r_2 (N / V)^2 u(|r_1 - r_2|) \
  &= (n^2) / 2 int d^3r_1 int d^3r_2 u(|r_1 - r_2|)
$
Since the potential $u(r)$ only depends on the distance between the particles, we can simplify the integral further by changing to relative coordinates. Define the new coordinates as,
1. The Centre of mass coordinate : $R = (r_1 + r_2)/2$
2. The relative coordinate : $r = r_1 - r_2$
Then the original coordinates can be expressed in terms of the new coordinates as,
1. $r_1 = R + r / 2$
2. $r_2 = R - r / 2$
The Jacobian of this transformation is ,
$
  J = abs(pdv((r_1","r_2),(R","r))) = abs(mat(1,1/2;1,-1/2)) = 1
$
Using this transformation, the integral over the positions becomes,
$
  int d^3r_1 int d^3r_2 u(|r_1 - r_2|) &= int d^3R int d^3r u(|r|) \
  &= V int d^3r u(r)
$
where we have used the fact that the integral over the centre of mass coordinate $R$ simply gives us a factor of the volume $V$. Thus, the potential energy term becomes,
$
  U &approx (n^2) / 2 V int d^3r u(r) \
  &= (N^2) / (2V) int d^3r u(r)
$
The pair potential function used in this case is the hard-sphere potential defined in <hard-sph-pot>, except we use a general exponent $s$ instead of $6$ for the attractive part.
$
  u(r) = cases(infinity quad & r < r_0, -u_0(r_0/r)^s quad &r >= r_0)
$
Note that the potential is infinite when the particles are closer than $r_0$. This causes a divergence in the integral over $r in [0, r_0)$. This is very simply taken care of. Note that the Boltzmann factor $exp(-beta U)$ becomes zero when $U$ is infinite. Thus, the region of integration where the potential is infinite does not contribute to the integral. Thus, we can simply change the limits of integration to $r in [r_0, infty)$. Thus, the integral becomes(using spherical symmetry),
$
  int d^3r u(r) &= int_(r_0)^(infty) 4 pi r^2 d r (-u_0 (r_0 / r)^s) = -4 pi u_0 r_0^s int_(r_0)^(infty) r^(2-s) d r\
  &= (4 pi u_0 r_0^3) / (s-3)
$
where we have assumed that $s > 3$ to ensure convergence of the integral. Thus, the potential energy term becomes,
$
  U({|q_i - q_j|}) &approx (N^2) / (2V) (- 4 pi u_0 r_0^3) / (s-3) = a (N^2) / V
$
where $a = (2 pi u_0 r_0^3)/(s-3)$. Thus, the partition function becomes,
$
  Z &= (1 / N! lambda^(-3N)) int d^(3N)r exp(beta a (N^2)/V) \
  &= (1 / N! lambda^(-3N)) exp(beta a (N^2/V)) int d^(3N)r \
$
The integral over the positions is not simply the volume to the power $N$ because of the hard-sphere nature of the particles. The particles cannot come closer than a distance $r_0$ to each other. Consider adding in the particles one by one. The first particle can be placed anywhere in the volume $V$. The second particle can be placed anywhere in the volume $V$ except for a sphere of radius $r_0$ around the first particle. Thus, the available volume for the second particle is $V - (4/3) pi (r_0)^3 = V- Omega$, [cf. @volexcfig]. Note that $Omega$ is 8 times the volume of a particle. The distance of closest approach between two particles is $r_0$, so the volume of each particle is considered to be a sphere of radius $r_0/2$.
#figure(
  image("assets/vol_exclusion.png", width: 50%),
  caption: [Excluded Volume for Hard-Sphere Particles. Source: @Reif1965],
)<volexcfig>
$
  int d^(3N)r &approx V (V - Omega) (V - 2 Omega) ... (V - (N-1) Omega) \
  &= V^N (1 - (Omega / V)) (1 - 2(Omega / V)) ... (1 - (N-1)(Omega / V)) \
  &= V^N [(1-(Omega) / V)(1-(N-1)(Omega) / V)] [(1 - 2(Omega) / V)(1 - (N-2)(Omega) / V)] ...\
  &approx V^N (1 - N / 2 (Omega) / V)^(N)
$
To obtain the last line, we have paired the first and last terms, the second and second last terms and so on. This gives us $N/2$ pairs, each of which is approximately equal to $1 - N (Omega)/V$ in the low density limit where $N Omega/V << 1$.In addition to that, the binomial approximation gives us the $1/2$ factor. We have also used that for large $N$, $(N-1) approx N$. Thus, the partition function becomes,
$
  Z(T,V,N) = (1 / N! lambda^(-3N)) exp(beta a (N^2)/V) (V - N / 2 Omega)^(N)
$
The free energy can be obtained from the partition function as,
$
  F(T,V,N) &= -k_B T log Z(T,V,N) \
  &= -k_B T [-log N! + 3N log lambda + beta a (N^2) / V + N log (V - N / 2 Omega)] \
  &= -k_B T [-N log N + N + 3N log lambda + beta a (N^2) / V + N log (V - N / 2 Omega)] \
$
where we have used Stirling's approximation $log N! approx N log N - N$ for large $N$. The pressure can be obtained from the free energy as,
$
  & P = - pdv(F, V)_(T,N) = k_B T N [1 / (V - (N Omega) / 2)] - a (N^2) / V^2 \
  ==>& (P + a (N^2) / V^2)(V - N b) = N k_B T \
$
where
$
  a &= (2 pi u_0 r_0^3) / (s-3) \
  b &= Omega / 2 = (2 / 3) pi r_0^3
$
Note that $b$ is four times the volume occupied by a particle. This is the Van der Waals equation of state. This equation of state can also be derived using other methods, such as the cluster expansion method, cf. @Kardar2007. Instead of using a mean field approximation, he expands out the Boltzmann factor of the interacting terms in powers of some function of density, giving us the virial expansion. He then truncates the series at the second virial coefficient. This gives the same result as the mean-field approximation.

#remark("Derivation")[
  The Derivation is from "Fundamentals of Statistical and Thermal Physics" by F. Reif @Reif1965 under the alternate derivation of the Van der Waals Equation of state. However, there are some differences. Reif progresses in a different fashion compared to us. He first considers the hard-sphere potential to conclude that for each particle, an excluded volume $V_x$ is present. This excluded volume is the volume around each particle where no other particle can enter due to the hard-sphere nature of the particles. Now he assumes in the available volume $V-V_x$, the potential is on an average constant. This is equivalent to our mean-field approximation, where we assumed the density to be uniform. He then goes on to find what $V_x$ should be. However, his calculation makes an assumption less than ours.

  He does not assume the dilute limit $(N Omega)/V << 1$ to calculate the available volume for $N$ particles. We place the particles one by one, and for each particle, we assume that the other $N-1$ particles are already placed. Reif assumes that the particles are added simultaneously, which makes lesser sense to me. However, he does claim that his arguments are quite crude in nature.
]
