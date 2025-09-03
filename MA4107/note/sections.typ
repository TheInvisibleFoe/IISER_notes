#import "imports.typ":*
#let mse = "MSE"
#let vr = "Var"
#let neq = $eq.not$
= Data and Models
#let dt = $attach(limits(X),b: ~ )$
#definition("Data")[
  Let $G$ generate a vector in $RR^n$ according to some model.
  $
     G : Omega --> RR^n
  $
  Then $dt$ is called a realization of the data $G(omega)$ for some $omega in Omega$

] $dt$ comes from some distribution or model $F$. This course is all about
parametric models. #definition("Parametric Model")[ Let $F$ be some parameter
model. Then $ F in frak(F) = {F_theta : theta in Theta subset RR^k "for some" k
in NN} $ $Theta$ is called the parameter space. ] We define $g$ to be the map
that maps a set of parameters to a model. $g$ is onto. For every $F_theta$,
there always exists $theta$, such that $ theta limits(mapsto)_g F_theta $ $g$ also needs to be injective, otherwise we run into the problem of identifiability. The problem of identifiability arises when we cannot infer the parameters from the model $F_theta$.

Unlees explicitly mentioned otherwise, the data is represented by $dt$.
For all models in this course, we assume the following,
+ The parametrization is bijective.
+ The models $F_theta in frak(F)$ are all either discrete or continuous, not a mixture of both.

= Statistic

#definition("Statistic")[
  Let the data be $dt in RR^n$. A statistic $T = T(X)$ is a measureable function of data and data only.
]

#definition("Ancillary Statistic")[
  Suppose the distribution of the test statistic $T(X)$, $frak(T)$ is independent of the parameter vector $theta$. Then $T(X)$ is called an Ancillary Statistic.
]
#theorem[

  Let $f(x)$ be a pdf. Let $mu$ and $sigma>0$ be any constants. Then
  $
    g(x|mu,sigma) = 1/sigma f((x-mu)/sigma)
  $
  is a valid pdf.

]
The proof is in Casella and burger theorem 3.5.1. One just needs to show non-negativity and normalization.
#definition("Location Family of distributions")[

  Let a family of distributions be,
  $
    frak(F) = {f_theta: theta in Theta "where" f_theta (x) = g(x-theta) "for some known function" g
      "on" RR^n}
  $
Then $frak(F)$ is a location family of distrbutions with the standard pdf $f(x)$ and the location parameter $theta$ for the family.
]
Generally we will talk about these families on $RR$ rather than $RR^n$.

#definition("Scale family of distributions")[

  Let a family of distributions be,
  $
    frak(F) = {f_theta: theta in Theta "where" f_theta (x) = 1/theta g(x/theta) "for some known function" g
      "on" RR^n}
  $
Then $frak(F)$ is a scale family of distrbutions with the standard pdf $f(x)$ and the scale parameter $theta$ for the family.

]

#definition("Location-Scale family of distribution")[

  Let a family of distributions be,
  $
    frak(F) = {f_(mu,sigma):(mu, sigma) in RR times RR^+ "where" &f_(mu,sigma) (x) = 1/sigma g((x-mu)/sigma) \ & "for some known function" g
      "on" RR^n}
  $
Then $frak(F)$ is a location family of distrbutions with the standard pdf $f(x)$ and the location parameter $mu$ and scale parameter $sigma$ for the family.
]

Now comes to the choice of test statistics. Note that ancillary statistics are not useful in inferring parameters from data. So we shall not use them. The test statistic just compresses the data, from $dt$ to $T(dt)$. We want to see when this data compression is lossless.

We can define the level sets of the test statistic $T(X)$. Let $D$ be the set on which the data can lie in. Let us define the relation,
$
  x scripts(~)_T y "if and only if" T(x) = T(y)
$
We can easily see that this is an equivalence relation. Then $D$ can be partitioned into sets $D_t$ s.t.,
$
  D_t = {X in D: T(X) = t}
