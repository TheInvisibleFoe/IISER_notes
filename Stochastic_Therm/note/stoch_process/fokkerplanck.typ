#import "../imports.typ": *

= Fokker-Planck Equation

The Fokker-Planck equation is a partial differential equation that describes the time evolution of the probability density function of a stochastic process.
#td([Kramers Moyal Expansion derivation from the Chapman Kolmogorov equation needs to be added here later. Also need to add Pawula's Theorem.])
== Ito vs Stratonovich Calculus
Suppose we have a stochastic variable $xh$ that evolves according to the following SDE:
$
  dot(xh) = h(xh,t) + g(xh,t) wn
$
The white noise $wn$ has the following properties:
$
  expval(wn) = 0 quad ; quad expval(wno(t) wno(t')) = delta(t - t')
$
The properties of this noise ensure that the stochastic process follows the Markov property. Completely mathematically speaking, this SDE is not well defined. If the noise coefficient $g(xh,t)$ is independent of $xh$, then the SDE is called an additive noise SDE, else it is called a multiplicative noise SDE. If the noise is multiplicative the way in which we choose our product (Itō or Stratonovich) matters. For an example see section 4.1.2.1 _"Singularity"_ in the section on_"Stochastic Differential Equations and Integrals"_ in @Shi23. When we compute integrals involving multiplicative noise, we have to choose at which point in the interval we evaluate the function multiplying the noise. 

One can do without conventions and obtain the drift and diffusion equations from how we define the dirac delta. See Section 3.3.2 _"Kramers-Moyal Expansion Coefficients"_ in @Ris96 to derive the Fokker-Planck equation using a limiting approach on the dirac-delta function. However, it pays to be consistent with a convention.

We can properly define the SDE  as,
$
  xh(t+tau)  = x + int_(t)^(t+tau) h(xh(t'),t') d t' + int_(t)^(t+tau) g(xh(t'),t')  times_aa d W(t')
$
The rule of product $times_aa$ depends on the convention we choose. One cannot write $dot(W)(t) = wn$, since the Wiener process $W(t)$ is nowhere differentiable. So we have to use the Riemann-Stieltjes integral rather than the Riemann integral. Let us define the noise increment $w(t)$
$
  w(tau) = W(t+tau) - W(t) = int_(t)^(t+tau) wn d t'
$
Alternaltively, we can also use the notation,
$
  w_t (tau) := w(tau) = int_(t)^(t+tau) wn d t'
$
Note that $w(tau)$ is gaussian distributed, since $wn$ is gaussian distributed. We obtain,
$
  expval(w(tau)) &= 0  \
  expval(w(tau_1) w(tau_2)) &= min(tau_1, tau_2) \
