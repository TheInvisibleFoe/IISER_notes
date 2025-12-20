#import "imports.typ": *

#let sn = "sn"
#let cn = "cn"
#let dn = "dn"
#let pm = $plus.minus$
#let mp = $minus.plus$
#let phia = $phi.alt$
#let am = "Am"

= Eigenvalues for $T < T_c$

We now solve for $k eq.not 1$. Thus, we have,
$
  sinh(2 K) &= x \
  sinh(2 L) &= (k x)^(-1)
$<xparamkl1>
Using this the elements of the matrix elements of $VV$ can be written as,
$
  exp(2 K) & = x + (1 + x^2)^(1\/2) \
  exp(2 L) & = (k x)^(-1)[ 1 + (1 + k^2 x^2)^(1\/2)] \
$
In general, there are no simple functions that can be used to parameterize @xparamkl1. If $k=1$ we can use the parameterization of $x = tan(u)$. However, we can use the elliptic functions we introduced in the previous section if $k<1$, to parameterize the eigenvalues of $VV$ and in turn express the elements of the matrix $VV$ in terms of meromorphic functions of the parameter $u$.
These functions satisfy the properties,
$
  cn^2(u) &= 1 - sn^2(u) \
  dn^2(u) &= 1 - k^2 sn^2(u) \  
$<merrel>
Note that we abbreviate the notation $sn(u,k) <==> sn(u)$ and similarly for the other elliptic functions.

Let $x = - i sn(i u)$. Using this, the parameterization of @xparamkl1 can be written as,
$
  sinh(2K) &= - i sn(i u) \
  sinh(2L) &= - i k^(-1) sn(i u)^(-1) \ 
$<ellparam>

Using this parameterization and @vform2, we can write the elements of the matrix $VV$ as,
$
  exp(plus.minus 2 K) &= cn(i u) mp i sn(i u) \
  exp(pm 2 L) &= i k^(-1) (dn(i u) pm 1)/sn(i u)
$<ellparamtmat>
Using the relations @elliptheta between Jacobian elliptic functions and the theta functions,
$
  exp(pm 2 K) &= [k' H_1(i u ) mp i H(i u)]/[k^(1/2) Theta(i u)] \
  exp(pm 2 L) &= i[k' Theta_1(i u) pm Theta(i u)]/[k^(1/2) H(i u)]
$<jthetaparam>


The elliptic functions are only defined for $0<k<1$. This can be analytically continued to $k>1$.

We outline the way we solve for the eigenvalues for the case of $k=1$ and see the major steps involved. 
+ For a given value of $k$, the transfer matrix elements $exp(pm 2K)$ and $exp(pm 2L)$ are expressed in terms of single-valued meromorphic functions of a single variable $u$. Meromorphic functions are functions that are holomorphic except at a discrete set of isolated points, which are called poles. 
+ The eigenvalues of the transfer matrix $VV$ can be expressed as a linear combination of the matrix elements of the transfer matrix. Thus, the eigenvalue is also a single-valued meromorphic function of $u$. We can write a functional relation like @inversereleig for the eigenvalues of the transfer matrix.
+ The zeros of the eigenvalue can be determined from the functional relation @inversereleig. The normalization of $Lambda(u)$ can then be determined from that up to a sign.

Before we advance, we shall some constraints on the value of $u$ for ferromagnetic Ising Models and that the calculations for the critical case is indeed a limiting case of the more general case of $k<1$. Note that
#nonum(
  $
    sn(i u) & = - i sinh(2K)  = sin(2 i K)
  $
) 

Consider the equations 15.5.7 and 15.5.8 in @baxter1982. Substituting $alpha = i beta$ in 15.5.8, we can write,
$
  u &= integral_0^(2 K) dd(beta)/(1 - i^2 sinh^2(beta))^(1/2)\
  &= integral_0^(2 K) dd(beta)/(1 + sinh^2(beta))^(1/2)
$<uconst>
If $K,L$ are real and positive, then we have,
$
  u > 0
$
and note equation 15.5.10 in @baxter1982,
$
  0 <= u <= integral_0^oo dd(beta)/(1 + k^2 sinh^2(beta))^(1/2) = I'
$

We also need to show that the calculations for the critical case is indeed a limiting case of the more general case of $k<1$. Again note equations in 15.5.9 and 15.5.10 which state that,
$
  I &= integral_0^(pi/2) dd(alpha)/(1 - k^2 sin^2(alpha))^(1/2) \ 
  I'&= integral_0^oo dd(beta)/(1 + k^2 sinh^2(beta))^(1/2) 