$
These sets $D_t$ are called level sets of the test Statistic $T$. If we are in some level set of the test statistic, the inferred parameters should not change if we stay in the same level set.

#definition("Sufficient Statistic")[

  The test statistic $T = T(dt)$ is said to be sufficient iff the distribution of $(dt|T=t)$ is free of $theta$ for all values of $t$.
]

#theorem("Fisher Neyman Factorization theorem")[

  Suppose $dt$ is an iid sample from $f_theta (dot.c)$, which might be either a pmf or a pdf. A statistic $T=T(X)$ is sufficient for $theta$ if and only if,
  $
    f_theta (dt) = g(T(dt), theta)h(x)
  $
  where $theta in Theta subset RR^k$, and the functions $g(dot)$ and $h(dot)$ are non negative functions and $h(dot)$ is independent of $theta$.
]<fnft>
In principle we can get multiple sufficient statistics, with finer and finer partitions of $D$. We try to find the statistic which is sufficient and has the coarsest partitions in $D$.

#definition("Minimal Sufficient Statistic")[

  A statistic $T$ is said to be minimal sufficient for $theta$ iff it is sufficient for $theta$ and for any other sufficient statistic $S$ $exists$ a function $g$ such that,
  $
    T = g(S)
  $
]

#lemma[
  If $T_1$ and $T_2$ are minimal sufficient statistics, there exist injective functions $g_1$ and $g_2$ such that,
  $
    T_1 = g_2 (T_2) quad T_2 = g_1 (T_1)
  $
]
INSERT PROOF.

#theorem("Characterization of minimal sufficiency")[

  Let $dt$ be a joint pmf/pdf $f_theta (x)$ and $T=T(dt)$ be a statistic. Suppose the following property holds,
  $
    (f_theta (x))/(f_theta (y)) "is free of" theta "iff" T(x) = T(y) " " forall " " x,y "s.t." f_theta (y) eq.not 0
  $
  Then $T$ is minimal sufficient for $theta$.
]<minchar>

#proof[
  Assume for simplicity that $f_theta (x) > 0 " " forall " " x in RR^n "and " forall " " theta in Theta$. We need to show two things,
  + $T$ is sufficient for $theta$
  + For any other sufficient statistic $S$, $exists$ a function $g$ such that $T = g(S)$.

  1: Sufficiency of $T$:

  Let $frak(T) = {T(y): y in RR^n}$ be the image of $T$. Let ${A_t: t in frak(T)}$ be the level sets of $T$. We can pick an appropriate $y^*$  such that,
  $
    f_theta (x) = f_theta (y^*) (f_theta (x))/(f_theta (y^*))= g(T(x), theta) h(x)
  $
  We choose $y^*$ such that $T(y^*) = T(x)$, i.e. we choose $y^*$ from the level set $A_(T(x))$. Then by Fisher Neyman factorization theorem @fnft, $T$ is sufficient for $theta$.

  2: Minimality of $T$:
 Let $S$ be any other sufficient statistic for $theta$. Then by @fnft,
  $
    f_theta (x) = g_1 (S(x), theta) h_1 (x)
  $
  Note that,
  $
    (f_theta (x))/(f_theta (y)) = (g_1 (S(x), theta) h_1 (x))/(g_1 (S(y), theta) h_1 (y))
  $
  We need to show that there exists a function $g$ such that $T(x) = g(S(x))$. We just need to show the single valuedness of $g$. To show that we just need to show if $S(x) = S(y)$ then $T(x) = T(y)$. Suppose $S(x) = S(y)$, then,
  $
    (f_theta (x))/(f_theta (y)) = (h_1 (x))/(h_1 (y)) "which is free of " theta
  $
  We can use the property in @minchar to conclude that $T(x) = T(y)$. Thus $g$ is single valued and $T$ is minimal sufficient for $theta$.

]
Note a sufficient statistic can also contain garbage information. A sufficient statistic can be paired with an ancillary statistic and the combined statistic would still be sufficient.

