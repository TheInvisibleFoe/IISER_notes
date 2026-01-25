#import "imports.typ":*

#app("Alternate Mean field Solution")
#set heading(numbering: "A.1.", supplement: [Appendix.])
#counter(heading).update((first, second) => (1, 0))


One can solve @mf_mag without using the first approximation, which is the approximation of $0$ fluctuations. We will outline the solution by Baxter. This model is pretty nice because we can graphically see why the phase transition takes place.

== The Mean Field Hamiltonian <mfsoln>

The mean field Hamiltonian, interestingly, does not feature the classic nearest neighbor interactions in the Ising Model. Suppose each spin site on a lattice of $N$ sites, has $q$ neighbors,(2d for a d dimensional Ising Model). The total field acting on that is given by,
$
  H + J sum_{j} sigma_j
$
where the summation is over the $q$ neighbors of the spin site. For the mean field the interactions over all other $N-1$ sites, averaged and then amplified over the number of neighbors $q$. The field for a spin at site $i$ is given by
$
  H + (N-1)^(-1) q J sum_(j eq.not i) sigma_j
$
where the sum is taken over all $N-1$ sites. The Hamiltonian is thus given by,

$
  HH({sigma}) = -(q J) / (N-1) sum_(i,j) sigma_i sigma_j - H sum_i sigma_i
$
where the first sum is over all the $mat(N;2) = 1/2 N(N-1)$ distinct pairs. There is an unphysical property here. The strength of coupling between spins depends on the number of spin sites. However, we can get some proper thermodynamic properties from the model. This analytically solvable model also exhibits phase transitions. The total magnetization is defined as
$
  M = sum_(j = 1)^N sigma_j
$
Let there be $r$ down spins, then the number of up spins is given by $N-r$. The total magnetization for $r$ down spins is given by
$M_r = N - 2r$. Note,
#nonum($
  & M_r^2 = sum_(i,j) sigma_i sigma_j = sum_(i=1)^N sigma^2 + sum_(i eq.not j) sigma_i sigma_j\
  ==> &sum_(i eq.not j) sigma_i sigma_j = M_r^2 - N = (N-2r)^2 -N \
$)
A small note here, here the sum distinguishes $(i,j) "and" (j,i)$, but the sum in the Hamiltonian only takes into account distinct pairs.
The mean field Hamiltonian can be rewritten in terms of the magnetization and indexed by the number of down spins $r$.
$
  HH_r & = -(q J) / (N-1) sum_(i,j) sigma_i sigma_j - H sum_i sigma_i = -(q J) / (N-1) [M_r^2 -N] - H M_r \
  & = -(q J) / (2 (N-1)) [(N-2r)^2 -N] - H(N-2r) \
$

== Magnetization and Free Energy
The partition function is now expressed as,
$
  Z_N &= sum_(r=0)^N c_r "where" \
  c_r &= mat(N;r)exp((q beta J) / (2(N-1)) [(N-2r)^2 -N] + beta H(N-2r))
$<partitionmft>
The properties of $c_r$ can be analyzed using $d_r = (c_(r+1))/(c_r)$. To motivate this expression, we consider this to characterize the sets where $c_r$ is increasing and $c_r$ is decreasing. Using that we can determine $r$ where $c_r$ takes the maximum value and some Laplace Method approximation can be applied. The graphs of these $c_r$ and $d_r$ will also be provided, which also helps in motivating whatever algebraic jugglery we might indulge in here.
The expression for $d_r$ is given by,
$
  d_r &= c_(r+1) / c_r = mat(N;r+1) / mat(N;r) exp((q beta J) / (2(N-1)) [(N-2r-2)^2 -N] + beta H(N-2r-2)) / exp((q beta J) / (2(N-1)) [(N-2r)^2 -N] + beta H(N-2r)) \
  & = (N-r) / (r+1) exp(- 2 beta q J (1-(2r)/(N-1)) - 2 beta H) \
  & = A_H (N-r) / (r+1) exp(- 2 beta q J (1-(2r)/(N-1)) ) \
$
Let us consider a continuous extension to this for non-natural r. Let $phi(x)$ be a function such that for $r={0,1,...,N}$, we have $phi(r) = d_r$. Let's ignore the initial $A_H$ factor, since it's just a scaling factor which is the same for all $x$. A natural choice for this is given by,
$
  phi(x) = (N-x) / (x+1) exp[- 2 beta q J (1-(2x) / (N-1)) ]
$
The derivative of the function should be able to tell us something about the domains where the function rises and where it dips. Let us denote $eta = 2 beta q J$ for ease of algebra