$
For the case of $k=1$, we have,
$
  I_(k=1) &= integral_0^(pi/2) dd(alpha)/(1 - sin^2(alpha))^(1/2) \
          &= integral_0^(pi/2) dd(alpha)/(cos(alpha)) --> oo
$
and,
$
  I'_(k=1) &= integral_0^oo dd(beta)/(1 + sinh^2(beta))^(1/2) \
           &= integral_0^oo dd(beta)/(cosh(beta)) = pi/2
$
At $k=1$, we also get from solving the integral @uconst,
$
  & u = pi/2 - arctan(e^(-2K)) \ 
  ==>& sin(2 i K) = i /2 [tan(pi/4 - u/2) -  1/tan(pi/4 - u/2)] \
  ==>& sn(i u) = i cot(pi/2 - u) = i tan(u) 
$
The parameterization here is,
#nonum(
  $
    sinh(2K) = -i sn(i u) = tan(u)
  $
)
This is exactly our parameterization for the critical case of the 2D Ising model @uparam.

== The form of $Lambda(u)$
The solution to the eigenvalues can be derived in the same way as in the case of $k=1$. The only difference is that we have to use the elliptic functions to parameterize the eigenvalues. Using this every element of the transfer matrix can be written as,
$
  V_{phi, phi'}(u) &= Upsilon(u)/(h(i u))^p
$<ellvform>
where $Upsilon(u)$ is an entire function of $u$ and 
$
 h(u) = H(u) Theta(u) 
$
Again note that the eigenvalues of $VV$ can be expressed as a linear combination of the matrix elements of the transfer matrix. The coefficients of the linear combination of the matrix elements of the transfer matrix only depend on $k$. So the eigenvalue $Lambda(u)$ can be expressed in terms of the elements of the transfer matrix as,
$
  Lambda(i u) &= Xi(u)/(h(i u))^p
$<lol1>
where $Xi(u)$ is another entire function of $u$. 
// Just a small note on notation, $Lambda(u) <==> Lambda(i u)$

We now try to find similar symmetry relations to those in the critical value of the 2D Ising model. Thus, consider incrementing $u$ by $- 2 i I$ and $2 I'$. First consider the increment by $2 I'$. Then
$
  exp(pm 2 K') &= cn(i u + 2 i I') mp i sn(i u + 2 i I')\ 
  &= - cn(i u ) pm i sn(i u) \
  &= - exp(mp 2 K )
$
Thus incrementing $u$ by $2 I'$ is the same as mapping $K,L$ by $-K pm 1/2 i pi, -L pm 1/2 i pi $. Using @negKL and @negklmat, we see that this corresponds to multiplying the transfer matrix by the unlike spin matrix $R$ @ulmatdef. Thus the eigenvalue $Lambda(u)$ satisfies the relation,
$
  Lambda(u + 2 I') &= - r Lambda(u)
$<doubper1>

Again consider incrementing $u$ by $- 2 i I$. Then,
$
  exp(pm 2 K') &= cn(i u + 2  I) mp i sn(i u + 2  I) \
  &= - [cn(u) mp i sn(u)] \
  &= - exp(pm 2 K)
$
Thus incrementing $u$ by $- 2 i I$ is the same as mapping $K,L$ by $K + 1/2 i pi, L + 1/2 i pi$. Using @negklmat, we see that the eigenvalue $Lambda(u)$ satisfies the relation,
$
  Lambda(u - 2 i I) &= Lambda(u)
$<doubper2>
Thus, the eigenvalue $Lambda(u)$ is doubly periodic with periods $2 I'$ and $2 i I$. The poles of $Lambda(i u)$ are at $u =0$, where $H(i u ) = 0$ and $ u = I'$ where $Theta(i u) = 0$. Counting a pole of order $p$ to $p$ simple poles. Thus, there are $2p$ poles in one period rectangle. Thus, from @liou2, we obtain that there are $2p$ zeros in one period rectangle. Using the symmetry relations @doubper1, @doubper2 and thus the theorem @liou3, the eigenvalue $Lambda(u)$ can be expressed as,
$
  Lambda(i u) = rho e^(i lambda u) product_(j=1)^l H(u - u_j)/ H(u - v_j)
$
where $v_j$ are the poles of $Lambda(i u)$ and $u_j$ are the zeros within a period rectangle. Note that $H( u + i I') = C exp(- i pi u \/ 2 I) Theta(u)$. Using this, we can write the eigenvalue as,
$
  Lambda(u) = rho e^(lambda u) [h(i u)]^(-p) product_{j=1}^l H(i u - i u_j)
$<lambtheta>
The constraint relations will be used later to properly count the eigenvalues of the transfer matrix. $rho$ and $lambda$ will be determined from the functional relation of the eigenvalues @inversereleig. The zeros $u_j$ will be determined similarly to the case of $k=1$.

== The Zeros of $Lambda(u)$

We can use the functional relation @inversereleig to determine the zeros of $Lambda(u)$. Note that setting $u' = u +I'$ in @ellparamtmat is the same as setting $K --> L + i pi/2$ and $L --> -K$
$
  exp(pm 2K') &= cn(i u + i I') mp i sn(i u + i I') \
  &= -i dn(i u )/(k sn(i u)) mp (k sn(i u)^(-1)\
  &= -i k^(-1) (dn(i u) mp 1)/sn(i u)\
  &= - exp(pm 2L) = exp(pm 2(L +i pi/2) ) \
  exp(pm 2L') &= i k^(-1) (dn(i u + i I') pm 1)/sn(i u + i I') \
  &= i k^(-1) (-i cn(i u )/sn(i u) pm 1) k sn(i u )\
  &=  cn(i u) pm i sn(i u)\
  &= exp(mp 2K) 
$
Using this and @ellparam, we can write the functional relation @inversereleig as,
$
  Lambda(u) Lambda(u +I') &= (2i sinh(2L))^n + (- 2i sinh(2K))^n r \
  &= (- 2/( k sn(i u)))^n + (- 2 sn(i u ))^n r\
$<invrelellip>
Using @invrelellip, @jthetaparam, @lambtheta, we can write the functional relation as,
$
  & Lambda(u) Lambda(u +I') = rho^2 e^(lambda(2  u + I')) [h(i u) h(i u +i I')]^(-p) product_(j=1)^(2 p) H(i u - i u_j) H(i u - i u_j + i I') \
  ==> & rho^2 e^(lambda(2  u + I')) product_(j=1)^(2 p) [H(i u - i u_j) H(i u - i u_j + i I')] = (-2/(k sn(i u)))^n + (-2 sn(i u))^n r \
  ==> & rho^2 e^(lambda(2  u + I')) product_(j=1)^(2 p) [H(i u - i u_j) H(i u - i u_j + i I')] = (4/k)^p [H(i u) Theta(i u)]^(-2 p) [Theta^(4 p) (i u) + r H^(4 p) (i u)]
$
Let us note the relations using the _Nome_, the _half period $I'$_ and the _modulus_ $k$ and the Jacobian elliptic theta functions,
$
  Theta(u) &= -i q^(1/4) exp(i u pi \/ 2 I) H(u + i I') \
  H(u) &= - q exp(i pi u \/ I) H(u + 2 i I')
$
Using this and @jthetaparam, we can write the functional relation as,
$
   rho^2 e^(lambda(2  u + I')) & product_(j=1)^(2 p) [H(i u - i u_j) H(i u - i u_j + i I')] \
  = & [h(i u) h(i u + i I')]^p [(-2/(k sn(i u)))^n + (-2 sn(i u))^n r] \
  = & (4/k)^p [Theta^(4 p) (i u)+ r H^(4 p) (i u)]
$<kless1eq>
The zeros of $H$ and $Theta$ are exclusive. Thus, if $u$ is a zero of the RHS, $H(u) eq.not 0$. Note that the zeros of RHS of @kless1eq are given by,
$
  (k ^2 sn^2(i u))^(2 p) + r = 0
$<zeroskl1>
This expression is a doubly periodic function of $i u$ with periods $2 I$ and $2 i I'$. The function has a pole of order $4 p$ where $Theta(u) = 0$. Thus, from @liou2 we know the function has $4 p$ zeros in the period rectangle. We now need to locate these zeros. We can use the amplitude function in @ampfunc to relate the angles to this solution.

Set,
$
  u = -1/2 I' - i phia
$<shiftzero>
Then using @shiftzero and @zeroskl1, we can write the zeros of the RHS of @kless1eq as,
$
  exp(i 4 p am(phia)) + r = 0
$
Let us define, 
$
  am(phia) = theta_j - pi/2, quad quad j = 1,..., 2 p
$<ampeigroots>
where $theta_j$ is defined similarly for $k=1$ as in @eigroots. Thus $theta_j$ is defined as,
$
  theta_j = cases(pi(j - 1\/2)/(2 p) & quad quad j = {1,...,2 p} quad "if " r = + 1, (pi j )/(2 p) & quad quad j = {1,..., 2 p} quad "if " r = -1 ) 
$
The amplitude function $am(phia)$ increases monotonically from $-pi/2 --> pi/2$ as $phia$ goes from $-I --> I$. Since $0< theta_j <= pi$, @ampeigroots takes unique values for $j = 1,...,2 p$. Thus, if $j_1 eq.not j_2$, they correspond to different roots of the eigenvalue $Lambda(u)$. 

Note that $r^2 = 1$, which implies that if $u$ is a solution to @zeroskl1, then so is $u + i I'$. Thus, @zeroskl1 has $4 p$ solutions in the period rectangle. The solutions are given by,
$
  u_j = mp 1/2 I' - i phia_j, quad j = 1,..., 2 p
$
These are unique zeros in one period rectangle. Thus, the zeros of @kless1eq are given in pairs $u_j$ and $u_j - I'$. In general the solution to @kless1eq can be written as,
$
  u_j = 1/2 gamma_j I' - i phia_j, quad j = 1,..., 2 p
$<lol2>
where $gamma_j$ takes the values $pm 1$.

#figure(
  image("assets/uzeros.png", width:40%),
  caption :[
    The zeros of the eigenvalue $Lambda(u)$ in the period rectangle. The zeros are given by $u_j = 1/2 gamma_j I' - i phia_j$ where $gamma_j$ takes the values $pm 1$ and $phia_j$ is defined in @eigroots. The blue crosses are for the case of $r = -1$ and the red dots are for the case of $r = +1$. The zeros are given in pairs $u_j$ and $u_j - i I'$.
  ]
)


@liou3 poses constraints on the signs of $gamma_j$. Note that the poles of @lol1 are given at $u_j = 0$ for the $H(i u)$ in the denominator and $u_j = i I'$ for the $Theta(i u)$ in the denominator. The constraints are given by,
$
   sum_(j=1)^(2p) v_j &= (1/i)[sum_(j=1)^(2p) u_j + (1/2(1-r) + 2l)I + 2i l' I'] \
    &= (p + 2l') I' + i[1/2(1-r)+ 2l]I
$
where $r$ takes the values $pm 1$ and $l, l'$ are any integers. For $r=1$, each root $phia$ occurs in pairs $(phia, -phia)$. When $r=-1$, all roots occur in pairs $(-phia, -phia)$ other than $r_0 = 0$ and $r_(2p) = I$. This exact statement was shown when we calculated the constraint relations for the Ising model at the critical point. Thus plugging in @lol2, we obtain,

$
  sum_(j=1)^(2p) gamma_j &= 2p - 4 times "integer"
$
Thus $r$ and all but one $gamma_j$ can be chosen independently, giving us $2^(2p)$ eigenvalues. The value of $lambda$ in @lambtheta can be determined from the functional relation @invrelellip and the constraint in 
@liou3,
$
  lambda =  pi [p + 2l'] \/ 2 I' = - pi [sum_(j=1)^(2p) gamma_j] \/ 4 I'
$
Then the eigenvalue $Lambda(u)$ is given by
$
  Lambda(u) = rho [h(i u)]^(-p) product_(j =1)^(2 p ) exp(- pi gamma_j u \/ 4 I) H(i u - phia_j + 1/2 i gamma_j I')
$

Squaring, we obtain,
$
  Lambda^2(u) = rho^2  product_(j =1)^(2 p ) exp(- pi gamma_j u \/ 2 I) (H^2(i u - phia_j + 1/2 i gamma_j I'))/(H(i u) Theta(i u))
$

 and using relations between $H(u + i I')$ and $Theta(u)$,
$
  & i q^( - 1/4) Theta(i u - phia_j - 1/2 i gamma_j I')/H(i u - phia_j + 1/2 i gamma_j I') = exp(- pi u gamma_j \/ 2I') 
$
we obtain,
$
  Lambda^2(u) = rho' product_(j =1)^(2 p ) (H(i u - phia_j + 1/2 i gamma_j I') Theta(i u - phia_j + 1/2 i gamma_j I') )/(H(i u ) Theta(i u))
$
Again using the relations between $H(u + i I')$ and $Theta(u)$, we can write the eigenvalue as,
$
  Lambda^2(u) = D product_(j = 1)^(2 p) k^(1/2) sn(i u - phia_j +1/2 i gamma_j I')
$<lambdform>
where the gamma independent function $D$ of $u$ is given by,
$
  D = rho' product_(j = 1)^(2 p) (Theta(i u - phia_j - 1/2 i I')Theta(i u - phia_j + 1/2 i I'))/(H(i u) Theta(i u))
$
Note that there are poles in $D(u)$ of order $2 p$ at $u = 0$ and $u = I'$ and $4 p $ zeros at $u = phia_j pm 1/2 i I'$. If we can come up with some function $g(u)$ that is easily evaluated and has the same poles and zeros as $D(u)$, the ration of $D(u)$ and $g(u)$ is an entire doubly periodic function of $u$. Thus, by Liouville's theorem @liou1, the ratio is a constant. 

One such function $g(u)$ is 
$
  ((k sn^2(i u))^(2 p)  + r)/(k^(1/2) sn(i u ))^(2 p)
$
Then we can write $D$ as,
$
  D = xi ((k sn^2(i u))^(2 p) + r)/(k^(1/2) sn(i u ))^(2 p)
$<dconstform>
where $xi$ is a constant. Using @elliphalfperiod, @dconstform and @lambdform and $r^2 = 1$, we obtain,
$
  Lambda^2(u) &= xi [((k sn^2(i u))^(2 p) + r)/(k^(1/2) sn(i u ))^(2 p)] product_(j = 1)^(2 p) k^(1/2) sn(i u - phia_j +1/2 i gamma_j I') \ 
  Lambda^2(u + i I') &= xi [((k sn^2(i u))^(- 2 p) + r)/(k^(1/2) sn(i u ))^(- 2 p)] product_(j = 1)^(2 p) k^( - 1/2) (sn(i u - phia_j +1/2 i gamma_j I'))^(-1) \
$
Then, we obtain,
$
  Lambda^(u) Lambda^2(u + I') = xi^2 [2 + r [((k sn^2(i u))^(2 p)  + (k sn^2(i u))^(- 2 p))]]
$
Squaring the functional relation @invrelellip, we obtain,
$
  Lambda^2(u) Lambda^2(u + I') &= (4/k)^(2p) r [2 + r [((k sn^2(i u))^(2 p)  + (k sn^2(i u))^(- 2 p))]]
$
Comparing the above two relations, we obtain $xi$ to be,
$
  xi &= (4/k)^p r^(1/2)
$
Finally, we can write the eigenvalue as,
$
  Lambda(u) = zeta [(2/(k sn(i u))^(2 p )) + r(2 sn(i u))^(2 p)] times product_(j = 1)^(2 p) k^(1/2) sn(i u - phia_j +1/2 i gamma_j I') \
$<eigenvalueelliptic>
where 
$
  zeta = cases(1 quad &"if" r = +1, -i quad &"if" r = -1)
$

After this whole ordeal we have obtained the eigenvalue of the transfer matrix $VV$ in terms of elliptic functions. In the next section, we revert to using $L,K$ instead of the parameter $u$. 

#result([Eigenvalues for  $T < T_c$])[
  The eigenvalues of the transfer matrix $VV$ for $T < T_c$ can be expressed in terms of elliptic functions. The eigenvalue is given by,
  #nonum($
  Lambda(u) = zeta [(2/(k sn(i u))^(2 p )) + r(2 sn(i u))^(2 p)] times product_(j = 1)^(2 p) k^(1/2) sn(i u - phia_j +1/2 i gamma_j I')
  $)
  where
  #nonum($ zeta = cases(1 quad &"if" r = +1, -i quad &"if" r = -1) $,)
   $r$ takes the values $pm 1$ and $gamma_j$ also takes the values $pm 1$. $phia_j$ is given by,
  #nonum($
    am(phia_j) = theta_j - pi/2, quad quad j = 1,..., 2 p
  $)
  where $theta_j$ is defined as,
  #nonum($
    theta_j = cases(pi(j - 1\/2)/(2 p) & quad quad j = {1,...,2 p} quad "if " r = + 1, (pi j )/(2 p) & quad quad j = {1,..., 2 p} quad "if " r = -1 )
  $)
  and $r=+1$, $gamma_j$ can only assume values subject to the constraint,
  #nonum($
    sum_(j=1)^(2p) gamma_j = 2p - 4 times "integer"
  $) 

   $k^(-1) = sinh(2K) sinh(2L)$ is the modulus of the elliptic functions, $sn(i u)$ is the elliptic sine function, and $phia_j$ are the zeros of the eigenvalue.
]
Our task of finding the eigenvalues at a more general setting is done. However, $k$ is only restricted to values less than unity. We shall analytically continue the form of the eigenvalue to the more general case, after removing the parameterizations on elliptic functions in the next section.


// Spellcheck done