#definition("Complete Statistic")[

  Let $T$ be a statistic. Let ${g_theta (T= t): theta in Theta}$ be a family of pdf/pmf of $T$. The statistic $T$ is #text(blue, [complete]) if given any measureable function $h$ the following holds for all $theta in Theta$,
  $
    EE_theta [h(T)] = 0  ==> P_theta (h(T) = 0) = 1
  $
]

Unfortunately we have no easy characterization of complete statistic, like @minchar for minimal sufficiency.

#theorem("Basu's Theorem")[

  A complete sufficient statistic is independent of any ancillary statistic.
]
#proof[
  (Only the discrete case is shown here. The continuous case is similar.)
  Let $T$ be a complete sufficient statistic and $S$ be an ancillary statistic. It is enough to show that,
  $
    P (S = s | T = t) = P (S = s) " " forall " " s,t
  $
  Note that here none of the probabilities depend on $theta$ as $S$ is ancillary and $T$ is sufficient. Let us fix some $s$. Define the function,
  $
    h(t) = P(S=s|T=t) - P(S=s)
  $
  Note that $h(T)$ is a statistic as it does not depend on $theta$.
  $
    EE_theta [h(T)] &= sum_t h(t) P_theta(T=t) \
    &= sum_t [P(S=s|T=t) -P(S=s)]P_theta(T=t)\
    &= sum_t P(S=s,T=t) - P(S=s) sum_t P_theta(T=t)\
    &= P(S=s) - P(S=s) = 0
  $
  Since $T$ is complete, $P(h(T) = 0) = 1$. Thus $h(T) = 0$. This proves the independence of $S$ and $T$.

]
#theorem("Lehmann Scheffe")[

  Let $dt$ have a joint pdf/pmf. If $T$ is a complete sufficient statistic for $theta$, then $T$ is minimal sufficient.
]<lehsch>
#proof[
  This proof will be sketched and not completely written out.

  We will construct a minimal statistic $S$ and then show that $T$ and $S$ are related by one to one functions. This will prove that $T$ is also minimal sufficient.

  Define an equivalence relation on $RR^n$ as follows,
  $
    x scripts(~)_S y "if and only if" (f_theta (x))/(f_theta (y)) "is free of" theta " " forall " " theta in Theta
  $

  Construct partitions of $RR^n$ using the equivalence relation. Define a statistic $S$ such that $S(x) = S(y)$ if and only if $x scripts(~)_S y$.

  #result("Lehman Scheffe sufficiency")[
    The statistic $S$ is minimal sufficient for $theta$.
  ]
  A proof of this is not provided here.

  Since $T$ is sufficient for $theta$, we have $S = g_1(T)$, since $S$ is minimal sufficient. Define,
  $
    g_2(S) = EE [T|S]
  $
  This is indeed a valid statistic. Then define,
  $
    g(T) = T -g_2(S)
  $
  Thus we can write,
  $
    EE_theta [g(T)] = EE_theta [T] - EE_theta [g_2(S)] = EE_theta [T] - EE_theta [EE_theta [T|S]] = 0
  $
  Since $T$ is complete, $P_theta (g(T) = 0) = 1 " " forall " " theta in Theta$. Thus,
  $
    P_theta (T = g_2(S)) = P_theta (T = g_2(g_1(T))) = 1 " " forall " " theta in Theta
  $
  $g_2$ and $g_1$ can be shown to be inverses of each other. Thus $T$ is minimal sufficient for $theta$.
]
The reverse implication does not hold and an example shall be provided below.

= Families of distribution
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

= Optimal Estimation

We now need to quantify the "error of approximation" to select among potential candidates for statistics.

#definition("Mean Squared Error")[

  Let $T$ be a test statistic. Let $theta in Theta$ be a parameter. Then the mean squared error, function of the parameter $theta$, is given by,
  $
    mse_theta (T) = EE_theta [(T- theta)^2]
  $
]

