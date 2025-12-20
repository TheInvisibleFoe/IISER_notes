
#import "imports.typ": *

= Solution to the Eigenvalues at $T = T_c$

<Tcsection>
As shown by Kramers and Wannier @Kramers1941, and will be shown later after the complete solution of the 2D Ising Model that the critical temperature of the model corresponds to $k=1$ in @commcondk. This allows us to write $sinh(2K)$ and $sinh(2L)$ in terms of simple trigonometric functions.

We choose the parameterization,
$
  sinh(2K) &= tan(u)\
  sinh(2L) &= cot(u)
$<uparam>
Note that $sinh(2K)$ and $sinh(2L)$ are both positive for $K, L > 0$. This means that $u$ can take values in the range $[0, pi/2)$. 

Note that this is the only simple trigonometric parameterization that is possible. $sinh(2K)$ and $sinh(2L)$ can take any value in the set $[0,oo)$. So $sin(u)$, $cos(u)$ and corresponding $csc(u)$ and $sec(u)$ are not possible. Now our functional equation for the eigenvalues can be rewritten in the variable $u$. Note that if we take $K --> L + i pi/2$ and $L --> -K$. This allows us to write,
$
  & sinh(2L + i pi) = tan(u') quad quad quad & sinh(-2K) = cot(u')\
  =>& -sinh(2L) = tan(u') quad quad quad ==>& -sinh(2K) = cot(u')
$
As a result, we can define
$ u' = u + pi / 2 $<eq7_6>
Using @inversereleig, @uparam and @eq7_6, we obtain,
$
  Lambda(u) Lambda(u + pi/2) &= (2i sinh(2L))^n + (- 2i sinh(2K))^n r\
&= (2i cot(u))^n + (- 2i tan(u))^n r\
$<invrelu>
As a result of @uparam, we can write $exp(plus.minus 2 K)$ and $exp(plus.minus 2 L)$ as single valued functions of $u$. This along with @vform2 allows us to write the eigenvalues in terms of $u$ and infer their forms. The parameterizations are given by,
$
  exp(2K) &= (1+sin(u))/cos(u)\
  exp(-2K) &= (1-sin(u))/cos(u)\
  exp(2L) &= (1+cos(u))/sin(u)\
  exp(-2L) &= (1-cos(u))/sin(u)
$<uparamtmatk1>
This parameterization is useful because $exp(2K)$ and $exp(2L)$,
+ Are single valued functions of $u$.
+ Are meromorphic functions whose singularities are poles and they form an isolated set.
+ Are periodic with period $2pi$.

== The form of $Lambda(u)$
Note that we have,
$ 
  &VV(u) vb(x)(k) = Lambda(u) vb(x)(k)\
  ==>& sum_j VV_(i j)(u) vb(x)_j (k) = Lambda(u) vb(x)_i (k)\
  ==>&  Lambda(u) = sum_j VV_(i j)(u) (vb(x)_j (k)) / (vb(x)_i (k))
  