$
  phi'(x) = - (2 eta x^2 + 2 eta (1-N)x + (N^2 -2 eta N -1)) / ((N-1)(x+1)^2) exp(-eta(1-(2x)/(N-1)))
$
We can just focus on the quadratic term in the derivative. The other terms, namely the exponential and the denominator are always zero. The zeros of the quadratic define maxima and minima of the function. The function thus can attain either one or two stationary points. When the function has complex roots, we just get a monotonically decreasing function over the whole domain. Thus, $d_r$ is a monotonically decreasing function. The quadratic term has complex roots when,
$
  eta <= (2(N-1)) / (N+1) ==> q beta J <= (N-1) / (N+1)
$
As we shall see later, this condition will determine the critical temperature. The other case can be that the quadratic term has two positive or two negative roots, using Vieta's Theorem @viete_theorem.
The roots are given by
$
  x_(plus.minus) = (eta(N-1) plus.minus sqrt(eta^2 (N-1)^2 - eta(N^2 - 2 eta N -1))) / (2 eta)
$
Since $x_+$ is positive, both roots must be positive. Thus, we have two cases, one where the function decreases monotonically, and one where it has two positive roots. Let us examine the case, where there is no root, $ q J <= k_B T$. Note that for this condition the function $d_r$ starts somewhere greater than $1$ and goes to $0$ when $r=N$. Thus, there is one point where the function $phi(x)$ crosses the line $y=1$. Thus, in the discrete version of $d_r$,there is some $r_o in {0,...,N}$ such that we obtain,
$
  d_r> 1 quad & quad r = {0, ,1, ... ,r_o -1} \
  d_r_o >= 1 quad & quad r_o \
  d_r < 1 quad & quad r = {r_o +1,...,N}
$
Thus, there is a maximum value of $c_r$ which it attains at some point $r_o$. We shall exploit this later when we use a Saddle point approximation on our problem. When the case for double roots are considered, assuming you take high enough $N$ for a given $eta$, we will obtain three points where $phi(x)=1$. This fact can be easily seen if you observe the fact that the two points where the derivative of $phi(x)$ is symmetric with respect to $x = (N-1)\/2$. At that point $x$, the derivative of $phi(x)$ is greater than or equal to zero. If it is equal to zero, it corresponds to the repeated root condition and that also means there is only 1 point where $phi(x)$ crosses $1$. If the slope is positive, then $phi(x_+)$ and $phi(x_-)$, are above and below 1 respectively. Thus, the function $d_r$ crosses the line $y=1$ three times.
The graph of $phi(x) "and" d_r$ has been plotted below. Three graphs have been plotted, one where there are no stationary points, one where there is one stationary point and one where there is two. Our extremely tedious and completely unmotivated analysis has matched with computational results.

#figure(
  image("assets/phi_dr.png", width: 70%),
  caption: [The dependence of $phi(x)$ and $d_r$ on $q beta J$],
) <drphi>


Before we move on to the critical temperature and the graphs of $c_r$, the magnetization needs to calculated. The average magnetization per site is then defined to be,
$
  m = N^(-1) expval(M) = expval(1-(2r)/N) = Z^(-1) sum_(r=0)^N (1-(2r) / N)c_r
$
 The height of the peak at $c_r_o$ scales with $N$, and the width of the peak scales with $N^(1/2)$. So we can say that the maximum contribution of the sum is given by the maximum summand. Let us define another function, which we will motivate after we introduce the function.
$
  d_r = c_(r+1) / c_r = psi(1-(2r)/N)
$
where we can manipulate the general continuous function $psi(x)$, where $-1<x<1$, to remove
all dependence on $r$ and $N$. For this next step assume that we have $N >> 1$, i.e. a large number of sites. The functional form is given by,
$
  & psi(x = 1-(2r)/N) = (N-r) / (r+1) exp(- 2 beta q J x - 2 beta H) \
  ==> & psi(x = 1-(2r)/N) = (1+1-(2r) / N) / (1+2 / N - (1 - (2r) / N)) exp(- 2 beta q J x - 2 beta H) \
  ==> & psi(x) = (1+x) / (2 / N + 1-x) exp(- 2 beta q J x - 2 beta H)\
  ==> & psi(x) approx (1+x) / (1-x) exp(- 2 beta q J x - 2 beta H)