#theorem("Bias Variance Decomposition")[
  The Mean squared error can be decomposed into,
  $
    mse_theta (T) = EE_theta [(T- theta)^2] = [underbrace(EE_theta (T) - theta,"Bias"_theta (T))]^2 + vr_theta (T)
  $
  This is called the Bias-Variance decomposition.
]
#proof[
  This is trivial as,
  $
    EE_theta [(T- theta)^2] = vr_theta (T- theta) + [EE_theta (T)- EE_theta (theta)]^2 = vr_theta (T) + [EE_theta (T)- theta]^2
  $
]

To find an optimal statistic, we need to find one such that the MSE is minimized uniformly in $theta$ over the parameter space $Theta$. Unfortunately this is not possible due to one simple fact. Just fix some $theta_a in Theta$. Then define the statistic to be $T = theta_a$. This is a valid statistic. Any statistic chosen will be worse than this in some neighbourhood of $theta_a$.(Is MSE a continuous function of $theta$ ?)

We have some possible alternatives to error quantifiers, and look for one dimensional summaries of the curve $theta mapsto mse_theta$

We can have the
+ Bayes Approach : $ R_1 (T) = integral_Theta mse_theta (T) omega(theta) dd(theta) $ $omega(theta)$ is called the prior.
+ Minimax Approach: $ R_2 (T) =  sup_(theta in Theta) mse_theta (T) $ This quantifies the worst possible scenario.

We will be heading in a different direction and only consider the case of parameters with $"Bias"_theta (T) = 0 " " forall " " theta in Theta$.

#definition("Unbiased Estimator")[
  The statistic $T$ is said to unbiased for $theta$ if
  $
    EE_theta [T] = theta " " forall " " theta in Theta
  $
]

Our aim is to find $T^*$ among the class of unbiased estimators such that the mean squared error is minimized, which means the following property holds,
$

  underbrace(mse_theta (T^*), vr_theta (T^*)) <= underbrace(mse_theta (T), vr_theta (T)) " " forall " " theta in Theta, forall " " T " unbiased for " theta
$
If such a $T^*$ exists, it is called the Uniform Minimum Variance Unbiased Estimator (UMVUE).

Some comments on unbiased estimators,
+ An unbiased estimator need not exist.
+ For a given class of estimators, the MSE error need not be the lowest for an unbiased estimator.

Unbiased estimators might not very good for certain purposes. In general this approach is taken so that the MSE can be minimized over all values of $theta$ in $Theta$, provided we restrict ourselves to unbiased estimators.

#theorem("Rao-Blackwell theorem")[

  Let $dt$ have a joint pdf/pmf $f_theta (dot)$ with $theta in Theta subset RR^p$. Let $T=T(dt)$ be a sufficient statistic for $theta$. Let $S = S (dt)$ be a statistic such that
  + $EE_theta [S] = theta " " forall " " theta in Theta$
  + $vr_theta (S) < oo " " forall " " theta in Theta$

  Define the new statistic,
  $
    S^* = EE_theta [S | T]
  $
  This is called the Rao-Blackwellization of $S$ with respect to $T$.

  Then the following holds,
  + $S^*$ is unbiased for $theta$
  + $vr_theta (S^*) <= vr_theta (S) " " forall " " theta in Theta$
  with equality if and only if $P_theta (S^* = S) = 1 " " forall " " theta in Theta$.
]<raoblack>
#proof[
  Note that $S^*$ is a statistic as it is a conditional expectation on the sufficient statistic $T$. To show unbiasedness,
  $    EE_theta [S^*] = EE_theta [EE_theta [S | T]] = EE_theta [S] = theta $
  using the law of total expectation.

  To show the variance reduction, we use a formula for the conditional variance.

  Let $X,Y$ be random variables, with $EE[Y^2] < oo$. Then,
  $
  vr(Y) = EE[vr(Y|X)] + vr(EE[Y|X]) >= vr(EE[Y|X])
  $
  Since $vr(Y|X) >= 0$. (WILL WRITE EQUALITY PROOF LATER)
]

The above theorem leaves us with two questions,
- What unbiased estimator $S$ should we start with to minimize MSE ?
- What sufficient statistic $T$ should we use to minimize MSE ?

#theorem("Minimal Statistic for unbiased estimation")[