$
The eigenvalue can be written as function of the elements of the transfer matrix whose coefficients are ratios of the eigenvectors. Observe that these coefficients do not depend on the parameter $u$ but only on the parameter $k$. Using @vform2 and @uparam, we obtain this following form of the elements of the transfer matrix,
$
  V_(phi, phi') = t(u)/(sin(u) cos(u))^p
$
where $ 
t(u) = e^(-2 i p u) sum_(alpha=0)^(2 n) c_alpha e^(2 i alpha u) 
$<tuk1>

 To drive this point home that the elements of 
the transfer matrix $VV$ can be written like this, we can continue @uparam into @vform2 and continuing the algebraic monstrosity, we get,
$
  V_(phi, phi') &= ((1+c sin(u))^s' (1+c cos(u))^r')/(sin(u)^r' cos(u)^s')\
  &= ((1+c sin(u))^s' (1+c cos(u))^r' sin(u)^(p-r') cos(u)^(p-s'))/(sin(u) cos(u))^p\
  &= ((1+c (e^(i u) - e^(-i u))/(2 i))^s' (1+c (e^(i u) + e^(-i u))/(2))^r' ((e^(i u) - e^(-i u))/(2 i))^(p-r') ((e^(i u) + e^(-i u))/(2))^(p-s'))/(sin(u) cos(u))^p\
  &= [((e^(-i u) + c((e^(2i u) -1)/(2 i)))^s' (e^(-i u) + c((e^(2i u) + 1)/2))^r' (e^(-i u) + c((e^(2i u) -1)/(2 i)))^(p-r') ((e^(-i u) + c(e^(2i u) + 1)/2))^(p-s'))/( e^(2 i u ) sin(u) cos(u))^p]\
  &= t(u)/(sin(u) cos(u))^p
$<vvrel>

We know that the eigenvalues of this matrix can be written as a linear combination of the matrix elements of 
the transfer matrix. We explore some symmetry properties of the transfer matrix to obtain a form of the eigenvalue form
which we obtain the solution to the eigenvalues at $T = T_c$. Before we do that note that for a fixed the linear combinations of the matrix elements form the eigenvalue which do not depend on the parameter $u$. 
Mapping $u --> u + pi$, is the same as mapping $K --> -K plus.minus (i pi)/2$ and $L --> -L plus.minus (i pi)/2$. Using this mapping, @negKL and @negklmat, we can write,
$
  V(K,L) R xx(k) = v(u + pi) xx(k)
$
Using this we can write the eigenvalue as,
$
  Lambda(u + pi) = r Lambda(u) 
$<periodicitycond>

Since the coefficients are constant for a fixed $k$, the eigenvalue $Lambda(u)$ is linear combination of the matrix elements of the transfer matrix with constant coefficients. This means that the eigenvalue is a periodic function of $u$ with the periodicity condition @periodicitycond. 

Using this periodicity condition it is obvious that when $r=1$ only the even coefficients in @tuk1 can have non-zero coefficients, to satisfy @periodicitycond. When the parameter $r = -1$, only the odd coefficients in @tuk1 can have non-zero coefficients, to satisfy @periodicitycond. We can factor $t(u)$ in @tuk1 to be in terms of the sine functions with appropriate roots. One can simply convince themselves by considering a product of two sine functions and using some simple algebraic manipulations we obtain $t(u)$ for the case of even coefficients,
$
  & sin(u- u_1) sin(u - u_2) \ 
  =& [exp(i (u - u_1)) - exp(-i(u - u_1))] [exp(i (u - u_2)) - exp(-i(u - u_2))]  (4 i^2)^(-1) \
  =& exp(- 2 i u) [d_01 + d_11 exp(2 i u) ][d_02 + d_12 exp(2 i u)] (4 i^2)^(-1) \
  =& exp(-2 i u) [c_0 + c_2 exp(2 i u) + c_4 exp(4 i u)]
$
The logic follows similarly for odd coefficients as well. As a result of the above symmetry relations, we can write the eigenvalue in terms of undetermined zeros
of this function,
$
  Lambda(u) = rho (sin(u) cos(u))^(-p) product_(j=1)^l sin(u - u_j)
$<eigformTc>
where $rho$ is a constant and $u_j$ are the zeros of the function(which we will determine now). The indexing set's maximum index 
$l$ is given as,
#nonum($
  l &= 2p quad quad &"if" quad r = plus 1 \
  l &= 2p - 1 quad quad &"if" quad r = minus 1
$) 
We now get to work on the zeros of this functional form. We can get the zeros of $Lambda(u)$ using the 
functional equation @invrelu.

== The zeros of $Lambda(u)$
Plugging @eigformTc into @invrelu, we obtain,

$
  & Lambda(u) Lambda(u + pi/2) = (2i sinh(2L))^n + (- 2i sinh(2K))^n r\
  ==>& (-1)^p rho^2 (sin(u) cos(u))^(-2p) product_(j=1)^l sin(u - u_j) cos(u  - u_j)= (2i cot(u))^n + (- 2i tan(u))^n r\
  ==>& rho^2 product_(j=1)^l sin(u - u_j) cos(u  - u_j) = (-1)^p (2 i)^(2p)[cos^(4p)(u) + r sin^(4p)(u)]\
  ==>& rho^2 product_(j=1)^l sin(u - u_j) cos(u  - u_j) = 2^(2p)[cos^(4p)(u) + r sin^(4p)(u)]\
$<invrelroots>
This must be an identity in $u$. The left-hand side must have the same zeros as the right-hand side, which are
$u_j$. 


#theorem("Zeros of the eigenvalue at critical temperature")[\
The zeros of the eigenvalue $Lambda(u)$ at critical temperature $k=1$ are given by,
#nonum($
  u_j = minus.plus pi/4 - i phi_j, quad j={1,...,l}
$)
where #nonum($ phi_j = 1/2 ln[tan(theta_j/2)] $) and $theta_j$ are given by,
#nonum($
  theta_j &= ( j - 1/2) pi / (2 p) quad quad j = 1, ..., 2p & "if" quad  r= +1 \
  theta_j &=  (pi j) / (2 p) quad quad quad "       "  j = 1, ..., 2p - 1 & "if" quad r= -1
