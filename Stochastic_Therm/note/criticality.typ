
#import "imports.typ": *

#let sn = "sn"
#let cn = "cn"
#let dn = "dn"
#let pm = $plus.minus$
#let mp = $minus.plus$
#let phia = $phi.alt$
#let am = "Am"


= The Criticality of the 2D Ising Model

The free energy of the 2D Ising model is given by @freeenergy and @ffunc. Note the form of $F(theta)$, which, for positive $k$ and real $theta$, is an analytic function in $theta$, $k$ and $cosh(2L), cosh(2K)$ except possibly in one case. Consider the case when $theta= 0$, we then obtain from @ffunc,
$
  F(0) &= ln[2 {cosh(2K) cosh(2L) + k^(-1) sqrt(1 + k^2 - 2 k)}]\
  &= ln[2 {cosh(2K) cosh(2L) pm k^(-1)(1-k)}] 
$
Thus, $F(theta)$ might be non-analytic when $k=1$ and $theta = 0$. So let us examine this further. Near $k=1$ and $theta = 0$, the square root becomes zero. So we can write,
$
  F(theta) &= ln[2 {cosh(2K) cosh(2L)}] + ln(1+ (k^(-1)sqrt(1 + k^2 - 2 k cos(2 theta)))/(cosh(2K) cosh(2L)) ) \
  &= ln[2 {cosh(2K) cosh(2L)}] + (k^(-1)sqrt(1 + k^2 - 2 k cos(2 theta)))/(cosh(2K) cosh(2L)) + ...
$
where we used the Taylor expansion of $ln(1+x)$ around $x=0$, which is $ln(1+x) = x - 1/2 x^2 + 1/3 x^3 + O(x^4)$. Plugging this form of $F(theta)$ into the integral in @freeenergy, we obtain,
$
  - 2 pi beta f &= pi ln(2 cosh(2K) cosh(2L)) + integral_0^pi dd(theta) (k^(-1)sqrt(1 + k^2 - 2 k cos(2 theta)))/(cosh(2K) cosh(2L))  \
$
The first term in the above equation cannot give us singularities. All nuisance points must arise from the second term $f_n$,
$
  - 2 pi beta f_n &= integral_0^pi dd(theta) (k^(-1)sqrt(1 + k^2 - 2 k cos(2 theta)))/(cosh(2K) cosh(2L)) \
$
Changing the variable of integration from $theta$ to $pi/2 - theta$ and the trigonometric formula, we obtain $cos(2 theta) = 2 cos^2(theta) -1$,
$
  - beta f_n & = (2 pi)^(-1) [2(1+k)]/(cosh(2K) cosh(2L)) integral_0^(pi/2) dd(theta) (1-[(2k^(1/2))/(1+k)]^2 sin^2(theta))^(1/2)  
$
This integral has a special name and is called the complete elliptic integral of the second kind, $E(k)$. Thus, we can write,
$
  - beta f_n &= (2 pi)^(-1) [2(1+k)]/(cosh(2K) cosh(2L)) E(k_1) \
$<freecritical>
where
$
  E(k) = integral_0^(pi/2) dd(theta) (1-k^2 sin^2(theta))^(1/2)
$
$
  k_1 = (2k^(1/2))/(1+k)
$
Define the complex or complementary modulus like $k' = sqrt(1-k^2)$.
The Table of Integrals Series and products mentions in Sec. 8.114 equation 3 @GR that when $k'$ is near $0$,
$
  E(k) &= 1 + 1/2(ln(4/k') -1/2)k'^2 + O(k'^3) \
  &= 1 + 1/4 ln(16/(1-k^2)) (1-k^2)  -1/4 (1-k^2) \
  & approx 1 + 1/4 ln(16/(1-k^2)) (1-k^2)
$
Thus, we obtain from this and @freecritical, neglecting analytic contributions,
$
  - beta f_n = [(1+k)(1-k)^2]/[2 pi k cosh(2K) cosh(2L)] ln abs((1+k)/(1-k)) \
$
Thus, we can clearly observe from this that the free energy is non-analytic at $k=1$. This matches our result from Kramers Wannier Duality, where we showed that if there  is only one critical point, then it must be at $k=1$ @critline. Thus, we conclude that the 2D Ising model has a critical point at $k=1$.

// Spellcheck Done