Let $S$ be an unbiased estimator for $theta$ and let $T_1$ and $T_2$ be two sufficient statistics for $theta$. Define the Rao-Blackwellizations,
$  S_1 &= EE_theta [S | T_1] \
  S_2 &= EE_theta [S | T_2]
$
If $T_1 = h(T_2)$, for some function $h$, then
$  vr_theta (S_1) <= vr_theta (S_2) " " forall " " theta in Theta
$
Thus if a minimal sufficient statistic $T$ exists, the Rao-Blackwellization with respect to $T$ is the best among all Rao-Blackwellizations with respect to any other sufficient statistic.
]
#proof[
  To show this we use the tower property of conditional expectation. If $Y= f(X)$, then
  $
    EE (Z|Y) = EE(EE(Z|X)|Y)
  $

  Since $T_1 = h(T_2)$,
  $
    S_1^* &= EE(S|T_1)\
    &= EE(EE(S|T_2)|T_1) \
    &= EE(S_2^*|T_1)
    $
  Using @raoblack,
  $    vr_theta (S_1^*) = vr_theta (EE(S_2^*|T_1)) <= vr_theta (S_2^*) " " forall " " theta in Theta
  $
]
#theorem("Choice of Unbiased estimator")[
 Assume that $T$ is complete sufficient for $theta$. Let $S_1$ and $S_2$ be two unbiased estimators for $theta$. Define the Rao-Blackwellizations,
  $  S_1^* &= EE_theta [S_1 | T] \
    S_2^* &= EE_theta [S_2 | T]
  $

  Then $
         P_theta (S_1^* = S_2^*) = 1 " " forall " " theta in Theta
       $
]
#proof[
  Note that both $S_1^*$ and $S_2^*$ are unbiased for $theta$. Thus
  $
    EE_theta [S_1^* - S_2^*] = 0 " " forall " " theta in Theta
  $
  We have acheived first order ancillarity. $S_1^*$ and $S_2^*$ are functions of the complete sufficient statistic $T$. Thus using the definition of completeness,
  $
    P_theta (S_1^* - S_2^* = 0) = 1 " " forall " " theta in Theta
  $
]
This theorem shows that the choice of unbiased estimator does not matter if we have a complete sufficient statistic. The Rao-Blackwellization will always be the same.

#theorem("Lehmann-Scheffe for UMVUE")[
  Let $T$ be a complete sufficient statistic for $theta$. Let $S$ be any unbiased estimator for $theta$, such that $vr_theta (S) < oo " " forall " " theta in Theta$. Then the Rao-Blackwellization,
  $    S^* = EE_theta [S | T]
  $
  Then,
  + $vr_theta (S^*) <= vr_theta (U) " " forall " " theta in Theta, forall " " U " unbiased for " theta$
  + If for some unbiased estimator $U$, $vr_theta (S^*) = vr_theta (U) " " forall " " theta in Theta$, then
    $
      P_theta (U = S^*) = 1 " " forall " " theta in Theta
    $
  Thus $S^*$ is the unique UMVUE for $theta$.
]
This theorem is the culmination of the previous theorems in this section. If a complete sufficient statistic exists, we can find the UMVUE for $theta$ by Rao-Blackwellizing any unbiased estimator with respect to the complete sufficient statistic.

#remark[
1. If a complete sufficient statistic $T$ exists, the UMVUE is a function of $T$.
2. If the UMVUE exists, it is unique.
3. This theorem can be used to check whether unbiased estimators exist or not. If we can find a complete sufficient statistic $T$ and show that no function of $T$ is unbiased for $theta$, then no unbiased estimator for $theta$ exists. This means that the UMVUE exists iff an unbiased estimator exists.
]

In general, we have two approaches to find the UMVUE for $theta$. First find a complete sufficient statistic $T$ for $theta$.
+ Find some unbiased estimator $S$ for $theta$ and Rao-Blackwellize it with respect to $T$.
+ Find a function of $T$ which is unbiased for $theta$. We also need check that the function has finite variance.