$)
]
#proof()[
One way to find the zeros of the RHS can be done by variable substitution to make the identity a polynomial. Let the new variable be $ z &= exp(2 i u) \ z_j &= exp(2 i u_j) $<varsub> Note the following two relations, 
#nonum($

sin(u-u_j) &= (exp(i (u -u_j)) - exp(-i(u-u_j)))/(2 i)\ 
& = exp(-i(u- u_j))[(exp(2 i(u - u_j)) - 1) / (2 i)] \
& = sqrt(z_j/z) [(z\/z_j - 1) / (2 i)]
$)

#nonum($
cos(u-u_j) &= (exp(i (u -u_j)) + exp(-i(u-u_j)))/2\
& = exp(-i(u- u_j))[(exp(2 i(u - u_j)) + 1) / 2]\
& = sqrt(z_j/z) [(z\/z_j + 1) / 2]


$)
Substituting this into @invrelroots, we obtain,
$
  & rho^2 product_(j=1)^l (z_j/z) [(z\/z_j - 1) / (2 i)] [(z\/z_j + 1) / 2] = 2^(-2p) (1/z)^(2p)[(z + 1)^(4 p) + r (z - 1)^(4 p)]\
  ==>& rho^2 (-i/4)^l product_(j=1)^l  [(z^2 - z_j^2)/z_j ] = 2^(-2p) z^(l-2p)[(z + 1)^(4 p) + r (z - 1)^(4 p)]\
$
The zeros of the LHS are $z_j^2$. Let us find the zeros of the RHS by substituting $z = z_j$ and using the two cases $r = plus.minus 1$. Consider the first case 
$r=1$ and $l = 2p$,
$
  & z_j^(2p - 2p)[(z_j + 1)^(4 p) + (z_j - 1)^(4 p)] &= 0\
  =>& (z_j + 1)^(4 p) + (z_j - 1)^(4 p) = 0\
$
Note that $z_j eq.not 1$. Thus, we can divide by the second term $(z_j - 1)^(4 p)$,
$
  & ((z+ 1)/(z - 1))^(4 p ) + 1 = 0\
  =>& (z + 1)/(z - 1) = exp((plus.minus i pi (2 j - 1))/(4 p)) quad "where" j ={1, ..., 2p}\
  =>& z = plus.minus i tan(theta_j/2) quad "where" theta_j = ( j - 1/2) pi / (2 p) quad quad j = 1, ..., 2p
$<zsoln>
The roots are then given by,
#nonum(($
  z_j^2 &= - tan^2(theta_j/2) quad "where"\
  theta_j &= ( j - 1/2) pi / (2 p) quad quad j = 1, ..., 2p
  
