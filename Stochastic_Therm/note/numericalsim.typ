#import "imports.typ": *

= Numerical Simulation of 2D Ising Model

After our arduous journey through the theoretical landscape of the 2D Ising model, we now relax and see how numerical simulations relate to the theory. We will use the Metropolis algorithm to simulate the 2D Ising model on a square lattice and compute various thermodynamic quantities.

== Metropolis Algorithm

The Metropolis algorithm is a Monte Carlo method used to simulate the behavior of systems in statistical mechanics. For the 2D Ising model, the algorithm proceeds as follows:
1. Initialize a square lattice of size $L times L$ with random spin configurations (each spin can be either +1 or -1).
2. For a given temperature $T$, repeat the following steps for a large number of Monte Carlo steps:
   a. Randomly select a spin $sigma_i$ on the lattice.
   b. Calculate the change in energy $Delta E$ that would result from flipping the spin.
   c. If $Delta E <= 0$, flip the spin. If $Delta E > 0$, flip the spin with probability $exp(-(Delta E)/(k_B T))$.
3. After a sufficient number of Monte Carlo steps, measure the desired thermodynamic quantities.

Here we will see how the lattice evolves with time at different temperatures. We will observe the formation of domains and how they grow as the system approaches equilibrium. Before we need to define what our time scale is. We will define one Monte Carlo Step (MCS) as one complete sweep through the lattice, where each spin has been considered for a possible flip once. So one MCS consists of $L^2$ spin flip attempts for a lattice of size $L times L$.

#figure(
  image("assets/ising_evolution_200x200.png", width: 60%),
  caption: [The evolution of the Ising Model at different times(in units of MCS) at $T = 2$.],
)

#figure(
  image("assets/ising_evolution_200x200_crit.png", width: 60%),
  caption: [The evolution of the Ising Model at different times(in units of MCS) at $T approx 2.269$.],
)

#figure(
  image("assets/ising_evolution_200x200_T_2pt3.png", width: 60%),
  caption: [The evolution of the Ising Model at different times(in units of MCS) at $T = 2.3$.],
)

#figure(
  image("assets/ising_evolution_200x200_T_3.png", width: 60%),
  caption: [The evolution of the Ising Model at different times(in units of MCS) at $T = 3$.],
)
== Thermodynamic Quantities

The quantitites of interest to us are the average magnetization per spin $expval(|m|)$, the average energy per spin $expval(E)$, the specific heat $C$, and the magnetic susceptibility $chi$. These quantities can be computed as follows:
$ expval(|m|) = 1/N expval(|sum_{i} sigma_i|) $
$ expval(E) = 1/N expval(-J sum_{i j} sigma_i sigma_j) $
$ C = (expval(E^2) - expval(E)^2)/(k_B T^2) $
$ chi = (expval(|m|^2) - expval(|m|)^2)/(k_B T) $

The analytical solution Energy can be found from the free energy per spin $f$ as:
$ expval(E) = -pdv((beta f),beta)  $
where $beta = 1/(k_B T)$. The exact solution for magnetization per spin is given by:
$ expval(|m|) = (1 - sinh^(-4)((2J)/(k_B T)))^(1/8) quad "for" quad T < T_c $
$ expval(|m|) = 0 quad "for" quad T >= T_c $

We can compare the numerical results obtained from the Metropolis algorithm with the exact solutions for these quantities. Below are the plots showing the comparison.
#figure(
  image("assets/ising_magnetization_susceptibility_1.png", width: 80%),
  caption: [Magnetization per spin $expval(|m|)$, Magnetic Susceptibility $chi$, Energy per spin $expval(E)$, and Specific Heat $C$ as functions of temperature $T$ obtained using the Metropolis algorithm compared against the exact solutions.],
)
== Time Delayed Autocorrelation function
The time-delayed autocorrelation function is a measure of how the state of the system at one time is correlated with its state at a later time. This function is particularly useful for understanding the dynamics of the system and how well the numerical algorithm samples the configuration space. The autocorrelation function for a quantity $A$ is defined as:
$ C_A(tau) = (expval(A(t) A(t + tau)) - expval(A)^2)/(expval(A^2) - expval(A)^2) $
where $tau$ is the time delay, and $expval(...)$ denotes the ensemble average.
The integral of the autocorrelation function gives the correlation time $tau_c$:
$ tau_c = integral_0^oo C_A (tau) d tau $
In practice, the correlation time can be estimated by fitting the autocorrelation function to an exponential decay and extracting the characteristic timescale. The integrated correlation time is generally not used in simulations, since we require quite a large amount of data to compute it accurately. Instead, we can estimate the correlation time by finding the time lag $tau$ at which the autocorrelation function decays to a small value.

