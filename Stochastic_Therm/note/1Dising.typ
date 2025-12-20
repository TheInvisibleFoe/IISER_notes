#import "imports.typ": *
= The 1D Ising Model
Before we present the Hamiltonian of the 1D Ising system, it is quite important to note the discretizations of this model. We first have a spatial discretization, where we discretize the magnets into a grid of sites. Then comes our second discretization, the spin discretization, where we discretize the spins into two values, $+1$ and $-1$. The second discretization had little motivation unless you take into account the quantum nature of spins, we shall classically regard this property to be just some perk of the model.

The 1D Ising Model is defined by the Hamiltonian
$ HH = -J sum_(j = 1)^N sigma_j sigma_(j+1) - H sum_(j=1)^N sigma_j $
where $sigma_j = plus.minus 1$ is the spin at site $j$. $J$ is the coupling constant here. $J>0$ describes a ferromagnetic model here, because we want to lower energy so to lower it, neighbors spin should be aligned. $J<0$ described an antiferromagnetic model, where we want to lower energy by having neighboring spins anti-aligned. $J=0$ is fairly uninteresting model where we do not care about the alignment of neighboring spins. $H$ is the external magnetic field, which decides how each spin affects the energy of the system. If $H>0$, then we want to align spins in the positive direction, if $H<0$ then we want to align spins in the negative direction. If $H=0$, then there is no external field applied. In an attempt to make the system translationally invariant, we will assume periodic boundary conditions, i.e., for a system with $N$ sites $sigma_(N+1) = sigma_1$. This translational invariance is important since the physics should not depend on where the analysis of the model is done.