$))
Similarly, for the case of $r=-1$ and $l = 2p - 1$,
$
  & z_j^(2p - 1 - 2p)[(z_j + 1)^(4 p) + (z_j - 1)^(4 p)] = 0\
  =>& z_j^(-1)[(z_j + 1)^(4 p - 1) + (z_j - 1)^(4 p - 1)] = 0\
$
Note that $z_j$ cannot be zero, because of @varsub. Following similar calculations to @zsoln, we obtain the solution,
#nonum($
  z_j^2 &= - tan^2(theta_j/2) quad "where"\
  theta_j &=  (pi j) / (2 p) quad quad j = 1, ..., 2p - 1
$)
The roots are then given by,
$
  z_j &= - tan(theta_j/2) quad "where"\
  theta_j &= ( j - 1/2) pi / (2 p) quad quad  j = 1, ..., 2p & "if" quad  r= +1 \
  theta_j &=  (pi j) / (2 p) quad quad quad "       "  j = 1, ..., 2p - 1 & "if" quad r= -1
$<eigroots>
Note that the roots $theta_j$ lie in the range $(0, pi)$. Define $phi_1,...,phi_l$,
$ 
  phi_j = 1/2 ln[tan(theta_j/2)] quad quad "where" quad j = {1,...,l}
$<phiatc>
Then inverting the variable substitution @varsub and using @eigroots, we obtain 
$
  u_j = gamma_j pi/4 - i phi_j, quad j={1,...,l}
$<eigrootstc>
where $gamma_j$ takes the values $plus.minus 1$.
]

The number of roots is $2^l$, which is $2^{2p}$ if $r = +1$ and $2^{2p - 1}$ if $r = -1$. However, the total number of roots must be $2^(2p)$, because the transfer matrix $VV WW$ is $2^(2p) times 2^(2p)$. So we are overcounting. Since we obtain $2^(2 p)+2^(2p -1) = 3 times 2^(2p-1)$, which is more than the expected value. The problem lies with the fact that for $r= plus 1$, we have $2^(2p)$ solutions. We will now show that there is a constraint on the roots $u_j$ if $r = +1$. 

Consider the limit $u --> i oo$. The parameterizations of the matrix elements $exp(plus.minus 2K)$ and $exp(plus.minus 2L)$ in @uparamtmatk1 show that in this limit,
$
  lim_(u --> i oo) exp(plus.minus 2 K) &= plus.minus i\
  lim_(u --> i oo) exp(plus.minus 2 L) &= plus.minus i
$
We also know that if we negate $exp(plus.minus 2K)$ and $exp(plus.minus 2L)$, we obtain the same transfer matrix using @negklmat. Thus,
$
  lim_(u --> i oo) Lambda(u) &= lim_(u --> - i oo) Lambda(u) 
$

Let us first consider the case $r= - 1$. In this case, we have $l = 2p - 1$. Let us consider any one of the factors in the product of @eigformTc and evaluate in the above limit and let $t_j = exp(i u_j)$,
$
  lim_( u --> oo) sinh(u - u_j)/sinh(u) = lim_(u --> oo) t_j ( 1 - t_j^(-2) e^(- 2 u))/(1 - e^(-2u)) =t_j
$ 
This evaluates to some constant limit even if the denominator is $cosh(u)$. Thus, each factor in the product goes to some constant limit for each $l = 2p-1$ factors in the product. If the denominator is $sinh(u)$, it goes to a limit with the same sign as $t_j$ for both cases of $u --> oo$ and $u --> - oo$. However, if the denominator is $cosh(u)$, it goes to a limit with the opposite sign as $t_j$ if $u --> - oo$ and same sign of $t_j$ otherwise. These small subtleties do not matter, however they are still noted here. They do not matter here since there is an extra factor of either $sinh(u)^(-1)$ or $cosh(u)^(-1)$ in @eigformTc. Thus, it anyway goes to zero, for either case of the limit being taken to both infinities.