When computing thermodynamic quantities, it is essential to ensure that the measurements are taken from uncorrelated configurations to obtain accurate results. The autocorrelation function helps in determining the correlation time $tau_c$, which indicates how many Monte Carlo steps are needed before the configurations become effectively uncorrelated.

#figure(
  image("assets/autocorr_2pt4_eq.png", width: 60%),
  caption: [The time-delayed autocorrelation function for magnetization at $T approx 2.269$.],
)
This plot shows the autocorrelation function for magnetization at a temperature near the critical temperature, for small timelags where the lattice configurations(or magnetization in our case). Afte r a certain time lag, the autocorrelation function decays to a noise level which is completely random. The correlation time $tau_c$ can be estimated from this plot.

Before we go on with that, let us understand something about critical slowing down. 

== Critical Slowing Down

Critical slowing down refers to the phenomenon where the relaxation time of a system near its critical point diverges. In the context of the Ising model, as the temperature approaches the critical temperature $T_c$, the time it takes for the system to reach equilibrium increases significantly. Let's now understand why this happens.

The two point spin-spin correlation function $G(r)$ describes how the spin at one site is correlated with the spin at another site a distance $r$ away. Now this correlation function has a characteristic length scale called the correlation length $xi$, which diverges as the system approaches the critical temperature. This means that spins become correlated over larger distances, leading to the formation of large domains of aligned spins. When the system is near the critical temperature, the correlation length diverges and essentially similar domains of spins form throughout the lattice, over all scales of the lattice. This makes it difficult for the Metropolis algorithm to efficiently sample the configuration space, as flipping a single spin may not significantly change the overall configuration of the system. As a result, the system takes longer to be uncorrelated, leading to an increase in the autocorrelation time $tau_c$. To fix this problem, cluster algorithms like the Wolff algorithm are used, which flip clusters of spins instead of individual spins, thereby reducing the autocorrelation time near the critical point.

Before we move on to a quantification of critical slowing down, let us examine one more consequence of diverging correlation length.

== Scale Invariance at Criticality
At the critical temperature, the system exhibits scale invariance, meaning that the properties of the system look similar at different length scales. This is a direct consequence of the diverging correlation length $xi$, which implies that there is no characteristic length scale in the system. As a result, the system displays self-similar structures, where clusters of aligned spins can be found at all scales. 

#figure(
  image("assets/wolff_scale_invariance_tc_labels.png", width: 46%),
  caption: [Scale Invariance at Criticality. These images show the same configuration of the Ising model at $T_c$ zoomed in at different scales. Notice how the patterns look similar at different scales.],
)
#figure(
  image("assets/wolff_scale_invariance_tc_labels_patches.png", width: 46%),
  caption: [Scale Invariance at Criticality.The red box is the 300x300 patch shown top left, the yellow box is the 400x400 patch shown top right, and the yellow box is the 500x500 patch shown bottom left.],
)

The lower figure shows different patches of the same configuration at $T_c$. The three images look statistically similar, demonstrating the scale invariance of the system at criticality. One can see that the scale invariance is broken when we move away from the critical temperature, as shown below.
#figure(
  image("assets/wolff_scale_invariance_above_tc_labels.png", width: 46%),
  caption: [Breaking of Scale Invariance above $T_c$. These images show the same configuration of the Ising model at $T > T_c$ zoomed in at different scales. Notice how the patterns do not look similar at different scales. Top left image shows larges clusters of aligned spins, while the bottom right image shows mostly random spins.],
)

To drive the point about the slowness of Metropolis Hastings home, we will see a measure of how the Metropolis algorithm compares at the critical temperature from other algorithms with respect to autocorrelation time. 