$
Note that $-1<x<1$. We are looking for the point $r_o$ where $c_r$ attains the maximum value at $c_r_o$. If $N$ is large enough, $c_(r_o+1)$ and $c_r_o$ are close enough that we look for the point where $d_r_o = 1 = psi(x_o = 1 - (2r_o)/N)$. Note that the value of $x_o$ only depends on $beta q J$ and $beta H$, and does not depend on $N$ at large $N$. The average magnetization can then be given by,
$
  m &= lim_(N>>1) Z^(-1) sum_(r=0)^N (1- (2 r) / N) c_r \
  &= lim_(N>>1) Z^(-1) sum_(r=0)^N x_r c_r \
  &= x_r_o c_r_o / c_r_o = x_r_o
$
Thus, $psi(m) = 1$. Again our average magnetization is Thus we can find the solution of $m$, in the form of a transcendental equation. The average magnetization $m$ is given by,
$
  & (1+m) / (1-m) = exp( 2 beta q J m + 2 beta H) \
  ==>& m(beta) = (exp( beta q J m +  beta H) - exp( - beta q J m -  beta H)) / (exp(  beta q J m +  beta H) + exp( -  beta q J m -  beta H)) \
  ==>& m(beta) = tanh(beta q J m +  beta H)
$
The free energy per site is calculated for the system before we move onto the critical behavior and temperature for the model. The free energy per site, for infinitely large systems is given by,
$
  -beta f = 1 / 2 ln(4/(1-m^2)) - 1 / 2 q J beta m^2
$

#result("Free Energy and Magnetization of the Mean Field model", [

  The free energy per site is given by
  $
  -beta f = 1 / 2 ln(4/(1-m^2)) - 1 / 2 q J beta m^2
  $ and the average magnetization is given by $ m(beta) = tanh(beta q J m + beta H) $
])
The free energy cannot be expressed in just in terms of $H$ without dependence on $m$. So we look at the behavior of $m$ as a function of $H$.
== Critical Point
We can obtain the $H$ as a function of $m$ and then rotate the axes to find how $m$ varies with $H$.
$
  H(beta) = q J (m + 1 / (q beta J) tanh^(-1) (M))
$
We can plot this and then reverse the graph to easily visualize the plot of $m$ versus $H$ and see how we get a phase transition. Furthermore, we know that when $T > (q J)/k_B$, there is only one solution to $d_r = 1$, the graph is plotted below. There is no spontaneous magnetization, which we expect.
#figure(
  image("assets/mT1.png", width: 60%),
  caption: [At higher temperatures, the graph of magnetization versus the applied magnetic field],
)
At lower temperatures, $T < (q J)/k_B$, the graph is quite frankly, ridiculous, because for a specific applied magnetic field $H$, there is a region, where 3 values of magnetization are possible. This apparent oddity comes from our approximation. In this lower temperature regime, there are three solutions to $d_r = 1$, as we have seen in the graph before. This directly follows the 2 stationary points of $d_r$ These correspond to 3 stationary points in $c_r$. Instead of choosing local minima the maximum contribution comes from the absolute maximum. So the wrong solutions need to be rejected.
#subpar.grid(
  figure(
    image("assets/mT3.png"),
    caption: [
      Complete solution of $m$ vs $H$.
    ],
  ),
  <a>,
  figure(
    image("assets/mT4.png"),
    caption: [
      After rejection of idiotic solutions.
    ],
  ),
  <b>,
  columns: (1fr, 1fr),
  caption: [The complete and corrected graph of magnetization vs applied magnetic field.],
  label: <full>,
)
A nice thing can be noted if we plot, for a given $q J$ and $T< (q J)/(k_B)$, the graph of $c_r$ and for two values $H = - h$ and $H=h$. We observe in the graph of $c_r$ there are 2 maxima and 1 minima. One maximum is the absolute maximum when $H = h$ and the other maxima is attains the maximum value when $H = -h$. This is the core property which causes the phase transition to occur for this model. The maximum value of $c_r_o$ comes for different values of $r_o$ if the limit of magnetic field is taken $H-->0-$ and $H-->0+$. The graph of $c_r$ vs $r$ for a low enough temperature is plotted below for small values $H = -h,h$. From this we determine the critical temperature to be,
$
  T_c = (q J) / k_B
$

Here are some supplemental graphs to cement the fact that the peak scales with $N$ and the width of the peak scales as $N^(1/2)$, for both $T<T_c$ and $T>T_c$. One can see how the probabilities in the different phases lead to a symmetry breaking.
#figure(
  image("assets/crfordiffN.png", width: 80%),
  caption: [
    The graph of $c_r$ vs $r$ for $T<T_c$ for different values of $N = 100, 200, 400, 800$
  ],
)

#figure(
  image("assets/crfordiffN2.png", width: 80%),
  caption: [
    The graph of $c_r$ vs $r$ for $T>T_c$ for different values of $N = 100, 200, 400, 800$

  ],
)
