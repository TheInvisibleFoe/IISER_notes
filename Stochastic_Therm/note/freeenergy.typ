
#import "imports.typ": *

#let sn = "sn"
#let cn = "cn"
#let dn = "dn"
#let pm = $plus.minus$
#let mp = $minus.plus$
#let phia = $phi.alt$
#let am = "Am"

= The maximum eigenvalue

The partition function for the 2D Ising model is given by @pfn2dising. There are $m$ rows in the 2D Ising model and each row has $2 p$ sites. The number of sites $N$ is then given by $2 m p$. The free energy per site is given by,
$
  - beta f &= lim_(N --> oo) (1/N) ln Z_N\
  &= lim_(m --> oo) (m/(2 m p)) 1/m ln(Z_N) \
  &= (2 p)^(-1) Lambda_"max" (u)
$

The transfer matrix has all positive entries, and hence the matrix is irreducible. The Perron Frobenius theorem @meyer2000applied guarantees that the maximum eigenvalue is positive and unique and the corresponding eigenvector has all positive entries. The matrix of unlike entries $R$ @ulmatdef is a matrix of all positive entries. Note that the eigenvector of the dominant eigenvalue is given by $xx(k)$, which is a vector of all positive entries. Thus, the eigenvalue $r$ has to be positive, which means $r = +1$.

After this we need to maximize the expression,
$
  Lambda^2(u) =  (-4)^p [sinh(2L)^(2p) +  (sinh(2K))^(2p)] product_(j =1)^(2 p) nu_j^(gamma_j)
$

The value of $abs(nu_j)$ determines the choices for $gamma_j$ for the maximum eigenvalue. Using @commcondk, @cjform and @eigenelliptic we can find $abs(nu)$. From @nujeig, we can express $nu_j = f/g$ where $f$ and $g$ are the numerator and denominator respectively of $nu_j$, such that $f$ is real and $g$ is in general complex. Then,
$
  nu_j nu_j^*  &= [(f g^*)/(abs(g)^2)] [(f g)/abs(g)^2] \ 
  &= (f^2)/(abs(g)^2) \
  &= (cosh(2K) cosh(2L) + c_j)^2/(sinh^2(2L) + sinh^2(2K) + 2 sinh(2L) sinh(2K) cos(2 theta_j))\ 
  &= (cosh(2K) cosh(2L) + c_j)^2/( cosh^2(2L) + cosh^2(2K) - 2 + 1 + sinh^2(2L) sinh^2(2K) -c_j^2)\
  &= (cosh(2K) cosh(2L) + c_j)^2/( cosh^2(2L) cosh^2(2K) -c_j^2)\
  &= (cosh(2K) cosh(2L) + c_j)/(cosh(2K) cosh(2L) - c_j)
$
Note the following inequality,
$
  & (sinh(2 L) - sinh(2K))^2 >=0 \
  ==> & sinh^2(2L) + sinh^2(2K) >= 2 sinh(2L) sinh(2K) >= -2 sinh(2L) sinh(2K) cos(2 theta_j)  
$
As a result of the previous inequality, $c_j$ also satisfies the constraint relation,
$
  0<= c_j & <= (1+ k^(-2) - 2/k cos(2 theta_j))^(1/2) <= (1+ k^(-2) + sinh^2(2L) + sinh^2(2K))^(1/2) \
  & <= cosh(2L) cosh(2K)
$
Using this inequality, $abs(v_j) >= 1$. Thus, the eigenvalue is clearly maximized when all $gamma_j = +1$. Using this and the fact that for the maximum eigenvalue $r = 1$, we can reduce the expression further. 

The denominator in @nujeig is,
$
  e^(- i theta_j) sinh(2L) + e^(i theta_j) sinh(2K) &= e^(i theta_j)[sinh(2K) + e^(-2 i theta_j) sinh(2L)] ] \
  &= e^(i pi (j-1/2) \/ 2p) [sinh(2K) + e^(- i pi (2j-1) \/ 2 p) sinh(2L)] \
$<dennujeig>
Consider a general expression $(t+ alpha t_j)$. Take the product of this expression from $j=1$ to $2p$. Evaluated,
$
  product_(j=1)^(2p) (t + alpha t_j) &= t^(2p) + [sum_(j=1)^(2p) t_j] alpha t^(2p-1) + alpha^2 [sum_(1<= i<j<=2p) t_i t_j] t^(2p-2) + ... + product_(j=1)^(2p) t_j \
$<expressionroots>
The factor before $sinh(2L)$ in @nujeig corresponds to the solutions of $(2p)$th roots of $-1$. The equation with solutions as the $2p$th roots of $-1$ is given by,
$
  z^(2p) = -1
$
Let the $j^"th"$ root of this equation be $eta_j$. By Vieta's Theorem @viete_theorem, the following relations hold,
$
  sum_(j=1)^(2p) eta_j &= 0 \
  sum_(1<= i<j<=2p) eta_i eta_j &= 0 \
$
This holds for all summations of combinations of roots, other than the product of all roots. Using this fact, all terms in @expressionroots vanish except the first and the last term. Using these relations, we can write the denominator in @nujeig as,
$
  product_(j=1)^(2p) e^((i pi (j-1/2)) / (2p)) [sinh(2K) + e^(- (i pi (2j-1)) / (2 p)) sinh(2L)] &= [sinh^(2p)(2K) + sinh^(2p)(2L)] product_(j=1)^(2p) e^(i pi (j-1/2) \/ 2p) \
  &= (-1)^(p) [sinh^(2p)(2K) + sinh^(2p)(2L)]
$
Thus using this in @eigenelliptic, we can write the maximum eigenvalue as,
$
  Lambda^2(u) &= (-1)^(p) 4^p [sinh^(2p)(2K) + sinh^(2p)(2L)] product_(j=1)^(2p) nu_j\
  &= product_(j=1)^(2 p) 2 [cosh(2K) cosh(2L) + c_j] \
$<lambfinal>
We are finally ready to take the thermodynamic limit. Define the function $F(theta)$,
$
  F(theta) = ln[2{cosh(2K) cosh(2L) + k^(-1) [1 + k^2 - 2 k cos(2 theta)]^(1/2)}]
$<ffunc>
Thus, the maximum eigenvalue is given from @lambfinal, @ffunc and @eigroots  and the fact that the Perron Frobenius theorem asserts that $r=1$ for the maximum eigenvalue as,
$
  ln(Lambda_"max" (u)) = 1/2 sum_(j=1)^(2p) F(pi(j-1/2) \/ 2p) \
$
In the thermodynamic limit this sum over uniformly distributed values of $theta$ becomes an integral, which runs from $0$ to $pi$. The interval of length between roots is given by $Delta theta = pi \/ 2 p$. Thus, the free energy per site is given by,
$
  - beta f = (2 pi)^(-1) integral_0^pi F(theta) dd(theta) \
$<freeenergy>

This is the major result of this article.

#result("Free energy of the 2D Ising model")[
  The free energy of the 2D Ising model is given by,
  #nonum(
    $
      - beta f = (2 pi)^(-1) integral_0^pi F(theta) dd(theta) \
    $
  )
  where $F(theta)$ is given by,
  #nonum(
    $
      F(theta) = ln[2{cosh(2K) cosh(2L) + k^(-1) [1 + k^2 - 2 k cos(2 theta)]^(1/2)}]
    $
  )
  and $k^(-1) = sinh(2K) sinh(2L) $.
]