== Free Energy and Magnetization
The partition function of the 1D Ising Model is given by
$ Z_N = sum_{sigma} exp(-beta H) = sum_{sigma} exp(k sum_(j=1)^N sigma_j sigma_(j+1) + h sum_(j=1)^N sigma_j) $
where $beta = 1/(k_B T)$, $k_B$ is the Boltzmann constant and $T$ is the temperature and $k = beta J$ and $h = beta H$ and $N$ is the number of lattice. The sum is over all possible spin configurations. Let us define
$ V(sigma, sigma') = exp(K sigma sigma' + 1/2 h (sigma + sigma')) $
which simplifies our partition function to
#nonum($Z_N = sum_{sigma} V(sigma_1, sigma_2) V(sigma_2, sigma_3) ... V(sigma_N,sigma_1)$)
To achieve these simplifications other forms of $V$ exist, but this form is chosen to make $V$ symmetric with respect to the arguments $V(sigma,sigma') = V(sigma', sigma)$. This choice will have some consequences later. Now one might question as to why this transformation is done. This transformation helps us in analytically computing the partition function. This helps us define and use _transfer matrices_.
The transfer matrix is defined as
$ VV = mat(V(+,+), V(+,-);V(-,+),V(-,-)) = mat(e^(K+h), e^(-K); e^(-K), e^(-K-h)) $
These transfer matrices are so-called because they determine the probability with which we get the next spin given our current spin. So we can see that $V(sigma,sigma') = braket(sigma,V,sigma')$. The partition function is then given as
$ Z_N = sum_(sigma_1) ... sum_(sigma_N) braket(sigma_1,VV,sigma_2)...braket(sigma_N,VV,sigma_1) $
Note that the $sigma_j$ are independent of each other. Let us denote $ket(+) = vec(1,0)$ and $ket(-) = vec(0,1)$. From this we get that $sum_(sigma_i = 0)^1 ketbra(sigma_i,sigma_i) = II$. This is our completeness relation with which we are quite familiar in QM. Using this, the partition function can be simplified,
$
  Z_N &= sum_(sigma_1) ... sum_(sigma_N) braket(sigma_1,V,sigma_2)...braket(sigma_N,V,sigma_1) \
  & = sum_(sigma_1)bra(sigma_1)VV (sum_(sigma_2) ketbra(sigma_2))VV (sum_(sigma_3) ketbra(sigma_3)) ... (sum_(sigma_N) ketbra(sigma_N))VV ket(sigma_1)\
  & = sum_(sigma_1)braket(sigma_1,VV^N,sigma_1) = Tr[VV^N]
$<traceZ>
Right here we realize why we chose $V$ to have a symmetric form. As a consequence of the symmetric form $V$, the matrix $VV$ turns out to be a symmetric matrix. We will now use some basic linear algebra to get some properties of the matrix $VV$.

Using the spectral theorem for finite dimensional vector spaces @hoffman1971linear, we can say that the hermitian matrix $VV$ is diagonalizable, and can represent in the form
$VV = U^dagger Lambda U$, where $U$ is a unitary matrix and $Lambda$ is a diagonal matrix with the eigenvalue as the diagonal entries. Then we obtain
$
  Tr[VV^N] = Tr[U^dagger Lambda^N U] = Tr[Lambda^N] = lambda_1^N + lambda_2^N
$, where $lambda_1, lambda_2$ are the eigenvalues of $VV$. We can also say something about the degeneracy of the eigenspectrum. Note that the matrix $VV$ has all positive entries for a fixed non zero T and non zero h, so the matrix is Irreducible and Primitive. For Irreducible and Primitive matrices, the Perron-Frobeius Theorem states that the Eigenspace of the principal or dominant eigenvalue will be of 1 Dimensional @meyer2000applied. Thus we must necessarily have $lambda_1$ and $lambda_2$ to be distinct. There is however a special case. If $H=0=T$, then the matrix has only one eigenvalue, which is $lambda_1 = lambda_2 = 1$. From the point of view of correlations of the model this is important, as we shall see later.

Returning to the domain of physics, the partition function has a simple form of

$ Z_N = lambda_1^N + lambda_2^N = lambda_1^N (1+(lambda_2 / lambda_1)^N) $

where $lambda_1 > lambda_2$.


Note that our thermodynamic free energy makes sense only in the thermodynamic limit. So we get the free energy per site to be
$
  f &= -1 / beta lim_(N--> oo) 1 / N ln Z_N = -1 / beta ln(lambda_1) \
  &= -k_B T ln[e^K cosh(h) + (e^(2K) sinh^2(h) + e^(-2K))^(1 / 2)]
$

Then the magnetization is defined as the average magnetic moment per site is defined as,
$ M = - pdv(f,H) = (e^K sinh(h)) / [e^(2K) sinh^2(h) +e^(-2K)]^(1 / 2) $
The Magnetization is an analytic function of $h$ so we do not obtain a phase transition. A much nicer and much more intuitive argument is also provided using spin-spin correlations, but first a short word on correlations.

#result("Free Energy and magnetization of the Ising model")[
  The free energy per site of the 1D Ising Model is given by
  $ f = -k_B T ln[e^K cosh(h) + (e^(2K) sinh^2(h) + e^(-2K))^(1 / 2)] $
  The magnetization is given by
  $ M = (e^K sinh(h)) / [e^(2K) sinh^2(h) +e^(-2K)]^(1 / 2) $
  The magnetization is an analytic function of $h$ and does not exhibit a phase transition.
]

== Correlations and Phase Transition

Let us understand correlations from the point of view of the Ising Model. Let us consider two Ising Spins $sigma(x)$ and $sigma(x')$ at positions $x$ and $x'$ respectively. Then the correlation function is defined as
$ g(d) = expval(sigma(x)sigma(x')) - expval(sigma(x)) expval(sigma(x')) $<correlation>
where $d = |x-x'|$. The second term represents how they behave when they are isolated and independent. The first term shows how on an average the behavior of the one the spins influences the other spin. Here we thus quantify how the behavior changes between cases when are allowed to interact and when they are kept isolated. For more intuition and better explanations consider reading chapter 10 of @sethna2006statistical. Correlation calculations are quite important in understanding why, a more intuitive reason, the 1D Ising Model does not have a Phase Transition. 
The function we are interested in calculating is #ref(<correlation>). Now let us calculate this function for the 1D Ising Model.

We start by calculating $expval(sigma_j)$.
$ expval(sigma_j) = Z_N^(-1) sum_{sigma} sigma_j V(sigma_1,sigma_2) ... V(sigma_N,sigma_1) $
In similar fashion to @traceZ, we use bra-ket notation here. However, all summations here will not give identity. Here for the j-th spin, we get $ sum_{sigma_j = +,-} ket(sigma_j)sigma_j bra(sigma_j) = S = mat(1,0;0,-1) $ in the representation of $ket(+), ket(-)$ used here.
We thus obtain the form using cyclicity of the trace or translational invariance of the 1D problem
$ expval(sigma_j) = Z_N^(-1) Tr[S V^N] $
Similarly, the form for $expval(sigma_i sigma_j)$ follows and using the same cyclicity of the trace or translational invariance of the lattice, this quantity only depends on the distance between the sites $i,j$. WLOG suppose that $j>=i$,thus $0<= j-i <=N$
$expval(sigma_i sigma_j) = Z_N^(-1) Tr[S V^(j-i) S V^(N-(j-i))]$

When we diagonalized our matrix $VV$, we obtained some unitary(in this case orthogonal, since we defined our problem over the real field) matrix $U$. The explicit form of $U$ is given as
$
  U = mat(cos phi, -sin phi; sin phi, cos phi)
$, where $cot(2phi) = e^(2K) sinh(h), "where" 0<phi<pi/2$. . Therefore, these relations follow,
$
  U^T VV U &= mat(lambda_1, 0;0,lambda_2)\
  U^T S U &= mat(cos(2 phi), -sin(2 phi); -sin(2 phi), -cos(2 phi))
$
Thus, the spin-spin average terms in the correlation function is given as
$
  expval(sigma_i) &= cos(2 phi)\
  expval(sigma_i sigma_j) &= cos^2(2 phi) + sin^2(2 phi) (lambda_2 / lambda_1)^(j-i)
$
Note two small and expected, but nonetheless interesting observations. $expval(sigma_j)$ is independent of the site, which we expect since each individual Ising spin at a site on its own is identical to any other Ising spin at any other site. Second, the quantity $expval(sigma_i sigma_j)$ only depends on the distance between the spin sites. This also is to be expected. Since we have set up a translationally invariant problem, so we expect some function $f(i,j) = f(|j-i|)$.
The correlation function $g(d) = g_(i j)$ follows,
$ g_(i j) = sin^2(lambda_2 / lambda_1)^(j-i) $

We see that the correlation decays away quite fast. If some asymptotic behavior of $g(d)$ is considered,
$ g(d) ~ e^(-d / xi) $
where $xi$ is defined to be the correlation length. The correlation length comes out to be
$ xi = [ln(lambda_2/lambda_1)]^(-1) $

Before we move on, a word on phase transitions is crucial. A phase transition is defined to an abrupt, discontinuous change in the properties of the system. For phase transition we define an order parameter, which takes a zero value in one phase (called the disordered phase) and a non-zero value in the other phase. This transition in the order parameter can be continuous or discontinuous, but there will be some discontinuous change in some property of the system to qualify it to be a phase transition. In our case, we get continuous phase transitions. But the derivative of Magnetization or susceptibility is discontinuous, since magnetization is not differentiable. We shall revisit this when we consider the mean field model. Here, we are trying to model ferromagnetism. Experimentally, we know below a certain critical Temperature the magnet still exhibits ferromagnetism even if we turn of the external magnetic field. Thus, we want to see when we take $H$ to zero, what happens to the magnetization. If ferromagnetism is exhibited then the magnetization to go to a finite value $m^*$ rather than 0.

The correlation length gives us a some kind of characteristic length over which the influence of a spin takes place. When we take the limit $H=0$, we want to investigate the critical temperature $T_c$. Note when $H=0$,
#nonum($VV = mat(e^K,1;1,e^(-K))$)
If we take the limit, $T-->0+$, we obtain degeneracy giving us,
$lim_(T-->0+) (lambda_2 / lambda_1) = 1$
Thus at $H=T=0$, the correlation length becomes infinite and we can observe a different phase. However, we do not observe a phase transition, since the ordered state of the system doesn't exist.

Again, taking the formula obtained for magnetization using the derivative of the free energy per site, and applying the limit, we observe,
$ m^*= lim_(H-->0) (e^K sinh(h)) / [e^(2K) sinh^2(h) +e^(-2K)]^(1 / 2) = 0 $
Thus we see that our order parameter, Magnetization is identically zero over all $T>0$.

Thus, observe by two different ways that the 1D Ising Model does not exhibit a phase transition. The first way is by observing that the free energy is analytic in $H$ and $T$. The second way is by observing that the correlation length is finite for non-zero temperatures and the magnetization is identically zero over all $T>0$.

// Spellcheck done



