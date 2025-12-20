
#import "imports.typ": *

#let sn = "sn"
#let cn = "cn"
#let dn = "dn"
#let pm = $plus.minus$
#let mp = $minus.plus$
#let phia = $phi.alt$
#let am = "Am"

= The Eigenvalues of the Transfer Matrix

Let us recollect the parameterizations that we used to obtain the elliptic functions in the previous section. 

From the definition of the amplitude of the elliptic function @ampfunc and @ampeigroots, we have,
$
   & am(phia_j) = -i ln[i k^(1/2) sn(phia_j - i/2 I')] \
   ==> & k^(1/2) sn(phia_j - i/2 I') = exp(i theta_j) 
$<id1>
The elliptic trigonometric identities are given as @elliptrig,
#nonum($
  & sn^2(u) + cn^2(u) = 1 \
  & dn^2(u) + k^2 sn^2(u) = 1 \
$)
Let $t = phia_j -i/2 I'$. Using these, we obtain,
$
  cn^2(t) dn^2(t) &= (1 - sn^2(t))(1 - k^2 sn^2(t)) \
  &= (1 - k^(-1) e^(i theta_j))(1 - k e^( i theta_j)) \
  &= 1 - k e^(i theta_j) - k^(-1) e^(i theta_j) + e^(-4 i theta_j) \
  &= exp(2 i theta_j)[2 cosh(2 theta_j) - k - 1/k]
$<idtemp>
Using @idtemp, we can write,
$
  cn(t) dn(t) &= - i k^(1/2) exp(2 i theta_j) c_j
$<id2>
where 
$
  c_j = k^(-1) [1 + k^2 - 2 k cosh(2 theta_j) ]^(1/2)
$
The addition formula for the elliptic functions is given in @additiontheorem. Using @id1 and
@id2 and the addition theorem, we obtain,
$
  sn(i u -t) &= (sn(i u) cn(t) dn(t) - cn(i u) dn(i u) sn(t))/(1 - k^2 sn^2(i u ) sn^2(t)) \
  &= (k^(-1/2) cn(i u) dn(i u) e^(i theta_j) - i k^(1/2) e^(i theta_j) sn(i u) c_j)/(1 - k e^(2 i theta_j) sn^2(i u)) \
  &= k^(-1/2) (cn(i u) dn(i u) - i k c_j sn(i u))/(exp(- i theta_j) -k exp(i theta_j) sn^2(i u)) \
$<addform>
From @ellparam, we obtain,
$
  sinh(2K) &= - i sn(i u) \
  sinh(2L) &=  i /(k sn(i u))\
  cosh(2K) &= sqrt(1 - sn^2(i u)) = cn(i u) \
  cosh(2L) &= sqrt(1 - k^(- 2) sn^(-2)(i u)) = ( i dn(i u))/(k sn(i u)) \ 
$
Using these, we can remove the elliptic functions from @addform,
$
  k^(1/2) sn(i u -t) &= (cn(i u) dn(i u) - i k c_j sn(i u))/(exp(- i theta_j) -k exp(i theta_j) sn^2(i u)) \
  &= (cosh(2K) cosh(2L) + c_j )/(exp(- i theta_j)sinh(2 L) + k exp(i theta_j) sinh(2K)) \
$
Thus, we have reverted the parameterization the factors in the product in @eigenvalueelliptic. Also note that in @eigenvalueelliptic, $gamma_j$ can take the values $pm 1$. Using this we can write that ,
$
  k^(1/2) sn(i u - phia_j + i/2 I') &= (k^(1/2) sn(i u -t) exp(i theta_j))^(-1)
$
Using this we can write $nu_j$ as,
$
  & nu_j = k^(1/2) sn( i u - phia_j + i/2 I') \
  ==> & k^(1/2) sn(i u - phia_j + i/2 gamma_j I') = nu_j^(gamma_j)
$

The factors preceding the product in @eigenvalueelliptic can also be reverted in the same way,
$
  2/(k sn(i u )) &= -2 i sinh(2L) \ 
  2 sn( i u) &= 2 i sinh(2K) \ 
$
Using these relations we can completely eliminate the dependence of the eigenvalue on the elliptic functions. The eigenvalue can then be written as,
$
  Lambda^2(u) = zeta (-4)^p [sinh(2L)^(2p) + r (sinh(2K))^(2p)] product_(j =1)^(2 p) nu_j^(gamma_j)
$<eigenelliptic>
where $gamma_j$ takes the values $pm 1$ and $nu_j$ is given as,
$
  nu_j =(cosh(2K) cosh(2L) + c_j )/(exp(- i theta_j)sinh(2 L) +  exp(i theta_j) sinh(2K)) \
$<nujeig>
and $c_j$ is given by,
$
  c_j = k^(-1) [1 + k^2 - 2 k cos(2 theta_j) ]^(1/2)
$<cjform>

Here we have only obtained the general forms to the eigenvalue if $k<1$. We can analytically continue the solution to $k>1$. The constraint on $k<1$ was imposed by our use of elliptic functions. Since, we have removed the dependence to elliptic functions in the eigenvalue, we can analytically continue the solution to $k>1$ as well.


== Analytic Continuation of the Eigenvalue

The eigenvalue, for finite $p$, must be an algebraic function of $exp(2K)$ and $exp(2L)$, since these constitute the elements of the transfer matrix. We know that the eigenvalue is a linear combination of the matrix elements of the transfer matrix. Thus, the elliptic function removed version of the eigenvalue can be analytically continued to the case of $k>=1$. 

The only dependence on $k$ in the eigenvalue is in $c_j$. The sign of $c_j$ should concern us. If $gamma = -1$, then the numerator of $c_j$ introduces potential singularities into the eigenvalue, where
$
  cosh(2K) cosh(2L) + c_j = 0
$

The form of $c_j$ is given by,
#nonum($
  c_j &= k^(-1) [1 + k^2 - 2 k cos(2 theta_j) ]^(1/2) \
  &=  k^(-1) [(1-k)^2 + 2 k (1 - cos(2 theta_j))]^(1/2) 
  $
)
Thus for any value of $k$, $c_j$ is always real and positive, given $0< theta_j < pi$. For all roots 
$j in {1,..., 2 p}$, this approaches a positive limit when $k --> 1$, so we choose the positive root for $c_j$.

