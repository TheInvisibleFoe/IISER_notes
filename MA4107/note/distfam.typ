
#import "imports.typ":*

= Exponential Family of Distributions
#definition("Exponential family of distribution")[

  Let $dt$ have a joint pdf/pmf $f_theta (dot)$ with $theta in Theta subset RR^p$. We say that the $f_theta (dot)$ belongs to the $k$-parameter exponential family if $f_theta (dot)$ admits the functional form,
  $
    f_theta (dt) = exp[{sum_(j=1)^k c_j (theta) T_j (dt)} - d(theta)] S(dt)
  $<expform>
  for all $x in frak(X), forall theta in Theta$. $frak(X)$ is the space of all values taken by $dt$.

  Equivalently the last restriction can also be rewritten as that the support of $f$,
  $
    "supp"(f) = {x: f_theta (x) >0}
  $
  is free of $theta$.

  $c_j 's$ are called Natural or canonical parameters

  $T_j 's$ are called Natural or canonical statistics

]<expfamily>
The expression@expform needs to have some restrictions placed on it, otherwise we can do simple algebraic manipulations such that the upper limit in the sum $k$ increases, which causes a pdf $f_theta (dot)$ to belong to multiple parameter exponential families.

The expression is said to be minimal in the sense that the expression cannot be reduced further without breaking the functional form @expform.
+ $c_j (theta)$ must explicitly depend on theta. If some $c_m$ is constant and free of theta, the corresponding $T_m (dt)$ can be absorbed into $S(dt)$.
+ If $i eq.not j$, $c_i eq.not c_j$. This means that no two $c_j$'s can be the same. If $c_i = c_j$ for some $i eq.not j$, we can define a combined statistic $tilde(T) = T_i +T_j$.

Note that $theta in Theta subset RR^p$. To avoid the problem of identifiability, $k >= p$. If $k<p$ we will lose information and not have an injective map. Generally $k=p$ for most cases. Later we will see an explicit example where $k > p$.


#result("Sufficiency of Canonical statistic")[
  The statistic $T = (T_1,...,T_2)$,where $T_j " " forall " " j in {1,...,k}$ are the canonical statistics defined in @expfamily, is sufficient for $theta$.
]
#proof[
  The proof of this is obvious. Using @fnft and @expform, we can see that
  $

    f_theta (dt) &= exp[{sum_(j=1)^k c_j (theta) T_j (dt)} - d(theta)] S(dt)\
    &= g(T(dt), theta) h(dt)
  $
  Note that the pdf $f_theta (x)$ and the function $g(T(dt),theta)$ are non-negative. So $h(dt) = S(dt)$ must also be non negative. Thus using @fnft, $T = (T_1,...,T_k)$ is a sufficient statistic for $theta$.
]

#theorem("Completeness of Canonical Statistics for the Exponential family")[

  Consider a $k$-parameter exponential family. Define the natural parameter space to be ,
  $
    C := {(c_1 (theta), ..., c_k (theta)): theta in Theta}
  $
  where $Theta$ is the parameter space. If $C$ contains an open set in $RR^k$, then the statistic $T(dt)$ is complete. Hence $T$ is also minimal sufficient.
]
TRY TO SHOW.

We cannot drop the open set restriction on the parameter space due to the following counter example. Moreover this counter example also serves as an example for the $k>p$ case outlined above. The canonical statistic vector here is also minimal sufficient but not complete.

#example("Curved Normal distribution")[

  Let $dt = (X_1,...,X_n) ~^(i i d) cal(N) (theta, theta^2), theta >0$. The pdf is then given by,
  $
    f_theta (dt) = (e^(-n/2))/(2 pi)^(n/2) exp[-1/(2 theta^2) sum_(i=1)^n x_i^2 + 1/theta sum_(i=1)^n x_i -n ln(theta) ]
  $
  The canonical parameters and canonical statistics are given by,
  $
    &c_1 (theta) = -1/(2 theta^2) quad &T_1 (dt) = sum_(i=1)^n x_i^2 \
    &c_2 (theta) = 1/theta quad &T_2 (dt) = sum_(i=1)^n x_i
  $
  The natural parameter space is then defined as,
  $
    C = {(-1/(2 theta^2), 1/theta): theta>0}
  $
  This forms a graph in $RR^2$ and thus this does not contain an open set in $RR^2$. We will now show that $ T(dt) = (T_1 (dt), T_2 (dt)) = (sum_(i=1)^n x_i^2, sum_(i=1)^n x_i) $ is not complete. To do this we explicitly construct a function,
  $
    h(T) = h(t_1,t_2) = (t_2^2)/(n+n^2)- t_1/(2n)
  $
  Note that in general $h(T) eq.not 0$.  Then we get ,
  $
    EE_theta (h(T)) &= 1/(n^2 + n) EE_theta ((sum_(i=1)^n x_i)^2) - 1/(2 n) EE_theta (sum_(i=1)^n x_i^2)\
    &=  [1/(n^2 +n ) - 1/(2n)] EE_theta (sum_(i=1)^n x_i^2) + 1/(n^2 +n) EE_theta (sum_(i,j;i eq.not j) x_i x_j )\
    &= theta^2 [(1-n)/(1+n)] + (n(n-1))/(n^2+n) theta^2 = 0
  $
  Thus $T$ is not complete. Also we can very easily show using the functional form of the curved normal distribution, that $T$ satisfies @minchar. Thus $T$ is a minimal statistic. This serves as an example why the reverse implication in @lehsch does not hold.

  This also serves as an example where $k>p$. The dimension of the parameter space $p =1$ and this belongs to a $k=2$ parameter exponential family.
]