Now we move onto the other case, $r = +1$. In this case, we have $l = 2p$. The same argument as above does not work anymore, and we need to examine further. In a similar vein let us expand the product in @eigformTc and evaluate the limit,
$
  Lambda(i u) &= D product_(j=1)^(2p) (exp(u - u_j) - exp(-(u -  u_j)))/(exp(u) plus.minus exp(- u))\
$
where $D$ is a constant. Note that the denominator is either $sinh(u)$ or $cosh(u)$. Let us now evaluate the limit of the product in @eigformTc as $u --> oo$,
$
  lim_(u --> oo) Lambda(i u) &= lim_(u --> oo) D product_(j=1)^(2p) (exp(u - i u_j) - exp(-(u -  i u_j)))/(exp(u) plus.minus exp(- u))\
  &= D product_(j=1)^(2p) exp(i u_j)
$
Similarly for the limit $u --> -oo$,
$
  lim_(u --> -oo) Lambda(i u) &= lim_(u --> -oo) D product_(j=1)^(2p) (exp(u - i u_j) - exp(-(u -  i u_j)))/(exp(u) plus.minus exp(- u))\
  &= D (-1)^p product_(j=1)^(2p) exp(-i u_j)
$
These two limits must be equal. Thus, we obtain the constraint,
$
  & product_(j=1)^(2p) exp(i u_j) = (-1)^p product_(j=1)^(2p) exp(-i u_j)
  ==> & exp(2 i sum_(j=1)^(2p) u_j) = (-1)^p\
  ==> & exp(2 i sum_(j=1)^(2p) u_j) = exp(i pi (2 n + 1) p )\
  ==> & sum_(j=1)^(2p) u_j = (n + p/2) pi
$
where $n$ is an integer. This is a constraint on the roots $u_j$ if $r = +1$. Thus, all $gamma_j$ cannot be independently chosen
We obtain a constraint on the roots $u_j$ if $r = +1$, which gives us
$
  (u_1 + ... +u_(2p))/pi = "integer" + p/2
$<constrainttc>

In @eigrootstc, we can reframe the constraints in terms of $gamma_j$. Before we do that, note the indexing set $J$ of $u_j$ is $j = 1, ..., 2p$ for this current case. We can divide the indexing set into smaller subsets,
$
  J = {j: j in NN, 1<= j <= p} union {2p -j +1 : j in NN, 1<= j <= p} 
$
Using @eigroots, @eigrootstc, @phiatc and @constrainttc, we can write the roots $u_j$ as,
$
  sum_j u_j = pi/4 sum_(j=1)^p gamma_j - i/2 ln[product_(j=1)^p tan(theta_j/2) tan(theta_(2p - j + 1)/2)]
$
The term in the logarithm goes to zero and as a result of that, the reframed constraint equation in terms of $gamma_j$, is given by,
$
  gamma_1 + ... + gamma_(2p) = 2p - 4 times "integer"
$

It is worth our time to recount and summarize the algebraic jugglery that has unfolded over the last section. Thus, we obtain the eigenvalue and determine the roots after all this calculation.
#result("Eigenvalues at critical temperature")[

$
  Lambda(u) = rho (sin(u) cos(u))^(-p) product_(j=1)^l sin(u + i phi_j + 1/4 gamma_j pi)
$<eigfinalTc>
where $gamma_1,...,gamma_j$ can take the values $plus.minus 1$ and for $r=1$ has an additional constraint,
#nonum($
  gamma_1 + ... + gamma_(2p) = 2p - 4 times "integer"
$)
$rho$ can be obtained by then plugging in @eigfinalTc into @invrelu.
]


The eigenvalue at critical temperature is given by @eigfinalTc. Note that the eigenvalue is a function of $u$ and the roots $u_j$. The roots $u_j$ are determined by the functional equation @invrelu. This is a limiting case of the more general solution given in the next section. This was outlined because the parameterization can be done in terms of elementary functions we are familiar with.

//Spellcheck Done