$
#proof[
  The first equation is trivial. We will sketch a proof for the second expression using properties of the white noise. Then,
  $
    expval(w(tau_1) w(tau_2)) &= expval(int_t^(t+tau_1) int_t^(t+tau_2) wn(t') wn(t'') d t' d t'') \ 
    &= int_t^(t+tau_1) int_t^(t+tau_2) expval(wn(t') wn(t'')) d t' d t'' \
    &= int_t^(t+tau_1) int_t^(t+tau_2) delta(t' - t'') d t' d t'' \
    &= int_t^(t+min(tau_1, tau_2)) d t' = min(tau_1, tau_2) \
  $
  The fourth line follows easily from the fact that the delta function picks out the region where $t' = t''$ and the limits of integration are from $t$ to $t + tau_1$ and $t$ to $t + tau_2$. Hence the limits of integration become from $t$ to $t + min(tau_1, tau_2)$.
]

One can also obtain these properties from another formulation of the white noise as a discrete derivative of the Wiener process.
#definition("Wiener Process")[
The Wiener process $W(t)$ is a continuous-time stochastic process that models Brownian motion. It has the following properties:
- $W(0) = 0$ almost surely.
- The increments of the Wiener process are independent and normally distributed with mean zero and variance equal to the time increment.
$
  W(t+tau) - W(t) ~ scr(N)(0, tau) 
$
- The paths of the Wiener process are continuous but nowhere differentiable.
]
 
Returning to our original goal of assigning a rule of product, we define the product in a stochastic integral, as follows:
$
  A_aa = int_0^Tau f(W(t'),t) times_aa d W(t') := lim_(tau --> oo) sum_(n=0)^(N-1) w_t_n (tau) f(W_(tau)(t'_n))
$
where $t_n = n tau$ and the rule of product $t'_n = t_n + aa tau$ and the discretized noise increment using the rule of product $times_aa$ is given by,
$
  W_tau (t_n) &= sum_(k=0)^(n-1) w_t_k (tau) \
  W_tau (t'_n) &= W_tau (t_n) + aa w_t_n (tau) 
$
The Ito and Stratonovich conventions correspond to the choices $aa = 0$ and $aa = 1/2$ respectively.
#definition("Ito Convention")[
  In the Ito convention $(ito)$, the function multiplying the noise is evaluated at the beginning of the interval. 
  $
    A_I = int_0^Tau f(W(t'),t) ito d W(t') := lim_(tau --> oo) sum_(n=0)^(N-1) w_t_n (tau) f(W_(tau)(t_n))
  $
]
#definition("Stratonovich Convention")[
  In the Stratonovich convention $(svh)$, the function multiplying the noise is evaluated at the midpoint of the interval. 
  $
    A_S = int_0^Tau f(W(t'),t) svh d W(t') := lim_(tau --> oo) sum_(n=0)^(N-1) w_t_n (tau) f(W_(tau)((t_n + t_(n+1))/2))
  $
]

These two commonly used rules of product each have their pros and cons. 
The Ito convention is non-anticipative, meaning that the value of the function at the beginning of the interval does not depend on future values of the Wiener process. However, the Ito calculus does not follow the standard rules of calculus, such as the chain rule. On the other hand, the Stratonovich convention follows the standard rules of calculus, making it more intuitive for those familiar with classical calculus. However, it is anticipative, meaning that the value of the function at the midpoint of the interval depends on future values of the Wiener process.

#theorem("Non-anticipation of the Ito integral")[
  $ expval(int_0^t d W(t') ito f(W(t'),t')) = int_0^t expval(f(W(t'),t')) expval(d W(t')) = 0 $ 
]

#theorem("Chain Rule for Strato convention")[
  The differential of a function $F(W(t),t)$ satisfies the usual chain rule:
  $ d F(W(t),t) = pdv(F,t) d t + pdv(F,W) svh d W $
]

The choice of convention depends on the specific problem at hand and the desired properties of the resulting stochastic integral. For additive noise, both conventions yield the same result in the Fokker Planck equation. This can be seen because of the following theorem.

#theorem("Equivalence between Conventions")[
  Suppose the stochastic variable $xh$ evolves according to the SDE in the Strato convention:
  $
    dv(xh,t) = h(xh,t) d t + g(xh,t) svh wn
  $
  
  The Ito and Stratonovich conventions are related by the following transformation:
 $
   dv(xh,t) &= h(xh,t) d t + g(xh,t) svh wn \
   &= [h(xh,t) + 1/2 g(xh,t) pdv(g(xh,t),x)] d t + g(xh,t) ito wn
 $
]


However, for multiplicative noise in physical applications, unless there is a specific reason to choose otherwise, the Stratonovich convention is generally preferred. This choice is made because of the Wong-Zakai theorem. The Wong-Zakai theorem states that if one approximates the white noise by a smooth process (for example, by a piecewise linear function), then the solution of the corresponding ordinary differential equation converges to the solution of the Stratonovich SDE as the approximation becomes more accurate. This theorem provides a strong justification for using the Stratonovich convention in physical applications, where noise is often modeled as a limit of smooth processes. See the original paper @WongZakai1965.

== Single Variable Fokker-Planck Equation

Suppose we have a stochastic variable $xh$ that evolves according to the following Langevin Equation:
$  dot(xh) = h(xh,t) + g(xh,t) times_aa wn
$

#definition("Fokker Planck Equation")[
The Fokker-Planck equation describes the time evolution of the probability density function $pr$ of the stochastic variable $xh$ governed by the some SDE.
The Fokker-Planck equation for a single variable $x$ is given by:
$
  pdv(pr,t) = lfp pr = [- pdv(,t) odr + pdv(,x,2) odiff ] pr
$
The coefficients in the Fokker Planck Operator $lfp$, $odr$ and $odiff$ are known as the drift and diffusion coefficients respectively. 
]
One can derive the drift and diffusion coefficients from the SDE as follows based on the Ito and the Stratonovich conventions. 

Suppose at time $t$, the stochastic variable $xh$ takes the value $y$,$xh(t) =y$. The drift and diffusion coefficients from the Kramers Moyal expansion is given by,
$
  odr &= lim_(tau --> 0) (1/tau) expval(xh(t+tau) - y) \
  odiff &= lim_(tau --> 0) (1/(2 tau)) expval((xh(t+tau) - y)^2) \
