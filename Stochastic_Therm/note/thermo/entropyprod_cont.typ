#import "../imports.typ":*

= Entropy production in continuous systems

#td([Need to talk about continuous systems and stochastic integral conventions.])

Let's see the entropy production in continuous systems. The overdamped langevin equation is given by,
$
dv(x,t) = mu_p fg + sqrt(2 D) wn
$
where $fg$ is some generalized force, which can be broken into two parts, A term $- partial u(xh,ll)\/partial x$ representing the force originating from a conservative force field $u(xh, ll)$ and $f(xh,t)$ a non conservative force, which represents non-equilibrium driving. In common literature, one often encounters this with the _friction coeeficient_ $gamma$. Note $mu_p = gamma^(-1)$, where $mu_p$ is the _mobility_ of the particle. The corresponding Fokker planck is given by,
$
  pdv(pr,t) = pdv(,x)[-mu_p pdv(fg,x) pr + D pdv(pr,x)]
$
This can be written in the form of a continuity equation,
$
  pdv(pr,t) = -pdv(J(x,t),x)
$
where, the probability current is given by,
$
  J(x,t) = mu_p fg pr - D pdv(pr,x)
$<pcurr_overdamp>
In the absence of driving $f(xh,t)$ and $ll$ is held constant, we obtain the equilibrium state $J=0$,
$
  p^"eq" (x) = e^(F(ll)) e^(- bb u(x,ll))
$
where the Free energy $F(ll)$ is given by the normalization condition,
$
  F(ll) = -kb T ln(int dd(x) exp(- bb u(x,ll)))
$
The *canonical distribution* is attained provided the fluctuation dissipation relation is given as,
$
  D = kb T mu_p
$<fdr_overdamp>
#q([With driving and suitable boundary conditions, the solution is a NESS, where work done by driving equals heat to reservoir. Read further])

The energy change can be seen as
$
  dd(u) = pdv(u(xh,ll),x) svh dd(xh) + pdv(u(xh,ll),ll) dv(ll,t) dd(t)
$<intenergy_cts>
#td([Why the stratonovich convention. Read KS and NS.]) The $svh$ signifies that the term should be interpreted in the stratonovich sense.

Recall the discrete definition of work #td([insert relevant equation.]). In continuous systems, the infinitesimal work done is given by,
$
  dd(w) = pdv(u(xh,ll),ll) dv(ll,t) dd(t) + f(xh,t) svh dd(xh)
$<work_cts>
Combining @intenergy_cts and @work_cts, we define the heat given to the reservoir,
$
  dd(q) = dd(w) - dd(u) = [- pdv(u(xh,ll),x) + f(xh,t)] svh dd(xh) = fg svh dd(xh)
$

The system entropy is given using the Shannon-Entropy formula,
$
  s^"sys" (xh,t) = -kb ln pr
$
where $pr$ is the probability that the random variable $xh$ takes the value $x$ at time $t$. One can regard this probability distribution as a function of the random variable itself. #q([I think one requires strato convention in order for these to be equivalent.]) We also use the fact that the stratonovich convention preserves the chain rule. Using @pcurr_overdamp and @fdr_overdamp, the rate of increase of system entropy is given by,
$
  dv(,t) s^"sys" (xh(t),t) &= - kb ln p(x(t),t)\
&= - kb/pr [pdv(pr,x) svh dv(xh,t) + pdv(pr,t)]\
&= kb [J(x,t)/(D pr) svh dv(xh,t) - fg/(kb T) svh dv(xh,t) - 1/pr pdv(pr,t)]
$
Since the reservoir, has fast relaxation times and is held at the same temperature, the reservoir entropy is $s^"res" = q/T$. The total stochastic entropy production,
$
  dot(s)^"tot" &= dv(s^"sys",t) + dot(s^"res") \
  &= kb [J(x,t)/(D pr) svh dv(xh,t) - 1/pr pdv(pr,t)]
$

#text(purple)[
  A small note on notation here. Strictly speaking $expval(f)$ are used when the function $f$ is a random variable. However, here sometimes, we need to average out functions, which  in the truest sense are not random variables.

  The biggest culprit is the common notation of the Shannon entropy $S[p(x)]$as the "average" of stochastic entropy $sigma(p(x)) = ln(p(x))$.
  $
    S[p(x)] = -sum_(x) p_x ln p_x = -sum_(x) p_x sigma(x) = expval(sigma_x)
  $
  Many books use the last definition. However, in the strictest sense, that is an abuse of notation. We have just introduced a measure for addition or integration, which just so happens to be similar to the integral forms of conventional expectations. So whenever, the integral or additive measure is $pr$, but we are not averaging over random variables, we introduce a new notation,
  $
    pexpval(f(x,t)) = int dd(x) pr f(x,t)
$]
Using this, we can calculate the average entropy production rate,
$
  aep^"tot" = int dd(x) dot(s)^"tot" ( xx) = expval(dot(s)^"tot")
$
Note that the last term vanishes due to conservation of probability
$
  int dd(x) 1/pr pdv(pr,t) pr = pdv(,t) int dd(x) pr = 0
$
The other terms can be easily found in the Ito convention, so we shall switch to that,
$
  expval(s^"tot") &= kb pexpval(J(x,t)/(D pr) svh dd(xh))\
  &=kb pexpval((J(x,t) mu_p fg)/(D pr) + sqrt(2/D) J(x,t)/pr svh dd(W)) \
  &= kb pexpval((J(x,t) mu_p fg)/(D pr) + underbrace(sqrt(2/D) J(x,t)/pr ito dd(W),2) + underbrace(1/pr pdv(J(x,t),x) dd(t),3) - J(x,t)/(pr)^2 pdv(pr,x) dd(t))
$
The nonanticipation of the Ito integral gives
$ exp(int f(xh) ito dd(W)) = int exp(f(xh)) ito exp(dd(W)) = 0  $
#q([Different conventions for nonanticipation of ito in KS, NS, and PP. Why?])
Thus, on an average over different time intervals term $2$ equals 0. Also term $3$ can be converted to a surface term, which vanishes under proper boundary conditions. We are left with,
$
  aep^"tot" &= kb pexpval((J(x,t) mu_p fg)/(D pr) - J(x,t)/(pr)^2 pdv(pr,x) dd(t)) \
  &= kb pexpval(J(x,t)/(pr)( (mu_p fg)/(D ) - 1/(pr)pdv(pr,x) dd(t))) \
  &= kb pexpval((J^2 (x,t))/(D p^2 (x;t))) = kb int dd(x) (J^2 (x,t))/(D p(x;t))
$

Thus we have obtained a formula for the total entropy production rate for continuous systems.

#result("Entropy Production Rate for Continuous Systems",
  [\ The total entropy production for a system in both continuous space and time is
  $
    aep^"tot" &= kb pexpval((J^2 (x,t))/(D p^2 (x;t))) = kb int dd(x) (J^2 (x,t))/(D p(x;t))
  $]
  )