The problem arises when $r = -1$ and $j = 2 p$, then $theta_j = pi$ and for $k<1$, 
$
  c_(2 p) = (1-k)/k --> 0
$
Thus, the analytic continuation of the eigenvalue to $k>1$ for this case needs to be the negative square root. A clearer idea of the analytic continuation can be viewed in the following plot. 
#figure(
  image("assets/cvals.png", width:80%),
  caption:[
    The plot of $c_j$ as a function of $k$. The purple line corresponds to $pi/2$ and the yellow line corresponds to $pi$. The solution is obtained from the interval of $ k in(0,1)$ which is the region where the elliptic functions are defined. The blue line is the positive root and the red line is the negative root. 
  ]
)<analcontfig>
Observe @analcontfig. The colors in the color map go from purple to yellow, where the purple line corresponds to $theta_j = pi/2$ and the yellow line corresponds to $theta_j = pi$. The blue line is the positive root of $c_j$  at $theta_j = pi$ while the red line is the negative root of $c_j$ at $theta_j = pi$. The analytic continuation of the eigenvalue to $k>1$ is given by the negative root of $c_j$ at $theta_j = pi$. Thus, from the graph we can clearly see that the negative root is the analytic continuation of the eigenvalue to $k>1$ for the case $r = -1$ and $j = 2 p$. This type of non-analytic behavior also arises at $theta_j = 0$, since these graphs obtained will be symmetric about $theta_j = pi/2$. However, the $theta = 0$ is not a root of the eigenvalue, since $theta_j^"min" = pi\/2p$ for $r=-1$ and $theta_j^"min" = pi \/ 4 p$ for $r =1$.

Thus, the analytically continued form of $c_j$ is given by,
$
  c_j &= k^(-1) [1 + k^2 - 2 k cos(2 theta_j) ]^(1/2) 
$
unless $r = -1$ and $j = 2 p$, then
$
  c_j = -k^(-1) [1 + k^2 - 2 k cos(2 theta_j) ]^(1/2) 
$
#result("General expression of the eigenvalues")[
  The eigenvalue of the transfer matrix $Lambda^2(u)$ is given by,
  #nonum($ Lambda^2(u) = zeta (-4)^p [sinh(2L)^(2p) + r (sinh(2K))^(2p)] product_(j =1)^(2 p) nu_j^(gamma_j) $)
  where $gamma_j$ takes the values $pm 1$ and $nu_j$ is given as,
  #nonum($ nu_j =(cosh(2K) cosh(2L) + c_j )/(exp(- i theta_j)sinh(2 L) +  exp(i theta_j) sinh(2K)) $) and $c_j$ is given by,
  #nonum($ c_j = cases( - k^(-1) [1 + k^2 - 2 k cos(2 theta_j) ]^(1/2) quad & "if" k > 1 "and" j=2p "and" r= -1 , k^(-1) [1 + k^2 - 2 k cos(2 theta_j) ]^(1/2) quad & "Otherwise") $)
  where #nonum($ theta_j = cases((pi j)/(2 p) quad & j in {1, ..., 2 p} quad "if" r = -1, (pi (j - 1/2))/(2 p) quad & j in {1, ..., 2 p} quad "if" r = +1) $)
  and the normalization factor $zeta$ is given by,
  #nonum($ zeta = cases(- i quad & "if" r = -1, 1 quad & "if" r = +1) $)
]