$
#td([Derivation of the drift and diffusion coefficients from the SDE needs to be added here later. See @Ris96 for reference.])

The drift coefficients for the two conventions are given by,
$
  D^((1))_I (x,t) &= h(x,t) \
  D^((2))_S (x,t) &= h(x,t) + 1/2 g(x,t) pdv(g(x,t),x) \  
$
The diffusion coefficients for both conventions are the same,
$
 odiff = 1/2 g(x,t)^2 \
$
#example("Fokker Planck Equation for the overdamped Langevin Equation")[
  #set math.equation(numbering:none)
  The overdamped Langevin equation is given by,
  $
    dv(xh,t) = mu F(xh,t) + sqrt((2 kb T)/mu) wn
  $
  where $mu = 1\/gamma$ is the mobility.
  The noise is additive, so the choice of convention does not matter. The drift and diffusion coefficients are given by,
  $
    odr &= mu F(x,t) \
    odiff &= (kb T)/mu
  $
  
  The fokker planck equation is given by,
  $
    dv(pr,t) = -pdv(,x)[mu F(x,t) pr] + (kb T)/mu pdv(pr,x,2)
  $
  
]

== Multivariable Fokker-Planck Equation 

Suppose we have a set of stochastic variables $x = (x_1, x_2, ..., x_n)$ that evolve according to the following set of Langevin Equations:
$
  dv(vb(xh),t) = vb(A)(vb(xh),t) + vb(B)(vb(xh),t) times_aa vb(xi)(t)
$
The multivariable white noise $vb(xi)(t) = (wno(t)_i)_(i in I)$ has the following properties:
$  
  expval(wno(t)_i) = 0 quad ; quad expval(wno(t)_i wno(t')_j) = delta_"ij" delta(t - t')
$
Then the drift coefficients are,
$
  "(Ito)" quad mdr &= vb(A)(x,t) \
  "(Strato)" quad mdr &= vb(A)(x,t) + 1/2 vb(C) (x,t)
$
where the correction vector $vb(C)(x,t)$ has components,
$
  C_i = sum_(i=1)^n sum_(j=1)^m vb(B)_(i j)(x,t) pdv(vb(B)_(i j)(x,t), x_j)
$
The diffusion matrix for both conventions is the same,
$
  mdiff = 1/2 vb(B)vb(B)^T \  
$
Note the gradient vector,
$
  grad = (pdv(,x_1), pdv(,x_2), ..., pdv(,x_n))^T
$
#definition("Multivariable Fokker Planck Equation")[
The Fokker-Planck equation for a set of stochastic variables $x = (x_1, x_2, ..., x_n)$ is given by:
$
  pdv(p(x;t),t) &= lfp p(x;t) \ 
  &= - div [mdr_i pr] +  1/2 grad grad^T [mdiff pr]
$
where $div$ is the divergence operator and $grad grad^T$ is the Hessian operator.
The coefficients in the Fokker Planck Operator $lfp$, $mdr$ and $mdiff$ are known as the drift vector and diffusion matrix respectively. 
]
#example("Fokker Planck Equation for Kramers Equation")[
  #set math.equation(numbering:none)
  
  The underdamped Langevin equation for a particle of mass $m$ in a potential $U(x)$. Stochastic differential equation for the vector $vb(x) = (xh, ph)$ with the Strato convention,
  $
    dv(vb(x),t) = vb(mu) + vb(B) svh vb(xi)(t)
  $
  
  where 
  $
    vb(mu) &= vec( ph\/m ,- gamma/m ph + F(xh,t)) \
    vb(B) &= vec(0,sqrt(2 gamma kb T))
  $
  Since the noise is additive, both conventions are equivalent and we obtain,
  $
    mdr &= vb(mu)\
    mdiff &= 1/2 vb(B)vb(B)^T = mat(gamma kb T ,0;0,0)
  $
  The gradient operator here is given by,
  $
    grad = (pdv(,x),pdv(,p)) 
  $
  The Fokker planck equation is given by,
  $
    dv(p(x,p,t),t) = [- pdv(,x) p/m + pdv(,x)((gamma p )/m - F(x,t))+ gamma kb T pdv(,p,2)] p(x,p,t)
  $
  
  For the special case of conservative force $F= -pdv(U(x,t),x)$, we obtain the steady state distribution to be the canonical Boltzmann distribution,
  $
    p^"ss" (x,p,t) ~ exp(-bb (p^2/(2 m) + U(x,t)))
  $
  
]