== Dynamical exponent

The dynamical exponent $z$ characterizes how the autocorrelation time $tau_c$ scales with the system size $L$ near the critical point. It is defined by the relation:
$ tau_c ~ xi^z ~L^z $
To physically motivate this, consider that for one time step, to completely decorrelate the system, information must propagate across the largest clusters of correlated spins, which are of size $xi$. Now since the correlation length diverges at the critical point, the time taken to decorrelate also diverges. However, in a finite system of size $L$, the correlation length is limited by the system size, leading to the scaling relation above. The value of the dynamical exponent depends on the specific algorithm used for the simulation. For the Metropolis algorithm, the dynamical exponent is approximately $z approx 2.17$ for the 2D Ising model. This means that as the system size increases, the autocorrelation time increases significantly, making simulations near the critical point computationally expensive. The plot below shows the dynamical exponent for the Metropolis algorithm.

#figure(
  image("assets/ising_autocorr_time_metropolis.png", width: 60%),
  caption: [The time-delayed autocorrelation function for magnetization at $T approx 2.269$.],
)
== The Wolff Algorithm

The Ising model simulation done using the Metropolis algorithm, which suffers from critical slowing down near the critical temperature. To overcome this, we can use cluster algorithms like the Wolff algorithm, which flips clusters of spins instead of individual spins. This significantly reduces the autocorrelation time near the critical point.

The Wolff algorithm works by randomly selecting a seed spin and then recursively adding neighboring spins of the same orientation to the cluster with a probability $p = 1 - exp(-(2J)/(k_B T))$. Once the cluster is formed, all spins in the cluster are flipped simultaneously. Below are two examples of clusters formed and flipped using the Wolff algorithm.

In short, the Wolff algorithm works:
+ Randomly select a seed spin on the lattice.
+ Initialize an empty cluster and add the seed spin to it.
+ For each spin in the cluster, check its neighboring spins. If a neighboring spin has the same orientation as the seed spin, add it to the cluster with probability $p = 1 - exp(-(2J)/(k_B T))$.
+ Repeat the previous step until no more spins can be added to the cluster.
+ Flip all spins in the cluster simultaneously.

#figure(
  image("assets/wolff_example_1.png"),
  caption: [Flipping a Cluster of spins using the Wolff algorithm.],
)
#figure(
  image("assets/wolff_example_2.png"),
  caption: [Flipping a Cluster of spins using the Wolff algorithm.],
)

We check the magnetization curve obtained using the Wolff algorithm against the exact solution.
#figure(
  image("assets/w_mag_vs_temp_200x200.png", width: 60%),
  caption: [Magnetization per spin $expval(|m|)$ as a function of temperature $T$ obtained using the Wolff algorithm compared against the exact solution.],
)
Similarly, we can check the dynamical exponent for the Wolff algorithm.
#figure(
  image("assets/ising_autocorr_time_wolff.png", width: 60%),
  caption: [The time-delayed autocorrelation function for magnetization at $T approx 2.269$ using the Wolff algorithm.],
)
The wolff algorithm does not follow the scaling relation $tau_c ~ L^z$ as closely as the Metropolis algorithm. This is because the Wolff algorithm effectively reduces the correlation time by flipping clusters of spins, leading to a much smaller dynamical exponent for larger system sizes. The dynamical exponent for the Wolff algorithm is approximately $z approx 0.25$, indicating that the autocorrelation time increases much more slowly with system size compared to the Metropolis algorithm. This makes the Wolff algorithm much more efficient for simulating the Ising model near the critical point.

== Numerical Scaling Exponents
Using the Wolff algorithm, we can also estimate the critical exponents of the 2D Ising model numerically. We could take the magnetization data near the critical temperature and fit it to the scaling relation:
$ expval(|m|) ~ (T_c - T)^beta $
where $beta = 1/8$ is the critical exponent for magnetization. By fitting the numerical data to this relation, we can extract the value of $beta$ and compare it to the exact value.
#figure(
  image("assets/w_mag_vs_temp_loglog_200x200.png", width: 60%),
  caption: [Fitting the magnetization data near the critical temperature to extract the critical exponent $beta$. The fitted value is close to the exact value of $1/8$.],
)
Similarly, we can estimate $gamma$ for susceptibility, which diverges as:
$ chi ~ |T - T_c|^(-gamma) $
where $gamma = 7/4$ is the critical exponent for susceptibility.
#figure(
  image("assets/w_sus_vs_temp_loglog_200x200.png", width: 60%),
  caption: [Fitting the specific heat data near the critical temperature to extract the critical exponent $gamma$. The fitted value is close to the exact value of $7/4$.],
)

== Finite Size Effects

Phase transitions cannot take place in finite systems, as the partition function is a sum of analytic functions, and hence is itself analytic. However, in finite systems, we can observe signatures of phase transitions. As the system size increases, the thermodynamic quantities exhibit sharper features near the critical temperature, resembling the behavior of an infinite system. For example, the magnetization curve becomes steeper, and the peaks in specific heat and susceptibility become more pronounced as the system size increases. We see the finite size effects in the magnetization curve below.
#figure(
  image("assets/wolff_mag_vs_temp_different_L.png", width: 60%),
  caption: [Magnetization per spin $expval(|m|)$ as a function of temperature $T$ for different system sizes using the Wolff algorithm. Notice how the curves become sharper near the critical temperature as the system size increases, indicating finite size effects.],
)
This happens because for small systems, any outlier can significantly affect the overall behavior of the system. As the system size increases, these outliers have a diminishing effect, and the system's behavior approaches that of an infinite system.

== Spin-Spin Correlations
The spin-spin correlation function $G(r)$ measures how the spin at one site is correlated with the spin at another site a distance $r$ away. It is defined as:
$ G(r) = expval(sigma_i sigma_(i+r)) - expval(sigma_i) expval(sigma_(i+r)) $
The two point spin covariance function is plotted below for different temperatures. This function is important, this the correlation length $xi$ can be extracted from this function, which diverges as the system approaches the critical temperature, a signature of continuous phase transitions. Ising's original argument for why the 1D model does not have a phase transition was based on the fact that the correlation length remains finite and decays exponentially, for all non-zero temperatures in 1D.

The plot below shows the spin-spin correlation function for different temperatures using the Wolff algorithm. The amount of yellow indicates the strength of correlation between spins at different distances. As the temperature approaches the critical temperature $T_c$, the correlation length increases, indicating that spins become correlated over larger distances. We can see that at $T=1 J\/k_B$ the graph becomes completely yellow, indicating that all spins are aligned and perfectly correlated, atleast for the lattice size used in the simulation.
#figure(
  image("assets/wolff_correlation_functions.png", width: 60%),
  caption: [The spin-spin correlation function $G(r)$ for different temperatures. Notice how the correlation length increases as the temperature approaches the critical temperature $T_c$.],
)

= Conclusion
After this extensive analytical and numerical exploration of the 2D Ising model, we have understood atleast one solution to a non-trivial model in statistical mechanics. To summarize,
+ We saw some models before the Ising model, and how they led to the formulation of the Ising model.
+ We formulated the Ising model and understood its Hamiltonian.
+ We saw Peierls argument for the existence of a phase transition in higher dimensions.
+ We saw some series expansion methods which can give many useful results to many models.
+ We found the critical temperature of the 2D Ising model using duality arguments.
+ We construct the lattice diagonally and find the transfer matrix for the 2D Ising model.
+ We diagonalized the transfer matrix using symmetry properites and Jacobian elliptic functions.
+ We found the analytical solution for free energy.
+ We simulated the 2D Ising model using the Metropolis algorithm and Wolff algorithm.
+ We saw critical slowing down and scale invariance at criticality.
+ We found the dynamical exponent for both algorithms.
+ We found the critical exponents numerically using the Wolff algorithm.
+ We saw finite size effects in the magnetization curve.
+ We saw the spin-spin correlation functions at different temperatures.

The 2D Ising model serves as a cornerstone in the study of phase transitions and critical phenomena, providing deep insights into the behavior of complex systems. The techniques and concepts learned here can be extended to more complex models and higher dimensions, paving the way for further exploration in statistical mechanics and condensed matter physics.